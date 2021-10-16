# --------------------- START OF COPYRIGHT NOTICE ---------------------
# AirQuality.py is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# AirQuality.py is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with AirQuality.py  If not, see <https://www.gnu.org/licenses/>.
# --------------------- START OF COPYRIGHT NOTICE ---------------------

schoolID = input("Enter the Username: ")
# Getting the username we want the metrics to be associated with

password = raw_input("Enter the Password: ")
# Getting the password that should match with the username we typed earlier

import time
# Import the library which is used to define the rate of the measurements

from datetime import datetime
# Import the library which is used to get the exact time we got a measuurement

from pms5003 import PMS5003
# Import the library we use to get PMS5003 measurements
# Find it at: <https://github.com/pimoroni/pms5003-python>
# How to install:
#   sudo pip install pms5003

import Adafruit_DHT
# Import the library we use to get DHT11 measurements
# Find it at: <https://github.com/adafruit/Adafruit_Python_DHT>
# How to install:
#   Python 2:
#     sudo pip install Adafruit_DHT

import requests
# Import the library with which we can send easily data to the database

import json
# Import the library which allows us to send data in JSON format

measurementID = 0
# A variable that keeps track of the measurements
# that the Raspberry has done since we excecuted the code

# Configure the PMS5003
pms5003 = PMS5003(
    device = '/dev/ttyS0',
    baudrate = 9600,
    pin_enable = 27,
    pin_reset = 17
)

# Configure the DHT11
sensor = Adafruit_DHT.DHT11
# Using a Raspberry Pi with DHT sensor
pin = 4
# connected to GPIO4.


while True:
    print("****************** Measurement ID since last start: "+str(measurementID)+" *************")
    # printing the ID of the measurement in Raspberry's console
    
    humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
    # Getting measurements from the DHT11 sensor
    
    data = pms5003.read()
    # Getting measurements from the PMS50003 sensor
    
    currentTime = datetime.now()
    # Getting the time we got the measurements
    
    measurementID += 1
    # One series of measurements is finished
    
    payload = [{'sch_id': schoolID, 'pm2_5': data.pm_ug_per_m3(2.5), 'pm10': data.pm_ug_per_m3(10), 'temp': temperature, 'humidity': humidity, 'date': currentTime.strftime("%Y-%m-%d %H:%M:%S")}]
    # Putting all the data into a JSON format, so we can send it to the database
    
    print(payload)
    # Printing in Raspberry's console, the data in JSON format so we can see what we are going to send
    
    r = requests.post("http://lessons.idrogios.com/Air-Quality-Analyzer/Air-Quality-Analyzer/rest/post.php", data=json.dumps(payload), auth=(schoolID, password))
    # Sending the data to the database we choose
    
    print(r.status_code)
    # Printing in Raspberry's console, the state of the request we made so we can check if everything went well

    time.sleep(3600)
    # Next measurement and should be in 60 minutes
