import numpy as np
import pandas as pd
import json

def id_to_category_name(df, str_path):
    category_dict = {}

    # Read the JSON file
    # f is short for file.
    with open (str_path) as f:
        data = json.load(f)

    # Create a dictionary of the form { id: 'title' }
    for item in data['items']:
        category_dict[int(item['id'])] = item['snippet']['title']

    # Replace the category_id number with the category_dict value.
    df['category_id'] = df['category_id'].replace(category_dict)    

    return df

