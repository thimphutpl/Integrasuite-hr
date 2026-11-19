/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: _2b54387f591a8b64
-- ------------------------------------------------------
-- Server version	10.6.22-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `tabEmail Template`
--
-- WHERE:  name IN ('Employee Separation Status Notification','Employee Separation  Approval Notification')

LOCK TABLES `tabEmail Template` WRITE;
/*!40000 ALTER TABLE `tabEmail Template` DISABLE KEYS */;
INSERT INTO `tabEmail Template` VALUES ('Employee Separation  Approval Notification','2025-12-05 16:18:01.287601','2025-12-05 16:18:01.287601','Administrator','Administrator',0,41,'Employee Separation  Approval Notification',0,NULL,'<div class=\"ql-editor read-mode\"><h2>Employee Benefits&nbsp;Status Notification</h2><h3>Details:</h3><table class=\"table table-bordered\"><tbody><tr><td data-row=\"insert-row-below\">Employee</td><td data-row=\"insert-row-below\">{{employee}}: {{employee_name}}</td></tr><tr><td data-row=\"row-0osi\">Posting Date</td><td data-row=\"row-0osi\">{{posting_date}}</td></tr><tr><td data-row=\"1\">Types of Separation</td><td data-row=\"1\">{{types_of_separation}}</td></tr><tr><td data-row=\"2\">Serve Notice Period</td><td data-row=\"2\">{{serve_notice_period}}</td></tr><tr><td data-row=\"3\">Status</td><td data-row=\"3\">{{workflow_state}}</td></tr></tbody></table></div>',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tabEmail Template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-01 17:36:18
