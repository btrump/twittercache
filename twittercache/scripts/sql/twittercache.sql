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
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
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
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'twitter','0001_initial','2013-07-11 21:10:27'),(2,'twitter','0002_auto__chg_field_tweet_in_reply_to_status_id_str__chg_field_tweet_in_re','2013-07-11 21:12:21'),(3,'twitter','0003_auto__add_searchterm','2013-07-11 21:27:03'),(4,'twitter','0004_auto__add_field_searchterm_application','2013-07-23 15:17:20'),(5,'twitter','0005_auto__add_field_tweet_search_term','2013-07-23 16:47:24'),(6,'twitter','0006_auto__add_field_application_access_token__add_field_application_access','2013-07-23 21:25:26');
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
  `name` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `consumer_key` varchar(100) NOT NULL,
  `consumer_secret` varchar(100) NOT NULL,
  `request_token_url` varchar(200) NOT NULL,
  `authorize_url` varchar(200) NOT NULL,
  `access_token_url` varchar(200) NOT NULL,
  `callback_url` varchar(200) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `access_token_secret` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
  `term` varchar(200) NOT NULL,
  `weight` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `added_at` datetime NOT NULL,
  `application_id` int(11),
  PRIMARY KEY (`id`),
  KEY `twitter_searchterm_bf127e2f` (`application_id`),
  CONSTRAINT `application_id_refs_id_c1db7e49` FOREIGN KEY (`application_id`) REFERENCES `twitter_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
  `id_str` varchar(200) NOT NULL,
  `coordinate_longitude` double NOT NULL,
  `coordinate_latitude` double NOT NULL,
  `coordinate_type` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `favorited` tinyint(1) DEFAULT NULL,
  `truncated` tinyint(1) DEFAULT NULL,
  `retweeted` tinyint(1) DEFAULT NULL,
  `text` varchar(140) NOT NULL,
  `retweet_count` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `in_reply_to_user_id` bigint(20) NOT NULL,
  `in_reply_to_user_id_str` varchar(200) NOT NULL,
  `in_reply_to_status_id` bigint(20) NOT NULL,
  `in_reply_to_status_id_str` varchar(200) NOT NULL,
  `in_reply_to_screen_name` varchar(200) NOT NULL,
  `source` varchar(400) NOT NULL,
  `added_at` datetime NOT NULL,
  `search_term_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `twitter_tweet_6340c63c` (`user_id`),
  KEY `twitter_tweet_2b7062a4` (`search_term_id`),
  CONSTRAINT `search_term_id_refs_id_fc3d004f` FOREIGN KEY (`search_term_id`) REFERENCES `twitter_searchterm` (`id`),
  CONSTRAINT `user_id_refs_id_d9e66ee6` FOREIGN KEY (`user_id`) REFERENCES `twitter_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_tweet`
--

LOCK TABLES `twitter_tweet` WRITE;
/*!40000 ALTER TABLE `twitter_tweet` DISABLE KEYS */;
INSERT INTO `twitter_tweet` VALUES (23523,'23523',37,7867,'point','2013-07-23 16:47:52',NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate neque auctor risus malesuada, et cursus ante faucibus. Aliquam non n',0,17,235,'235',235,'235','235','web','2013-07-23 16:47:28',4);
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
  `id_str` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `screen_name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `location` varchar(200) NOT NULL,
  `is_translator` tinyint(1) NOT NULL,
  `favourites_count` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `utc_offset` int(11) NOT NULL,
  `listed_count` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `followers_count` int(11) NOT NULL,
  `protected` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `geo_enabled` tinyint(1) NOT NULL,
  `time_zone` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `statuses_count` int(11) NOT NULL,
  `friends_count` int(11) NOT NULL,
  `default_profile` tinyint(1) NOT NULL,
  `default_profile_image` tinyint(1) NOT NULL,
  `profile_image_url` varchar(200) NOT NULL,
  `profile_image_url_https` varchar(200) NOT NULL,
  `profile_link_color` varchar(200) NOT NULL,
  `profile_use_background_image` tinyint(1) NOT NULL,
  `profile_text_color` varchar(200) NOT NULL,
  `profile_background_image_url_https` varchar(200) NOT NULL,
  `profile_background_color` varchar(200) NOT NULL,
  `profile_background_image_url` varchar(200) NOT NULL,
  `profile_sidebar_fill_color` varchar(200) NOT NULL,
  `profile_sidebar_border_color` varchar(200) NOT NULL,
  `profile_background_tile` tinyint(1) NOT NULL,
  `added_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_user`
--

LOCK TABLES `twitter_user` WRITE;
/*!40000 ALTER TABLE `twitter_user` DISABLE KEYS */;
INSERT INTO `twitter_user` VALUES (17,'17','Test User Name','Test User Name','2013-07-23 16:48:14','3452 543 q4w3q 43 4t3',0,34534,'http://google.com/',5,1,'en',6,0,0,0,'12','blah',5,2,0,0,'http://google.com/img','http://google.com/img','c',0,'d','http://google.com/img','f','http://google.com/img','h','i',0,'2013-07-23 16:47:28');
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

-- Dump completed on 2013-07-23 17:56:17
