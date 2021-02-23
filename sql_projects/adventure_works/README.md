## Adventure Works EDA

This notebook explores the data from the Adventure Works dataset, using both PostgreSQL and Python. Psycopg2 was utilized to bring the data from SQL to Python. The database can be obtained [here](https://github.com/lorint/AdventureWorks-for-Postgres), and the OLTP diagram can be found [here](https://akela.mendelu.cz/~jprich/vyuka/db2/AdventureWorks2008_db_diagram.pdf).

To run the code in the notebook, a `.env` file will need to be created in the root directory of this project, and the following variables will need to be declared in the `.env` file.

* POSTGRES_DATABASE
* POSTGRES_USER
* POSTGRES_PASSWORD

From here, the code in `f_helpers.py` should read the variables declared in the `.env` file.

In the queries folder are answers to some questions that were found online, and the `most_important_cities` folder contains the queries that were used in the notebook in order to determine which city could be considered the most important to this company.