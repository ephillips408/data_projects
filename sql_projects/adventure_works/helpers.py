import os

target_directory = os.fsencode("queries/most_important_cities")
sql_file_list = []
file_strings_list = []

for sql_file in os.listdir(target_directory):
    filename = os.fsencode(sql_file)
    sql_file_list.append(str(sql_file))
    
for name in sql_file_list:
    file_strings_list.append((name[2:].split('.')[0]))

print (file_strings_list)