-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: polizas
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

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


-- Database polizas 

DROP DATABASE IF EXISTS `polizas`;
CREATE DATABASE `polizas`;
USE `polizas`;

--
-- Table structure for table `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cobertura` (
  `id` int(11) NOT NULL,
  `nombreCobertura` varchar(45) NOT NULL,
  `descripcion` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura`
--

LOCK TABLES `cobertura` WRITE;
/*!40000 ALTER TABLE `cobertura` DISABLE KEYS */;
INSERT INTO `cobertura` VALUES
(1,'robo',NULL),
(2,'accidente',NULL),
(3,'daño a terceros',NULL);
/*!40000 ALTER TABLE `cobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `doc_tomador` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `valor` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contacto_tomador_idx` (`doc_tomador`),
  KEY `fk_contacto_tipos_dato_contacto1_idx` (`id_tipo`),
  CONSTRAINT `fk_contacto_tipos_dato_contacto1` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_dato_contacto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_tomador` FOREIGN KEY (`doc_tomador`) REFERENCES `tomador` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES
(1,345879121,1,'cra 7 40-69'),
(2,345879121,2,'3152685201'),
(3,123456789,3,'ana@gmail.com'),
(4,258463179,3,'montes@hotmail.com'),
(5,100125893,2,'5501234852');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `nombre_marca` varchar(50) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES
(1,'chevrolet'),
(2,'renault'),
(3,'ford'),
(4,'hyundai'),
(5,'kia'),
(6,'honda'),
(7,'mazda'),
(8,'MERCEDES BENZ'),
(9,'NISSAN'),
(10,'BMW'),
(11,'yamaha'),
(12,'suzuki');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `idmodelo` int(11) unique NOT NULL,
  `nombre_modelo` varchar(50) NOT NULL,
  `marca_idmarca` int(11) NOT NULL,
  PRIMARY KEY (`idmodelo`,`marca_idmarca`),
  KEY `fk_modelo_marca1_idx` (`marca_idmarca`),
  CONSTRAINT `fk_modelo_marca1` FOREIGN KEY (`marca_idmarca`) REFERENCES `marca` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES
(1,'aveo',1),
(2,'camaro',1),
(3,'spark',1),
(4,'captiva',1),
(5,'captur',2),
(6,'clio',2),
(7,'Grand Kangoo',2),
(8,'Grand Scenic',2),
(9,'fiesta',3),
(10,'focus',3),
(11,'Mondeo',3),
(12,'mustang',3),
(13,'Santa Fe',4),
(14,'i10',4),
(15,'i20',4),
(16,'i40',4),
(17,'Picanto',5),
(18,'Sorento',5),
(19,'Niro',5),
(20,'Rio',5),
(21,'City',6),
(22,'Civic',6),
(23,'Accord',6),
(24,'Insight',6),
(25,'Sedan',7),
(26,'hatchback',7),
(27,'CX',7),
(28,'MX',7),
(29,'AMG GT ',8),
(30,'Clase A',8),
(31,'Clase B',8),
(32,'Clase C',8),
(33,'SENTRA',9),
(34,'VERSA',9),
(35,'MARCH',9),
(36,'FRONTIER',9),
(37,'i3',10),
(38,'i4',10),
(39,'Serie 1',10),
(40,'Serie 2',10),
(41,'MT-125',11),
(42,'XSR700',11),
(43,'Tracer 7',11),
(44,'MT-09',11),
(45,'AX4',12),
(46,'GIXXER',12),
(47,'GSX',12),
(48,'DR150',12);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `cobertura_id` int(11) NOT NULL,
  `poliza_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_cobertura1_idx` (`cobertura_id`),
  KEY `fk_plan_poliza1_idx` (`poliza_id`),
  CONSTRAINT `fk_plan_cobertura1` FOREIGN KEY (`cobertura_id`) REFERENCES `cobertura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_poliza1` FOREIGN KEY (`poliza_id`) REFERENCES `poliza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,1,2),
(5,2,2),
(6,2,3),
(7,3,3),
(8,1,4),
(9,3,4);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza`
--

DROP TABLE IF EXISTS `poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poliza` (
  `id` int(11) NOT NULL,
  `tomador_documento` int(11) NOT NULL,
  `valor_asegurado` int(11) NOT NULL,
  `inicio_vigencia` datetime NOT NULL,
  `fin_vigencia` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poliza_tomador1_idx` (`tomador_documento`),
  CONSTRAINT `fk_poliza_tomador1` FOREIGN KEY (`tomador_documento`) REFERENCES `tomador` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza`
--

LOCK TABLES `poliza` WRITE;
/*!40000 ALTER TABLE `poliza` DISABLE KEYS */;
INSERT INTO `poliza` VALUES
(1,345879121,50000000,'2022-01-01 00:00:00','2023-01-01 00:00:00'),
(2,123456789,50000000,'2022-01-01 00:00:00','2023-01-01 00:00:00'),
(3,258463179,50000000,'2022-01-01 00:00:00','2023-01-01 00:00:00'),
(4,100125893,50000000,'2022-01-01 00:00:00','2023-01-01 00:00:00');
/*!40000 ALTER TABLE `poliza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza_vehiculo`
--

DROP TABLE IF EXISTS `poliza_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poliza_vehiculo` (
  `id` int(11) NOT NULL,
  `id_poliza` int(11) NOT NULL,
  `id_vehiculo` varchar(40) NOT NULL,
  KEY `pv_po_fk` (`id_poliza`),
  KEY `pv_ve_fk` (`id_vehiculo`),
  CONSTRAINT `pv_po_fk` FOREIGN KEY (`id_poliza`) REFERENCES `poliza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pv_ve_fk` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`idvehiculo_placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza_vehiculo`
--

LOCK TABLES `poliza_vehiculo` WRITE;
/*!40000 ALTER TABLE `poliza_vehiculo` DISABLE KEYS */;
INSERT INTO `poliza_vehiculo` VALUES
(1,1,'ABC123'),
(2,2,'ZXV984'),
(3,3,'JGY843'),
(4,4,'PKJ489');
/*!40000 ALTER TABLE `poliza_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre_tipo_doc` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES
(1,'cedula ciudadania',NULL),
(2,'cedula extranjeria',NULL);
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vehiculo`
--

DROP TABLE IF EXISTS `tipo_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_vehiculo` (
  `idtipo_vehiculo` int(11) NOT NULL,
  `nombre_tipo_veh` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipo_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vehiculo`
--

LOCK TABLES `tipo_vehiculo` WRITE;
/*!40000 ALTER TABLE `tipo_vehiculo` DISABLE KEYS */;
INSERT INTO `tipo_vehiculo` VALUES
(1,'automovil'),
(2,'motocicleta'),
(3,'camioneta');
/*!40000 ALTER TABLE `tipo_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_dato_contacto`
--

DROP TABLE IF EXISTS `tipos_dato_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_dato_contacto` (
  `id` int(11) NOT NULL,
  `nombre_tipo_contacto` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_dato_contacto`
--

LOCK TABLES `tipos_dato_contacto` WRITE;
/*!40000 ALTER TABLE `tipos_dato_contacto` DISABLE KEYS */;
INSERT INTO `tipos_dato_contacto` VALUES
(1,'direccion',NULL),
(2,'telefono',NULL),
(3,'correo',NULL);
/*!40000 ALTER TABLE `tipos_dato_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomador`
--

DROP TABLE IF EXISTS `tomador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomador` (
  `documento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `id_tipo_doc` int(11) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`documento`),
  KEY `fk_tomador_tipo_documento1_idx` (`id_tipo_doc`),
  CONSTRAINT `fk_tomador_tipo_documento1` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomador`
--

LOCK TABLES `tomador` WRITE;
/*!40000 ALTER TABLE `tomador` DISABLE KEYS */;
INSERT INTO `tomador` VALUES
(100125893,'Adam','Smith',2,'Bogota'),
(123456789,'Ana','Garcia',1,'Medellin'),
(258463179,'Juan','Montes',1,'Villavicencio'),
(345879121,'Pedro','Rodriguez',1,'Bogota');
/*!40000 ALTER TABLE `tomador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uso`
--

DROP TABLE IF EXISTS `uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uso` (
  `iduso` int(11) NOT NULL,
  `nombre_uso` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`iduso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uso`
--

LOCK TABLES `uso` WRITE;
/*!40000 ALTER TABLE `uso` DISABLE KEYS */;
INSERT INTO `uso` VALUES
(1,'particular','Uso civil'),
(2,'transporte publico','uso para una gran cantidad de civiles'),
(3,'taxi','uso privado');
/*!40000 ALTER TABLE `uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veh_uso`
--

DROP TABLE IF EXISTS `veh_uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veh_uso` (
  `id` int(11) NOT NULL,
  `uso_iduso` int(11) NOT NULL,
  `vehiculo_idvehiculo` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehuso_veh_fk` (`vehiculo_idvehiculo`),
  KEY `vehuso_uso_fk` (`uso_iduso`),
  CONSTRAINT `vehuso_uso_fk` FOREIGN KEY (`uso_iduso`) REFERENCES `uso` (`iduso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vehuso_veh_fk` FOREIGN KEY (`vehiculo_idvehiculo`) REFERENCES `vehiculo` (`idvehiculo_placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veh_uso`
--

LOCK TABLES `veh_uso` WRITE;
/*!40000 ALTER TABLE `veh_uso` DISABLE KEYS */;
INSERT INTO `veh_uso` VALUES
(1,1,'ABC123'),
(2,3,'JGY843'),
(3,1,'PKJ489'),
(4,1,'ZXV984');
/*!40000 ALTER TABLE `veh_uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idvehiculo_placa` varchar(40) unique NOT NULL,
  `tipo_vehiculo_idtipo_vehiculo` int(11) NOT NULL,
  `año` int(11) NOT NULL,
  `modelo_idmodelo` int(11) NOT NULL,
  PRIMARY KEY (`idvehiculo_placa`,`modelo_idmodelo`),
  KEY `fk_vehiculo_tipo_vehiculo1_idx` (`tipo_vehiculo_idtipo_vehiculo`),
  KEY `fk_vehiculo_modelo1_idx` (`modelo_idmodelo`),
  CONSTRAINT `fk_vehiculo_modelo1` FOREIGN KEY (`modelo_idmodelo`) REFERENCES `modelo` (`idmodelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculo_tipo_vehiculo1` FOREIGN KEY (`tipo_vehiculo_idtipo_vehiculo`) REFERENCES `tipo_vehiculo` (`idtipo_vehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES
('ABC123',1,2010,1),
('JGY843',1,2020,9),
('PKJ489',1,2014,1),
('ZXV984',1,2015,3);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-10  0:15:05
