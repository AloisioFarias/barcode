-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: netbar
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Current Database: `netbar`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `netbar` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `netbar`;

--
-- Table structure for table `jforum_api`
--

DROP TABLE IF EXISTS `jforum_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(32) NOT NULL,
  `api_validity` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_api`
--

LOCK TABLES `jforum_api` WRITE;
/*!40000 ALTER TABLE `jforum_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach`
--

DROP TABLE IF EXISTS `jforum_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach` (
  `attach_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `privmsgs_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `idx_att_post` (`post_id`),
  KEY `idx_att_priv` (`privmsgs_id`),
  KEY `idx_att_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach`
--

LOCK TABLES `jforum_attach` WRITE;
/*!40000 ALTER TABLE `jforum_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_desc`
--

DROP TABLE IF EXISTS `jforum_attach_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach_desc` (
  `attach_desc_id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_id` int(11) NOT NULL,
  `physical_filename` varchar(255) NOT NULL,
  `real_filename` varchar(255) NOT NULL,
  `download_count` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mimetype` varchar(85) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `thumb` tinyint(1) DEFAULT '0',
  `extension_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attach_desc_id`),
  KEY `idx_att_d_att` (`attach_id`),
  KEY `idx_att_d_ext` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach_desc`
--

LOCK TABLES `jforum_attach_desc` WRITE;
/*!40000 ALTER TABLE `jforum_attach_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_attach_quota`
--

DROP TABLE IF EXISTS `jforum_attach_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_attach_quota` (
  `attach_quota_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `quota_limit_id` int(11) NOT NULL,
  PRIMARY KEY (`attach_quota_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_attach_quota`
--

LOCK TABLES `jforum_attach_quota` WRITE;
/*!40000 ALTER TABLE `jforum_attach_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_attach_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banlist`
--

DROP TABLE IF EXISTS `jforum_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_banlist` (
  `banlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `banlist_ip` varchar(15) DEFAULT NULL,
  `banlist_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banlist_id`),
  KEY `idx_user` (`user_id`),
  KEY `banlist_ip` (`banlist_ip`),
  KEY `banlist_email` (`banlist_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_banlist`
--

LOCK TABLES `jforum_banlist` WRITE;
/*!40000 ALTER TABLE `jforum_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_banner`
--

DROP TABLE IF EXISTS `jforum_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(90) DEFAULT NULL,
  `banner_placement` int(11) NOT NULL DEFAULT '0',
  `banner_description` varchar(250) DEFAULT NULL,
  `banner_clicks` int(11) NOT NULL DEFAULT '0',
  `banner_views` int(11) NOT NULL DEFAULT '0',
  `banner_url` varchar(250) DEFAULT NULL,
  `banner_weight` tinyint(1) NOT NULL DEFAULT '50',
  `banner_active` tinyint(1) NOT NULL DEFAULT '0',
  `banner_comment` varchar(250) DEFAULT NULL,
  `banner_type` int(11) NOT NULL DEFAULT '0',
  `banner_width` int(11) NOT NULL DEFAULT '0',
  `banner_height` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_banner`
--

LOCK TABLES `jforum_banner` WRITE;
/*!40000 ALTER TABLE `jforum_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_bookmarks`
--

DROP TABLE IF EXISTS `jforum_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_bookmarks` (
  `bookmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `public_visible` int(11) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookmark_id`),
  KEY `book_idx_relation` (`relation_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_bookmarks`
--

LOCK TABLES `jforum_bookmarks` WRITE;
/*!40000 ALTER TABLE `jforum_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_categories`
--

DROP TABLE IF EXISTS `jforum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_categories`
--

LOCK TABLES `jforum_categories` WRITE;
/*!40000 ALTER TABLE `jforum_categories` DISABLE KEYS */;
INSERT INTO `jforum_categories` VALUES (1,'Category Test',1,0);
/*!40000 ALTER TABLE `jforum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_config`
--

DROP TABLE IF EXISTS `jforum_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_config` (
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_config`
--

LOCK TABLES `jforum_config` WRITE;
/*!40000 ALTER TABLE `jforum_config` DISABLE KEYS */;
INSERT INTO `jforum_config` VALUES ('most.users.ever.online','2',1),('most.users.ever.online.date','1477269345526',2);
/*!40000 ALTER TABLE `jforum_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extension_groups`
--

DROP TABLE IF EXISTS `jforum_extension_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_extension_groups` (
  `extension_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `allow` tinyint(1) DEFAULT '1',
  `upload_icon` varchar(100) DEFAULT NULL,
  `download_mode` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`extension_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_extension_groups`
--

LOCK TABLES `jforum_extension_groups` WRITE;
/*!40000 ALTER TABLE `jforum_extension_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extension_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_extensions`
--

DROP TABLE IF EXISTS `jforum_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_group_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `upload_icon` varchar(100) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`extension_id`),
  KEY `extension_group_id` (`extension_group_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_extensions`
--

LOCK TABLES `jforum_extensions` WRITE;
/*!40000 ALTER TABLE `jforum_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums`
--

DROP TABLE IF EXISTS `jforum_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_forums` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL DEFAULT '1',
  `forum_name` varchar(150) NOT NULL DEFAULT '',
  `forum_desc` varchar(255) DEFAULT NULL,
  `forum_order` int(11) DEFAULT '1',
  `forum_topics` int(11) NOT NULL DEFAULT '0',
  `forum_last_post_id` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `categories_id` (`categories_id`),
  KEY `idx_forums_cats` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_forums`
--

LOCK TABLES `jforum_forums` WRITE;
/*!40000 ALTER TABLE `jforum_forums` DISABLE KEYS */;
INSERT INTO `jforum_forums` VALUES (1,1,'Test Forum','This is a test forum',1,1,1,0);
/*!40000 ALTER TABLE `jforum_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_forums_watch`
--

DROP TABLE IF EXISTS `jforum_forums_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_forums_watch` (
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_fw_forum` (`forum_id`),
  KEY `idx_fw_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_forums_watch`
--

LOCK TABLES `jforum_forums_watch` WRITE;
/*!40000 ALTER TABLE `jforum_forums_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_forums_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_groups`
--

DROP TABLE IF EXISTS `jforum_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(40) NOT NULL DEFAULT '',
  `group_description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_groups`
--

LOCK TABLES `jforum_groups` WRITE;
/*!40000 ALTER TABLE `jforum_groups` DISABLE KEYS */;
INSERT INTO `jforum_groups` VALUES (1,'General','General Users',0),(2,'Administration','Admin Users',0);
/*!40000 ALTER TABLE `jforum_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_karma`
--

DROP TABLE IF EXISTS `jforum_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_karma` (
  `karma_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rate_date` datetime DEFAULT NULL,
  PRIMARY KEY (`karma_id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `post_user_id` (`post_user_id`),
  KEY `from_user_id` (`from_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_karma`
--

LOCK TABLES `jforum_karma` WRITE;
/*!40000 ALTER TABLE `jforum_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_mail_integration`
--

DROP TABLE IF EXISTS `jforum_mail_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_mail_integration` (
  `forum_id` int(11) NOT NULL,
  `forum_email` varchar(100) NOT NULL,
  `pop_username` varchar(100) NOT NULL,
  `pop_password` varchar(100) NOT NULL,
  `pop_host` varchar(100) NOT NULL,
  `pop_port` int(11) DEFAULT '110',
  `pop_ssl` tinyint(4) DEFAULT '0',
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_mail_integration`
--

LOCK TABLES `jforum_mail_integration` WRITE;
/*!40000 ALTER TABLE `jforum_mail_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_mail_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_moderation_log`
--

DROP TABLE IF EXISTS `jforum_moderation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_moderation_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_description` text NOT NULL,
  `log_original_message` text,
  `log_date` datetime NOT NULL,
  `log_type` tinyint(4) DEFAULT '0',
  `post_id` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0',
  `post_user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  KEY `post_user_id` (`post_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_moderation_log`
--

LOCK TABLES `jforum_moderation_log` WRITE;
/*!40000 ALTER TABLE `jforum_moderation_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_moderation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts`
--

DROP TABLE IF EXISTS `jforum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_time` datetime DEFAULT NULL,
  `poster_ip` varchar(15) DEFAULT NULL,
  `enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `enable_html` tinyint(1) NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) NOT NULL DEFAULT '1',
  `post_edit_time` datetime DEFAULT NULL,
  `post_edit_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `attach` tinyint(1) DEFAULT '0',
  `need_moderate` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `post_time` (`post_time`),
  KEY `need_moderate` (`need_moderate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_posts`
--

LOCK TABLES `jforum_posts` WRITE;
/*!40000 ALTER TABLE `jforum_posts` DISABLE KEYS */;
INSERT INTO `jforum_posts` VALUES (1,1,1,2,'2016-10-23 22:35:08','127.0.0.1',1,0,1,1,NULL,0,1,0,0);
/*!40000 ALTER TABLE `jforum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_posts_text`
--

DROP TABLE IF EXISTS `jforum_posts_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_posts_text` (
  `post_id` int(11) NOT NULL,
  `post_text` text,
  `post_subject` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_posts_text`
--

LOCK TABLES `jforum_posts_text` WRITE;
/*!40000 ALTER TABLE `jforum_posts_text` DISABLE KEYS */;
INSERT INTO `jforum_posts_text` VALUES (1,'[b][color=blue][size=18]Congratulations :!: [/size][/color][/b]\nYou have completed the installation, and JForum is up and running. \n\nTo start administering the board, login as [i]Admin / <the password you supplied in the installer>[/i] and access the [b][url=/admBase/login.page]Admin Control Panel[/url][/b] using the link that shows up in the bottom of the page. There you will be able to create Categories, Forums and much more  :D  \n\nFor more information and support, please refer to the following pages:\n\n:arrow: Community forum: http://jforum.andowson.com/\n:arrow: Documentation: http://code.google.com/p/jforum2/w/list\n\nThank you for choosing JForum.\n\n[url=http://jforum.net/team.jsp]The JForum Team[/url]\n\n','Welcome to JForum');
/*!40000 ALTER TABLE `jforum_posts_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs`
--

DROP TABLE IF EXISTS `jforum_privmsgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_privmsgs` (
  `privmsgs_id` int(11) NOT NULL AUTO_INCREMENT,
  `privmsgs_type` tinyint(4) NOT NULL DEFAULT '0',
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '',
  `privmsgs_from_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_to_userid` int(11) NOT NULL DEFAULT '0',
  `privmsgs_date` datetime DEFAULT NULL,
  `privmsgs_ip` varchar(15) NOT NULL DEFAULT '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL DEFAULT '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_privmsgs`
--

LOCK TABLES `jforum_privmsgs` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_privmsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_privmsgs_text`
--

DROP TABLE IF EXISTS `jforum_privmsgs_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_privmsgs_text` (
  `privmsgs_id` int(11) NOT NULL,
  `privmsgs_text` text,
  PRIMARY KEY (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_privmsgs_text`
--

LOCK TABLES `jforum_privmsgs_text` WRITE;
/*!40000 ALTER TABLE `jforum_privmsgs_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_privmsgs_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_quota_limit`
--

DROP TABLE IF EXISTS `jforum_quota_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_quota_limit` (
  `quota_limit_id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_desc` varchar(50) NOT NULL,
  `quota_limit` int(11) NOT NULL,
  `quota_type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`quota_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_quota_limit`
--

LOCK TABLES `jforum_quota_limit` WRITE;
/*!40000 ALTER TABLE `jforum_quota_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_quota_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_ranks`
--

DROP TABLE IF EXISTS `jforum_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_ranks` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(50) NOT NULL DEFAULT '',
  `rank_min` int(11) NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) DEFAULT NULL,
  `rank_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_ranks`
--

LOCK TABLES `jforum_ranks` WRITE;
/*!40000 ALTER TABLE `jforum_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_role_values`
--

DROP TABLE IF EXISTS `jforum_role_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_role_values` (
  `role_id` int(11) NOT NULL,
  `role_value` varchar(255) DEFAULT NULL,
  KEY `idx_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_role_values`
--

LOCK TABLES `jforum_role_values` WRITE;
/*!40000 ALTER TABLE `jforum_role_values` DISABLE KEYS */;
INSERT INTO `jforum_role_values` VALUES (24,'1'),(25,'1'),(26,'1'),(27,'1'),(28,'1'),(29,'1'),(30,'1'),(31,'1'),(32,'1'),(33,'1'),(34,'1'),(35,'1'),(36,'1'),(37,'1'),(38,'1'),(39,'1'),(40,'1');
/*!40000 ALTER TABLE `jforum_role_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_roles`
--

DROP TABLE IF EXISTS `jforum_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `idx_group` (`group_id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_roles`
--

LOCK TABLES `jforum_roles` WRITE;
/*!40000 ALTER TABLE `jforum_roles` DISABLE KEYS */;
INSERT INTO `jforum_roles` VALUES (1,1,'perm_vote'),(2,1,'perm_karma_enabled'),(3,1,'perm_anonymous_post'),(4,1,'perm_create_poll'),(5,1,'perm_bookmarks_enabled'),(6,1,'perm_attachments_download'),(7,1,'perm_create_sticky_announcement_topics'),(8,1,'perm_moderation_log'),(9,2,'perm_administration'),(10,2,'perm_moderation'),(11,2,'perm_moderation_post_remove'),(12,2,'perm_moderation_post_edit'),(13,2,'perm_moderation_topic_move'),(14,2,'perm_moderation_topic_lockUnlock'),(15,2,'perm_moderation_approve_messages'),(16,2,'perm_create_sticky_announcement_topics'),(17,2,'perm_vote'),(18,2,'perm_create_poll'),(19,2,'perm_karma_enabled'),(20,2,'perm_bookmarks_enabled'),(21,2,'perm_attachments_download'),(22,2,'perm_moderation_log'),(23,2,'perm_full_moderation_log'),(24,1,'perm_forum'),(25,2,'perm_forum'),(26,1,'perm_anonymous_post'),(27,2,'perm_anonymous_post'),(28,1,'perm_category'),(29,2,'perm_category'),(30,1,'perm_read_only_forums'),(31,2,'perm_read_only_forums'),(32,1,'perm_html_disabled'),(33,2,'perm_html_disabled'),(34,1,'perm_attachments_enabled'),(35,2,'perm_attachments_enabled'),(36,1,'perm_reply_only'),(37,2,'perm_reply_only'),(38,1,'perm_reply_without_moderation'),(39,2,'perm_reply_without_moderation'),(40,2,'perm_moderation_forums');
/*!40000 ALTER TABLE `jforum_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_sessions`
--

DROP TABLE IF EXISTS `jforum_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_sessions` (
  `session_id` varchar(150) NOT NULL DEFAULT '',
  `session_user_id` int(11) NOT NULL DEFAULT '0',
  `session_start` datetime DEFAULT NULL,
  `session_time` bigint(20) DEFAULT '0',
  `session_ip` varchar(15) NOT NULL DEFAULT '',
  `session_page` int(11) NOT NULL DEFAULT '0',
  `session_logged_int` tinyint(1) DEFAULT NULL,
  KEY `idx_sessions_users` (`session_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_sessions`
--

LOCK TABLES `jforum_sessions` WRITE;
/*!40000 ALTER TABLE `jforum_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_smilies`
--

DROP TABLE IF EXISTS `jforum_smilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_smilies` (
  `smilie_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL,
  `disk_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`smilie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_smilies`
--

LOCK TABLES `jforum_smilies` WRITE;
/*!40000 ALTER TABLE `jforum_smilies` DISABLE KEYS */;
INSERT INTO `jforum_smilies` VALUES (1,':)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" alt=\"smilie\" />','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(2,':-)','<img src=\"#CONTEXT#/images/smilies/3b63d1616c5dfcf29f8a7a031aaa7cad.gif\" alt=\"smilie\" />','3b63d1616c5dfcf29f8a7a031aaa7cad.gif'),(3,':D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" alt=\"smilie\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(4,':-D','<img src=\"#CONTEXT#/images/smilies/283a16da79f3aa23fe1025c96295f04f.gif\" alt=\"smilie\" />','283a16da79f3aa23fe1025c96295f04f.gif'),(5,':(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" alt=\"smilie\" />','9d71f0541cff0a302a0309c5079e8dee.gif'),(6,':mrgreen:','<img src=\"#CONTEXT#/images/smilies/ed515dbff23a0ee3241dcc0a601c9ed6.gif\" alt=\"smilie\" />','ed515dbff23a0ee3241dcc0a601c9ed6.gif'),(7,':-o','<img src=\"#CONTEXT#/images/smilies/47941865eb7bbc2a777305b46cc059a2.gif\" alt=\"smilie\" />','47941865eb7bbc2a777305b46cc059a2.gif'),(8,':shock:','<img src=\"#CONTEXT#/images/smilies/385970365b8ed7503b4294502a458efa.gif\" alt=\"smilie\" />','385970365b8ed7503b4294502a458efa.gif'),(9,':?:','<img src=\"#CONTEXT#/images/smilies/0a4d7238daa496a758252d0a2b1a1384.gif\" alt=\"smilie\" />','0a4d7238daa496a758252d0a2b1a1384.gif'),(10,'8)','<img src=\"#CONTEXT#/images/smilies/b2eb59423fbf5fa39342041237025880.gif\" alt=\"smilie\" />','b2eb59423fbf5fa39342041237025880.gif'),(11,':lol:','<img src=\"#CONTEXT#/images/smilies/97ada74b88049a6d50a6ed40898a03d7.gif\" alt=\"smilie\" />','97ada74b88049a6d50a6ed40898a03d7.gif'),(12,':x','<img src=\"#CONTEXT#/images/smilies/1069449046bcd664c21db15b1dfedaee.gif\" alt=\"smilie\" />','1069449046bcd664c21db15b1dfedaee.gif'),(13,':P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" alt=\"smilie\" />','69934afc394145350659cd7add244ca9.gif'),(14,':-P','<img src=\"#CONTEXT#/images/smilies/69934afc394145350659cd7add244ca9.gif\" alt=\"smilie\" />','69934afc394145350659cd7add244ca9.gif'),(15,':oops:','<img src=\"#CONTEXT#/images/smilies/499fd50bc713bfcdf2ab5a23c00c2d62.gif\" alt=\"smilie\" />','499fd50bc713bfcdf2ab5a23c00c2d62.gif'),(16,':cry:','<img src=\"#CONTEXT#/images/smilies/c30b4198e0907b23b8246bdd52aa1c3c.gif\" alt=\"smilie\" />','c30b4198e0907b23b8246bdd52aa1c3c.gif'),(17,':evil:','<img src=\"#CONTEXT#/images/smilies/2e207fad049d4d292f60607f80f05768.gif\" alt=\"smilie\" />','2e207fad049d4d292f60607f80f05768.gif'),(18,':twisted:','<img src=\"#CONTEXT#/images/smilies/908627bbe5e9f6a080977db8c365caff.gif\" alt=\"smilie\" />','908627bbe5e9f6a080977db8c365caff.gif'),(19,':roll:','<img src=\"#CONTEXT#/images/smilies/2786c5c8e1a8be796fb2f726cca5a0fe.gif\" alt=\"smilie\" />','2786c5c8e1a8be796fb2f726cca5a0fe.gif'),(20,':wink:','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" alt=\"smilie\" />','8a80c6485cd926be453217d59a84a888.gif'),(21,';)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" alt=\"smilie\" />','8a80c6485cd926be453217d59a84a888.gif'),(22,';-)','<img src=\"#CONTEXT#/images/smilies/8a80c6485cd926be453217d59a84a888.gif\" alt=\"smilie\" />','8a80c6485cd926be453217d59a84a888.gif'),(23,':!:','<img src=\"#CONTEXT#/images/smilies/9293feeb0183c67ea1ea8c52f0dbaf8c.gif\" alt=\"smilie\" />','9293feeb0183c67ea1ea8c52f0dbaf8c.gif'),(24,':?','<img src=\"#CONTEXT#/images/smilies/136dd33cba83140c7ce38db096d05aed.gif\" alt=\"smilie\" />','136dd33cba83140c7ce38db096d05aed.gif'),(25,':idea:','<img src=\"#CONTEXT#/images/smilies/8f7fb9dd46fb8ef86f81154a4feaada9.gif\" alt=\"smilie\" />','8f7fb9dd46fb8ef86f81154a4feaada9.gif'),(26,':arrow:','<img src=\"#CONTEXT#/images/smilies/d6741711aa045b812616853b5507fd2a.gif\" alt=\"smilie\" />','d6741711aa045b812616853b5507fd2a.gif'),(27,':hunf:','<img src=\"#CONTEXT#/images/smilies/0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif\" alt=\"smilie\" />','0320a00cb4bb5629ab9fc2bc1fcc4e9e.gif'),(28,':-(','<img src=\"#CONTEXT#/images/smilies/9d71f0541cff0a302a0309c5079e8dee.gif\" alt=\"smilie\" />','9d71f0541cff0a302a0309c5079e8dee.gif'),(29,':XD:','<img src=\"#CONTEXT#/images/smilies/49869fe8223507d7223db3451e5321aa.gif\" alt=\"smilie\" />','49869fe8223507d7223db3451e5321aa.gif'),(30,':thumbup:','<img src=\"#CONTEXT#/images/smilies/e8a506dc4ad763aca51bec4ca7dc8560.gif\" alt=\"smilie\" />','e8a506dc4ad763aca51bec4ca7dc8560.gif'),(31,':thumbdown:','<img src=\"#CONTEXT#/images/smilies/e78feac27fa924c4d0ad6cf5819f3554.gif\" alt=\"smilie\" />','e78feac27fa924c4d0ad6cf5819f3554.gif'),(32,':|','<img src=\"#CONTEXT#/images/smilies/1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif\" alt=\"smilie\" />','1cfd6e2a9a2c0cf8e74b49b35e2e46c7.gif');
/*!40000 ALTER TABLE `jforum_smilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_spam`
--

DROP TABLE IF EXISTS `jforum_spam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_spam` (
  `pattern` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_spam`
--

LOCK TABLES `jforum_spam` WRITE;
/*!40000 ALTER TABLE `jforum_spam` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_spam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics`
--

DROP TABLE IF EXISTS `jforum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_topics` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL DEFAULT '0',
  `topic_title` varchar(120) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_time` datetime DEFAULT NULL,
  `topic_views` int(11) DEFAULT '0',
  `topic_replies` int(11) DEFAULT '0',
  `topic_status` tinyint(3) DEFAULT '0',
  `topic_vote_id` int(11) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) DEFAULT '0',
  `topic_first_post_id` int(11) DEFAULT '0',
  `topic_last_post_id` int(11) NOT NULL DEFAULT '0',
  `topic_moved_id` int(11) DEFAULT '0',
  `moderated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_first_post_id` (`topic_first_post_id`),
  KEY `topic_last_post_id` (`topic_last_post_id`),
  KEY `topic_moved_id` (`topic_moved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_topics`
--

LOCK TABLES `jforum_topics` WRITE;
/*!40000 ALTER TABLE `jforum_topics` DISABLE KEYS */;
INSERT INTO `jforum_topics` VALUES (1,1,'Welcome to JForum',2,'2016-10-23 22:35:08',0,0,0,0,0,1,1,0,0);
/*!40000 ALTER TABLE `jforum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_topics_watch`
--

DROP TABLE IF EXISTS `jforum_topics_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_topics_watch` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '1',
  KEY `idx_topic` (`topic_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_topics_watch`
--

LOCK TABLES `jforum_topics_watch` WRITE;
/*!40000 ALTER TABLE `jforum_topics_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_topics_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_user_groups`
--

DROP TABLE IF EXISTS `jforum_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_user_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `idx_group` (`group_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_user_groups`
--

LOCK TABLES `jforum_user_groups` WRITE;
/*!40000 ALTER TABLE `jforum_user_groups` DISABLE KEYS */;
INSERT INTO `jforum_user_groups` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `jforum_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_users`
--

DROP TABLE IF EXISTS `jforum_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `user_password` varchar(128) NOT NULL DEFAULT '',
  `user_session_time` bigint(20) DEFAULT '0',
  `user_session_page` int(11) NOT NULL DEFAULT '0',
  `user_lastvisit` datetime DEFAULT NULL,
  `user_regdate` datetime DEFAULT NULL,
  `user_level` tinyint(4) DEFAULT NULL,
  `user_posts` int(11) NOT NULL DEFAULT '0',
  `user_timezone` varchar(5) NOT NULL DEFAULT '',
  `user_style` tinyint(4) DEFAULT NULL,
  `user_lang` varchar(255) NOT NULL DEFAULT '',
  `user_dateformat` varchar(20) NOT NULL DEFAULT '%d/%M/%Y %H:%i',
  `user_new_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(11) NOT NULL DEFAULT '0',
  `user_last_privmsg` datetime DEFAULT NULL,
  `user_emailtime` datetime DEFAULT NULL,
  `user_viewemail` tinyint(1) DEFAULT '0',
  `user_attachsig` tinyint(1) DEFAULT '1',
  `user_allowhtml` tinyint(1) DEFAULT '0',
  `user_allowbbcode` tinyint(1) DEFAULT '1',
  `user_allowsmilies` tinyint(1) DEFAULT '1',
  `user_allowavatar` tinyint(1) DEFAULT '1',
  `user_allow_pm` tinyint(1) DEFAULT '1',
  `user_allow_viewonline` tinyint(1) DEFAULT '1',
  `user_notify` tinyint(1) DEFAULT '1',
  `user_notify_always` tinyint(1) DEFAULT '0',
  `user_notify_text` tinyint(1) DEFAULT '0',
  `user_notify_pm` tinyint(1) DEFAULT '1',
  `user_popup_pm` tinyint(1) DEFAULT '1',
  `rank_id` int(11) DEFAULT '0',
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_avatar_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_icq` varchar(15) DEFAULT NULL,
  `user_website` varchar(255) DEFAULT NULL,
  `user_from` varchar(100) DEFAULT NULL,
  `user_sig` text,
  `user_sig_bbcode_uid` varchar(10) DEFAULT NULL,
  `user_aim` varchar(255) DEFAULT NULL,
  `user_yim` varchar(255) DEFAULT NULL,
  `user_msnm` varchar(255) DEFAULT NULL,
  `user_occ` varchar(100) DEFAULT NULL,
  `user_interests` varchar(255) DEFAULT NULL,
  `user_biography` text,
  `user_actkey` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_viewonline` tinyint(1) DEFAULT '1',
  `security_hash` varchar(32) DEFAULT NULL,
  `user_karma` double DEFAULT NULL,
  `user_authhash` varchar(32) DEFAULT NULL,
  `user_twitter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_users`
--

LOCK TABLES `jforum_users` WRITE;
/*!40000 ALTER TABLE `jforum_users` DISABLE KEYS */;
INSERT INTO `jforum_users` VALUES (1,NULL,'Anonymous','nopass',0,0,NULL,'2016-10-23 22:35:07',NULL,0,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,NULL,'Admin','25136849c90a3f9615088f360a189c3c441826652ea6ecfe4c20f0e09baa5a417f0ae5804e4f6809901fc539843e29ff704fb9c0f994424cc6e6d90b6b62604b',0,0,NULL,'2016-10-23 22:35:07',NULL,1,'',NULL,'','%d/%M/%Y %H:%i',0,0,NULL,NULL,0,1,0,1,1,1,1,1,1,0,0,1,1,0,NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jforum_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_desc`
--

DROP TABLE IF EXISTS `jforum_vote_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_desc` (
  `vote_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `vote_text` varchar(255) NOT NULL DEFAULT '',
  `vote_start` datetime NOT NULL,
  `vote_length` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_desc`
--

LOCK TABLES `jforum_vote_desc` WRITE;
/*!40000 ALTER TABLE `jforum_vote_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_results`
--

DROP TABLE IF EXISTS `jforum_vote_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_results` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_option_text` varchar(255) NOT NULL DEFAULT '',
  `vote_result` int(11) NOT NULL DEFAULT '0',
  KEY `vote_id` (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_results`
--

LOCK TABLES `jforum_vote_results` WRITE;
/*!40000 ALTER TABLE `jforum_vote_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_vote_voters`
--

DROP TABLE IF EXISTS `jforum_vote_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_vote_voters` (
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_id` int(11) NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(15) NOT NULL DEFAULT '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_vote_voters`
--

LOCK TABLES `jforum_vote_voters` WRITE;
/*!40000 ALTER TABLE `jforum_vote_voters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_vote_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jforum_words`
--

DROP TABLE IF EXISTS `jforum_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jforum_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(100) NOT NULL DEFAULT '',
  `replacement` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jforum_words`
--

LOCK TABLES `jforum_words` WRITE;
/*!40000 ALTER TABLE `jforum_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `jforum_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `barcode`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `barcode` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `barcode`;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `COD_CLI` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_CLI` varchar(50) NOT NULL DEFAULT '',
  `ADDR_CLI` varchar(50) DEFAULT NULL,
  `FONE_CLI` varchar(20) DEFAULT NULL,
  `COD_STATUS_CLI` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`COD_CLI`),
  UNIQUE KEY `IDX_CLI` (`COD_CLI`),
  KEY `XIF1cliente` (`COD_STATUS_CLI`),
  CONSTRAINT `R_3` FOREIGN KEY (`COD_STATUS_CLI`) REFERENCES `status_cliente` (`COD_STATUS_CLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_perfil`
--

DROP TABLE IF EXISTS `cliente_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_perfil` (
  `COD_CLI` int(11) NOT NULL,
  `COD_FUNC` int(11) NOT NULL,
  `COD_PERFIL` int(11) NOT NULL,
  PRIMARY KEY (`COD_CLI`,`COD_FUNC`,`COD_PERFIL`),
  UNIQUE KEY `IDX_CLIENTE_PERFIL` (`COD_CLI`,`COD_FUNC`,`COD_PERFIL`),
  KEY `XIF1cliente_perfil` (`COD_CLI`),
  KEY `XIF2cliente_perfil` (`COD_FUNC`),
  KEY `XIF3cliente_perfil` (`COD_PERFIL`),
  CONSTRAINT `R_10` FOREIGN KEY (`COD_PERFIL`) REFERENCES `perfil` (`COD_PERFIL`),
  CONSTRAINT `R_7` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`),
  CONSTRAINT `R_9` FOREIGN KEY (`COD_FUNC`) REFERENCES `func` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_perfil`
--

LOCK TABLES `cliente_perfil` WRITE;
/*!40000 ALTER TABLE `cliente_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concurso`
--

DROP TABLE IF EXISTS `concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concurso` (
  `COD_CONC` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCR_PREMIO` varchar(50) DEFAULT NULL,
  `DAT_CONC` date DEFAULT NULL,
  `NUM_SORT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COD_CONC`),
  UNIQUE KEY `IDX_CONCURSO` (`COD_CONC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concurso`
--

LOCK TABLES `concurso` WRITE;
/*!40000 ALTER TABLE `concurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `concurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_fabr`
--

DROP TABLE IF EXISTS `cust_fabr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_fabr` (
  `HORA_HOMEM` smallint(6) NOT NULL DEFAULT '0',
  `HORA_USO` smallint(6) NOT NULL DEFAULT '0',
  `COD_PREP_RCTA` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  `COD_UNID_MED` int(11) NOT NULL,
  `COD_INGR` int(11) NOT NULL,
  PRIMARY KEY (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`,`COD_UNID_MED`,`COD_INGR`),
  UNIQUE KEY `IDX_CUST_FABR` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`,`COD_UNID_MED`,`COD_INGR`),
  KEY `XIF1cust_fabr` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF2cust_fabr` (`COD_UNID_MED`),
  KEY `XIF3cust_fabr` (`COD_INGR`),
  CONSTRAINT `R_21` FOREIGN KEY (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`) REFERENCES `rcta_padr` (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`),
  CONSTRAINT `R_22` FOREIGN KEY (`COD_UNID_MED`) REFERENCES `unid_med` (`COD_UNID_MED`),
  CONSTRAINT `R_23` FOREIGN KEY (`COD_INGR`) REFERENCES `ingr_rcta` (`COD_INGR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_fabr`
--

LOCK TABLES `cust_fabr` WRITE;
/*!40000 ALTER TABLE `cust_fabr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_fabr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelidade`
--

DROP TABLE IF EXISTS `fidelidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fidelidade` (
  `DAT_ENTR` date DEFAULT NULL,
  `VAL_CONS` decimal(7,2) DEFAULT NULL,
  `NUM_PARTIC` int(11) DEFAULT NULL,
  `NUM_UTIL` smallint(6) DEFAULT NULL,
  `COD_CLI` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_FIDELID` (`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1fidelidade` (`COD_CLI`),
  KEY `XIF2fidelidade` (`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_11` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`),
  CONSTRAINT `R_12` FOREIGN KEY (`COD_UNID`, `COD_PAIS`) REFERENCES `unid_operac` (`COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelidade`
--

LOCK TABLES `fidelidade` WRITE;
/*!40000 ALTER TABLE `fidelidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `COD_FUNC` int(11) NOT NULL AUTO_INCREMENT,
  `DESCR_FUNC` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`COD_FUNC`),
  UNIQUE KEY `IDX_FUNC` (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingr_rcta`
--

DROP TABLE IF EXISTS `ingr_rcta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingr_rcta` (
  `COD_INGR` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_INGR` varchar(50) NOT NULL DEFAULT '',
  `PRECO_INGR` decimal(7,2) NOT NULL DEFAULT '0.00',
  `NOM_INGR_USA` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`COD_INGR`),
  UNIQUE KEY `IDX_COD_INGRED` (`COD_INGR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingr_rcta`
--

LOCK TABLES `ingr_rcta` WRITE;
/*!40000 ALTER TABLE `ingr_rcta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingr_rcta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingr_unid_rcta`
--

DROP TABLE IF EXISTS `ingr_unid_rcta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingr_unid_rcta` (
  `QTD_INGR` int(11) NOT NULL DEFAULT '0',
  `COD_PREP_RCTA` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  `COD_UNID_MED` int(11) NOT NULL,
  `COD_INGR` int(11) NOT NULL,
  PRIMARY KEY (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`,`COD_UNID_MED`,`COD_INGR`),
  UNIQUE KEY `IDX_PREP_RCTA` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`,`COD_UNID_MED`,`COD_INGR`),
  KEY `XIF1ingr_unid_rcta` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF2ingr_unid_rcta` (`COD_UNID_MED`),
  KEY `XIF3ingr_unid_rcta` (`COD_INGR`),
  CONSTRAINT `R_24` FOREIGN KEY (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`) REFERENCES `rcta_padr` (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`),
  CONSTRAINT `R_25` FOREIGN KEY (`COD_UNID_MED`) REFERENCES `unid_med` (`COD_UNID_MED`),
  CONSTRAINT `R_26` FOREIGN KEY (`COD_INGR`) REFERENCES `ingr_rcta` (`COD_INGR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingr_unid_rcta`
--

LOCK TABLES `ingr_unid_rcta` WRITE;
/*!40000 ALTER TABLE `ingr_unid_rcta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingr_unid_rcta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar_mesa`
--

DROP TABLE IF EXISTS `lugar_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugar_mesa` (
  `ALFA_LUGAR` varchar(1) NOT NULL DEFAULT '',
  `LUGAR_OCUP` smallint(6) DEFAULT NULL,
  `VAL_RESERVA` int(11) DEFAULT NULL,
  `PCT_DESC_CONS` int(11) DEFAULT NULL,
  `NUM_MESA` int(11) NOT NULL,
  `COD_CLI` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`ALFA_LUGAR`,`NUM_MESA`,`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_ALFA_LUGAR` (`ALFA_LUGAR`,`NUM_MESA`,`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1lugar_mesa` (`NUM_MESA`,`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_19` FOREIGN KEY (`NUM_MESA`, `COD_CLI`, `COD_UNID`, `COD_PAIS`) REFERENCES `mesa` (`NUM_MESA`, `COD_CLI`, `COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar_mesa`
--

LOCK TABLES `lugar_mesa` WRITE;
/*!40000 ALTER TABLE `lugar_mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `lugar_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
  `NUM_MESA` int(11) NOT NULL AUTO_INCREMENT,
  `MESA_OCUP` smallint(6) DEFAULT NULL,
  `PCT_MESA` tinyint(4) DEFAULT NULL,
  `PCT_ACEITE` int(11) DEFAULT NULL,
  `PCT_GRUPO` int(11) DEFAULT NULL,
  `CLI_RESP` bigint(20) DEFAULT NULL,
  `COD_CLI` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`NUM_MESA`,`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_NUM_MESA` (`NUM_MESA`,`COD_CLI`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1mesa` (`COD_CLI`),
  KEY `XIF2mesa` (`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_14` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`),
  CONSTRAINT `R_15` FOREIGN KEY (`COD_UNID`, `COD_PAIS`) REFERENCES `unid_operac` (`COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `COD_PAIS` int(11) NOT NULL,
  `NOM_PAIS` varchar(50) DEFAULT NULL,
  `NAM_PAIS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_PAIS`),
  UNIQUE KEY `XPKpais` (`COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ped_prod`
--

DROP TABLE IF EXISTS `ped_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ped_prod` (
  `COD_PED_PROD` int(11) NOT NULL AUTO_INCREMENT,
  `PED_ATEND_PROD` bit(1) NOT NULL,
  `DAT_PED_PROD` date NOT NULL DEFAULT '0000-00-00',
  `COD_CLI` int(11) NOT NULL,
  `COD_PROD` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_PED_PROD`,`COD_CLI`,`COD_PROD`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_PED_PROD` (`COD_PED_PROD`,`COD_CLI`,`COD_PROD`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1ped_prod` (`COD_CLI`),
  KEY `XIF2ped_prod` (`COD_PROD`,`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_29` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`),
  CONSTRAINT `R_32` FOREIGN KEY (`COD_PROD`, `COD_UNID`, `COD_PAIS`) REFERENCES `prod_padr` (`COD_PROD`, `COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ped_prod`
--

LOCK TABLES `ped_prod` WRITE;
/*!40000 ALTER TABLE `ped_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `ped_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ped_rcta`
--

DROP TABLE IF EXISTS `ped_rcta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ped_rcta` (
  `COD_PED_RCTA` int(11) NOT NULL AUTO_INCREMENT,
  `PRECO_ATU` decimal(7,2) NOT NULL DEFAULT '0.00',
  `DATE_PREV_PEDIDO` date NOT NULL DEFAULT '0000-00-00',
  `DAT_PED` date NOT NULL DEFAULT '0000-00-00',
  `DAT_PRIM_PED` date NOT NULL DEFAULT '0000-00-00',
  `QTD_ATUAL_PED` smallint(6) NOT NULL DEFAULT '0',
  `PED_ATEND` bit(1) NOT NULL,
  `COD_CLI` int(11) NOT NULL,
  `COD_PREP_RCTA` int(11) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_PED_RCTA`,`COD_CLI`,`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_PED_RCTA` (`COD_PED_RCTA`,`COD_CLI`,`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1ped_rcta` (`COD_CLI`),
  KEY `XIF2ped_rcta` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_20` FOREIGN KEY (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`) REFERENCES `rcta_padr` (`COD_PREP_RCTA`, `COD_UNID`, `COD_PAIS`),
  CONSTRAINT `R_6` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ped_rcta`
--

LOCK TABLES `ped_rcta` WRITE;
/*!40000 ALTER TABLE `ped_rcta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ped_rcta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `COD_PERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCR_PERFIL` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`COD_PERFIL`),
  UNIQUE KEY `IDX_PERFIL` (`COD_PERFIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_padr`
--

DROP TABLE IF EXISTS `prod_padr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_padr` (
  `COD_PROD` int(11) NOT NULL AUTO_INCREMENT,
  `DESCR_PROD` varchar(50) NOT NULL DEFAULT '',
  `PRECO_PROD` decimal(7,2) NOT NULL DEFAULT '0.00',
  `DISP_PROD` bit(1) NOT NULL,
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_PROD`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_COD_PROD` (`COD_PROD`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1prod_padr` (`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_31` FOREIGN KEY (`COD_UNID`, `COD_PAIS`) REFERENCES `unid_operac` (`COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_padr`
--

LOCK TABLES `prod_padr` WRITE;
/*!40000 ALTER TABLE `prod_padr` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_padr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rcta_padr`
--

DROP TABLE IF EXISTS `rcta_padr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rcta_padr` (
  `COD_PREP_RCTA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_RCTA` varchar(45) NOT NULL DEFAULT '',
  `DESCR_MODO_PREP` longtext NOT NULL,
  `PRECO_MAX` decimal(7,2) NOT NULL DEFAULT '0.00',
  `PRECO_MIN` decimal(7,2) NOT NULL DEFAULT '0.00',
  `TEMPO_PREP` smallint(6) NOT NULL DEFAULT '0',
  `QTD_MIN_PED` smallint(6) NOT NULL DEFAULT '0',
  `DIAS_ANTEC_PED` smallint(6) NOT NULL DEFAULT '0',
  `PCT_DESC_QTD` smallint(6) NOT NULL DEFAULT '0',
  `RECEITA_DISPONIVEL` tinyint(4) NOT NULL DEFAULT '0',
  `NOTA_RCTA` smallint(6) NOT NULL DEFAULT '0',
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_PREP_RCTA` (`COD_PREP_RCTA`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1rcta_padr` (`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_18` FOREIGN KEY (`COD_UNID`, `COD_PAIS`) REFERENCES `unid_operac` (`COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rcta_padr`
--

LOCK TABLES `rcta_padr` WRITE;
/*!40000 ALTER TABLE `rcta_padr` DISABLE KEYS */;
/*!40000 ALTER TABLE `rcta_padr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_cliente`
--

DROP TABLE IF EXISTS `status_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_cliente` (
  `COD_STATUS_CLI` smallint(6) NOT NULL AUTO_INCREMENT,
  `DESCR_STATUS_CLI` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`COD_STATUS_CLI`),
  UNIQUE KEY `IDX_STATUS` (`COD_STATUS_CLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_cliente`
--

LOCK TABLES `status_cliente` WRITE;
/*!40000 ALTER TABLE `status_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unid_med`
--

DROP TABLE IF EXISTS `unid_med`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unid_med` (
  `COD_UNID_MED` int(11) NOT NULL AUTO_INCREMENT,
  `ABRV_UNID` varchar(10) NOT NULL DEFAULT '',
  `NOM_UNID` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`COD_UNID_MED`),
  UNIQUE KEY `IDX_UNID_MED` (`COD_UNID_MED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unid_med`
--

LOCK TABLES `unid_med` WRITE;
/*!40000 ALTER TABLE `unid_med` DISABLE KEYS */;
/*!40000 ALTER TABLE `unid_med` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unid_operac`
--

DROP TABLE IF EXISTS `unid_operac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unid_operac` (
  `COD_UNID` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_UNID` varchar(50) NOT NULL DEFAULT '',
  `ADDR_UNID` varchar(50) NOT NULL DEFAULT '',
  `FONE_UNID` varchar(20) NOT NULL DEFAULT '',
  `DATE_UNID` date NOT NULL DEFAULT '0000-00-00',
  `LOGO_UNID` blob,
  `RESP_UNID` varchar(50) NOT NULL DEFAULT '',
  `FONE_RESP_UNID` varchar(20) NOT NULL DEFAULT '',
  `STAT_UNID` smallint(6) NOT NULL DEFAULT '0',
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `_IDX_UNID_PAIS` (`COD_UNID`,`COD_PAIS`),
  KEY `XIF1unid_operac` (`COD_PAIS`),
  CONSTRAINT `R_16` FOREIGN KEY (`COD_PAIS`) REFERENCES `pais` (`COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unid_operac`
--

LOCK TABLES `unid_operac` WRITE;
/*!40000 ALTER TABLE `unid_operac` DISABLE KEYS */;
/*!40000 ALTER TABLE `unid_operac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unid_pag`
--

DROP TABLE IF EXISTS `unid_pag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unid_pag` (
  `DATE_VENC` date NOT NULL DEFAULT '0000-00-00',
  `VAL_PAGTO` decimal(6,2) NOT NULL DEFAULT '0.00',
  `DATE_PAGTO` date DEFAULT NULL,
  `PAGO` tinyint(4) NOT NULL DEFAULT '0',
  `COD_UNID` int(11) NOT NULL,
  `COD_PAIS` int(11) NOT NULL,
  PRIMARY KEY (`DATE_VENC`,`COD_UNID`,`COD_PAIS`),
  UNIQUE KEY `IDX_VENC_UNID` (`DATE_VENC`,`COD_UNID`,`COD_PAIS`),
  KEY `XIF1unid_pag` (`COD_UNID`,`COD_PAIS`),
  CONSTRAINT `R_28` FOREIGN KEY (`COD_UNID`, `COD_PAIS`) REFERENCES `unid_operac` (`COD_UNID`, `COD_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unid_pag`
--

LOCK TABLES `unid_pag` WRITE;
/*!40000 ALTER TABLE `unid_pag` DISABLE KEYS */;
/*!40000 ALTER TABLE `unid_pag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 20:07:53
