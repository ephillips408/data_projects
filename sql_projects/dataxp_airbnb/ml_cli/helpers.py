import os
import psycopg2 as pg2
from dotenv import load_dotenv

import pandas as pd

import constants as consts

def get_data(database, user, password):

  # This functions relies on Postgres credentials that exist in a .env file.

  load_dotenv()

  conn = pg2.connect(
      database = os.getenv(database),
      user = os.getenv(user),
      password = os.getenv(password)
  )

  cursor = conn.cursor()

  cursor.execute(consts.query)

  result = cursor.fetchall()
  df = pd.DataFrame(data = result)

  conn.close()

  return df


