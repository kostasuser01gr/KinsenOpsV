DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Seed an admin user (password: "password123")
-- In a real app, you would use bcrypt/argon2. For this D1 SQLite mock, we use a plain hash or just demo credentials.
INSERT INTO users (id, name, role, password_hash) VALUES ('u_admin', 'Admin Staff', 'coordinator', 'password123');
INSERT INTO users (id, name, role, password_hash) VALUES ('u_washer', 'Demo Washer', 'washer', 'password123');

-- Re-run previous schemas to ensure everything exists
CREATE TABLE IF NOT EXISTS vehicles (
    id TEXT PRIMARY KEY,
    plate TEXT NOT NULL,
    model TEXT NOT NULL,
    status TEXT NOT NULL,
    fuelLevel REAL DEFAULT 1.0,
    mileage INTEGER DEFAULT 0,
    assignedWasherId TEXT,
    lastStatusUpdate TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS wash_tasks (
    id TEXT PRIMARY KEY,
    vehicleId TEXT NOT NULL,
    washerId TEXT NOT NULL,
    preset TEXT NOT NULL,
    createdAt TEXT DEFAULT CURRENT_TIMESTAMP,
    startedAt TEXT,
    finishedAt TEXT,
    isQcPassed INTEGER DEFAULT 0,
    qcNotes TEXT,
    FOREIGN KEY (vehicleId) REFERENCES vehicles(id)
);

CREATE TABLE IF NOT EXISTS shifts (
    id TEXT PRIMARY KEY,
    userId TEXT NOT NULL,
    userName TEXT NOT NULL,
    startTime TEXT NOT NULL,
    endTime TEXT NOT NULL,
    role TEXT NOT NULL,
    status TEXT DEFAULT 'published'
);
