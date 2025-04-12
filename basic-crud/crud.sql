-- Lets setup 2 table users and tasks
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    is_done BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- After that lets start with Basic CRUD
-- Insert
INSERT INTO users (username) 
VALUES ('alice')
RETURNING *;

-- Select
Select * from tasks where user_id = 1;

-- Get only pending tasks
Select * from tasks where is_done = false;

-- Update - Modify Data
Update tasks set is_done = true, updated_at= NOW()
 where id = 1 returning *;

-- Delete - Remove Data
DELETE FROM tasks 
WHERE id = 1
RETURNING *;

-- Insert a new task for user 1 with title "Finish PostgreSQL practice" and description "Do all CRUD steps today".
-- Then, write another query to fetch only the tasks that are still pending (i.e., not marked as done) for user 1.
-- You can find this solution ins task_solution.sql file to verify your answers
-- Note: Returning * will be use during Insert, update and delete

/*
Next Topics:
Step-by-Step Upgradation to our existing Schema
1 UUIDs – Replace SERIAL IDs for safer, unique identifiers
2 ENUMs – For fields like task priority
3 Generated Columns – Auto-calculate values
4 JSONB – Store flexible data like tags or metadata
5 Partial Indexes – Index only rows that match a condition
*/

-- Use of UUIDs for IDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
/*
🔍 What It Does:
This enables the uuid-ossp extension, which gives you functions like:
uuid_generate_v4() → generates a random UUID (version 4)
You only need to run this once per database. After that, you can use uuid_generate_v4() freely in DEFAULT values for UUID columns.
*/

-- Use of ENUMs for Priority
CREATE TYPE priority AS ENUM ('low', 'medium', 'high');

CREATE TABLE tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    is_done BOOLEAN DEFAULT FALSE,
    priority task_priority DEFAULT 'medium',
    tags JSONB,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Partial Index = Only on incomplete tasks
CREATE INDEX idx_incomplete_tasks 
ON tasks (user_id) 
WHERE is_done = FALSE;
