-- Week 8 Assignment: MySQL Database Backup and Restore
-- Run these mysqldump commands in the terminal or command prompt.
-- The -p option prompts securely for the root password.


-- Question 1: Creating a Complete Database Backup
--
-- This exports the sales database's structure, tables, data, stored routines,
-- events, and triggers to sales_backup.sql.
mysqldump -u root -p --routines --events --triggers sales > sales_backup.sql;

-- Explanation:
-- mysqldump creates a restorable SQL backup of the sales database.
-- -u root specifies the MySQL root user.
-- -p prompts for the password instead of placing it in the command.
-- The shell redirection (> sales_backup.sql) writes the backup to the requested file.
-- Regular backups protect against accidental changes, hardware failure,
-- corruption, and data loss, and provide a known recovery point.


-- Question 2: Backing Up All Databases
--
-- This exports every database on the MySQL server, including stored
-- structures, stored routines, events, and triggers.
mysqldump -u root -p --all-databases --routines --events --triggers > all_databases_backup.sql;

-- Explanation:
-- --all-databases tells mysqldump to back up every database on the server.
-- Backing up all databases before migration prevents loss of application,
-- user, configuration, and sales data that might exist outside one database.
-- It also makes server recovery and migration more complete and consistent.


-- Question 3: Creating a Data-Only Database Backup
--
-- This exports the data from sales without recreating the tables or schema.
mysqldump -u root -p --no-create-info sales > sales_data_backup.sql;

-- Explanation:
-- --no-create-info disables CREATE TABLE and related schema statements,
-- while mysqldump continues to export INSERT statements containing the data.
-- This is useful when the database schema already exists or is managed
-- separately, and an administrator only needs to restore or migrate table data.
