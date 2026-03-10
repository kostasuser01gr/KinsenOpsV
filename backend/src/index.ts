import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { v4 as uuidv4 } from 'uuid';

export type Env = {
	kinsen_ops_db: D1Database;
};

const app = new Hono<{ Bindings: Env }>();

// Enable CORS for Flutter web frontend
app.use('*', cors());

// --- Routes ---

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
		
		// Update vehicle status to cleaning
		await c.env.kinsen_ops_db.prepare(
			'UPDATE vehicles SET status = "cleaning", lastStatusUpdate = CURRENT_TIMESTAMP WHERE id = ?'
		).bind(body.vehicleId).run();
		
		const newTask = await c.env.kinsen_ops_db.prepare('SELECT * FROM wash_tasks WHERE id = ?').bind(id).first();
		return c.json(newTask, 201);
	} catch (e: any) {
		return c.json({ error: e.message }, 500);
	}
});

app.put('/api/washers/tasks/:id/complete', async (c) => {
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
		
		// Update vehicle status based on QC
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

export default app;
