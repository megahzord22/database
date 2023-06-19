/*
	*********************************************
    *				SELECT QUERIES				*
    *********************************************
    
    These are the queries we will use to display all of our DB information in each
    of our HTML tables.
*/

/*
		SELECT from Customers Table
*/

SELECT		*
FROM 		Customers;

/*
		SELECT from Suppliers Table
*/

SELECT 		*
FROM 		Suppliers;

/*
		SELECT from ProductTypes table
*/

SELECT 		* 
FROM 		ProductTypes;

/*
		SELECT from Sales table
			Requires inner join with Customers to display customer information
*/

SELECT 		Sales.orderID, Sales.orderDate, Customers.firstName, Customers.lastName, Customers.phoneNumber
FROM 		Sales
INNER JOIN 	Customers ON Sales.customerID = Customers.customerID
ORDER BY 	Sales.orderDate DESC;

/*
		SELECT from Products table
			Requires inner join with Suppliers and ProductTypes to display their respective information
*/

SELECT 		Products.productID, Products.name, Products.storeCost, Products.salePrice, Products.developer, Products.publisher, Suppliers.name
FROM 		Products
INNER JOIN 	ProductTypes
ON			Products.productTypeID = ProductTypes.productTypeID
INNER JOIN	Suppliers
ON			Products.supplierID = Suppliers.supplierID
ORDER BY	Products.name ASC;


/*
		SELECT from SalesDetails
*/
SELECT 		SalesDetails.saleDetailID, Sales.orderDate, Sales.orderID, Customers.firstName, Customers.lastName, Products.name AS productName, Products.salePrice, SalesDetails.qtyPurchased
FROM 		SalesDetails
INNER JOIN	Sales
ON			SalesDetails.orderID = Sales.orderID
INNER JOIN 	Customers
ON 			Sales.customerID = Customers.customerID
INNER JOIN 	Products
ON			SalesDetails.productID = Products.productID
ORDER BY 	Sales.orderID ASC;
/*
	*********************************************
    *				INSERT QUERIES				*
    *********************************************
    
    These are the queries that we will use to enter new records into our DB.
*/

/*
		INSERT into Customers table
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
VALUES(
	{data.fname},
	{data.lname},
	{data.phone},
	{data.address1},
	{data.address2},
	{data.city},
	{data.state},
	{data.zip},
	{data.email});   
            
/*
		INSERT into Sales table
*/

INSERT INTO Sales(
	orderDate,
    customerID
)
VALUES(
	{data.orderdate},
    {data.customerID}
	);  
/*
		INSERT into SalesDetails table
*/

INSERT INTO SalesDetails(
	orderID, 
    productID,
    qtyPurchased
)
VALUES(
	{data.orderID},
	{data.productID},
	{data.qty}
    );  
    
    
    /*
		INSERT into Suppliers table
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
VALUES(
	{data.name},
	{data.phone},
	{data.email},
	{data.address1},
	{data.address2},
	{data.city},
	{data.state},
	{data.zip}
	);  
    
    
    /*
		INSERT into Products table
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
VALUES(
	{data.name},
	{data.cost},
	{data.price},
	{data.developer},
	{data.publisher},
	{data.productTypeID},
	{data.supplierID}
	);  
    
    /*
		INSERT into ProductTypes table
*/

INSERT INTO ProductTypes(
	typeName,
    typeDescription
)
VALUES(
	{data.name},
	{data.description}
	);  


/*
	*********************************************
    *				UPDATE QUERIES				*
    *********************************************
    
    These are the queries we will use to edit records in our DB.
*/

/*
		UPDATE Sales table
*/
		UPDATE Sales SET orderID = 'orderid', orderDate = 'date', customerID = 'customerid';



/*
	*********************************************
    *				DELETE QUERIES				*
    *********************************************
    
   These are the queries we will use to delete records in our DB.
*/

/*
        DELETE from SalesDetails table
        Represents partial refund
*/

DELETE FROM SalesDetails WHERE SalesDetails.orderID = {data.id};

/*
        DELETE from Sales
        Represents full refund
        Need to handle all corresponding SalesDetails records
*/

DELETE FROM Sales WHERE Sales.orderID = {data.orderID};