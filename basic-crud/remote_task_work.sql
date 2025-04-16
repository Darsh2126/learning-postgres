-- GPT Generated question

/*
🧑‍💼 Client Brief
Hey there! We’re building a lightweight task management system for small remote teams. Think Trello-lite, but simpler.
Each user should be able to create tasks for themselves, track their progress, tag them, and prioritize them.
For now, we just want the MVP (Minimum Viable Product) backend.
No frontend needed. Just a solid PostgreSQL database we can build on later.

🔧 Functional Requirements (MVP)
1. Users
A user signs up with a username and email (both must be unique).
Each user has a UUID as their primary key.
We’d like to know when the account was created.

2. Tasks
Users can create tasks with:
A title (required)

An optional description
A priority: low, medium, or high

Tags (multiple, like ["work", "urgent"]) — store however you think is best
A status (is_done: true/false)
Timestamps for created/updated
Each task belongs to exactly one user.

3. Basic Queries We’ll Need
-Get all tasks for a user
-Get only high priority or undone tasks
-Get tasks that include a certain tag (like urgent)

4. Stretch Feature (Nice-to-Have)
- Mark when tasks are deleted (we don't want to actually remove them yet)
- Maybe you can think of a way to log this?

🔍 What We Want From You
Please send back:
The SQL to set up the schema
Some INSERT examples (for 2 users, 3+ tasks)
SQL queries to meet the basic requests above
*/
