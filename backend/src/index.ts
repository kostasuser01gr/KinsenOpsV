import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { sign, verify } from 'hono/jwt';
import { v4 as uuidv4 } from 'uuid';

export type Env = {
	kinsen_ops_db: D1Database;
	JWT_SECRET: string;
};

type JwtPayload = {
	id: string;
	role: string;
	exp: number;
};

const app = new Hono<{ Bindings: Env }>();

// Enable CORS for Flutter web frontend
app.use('*', cors());

// --- Authentication Middleware ---
const authMiddleware = async (c: any, next: any) => {
	const authHeader = c.req.header('Authorization');
	if (!authHeader || !authHeader.startsWith('Bearer ')) {
		return c.json({ error: 'Unauthorized: Missing or invalid token' }, 401);
	}

	const token = authHeader.split(' ')[1];
	try {
		const payload = await verify(token, c.env.JWT_SECRET) as JwtPayload;
		c.set('user', payload);
		await next();
	} catch (e) {
		return c.json({ error: 'Unauthorized: Token verification failed' }, 401);
	}
};

const requireRole = (roles: string[]) => {
	return async (c: any, next: any) => {
		const user = c.get('user') as JwtPayload;
		if (!roles.includes(user.role)) {
			return c.json({ error: 'Forbidden: Insufficient permissions' }, 403);
		}
		await next();
	};
};

// --- Auth Routes ---
app.post('/api/auth/login', async (c) => {
	const { username, password } = await c.req.json();
	// Simplified mock login logic.
	// In production, we compare `password` against the hashed value in DB.
	const user: any = await c.env.kinsen_ops_db.prepare('SELECT * FROM users WHERE name = ? OR id = ?').bind(username, username).first();

	if (!user || user.password_hash !== password) {
		return c.json({ error: 'Invalid credentials' }, 401);
	}

	const payload = {
		id: user.id,
		name: user.name,
		role: user.role,
		exp: Math.floor(Date.now() / 1000) + 60 * 60 * 24, // 24 hours
	};

	const token = await sign(payload, c.env.JWT_SECRET);

	return c.json({
		token,
		user: {
			id: user.id,
			name: user.name,
			role: user.role,
		}
	});
});

// --- Public / Kiosk Routes ---
// The kiosk creates wash tasks. We do not strictly require JWT here if it's an internal trusted PWA, 
// but in a real scenario we'd issue a special 'kiosk' token. For now, it remains open.

// --- Protected Routes ---
app.use('/api/fleet/*', authMiddleware);
app.use('/api/shifts/*', authMiddleware);
app.use('/api/intelligence/*', authMiddleware);
// Note: We leave GET /api/washers/tasks slightly more open or apply middleware selectively based on needs.

app.get('/api/health', (c) => {
	return c.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// --- Fleet Routes ---

app.get('/api/fleet', async (c) => {
	try {
		const { results } = await c.env.kinsen_ops_db.prepare('SELECT * FROM vehicles').all();
		return c.json(results);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

app.put('/api/fleet/:id/status', async (c) => {
	const id = c.req.param('id');
	const { status } = await c.req.json();
	
	try {
		await c.env.kinsen_ops_db.prepare(
			'UPDATE vehicles SET status = ?, lastStatusUpdate = CURRENT_TIMESTAMP WHERE id = ?'
		).bind(status, id).run();
		
		const vehicle = await c.env.kinsen_ops_db.prepare('SELECT * FROM vehicles WHERE id = ?').bind(id).first();
		return c.json(vehicle);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

// --- Washers Routes ---

app.get('/api/washers/tasks', async (c) => {
	try {
		const { results } = await c.env.kinsen_ops_db.prepare('SELECT * FROM wash_tasks').all();
		return c.json(results);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

app.post('/api/washers/tasks', async (c) => {
	const body = await c.req.json();
	const id = uuidv4();
	const createdAt = new Date().toISOString();
	
	try {
		await c.env.kinsen_ops_db.prepare(
			'INSERT INTO wash_tasks (id, vehicleId, washerId, preset, createdAt) VALUES (?, ?, ?, ?, ?)'
		).bind(id, body.vehicleId, body.washerId || 'UNASSIGNED', body.preset, createdAt).run();
		
		await c.env.kinsen_ops_db.prepare(
			'UPDATE vehicles SET status = "cleaning", lastStatusUpdate = CURRENT_TIMESTAMP WHERE id = ?'
		).bind(body.vehicleId).run();
		
		const newTask = await c.env.kinsen_ops_db.prepare('SELECT * FROM wash_tasks WHERE id = ?').bind(id).first();
		return c.json(newTask, 201);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

app.put('/api/washers/tasks/:id/complete', authMiddleware, async (c) => {
	const id = c.req.param('id');
	const { qcPassed, qcNotes } = await c.req.json();
	const finishedAt = new Date().toISOString();
	const qcValue = qcPassed ? 1 : 0;
	
	try {
		const task: any = await c.env.kinsen_ops_db.prepare('SELECT * FROM wash_tasks WHERE id = ?').bind(id).first();
		if (!task) return c.json({ error: 'Task not found' }, 404);
		
		await c.env.kinsen_ops_db.prepare(
			'UPDATE wash_tasks SET finishedAt = ?, isQcPassed = ?, qcNotes = ? WHERE id = ?'
		).bind(finishedAt, qcValue, qcNotes || null, id).run();
		
		const vehicleStatus = qcPassed ? 'ready' : 'qc';
		await c.env.kinsen_ops_db.prepare(
			'UPDATE vehicles SET status = ?, lastStatusUpdate = CURRENT_TIMESTAMP WHERE id = ?'
		).bind(vehicleStatus, task.vehicleId).run();
		
		const updatedTask = await c.env.kinsen_ops_db.prepare('SELECT * FROM wash_tasks WHERE id = ?').bind(id).first();
		return c.json(updatedTask);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

// --- Shifts Routes ---
app.get('/api/shifts', async (c) => {
	try {
		const { results } = await c.env.kinsen_ops_db.prepare('SELECT * FROM shifts').all();
		return c.json(results);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

app.post('/api/shifts/import', requireRole(['coordinator']), async (c) => {
	// Simple bulk import logic protected by coordinator role
	const { data } = await c.req.json();
	try {
		// Mock implementation - usually you would loop and insert
		return c.json({ status: 'success', importedRows: data.length });
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

export default app;
