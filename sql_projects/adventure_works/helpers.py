# Third party libraries
import os
import psycopg2 as pg2

# Third party methods
from dotenv import load_dotenv

# User created files
import query_strings

# Initialize the database
def db_init():

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
    
    for files in files_list:
        print (files)

print (table_to_df())

# Have file names as strings in file_strings_list
# Want relevant df for each file name