
CREATE DATABASE BonVoyage;
 

USE `BonVoyage`;
 
CREATE TABLE Address(
	`AddressID` int AUTO_INCREMENT NOT NULL,
	`AddressType` varchar(20) NOT NULL,
	`AddressLine1` varchar(20) NOT NULL,
	`AddressLine2` varchar(20) NULL,
	`CityID` int NOT NULL,
	`Zipcode` int NOT NULL,
 CONSTRAINT `PK_Address___` PRIMARY KEY 
(
	`AddressID` ASC
) 
);


CREATE TABLE Bookings(
	`BookingID` int AUTO_INCREMENT NOT NULL,
	`CustomerID` int NOT NULL,
	`BookingDate` datetime(3) NOT NULL,
	`NoOfGuests` int NOT NULL,
	`OrganizerID` int NULL,
	`BookingTypeID` int NOT NULL,
	`UnitPrice` Decimal(15,4) NOT NULL,
	`TotalPrice` Decimal(15,4) NOT NULL,
	`TimeStamp` datetime(3) NOT NULL,
	`ResturantID` int NULL,
 CONSTRAINT `PK_Bookings` PRIMARY KEY 
(
	`BookingID` ASC
) 
);



CREATE TABLE BookingType(
	`BookingTypeID` int AUTO_INCREMENT NOT NULL,
	`BookingTypeName` varchar(20) NOT NULL,
 CONSTRAINT `PK_BookingType` PRIMARY KEY 
(
	`BookingTypeID` ASC
) 
);


CREATE TABLE Cities(
	`CityID` int AUTO_INCREMENT NOT NULL,
	`CityName` varchar(20) NOT NULL,
	`State` varchar(20) NOT NULL,
	`CountryName` varchar(20) NOT NULL,
 CONSTRAINT `PK_Cities` PRIMARY KEY 
(
	`CityID` ASC
) 
);



CREATE TABLE CustomerAddresses(
	`CustomerID` int NOT NULL,
	`AddressID` int NOT NULL,
 CONSTRAINT `PK_CustomerAddresses` PRIMARY KEY 
(
	`CustomerID` ASC,
	`AddressID` ASC
) 
);



CREATE TABLE Customers(
	`CustomerID` int AUTO_INCREMENT NOT NULL,
	`CustomerFirstName` varchar(20) NOT NULL,
	`CustomerLastName` varchar(20) NOT NULL,
	`DOB` datetime(3) NOT NULL,
	`Gender` varchar(20) NOT NULL,
	`PhoneNumber` varbinary(200) NOT NULL,
	`MemberSince` datetime(3) NOT NULL,
 CONSTRAINT `PK_Customers` PRIMARY KEY 
(
	`CustomerID` ASC
) 
);


CREATE TABLE EventOrganizer(
	`OrganizerID` int AUTO_INCREMENT NOT NULL,
	`OrganizerAddressID` int NOT NULL,
	`OrganizerName` varchar(20) NOT NULL,
	`PhoneNo` varchar(20) NOT NULL,
	`Description` varchar(20) NULL,
	`Website` varchar(20) NULL,
 CONSTRAINT `PK_EventOrganizer` PRIMARY KEY 
(
	`OrganizerID` ASC
) 
);

CREATE TABLE Events(
	`EventID` int AUTO_INCREMENT NOT NULL,
	`OrganizerID` int NOT NULL,
	`EventAddressID` int NOT NULL,
	`EventName` varchar(20) NOT NULL,
	`PricePerGuest` Decimal(15,4) NOT NULL,
	`Description` varchar(20) NOT NULL,
	`Website` varchar(20) NULL,
 CONSTRAINT `PK_Events` PRIMARY KEY 
(
	`EventID` ASC
) 
);


CREATE TABLE EventSchedule(
	`EventID` int NOT NULL,
	`OrganizerID` int NOT NULL,
 CONSTRAINT `PK_EventSchedule` PRIMARY KEY 
(
	`EventID` ASC,
	`OrganizerID` ASC
) 
);



CREATE TABLE Hotels(
	`HotelID` int AUTO_INCREMENT NOT NULL,
	`CityID` int NOT NULL,
	`HotelAddressID` int NOT NULL,
	`HotelName` varchar(20) NOT NULL,
	`PhoneNumber` varchar(20) NOT NULL,
	`Description` varchar(10) NULL,
 CONSTRAINT `PK_Hotels` PRIMARY KEY 
(
	`HotelID` ASC
) 
);



CREATE TABLE Orders(
	`OrderID` int AUTO_INCREMENT NOT NULL,
	`PaymentDate` datetime(3) NOT NULL,
	`Quantity` int NOT NULL,
	`UnitPrice` Decimal(15,4) NOT NULL,
	`TotalPrice` Decimal(15,4) NOT NULL,
	`BookingID` int NOT NULL,
	`PaymentMethodID` int NOT NULL,
	`BillingAddressID` int NOT NULL,
	`Timestamp` datetime(3) NOT NULL,
 CONSTRAINT `PK_Orders` PRIMARY KEY 
(
	`OrderID` ASC
) 
);


CREATE TABLE PaymentMethod(
	`PaymentMethodID` int AUTO_INCREMENT NOT NULL,
	`PaymentType` varchar(20) NOT NULL,
 CONSTRAINT `PK_PaymentMethod` PRIMARY KEY 
(
	`PaymentMethodID` ASC
) 
);



CREATE TABLE Restaurants(
	`RestaurantID` int AUTO_INCREMENT NOT NULL,
	`RestaurantAddressID` int NOT NULL,
	`RestaurantName` varchar(20) NOT NULL,
	`PhoneNO` varchar(20) NOT NULL,
	`CityID` int NOT NULL,
 CONSTRAINT `PK_Restaurants` PRIMARY KEY 
(
	`RestaurantID` ASC
) 
);


CREATE TABLE Reviews(
	`ReviewID` int AUTO_INCREMENT NOT NULL,
	`CustomerID` int NOT NULL,
	`Ratings` int NOT NULL,
	`ReviewDate` datetime(3) NOT NULL,
	`Timestamp` datetime(3) NOT NULL,
	`RestaurantID` int NULL,
	`RoomID` int NULL,
	`OrganizerID` int NULL,
	`Description` varchar(100) NULL,
 CONSTRAINT `PK_Reviews` PRIMARY KEY 
(
	`ReviewID` ASC
) 
);


CREATE TABLE RoomBookings(
	`RoomID` int NOT NULL,
	`BookingID` int NOT NULL,
	`StartDate` datetime(3) NOT NULL,
	`EndDate` datetime(3) NOT NULL,
 CONSTRAINT `PK_RoomBookings` PRIMARY KEY 
(
	`RoomID` ASC,
	`BookingID` ASC
) 
);

CREATE TABLE Rooms(
	`RoomID` int AUTO_INCREMENT NOT NULL,
	`HotelID` int NOT NULL,
	`RoomType` varchar(20) NOT NULL,
	`NoOfBeds` int NOT NULL,
	`IsSmoking` Tinyint NOT NULL,
	`IsAC` Tinyint NOT NULL,
	`IsMiniBar` Tinyint NOT NULL,
	`Description` varchar(20) NOT NULL,
	`IsPetFriendly` Tinyint NOT NULL,
	`PricePerNight` Decimal(15,4) NOT NULL,
	`AvailableRooms` int NOT NULL,
 CONSTRAINT `PK_Rooms` PRIMARY KEY 
(
	`RoomID` ASC
) 
);



CREATE TABLE TouristAttractions(
	`PlaceID` int AUTO_INCREMENT NOT NULL,
	`PlaceAddressID` int NOT NULL,
	`PreferedStartTime` datetime(3) NOT NULL,
	`PreferedEndTime` datetime(3) NOT NULL,
	`CityID` int NOT NULL,
	`Name` varchar(20) NOT NULL,
 CONSTRAINT `PK_TouristAttractions` PRIMARY KEY 
(
	`PlaceID` ASC
) 
);


CREATE INDEX IX_CustomerAddresses ON CustomerAddresses
(
	`CustomerID` ASC
) ;
 
ALTER TABLE Address  ADD  CONSTRAINT `FK_Address_Cities` FOREIGN KEY(`CityID`)
REFERENCES Cities (`CityID`);
 
 
ALTER TABLE Bookings  ADD  CONSTRAINT `FK_Bookings_BookingType` FOREIGN KEY(`BookingTypeID`)
REFERENCES BookingType (`BookingTypeID`);
 
 
ALTER TABLE Bookings  ADD  CONSTRAINT `FK_Bookings_Customers` FOREIGN KEY(`CustomerID`)
REFERENCES Customers (`CustomerID`);

 
ALTER TABLE Bookings  ADD  CONSTRAINT `FK_Bookings_EventOrganizer` FOREIGN KEY(`OrganizerID`)
REFERENCES EventOrganizer (`OrganizerID`);
 
 
ALTER TABLE Bookings  ADD  CONSTRAINT `FK_Bookings_Restaurants` FOREIGN KEY(`ResturantID`)
REFERENCES Restaurants (`RestaurantID`);
 

 
ALTER TABLE CustomerAddresses  ADD  CONSTRAINT `FK_CustomerAddresses_Address` FOREIGN KEY(`AddressID`)
REFERENCES Address (`AddressID`);
 
 
ALTER TABLE CustomerAddresses  ADD  CONSTRAINT `FK_CustomerAddresses_Customers` FOREIGN KEY(`CustomerID`)
REFERENCES Customers (`CustomerID`);

 
ALTER TABLE EventOrganizer  ADD  CONSTRAINT `FK_EventOrganizer_Address` FOREIGN KEY(`OrganizerAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE Events  ADD  CONSTRAINT `FK_Events_Address` FOREIGN KEY(`EventAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE Events  ADD  CONSTRAINT `FK_Events_EventOrganizer` FOREIGN KEY(`OrganizerID`)
REFERENCES EventOrganizer (`OrganizerID`);
 
 
ALTER TABLE EventSchedule  ADD  CONSTRAINT `FK_EventSchedule_EventOrganizer` FOREIGN KEY(`OrganizerID`)
REFERENCES EventOrganizer (`OrganizerID`);
 

 
ALTER TABLE EventSchedule  ADD  CONSTRAINT `FK_EventSchedule_Events` FOREIGN KEY(`EventID`)
REFERENCES Events (`EventID`);
 

 
ALTER TABLE Hotels  ADD  CONSTRAINT `FK_Hotels_Address` FOREIGN KEY(`HotelAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE Hotels  ADD  CONSTRAINT `FK_Hotels_Cities` FOREIGN KEY(`CityID`)
REFERENCES Cities (`CityID`);
 

 
ALTER TABLE Orders  ADD  CONSTRAINT `FK_Orders_Address` FOREIGN KEY(`BillingAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE Orders  ADD  CONSTRAINT `FK_Orders_Bookings` FOREIGN KEY(`BookingID`)
REFERENCES Bookings (`BookingID`);
 

 
ALTER TABLE Orders  ADD  CONSTRAINT `FK_Orders_PaymentMethod` FOREIGN KEY(`PaymentMethodID`)
REFERENCES PaymentMethod (`PaymentMethodID`);
 

 
ALTER TABLE Restaurants  ADD  CONSTRAINT `FK_Restaurants_Address` FOREIGN KEY(`RestaurantAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE Restaurants  ADD  CONSTRAINT `FK_Restaurants_Cities` FOREIGN KEY(`CityID`)
REFERENCES Cities (`CityID`);
 

 
ALTER TABLE Reviews  ADD  CONSTRAINT `FK_Reviews_Customers` FOREIGN KEY(`CustomerID`)
REFERENCES Customers (`CustomerID`);
 

 
ALTER TABLE Reviews  ADD  CONSTRAINT `FK_Reviews_EventOrganizer` FOREIGN KEY(`OrganizerID`)
REFERENCES EventOrganizer (`OrganizerID`);
 

 
ALTER TABLE Reviews  ADD  CONSTRAINT `FK_Reviews_Restaurants` FOREIGN KEY(`RestaurantID`)
REFERENCES Restaurants (`RestaurantID`);
 

 
ALTER TABLE Reviews  ADD  CONSTRAINT `FK_Reviews_Rooms` FOREIGN KEY(`RoomID`)
REFERENCES Rooms (`RoomID`);
 

 
ALTER TABLE RoomBookings  ADD  CONSTRAINT `FK_RoomBookings_Bookings` FOREIGN KEY(`BookingID`)
REFERENCES Bookings (`BookingID`);
 

 
ALTER TABLE RoomBookings  ADD  CONSTRAINT `FK_RoomBookings_Rooms` FOREIGN KEY(`RoomID`)
REFERENCES Rooms (`RoomID`);
 

 
ALTER TABLE Rooms  ADD  CONSTRAINT `FK_Rooms_Hotels` FOREIGN KEY(`HotelID`)
REFERENCES Hotels (`HotelID`);
 

 
ALTER TABLE TouristAttractions  ADD  CONSTRAINT `FK_TouristAttractions_Address` FOREIGN KEY(`PlaceAddressID`)
REFERENCES Address (`AddressID`);
 

 
ALTER TABLE TouristAttractions  ADD  CONSTRAINT `FK_TouristAttractions_Cities` FOREIGN KEY(`CityID`)
REFERENCES Cities (`CityID`);
 

 

INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (1, N'resturant booking');
INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (2, N'hotel booking');
INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (3, N'event booking');
INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (4, N'travel booking');
INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (5, N'advanced booking');
INSERT BookingType (`BookingTypeID`, `BookingTypeName`) VALUES (6, N'hybrid booking');


INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (1, N'New York', N'NY', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (2, N'boston', N'MA', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (3, N'twin city', N'WA', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (4, N'las vegas', N'NEA', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (5, N'tokyo', N'TKO', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (6, N'seattle', N'WA', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (7, N'portland', N'NH', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (8, N'DC', N'DC', N'United State');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (9, N'cambridge', N'LONDON', N'United Kindom');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (10, N'shanghai', N'SH', N'China');
INSERT Cities (`CityID`, `CityName`, `State`, `CountryName`) VALUES (11, N'seol', N'INCHEONG', N'South Korea');



INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (1, N'Business', N'110 park drive', N'boston', 2, 2115);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (2, N'Business', N'111 park drive', N'boston', 2, 2114);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (3, N'Residential', N'113 75 avenue', N'New York', 1, 1234);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (4, N'Business', N'128 Huntington', N'New York', 1, 1235);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (5, N'Business', N'103 fenway park', N'boston', 2, 21158);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (6, N'Business', N'112 back bay', N'boston', 2, 11587);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (7, N'Residential', N'971 flagstaff', N'las vegas', 4, 11589);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (8, N'Residential', N'1020 green hill', N'las vegas', 4, 8596);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (9, N'Residential', N'1031 broadway west', N'New York', 1, 7854);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (10, N'Business', N'Blue village 116', N'Shanghai', 10, 589);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (11, N'Business', N'West land 123', N'Seol', 11, 4598);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (12, N'Business', N'longwood 9801', N'Seol', 11, 7854);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (18, N'Business', N'879 Huntington Ave', N'New York', 1, 1254);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (19, N'Business', N'3 Parker Hill', N'Las Vegas', 4, 56346);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (20, N'Business', N'78 Rocksbury St', N'Seattle', 4, 8970);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (21, N'Business', N'678 Blue Hill', N'Cambridge', 9, 67345);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (22, N'Business', N'45 Ford St', N'New York', 1, 89678);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (23, N'Business', N'5 Goan High', N'Tokyo', 5, 34907);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (24, N'Business', N'678 Tall Hill', N'TwinCity', 3, 45890);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (25, N'Business', N'East Village 23', N'Portland', 7, 78567);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (26, N'Business', N'123 BackBay', N'DC', 8, 45367);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (27, N'Business', N'7 Pali Hill', N'Twin City', 3, 45267);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (28, N'Business', N'67 East bandra', N'Tokyo', 5, 12356);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (29, N'Business', N'5th Avenue', N'Seattle', 6, 8456);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (30, N'Business', N'12th Avenue', N'Portland', 7, 34789);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (31, N'Business', N'8 Greater Park', N'DC', 8, 67349);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (32, N'Business', N'7 Central Park', N'Seol', 11, 67345);
INSERT Address (`AddressID`, `AddressType`, `AddressLine1`, `AddressLine2`, `CityID`, `Zipcode`) VALUES (33, N'Business', N'65 East Village', N'Cambridge', 9, 89345);


INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (1, N'emily', N'munson', CAST(N'1991-08-01T00:00:00.000' AS DateTime(3)), N'female', CAST('6178965439' AS binary(200)), CAST(N'2012-02-04T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (2, N'andy', N'chen', CAST(N'1992-02-09T00:00:00.000' AS DateTime(3)), N'male', CAST('6785904789' AS binary(200)), CAST(N'2013-09-07T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (3, N'kikyo', N'Satuki', CAST(N'1995-06-30T00:00:00.000' AS DateTime(3)), N'female', CAST('8906789090' AS binary(200)), CAST(N'2014-09-11T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (4, N'lexi', N'robinson', CAST(N'1994-09-01T00:00:00.000' AS DateTime(3)), N'female', CAST('5674908378' AS binary(200)), CAST(N'2013-01-05T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (5, N'john', N'smith', CAST(N'1996-09-11T00:00:00.000' AS DateTime(3)), N'female', CAST('2569045678' AS binary(200)), CAST(N'2015-08-11T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (6, N'tereasa', N'kulk', CAST(N'1994-03-06T00:00:00.000' AS DateTime(3)), N'male', CAST('7895634567' AS binary(200)), CAST(N'2011-01-31T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (7, N'constance', N'tarvo', CAST(N'1995-06-14T00:00:00.000' AS DateTime(3)), N'female', CAST('4563908256' AS binary(200)), CAST(N'2014-08-16T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (8, N'lydia', N'diago', CAST(N'1998-08-11T00:00:00.000' AS DateTime(3)), N'male', CAST('7859046789' AS binary(200)), CAST(N'2016-07-19T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (9, N'mirana', N'lestrange', CAST(N'1997-12-13T00:00:00.000' AS DateTime(3)), N'female', CAST('6589046790' AS binary(200)), CAST(N'2015-11-11T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (10, N'ursa', N'polingski', CAST(N'1993-08-07T00:00:00.000' AS DateTime(3)), N'male', CAST('3458925670' AS binary(200)), CAST(N'2017-02-19T00:00:00.000' AS DateTime(3)));
INSERT Customers (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `DOB`, `Gender`, `PhoneNumber`, `MemberSince`) VALUES (11, N'jugger', N'axe', CAST(N'1993-01-03T00:00:00.000' AS DateTime(3)), N'male', CAST('7683456032' AS binary(200)), CAST(N'2017-10-16T00:00:00.000' AS DateTime(3)));



INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (1, 1);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (2, 2);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (3, 3);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (4, 4);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (5, 5);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (6, 6);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (7, 7);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (8, 8);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (9, 9);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (10, 10);
INSERT CustomerAddresses (`CustomerID`, `AddressID`) VALUES (11, 11);



INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (1, 21, N'Alvon', N'8265123484', N'festival event', N'www.alvevent.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (3, 22, N'Lydia', N'2344523423', N'child service', N'www.lovevoc.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (4, 23, N'Mitkou', N'2971123446', N'carnival ', N'www.funevt.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (5, 24, N'Yolanda', N'9814456114', N'parade', N'www.yoforvoa.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (6, 21, N'Randy', N'9880146778', N'elder people', N'www.randytour.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (7, 22, N'Bob', N'3526611221', N'large group', N'www.bobfun.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (8, 23, N'Okinawa', N'1229771355', N'couple', N'www.couple.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (9, 24, N'Walmart', N'1389913460', N'shopping tour', N'www.letsbuy.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (10, 21, N'Peter', N'5421333333', N'duty free ', N'www.petetravel.com');
INSERT EventOrganizer (`OrganizerID`, `OrganizerAddressID`, `OrganizerName`, `PhoneNo`, `Description`, `Website`) VALUES (11, 23, N'Herb', N'3662113111', N'clinic', N'www.herb.com');


INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (1, 1, 25, N'New year parade', 16.0000, N'new year ', N'www.newyear.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (2, 3, 26, N'duty free shopping', 8000.0000, N'pure shopping', N'www.letsbuy.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (3, 4, 27, N'herb', 40.0000, N'health and pill', N'www.herb.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (4, 5, 28, N'valentine journey', 2000.0000, N'romantic', N'www.couple.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (6, 6, 25, N'elder people', 300.0000, N'elder people', N'www.randytour.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (7, 7, 26, N'big fun', 300.0000, N'500 people on beach', N'www.petetravel.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (8, 8, 27, N'Lagend show', 230.0000, N'carnival parade', N'www.funevt.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (9, 9, 28, N'fantasy', 450.0000, N'saint patrick', N'www.alvevent.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (10, 10, 25, N'peter pan', 25.0000, N'children', N'www.lovevoc.com');
INSERT Events (`EventID`, `OrganizerID`, `EventAddressID`, `EventName`, `PricePerGuest`, `Description`, `Website`) VALUES (11, 11, 26, N'dac', 100.0000, N'game', N'www.game.com');




INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (1, 1);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (2, 3);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (3, 4);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (4, 5);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (6, 6);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (7, 7);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (8, 8);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (9, 9);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (10, 10);
INSERT EventSchedule (`EventID`, `OrganizerID`) VALUES (11, 11);


INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (1, 6, 29, N'mirage', N'3282655667', N'free wifi');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (2, 7, 30, N'linQ', N'7899444572', N'five star ');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (3, 8, 31, N'treasure island', N'6796945635', N'comfort ');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (4, 11, 32, N'circus resort', N'4337992376', N'casino ');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (5, 9, 33, N'golden nugget', N'2679647457', N'show');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (6, 6, 29, N'trump international', N'3254699580', N'four star');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (7, 7, 30, N'rio casino', N'1246899927', N'casino');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (8, 8, 31, N'plaza hotel', N'6468232210', N'buffet');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (9, 11, 32, N'wynn las vegas', N'2339572015', N'fountain');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (10, 9, 33, N'renaissance ', N'1554219489', N'landscape');
INSERT Hotels (`HotelID`, `CityID`, `HotelAddressID`, `HotelName`, `PhoneNumber`, `Description`) VALUES (11, 6, 29, N'THE D', N'9854124321', N'show');


INSERT Restaurants (`RestaurantID`, `RestaurantAddressID`, `RestaurantName`, `PhoneNO`, `CityID`) VALUES (1, 13, N'The Taj Vivanta', N'233435', 2);
INSERT Restaurants (`RestaurantID`, `RestaurantAddressID`, `RestaurantName`, `PhoneNO`, `CityID`) VALUES (2, 18, N'Euphoria', N'5768565', 1);
INSERT Restaurants (`RestaurantID`, `RestaurantAddressID`, `RestaurantName`, `PhoneNO`, `CityID`) VALUES (3, 19, N'Papa Johns', N'5683433', 4);
INSERT Restaurants (`RestaurantID`, `RestaurantAddressID`, `RestaurantName`, `PhoneNO`, `CityID`) VALUES (4, 20, N'Wok N Tok', N'9568533', 4);



INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (1, 2, CAST(N'2012-08-17T00:00:00.000' AS DateTime(3)), 3, NULL, 1, 75.0000, 225.0000, CAST(N'2012-08-17T08:30:00.000' AS DateTime(3)), 1);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (2, 1, CAST(N'2012-09-08T00:00:00.000' AS DateTime(3)), 4, 3, 3, 58.0000, 232.0000, CAST(N'2012-09-08T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (3, 4, CAST(N'2012-01-13T00:00:00.000' AS DateTime(3)), 5, NULL, 1, 89.0000, 445.0000, CAST(N'2012-01-03T00:00:00.000' AS DateTime(3)), 3);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (4, 3, CAST(N'2012-06-07T00:00:00.000' AS DateTime(3)), 12, 4, 3, 50.0000, 600.0000, CAST(N'2012-06-07T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (5, 5, CAST(N'2014-05-16T00:00:00.000' AS DateTime(3)), 1, NULL, 1, 1000.0000, 1000.0000, CAST(N'2014-05-16T00:00:00.000' AS DateTime(3)), 2);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (6, 6, CAST(N'2014-05-20T00:00:00.000' AS DateTime(3)), 4, NULL, 1, 86.0000, 144.0000, CAST(N'2014-05-20T00:00:00.000' AS DateTime(3)), 4);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (7, 8, CAST(N'2015-09-06T00:00:00.000' AS DateTime(3)), 2, 7, 3, 90.0000, 180.0000, CAST(N'2015-09-06T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (8, 9, CAST(N'2015-07-15T00:00:00.000' AS DateTime(3)), 15, 8, 3, 1000.0000, 1500.0000, CAST(N'2015-07-15T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (9, 10, CAST(N'2016-01-01T00:00:00.000' AS DateTime(3)), 7, 9, 3, 75.0000, 515.0000, CAST(N'2016-01-01T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (10, 11, CAST(N'2016-07-03T00:00:00.000' AS DateTime(3)), 5, 10, 3, 50.0000, 250.0000, CAST(N'2016-01-01T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (11, 4, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), 4, 11, 3, 160.0000, 640.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (12, 1, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), 4, NULL, 2, 60.0000, 240.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (13, 3, CAST(N'2015-10-15T00:00:00.000' AS DateTime(3)), 2, NULL, 2, 100.0000, 200.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (14, 2, CAST(N'2012-09-10T00:00:00.000' AS DateTime(3)), 1, NULL, 2, 100.0000, 100.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (15, 5, CAST(N'2011-02-23T00:00:00.000' AS DateTime(3)), 1, NULL, 2, 60.0000, 60.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (16, 7, CAST(N'2013-01-23T00:00:00.000' AS DateTime(3)), 5, NULL, 2, 350.0000, 1750.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (17, 10, CAST(N'2016-11-17T00:00:00.000' AS DateTime(3)), 3, NULL, 2, 60.0000, 180.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);
INSERT Bookings (`BookingID`, `CustomerID`, `BookingDate`, `NoOfGuests`, `OrganizerID`, `BookingTypeID`, `UnitPrice`, `TotalPrice`, `TimeStamp`, `ResturantID`) VALUES (18, 9, CAST(N'2016-10-15T00:00:00.000' AS DateTime(3)), 4, NULL, 2, 35.0000, 140.0000, CAST(N'2016-12-13T00:00:00.000' AS DateTime(3)), NULL);


INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (1, N'visa');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (2, N'cash');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (3, N'paypal');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (4, N'master card');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (5, N'check');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (6, N'debit card');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (7, N'gift card');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (8, N'online');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (9, N'student card');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (10, N'other');
INSERT PaymentMethod (`PaymentMethodID`, `PaymentType`) VALUES (11, N'employee');



INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (1, CAST(N'2012-09-14T00:00:00.000' AS DateTime(3)), 2, 390.0000, 1200.0000, 1, 1, 1, CAST(N'2012-09-14T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (2, CAST(N'2012-12-31T00:00:00.000' AS DateTime(3)), 3, 1000.0000, 4000.0000, 2, 2, 2, CAST(N'2012-12-31T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (3, CAST(N'2013-04-09T00:00:00.000' AS DateTime(3)), 2, 230.0000, 500.0000, 3, 3, 3, CAST(N'2013-04-09T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (4, CAST(N'2013-05-26T00:00:00.000' AS DateTime(3)), 5, 430.0000, 2700.0000, 4, 4, 4, CAST(N'2013-05-26T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (5, CAST(N'2014-08-06T00:00:00.000' AS DateTime(3)), 8, 90.0000, 800.0000, 5, 5, 5, CAST(N'2014-08-06T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (6, CAST(N'2014-11-12T00:00:00.000' AS DateTime(3)), 7, 700.0000, 490.0000, 6, 6, 6, CAST(N'2014-11-12T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (7, CAST(N'2014-12-28T00:00:00.000' AS DateTime(3)), 1, 150.0000, 155.0000, 1, 7, 7, CAST(N'2014-12-28T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (8, CAST(N'2015-02-01T00:00:00.000' AS DateTime(3)), 6, 400.0000, 2900.0000, 1, 1, 8, CAST(N'2015-02-01T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (9, CAST(N'2015-07-13T00:00:00.000' AS DateTime(3)), 10, 250.0000, 4400.0000, 2, 2, 9, CAST(N'2015-07-13T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (10, CAST(N'2016-06-19T00:00:00.000' AS DateTime(3)), 4, 4000.0000, 17600.0000, 3, 3, 10, CAST(N'2016-06-19T00:00:00.000' AS DateTime(3)));
INSERT Orders (`OrderID`, `PaymentDate`, `Quantity`, `UnitPrice`, `TotalPrice`, `BookingID`, `PaymentMethodID`, `BillingAddressID`, `Timestamp`) VALUES (11, CAST(N'2016-07-19T00:00:00.000' AS DateTime(3)), 1, 390.0000, 390.0000, 4, 4, 11, CAST(N'2016-07-19T00:00:00.000' AS DateTime(3)));



INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (1, 1, 5, CAST(N'2011-05-22T00:00:00.000' AS DateTime(3)), CAST(N'2011-05-22T00:00:00.000' AS DateTime(3)), 1, NULL, NULL, N'french resturant');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (2, 2, 5, CAST(N'2011-06-17T00:00:00.000' AS DateTime(3)), CAST(N'2011-06-17T00:00:00.000' AS DateTime(3)), 2, NULL, NULL, N'chineses cusine');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (3, 3, 4, CAST(N'2011-12-13T00:00:00.000' AS DateTime(3)), CAST(N'2011-12-13T00:00:00.000' AS DateTime(3)), 1, NULL, NULL, N'hot and spicy');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (4, 4, 3, CAST(N'2012-03-11T00:00:00.000' AS DateTime(3)), CAST(N'2012-03-11T00:00:00.000' AS DateTime(3)), 2, NULL, NULL, N'frozen yogurt');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (5, 5, 2, CAST(N'2012-04-22T00:00:00.000' AS DateTime(3)), CAST(N'2012-04-22T00:00:00.000' AS DateTime(3)), 3, NULL, NULL, N'noodle');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (6, 6, 2, CAST(N'2012-09-17T00:00:00.000' AS DateTime(3)), CAST(N'2012-09-17T00:00:00.000' AS DateTime(3)), 4, NULL, NULL, N'soup');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (7, 7, 4, CAST(N'2013-02-01T00:00:00.000' AS DateTime(3)), CAST(N'2013-02-01T00:00:00.000' AS DateTime(3)), NULL, NULL, 4, N'Great Event and Friendly Event Organzers');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (8, 8, 5, CAST(N'2014-03-17T00:00:00.000' AS DateTime(3)), CAST(N'2014-03-17T00:00:00.000' AS DateTime(3)), NULL, NULL, 5, N'Very helpful & organized group');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (9, 9, 5, CAST(N'2015-04-12T00:00:00.000' AS DateTime(3)), CAST(N'2015-04-12T00:00:00.000' AS DateTime(3)), NULL, NULL, 1, N'traditional');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (10, 10, 4, CAST(N'2015-11-27T00:00:00.000' AS DateTime(3)), CAST(N'2015-11-27T00:00:00.000' AS DateTime(3)), NULL, NULL, 3, N'middle east');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (11, 11, 4, CAST(N'2016-05-30T00:00:00.000' AS DateTime(3)), CAST(N'2016-05-30T00:00:00.000' AS DateTime(3)), 3, NULL, NULL, N'awesom chicken dishes');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (12, 1, 5, CAST(N'2014-02-17T00:00:00.000' AS DateTime(3)), CAST(N'2014-02-17T00:00:00.000' AS DateTime(3)), NULL, NULL, 7, N'Very helpful & organized group');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (13, 2, 4, CAST(N'2015-01-27T00:00:00.000' AS DateTime(3)), CAST(N'2015-01-27T00:00:00.000' AS DateTime(3)), NULL, NULL, 8, N'Good Events');
INSERT Reviews (`ReviewID`, `CustomerID`, `Ratings`, `ReviewDate`, `Timestamp`, `RestaurantID`, `RoomID`, `OrganizerID`, `Description`) VALUES (14, 3, 3, CAST(N'2016-10-08T00:00:00.000' AS DateTime(3)), CAST(N'2016-10-08T00:00:00.000' AS DateTime(3)), NULL, NULL, 9, N'Good Location & experienced organizers');



INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (9, 1, N'single', 2, 1, 1, 1, N'sweet room', 1, N'50', 5.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (10, 2, N'suite', 4, 0, 1, 1, N'family', 0, N'100', 5.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (11, 3, N'king', 5, 1, 1, 1, N'loft', 0, N'60', 2.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (12, 4, N'king', 1, 1, 1, 1, N'perfect studio', 1, N'200', 3.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (13, 5, N'twin', 2, 0, 0, 0, N'natural friendly', 1, N'100', 10.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (14, 6, N'queen', 2, 1, 1, 1, N'pet ', 1, N'80', 4.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (15, 7, N'yard house', 3, 1, 1, 1, N'tree house', 1, N'150', 5.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (16, 8, N'single', 2, 1, 1, 1, N'large room', 1, N'100', 5.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (17, 9, N'suite', 2, 0, 0, 1, N'baby room', 0, N'35', 10.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (18, 10, N'yard house', 7, 1, 1, 1, N'mansion', 1, N'250', 2.0000);
INSERT Rooms (`RoomID`, `HotelID`, `RoomType`, `NoOfBeds`, `IsSmoking`, `IsAC`, `IsMiniBar`, `Description`, `IsPetFriendly`, `PricePerNight`, `AvailableRooms`) VALUES (19, 11, N'twin', 4, 1, 0, 0, N'three floor', 0, N'350', 5.0000);


INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (1, 21, CAST(N'2012-07-05T00:00:00.000' AS DateTime(3)), CAST(N'2012-07-07T00:00:00.000' AS DateTime(3)), 9, N'prudential');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (2, 22, CAST(N'2012-08-29T00:00:00.000' AS DateTime(3)), CAST(N'2012-08-29T00:00:00.000' AS DateTime(3)), 1, N'riverside');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (3, 23, CAST(N'2012-09-27T00:00:00.000' AS DateTime(3)), CAST(N'2012-09-30T00:00:00.000' AS DateTime(3)), 5, N'longwood');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (4, 24, CAST(N'2013-03-11T00:00:00.000' AS DateTime(3)), CAST(N'2013-03-11T00:00:00.000' AS DateTime(3)), 3, N'park');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (5, 25, CAST(N'2013-10-10T00:00:00.000' AS DateTime(3)), CAST(N'2013-11-11T00:00:00.000' AS DateTime(3)), 7, N'newton');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (6, 26, CAST(N'2013-12-22T00:00:00.000' AS DateTime(3)), CAST(N'2013-12-24T00:00:00.000' AS DateTime(3)), 8, N'church');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (7, 27, CAST(N'2014-09-28T00:00:00.000' AS DateTime(3)), CAST(N'2014-09-30T00:00:00.000' AS DateTime(3)), 3, N'hill');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (8, 28, CAST(N'2014-11-13T00:00:00.000' AS DateTime(3)), CAST(N'2014-11-15T00:00:00.000' AS DateTime(3)), 5, N'canyon');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (9, 21, CAST(N'2014-12-30T00:00:00.000' AS DateTime(3)), CAST(N'2015-01-09T00:00:00.000' AS DateTime(3)), 9, N'backbay');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (10, 22, CAST(N'2014-10-15T00:00:00.000' AS DateTime(3)), CAST(N'2014-10-24T00:00:00.000' AS DateTime(3)), 1, N'bay');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (11, 23, CAST(N'2015-03-12T00:00:00.000' AS DateTime(3)), CAST(N'2015-03-17T00:00:00.000' AS DateTime(3)), 5, N'sea port');
INSERT TouristAttractions (`PlaceID`, `PlaceAddressID`, `PreferedStartTime`, `PreferedEndTime`, `CityID`, `Name`) VALUES (12, 24, CAST(N'2015-04-16T00:00:00.000' AS DateTime(3)), CAST(N'2015-04-27T00:00:00.000' AS DateTime(3)), 3, N'seattle');



INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (11, 17, CAST(N'2013-11-11T00:00:00.000' AS DateTime(3)), CAST(N'2013-11-13T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (17, 18, CAST(N'2014-06-08T00:00:00.000' AS DateTime(3)), CAST(N'2014-06-13T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (11, 12, CAST(N'2014-06-02T00:00:00.000' AS DateTime(3)), CAST(N'2014-06-13T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (10, 13, CAST(N'2012-07-05T00:00:00.000' AS DateTime(3)), CAST(N'2012-07-10T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (10, 14, CAST(N'2013-05-04T00:00:00.000' AS DateTime(3)), CAST(N'2013-05-17T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (11, 15, CAST(N'2015-10-27T00:00:00.000' AS DateTime(3)), CAST(N'2015-10-30T00:00:00.000' AS DateTime(3)));
INSERT RoomBookings (`RoomID`, `BookingID`, `StartDate`, `EndDate`) VALUES (19, 16, CAST(N'2011-02-18T00:00:00.000' AS DateTime(3)), CAST(N'2011-02-20T00:00:00.000' AS DateTime(3)));


-- SQLINES DEMO *  organizers and their details
CREATE VIEW vw_EventOrganizerDetails
AS
SELECT   eo.OrganizerName,
				ad.AddressLine1 AS Address,
				eo.PhoneNo,
				ct.CityName,
				eo.Website   
FROM EventOrganizer AS eo
JOIN Address AS ad
	ON eo.OrganizerAddressID = ad.AddressID
JOIN Cities AS ct
	ON  ad.CityID = ct.CityID
ORDER BY `OrganizerName` ASC
LIMIT 20;
 

-- SQLINES DEMO *  100 hotel bookings based on hotels, ordered by the no. of bookings
CREATE VIEW vw_HotelMaxBookings
AS
SELECT  h.HotelName,
			   (SELECT CityName FROM Cities city
					WHERE city.CityID = h.CityID) CityName,
			   a.AddressLine1 Address,
			   h.PhoneNumber,
			   (SELECT COUNT(booking.BookingID)
					FROM RoomBookings booking
					WHERE r.RoomID = booking.RoomID) AS 'NumberOfBookings'
FROM Hotels h,
	 Rooms r,
	 Address a
WHERE h.HotelID = r.HotelID AND h.HotelAddressID = a.AddressID
ORDER BY `NumberOfBookings` DESC
LIMIT 20;



/* SQLINES DEMO *** pt column*********************/
CREATE TRIGGER tr_EncryptCustPhoneNo
ON Customers
AFTER INSERT AS
BEGIN
	 -- Create DMK
	 CREATE MASTER KEY
	 ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

	 -- SQLINES DEMO *** e to protect symmetric key
	 CREATE CERTIFICATE TestCertificate
	 WITH SUBJECT = 'BonVoyage Test Certificate',
	 EXPIRY_DATE = '2026-12-31';

	 -- SQLINES DEMO *** key to encrypt data
	 CREATE SYMMETRIC KEY TestSymmetricKey
	 WITH ALGORITHM = AES_128
	 ENCRYPTION BY CERTIFICATE TestCertificate;

	 -- Open symmetric key
	 OPEN SYMMETRIC KEY TestSymmetricKey DECRYPTION BY CERTIFICATE TestCertificate;

	 -- Insert 
	 UPDATE Customers SET `PhoneNumber`=(EncryptByKey(Key_GUID(N'TestSymmetricKey'), (SELECT `PhoneNumber` FROM inserted)))
	 WHERE CustomerID=(SELECT CustomerID FROM inserted);

	 -- SQLINES DEMO *** able with decrypted names
	 -- SQLINES DEMO ***  omers]
	 -- SQLINES DEMO ***   = DecryptByKey( [PhoneNumber]);

	 -- SQLINES DEMO *** ic key
	CLOSE SYMMETRIC KEY TestSymmetricKey;

	-- SQLINES DEMO *** c key
	DROP SYMMETRIC KEY TestSymmetricKey;

	-- SQLINES DEMO *** ate
	DROP CERTIFICATE TestCertificate;

	-- Drop the DMK
	DROP MASTER KEY;
END
GO