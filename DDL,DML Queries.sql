 UPDATE BookingType
 SET BookingTypeName = "Resort Booking"
 WHERE BookingTypeID=1;
 
  UPDATE Customers
 SET CustomerFirstName = "Hello", CustomerLastName="World"
 WHERE CustomerID=2; 
 
DROP table PaymentMethod;

SELECT Customers.CustomerID,CustomerAddresses.CustomerID,Customers.CustomerFirstName
FROM Customers 
INNER JOIN CustomerAddresses
ON Customers.CustomerID = CustomerAddresses.CustomerID;

SELECT  CityName
FROM Cities 
ORDER BY CityName desc;

select EventName from events order by EventID ASC;