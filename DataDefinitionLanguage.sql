-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-10 05:43:06.635

-- tables
-- Table: Customer
CREATE TABLE Customer (
    CustomerID int  NOT NULL,
    FirstName varchar(20)  NOT NULL,
    LastName varchar(20)  NOT NULL,
    EmailAddress varchar(30)  NOT NULL,
    PhoneNumber int  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (CustomerID)
);

-- Table: CustomerAddress
CREATE TABLE CustomerAddress (
    AddressID int  NOT NULL,
    StreetNumber varchar(10)  NOT NULL,
    City varchar(20)  NOT NULL,
    State varchar(20)  NOT NULL,
    ZipCode varchar(10)  NOT NULL,
    CustomerID int  NOT NULL,
    CONSTRAINT CustomerAddress_pk PRIMARY KEY (AddressID)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID int  NOT NULL,
    FirstName varchar(20)  NOT NULL,
    LastName varchar(20)  NOT NULL,
    EmailAddress varchar(30)  NOT NULL,
    PhoneNumber int  NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (EmployeeID)
);

-- Table: Inventory
CREATE TABLE Inventory (
    InventoryID int  NOT NULL,
    QuantityReceived int  NOT NULL,
    DateReceived date  NOT NULL,
    PurchasePrice int  NOT NULL,
    SupplierID int  NOT NULL,
    CONSTRAINT Inventory_pk PRIMARY KEY (InventoryID)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID int  NOT NULL,
    OrderDate date  NOT NULL,
    OrderTotal decimal(6,2)  NOT NULL,
    PaymentMethod varchar(15)  NOT NULL,
    DeliveryAddress varchar(40)  NOT NULL,
    OrderStatus varchar(15)  NOT NULL,
    CustomerID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY (OrderID)
);

-- Table: Products
CREATE TABLE Products (
    ProductID int  NOT NULL,
    ProductName varchar(30)  NOT NULL,
    ProductDescription varchar(50)  NOT NULL,
    Category varchar(20)  NOT NULL,
    Price int  NOT NULL,
    QuantityAvailable int  NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY (ProductID)
);

-- Table: Sales
CREATE TABLE Sales (
    SaleID int  NOT NULL,
    SaleDate date  NOT NULL,
    SaleQuantity int  NOT NULL,
    SalePrice int  NOT NULL,
    ProductID int  NOT NULL,
    OrderID int  NOT NULL,
    EmployeeID int  NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY (SaleID)
);

-- Table: Shipment
CREATE TABLE Shipment (
    ShipmentID int  NOT NULL,
    ShipmentDate date  NOT NULL,
    DeliveryAddress varchar(30)  NOT NULL,
    ShipmentStatus varchar(20)  NOT NULL,
    SaleID int  NOT NULL,
    EmployeeID int  NOT NULL,
    CONSTRAINT Shipment_pk PRIMARY KEY (ShipmentID)
);

-- Table: Suppliers
CREATE TABLE Suppliers (
    SupplierID int  NOT NULL,
    SupplierName varchar(40)  NOT NULL,
    ContactName varchar(30)  NOT NULL,
    EmailAddress varchar(30)  NOT NULL,
    PhoneNumber int  NOT NULL,
    Address varchar(40)  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT Suppliers_pk PRIMARY KEY (SupplierID)
);

-- foreign keys
-- Reference: CustomerAddress_Customer (table: CustomerAddress)
ALTER TABLE CustomerAddress ADD CONSTRAINT CustomerAddress_Customer FOREIGN KEY CustomerAddress_Customer (CustomerID)
    REFERENCES Customer (CustomerID);

-- Reference: Inventory_Suppliers (table: Inventory)
ALTER TABLE Inventory ADD CONSTRAINT Inventory_Suppliers FOREIGN KEY Inventory_Suppliers (SupplierID)
    REFERENCES Suppliers (SupplierID);

-- Reference: Orders_Customer (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_Customer FOREIGN KEY Orders_Customer (CustomerID)
    REFERENCES Customer (CustomerID);

-- Reference: Orders_Products (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_Products FOREIGN KEY Orders_Products (ProductID)
    REFERENCES Products (ProductID);

-- Reference: Sales_Employees (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Employees FOREIGN KEY Sales_Employees (EmployeeID)
    REFERENCES Employees (EmployeeID);

-- Reference: Sales_Orders (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Orders FOREIGN KEY Sales_Orders (OrderID)
    REFERENCES Orders (OrderID);

-- Reference: Sales_Products (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Products FOREIGN KEY Sales_Products (ProductID)
    REFERENCES Products (ProductID);

-- Reference: Shipment_Employees (table: Shipment)
ALTER TABLE Shipment ADD CONSTRAINT Shipment_Employees FOREIGN KEY Shipment_Employees (EmployeeID)
    REFERENCES Employees (EmployeeID);

-- Reference: Shipment_Sales (table: Shipment)
ALTER TABLE Shipment ADD CONSTRAINT Shipment_Sales FOREIGN KEY Shipment_Sales (SaleID)
    REFERENCES Sales (SaleID);

-- Reference: Suppliers_Products (table: Suppliers)
ALTER TABLE Suppliers ADD CONSTRAINT Suppliers_Products FOREIGN KEY Suppliers_Products (ProductID)
    REFERENCES Products (ProductID);

-- End of file.
