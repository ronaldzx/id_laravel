-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hardy
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conductor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

LOCK TABLES `conductor` WRITE;
/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
INSERT INTO `conductor` VALUES (1,'Ronald','Barba','72873874','23',NULL,'1'),(2,'Hardy','Sanchez','70606987','25',NULL,'1');
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor_penalidad`
--

DROP TABLE IF EXISTS `conductor_penalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conductor_penalidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conductor_id` int(10) unsigned DEFAULT NULL,
  `penalidad_id` int(10) unsigned DEFAULT NULL,
  `penalidad_monto` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_conductorpenalidad_conductor_id_idx` (`conductor_id`),
  KEY `fk_conductorpenalidad_penalidad_id_idx` (`penalidad_id`),
  CONSTRAINT `fk_conductorpenalidad_conductor_id_idx` FOREIGN KEY (`conductor_id`) REFERENCES `conductor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conductorpenalidad_penalidad_id_idx` FOREIGN KEY (`penalidad_id`) REFERENCES `penalidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor_penalidad`
--

LOCK TABLES `conductor_penalidad` WRITE;
/*!40000 ALTER TABLE `conductor_penalidad` DISABLE KEYS */;
INSERT INTO `conductor_penalidad` VALUES (1,1,1,50.00);
/*!40000 ALTER TABLE `conductor_penalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlador`
--

DROP TABLE IF EXISTS `controlador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlador`
--

LOCK TABLES `controlador` WRITE;
/*!40000 ALTER TABLE `controlador` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimiento`
--

DROP TABLE IF EXISTS `establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `mapa` varchar(1000) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `propietario` varchar(100) DEFAULT NULL,
  `numero_emergencia` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimiento`
--

LOCK TABLES `establecimiento` WRITE;
/*!40000 ALTER TABLE `establecimiento` DISABLE KEYS */;
INSERT INTO `establecimiento` VALUES (1,'Casa','https://goo.gl/maps/QoQJ583iDpf2vWai9','51955233730','Hardy Sanchez','51922184349','Los Jardines Mz l 1205 interior 29'),(2,'Casa Dani','https://goo.gl/maps/8ccPSsD12YGVYacg9','51922184349','Ronald Barba','51955233730','Derrama magisterial B204'),(3,'Casa Alarma','https://goo.gl/maps/8ccPSsD12YGVYacg9','51972472921','Alarma Alarma','51972472921','Av Huaman 157');
/*!40000 ALTER TABLE `establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'En ruta'),(2,'Pendiente de pago'),(3,'Cerrado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencia`
--

DROP TABLE IF EXISTS `incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `establecimiento_id` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_establecimiento_id_idx` (`establecimiento_id`),
  CONSTRAINT `fk_establecimiento_id` FOREIGN KEY (`establecimiento_id`) REFERENCES `establecimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencia`
--

LOCK TABLES `incidencia` WRITE;
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
INSERT INTO `incidencia` VALUES (1,NULL,'Falsa alrma','2020-05-30 16:21:23','2020-07-04 14:31:52',NULL),(2,NULL,'Falsa alarma','2020-05-31 01:55:44','2020-06-01 15:39:08',NULL),(3,NULL,'12361 asd',NULL,'2020-06-14 01:08:30','2020-06-02 20:44:45'),(4,NULL,NULL,NULL,'2020-06-02 20:56:36','2020-06-02 20:56:36'),(5,NULL,NULL,NULL,'2020-06-02 21:02:08','2020-06-02 21:02:08'),(6,NULL,NULL,NULL,'2020-06-02 21:03:17','2020-06-02 21:03:17'),(7,NULL,NULL,NULL,'2020-06-02 21:12:39','2020-06-02 21:12:39'),(8,NULL,NULL,NULL,'2020-06-02 21:14:56','2020-06-02 21:14:56'),(9,NULL,NULL,NULL,'2020-07-04 01:57:18','2020-07-04 01:57:18'),(10,NULL,NULL,NULL,'2020-07-04 12:01:48','2020-07-04 12:01:48'),(11,NULL,NULL,NULL,'2020-07-04 12:01:58','2020-07-04 12:01:58'),(12,NULL,NULL,NULL,'2020-07-04 13:17:54','2020-07-04 13:17:54'),(13,NULL,NULL,NULL,'2020-07-04 13:22:47','2020-07-04 13:22:47'),(14,1,'1525','2020-07-04 13:24:23','2020-07-04 20:06:40','2020-07-04 13:24:23'),(15,1,'{','2020-07-04 13:31:44','2020-07-04 20:02:15','2020-07-04 13:31:44'),(16,1,NULL,'2020-07-04 13:45:51','2020-07-04 13:45:51','2020-07-04 13:45:51'),(17,1,NULL,'2020-07-04 14:04:31','2020-07-04 14:04:31','2020-07-04 14:04:31'),(18,1,NULL,'2020-07-04 14:04:35','2020-07-04 14:04:35','2020-07-04 14:04:35'),(19,1,NULL,'2020-07-04 14:04:35','2020-07-04 14:04:35','2020-07-04 14:04:35'),(20,1,NULL,'2020-07-04 14:04:37','2020-07-04 14:04:37','2020-07-04 14:04:37'),(21,1,NULL,'2020-07-04 15:29:31','2020-07-04 15:29:31','2020-07-04 15:29:31'),(22,1,NULL,'2020-07-04 17:32:55','2020-07-04 17:32:55','2020-07-04 17:32:55'),(23,1,NULL,'2020-07-04 17:56:12','2020-07-04 17:56:12','2020-07-04 17:56:12'),(24,1,NULL,'2020-07-04 18:05:41','2020-07-04 18:05:41','2020-07-04 18:05:41'),(25,1,NULL,'2020-07-04 19:21:37','2020-07-04 19:21:37','2020-07-04 19:21:37'),(26,1,NULL,'2020-07-04 19:24:45','2020-07-04 19:24:45','2020-07-04 19:24:45'),(27,1,NULL,'2020-07-04 19:35:25','2020-07-04 19:35:25','2020-07-04 19:35:25'),(28,1,NULL,'2020-07-04 19:36:05','2020-07-04 19:36:05','2020-07-04 19:36:05'),(29,1,NULL,'2020-07-04 19:44:00','2020-07-04 19:44:00','2020-07-04 19:44:00'),(30,1,NULL,'2020-07-04 19:44:46','2020-07-04 19:44:46','2020-07-04 19:44:46'),(31,1,NULL,'2020-07-04 19:53:49','2020-07-04 19:53:49','2020-07-04 19:53:49'),(32,1,NULL,'2020-07-04 19:54:03','2020-07-04 19:54:03','2020-07-04 19:54:03'),(33,1,NULL,'2020-07-04 19:55:05','2020-07-04 19:55:05','2020-07-04 19:55:05'),(34,1,NULL,'2020-07-04 19:55:38','2020-07-04 19:55:38','2020-07-04 19:55:38'),(35,1,NULL,'2020-07-04 19:58:14','2020-07-04 19:58:14','2020-07-04 19:58:14'),(36,1,NULL,'2020-07-04 19:58:26','2020-07-04 19:58:26','2020-07-04 19:58:26'),(37,1,NULL,'2020-07-04 19:59:07','2020-07-04 19:59:08','2020-07-04 19:59:08'),(38,1,NULL,'2020-07-04 20:01:06','2020-07-04 20:01:06','2020-07-04 20:01:06'),(39,1,NULL,'2020-07-04 20:08:06','2020-07-04 20:08:06','2020-07-04 20:08:06'),(40,1,NULL,'2020-07-04 20:09:33','2020-07-04 20:09:42','2020-07-04 20:09:42'),(41,1,NULL,'2020-07-04 20:11:20','2020-07-04 20:11:20','2020-07-04 20:11:20'),(42,1,NULL,'2020-07-04 20:13:15','2020-07-04 20:13:15','2020-07-04 20:13:15'),(43,1,NULL,'2020-07-04 20:13:56','2020-07-04 20:13:56','2020-07-04 20:13:56'),(44,1,NULL,'2020-07-04 20:14:23','2020-07-04 20:14:23','2020-07-04 20:14:23'),(45,1,NULL,'2020-07-04 20:15:34','2020-07-04 20:15:34','2020-07-04 20:15:34'),(46,1,NULL,'2020-07-04 20:16:01','2020-07-04 20:16:01','2020-07-04 20:16:01'),(47,1,NULL,'2020-07-04 20:16:55','2020-07-04 20:16:55','2020-07-04 20:16:55'),(48,1,NULL,'2020-07-04 20:17:25','2020-07-04 20:17:25','2020-07-04 20:17:25'),(49,1,NULL,'2020-07-04 20:17:55','2020-07-04 20:17:55','2020-07-04 20:17:55'),(50,1,NULL,'2020-07-04 20:18:07','2020-07-04 20:18:07','2020-07-04 20:18:07'),(51,1,NULL,'2020-07-04 20:30:34','2020-07-04 20:30:34','2020-07-04 20:30:34'),(52,1,NULL,'2020-07-04 20:30:50','2020-07-04 20:30:50','2020-07-04 20:30:50'),(53,1,NULL,'2020-07-04 20:31:21','2020-07-04 20:31:21','2020-07-04 20:31:21'),(54,1,NULL,'2020-07-04 20:34:31','2020-07-04 20:34:31','2020-07-04 20:34:31'),(55,1,NULL,'2020-07-04 20:34:59','2020-07-04 20:34:59','2020-07-04 20:34:59'),(56,1,NULL,'2020-07-04 20:44:15','2020-07-04 20:44:16','2020-07-04 20:44:16'),(57,1,NULL,'2020-07-04 20:45:28','2020-07-04 20:45:28','2020-07-04 20:45:28'),(58,1,NULL,'2020-07-04 20:46:22','2020-07-04 20:46:22','2020-07-04 20:46:22'),(59,1,NULL,'2020-07-04 20:51:17','2020-07-04 20:51:17','2020-07-04 20:51:17'),(60,1,NULL,'2020-07-04 20:55:26','2020-07-04 20:55:26','2020-07-04 20:55:26'),(61,1,NULL,'2020-07-04 20:55:34','2020-07-04 20:55:34','2020-07-04 20:55:34'),(62,1,NULL,'2020-07-04 20:57:20','2020-07-04 20:57:20','2020-07-04 20:57:20'),(63,1,NULL,'2020-07-04 20:57:52','2020-07-04 20:57:52','2020-07-04 20:57:52'),(64,1,NULL,'2020-07-04 20:58:43','2020-07-04 20:58:43','2020-07-04 20:58:43'),(65,1,NULL,'2020-07-04 20:59:16','2020-07-04 20:59:16','2020-07-04 20:59:16'),(66,1,NULL,'2020-07-04 21:01:02','2020-07-04 21:01:02','2020-07-04 21:01:02'),(67,1,NULL,'2020-07-04 21:01:11','2020-07-04 21:01:11','2020-07-04 21:01:11'),(68,1,NULL,'2020-07-04 21:01:53','2020-07-04 21:01:53','2020-07-04 21:01:53'),(69,2,'falsa alarma','2020-07-04 21:13:37','2020-07-06 16:31:29','2020-07-04 21:13:37'),(70,1,NULL,'2020-07-04 21:14:37','2020-07-04 21:14:37','2020-07-04 21:14:37'),(71,1,NULL,'2020-07-04 21:22:15','2020-07-04 21:22:15','2020-07-04 21:22:15'),(72,2,NULL,'2020-07-06 00:21:58','2020-07-06 00:21:58','2020-07-06 00:21:58'),(73,2,NULL,'2020-07-06 00:34:42','2020-07-06 00:34:42','2020-07-06 00:34:42'),(74,2,NULL,'2020-07-06 00:34:56','2020-07-06 00:34:56','2020-07-06 00:34:56'),(75,2,NULL,'2020-07-06 00:35:07','2020-07-06 00:35:07','2020-07-06 00:35:07'),(76,1,NULL,'2020-07-07 00:06:05','2020-07-07 00:06:05','2020-07-07 00:06:05'),(77,1,NULL,'2020-07-07 00:08:53','2020-07-07 00:08:53','2020-07-07 00:08:53'),(78,3,NULL,'2020-07-07 00:15:56','2020-07-07 00:15:56','2020-07-07 00:15:56');
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_entrante`
--

DROP TABLE IF EXISTS `mensaje_entrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje_entrante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `mensaje` varchar(1000) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_entrante`
--

LOCK TABLES `mensaje_entrante` WRITE;
/*!40000 ALTER TABLE `mensaje_entrante` DISABLE KEYS */;
INSERT INTO `mensaje_entrante` VALUES (24,'51955233730','12','2020-07-03 22:59:10','2020-07-03 22:59:10'),(25,'51955233730','16','2020-07-03 23:09:05','2020-07-03 23:09:05'),(26,' 51955233730','17','2020-07-03 23:09:07','2020-07-03 23:09:07'),(27,' 51955233730','18','2020-07-03 23:09:12','2020-07-03 23:09:12'),(28,'922184349','Hola Mundo','2020-07-03 23:11:54','2020-07-03 23:11:54'),(29,'922184349','Hola Mundo','2020-07-04 00:41:25','2020-07-04 00:41:25'),(30,'922184349','Hola Mundo','2020-07-04 00:41:40','2020-07-04 00:41:40'),(31,'51955233730','Hola Mundo','2020-07-04 00:43:34','2020-07-04 00:43:34'),(32,'51955233730','Hola Mundo','2020-07-04 01:07:09','2020-07-04 01:07:09'),(33,'51955233730','Hola Mundo','2020-07-04 01:12:32','2020-07-04 01:12:32'),(34,'51955233730','Hola Mundo','2020-07-04 01:13:07','2020-07-04 01:13:07'),(35,'51955233730','Hola Mundo','2020-07-04 01:55:01','2020-07-04 01:55:01'),(36,'51955233730','Hola Mundo','2020-07-04 01:55:32','2020-07-04 01:55:32'),(37,'51955233730','Hola Mundo','2020-07-04 01:55:56','2020-07-04 01:55:56'),(38,'51955233730','Hola Mundo','2020-07-04 01:56:25','2020-07-04 01:56:25'),(39,'51955233730','Hola Mundo','2020-07-04 01:57:00','2020-07-04 01:57:00'),(40,'51955233730','Hola Mundo','2020-07-04 01:57:18','2020-07-04 01:57:18'),(41,'51955233730','Hola Mundo1','2020-07-04 12:01:48','2020-07-04 12:01:48'),(42,'51955233730','Hola Mundo2','2020-07-04 12:01:58','2020-07-04 12:01:58'),(43,'51955233730','Hola Mundo1','2020-07-04 13:17:43','2020-07-04 13:17:43'),(44,'51955233730','Hola Mundo1','2020-07-04 13:17:54','2020-07-04 13:17:54'),(45,'51955233730','Hola Mundo1','2020-07-04 13:22:47','2020-07-04 13:22:47'),(46,'51955233730','Hola Mundo1','2020-07-04 13:24:23','2020-07-04 13:24:23'),(47,'51955233730','Hola Mundo1','2020-07-04 13:31:44','2020-07-04 13:31:44'),(48,'51955233730','Hola Mundo1','2020-07-04 13:45:51','2020-07-04 13:45:51'),(49,'51955233730','Hola Mundo1','2020-07-04 13:54:37','2020-07-04 13:54:37'),(50,'51955233730','Hola Mundo1','2020-07-04 13:54:55','2020-07-04 13:54:55'),(51,'51955233730','Hola Mundo1','2020-07-04 13:55:08','2020-07-04 13:55:08'),(52,'51955233730','Hola Mundo1','2020-07-04 13:55:23','2020-07-04 13:55:23'),(53,'51955233730','Hola Mundo1','2020-07-04 14:04:31','2020-07-04 14:04:31'),(54,'51955233730','Hola Mundo1','2020-07-04 14:04:35','2020-07-04 14:04:35'),(55,'51955233730','Hola Mundo1','2020-07-04 14:04:35','2020-07-04 14:04:35'),(56,'51955233730','Hola Mundo1','2020-07-04 14:04:37','2020-07-04 14:04:37'),(57,'51955233730','Hola Mundo1','2020-07-04 15:29:31','2020-07-04 15:29:31'),(58,'51955233730','Hola Mundo1','2020-07-04 17:32:55','2020-07-04 17:32:55'),(59,'51955233730','Hola Mundo1','2020-07-04 17:56:12','2020-07-04 17:56:12'),(60,'51955233730','Hola Mundo1','2020-07-04 18:05:41','2020-07-04 18:05:41'),(61,'51955233730','Hola Mundo1','2020-07-04 18:18:19','2020-07-04 18:18:19'),(62,'51955233730','Hola Mundo1','2020-07-04 18:30:32','2020-07-04 18:30:32'),(63,'51955233730','Hola Mundo1','2020-07-04 19:03:18','2020-07-04 19:03:18'),(64,'51955233730','Hola Mundo1','2020-07-04 19:03:56','2020-07-04 19:03:56'),(65,'51955233730','Hola Mundo1','2020-07-04 19:10:57','2020-07-04 19:10:57'),(66,'51955233730','Hola Mundo1','2020-07-04 19:21:12','2020-07-04 19:21:12'),(67,'51955233730','Hola Mundo1','2020-07-04 19:21:37','2020-07-04 19:21:37'),(68,'51955233730','Hola Mundo1','2020-07-04 19:24:45','2020-07-04 19:24:45'),(69,'51955233730','Hola Mundo1','2020-07-04 19:35:25','2020-07-04 19:35:25'),(70,'51955233730','Hola Mundo1','2020-07-04 19:36:05','2020-07-04 19:36:05'),(71,'51955233730','Hola Mundo1','2020-07-04 19:44:00','2020-07-04 19:44:00'),(72,'51955233730','Hola Mundo1','2020-07-04 19:44:46','2020-07-04 19:44:46'),(73,'51955233730','Hola Mundo1','2020-07-04 19:50:02','2020-07-04 19:50:02'),(74,'51955233730','Hola Mundo1','2020-07-04 19:50:59','2020-07-04 19:50:59'),(75,'51955233730','Hola Mundo1','2020-07-04 19:51:05','2020-07-04 19:51:05'),(76,'51955233730','Hola Mundo1','2020-07-04 19:51:18','2020-07-04 19:51:18'),(77,'51955233730','Hola Mundo1','2020-07-04 19:52:48','2020-07-04 19:52:48'),(78,'51955233730','Hola Mundo1','2020-07-04 19:53:24','2020-07-04 19:53:24'),(79,'51955233730','Hola Mundo1','2020-07-04 19:53:49','2020-07-04 19:53:49'),(80,'51955233730','Hola Mundo1','2020-07-04 19:54:03','2020-07-04 19:54:03'),(81,'51955233730','Hola Mundo1','2020-07-04 19:54:52','2020-07-04 19:54:52'),(82,'51955233730','Hola Mundo1','2020-07-04 19:55:05','2020-07-04 19:55:05'),(83,'51955233730','Hola Mundo1','2020-07-04 19:55:38','2020-07-04 19:55:38'),(84,'51955233730','Hola Mundo1','2020-07-04 19:58:14','2020-07-04 19:58:14'),(85,'51955233730','Hola Mundo1','2020-07-04 19:58:26','2020-07-04 19:58:26'),(86,'51955233730','Hola Mundo1','2020-07-04 19:59:07','2020-07-04 19:59:07'),(87,'51955233730','Hola Mundo1','2020-07-04 20:01:06','2020-07-04 20:01:06'),(88,'51955233730','Hola Mundo1','2020-07-04 20:07:06','2020-07-04 20:07:06'),(89,'51955233730','Hola Mundo1','2020-07-04 20:08:06','2020-07-04 20:08:06'),(90,'51955233730','Hola Mundo1','2020-07-04 20:08:24','2020-07-04 20:08:24'),(91,'51955233730','Hola Mundo1','2020-07-04 20:09:12','2020-07-04 20:09:12'),(92,'51955233730','Hola Mundo1','2020-07-04 20:09:33','2020-07-04 20:09:33'),(93,'51955233730','Hola Mundo1','2020-07-04 20:11:20','2020-07-04 20:11:20'),(94,'51955233730','Hola Mundo1','2020-07-04 20:13:15','2020-07-04 20:13:15'),(95,'51955233730','Hola Mundo1','2020-07-04 20:13:56','2020-07-04 20:13:56'),(96,'51955233730','Hola Mundo1','2020-07-04 20:14:23','2020-07-04 20:14:23'),(97,'51955233730','Hola Mundo1','2020-07-04 20:15:34','2020-07-04 20:15:34'),(98,'51955233730','Hola Mundo1','2020-07-04 20:16:01','2020-07-04 20:16:01'),(99,'51955233730','Hola Mundo1','2020-07-04 20:16:55','2020-07-04 20:16:55'),(100,'51955233730','Hola Mundo1','2020-07-04 20:17:25','2020-07-04 20:17:25'),(101,'51955233730','Hola Mundo1','2020-07-04 20:17:55','2020-07-04 20:17:55'),(102,'51955233730','Hola Mundo1','2020-07-04 20:18:07','2020-07-04 20:18:07'),(103,'51955233730','Hola Mundo1','2020-07-04 20:30:34','2020-07-04 20:30:34'),(104,'51955233730','Hola Mundo1','2020-07-04 20:30:50','2020-07-04 20:30:50'),(105,'51955233730','Hola Mundo1','2020-07-04 20:31:21','2020-07-04 20:31:21'),(106,'51955233730','Hola Mundo1','2020-07-04 20:34:31','2020-07-04 20:34:31'),(107,'51955233730','Hola Mundo1','2020-07-04 20:34:59','2020-07-04 20:34:59'),(108,'51955233730','Hola Mundo1','2020-07-04 20:44:15','2020-07-04 20:44:15'),(109,'51955233730','Hola Mundo1','2020-07-04 20:45:28','2020-07-04 20:45:28'),(110,'51955233730','Hola Mundo1','2020-07-04 20:46:22','2020-07-04 20:46:22'),(111,'51955233730','Hola Mundo1','2020-07-04 20:51:17','2020-07-04 20:51:17'),(112,'51955233730','Hola Mundo1','2020-07-04 20:55:26','2020-07-04 20:55:26'),(113,'51955233730','Hola Mundo1','2020-07-04 20:55:34','2020-07-04 20:55:34'),(114,'51955233730','Hola Mundo1','2020-07-04 20:57:20','2020-07-04 20:57:20'),(115,'51955233730','Hola Mundo1','2020-07-04 20:57:52','2020-07-04 20:57:52'),(116,'51955233730','Hola Mundo1','2020-07-04 20:58:43','2020-07-04 20:58:43'),(117,'51955233730','Hola Mundo1','2020-07-04 20:59:16','2020-07-04 20:59:16'),(118,'51955233730','Hola Mundo1','2020-07-04 21:01:02','2020-07-04 21:01:02'),(119,'51955233730','Hola Mundo1','2020-07-04 21:01:11','2020-07-04 21:01:11'),(120,'51955233730','Hola Mundo1','2020-07-04 21:01:53','2020-07-04 21:01:53'),(121,' 51922184349','Euwu','2020-07-04 21:11:37','2020-07-04 21:11:37'),(122,' 51955233730','Auxilio me roban xD','2020-07-04 21:12:07','2020-07-04 21:12:07'),(123,'51922184349','Kjukbv','2020-07-04 21:13:37','2020-07-04 21:13:37'),(124,'51955233730','Ayudaaaaa','2020-07-04 21:14:37','2020-07-04 21:14:37'),(125,'51955233730','Hola Mundo','2020-07-04 21:22:15','2020-07-04 21:22:15'),(126,'51922184349','Assd','2020-07-06 00:21:58','2020-07-06 00:21:58'),(127,'51922184349','Sjsjhs','2020-07-06 00:34:42','2020-07-06 00:34:42'),(128,'51922184349','Kskznx','2020-07-06 00:34:56','2020-07-06 00:34:56'),(129,'51922184349','Sonido','2020-07-06 00:35:07','2020-07-06 00:35:07'),(130,'51955233730','Sos prueba','2020-07-07 00:06:05','2020-07-07 00:06:05'),(131,'51955233730','Sos 2','2020-07-07 00:08:53','2020-07-07 00:08:53'),(132,'51972472921','02 Zona Alarma           ','2020-07-07 00:13:46','2020-07-07 00:13:46'),(133,'51972472921','02 Zona Alarma           ','2020-07-07 00:15:56','2020-07-07 00:15:56');
/*!40000 ALTER TABLE `mensaje_entrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (57,'2014_10_12_000000_create_users_table',1),(58,'2014_10_12_100000_create_password_resets_table',1),(59,'2019_08_19_000000_create_failed_jobs_table',1),(60,'2020_02_03_000000_create_conductor_table',1),(61,'2020_02_03_000001_create_controlador_table',1),(62,'2020_02_03_000003_create_ruta_table',1),(63,'2020_02_03_000004_create_socio_table',1),(64,'2020_02_03_000005_create_opcion_table',1),(65,'2020_02_03_000006_create_penalidad_table',1),(66,'2020_02_03_000007_create_estado_table',1),(67,'2020_02_03_000008_create_conductor_penalidad_table',1),(68,'2020_02_03_000009_create_unidad_table',1),(69,'2020_02_03_000010_create_ticket_table',1),(70,'2020_05_31_014732_create_websockets_statistics_entries_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `padre_id` int(10) unsigned DEFAULT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controlador_id` int(11) DEFAULT NULL,
  `route` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_opcion_padre_id_idx` (`padre_id`),
  CONSTRAINT `fk_opcion_padre_id_idx` FOREIGN KEY (`padre_id`) REFERENCES `opcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,NULL,'Ticket',2,NULL,NULL,NULL,'',2,'2020-02-03 00:51:46'),(2,1,'Registro de tickets',1,NULL,NULL,'ticket','fa-clipboard-list',2,'2020-02-03 00:51:55'),(3,NULL,'Tesorería',3,NULL,NULL,NULL,'',2,'2020-02-03 01:16:57'),(4,3,'Validación de tickets',1,NULL,NULL,'ticket_validacion','fa-clipboard-check',2,'2020-02-03 01:17:17'),(5,1,'Reporte de tickets',2,NULL,NULL,'reporte_ticket','mdi-contacts',2,'2020-02-03 23:25:57'),(6,1,'confirmacion de ticket',3,NULL,NULL,'ticket_confirmacion','mdi-contacts',2,'2020-02-04 22:02:05'),(7,NULL,'Administracion',1,NULL,NULL,NULL,NULL,2,'2020-02-04 22:24:50'),(8,7,'Conductor',1,NULL,NULL,'admin_conductor','mdi-contacts',2,'2020-02-04 22:31:37'),(9,7,'Unidad',2,NULL,NULL,'admin_unidad','mdi-contacts',2,'2020-02-04 22:31:37'),(10,7,'Rutas',3,NULL,NULL,'admin_ruta','mdi-contacts',2,'2020-02-04 22:31:37'),(11,7,'Penalidad',4,NULL,NULL,'admin_penalidad','mdi-contacts',2,'2020-02-04 22:31:37'),(12,NULL,'Inicidencias',4,NULL,NULL,NULL,NULL,1,'2020-05-30 10:58:20'),(13,12,'Tabla de incidencias',1,NULL,NULL,'tabla_incidencia','fa-clipboard-list',1,'2020-05-30 10:59:07'),(14,7,'Establecimientos',5,NULL,NULL,'establecimientos','laptop-house',2,'2020-07-05 01:48:39');
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalidad`
--

DROP TABLE IF EXISTS `penalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dias` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalidad`
--

LOCK TABLES `penalidad` WRITE;
/*!40000 ALTER TABLE `penalidad` DISABLE KEYS */;
INSERT INTO `penalidad` VALUES (1,'Uniforme','5',50.00);
/*!40000 ALTER TABLE `penalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'TI'),(3,'Supervisor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_opcion`
--

DROP TABLE IF EXISTS `rol_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_opcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  `opcion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_opcion`
--

LOCK TABLES `rol_opcion` WRITE;
/*!40000 ALTER TABLE `rol_opcion` DISABLE KEYS */;
INSERT INTO `rol_opcion` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,1,1),(8,1,2),(9,1,3),(10,1,4),(11,1,5),(12,1,6),(13,1,7),(14,1,8),(15,1,9),(16,1,10),(17,1,11),(18,1,12),(19,1,13);
/*!40000 ALTER TABLE `rol_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,'Ruta 1',1),(2,'Ruta 2',1);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acciones` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'Juan','Vargas','10364879',NULL,'400572');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidad_id` int(10) unsigned DEFAULT NULL,
  `conductor_id` int(10) unsigned DEFAULT NULL,
  `numero_vuelta` int(11) DEFAULT NULL,
  `ruta_id` int(10) unsigned DEFAULT NULL,
  `pago` decimal(5,2) DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `fecha_salida` timestamp NULL DEFAULT current_timestamp(),
  `estado_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ticket_estado_id_idx` (`estado_id`),
  KEY `fk_ticket_conductor_id_idx` (`conductor_id`),
  KEY `fk_ticket_unidad_id_idx` (`unidad_id`),
  KEY `fk_ticket_ruta_id_idx` (`ruta_id`),
  CONSTRAINT `fk_ticket_conductor_id_idx` FOREIGN KEY (`conductor_id`) REFERENCES `conductor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_estado_id_idx` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_ruta_id_idx` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_unidad_id_idx` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (2,'T-0001',1,1,1,1,NULL,NULL,'2020-02-04 19:00:32',1),(3,'T-0002',2,2,1,1,NULL,NULL,'2020-02-04 19:40:32',1),(4,'T-0003',1,1,2,1,NULL,NULL,'2020-02-06 19:40:32',2),(5,'T-0004',1,1,2,1,NULL,NULL,'2020-02-07 19:40:32',2);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socio_id` int(10) DEFAULT NULL,
  `placa` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marca` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soat_vence` date DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_unidad_socio_id_idx` (`socio_id`),
  KEY `fk_unidad_estado_id_idx` (`estado_id`),
  CONSTRAINT `fk_unidad_estado` FOREIGN KEY (`estado_id`) REFERENCES `unidad_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidad_socio` FOREIGN KEY (`socio_id`) REFERENCES `socio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'Carrito morado',1,'TFD-559','A1','Nissan','2020-04-08',1),(2,'Carrito nuevo',1,'TFD-569','A3','Toyota','2020-02-06',1),(3,'M$12',1,'asd22','111a','zczx','2020-02-29',2),(4,'TP$3',1,'ff','44','ff','2020-05-22',1);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_estado`
--

DROP TABLE IF EXISTS `unidad_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_estado`
--

LOCK TABLES `unidad_estado` WRITE;
/*!40000 ALTER TABLE `unidad_estado` DISABLE KEYS */;
INSERT INTO `unidad_estado` VALUES (1,'Operativo'),(2,'No operativo');
/*!40000 ALTER TABLE `unidad_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `remember_token` varchar(45) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL COMMENT '1:cerrado,2:abierto',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'rdbarba','$2y$10$0olfeCo5N20cG4thb2c7VOahmgwe5AHVDNPPE/ZhtxYB6OUmjR5Jm',NULL,3,1),(2,'hardy','$2y$10$QXWO2tWIDmtUTPMnOH2DKOI0id4B.tB5hRhLgYEd7RN151FLv8qn6',NULL,2,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1,2),(2,1,1);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-07  0:52:01
