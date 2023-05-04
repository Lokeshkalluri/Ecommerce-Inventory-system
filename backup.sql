-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerceinventorysystem
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `cust_order_v`
--

DROP TABLE IF EXISTS `cust_order_v`;
/*!50001 DROP VIEW IF EXISTS `cust_order_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cust_order_v` AS SELECT 
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `SaleQuantity`,
 1 AS `OrderStatus`,
 1 AS `OrderDate`,
 1 AS `OrderTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `CustomerEmail_idx` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Carlos','Rose','carloscrose@gmail.com',973618995),(2,'Alicia','Teagu','aliciateague@gmail.com',267119462),(3,'Lachlan','Goyder','lachlangoyder@gmail.com',756963555),(4,'Finn','Felan','finnfelan@gmail.com',261764408),(5,'Ben','Brumby','benbrumby@gmail.com',393383073),(6,'John','Doe','johndoe@gmail.com',816793696);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeraddress`
--

DROP TABLE IF EXISTS `customeraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customeraddress` (
  `AddressID` int(11) NOT NULL,
  `StreetNumber` varchar(10) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `CustomerAddress_Customer` (`CustomerID`),
  CONSTRAINT `CustomerAddress_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeraddress`
--

LOCK TABLES `customeraddress` WRITE;
/*!40000 ALTER TABLE `customeraddress` DISABLE KEYS */;
INSERT INTO `customeraddress` VALUES (1,'600 Oliver','Crowley','TX','76036',2),(2,'1548 Walke','Northbrook','IL','60062',1),(3,'3152 Water','Concord','CA','94520',3);
/*!40000 ALTER TABLE `customeraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emp_sale_quantity_v`
--

DROP TABLE IF EXISTS `emp_sale_quantity_v`;
/*!50001 DROP VIEW IF EXISTS `emp_sale_quantity_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emp_sale_quantity_v` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `ProductName`,
 1 AS `Category`,
 1 AS `SalePrice`,
 1 AS `SaleQuantitySum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Harry','Lort','harrylort@gmail.com',26197252),(2,'Bob','Johnson','bjohnson@gmail.com',789456123),(3,'Sarah','Jones','sjones@gmail.com',234567890),(4,'Mike','Williams','mikewilliams@gmail.com',567890134),(5,'Audrey','Proeschel','audreyproeschel@gmail.com',24009994);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `OrderTotal` int(11) NOT NULL,
  `PaymentMethod` varchar(15) NOT NULL,
  `DeliveryAddress` varchar(40) NOT NULL,
  `OrderStatus` varchar(15) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Orders_Customer` (`CustomerID`),
  KEY `Orders_Products` (`ProductID`),
  KEY `OrderStatus_idx` (`OrderStatus`),
  CONSTRAINT `Orders_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `Orders_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-02-01',50,'Credit Card','47 Shirley Street Highland Park','Processing',65,3),(2,'2023-02-22',75,'PayPal','29 Chester Street Yelgun','Shipped',12,2),(3,'2023-05-14',100,'Cash','4781 Finwood Road Spotswood','Pending',23,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sales`
--

DROP TABLE IF EXISTS `product_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sales` (
  `Product_Sales_ID` int(11) NOT NULL,
  `SaleID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`Product_Sales_ID`),
  KEY `Product_Sales_Products` (`ProductID`),
  KEY `Product_Sales_Sales` (`SaleID`),
  CONSTRAINT `Product_Sales_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `Product_Sales_Sales` FOREIGN KEY (`SaleID`) REFERENCES `sales` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sales`
--

LOCK TABLES `product_sales` WRITE;
/*!40000 ALTER TABLE `product_sales` DISABLE KEYS */;
INSERT INTO `product_sales` VALUES (1,1031,12),(3,1031,65);
/*!40000 ALTER TABLE `product_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(30) NOT NULL,
  `ProductDescription` varchar(90) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `QuantityAvailable` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Products_Suppliers` (`SupplierID`),
  CONSTRAINT `Products_Suppliers` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (12,'iPhone11','Latest Apple iPhone with the latest features','Electronics',899,10,1001),(17,'Smartphone','A high-quality smartphone advanced features','Electronics',500,100,1004),(23,'Adidas Cloudfoam Shoes','Stylish shoes from Adidas','Shoes',70,40,1002),(28,'Smartphones','Great offers, discounts, and deals','Gadgets',459,20,1001),(35,'Nike Air Max','Latest running shoes from Nike','Shoes',486,25,1003),(65,'Sony 65 Inch 4K UHD TV','65-inch 4K UHD TV from Sony','Electronics',799,5,1003);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SaleID` int(11) NOT NULL,
  `SaleDate` date NOT NULL,
  `SaleQuantity` int(11) NOT NULL,
  `SalePrice` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `Sales_Employees` (`EmployeeID`),
  KEY `Sales_Orders` (`OrderID`),
  KEY `SaleQuantity_idx` (`SaleQuantity`),
  CONSTRAINT `Sales_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `Sales_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1030,'2023-01-20',15,50,2,4),(1031,'2023-03-15',22,88,3,1),(1032,'2023-04-10',100,78,1,5),(1033,'2023-03-25',18,48,1,2);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Product_Quantity_T` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    UPDATE Products
    SET QuantityAvailable = QuantityAvailable - NEW.SaleQuantity
    WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `ShipmentID` int(11) NOT NULL,
  `ShipmentDate` date NOT NULL,
  `DeliveryAddress` varchar(30) NOT NULL,
  `ShipmentStatus` varchar(30) NOT NULL,
  `SaleID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  KEY `Shipment_Employees` (`EmployeeID`),
  KEY `Shipment_Sales` (`SaleID`),
  CONSTRAINT `Shipment_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `Shipment_Sales` FOREIGN KEY (`SaleID`) REFERENCES `sales` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'2023-01-10','29 Chester Street','Shipped',1032,4),(2,'2023-02-18','79 Grayson Street','Pending',1031,1),(4,'2023-03-02','4781 Finwood Road','Pending',1030,3);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(40) NOT NULL,
  `ContactName` varchar(30) NOT NULL,
  `EmailAddress` varchar(40) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Address` varchar(40) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1001,'Buy Bulk Liquidation Pallets','John Smith','john@gmail.com',301123567,'13 Kerma Crescent Ben Bullen'),(1002,'General Merchandise Inventory','Mikayla Nicoll','mikaylanicoll@gmail.com',954235678,'5 Raglan Street Wrattens Forest'),(1003,'Truckloads of Mixed Merchandise','Sofia McWilliams','sofiamc@gmail.com',617346789,'38 Elizabeth Street'),(1004,'Direct Liquidation Pallets','Jasper Broun','jasperbroun@gmail.com',415567890,'96 South Molle Boulevard');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cust_order_v`
--

/*!50001 DROP VIEW IF EXISTS `cust_order_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cust_order_v` AS select `c`.`FirstName` AS `FirstName`,`c`.`LastName` AS `LastName`,`s`.`SaleQuantity` AS `SaleQuantity`,`o`.`OrderStatus` AS `OrderStatus`,`o`.`OrderDate` AS `OrderDate`,`o`.`OrderTotal` AS `OrderTotal` from ((`customer` `c` join `orders` `o`) join `sales` `s`) where ((`c`.`CustomerID` = `o`.`CustomerID`) and (`o`.`OrderID` = `s`.`OrderID`) and (`s`.`SaleQuantity` > 15)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emp_sale_quantity_v`
--

/*!50001 DROP VIEW IF EXISTS `emp_sale_quantity_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_sale_quantity_v` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`p`.`ProductName` AS `ProductName`,`p`.`Category` AS `Category`,`s`.`SalePrice` AS `SalePrice`,sum(`s`.`SaleQuantity`) AS `SaleQuantitySum` from (((`employees` `e` join `sales` `s`) join `products` `p`) join `product_sales` `ps`) where ((`e`.`EmployeeID` = `s`.`EmployeeID`) and (`s`.`SaleID` = `ps`.`SaleID`) and (`ps`.`ProductID` = `p`.`ProductID`)) group by `e`.`EmployeeID`,`e`.`FirstName`,`p`.`ProductName`,`p`.`Category`,`s`.`SalePrice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 18:58:14
