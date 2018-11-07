CREATE DATABASE  IF NOT EXISTS `pruebarails` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pruebarails`;
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pruebarails
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `rols`
--

DROP TABLE IF EXISTS `rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rols`
--

LOCK TABLES `rols` WRITE;
/*!40000 ALTER TABLE `rols` DISABLE KEYS */;
INSERT INTO `rols` VALUES (1,'Administrador','A','2014-02-13 15:04:12','2014-02-13 15:04:12'),(2,'Copropietario','A','2014-02-13 15:07:04','2014-02-13 15:07:04');
/*!40000 ALTER TABLE `rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadorporusuarios`
--

DROP TABLE IF EXISTS `indicadorporusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicadorporusuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(150) DEFAULT NULL,
  `fechaRojo` date DEFAULT NULL,
  `fechaAmarillo` date DEFAULT NULL,
  `fechaVerde` date DEFAULT NULL,
  `valorRojo` float DEFAULT NULL,
  `valorAmarillo` float DEFAULT NULL,
  `valorVerde` float DEFAULT NULL,
  `fechaMeta` date DEFAULT NULL,
  `valorMeta` float DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `correoresponsable` varchar(100) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `indicador_id` int(11) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indicadorporusuarios_on_indicador_id` (`indicador_id`),
  KEY `index_indicadorporusuarios_on_unidad_id` (`unidad_id`),
  KEY `index_indicadorporusuarios_on_login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadorporusuarios`
--

LOCK TABLES `indicadorporusuarios` WRITE;
/*!40000 ALTER TABLE `indicadorporusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicadorporusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicadors`
--

DROP TABLE IF EXISTS `indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicadors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `unidad_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_indicadors_on_rol_id` (`rol_id`),
  KEY `index_indicadors_on_unidad_id` (`unidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicadors`
--

LOCK TABLES `indicadors` WRITE;
/*!40000 ALTER TABLE `indicadors` DISABLE KEYS */;
INSERT INTO `indicadors` VALUES (1,'Incremento mensual del servicio de gas','A',1,2,'2014-02-13 15:57:08','2014-02-13 15:57:08'),(2,'Incremento mensual del servicio de luz','A',1,2,'2014-02-13 16:04:23','2014-02-13 16:04:23'),(3,'Incremento mensual del servicio de gas','A',1,2,'2014-02-13 16:04:49','2014-02-13 16:04:49'),(4,'Incremento mensual de copropietarios morosos','A',1,NULL,'2014-02-13 16:05:54','2014-02-13 16:05:54'),(5,'Incremento mensual del servicio de agua','A',2,2,'2014-02-13 16:11:35','2014-02-13 16:11:35');
/*!40000 ALTER TABLE `indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140212215054'),('20140212215104'),('20140212215117'),('20140212221539'),('20140212221551'),('20140212221601'),('20140212221610'),('20140212221634');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_logins_on_rol_id` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'admin','admin','Reinaldo','Díaz','A',1,'2014-02-13 15:46:48','2014-02-13 15:48:29');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialporindicadors`
--

DROP TABLE IF EXISTS `historialporindicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialporindicadors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `Indicadorporusuario_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_historialporindicadors_on_Indicadorporusuario_id` (`Indicadorporusuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialporindicadors`
--

LOCK TABLES `historialporindicadors` WRITE;
/*!40000 ALTER TABLE `historialporindicadors` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialporindicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencias_indicadors`
--

DROP TABLE IF EXISTS `frecuencias_indicadors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencias_indicadors` (
  `frecuencia_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`frecuencia_id`,`indicador_id`),
  KEY `index_frecuencias_indicadors_on_frecuencia_id_and_indicador_id` (`frecuencia_id`,`indicador_id`),
  KEY `index_frecuencias_indicadors_on_indicador_id_and_frecuencia_id` (`indicador_id`,`frecuencia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencias_indicadors`
--

LOCK TABLES `frecuencias_indicadors` WRITE;
/*!40000 ALTER TABLE `frecuencias_indicadors` DISABLE KEYS */;
INSERT INTO `frecuencias_indicadors` VALUES (4,1),(4,2),(4,3),(4,4),(4,5);
/*!40000 ALTER TABLE `frecuencias_indicadors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia`
--

DROP TABLE IF EXISTS `frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frecuencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia`
--

LOCK TABLES `frecuencia` WRITE;
/*!40000 ALTER TABLE `frecuencia` DISABLE KEYS */;
INSERT INTO `frecuencia` VALUES (1,'Diario',1,'A','2014-02-13 16:16:16','2014-02-13 16:16:16'),(2,'Semanal',7,'A','2014-02-13 16:16:36','2014-02-13 16:16:36'),(3,'Quincenal',15,'A','2014-02-13 16:16:54','2014-02-13 16:16:54'),(4,'Mensual',30,'A','2014-02-13 16:17:16','2014-02-13 16:17:16'),(5,'Anual',365,'A','2014-02-13 17:06:02','2014-02-13 17:06:02');
/*!40000 ALTER TABLE `frecuencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidads`
--

DROP TABLE IF EXISTS `unidads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `simbolo` varchar(10) DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidads`
--

LOCK TABLES `unidads` WRITE;
/*!40000 ALTER TABLE `unidads` DISABLE KEYS */;
INSERT INTO `unidads` VALUES (1,'Bolívares','Bs','A','2014-02-13 15:20:16','2014-02-13 15:20:16'),(2,'Porcentaje','%','A','2014-02-13 15:31:05','2014-02-13 15:31:05');
/*!40000 ALTER TABLE `unidads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-13 12:47:55
