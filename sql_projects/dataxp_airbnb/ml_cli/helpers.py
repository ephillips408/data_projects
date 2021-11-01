import os
import psycopg2 as pg2
from dotenv import load_dotenv

import numpy as np
import pandas as pd

import constants as consts

def get_data():
  load_dotenv()

  conn = pg2.connect(
      database = os.getenv('POSTGRES_DATABASE'),
      user = os.getenv('POSTGRES_USER'),
      password = os.getenv('POSTGRES_PASSWORD')
  )

  cursor = conn.cursor()

  cursor.execute(consts.query)

  result = cursor.fetchall()
  df = pd.DataFrame(data = result)

  conn.close()

  return df


