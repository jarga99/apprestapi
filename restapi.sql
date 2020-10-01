-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: restapi
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `tb_akses_token`
--

DROP TABLE IF EXISTS `tb_akses_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_akses_token` (
  `id_akses_token` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `akses_token` text,
  `ip_address` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_akses_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_akses_token`
--

LOCK TABLES `tb_akses_token` WRITE;
/*!40000 ALTER TABLE `tb_akses_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_akses_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_krs`
--

DROP TABLE IF EXISTS `tb_krs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_krs` (
  `id_krs` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_krs` date DEFAULT NULL,
  `id_matakuliah` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_krs`),
  KEY `id_mahasiswa` (`id_mahasiswa`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `tb_krs_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `tb_mahasiswa` (`id_mahasiswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_krs_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `tb_matakuliah` (`id_matakuliah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_krs`
--

LOCK TABLES `tb_krs` WRITE;
/*!40000 ALTER TABLE `tb_krs` DISABLE KEYS */;
INSERT INTO `tb_krs` VALUES (1,'2020-09-29',1,5),(2,'2020-09-29',2,5),(3,'2020-09-29',4,7),(4,'2020-09-29',3,8),(5,'2020-09-29',6,5),(6,'2020-09-29',8,5),(7,'2020-09-29',4,4),(8,'2020-09-29',4,4),(9,'2020-09-29',5,9),(10,'2020-09-29',3,10),(11,'2020-09-29',2,11),(12,'2020-09-29',5,12);
/*!40000 ALTER TABLE `tb_krs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mahasiswa`
--

DROP TABLE IF EXISTS `tb_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `nim` int(20) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mahasiswa`
--

LOCK TABLES `tb_mahasiswa` WRITE;
/*!40000 ALTER TABLE `tb_mahasiswa` DISABLE KEYS */;
INSERT INTO `tb_mahasiswa` VALUES (4,882109,'zephiro','teknik informatika'),(5,122348,'santi','manajemen akuntansi'),(7,123401,'abdul','teknik informatika'),(8,12234,'Jarga','Teknik Informatika'),(9,12220,'Doni','Teknik Informatika'),(10,12230,'Dani','Teknik Informatika'),(11,12250,'Hardi','Teknik Informatika'),(12,12237,'Elang','Teknik Informatika');
/*!40000 ALTER TABLE `tb_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_matakuliah`
--

DROP TABLE IF EXISTS `tb_matakuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_matakuliah` (
  `id_matakuliah` int(11) NOT NULL AUTO_INCREMENT,
  `matakuliah` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_matakuliah`
--

LOCK TABLES `tb_matakuliah` WRITE;
/*!40000 ALTER TABLE `tb_matakuliah` DISABLE KEYS */;
INSERT INTO `tb_matakuliah` VALUES (1,'Web Programing',3),(2,'Mobile Programing',4),(3,'Framework Programing',3),(4,'DBMS',4),(5,'Computer Network',3),(6,'Acounting',3),(7,'Algoritma Dasar',3),(8,'Manajemen Proyek',3);
/*!40000 ALTER TABLE `tb_matakuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `isVerified` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 15:06:42
