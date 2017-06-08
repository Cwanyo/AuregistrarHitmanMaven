-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: us-cdbr-iron-east-03.cleardb.net    Database: heroku_1e588fc995ef1f5
-- ------------------------------------------------------
-- Server version	5.5.45-log

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `id` int(7) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `role` varchar(100) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_authority_faculty1_idx` (`faculty_id`),
  KEY `fk_authority_major1_idx` (`major_id`),
  CONSTRAINT `fk_authority_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_authority_major1` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1111111,'auteacher1111111@gmail.com','John','Earth','Moon','123456789','Advisor',4,1),(2222222,'auteacher2222222@gmail.com','Smith','Moon','Mar','123456789','Dean',4,1);
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_section_form`
--

DROP TABLE IF EXISTS `change_section_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_section_form` (
  `student_id` int(7) NOT NULL,
  `submit_time` datetime NOT NULL,
  `current_stage` int(1) NOT NULL,
  `status` varchar(45) NOT NULL,
  `request_option` int(1) NOT NULL,
  `course_number` varchar(45) NOT NULL,
  `section_number` varchar(45) NOT NULL,
  `request_message` varchar(1000) DEFAULT NULL,
  `dean_approval_signature` varchar(100) DEFAULT NULL,
  `dean_approval_date` datetime DEFAULT NULL,
  PRIMARY KEY (`submit_time`,`student_id`),
  KEY `fk_change_section_form_student1_idx` (`student_id`),
  CONSTRAINT `fk_change_section_form_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_section_form`
--

LOCK TABLES `change_section_form` WRITE;
/*!40000 ALTER TABLE `change_section_form` DISABLE KEYS */;
INSERT INTO `change_section_form` VALUES (5715298,'2017-06-05 14:33:38',1,'waiting',1,'cs 1020','129','I want to study with Mr. Nobody',NULL,NULL);
/*!40000 ALTER TABLE `change_section_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Martin de Tours School of Management and Economics'),(2,'School of Laws'),(3,'School of Biotechnology'),(4,'Vincent Mary School of Science & Technology'),(5,'Vincent Mary School of Engineering'),(6,'Bernadette de Lourdes School of Nursing Science'),(7,'Albert Laurence School of Communication Arts'),(8,'Monfort Del Rosario School of Architecture and Design'),(9,'School of Music '),(10,'Institute for English Language Education'),(11,'Theodore Maria School of Arts');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_type`
--

DROP TABLE IF EXISTS `form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `form_path` varchar(100) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `max_stage` int(11) NOT NULL,
  `flow` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_type`
--

LOCK TABLES `form_type` WRITE;
/*!40000 ALTER TABLE `form_type` DISABLE KEYS */;
INSERT INTO `form_type` VALUES (1,'PETITION','petition.html','petition_form',2,'student->advisor->dean'),(2,'CHANGE-SECTION','changesection.html','change_section_form',1,'student->dean');
/*!40000 ALTER TABLE `form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_major_faculty_idx` (`faculty_id`),
  CONSTRAINT `fk_major_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Department of Computer Science',4),(2,'Department of Information Technology',4);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petition_form`
--

DROP TABLE IF EXISTS `petition_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petition_form` (
  `student_id` int(7) NOT NULL,
  `submit_time` datetime NOT NULL,
  `current_stage` int(1) NOT NULL,
  `status` varchar(45) NOT NULL,
  `request_option` int(1) NOT NULL,
  `request_message` varchar(1000) DEFAULT NULL,
  `request_reason` varchar(1000) DEFAULT NULL,
  `dean_approval_signature` varchar(100) DEFAULT NULL,
  `dean_approval_date` datetime DEFAULT NULL,
  `advisor_approval_signature` varchar(100) DEFAULT NULL,
  `advisor_approval_date` datetime DEFAULT NULL,
  PRIMARY KEY (`submit_time`,`student_id`),
  KEY `fk_petition_form_student1_idx` (`student_id`),
  CONSTRAINT `fk_petition_form_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petition_form`
--

LOCK TABLES `petition_form` WRITE;
/*!40000 ALTER TABLE `petition_form` DISABLE KEYS */;
INSERT INTO `petition_form` VALUES (5715298,'2017-06-05 14:34:58',1,'waiting',2,'I migrate to moon','ruff day sir``',NULL,NULL,NULL,NULL),(5715280,'2017-06-05 14:40:57',4,'approved',1,'test ','1','Smith Moon','2017-06-05 14:42:05','John Earth','2017-06-05 14:41:30'),(5715280,'2017-06-06 02:39:17',3,'approved',1,'test','1',NULL,NULL,'John Earth','2017-06-06 02:40:14'),(5715280,'2017-06-06 02:41:15',4,'approved',1,'Test','2','Smith Moon','2017-06-06 02:41:59','John Earth','2017-06-06 02:41:41'),(5715280,'2017-06-06 07:04:23',5,'approved',1,'test ','3','Smith Moon','2017-06-06 07:05:54','John Earth','2017-06-06 07:05:27');
/*!40000 ALTER TABLE `petition_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(7) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `credit` int(3) NOT NULL,
  `gpa` float(3,2) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_faculty_idx` (`faculty_id`),
  KEY `fk_student_major_idx` (`major_id`),
  CONSTRAINT `fk_student_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_major` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1111111,'austudent1111111@gmail.com','AuStudent','Tester','Some where on system','05587988',NULL,NULL,122,2.20,4,2),(5610189,'u5610189@au.edu','Jirasin','Jirasakul','Some where on moon','08798798',NULL,NULL,85,3.45,4,1),(5611779,'u5611779@au.edu','Supanat ','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5612690,'u5612690@au.edu','Vorapat','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5613739,'u5613739@au.edu','Pitiwat ','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5614640,'u5614640@au.edu','Thiwat','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5616856,'u5616856@au.edu','Prapas','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5638021,'u5638021@au.edu','Yilin','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5711568,'sithu.gta@gmail.com','Sithu','gta','Some where on mar','06548989',NULL,NULL,56,4.00,4,1),(5712652,'u5712652@au.edu','Ramin ','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5713074,'u5713074@au.edu','Panusorn ','test','Some where on moon','05875464',NULL,NULL,8,3.30,4,1),(5715280,'pannachet.l@gmail.com','Pannachet','ll','Some where on neptune','08941056',NULL,NULL,88,3.00,4,1),(5715298,'u5715298@au.edu','Chatchawan','yoojuie','Some where on earth','01412555',NULL,NULL,5,1.30,4,1),(5737444,'chawan.p.kc44.us@gmail.com','Chawan','kc','Some where on moon','05875464',NULL,NULL,8,3.30,4,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-08 21:02:29
