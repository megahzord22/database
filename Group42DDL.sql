/*

		***************************************************
		*                 TABLE CREATION                  *
		***************************************************
    
*/

SET FOREIGN_KEY_CHECKS 	= 0;
SET AUTOCOMMIT 			= 0;

/*
	Create Customers Table
*/

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	customerID		INT 			NOT NULL AUTO_INCREMENT,
    firstName		VARCHAR(255) 	NOT NULL,
    lastName		VARCHAR(255)	NOT NULL,
    phoneNumber		CHAR(10)		,
    streetAddress	VARCHAR(255)	NOT NULL,
    streetAddress2	VARCHAR(255)	,
    city			VARCHAR(255)	NOT NULL,
    state			TEXT(2)			NOT NULL,
    zip				CHAR(5)			NOT NULL,
    emailAddress	VARCHAR(255)	,
    PRIMARY KEY		(customerID)
);

/*
	Create Sales Table
*/

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales(
	orderID			INT				NOT NULL AUTO_INCREMENT,
    orderDate		DATE			NOT NULL,
    customerID		INT				NOT NULL,
    PRIMARY KEY		(orderID)		,
    FOREIGN KEY		(customerID)	REFERENCES Customers(customerID)
    ON DELETE CASCADE
);

/*
	Create ProductTypes Table
*/

DROP TABLE IF EXISTS ProductTypes;
CREATE TABLE ProductTypes(
	productTypeID	INT				NOT NULL AUTO_INCREMENT,
    typeName		VARCHAR(255)	NOT NULL,
    typeDescription	VARCHAR(255)	NOT NULL,
    PRIMARY KEY		(productTypeID)
);

/*
	Create Suppliers Table
*/

DROP TABLE IF EXISTS Suppliers;
CREATE TABLE Suppliers(
	supplierID		INT				NOT NULL AUTO_INCREMENT,
    name			VARCHAR(255)	NOT NULL,
    phoneNumber		CHAR(10)		NOT NULL,
    emailAddress	VARCHAR(255)	NOT NULL,
    streetAddress	VARCHAR(255)	NOT NULL,
    streetAddress2	VARCHAR(255)	,
    city			VARCHAR(255)	NOT NULL,
    state			TEXT(2)			NOT NULL,
    zip				CHAR(5)			NOT NULL,
    PRIMARY KEY		(supplierID)
);

/*
	Create Products Table
*/

DROP TABLE IF EXISTS Products;
CREATE TABLE Products(
	productID		INT				NOT NULL AUTO_INCREMENT,
    name			VARCHAR(255)	NOT NULL,
    storeCost		DECIMAL(10,2)	NOT NULL,
    salePrice		DECIMAL(10,2)	NOT NULL,
    developer		VARCHAR(255)	,
    publisher		VARCHAR(255)	,
    productTypeID	INT				,
    supplierID		INT				NOT NULL,
    PRIMARY KEY		(productID),
    FOREIGN KEY		(productTypeID)	REFERENCES	ProductTypes(productTypeID)
    ON DELETE CASCADE,
    FOREIGN KEY		(supplierID)	REFERENCES	Suppliers(supplierID)
    ON DELETE CASCADE
);

/*
	Create SalesDetails Table
*/

DROP TABLE IF EXISTS SalesDetails;
CREATE TABLE SalesDetails(
	saleDetailID	INT				NOT NULL AUTO_INCREMENT,
    orderID			INT				NOT NULL,
    productID		INT				NOT NULL,
    qtyPurchased	INT				NOT NULL,
    PRIMARY KEY		(saleDetailID),
    FOREIGN KEY		(orderID)			REFERENCES	Sales(orderID)
    ON DELETE CASCADE,
    FOREIGN KEY		(productID)		REFERENCES	Products(productID)
    ON DELETE CASCADE
);

/*

		******************************************************
		*                 INSERT SAMPLE DATA                 *
		******************************************************
        
*/

/*
	Insert sample data into Customers table.
*/

INSERT INTO Customers(
    firstName,
    lastName,
    phoneNumber,
    streetAddress,
    streetAddress2,
    city,
    state,
    zip,
    emailAddress
)
VALUES
('Tyrell', 	'Verley', 		4065555555, '123 Main St.', 	NULL, 		'Missoula', 'MT', 59801, 'verleyt@oregonstate.edu'),
('Megan', 	'Grant', 		5555453333, '675 2nd Ave.', 	NULL, 		'Lolo', 	'MT', 59814, NULL),
('Shelby', 	'Bellander', 	7757777777, '123 Main St.', 	NULL, 		'Missoula', 'MT', 59801, NULL),
('John', 	'Doe', 			3333334444, '421 S. 3rd St.', 	'Apt. 22', 	'Missoula', 'MT', 59808, 'jdoe@gmail.com'),
('Jane', 	'Doe', 			3357780900, '1090 Cote Ln.', 	NULL, 		'Missoula', 'MT', 59804, 'jane@yahoo.com');

/*
	Insert sample data into ProductTypes table.
*/

INSERT INTO ProductTypes(
    typeName,
    typeDescription
)
VALUES
('game', 		'A video game.'),
('chair', 		'Desk, Office, and Gaming chairs.'),
('controller', 	'A controller made for gaming.'),
('headset', 	'Headsets designed primarily for gaming'),
('charger', 	'Various charging devices fall into this category.');

/*
	Insert sample data into Suppliers table.
*/

INSERT INTO Suppliers(
    name,
    phoneNumber,
    emailAddress,
    streetAddress,
    streetAddress2,
    city,
    state,
    zip
)
VALUES
('GamTech', 			5553335555, 'shipping@gamtech.org', 		'243 2nd st.', 		 NULL,			'Eugene', 		'OR', 54832),
('NinjaGo', 			5252235555, 'shipping@ninjago.com', 		'334 3rd st.', 	 	 'Suite 483', 	'Denver', 		'CO', 88832),
('BigBucks', 		9453335525, 'shipping@bigbucks.org', 		'342 N. Highland.',	 NULL, 			'Las Vegas', 	'NV', 22832),
('GargoyleLimited', 	3943235335, 'shipping@gargoylelimited.com', '4444 Big Horn Rd.', 'Apt. 35', 	'Spokane', 		'WA', 39832),
('Hammer', 			2533336585, 'shipping@hammer.com', 			'6000 Central Blvd', NULL, 			'Helena', 		'MT', 99831);

/*
	Insert sample data into Products table.
*/

INSERT INTO Products(
    name,
    storeCost,
    salePrice,
    developer,
    publisher,
    productTypeID,
    supplierID
)
VALUES
('Horizon Zero Dawn', 				45.15, 70.05, 		'Guerilla Games', 		'Sony', 	1,		3), 
('Grey Fluffy Chair', 				100.89, 700.05, 	NULL, 					NULL, 		2,		5), 
('Xbox Controller', 				30.45, 50.22, 		NULL, 					NULL, 		3,		4), 
('God of War', 						40.15, 60.15, 		'Santa Monica Studios', 'Sony', 	1,		5), 
('Playstation controller charger', 	20.45, 30.15, 		NULL, 					NULL, 		5,		2);

/*
	Insert sample data into Sales table.
*/

INSERT INTO Sales(
    orderDate,
    customerID
)
VALUES
('2021-03-09', 	1), 
('2022-05-19', 	2), 
('2023-01-29', 	3), 
('2021-05-20', 	1), 
('2023-03-07', 	4);

/*
	Insert sample data into SalesDetails table.
*/

INSERT INTO SalesDetails(
	saleDetailID,
    orderID,
    productID,
    qtyPurchased
)
VALUES
(1, 1, 5, 2), 
(2, 2, 3, 4), 
(3, 3, 2, 1), 
(4, 1, 3, 6), 
(5, 5, 2, 1);


SET FOREIGN_KEY_CHECKS = 1;
COMMIT;