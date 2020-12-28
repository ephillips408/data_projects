## Chinook Database SQL Exploration

This repo contains some SQL queries that were used to answer questions about the Chinook database, which can be found [here.](https://blog.xojo.com/2016/04/13/the-chinook-sample-database/) All of these queries were created in PostgreSQL using pgAdmin4.

After downloading the database, the queries can be run in one of the following ways.

1. Run the following command from the terminal.
 - `psql -U username -d database -a -f path/to/sql_file` 

2. After connecting to the database with psql, run the following command.
 - `\i path/to/sql_file`

3. Copy and pase the query into the query editor in pgAdmin4. 

Some queries that are less complex have been left in the queries.txt file.