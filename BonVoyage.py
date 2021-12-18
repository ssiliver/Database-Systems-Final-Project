from os import close
import sys
import mysql.connector
from mysql.connector import errorcode
# Connecting to the MySQL database
try:
   mydb = mysql.connector.connect(
      user="root",
      password="root",
      host="localhost",
      database="BonVoyage")

except mysql.connector.Error as err:
   if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
      print("Invalid credentials")
   elif err.errno == errorcode.ER_BAD_DB_ERROR:
      print("Database not found")
   else:
      print("Cannot connect to database:", err)

else:
   
    cursor1 = mydb.cursor()

# Events Table Information
    query1 = ("SELECT * FROM Events") 
    cursor1.execute(query1)
    print("-------------------------------------Events Table Information---------------------------------------\n")
    for row in cursor1.fetchall():
        
        print(row,"\n")

# Address Table 
    query2=("SELECT * FROM address")
    cursor1.execute(query2)
    print("-------------------------------------------Address Table-------------------------------------------- \n")
    for row1 in cursor1.fetchall():
        print(row1,"\n")

# Bookings Table 
    query3=("SELECT * FROM Bookings")
    cursor1.execute(query3)
    print("--------------------------------------------Bookings Table-------------------------------------------- \n")
    for row in cursor1.fetchall():
       print(row,"\n")

# Booking Type Table
    query4=("SELECT * FROM BookingType")
    cursor1.execute(query4)
    print("-------------------------------------------Booking Type Table------------------------------------------- \n")
    for row in cursor1.fetchall():
       print(row,"\n")

# Cities Table
    query5=("SELECT * FROM Cities")
    cursor1.execute(query5)
    print("-------------------------------------------Cities Table------------------------------------------------- \n")
    for row in cursor1.fetchall():
       print(row,"\n")

# Customer Address Table
    query6=("SELECT * FROM CustomerAddresses")
    cursor1.execute(query6)
    print("---------------------------------------Customer Address Table--------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")
# Event Organizer Table
    query8=("SELECT * FROM EventOrganizer")
    cursor1.execute(query8)
    print("-----------------------------------------Event Organizer Table--------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")
# Event Schedule Table
    query9=("SELECT * FROM EventSchedule")
    cursor1.execute(query9)
    print("---------------------------------------------Event Schedule Table-------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")
# Hotels table
    query10=("SELECT * FROM Hotels")
    cursor1.execute(query10)
    print("--------------------------------------------------Hotels table------------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")
# Orders Table
    query11=("SELECT * FROM Orders")
    cursor1.execute(query11)
    print("------------------------------------------------Orders Table--------------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")
# Payment Method Table
    query12=("SELECT * FROM PaymentMethod")
    cursor1.execute(query12)
    print("---------------------------------------------Payment Method Table---------------------------------------------")
    for row in cursor1.fetchall():
       print(row,"\n")


cursor1.close()
mydb.close()

   # Execute database operations...