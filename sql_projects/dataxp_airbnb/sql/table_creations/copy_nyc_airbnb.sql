-- Replace 'path_goes_here' with the absolute path of the .csv file needed.

COPY nyc_airbnb
FROM 'path_goes_here'
DELIMITER ','
CSV HEADER;