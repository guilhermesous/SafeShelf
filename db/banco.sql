CREATE DATABASE  IF NOT EXISTS `django` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `django`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: django
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Administradores');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add produto',7,'add_produto'),(26,'Can change produto',7,'change_produto'),(27,'Can delete produto',7,'delete_produto'),(28,'Can view produto',7,'view_produto'),(29,'Can add estoque',8,'add_estoque'),(30,'Can change estoque',8,'change_estoque'),(31,'Can delete estoque',8,'delete_estoque'),(32,'Can view estoque',8,'view_estoque'),(33,'Can add perfil',9,'add_perfil'),(34,'Can change perfil',9,'change_perfil'),(35,'Can delete perfil',9,'delete_perfil'),(36,'Can view perfil',9,'view_perfil');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$xXZFZjL6Lk75BeYWGl9Wwf$pUl78UB6uxmxgjkbQkzSZN8McsAGa006letxrmnm80A=','2024-02-01 22:56:24.340173',1,'adm','','','adm@adm.com',1,1,'2024-01-21 22:40:25.000000'),(3,'pbkdf2_sha256$720000$2MoytFBtMBOVRTo0k042Kg$UDYVLn6+jzpe8MIGP0TMNZMbQID6qkbX/HXGSi6OW+g=','2024-02-01 22:56:13.979012',0,'gui','','','guilherme.sousathe@gmail.com',0,1,'2024-01-25 19:01:51.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,1,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-21 22:57:41.362916','1','Arroz 1kg',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',7,1),(2,'2024-01-21 22:58:52.801983','1','Arroz 1kg',2,'[{\"changed\": {\"fields\": [\"Tipo\"]}}]',7,1),(3,'2024-01-22 10:45:25.504729','1','Grupo Teste',1,'[{\"added\": {}}]',3,1),(4,'2024-01-22 10:47:49.828986','2','teste',1,'[{\"added\": {}}]',4,1),(5,'2024-01-22 10:49:38.544546','2','teste',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(6,'2024-01-22 11:38:15.571702','2','teste',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(7,'2024-01-22 13:33:20.132877','2','teste',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(8,'2024-01-25 19:01:17.327636','2','teste',3,'',4,1),(9,'2024-01-25 19:01:22.850167','1','Grupo Teste',3,'',3,1),(10,'2024-01-25 19:01:52.102827','3','gui',1,'[{\"added\": {}}]',4,1),(11,'2024-01-25 19:33:17.031552','6','Fardo de Nescau Prontinho 200ml (2024-04-15)',3,'',8,1),(12,'2024-01-25 22:20:18.486275','9','Fardo de CHOCOLATE GAROTO TALENTO CASTANHA 85G (2024-07-06)',3,'',8,1),(13,'2024-01-27 12:00:43.811749','2','Administradores',1,'[{\"added\": {}}]',3,1),(14,'2024-01-27 12:00:56.333515','1','adm',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(15,'2024-01-27 12:29:37.419642','1','adm@safeshelf.com.br',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(16,'2024-01-27 12:29:49.392197','3','guilherme.sousathe@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(17,'2024-01-27 12:30:24.484364','1','adm',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(18,'2024-01-27 12:30:33.363492','3','gui',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(19,'2024-01-27 12:56:31.479714','3','gui',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(20,'2024-01-27 12:57:07.276166','3','gui',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(21,'2024-01-27 14:09:30.335558','5','angelo',3,'',4,1),(22,'2024-01-27 14:09:30.343221','6','iguyvbviv',3,'',4,1),(23,'2024-01-27 14:09:30.353816','4','nic',3,'',4,1),(24,'2024-01-27 15:50:10.394451','3','gui',1,'[{\"added\": {}}]',9,1),(25,'2024-01-27 17:19:34.466607','3','gui',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(26,'2024-01-27 19:07:10.635589','3','gui',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(27,'2024-01-27 19:39:19.813591','3','gui',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(28,'2024-01-27 20:12:18.774136','3','gui',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(29,'2024-01-27 23:00:56.249944','7','angelo',3,'',4,1),(30,'2024-01-27 23:00:56.259662','8','filipe',3,'',4,1),(31,'2024-01-27 23:00:56.268823','9','guilherme.sousa',3,'',4,1),(32,'2024-01-27 23:02:07.489937','5','adm',1,'[{\"added\": {}}]',9,1),(33,'2024-01-28 01:57:10.312678','11','guilherme.santos',3,'',4,1),(34,'2024-01-28 01:57:10.325678','10','guilherme.sousa',3,'',4,1),(35,'2024-01-28 01:57:21.601158','3','gui',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(36,'2024-01-28 02:04:20.963323','3','gui',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(37,'2024-01-28 19:55:19.563906','35','Produto 16',3,'',7,1),(38,'2024-01-28 19:55:19.574500','34','Produto 15',3,'',7,1),(39,'2024-01-28 19:55:19.583921','33','Produto 14',3,'',7,1),(40,'2024-01-28 19:55:19.593013','32','Produto 13',3,'',7,1),(41,'2024-01-28 19:55:19.599282','31','Produto 12',3,'',7,1),(42,'2024-01-28 19:55:19.607353','30','Produto 11',3,'',7,1),(43,'2024-01-28 19:55:19.620671','28','Produto 9',3,'',7,1),(44,'2024-01-28 19:55:19.633896','27','Produto 8',3,'',7,1),(45,'2024-01-28 19:55:19.643268','26','Produto 7',3,'',7,1),(46,'2024-01-28 19:55:19.650614','25','Produto 6',3,'',7,1),(47,'2024-01-28 19:55:19.660007','24','Produto 5',3,'',7,1),(48,'2024-01-28 19:55:19.670615','23','Produto 4',3,'',7,1),(49,'2024-01-28 19:55:19.698781','22','Produto 3',3,'',7,1),(50,'2024-01-28 19:55:19.729867','21','Produto 2',3,'',7,1),(51,'2024-01-28 19:55:19.738620','20','Produto 1',3,'',7,1),(52,'2024-01-28 20:51:36.454379','51','Produto 16',3,'',7,1),(53,'2024-01-28 20:51:36.464970','50','Produto 15',3,'',7,1),(54,'2024-01-28 20:51:36.474444','49','Produto 14',3,'',7,1),(55,'2024-01-28 20:51:36.488320','48','Produto 13',3,'',7,1),(56,'2024-01-28 20:51:36.497441','47','Produto 12',3,'',7,1),(57,'2024-01-28 20:51:36.504793','46','Produto 11',3,'',7,1),(58,'2024-01-28 20:51:36.513608','45','Produto 10',3,'',7,1),(59,'2024-01-28 20:51:36.525842','44','Produto 9',3,'',7,1),(60,'2024-01-28 20:51:36.538716','43','Produto 8',3,'',7,1),(61,'2024-01-28 20:51:36.550657','42','Produto 7',3,'',7,1),(62,'2024-01-28 20:51:36.560750','41','Produto 6',3,'',7,1),(63,'2024-01-28 20:51:36.568549','40','Produto 5',3,'',7,1),(64,'2024-01-28 20:51:36.584588','39','Produto 4',3,'',7,1),(65,'2024-01-28 20:51:36.594634','38','Produto 3',3,'',7,1),(66,'2024-01-28 20:51:36.602887','37','Produto 2',3,'',7,1),(67,'2024-01-28 20:51:36.609618','36','Produto 1',3,'',7,1),(68,'2024-01-28 20:51:36.618752','19','SORVETE KIBON BLAST SNICKERS 800ML',3,'',7,1),(69,'2024-01-28 20:51:36.627797','18','CHOCOLATE NESTLE GALAK MAIS CREMOSO 80G',3,'',7,1),(70,'2024-01-28 20:51:36.635928','17','CHOCOLATE NESTLÉ CRUNCH 80G',3,'',7,1),(71,'2024-01-28 20:51:36.645072','16','AMACIANTE',3,'',7,1),(72,'2024-01-28 20:51:36.653180','14','CHOCOLATE GAROTO MEIO AMARGO 80G',3,'',7,1),(73,'2024-01-28 20:51:36.663534','13','CHOCOLATE GAROTO TALENTO NIBS DE CACAU E DARK 70% 75G',3,'',7,1),(74,'2024-01-28 20:51:36.672104','12','CHOCOLATE GAROTO TALENTO CASTANHA 85G',3,'',7,1),(75,'2024-01-28 20:51:36.686619','11','CHOCOLATE KIT KAT 4 FINGER BRANCO 41,5G',3,'',7,1),(76,'2024-01-28 20:51:36.700466','10','TABLETE CHOCOLATE ALPINO DARK MILK 61% INTENSE 85G',3,'',7,1),(77,'2024-01-28 20:51:36.708766','8','Arroz Soltinho 1kg',3,'',7,1),(78,'2024-01-28 20:51:36.718652','7','Nescau Prontinho 200ml',3,'',7,1),(79,'2024-01-29 23:19:02.861719','43','Fardo de Produto 19 (2024-02-12)',3,'',8,1),(80,'2024-01-29 23:19:02.871273','42','Fardo de Produto 18 (2024-02-11)',3,'',8,1),(81,'2024-01-29 23:19:02.881964','41','Fardo de Produto 17 (2024-02-10)',3,'',8,1),(82,'2024-01-29 23:19:02.890783','40','Fardo de Produto 16 (2024-02-09)',3,'',8,1),(83,'2024-01-29 23:19:02.898146','39','Fardo de Produto 15 (2024-02-08)',3,'',8,1),(84,'2024-01-29 23:19:02.904286','38','Fardo de Produto 14 (2024-02-07)',3,'',8,1),(85,'2024-01-29 23:19:02.912845','37','Fardo de Produto 13 (2024-02-06)',3,'',8,1),(86,'2024-01-29 23:19:02.920497','36','Fardo de Produto 12 (2024-02-05)',3,'',8,1),(87,'2024-01-29 23:19:02.929819','35','Fardo de Produto 11 (2024-02-04)',3,'',8,1),(88,'2024-01-29 23:19:02.939959','34','Fardo de Produto 10 (2024-02-03)',3,'',8,1),(89,'2024-01-29 23:19:02.951605','33','Fardo de Produto 9 (2024-02-02)',3,'',8,1),(90,'2024-01-29 23:19:02.963971','32','Fardo de Produto 8 (2024-02-01)',3,'',8,1),(91,'2024-01-29 23:19:02.975300','31','Fardo de Produto 7 (2024-01-31)',3,'',8,1),(92,'2024-01-29 23:19:02.982169','30','Fardo de Produto 6 (2024-01-30)',3,'',8,1),(93,'2024-01-29 23:19:02.991009','29','Fardo de Produto 5 (2024-01-29)',3,'',8,1),(94,'2024-01-29 23:19:02.999860','28','Fardo de Produto 4 (2024-01-28)',3,'',8,1),(95,'2024-01-29 23:19:03.008606','27','Fardo de Produto 3 (2024-01-27)',3,'',8,1),(96,'2024-01-29 23:19:03.017205','26','Fardo de Produto 2 (2024-01-26)',3,'',8,1),(97,'2024-01-29 23:19:03.024217','25','Fardo de Produto 1 (2024-01-25)',3,'',8,1),(98,'2024-01-29 23:19:03.031458','24','Fardo de Produto 6 (2024-02-05)',3,'',8,1),(99,'2024-01-29 23:19:03.039628','23','Fardo de Produto 13 (2024-01-01)',3,'',8,1),(100,'2024-01-29 23:19:03.048029','22','Fardo de Produto 3 (2024-02-01)',3,'',8,1),(101,'2024-01-29 23:19:03.058486','21','Fardo de Produto 1 (2024-05-08)',3,'',8,1),(102,'2024-01-29 23:33:06.400992','63','Fardo de Produto 20 (2024-02-13)',3,'',8,1),(103,'2024-01-29 23:33:06.411466','62','Fardo de Produto 19 (2024-02-12)',3,'',8,1),(104,'2024-01-29 23:33:06.424093','61','Fardo de Produto 18 (2024-02-11)',3,'',8,1),(105,'2024-01-29 23:33:06.432594','60','Fardo de Produto 17 (2024-02-10)',3,'',8,1),(106,'2024-01-29 23:33:06.442580','59','Fardo de Produto 16 (2024-02-09)',3,'',8,1),(107,'2024-01-29 23:33:06.452034','58','Fardo de Produto 15 (2024-02-08)',3,'',8,1),(108,'2024-01-29 23:33:06.461819','57','Fardo de Produto 14 (2024-02-07)',3,'',8,1),(109,'2024-01-29 23:33:06.471580','56','Fardo de Produto 13 (2024-02-06)',3,'',8,1),(110,'2024-01-29 23:33:06.478633','55','Fardo de Produto 12 (2024-02-05)',3,'',8,1),(111,'2024-01-29 23:33:06.488476','54','Fardo de Produto 11 (2024-02-04)',3,'',8,1),(112,'2024-01-29 23:33:06.495169','53','Fardo de Produto 10 (2024-02-03)',3,'',8,1),(113,'2024-01-29 23:33:06.504595','52','Fardo de Produto 9 (2024-02-02)',3,'',8,1),(114,'2024-01-29 23:33:06.513484','51','Fardo de Produto 8 (2024-02-01)',3,'',8,1),(115,'2024-01-29 23:33:06.522634','50','Fardo de Produto 7 (2024-01-31)',3,'',8,1),(116,'2024-01-29 23:33:06.537065','49','Fardo de Produto 6 (2024-01-30)',3,'',8,1),(117,'2024-01-29 23:33:06.546099','48','Fardo de Produto 5 (2024-01-29)',3,'',8,1),(118,'2024-01-29 23:33:06.554401','47','Fardo de Produto 4 (2024-01-28)',3,'',8,1),(119,'2024-01-29 23:33:06.561501','46','Fardo de Produto 3 (2024-01-27)',3,'',8,1),(120,'2024-01-29 23:33:06.571070','45','Fardo de Produto 2 (2024-01-26)',3,'',8,1),(121,'2024-01-29 23:33:06.580339','44','Fardo de Produto 1 (2024-01-25)',3,'',8,1),(122,'2024-02-01 01:13:17.891486','124','outro teste',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',7,1),(123,'2024-02-01 17:21:11.521799','120','Produto 19',3,'',7,1),(124,'2024-02-01 17:21:11.532027','119','Produto 18',3,'',7,1),(125,'2024-02-01 17:21:11.540340','118','Produto 17',3,'',7,1),(126,'2024-02-01 17:21:11.546542','117','Produto 16',3,'',7,1),(127,'2024-02-01 17:21:11.557457','116','Produto 15',3,'',7,1),(128,'2024-02-01 17:21:11.570106','115','Produto 14',3,'',7,1),(129,'2024-02-01 17:21:11.579337','114','Produto 13',3,'',7,1),(130,'2024-02-01 17:21:11.587710','113','Produto 12',3,'',7,1),(131,'2024-02-01 17:21:11.597457','112','Produto 11',3,'',7,1),(132,'2024-02-01 17:21:11.604149','111','Produto 10',3,'',7,1),(133,'2024-02-01 17:21:11.613146','110','Produto 9',3,'',7,1),(134,'2024-02-01 17:21:11.623265','109','Produto 8',3,'',7,1),(135,'2024-02-01 17:21:11.631060','108','Produto 7',3,'',7,1),(136,'2024-02-01 17:21:11.642267','107','Produto 6',3,'',7,1),(137,'2024-02-01 17:21:11.657201','106','Produto 5',3,'',7,1),(138,'2024-02-01 17:21:11.673671','105','Produto 4',3,'',7,1),(139,'2024-02-01 17:21:11.683672','104','Produto 3',3,'',7,1),(140,'2024-02-01 17:21:11.692504','103','Produto 2',3,'',7,1),(141,'2024-02-01 17:21:11.703374','102','Produto 1',3,'',7,1),(142,'2024-02-01 17:21:11.712535','99','Produto 48',3,'',7,1),(143,'2024-02-01 17:21:11.719720','98','Produto 47',3,'',7,1),(144,'2024-02-01 17:21:11.728119','97','Produto 46',3,'',7,1),(145,'2024-02-01 17:21:11.737520','96','Produto 45',3,'',7,1),(146,'2024-02-01 17:21:11.747217','95','Produto 44',3,'',7,1),(147,'2024-02-01 17:21:11.753975','94','Produto 43',3,'',7,1),(148,'2024-02-01 17:21:11.763918','93','Produto 42',3,'',7,1),(149,'2024-02-01 17:21:11.772478','92','Produto 41',3,'',7,1),(150,'2024-02-01 17:21:11.778149','91','Produto 40',3,'',7,1),(151,'2024-02-01 17:21:11.788105','90','Produto 39',3,'',7,1),(152,'2024-02-01 17:21:11.794232','89','Produto 38',3,'',7,1),(153,'2024-02-01 17:21:11.802309','88','Produto 37',3,'',7,1),(154,'2024-02-01 17:21:11.812871','87','Produto 36',3,'',7,1),(155,'2024-02-01 17:21:11.819281','86','Produto 35',3,'',7,1),(156,'2024-02-01 17:21:11.828555','85','Produto 34',3,'',7,1),(157,'2024-02-01 17:21:11.836275','84','Produto 33',3,'',7,1),(158,'2024-02-01 17:21:11.844269','83','Produto 32',3,'',7,1),(159,'2024-02-01 17:21:11.854660','82','Produto 31',3,'',7,1),(160,'2024-02-01 17:21:11.866387','81','Produto 30',3,'',7,1),(161,'2024-02-01 17:21:11.872210','80','Produto 29',3,'',7,1),(162,'2024-02-01 17:21:11.877474','79','Produto 28',3,'',7,1),(163,'2024-02-01 17:21:11.883045','78','Produto 27',3,'',7,1),(164,'2024-02-01 17:21:11.891826','77','Produto 26',3,'',7,1),(165,'2024-02-01 17:21:11.905262','76','Produto 25',3,'',7,1),(166,'2024-02-01 17:21:11.911590','75','Produto 24',3,'',7,1),(167,'2024-02-01 17:21:11.918681','74','Produto 23',3,'',7,1),(168,'2024-02-01 17:21:11.925339','73','Produto 22',3,'',7,1),(169,'2024-02-01 17:21:11.937311','72','Produto 21',3,'',7,1),(170,'2024-02-01 17:21:11.948172','71','Produto 20',3,'',7,1),(171,'2024-02-01 17:21:11.957358','70','Produto 19',3,'',7,1),(172,'2024-02-01 17:21:11.965999','69','Produto 18',3,'',7,1),(173,'2024-02-01 17:21:11.975508','68','Produto 17',3,'',7,1),(174,'2024-02-01 17:21:11.982514','67','Produto 16',3,'',7,1),(175,'2024-02-01 17:21:11.991501','66','Produto 15',3,'',7,1),(176,'2024-02-01 17:21:12.006239','65','Produto 14',3,'',7,1),(177,'2024-02-01 17:21:12.017256','64','Produto 13',3,'',7,1),(178,'2024-02-01 17:21:12.026346','63','Produto 12',3,'',7,1),(179,'2024-02-01 17:21:12.035241','62','Produto 11',3,'',7,1),(180,'2024-02-01 17:21:12.045190','61','Produto 10',3,'',7,1),(181,'2024-02-01 17:21:12.051667','60','Produto 9',3,'',7,1),(182,'2024-02-01 17:21:12.061307','59','Produto 8',3,'',7,1),(183,'2024-02-01 17:21:12.073364','58','Produto 7',3,'',7,1),(184,'2024-02-01 17:21:12.083221','57','Produto 6',3,'',7,1),(185,'2024-02-01 17:21:12.091562','56','Produto 5',3,'',7,1),(186,'2024-02-01 17:21:12.103658','55','Produto 4',3,'',7,1),(187,'2024-02-01 17:21:12.111537','54','Produto 3',3,'',7,1),(188,'2024-02-01 17:21:12.122852','53','Produto 2',3,'',7,1),(189,'2024-02-01 17:21:12.135848','52','Produto 1',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'meuApp','estoque'),(7,'meuApp','produto'),(6,'sessions','session'),(9,'usuarios','perfil');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-21 17:46:17.301840'),(2,'auth','0001_initial','2024-01-21 17:46:19.320652'),(3,'admin','0001_initial','2024-01-21 17:46:19.750360'),(4,'admin','0002_logentry_remove_auto_add','2024-01-21 17:46:19.760455'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-21 17:46:19.771290'),(6,'contenttypes','0002_remove_content_type_name','2024-01-21 17:46:19.967212'),(7,'auth','0002_alter_permission_name_max_length','2024-01-21 17:46:20.120272'),(8,'auth','0003_alter_user_email_max_length','2024-01-21 17:46:20.180301'),(9,'auth','0004_alter_user_username_opts','2024-01-21 17:46:20.190215'),(10,'auth','0005_alter_user_last_login_null','2024-01-21 17:46:20.339962'),(11,'auth','0006_require_contenttypes_0002','2024-01-21 17:46:20.355556'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-21 17:46:20.369031'),(13,'auth','0008_alter_user_username_max_length','2024-01-21 17:46:20.540062'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-21 17:46:20.720282'),(15,'auth','0010_alter_group_name_max_length','2024-01-21 17:46:20.759954'),(16,'auth','0011_update_proxy_permissions','2024-01-21 17:46:20.773251'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-21 17:46:20.960335'),(18,'meuApp','0001_initial','2024-01-21 17:46:21.033685'),(19,'sessions','0001_initial','2024-01-21 17:46:21.147851'),(20,'meuApp','0002_estoque','2024-01-21 17:48:02.260224'),(21,'meuApp','0002_estoque_usuario_produto_usuario','2024-01-25 18:58:45.208136'),(22,'meuApp','0003_alter_estoque_usuario_alter_produto_usuario','2024-01-25 18:59:45.377794'),(23,'usuarios','0001_initial','2024-01-27 15:14:32.315570'),(24,'meuApp','0002_alter_estoque_codproduto_and_more','2024-01-29 11:45:24.075362'),(25,'usuarios','0002_alter_perfil_nomecompleto','2024-01-29 11:45:24.102545'),(26,'meuApp','0003_produto_imagem','2024-01-31 22:57:59.559328'),(27,'meuApp','0004_alter_produto_imagem','2024-01-31 23:04:45.309727'),(28,'meuApp','0005_alter_produto_imagem','2024-02-01 00:57:05.040219');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1il77z4wdgm9vnb7gackag3rf8690etp','.eJxVjMsOwiAQRf-FtSHQMgVcuvcbmhlmkKqBpI-V8d-1SRe6veec-1IjbmsZt0XmcWJ1VladfjfC9JC6A75jvTWdWl3nifSu6IMu-tpYnpfD_TsouJRvDcY6jmKZfOcggEUw7MPQeYMofe9APFL0WWgQoMBAOSdJxsUIkrN6fwDVUjhy:1rTrUH:H4vhJ9YVnt4Uy0DGC5YfzYHN6b2DizxZm0Tftn1-RRg','2024-02-10 22:49:21.842081'),('28fgc2q6c4lprk1b49yhct3t20f031rd','.eJxVjMEOwiAQRP-FsyGAGwoevfsNZHdZpGpoUtqT8d9tkx70OPPezFslXJea1i5zGrO6qLM6_XaE_JS2g_zAdp80T22ZR9K7og_a9W3K8roe7t9BxV63NVtTuAQi8BiJnOGAbDh6S-jA5oCxANAAUWBwW_JObJbsJRpPHtXnCwZJOJA:1rVMEA:C9ddvJpsVgXuGYXV-DHjuiEI2MYxw48PT41hfr1HI8A','2024-02-15 01:50:54.998723'),('5n4szx5neyilyggno5l0jxe91bb1n8ub','.eJxVjMsOwiAQRf-FtSHQMgVcuvcbmhlmkKqBpI-V8d-1SRe6veec-1IjbmsZt0XmcWJ1VladfjfC9JC6A75jvTWdWl3nifSu6IMu-tpYnpfD_TsouJRvDcY6jmKZfOcggEUw7MPQeYMofe9APFL0WWgQoMBAOSdJxsUIkrN6fwDVUjhy:1rUBEt:Rd7TJVeU5L31fhgZpkiQzONZdSJThIW9NxURgJ2BbJA','2024-02-11 19:54:47.224377'),('6u7gdqkmlt5qyym64g0xds8yjrbs9cgt','.eJxVjDsOwjAQBe_iGlnxb7Ep6TmDteu1cQA5UpxUiLuTSCmgfTPz3iLiutS49jzHkcVFGHH63QjTM7cd8APbfZJpass8ktwVedAubxPn1_Vw_w4q9rrVUMiQYQdBWyI_JAwlWVRWAfE5b8wrKEyKtXdDCFYHAFS-JGeK4yw-X-6nOAs:1rUBPV:NVq9HwkgI5Id4n2ssk9C_WlO9mNO_YDfcEYmFeyYkqU','2024-02-11 20:05:45.452337'),('75afblnsppacnoe4jrh1k1fwb9f89nwq','.eJxVjMEOwiAQRP-FsyGAGwoevfsNZHdZpGpoUtqT8d9tkx70OPPezFslXJea1i5zGrO6qLM6_XaE_JS2g_zAdp80T22ZR9K7og_a9W3K8roe7t9BxV63NVtTuAQi8BiJnOGAbDh6S-jA5oCxANAAUWBwW_JObJbsJRpPHtXnCwZJOJA:1rUQmh:saQ7jsf63s3s9aRv6prNieEDzdfAdFv9BCYw4LpeGkg','2024-02-12 12:30:43.812123'),('fzrs49vfuiwk87v2reaxgf1aj3tqueuf','.eJxVjMsOwiAQRf-FtSHQMgVcuvcbmhlmkKqBpI-V8d-1SRe6veec-1IjbmsZt0XmcWJ1VladfjfC9JC6A75jvTWdWl3nifSu6IMu-tpYnpfD_TsouJRvDcY6jmKZfOcggEUw7MPQeYMofe9APFL0WWgQoMBAOSdJxsUIkrN6fwDVUjhy:1rTpFp:pH3HqgYa6UOCEuJTnGfhlSI5P3QdAxgakH_w5XkFIFo','2024-02-10 20:26:17.131565'),('y1uq4sggei50fds37pjgcop03tm36c9i','.eJxVjMsOwiAQRf-FtSHQMgVcuvcbmhlmkKqBpI-V8d-1SRe6veec-1IjbmsZt0XmcWJ1VladfjfC9JC6A75jvTWdWl3nifSu6IMu-tpYnpfD_TsouJRvDcY6jmKZfOcggEUw7MPQeYMofe9APFL0WWgQoMBAOSdJxsUIkrN6fwDVUjhy:1rVfyq:BkiSSLHj38DqvwyDu2h59wYpXK87eAPvJbYOTGmvB2s','2024-02-15 22:56:24.416804');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meuapp_estoque`
--

DROP TABLE IF EXISTS `meuapp_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meuapp_estoque` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `dataFabricacao` date NOT NULL,
  `dataValidade` date NOT NULL,
  `codProduto_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meuApp_estoque_codProduto_id_c3843b9c_fk_meuApp_produto_id` (`codProduto_id`),
  KEY `meuApp_estoque_usuario_id_49f1b7a2_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `meuApp_estoque_codProduto_id_c3843b9c_fk_meuApp_produto_id` FOREIGN KEY (`codProduto_id`) REFERENCES `meuapp_produto` (`id`),
  CONSTRAINT `meuApp_estoque_usuario_id_49f1b7a2_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meuapp_estoque`
--

LOCK TABLES `meuapp_estoque` WRITE;
/*!40000 ALTER TABLE `meuapp_estoque` DISABLE KEYS */;
INSERT INTO `meuapp_estoque` VALUES (104,15,'2024-01-01','2024-11-09',129,1),(105,40,'2024-02-01','2025-01-01',131,1),(106,9,'2024-01-01','2024-05-05',130,1);
/*!40000 ALTER TABLE `meuapp_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meuapp_produto`
--

DROP TABLE IF EXISTS `meuapp_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meuapp_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` longtext NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `marca` longtext NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `usuario_id` int NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meuApp_produto_usuario_id_69efd647_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `meuApp_produto_usuario_id_69efd647_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meuapp_produto`
--

LOCK TABLES `meuapp_produto` WRITE;
/*!40000 ALTER TABLE `meuapp_produto` DISABLE KEYS */;
INSERT INTO `meuapp_produto` VALUES (129,'Achocolatado Pó Nescau Lata 670g','Alimento','Nescau',16.05,1,'images/24894389.webp'),(130,'Nuggets de Frango Crocante SADIA 300g','Alimento','Sadia',7.79,1,'images/657909.webp'),(131,'Arroz Agulhinha Tipo 1 TIO JOÃO Pacote 1kg','Alimento','Tio João',7.99,1,'images/612893.webp');
/*!40000 ALTER TABLE `meuapp_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_perfil`
--

DROP TABLE IF EXISTS `usuarios_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `usuarios_perfil_usuario_id_ca6ea2f9_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_perfil`
--

LOCK TABLES `usuarios_perfil` WRITE;
/*!40000 ALTER TABLE `usuarios_perfil` DISABLE KEYS */;
INSERT INTO `usuarios_perfil` VALUES (3,'Guilherme Sousa','(86) 99502-9403',3),(5,'Administrador','999999999999999',1);
/*!40000 ALTER TABLE `usuarios_perfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-03 13:45:32
