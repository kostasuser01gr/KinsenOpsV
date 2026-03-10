DROP TABLE IF EXISTS vehicles;
CREATE TABLE vehicles (
    id TEXT PRIMARY KEY,
    plate TEXT NOT NULL,
    model TEXT NOT NULL,
    status TEXT NOT NULL,
    fuelLevel REAL DEFAULT 1.0,
    mileage INTEGER DEFAULT 0,
    assignedWasherId TEXT,
    lastStatusUpdate TEXT DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS wash_tasks;
CREATE TABLE wash_tasks (
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

DROP TABLE IF EXISTS shifts;
CREATE TABLE shifts (
    id TEXT PRIMARY KEY,
    userId TEXT NOT NULL,
    userName TEXT NOT NULL,
    startTime TEXT NOT NULL,
    endTime TEXT NOT NULL,
    role TEXT NOT NULL,
    status TEXT DEFAULT 'published'
);

-- Seed Data
INSERT INTO vehicles (id, plate, model, status, fuelLevel, mileage) VALUES ('v1', 'ZXY-1234', 'Toyota Corolla', 'returned', 0.25, 45000);
INSERT INTO vehicles (id, plate, model, status, fuelLevel, mileage, assignedWasherId) VALUES ('v2', 'ABC-5678', 'Ford Focus', 'cleaning', 0.8, 32000, 'W1');
INSERT INTO vehicles (id, plate, model, status, fuelLevel, mileage) VALUES ('v3', 'KNS-0001', 'Mercedes E-Class', 'ready', 1.0, 12000);
