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
-- Table structure for table `abonos_clientes`
--

DROP TABLE IF EXISTS `abonos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abonos_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `venta_id` (`venta_id`),
  CONSTRAINT `abonos_clientes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `abonos_clientes_ibfk_2` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_clientes`
--

LOCK TABLES `abonos_clientes` WRITE;
/*!40000 ALTER TABLE `abonos_clientes` DISABLE KEYS */;
INSERT INTO `abonos_clientes` VALUES (1,2,2,'2025-03-10',50000.00,NULL),(2,3,3,'2025-03-12',20000.00,NULL),(3,6,8,'2025-03-20',100000.00,NULL),(4,3,11,'2025-03-25',8000.00,NULL),(5,6,14,'2025-03-30',80000.00,NULL);
/*!40000 ALTER TABLE `abonos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abonos_proveedores`
--

DROP TABLE IF EXISTS `abonos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abonos_proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `compra_id` (`compra_id`),
  CONSTRAINT `abonos_proveedores_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `abonos_proveedores_ibfk_2` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos_proveedores`
--

LOCK TABLES `abonos_proveedores` WRITE;
/*!40000 ALTER TABLE `abonos_proveedores` DISABLE KEYS */;
INSERT INTO `abonos_proveedores` VALUES (1,1,1,'2025-03-10',150000.00,NULL),(2,1,1,'2025-03-20',120000.00,NULL),(3,4,4,'2025-03-18',200000.00,NULL);
/*!40000 ALTER TABLE `abonos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Lácteos','Productos a base de leche como: leche, queso, yogurt, manteniquilla... etc'),(2,'Granos y Legumbres','Arroz, frijoles, lentejas, maíz'),(3,'Bebidas','Jugos, gaseosas, agua, café'),(4,'Aceites y Grasas','Aceite vegetal, manteca'),(5,'Enlatados','Atún, sardinas, tomate enlatado'),(6,'Panadería','Pan, galletas, cereales'),(7,'Condimentos','Sal, azúcar, especias, salsas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` enum('detal','mayor') NOT NULL DEFAULT 'detal',
  `credito_habilitado` tinyint(1) DEFAULT 0,
  `limite_credito` decimal(10,2) DEFAULT 0.00,
  `saldo_deuda` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'María López','3001234567','Cra 5 #12-34','detal',0,0.00,0.00),(2,'Supermercado El Ahorro','3109876543','Av. Principal #100','mayor',1,500000.00,120000.00),(3,'Carlos Martínez','3157654321','Calle 8 #23-10','detal',1,80000.00,35000.00),(4,'Tienda Don Pedro','3204567890','Barrio Centro #5','mayor',1,300000.00,0.00),(5,'Ana Gómez','3012345678','Cra 10 #45-67','detal',0,0.00,0.00),(6,'Distribuidora Norte','3185432109','Zona Industrial #22','mayor',1,800000.00,250000.00),(7,'Juan Pérez','3001112233','Calle 15 #8-20','detal',0,0.00,0.00);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado_pago` enum('pagado','credito','parcial') NOT NULL DEFAULT 'pagado',
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,'2025-03-01',450000.00,'credito',NULL),(2,2,'2025-03-02',320000.00,'pagado',NULL),(3,3,'2025-03-05',280000.00,'pagado',NULL),(4,4,'2025-03-08',350000.00,'credito',NULL),(5,1,'2025-03-15',380000.00,'pagado',NULL),(6,5,'2025-03-18',210000.00,'pagado',NULL),(7,2,'2025-03-22',290000.00,'pagado',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED,
  PRIMARY KEY (`id`),
  KEY `compra_id` (`compra_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,1,1,60,2800.00,168000.00),(2,1,2,15,8000.00,120000.00),(3,2,3,80,2200.00,176000.00),(4,2,4,50,1800.00,90000.00),(5,2,15,40,2000.00,80000.00),(6,3,5,40,3500.00,140000.00),(7,3,6,20,3000.00,60000.00),(8,3,7,60,600.00,36000.00),(9,3,13,10,5500.00,55000.00),(10,4,8,30,7000.00,210000.00),(11,5,1,50,2800.00,140000.00),(12,5,2,10,8000.00,80000.00),(13,6,9,30,3500.00,105000.00),(14,6,14,25,2800.00,70000.00),(15,7,3,60,2200.00,132000.00),(16,7,11,50,2600.00,130000.00),(17,7,12,40,800.00,32000.00);
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
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

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_gasto_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_gasto_id` (`tipo_gasto_id`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`tipo_gasto_id`) REFERENCES `tipos_gasto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,1,'2025-03-31',4280000.00,'Nómina marzo 2025'),(2,2,'2025-03-05',1200000.00,'Arriendo marzo 2025'),(3,3,'2025-03-10',85000.00,'Factura agua marzo'),(4,4,'2025-03-12',320000.00,'Factura luz marzo'),(5,5,'2025-03-05',75000.00,'Internet marzo 2025'),(6,6,'2025-03-28',350000.00,'Honorarios contador marzo');
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta_detal` decimal(10,2) NOT NULL,
  `precio_venta_mayor` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 5,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Leche entera 1L',1,2800.00,3500.00,3100.00,118,20,1),(2,'Queso blanco 500g',1,8000.00,10000.00,9000.00,45,10,1),(3,'Arroz blanco 1kg',2,2200.00,2800.00,2500.00,200,30,1),(4,'Frijoles negros 500g',2,1800.00,2400.00,2100.00,150,20,1),(5,'Gaseosa Cola 2L',3,3500.00,4500.00,4000.00,80,15,1),(6,'Jugo de naranja 1L',3,3000.00,4000.00,3500.00,60,10,1),(7,'Agua 600ml',3,600.00,1000.00,800.00,200,30,1),(8,'Aceite vegetal 1L',4,7000.00,9000.00,8000.00,70,10,1),(9,'Atún en lata 160g',5,3500.00,4500.00,4000.00,90,15,1),(10,'Galletas soda x12',6,2500.00,3200.00,2900.00,110,20,1),(11,'Azúcar 1kg',7,2600.00,3200.00,2900.00,180,25,1),(12,'Sal 500g',7,800.00,1200.00,1000.00,160,20,1),(13,'Café molido 250g',3,5500.00,7000.00,6200.00,55,10,1),(14,'Sardinas en lata 125g',5,2800.00,3500.00,3100.00,75,10,1),(15,'Lentejas 500g',2,2000.00,2600.00,2300.00,130,20,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ofrece_credito` tinyint(1) DEFAULT 0,
  `saldo_pendiente` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Lácteos del Valle','6041234567','Parque Industrial #10',1,180000.00),(2,'Distribuidora Granos S.A.','6049876543','Zona Franca #5',1,0.00),(3,'Bebidas Refrescantes Ltda.','6047654321','Av. Comercial #30',0,0.00),(4,'Aceites y Más','6044567890','Cra Industrial #7',1,95000.00),(5,'Enlatados del Pacífico','6045432109','Puerto Zona #2',0,0.00);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_gasto`
--

DROP TABLE IF EXISTS `tipos_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_gasto`
--

LOCK TABLES `tipos_gasto` WRITE;
/*!40000 ALTER TABLE `tipos_gasto` DISABLE KEYS */;
INSERT INTO `tipos_gasto` VALUES (1,'Nómina','Pago de salarios a trabajadores'),(2,'Arriendo','Pago mensual de arriendo del local'),(3,'Agua','Servicio público de acueducto'),(4,'Luz','Servicio público de energía eléctrica'),(5,'Internet','Servicio de conectividad'),(6,'Honorarios contables','Pago al contador externo');
/*!40000 ALTER TABLE `tipos_gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'Luis Herrera','Administrador',1800000.00,'2020-01-15',1),(2,'Sandra Ríos','Vendedora',1160000.00,'2021-03-01',1),(3,'Miguel Torres','Bodeguero',1160000.00,'2022-06-15',1),(4,'Paula Díaz','Cajera',1160000.00,'2023-01-10',1);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-20 20:11:20
