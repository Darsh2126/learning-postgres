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
