-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: deportes
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
-- Table structure for table `Arbitro`
--

DROP TABLE IF EXISTS `Arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Arbitro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `disponibilidad` tinyint NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arbitro`
--

LOCK TABLES `Arbitro` WRITE;
/*!40000 ALTER TABLE `Arbitro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asistencia`
--

DROP TABLE IF EXISTS `Asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asistencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_jugador` int NOT NULL,
  `id_encuentro` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jugador` (`id_jugador`),
  KEY `id_encuentro` (`id_encuentro`),
  CONSTRAINT `Asistencia_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`),
  CONSTRAINT `Asistencia_ibfk_2` FOREIGN KEY (`id_encuentro`) REFERENCES `Encuentro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asistencia`
--

LOCK TABLES `Asistencia` WRITE;
/*!40000 ALTER TABLE `Asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Barrio`
--

DROP TABLE IF EXISTS `Barrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Barrio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ciudad` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `Barrio_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `Ciudad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Barrio`
--

LOCK TABLES `Barrio` WRITE;
/*!40000 ALTER TABLE `Barrio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Barrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cancha`
--

DROP TABLE IF EXISTS `Cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cancha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `disponible` tinyint NOT NULL,
  `capacidad_espectadores` int NOT NULL,
  `id_complejo_deportivo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipo` (`id_complejo_deportivo`),
  CONSTRAINT `fk_equipo` FOREIGN KEY (`id_complejo_deportivo`) REFERENCES `Complejo_deportivo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cancha`
--

LOCK TABLES `Cancha` WRITE;
/*!40000 ALTER TABLE `Cancha` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `edad_minima` int NOT NULL,
  `edad_maxima` int NOT NULL,
  `genero` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_departamento` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `codigo_postal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_postal` (`codigo_postal`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `Ciudad_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `Departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club`
--

DROP TABLE IF EXISTS `Club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Club` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_miembro_club` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_miembro_club` (`id_miembro_club`),
  CONSTRAINT `Club_ibfk_1` FOREIGN KEY (`id_miembro_club`) REFERENCES `Miembro_club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club`
--

LOCK TABLES `Club` WRITE;
/*!40000 ALTER TABLE `Club` DISABLE KEYS */;
/*!40000 ALTER TABLE `Club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club_patrocinador`
--

DROP TABLE IF EXISTS `Club_patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Club_patrocinador` (
  `id_patrocinador` int NOT NULL,
  `id_club` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `monto_aporte` int NOT NULL,
  KEY `id_patrocinador` (`id_patrocinador`),
  KEY `id_club` (`id_club`),
  CONSTRAINT `Club_patrocinador_ibfk_1` FOREIGN KEY (`id_patrocinador`) REFERENCES `Patrocinador` (`id`),
  CONSTRAINT `Club_patrocinador_ibfk_2` FOREIGN KEY (`id_club`) REFERENCES `Club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club_patrocinador`
--

LOCK TABLES `Club_patrocinador` WRITE;
/*!40000 ALTER TABLE `Club_patrocinador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Club_patrocinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Club_voluntario`
--

DROP TABLE IF EXISTS `Club_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Club_voluntario` (
  `id_voluntario` int NOT NULL,
  `id_club` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  KEY `id_voluntario` (`id_voluntario`),
  KEY `id_club` (`id_club`),
  CONSTRAINT `Club_voluntario_ibfk_1` FOREIGN KEY (`id_voluntario`) REFERENCES `Voluntario` (`id`),
  CONSTRAINT `Club_voluntario_ibfk_2` FOREIGN KEY (`id_club`) REFERENCES `Club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Club_voluntario`
--

LOCK TABLES `Club_voluntario` WRITE;
/*!40000 ALTER TABLE `Club_voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Club_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comisario`
--

DROP TABLE IF EXISTS `Comisario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comisario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `disponibilidad` tinyint NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comisario`
--

LOCK TABLES `Comisario` WRITE;
/*!40000 ALTER TABLE `Comisario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comisario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complejo_deportivo`
--

DROP TABLE IF EXISTS `Complejo_deportivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complejo_deportivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sede` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sede` (`id_sede`),
  CONSTRAINT `Complejo_deportivo_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `Sede` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complejo_deportivo`
--

LOCK TABLES `Complejo_deportivo` WRITE;
/*!40000 ALTER TABLE `Complejo_deportivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Complejo_deportivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Encuentro`
--

DROP TABLE IF EXISTS `Encuentro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Encuentro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_equipo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_evento` (`id_evento`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `Encuentro_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id`),
  CONSTRAINT `Encuentro_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Encuentro`
--

LOCK TABLES `Encuentro` WRITE;
/*!40000 ALTER TABLE `Encuentro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Encuentro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrenamiento`
--

DROP TABLE IF EXISTS `Entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entrenamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo_entrenamiento` int NOT NULL,
  `objetivos_especificos` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_entrenamiento` (`id_tipo_entrenamiento`),
  CONSTRAINT `Entrenamiento_ibfk_1` FOREIGN KEY (`id_tipo_entrenamiento`) REFERENCES `Tipo_entrenamiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrenamiento`
--

LOCK TABLES `Entrenamiento` WRITE;
/*!40000 ALTER TABLE `Entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entrenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrenamiento_jugador`
--

DROP TABLE IF EXISTS `Entrenamiento_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entrenamiento_jugador` (
  `id_jugador` int NOT NULL,
  `id_entrenamiento` int NOT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_entrenamiento` (`id_entrenamiento`),
  CONSTRAINT `Entrenamiento_jugador_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`),
  CONSTRAINT `Entrenamiento_jugador_ibfk_2` FOREIGN KEY (`id_entrenamiento`) REFERENCES `Entrenamiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrenamiento_jugador`
--

LOCK TABLES `Entrenamiento_jugador` WRITE;
/*!40000 ALTER TABLE `Entrenamiento_jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entrenamiento_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamiento`
--

DROP TABLE IF EXISTS `Equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamiento`
--

LOCK TABLES `Equipamiento` WRITE;
/*!40000 ALTER TABLE `Equipamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamiento_evento`
--

DROP TABLE IF EXISTS `Equipamiento_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipamiento_evento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_equipamiento` int NOT NULL,
  `cantidad_usada` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_evento` (`id_evento`),
  KEY `id_equipamiento` (`id_equipamiento`),
  CONSTRAINT `Equipamiento_evento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id`),
  CONSTRAINT `Equipamiento_evento_ibfk_2` FOREIGN KEY (`id_equipamiento`) REFERENCES `Equipamiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamiento_evento`
--

LOCK TABLES `Equipamiento_evento` WRITE;
/*!40000 ALTER TABLE `Equipamiento_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipamiento_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipo`
--

DROP TABLE IF EXISTS `Equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidad_integrantes` int NOT NULL,
  `disponibilidad` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo`
--

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estadisticas_rendimiento`
--

DROP TABLE IF EXISTS `Estadisticas_rendimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estadisticas_rendimiento` (
  `id_jugador` int NOT NULL,
  `id_encuentro` int NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_encuentro` (`id_encuentro`),
  CONSTRAINT `Estadisticas_rendimiento_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`),
  CONSTRAINT `Estadisticas_rendimiento_ibfk_2` FOREIGN KEY (`id_encuentro`) REFERENCES `Encuentro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estadisticas_rendimiento`
--

LOCK TABLES `Estadisticas_rendimiento` WRITE;
/*!40000 ALTER TABLE `Estadisticas_rendimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estadisticas_rendimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Evento`
--

DROP TABLE IF EXISTS `Evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Evento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_arbitro` int NOT NULL,
  `id_comisario` int NOT NULL,
  `id_club` int NOT NULL,
  `id_tipo_evento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_arbitro` (`id_arbitro`),
  KEY `id_comisario` (`id_comisario`),
  KEY `id_club` (`id_club`),
  KEY `id_tipo_evento` (`id_tipo_evento`),
  CONSTRAINT `Evento_ibfk_1` FOREIGN KEY (`id_arbitro`) REFERENCES `Arbitro` (`id`),
  CONSTRAINT `Evento_ibfk_2` FOREIGN KEY (`id_comisario`) REFERENCES `Comisario` (`id`),
  CONSTRAINT `Evento_ibfk_3` FOREIGN KEY (`id_club`) REFERENCES `Club` (`id`),
  CONSTRAINT `Evento_ibfk_4` FOREIGN KEY (`id_tipo_evento`) REFERENCES `Tipo_evento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Evento`
--

LOCK TABLES `Evento` WRITE;
/*!40000 ALTER TABLE `Evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incidencia`
--

DROP TABLE IF EXISTS `Incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incidencia` (
  `id_jugador` int NOT NULL,
  `id_encuentro` int NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `expulsion_partido` tinyint NOT NULL,
  KEY `id_jugador` (`id_jugador`),
  KEY `id_encuentro` (`id_encuentro`),
  CONSTRAINT `Incidencia_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`),
  CONSTRAINT `Incidencia_ibfk_2` FOREIGN KEY (`id_encuentro`) REFERENCES `Encuentro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidencia`
--

LOCK TABLES `Incidencia` WRITE;
/*!40000 ALTER TABLE `Incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador`
--

DROP TABLE IF EXISTS `Jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Jugador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `disponibilidad` tinyint DEFAULT NULL,
  `identificacion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `Jugador_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `Equipo` (`id`),
  CONSTRAINT `Jugador_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador`
--

LOCK TABLES `Jugador` WRITE;
/*!40000 ALTER TABLE `Jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mantenimiento_cancha`
--

DROP TABLE IF EXISTS `Mantenimiento_cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mantenimiento_cancha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cancha` int NOT NULL,
  `fecha_programada` date DEFAULT NULL,
  `tipo_mantenimiento` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `finalizado` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cancha` (`id_cancha`),
  CONSTRAINT `Mantenimiento_cancha_ibfk_1` FOREIGN KEY (`id_cancha`) REFERENCES `Cancha` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mantenimiento_cancha`
--

LOCK TABLES `Mantenimiento_cancha` WRITE;
/*!40000 ALTER TABLE `Mantenimiento_cancha` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mantenimiento_cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Miembro_club`
--

DROP TABLE IF EXISTS `Miembro_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Miembro_club` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Miembro_club`
--

LOCK TABLES `Miembro_club` WRITE;
/*!40000 ALTER TABLE `Miembro_club` DISABLE KEYS */;
/*!40000 ALTER TABLE `Miembro_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patrocinador`
--

DROP TABLE IF EXISTS `Patrocinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patrocinador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patrocinador`
--

LOCK TABLES `Patrocinador` WRITE;
/*!40000 ALTER TABLE `Patrocinador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patrocinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rendimiento_entrenamiento`
--

DROP TABLE IF EXISTS `Rendimiento_entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rendimiento_entrenamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sesion` int NOT NULL,
  `id_jugador` int NOT NULL,
  `notas_rendimiento` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sesion` (`id_sesion`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `Rendimiento_entrenamiento_ibfk_1` FOREIGN KEY (`id_sesion`) REFERENCES `Sesion` (`id`),
  CONSTRAINT `Rendimiento_entrenamiento_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rendimiento_entrenamiento`
--

LOCK TABLES `Rendimiento_entrenamiento` WRITE;
/*!40000 ALTER TABLE `Rendimiento_entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rendimiento_entrenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sede`
--

DROP TABLE IF EXISTS `Sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sede` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `Sede_ibfk_1` FOREIGN KEY (`id_ubicacion`) REFERENCES `Ubicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sede`
--

LOCK TABLES `Sede` WRITE;
/*!40000 ALTER TABLE `Sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sesion`
--

DROP TABLE IF EXISTS `Sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sesion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_entrenamiento` int NOT NULL,
  `id_complejo_deportivo` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `duracion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_entrenamiento` (`id_entrenamiento`),
  KEY `id_complejo_deportivo` (`id_complejo_deportivo`),
  CONSTRAINT `Sesion_ibfk_1` FOREIGN KEY (`id_entrenamiento`) REFERENCES `Entrenamiento` (`id`),
  CONSTRAINT `Sesion_ibfk_2` FOREIGN KEY (`id_complejo_deportivo`) REFERENCES `Complejo_deportivo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sesion`
--

LOCK TABLES `Sesion` WRITE;
/*!40000 ALTER TABLE `Sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_entrenamiento`
--

DROP TABLE IF EXISTS `Tipo_entrenamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_entrenamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_entrenamiento`
--

LOCK TABLES `Tipo_entrenamiento` WRITE;
/*!40000 ALTER TABLE `Tipo_entrenamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_entrenamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_evento`
--

DROP TABLE IF EXISTS `Tipo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_evento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cancha` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descricion` varchar(250) NOT NULL,
  `duracion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cancha` (`id_cancha`),
  CONSTRAINT `Tipo_evento_ibfk_1` FOREIGN KEY (`id_cancha`) REFERENCES `Cancha` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_evento`
--

LOCK TABLES `Tipo_evento` WRITE;
/*!40000 ALTER TABLE `Tipo_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ubicacion`
--

DROP TABLE IF EXISTS `Ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ubicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_barrio` int NOT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `diagonal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_barrio` (`id_barrio`),
  CONSTRAINT `Ubicacion_ibfk_1` FOREIGN KEY (`id_barrio`) REFERENCES `Barrio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ubicacion`
--

LOCK TABLES `Ubicacion` WRITE;
/*!40000 ALTER TABLE `Ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Voluntario`
--

DROP TABLE IF EXISTS `Voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Voluntario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `correo` varchar(100) NOT NULL,
  `identificacion` int NOT NULL,
  `disponibilidad` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Voluntario`
--

LOCK TABLES `Voluntario` WRITE;
/*!40000 ALTER TABLE `Voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Voluntario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26  0:06:55
