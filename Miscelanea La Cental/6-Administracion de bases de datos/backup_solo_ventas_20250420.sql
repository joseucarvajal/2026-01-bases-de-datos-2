-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: miscelanea_la_central
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `tipo` enum('detal','mayor') NOT NULL DEFAULT 'detal',
  `total` decimal(10,2) NOT NULL,
  `estado_pago` enum('pagado','credito','parcial') NOT NULL DEFAULT 'pagado',
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2025-03-01','detal',18500.00,'pagado',NULL),(2,2,'2025-03-02','mayor',120000.00,'credito',NULL),(3,3,'2025-03-03','detal',35000.00,'credito',NULL),(4,4,'2025-03-05','mayor',95000.00,'pagado',NULL),(5,5,'2025-03-07','detal',12000.00,'pagado',NULL),(6,NULL,'2025-03-08','detal',8500.00,'pagado',NULL),(7,2,'2025-03-10','mayor',85000.00,'pagado',NULL),(8,6,'2025-03-12','mayor',250000.00,'credito',NULL),(9,1,'2025-03-14','detal',22000.00,'pagado',NULL),(10,7,'2025-03-15','detal',9500.00,'pagado',NULL),(11,3,'2025-03-18','detal',15000.00,'parcial',NULL),(12,4,'2025-03-20','mayor',110000.00,'pagado',NULL),(13,NULL,'2025-03-22','detal',6000.00,'pagado',NULL),(14,6,'2025-03-25','mayor',180000.00,'credito',NULL),(15,5,'2025-03-28','detal',14000.00,'pagado',NULL),(16,1,'2025-03-28','detal',10000.00,'pagado',NULL),(17,1,'2026-04-20','detal',0.00,'pagado',NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED,
  PRIMARY KEY (`id`),
  KEY `venta_id` (`venta_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,1,1,2,3500.00,7000.00),(2,1,3,3,2800.00,8400.00),(3,1,12,1,1200.00,1200.00),(4,2,3,20,2500.00,50000.00),(5,2,4,15,2100.00,31500.00),(6,2,11,10,2900.00,29000.00),(7,3,8,2,9000.00,18000.00),(8,3,9,3,4500.00,13500.00),(9,3,10,2,3200.00,6400.00),(10,4,1,10,3100.00,31000.00),(11,4,3,15,2500.00,37500.00),(12,4,5,5,4000.00,20000.00),(13,5,7,6,1000.00,6000.00),(14,5,12,2,1200.00,2400.00),(15,5,10,1,3200.00,3200.00),(16,6,13,1,7000.00,7000.00),(17,6,10,1,3200.00,3200.00),(18,7,3,15,2500.00,37500.00),(19,7,11,8,2900.00,23200.00),(20,7,8,2,8000.00,16000.00),(21,8,3,30,2500.00,75000.00),(22,8,8,10,8000.00,80000.00),(23,8,11,15,2900.00,43500.00),(24,9,1,3,3500.00,10500.00),(25,9,9,2,4500.00,9000.00),(26,9,6,1,4000.00,4000.00),(27,10,7,4,1000.00,4000.00),(28,10,12,3,1200.00,3600.00),(29,10,10,1,3200.00,3200.00),(30,11,2,1,10000.00,10000.00),(31,11,9,1,4500.00,4500.00),(32,12,3,20,2500.00,50000.00),(33,12,4,15,2100.00,31500.00),(34,12,15,10,2300.00,23000.00),(35,13,7,3,1000.00,3000.00),(36,13,12,1,1200.00,1200.00),(37,13,10,1,3200.00,3200.00),(38,14,8,8,8000.00,64000.00),(39,14,3,20,2500.00,50000.00),(40,14,11,10,2900.00,29000.00),(41,15,1,2,3500.00,7000.00),(42,15,6,1,4000.00,4000.00),(43,15,13,1,7000.00,7000.00);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-20 20:16:18
