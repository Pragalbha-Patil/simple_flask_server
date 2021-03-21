'''
    @author: Pragalbha Patil
    @tip: Always read comments to understand code
    @functionality: Searches clinic from user location & distance and returns JSON
'''

from flask import Flask, request, jsonify, g
from flask_mysqldb import MySQL
import sqlite3
import random
from flask_cors import CORS

from math import radians, cos, sin, asin, sqrt
import datetime
import time

app = Flask(__name__)
CORS(app)

                            # *** Uncomment below lines for MySql Connection *** #
# app.config['MYSQL_HOST'] = 'localhost'
# app.config['MYSQL_USER'] = 'root'
# app.config['MYSQL_PASSWORD'] = ''
# app.config['MYSQL_DB'] = 'clinics'

# mysql = MySQL(app)

DATABASE = 'clinics.db'

# returns Sqlite DB cursor, not required for MySql
def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

# kills Sqlite on app teardown, not req. for MySQl
@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

def haversine(lon1, lat1, lon2, lat2):
    """
    Calculate the great circle distance between two points 
    on the earth (specified in decimal degrees)
    """
    # convert decimal degrees to radians 
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])

    # haversine formula 
    dlon = lon2 - lon1 
    dlat = lat2 - lat1 
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a)) 
    r = 6371 # Radius of earth in kilometers. Use 3956 for miles
    return c * r

# API endpoint, takes user lat, long & distanceInKms as input and searches db for nearest clinic and returns json
@app.route('/search', methods=['POST'])
def search():
    user_request = request.json
    # print(user_request)
    user_lat = user_request['latitude']
    user_long = user_request['longitude']
    user_distance_pref = user_request['distance_in_kms']  
    # print(user_distance_pref)
    # print(user_lat)
    # print(user_long)

    # search nearest clinic using distance_in_kms input
    cursor = get_db().cursor() # SQLITE cursor
    query_string = "SELECT * FROM client_table"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()

    # holds data to return to user
    return_list = []
    
    for clinic in data:
        # get clinic's lat, lon and clinic name from db data
        clinic_name = clinic[1]
        clinic_lat = clinic[3]
        clinic_long = clinic[4]
        clinic_city = clinic[2]
        # calculate distance in kms user haversine 
        distance_in_kms = int(haversine(user_long, user_lat, clinic_long, clinic_lat))

        # if distance is less or equal to input, you should return that clinic
        if distance_in_kms <= user_distance_pref:
            print("distance:"+str(distance_in_kms))
            clinic = {'clinic_name': clinic_name, 'clinic_lat': clinic_lat, 'clinic_long':clinic_long, 'clinic_city': clinic_city }
            return_list.append(clinic)
        else:
            print("no match:"+str(clinic_name))


    return jsonify({"user_input": user_request, "data": return_list})
    
if __name__ == '__main__':
    app.run(debug=True, use_reloader=True)