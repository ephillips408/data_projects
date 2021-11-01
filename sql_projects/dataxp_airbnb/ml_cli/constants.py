query = '''
    SELECT
        neighborhood_group,
        neighborhood,
        room_type,
        minimum_nights,
        bedrooms,
        bathrooms,
        private_bath,
        accommodates,
        price
            FROM nyc_airbnb
'''

columns = {
    0: 'neighborhood',
    1: 'neighborhood_group',
    2: 'room_type',
    3: 'minimum_nights',
    4: 'bedrooms',
    5: 'bathrooms',
    6: 'private_bath',
    7: 'accommodates',
    8: 'price'
}