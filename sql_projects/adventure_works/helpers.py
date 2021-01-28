# Third party libraries
import os
import psycopg2 as pg2
import pandas as pd

# Third party methods
from dotenv import load_dotenv

# User created files
import query_strings

# Initialize the database
def db_init():

    # Need this to use .env file
    load_dotenv()

    conn = pg2.connect(
        database = os.getenv('POSTGRES_DATABASE'), 
        user = os.getenv('POSTGRES_USER'), 
        password = os.getenv('POSTGRES_PASSWORD')
    )

    cursor = conn.cursor()

    return cursor

# Get a list of .sql file names
def get_sql_files():

    target_directory = os.fsencode("queries/most_important_cities")
    sql_file_list = []
    file_strings_list = []

    for sql_file in os.listdir(target_directory):
        sql_file_list.append(str(sql_file))
        
    for name in sql_file_list:
        file_strings_list.append((name[2:].split('.')[0]))

    return file_strings_list

# Run the .sql files and give them unique Pandas Dataframes
def table_to_df():

    cur = db_init()
    files_list = get_sql_files()
    df_dict = {}
    
    for file_name in files_list:
        # Run the sql query from the query_strings dict.
        cur.execute(query_strings.queries_dict[file_name])

        # Run cur.fetchall() to get the data, then pass that as data for Pandas Dataframe.
        df_dict[file_name] = pd.DataFrame(data = cur.fetchall())

    print (df_dict)      

print (table_to_df())

# Have file names as strings in file_strings_list
# Want relevant df for each file name