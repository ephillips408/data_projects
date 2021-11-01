import helpers as help
import constants as consts

import numpy as np
import pandas as pd
import sys

from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

from sklearn.svm import SVR
from sklearn.metrics import r2_score

print ('Welcome to the SVR commmand line interface!')
print ('Querying data...')

# Gets the data from Postgres
df = help.get_data()
df.rename(columns = consts.columns, inplace = True)

# Cleans the data
borough = str(input('Please type the borough of choice, beginning with a capital letter: \n'))
neighborhood = str(input('Please type the neighborhood of choice, beginning with a capital letter: \n'))

neigh_df = df[
  (df['neighborhood'] == borough) & 
  (df['neighborhood_group'] == neighborhood)].copy()

if len(neigh_df.index < 50):
  print ('There is not enough data to create a model.')
  sys.exit(0)

# Assume that at every listing has at least one bathroom
neigh_df['bathrooms'].fillna(value = 1, inplace = True)

# Remove the data where the price is listed as 0.
neigh_df = neigh_df[neigh_df['price'] != 0]

# We are not interested in hotel rooms, so we can drop this data.
neigh_df = neigh_df[neigh_df['room_type'] != 'Hotel room']

# Prepare the Data for ML

# X is the columns room_type, minimum_nights, bedrooms, bathrooms, private_bath, and accommodates
# y is the price column

X = neigh_df.iloc[:, 2:-1].values
y = neigh_df.iloc[:, -1].values

# OneHotEncoder given a column to each room_type with a 1 or 0 value.
# remainder = 'passthrough' makes sure that we keep the remaining columns.

ct = ColumnTransformer(transformers = [('encoder', OneHotEncoder(), [0])], remainder = 'passthrough')
X = np.array(ct.fit_transform(X))

# test_size = 0.2 gives 20 percent of observations into the test_set.
# random_state fixes the seed.

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 1)

# We need to make y 2D in order to pass it through StandardScaler.fit_transform()

y_train = y_train.reshape(len(y_train), 1)

# We will need to use a different standard scaler on X and y because the standard scaler will
# use the same mean and standard deviation for both X and y, which obviously have different
# means and standard deviations.

sc_X = StandardScaler()
sc_y = StandardScaler()
X_train = sc_X.fit_transform(X_train)
y_train = sc_y.fit_transform(y_train)

# Creating the model

regressor = SVR(kernel = 'linear')
regressor.fit(X_train, y_train.reshape(len(y_train)))

y_pred = sc_y.inverse_transform(regressor.predict(sc_X.transform(X_test)))

print (f'The model has been created. The r2 score of the model is {r2_score(y_test, y_pred)}')
pred_choice = str(input('Would you like to see the test set prediction results? Input y for yes, or n for no. \n'))

if pred_choice == 'y':
  print ('Predictions are on the left, and test set values are on the right.')
  np.set_printoptions(precision=2)
  print(np.concatenate((y_pred.reshape(len(y_pred),1), y_test.reshape(len(y_test),1)),1))

else:
  print ('Thank you for using this tool.')