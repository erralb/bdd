-- MySQL dump 10.13  Distrib 8.4.2, for macos14.4 (x86_64)
--
-- Host: localhost    Database: filrouge
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `numero` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `codePostal` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `categorie` varchar(2) DEFAULT NULL,
  `compte` float DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Lebreton','Éléonore','6 avenue Françoise Olivier','38240','Meylan','0776059929','A1',10000),(2,'Vasseur','Georges','54, avenue Jean','38000','Grenoble','+33 1 44 68 49 74','B2',1903),(3,'Da Costa','Léon','18, boulevard Brigitte Faivre','75000','Paris','0568740044','C3',-1500),(4,'Rey','Michel','49, avenue de Adam','38220','Vizille',NULL,'B1',3251),(5,'Weiss','Dominique','98, boulevard Remy','59000','Lille',NULL,'B2',0),(6,'Berlioz','Diane','27 avenue de la Chartreuse','75000','Paris',NULL,NULL,123094);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commandes`
--

DROP TABLE IF EXISTS `Commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commandes` (
  `numero` int NOT NULL,
  `numeroClient` int DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `numeroClient_idx` (`numeroClient`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`numeroClient`) REFERENCES `Clients` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commandes`
--

LOCK TABLES `Commandes` WRITE;
/*!40000 ALTER TABLE `Commandes` DISABLE KEYS */;
INSERT INTO `Commandes` VALUES (1,1,'2024-02-01','livrée'),(2,1,'2024-03-15','livrée'),(3,3,'2024-04-28','livrée'),(4,4,'2024-06-24','annulée'),(5,5,'2024-06-30','en cours'),(6,5,'2024-07-12','en cours'),(7,4,'2024-08-19','annulée');
/*!40000 ALTER TABLE `Commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Details`
--

DROP TABLE IF EXISTS `Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Details` (
  `numeroCommande` int NOT NULL,
  `numeroProduit` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`numeroCommande`,`numeroProduit`),
  KEY `numeroProduit` (`numeroProduit`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`numeroCommande`) REFERENCES `Commandes` (`numero`),
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`numeroProduit`) REFERENCES `Produits` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Details`
--

LOCK TABLES `Details` WRITE;
/*!40000 ALTER TABLE `Details` DISABLE KEYS */;
INSERT INTO `Details` VALUES (1,1,3),(1,2,1),(1,3,1),(2,4,1),(2,5,1),(3,1,4),(3,2,1),(3,3,2),(3,4,1),(3,5,1),(4,1,7),(4,2,1),(5,1,2),(5,2,1),(5,3,1),(6,1,10),(7,1,1);
/*!40000 ALTER TABLE `Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produits`
--

DROP TABLE IF EXISTS `Produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produits` (
  `numero` int NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produits`
--

LOCK TABLES `Produits` WRITE;
/*!40000 ALTER TABLE `Produits` DISABLE KEYS */;
INSERT INTO `Produits` VALUES (1,'T-shirt',25,30),(2,'Pantalon',60,50),(3,'Chaussures',120,100),(4,'Casquette',15,10),(5,'Sac à dos',80,5);
/*!40000 ALTER TABLE `Produits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 11:28:12
