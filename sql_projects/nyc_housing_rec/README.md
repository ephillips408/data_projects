## NYC Housing Recommendations

The purpose of this project is to allow for prospective renters to compare the price of rent alongside the number of noise complaints for various neighborhoods in New York City. This will help renters determine if a neighborhood is too loud or too expensive so that they can narrow down their neighborhood choices while looking for apartments.

Tableau visualizations for this project can be found [here](https://public.tableau.com/app/profile/eric7616/viz/NYCHousingRec/Story1).

The rental data used for this project came from Street Easy, and comes from [this link](https://streeteasy.com/blog/data-dashboard/?agg=Total&metric=Inventory&type=Rentals&bedrooms=Any%20Bedrooms&property=Any%20Property%20Type&minDate=2010-01-01&maxDate=2021-08-01&area=Manhattan).

Do note that the Street Easy data that was used for this project was already cleaned from a previous project. The notebook that contains the Street Easy cleaning process can be found at [this link](https://github.com/ephillips408/data_projects/blob/main/sql_projects/dataxp_airbnb/street_easy_sql_prep.ipynb).

The noise complaint came from NYC Open Data, and is available [here](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2010-to-Present/erm2-nwe9/data).

In order to use the `311_sql_prep.ipynb` notebook, a `.env` file will need to be created with an `ENGINE` variable that will be used to connect to a database with sqlalchemy. More information about sqlalchemy engines can be found [here](https://docs.sqlalchemy.org/en/14/core/engines.html). Postgres was used for this project.

