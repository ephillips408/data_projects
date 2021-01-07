import numpy as np
import pandas as pd
import folium
from folium.plugins import HeatMap

def generate_base_map(default_location = [12.97, 77.59], default_zoom_start = 12):
    
    base_map = folium.Map(location = default_location, control_scale = True, zoom_start = default_zoom_start)
    return base_map


def create_heatmap(df, df_column, df_value):

    # Requires a column named 'geo_loc' with a tuple valued lat, long coordinate.
    # Also requies an address column.
    
    data = df[df[df_column] == df_value].groupby('geo_loc').count().reset_index()[['geo_loc', 'address']]
    data['lat'] = data['geo_loc'].apply(lambda x: x[0])
    data['long'] = data['geo_loc'].apply(lambda x: x[1])
    data = data.drop('geo_loc', axis = 1)
    data = data[['lat', 'long', 'address']]

    basemap = generate_base_map()

    HeatMap(data, zoom = 20, radius = 15).add_to(basemap)

    return basemap

def count_heatmap(df):

    # Requires a column named 'geo_loc' with a tuple valued lat, long coordinate.
    # Also requies an address column.

    data = df.groupby('geo_loc').count().reset_index()
    data['lat'] = data['geo_loc'].apply(lambda x: x[0])
    data['long'] = data['geo_loc'].apply(lambda x: x[1])
    data.drop('geo_loc', axis = 1)
    data = data[['lat', 'long', 'address']]

    basemap = generate_base_map()

    HeatMap(data, zoom = 20, radius = 15).add_to(basemap)

    return basemap