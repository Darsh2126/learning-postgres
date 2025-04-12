-- Solution 1
-- Question: Insert a new task for user 1 with title "Finish PostgreSQL practice" and description "Do all CRUD steps today".
-- As we have linked our tasks table to users table, we can use user_id 1. so firstly create a user which is already created in crud.sql file.

Insert into tasks (user_id, title, description) values(1, 'Finish PostgreSQL practice', 'Do all CRUD steps today');

-- Solution 2
-- Question: Get all tasks for user 1
Select * from tasks where user_id = 1;

/*
🧠 Your Challenge (🔥 Boss Level):
Create and run queries that do the following:
Insert a user and a few tasks with:
1. Random UUIDs
2. Different priority levels
3. Add a tags field (JSONB) like {"tags": ["postgres", "practice"]}

Write a query to:
1. Fetch only high-priority, incomplete tasks
2. Include the user’s username
3. Filter by a specific tag (e.g., tags @> '{"tags": ["postgres"]}')
4. Sort by created_at descending
*/

-- Solution
SELECT * FROM tasks 
WHERE 
  priority = 'high'
  AND is_done = FALSE
  AND tags @> '{"tags": ["postgres"]}'
  order by created_at desc;