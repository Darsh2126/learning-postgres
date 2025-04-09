-- Solution 1
-- Question: Insert a new task for user 1 with title "Finish PostgreSQL practice" and description "Do all CRUD steps today".
-- As we have linked our tasks table to users table, we can use user_id 1. so firstly create a user which is already created in crud.sql file.

Insert into tasks (user_id, title, description) values(1, 'Finish PostgreSQL practice', 'Do all CRUD steps today');

-- Solution 2
-- Question: Get all tasks for user 1
Select * from tasks where user_id = 1;