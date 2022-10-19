-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: turi
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oteli`
--

DROP TABLE IF EXISTS `oteli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oteli` (
  `id_otelya` int NOT NULL,
  `nazvanie` varchar(45) NOT NULL,
  `zvezdi` varchar(45) NOT NULL,
  PRIMARY KEY (`id_otelya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oteli`
--

LOCK TABLES `oteli` WRITE;
/*!40000 ALTER TABLE `oteli` DISABLE KEYS */;
/*!40000 ALTER TABLE `oteli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitanie`
--

DROP TABLE IF EXISTS `pitanie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pitanie` (
  `id_pitanie` int NOT NULL,
  `tip_pitaniya` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pitanie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitanie`
--

LOCK TABLES `pitanie` WRITE;
/*!40000 ALTER TABLE `pitanie` DISABLE KEYS */;
/*!40000 ALTER TABLE `pitanie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipi_turov`
--

DROP TABLE IF EXISTS `tipi_turov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipi_turov` (
  `id_tipi_turov` int NOT NULL,
  `klassifikacia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipi_turov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipi_turov`
--

LOCK TABLES `tipi_turov` WRITE;
/*!40000 ALTER TABLE `tipi_turov` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipi_turov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turi`
--

DROP TABLE IF EXISTS `turi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turi` (
  `id_turi` int NOT NULL,
  `uslugi` varchar(1500) NOT NULL,
  `dlitelnost` varchar(45) NOT NULL,
  `nazvanie` varchar(128) NOT NULL,
  `stoimost` varchar(45) NOT NULL,
  PRIMARY KEY (`id_turi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turi`
--

LOCK TABLES `turi` WRITE;
/*!40000 ALTER TABLE `turi` DISABLE KEYS */;
/*!40000 ALTER TABLE `turi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zayavka`
--

DROP TABLE IF EXISTS `zayavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zayavka` (
  `id_zayavka` int NOT NULL,
  PRIMARY KEY (`id_zayavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zayavka`
--

LOCK TABLES `zayavka` WRITE;
/*!40000 ALTER TABLE `zayavka` DISABLE KEYS */;
/*!40000 ALTER TABLE `zayavka` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 13:44:53
