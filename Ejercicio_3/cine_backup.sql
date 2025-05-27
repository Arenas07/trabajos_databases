-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: cine
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `Formato_pelicula`
--

DROP TABLE IF EXISTS `Formato_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formato_pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_formato_proyeccion` int NOT NULL,
  `id_pelicula` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formato_proyeccion` (`id_formato_proyeccion`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `Formato_pelicula_ibfk_1` FOREIGN KEY (`id_formato_proyeccion`) REFERENCES `Formato_proyeccion` (`id`),
  CONSTRAINT `Formato_pelicula_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formato_pelicula`
--

LOCK TABLES `Formato_pelicula` WRITE;
/*!40000 ALTER TABLE `Formato_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formato_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formato_proyeccion`
--

DROP TABLE IF EXISTS `Formato_proyeccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formato_proyeccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formato` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formato_proyeccion`
--

LOCK TABLES `Formato_proyeccion` WRITE;
/*!40000 ALTER TABLE `Formato_proyeccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formato_proyeccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero_pelicula`
--

DROP TABLE IF EXISTS `Genero_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero_pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_genero` int NOT NULL,
  `id_pelicula` int NOT NULL,
  `cantidad_generos` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_genero` (`id_genero`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `Genero_pelicula_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `Genero` (`id`),
  CONSTRAINT `Genero_pelicula_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero_pelicula`
--

LOCK TABLES `Genero_pelicula` WRITE;
/*!40000 ALTER TABLE `Genero_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genero_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interprete`
--

DROP TABLE IF EXISTS `Interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interprete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `edad` int NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interprete`
--

LOCK TABLES `Interprete` WRITE;
/*!40000 ALTER TABLE `Interprete` DISABLE KEYS */;
/*!40000 ALTER TABLE `Interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interprete_pelicula`
--

DROP TABLE IF EXISTS `Interprete_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interprete_pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int NOT NULL,
  `id_interprete` int NOT NULL,
  `cantidad_interpretes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_interprete` (`id_interprete`),
  CONSTRAINT `Interprete_pelicula_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `Pelicula` (`id`),
  CONSTRAINT `Interprete_pelicula_ibfk_2` FOREIGN KEY (`id_interprete`) REFERENCES `Interprete` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interprete_pelicula`
--

LOCK TABLES `Interprete_pelicula` WRITE;
/*!40000 ALTER TABLE `Interprete_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Interprete_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Papel_interprete`
--

DROP TABLE IF EXISTS `Papel_interprete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Papel_interprete` (
  `id_tipo_papel` int NOT NULL,
  `id_interprete_pelicula` int NOT NULL,
  KEY `id_tipo_papel` (`id_tipo_papel`),
  KEY `id_interprete_pelicula` (`id_interprete_pelicula`),
  CONSTRAINT `Papel_interprete_ibfk_1` FOREIGN KEY (`id_tipo_papel`) REFERENCES `Tipo_papel` (`id`),
  CONSTRAINT `Papel_interprete_ibfk_2` FOREIGN KEY (`id_interprete_pelicula`) REFERENCES `Interprete_pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Papel_interprete`
--

LOCK TABLES `Papel_interprete` WRITE;
/*!40000 ALTER TABLE `Papel_interprete` DISABLE KEYS */;
/*!40000 ALTER TABLE `Papel_interprete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pelicula`
--

DROP TABLE IF EXISTS `Pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pais` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `duracion` int NOT NULL,
  `sinopsis` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `Pelicula_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pelicula`
--

LOCK TABLES `Pelicula` WRITE;
/*!40000 ALTER TABLE `Pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productor`
--

DROP TABLE IF EXISTS `Productor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  `experiencia` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productor`
--

LOCK TABLES `Productor` WRITE;
/*!40000 ALTER TABLE `Productor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Productor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productor_pelicula`
--

DROP TABLE IF EXISTS `Productor_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productor_pelicula` (
  `id_productor` int NOT NULL,
  `id_pelicula` int NOT NULL,
  `rol` varchar(20) NOT NULL,
  KEY `id_productor` (`id_productor`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `Productor_pelicula_ibfk_1` FOREIGN KEY (`id_productor`) REFERENCES `Productor` (`id`),
  CONSTRAINT `Productor_pelicula_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productor_pelicula`
--

LOCK TABLES `Productor_pelicula` WRITE;
/*!40000 ALTER TABLE `Productor_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Productor_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_papel`
--

DROP TABLE IF EXISTS `Tipo_papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_papel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_papel`
--

LOCK TABLES `Tipo_papel` WRITE;
/*!40000 ALTER TABLE `Tipo_papel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_papel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-27  2:41:17
