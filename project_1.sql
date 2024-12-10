-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: project_1
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `aid` varchar(100) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `image` varchar(100) DEFAULT NULL,
  `cseq` int DEFAULT NULL,
  KEY `fk_banner_class1_idx` (`cseq`),
  CONSTRAINT `fk_banner_class1` FOREIGN KEY (`cseq`) REFERENCES `product` (`cseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businessman`
--

DROP TABLE IF EXISTS `businessman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businessman` (
  `id` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `indate` datetime DEFAULT (now()),
  `businessnum` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessman`
--

LOCK TABLES `businessman` WRITE;
/*!40000 ALTER TABLE `businessman` DISABLE KEYS */;
INSERT INTO `businessman` VALUES ('1234','1234','1234','1234','1234','2024-12-03 16:36:44',NULL),('aaaa','aaaa','aaaa','11','aaaa','2024-12-03 17:30:26',NULL),('사업자1','1111','1111','2222','1111','2024-12-03 16:53:10',NULL),('사업자2','1111','222','1111','222','2024-12-03 16:55:24',NULL);
/*!40000 ALTER TABLE `businessman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `cseq` int NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `address1` varchar(1000) DEFAULT NULL,
  `address2` varchar(1000) DEFAULT NULL,
  `address3` varchar(1000) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `bestyn` varchar(45) DEFAULT 'N',
  `indate` datetime DEFAULT (now()),
  `image` varchar(100) DEFAULT NULL,
  `max_people` int DEFAULT NULL,
  PRIMARY KEY (`cseq`),
  KEY `fk1_idx` (`id`),
  CONSTRAINT `fk1` FOREIGN KEY (`id`) REFERENCES `businessman` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,20000,'사업자1','크로와상만들기','크로와상 만들기','경기도 고양시','일산동구 장항동 머시기머시기','(장항동)','1','N','2024-12-04 11:55:55','karina.jpg',20),(3,20000,'사업자1','식빵만들기','식빵만들기','경기도 고양시','일산동구 장항동 머시기머시기','(장항동)','1','N','2024-12-04 12:36:56','karina.jpg',20),(4,20000,'사업자2','도넛만들기 ','도넛만들기 ','경기도 고양시','일산동구 장항동 머시기머시기','(장항동)','1','N','2024-12-04 12:38:03','karina.jpg',20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qseq` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `writer1` varchar(45) DEFAULT NULL,
  `reply` varchar(1000) DEFAULT NULL,
  `writer2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`qseq`),
  KEY `fk_id_idx` (`writer1`),
  KEY `qna_fk` (`writer2`),
  CONSTRAINT `fk_id` FOREIGN KEY (`writer1`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `qna_fk` FOREIGN KEY (`writer2`) REFERENCES `businessman` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'결제오류','결제오류에요',' 1111','개인1',NULL,NULL),(2,'결제오류','결제오류에요',' 1111','개인1',NULL,NULL),(3,'결제오류','결제오류에요',' 1111','개인1',NULL,NULL),(4,'결제오류','결제오류에요',' 1111',NULL,NULL,'사업자1'),(5,'결제오류','결제오류에요',' 1111','개인1',NULL,NULL),(6,'예약관련','뭔가 이상해요','2222',NULL,'답변드리기 어렵습니다.','사업자1'),(7,'환불관련','환불해주세요','3333','개인1','즉시 해결하였습니다.',NULL),(8,'이용관련','이용관련','3444','개인1',NULL,NULL);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `people` int DEFAULT '1',
  `classday` date DEFAULT NULL,
  `classtime` time DEFAULT NULL,
  `cseq` int DEFAULT NULL,
  `totalprice` int DEFAULT NULL,
  `payment` varchar(3) DEFAULT 'N',
  `endedclass` varchar(3) DEFAULT 'N',
  PRIMARY KEY (`reseq`),
  KEY `fk2_idx` (`userid`),
  KEY `fk3_idx` (`cseq`),
  CONSTRAINT `fk2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `fk3` FOREIGN KEY (`cseq`) REFERENCES `product` (`cseq`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'개인1',1,'2024-12-04','17:00:00',1,20000,'Y','Y'),(5,'개인1',1,'2024-12-04','17:00:00',1,20000,'N','Y'),(6,'개인1',1,'2024-12-04','17:00:00',1,20000,'N','Y'),(7,'개인1',2,'2024-12-04','20:00:00',4,40000,'N','Y'),(8,'개인1',3,'2024-12-04','20:00:00',3,60000,'N','Y'),(9,'개인1',3,'2024-12-04','20:00:00',3,60000,'N','Y'),(10,'개인1',6,'2024-12-05','20:00:00',1,120000,'N','Y'),(11,'개인1',1,'2024-12-04','17:00:00',1,20000,'N','Y'),(12,NULL,1,NULL,'10:00:00',1,NULL,'Y','Y'),(13,NULL,1,NULL,'15:00:00',1,NULL,'Y','Y'),(14,NULL,1,NULL,'20:00:00',1,NULL,'Y','Y'),(15,NULL,1,NULL,'10:00:00',3,NULL,'Y','Y'),(16,NULL,1,NULL,'15:00:00',3,NULL,'Y','Y'),(17,NULL,1,NULL,'20:00:00',3,NULL,'Y','Y'),(18,NULL,1,NULL,'10:00:00',4,NULL,'Y','Y'),(19,NULL,1,NULL,'15:00:00',4,NULL,'Y','Y'),(20,NULL,1,NULL,'20:00:00',4,NULL,'Y','Y');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reservation_view`
--

DROP TABLE IF EXISTS `reservation_view`;
/*!50001 DROP VIEW IF EXISTS `reservation_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reservation_view` AS SELECT 
 1 AS `reseq`,
 1 AS `userid`,
 1 AS `people`,
 1 AS `classday`,
 1 AS `classtime`,
 1 AS `cseq`,
 1 AS `totalprice`,
 1 AS `price`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `revseq` int NOT NULL AUTO_INCREMENT,
  `cseq` int DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `indate` datetime DEFAULT (now()),
  PRIMARY KEY (`revseq`),
  KEY `fk_review_user1_idx` (`id`),
  KEY `fk_review_class1_idx` (`cseq`),
  CONSTRAINT `fk_review_class1` FOREIGN KEY (`cseq`) REFERENCES `product` (`cseq`),
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,1,'개인1','즐거운시간이었습니다.','2024-12-04 16:52:01');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `review_view`
--

DROP TABLE IF EXISTS `review_view`;
/*!50001 DROP VIEW IF EXISTS `review_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `review_view` AS SELECT 
 1 AS `revseq`,
 1 AS `cseq`,
 1 AS `id`,
 1 AS `content`,
 1 AS `indate`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('11','1111','4444','11','2024-12-03 11:06:13','11'),('1234','1111','1111','1111','2024-12-03 15:02:09','1111'),('2222','2222','2222','2222','2024-12-03 09:55:06','2222'),('3333','3333','3333','3333','2024-12-03 10:29:19','3333'),('4444','4444','4444','4444','2024-12-03 10:30:42','4444'),('aaaaa','aaaaa','aaaa','aaaa','2024-12-03 18:12:50','aaaa'),('asdf','asdf','asdf','asdf','2024-12-05 11:44:18','asdf'),('개인1','1111','2222','1111','2024-12-03 16:54:04','1111');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zzim`
--

DROP TABLE IF EXISTS `zzim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zzim` (
  `uid` varchar(100) DEFAULT NULL,
  `cnum` int DEFAULT NULL,
  KEY `fk_zzim_user1_idx` (`uid`),
  KEY `fk_zzim_class1_idx` (`cnum`),
  CONSTRAINT `fk_zzim_class1` FOREIGN KEY (`cnum`) REFERENCES `product` (`cseq`),
  CONSTRAINT `fk_zzim_user1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zzim`
--

LOCK TABLES `zzim` WRITE;
/*!40000 ALTER TABLE `zzim` DISABLE KEYS */;
INSERT INTO `zzim` VALUES ('개인1',1),('개인1',4);
/*!40000 ALTER TABLE `zzim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `zzim_view`
--

DROP TABLE IF EXISTS `zzim_view`;
/*!50001 DROP VIEW IF EXISTS `zzim_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zzim_view` AS SELECT 
 1 AS `uid`,
 1 AS `price`,
 1 AS `id`,
 1 AS `title`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `address3`,
 1 AS `category`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `reservation_view`
--

/*!50001 DROP VIEW IF EXISTS `reservation_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reservation_view` AS select `r`.`reseq` AS `reseq`,`r`.`userid` AS `userid`,`r`.`people` AS `people`,`r`.`classday` AS `classday`,`r`.`classtime` AS `classtime`,`r`.`cseq` AS `cseq`,`r`.`totalprice` AS `totalprice`,`p`.`price` AS `price`,`p`.`title` AS `title` from (`reservation` `r` join `product` `p`) where (`r`.`cseq` = `p`.`cseq`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `review_view`
--

/*!50001 DROP VIEW IF EXISTS `review_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `review_view` AS select `r`.`revseq` AS `revseq`,`r`.`cseq` AS `cseq`,`r`.`id` AS `id`,`r`.`content` AS `content`,`r`.`indate` AS `indate`,`p`.`title` AS `title` from (`review` `r` join `product` `p`) where (`r`.`cseq` = `p`.`cseq`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zzim_view`
--

/*!50001 DROP VIEW IF EXISTS `zzim_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zzim_view` AS select `zzim`.`uid` AS `uid`,`product`.`price` AS `price`,`product`.`id` AS `id`,`product`.`title` AS `title`,`product`.`address1` AS `address1`,`product`.`address2` AS `address2`,`product`.`address3` AS `address3`,`product`.`category` AS `category`,`product`.`image` AS `image` from (`zzim` join `product`) where (`zzim`.`cnum` = `product`.`cseq`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 15:08:11
