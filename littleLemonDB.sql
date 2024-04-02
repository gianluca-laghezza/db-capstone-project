-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bookingID` int NOT NULL,
  `date` date NOT NULL,
  `tableNumber` int NOT NULL,
  `customerID` int NOT NULL,
  `staffID` int NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `CustomerID_idx` (`customerID`),
  KEY `StaffID_idx` (`staffID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  CONSTRAINT `StaffID` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2024-04-01',2,1,1),(2,'2024-03-30',1,1,1),(3,'2024-02-02',5,3,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerID` int NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `phoneNumber` int NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe',203451292),(2,'Travis Perkins',33255343),(3,'Sophia Loren',39238564);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuItems`
--

DROP TABLE IF EXISTS `menuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuItems` (
  `menuItemsID` int NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `starterName` varchar(45) DEFAULT NULL,
  `dessertName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuItems`
--

LOCK TABLES `menuItems` WRITE;
/*!40000 ALTER TABLE `menuItems` DISABLE KEYS */;
INSERT INTO `menuItems` VALUES (1,'pasta','carpaccio','tiramisu'),(2,'pad thai','spring rolls','tea');
/*!40000 ALTER TABLE `menuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menuID` int NOT NULL,
  `menuItemsID` int NOT NULL,
  `cuisine` varchar(45) NOT NULL,
  `menuName` varchar(45) NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `menuItemsID_idx` (`menuItemsID`),
  CONSTRAINT `menuItemsID` FOREIGN KEY (`menuItemsID`) REFERENCES `menuItems` (`menuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'italian','italian menu'),(2,2,'thai','thai menu');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderStatus`
--

DROP TABLE IF EXISTS `orderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderStatus` (
  `orderID` int NOT NULL,
  `deliveryDate` date NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`orderID`),
  CONSTRAINT `OrderID` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderStatus`
--

LOCK TABLES `orderStatus` WRITE;
/*!40000 ALTER TABLE `orderStatus` DISABLE KEYS */;
INSERT INTO `orderStatus` VALUES (1,'2024-02-02','ready'),(2,'2024-04-01','preparing');
/*!40000 ALTER TABLE `orderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int NOT NULL,
  `date` date NOT NULL,
  `quantity` int NOT NULL,
  `totalCost` decimal(5,2) DEFAULT NULL,
  `customerID` int NOT NULL,
  `menuID` int NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `MenuItemID_idx` (`menuID`),
  KEY `customerID_idx` (`customerID`),
  CONSTRAINT `customerID_orders` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  CONSTRAINT `menuID` FOREIGN KEY (`menuID`) REFERENCES `menus` (`menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-02-02',5,500.00,3,1),(2,'2024-04-01',2,200.00,1,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL,
  `role` varchar(45) NOT NULL,
  `salary` int NOT NULL,
  `staffName` varchar(100) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'manager',60000,'Alex Scazz'),(2,'waiter',50000,'Joe Sticazzi'),(3,'chef',40000,'Francois Dupall');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-02 17:58:29
