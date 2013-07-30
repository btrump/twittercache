-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: twittercache
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add twitter application',9,'add_twitterapplication'),(26,'Can change twitter application',9,'change_twitterapplication'),(27,'Can delete twitter application',9,'delete_twitterapplication'),(28,'Can add application',10,'add_application'),(29,'Can change application',10,'change_application'),(30,'Can delete application',10,'delete_application'),(31,'Can add user',11,'add_user'),(32,'Can change user',11,'change_user'),(33,'Can delete user',11,'delete_user'),(34,'Can add tweet',12,'add_tweet'),(35,'Can change tweet',12,'change_tweet'),(36,'Can delete tweet',12,'delete_tweet'),(37,'Can add search term',13,'add_searchterm'),(38,'Can change search term',13,'change_searchterm'),(39,'Can delete search term',13,'delete_searchterm');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$EzkV20VJGMcG$vxmf/FMS+oMEGVe5HSVqF8xoKJR4a+KsYCsO5e1tMow=','2013-07-23 15:09:10',1,'blair','','','',1,1,'2013-07-03 19:03:08');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-07-03 19:04:17',1,9,'1','TwitterApplication object',1,''),(2,'2013-07-11 21:30:29',1,13,'4','dance',1,''),(3,'2013-07-23 15:13:02',1,10,'1','The World Dances',1,''),(4,'2013-07-23 15:18:00',1,13,'4','dance',2,'Changed application.'),(5,'2013-07-23 15:33:51',1,13,'5','ballet',1,''),(6,'2013-07-23 16:13:37',1,13,'6','jazz',1,''),(7,'2013-07-23 16:49:08',1,11,'17','Some Guy',1,''),(8,'2013-07-23 16:49:55',1,12,'23523','Tweet object',1,''),(9,'2013-07-23 16:51:33',1,11,'17','Test User Name',2,'Changed name and screen_name.'),(10,'2013-07-23 16:55:29',1,12,'23523','\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate neque auctor risus malesuada, et cursus ante faucibus. Aliquam non n\" --Test User Name',2,'Changed text.'),(11,'2013-07-23 21:25:58',1,10,'1','The World Dances',2,'Changed access_token and access_token_secret.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'twitter application','twitter_application','twitterapplication'),(10,'application','twitter','application'),(11,'user','twitter','user'),(12,'tweet','twitter','tweet'),(13,'search term','twitter','searchterm');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('62d4c9d6tvwdvvv0kryjrd0y6rv9yswr','YTA4ODczMTExY2M4ZGQ5MThhYjQzNjEyMDBmNDc4ODdiYmQ5OTEyZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-08-06 15:09:10'),('c30pqm0enpknlpkdce8hijbui7gw89gu','YTA4ODczMTExY2M4ZGQ5MThhYjQzNjEyMDBmNDc4ODdiYmQ5OTEyZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-07-17 19:03:59');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'twitter','0001_initial','2013-07-11 21:10:27'),(2,'twitter','0002_auto__chg_field_tweet_in_reply_to_status_id_str__chg_field_tweet_in_re','2013-07-11 21:12:21'),(3,'twitter','0003_auto__add_searchterm','2013-07-11 21:27:03'),(4,'twitter','0004_auto__add_field_searchterm_application','2013-07-23 15:17:20'),(5,'twitter','0005_auto__add_field_tweet_search_term','2013-07-23 16:47:24'),(6,'twitter','0006_auto__add_field_application_access_token__add_field_application_access','2013-07-23 21:25:26'),(7,'twitter','0007_auto__del_field_user_added_at__del_field_tweet_added_at','2013-07-25 20:52:15'),(8,'twitter','0008_auto__add_field_user_added_at__add_field_tweet_added_at','2013-07-25 20:56:50'),(9,'twitter','0009_auto__chg_field_tweet_coordinate_latitude__chg_field_tweet_coordinate_','2013-07-25 21:01:44'),(10,'twitter','0010_auto__chg_field_tweet_coordinate_type','2013-07-25 21:02:07'),(11,'twitter','0011_auto__chg_field_tweet_in_reply_to_status_id_str__chg_field_tweet_in_re','2013-07-25 21:02:55'),(12,'twitter','0012_auto__chg_field_user_url','2013-07-25 21:13:07'),(13,'twitter','0013_auto__chg_field_user_utc_offset','2013-07-25 21:16:15'),(14,'twitter','0014_auto__chg_field_user_profile_image_url_https__chg_field_user_profile_s','2013-07-25 21:43:21'),(15,'twitter','0015_auto__chg_field_user_id_str','2013-07-25 21:43:40'),(16,'twitter','0016_auto__chg_field_user_lang','2013-07-25 21:50:01'),(17,'twitter','0017_auto__chg_field_tweet_text','2013-07-25 21:53:16');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_application`
--

DROP TABLE IF EXISTS `twitter_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `request_token_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `authorize_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `callback_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_application`
--

LOCK TABLES `twitter_application` WRITE;
/*!40000 ALTER TABLE `twitter_application` DISABLE KEYS */;
INSERT INTO `twitter_application` VALUES (1,'The World Dances','http://theworlddances.com/','tNDkhPUN2LSa3anZHmsA','mEldo7s1Gn3RbKTvvKL2H2oHVwaPDX6WECIrfdAfXM','https://api.twitter.com/oauth/request_token','https://api.twitter.com/oauth/authorize','https://api.twitter.com/oauth/access_token','','612699638-HSS73leR3Wk4NRiMoVtLohfChcXJwkjGsRRjRkpX','H8BSGJHdocTbVoCwV7EMqTqmRnt1QsJev9xykNqx0');
/*!40000 ALTER TABLE `twitter_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_searchterm`
--

DROP TABLE IF EXISTS `twitter_searchterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_searchterm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `added_at` datetime NOT NULL,
  `application_id` int(11),
  PRIMARY KEY (`id`),
  KEY `twitter_searchterm_bf127e2f` (`application_id`),
  CONSTRAINT `application_id_refs_id_c1db7e49` FOREIGN KEY (`application_id`) REFERENCES `twitter_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_searchterm`
--

LOCK TABLES `twitter_searchterm` WRITE;
/*!40000 ALTER TABLE `twitter_searchterm` DISABLE KEYS */;
INSERT INTO `twitter_searchterm` VALUES (4,'dance',9,1,'2013-07-11 21:26:43',1),(5,'ballet',1,1,'2013-07-23 15:31:42',1),(6,'jazz',5,1,'2013-07-23 15:40:03',1);
/*!40000 ALTER TABLE `twitter_searchterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_tweet`
--

DROP TABLE IF EXISTS `twitter_tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_tweet` (
  `id` bigint(20) NOT NULL,
  `id_str` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `coordinate_longitude` double,
  `coordinate_latitude` double,
  `coordinate_type` varchar(200) COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `favorited` tinyint(1) DEFAULT NULL,
  `truncated` tinyint(1) DEFAULT NULL,
  `retweeted` tinyint(1) DEFAULT NULL,
  `text` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retweet_count` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `in_reply_to_user_id` bigint(20),
  `in_reply_to_user_id_str` varchar(200) COLLATE utf8_unicode_ci,
  `in_reply_to_status_id` bigint(20),
  `in_reply_to_status_id_str` varchar(200) COLLATE utf8_unicode_ci,
  `in_reply_to_screen_name` varchar(200) COLLATE utf8_unicode_ci,
  `source` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `search_term_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `twitter_tweet_6340c63c` (`user_id`),
  KEY `twitter_tweet_2b7062a4` (`search_term_id`),
  CONSTRAINT `search_term_id_refs_id_fc3d004f` FOREIGN KEY (`search_term_id`) REFERENCES `twitter_searchterm` (`id`),
  CONSTRAINT `user_id_refs_id_d9e66ee6` FOREIGN KEY (`user_id`) REFERENCES `twitter_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_tweet`
--

LOCK TABLES `twitter_tweet` WRITE;
/*!40000 ALTER TABLE `twitter_tweet` DISABLE KEYS */;
INSERT INTO `twitter_tweet` VALUES (360519438992285696,'360519438992285696',NULL,NULL,NULL,'2013-07-25 21:58:27',0,0,0,'RT @Tuesvaincu: RtTurc si ton pere ce fdp quand il a pas d\'argent pour acheter un ballet il te coupe les soucils et ils les colle sur un ma…',49,232576540,NULL,NULL,NULL,NULL,NULL,'web',5,'2013-07-25 21:53:11'),(360519453592666114,'360519453592666114',NULL,NULL,NULL,'2013-07-25 21:58:30',0,0,0,'RT @IlusionOpticaEs: Perro ballet http://t.co/5ZIBkUJX0y',175,1394474324,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',5,'2013-07-25 21:53:11'),(360519469866549248,'360519469866549248',NULL,NULL,NULL,'2013-07-25 21:58:34',0,0,0,'@shige_ballet はーい٩꒰๑･д･꒱۶♡役に立てるかはわかんないけどヽ(；▽；)ノがんばれえ！！♪',0,372808865,565127173,'565127173',360518730029088768,'360518730029088768','shige_ballet','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>',5,'2013-07-25 21:53:11'),(360519484542427137,'360519484542427137',NULL,NULL,NULL,'2013-07-25 21:58:37',0,0,0,'RT @news_moegi: #NEWSパーナだったら全員RT \n  RTした人フォローする http://t.co/iI81FJyljs',80,1396775648,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',5,'2013-07-25 21:53:11'),(360519493404995585,'360519493404995585',NULL,NULL,NULL,'2013-07-25 21:58:40',0,0,0,'olha vcs tem até dia 31 de dezembro p juntar 100 reais e me dar essa melissa http://t.co/eMs8HbCYVW quero a azul marinho e meu número é 36!!',0,51306544,NULL,NULL,NULL,NULL,NULL,'web',5,'2013-07-25 21:53:11'),(360519502674395138,'360519502674395138',NULL,NULL,NULL,'2013-07-25 21:58:42',0,0,0,'@_AndrewNicholas heyyyyy',0,718774482,346161762,'346161762',360507637814657025,'360507637814657025','_AndrewNicholas','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',5,'2013-07-25 21:53:11'),(360519531761909760,'360519531761909760',NULL,NULL,NULL,'2013-07-25 21:58:49',0,0,0,'How did a ballet film turn into a horror.. #blackswan',0,827579610,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://www.apple.com\" rel=\"nofollow\">iOS</a>',5,'2013-07-25 21:53:11'),(360519556114034688,'360519556114034688',NULL,NULL,NULL,'2013-07-25 21:58:54',0,0,0,'“@balletenfureci2: Compañeras de baile = familia.” Ballet Gisela Comins',1,737305884,1444600531,'1444600531',359755498968465408,'359755498968465408','balletenfureci2','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>',5,'2013-07-25 21:53:11'),(360519577261707264,'360519577261707264',NULL,NULL,NULL,'2013-07-25 21:59:00',0,0,0,'RT @latinojustice: #nocantaloupecalveshere stevekingia my calves are toned from the hours I spend teaching classical ballet. http://t.co/JY…',4,14526877,NULL,NULL,NULL,NULL,NULL,'web',5,'2013-07-25 21:53:11'),(360519579920904194,'360519579920904194',NULL,NULL,NULL,'2013-07-25 21:59:00',0,0,0,'RT @4ever_cpn: 【お知らせ】\n\n今月中にリア友とパーナさんで\n垢分けます(⊙ω⊙)\n\nこの垢をリア友専用垢に\nしようと思っているので、\nまたフォローしてくれるっていう\nパーナさんいたら\nRTかふぁぼお願いします(´-ω-)♡\n\nRTかふぁぼをしてくれた際は\nこの垢…',12,1396775648,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',5,'2013-07-25 21:53:11'),(360519587684556802,'360519587684556802',NULL,NULL,NULL,'2013-07-25 21:59:02',0,0,0,'RT @ChrisDca: Ballet in the Park tonight at Assiniboine Park has been cancelled due to inclement weather. Next performance is tomorrow.',2,14577599,NULL,NULL,NULL,NULL,NULL,'web',5,'2013-07-25 21:53:11'),(360519605250297857,'360519605250297857',NULL,NULL,NULL,'2013-07-25 21:59:06',0,0,0,'“@disha_386: Ughh I really want to dance again :/” #Goombay2K13 coming soon',0,123493214,53425107,'53425107',360519418096267265,'360519418096267265','disha_386','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>',4,'2013-07-25 21:53:11'),(360519605942358016,'360519605942358016',NULL,NULL,NULL,'2013-07-25 21:59:06',0,0,0,'Dance like no one\'s watching and dream like anything\'s possible ;;) lalalalalaaa',0,146731266,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://blackberry.com/twitter\" rel=\"nofollow\">Twitter for BlackBerry®</a>',4,'2013-07-25 21:53:11'),(360519606634414080,'360519606634414080',NULL,NULL,NULL,'2013-07-25 21:59:07',0,0,0,'@SaraahJenkinsX @hannahjanexo she\'ll know! I downloaded that 50cent song you&amp; han used to dance to \"down on me\" to get me the mood for hols!',0,474230418,111557976,'111557976',360518369780301826,'360518369780301826','SaraahJenkinsX','web',4,'2013-07-25 21:53:11'),(360519606697332737,'360519606697332737',NULL,NULL,NULL,'2013-07-25 21:59:07',0,0,0,'RT @SexuaITips: Play with her hair, tell her you love her, be weird together, run in the streets, slow dance together, hold her hand, kiss …',1589,526845573,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>',4,'2013-07-25 21:53:11'),(360519607360028672,'360519607360028672',NULL,NULL,NULL,'2013-07-25 21:59:07',0,0,0,'@TashaEhmann @luciemu55ett @acaseforbooks @joecraiguk We will. We will do a dance for you. A Rainbow Dance.',0,912985280,20465847,'20465847',360519435431321603,'360519435431321603','TashaEhmann','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',4,'2013-07-25 21:53:11'),(360519612636471298,'360519612636471298',NULL,NULL,NULL,'2013-07-25 21:59:08',0,0,0,'Some days i wish i did dance when i was little. Just so i could be a bun head now\n\nBallet is so beautiful',0,1239644016,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>',5,'2013-07-25 21:53:11'),(360519619502546944,'360519619502546944',NULL,NULL,NULL,'2013-07-25 21:59:10',0,0,0,'Ver a esa niña bailar ballet fue tan asdfghjkl *-* me enamore',0,342210456,NULL,NULL,NULL,NULL,NULL,'<a href=\"https://mobile.twitter.com\" rel=\"nofollow\">Mobile Web (M2)</a>',5,'2013-07-25 21:53:11'),(360519625986945027,'360519625986945027',NULL,NULL,NULL,'2013-07-25 21:59:11',0,0,0,'No tengo quien me lleve a mi clase de ballet *llora a más no poder*',0,419000122,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>',5,'2013-07-25 21:53:11'),(360519641145147392,'360519641145147392',NULL,NULL,NULL,'2013-07-25 21:59:15',0,0,0,'RT @poplike23_love: #この人がお兄ちゃんだったら余裕で禁断の恋に走る人rt\nぜったーい恋に走りますっ// http://t.co/HrT4pMO2Fz',16,1396775648,NULL,NULL,NULL,NULL,NULL,'<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>',5,'2013-07-25 21:53:11');
/*!40000 ALTER TABLE `twitter_tweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_user`
--

DROP TABLE IF EXISTS `twitter_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_user` (
  `id` bigint(20) NOT NULL,
  `id_str` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci,
  `screen_name` varchar(200) COLLATE utf8_unicode_ci,
  `created_at` datetime,
  `location` varchar(200) COLLATE utf8_unicode_ci,
  `is_translator` tinyint(1) NOT NULL,
  `favourites_count` int(11),
  `url` varchar(200) COLLATE utf8_unicode_ci,
  `utc_offset` int(11),
  `listed_count` int(11),
  `lang` varchar(100) COLLATE utf8_unicode_ci,
  `followers_count` int(11),
  `protected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `geo_enabled` tinyint(1) NOT NULL,
  `time_zone` varchar(200) COLLATE utf8_unicode_ci,
  `description` varchar(200) COLLATE utf8_unicode_ci,
  `statuses_count` int(11),
  `friends_count` int(11),
  `default_profile` tinyint(1) NOT NULL,
  `default_profile_image` tinyint(1) NOT NULL,
  `profile_image_url` varchar(200) COLLATE utf8_unicode_ci,
  `profile_image_url_https` varchar(200) COLLATE utf8_unicode_ci,
  `profile_link_color` varchar(200) COLLATE utf8_unicode_ci,
  `profile_use_background_image` tinyint(1) NOT NULL,
  `profile_text_color` varchar(200) COLLATE utf8_unicode_ci,
  `profile_background_image_url_https` varchar(200) COLLATE utf8_unicode_ci,
  `profile_background_color` varchar(200) COLLATE utf8_unicode_ci,
  `profile_background_image_url` varchar(200) COLLATE utf8_unicode_ci,
  `profile_sidebar_fill_color` varchar(200) COLLATE utf8_unicode_ci,
  `profile_sidebar_border_color` varchar(200) COLLATE utf8_unicode_ci,
  `profile_background_tile` tinyint(1) NOT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_user`
--

LOCK TABLES `twitter_user` WRITE;
/*!40000 ALTER TABLE `twitter_user` DISABLE KEYS */;
INSERT INTO `twitter_user` VALUES (17,'17','Test User Name','Test User Name','2013-07-23 16:48:14','3452 543 q4w3q 43 4t3',0,34534,'http://google.com/',5,1,'en',6,0,0,0,'12','blah',5,2,0,0,'http://google.com/img','http://google.com/img','c',0,'d','http://google.com/img','f','http://google.com/img','h','i',0,'2013-07-25 04:00:00'),(14526877,'14526877','Gabe Ortíz','TUSK81','2008-04-25 14:22:31','San Francisco',0,11831,'http://t.co/FnBAp5zc7f',-25200,235,'en',5246,0,0,0,'Pacific Time (US & Canada)','#Immigration advocate, @AmericasVoice. American, Latino, Catlady. Calves like cantaloupes.',25379,807,0,0,'http://a0.twimg.com/profile_images/378800000116997119/57d62043090399874f85dcebe894cd61_normal.jpeg','https://si0.twimg.com/profile_images/378800000116997119/57d62043090399874f85dcebe894cd61_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/694690971/9394ac5619613687dba3406cbdaee05c.jpeg','C0DEED','http://a0.twimg.com/profile_background_images/694690971/9394ac5619613687dba3406cbdaee05c.jpeg','DDEEF6','FFFFFF',0,'2013-07-25 21:53:11'),(14577599,'14577599','Cari B ','JKnDEWsCareBear','2008-04-28 23:51:03','iPhone: 49.821056,-97.094528',0,911,NULL,-18000,74,'en',1326,0,0,1,'Central Time (US & Canada)','Team Betty - Winnipeg Captain BHS4LIFE WINNER OF A GOLDEN KEY, GOT MY DONNIE WAHLBERG FOLLOW CHRISTMAS DAY 2009! Jordan\'s 752nd & Danny Wood 1669th follow',126993,1367,0,0,'http://a0.twimg.com/profile_images/378800000121576261/baa70e8e0036f3fefb14d317c178f9b0_normal.jpeg','https://si0.twimg.com/profile_images/378800000121576261/baa70e8e0036f3fefb14d317c178f9b0_normal.jpeg','1F98C7',1,'E04C4C','https://si0.twimg.com/profile_background_images/378800000024002070/6987259becf4512c4dffaec6b93515ac.jpeg','C6E2EE','http://a0.twimg.com/profile_background_images/378800000024002070/6987259becf4512c4dffaec6b93515ac.jpeg','0A0102','000000',1,'2013-07-25 21:53:11'),(15616848,'15616848','Galveston.com','GalvestonCom','2008-07-27 02:56:09','iPhone: 0.000000,0.000000',0,4,'http://t.co/2CHfVOIG1n',-18000,102,'en',5764,0,0,1,'Central Time (US & Canada)','Follow us for inside access to Galveston Island news, events, exclusive offers and experiences!',5766,918,0,0,'http://a0.twimg.com/profile_images/2391702054/9p850taam5gparrfu5n8_normal.jpeg','https://si0.twimg.com/profile_images/2391702054/9p850taam5gparrfu5n8_normal.jpeg','339999',1,'000000','https://si0.twimg.com/profile_background_images/740840714/59b29f379af081496ca96fbfa80d4678.png','FFFFFF','http://a0.twimg.com/profile_background_images/740840714/59b29f379af081496ca96fbfa80d4678.png','CCCC99','FFFFFF',0,'2013-07-25 21:53:11'),(15976740,'15976740','wizard1953 ','wizard1953','2008-08-25 02:54:26','you can guess',0,6963,NULL,-21600,17,'en',860,0,0,0,'Mountain Time (US & Canada)','I am retired/disabled lean left; but can do right, wordy and a bit nerdy! I am ltd to flw!\r\n\r\nI\'ll follow almost anyone, but will suffer no fools lightly.',33277,2000,0,0,'http://a0.twimg.com/profile_images/3685940270/362dac9d84dc2ded5c8733e0db6f3747_normal.png','https://si0.twimg.com/profile_images/3685940270/362dac9d84dc2ded5c8733e0db6f3747_normal.png','9D582E',1,'333333','https://si0.twimg.com/images/themes/theme8/bg.gif','8B542B','http://a0.twimg.com/images/themes/theme8/bg.gif','EADEAA','D9B17E',0,'2013-07-25 21:53:11'),(43485533,'43485533','Heavy Metal Lion','misfitxtoy','2009-05-30 05:12:35','Lethe, Hypnos ',0,3745,'http://t.co/BNAPY3KKiZ',-18000,45,'en',3809,0,0,0,'Central Time (US & Canada)','Summer rise, I\'m a supernova, Body Electric and I dance like Morrison.',130315,2077,0,0,'http://a0.twimg.com/profile_images/378800000148689050/6c797846523e0b57f290a80bc1b67f19_normal.jpeg','https://si0.twimg.com/profile_images/378800000148689050/6c797846523e0b57f290a80bc1b67f19_normal.jpeg','FF3300',1,'000000','https://si0.twimg.com/profile_background_images/378800000022182387/bf61b4296f368901dedf38dc9b32c82b.jpeg','709397','http://a0.twimg.com/profile_background_images/378800000022182387/bf61b4296f368901dedf38dc9b32c82b.jpeg','FFFFFF','FFFFFF',1,'2013-07-25 21:12:04'),(44771449,'44771449','Jezz Pacheco','JezzPacheco','2009-06-05 00:17:22','São Paulo - Brasil',0,62,'http://t.co/9tQhi9Gjq9',-14400,2,'pt',71,0,0,0,'Santiago','Entre um trago e outro de vinho! Entre sonhos e estradas. Entre estranhos e amigos.',2676,33,0,0,'http://a0.twimg.com/profile_images/2395680267/ky06cmbepg7plmai49qh_normal.jpeg','https://si0.twimg.com/profile_images/2395680267/ky06cmbepg7plmai49qh_normal.jpeg','990000',1,'333333','https://si0.twimg.com/profile_background_images/265555209/Foto0728.jpg','EBEBEB','http://a0.twimg.com/profile_background_images/265555209/Foto0728.jpg','F3F3F3','DFDFDF',1,'2013-07-25 21:44:02'),(47875520,'47875520','†','ibHG_jazz','2009-06-17 06:12:24','',0,118,NULL,-18000,3,'en',910,0,0,0,'Central Time (US & Canada)','Her ROD? I Am That! Her Back? I Got That! Try To Break Her Heart? Don\'t Try That! Cause Ima Thugg & I Got My Choppa In The Kahh … Follow Me Thoo @ImDopeeAf ♥',85962,702,0,0,'http://a0.twimg.com/profile_images/378800000182513874/95f3ecae46d7db511dafb80d5209da10_normal.jpeg','https://si0.twimg.com/profile_images/378800000182513874/95f3ecae46d7db511dafb80d5209da10_normal.jpeg','080707',1,'333333','https://si0.twimg.com/profile_background_images/628695691/2kl92cbvnrup46rs26cr.jpeg','D10C0C','http://a0.twimg.com/profile_background_images/628695691/2kl92cbvnrup46rs26cr.jpeg','E6F6F9','DBE9ED',1,'2013-07-25 21:44:02'),(48126171,'48126171','loha','lohablondie','2009-06-17 21:36:37',' sydney & austin',0,1573,NULL,36000,3,'en',147,0,0,0,'Brisbane','Stylist, gin-n-tonic lover, Pop Tart connoisseur',18903,186,0,0,'http://a0.twimg.com/profile_images/3458353922/ff7a1a93fecbfdcc9474de4e24f7ca60_normal.jpeg','https://si0.twimg.com/profile_images/3458353922/ff7a1a93fecbfdcc9474de4e24f7ca60_normal.jpeg','FF0000',1,'0C3E53','https://si0.twimg.com/profile_background_images/648796496/pa4e5ra6swukoxx5j3au.jpeg','BADFCD','http://a0.twimg.com/profile_background_images/648796496/pa4e5ra6swukoxx5j3au.jpeg','FFF7CC','F2E195',0,'2013-07-25 21:53:11'),(51306544,'51306544','pea cletos','beatata_','2009-06-27 01:41:32','cidade do dollynho',0,302,'http://t.co/20Ww5E8wo7',-10800,8,'en',227,0,0,0,'Brasilia','burned out flames should never re-ingnite.',17248,208,0,0,'http://a0.twimg.com/profile_images/378800000145903096/4960190bb5105020c3914d0d81704828_normal.jpeg','https://si0.twimg.com/profile_images/378800000145903096/4960190bb5105020c3914d0d81704828_normal.jpeg','EDA4C5',1,'895429','https://si0.twimg.com/profile_background_images/378800000025790614/736a372c6cd26564b59f9ffaab083ed7.jpeg','FAFAF5','http://a0.twimg.com/profile_background_images/378800000025790614/736a372c6cd26564b59f9ffaab083ed7.jpeg','0E0D02','FFFFFF',1,'2013-07-25 21:53:11'),(66355689,'66355689','Annisa At Thahirah','zaa_21','2009-08-17 13:39:39','Indonesia Country',0,3,'http://t.co/euML5hqSx4',25200,1,'en',118,0,0,1,'Jakarta','(✿◠‿◠) I wish, I can be better in my future♪♫•*¨*•.¸¸❤¸¸.•*¨*•♫♪lalalaa...lalala..lalalaa♪♫•*¨*•.¸¸❤¸¸.•*¨*•♫♪Keep spirit cause Allah always save me',5524,92,0,0,'http://a0.twimg.com/profile_images/378800000175113571/ee60447840367673caa99843eaec7c6d_normal.jpeg','https://si0.twimg.com/profile_images/378800000175113571/ee60447840367673caa99843eaec7c6d_normal.jpeg','E31D5C',1,'FCDA85','https://si0.twimg.com/profile_background_images/261664733/249310_121081744641927_100002203073948_180521_6037101_n.jpg','F28CC1','http://a0.twimg.com/profile_background_images/261664733/249310_121081744641927_100002203073948_180521_6037101_n.jpg','A6D4FF','2146C2',1,'2013-07-25 21:47:01'),(87338003,'87338003','Lil Jazz Young Zino','Jazz_Mane','2009-11-04 01:52:52','ManesWorld LONDON',0,13058,'http://t.co/lmLTtyjCau',3600,283,'en',8067,0,0,0,'London','New Mixtape out very soon thanks for your patience! #Swag #Maneiac™ #CMAR™',23555,883,0,0,'http://a0.twimg.com/profile_images/378800000169980591/86c62cc34f9d18c36bb5ea55f9544328_normal.jpeg','https://si0.twimg.com/profile_images/378800000169980591/86c62cc34f9d18c36bb5ea55f9544328_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/128478864/get-attachment.aspx.jpg','C0DEED','http://a0.twimg.com/profile_background_images/128478864/get-attachment.aspx.jpg','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(123493214,'123493214','ALPHA ETA','FAMUSigmas1935','2010-03-16 07:49:06','Tallahassee, FL',0,15,'http://t.co/uME5quF1Gn',-18000,21,'en',1210,0,0,0,'Central Time (US & Canada)','Alpha Eta, 1st Sigma chapter in FL. Dec 6, 1935 @ Florida A&M College. Nationally recognized for SUPERIOR Service,Stepping,& Event Hosting. #brotherhood',1482,449,0,0,'http://a0.twimg.com/profile_images/3481127397/4ae335b873e04e71568be273c6be5e8d_normal.jpeg','https://si0.twimg.com/profile_images/3481127397/4ae335b873e04e71568be273c6be5e8d_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/201292905/famu_sigmas_logo.jpg','022330','http://a0.twimg.com/profile_background_images/201292905/famu_sigmas_logo.jpg','C0DFEC','A8C7F7',1,'2013-07-25 21:53:11'),(128180175,'128180175','SAHLA','sahla_sing','2010-03-31 10:14:30','TOKYO ',0,254,'http://t.co/uzqpVFJOuP',32400,63,'ja',1618,0,0,1,'Tokyo','JAZZ Vocalist★人生すべてショーアップ！ミュージカル等多数出演の他、歌唱指導や音楽担当で制作も。「宝塚の歌♪名曲講座」はヅカファンに人気のユニークなレッスン。★【LOVE】JAZZ♪, BLACK MUSIC♪＆読売巨人軍★毎晩夜中に「お奨め音楽」をつぶやきます。Check it out！ & 《脱原発！》',32302,1140,0,0,'http://a0.twimg.com/profile_images/378800000074340942/9db66ed828bf141b6f2b5caaf1a2257a_normal.jpeg','https://si0.twimg.com/profile_images/378800000074340942/9db66ed828bf141b6f2b5caaf1a2257a_normal.jpeg','830B07',1,'222222','https://si0.twimg.com/profile_background_images/676543745/d8400069933eec3529b9db68b7fc1b6e.jpeg','FFFFFF','http://a0.twimg.com/profile_background_images/676543745/d8400069933eec3529b9db68b7fc1b6e.jpeg','DE6C68','830B07',0,'2013-07-25 21:44:02'),(141262955,'141262955','Sebastián Hernández','copihueazul','2010-05-07 16:13:57','',0,106,NULL,-14400,17,'es',1391,0,0,0,'Santiago','Azul. #Eso',15419,1822,1,0,'http://a0.twimg.com/profile_images/378800000070811749/ceaa47cc8e282269156ead4dd890dd46_normal.png','https://si0.twimg.com/profile_images/378800000070811749/ceaa47cc8e282269156ead4dd890dd46_normal.png','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(146731266,'146731266','Retno Ayu Widyastuti','retnoretno','2010-05-22 05:38:28','Jakarta - Yogyakarta',0,81,NULL,25200,4,'id',536,0,0,1,'Jakarta','Modern dancer ♥. Success is built everyday \\(´▽`)/ ♥. geo environment engineering UPNVYK 09 ♥.',15288,282,0,0,'http://a0.twimg.com/profile_images/378800000186707983/8a6f521046586bb580192d4c3e76b436_normal.jpeg','https://si0.twimg.com/profile_images/378800000186707983/8a6f521046586bb580192d4c3e76b436_normal.jpeg','B82366',1,'E07091','https://si0.twimg.com/profile_background_images/225020776/18765_1148024152373_1580659134_30340210_3869534_n.jpg','E4B2E8','http://a0.twimg.com/profile_background_images/225020776/18765_1148024152373_1580659134_30340210_3869534_n.jpg','DDEEF6','FFFFFF',1,'2013-07-25 21:53:11'),(155148067,'155148067','Bailey Quick','BaileyEQuick','2010-06-13 07:16:57','',0,405,NULL,-18000,0,'en',289,0,0,0,'Central Time (US & Canada)','#RIPCaleb #RIPTroy #RIPTori #RIPSammy Eisenhower high. Basketball I love my ginge 3 @zach_likely',3594,404,0,0,'http://a0.twimg.com/profile_images/378800000037336270/e50acb4dc416d1ee542bd3ab4e6bc4c1_normal.jpeg','https://si0.twimg.com/profile_images/378800000037336270/e50acb4dc416d1ee542bd3ab4e6bc4c1_normal.jpeg','038543',1,'333333','https://si0.twimg.com/images/themes/theme18/bg.gif','ACDED6','http://a0.twimg.com/images/themes/theme18/bg.gif','F6F6F6','EEEEEE',0,'2013-07-25 21:53:11'),(157397264,'157397264','canoa furada','Jazz_lmll','2010-06-19 17:49:04','São Paulo / Brasil',0,119,NULL,-10800,22,'en',413,0,0,1,'Brasilia','o vazio de alguém.',41753,213,0,0,'http://a0.twimg.com/profile_images/378800000122533512/93d14f583434343b1895de34fbf6ac59_normal.jpeg','https://si0.twimg.com/profile_images/378800000122533512/93d14f583434343b1895de34fbf6ac59_normal.jpeg','FF6600',1,'FF8400','https://si0.twimg.com/profile_background_images/378800000022552593/9bae3c099bb8fb1efe0ddb72247e8805.jpeg','000000','http://a0.twimg.com/profile_background_images/378800000022552593/9bae3c099bb8fb1efe0ddb72247e8805.jpeg','000000','000000',1,'2013-07-25 21:53:11'),(166434427,'166434427','MUSE','MUSEZAHIR','2010-07-14 04:00:35','Puerto Rico/Artist Management',0,7,'http://t.co/CkdDHpOUEu',-14400,0,'en',63,0,0,1,'Eastern Time (US & Canada)','One Good Thing bout Music, When it Hits U Feel No Pain ~Bob Marley',2567,85,0,0,'http://a0.twimg.com/profile_images/3559169101/dfecd9082f75b5687a4b74ea667c6d01_normal.jpeg','https://si0.twimg.com/profile_images/3559169101/dfecd9082f75b5687a4b74ea667c6d01_normal.jpeg','009999',1,'333333','https://si0.twimg.com/profile_background_images/277367605/Espan_a_Trip_017.jpg','131516','http://a0.twimg.com/profile_background_images/277367605/Espan_a_Trip_017.jpg','EFEFEF','EEEEEE',0,'2013-07-25 21:47:01'),(173291312,'173291312','Glen Meynardie','gmeynardie','2010-08-01 00:52:38','saint amant, la',0,74,'http://t.co/xEMtMZlEEP',NULL,0,'en',280,0,0,1,NULL,'I am a proud husband and father. I love to teach dance, make dances, and inspire dancers. I love JESUS. For with GOD, nothing shall be impossible. Luke 1:37',1975,1068,1,0,'http://a0.twimg.com/profile_images/2415360266/image_normal.jpg','https://si0.twimg.com/profile_images/2415360266/image_normal.jpg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(192380598,'192380598','ᶥᵗˢ eLnathan ✌ ','bege05','2010-09-19 00:12:40','i am every where....✌ ',0,39,NULL,3600,0,'en',235,0,0,0,'London','We are not the same, I am a MARTIAN!!\r\n#TeamManUtd #TeamKpakiu #TeamVirgo',11295,362,0,0,'http://a0.twimg.com/profile_images/378800000134187696/e1052be28a060e8e3f5a5e26762c87a6_normal.jpeg','https://si0.twimg.com/profile_images/378800000134187696/e1052be28a060e8e3f5a5e26762c87a6_normal.jpeg','9D582E',1,'333333','https://si0.twimg.com/profile_background_images/556987259/Me___Ai.JPG','8B542B','http://a0.twimg.com/profile_background_images/556987259/Me___Ai.JPG','EADEAA','D9B17E',0,'2013-07-25 21:44:02'),(200626837,'200626837','mudblood','heartsforjonas','2010-10-09 20:05:41','camp half blood',0,418,NULL,-18000,31,'en',11811,0,0,0,'Quito','       you\'ve got the moon to guide you, who needs a star?         parabatai: @heartperryplaty',77462,9475,0,0,'http://a0.twimg.com/profile_images/378800000163260733/aec0f2c9effe4d2725b5a49a98cafaf9_normal.png','https://si0.twimg.com/profile_images/378800000163260733/aec0f2c9effe4d2725b5a49a98cafaf9_normal.png','000000',0,'0F0E0E','https://si0.twimg.com/profile_background_images/378800000005463803/50617531733fddb0037e002aa452df72.png','FFFFFF','http://a0.twimg.com/profile_background_images/378800000005463803/50617531733fddb0037e002aa452df72.png','FFFFFF','FFFFFF',0,'2013-07-25 21:15:44'),(215691002,'215691002','Zoela','maritoshya','2010-11-14 17:12:50','South Africa',0,0,NULL,10800,0,'en',7,0,0,0,'Nairobi','KENYAN & very proud 2 b 1!!!',265,298,0,0,'http://a0.twimg.com/profile_images/378800000169327911/6db25ec2b8828ef04264e1ccd8f59392_normal.png','https://si0.twimg.com/profile_images/378800000169327911/6db25ec2b8828ef04264e1ccd8f59392_normal.png','FF0000',1,'3D1957','https://si0.twimg.com/profile_background_images/233327418/Mi_m_084.jpg','642D8B','http://a0.twimg.com/profile_background_images/233327418/Mi_m_084.jpg','7AC3EE','65B0DA',1,'2013-07-25 21:44:02'),(232576540,'232576540','[J-2 LANINC #7]','Yacinement','2010-12-31 15:22:08','Paris, France (92)',0,64,'http://t.co/BTfrHMzoTy',7200,4,'fr',225,0,0,1,'Paris','The Algerian Monster en personne. Prosternes-toi et contemples mes tweets. Euh... comme tu veux enfait. #TeamAlgérie aussi. Joueur #PS3',5782,551,0,0,'http://a0.twimg.com/profile_images/3461058044/82057c0c8dedbfac9919419e8454a2ac_normal.jpeg','https://si0.twimg.com/profile_images/3461058044/82057c0c8dedbfac9919419e8454a2ac_normal.jpeg','2E12FF',0,'000000','https://si0.twimg.com/profile_background_images/540156203/jay-z-kanye-west-nias-in-paris-L-rBXHL8.jpeg','BFBFBF','http://a0.twimg.com/profile_background_images/540156203/jay-z-kanye-west-nias-in-paris-L-rBXHL8.jpeg','B3B3B3','FFFFFF',1,'2013-07-25 21:53:11'),(236618946,'236618946','Ilya Veksler','Ilya_Veksler','2011-01-11 00:37:08','',0,108,NULL,NULL,0,'en',62,0,0,1,NULL,'Musician and producer. Frontman of this life. Instagram - ilyaveksler.',1542,84,1,0,'http://a0.twimg.com/profile_images/3473197996/6a369f0886caa8591cb8f104be586ee1_normal.jpeg','https://si0.twimg.com/profile_images/3473197996/6a369f0886caa8591cb8f104be586ee1_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(250875324,'250875324','Omari','Thvtboy_O23','2011-02-12 00:14:41','',0,768,NULL,-14400,0,'en',499,0,0,0,'Eastern Time (US & Canada)','RC for Life \'15 #BallisLife #NjRoadrunners Go follow My Princess My Bestfriend My Pain in neck My Everything @KikiNewton❤❤❤',10292,402,0,0,'http://a0.twimg.com/profile_images/378800000184562983/548af9aa78796317c2a72a466f166355_normal.jpeg','https://si0.twimg.com/profile_images/378800000184562983/548af9aa78796317c2a72a466f166355_normal.jpeg','000000',0,'333333','https://si0.twimg.com/profile_background_images/883381577/2a26b4cb105784e3f756ba75e4ee140d.jpeg','131516','http://a0.twimg.com/profile_background_images/883381577/2a26b4cb105784e3f756ba75e4ee140d.jpeg','EFEFEF','FFFFFF',0,'2013-07-25 21:53:11'),(254520638,'254520638','Pezón de Changjo','wiwarawawiwoo','2011-02-19 13:01:02','',0,402,NULL,-7200,4,'es',130,0,0,0,'Greenland','Alérgica a las plantas rodadoras ಥ_ಥ Me paso el día hablando de L.Joe, del culo de Hyuna y del pezón de Changjo. K-poper histérica \\(ÓoÒ)/ MYUNGJONG PERFECT OTP',47164,74,0,0,'http://a0.twimg.com/profile_images/378800000135002824/57dc04c034b62da4bf304c06a71dcb48_normal.jpeg','https://si0.twimg.com/profile_images/378800000135002824/57dc04c034b62da4bf304c06a71dcb48_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/681365549/c09cac028c2e509509816cebea8ee47e.jpeg','C0DEED','http://a0.twimg.com/profile_background_images/681365549/c09cac028c2e509509816cebea8ee47e.jpeg','DDEEF6','FFFFFF',1,'2013-07-25 21:53:11'),(275053645,'275053645','Mani ✌','LifeOfImani','2011-03-31 14:56:40','Somewhere tryin to be happy',0,46,NULL,-18000,0,'en',274,0,0,0,'Quito','My babymom @Jazz_thaSpazz.',7279,310,0,0,'http://a0.twimg.com/profile_images/378800000094329483/301c13289647188ed1f49fffba1fbf3e_normal.jpeg','https://si0.twimg.com/profile_images/378800000094329483/301c13289647188ed1f49fffba1fbf3e_normal.jpeg','0099CC',1,'F0E7F0','https://si0.twimg.com/profile_background_images/671108055/27655b76e453b2b2f997597a095e1249.jpeg','FFF04D','http://a0.twimg.com/profile_background_images/671108055/27655b76e453b2b2f997597a095e1249.jpeg','F6FFD1','FFFFFF',1,'2013-07-25 21:44:02'),(275090245,'275090245','Jalapeño ','Jazz_thaSpazz','2011-03-31 16:18:44','',0,2575,NULL,-18000,1,'en',1025,0,0,0,'Quito','my love bugs: @LifeOfImani & @Stuntin_onEm / My wife: @_JiggyYungNigga /  My stripper:  @Mary_Maxine__  / Roselle...',15448,889,0,0,'http://a0.twimg.com/profile_images/378800000179520270/036f4c345e5a4190528c50a6e1420411_normal.jpeg','https://si0.twimg.com/profile_images/378800000179520270/036f4c345e5a4190528c50a6e1420411_normal.jpeg','CC3366',1,'333333','https://si0.twimg.com/profile_background_images/378800000001415438/b21e50a51e73386ad38bc6d98bca0faa.png','DBE9ED','http://a0.twimg.com/profile_background_images/378800000001415438/b21e50a51e73386ad38bc6d98bca0faa.png','E6F6F9','000000',1,'2013-07-25 21:44:02'),(282923860,'282923860','Laguna Beach Buzz','LagunaBeachBuzz','2011-04-16 06:33:39','Laguna Beach CA',0,0,NULL,NULL,18,'en',887,0,0,0,NULL,'A ticker tape of everything happening in Laguna Beach. We curate the best Twitter feeds for news, daily deals, and things to do, all for you!',7901,198,0,0,'http://a0.twimg.com/profile_images/1317581054/images_normal.jpg','https://si0.twimg.com/profile_images/1317581054/images_normal.jpg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/235250469/25_1600.jpg','C0DEED','http://a0.twimg.com/profile_background_images/235250469/25_1600.jpg','DDEEF6','C0DEED',0,'2013-07-25 21:44:02'),(342210456,'342210456','Kimiie~☆~☆ ','kimiie_vampire','2011-07-25 17:10:13','Panamá',0,101,NULL,-18000,1,'es',300,0,0,0,'Central Time (US & Canada)','Promotora @AGITMofficial https://t.co/Y1qBTT99cu…  \r\n - Publicista @shop_oficial \r\n   https://t.co/uFth8HLfuA    -Manager @DEA_Eterniity http://t.co/8cLqMpRnY6',19361,326,0,0,'http://a0.twimg.com/profile_images/378800000133989659/d172352c7cc68ef672228197484482a4_normal.jpeg','https://si0.twimg.com/profile_images/378800000133989659/d172352c7cc68ef672228197484482a4_normal.jpeg','F575E6',1,'333333','https://si0.twimg.com/profile_background_images/696585940/ff57fd7cb7d0185e1d1aa766f748d129.jpeg','E80EC7','http://a0.twimg.com/profile_background_images/696585940/ff57fd7cb7d0185e1d1aa766f748d129.jpeg','B179F2','FFFFFF',1,'2013-07-25 21:53:11'),(355364230,'355364230','RIZKA RAMADANI','iponaomi','2011-08-15 07:12:07','Bukittinggi,Sumatera Barat',0,1,NULL,-25200,1,'id',199,0,0,1,'Pacific Time (US & Canada)','alumni SMAN 4 Bukittinggi#EP-FE-Unand-012#mylovelyfamily#RV#11.02.1995#for follback..mention aja ya#@band_Armada @rizaldisandi',3780,182,0,0,'http://a0.twimg.com/profile_images/378800000171766848/a5b241ba78cee998ec78d81287e3340b_normal.jpeg','https://si0.twimg.com/profile_images/378800000171766848/a5b241ba78cee998ec78d81287e3340b_normal.jpeg','4DDBF7',0,'3C3940','https://si0.twimg.com/profile_background_images/849545373/f3d0c5315d686e05ea4522f278a3bf65.jpeg','2EC9E8','http://a0.twimg.com/profile_background_images/849545373/f3d0c5315d686e05ea4522f278a3bf65.jpeg','95E8EC','000000',0,'2013-07-25 21:53:11'),(357286401,'357286401','→ⓣⓔⓔⓓⓨⓜⓘⓝⓐⓙ←','RIP_WORMIE','2011-08-18 03:56:15','Grinding....',0,484,NULL,-18000,0,'en',879,0,0,0,'Central Time (US & Canada)','',10551,1235,1,0,'http://a0.twimg.com/profile_images/378800000016730630/07dbee63cbbc5b675fb04b7495411a8b_normal.png','https://si0.twimg.com/profile_images/378800000016730630/07dbee63cbbc5b675fb04b7495411a8b_normal.png','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(372808865,'372808865','Rena.T','rena0831kbs','2011-09-13 13:18:35','',0,14,NULL,NULL,0,'ja',33,0,0,0,NULL,'受験勉強のため バレエお休み中(´・ω・｀) KBS！ Ballet SUPER☆GiRLS suzuka ryoki follow me!',764,53,1,0,'http://a0.twimg.com/profile_images/378800000129494406/8792b4e10eb43856791bc449d085a78e_normal.jpeg','https://si0.twimg.com/profile_images/378800000129494406/8792b4e10eb43856791bc449d085a78e_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(392264893,'392264893','Félix ϟ Alejandro  ','GaTo__JaZz','2011-10-16 19:39:14','Calle ilusion',0,564,'http://t.co/WUbkgWeu6N',-18000,2,'es',205,0,0,1,'Mexico City','Soy de ese tipo de personas que no tratan de caerle bien a nadie... Seco, introvertido y amante de la buena música  /P.D. NO ME CONOZCAS !',6167,162,0,0,'http://a0.twimg.com/profile_images/378800000140685176/960df6bbc54c071e10bff34443e6ae52_normal.jpeg','https://si0.twimg.com/profile_images/378800000140685176/960df6bbc54c071e10bff34443e6ae52_normal.jpeg','050505',1,'006B46','https://si0.twimg.com/profile_background_images/378800000016651976/2431a78aaf8ff6ba7d57cc3dbeab6fee.jpeg','001500','http://a0.twimg.com/profile_background_images/378800000016651976/2431a78aaf8ff6ba7d57cc3dbeab6fee.jpeg','142200','FFFFFF',1,'2013-07-25 21:53:11'),(398251490,'398251490','Gino Pilato','GinoPilato','2011-10-25 20:03:09','Boise, Idaho',0,497,'http://t.co/T41F9TQrls',-25200,13,'en',413,0,0,1,'Arizona','Writer for http://t.co/8qQAXcScAR, chasing stories related to the basketball grind!',5451,382,0,0,'http://a0.twimg.com/profile_images/3089548660/f073b9fe154870cb208924379ea600ae_normal.jpeg','https://si0.twimg.com/profile_images/3089548660/f073b9fe154870cb208924379ea600ae_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/352946047/dancing-gino.jpg','C0DEED','http://a0.twimg.com/profile_background_images/352946047/dancing-gino.jpg','DDEEF6','C0DEED',1,'2013-07-25 21:53:11'),(419000122,'419000122','Diana.','dianalcala02','2011-11-22 20:45:00','Asdfghjklñ!',0,2,NULL,-14400,0,'es',295,0,0,0,'Eastern Time (US & Canada)','Take me as I am. And if you can\'t, Leave me. Cause I will never be Perfect. -Zakia Purity.',15749,272,0,0,'http://a0.twimg.com/profile_images/378800000179504331/d7f5ceb51715f8bebd91d8e344b5d4a1_normal.jpeg','https://si0.twimg.com/profile_images/378800000179504331/d7f5ceb51715f8bebd91d8e344b5d4a1_normal.jpeg','DB0F61',1,'F05D8E','https://si0.twimg.com/profile_background_images/369246106/us007-gURcMhcABve2.gif','1795D4','http://a0.twimg.com/profile_background_images/369246106/us007-gURcMhcABve2.gif','FA9ECA','7E8182',1,'2013-07-25 21:53:11'),(419305867,'419305867','Untitled...','ChildAtHeart_','2011-11-23 06:11:13',' living the thug life ',0,619,NULL,-28800,0,'en',143,0,0,0,'Alaska','No use crying over something you can\'t fix. Live while you can, and never look back| You love me, I love you harder @Czar_Kinq ♥ 3/18-2012',12828,121,0,0,'http://a0.twimg.com/profile_images/378800000168295828/f351ff140c7a6246a971d76542af1a28_normal.jpeg','https://si0.twimg.com/profile_images/378800000168295828/f351ff140c7a6246a971d76542af1a28_normal.jpeg','009999',1,'EB1D8B','https://si0.twimg.com/profile_background_images/645538783/lrf0awloe777xnhi0120.jpeg','131516','http://a0.twimg.com/profile_background_images/645538783/lrf0awloe777xnhi0120.jpeg','000000','050205',1,'2013-07-25 21:53:11'),(422839903,'422839903','Aphrodite\'s Muse','BayWatchBitch','2011-11-27 19:11:52','Down To Jupiter',0,6,'http://t.co/ukYNMhcgUN',-18000,4,'en',1189,0,0,0,'Central Time (US & Canada)','Hippie ! ♻❤✌☺ All Hail Aphrodite ! Tree Lover ! Tree Hugger ! Tree Smoker ! #FAMU17 http://t.co/wTzMwn6kYf',58049,828,0,0,'http://a0.twimg.com/profile_images/378800000160904028/0c66379bf348a7a5dcca0aa30256921d_normal.jpeg','https://si0.twimg.com/profile_images/378800000160904028/0c66379bf348a7a5dcca0aa30256921d_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/513372774/twitter.jpg','C0DEED','http://a0.twimg.com/profile_background_images/513372774/twitter.jpg','DDEEF6','C0DEED',0,'2013-07-25 21:15:44'),(467230820,'467230820','Putri dwi susanto','putridharmaaa','2012-01-18 07:47:13','Tanggerang ',0,8,'http://t.co/b4EB48qU9A',NULL,0,'id',297,0,0,1,NULL,'Calon suami @ekadwisusanto♥☺☀★',2872,461,1,0,'http://a0.twimg.com/profile_images/378800000187387721/888556ce33150d8a55ddd87e8ce2ac1f_normal.jpeg','https://si0.twimg.com/profile_images/378800000187387721/888556ce33150d8a55ddd87e8ce2ac1f_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:44:02'),(474230418,'474230418','Laura Horgan','LauraHorgan91','2012-01-25 19:49:09','Swansea UK',0,350,NULL,7200,0,'en',205,0,0,1,'Amsterdam','21. Student.',2579,1116,0,0,'http://a0.twimg.com/profile_images/378800000136916072/93a54186870fe66b64c9894a713dd1ce_normal.jpeg','https://si0.twimg.com/profile_images/378800000136916072/93a54186870fe66b64c9894a713dd1ce_normal.jpeg','FF0000',1,'3D1957','https://si0.twimg.com/profile_background_images/378800000003068566/60c7464da15b537c8813aae8c7031f86.jpeg','642D8B','http://a0.twimg.com/profile_background_images/378800000003068566/60c7464da15b537c8813aae8c7031f86.jpeg','7AC3EE','FFFFFF',1,'2013-07-25 21:53:11'),(517803027,'517803027','Jazz','Jazz_Samra','2012-03-07 17:56:16','',0,2003,NULL,0,6,'en',14293,0,0,0,'Casablanca','Bow Down Bitches',10158,221,0,0,'http://a0.twimg.com/profile_images/378800000118847447/e4431e50ddf0b432ad998b74875c62b1_normal.jpeg','https://si0.twimg.com/profile_images/378800000118847447/e4431e50ddf0b432ad998b74875c62b1_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme15/bg.png','022330','http://a0.twimg.com/images/themes/theme15/bg.png','C0DFEC','A8C7F7',0,'2013-07-25 21:53:11'),(526845573,'526845573','KENZIEMCKISSICK','kenzieann98','2012-03-16 22:15:11','',0,27,NULL,-14400,0,'en',154,0,0,0,'Eastern Time (US & Canada)','',1571,392,0,0,'http://a0.twimg.com/profile_images/378800000042780761/88c8bcf7d7af1bd3008b6994e51c2c90_normal.jpeg','https://si0.twimg.com/profile_images/378800000042780761/88c8bcf7d7af1bd3008b6994e51c2c90_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/378800000008831371/acf0ab88a44f75259ec62be934fd016a.jpeg','C0DEED','http://a0.twimg.com/profile_background_images/378800000008831371/acf0ab88a44f75259ec62be934fd016a.jpeg','DDEEF6','FFFFFF',1,'2013-07-25 21:53:11'),(550819582,'550819582','yuya@CRITICAL HIT','cut_rainbow','2012-04-11 08:41:33','area奈良 from.郡山',0,15,NULL,NULL,1,'ja',360,0,0,0,NULL,'MC.SEL\\CRITICAL HIT fr.奈良\\YOUNG$ENT.INITY RESPEC CREW',1940,380,0,0,'http://a0.twimg.com/profile_images/378800000185122089/3c24afc63f97800df59d0a8f731b7254_normal.jpeg','https://si0.twimg.com/profile_images/378800000185122089/3c24afc63f97800df59d0a8f731b7254_normal.jpeg','ED0C0C',1,'333333','https://si0.twimg.com/profile_background_images/801944194/c63c508711220bd0dd9eef1173c21c78.jpeg','131516','http://a0.twimg.com/profile_background_images/801944194/c63c508711220bd0dd9eef1173c21c78.jpeg','DDEEF6','000000',1,'2013-07-25 21:53:11'),(615223851,'615223851','Charbel not charbil','Charbelokbye','2012-06-22 12:57:20','qatar/lebanon',0,331,NULL,10800,0,'en',227,0,0,1,'Baghdad','#ChelseaFC- #A7X - i can drink a bonjus bi kar3a we7de k bye.',4367,128,1,0,'http://a0.twimg.com/profile_images/378800000187838000/03f1666c0400d28dd1f5be9eb4f9f4fd_normal.jpeg','https://si0.twimg.com/profile_images/378800000187838000/03f1666c0400d28dd1f5be9eb4f9f4fd_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:15:44'),(625059284,'625059284','Edmund Turnpike','EdmundOfPaisley','2012-07-02 22:42:15','Tacoma, Washington, USA',0,4498,'http://t.co/3ci30Rpfpo',-25200,7,'en',516,0,0,0,'Pacific Time (US & Canada)','Gay, Amateur Taxidermist, Poet, living in the 1920\'s. Baffled by nearly everything, I am able to exist in a state of perpetual wonder.',3697,841,0,0,'http://a0.twimg.com/profile_images/2362061409/533169_3746913158715_1370211314_n_normal.jpg','https://si0.twimg.com/profile_images/2362061409/533169_3746913158715_1370211314_n_normal.jpg','2FC2EF',1,'666666','https://si0.twimg.com/images/themes/theme9/bg.gif','1A1B1F','http://a0.twimg.com/images/themes/theme9/bg.gif','252429','181A1E',0,'2013-07-25 21:44:02'),(630546561,'630546561','Lechoncillo ','ChapaMellark','2012-07-08 19:38:44','En el laho de Parachute',0,640,'http://t.co/98VzCvI1F4',10800,0,'es',327,0,0,0,'Athens','Mi biografía se quemó y Peeta se la tiró a Katniss bajo la lluvia.',7978,383,0,0,'http://a0.twimg.com/profile_images/378800000123068525/0586ccf465bd185dd841374a3ec95bac_normal.jpeg','https://si0.twimg.com/profile_images/378800000123068525/0586ccf465bd185dd841374a3ec95bac_normal.jpeg','A16A23',1,'E0912A','https://si0.twimg.com/profile_background_images/378800000006955629/ca803a76e78ddd4e5f1bb46a2205c120.jpeg','510800','http://a0.twimg.com/profile_background_images/378800000006955629/ca803a76e78ddd4e5f1bb46a2205c120.jpeg','2C1703','000000',1,'2013-07-25 21:44:02'),(714867116,'714867116','SOON ','AwessomGirls','2012-07-24 20:17:35','polska ',0,320,NULL,7200,0,'pl',1073,0,0,0,'Warsaw','Believe & Never Say Never \r\nPolish Belieber and Selenator  :3',5942,1417,0,0,'http://a0.twimg.com/profile_images/378800000187846107/0df0c92012f131e33a146cc1221a3163_normal.png','https://si0.twimg.com/profile_images/378800000187846107/0df0c92012f131e33a146cc1221a3163_normal.png','EB96C9',1,'3D1957','https://si0.twimg.com/profile_background_images/378800000033259542/210cf453891b0098815cab5d9da011a3.png','FFFFFF','http://a0.twimg.com/profile_background_images/378800000033259542/210cf453891b0098815cab5d9da011a3.png','7AC3EE','FFFFFF',0,'2013-07-25 21:12:04'),(718774482,'718774482','Patty L. Saenz','ballet_girl19','2012-07-26 21:11:53','District 12',0,637,'http://t.co/WsvflFlOjv',-25200,0,'en',177,0,0,1,'Arizona','☆She acts like summer and walks like rain.☆',3261,283,0,0,'http://a0.twimg.com/profile_images/378800000134878142/b8f9936cec3cc8ae8d8d12299c578249_normal.jpeg','https://si0.twimg.com/profile_images/378800000134878142/b8f9936cec3cc8ae8d8d12299c578249_normal.jpeg','038543',1,'333333','https://si0.twimg.com/images/themes/theme18/bg.gif','25D3D9','http://a0.twimg.com/images/themes/theme18/bg.gif','F6F6F6','FFFFFF',0,'2013-07-25 21:53:11'),(737305884,'737305884','Pilar Gallardo','pilargallardo10','2012-08-04 19:45:33','',0,107,NULL,NULL,0,'es',194,0,0,1,NULL,'',2436,171,0,0,'http://a0.twimg.com/profile_images/378800000017258536/ee3ca12c9fbbdfe151269440b94c9f78_normal.jpeg','https://si0.twimg.com/profile_images/378800000017258536/ee3ca12c9fbbdfe151269440b94c9f78_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/814599114/26cd27b7b09cadc72c020ab7e29adf60.jpeg','C0DEED','http://a0.twimg.com/profile_background_images/814599114/26cd27b7b09cadc72c020ab7e29adf60.jpeg','DDEEF6','FFFFFF',1,'2013-07-25 21:53:11'),(765951480,'765951480','Taylor Carter','TayMorganC','2012-08-18 16:06:22','',0,2978,NULL,-18000,0,'en',331,0,0,0,'Central Time (US & Canada)','I\'m just trying to be a mermaid.',1875,172,0,0,'http://a0.twimg.com/profile_images/378800000167430613/89771c703a127d2cc86091b56b193fb8_normal.jpeg','https://si0.twimg.com/profile_images/378800000167430613/89771c703a127d2cc86091b56b193fb8_normal.jpeg','B04CB0',1,'333333','https://si0.twimg.com/profile_background_images/672644207/80083e51c58e3a36bb8e8998a8fdecfc.jpeg','000000','http://a0.twimg.com/profile_background_images/672644207/80083e51c58e3a36bb8e8998a8fdecfc.jpeg','DDEEF6','FFFFFF',1,'2013-07-25 21:15:44'),(801565105,'801565105','Andy Gómez','G30Andy','2012-09-04 01:14:25','México',0,1,NULL,NULL,0,'es',25,0,0,0,NULL,'Me gusta escuchar música, ver anime y leer. Amo cazadores de sombras y crepúsculo ... :D',47,130,0,0,'http://a0.twimg.com/profile_images/378800000069275374/643fccccb846bfaccb1748241db9d3c5_normal.jpeg','https://si0.twimg.com/profile_images/378800000069275374/643fccccb846bfaccb1748241db9d3c5_normal.jpeg','0099B9',1,'3C3940','https://si0.twimg.com/images/themes/theme4/bg.gif','0099B9','http://a0.twimg.com/images/themes/theme4/bg.gif','95E8EC','5ED4DC',0,'2013-07-25 21:47:01'),(817646190,'817646190','Cynthia nonkie','KCMolema','2012-09-11 15:35:49','Kimberley ',0,4,NULL,NULL,0,'en',7,0,0,0,NULL,'',153,89,1,0,'http://a0.twimg.com/profile_images/378800000028532000/90b52dac2ae07de68fb81072b2448fb5_normal.jpeg','https://si0.twimg.com/profile_images/378800000028532000/90b52dac2ae07de68fb81072b2448fb5_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(827579610,'827579610','rib','rinamarie_','2012-09-16 19:05:04','',0,23,'http://t.co/gDHCjCJz2a',7200,0,'en',390,0,0,1,'Amsterdam','See that follow button,I\'d tap that! I follow back! Oh yeh, add me on bbm;24C15C32 and follow me on instagram- rinamariex ❤ELIZABETHGILLIES+NAYARIVERA❤',930,240,1,0,'http://a0.twimg.com/profile_images/3782793171/77c13200dd443ba944c0b7226900a06c_normal.jpeg','https://si0.twimg.com/profile_images/3782793171/77c13200dd443ba944c0b7226900a06c_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(866414401,'866414401','Flo.','Sweezy_Babi','2012-10-07 14:25:39','',0,339,NULL,-25200,0,'en',146,0,0,0,'Pacific Time (US & Canada)','Living Life ; Feeling Free ; 2013 ♥',8828,124,1,0,'http://a0.twimg.com/profile_images/378800000109998231/c4edb8eed8f06fa5aafa297ff989a194_normal.jpeg','https://si0.twimg.com/profile_images/378800000109998231/c4edb8eed8f06fa5aafa297ff989a194_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(880816976,'880816976','Ricardo Valentim','ricardvalentim','2012-10-14 19:25:17','Gryffindor Common Room',0,2265,'http://t.co/ZIzWAxpm3W',3600,1,'pt',414,0,0,0,'Lisbon','~And I go crazy cause here isn\'t where I wanna be~ http://t.co/VoNpMiPTGc…',10303,152,0,0,'http://a0.twimg.com/profile_images/378800000154332225/f3f9d93c0342cfce1c05713f598be5f7_normal.jpeg','https://si0.twimg.com/profile_images/378800000154332225/f3f9d93c0342cfce1c05713f598be5f7_normal.jpeg','571A1A',1,'333333','https://si0.twimg.com/profile_background_images/378800000028484735/22ec14da48e67d4d4c7d84c9a7028b47.jpeg','131516','http://a0.twimg.com/profile_background_images/378800000028484735/22ec14da48e67d4d4c7d84c9a7028b47.jpeg','EFEFEF','000000',1,'2013-07-25 21:12:04'),(912985280,'912985280','Holly Smale','HolSmale','2012-10-29 18:31:26','London',0,5937,'http://t.co/tW9UD9fAAu',3600,25,'en',1402,0,0,1,'London','Author of bestselling @HarperCollinsCh debut GEEK GIRL. And her own misfortunes, but that\'s another topic entirely.',7240,538,0,0,'http://a0.twimg.com/profile_images/378800000088489206/78b2d2a040dacb23abcea7745b4b0c7e_normal.jpeg','https://si0.twimg.com/profile_images/378800000088489206/78b2d2a040dacb23abcea7745b4b0c7e_normal.jpeg','CC3366',1,'333333','https://si0.twimg.com/profile_background_images/378800000031197100/d6295314df12bccd9eee557aa80f64c8.jpeg','DBE9ED','http://a0.twimg.com/profile_background_images/378800000031197100/d6295314df12bccd9eee557aa80f64c8.jpeg','F6FFD1','FFFFFF',1,'2013-07-25 21:53:11'),(1027484226,'1027484226','Lebowsky','SOADicto03','2012-12-22 01:12:16','Paradise City',0,3995,'http://t.co/AXIlAjLO3a',7200,1,'es',171,0,0,0,'Amsterdam','17. Cinéfilo. Nirvana, SOAD, Rayden, KM*. ¿Amigos? Todo. Pequeño hijo de puta. Humilde hasta en el ego. Tenía una gata. Ze(L)da. 100% rabia y odio. Ⓐnarquista.',17939,158,0,0,'http://a0.twimg.com/profile_images/378800000182918803/1242f470fe5b8d0dbbdf61a747671ec2_normal.jpeg','https://si0.twimg.com/profile_images/378800000182918803/1242f470fe5b8d0dbbdf61a747671ec2_normal.jpeg','2FC2EF',1,'333333','https://si0.twimg.com/profile_background_images/889737742/63930b500f2bc114ffa0a7fe1f9983c0.jpeg','1A1B1F','http://a0.twimg.com/profile_background_images/889737742/63930b500f2bc114ffa0a7fe1f9983c0.jpeg','DDEEF6','FFFFFF',1,'2013-07-25 21:53:11'),(1097404333,'1097404333','Sarah The Selenator','Selenator1254','2013-01-17 06:40:30','Muscat, Oman',0,153,NULL,14400,0,'en',436,0,0,1,'Muscat','Selenator. My only dream is Selena to Follow. I Follow Back \'Tell em it\'s my birthday when I party like that!\' My BFF is @g0mezslegion #MessWithHerYouMessWithMe',1470,1368,0,0,'http://a0.twimg.com/profile_images/378800000183111070/d83a2aaf5691937b8cbfb8f14db3c5be_normal.jpeg','https://si0.twimg.com/profile_images/378800000183111070/d83a2aaf5691937b8cbfb8f14db3c5be_normal.jpeg','780D34',1,'3D1957','https://si0.twimg.com/profile_background_images/378800000032191217/ad871a367a4b67a140b560d4334f792b.png','850C46','http://a0.twimg.com/profile_background_images/378800000032191217/ad871a367a4b67a140b560d4334f792b.png','7AC3EE','FFFFFF',1,'2013-07-25 21:53:11'),(1220218627,'1220218627','_Trvppy♥','Doped_sosa_xx','2013-02-26 01:47:40','#LoudHouse      #Shhh Bitch   ',0,281,'http://t.co/z5qHDW9bNI',NULL,0,'en',60,0,0,1,NULL,'HighLife ... Scoripo MixedBitch',1422,188,1,0,'http://a0.twimg.com/profile_images/378800000178555736/80c2c3e8037f1d53b32be4bca2911c03_normal.jpeg','https://si0.twimg.com/profile_images/378800000178555736/80c2c3e8037f1d53b32be4bca2911c03_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1239644016,'1239644016','❂','emccar_','2013-03-03 19:28:28','',0,3250,NULL,-10800,0,'en',449,0,0,0,'Atlantic Time (Canada)','you don\'t know me',10355,441,0,0,'http://a0.twimg.com/profile_images/378800000186703073/ce5a8d322ea1ff78fc6249e3e3640429_normal.jpeg','https://si0.twimg.com/profile_images/378800000186703073/ce5a8d322ea1ff78fc6249e3e3640429_normal.jpeg','0EF0D2',0,'333333','https://si0.twimg.com/profile_background_images/865902809/7fbdfcae2fa1c7935d869a878a8669e1.jpeg','010D0D','http://a0.twimg.com/profile_background_images/865902809/7fbdfcae2fa1c7935d869a878a8669e1.jpeg','DDEEF6','000000',0,'2013-07-25 21:53:11'),(1252362656,'1252362656','Grace!!!','Grace1D4ever_xx','2013-03-08 17:56:11','',0,35,NULL,NULL,0,'en',472,0,0,0,NULL,'Sutton Bonington most dedicated #directioner!! I love singing.Live life to the full, follow me and ill follow u back!!! Saw One Direction 16th april AMAZING!!!',1290,633,1,0,'http://a0.twimg.com/profile_images/378800000187919718/1a647cea2e943e8d5e56ff3484a082f9_normal.jpeg','https://si0.twimg.com/profile_images/378800000187919718/1a647cea2e943e8d5e56ff3484a082f9_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:44:02'),(1314814926,'1314814926','Alba Requena','albarequenarico','2013-03-29 18:45:49','',0,9,NULL,NULL,0,'es',92,0,0,1,NULL,'Bailarina del conservatorio profesional de danza Jose Antonio Ruiz It\'s a bad day not a bad life!! :D',827,151,1,0,'http://a0.twimg.com/profile_images/378800000136888676/775a6b3220a4be2154996588aae93371_normal.jpeg','https://si0.twimg.com/profile_images/378800000136888676/775a6b3220a4be2154996588aae93371_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1339715755,'1339715755','elias daniel vera ','eliasmusicvera','2013-04-09 17:09:03','',0,1,NULL,-16200,2,'es',87,0,0,0,'Caracas','Talento Venezolano!!! El tiempo de Dios es perfecto',85,202,1,0,'http://a0.twimg.com/profile_images/3637827117/0f393da5d5ebe694575e520b0f9b6e99_normal.jpeg','https://si0.twimg.com/profile_images/3637827117/0f393da5d5ebe694575e520b0f9b6e99_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1348887342,'1348887342','°J@฿µ W!££¡@m§°','jabuwilliams','2013-04-13 10:33:36','',0,0,NULL,NULL,0,'en',2,0,0,0,NULL,'born a drummer thats all the is drums THATS ME',5,6,1,0,'http://a0.twimg.com/profile_images/378800000186269590/64b23c3de8b55af65e596afcc715f482_normal.png','https://si0.twimg.com/profile_images/378800000186269590/64b23c3de8b55af65e596afcc715f482_normal.png','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:47:01'),(1375907310,'1375907310','TWEET LIMIT','Mahonesboo','2013-04-24 01:57:52','',0,1168,'http://t.co/Tygkjuu2t4',-10800,2,'en',1243,0,0,0,'Atlantic Time (Canada)','I GOT TWEET LIMIT CAUSE I WANTED A 5SOS FOLLOW, BUT I\'M STILL FOLLOWLESS :(',5362,1655,0,0,'http://a0.twimg.com/profile_images/378800000140571745/629de4ea802f92ac10812f8705275c42_normal.jpeg','https://si0.twimg.com/profile_images/378800000140571745/629de4ea802f92ac10812f8705275c42_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/378800000030685098/643690faf68ded05cd54c12be928b5a4.jpeg','FAFAFA','http://a0.twimg.com/profile_background_images/378800000030685098/643690faf68ded05cd54c12be928b5a4.jpeg','DDEEF6','000000',1,'2013-07-25 21:44:02'),(1394474324,'1394474324','julian gamez','JgcUian','2013-05-01 11:50:42','',0,39,NULL,NULL,0,'es',13,0,0,0,NULL,'feel the moment',610,51,1,0,'http://a0.twimg.com/profile_images/378800000148395031/3be096e1766b49061aa54852c3c122ee_normal.jpeg','https://si0.twimg.com/profile_images/378800000148395031/3be096e1766b49061aa54852c3c122ee_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1396775648,'1396775648','ちー@4＋FAN=NEWS','ballet_chii','2013-05-02 09:51:57','',0,310,NULL,NULL,0,'ja',492,0,0,0,NULL,'　　　98年組　鶴中→鶴高15HR　　　　　NEWS/テゴマスが好き♡テゴ担でーす♪　　　　　　　双子は莉子(∵)成亮catcher     　　パーナのみなさん、フォローよろしく(*´˘`*)♡　　無言フォロー全然オーケー♪',2724,515,1,0,'http://a0.twimg.com/profile_images/378800000085258949/91100bc4ce58e735b20091d3b1077a28_normal.jpeg','https://si0.twimg.com/profile_images/378800000085258949/91100bc4ce58e735b20091d3b1077a28_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1444612225,'1444612225','Reality\'s ','4ever_reality','2013-05-20 19:35:04','Estado de Goiás',0,60,NULL,-10800,0,'pt',487,0,0,0,'Brasilia','Como não amar a um Deus que diz: Sempre que me chamar,Eu vou te ajudar ! Meu ídolo é Deus , Sou fã de Reality Show , Curto Kamieser e BarTeus.',5828,553,1,0,'http://a0.twimg.com/profile_images/378800000124524431/a97d1c210790570795a34c70930a0b59_normal.jpeg','https://si0.twimg.com/profile_images/378800000124524431/a97d1c210790570795a34c70930a0b59_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:47:01'),(1450132687,'1450132687','Amallia Brandolff','AmalliaB','2013-05-22 23:34:08','',0,0,NULL,NULL,0,'pt',39,0,0,0,NULL,'They thought I had guts but they had it all wrong. I was only frightened of more important things.',196,51,0,0,'http://a0.twimg.com/profile_images/3696432865/e59647cfecafcde9f68ca0a36031d5b0_normal.jpeg','https://si0.twimg.com/profile_images/3696432865/e59647cfecafcde9f68ca0a36031d5b0_normal.jpeg','009999',1,'333333','https://si0.twimg.com/images/themes/theme14/bg.gif','131516','http://a0.twimg.com/images/themes/theme14/bg.gif','EFEFEF','EEEEEE',1,'2013-07-25 21:53:11'),(1554309900,'1554309900','Jasmine McCoy','Jazz_Spazz45','2013-06-29 00:20:09','',0,553,NULL,NULL,0,'en',228,0,0,0,NULL,'Tx',1181,146,1,0,'http://a0.twimg.com/profile_images/378800000186830752/64a79b354538eb745ad9b9829eb9cbba_normal.jpeg','https://si0.twimg.com/profile_images/378800000186830752/64a79b354538eb745ad9b9829eb9cbba_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/images/themes/theme1/bg.png','C0DEED','http://a0.twimg.com/images/themes/theme1/bg.png','DDEEF6','C0DEED',0,'2013-07-25 21:53:11'),(1588482816,'1588482816','Lisa Marien','marien_lisa','2013-07-12 13:34:47','',0,0,NULL,NULL,11,'en',28,0,0,0,NULL,'Health Enthusiast, Animal Lover, Publicist & Entrepreneur.',82,4,0,0,'http://a0.twimg.com/profile_images/378800000123895692/4716cb5de54da0796ccd1e546e605842_normal.jpeg','https://si0.twimg.com/profile_images/378800000123895692/4716cb5de54da0796ccd1e546e605842_normal.jpeg','0084B4',1,'333333','https://si0.twimg.com/profile_background_images/378800000022785135/b84d08e00c0aee2161d08dcec523790d.jpeg','0082ED','http://a0.twimg.com/profile_background_images/378800000022785135/b84d08e00c0aee2161d08dcec523790d.jpeg','DDEEF6','FFFFFF',0,'2013-07-25 21:53:11');
/*!40000 ALTER TABLE `twitter_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-26  8:12:18
