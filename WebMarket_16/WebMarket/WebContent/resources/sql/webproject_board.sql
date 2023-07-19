-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: webproject
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `titlenum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `writer` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` timestamp(6) NULL DEFAULT NULL,
  `rating` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`titlenum`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (23,'asdf','12312312','1231232','2023-05-07 18:05:19.215855','5'),(25,'가나다라','ㅁㄴㄻㄴㄻㄴㄻㄴㄹ','asfasfsf','2023-05-06 06:00:00.000000','5'),(29,'나나나나나나','ㅁㄴㅇㅁㄴㅇㅁㄴ','123123','2023-05-06 06:00:00.000000','4'),(30,'asfasf','13123123123','asfasfsf','2023-05-04 06:00:00.000000','3'),(32,'123123213','ㅁㄴㅇㅁㄴㅇ','asfasfsf','2023-05-07 06:00:00.000000','5'),(34,'qwer','ㅁㄴㄻㄴㄻㄴ','asfasfsf','2023-05-07 06:00:00.000000','2'),(35,'qwer','asdasd','asfasfsf','2023-05-07 20:47:48.314420','5'),(36,'wwwee','123123','zzzzzz','2023-05-07 20:50:17.138397','3'),(37,'wwwee','123123456','zzzzzz','2023-05-07 20:50:30.030958','1'),(38,'afsafsafsaf','12312321321','aasd22','2023-05-07 20:52:33.597875','5'),(39,'asfasf','asfasf','131231','2023-05-07 21:02:26.744616','5'),(41,'asdf','12312313','asdf','2023-05-07 22:50:53.111388','2'),(42,'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','asdasd','asdf','2023-05-08 15:40:28.240823','4'),(43,'wweqwe','123123123','125215','2023-05-08 15:58:19.014469','5'),(44,'asdasd2233','123123','12424124','2023-05-08 18:14:51.063902','5'),(45,'wwrrqq','123123','23123','2023-05-09 00:01:15.431479','3'),(46,'123123','wqweqqq','2233wwee','2023-05-09 00:01:56.324319','1'),(47,'asdasd','123123','124124','2023-05-09 00:02:27.697262','5'),(48,'asdasdsad','123123','1241242','2023-05-09 16:08:20.415465','4'),(49,'14214124','124124214','124124','2023-05-09 16:08:29.541237','5'),(50,'가나다라마바사','고고기기가가구구','나나니니나나난','2023-05-09 16:13:50.561540','5'),(51,'123123','1241242','124124','2023-05-09 16:16:05.839723','1'),(55,'2233','12321','asdf','2023-05-14 16:51:36.873301','4'),(58,'7777','123123','asdf','2023-05-14 19:17:30.782947','3'),(59,'안녕하세요','123123','dugaza','2023-05-16 03:11:42.490000','4');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-23 15:46:37
