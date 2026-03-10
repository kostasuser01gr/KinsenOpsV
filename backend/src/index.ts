import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { v4 as uuidv4 } from 'uuid';

export type Env = {
	// D1 Database or KV bindings would go here
	// DB: D1Database;
};

const app = new Hono<{ Bindings: Env }>();

// Enable CORS for Flutter web frontend
app.use('*', cors());

// --- Mock Data ---
// In a real operational environment, this data would be stored in Cloudflare D1 or KV.

let vehicles = [
	{ id: 'v1', plate: 'ZXY-1234', model: 'Toyota Corolla', status: 'returned', fuelLevel: 0.25, mileage: 45000 },
	{ id: 'v2', plate: 'ABC-5678', model: 'Ford Focus', status: 'cleaning', fuelLevel: 0.8, mileage: 32000, assignedWasherId: 'W1' },
	{ id: 'v3', plate: 'KNS-0001', model: 'Mercedes E-Class', status: 'ready', fuelLevel: 1.0, mileage: 12000 },
];

let tasks = [
	{ id: 't1', vehicleId: 'v1', washerId: 'W1', preset: 'full', createdAt: new Date().toISOString() },
];

// --- Routes ---

app.get('/api/health', (c) => {
	return c.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// --- Fleet Routes ---

app.get('/api/fleet', (c) => {
	return c.json(vehicles);
});

app.put('/api/fleet/:id/status', async (c) => {
	const id = c.req.param('id');
	const { status } = await c.req.json();
	
	const vehicle = vehicles.find(v => v.id === id);
	if (!vehicle) return c.json({ error: 'Vehicle not found' }, 404);
	
	vehicle.status = status;
	return c.json(vehicle);
});

// --- Washers Routes ---

app.get('/api/washers/tasks', (c) => {
	return c.json(tasks);
});

app.post('/api/washers/tasks', async (c) => {
	const body = await c.req.json();
	const newTask = {
		id: uuidv4(),
		vehicleId: body.vehicleId,
		washerId: body.washerId || 'UNASSIGNED',
		preset: body.preset,
		createdAt: new Date().toISOString(),
		finishedAt: null,
		isQcPassed: false,
	};
	
	tasks.push(newTask);
	
	// Update vehicle status to cleaning
	const vehicle = vehicles.find(v => v.id === body.vehicleId);
	if (vehicle) {
		vehicle.status = 'cleaning';
	}
	
	return c.json(newTask, 201);
});

app.put('/api/washers/tasks/:id/complete', async (c) => {
	const id = c.req.param('id');
	const { qcPassed, qcNotes } = await c.req.json();
	
	const task = tasks.find(t => t.id === id);
	if (!task) return c.json({ error: 'Task not found' }, 404);
	
	task.finishedAt = new Date().toISOString();
	task.isQcPassed = qcPassed;
	if (qcNotes) task.qcNotes = qcNotes;
	
	// Update vehicle status based on QC
	const vehicle = vehicles.find(v => v.id === task.vehicleId);
	if (vehicle) {
		vehicle.status = qcPassed ? 'ready' : 'qc';
	}
	
	return c.json(task);
});

export default app;
