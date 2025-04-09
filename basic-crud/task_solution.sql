-- Solution 1
-- Question: Insert a new task for user 1 with title "Finish PostgreSQL practice" and description "Do all CRUD steps today".
Insert into tasks (user_id, title, description) values(1, 'Finish PostgreSQL practice', 'Do all CRUD steps today');

-- Solution 2
-- Question: Get all tasks for user 1
Select * from tasks where user_id = 1 returning *;