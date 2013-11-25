-- MySQL dump 10.11
--
-- Host: localhost    Database: pmsafinal
-- ------------------------------------------------------
-- Server version	5.0.95

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
-- Table structure for table `PROJ_HEALTH`
--

DROP TABLE IF EXISTS `PROJ_HEALTH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJ_HEALTH` (
  `projectid` varchar(50) NOT NULL,
  `base` varchar(10) default NULL,
  `ontime` int(4) default '20',
  `slightly` int(4) default '50',
  `gravely` int(4) default '50',
  KEY `health_fk1` (`projectid`),
  CONSTRAINT `health_fk1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJ_HEALTH`
--

LOCK TABLES `PROJ_HEALTH` WRITE;
/*!40000 ALTER TABLE `PROJ_HEALTH` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROJ_HEALTH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actionlog`
--

DROP TABLE IF EXISTS `actionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actionlog` (
  `logid` int(11) NOT NULL auto_increment,
  `actionid` int(11) default NULL,
  `actionby` varchar(50) default NULL,
  `actionon` varchar(50) default NULL,
  `projectid` varchar(50) default NULL,
  `companyid` varchar(50) default NULL,
  `timestamp` datetime default NULL,
  `params` varchar(100) default '',
  `ipaddress` varchar(100) default '',
  `mode` int(1) default '0',
  PRIMARY KEY  (`logid`),
  KEY `actionid` (`actionid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actionlog`
--

LOCK TABLES `actionlog` WRITE;
/*!40000 ALTER TABLE `actionlog` DISABLE KEYS */;
INSERT INTO `actionlog` VALUES (1,11,'8e94f4d8-e2d0-11e1-a6f4-001e58a79890','','','8e94f514-e2d0-11e1-a6f4-001e58a79890','2012-08-14 17:19:35','admin project (admin)','',0),(2,12,'8e94f4d8-e2d0-11e1-a6f4-001e58a79890','','','8e94f514-e2d0-11e1-a6f4-001e58a79890','2012-08-14 17:21:42','admin project (admin), ','127.0.0.1',0),(3,11,'8e94f4d8-e2d0-11e1-a6f4-001e58a79890','','','8e94f514-e2d0-11e1-a6f4-001e58a79890','2012-08-14 17:23:30','admin project (admin)','',0);
/*!40000 ALTER TABLE `actionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` int(11) NOT NULL,
  `actionname` varchar(1024) NOT NULL,
  `actiontext` varchar(1024) NOT NULL,
  `textkey` varchar(256) default NULL,
  PRIMARY KEY  (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (11,'User logged in','%s logged-in','User.logged.in'),(12,'User logged out','%s logged-out','User.logged.out'),(111,'New task created','%s created new task - %s - in project %s','New.task.created'),(112,'Task updated','%s updated task - %s - in project %s','Task.updated'),(113,'Task deleted','%s deleted task - %s - in project %s','Task.deleted'),(114,'Template created','%s created new template - %s - in project %s','Template.created'),(115,'Template inserted','%s inserted template - %s - in project %s','Template.inserted'),(116,'Baseline created','%s created new project baseline - %s - of project %s','Baseline.created'),(117,'Baseline deleted','%s delete project baseline - %s - of project %s','Baseline.deleted'),(118,'Project plan imported','%s imported project plan in format - %s in project %s','Project.plan.imported'),(119,'Project plan exported','%s exported project plan in format - %s in project %s','Project.plan.exported'),(121,'Event created','%s created new event - %s - in calendar - %s - from project %s','Event.created'),(122,'Event updated','%s updated event - %s - from calendar - %s - from project %s','Event.updated'),(123,'Event deleted','%s deleted event - %s - from calendar - %s - from project %s','Event.deleted'),(124,'Calendar created','%s created new calendar - %s - in project %s','Calendar.created'),(125,'Calendar updated','%s updated calendar - %s - from project %s','Calendar.updated'),(126,'Calendar deleted','%s deleted calendar - %s - from project %s','Calendar.deleted'),(127,'Calendar imported (iCal) to new calendar','%s imported an iCalendar to a new calendar - %s - in project %s','Calendar.imported.iCal.to.new.calendar'),(128,'Calendar imported (iCal) and merged with existing calendar','%s imported an iCalendar and merged it with calendar - %s - in project %s','Calendar.imported.iCal.and.merged.with.existing.calendar'),(129,'Holiday Calendar imported','%s imported holiday calendar - %s - in project %s','Holiday.Calendar.imported'),(130,'To-do moved to project plan','%s moved to-do - %s to project plan in project - %s','Todo.moved.to.project.plan'),(131,'Add to-do','%s added new to-do - %s - in project %s','Add.todo'),(132,'Update to-do','%s updated to-do - %s - in project %s','Update.todo'),(133,'Deleted to-do','%s deleted to-do - %s - in project %s','Deleted.todo'),(134,'Add to-do group','%s added new to-do group - %s - in project %s','Add.todo.group'),(135,'Update to-do group','%s updated to-do group - %s - in project %s','Update.todo.group'),(136,'Deleted to-do group','%s delete to-do group - %s - in project %s','Deleted.todo.group'),(137,'Add to-do to a group','%s appended to-do - %s - to to-do group - %s - in project %s','Add.todo.to.a.group'),(138,'Remove to-do from a group','%s removed to-do - %s - from to-do group %s in project %s','Remove.todo.from.a.group'),(139,'Notify selected to-do','%s sent notification for to-do - %s - to %s in project %s','Notify.selected.todo'),(141,'Added new post','%s added a new post - %s - in Discussion Forum in project %s','Added.new.post'),(142,'Replied to a post','%s replied - %s - to post - %s - in Discussion Forum in project %s','Replied.to.a.post'),(143,'Deleted a post','%s deleted post - %s - in Discussion Forum in project %s','Deleted.a.post'),(150,'Resource Modified','%s modified resource - %s - in project - %s ','Resource.Modified'),(151,'New resource added','%s added new resource - %s - for project - %s','New.resource.added'),(152,'Invitation sent','%s sent an invitation to - %s - for joining project - %s','Invitation.sent'),(153,'Request accepted','%s accepted the request to join project - %s','Request.accepted'),(154,'Request rejected','%s rejected the request to join project - %s','Request.rejected'),(155,'project calendar updated','%s updated project calendar and made %s as holiday for project - %s','project.calendar.updated'),(156,'project calendar updated','%s updated project calendar and made %s as working day for project - %s','project.calendar.updated'),(157,'Plan permissions changed','%s changed plan permissions of - %s - in project %s','Plan.permissions.changed'),(158,'Project members updated','%s has left project - %s','Project.members.updated'),(159,'Project members updated','%s has been dropped from project - %s','Project.members.updated'),(200,'To-do imported','%s imported to-do in format - %s in project %s','Todo.imported'),(211,'Added a new document','%s added new document - %s','Added.a.new.document'),(212,'Activated a versioning','%s activated versioning of document - %s','Activated.a.versioning'),(213,'Document downloaded','%s downloaded document - %s','Document.downloaded'),(214,'Document permissions changed','%s changed permissions of document - %s','Document.permissions.changed'),(215,'Document deleted','%s deleted document - %s','Document.deleted'),(311,'New user created','%s created new user - %s','New.user.created'),(312,'User profile updated','%s updated profile of user - %s','User.profile.updated'),(313,'User deleted','%s deleted user - %s','User.deleted'),(314,'User permission changed','%s changed permissions of user - %s','User.permission.changed'),(315,'User password changed','%s changed password of user - %s','User.password.changed'),(316,'User/s added to project/s.','%s added user - %s - on project %s','Users.added.to.projects.'),(321,'Project created','%s created new project - %s','Project.created'),(322,'Project deleted','%s deleted project - %s','Project.deleted'),(323,'Project updated','%s updated project - %s','Project.updated'),(324,'Project members reassigned','%s reassigned project members for - %s','Project.members.reassigned'),(325,'Projects imported from basecamp','%s imported projects - %s - from Basecamp','Projects.imported.from.basecamp'),(326,'Project archived','%s archived project - %s','Project.archived'),(327,'Project activated','%s activated project - %s','Project.activated'),(331,'Company logo changed','%s changed company logo','Company.logo.changed'),(332,'Company profile updated','%s updated company profile','Company.profile.updated'),(333,'Company holidays updated','%s updated company holidays','Company.holidays.updated'),(334,'Subscribed to a module in company','%s subscribed for module - %s','Subscribed.to.a.module.in.company'),(335,'Un-subscribed to a module in company','%s un-subscribed for module - %s','Unsubscribed.to.a.module.in.company'),(336,'Shown a module in company','%s showed module - %s','Shown.a.module.in.company'),(337,'Hide a module in company','%s hide module - %s','Hide.a.module.in.company'),(341,'Project level Document added','%s uploaded a new document - %s','Project.level.Document.added'),(342,'Project level Document downloaded','%s downloaded document - %s','Project.level.Document.downloaded'),(343,'Project level document deleted','%s deleted document - %s','Project.level.document.deleted'),(344,'Project resource removed','%s removed resource - %s - from project - %s','Project.resource.removed'),(401,'New Custom Column Created','%s created a new custom column - %s','New.Custom.Column.Created'),(402,'Edited a Custom Column','%s edited custom column - %s','Edited.a.Custom.Column'),(403,'Deleted a Custom Column','%s deleted custom column - %s','Deleted.a.Custom.Column'),(406,'New custom report created','%s created new custom report - %s','New.custom.report.created'),(407,'Edited a custom report','%s edited custom report - %s','Edited.a.custom.report'),(408,'Deleted a custom report','%s deleted custom report - %s','Deleted.a.custom.report'),(410,'Notification(s) Sent','%s has sent %s mail notification(s) for - %s','Notifications.Sent'),(411,'Automated Notification(s) sent','%s automated mail(s) have been sent for - %s','Automated.Notifications.sent'),(1110,'Project plan embed','%s embeded project plan of project %s','Project.plan.embed'),(1111,'Project report exported','%s exported project report - %s - in format - %s - of project %s','Project.report.exported'),(1112,'Project plan synchronized with team calendar','%s synchronized project plan with team calendar for project - %s','Project.plan.synchronized.with.team.calendar'),(1210,'All calendars exported in ICS','%s exported all company calendars in iCal format','All.calendars.exported.in.ICS'),(1211,'Calendar exported in ICS','%s exported calendar - %s - in iCal format in project %s','Calendar.exported.in.ICS'),(1212,'Calendar RSS feed','%s accessed calendar RSS feed from project %s','Calendar.RSS.feed'),(1310,'Notify all to-dos','%s sent notification for all to-dos in project %s','Notify.all.todos'),(1311,'To-do RSS feed','%s accessed to-do RSS feed for project %s','Todo.RSS.feed'),(1510,'Resource Deleted','%s deleted resource - %s - from project - %s','Resource.Deleted'),(1550,'Moderator has been set','%s has been set as moderator for project - %s','Moderator.has.been.set'),(1551,'Moderate has been removed','Access as moderator has been disabled for - %s - for project - %s','Moderate.has.been.removed');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitieslist`
--

DROP TABLE IF EXISTS `activitieslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitieslist` (
  `activityid` int(11) NOT NULL,
  `activityname` varchar(50) character set latin1 NOT NULL,
  `featureid` int(11) NOT NULL,
  `displayactivityname` varchar(50) NOT NULL,
  `havesubactivity` bit(1) NOT NULL,
  KEY `featureid` (`featureid`),
  CONSTRAINT `activitieslist_ibfk_1` FOREIGN KEY (`featureid`) REFERENCES `featurelist` (`featureid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitieslist`
--

LOCK TABLES `activitieslist` WRITE;
/*!40000 ALTER TABLE `activitieslist` DISABLE KEYS */;
INSERT INTO `activitieslist` VALUES (1,'ManagePermission',1,'Manage Permission','\0'),(2,'AssignUserToProject',1,'Assign User To Project(s)','\0'),(1,'CreateProject',2,'Create Project','\0'),(2,'EditProject',2,'Edit Project','\0'),(3,'DeleteProject',2,'Delete Project','\0'),(4,'ArchiveActive',2,'Archive / Activate Projects','\0'),(5,'ManageMembers',2,'Manage Members',''),(1,'ManageNotifications',3,'Notifications Settings','\0'),(2,'ManageFeatures',3,'Manage Features ','\0'),(3,'ManageCustomColumn',3,'Custom Columns','\0'),(4,'ManageHoliday',3,'Company Holidays','\0'),(5,'ModuleSubscription',3,'Module Subscriptions','\0'),(1,'AccessAuditTrail',4,'Access Audit Log','\0'),(1,'CreateDeleteReports',5,'Create / Delete Custom Reports','\0'),(2,'ViewCustomReports',5,'View All Projects in Custom Reports','\0');
/*!40000 ALTER TABLE `activitieslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressbook`
--

DROP TABLE IF EXISTS `addressbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addressbook` (
  `contactid` varchar(36) NOT NULL,
  `name` varchar(50) default NULL,
  `emailid` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `userid` varchar(36) NOT NULL,
  PRIMARY KEY  (`contactid`),
  KEY `add_fk_1` (`userid`),
  CONSTRAINT `add_fk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressbook`
--

LOCK TABLES `addressbook` WRITE;
/*!40000 ALTER TABLE `addressbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `addressbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announceid` int(11) NOT NULL auto_increment,
  `announceval` text NOT NULL,
  `from` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `to` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`announceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apiresponse`
--

DROP TABLE IF EXISTS `apiresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiresponse` (
  `id` varchar(50) collate utf8_unicode_ci NOT NULL,
  `companyid` varchar(50) collate utf8_unicode_ci NOT NULL,
  `request` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `response` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiresponse`
--

LOCK TABLES `apiresponse` WRITE;
/*!40000 ALTER TABLE `apiresponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `apiresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarevent`
--

DROP TABLE IF EXISTS `calendarevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarevent` (
  `eid` varchar(36) NOT NULL,
  `cid` varchar(36) default NULL,
  `startts` timestamp NULL default NULL,
  `endts` timestamp NULL default NULL,
  `descr` varchar(100) default NULL,
  `location` varchar(50) default NULL,
  `ts` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarevent`
--

LOCK TABLES `calendarevent` WRITE;
/*!40000 ALTER TABLE `calendarevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendarevents`
--

DROP TABLE IF EXISTS `calendarevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendarevents` (
  `eid` varchar(36) NOT NULL,
  `cid` varchar(36) default NULL,
  `startts` timestamp NULL default NULL,
  `endts` timestamp NULL default NULL,
  `subject` varchar(1024) NOT NULL default '',
  `descr` text,
  `location` varchar(1024) default NULL,
  `showas` char(1) default NULL,
  `priority` char(1) default NULL,
  `recpattern` varchar(3) default NULL,
  `recend` datetime default NULL,
  `resources` text,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `allday` bit(1) NOT NULL default b'0',
  PRIMARY KEY  (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarevents`
--

LOCK TABLES `calendarevents` WRITE;
/*!40000 ALTER TABLE `calendarevents` DISABLE KEYS */;
INSERT INTO `calendarevents` VALUES ('(Isra wa Al-Miraj)','','0000-00-00 00:00:00','0000-00-00 00:00:00','m',NULL,'1970-01-01 00:00:00','','2','1',NULL,NULL,'2012-08-14 08:59:14','\0'),('(Laylat Al-Qadr)','','0000-00-00 00:00:00','0000-00-00 00:00:00','m',NULL,'1970-01-01 00:00:00','','2','1',NULL,NULL,'2012-08-14 08:59:13','\0'),('001d0472-6aa8-476d-b84b-4141ac9e76f2','Indian_Holidays','2011-08-12 16:00:00','2011-08-13 16:00:00','Raksha Bandhan',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('001f494b-21c0-472e-9371-c4540cc1d6b9','Hong_Kong_Holidays','2003-04-20 16:00:00','2003-04-21 16:00:00','Easter Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('002555f3-2f7c-4aed-8558-0ba1de8dc7f8','Mexican_Holidays','2003-11-20 06:00:00','2003-11-21 06:00:00','Revolution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('00335ec7-321d-417d-9daa-a6fd3ef3ae6e','Portuguese_Holidays','2009-03-18 16:00:00','2009-03-19 16:00:00','Dia do Pai (Father\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('00375f3f-f71f-440e-93f3-2a92e02dd334','Swedish_Holidays','2008-12-31 16:00:00','2009-01-01 16:00:00','⚑Nyårsdagen (New Year\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0043c364-f95a-42c2-ad60-c6fc5b5c96e0','German_Holidays','2009-12-19 16:00:00','2009-12-20 16:00:00','4. Advent (Fourth Sunday of Advent)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0044c88b-fc39-4d1d-809f-2719037812a5','Japanese_Holidays','2008-09-23 05:00:00','2008-09-24 05:00:00','Autumnal equinox',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('00974daf-592d-4d06-96ae-a83b99eb6ac3','Indian_Holidays','2005-08-15 05:00:00','2005-08-16 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('00a366dd-66c8-4aab-8a3f-bb7ad027c61b','Japanese_Holidays','2006-11-03 06:00:00','2006-11-04 06:00:00','Culture Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('00a75fc0-e13a-4f64-ba7e-f0681c5c78e1','Austrian_Holidays','2010-06-13 05:00:00','2010-06-14 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('00c280ef-c92a-4efd-9d3f-20456bda815c','Portuguese_Holidays','2011-03-08 16:00:00','2011-03-09 16:00:00','Quarta-feira de Cinzas (Ash Wednesday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('00cc2ed5-64cf-4a0a-b26c-b97ac778674a','Hong_Kong_Holidays','2009-10-03 05:00:00','2009-10-04 05:00:00','Mid-Autumn Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('00cef0a8-b6cf-4135-8954-7ceaa41c6041','Christain_Holidays','2005-01-13 06:00:00','2005-01-14 06:00:00','Feast of the Baptism of Christ',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('00cf6057-74a9-4bdc-9b10-43ca950edef1','South_Korean_Holidays','2011-02-01 16:00:00','2011-02-04 16:00:00','설날',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('00e387aa-db7b-4bd6-a95f-c75eed6da0d7','Thai_Holidays','2009-10-23 05:00:00','2009-10-24 05:00:00','Chulalongkorn Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('00e3d7e7-8ff2-4fe2-a983-9d679571c2dc','Philippines_Holidays','2008-12-31 06:00:00','2009-01-01 06:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('00e6b7cd-9152-4564-aa68-aea5c5b1181d','Jewish_Holidays','2008-07-03 16:00:00','2008-07-04 16:00:00','Rosh Chodesh Tamuz',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('00eedeb5-b45d-4cf4-bf3c-7d4ec17e297d','Irish_Holidays','2010-12-26 06:00:00','2010-12-27 06:00:00','St. Stephen\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('00fa6653-05b0-4b51-a7bb-22e6b526d882','Irish_Holidays','2008-12-25 06:00:00','2008-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('010818ea-a106-48c5-ae49-c5f496277e79','Malaysian_Holidays','2004-05-30 05:00:00','2004-05-31 05:00:00','Harvest Festival*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('011e005b-3d9c-4bda-96b0-1178dd6d0565','Norwegian_Holidays','2005-07-29 05:00:00','2005-07-30 05:00:00','Olsok',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('01204df0-323e-4952-af38-c30f29a87b3d','Taiwan_Holidays','2009-06-05 05:00:00','2009-06-06 05:00:00','Cheng Huang\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('01313b0d-e230-46a8-bc73-7ad85c4b5fe5','Jewish_Holidays','2011-08-08 16:00:00','2011-08-09 16:00:00','Tish\'a B\'Av',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('013f8ff2-7a49-43d9-bc19-af40dfb5439a','Mexican_Holidays','2011-11-20 16:00:00','2011-11-21 16:00:00','Aniversario de la Revolución',NULL,'Días Festivos en México (2010-2012)','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('015380d7-3df4-4d66-b807-5e40efe78e1e','Japanese_Holidays','2019-11-03 16:00:00','2019-11-04 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0167cfda-e159-4f15-8c04-03252ccbfcf5','Malaysian_Holidays','2005-08-31 05:00:00','2005-09-01 05:00:00','Malaysia - Independence / National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('016e9f85-43ec-424b-90f5-1cd4dd01a96d','Brazilian_Holidays','2006-12-25 06:00:00','2006-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('0185d7fd-4a5a-4d21-b244-ac59b02e43af','German_Holidays','2003-10-03 05:00:00','2003-10-04 05:00:00','Tag der deutschen Einheit',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('019463df-ae6c-4703-bb73-42972e0f3aa7','Hong_Kong_Holidays','2007-06-18 16:00:00','2007-06-19 16:00:00','Tuen Ng Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('01985882-1c32-4243-b7a3-678d16057bc4','Jewish_Holidays','2008-06-08 16:00:00','2008-06-09 16:00:00','Shavuot I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0198eda4-29d6-4708-973c-8fb21ca8b776','Mexican_Holidays','2008-12-12 06:00:00','2008-12-13 06:00:00','Day of the Virgin of Guadalupe',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('01a040a3-fa87-42d0-bb62-fd52e6064c96','Austrian_Holidays','2005-10-26 05:00:00','2005-10-27 05:00:00','National Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('01a26564-db75-4bcd-83d6-e362bcf26f15','US_Holidays','2010-11-11 06:00:00','2010-11-12 06:00:00','Veteran\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('01b12be4-4c56-42e5-a0d3-6af0b70d5483','Austrian_Holidays','2009-10-26 05:00:00','2009-10-27 05:00:00','National Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('01b6de39-4d27-4ec6-b5c1-c9a1aa016f3e','Jewish_Holidays','2009-09-26 16:00:00','2009-09-27 16:00:00','Erev Yom Kippur',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('01bf5b9f-8059-4e5d-b3e3-7d3c13503a95','Russian_Holidays','2010-01-07 06:00:00','2010-01-08 06:00:00','Orthodox Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('01c80d6a-4b94-4365-8cb2-f8d4b5a383df','Italian_Holidays','2009-04-11 16:00:00','2009-04-12 16:00:00','Pasqua (Easter)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('01d55d45-50cd-4aac-a1b7-fef87c889d4e','Dutch_Holidays','2009-12-25 16:00:00','2009-12-26 16:00:00','2e Kerstdag (2nd day of Christmas)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('01e84740-4250-4284-92ab-1f5c296b551a','US_Holidays','2009-04-22 05:00:00','2009-04-23 05:00:00','Earth Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('01ef793d-4307-4153-b92b-7a69df5467c1','Jewish_Holidays','2009-04-20 16:00:00','2009-04-21 16:00:00','Yom HaShoah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('02173add-a69c-4b8b-ac43-922d8274d923','Finnish_Holidays','2009-12-24 16:00:00','2009-12-25 16:00:00','Joulupäivä (Christmas Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('02193c1a-3ed6-4c02-87b4-7cd66f7029a2','Taiwan_Holidays','2007-10-25 05:00:00','2007-10-26 05:00:00','Taiwan Retrocession Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('02215fe7-a26c-4b8b-97b4-1133aa211f83','Norwegian_Holidays','2004-05-17 05:00:00','2004-05-18 05:00:00','Grunnlovsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('0237294f-9902-42a4-980b-2bd058eb6980','Malaysian_Holidays','2007-05-01 05:00:00','2007-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('02460f39-cbfb-4c44-a813-b292fd089d71','French_Holidays','2009-11-10 16:00:00','2009-11-11 16:00:00','Armistice 1918 (Armistice Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('026a9354-93c3-4a2d-91b5-64d2773ef71b','Italian_Holidays','2002-12-07 16:00:00','2002-12-08 16:00:00','Immacolata Concezione',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('026f75ed-825a-462b-9462-89a860b7f902','Russian_Holidays','2010-06-12 05:00:00','2010-06-13 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('0271e7be-4373-428f-b566-04075284d108','Norwegian_Holidays','2009-05-16 16:00:00','2009-05-17 16:00:00','Grunnlovsdag (Constitution Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0272683c-3fc5-465c-a6c6-aed91880c3e0','Australian_Holidays','2010-10-04 05:00:00','2010-10-05 05:00:00','Labour Day [NSW/ACT/SA]',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('02766681-2715-41bc-bf8e-6fcad30bd96a','Austrian_Holidays','2007-11-01 05:00:00','2007-11-02 05:00:00','All Saints\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:45',''),('027c0968-0253-4443-9f11-b9c8aafaa1e8','Taiwan_Holidays','2011-04-16 16:00:00','2011-04-17 16:00:00','保生大帝誕辰',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('029b054e-70cc-4ec0-9b35-e19a3e831070','Canadian_Holidays','2008-04-01 05:00:00','2008-04-02 05:00:00','April Fool\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('02b74b0a-5ffe-4a47-ae66-7c12df928f6a','South_Korean_Holidays','2002-06-05 16:00:00','2002-06-06 16:00:00','현충일',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('02cfc526-7d03-4ae3-be44-e64fa7d747c3','UK_Holidays','2009-01-01 06:00:00','2009-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('02e1ba63-6cba-45cb-990d-7e80406e6457','South_Korean_Holidays','2009-08-15 05:00:00','2009-08-16 05:00:00','Liberation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('02e2de08-a128-4ade-9f65-cbcdbe644d88','Hong_Kong_C_Holidays','2003-09-11 16:00:00','2003-09-12 16:00:00','中秋節翌日',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('02eb034e-e47f-4a11-9966-13a1ffadf21b','New_Zealand_Holidays','2010-12-27 06:00:00','2010-12-28 06:00:00','Wellington Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('02edb186-6c73-48c5-be08-e2bcd2720e13','Canadian_Holidays','2011-04-23 16:00:00','2011-04-24 16:00:00','Easter',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('02f91a74-9268-4acc-ba73-dc312e15b241','UK_Holidays','2006-01-02 06:00:00','2006-01-03 06:00:00','2nd January (Scotland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('0303eddf-6a2e-4897-8c9a-50f41687f93c','French_Holidays','2008-05-01 05:00:00','2008-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('030b128c-2870-47cf-982b-c7725b3f38bc','UK_Holidays','2002-08-05 05:00:00','2002-08-06 05:00:00','Summer Bank Holiday (Scotland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('0336e081-4bdd-433a-9592-da7a846b8e0b','UK_Holidays','2003-05-26 05:00:00','2003-05-27 05:00:00','Spring Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('033af720-8fb2-47ac-ba18-67aad95a0331','Canadian_Holidays','2009-02-16 06:00:00','2009-02-17 06:00:00','Alberta Family Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('033bf2f2-3900-45ea-8977-4626a70110a1','Taiwan_Holidays','2009-05-04 05:00:00','2009-05-05 05:00:00','Literary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('034269fc-ba18-49e9-a921-f0dbe5caab64','Japanese_Holidays','2004-01-12 06:00:00','2004-01-13 06:00:00','Coming-of-Age Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('035529ef-3ef0-47e7-a7cd-b54fc49ee7a0','Norwegian_Holidays','2009-12-30 16:00:00','2009-12-31 16:00:00','NyttÃ¥rsaften (New Year\'s Eve)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('035c53f7-29cb-4fee-a0c2-f40a455fc2a1','US_Holidays','2011-12-23 16:00:00','2011-12-24 16:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('036116a2-8d2b-47b8-b444-0aab0271080a','Christain_Holidays','2005-02-07 06:00:00','2005-02-08 06:00:00','Shrove Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('0361d67f-758f-448e-aa01-f4c655a5a6b3','New_Zealand_Holidays','2004-04-09 05:00:00','2004-04-10 05:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('037257f0-021a-471b-9215-09de73201ac0','New_Zealand_Holidays','2004-01-02 06:00:00','2004-01-03 06:00:00','Day after New Year\'s day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0379d9f3-4e9d-4bbf-b00c-7453f369b6f7','Mexican_Holidays','2003-03-21 06:00:00','2003-03-22 06:00:00','Benito Juárez\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:56',''),('0396d180-24e4-42af-8099-4df065c587bb','US_Holidays','2006-12-31 06:00:00','2007-01-01 06:00:00','New Year\'s Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('03a72580-023d-43a0-ae84-3305294c6004','Finnish_Holidays','2012-05-26 16:00:00','2012-05-27 16:00:00','Helluntai (Whitsunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('03ac6b4f-d075-46c4-9f96-5f78bca38356','German_Holidays','2010-10-31 05:00:00','2010-11-01 05:00:00','Reformation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('03b05449-9aae-48d0-83c3-7bad55cffa59','Jewish_Holidays','2009-12-15 16:00:00','2009-12-16 16:00:00','Chanukah: 6 Candles',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('03b22384-26c9-413e-96ba-5f2fbdff23ef','Danish_Holidays','2010-12-26 06:00:00','2010-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('03b2a9d4-3fc3-4991-88c9-8ee7807dad09','Swedish_Holidays','2012-06-22 16:00:00','2012-06-23 16:00:00','⚑Midsommardagen (Midsummer\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('03b71020-7524-44d0-a36a-cd5eae554651','Malaysian_Holidays','2008-09-16 05:00:00','2008-09-17 05:00:00','Malaysia Day & the Yang Di-Pertua of Sabah\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('03e66226-c4f9-45f4-a225-efbcaec4764f','Hong_Kong_C_Holidays','2005-10-10 16:00:00','2005-10-11 16:00:00','重陽節',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('03ea80ba-f19b-429d-a7b8-1b3071381a83','Hong_Kong_Holidays','2003-01-31 16:00:00','2003-02-01 16:00:00','Lunar New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('03f340f0-6f53-4ee8-be47-05e9557f5fb0','New_Zealand_Holidays','2003-01-01 06:00:00','2003-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('03f5cf43-628f-46d8-a0ee-b670a28dc78d','Philippines_Holidays','2009-02-25 06:00:00','2009-02-26 06:00:00','EDSA Revolution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('042651ce-f3a1-4ea9-b1c5-ccd7d457dd99','Jewish_Holidays','2009-12-16 16:00:00','2009-12-17 16:00:00','Rosh Chodesh Tevet',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('042d44d8-4f08-4d49-a685-dc58939b5655','Mexican_Holidays','2002-02-05 06:00:00','2002-02-06 06:00:00','Constitution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('043bdc59-a16a-44da-87fd-71722b5eacd9','Jewish_Holidays','2008-09-28 16:00:00','2008-09-29 16:00:00','Erev Rosh Hashana',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('04602508-bb9d-4352-8291-369018cfcaf0','Jewish_Holidays','2009-12-18 16:00:00','2009-12-19 16:00:00','Chanukah: 8th Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0467a96e-0b13-498b-bdb1-0da60fa80b98','Jewish_Holidays','2009-06-21 16:00:00','2009-06-22 16:00:00','Rosh Chodesh Tamuz',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0470ef2f-f392-45bc-add1-8c1db29ed53c','Christain_Holidays','2004-01-05 06:00:00','2004-01-06 06:00:00','Epiphany Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('04793456-606a-489f-b952-909038e5aa79','Philippines_Holidays','2007-06-24 05:00:00','2007-06-25 05:00:00','Manila Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('04796b76-13c3-457d-b01f-cec8b25374e0','Finnish_Holidays','2005-05-01 05:00:00','2005-05-02 05:00:00','May Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('0484b015-8776-4909-8619-1c193ab203ff','Hong_Kong_Holidays','2002-04-30 16:00:00','2002-05-01 16:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('04926b11-374a-4d1b-bdfe-d2e7b5d35e70','Danish_Holidays','2010-03-31 16:00:00','2010-04-01 16:00:00','Skærtorsdag (Maundy Thursday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0492c59f-5d8d-449c-b6c2-fed1ea6c29d9','Hong_Kong_Holidays','2008-02-07 16:00:00','2008-02-08 16:00:00','Second Day of Lunar New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('04a392e1-ee91-4f3b-8177-5d2e21b84fe9','French_Holidays','2009-06-06 16:00:00','2009-06-07 16:00:00','Fête des Mères (Mother’s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('04bec623-e044-4f0a-9771-18341970ae8d','Mexican_Holidays','2009-02-05 06:00:00','2009-02-06 06:00:00','Constitution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('04c2017f-66d7-4852-9bed-b85e1b47ff19','US_Holidays','2004-02-22 06:00:00','2004-02-23 06:00:00','Washington\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('04d28ad6-b119-4c4a-834b-d8fcf534fb8b','Australian_Holidays','2011-12-25 16:00:00','2011-12-26 16:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('04d67a15-f9e7-4c03-ab33-a7d2ba26d501','Thai_Holidays','2006-12-10 06:00:00','2006-12-11 06:00:00','Constitution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('04e0e569-1815-4846-b4e3-2780129550e5','Spain_Holidays','2005-12-25 06:00:00','2005-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('04e38403-502a-46af-b30c-9c0306d389c9','Dutch_Holidays','2007-12-26 06:00:00','2007-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('04e3c0d3-457b-4f54-b191-b7abf0fd5208','Finnish_Holidays','2007-12-25 06:00:00','2007-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('04edf90d-0438-4fe7-87d7-322c53a43024','Jewish_Holidays','2008-03-07 16:00:00','2008-03-08 16:00:00','Rosh Chodesh Adar II',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('04f2aff9-ad87-4389-927a-b94928c4fcbf','Mexican_Holidays','2011-04-30 16:00:00','2011-05-01 16:00:00','Día del Trabajo',NULL,'Días Festivos en México (2010-2012)','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0504ef41-5e17-4a34-ba06-8ea6f8385f07','Hong_Kong_Holidays','2002-03-29 16:00:00','2002-03-30 16:00:00','The day following Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('051ac7f2-e13a-4c8d-b568-6f7c265f480e','Hong_Kong_Holidays','2002-03-31 16:00:00','2002-04-01 16:00:00','Easter Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('052117f0-e4dd-49ce-b04f-e0f906d96f87','Indonesian_Holidays','2009-05-21 05:00:00','2009-05-22 05:00:00','Ascension Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:45',''),('05311925-eae7-43c7-8913-4923d6dede30','New_Zealand_Holidays','2011-01-01 16:00:00','2011-01-02 16:00:00','Day after New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0532e1ab-1c04-4efc-abaf-85242a1a49cd','Canadian_Holidays','2004-10-31 05:00:00','2004-11-01 06:00:00','Halloween',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('0571f51b-dcfd-49c4-be90-3cd1774485ad','Christain_Holidays','2009-12-28 06:00:00','2009-12-29 06:00:00','Childermas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('057248ee-6320-4ed3-a057-a080e077ccd9','Austrian_Holidays','2007-12-31 06:00:00','2008-01-01 06:00:00','New Year\'s Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('057fb776-2d91-4d1d-9067-d40031f8fb7c','Norwegian_Holidays','2010-04-01 16:00:00','2010-04-02 16:00:00','Langfredag (Good Friday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0582f787-9c75-4d3a-986f-8285f5a0f8e8','Italian_Holidays','2010-06-02 05:00:00','2010-06-03 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('059522f0-fce0-43a2-b63f-2ac411e69b1a','China_Holidays','2006-09-10 05:00:00','2006-09-11 05:00:00','Teacher\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('059e24f9-a143-4b31-ad96-a9ed5c7a1cb4','Vietnamese_Holidays','2003-05-01 05:00:00','2003-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('05b730cd-ca11-458e-ae91-839cce9a8938','Danish_Holidays','2011-04-23 16:00:00','2011-04-24 16:00:00','Påskedag (Easter Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('05d2f898-cdae-41ef-94d4-3a1c08cdcae5','Indian_Holidays','2006-01-26 06:00:00','2006-01-27 06:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('05dc4f41-83bf-4aaf-b475-e0c0a1da0db2','Norwegian_Holidays','2008-06-23 05:00:00','2008-06-24 05:00:00','St. John\'s Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('05e052ca-f067-4c1f-8172-d2db0569efee','Taiwan_Holidays','2009-06-03 05:00:00','2009-06-04 05:00:00','Opium Suppression Movement Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('05f70f95-f538-4355-9ff6-86b755bbbf7e','German_Holidays','2012-06-06 16:00:00','2012-06-07 16:00:00','Fronleichnam (Corpus Christi)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('060f3711-97c2-4024-a2ac-08d2b622ee4b','South_Africa_Holidays','2009-08-09 05:00:00','2009-08-10 05:00:00','National Woman\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('0615558b-3ca2-4cb4-96e3-fc07f124f7bc','Norwegian_Holidays','2008-05-08 05:00:00','2008-05-09 05:00:00','Frigjøringsdagen',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('0626cb10-afb6-4aea-bf73-0aa9761286ee','Norwegian_Holidays','2009-04-12 16:00:00','2009-04-13 16:00:00','2. pÃ¥skedag (2nd Easter Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('062a5076-e4e3-40be-8b95-465d439b8336','Greek_Holidays','2010-02-07 06:00:00','2010-02-08 06:00:00','Carnival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('06340cdc-dfca-4ad0-a06c-9bf2bfc78c01','Norwegian_Holidays','2004-11-01 06:00:00','2004-11-02 06:00:00','Allehelgensdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('065d63fe-909b-4a33-b73d-593c2151a1fd','New_Zealand_Holidays','2010-04-25 05:00:00','2010-04-26 05:00:00','ANZAC Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('06719390-bfd4-4060-b39d-40d90c7b6df6','Spain_Holidays','2005-01-01 06:00:00','2005-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('06720078-7808-49c2-9528-d52630fe79d2','Polish_Holidays','2007-06-23 05:00:00','2007-06-24 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('067a47dd-1608-48ff-994e-b77b595bd553','UK_Holidays','2002-07-12 05:00:00','2002-07-13 05:00:00','Battle of Boyne Day (N. Ireland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('0689480b-2896-49a8-aaa3-05ca3457cca6','UK_Holidays','2003-03-17 06:00:00','2003-03-18 06:00:00','St. Patrick\'s Day (N. Ireland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('069425dc-6268-41c7-b3dc-94ad886a44d5','Dutch_Holidays','2009-04-11 16:00:00','2009-04-12 16:00:00','1e Paasdag (Easter Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('06949567-6c47-4524-855c-9dc294738990','Malaysian_Holidays','2009-05-01 05:00:00','2009-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('069b87c3-35ce-4772-aa2c-5d9352806fe5','Brazilian_Holidays','2005-10-12 05:00:00','2005-10-13 05:00:00','Our Lady Aparecida Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('06a59bac-f6dc-449f-a59d-36461e941e1b','Norwegian_Holidays','2009-04-04 16:00:00','2009-04-05 16:00:00','PalmesÃ¸ndag (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('06bd8758-c277-4768-958e-c2521779b161','South_Africa_Holidays','2005-01-01 06:00:00','2005-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('06c31c0b-06cc-4717-b82a-b6001625053f','New_Zealand_Holidays','2002-06-03 05:00:00','2002-06-04 05:00:00','Queen\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('06ee9c87-605d-4524-ac43-c34a8338f360','Philippines_Holidays','2010-12-31 06:00:00','2011-01-01 06:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('06f5da39-6784-4e26-a3d6-7f3c39bc3401','Thai_Holidays','2010-10-23 05:00:00','2010-10-24 05:00:00','Chulalongkorn Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('07073d44-57b5-4e68-b187-1f5aa66d322c','German_Holidays','2009-05-30 16:00:00','2009-05-31 16:00:00','Pfingstsonntag (Whit Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('07089ea9-b240-4ead-b2b4-2010efb1e0a8','Christain_Holidays','2004-10-23 05:00:00','2004-10-24 05:00:00','Creation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('0708fd29-8d16-4769-9a21-309d93a23db0','Spain_Holidays','2010-12-25 06:00:00','2010-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('07796bb5-1e76-495b-919f-05bada04fb68','Jewish_Holidays','2010-05-17 16:00:00','2010-05-18 16:00:00','Erev Shavuot',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('07814e1f-f516-4e84-98f1-0b1ce3b248f7','Taiwan_Holidays','2003-05-01 05:00:00','2003-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('07c2670d-b99b-4038-adc3-9db0299dc878','Indonesian_Holidays','2010-05-13 05:00:00','2010-05-14 05:00:00','Ascension Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:45',''),('07c4590e-6f15-42ba-90c6-7ecd6178320d','New_Zealand_Holidays','2009-01-19 06:00:00','2009-01-20 06:00:00','Wellington Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('07d4e79a-c4e7-4152-92ee-0e68ec81137a','New_Zealand_Holidays','2011-10-23 16:00:00','2011-10-24 16:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('07e1a14c-a0d9-4a2f-8404-bf12354f1d96','Taiwan_Holidays','2010-04-28 05:00:00','2010-04-29 05:00:00','God of Medicine\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('07e24184-6d82-4c45-8660-0e20ed463d8d','Portuguese_Holidays','2010-04-03 16:00:00','2010-04-04 16:00:00','Páscoa (Easter Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('07e9b558-f3cc-422f-8f16-03f89fa6b354','Polish_Holidays','2007-05-01 05:00:00','2007-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('07f714a8-7d12-438a-9d9a-85e027a1b2d1','Danish_Holidays','2010-04-29 16:00:00','2010-04-30 16:00:00','Store Bededag (General Prayer Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('08049ea1-86b2-4f41-9dc2-d8c28c2c2738','Italian_Holidays','2009-12-24 16:00:00','2009-12-25 16:00:00','Natale (Christmas Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('080db47c-2b43-4aac-8f73-94a0527f0fd8','Indian_Holidays','2009-10-17 05:00:00','2009-10-18 05:00:00','Diwali',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('08106de0-2c2a-4368-b405-339a4d5039c0','Hong_Kong_C_Holidays','2007-12-26 06:00:00','2007-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('0826a39a-da55-49db-bf80-ec6fc940d660','Taiwan_Holidays','2007-05-13 05:00:00','2007-05-14 05:00:00','Mother\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('082c1897-951c-499d-99fc-ea3ce5cc33d4','UK_Holidays','2011-04-20 16:00:00','2011-04-21 16:00:00','Elizabeth II\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('083f33f9-86aa-4c17-9a13-aab2a15e2c16','Vietnamese_Holidays','2004-05-19 05:00:00','2004-05-20 05:00:00','Ho Chi Minh’s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('085ce992-5e7e-4222-a8f6-80f60fce77a2','Mexican_Holidays','2008-11-20 06:00:00','2008-11-21 06:00:00','Revolution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('086105cc-7784-477d-9c81-9b2e4bdf0d72','Indian_Holidays','2010-09-02 05:00:00','2010-09-03 05:00:00','Janmashtami',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('0861adea-78da-4109-a788-dc8a6b85827c','Canadian_Holidays','2006-03-17 06:00:00','2006-03-18 06:00:00','St. Patrick\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('08623e7c-b962-4298-91bd-945fd2326f8e','Danish_Holidays','2009-12-24 16:00:00','2009-12-25 16:00:00','Juledag (Christmas Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0878c21a-3fc5-4a27-af3f-8cd92d2ae8a0','Taiwan_Holidays','2001-02-01 06:00:00','2001-02-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('08a6f9b6-33aa-4063-a9b2-e94afc014b3c','US_Holidays','2006-05-29 05:00:00','2006-05-30 05:00:00','John F. Kennedy\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('08a8f3c1-7f4b-4e8c-b51e-97e3b0505249','US_Holidays','2008-05-05 05:00:00','2008-05-06 05:00:00','Cinco de Mayo',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('08ad7eea-7a1c-40e2-941a-cd24157d5071','Finnish_Holidays','2008-12-31 16:00:00','2009-01-01 16:00:00','Uudenvuodenpäivä (New Year\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('08db82b0-fe21-42e8-aea9-b4f9bb221e06','US_Holidays','2005-02-14 06:00:00','2005-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('08ea2358-65f5-420f-9eb6-66d848b064d3','Brazilian_Holidays','2002-01-01 06:00:00','2002-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('08fd364b-6f01-4a16-bbb8-69663a44a6c0','Brazilian_Holidays','2007-09-07 05:00:00','2007-09-08 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('08fe89e1-1f19-4e05-a8e1-97dc0b7ee2ee','Taiwan_Holidays','2002-10-25 05:00:00','2002-10-26 05:00:00','Taiwan Retrocession Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('09134e11-c29f-433f-8fd6-5b9a0e1df25d','Hong_Kong_C_Holidays','2006-04-05 05:00:00','2006-04-06 05:00:00','Qingming Festival (Tomb Sweeping Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('091881c2-1198-4c49-8b0c-be8620df89fd','South_Korean_Holidays','2009-10-01 05:00:00','2009-10-02 05:00:00','Soldier\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('0925c198-1eac-45da-8341-5b78fb7e15de','Mexican_Holidays','2004-11-02 06:00:00','2004-11-03 06:00:00','All Souls\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:56',''),('092f2210-aaac-4875-9399-2b839f6ff5d1','German_Holidays','2009-04-11 16:00:00','2009-04-12 16:00:00','Ostersonntag (Easter)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0939d822-6871-47d2-af38-ccf2c72be528','Indian_Holidays','2011-04-21 16:00:00','2011-04-22 16:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('093f2d02-8be2-4869-a873-d414896aefea','Jewish_Holidays','2008-12-27 16:00:00','2008-12-28 16:00:00','Rosh Chodesh Tevet',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0962acc7-799d-4199-bd8e-1fd51385e377','Jewish_Holidays','2008-09-29 16:00:00','2008-09-30 16:00:00','Rosh Hashana 5769',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('097a8e73-99fb-4716-bd3b-d3176b896913','Danish_Holidays','2009-06-06 16:00:00','2009-06-07 16:00:00','Prins Joachim (Prince Joachim\'s birthday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('098c5b44-4a02-4a64-91c2-f6b7b20bd734','Malaysian_Holidays','2005-04-08 05:00:00','2005-04-09 05:00:00','Sultan Of Johor\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('09dd79c9-0ba5-4ca4-b987-97688ae2c35c','Hong_Kong_Holidays','2010-12-25 06:00:00','2010-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('09e31641-37e3-446c-ae79-b22400859556','Malaysian_Holidays','2006-02-01 06:00:00','2006-02-02 06:00:00','Federal Territory Day*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('09f12c01-4821-4204-b92f-82abf12e5ded','Mexican_Holidays','2008-09-15 05:00:00','2008-09-16 05:00:00','Shout of Dolores',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('09f7970e-5e93-4fbd-979f-0c52dd49c6f9','Russian_Holidays','2009-01-19 06:00:00','2009-01-20 06:00:00','Baptizing - Sacred Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('09f920ff-1ea1-4317-9982-6464719d3197','UK_Holidays','2010-03-17 05:00:00','2010-03-18 05:00:00','St. Patrick\'s Day (N. Ireland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('09ffec7d-b843-4b7f-aaea-721910bcc593','Japanese_Holidays','2007-02-11 06:00:00','2007-02-12 06:00:00','National Foundation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('0a075a11-3b65-42db-8f13-82e8d6568f77','Canadian_Holidays','2010-03-14 06:00:00','2010-03-15 05:00:00','Daylight Saving Time Begins',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('0a095c4f-5ad2-4a97-b1a5-a7bc8096e197','Mexican_Holidays','2007-03-21 05:00:00','2007-03-22 05:00:00','Benito Juárez\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:56',''),('0a0a4384-eebd-4e44-9972-65e8698c970e','Jewish_Holidays','2007-06-15 16:00:00','2007-06-16 16:00:00','Rosh Chodesh Tamuz',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a0de8db-d39f-4602-9394-e5a18ea816dd','China_Holidays','2009-05-24 16:00:00','2009-05-25 16:00:00','Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a12861e-e52a-477c-9663-83861584f9ab','Austrian_Holidays','2005-01-06 06:00:00','2005-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('0a309c4b-11ce-412a-9de0-a1bcbc531083','French_Holidays','2011-06-01 16:00:00','2011-06-02 16:00:00','Ascension (Ascension Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a41bab2-bdc4-4d1b-8f9c-796db4055e63','Hong_Kong_Holidays','2007-04-30 16:00:00','2007-05-01 16:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a424258-e261-4735-9593-c12000d95273','Thai_Holidays','2011-07-17 16:00:00','2011-07-18 16:00:00','ชดเชย วันเข้าพรรษา (Buddhist Lent Day) (ธนาคารไม่หยุดวันนี้)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a49ca46-3dfe-4978-8eb6-fde39f367e15','Danish_Holidays','2008-12-31 16:00:00','2009-01-01 16:00:00','Nytårsdag (New Year\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0a4b1483-616b-41c7-91eb-ac2736201e8a','US_Holidays','2003-05-05 05:00:00','2003-05-06 05:00:00','Cinco de Mayo',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('0a52bcef-7273-4afc-a368-f59448bfa07a','Russian_Holidays','2009-11-04 06:00:00','2009-11-05 06:00:00','Unity Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('0a8498d6-82a9-4962-8c83-bf42313198d3','UK_Holidays','2010-05-31 05:00:00','2010-06-01 05:00:00','Spring Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('0ac47e0b-2905-4350-adf2-5556dab77b98','Irish_Holidays','2003-12-26 06:00:00','2003-12-27 06:00:00','St. Stephen\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('0ac5e41b-1e21-434d-8525-c4089047af83','Japanese_Holidays','2029-04-29 16:00:00','2029-04-30 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ad268b6-0b84-417a-9e28-6bab3bf85b50','New_Zealand_Holidays','2009-04-25 05:00:00','2009-04-26 05:00:00','ANZAC Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0ad51b8d-126f-443a-92cc-15f84e902919','Malaysian_Holidays','2011-08-31 16:00:00','2011-09-01 16:00:00','Hari Raya Puasa (Day 2)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ad7c8a1-bda9-454f-9cf5-1aadfd028bc9','Danish_Holidays','2011-04-21 16:00:00','2011-04-22 16:00:00','Langfredag (Good Friday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ad7ccb6-e1e9-42e5-b2e0-af2514e3fa58','Portuguese_Holidays','2004-08-15 05:00:00','2004-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('0adedfe7-fcba-4bca-812b-2ef4755a5e49','Australian_Holidays','2009-01-01 06:00:00','2009-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('0ae17f5c-3f89-408e-b395-8170b46d960a','Norwegian_Holidays','2008-07-04 05:00:00','2008-07-05 05:00:00','Dronning Sonjas fødselsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('0ae28410-9432-459d-a9c0-4b8e212eba0d','Danish_Holidays','2010-06-05 05:00:00','2010-06-06 05:00:00','Constitution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('0aef2343-63fb-439b-8418-f1087376b354','German_Holidays','2010-03-27 16:00:00','2010-03-28 16:00:00','Palmsonntag (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0af9a80c-e655-40ae-99a2-59337b384145','Polish_Holidays','2009-02-14 06:00:00','2009-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('0b0943c7-fdd9-414d-9299-22285bab84b6','Hong_Kong_C_Holidays','2003-12-26 06:00:00','2003-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('0b0abf78-de09-4150-b094-2f9043b2f70e','Hong_Kong_C_Holidays','2010-12-26 06:00:00','2010-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('0b14c686-0e43-4d9a-a0ab-852c22a5a416','Christain_Holidays','2009-04-09 05:00:00','2009-04-10 05:00:00','Thursday before Easter',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('0b219611-8aaf-4af8-a726-e0d232bc7e5b','Jewish_Holidays','2011-10-06 16:00:00','2011-10-07 16:00:00','Erev Yom Kippur',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0b2602b9-6e07-4a82-95b1-38853da2f510','Taiwan_Holidays','2006-02-28 06:00:00','2006-03-01 06:00:00','Peace Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('0b28c92b-ebdd-4746-8f9c-0b0f9e132e89','Japanese_Holidays','2005-04-29 05:00:00','2005-04-30 05:00:00','Showa Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('0b33946c-0077-4f31-8c17-ce7215629918','Japanese_Holidays','2030-09-22 16:00:00','2030-09-23 16:00:00','秋分の日 (Autumnal Equinox)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0b368b64-b0da-4159-8bb8-31e65a54e1eb','Dutch_Holidays','2007-04-30 05:00:00','2007-05-01 05:00:00','Queen\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('0b3d3023-aa69-4a9f-ad86-0370186829d4','Italian_Holidays','2007-11-01 05:00:00','2007-11-02 05:00:00','All Saints',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('0b4fa963-76e9-43cc-83c7-44718b0a4216','Australian_Holidays','2009-02-02 06:00:00','2009-02-03 06:00:00','Labour Day [WA]',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('0b5046bc-317c-4e74-a228-f56134aa7033','Philippines_Holidays','2003-11-01 06:00:00','2003-11-02 06:00:00','All Saints\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('0b52e4d8-da3a-4f3f-88c2-b7bc68e307ed','Mexican_Holidays','2010-09-15 16:00:00','2010-09-16 16:00:00','Día de la Independencia',NULL,'Días Festivos en México (2010-2012)','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0b5bf169-5c04-49e9-b494-f7aff89bf751','Hong_Kong_C_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','The first day of January',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:30',''),('0b8aa618-8af9-4adc-ba1b-085de6f99a22','US_Holidays','2010-05-05 05:00:00','2010-05-06 05:00:00','Cinco de Mayo',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('0b9ebb47-6475-4801-a420-61f5da2f2874','Jewish_Holidays','2011-11-26 16:00:00','2011-11-27 16:00:00','Rosh Chodesh Kislev',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0c17085a-e051-4169-8ecb-8d38eb7bd704','Christain_Holidays','2007-11-01 05:00:00','2007-11-02 05:00:00','All Saints Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('0c24a091-a795-442a-a3fb-168ec33689f4','Hong_Kong_Holidays','2004-12-26 06:00:00','2004-12-27 06:00:00','The first weekday after Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('0c3926a7-1f24-4cf2-b96f-8b1cf60fa1ac','Christain_Holidays','2005-03-25 06:00:00','2005-03-26 06:00:00','Annunciation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('0c41cd36-ea54-44f7-80a8-8ac199cd20c6','China_Holidays','2010-10-01 05:00:00','2010-10-02 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('0c570173-0ae2-4f7f-a45e-7b8076315791','German_Holidays','2009-04-09 16:00:00','2009-04-10 16:00:00','Karfreitag (Good Friday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0c59a7d8-bee3-4768-b90b-2f7df65ce17a','Jewish_Holidays','2008-08-15 16:00:00','2008-08-16 16:00:00','Shabbat Nachamu',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0c5c8843-43f8-4470-92d3-35c8d76e3033','Japanese_Holidays','2029-12-23 16:00:00','2029-12-24 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0c693e55-f210-4181-86e4-5a999d95671a','Thai_Holidays','2003-02-15 06:00:00','2003-02-16 06:00:00','Full Moon Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('0c7d3736-d21e-4c4a-9019-a319ca70afd4','Greek_Holidays','2010-04-04 05:00:00','2010-04-05 05:00:00','Easter',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('0c9804ad-dbe0-4fa1-ac51-6e2e832965ee','Jewish_Holidays','2009-03-10 16:00:00','2009-03-11 16:00:00','Shushan Purim',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0ca3bbd4-e547-48af-9488-ea5d8429923a','New_Zealand_Holidays','2006-12-26 06:00:00','2006-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0ca5c111-afc7-4d63-a3db-25ad6d07b45e','Malaysian_Holidays','2004-04-08 05:00:00','2004-04-09 05:00:00','Sultan Of Johor\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('0ca8057e-5e94-41ad-aa38-f757efeb2b8d','Canadian_Holidays','2011-04-24 16:00:00','2011-04-25 16:00:00','Easter Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0cb46183-787b-4402-9fc8-30c12b9991bd','China_Holidays','2009-02-11 16:00:00','2009-02-12 16:00:00','Lincoln\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ccfa936-64cd-4915-aa62-3dd5ff4185b7','Austrian_Holidays','2006-12-24 06:00:00','2006-12-25 06:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('0ce51ba7-f7be-42ba-ada9-56769137ee11','South_Korean_Holidays','2003-12-25 06:00:00','2003-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('0ce6c4d0-0568-4150-bff5-f5c7b702df36','Taiwan_Holidays','2006-08-08 05:00:00','2006-08-09 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('0d07b530-c09a-4bed-9568-c8cfe2e9447b','Dutch_Holidays','2004-06-20 05:00:00','2004-06-21 05:00:00','Vaderdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('0d25b006-709f-49ed-b067-5024493ff318','Danish_Holidays','2004-06-05 05:00:00','2004-06-06 05:00:00','Grundlovsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('0d2fb24b-95ab-4209-9dc1-cd024b19a88d','China_Holidays','2011-11-07 16:00:00','2011-11-08 16:00:00','Election Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0d457e79-c7a3-4771-9586-d8de884b851d','French_Holidays','2002-08-15 05:00:00','2002-08-16 05:00:00','Assomption',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('0d4cc20c-b2cb-488e-9891-7421c8f324d0','Malaysian_Holidays','2006-01-01 06:00:00','2006-01-02 06:00:00','New Year\'s Day*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('0d4d05e5-f8a8-40e8-bb45-856acf550591','Thai_Holidays','2007-08-12 05:00:00','2007-08-13 05:00:00','H.M. The Queen\'s Birthday Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('0d4f9e00-13f1-49b2-8030-0f2ddb99bdd0','Finnish_Holidays','2002-12-06 06:00:00','2002-12-07 06:00:00','Itsenäisyyspäivä',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('0d500ef0-4bcb-47bc-9947-76d647b3baf2','Philippines_Holidays','2007-11-01 05:00:00','2007-11-02 05:00:00','All Saints\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('0d640f16-d100-4796-8176-31d920300b13','South_Korean_Holidays','2009-04-05 05:00:00','2009-04-06 05:00:00','Arbor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('0d7482c0-73b6-41f2-aee0-497f60d79b5e','Danish_Holidays','2007-05-25 05:00:00','2007-05-26 05:00:00','Ascension Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('0d897cd0-2070-4ae2-99fb-06074997ee31','Australian_Holidays','2007-01-01 06:00:00','2007-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('0d9b56f3-427b-4012-802f-2d03f45b8410','Mexican_Holidays','2003-05-05 05:00:00','2003-05-06 05:00:00','Cinco de Mayo',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('0d9bb237-eeef-4f0d-be36-8b9014b572d9','China_Holidays','2007-06-21 05:00:00','2007-06-22 05:00:00','Summer Solstice',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('0dbfb46e-138b-48b2-9833-dd3ff459a19a','New_Zealand_Holidays','2006-12-25 06:00:00','2006-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0dc3f807-5643-48d0-8e56-866492735ea8','Vietnamese_Holidays','2005-04-30 05:00:00','2005-05-01 05:00:00','Liberation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('0ddabc4c-f763-4e2a-a7f7-e8740ede065c','China_Holidays','2009-11-10 16:00:00','2009-11-11 16:00:00','Veteran\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ddf2079-78b5-47e5-9620-a7836343f6b0','South_Korean_Holidays','2002-12-25 06:00:00','2002-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('0deabdda-6f65-47cc-afd8-783fe17c4fd7','Hong_Kong_Holidays','2009-05-28 05:00:00','2009-05-29 05:00:00','Dragon Boat Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('0df1c16e-cd84-441b-8880-46f084d21a15','Hong_Kong_Holidays','2003-10-01 05:00:00','2003-10-02 05:00:00','National Day of the People\'s Republic of China',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('0dfc2f38-44ed-4256-bb7c-42ea6714e7b9','Italian_Holidays','2007-01-06 06:00:00','2007-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('0e0da25b-c2aa-44bd-9d73-e44aa8f6cac6','Islamic_Holidays','2011-12-04 16:00:00','2011-12-05 16:00:00','Ashurah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0e294f2d-eb10-4332-93b9-4454f23c032d','Malaysian_Holidays','2008-04-08 05:00:00','2008-04-09 05:00:00','Sultan Of Johor\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('0e3202a1-a137-474d-b9e4-c3fd2391fa1e','Jewish_Holidays','2009-12-17 16:00:00','2009-12-18 16:00:00','Rosh Chodesh Tevet',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0e32f9fa-40d5-4bfe-8d0d-7b6386a53139','German_Holidays','2005-08-15 05:00:00','2005-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('0e3c749e-612c-448a-b0c5-f94aba3e1524','US_Holidays','2011-04-14 16:00:00','2011-04-15 16:00:00','Tax Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0e7ed40e-0efa-4343-8620-06dd12603b9f','Norwegian_Holidays','2010-03-27 16:00:00','2010-03-28 16:00:00','PalmesÃ¸ndag (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0e9326c7-9a3a-42ec-8c30-7cafc646d206','New_Zealand_Holidays','2002-01-02 06:00:00','2002-01-03 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0e9f3011-68ee-4f19-b477-db18dfb9adc6','Danish_Holidays','2009-06-23 16:00:00','2009-06-24 16:00:00','Skt. Hans dag (Skt. Hans Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0e9fff81-1d8f-4683-aec6-ee73cea92c2c','UK_Holidays','2008-03-17 05:00:00','2008-03-18 05:00:00','St. Patrick\'s Day (N. Ireland)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('0ea2bbb1-e725-4a30-b021-b44ebc19ab39','German_Holidays','2004-05-20 05:00:00','2004-05-21 05:00:00','Christi Himmelfahrt',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('0eb19be5-12e1-4109-96de-5e3279bf0494','Jewish_Holidays','2007-09-14 16:00:00','2007-09-15 16:00:00','Shabbat Shuva',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ec11bff-ea70-42f9-a247-9fafb3df0e9b','Austrian_Holidays','2009-04-13 05:00:00','2009-04-14 05:00:00','Easter Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('0ec200d5-fd16-4d8c-a20e-30fd34ac36ed','Irish_Holidays','2006-10-30 06:00:00','2006-10-31 06:00:00','October Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('0ecae950-93eb-440e-b2e5-6fa04f67eab5','Brazilian_Holidays','2009-04-20 16:00:00','2009-04-21 16:00:00','Tiradentes (Tiradentes)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ee51c66-d3de-4140-8c54-b93d50bc1fbd','German_Holidays','2010-12-11 16:00:00','2010-12-12 16:00:00','3. Advent (Third Sunday of Advent)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ee7297c-cc5d-4dc4-90a4-b4e9e310f87c','Brazilian_Holidays','2003-12-08 06:00:00','2003-12-09 06:00:00','Immaculate Conception',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('0eea3f06-a36d-4842-937e-29ec4c0a7945','Polish_Holidays','2008-02-14 06:00:00','2008-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('0eed62ce-fbac-4566-9fa5-ded4c63bdb0b','Mexican_Holidays','2004-11-20 06:00:00','2004-11-21 06:00:00','Revolution Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('0efa6f7d-6351-4ed4-900b-6f99215e7f3c','New_Zealand_Holidays','2006-10-30 06:00:00','2006-10-31 06:00:00','Marlborough Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('0efe813b-606a-4d11-8258-9c77b6b7c64b','Italian_Holidays','2009-04-24 16:00:00','2009-04-25 16:00:00','Festa della Liberazione (Bank Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('0f1bcd6c-f706-49f6-962f-2bf2a3a27fd9','Malaysian_Holidays','2010-05-17 05:00:00','2010-05-18 05:00:00','Sultan Of Perlis\' Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('0f1f7202-b328-4d64-a2e0-caaabf309381','Jewish_Holidays','2008-10-03 16:00:00','2008-10-04 16:00:00','Shabbat Shuva',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0f1fed7f-4207-411b-bca9-720551d9641a','US_Holidays','2005-10-31 06:00:00','2005-11-01 06:00:00','Halloween',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('0f20ba10-ed69-418e-850b-4c0f5a3a06b0','Taiwan_Holidays','2009-11-12 06:00:00','2009-11-13 06:00:00','Sun Yat-sen\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('0f220269-99ac-41cd-89a7-d6fd862acb01','Thai_Holidays','2003-05-05 05:00:00','2003-05-06 05:00:00','Coronation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('0f261412-d1b8-42cd-86d8-e3e44e3f2694','Dutch_Holidays','2005-01-01 06:00:00','2005-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('0f27ca33-b422-4c4d-a9e3-01672f1b6cb3','Norwegian_Holidays','2010-08-19 05:00:00','2010-08-20 05:00:00','Kronprinsesse Mette-Marits fødselsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('0f4a1466-aa23-4aa1-8438-415a524bd3a0','US_Holidays','2009-01-19 06:00:00','2009-01-20 06:00:00','Martin Luther King, Jr\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('0f513c08-05c4-4bb3-b54e-8086e841ddc9','Jewish_Holidays','2008-03-28 16:00:00','2008-03-29 16:00:00','Shabbat Parah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0f61aaa2-3bd5-423d-8289-0c23e3b92e01','Indian_Holidays','2004-01-26 06:00:00','2004-01-27 06:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('0f67a7ac-3ae7-4059-bb07-6e37572b7f13','Malaysian_Holidays','2010-05-31 05:00:00','2010-06-01 05:00:00','Harvest Festival*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('0f6dbd9d-d18b-4b19-b0db-5e2632422657','Taiwan_Holidays','2005-05-01 05:00:00','2005-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('0f70bab0-de3c-47f1-8f3f-8f74dd337de2','Australian_Holidays','2006-12-27 06:00:00','2006-12-28 06:00:00','Public Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('0f7c020d-1c3c-42e9-ae23-35fb85e26735','China_Holidays','2007-03-08 06:00:00','2007-03-09 06:00:00','International Women\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('0f82789f-59f9-4ceb-9ca1-38bf8c8ad4a0','Danish_Holidays','2010-02-13 16:00:00','2010-02-14 16:00:00','Fastelavn (Shrovetide)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0f9dfe86-7560-45e5-802d-d2f771599b5c','Jewish_Holidays','2010-12-02 16:00:00','2010-12-03 16:00:00','Chanukah: 3 Candles',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0facbc36-5caf-4004-b063-ffbb02dca8ad','German_Holidays','2004-02-22 06:00:00','2004-02-23 06:00:00','Fasching',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('0faf7004-a803-4b36-9e0f-9ab5697626ab','Taiwan_Holidays','2009-10-21 05:00:00','2009-10-22 05:00:00','Overseas Chinese Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('0fb490e6-6df9-4e97-ba77-770a294b0f2b','Indonesian_Holidays','2007-08-17 05:00:00','2007-08-18 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:45',''),('0fbbd601-223b-4fcf-a612-4243a52a188e','Italian_Holidays','2003-06-02 05:00:00','2003-06-03 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('0fc8c993-c3de-4006-a14f-63a1cb6b8292','Norwegian_Holidays','2010-07-29 05:00:00','2010-07-30 05:00:00','Olsok',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('0fdbce9a-0b14-4d6b-bc79-995dca1a2be2','Hong_Kong_Holidays','2009-04-11 05:00:00','2009-04-12 05:00:00','Day following Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('0fe5b867-538a-416e-a493-464ef923c4bc','US_Holidays','2007-02-19 06:00:00','2007-02-20 06:00:00','President\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('0ff47d0c-35db-427f-8acb-0c75b2c23717','Jewish_Holidays','2009-10-17 16:00:00','2009-10-18 16:00:00','Rosh Chodesh Cheshvan',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('0ff63341-d7e5-45a3-af17-5fec51b620b3','Irish_Holidays','2010-04-01 16:00:00','2010-04-02 16:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('0ff67501-d9ad-4e7d-a202-c46a5baa32e4','Spain_Holidays','2009-04-04 16:00:00','2009-04-05 16:00:00','Domingo de Ramos (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1005a25d-1676-400a-b4a0-a558e4b1a882','Austrian_Holidays','2002-12-26 06:00:00','2002-12-27 06:00:00','Stefanitag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('100f8fc0-b01f-4e9c-bc61-a92e68efaf50','Mexican_Holidays','2002-05-05 05:00:00','2002-05-06 05:00:00','Cinco de Mayo',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('1017eb34-f6b8-4bec-82e0-96ec626b528a','Portuguese_Holidays','2010-05-01 05:00:00','2010-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('10235172-9b0a-457f-adab-8cf11ec15de3','Austrian_Holidays','2007-01-06 06:00:00','2007-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('102c6600-6e5c-4dd6-a5ab-fdac986bcee9','China_Holidays','2003-10-01 05:00:00','2003-10-02 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('103cdd8e-0211-40fd-ba8e-5b7441c30693','US_Holidays','2011-02-13 16:00:00','2011-02-14 16:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('108a9b55-1505-4608-ad0a-14ee8cbcf701','Jewish_Holidays','2010-02-27 16:00:00','2010-02-28 16:00:00','Purim',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('109a06c3-c6e5-4eaa-affa-2924d7a58460','French_Holidays','2010-08-15 05:00:00','2010-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('109cee74-9505-487b-9a6a-acea9b508287','Jewish_Holidays','2009-10-05 16:00:00','2009-10-06 16:00:00','Sukkot IV (CH\'\'M)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('10a8ee39-8849-499a-b900-33c113e61a80','Christain_Holidays','2010-10-23 05:00:00','2010-10-24 05:00:00','Creation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('10b16c96-b358-4594-a653-6761a61dc8f5','Japanese_Holidays','2004-12-23 06:00:00','2004-12-24 06:00:00','The Emperor\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('10ba53df-debe-4d12-b62c-78776e1af53f','Taiwan_Holidays','2009-12-25 06:00:00','2009-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('10ba9442-9ca3-4089-a6d9-a9be635d068a','Jewish_Holidays','2007-12-18 16:00:00','2007-12-19 16:00:00','Asara B\'Tevet',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('10be74ee-9364-431c-9035-b7be76744b37','South_Korean_Holidays','2011-09-10 16:00:00','2011-09-13 16:00:00','추석',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('10d782d9-158e-4247-b69d-7ed2cb6fbcc2','Spain_Holidays','2007-08-15 05:00:00','2007-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('10dd40e3-c6cb-447a-9e85-e70f3d3149d6','German_Holidays','2011-12-03 16:00:00','2011-12-04 16:00:00','2. Advent (Second Sunday of Advent)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('10ee953e-c620-4b0a-baf7-cb64935f7551','US_Holidays','2008-10-13 05:00:00','2008-10-14 05:00:00','Columbus Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('10f21400-e0d0-4d0b-a775-3774542fb93c','Dutch_Holidays','2010-05-23 16:00:00','2010-05-24 16:00:00','2e Pinksterdag (Whit Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('10f9313a-44d3-47e1-a049-1a8f579197e2','Spain_Holidays','2010-01-06 06:00:00','2010-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('1112945c-5ee1-43b0-81f7-22cf897d69f1','Jewish_Holidays','2008-04-26 16:00:00','2008-04-27 16:00:00','Pesach VIII',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11202d11-ebf1-4d9e-995b-8797473376b7','Portuguese_Holidays','2006-10-05 05:00:00','2006-10-06 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('112a8e9e-4bc1-4083-95cc-42bb61cf10cf','Canadian_Holidays','2004-01-02 06:00:00','2004-01-03 06:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('112c9b78-3f88-451c-873f-df4672a5f880','US_Holidays','2011-02-01 16:00:00','2011-02-02 16:00:00','Groundhog Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1140c9d9-c964-4254-ba6b-a029f1255afa','German_Holidays','2010-10-02 16:00:00','2010-10-03 16:00:00','Tag der Deutschen Einheit (German Reunification)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11478338-9cfe-4dda-9ded-2a3dd6f42340','Indian_Holidays','2007-10-02 05:00:00','2007-10-03 05:00:00','Mahatma Gandhi\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('1158aa08-646a-4fbd-8625-0192d954b59d','Thai_Holidays','2004-04-15 05:00:00','2004-04-16 05:00:00','Songkran Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('116c071b-dd69-4534-81d5-ac174c1a7dbb','Jewish_Holidays','2011-04-18 16:00:00','2011-04-19 16:00:00','Pesach I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1170686b-8d4a-4236-b3b0-f84ab26224c5','Canadian_Holidays','2007-03-17 05:00:00','2007-03-18 05:00:00','St. Patrick\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('117072b5-cd48-4b3e-8623-7b0f2c15e668','Jewish_Holidays','2007-02-02 16:00:00','2007-02-03 16:00:00','Tu B\'Shvat',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11834cdf-28e2-4fdd-97f2-b973800711bf','Norwegian_Holidays','2009-02-05 16:00:00','2009-02-06 16:00:00','Samefolkets dag (Sami National Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1194839f-2ae5-47d1-b6b8-a99c93f77209','Irish_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('119b28f1-1738-425a-9dd6-1ea79d1ca405','Malaysian_Holidays','2007-07-20 05:00:00','2007-07-21 05:00:00','Sultan Of Terengganu\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('11a866ec-3b33-497e-9e35-9785d55f342f','German_Holidays','2010-05-12 16:00:00','2010-05-13 16:00:00','Vatertag (Father\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11ba9eb6-5bb9-461f-bca3-ed20d2194ddb','Japanese_Holidays','2006-09-18 05:00:00','2006-09-19 05:00:00','Respect for the Aged Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('11bda0df-8139-457e-b71e-06c20b85619f','Norwegian_Holidays','2011-04-20 16:00:00','2011-04-21 16:00:00','SkjÃ¦rtorsdag (Maundy Thursday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11c9550d-c920-4d61-8dd0-7e3a7e329879','Canadian_Holidays','2005-09-05 05:00:00','2005-09-06 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('11e0612e-e2b3-441b-a295-51b927127bbb','UK_Holidays','2009-10-25 05:00:00','2009-10-26 05:00:00','British Summer Time Ends',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('11e3a38e-e9cf-483a-817b-3c472ae5fd45','Polish_Holidays','2006-12-26 06:00:00','2006-12-27 06:00:00','Second Day of Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('11e4ca17-16ca-459d-a28d-70baada410ba','US_Holidays','2006-03-17 06:00:00','2006-03-18 06:00:00','St. Patrick\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('11ec2af4-fdd3-40d3-ba47-eb44e3175157','South_Korean_Holidays','2001-12-31 16:00:00','2002-01-01 16:00:00','신정',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('11edcef3-2799-4f0e-8deb-06d1e34652ec','Dutch_Holidays','2002-05-05 05:00:00','2002-05-06 05:00:00','Bevrijdingsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('11fb1114-3a90-4427-893a-7d72da78427c','Spain_Holidays','2010-02-15 16:00:00','2010-02-16 16:00:00','Carnaval (Carnival)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1233deb1-40c2-4907-86d5-8226a3718728','Malaysian_Holidays','2006-05-07 05:00:00','2006-05-08 05:00:00','Hol Day Pahang*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('1233e40e-256a-4cc6-be6d-e4f5b97b3509','China_Holidays','2003-01-01 06:00:00','2003-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('123f6e75-9675-4d13-94af-856fbb3e66eb','Jewish_Holidays','2009-04-15 16:00:00','2009-04-16 16:00:00','Pesach VIII',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('124a26eb-2257-474f-96fc-b6424a5051d2','Brazilian_Holidays','2006-11-15 06:00:00','2006-11-16 06:00:00','Proclamation of the Republic',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('124b9ae2-569f-45d4-a22b-67f7dd01ae21','Jewish_Holidays','2008-10-21 16:00:00','2008-10-22 16:00:00','Simchat Torah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('12516197-5772-4688-8e99-0446e2832368','Brazilian_Holidays','2005-04-21 05:00:00','2005-04-22 05:00:00','Tiradentes Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('12568764-9209-4709-a1c0-0c3773391829','US_Holidays','2007-02-12 06:00:00','2007-02-13 06:00:00','Lincoln\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1256fc20-af33-4741-8c22-10fef64d1327','US_Holidays','2002-07-04 05:00:00','2002-07-05 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('125974c6-bca6-4fbb-8aa8-b36b928f74cc','Japanese_Holidays','2005-01-01 06:00:00','2005-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('1259fc5a-7355-4f43-9231-94f9927ddfe7','Japanese_Holidays','2004-11-03 06:00:00','2004-11-04 06:00:00','Culture Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('125e5537-5fff-42de-a302-17b6cc4f290e','South_Korean_Holidays','2009-07-17 05:00:00','2009-07-18 05:00:00','Constituton Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('126c76a2-767b-46f9-b11a-51df00846f46','UK_Holidays','2002-05-06 05:00:00','2002-05-07 05:00:00','May Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('127146fc-92ed-414f-bfeb-c6c1b14d98bf','Polish_Holidays','2006-05-01 05:00:00','2006-05-02 05:00:00','State Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('127508a2-af5d-4520-87cd-5840c6253540','Spain_Holidays','2012-02-20 16:00:00','2012-02-21 16:00:00','Carnaval (Carnival)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('128396db-82a2-46e4-8d07-b02c6b602ec0','Norwegian_Holidays','2003-01-01 06:00:00','2003-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('128f31d4-e733-4b33-a40c-e74fabffc492','Hong_Kong_C_Holidays','2005-02-08 16:00:00','2005-02-09 16:00:00','農曆年初一',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1298ebc7-6f0f-48a8-9155-65bac82da62c','French_Holidays','2010-11-01 05:00:00','2010-11-02 05:00:00','All Saints Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('129f12f1-2eeb-42fc-8df4-d74428a86931','Indian_Holidays','2007-08-15 05:00:00','2007-08-16 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('12afd4e3-7561-4591-a56b-dc6e6bad223c','UK_Holidays','2008-02-14 06:00:00','2008-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('12ba7597-a504-435b-8d2e-e3c9d6f93cad','Spain_Holidays','2008-03-19 05:00:00','2008-03-20 05:00:00','San Jose',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('12c85fa7-b678-4993-8d4a-4bc127c9fa76','Japanese_Holidays','2017-03-19 16:00:00','2017-03-20 16:00:00','春分の日 (Vernal Equinox)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('12cbd6ac-7dcb-42de-a959-7738dc60145e','Taiwan_Holidays','2008-02-28 06:00:00','2008-02-29 06:00:00','Peace Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('12d26192-eee9-4d1a-a0f5-42b5c6dd3e20','South_Korean_Holidays','2008-10-01 05:00:00','2008-10-02 05:00:00','Soldier\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('12e39c20-2cc8-4386-aa01-c68d65c8e839','South_Africa_Holidays','2010-08-09 05:00:00','2010-08-10 05:00:00','National Woman\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('12e46e14-3e0a-4640-9c02-e02e21df7fdb','Italian_Holidays','2005-01-06 06:00:00','2005-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('12fb53fb-04e0-4528-947b-441d0ac03c69','Christain_Holidays','2006-10-02 05:00:00','2006-10-03 05:00:00','Feast of the Gaurdian Angels',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('13025386-6f7b-48b3-b6b9-d9862bdb8510','Malaysian_Holidays','2008-04-19 05:00:00','2008-04-20 05:00:00','Sultan Of Perak\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('13053ee8-b2d4-4d34-8bf1-0012b2c7e9de','Japanese_Holidays','2019-05-05 16:00:00','2019-05-06 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('130e718b-7229-4600-a62d-022663f17d89','Norwegian_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('133633ea-e82c-4fd5-b9f9-a1d7ed277db8','Norwegian_Holidays','2009-02-20 16:00:00','2009-02-21 16:00:00','H.M. Kong Harald Vs fÃ¸dselsdag (H.M. King Harald V\'s Birthday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('134bf614-f396-45ad-9f4d-cddd91e21e19','Mexican_Holidays','2011-12-24 16:00:00','2011-12-25 16:00:00','Navidad',NULL,'Días Festivos en México (2010-2012)','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1362cfc3-7b6b-4e23-ae46-481867ff6d84','Hong_Kong_Holidays','2007-06-17 05:00:00','2007-06-18 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('136b5423-77af-40e8-9486-433fb6d0af37','South_Korean_Holidays','2008-06-06 05:00:00','2008-06-07 05:00:00','Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('1387b5cb-581e-45fe-a89f-4fd58285e55a','UK_Holidays','2010-03-01 06:00:00','2010-03-02 06:00:00','St. David\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('1389d132-ba59-4c26-8844-aea8e18920d3','Jewish_Holidays','2011-01-19 16:00:00','2011-01-20 16:00:00','Tu B\'Shvat',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('139ce17a-fa21-44bc-b8b6-390aa6168de6','US_Holidays','2008-02-02 06:00:00','2008-02-03 06:00:00','Groundhog Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('139e30b2-6b1a-4ded-a41d-d2655630c4fd','Jewish_Holidays','2009-07-21 16:00:00','2009-07-22 16:00:00','Rosh Chodesh Av',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('13ae93cf-f1cc-4019-96e3-1a84277b8b7e','Spain_Holidays','2011-04-24 16:00:00','2011-04-25 16:00:00','Lunes de Pascua (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('13ddef8a-2590-4010-8545-e287352dcd97','South_Africa_Holidays','2005-12-16 06:00:00','2005-12-17 06:00:00','Day of Reconciliation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('13e2e2ca-5419-4aa0-bec9-2a554712cad5','Greek_Holidays','2009-03-25 05:00:00','2009-03-26 05:00:00','Greek Independence Day & Annunciation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('13ee7f43-af75-43e1-acb8-dba20fe91255','Russian_Holidays','2009-02-23 06:00:00','2009-02-24 06:00:00','Defender of the Fatherland Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('1408fa60-5865-4bda-82df-a46bdcb03d95','US_Holidays','2008-12-24 06:00:00','2008-12-25 06:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('14213e41-8715-421e-806d-243efd9776dc','Swedish_Holidays','2006-12-25 06:00:00','2006-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:28:11',''),('1431642b-1170-4a8b-a2ca-d741d1199111','UK_Holidays','2002-12-26 06:00:00','2002-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('144797b3-392b-4488-856c-bc7bdabb7129','Philippines_Holidays','2008-01-01 06:00:00','2008-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('1452ed5c-bc7d-45c1-8367-53c55bdde820','Christain_Holidays','2006-01-06 06:00:00','2006-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('1465744c-cb48-4b56-8c90-c4742caa5572','Hong_Kong_C_Holidays','2010-02-13 16:00:00','2010-02-14 16:00:00','農曆年初一',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('14839cc4-379d-4ae2-b6f8-b4484643ce79','Jewish_Holidays','2009-04-08 16:00:00','2009-04-09 16:00:00','Pesach I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1484d891-bcac-41d9-b16a-b436c30e8218','Finnish_Holidays','2009-05-09 16:00:00','2009-05-10 16:00:00','Äitienpäivä (Mother\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('148665b6-075b-4d3b-900f-832afe938eb2','Jewish_Holidays','2008-08-08 16:00:00','2008-08-09 16:00:00','Shabbat Hazon',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1488b434-4395-4034-90b9-79ba846b282e','Thai_Holidays','2010-12-31 06:00:00','2011-01-01 06:00:00','New Year\'s Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('14976232-d535-4832-8b1b-441fb4167794','Portuguese_Holidays','2006-01-01 06:00:00','2006-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('1497ec93-eea5-4146-b12e-b0b031d447a5','US_Holidays','2007-03-11 06:00:00','2007-03-12 05:00:00','Daylight Saving Time Begins',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('149aa3e3-166f-438b-b61b-bb56406760b7','Islamic_Holidays','2010-09-05 16:00:00','2010-09-06 16:00:00','Laitaltul-Qadr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-08-14 08:59:13','\0'),('14adfd6e-0d08-44bb-b151-fd5763a7bcc9','Jewish_Holidays','2007-12-03 16:00:00','2007-12-04 16:00:00','Chanukah: 1 Candle',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('14c869ff-bd97-457f-b2e2-6bfb72c7704b','Hong_Kong_C_Holidays','2006-12-26 06:00:00','2006-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('14ddfbda-e1e6-4f16-8224-08f28ac180dc','US_Holidays','2008-03-17 05:00:00','2008-03-18 05:00:00','St. Patrick\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('14df2a19-947c-4872-b0dc-bfb6cb7700da','Jewish_Holidays','2007-02-18 16:00:00','2007-02-19 16:00:00','Rosh Chodesh Adar',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('14e1e802-3a4e-4944-9c01-16898553a185','Austrian_Holidays','2009-12-25 06:00:00','2009-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:45',''),('150132c7-3431-4d71-be30-88285c64c019','Finnish_Holidays','2012-06-21 16:00:00','2012-06-22 16:00:00','Juhannusaatto (Midsummer Eve)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1506052f-940a-4fb6-a37d-d2b60aadb515','Jewish_Holidays','2011-10-19 16:00:00','2011-10-20 16:00:00','Shmini Atzeret',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1508a3b7-a77d-455e-bbd8-5900e633515b','Portuguese_Holidays','2010-10-05 05:00:00','2010-10-06 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('1524abbf-672f-45f3-9db5-74e47fc35fe8','Canadian_Holidays','2010-08-02 05:00:00','2010-08-03 05:00:00','Civic Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('152e8ec4-64e2-4a9c-a4f8-e33050a16011','Hong_Kong_C_Holidays','2008-10-01 05:00:00','2008-10-02 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('152f7e30-c1e7-4aee-8baa-361f54b9c0e9','Philippines_Holidays','2012-04-04 16:00:00','2012-04-05 16:00:00','Maundy Thursday (Holy Thursday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('15349682-dbfb-4e17-a21e-94bf9b26973b','Italian_Holidays','2008-12-08 06:00:00','2008-12-09 06:00:00','Immaculate Conception',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('153de76c-0fe8-48dd-ae56-056b58fdb23d','Philippines_Holidays','2010-03-28 05:00:00','2010-03-29 05:00:00','Palm Sunday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('15436db0-8dd3-4d1f-a80d-b04dfe91343f','Finnish_Holidays','2011-04-24 16:00:00','2011-04-25 16:00:00','2. pääsiäispäivä (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('154e3076-fa9f-4609-9801-3fc9684889bf','Jewish_Holidays','2010-09-22 16:00:00','2010-09-23 16:00:00','Sukkot I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1598d3dc-bf25-4cc3-9601-6ed99db62b55','Dutch_Holidays','2005-12-26 06:00:00','2005-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('159cd157-779c-41ea-9722-f7333768680a','Polish_Holidays','2008-01-21 06:00:00','2008-01-22 06:00:00','Grandma\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('15c32f11-89f4-4c18-9c58-2f6ff8d8c7e4','Thai_Holidays','2002-04-06 06:00:00','2002-04-07 06:00:00','Chakri Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('15c98a95-71e4-4d9d-b604-28ef665a685d','China_Holidays','2009-02-15 16:00:00','2009-02-16 16:00:00','President\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('15df83ec-5200-4249-b3c4-80d0fdd001a5','Finnish_Holidays','2009-10-09 16:00:00','2009-10-10 16:00:00','Aleksis Kiven päivä (The Day of Finnish Literature)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('15ea519d-3461-4f5d-92fd-a14eecab8cc1','Taiwan_Holidays','2010-03-17 05:00:00','2010-03-18 05:00:00','Earth God\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('16000a0b-160e-4c0b-b17b-6e0b28e36855','Greek_Holidays','2007-10-28 05:00:00','2007-10-29 05:00:00','Ochi Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('1610919d-1141-43bf-87d3-3ea54934688d','Islamic_Holidays','2008-01-18 16:00:00','2008-01-19 16:00:00','Ashurah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('162a20cb-7352-48c9-87b4-85f271b640d6','Greek_Holidays','2010-11-17 06:00:00','2010-11-18 06:00:00','Polytechneio Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('1647084a-696a-40d4-a4ae-c39c31be8cc2','Thai_Holidays','2007-04-14 05:00:00','2007-04-15 05:00:00','Songkran Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('164998c6-309d-47f4-a595-6ac0291f1aa9','Christain_Holidays','2009-04-11 05:00:00','2009-04-12 05:00:00','Holy Week',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('165c0524-efdc-4903-b1da-70c87a4f69a0','China_Holidays','2009-04-04 05:00:00','2009-04-05 05:00:00','Qingming Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('1664692d-3ab3-4ac7-8b7e-bb14cc59c428','Hong_Kong_Holidays','2004-05-01 05:00:00','2004-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('1666eb88-b132-4b46-89b0-885395c40142','South_Korean_Holidays','2005-08-15 05:00:00','2005-08-16 05:00:00','Liberation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('1688630f-50fc-42e6-b105-ac89d76a32fa','Austrian_Holidays','2009-04-05 05:00:00','2009-04-06 05:00:00','Palm Sunday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('169d279c-315b-4904-95e8-30223857fa39','New_Zealand_Holidays','2004-02-06 06:00:00','2004-02-07 06:00:00','Waitangi Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('169d5216-62ae-4083-9938-cb884d21ed68','Taiwan_Holidays','2010-04-03 05:00:00','2010-04-04 05:00:00','Kuan Yin\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('16a51697-e78e-4d99-bf6f-5ad8f1b709b2','Australian_Holidays','2004-04-25 05:00:00','2004-04-26 05:00:00','ANZAC Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('16a9ddc7-8eba-486e-8848-05c824f44438','Dutch_Holidays','2004-11-11 06:00:00','2004-11-12 06:00:00','Sint Maarten',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('16bea136-87b0-45f1-bcb2-9ba266d66aac','US_Holidays','2003-05-11 05:00:00','2003-05-12 05:00:00','Mother\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('16cb8db9-c217-48c7-aa3d-e7a7ab04cecd','Mexican_Holidays','2007-06-17 05:00:00','2007-06-18 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('16dea5e4-36c5-40ce-bdea-edd1eccf3075','Swedish_Holidays','2009-10-30 16:00:00','2009-10-31 16:00:00','⚑Alla helgons dag (All Saints Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1706a6b6-26ce-4b12-9ded-6981aad4fe62','German_Holidays','2009-12-24 16:00:00','2009-12-25 16:00:00','1. Weihnachtstag (Christmas Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('170fb935-9b8e-45df-a81c-8d456d91b76c','Canadian_Holidays','2007-07-01 05:00:00','2007-07-02 05:00:00','Canada Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('17685732-a58e-450a-ac31-41b62a27796c','Vietnamese_Holidays','2003-01-01 06:00:00','2003-01-02 06:00:00','New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('1768c26d-1e11-4047-bbd8-1ed61d386395','Italian_Holidays','2004-06-02 05:00:00','2004-06-03 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('176b4d57-7da7-449b-8913-93522eb5af06','Indian_Holidays','2005-10-02 05:00:00','2005-10-03 05:00:00','Mahatma Gandhi\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-06 11:55:21',''),('17727c02-03cd-4b0d-8b13-d4132d1d0986','China_Holidays','2009-02-01 16:00:00','2009-02-02 16:00:00','Groundhog Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('178b3cd1-f593-4c49-adc9-0f39986f12f2','South_Africa_Holidays','2011-04-21 16:00:00','2011-04-22 16:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('179b8a52-dfe9-4b94-a3b7-ffe7a0249a69','Norwegian_Holidays','2004-12-25 06:00:00','2004-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('179dd236-9120-412a-bd95-f36ef2910d1f','Norwegian_Holidays','2004-02-21 06:00:00','2004-02-22 06:00:00','Kong Haralds fødselsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('17ac8275-bb52-42a9-80f8-a1c79a14babb','Hong_Kong_Holidays','2003-04-17 16:00:00','2003-04-18 16:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('17af2da0-a916-4121-862f-a57dac0e755c','German_Holidays','2010-05-12 16:00:00','2010-05-13 16:00:00','Christi Himmelfahrt (Ascension Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('17c98622-33e0-4279-b0c1-88b6f3aa6569','French_Holidays','2004-11-11 06:00:00','2004-11-12 06:00:00','Anniversaire de l’Armistice',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('17d7616b-b542-4e52-aeda-2cd5bcd071f9','Japanese_Holidays','2027-09-22 16:00:00','2027-09-23 16:00:00','秋分の日 (Autumnal Equinox)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('17dab94a-a0ab-4933-9925-ddc6fe655ecd','Thai_Holidays','2006-01-01 06:00:00','2006-01-02 06:00:00','New Year Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('17ec48f8-d253-479d-a964-8a8340235aec','Mexican_Holidays','2009-06-21 05:00:00','2009-06-22 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('17fa5a68-f848-4137-a806-4f03e78e1075','Polish_Holidays','2010-05-01 05:00:00','2010-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('17fc1e10-0a37-455a-ae19-05e92fafc2ea','Taiwan_Holidays','2006-01-01 06:00:00','2006-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('17fd4915-1a1d-4402-8760-b2678235b375','New_Zealand_Holidays','2006-01-01 06:00:00','2006-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('181eda6f-a324-4157-9969-5e5b1638e64e','French_Holidays','2004-12-25 06:00:00','2004-12-26 06:00:00','Noël',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('1820d949-9256-4044-92a1-a3969bf42401','US_Holidays','2006-04-02 06:00:00','2006-04-03 05:00:00','Daylight Saving Time Begins',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('18385847-e525-4fc3-a92b-082475de8c10','Italian_Holidays','2003-08-15 05:00:00','2003-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('187bd50f-65de-4781-9cc9-a1908f4ea71e','Jewish_Holidays','2011-12-19 16:00:00','2011-12-20 16:00:00','Chanukah: 1 Candle',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('187ecaeb-53a5-4788-9f99-ce17a939bf81','Taiwan_Holidays','2009-03-15 05:00:00','2009-03-16 05:00:00','Kuan Yin\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('18819103-3c93-4202-9be2-eab61493cf65','Taiwan_Holidays','2008-02-14 06:00:00','2008-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('18970f7c-49ef-4481-bc58-a66e59079148','Danish_Holidays','2012-02-18 16:00:00','2012-02-19 16:00:00','Fastelavn (Shrovetide)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('189fc2af-bb7e-4bc5-bbbf-977b4bd4dc77','Japanese_Holidays','2006-12-23 06:00:00','2006-12-24 06:00:00','The Emperor\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('18b53c28-cb55-458c-aef7-7e9612feaff9','French_Holidays','2010-04-03 16:00:00','2010-04-04 16:00:00','Pâques (Easter)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('18d0d7d9-59f9-40e4-ba9b-f46dbe6efafa','Jewish_Holidays','2008-05-04 16:00:00','2008-05-05 16:00:00','Rosh Chodesh Iyyar',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('18d46536-c0a2-4ced-9c7a-a08026f2cd5c','New_Zealand_Holidays','2005-02-06 06:00:00','2005-02-07 06:00:00','Waitangi Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('18d76c09-c4d1-42dc-8bbe-c96662c5e6bf','Mexican_Holidays','2007-01-01 06:00:00','2007-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('18df5e6a-bac7-4202-9538-b831985e421d','New_Zealand_Holidays','2008-01-28 06:00:00','2008-01-29 06:00:00','Auckland Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('18e18f7b-9623-4f15-8d5b-1732cc391629','Australian_Holidays','2006-01-26 06:00:00','2006-01-27 06:00:00','Australia Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('18e225a7-6d60-49c6-966a-0725c838c3bb','Jewish_Holidays','2007-04-04 16:00:00','2007-04-05 16:00:00','Pesach III (CH\'\'M)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('18e455d0-7310-4e09-ba70-8b9f32e88f49','Italian_Holidays','2009-12-25 16:00:00','2009-12-26 16:00:00','S. Stefano (St. Stephen\'s Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('18ecdcc9-c204-4dd4-903c-b854a047bdc1','US_Holidays','2002-06-14 05:00:00','2002-06-15 05:00:00','Flag Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('18f1fcc1-b919-4257-928d-347f5f56a75e','Jewish_Holidays','2011-09-30 16:00:00','2011-10-01 16:00:00','Shabbat Shuva',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('190517a9-a80e-4b24-ab49-4063b4e0ae94','French_Holidays','2010-05-22 16:00:00','2010-05-23 16:00:00','Pentecôte (Whit Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1905b7cb-f5a3-4f2d-a128-afde468295be','Canadian_Holidays','2002-04-28 05:00:00','2002-04-29 05:00:00','Day of Mourning for Persons Killed or Injured in the Workplace',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('19156f76-2ea1-4c90-bd85-3dfa50536295','Brazilian_Holidays','2002-08-15 05:00:00','2002-08-16 05:00:00','Assumption',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('1928263c-954d-4b7f-bbe8-52a8b1e4c788','Japanese_Holidays','2012-09-21 16:00:00','2012-09-22 16:00:00','秋分の日 (Autumnal Equinox)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('19290dd2-86f1-4d72-ad32-2637a53273c0','German_Holidays','2011-06-01 16:00:00','2011-06-02 16:00:00','Christi Himmelfahrt (Ascension Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('192db8a2-3c4f-40d6-9512-1485db0f0632','Hong_Kong_C_Holidays','2004-06-21 16:00:00','2004-06-22 16:00:00','端午節',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('193d938d-e87e-4507-bc6c-0b65fb0f292a','Taiwan_Holidays','2010-05-21 05:00:00','2010-05-22 05:00:00','Buddha\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('193da74a-0f30-4dda-97dc-275488d1697e','New_Zealand_Holidays','2010-02-22 06:00:00','2010-02-23 06:00:00','Wellington Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('19473732-13b0-4a19-bb7a-0d828b95cd7c','Taiwan_Holidays','2010-06-03 05:00:00','2010-06-04 05:00:00','Opium Suppression Movement Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('1956de92-101d-4674-8350-a9fe42e61940','Christain_Holidays','2010-02-16 06:00:00','2010-02-17 06:00:00','Mardi Gras',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('195951db-77a8-493c-ae0f-ea8c90024e9c','Australian_Holidays','2005-11-01 06:00:00','2005-11-02 06:00:00','Melbourne Cup Day [VIC]',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('196704a2-f79f-4eb3-ad53-de724b965bcd','South_Africa_Holidays','2009-12-16 06:00:00','2009-12-17 06:00:00','Day of Reconciliation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('19712f27-eaf6-42ad-9c1f-cbdc4644c27a','China_Holidays','2008-05-11 05:00:00','2008-05-12 05:00:00','Mother\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('197291a9-a924-42f9-8aea-398312ab3cc6','Danish_Holidays','2011-04-16 16:00:00','2011-04-17 16:00:00','Palmesøndag (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('197d2d6c-1073-4d7c-af2b-3bae6b09d2b6','Italian_Holidays','2011-04-24 16:00:00','2011-04-25 16:00:00','Lunedì dell\'Angelo (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('19814df2-1a4e-4894-a04f-fac4b216f0df','UK_Holidays','2003-10-31 06:00:00','2003-11-01 06:00:00','Halloween',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('198be523-b805-4376-a9e4-d12b675513d9','Spain_Holidays','2012-04-05 16:00:00','2012-04-06 16:00:00','Viernes Santo (Holy Friday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('199a9586-d823-4a5d-910d-0a7141f8d20c','Philippines_Holidays','2006-12-31 06:00:00','2007-01-01 06:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('199f6bbb-1014-4877-bd49-b6ddaac037fd','Irish_Holidays','2008-05-05 05:00:00','2008-05-06 05:00:00','May Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('19ab86ce-f327-4777-a85b-10a806907f29','Hong_Kong_C_Holidays','2003-07-01 05:00:00','2003-07-02 05:00:00','HK SAR Establishment Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('19b16a24-ece0-4136-9e4a-407420944d7f','Japanese_Holidays','2007-11-23 06:00:00','2007-11-24 06:00:00','Labour Thanksgiving Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('19cb6c72-99c4-4d9d-be02-3e9465b59e5d','Polish_Holidays','2009-12-24 06:00:00','2009-12-25 06:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('19d41171-9ea1-477c-9d99-67c8731a92c0','Philippines_Holidays','2010-12-30 06:00:00','2010-12-31 06:00:00','Rizal Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('19d93cbc-f850-4600-9dab-9db081c07b5e','Hong_Kong_C_Holidays','2005-05-15 16:00:00','2005-05-16 16:00:00','佛誕補假',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('19da1eef-0890-4e2c-8416-1a817af7b308','Brazilian_Holidays','2010-11-02 05:00:00','2010-11-03 05:00:00','All Souls\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('19e3d8e9-023a-48e3-94ce-daa42f5032d0','Danish_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('19e7529d-1f7c-40e1-ade6-32b7200eb22d','Norwegian_Holidays','2002-01-01 06:00:00','2002-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('1a0327be-bc12-4056-a036-e66f00e1cee2','Portuguese_Holidays','2003-12-25 06:00:00','2003-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('1a0efd4a-a4be-4327-8c2e-4d440315f891','Austrian_Holidays','2010-01-06 06:00:00','2010-01-07 06:00:00','Epiphany',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('1a17037b-4ad6-4302-9dbb-bdd78caaf4fb','Malaysian_Holidays','2004-09-11 05:00:00','2004-09-12 05:00:00','Yang Di-Pertua of Sarawak\'s Birthday*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('1a177f70-12b0-4e59-9174-bf5ccea381a9','Portuguese_Holidays','2008-11-01 05:00:00','2008-11-02 05:00:00','All Saints Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:23:07',''),('1a197479-94be-4fdd-929b-bec7dfb41206','Christain_Holidays','2007-03-25 05:00:00','2007-03-26 05:00:00','Annunciation',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('1a1c8bd0-39f1-427e-822e-7441f9cc3476','Finnish_Holidays','2009-12-05 16:00:00','2009-12-06 16:00:00','Itsenäisyyspäivä (Independece Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1a3a3621-8dac-426c-9c61-e9c653356fcb','New_Zealand_Holidays','2008-01-01 06:00:00','2008-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('1a3e127c-c324-4c6c-80d0-75d8eb487ac6','Norwegian_Holidays','2009-05-31 16:00:00','2009-06-01 16:00:00','2. pinsedag (2nd Pentecost Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1a51e148-5620-4973-b53b-7bcc7dafc902','Jewish_Holidays','2007-02-28 16:00:00','2007-03-01 16:00:00','Ta\'anit Esther',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1a526bff-02b3-41f6-815b-6061f9e75673','China_Holidays','2010-06-16 05:00:00','2010-06-17 05:00:00','Dragon Boat Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('1a559527-78d3-469a-b1ec-2005ada7bf3d','Spain_Holidays','2012-05-16 16:00:00','2012-05-17 16:00:00','Día de la Ascensión (Ascension Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1a78827b-64f1-4786-8794-45821c82ba33','Swedish_Holidays','2004-06-06 05:00:00','2004-06-07 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:28:11',''),('1a7f5eb6-8335-4962-a6d7-21a96cb996a3','Jewish_Holidays','2007-03-19 16:00:00','2007-03-20 16:00:00','Rosh Chodesh Nisan',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1a891e1b-dfef-40b9-9713-e0038d2f260d','New_Zealand_Holidays','2009-10-16 05:00:00','2009-10-17 05:00:00','Hawkes\' Bay Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('1a8cc52f-e164-45ad-b68f-3f49049d4faf','Philippines_Holidays','2007-12-31 06:00:00','2008-01-01 06:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('1a9f6693-a239-491b-80b3-432592249977','Australian_Holidays','2002-12-26 06:00:00','2002-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('1abec287-9c6a-4e07-a0a6-8a8d48d8dabd','Spain_Holidays','2004-11-01 06:00:00','2004-11-02 06:00:00','All Saints',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('1ac9eb7d-2266-4641-b001-93af306f6084','German_Holidays','2002-08-15 05:00:00','2002-08-16 05:00:00','Maria Himmelfahrt',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1addf622-2380-48a2-83d2-4b75e4cbec6f','German_Holidays','2004-02-14 06:00:00','2004-02-15 06:00:00','St. Valentin',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1aec89bc-cad4-4147-8629-031b33d37959','Japanese_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('1af91af9-fce9-422c-ac81-67e0fe731ea2','Italian_Holidays','2005-12-26 06:00:00','2005-12-27 06:00:00','St. Stephen\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('1afa0445-4517-4e95-a6d2-5d46f0d09aad','South_Africa_Holidays','2011-05-24 16:00:00','2011-05-25 16:00:00','Africa Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1aff637a-8d90-4ca5-b062-0ef60eef5704','Hong_Kong_C_Holidays','2005-12-26 16:00:00','2005-12-27 16:00:00','聖誕節補假',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1b082559-9ff8-42aa-8f4a-7a5318f3987a','Finnish_Holidays','2010-12-06 06:00:00','2010-12-07 06:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('1b0d74f4-06ba-485d-ae3a-16e42707bbad','Swedish_Holidays','2006-01-06 06:00:00','2006-01-07 06:00:00','Epiphany - 13th Day of Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:28:11',''),('1b28fcb3-21e1-4d0b-bdb6-e71a596d658c','Danish_Holidays','2006-12-25 06:00:00','2006-12-26 06:00:00','First Day of Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('1b31d2ca-3729-4104-bd67-70e47fefa7bc','Hong_Kong_C_Holidays','2007-04-08 16:00:00','2007-04-09 16:00:00','復活節星期一',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1b351b44-eddc-4d77-b782-ff55de62d0bc','Brazilian_Holidays','2004-12-08 06:00:00','2004-12-09 06:00:00','Immaculate Conception',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('1b3f7ed7-55be-465a-adbe-815d2c1bb296','US_Holidays','2008-12-25 06:00:00','2008-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1b45cb15-444f-4fa0-a795-494a77fed4d3','New_Zealand_Holidays','2009-01-01 06:00:00','2009-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('1b656dde-ea87-4294-9ea8-45237b7a68c0','Islamic_Holidays','2012-11-23 16:00:00','2012-11-24 16:00:00','Ashurah',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1b79b72a-6f81-40bb-acc3-4b7d50908ed9','Islamic_Holidays','2010-07-08 16:00:00','2010-07-09 16:00:00','Isra Me\'raj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-08-14 08:59:14','\0'),('1b7c7127-fd52-4523-bed2-64b48eaeb96c','Polish_Holidays','2010-12-25 06:00:00','2010-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('1b91a26e-bd32-42b6-b6a0-6cfbe46f9d0c','Australian_Holidays','2003-12-26 06:00:00','2003-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('1b9a1462-0b07-49f1-8d39-e41e9adc8011','Dutch_Holidays','2004-04-30 05:00:00','2004-05-01 05:00:00','Koninginnedag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('1b9d71a1-dd23-4c2e-a53d-0ba208380498','Christain_Holidays','2010-08-15 05:00:00','2010-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('1bae2111-3f5b-46ec-b26b-75ed3806d383','Malaysian_Holidays','2006-06-02 05:00:00','2006-06-03 05:00:00','Dayak Festival*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('1bba82f0-c007-4cbf-8bb6-3096a514b328','Norwegian_Holidays','2008-05-17 05:00:00','2008-05-18 05:00:00','Grunnlovsdag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('1bc8ad93-e586-424f-9a7d-0faf78027f3e','Indonesian_Holidays','2004-12-25 06:00:00','2004-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:45',''),('1bcb326f-ae57-4637-9757-65dcf8921547','Irish_Holidays','2006-12-25 06:00:00','2006-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('1bd84e96-c997-4025-aff3-d1f164a5ee70','Spain_Holidays','2012-04-07 16:00:00','2012-04-08 16:00:00','Domingo de Pascua (Easter)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1bffcc60-48f3-403a-b56a-1f30683d6c50','Hong_Kong_Holidays','2005-03-25 16:00:00','2005-03-26 16:00:00','Holy Saturday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c0bbead-7651-43e9-ba8f-3aef5676b4da','Japanese_Holidays','2008-11-03 06:00:00','2008-11-04 06:00:00','Culture Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('1c188cde-c13a-45e5-a16c-76055e837fd9','German_Holidays','2004-02-21 06:00:00','2004-02-22 06:00:00','Fasching',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1c1b1c74-a81f-487a-9516-b6ef0eee051a','Japanese_Holidays','2007-05-04 05:00:00','2007-05-05 05:00:00','Greenery Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:21',''),('1c29766f-c304-45c0-b4ca-7459419ebb6f','Indian_Holidays','2011-12-24 16:00:00','2011-12-25 16:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('1c330603-ab68-415a-b5fe-b326f8200b8b','Hong_Kong_Holidays','2007-07-01 16:00:00','2007-07-02 16:00:00','Bank Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c33538c-a205-4872-91ec-4f4d0d9d89cd','Islamic_Holidays','2005-10-04 16:00:00','2005-10-05 16:00:00','Ramadan',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1c3581e3-f5e2-4405-b1ea-4aed7bf6d660','Canadian_Holidays','2011-10-30 16:00:00','2011-10-31 16:00:00','Halloween',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c38762e-43eb-4384-815a-4da44bd331a7','Brazilian_Holidays','2008-03-08 06:00:00','2008-03-09 06:00:00','International Women\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:08:33',''),('1c3b3e39-cddc-4598-a9eb-1a12ca7c2ec0','Hong_Kong_C_Holidays','2002-05-19 16:00:00','2002-05-20 16:00:00','佛誕',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c5ddfbd-0ab7-4f73-ada1-16cb65d88d4a','Taiwan_Holidays','2011-12-24 16:00:00','2011-12-25 16:00:00','行憲紀念日',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c5e21c5-f00a-4cfa-a20a-a69a48fc5807','China_Holidays','2008-12-20 06:00:00','2008-12-21 06:00:00','Macau Special Administrative Region Establishment Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('1c5e8b37-7d8f-44e2-a772-73d06a64dfa1','Irish_Holidays','2005-05-02 05:00:00','2005-05-03 05:00:00','May Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('1c607823-24c6-47bd-a188-5a4540ff4d3d','South_Korean_Holidays','2008-04-05 05:00:00','2008-04-06 05:00:00','Arbor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('1c68ab93-50bc-4742-bea5-540babbecf7e','US_Holidays','2008-06-15 05:00:00','2008-06-16 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1c704457-a26b-49a1-bdb4-f023e1cfe573','Swedish_Holidays','2010-05-21 16:00:00','2010-05-22 16:00:00','Pingstafton (Whitsun Eve)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c76f585-6f23-45b7-93a3-1a5555e70f22','Greek_Holidays','2006-05-01 05:00:00','2006-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('1c7dcfac-2a12-4883-ad07-0c1f6beafe5b','French_Holidays','2011-06-12 16:00:00','2011-06-13 16:00:00','Lundi de Pentecôte (Whit Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c891c81-2378-4b6b-b270-7e90b11f47dc','Canadian_Holidays','2009-05-18 05:00:00','2009-05-19 05:00:00','Victoria Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('1c8aeb7e-c46b-41e9-87c1-34aa9a5b4aac','Philippines_Holidays','2011-04-20 16:00:00','2011-04-21 16:00:00','Maundy Thursday (Holy Thursday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c8f9cc8-165b-4de7-9df9-5ff7921aaaf4','New_Zealand_Holidays','2010-11-01 05:00:00','2010-11-02 05:00:00','Marlborough Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('1c9013c0-3efc-4ea4-83e1-4be06f5424c4','Hong_Kong_C_Holidays','2004-01-21 16:00:00','2004-01-22 16:00:00','農曆年初一',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1c93d32b-23e7-4be2-9385-1f97eacdf002','Swedish_Holidays','2010-11-05 16:00:00','2010-11-06 16:00:00','⚑Alla helgons dag (All Saints Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1ca45b8f-51a3-4de1-85ef-e45bf585d7a0','Austrian_Holidays','2008-11-01 05:00:00','2008-11-02 05:00:00','All Saints\' Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:45',''),('1cb64e54-b139-4bc7-87db-2cbf063c6f12','Swedish_Holidays','2005-06-06 05:00:00','2005-06-07 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:28:11',''),('1cbbfdb5-9474-49d0-b55e-1e8509cb8cdc','Spain_Holidays','2009-05-30 16:00:00','2009-05-31 16:00:00','Pentecostés (Pentecost)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1cc7f57e-8f10-461a-98b2-990b1216035a','Danish_Holidays','2009-12-23 16:00:00','2009-12-24 16:00:00','Juleaften (Christmas Eve)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1cd289a9-ef6e-4d2e-9e1a-6b4bce912ead','US_Holidays','2009-09-11 05:00:00','2009-09-12 05:00:00','Patriot Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1cd3bea4-d0f5-48b0-8961-40f2ef7ac83b','Vietnamese_Holidays','2006-09-02 05:00:00','2006-09-03 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('1ce5083b-bf56-4f4a-a235-ffaac7f69f55','Jewish_Holidays','2007-04-02 16:00:00','2007-04-03 16:00:00','Pesach I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1d0526fc-2897-43a7-81dc-4b18fb5242e6','Jewish_Holidays','2009-08-19 16:00:00','2009-08-20 16:00:00','Rosh Chodesh Elul',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1d07ffc5-3610-4d15-9293-120834e527be','Mexican_Holidays','2006-09-16 05:00:00','2006-09-17 05:00:00','Independence Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('1d0ec0c7-3c2a-4a63-a468-a60e7cdc6443','Austrian_Holidays','2010-12-24 06:00:00','2010-12-25 06:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('1d12ebf3-0857-4551-a659-edd3d54f888e','Vietnamese_Holidays','2010-05-01 05:00:00','2010-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('1d28ed6b-bd05-4b2d-b1d8-e3ec91023229','German_Holidays','2010-02-16 16:00:00','2010-02-17 16:00:00','Aschermittwoch (Ash Wednesday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1d472b1b-6e9f-42ca-8913-beddf0fa37fe','Hong_Kong_Holidays','2005-12-25 06:00:00','2005-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('1d4f426f-6110-4fac-ac01-fee702dc65ad','Hong_Kong_Holidays','2010-09-23 05:00:00','2010-09-24 05:00:00','Day following the Mid-Autumn Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('1d525063-e180-4a67-a245-79e938ac49e6','Jewish_Holidays','2008-10-13 16:00:00','2008-10-14 16:00:00','Sukkot I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1d587846-de99-4e96-9495-a2260c675ad1','Austrian_Holidays','2009-12-13 06:00:00','2009-12-14 06:00:00','Third Advent',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('1d66601f-35c9-499f-a101-fdd47948b714','Taiwan_Holidays','2004-10-31 05:00:00','2004-11-01 06:00:00','Chiang Kai-shek\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('1d6ac40b-1b7e-4922-8e98-c104a2752976','UK_Holidays','2006-06-18 05:00:00','2006-06-19 05:00:00','Father\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('1d8543e8-f9d2-4554-aaa3-3cde9922da2c','South_Korean_Holidays','2009-03-01 06:00:00','2009-03-02 06:00:00','Independence Movement Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('1d95d1e9-b951-4153-991f-7861f4e7312d','UK_Holidays','2010-02-14 06:00:00','2010-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('1d990e24-3436-4b82-90eb-d4f6c0af483e','Austrian_Holidays','2004-08-15 05:00:00','2004-08-16 05:00:00','Maria Himmelfahrt',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('1d9a6486-37c7-4404-8bac-00b2fe1ef8f7','Jewish_Holidays','2010-12-08 16:00:00','2010-12-09 16:00:00','Chanukah: 8th Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1da9e72d-a6a5-49c6-a3a2-0b690a872f1c','German_Holidays','2004-05-01 05:00:00','2004-05-02 05:00:00','Tag der Arbeit',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1dc3183f-8d33-4319-a1e6-1d56d13aae6e','Philippines_Holidays','2002-12-25 06:00:00','2002-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('1dc36946-d1f5-472a-8abd-64126942bb8a','Danish_Holidays','2012-04-07 16:00:00','2012-04-08 16:00:00','Påskedag (Easter Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1dc5fb5d-c2d5-4fca-adb3-6b5de343e28e','Finnish_Holidays','2003-12-06 06:00:00','2003-12-07 06:00:00','Itsenäisyyspäivä',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('1ddbb788-e46c-4a88-a0b7-29b05e1b3a8a','Taiwan_Holidays','2005-10-10 05:00:00','2005-10-11 05:00:00','Double Tenth Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('1de32a00-67cb-49ae-9319-eb417b32cad0','South_Korean_Holidays','2002-09-19 16:00:00','2002-09-22 16:00:00','추석',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1deb2778-98c0-4d8e-9cf5-195b4f6fb57a','Jewish_Holidays','2007-01-19 16:00:00','2007-01-20 16:00:00','Rosh Chodesh Sh\'vat',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e07d0c5-325e-49b3-b1e6-2594c168204a','Japanese_Holidays','2013-05-05 16:00:00','2013-05-06 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e0b5aa5-7df8-49ac-828f-40119564ee9c','Spain_Holidays','2009-02-23 16:00:00','2009-02-24 16:00:00','Carnaval (Carnival)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e0c50ba-6314-46a7-8c2e-22c0084c85f9','Finnish_Holidays','2003-01-06 06:00:00','2003-01-07 06:00:00','Loppiainen',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:59',''),('1e1b175e-1339-46d5-b546-3785ed853120','Polish_Holidays','2009-12-25 06:00:00','2009-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('1e48cd91-2606-47db-ade3-ea09fc47e11a','China_Holidays','2009-10-30 16:00:00','2009-10-31 16:00:00','Halloween',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e4f3bff-3378-4dc9-b7ee-02dc9610d714','Irish_Holidays','2006-08-07 05:00:00','2006-08-08 05:00:00','August Holiday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:50:09',''),('1e5244f5-6945-4962-b0bf-8837715f195a','Greek_Holidays','2007-12-25 06:00:00','2007-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('1e5965f5-15f7-43d0-a692-a3804bb5a6b5','Danish_Holidays','2009-05-31 16:00:00','2009-06-01 16:00:00','2. pinsedag (Whit Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e6970d2-62c0-4209-b367-0226687a6d66','Jewish_Holidays','2009-10-02 16:00:00','2009-10-03 16:00:00','Sukkot I',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1e6acb5e-48c1-4702-b95a-231474ea6e3b','Spain_Holidays','2010-04-04 16:00:00','2010-04-05 16:00:00','Lunes de Pascua (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1e87c31d-4012-4519-8cd5-4ffeb8466f84','Christain_Holidays','2005-02-08 06:00:00','2005-02-09 06:00:00','Shrove Tuesday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('1e8839fe-0147-4424-bf7a-a9bba8ed2057','German_Holidays','2006-08-15 05:00:00','2006-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1e9f5a48-aea5-4b36-83f1-6693b9338c91','Japanese_Holidays','2009-03-19 16:00:00','2009-03-20 16:00:00','春分の日 (Vernal Equinox)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1ea261b3-c5f4-43b7-8bc3-f57cd36630e4','New_Zealand_Holidays','2007-03-26 05:00:00','2007-03-27 05:00:00','Otago Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('1ea63dcd-cae8-406b-ad65-f7bb6db06d58','Thai_Holidays','2003-12-05 06:00:00','2003-12-06 06:00:00','H.M. The King\'s Birth Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('1ebdedde-3378-4e69-b900-026699cf5f41','Jewish_Holidays','2008-04-04 16:00:00','2008-04-05 16:00:00','Shabbat HaChodesh',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1ee12756-e703-4228-8706-7c58730e496c','Jewish_Holidays','2009-05-21 16:00:00','2009-05-22 16:00:00','Yom Yerushalayim',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1ef0f3e1-70ef-4860-9d43-d6306cccc189','Hong_Kong_C_Holidays','2003-01-31 16:00:00','2003-02-01 16:00:00','農曆年初一',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1ef980cc-5346-44fb-a7ce-2b76f63a9fca','Taiwan_Holidays','2002-03-29 06:00:00','2002-03-30 06:00:00','Youth Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('1efcdecf-e5e0-4926-a818-ab1942351fb5','Dutch_Holidays','2004-04-27 05:00:00','2004-04-28 05:00:00','Z.K.H. Prins Willem-Alexander',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('1f08e047-3851-44f2-953d-f09343f40f26','Japanese_Holidays','2027-03-21 16:00:00','2027-03-22 16:00:00','振替休日 (Substitute Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1f1016ed-a90f-4dc2-b0ff-47133e074d57','US_Holidays','2006-02-02 06:00:00','2006-02-03 06:00:00','Groundhog Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1f1ec4f1-4353-40a9-b4db-2278cc5373d4','Dutch_Holidays','2005-04-30 05:00:00','2005-05-01 05:00:00','Queen\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('1f2665f3-e847-41fb-90f1-6e20ea3e54ab','Canadian_Holidays','2006-02-14 06:00:00','2006-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('1f334f9e-4709-45ec-9949-472fdf783fe2','Canadian_Holidays','2004-04-09 05:00:00','2004-04-10 05:00:00','Good Friday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('1f3c2a7e-220b-45b4-8d57-404d16a904fa','Malaysian_Holidays','2008-05-31 05:00:00','2008-06-01 05:00:00','Harvest Festival*',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:40:53',''),('1f572601-7a44-4254-929e-3d3824da5ddc','Philippines_Holidays','2002-12-30 06:00:00','2002-12-31 06:00:00','Rizal Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('1f5cc239-542d-4c0d-82bd-7b05ed124a68','Danish_Holidays','2003-12-26 06:00:00','2003-12-27 06:00:00','2. juledag',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:51',''),('1f67b783-c45b-4376-bd01-83d58f08e901','Jewish_Holidays','2009-10-06 16:00:00','2009-10-07 16:00:00','Sukkot V (CH\'\'M)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('1f772aab-2a99-4152-8136-45237a662830','Jewish_Holidays','2007-12-04 16:00:00','2007-12-05 16:00:00','Chanukah: 2 Candles',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1f7f29ad-803f-4936-b917-19a58d8bd1bb','Japanese_Holidays','2009-10-11 16:00:00','2009-10-12 16:00:00','体育の日 (Health and Sports Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1f90c3dc-f7c8-4a88-bf00-f36eccc23bf0','Dutch_Holidays','2010-04-01 16:00:00','2010-04-02 16:00:00','Goede Vrijdag (Good Friday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1fa1d844-f968-4e3b-9350-12df46ce3dd3','South_Africa_Holidays','2010-12-25 06:00:00','2010-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:52:11',''),('1fa70624-b52b-48ca-856e-9cc247f77682','US_Holidays','2002-04-07 06:00:00','2002-04-08 05:00:00','Daylight Saving Time Begins',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('1fbb9af5-2036-44c6-b5f4-394a9b374f61','Austrian_Holidays','2009-12-20 06:00:00','2009-12-21 06:00:00','Fourth Advent',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('1fd85f00-a1fc-479d-afaf-28ab4c7b33f8','Danish_Holidays','2010-04-04 16:00:00','2010-04-05 16:00:00','2. påskedag (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('1fe0b4a0-b09e-490e-acc5-3fac7965129b','Mexican_Holidays','2004-05-10 05:00:00','2004-05-11 05:00:00','Mother\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('1fe1d064-4356-465e-8665-6f8ff899031a','German_Holidays','2006-10-03 05:00:00','2006-10-04 05:00:00','German Reunification Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:02',''),('1fe4a8ad-9200-4541-9a33-ffd3d8ca683c','Mexican_Holidays','2002-05-01 05:00:00','2002-05-02 05:00:00','Labour Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('1fee83da-3a36-42ba-86af-cd1f2888bd53','US_Holidays','2006-05-29 05:00:00','2006-05-30 05:00:00','Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('203ba7e3-4eec-45b5-8061-5046a427f80b','Austrian_Holidays','2008-12-25 06:00:00','2008-12-26 06:00:00','Christmas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('20409299-30ec-4235-a016-cdb8098f7ff3','China_Holidays','2004-09-10 05:00:00','2004-09-11 05:00:00','Teacher\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('204933e9-3739-41c1-95f0-e4544d6367d3','Australian_Holidays','2007-10-01 05:00:00','2007-10-02 05:00:00','Queen\'s Birthday Holiday [WA Only]',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('204f8a8a-6e59-4830-a443-4895b81ec9e2','Thai_Holidays','2004-08-12 05:00:00','2004-08-13 05:00:00','H.M. The Queen\'s Birthday Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('20612cae-2cae-4963-82e3-66b27fc7b175','Austrian_Holidays','2003-01-06 06:00:00','2003-01-07 06:00:00','Hl. 3 Könige',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('206756ed-0df0-4bac-a854-bbd25bd7cb1f','Taiwan_Holidays','2009-09-28 05:00:00','2009-09-29 05:00:00','Teacher\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('206937c6-b65b-4edb-821b-af8c4a82e9b9','Russian_Holidays','2010-02-23 06:00:00','2010-02-24 06:00:00','Defender of the Fatherland Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('2074a133-6bd8-48ff-a888-b849b8310ca3','Swedish_Holidays','2009-06-05 16:00:00','2009-06-06 16:00:00','⚑Sveriges nationaldag (Sweden\'s National Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('208b67d1-94f5-40e1-bbbc-e6c1b448c75a','Austrian_Holidays','2008-12-26 06:00:00','2008-12-27 06:00:00','St. Stephan\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('208cfab3-e087-4237-83c1-b3d8260fb2a2','Australian_Holidays','2010-02-01 06:00:00','2010-02-02 06:00:00','Labour Day [WA]',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('20971808-5561-4061-aa75-a7eb0b78c993','Mexican_Holidays','2009-12-24 06:00:00','2009-12-25 06:00:00','Christmas Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('209dde90-968f-4d6b-8a4d-fba6ed924b13','Dutch_Holidays','2007-05-04 05:00:00','2007-05-05 05:00:00','Commemoration Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('20d4072e-e268-4361-a325-b1815a0876d9','New_Zealand_Holidays','2007-04-25 05:00:00','2007-04-26 05:00:00','ANZAC Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('20e03c64-b660-4139-bb40-25f4a8111eb6','UK_Holidays','2002-03-01 06:00:00','2002-03-02 06:00:00','St. David\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('20e23ced-08b8-40bb-a097-0869ee043716','US_Holidays','2003-04-15 05:00:00','2003-04-16 05:00:00','Tax Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('20e8ec37-fd9d-444c-b5bd-131dd751b6cb','Swedish_Holidays','2006-06-06 05:00:00','2006-06-07 05:00:00','National Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:28:11',''),('20eaebe2-fdad-4ff1-b15b-2110f98d7b3f','Hong_Kong_Holidays','2008-02-14 06:00:00','2008-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('20f21260-0227-44d1-b765-df539f484f5c','Philippines_Holidays','2006-11-30 06:00:00','2006-12-01 06:00:00','Bonifacio Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('211d5ee2-3c3f-457a-b1a1-1bd8e7c2c37e','China_Holidays','2010-02-14 06:00:00','2010-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('213188c5-3ce6-4511-bc7b-7eb8d8d34ce5','Mexican_Holidays','2008-10-12 05:00:00','2008-10-13 05:00:00','Columbus Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('213356fd-32e8-4e1e-a4bd-988a9973401f','Thai_Holidays','2007-05-01 05:00:00','2007-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:32',''),('2155a1ae-6f86-4599-af15-d527ca3b36ec','French_Holidays','2004-05-01 05:00:00','2004-05-02 05:00:00','Fête du travail',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('215d6964-e333-41a8-af25-72509d1858b7','South_Korean_Holidays','2010-01-01 06:00:00','2010-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('215ea51b-32a5-49c9-ad42-3e0e0abb93b2','China_Holidays','2007-04-01 05:00:00','2007-04-02 05:00:00','April Fool\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:09:26',''),('217f6db0-1bf5-4bdb-b4d3-a80ce2c52237','Danish_Holidays','2009-05-20 16:00:00','2009-05-21 16:00:00','Kristi Himmelfartsdag (Ascension Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('21a4e696-8a43-4df4-a28f-e3b4f832d7f9','French_Holidays','2008-12-25 06:00:00','2008-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('21c57f43-7200-4f6a-a2f7-6520853c32d2','Jewish_Holidays','2008-04-21 16:00:00','2008-04-22 16:00:00','Pesach III (CH\'\'M)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('21d86f80-708a-4516-a2b4-5d8000121ce3','Hong_Kong_Holidays','2003-02-02 16:00:00','2003-02-03 16:00:00','The third day of the Lunar New Year',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('21e47b20-da3a-4a01-8b82-27068503df1f','Christain_Holidays','2010-10-02 05:00:00','2010-10-03 05:00:00','Feast of the Gaurdian Angels',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('21f82889-0127-4631-93bd-532a9aa15c9d','UK_Holidays','2006-12-26 06:00:00','2006-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('21fdb9b4-4dd7-447a-b72a-5bd54e5d859c','Canadian_Holidays','2002-02-14 06:00:00','2002-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('21ffeab7-8d0d-4220-ace2-9740591ebeae','Canadian_Holidays','2009-03-17 05:00:00','2009-03-18 05:00:00','St. Patrick\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:49:17',''),('220c5abf-5ceb-46fc-8735-ed452e38ef42','Italian_Holidays','2009-06-01 16:00:00','2009-06-02 16:00:00','Festa della Repubblica (Bank Holiday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:50',''),('22413660-a400-4e54-ac60-ef7472450da5','French_Holidays','2008-05-08 05:00:00','2008-05-09 05:00:00','Victory Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('225abd4e-9680-4de4-82db-1a5da9518004','Dutch_Holidays','2005-12-25 06:00:00','2005-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:11:24',''),('225bbfa5-29c8-4126-82bb-8732b97f65d2','Austrian_Holidays','2010-03-28 05:00:00','2010-03-29 05:00:00','Palm Sunday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:07:44',''),('22639d12-0546-4ed0-b753-1d9a08b6f8c6','German_Holidays','2009-04-04 16:00:00','2009-04-05 16:00:00','Palmsonntag (Palm Sunday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('2271da70-4268-4532-b490-1417bdddf88d','Polish_Holidays','2010-06-01 05:00:00','2010-06-02 05:00:00','Children\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:22:13',''),('227d1bea-8a39-40df-aced-6ac12e33fe1f','Norwegian_Holidays','2010-12-31 06:00:00','2011-01-01 06:00:00','New Years Eve',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('228334b9-ec34-4f86-8771-d12228794f6b','Malaysian_Holidays','2011-02-15 16:00:00','2011-02-16 16:00:00','Prophet Muhammad\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('229b94a7-f181-49fe-9698-f9af4bb2e46b','Japanese_Holidays','2005-11-03 06:00:00','2005-11-04 06:00:00','Culture Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:18:22',''),('22b715a3-8996-4e7d-916f-401e7b65be1a','Spain_Holidays','2004-08-15 05:00:00','2004-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('22bac857-d916-4515-9d92-3dfe77f46dd8','New_Zealand_Holidays','2007-10-19 05:00:00','2007-10-20 05:00:00','Hawkes\' Bay Anniversary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('22c26440-7215-43ee-a64b-84db5de951c4','US_Holidays','2002-11-11 06:00:00','2002-11-12 06:00:00','Veteran\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('22c7e689-ccbd-471b-a362-b834146f7466','Christain_Holidays','2009-08-15 05:00:00','2009-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('22fb3611-29ba-42a4-baba-d6d8812c52b5','French_Holidays','2008-06-04 05:00:00','2008-06-05 05:00:00','Pentecost Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:12:27',''),('231ed1a3-da55-4006-bfff-5abdc189d765','Hong_Kong_C_Holidays','2010-12-25 06:00:00','2010-12-26 06:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:14:31',''),('2335bbcb-4343-4213-aaf3-98724f539686','Portuguese_Holidays','2012-02-20 16:00:00','2012-02-21 16:00:00','Carnaval (Carnival)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('234b461d-e26e-44d1-a683-c127d9a66193','Greek_Holidays','2009-01-06 06:00:00','2009-01-07 06:00:00','Τwelfth Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:13:36',''),('234cd1b8-4b09-47cd-aee3-47c5bdf2f034','New_Zealand_Holidays','2007-01-02 06:00:00','2007-01-03 06:00:00','Day after New Year\'s day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:51:07',''),('2361275b-6b18-4db8-85c0-5f1979bc64fc','Norwegian_Holidays','2004-05-08 05:00:00','2004-05-09 05:00:00','Frigjøringsdagen',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('2377c215-2496-4bb8-9ee3-9ab36293cccb','Spain_Holidays','2010-05-01 05:00:00','2010-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:25:33',''),('23d113d5-9c6a-4a75-916d-33fab8bd1c3a','Philippines_Holidays','2010-08-21 05:00:00','2010-08-22 05:00:00','Ninoy Aquino Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:45',''),('23d2e4ee-a687-4fc1-af2f-5cc8f259d64b','Swedish_Holidays','2009-10-23 16:00:00','2009-10-24 16:00:00','⚑FN-dagen (UN Day)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('23d476de-e9b7-4789-a0f0-698dbcbc5f2c','Taiwan_Holidays','2010-06-24 05:00:00','2010-06-25 05:00:00','Kuan Kung\'s Birthday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('23db84b4-a19d-4b5a-8511-39234aed3a9a','Taiwan_Holidays','2008-05-04 05:00:00','2008-05-05 05:00:00','Literary Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:03',''),('24017b93-392d-4daf-964d-8e8cdc21d03d','US_Holidays','2005-05-30 05:00:00','2005-05-31 05:00:00','Memorial Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('240979d8-2514-4477-b988-7432341f2dc9','South_Korean_Holidays','2004-01-01 06:00:00','2004-01-02 06:00:00','New Year\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:57',''),('241220b2-6a8f-43a9-bdbe-0f54a6e3a9e2','Hong_Kong_Holidays','2010-12-26 06:00:00','2010-12-27 06:00:00','Boxing Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('241a851a-16bf-4eaa-849d-0a95235f3465','Vietnamese_Holidays','2009-05-01 05:00:00','2009-05-02 05:00:00','Labor Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:30:28',''),('242c787e-d6f3-4978-94ab-4647725df717','US_Holidays','2005-04-03 06:00:00','2005-04-04 05:00:00','Daylight Saving Time Begins',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:48:23',''),('243dfbef-630c-43b4-8c3f-3e72c3d71b5b','Hong_Kong_Holidays','2010-06-16 05:00:00','2010-06-17 05:00:00','Dragon Boat Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:15:00',''),('2450247a-869f-40e4-b7e7-9d1ac5f99bd1','Mexican_Holidays','2010-02-14 06:00:00','2010-02-15 06:00:00','Valentine\'s Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:19:55',''),('2452917f-e7be-4f46-b681-0962980006db','Taiwan_Holidays','2009-05-28 05:00:00','2009-05-29 05:00:00','Dragon Boat Festival',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:29:04',''),('245b66e7-f17b-4418-b210-1fe6651a1f01','Jewish_Holidays','2008-08-01 16:00:00','2008-08-02 16:00:00','Rosh Chodesh Av',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('24672b29-76b0-418b-aa15-33bd48a16f1a','Christain_Holidays','2010-10-31 05:00:00','2010-11-01 05:00:00','Reformation Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:08',''),('246d688d-5429-4398-bc47-610b88b36b04','Christain_Holidays','2010-12-28 06:00:00','2010-12-29 06:00:00','Childermas',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 14:10:09',''),('246e5acd-9bae-4b4f-8405-67ce73485e9e','Jewish_Holidays','2007-09-27 16:00:00','2007-09-28 16:00:00','Sukkot II',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('2487ffdf-8e0d-489d-aa18-702fcd9ee2bb','Hong_Kong_C_Holidays','2005-09-18 16:00:00','2005-09-19 16:00:00','中秋節翌日',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('24905562-0196-4bde-942f-a18b70537640','Jewish_Holidays','2010-09-17 16:00:00','2010-09-18 16:00:00','Yom Kippur',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:52',''),('2498adb9-b875-4121-852d-fb3e25dcc01e','UK_Holidays','2008-11-05 06:00:00','2008-11-06 06:00:00','Guy Fawkes Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 10:44:17',''),('24a7a8e9-5b2d-4acd-8e52-004abd275db2','Hong_Kong_Holidays','2002-12-24 16:00:00','2002-12-25 16:00:00','Christmas Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('24bd1659-346f-4365-8879-93d880eb0c02','Italian_Holidays','2007-08-15 05:00:00','2007-08-16 05:00:00','Assumption Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('24d1cfc7-1601-4154-8c50-e512d9123c6a','Italian_Holidays','2008-06-02 05:00:00','2008-06-03 05:00:00','Republic Day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:17:39',''),('24dff6ca-d3b3-47d2-b92d-58cb51833835','Russian_Holidays','2007-02-14 06:00:00','2007-02-15 06:00:00','Valentines day',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:24:10',''),('24ed1465-8acd-4128-a504-b212b2b64fbc','Australian_Holidays','2010-04-05 05:00:00','2010-04-06 05:00:00','Easter Monday',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-07 13:48:16',''),('24f64ada-145d-42eb-a2d8-40e3c2f28a13','Norwegian_Holidays','2010-05-08 05:00:00','2010-05-09 05:00:00','Frigjøringsdagen',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2009-02-09 04:21:01',''),('250baf80-2321-4706-b1a4-95078e1ac8a7','Swedish_Holidays','2011-04-24 16:00:00','2011-04-25 16:00:00','Annandag Påsk (Easter Monday)',NULL,'','b','m','','1970-01-01 00:00:00',NULL,'2011-09-19 13:26:51',''),('250cf779-bbae-48c4-8118-fb89ffa0ef72','Islamic_Holidays','2005-10-29 16:00:00','2005-10-30 16:00:00','Laitaltul-Qadr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-08-14 08:59:14','\0');
/*!40000 ALTER TABLE `calendarevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendars` (
  `cid` varchar(36) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `description` text,
  `location` varchar(50) NOT NULL,
  `timezone` varchar(50) default NULL,
  `colorcode` varchar(7) default 'CC3333',
  `caltype` int(1) default '0',
  `isdefault` int(1) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
INSERT INTO `calendars` VALUES ('Australian_Holidays','Australian Holidays',NULL,'','','0',3,0,'','2009-02-07 13:48:16'),('Austrian_Holidays','Austrian Holidays',NULL,'','','0',3,0,'','2009-02-07 14:07:44'),('Brazilian_Holidays','Brazilian Holidays',NULL,'','','0',3,0,'','2009-02-07 14:08:33'),('Canadian_Holidays','Canadian Holidays',NULL,'','','0',3,0,'','2009-02-07 13:49:17'),('China_Holidays','China Holidays',NULL,'','','0',3,0,'','2009-02-07 14:09:26'),('Christain_Holidays','Christain Holidays',NULL,'','','0',3,0,'','2009-02-07 14:10:08'),('Danish_Holidays','Danish Holidays',NULL,'','','0',3,0,'','2009-02-07 14:10:51'),('Dutch_Holidays','Dutch Holidays',NULL,'','','0',3,0,'','2009-02-07 14:11:24'),('Finnish_Holidays','Finnish Holidays',NULL,'','','0',3,0,'','2009-02-07 14:11:59'),('French_Holidays','French Holidays',NULL,'','','0',3,0,'','2009-02-07 14:12:27'),('German_Holidays','German Holidays',NULL,'','','0',3,0,'','2009-02-07 14:13:02'),('Greek_Holidays','Greek Holidays',NULL,'','','0',3,0,'','2009-02-07 14:13:36'),('Hong_Kong_C_Holidays','Hong Kong (C) Holidays',NULL,'','','0',3,0,'','2009-02-07 14:14:30'),('Hong_Kong_Holidays','Hong Kong Holidays',NULL,'','','0',3,0,'','2009-02-07 14:15:00'),('Indian_Holidays','Indian Holidays',NULL,'','','0',3,0,'','2009-02-06 11:51:11'),('Indonesian_Holidays','Indonesian Holidays',NULL,'','','0',3,0,'','2009-02-07 14:15:45'),('Irish_Holidays','Irish Holidays',NULL,'','','0',3,0,'','2009-02-07 13:50:09'),('Islamic_Holidays','Islamic Holidays',NULL,'','','0',3,0,'','2009-02-07 13:39:39'),('Italian_Holidays','Italian Holidays',NULL,'','','0',3,0,'','2009-02-09 04:17:39'),('Japanese_Holidays','Japanese Holidays',NULL,'','','0',3,0,'','2009-02-09 04:18:21'),('Jewish_Holidays','Jewish Holidays',NULL,'','','0',3,0,'','2009-02-09 04:19:21'),('Malaysian_Holidays','Malaysian Holidays',NULL,'','','0',3,0,'','2009-02-07 13:40:53'),('Mexican_Holidays','Mexican Holidays',NULL,'','','0',3,0,'','2009-02-09 04:19:55'),('New_Zealand_Holidays','New Zealand Holidays',NULL,'','','0',3,0,'','2009-02-07 13:51:07'),('Norwegian_Holidays','Norwegian Holidays',NULL,'','','0',3,0,'','2009-02-09 04:21:01'),('Philippines_Holidays','Philippines Holidays',NULL,'','','0',3,0,'','2009-02-09 04:21:45'),('Polish_Holidays','Polish Holidays',NULL,'','','0',3,0,'','2009-02-09 04:22:13'),('Portuguese_Holidays','Portuguese Holidays',NULL,'','','0',3,0,'','2009-02-09 04:23:07'),('Russian_Holidays','Russian Holidays',NULL,'','','0',3,0,'','2009-02-09 04:24:10'),('South_Africa_Holidays','South Africa Holidays',NULL,'','','0',3,0,'','2009-02-07 13:52:11'),('South_Korean_Holidays','South Korean Holidays',NULL,'','','0',3,0,'','2009-02-09 04:24:57'),('Spain_Holidays','Spain Holidays',NULL,'','','0',3,0,'','2009-02-09 04:25:33'),('Swedish_Holidays','Swedish Holidays',NULL,'','','0',3,0,'','2009-02-09 04:28:11'),('Taiwan_Holidays','Taiwan Holidays',NULL,'','','0',3,0,'','2009-02-09 04:29:03'),('Thai_Holidays','Thai Holidays',NULL,'','','0',3,0,'','2009-02-09 04:29:32'),('UK_Holidays','UK Holidays',NULL,'','','0',3,0,'','2009-02-07 10:44:01'),('US_Holidays','US Holidays',NULL,'','','0',3,0,'','2009-02-07 10:48:23'),('Vietnamese_Holidays','Vietnamese Holidays',NULL,'','','0',3,0,'','2009-02-09 04:30:27');
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccdata`
--

DROP TABLE IF EXISTS `ccdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccdata` (
  `referenceid` varchar(36) NOT NULL,
  `module` varchar(50) NOT NULL,
  `cd1` double default NULL,
  `cd2` double default NULL,
  `cd3` double default NULL,
  `cd4` double default NULL,
  `cd5` double default NULL,
  `cd6` double default NULL,
  `cd7` double default NULL,
  `cd8` double default NULL,
  `cd9` double default NULL,
  `cd10` double default NULL,
  `cb1` bit(1) default b'0',
  `cb2` bit(1) default b'0',
  `cb3` bit(1) default b'0',
  `cb4` bit(1) default b'0',
  `cb5` bit(1) default b'0',
  `cb6` bit(1) default b'0',
  `cb7` bit(1) default b'0',
  `cb8` bit(1) default b'0',
  `cb9` bit(1) default b'0',
  `cb10` bit(1) default b'0',
  `ct1` bigint(20) default NULL,
  `ct2` bigint(20) default NULL,
  `ct3` bigint(20) default NULL,
  `ct4` bigint(20) default NULL,
  `ct5` bigint(20) default NULL,
  `ct6` bigint(20) default NULL,
  `ct7` bigint(20) default NULL,
  `ct8` bigint(20) default NULL,
  `ct9` bigint(20) default NULL,
  `ct10` bigint(20) default NULL,
  `cs1` varchar(256) default NULL,
  `cs2` varchar(256) default NULL,
  `cs3` varchar(256) default NULL,
  `cs4` varchar(256) default NULL,
  `cs5` varchar(256) default NULL,
  `cs6` varchar(256) default NULL,
  `cs7` varchar(256) default NULL,
  `cs8` varchar(256) default NULL,
  `cs9` varchar(256) default NULL,
  `cs10` varchar(256) default NULL,
  `cs11` varchar(256) default NULL,
  `cs12` varchar(256) default NULL,
  `cs13` varchar(256) default NULL,
  `cs14` varchar(256) default NULL,
  `cs15` varchar(256) default NULL,
  `cs16` varchar(256) default NULL,
  `cs17` varchar(256) default NULL,
  `cs18` varchar(256) default NULL,
  `cs19` varchar(256) default NULL,
  `cs20` varchar(256) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccdata`
--

LOCK TABLES `ccdata` WRITE;
/*!40000 ALTER TABLE `ccdata` DISABLE KEYS */;
INSERT INTO `ccdata` VALUES ('18b1e9df-b13e-446f-9fe2-81901588fdea','Project',0,0,0,0,0,0,0,0,0,0,'\0','\0','\0','\0','\0','\0','\0','\0','\0','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `ccdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccmetadata`
--

DROP TABLE IF EXISTS `ccmetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccmetadata` (
  `columnid` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `module` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `dataindex` varchar(50) default NULL,
  `ismandatory` bit(1) default NULL,
  `visible` bit(1) default NULL,
  `defaultvalue` varchar(256) default NULL,
  `enabled` bit(1) default NULL,
  `renderer` varchar(30) default NULL,
  `editor` varchar(30) default NULL,
  `type` int(3) default NULL,
  `columnno` varchar(5) NOT NULL,
  `userid` varchar(36) default NULL,
  `masterdata` varchar(512) default NULL,
  `modifiedon` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `createdon` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`columnid`),
  KEY `cc_ibfk_1` (`userid`),
  KEY `cc_ibfk_2` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccmetadata`
--

LOCK TABLES `ccmetadata` WRITE;
/*!40000 ALTER TABLE `ccmetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccmetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chartrequestlog`
--

DROP TABLE IF EXISTS `chartrequestlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chartrequestlog` (
  `userid` varchar(50) NOT NULL,
  `chartdata` varchar(512) default NULL,
  `lastrequesttime` datetime NOT NULL,
  `changeflag` bit(1) NOT NULL default b'0',
  `pagestart` int(3) NOT NULL default '0',
  `type` varchar(32) default NULL,
  KEY `chartrequestlog_ibfk1` (`userid`),
  CONSTRAINT `chartrequestlog_ibfk1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to check if Dashboard chart data is to be calculated o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chartrequestlog`
--

LOCK TABLES `chartrequestlog` WRITE;
/*!40000 ALTER TABLE `chartrequestlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `chartrequestlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatmessages`
--

DROP TABLE IF EXISTS `chatmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmessages` (
  `sendid` varchar(50) NOT NULL,
  `receiveid` varchar(50) NOT NULL,
  `message` text,
  `messagetimestamp` time NOT NULL,
  `rsflag` int(11) NOT NULL default '0',
  `readflag` int(11) default '0',
  KEY `chatmsg_fk_1` (`sendid`),
  KEY `chatmsg_fk_2` (`receiveid`),
  CONSTRAINT `chatmsg_fk_1` FOREIGN KEY (`sendid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chatmsg_fk_2` FOREIGN KEY (`receiveid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmessages`
--

LOCK TABLES `chatmessages` WRITE;
/*!40000 ALTER TABLE `chatmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist` (
  `checklistid` varchar(36) NOT NULL,
  `checklistname` varchar(256) NOT NULL,
  `checklistdesc` varchar(256) default NULL,
  `createdby` varchar(36) default NULL,
  `updatedby` varchar(36) default NULL,
  `createdon` timestamp NOT NULL default '0000-00-00 00:00:00',
  `updatedon` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `companyid` varchar(36) NOT NULL,
  PRIMARY KEY  (`checklistid`),
  KEY `companyid_ibfk_1` (`companyid`),
  CONSTRAINT `companyid_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores check lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklisttasks`
--

DROP TABLE IF EXISTS `checklisttasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklisttasks` (
  `ctaskid` varchar(36) NOT NULL,
  `ctaskname` varchar(256) NOT NULL,
  `checklistid` varchar(36) NOT NULL,
  PRIMARY KEY  (`ctaskid`),
  KEY `checklistid_ibfk_1` (`checklistid`),
  CONSTRAINT `checklistid_ibfk_1` FOREIGN KEY (`checklistid`) REFERENCES `checklist` (`checklistid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds check list tasks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklisttasks`
--

LOCK TABLES `checklisttasks` WRITE;
/*!40000 ALTER TABLE `checklisttasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklisttasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `image` varchar(256) NOT NULL,
  `communityid` varchar(50) NOT NULL default '0',
  `communityname` text,
  `aboutcommunity` text,
  `companyid` varchar(36) default NULL,
  `createdon` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` varchar(50) default NULL,
  PRIMARY KEY  (`communityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communitydocs`
--

DROP TABLE IF EXISTS `communitydocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communitydocs` (
  `communityid` varchar(50) default '0',
  `docid` varchar(50) default '0',
  `docversion` text,
  `size` text,
  `sharedby` int(11) default '0',
  `sharedon` date default NULL,
  KEY `communitydocs_fk_1` (`communityid`),
  KEY `communitydocs_fk_2` (`docid`),
  CONSTRAINT `communitydocs_fk_1` FOREIGN KEY (`communityid`) REFERENCES `community` (`communityid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `communitydocs_fk_2` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communitydocs`
--

LOCK TABLES `communitydocs` WRITE;
/*!40000 ALTER TABLE `communitydocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `communitydocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communitymembers`
--

DROP TABLE IF EXISTS `communitymembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communitymembers` (
  `communityid` varchar(50) NOT NULL default '0',
  `status` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL default '0',
  `updatedon` datetime default NULL,
  KEY `communitymembers_fk_1` (`communityid`),
  KEY `communitymembers_fk_2` (`userid`),
  CONSTRAINT `communitymembers_fk_1` FOREIGN KEY (`communityid`) REFERENCES `community` (`communityid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `communitymembers_fk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communitymembers`
--

LOCK TABLES `communitymembers` WRITE;
/*!40000 ALTER TABLE `communitymembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `communitymembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communitytags`
--

DROP TABLE IF EXISTS `communitytags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communitytags` (
  `communityid` varchar(50) NOT NULL,
  `tagname` text,
  KEY `communitytags` (`communityid`),
  CONSTRAINT `communitytags` FOREIGN KEY (`communityid`) REFERENCES `community` (`communityid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communitytags`
--

LOCK TABLES `communitytags` WRITE;
/*!40000 ALTER TABLE `communitytags` DISABLE KEYS */;
/*!40000 ALTER TABLE `communitytags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyid` varchar(36) NOT NULL default '',
  `companyname` varchar(256) NOT NULL default '',
  `subdomain` varchar(50) default NULL,
  `createdon` date NOT NULL,
  `address` varchar(2048) NOT NULL default '',
  `city` varchar(50) NOT NULL default '',
  `state` varchar(50) NOT NULL default '',
  `country` int(11) default NULL,
  `phone` varchar(16) NOT NULL default '',
  `fax` varchar(50) NOT NULL default '',
  `zip` varchar(50) NOT NULL default '',
  `timezone` varchar(50) NOT NULL default '',
  `website` varchar(50) NOT NULL default '',
  `activated` bit(1) NOT NULL default b'1',
  `maxusers` int(11) NOT NULL default '20',
  `maxcommunities` int(11) NOT NULL default '5',
  `maxprojects` int(11) NOT NULL default '5',
  `image` varchar(250) NOT NULL default '',
  `featureaccess` int(11) default '0',
  `planid` int(11) NOT NULL default '4',
  `subscriptiondate` date NOT NULL default '1900-01-01',
  `payerid` varchar(50) NOT NULL default '',
  `emailid` varchar(200) NOT NULL default '',
  `creator` varchar(36) NOT NULL default '',
  `currency` int(11) default '1',
  `isexpired` bit(1) NOT NULL default b'0',
  `modifiedon` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `maxfilesize` int(11) NOT NULL default '1',
  `notificationtype` int(11) NOT NULL,
  `toexpireon` date default NULL,
  `language` int(11) default NULL,
  `milestonewidget` bit(1) NOT NULL default b'0',
  `checklist` bit(1) NOT NULL default b'1',
  `docaccess` bit(1) NOT NULL default b'0',
  `switchpref` bit(1) NOT NULL default b'1',
  PRIMARY KEY  (`companyid`),
  KEY `planid` (`planid`),
  KEY `creator` (`creator`),
  KEY `language` (`language`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`planid`) REFERENCES `planedition` (`planid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`language`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('8e94f514-e2d0-11e1-a6f4-001e58a79890','project','project','2012-08-10','','','',0,'','','','236','','',500,500,500,'',0,2,'2012-08-10','8e94f4d8-e2d0-11e1-a6f4-001e58a79890','','8e94f4d8-e2d0-11e1-a6f4-001e58a79890',1,'\0','2012-08-14 11:49:29',1,0,'2015-01-01',NULL,'\0','','\0','');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyholiday`
--

DROP TABLE IF EXISTS `companyholiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyholiday` (
  `companyid` varchar(50) default NULL,
  `holidaydate` date default NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyholiday`
--

LOCK TABLES `companyholiday` WRITE;
/*!40000 ALTER TABLE `companyholiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyholiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyholidays`
--

DROP TABLE IF EXISTS `companyholidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyholidays` (
  `companyid` varchar(36) NOT NULL,
  `holiday` date NOT NULL,
  `description` varchar(512) NOT NULL default '',
  KEY `companyid` (`companyid`),
  CONSTRAINT `companyholidays_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyholidays`
--

LOCK TABLES `companyholidays` WRITE;
/*!40000 ALTER TABLE `companyholidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyholidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companymodules`
--

DROP TABLE IF EXISTS `companymodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companymodules` (
  `moduleid` int(11) NOT NULL,
  `modulename` varchar(50) character set latin1 NOT NULL,
  `nickname` varchar(5) NOT NULL default '',
  `isdefault` bit(1) NOT NULL default b'1',
  PRIMARY KEY  (`moduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companymodules`
--

LOCK TABLES `companymodules` WRITE;
/*!40000 ALTER TABLE `companymodules` DISABLE KEYS */;
INSERT INTO `companymodules` VALUES (1,'Calendar','cal',''),(2,'Personal Messages','pm',''),(3,'Project','proj',''),(4,'Document Management','docs','');
/*!40000 ALTER TABLE `companymodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companymodulesubscription`
--

DROP TABLE IF EXISTS `companymodulesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companymodulesubscription` (
  `subscriptionid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  `moduleid` int(11) NOT NULL,
  `submodulesubscriptionid` int(11) NOT NULL,
  KEY `companyid` (`companyid`),
  CONSTRAINT `companymodulesubscription_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companymodulesubscription`
--

LOCK TABLES `companymodulesubscription` WRITE;
/*!40000 ALTER TABLE `companymodulesubscription` DISABLE KEYS */;
INSERT INTO `companymodulesubscription` VALUES (2,'8e94f514-e2d0-11e1-a6f4-001e58a79890',1,0),(2,'8e94f514-e2d0-11e1-a6f4-001e58a79890',2,0),(2,'8e94f514-e2d0-11e1-a6f4-001e58a79890',3,6),(2,'8e94f514-e2d0-11e1-a6f4-001e58a79890',4,0);
/*!40000 ALTER TABLE `companymodulesubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companymodulesubscription_insert`
--

DROP TABLE IF EXISTS `companymodulesubscription_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companymodulesubscription_insert` (
  `subscriptionid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  `moduleid` int(11) NOT NULL,
  `submodulesubscriptionid` int(11) NOT NULL,
  KEY `companyid` (`companyid`),
  CONSTRAINT `companymodulesubscription_insert_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companymodulesubscription_insert`
--

LOCK TABLES `companymodulesubscription_insert` WRITE;
/*!40000 ALTER TABLE `companymodulesubscription_insert` DISABLE KEYS */;
/*!40000 ALTER TABLE `companymodulesubscription_insert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companymodulesubscription_temp`
--

DROP TABLE IF EXISTS `companymodulesubscription_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companymodulesubscription_temp` (
  `subscriptionid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  `moduleid` int(11) NOT NULL,
  `submodulesubscriptionid` int(11) NOT NULL,
  KEY `companyid` (`companyid`),
  CONSTRAINT `companymodulesubscription_temp_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companymodulesubscription_temp`
--

LOCK TABLES `companymodulesubscription_temp` WRITE;
/*!40000 ALTER TABLE `companymodulesubscription_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `companymodulesubscription_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyplanmap`
--

DROP TABLE IF EXISTS `companyplanmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyplanmap` (
  `companyid` varchar(36) default NULL,
  `planid` int(11) default NULL,
  KEY `companyid` (`companyid`),
  KEY `planid` (`planid`),
  CONSTRAINT `companyplanmap_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companyplanmap_ibfk_2` FOREIGN KEY (`planid`) REFERENCES `planedition` (`planid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyplanmap`
--

LOCK TABLES `companyplanmap` WRITE;
/*!40000 ALTER TABLE `companyplanmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyplanmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companysubmodules`
--

DROP TABLE IF EXISTS `companysubmodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companysubmodules` (
  `submoduleid` int(11) NOT NULL,
  `parentmoduleid` int(11) NOT NULL,
  `submodulename` varchar(50) character set latin1 NOT NULL,
  `subnickname` varchar(5) NOT NULL default '',
  `isdefault` bit(1) NOT NULL default b'1',
  PRIMARY KEY  (`submoduleid`),
  KEY `companysubmodules_ibfk_1` (`parentmoduleid`),
  CONSTRAINT `companysubmodules_ibfk_1` FOREIGN KEY (`parentmoduleid`) REFERENCES `companymodules` (`moduleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companysubmodules`
--

LOCK TABLES `companysubmodules` WRITE;
/*!40000 ALTER TABLE `companysubmodules` DISABLE KEYS */;
INSERT INTO `companysubmodules` VALUES (1,3,'Baseline','bsln',''),(2,3,'User Specific Tasks','usrtk','\0');
/*!40000 ALTER TABLE `companysubmodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companysubscription`
--

DROP TABLE IF EXISTS `companysubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companysubscription` (
  `featureid` int(11) default NULL,
  `companyid` varchar(36) NOT NULL default '',
  `subscriptiondate` date NOT NULL default '2000-01-01',
  `expdate` date NOT NULL default '2000-01-01',
  `activityid` int(11) NOT NULL default '0',
  KEY `companyid` (`companyid`),
  KEY `featureid` (`featureid`),
  CONSTRAINT `companysubscription_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companysubscription_ibfk_2` FOREIGN KEY (`featureid`) REFERENCES `featurelist` (`featureid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companysubscription`
--

LOCK TABLES `companysubscription` WRITE;
/*!40000 ALTER TABLE `companysubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `companysubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyusers`
--

DROP TABLE IF EXISTS `companyusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyusers` (
  `companyid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `companyid` (`companyid`),
  KEY `userid` (`userid`),
  CONSTRAINT `companyusers_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `companyusers_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyusers`
--

LOCK TABLES `companyusers` WRITE;
/*!40000 ALTER TABLE `companyusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryid` int(11) NOT NULL default '0',
  `countryname` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'ABU DHABI'),(2,'ADMIRALTY ISLANDS'),(3,'AFGHANISTAN'),(4,'AJMAN'),(5,'AL AIN'),(6,'ALBANIA'),(7,'ALGERIA'),(8,'ANDORRA'),(9,'ANGOLA'),(10,'ANGUILLA'),(11,'ANTARTICA'),(12,'ANTIGUA'),(13,'ARGENTINA'),(14,'ARMENIA'),(15,'ARUBA'),(16,'ASCENSION ISLAND'),(17,'AUSTRALIA'),(18,'AUSTRIA'),(19,'AZERBAIJAN'),(20,'BAHAMAS'),(21,'BAHRAIN'),(22,'BANGLADESH'),(23,'BARBADOS'),(24,'BELGIUM'),(25,'BELIZE'),(26,'BENIN'),(27,'BERMUDA'),(28,'BHUTAN'),(29,'BOLIVIA'),(30,'BOSNIA/HERZEGOVINA'),(31,'BOTSWANA'),(32,'BOUVET ISLAND'),(33,'BRAZIL'),(34,'BRITISH INDIAN OCEAN TERRITORY'),(35,'BRUNEI'),(36,'BULGARIA'),(37,'BURKINA/FASO'),(38,'BURUNDI'),(39,'BYELORUSSIA'),(117,'CAMBODIA'),(40,'CAMEROON'),(41,'CANADA'),(42,'CAPE VERDE'),(43,'CAROLINE ISLANDS'),(44,'CAYMAN ISLANDS'),(45,'CENTRAL AFRICAN REP'),(46,'CHAD'),(47,'CHILE'),(48,'CHINA PEOPLES REP'),(49,'CHRISTMAS ISLANDS'),(50,'COCOS ISLANDS'),(51,'COLOMBIA'),(53,'COMORO ISLANDS'),(54,'CONGO'),(55,'COOK ISLANDS'),(56,'COSTA RICA'),(57,'CROTIA'),(58,'CUBA'),(59,'CYPRUS'),(60,'CZECH REPUBLIC'),(61,'DENMARK'),(62,'DJIBOUTI'),(63,'DOMINICA'),(64,'DOMINICAN REPUBLIC'),(65,'DUBAI'),(67,'ECUADOR'),(68,'EGYPT'),(69,'EL SALVADOR'),(70,'ENGLAND'),(71,'EQUATORIAL GUINEA'),(72,'ERITREA'),(73,'ESTONIA'),(74,'ETHIOPIA'),(75,'FAEROE ISLANDS'),(76,'FALKLAND ISLANDS'),(77,'FIJI'),(78,'FINLAND'),(79,'FRANCE'),(80,'FRENCH GUIANA'),(81,'FRENCH POLYNESIA'),(82,'FRENCH SOUTHERN TERRITORIES'),(83,'FUJAIRAH'),(84,'GABON'),(85,'GAMBIA'),(86,'GEORGIA'),(87,'GERMANY'),(88,'GHANA'),(89,'GIBRALTAR'),(90,'GREECE'),(91,'GREENLAND'),(92,'GRENADA'),(93,'GUADELOUPE'),(94,'GUAM'),(95,'GUATEMALA'),(96,'GUINEA'),(97,'GUINEA-BISSAU'),(98,'GUYANA'),(99,'HAITI'),(100,'HEARD & MCDONALD ISLANDS'),(101,'HONDURAS'),(102,'HONG KONG'),(103,'HUNGARY'),(104,'ICELAND'),(105,'INDIA'),(106,'INDONESIA'),(108,'IRAN'),(109,'IRAQ'),(110,'IRELAND'),(111,'ISRAEL'),(112,'ITALY'),(113,'IVORY COAST'),(114,'JAMAICA'),(115,'JAPAN'),(116,'JORDAN'),(118,'KAZAKHSTAN'),(119,'KENYA'),(120,'KIRGHIZIA'),(121,'KIRIBATI'),(122,'KOREA NORTH'),(123,'KOREA SOUTH'),(124,'KUWAIT'),(125,'LAOS'),(126,'LATVIA'),(127,'LEBANON'),(128,'LESOTHO'),(129,'LIBERIA'),(130,'LIBYA'),(131,'LIECHTENSTEIN'),(132,'LITHUANIA'),(133,'LUXEMBOURG'),(134,'MACAO'),(135,'MADAGASCAR/MALAGASY'),(136,'MALAWI'),(137,'MALAYSIA'),(138,'MALDIVES'),(139,'MALI'),(140,'MALTA'),(141,'MARSHALL ISLANDS'),(142,'MARTINIQUE'),(143,'MAURITANIA'),(144,'MAURITIUS'),(145,'MAYOTTE'),(146,'MEXICO'),(147,'MICRONESIA'),(148,'MIDWAY ISLAND'),(149,'MOLDAVIA'),(150,'MONACO'),(151,'MONGOLIA'),(152,'MONTSERRAT'),(153,'MOROCCO'),(154,'MOZAMBIQUE'),(155,'MYANMAR (BURMA)'),(156,'NAMIBIA'),(158,'NAURU'),(159,'NEPAL'),(160,'NETHERLANDS'),(161,'NETHERLANDS ANTILLES'),(163,'NEW CALEDONIA'),(164,'NEW ZEALAND'),(165,'NICARAGUA'),(166,'NIGER'),(167,'NIGERIA'),(168,'NIUE'),(170,'NORFOLK ISLAND'),(171,'NORTHERN IRELAND'),(172,'NORTHERN MARIANA ISLANDS'),(173,'NORWAY'),(175,'OMAN'),(176,'PAKISTAN'),(266,'PALASTINE'),(177,'PALAU'),(178,'PANAMA'),(179,'PAPUA NEW GUINEA'),(180,'PARAGUAY'),(181,'PERU'),(182,'PHILIPPINES'),(183,'PITCAIRN'),(184,'POLAND'),(185,'PORTUGAL'),(186,'PUERTO RICO'),(187,'QATAR'),(188,'RAS AL KHAIMAH'),(189,'REUNION ISLAND'),(190,'ROMANIA'),(191,'RUSSION FEDERATION'),(192,'RWANDA'),(193,'SAMOA AMERICAN'),(194,'SAMOA WESTERN'),(195,'SAN MARINO'),(196,'SAO TOME & PRINCIPE'),(197,'SAUDI ARABIA'),(198,'SCOTLAND'),(199,'SENEGAL'),(200,'SEYCHELLES'),(201,'SHARJAH'),(202,'SIERRA LEONE'),(203,'SINGAPORE'),(204,'SLOVAKIA'),(205,'SLOVENIA'),(206,'SOLOMON ISLANDS'),(207,'SOMALIA'),(208,'SOUTH AFRICA'),(209,'SOUTH GEORGIA'),(210,'SOUTH SANDWICH ISLANDS'),(211,'SOVIET UNION'),(212,'SPAIN'),(213,'SRI LANKA'),(214,'ST HELENA'),(215,'ST KITTS/NEVIS'),(216,'ST LUCIA'),(217,'ST PIERRE'),(218,'ST VINCENT'),(219,'SUDAN'),(220,'SURINAME'),(221,'SVALBARD & JAN MAYEN ISLANDS'),(222,'SWAZILAND'),(223,'SWEDEN'),(224,'SWITZERLAND'),(225,'SYRIA'),(226,'TAIWAN'),(227,'TAJIKSTAN'),(228,'TANZANIA'),(229,'THAILAND'),(66,'TIMOR-LESTE'),(230,'TOGO'),(231,'TOKELAU ISLANDS'),(232,'TONGA'),(233,'TRINIDAD & TOBAGO'),(234,'TUNISIA'),(235,'TURKEY'),(236,'TURKMENISTAN'),(237,'TURKS & CAICOS ISLANDS'),(238,'TUVALU'),(239,'UGANDA'),(240,'UKRAINE'),(241,'UMM AL QAIWAIN'),(999,'UNDEFINED'),(242,'UNITED ARAB EMIRATES'),(243,'UNITED KINGDOM'),(244,'UNITED STATES'),(245,'UNITED STATES MINOR OUTLYING ISLANDS'),(246,'URUGUAY'),(251,'UZBEKISTAN'),(252,'VANUATU'),(253,'VATICAN CITY'),(254,'VENEZUELA'),(255,'VIETNAM'),(256,'VIRGIN ISLANDS UK'),(257,'WAKE ISLAND'),(258,'WALES'),(259,'WALLIS & FUTUNA ISLAND'),(267,'WEST AFRICA'),(260,'WESTERN SAHARA'),(261,'YEMEN ARAB REPUBLIC'),(262,'YUGOSLAVIA'),(263,'ZAIRE'),(264,'ZAMBIA'),(265,'ZIMBABWE');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `courseid` varchar(64) NOT NULL,
  `createdbyuserid` varchar(64) default NULL,
  `createdondate` datetime default NULL,
  `coursename` varchar(64) default NULL,
  `description` text,
  `tags` text,
  `profileeditcount` int(10) default NULL,
  `publisheditcount` int(10) default NULL,
  `useridstudent` varchar(32) default NULL,
  `useridpending` varchar(32) default NULL,
  `useridinvited` varchar(32) default NULL,
  `usercount` int(10) default NULL,
  `invitedusercount` int(10) default NULL,
  `pendingusercount` int(10) default NULL,
  `needapprove` int(1) default NULL,
  `filecontent` int(1) default NULL,
  `contenturl` varchar(128) default NULL,
  `author` varchar(128) default NULL,
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpadata`
--

DROP TABLE IF EXISTS `cpadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpadata` (
  `taskid` varchar(50) NOT NULL default '0',
  `es` double(8,2) NOT NULL default '0.00',
  `ef` double(8,2) NOT NULL default '0.00',
  `ls` double(8,2) NOT NULL default '0.00',
  `lf` double(8,2) NOT NULL default '0.00',
  `slack` double(8,2) NOT NULL default '0.00',
  `iscritical` bit(1) NOT NULL default b'0',
  PRIMARY KEY  (`taskid`),
  CONSTRAINT `cpadata_ibfk1` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store CPA data sheet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpadata`
--

LOCK TABLES `cpadata` WRITE;
/*!40000 ALTER TABLE `cpadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpawithpert`
--

DROP TABLE IF EXISTS `cpawithpert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpawithpert` (
  `taskid` varchar(50) NOT NULL default '0',
  `optimistic` double(8,2) NOT NULL default '0.00',
  `likely` double(8,2) NOT NULL default '0.00',
  `pessimistic` double(8,2) NOT NULL default '0.00',
  `expected` double(8,2) NOT NULL default '0.00',
  `sd` double(8,2) NOT NULL default '0.00',
  `variance` double(8,2) NOT NULL default '0.00',
  PRIMARY KEY  (`taskid`),
  CONSTRAINT `cpawithpert_task_fk1` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store CPA/PERT params for each task';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpawithpert`
--

LOCK TABLES `cpawithpert` WRITE;
/*!40000 ALTER TABLE `cpawithpert` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpawithpert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csignups`
--

DROP TABLE IF EXISTS `csignups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csignups` (
  `loginid` varchar(50) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `fname` varchar(50) default NULL,
  `lname` varchar(50) default NULL,
  `pass` varchar(100) default NULL,
  `signupid` varchar(36) NOT NULL default '',
  `subdomain` varchar(50) default NULL,
  `companyname` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csignups`
--

LOCK TABLES `csignups` WRITE;
/*!40000 ALTER TABLE `csignups` DISABLE KEYS */;
/*!40000 ALTER TABLE `csignups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currencyid` int(11) default NULL,
  `currencyname` varchar(50) default NULL,
  `symbol` varchar(20) default NULL,
  `htmlcode` varchar(10) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'US Dollar','24','&#36;'),(2,'Pound','00a3','&#163;'),(3,'Euro','20ac','&#128;'),(4,'default','a4','&#164;'),(5,'Rupee','20a8','&#8360;');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customreports`
--

DROP TABLE IF EXISTS `customreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customreports` (
  `reportid` varchar(36) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `reportname` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(256) default NULL,
  `createdby` varchar(36) default NULL,
  `category` varchar(20) NOT NULL default 'Fixed',
  `modifiedon` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  `createdon` timestamp NOT NULL default '0000-00-00 00:00:00',
  `paging` bit(1) NOT NULL default b'0',
  `milestone` bit(1) NOT NULL default b'0',
  PRIMARY KEY  (`reportid`),
  KEY `companyid_ibfk1` (`companyid`),
  CONSTRAINT `companyid_ibfk1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customreports`
--

LOCK TABLES `customreports` WRITE;
/*!40000 ALTER TABLE `customreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `customreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dateformat`
--

DROP TABLE IF EXISTS `dateformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dateformat` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `javaform` varchar(50) default NULL,
  `scriptform` varchar(50) default NULL,
  `jseppos` int(11) default NULL,
  `sseppos` int(11) default NULL,
  `onlydateformat` bit(1) NOT NULL default b'0',
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dateformat`
--

LOCK TABLES `dateformat` WRITE;
/*!40000 ALTER TABLE `dateformat` DISABLE KEYS */;
INSERT INTO `dateformat` VALUES (1,'Iso8601Long','yyyy-MM-dd HH:mm:ss','Y-m-d H:i:s',10,5,'\0'),(2,'Iso8601Short','yyyy-MM-dd','Y-m-d',10,5,''),(3,'ShortDate','M/d/yy','n/j/y',6,5,''),(4,'longDate','EEEE, MMMM dd, yyyy','l, F d, Y',19,9,''),(5,'FullDateFormat','EEEE, MMMM dd, yyyy h:mm:ss a','l, F d, Y g:i:s A',19,9,'\0'),(6,'MonthDate','MMMM dd','F d',7,3,'\0'),(7,'ShortTime','h:mm a','g:i A',0,0,'\0'),(8,'Longtime','h:mm:ss a','g:i:s A',0,0,'\0'),(9,'sortableDatetime','yyyy-MM-dd z HH:mm:ss','Y-m-d T H:i:s',10,7,'\0'),(10,'UniversalsortableDatetime','yyyy-MM-dd HH:mm:ss z','Y-m-d H:i:s T',10,5,'\0'),(11,'YearMonth','MMMM, yyyy','F, Y',10,4,'\0'),(12,'Kdate1','dd-MM-yy','d-m-y',8,5,''),(13,'Kdate2','MM-dd-yy','m-d-y',8,5,''),(14,'Kdate3','dd/MM/yy','d/m/y',8,5,''),(15,'Kdate4','MM/dd/yy','m/d/y',8,5,''),(16,'Kdate5','E d-MM-yy','D j-m-y',9,7,''),(17,'FullDateShortTime','yyyy-MM-dd HH:mm','Y-m-d g:i',10,5,'\0'),(18,'Kdate6','MMMM dd, yyyy h:mm a','F d, Y g:i A',13,6,'\0'),(19,'Kdate7','E M/d/yy','D m/d/y',8,7,''),(20,'Kdate9','dd-MM-yyyy','d-m-Y',10,5,'');
/*!40000 ALTER TABLE `dateformat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defaultdomains`
--

DROP TABLE IF EXISTS `defaultdomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defaultdomains` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defaultdomains`
--

LOCK TABLES `defaultdomains` WRITE;
/*!40000 ALTER TABLE `defaultdomains` DISABLE KEYS */;
INSERT INTO `defaultdomains` VALUES (1,'42'),(2,'blog'),(3,'support'),(4,'help'),(5,'forum'),(6,'timeout'),(7,'client'),(8,'clients'),(9,'enterprise'),(10,'enterprise20'),(11,'web20'),(12,'contacts'),(13,'game'),(14,'games'),(15,'documentation'),(16,'documents'),(17,'docs'),(18,'crm'),(19,'accounting'),(20,'legal'),(21,'my'),(22,'task'),(23,'tasks'),(24,'hr'),(25,'engineering'),(26,'marketing'),(27,'popular'),(28,'mail'),(29,'mobile'),(30,'code'),(31,'api'),(32,'office'),(33,'features'),(34,'bugs'),(35,'internal'),(36,'sales'),(37,'customers'),(38,'erp'),(39,'social'),(40,'finance'),(41,'events'),(42,'calendar'),(43,'discussions'),(44,'todos'),(45,'plan'),(46,'images'),(47,'downloads'),(48,'feeds'),(49,'rss'),(50,'groups'),(51,'services'),(52,'products'),(53,'chat'),(54,'news'),(55,'alerts'),(56,'corporate'),(57,'company'),(58,'about'),(59,'alpha'),(60,'beta'),(61,'answers'),(62,'buy'),(63,'projects'),(64,'project'),(65,'consulting'),(66,'data'),(67,'developer'),(68,'developers'),(69,'test'),(70,'local'),(71,'assets'),(72,'signup'),(73,'feedback'),(90,'krawler'),(75,'billing'),(76,'pay'),(77,'payment'),(78,'shashank'),(79,'brajesh'),(80,'somesh'),(81,'paritosh'),(82,'wiki'),(83,'plugin'),(84,'addon'),(85,'download'),(86,'upload'),(87,'media'),(88,'press'),(89,'pr'),(91,'meet'),(92,'meeting'),(93,'meetings'),(94,'meets'),(95,'epay'),(96,'epayment'),(97,'epayslip'),(98,'epayslips'),(99,'payslips'),(100,'payslip'),(101,'admin'),(102,'s'),(103,'iphone'),(104,''),(106,'hrms'),(107,'eleave'),(108,'lms'),(109,'travel'),(110,'ess');
/*!40000 ALTER TABLE `defaultdomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deldocs`
--

DROP TABLE IF EXISTS `deldocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deldocs` (
  `docid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  KEY `docid` (`docid`),
  KEY `userid` (`userid`),
  CONSTRAINT `deldocs_ibfk_1` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deldocs_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deldocs`
--

LOCK TABLES `deldocs` WRITE;
/*!40000 ALTER TABLE `deldocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `deldocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docprerel`
--

DROP TABLE IF EXISTS `docprerel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docprerel` (
  `docid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `permission` text,
  `readwrite` int(11) default NULL,
  KEY `docprerel_fk_2` (`userid`),
  KEY `docprerelfk1` (`docid`),
  CONSTRAINT `docprerelfk1` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docprerel`
--

LOCK TABLES `docprerel` WRITE;
/*!40000 ALTER TABLE `docprerel` DISABLE KEYS */;
/*!40000 ALTER TABLE `docprerel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs`
--

DROP TABLE IF EXISTS `docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs` (
  `docid` varchar(50) NOT NULL,
  `docname` text,
  `docsize` text,
  `doctype` text,
  `docdatemod` datetime default NULL,
  `userid` varchar(50) default NULL,
  `docper` text,
  `docstatus` text,
  `docrevision` text,
  `groupid` varchar(50) default NULL,
  `comments` varchar(80) default NULL,
  `version` text,
  `svnname` text,
  `storageindex` int(11) NOT NULL,
  `docprojper` varchar(1024) NOT NULL default '',
  PRIMARY KEY  (`docid`),
  KEY `docid` (`docid`),
  KEY `docs_fk_1` (`userid`),
  CONSTRAINT `docs_fk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs`
--

LOCK TABLES `docs` WRITE;
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docsToConvertList`
--

DROP TABLE IF EXISTS `docsToConvertList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docsToConvertList` (
  `docid` varchar(50) NOT NULL,
  KEY `docstoconvert_fk1` (`docid`),
  CONSTRAINT `docstoconvert_fk1` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docsToConvertList`
--

LOCK TABLES `docsToConvertList` WRITE;
/*!40000 ALTER TABLE `docsToConvertList` DISABLE KEYS */;
/*!40000 ALTER TABLE `docsToConvertList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docstags`
--

DROP TABLE IF EXISTS `docstags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docstags` (
  `docid` varchar(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `tagid` varchar(50) NOT NULL,
  KEY `docid` (`docid`),
  KEY `tagid` (`tagid`),
  CONSTRAINT `docstags_ibfk_1` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `docstags_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `unitags` (`tagid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docstags`
--

LOCK TABLES `docstags` WRITE;
/*!40000 ALTER TABLE `docstags` DISABLE KEYS */;
/*!40000 ALTER TABLE `docstags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctagrel`
--

DROP TABLE IF EXISTS `doctagrel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctagrel` (
  `docid` varchar(50) default NULL,
  `tagid` varchar(50) default NULL,
  `userid` varchar(50) default NULL,
  `groupid` varchar(50) default NULL,
  `pcid` varchar(50) default NULL,
  KEY `doctagrel_fk_1` (`docid`),
  KEY `doctagrel_fk_3` (`userid`),
  KEY `tagid` (`tagid`),
  CONSTRAINT `doctagrel_fk_1` FOREIGN KEY (`docid`) REFERENCES `docs` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctagrel_fk_3` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doctagrel_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `usertags` (`tagid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctagrel`
--

LOCK TABLES `doctagrel` WRITE;
/*!40000 ALTER TABLE `doctagrel` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctagrel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventguestlist`
--

DROP TABLE IF EXISTS `eventguestlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventguestlist` (
  `eid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `status` char(1) NOT NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  KEY `eid` (`eid`),
  KEY `userid` (`userid`),
  CONSTRAINT `eventguestlist_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `calendarevents` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `eventguestlist_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventguestlist`
--

LOCK TABLES `eventguestlist` WRITE;
/*!40000 ALTER TABLE `eventguestlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventguestlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventreminder`
--

DROP TABLE IF EXISTS `eventreminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventreminder` (
  `rid` varchar(36) NOT NULL,
  `eid` varchar(36) NOT NULL,
  `rtype` char(1) NOT NULL,
  `rtime` int(5) NOT NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`rid`),
  KEY `eid` (`eid`),
  CONSTRAINT `eventreminder_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `calendarevents` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventreminder`
--

LOCK TABLES `eventreminder` WRITE;
/*!40000 ALTER TABLE `eventreminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventreminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featurelist`
--

DROP TABLE IF EXISTS `featurelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featurelist` (
  `featureid` int(11) NOT NULL,
  `featurename` varchar(50) character set latin1 NOT NULL,
  `displayfeaturename` varchar(50) NOT NULL,
  PRIMARY KEY  (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featurelist`
--

LOCK TABLES `featurelist` WRITE;
/*!40000 ALTER TABLE `featurelist` DISABLE KEYS */;
INSERT INTO `featurelist` VALUES (1,'User','User Administration'),(2,'Project','Project Administration'),(3,'Company','Company Administration'),(4,'AuditTrail','Audit Trail'),(5,'CustomReport','Custom Report');
/*!40000 ALTER TABLE `featurelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featureslist`
--

DROP TABLE IF EXISTS `featureslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featureslist` (
  `featureid` int(11) NOT NULL,
  `featurename` varchar(50) character set latin1 NOT NULL,
  `featureshortname` varchar(5) NOT NULL default '',
  `issubscribed` bit(1) NOT NULL default b'0',
  PRIMARY KEY  (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featureslist`
--

LOCK TABLES `featureslist` WRITE;
/*!40000 ALTER TABLE `featureslist` DISABLE KEYS */;
INSERT INTO `featureslist` VALUES (1,'Calendar','cal',''),(2,'Personal Messages','pm',''),(3,'Project Plan','proj',''),(4,'Document Management','docs',''),(5,'Discussion','disc','\0'),(6,'To-Do List','todo','\0');
/*!40000 ALTER TABLE `featureslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featureslistview`
--

DROP TABLE IF EXISTS `featureslistview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featureslistview` (
  `featureid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  KEY `companyid` (`companyid`),
  CONSTRAINT `featureslistview_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featureslistview`
--

LOCK TABLES `featureslistview` WRITE;
/*!40000 ALTER TABLE `featureslistview` DISABLE KEYS */;
INSERT INTO `featureslistview` VALUES (126,'8e94f514-e2d0-11e1-a6f4-001e58a79890');
/*!40000 ALTER TABLE `featureslistview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpcontent`
--

DROP TABLE IF EXISTS `helpcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helpcontent` (
  `activetab` varchar(30) NOT NULL,
  `title` varchar(255) default NULL,
  `titletextkey` varchar(255) default NULL,
  `descp` varchar(1255) default NULL,
  `descriptiontextkey` varchar(1255) default NULL,
  `compid` varchar(30) NOT NULL,
  `helpindex` int(11) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpcontent`
--

LOCK TABLES `helpcontent` WRITE;
/*!40000 ALTER TABLE `helpcontent` DISABLE KEYS */;
INSERT INTO `helpcontent` VALUES ('home','Project Settings','Project.Settings','Project Settings can be configured only by the users who have been assigned permissions. Manage project members, resources, send invitations and requests for the project.','home.Project.Settings','admin',4),('home','Project Details','Project.Details','View your project details like creation and start date, description, add tags and more. Subscribe to daily email notifications and also view project updates on your project homepage.','home.Project.Details','tagsspan1',1),('home','Project Members','Project.Members','Displays the list of users assigned to the project. Click on a project member to view his/her profile.','home.Project.Members','view1',2),('home','Project Links','Project.Links','Access these links to manage the following for a project: <ul class=\"helpul\"><li class=\"helpli\"/><span class=\"helplitext\"> Project Plan</span><li class=\"helpli\"/><span class=\"helplitext\"> Discussion</span><li class=\"helpli\"/><span class=\"helplitext\"> To-do List</span><li class=\"helpli\"/><span class=\"helplitext\"> Team Calendar</span><li class=\"helpli\"/><span class=\"helplitext\"> Documents</span><li class=\"helpli\"/><span class=\"helplitext\"> Project Settings </span></ul>','home.Project.Links','teamCal',3),('projectplan','Gantt Chart','Gantt.Chart','Monitor task progress through interactive Gantt Charts. You can easily drag and drop tasks and collaborate in real time.','projectplan.Gantt.Chart','ganttChart',2),('projectplan','Tasks','Tasks','Add/edit all your project tasks along with their duration, dates, predecessors and resources in the task grid. Adding tasks is as easy as using a spreadsheet.','projectplan.Tasks','projGrid',1),('projectplan','Task Notifications','Task.Notifications','Notify all or selected few in the project about the task updates.','projectplan.Task.Notifications','projPlanNotification',11),('projectplan','Change Project Start Date','Change.Project.Start.Date','Change the existing start date of the project and assign a new start date to the project easily.','projectplan.Change.Project.Start.Date','projPlanStartDate',10),('projectplan','Sync to Calendar','Sync.to.Calendar','Synchronize all your project tasks with the team calendar in a single click.','projectplan.Sync.to.Calendar','projPlanCalSync',7),('projectplan','Task Resources','Task.Resources','Click to view assigned resources for the tasks on the Gantt Chart.','projectplan.Task.Resources','projPlanResource',6),('projectplan','Overdue Tasks','Overdue.Tasks','Click to locate overdue tasks in the project which are highlighted in red in both the task grid as well as Gantt Chart.','projectplan.Overdue.Tasks','projPlanOverdue',5),('projectplan','Task Indent/Outdent','Task.IndentOutdent','Make a task as the main heading/sub heading by outdenting/indenting it.','projectplan.Task.IndentOutdent','projPlanOutdent',3),('projectplan','Resource Conflicts','Resource.Conflicts','View the tasks and resources assigned to each task. Resource conflicts arise when more than one resource is assigned to more than one task at the same time. View the conflicted tasks and resolve them by either assigning it to other resource or by changing the task dates.','projectplan.Resource.Conflicts','resourceConflict',12),('projectplan','Project Reports','Project.Reports','Generate extensive reports on the current status of your project. Various reports on activities, resources, milestones, project costs and more can be generated instantly.','projectplan.Project.Reports','projPlanReport',9),('projectplan','Import/Export Project Plan','ImportExport.Project.Plan','Import/export your existing plans from Microsoft Project. Both .mpp and .mpx files are supported. Also projects can be embedded anywhere on the web.','projectplan.ImportExport.Project.Plan','projPlanImport',8),('projectplan','Task Progress','Task.Progress','Monitor task progress (% complete) for all tasks on the Gantt Chart.','projectplan.Task.Progress','projPlanProgress',4),('home','Project Home','Project.Home','This is your Project Homepage - A central location for all project-related information. Access Project Plan, Calendars, Discussions, To-Do Lists, Documents and more from here. ','home.Project.Home','1',0),('projectplan','Project Plan','Project.Plan','Prepare a road map for your project and list down all the possible steps or actions which will be undertaken for the completion of the project. View allocated resources, its completion time as well as depict the project activities on interactive and easy to understand Gantt Charts.','projectplan.Project.Plan','2',0),('discussion','Discussion Forums','Discussion.Forums','Start a discussion with your project members through dedicated discussion forums for each project, get the message preview in a single click and also use rich text editing while drafting your message.','discussion.Discussion.Forums','3',0),('discussion','Reply to Threads','Reply.to.Threads','Reply to the messages you receive and interact with the project members.','discussion.Reply.to.Threads','Reply',2),('discussion','New Thread','New.Thread','Draft a new message and send it to the members in your project.','discussion.New.Thread','newMessage',1),('teamcalendar','Project Calendar','Project.Calendar','Get a view of the calendar and its events in your desired format - daily, work weekly, weekly or monthly.','teamcalendar.Project.Calendar','workweekAction1',2),('teamcalendar','Calendar Events','Calendar.Events','Fix the agenda either for a day/week/month and assign resources to them as well.','teamcalendar.Calendar.Events','agendaAction1',3),('teamcalendar','Add New Events','Add.New.Events','Add new events in the calendar and manage them efficiently.','teamcalendar.Add.New.Events','createEvent',1),('teamcalendar','Import/Export Calendars','ImportExport.Calendars','Import/Export calendars in iCal format which allows you to sync with popular calendars including Microsoft Outlook, Google, Yahoo, Blackberry and iPhone.','teamcalendar.ImportExport.Calendars','exportICSAction1',4),('teamcalendar','Project Calendar','Project.Calendar','Organize all your project events and the activities to be performed by all the team members. Add new events on a daily, weekly or monthly basis and also export or import the project events.','teamcalendar.Project.Calendar','4',0),('todolist','To-Do List','ToDo.List','Streamline your project tasks by creating to-do lists and also notify it to project members. Mark the to-do as \'done\' after completion and edit/delete them.','todolist.ToDo.List','5',0),('todolist','To-Do List Notifications','ToDo.List.Notifications','Notify all or selected project members for the tasks to be done.','todolist.ToDo.List.Notifications','todoNotification',3),('todolist','To-Do Groups','ToDo.Groups','Manage your to-dos by adding them in specific groups.','todolist.ToDo.Groups','todoAddGroup',1),('todolist','Project To-Dos','Project.ToDos','Manage many concurrent activities in the project by adding project to-dos.','todolist.Project.ToDos','todoAddTodo',2),('document','Project Level Documents','Project.Level.Documents','Manage project relevant documents by uploading, viewing, downloading, arranging them in groups and more.','document.Project.Level.Documents','6',0),('document','Arrange in Groups','Arrange.in.Groups','Arrange the uploaded documents in specific folders systematically.','document.Arrange.in.Groups','toggleBttn',2),('document','Download Document','Download.Document','Select a document and download it from here.','document.Download.Document','down_butt',3),('document','Add Files','Add.Files','Add new documents by uploading them from an external location.','document.Add.Files','addFile',1),('useradministration','User Administration','User.Administration','Manage all the users in various projects effectively and maintain their basic details in the system. Users can always update their profiles later. Role based access is employed throughout the system. Use \'Assign Permissions\' to ensure that only authorized personnel have access to sensitive information. ','useradministration.User.Administration','7',0),('useradministration','Announcements for Users','Announcements.for.Users','Make important announcements either to all or to selected few.','useradministration.Announcements.for.Users','uannounce',3),('useradministration','Assign Permissions','Assign.Permissions','Enable role-based permissions to selected users and assign them permissions to view/edit/modify the project information.','useradministration.Assign.Permissions','permissions',2),('useradministration','Allocate Users to Projects','Allocate.Users.to.Projects','Select a user from the list and click here to assign him to a particular project.','useradministration.Allocate.Users.to.Projects','addto',1),('projectadministration','Project Administration','Project.Administration','Manage all the projects in the system by creating new, editing the existing projects, assigning/removing project members and more. Also, import all your project details from Basecamp and start working with Project Management instantly.','projectadministration.Project.Administration','8',0),('projectadministration','Project Announcements','Project.Announcements','Make important announcements to specific person(s) or to all concerned.','projectadministration.Project.Announcements','pannounce',5),('projectadministration','Activate Archived Project(s)','Activate.Archived.Projects','Activate the projects from the list of archived projects as & when required.','projectadministration.Activate.Archived.Projects','unarchive',4),('projectadministration','Archive Project','Archive.Project','Archive the projects which are either completed or no longer active.','projectadministration.Archive.Project','archive',3),('projectadministration','Manage Projects','Manage.Projects','Create a new project, edit the existing ones or delete them. Add project details and manage the members involved in each project easily.','projectadministration.Manage.Projects','manageuser',2),('projectadministration','Import From Basecamp','Import.From.Basecamp','Import your existing project(s) from Basecamp and start working with Project Management instantly.','projectadministration.Import.From.Basecamp','importfrombasecamp',1),('companyadministration','Company Administration','Company.Administration','Customize Project Management for your organization by specifying company details, defining company holidays and uploading company logo and more. Also, select the HQ timezone and currency for all your company transactions.','companyadministration.Company.Administration','9',0),('companyadministration','Feature View','Feature.View','Select the features which you want to see on the dashboard and hide others.','companyadministration.Feature.View','companyFeatureView',3),('companyadministration','Module Subscription','Module.Subscription','Subscribe/Unsubscribe to various modules like online calendar, personal messages, project, document management and more.','companyadministration.Module.Subscription','companyModuleSubscription',2),('companyadministration','Company Details','Company.Details','View basic company details like contact details, company logo, company address and more.','companyadministration.Company.Details','compInfoFieldSet',1),('friends','My Network','My.Network','Connect to people in your project or otherwise and add them to your network to chat with them in real-time. Click on user image to view their profile or view user details by switching to Details View.','friends.My.Network','10',0),('friends','My Network - List View','My.Network.List.View','View comprehensive details of people in your network.','friends.My.Network.List.View','network_detail',2),('friends','My Network - Icon View','My.Network.Icon.View','View members in your network in iconic form and click on any of the members to view their profiles.','friends.My.Network.Icon.View','network_icon',1),('contactpanel','Keep in Touch!','Keep.in.Touch','All your contacts are listed here. You can easily import/export contacts into the application. View online friends and chat with them in real-time.','contactpanel.Keep.in.Touch','11',0),('contactpanel','Import/Export Contacts','ImportExport.Contacts','Export/import the contacts in CSV format and manage your contacts effectively.','contactpanel.ImportExport.Contacts','ImportContact',4),('contactpanel','Add a New Contact','Add.a.New.Contact','Add a new contact easily or edit the existing ones.','contactpanel.Add.a.New.Contact','addExtContact',3),('contactpanel','View Profile','View.Profile','Maintain comprehensive details of all the members in your contact list. Select a contact to view his/her full profile.','contactpanel.View.Profile','viewOldProfileButtoon',2),('contactpanel','Chat','Chat','View all the contacts in your network and click on a contact to start a conversation.','contactpanel.Chat','contactsview',1),('audittrail','Audit Trail','Audit.Trail','Keep a track of all the activities in the project with the date and time of changes in the system. ','audittrail.Audit.Trail','12',0),('audittrail','Filter by Dates','Filter.by.Dates','Use date filters and other filters related to project, administration or documents for your convenience.','audittrail.Filter.by.Dates','_filteredate',1),('audittrail','Search','Search','The search-as-you-type feature enables you to search as soon as you start typing.','audittrail.Search','user',2),('pmessage','Personal Messages','Personal.Messages','Manage all your emails with our personal messages feature. Send and receive messages, arrange mails in folders, add flags and more.','pmessage.Personal.Messages','13',0),('pmessage','Your Mails','Your.Mails','Select a folder from the left and view all the mails under that folder. Click on a mail to see its preview in the window below.','pmessage.Your.Mails','grid123',1),('pmessage','Compose Mail','Compose.Mail','Compose emails using rich text formatting. Attach files if you wish and click send. You can also choose to save it as a Draft if you don\'t want to send the mail right away.','pmessage.Compose.Mail','compMail',2),('dashboard','Welcome!','Welcome','Welcome to Project Management!<br><br> Here are some tips to help you get started in less than a minute! Let\'s take a Quick Tour!','dashboard.Welcome','0',0),('dashboard','Your Projects','Your.Projects','Access tools to manage all your projects. Both current as well as archived projects are listed.Click on a project to do the following:<br><ul class=\"helpul\"><li class=\"helpli\"/><span class=\"helplitext\"> Add/View users in the project</span><li class=\"helpli\"/><span class=\"helplitext\">Add/View Project Plan</span><li class=\"helpli\"/><span class=\"helplitext\"> Discuss on topics related to the project</span><li class=\"helpli\"/><span class=\"helplitext\"> Manage To-do Lists</span><li class=\"helpli\"/><span class=\"helplitext\"> Maintain Team Calendar</span><li class=\"helpli\"/><span class=\"helplitext\"> Manage Project Documents</span><li class=\"helpli\"/><span class=\"helplitext\"> Configure Project Settings</span>','dashboard.Your.Projects','dashproject',1),('dashboard','Administration','Administration','Configure settings for all your projects, users and company. Administration allows you to:<br><ul class=\"helpul\"><li class=\"helpli\"/><div class=\"helplitext\"> Define roles and permissions for the users in the system</div><li class=\"helpli\"/><div class=\"helplitext\"> Manage projects (add new, edit, archive and import projects) and assign users</div><li class=\"helpli\"/><div class=\"helplitext\"> Configure company preferences and settings</div></ul>','dashboard.Administration','dashadmin',3),('dashboard','Announcements','Announcements','Get a quick view of all the announcements made, related to the project or otherwise on the dashboard itself. Also, make announcements and keep others updated.','dashboard.Announcements','announcements_drag',4),('dashboard','Track Project Progress','Track.Project.Progress','Intuitive project charts enable you to get an overview of the completeness of all current projects.','dashboard.Track.Project.Progress','chart_drag',5),('todolist','Import To-Dos in CSV Format','Import.ToDos.in.CSV.Format','Easily import project to-dos from an external location. Select a CSV file and click import to get your to-do tasks right here.','todolist.Import.ToDos.in.CSV.Format','importtodo',4),('adminmember','Drop Members','Drop.Members','Select a member from the list and drop him/her from the project as and when required. You will not be able to use this member as a resource in the project after dropping.<br>However, you can always add the member back in the project.','adminmember.Drop.Members','dropmem',1),('adminmember','Project Administration: Members','Project.Administration.Members','Manage all your project members from here. Project moderators can drop members, change their plan permissions, make them inactive and more.','adminmember.Project.Administration.Members','15',0),('adminmember','Activate Members','Activate.Members','Activate or inactivate the project members. Inactive members will not contribute to the project. However, you can get them back into the project by setting them active.','adminmember.Activate.Members','activateMember',2),('adminmember','Set as Moderator','Set.as.Moderator','Select a member and set him/her as project moderator so as to enable him to perform moderator functions.','adminmember.Set.as.Moderator','setmod',3),('adminmember','Remove Moderator','Remove.Moderator','Select a moderator and click here to set him/her as a project member.','adminmember.Remove.Moderator','remmod',4),('adminmember','Change Plan Permission','Change.Plan.Permission','Configure plan permissions based on user roles. Note that there are three levels of Plan Permissions:<ul class=\'helpul\'><li class=\'helpli\'/><span class=\'helplitext\'><b>Modify</b> - Allows to add/modify/delete the tasks</span><li class=\'helpli\'/><span class=\'helplitext\'><b>View</b> - Only view the tasks but cannot modify them</span><li class=\'helpli\'/><span class=\'helplitext\'><b>Modify Assigned Tasks</b> - View and modify only the tasks that are assigned to them</span></ul>','adminmember.Change.Plan.Permission','chgperm',5),('admininvite','Invite Users in this Project','Invite.Users.in.this.Project','Invite other users into this project. You can also send invitations to multiple users at a time.','admininvite.Invite.Users.in.this.Project','invite',1),('admininvite','Project Settings: Invitations','Project.Settings.Invitations','Invite users to your project from here.','admininvite.Project.Settings.Invitations','16',0),('adminrequest','Project Settings: Requests','Project.Settings.Requests','View all the incoming requests from other users who wish to be a part of this project.','adminrequest.Project.Settings.Requests','17',0),('adminrequest','Accept Request','Accept.Request','Accept the request of other users to be a part of this project.','adminrequest.Accept.Request','accept',1),('adminrequest','Reject Request','Reject.Request','Reject the request to join this project.','adminrequest.Reject.Request','reject',2),('adminresource','Project Settings: Resources','Project.Settings.Resources','Various types of resources are involved in a project. You can manage all your resources by adding, editing or deleting them and setting them as billable/unbillable. Also, distinguish them from others by assigning a unique color code.','adminresource.Project.Settings.Resources','18',0),('adminresource','Resource Management','Resource.Management','Manage all your project resources from here. You can:<br><ul class=\'helpul\'><li class=\'helpli\'><span class=\'helplitext\'> Create a new resource</span><li class=\'helpli\'><span class=\'helplitext\'> Edit an existing resource</span><li class=\'helpli\'><span class=\'helplitext\'> Delete a resource. Note that, deleting a resource assigned to a task will deactivate that resource</span><li class=\'helpli\'><span class=\'helplitext\'> Activate the deactivated resource</span></ul>','adminresource.Resource.Management','manageResMenu',1),('adminresource','Make Resouce Billable/Non-billable','Make.Resouce.BillableNonbillable','Set a resource as either billable or non-billable depending upon the cost involved in it.','adminresource.Make.Resouce.BillableNonbillable','billable',2),('admincalendar','Project Calendar','Project.Calendar','View project events on a work weekly basis and define the work timings as well as holidays. ','admincalendar.Project.Calendar','19',0),('user','User Profile','User.Profile','View profile details of a user from here. Also, assign them to project(s), send message and more.','user.User.Profile','20',0),('user','Profile Details','Profile.Details','The basic details of the user along with his/her profile picture are displayed here.','user.Profile.Details','tagsdiv4',1),('user','Drop user from your network','Drop.user.from.your.network','Click here to remove the selected user from your network. However, you can add back the user at any point of time.','user.Drop.user.from.your.network','connection',2),('user','Edit Tags','Edit.Tags','Add tag(s) to the user to easily locate it from a list of users. Use User Search and type \'tag: <tagname>\' in the search box above to search the user with the help of assigned tags.','user.Edit.Tags','editTag',3),('user','Send a Mail to this User','Send.a.Mail.to.this.User','Send this user a quick message from here.<br><br>','user.Send.a.Mail.to.this.User','sendPMsgBtn',4),('user','Add to Project(s)','Add.to.Projects','Assign this user to one or more projects as a project member. <br><br>','user.Add.to.Projects','addToProjBtn',5),('dashboard','One Search','One.Search','Search any entry in Project Management instantly with \'One Search\'. The search-as-you-type functionality allows you to search as soon as you start typing. Use \'Categorized Search\' to locate specific entries in Project Management. Note that, you can search here by 2 ways: <ul class=helpul><li class=helpli/><div class=helplitext> Using normal textual words or sentences</div><li class=helpli/><div class=helplitext> Tag Search by inserting \'tag:[tag-to-be-searched]\' (without [ ] signs)</div></ul>','dashboard.One.Search','textSearch',6),('loginuser','My Profile Central','My.Profile.Central','Update your profile by adding your personal details, configuring the date and time formats and more. ','loginuser.My.Profile.Central','21',0),('mydocuments','View Revisions','View.Revisions','If versioning is activated for a particular document, you can view the document revision list from here. It lists all the versions of those documents so you can select the one which you are looking for.','mydocuments.View.Revisions','revlist_butt',8),('mydocuments','Activate Document Versioning ','Activate.Document.Versioning.','Maintain different versions of a single document by activating versioning. Versioning facilitates a single document to be uploaded multiple times keeping the old copies intact. You can choose to activate or deactivate it for specific documents.','mydocuments.Activate.Document.Versioning.','ver_butt',7),('mydocuments','Delete a Document','Delete.a.Document','Select a document and click here to delete it. You can only delete the document(s) uploaded by you.','mydocuments.Delete.a.Document','del_butt',4),('mydocuments','Upload a Document','Upload.a.Document','Upload a new document from here. Note that, by default the uploaded document will not be shared between other members.','mydocuments.Upload.a.Document','addFile',3),('mydocuments','Your Documents','Your.Documents','View all your documents with their details here. Right click on a document to set accessibility permissions for it.','mydocuments.Your.Documents','topic-grid',2),('mydocuments','Document Tags','Document.Tags','Add tags to the documents for quick search. Click on a document and enter your tag in the \'Add Tag\' box. For searching a tagged document, select the tag name here in this list.','mydocuments.Document.Tags','tree',1),('mydocuments','My Documents','My.Documents','Get an instant access to all your documents here. Add new, edit the existing ones, maintain document versioning, view revision list, download them and more. ','mydocuments.My.Documents','22',0),('mydocuments','Arrange Documents in Groups','Arrange.Documents.in.Groups','Click here to arrange the documents according to file types in specific groups. You can use combination of Group and Sort (on the right of this button) to configure the document view.','mydocuments.Arrange.Documents.in.Groups','toggleBttn',5),('mydocuments','Download a Document','Download.a.Document','Select a document from the list and click here to download it. Note that, only the permitted documents can be downloaded.','mydocuments.Download.a.Document','down_butt',6),('discussion','Delete a Thread','Delete.a.Thread','Delete the selected thread by clicking here. Deleting the thread causes all sub-threads to be deleted as well.','discussion.Delete.a.Thread','Delete',3),('dashboard','Add Project Widget(s) and Project Quick Links on the Dashboard','Add.Project.Widgets.and.Project.Quick.Links.on.the.Dashboard','A project widget provides comprehensive details and updates related to a project. It also facilitates you to quickly add tasks, events and to-dos, view reports, subscribe to RSS feeds and more.<br>Customize your dashboard by selecting the project widget which you want to view on the dashboard.<br><br>Also select which project\'s quick links you want to display here in \'Quick Links\' widget.','dashboard.Add.Project.Widgets.and.Project.Quick.Links.on.the.Dashboard','dashlink',2),('archiveproject','Archived Projects','Archived.Projects','Projects currently not in use and stored for future reference are archived projects. You can view all the archived projects here. Only the administrator has the permission to archive or activate a project.','archiveproject.Archived.Projects','23',0),('archiveproject','Archived Projects - Icon View','Archived.Projects.Icon.View','Switch to icon view of the archived projects. Click on any project icon to navigate to its project homepage wherein you can only view the project tasks but cannot update it.','archiveproject.Archived.Projects.Icon.View','network_icon',1),('archiveproject','Archived Projects - List View','Archived.Projects.List.View','Switch to details view of the archived projects to view comprehensive details of the archived projects.','archiveproject.Archived.Projects.List.View','network_detail',2),('welcomedashboard','Welcome!','Welcome','Welcome to Project Management!<br><br> Here are some tips to help you get started in less than a minute! Let\'s take a Quick Tour!','welcomedashboard.Welcome','0',0),('welcomedashboard','Your Projects','Your.Projects','Access tools to manage all your projects. It displays the list of current and archived projects.Click on a project to do the following:<br><ul class=\"helpul\"><li class=\"helpli\"/><span class=\"helplitext\"> Add/View users in the project</span><li class=\"helpli\"/><span class=\"helplitext\">Add/View Project Plan</span><li class=\"helpli\"/><span class=\"helplitext\"> Discuss on topics related to the project</span><li class=\"helpli\"/><span class=\"helplitext\"> Manage To-do Lists</span><li class=\"helpli\"/><span class=\"helplitext\"> Maintain Team Calendar</span><li class=\"helpli\"/><span class=\"helplitext\"> Manage Project Documents</span>','welcomedashboard.Your.Projects','dashproject',1),('welcomedashboard','Administration','Administration','Configure settings for all your projects, users and company. Administration allows you to:<br><ul class=\"helpul\"><li class=\"helpli\"/><div class=\"helplitext\"> Define roles and permissions for the users in the system</div><li class=\"helpli\"/><div class=\"helplitext\"> Manage projects (add new, edit, archive and import projects) and assign users</div><li class=\"helpli\"/><div class=\"helplitext\"> Configure company preferences and settings</div></ul>','welcomedashboard.Administration','dashadmin',2),('welcomedashboard','Announcements','Announcements','Get a quick overview of all the announcements made, related to the project or otherwise, right on the dashboard. Also, make announcements and keep others updated.','welcomedashboard.Announcements','announcements_drag',3),('welcomedashboard','One Search','One.Search','Search any entry in Project Management instantly with \'One Search\'. The search-as-you-type functionality allows you to search as soon as you start typing. Use \'Categorized Search\' to locate specific entries in Project Management. Note that, you can search here by 2 ways: <ul class=helpul><li class=helpli/><div class=helplitext> Using normal textual words or sentences</div><li class=helpli/><div class=helplitext> Tag Search by inserting \'tag:[tag-to-be-searched]\' (without [ ] signs)</div></ul>','welcomedashboard.One.Search','textSearch',4),('project','My Projects','My.Projects','View all your projects in a single screen. ','project.My.Projects','24',0),('project','My Projects - Icon View','My.Projects.Icon.View','View all projects in iconic form and click on any of the project to view their details.','project.My.Projects.Icon.View','network_icon',1),('project','My Projects - List View','My.Projects.List.View','View comprehensive details of all projects.','project.My.Projects.List.View','network_detail',2),('importlog','Import Log','','View import log for project plans imported in CSV format. You can filter the log details either by using date filters or you can search for log details.','','25',0);
/*!40000 ALTER TABLE `helpcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideskeraauth`
--

DROP TABLE IF EXISTS `ideskeraauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideskeraauth` (
  `userid` varchar(36) default '',
  `appnum` varchar(36) default '',
  `udid` varchar(40) default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideskeraauth`
--

LOCK TABLES `ideskeraauth` WRITE;
/*!40000 ALTER TABLE `ideskeraauth` DISABLE KEYS */;
INSERT INTO `ideskeraauth` VALUES ('bb42ed89-334f-4bd9-abec-6310b9fc795a','3a36d8e2-638b-4ac1-bc5f-68053fcaf110','50BA0AE0-CFB4-11DE-9990-A2D356D89593'),('bb42ed89-334f-4bd9-abec-6310b9fc795a','2f978db9-21eb-40e9-96f0-c0a3b8beb675','50BA0AE0-CFB4-11DE-9990-A2D356D89593');
/*!40000 ALTER TABLE `ideskeraauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importlog`
--

DROP TABLE IF EXISTS `importlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importlog` (
  `id` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `svnname` varchar(255) NOT NULL,
  `type` varchar(255) default NULL,
  `log` varchar(255) default NULL,
  `totalrecs` int(11) default '0',
  `rejected` int(11) default '0',
  `errorcount` int(11) default '0',
  `timestamp` datetime NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `projectid` varchar(255) default NULL,
  `companyid` varchar(255) NOT NULL,
  `logkey` varchar(50) default NULL,
  `modulenamekey` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importlog`
--

LOCK TABLES `importlog` WRITE;
/*!40000 ALTER TABLE `importlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `importlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krawlerforum_posts`
--

DROP TABLE IF EXISTS `krawlerforum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krawlerforum_posts` (
  `post_id` varchar(50) NOT NULL,
  `post_poster` varchar(40) default NULL,
  `topic_id` varchar(50) NOT NULL,
  `group_id` varchar(50) default NULL,
  `topic_title` varchar(60) default NULL,
  `post_time` datetime default NULL,
  `post_subject` varchar(1024) default NULL,
  `post_text` text,
  `reply_to` varchar(60) default NULL,
  `flag` tinyint(1) default '0',
  `ifread` tinyint(1) default '0',
  `reply_to_post` varchar(40) default NULL,
  PRIMARY KEY  (`post_id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reply_to` (`reply_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krawlerforum_posts`
--

LOCK TABLES `krawlerforum_posts` WRITE;
/*!40000 ALTER TABLE `krawlerforum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `krawlerforum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krawlerforum_topics`
--

DROP TABLE IF EXISTS `krawlerforum_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krawlerforum_topics` (
  `topic_id` varchar(50) NOT NULL,
  `group_id` varchar(50) default NULL,
  `topic_title` text,
  `topic_poster` varchar(60) NOT NULL,
  `post_time` datetime default NULL,
  `post_subject` text,
  `post_text` text,
  `ifread` tinyint(1) default '0',
  `flag` tinyint(1) default NULL,
  PRIMARY KEY  (`topic_id`),
  KEY `topic_poster` (`topic_poster`),
  CONSTRAINT `krawlerforum_topics_ibfk_2` FOREIGN KEY (`topic_poster`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krawlerforum_topics`
--

LOCK TABLES `krawlerforum_topics` WRITE;
/*!40000 ALTER TABLE `krawlerforum_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `krawlerforum_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `langcode` varchar(10) default NULL,
  `countrycode` varchar(10) default NULL,
  `langname` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'en','US','English (United States)'),(2,'hi','IN','Hindi (India)');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailmessages`
--

DROP TABLE IF EXISTS `mailmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailmessages` (
  `post_id` varchar(50) NOT NULL,
  `to_id` varchar(50) default NULL,
  `poster_id` varchar(50) default NULL,
  `post_subject` text,
  `post_text` text,
  `post_time` timestamp NULL default CURRENT_TIMESTAMP,
  `flag` tinyint(1) NOT NULL default '0',
  `folder` varchar(50) NOT NULL,
  `reply_to` varchar(50) default NULL,
  `last_folder_id` varchar(50) NOT NULL,
  `readflag` tinyint(1) default '0',
  PRIMARY KEY  (`post_id`),
  KEY `to_id` (`to_id`),
  KEY `poster_id` (`poster_id`),
  KEY `folder` (`folder`),
  KEY `last_folder_id` (`last_folder_id`),
  CONSTRAINT `mailmessages_ibfk_1` FOREIGN KEY (`to_id`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mailmessages_ibfk_2` FOREIGN KEY (`poster_id`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mailmessages_ibfk_3` FOREIGN KEY (`folder`) REFERENCES `mailmsgfoldermap` (`folder_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailmessages`
--

LOCK TABLES `mailmessages` WRITE;
/*!40000 ALTER TABLE `mailmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailmsgfoldermap`
--

DROP TABLE IF EXISTS `mailmsgfoldermap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailmsgfoldermap` (
  `folder_id` varchar(50) NOT NULL,
  `folder_name` text NOT NULL,
  `folder_path` text,
  PRIMARY KEY  (`folder_id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailmsgfoldermap`
--

LOCK TABLES `mailmsgfoldermap` WRITE;
/*!40000 ALTER TABLE `mailmsgfoldermap` DISABLE KEYS */;
INSERT INTO `mailmsgfoldermap` VALUES ('0','Inbox','Personal Messages\\Inbox'),('1','Outbox','Personal Messages\\Outbox'),('2','Deleted Items','Personal Messages\\Deleted Items'),('3','Drafts','Personal Messages\\Drafts'),('4','Deleted Items','Personal Messages\\Deleted Items');
/*!40000 ALTER TABLE `mailmsgfoldermap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailuserfoldersmap`
--

DROP TABLE IF EXISTS `mailuserfoldersmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailuserfoldersmap` (
  `userid` varchar(50) NOT NULL,
  `folderid` varchar(50) NOT NULL,
  KEY `userid` (`userid`),
  KEY `folderid` (`folderid`),
  CONSTRAINT `mailuserfoldersmap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mailuserfoldersmap_ibfk_2` FOREIGN KEY (`folderid`) REFERENCES `mailmsgfoldermap` (`folder_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailuserfoldersmap`
--

LOCK TABLES `mailuserfoldersmap` WRITE;
/*!40000 ALTER TABLE `mailuserfoldersmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailuserfoldersmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkcalendars`
--

DROP TABLE IF EXISTS `networkcalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkcalendars` (
  `cid` varchar(36) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `url` varchar(512) NOT NULL,
  `lastsync` timestamp NOT NULL default '0000-00-00 00:00:00',
  `nextsync` timestamp NOT NULL default '0000-00-00 00:00:00',
  `companyid` varchar(36) NOT NULL,
  KEY `importedcalendars_ibfk1` (`cid`),
  KEY `importedcalendars_ibfk2` (`userid`),
  KEY `importedcalendars_ibfk3` (`companyid`),
  CONSTRAINT `importedcalendars_ibfk1` FOREIGN KEY (`cid`) REFERENCES `calendars` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `importedcalendars_ibfk2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `importedcalendars_ibfk3` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkcalendars`
--

LOCK TABLES `networkcalendars` WRITE;
/*!40000 ALTER TABLE `networkcalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `networkcalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsubscriptionrequest`
--

DROP TABLE IF EXISTS `newsubscriptionrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsubscriptionrequest` (
  `companyid` varchar(36) NOT NULL,
  `status` int(1) NOT NULL,
  `moduleid` int(11) default NULL,
  `requesttime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `requestuserid` varchar(36) NOT NULL default '',
  `submoduleid` int(11) NOT NULL,
  KEY `companyid` (`companyid`),
  KEY `moduleid` (`moduleid`),
  CONSTRAINT `newsubscriptionrequest_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `newsubscriptionrequest_ibfk_2` FOREIGN KEY (`moduleid`) REFERENCES `companymodules` (`moduleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsubscriptionrequest`
--

LOCK TABLES `newsubscriptionrequest` WRITE;
/*!40000 ALTER TABLE `newsubscriptionrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsubscriptionrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationlist`
--

DROP TABLE IF EXISTS `notificationlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationlist` (
  `typeid` int(11) NOT NULL,
  `typename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationlist`
--

LOCK TABLES `notificationlist` WRITE;
/*!40000 ALTER TABLE `notificationlist` DISABLE KEYS */;
INSERT INTO `notificationlist` VALUES (1,'email'),(2,'sms');
/*!40000 ALTER TABLE `notificationlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissiontype`
--

DROP TABLE IF EXISTS `permissiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissiontype` (
  `perName` text,
  `perid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissiontype`
--

LOCK TABLES `permissiontype` WRITE;
/*!40000 ALTER TABLE `permissiontype` DISABLE KEYS */;
INSERT INTO `permissiontype` VALUES ('All Connection',1),('Select Connection',2),('Everyone',3),('None',4),('Project',5),('Community',6),('Individual',7);
/*!40000 ALTER TABLE `permissiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertdefaults_company`
--

DROP TABLE IF EXISTS `pertdefaults_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertdefaults_company` (
  `companyid` varchar(50) NOT NULL,
  `o_diff` int(11) NOT NULL default '1',
  `p_diff` int(11) NOT NULL default '1',
  PRIMARY KEY  (`companyid`),
  CONSTRAINT `pertdefaults_company_fk1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store default difference for PERT analysis for all ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertdefaults_company`
--

LOCK TABLES `pertdefaults_company` WRITE;
/*!40000 ALTER TABLE `pertdefaults_company` DISABLE KEYS */;
INSERT INTO `pertdefaults_company` VALUES ('8e94f514-e2d0-11e1-a6f4-001e58a79890',1,1);
/*!40000 ALTER TABLE `pertdefaults_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planedition`
--

DROP TABLE IF EXISTS `planedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planedition` (
  `planid` int(11) NOT NULL auto_increment,
  `planname` varchar(50) NOT NULL default '',
  `costperuser` int(11) NOT NULL default '0',
  `costperproject` int(11) NOT NULL default '0',
  `costpercommunity` int(11) NOT NULL default '0',
  `validationperiod` int(11) NOT NULL default '30',
  `subscriptioncost` int(11) NOT NULL default '0',
  PRIMARY KEY  (`planid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planedition`
--

LOCK TABLES `planedition` WRITE;
/*!40000 ALTER TABLE `planedition` DISABLE KEYS */;
INSERT INTO `planedition` VALUES (1,'Standard',1,5,5,-1,20),(2,'Trial',-1,-1,-1,30,0),(3,'Pro',0,0,0,-1,20),(4,'Premium',0,0,0,-1,20),(5,'Custom',1,5,0,30,0);
/*!40000 ALTER TABLE `planedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiletags`
--

DROP TABLE IF EXISTS `profiletags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiletags` (
  `id` varchar(50) NOT NULL,
  `tagid` varchar(50) NOT NULL,
  KEY `tagid` (`tagid`),
  CONSTRAINT `profiletags_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `unitags` (`tagid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiletags`
--

LOCK TABLES `profiletags` WRITE;
/*!40000 ALTER TABLE `profiletags` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiletags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baseline`
--

DROP TABLE IF EXISTS `proj_baseline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baseline` (
  `projectid` varchar(50) NOT NULL,
  `userid` varchar(50) default NULL,
  `json` longtext,
  `timestamp` timestamp NULL default NULL on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baseline`
--

LOCK TABLES `proj_baseline` WRITE;
/*!40000 ALTER TABLE `proj_baseline` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baseline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baselinedata`
--

DROP TABLE IF EXISTS `proj_baselinedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baselinedata` (
  `baselineid` varchar(50) NOT NULL default '0',
  `taskindex` bigint(10) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `taskname` varchar(512) default '',
  `duration` varchar(25) default NULL,
  `durationtype` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `percentcomplete` int(11) default '0',
  `notes` text,
  `priority` int(1) NOT NULL default '1',
  `estimated` tinyint(1) default '0',
  `barvisstatus` tinyint(1) default '0',
  `deadline` datetime default NULL,
  `constrainttype` varchar(50) default NULL,
  `constraintdate` datetime default NULL,
  `tasktype` varchar(50) default NULL,
  `caltype` varchar(50) default NULL,
  `level` varchar(11) default '0',
  `parent` varchar(50) default '0',
  `actualduration` varchar(25) default NULL,
  `actualstartdate` datetime default NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `predecessor` varchar(500) default NULL,
  `isparent` bit(1) NOT NULL default b'0',
  `workholidays` varchar(512) NOT NULL default '',
  KEY `proj_baselinedata_ibfk_1` (`baselineid`),
  CONSTRAINT `proj_baselinedata_ibfk_1` FOREIGN KEY (`baselineid`) REFERENCES `proj_baselinemap` (`baselineid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baselinedata`
--

LOCK TABLES `proj_baselinedata` WRITE;
/*!40000 ALTER TABLE `proj_baselinedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baselinedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baselinemap`
--

DROP TABLE IF EXISTS `proj_baselinemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baselinemap` (
  `baselineid` varchar(50) NOT NULL default '0',
  `projectid` varchar(50) NOT NULL default '0',
  `userid` varchar(50) default NULL,
  `createdon` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `baselinename` varchar(256) NOT NULL default '',
  `description` varchar(512) NOT NULL default '',
  PRIMARY KEY  (`baselineid`),
  KEY `proj_baselinemap_ibfk_1` (`projectid`),
  CONSTRAINT `proj_baselinemap_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baselinemap`
--

LOCK TABLES `proj_baselinemap` WRITE;
/*!40000 ALTER TABLE `proj_baselinemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baselinemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baselineresourcesdata`
--

DROP TABLE IF EXISTS `proj_baselineresourcesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baselineresourcesdata` (
  `baselineid` varchar(50) NOT NULL,
  `resourceid` varchar(50) NOT NULL default '0',
  `resourcename` text NOT NULL,
  `billable` bit(1) NOT NULL default b'1',
  `stdrate` double default '0',
  `categoryid` int(11) default '1',
  `typeid` int(11) default '1',
  `wuvalue` double NOT NULL default '100',
  `colorcode` varchar(10) default '#FF0000',
  `inuseflag` bit(1) default b'1',
  KEY `proj_baselineresourcesdata_ibfk_1` (`baselineid`),
  KEY `category_fk1` (`categoryid`),
  CONSTRAINT `category_fk1` FOREIGN KEY (`categoryid`) REFERENCES `proj_resourcecategory` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proj_baselineresourcesdata_ibfk_1` FOREIGN KEY (`baselineid`) REFERENCES `proj_baselinedata` (`baselineid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baselineresourcesdata`
--

LOCK TABLES `proj_baselineresourcesdata` WRITE;
/*!40000 ALTER TABLE `proj_baselineresourcesdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baselineresourcesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baselinetasklinks`
--

DROP TABLE IF EXISTS `proj_baselinetasklinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baselinetasklinks` (
  `baselineid` varchar(50) NOT NULL,
  `fromtask` varchar(50) NOT NULL,
  `totask` varchar(50) NOT NULL,
  `timestamp` datetime default NULL,
  KEY `baselineid` (`baselineid`),
  CONSTRAINT `proj_baselinetasklinks_ibfk_1` FOREIGN KEY (`baselineid`) REFERENCES `proj_baselinedata` (`baselineid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baselinetasklinks`
--

LOCK TABLES `proj_baselinetasklinks` WRITE;
/*!40000 ALTER TABLE `proj_baselinetasklinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baselinetasklinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_baselinetaskresources`
--

DROP TABLE IF EXISTS `proj_baselinetaskresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_baselinetaskresources` (
  `baselineid` varchar(50) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `resourceid` varchar(50) NOT NULL,
  KEY `baselineid` (`baselineid`),
  CONSTRAINT `proj_baselinetaskresources_ibfk_1` FOREIGN KEY (`baselineid`) REFERENCES `proj_baselinedata` (`baselineid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_baselinetaskresources`
--

LOCK TABLES `proj_baselinetaskresources` WRITE;
/*!40000 ALTER TABLE `proj_baselinetaskresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_baselinetaskresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_buffer`
--

DROP TABLE IF EXISTS `proj_buffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_buffer` (
  `projectid` varchar(50) NOT NULL default '0',
  `userid` varchar(50) default NULL,
  `taskid` varchar(50) NOT NULL,
  `action` varchar(50) default NULL,
  `lastupdated` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `json` varchar(5000) default NULL,
  `rowindex` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_buffer`
--

LOCK TABLES `proj_buffer` WRITE;
/*!40000 ALTER TABLE `proj_buffer` DISABLE KEYS */;
INSERT INTO `proj_buffer` VALUES ('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','18af77b9-0028-4d0e-a833-b379c6b35ea3','insert','2008-09-18 22:50:17','{\"percentcomplete\":\"0\",\"taskid\":\"18af77b9-0028-4d0e-a833-b379c6b35ea3\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"1\",\"enddate\":\"2008-09-19\"}',0),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5e51b278-e97e-4583-a8b9-f90aaa06256f','insert','2008-09-18 22:50:18','{\"percentcomplete\":\"0\",\"taskid\":\"5e51b278-e97e-4583-a8b9-f90aaa06256f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"2\",\"enddate\":\"2008-09-19\"}',0),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5c1a2056-b3e9-4a8e-af16-44fcac6ad240','insert','2008-09-18 22:50:19','{\"percentcomplete\":\"0\",\"taskid\":\"5c1a2056-b3e9-4a8e-af16-44fcac6ad240\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"3\",\"enddate\":\"2008-09-19\"}',1),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','a02680a9-401b-49c4-9963-ab6fa44fa677','insert','2008-09-18 22:50:20','{\"percentcomplete\":\"0\",\"taskid\":\"a02680a9-401b-49c4-9963-ab6fa44fa677\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"4\",\"enddate\":\"2008-09-19\"}',2),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','c83076a9-c9fb-44ac-b59b-64e932e2a3d5','insert','2008-09-18 22:50:21','{\"percentcomplete\":\"0\",\"taskid\":\"c83076a9-c9fb-44ac-b59b-64e932e2a3d5\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"5\",\"enddate\":\"2008-09-19\"}',3),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5e51b278-e97e-4583-a8b9-f90aaa06256f','update','2008-09-18 22:50:25','{\"percentcomplete\":\"0\",\"taskid\":\"5e51b278-e97e-4583-a8b9-f90aaa06256f\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"2\",\"enddate\":\"2008-09-23\"}',0),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5c1a2056-b3e9-4a8e-af16-44fcac6ad240','predecessor','2008-09-18 22:50:26','{taskid:\"5c1a2056-b3e9-4a8e-af16-44fcac6ad240\",taskname:\"3\",duration:1,startdate:\"2008-09-19\",enddate:\"2008-09-19\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','a02680a9-401b-49c4-9963-ab6fa44fa677','predecessor','2008-09-18 22:50:29','{taskid:\"a02680a9-401b-49c4-9963-ab6fa44fa677\",taskname:\"4\",duration:1,startdate:\"2008-09-19\",enddate:\"2008-09-19\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','c83076a9-c9fb-44ac-b59b-64e932e2a3d5','predecessor','2008-09-18 22:50:32','{taskid:\"c83076a9-c9fb-44ac-b59b-64e932e2a3d5\",taskname:\"5\",duration:1,startdate:\"2008-09-19\",enddate:\"2008-09-19\",predecessor:\"3\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','18af77b9-0028-4d0e-a833-b379c6b35ea3','predecessor','2008-09-18 22:50:34','{taskid:\"18af77b9-0028-4d0e-a833-b379c6b35ea3\",taskname:\"1\",duration:1,startdate:\"2008-09-19\",enddate:\"2008-09-19\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5e51b278-e97e-4583-a8b9-f90aaa06256f','update','2008-09-18 22:50:37','{\"percentcomplete\":\"0\",\"taskid\":\"5e51b278-e97e-4583-a8b9-f90aaa06256f\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"2\",\"enddate\":\"2008-09-24\"}',0),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','f0db9193-3b1f-44ac-83cb-83480a3fc350','paste','2008-09-18 22:50:53','[{\"percentcomplete\":\"0\",\"taskid\":\"e12b5990-b70f-4477-9c77-edc7173cdfe6\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"2\",\"enddate\":\"2008-09-24\"},{\"percentcomplete\":\"0\",\"taskid\":\"58cd0a0c-a157-40b3-bf41-17c529eb8bf6\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"3\",\"enddate\":\"2008-09-25\"},{\"percentcomplete\":\"0\",\"taskid\":\"5ce99b64-abd1-486c-8002-3bad10b4d46b\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"4\",\"enddate\":\"2008-09-26\"},{\"percentcomplete\":\"0\",\"taskid\":\"4c6137f9-754e-4b6a-be52-4d9d4eb5c58a\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"5\",\"enddate\":\"2008-09-29\"},{\"percentcomplete\":\"0\",\"taskid\":\"f0db9193-3b1f-44ac-83cb-83480a3fc350\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"1\",\"enddate\":\"2008-09-30\"}]',5),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','58cd0a0c-a157-40b3-bf41-17c529eb8bf6','predecessor','2008-09-18 22:50:54','{taskid:\"58cd0a0c-a157-40b3-bf41-17c529eb8bf6\",taskname:\"3\",duration:1,startdate:\"2008-09-25\",enddate:\"2008-09-25\",predecessor:\"6\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',6),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','5ce99b64-abd1-486c-8002-3bad10b4d46b','predecessor','2008-09-18 22:50:56','{taskid:\"5ce99b64-abd1-486c-8002-3bad10b4d46b\",taskname:\"4\",duration:1,startdate:\"2008-09-26\",enddate:\"2008-09-26\",predecessor:\"7\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',7),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','4c6137f9-754e-4b6a-be52-4d9d4eb5c58a','predecessor','2008-09-18 22:50:58','{taskid:\"4c6137f9-754e-4b6a-be52-4d9d4eb5c58a\",taskname:\"5\",duration:1,startdate:\"2008-09-29\",enddate:\"2008-09-29\",predecessor:\"8\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',8),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','f0db9193-3b1f-44ac-83cb-83480a3fc350','predecessor','2008-09-18 22:50:59','{taskid:\"f0db9193-3b1f-44ac-83cb-83480a3fc350\",taskname:\"1\",duration:1,startdate:\"2008-09-30\",enddate:\"2008-09-30\",predecessor:\"9\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',9),('6b44f84b-c770-4038-baeb-1304a4a80acf','13832.947666366113','e12b5990-b70f-4477-9c77-edc7173cdfe6','predecessor','2008-09-18 22:51:08','{taskid:\"e12b5990-b70f-4477-9c77-edc7173cdfe6\",taskname:\"2\",duration:4,startdate:\"2008-09-19\",enddate:\"2008-09-24\",predecessor:\"5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-19\",actualduration:\"4\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','15541.728189247151','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','insert','2008-09-19 08:15:10','{\"percentcomplete\":\"0\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-19 08:24:56','{\"percentcomplete\":\"0\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-17\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-19 08:24:59','{\"percentcomplete\":\"0\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-16\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','6143a17f-ee84-4928-93a5-be07d5cd6425','insert','2008-09-19 08:25:04','{\"percentcomplete\":\"0\",\"taskid\":\"6143a17f-ee84-4928-93a5-be07d5cd6425\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',1),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','insert','2008-09-19 08:25:10','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-19 08:25:15','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-19 08:25:19','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-21\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-19 08:25:39','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','c67fe9b0-d9dc-4108-9f25-7a3dbe880445','insert','2008-09-19 08:25:45','{\"percentcomplete\":\"0\",\"taskid\":\"c67fe9b0-d9dc-4108-9f25-7a3dbe880445\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','insert','2008-09-19 08:25:53','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','update','2008-09-19 08:25:58','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','update','2008-09-19 08:26:05','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-28\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','update','2008-09-19 08:26:10','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-28\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','update','2008-09-19 08:26:12','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','9bf4c17d-ca61-4180-a202-05408a56be3d','insert','2008-09-19 08:26:17','{\"percentcomplete\":\"0\",\"taskid\":\"9bf4c17d-ca61-4180-a202-05408a56be3d\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','insert','2008-09-19 08:26:23','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:26:29','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:26:32','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-4\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','insert','2008-09-19 08:26:56','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-17\"}',7),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','e098d989-f405-4928-8c63-d3e6ac449e12','insert','2008-09-19 08:27:05','{\"percentcomplete\":\"0\",\"taskid\":\"e098d989-f405-4928-8c63-d3e6ac449e12\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-23\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','e098d989-f405-4928-8c63-d3e6ac449e12','update','2008-09-19 08:27:09','{\"percentcomplete\":\"0\",\"taskid\":\"e098d989-f405-4928-8c63-d3e6ac449e12\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','a3852498-8153-487b-b172-dbbc7a63c59f','insert','2008-09-19 08:27:13','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','insert','2008-09-19 08:27:19','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-19 08:27:27','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-19 08:27:29','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-19 08:27:31','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-27\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','e098d989-f405-4928-8c63-d3e6ac449e12','update','2008-09-19 08:27:38','{\"percentcomplete\":\"0\",\"taskid\":\"e098d989-f405-4928-8c63-d3e6ac449e12\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','a3852498-8153-487b-b172-dbbc7a63c59f','update','2008-09-19 08:27:42','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','a3852498-8153-487b-b172-dbbc7a63c59f','update','2008-09-19 08:27:49','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-19 08:27:52','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','insert','2008-09-19 08:27:54','{\"percentcomplete\":\"0\",\"taskid\":\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','update','2008-09-19 08:28:00','{\"percentcomplete\":\"0\",\"taskid\":\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','update','2008-09-19 08:28:06','{\"percentcomplete\":\"0\",\"taskid\":\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','update','2008-09-19 08:28:07','{\"percentcomplete\":\"0\",\"taskid\":\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-27\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:28:48','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-7\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:28:51','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-7\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:28:53','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-10-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-7\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','c67fe9b0-d9dc-4108-9f25-7a3dbe880445','update','2008-09-19 08:29:44','{\"percentcomplete\":\"0\",\"taskid\":\"c67fe9b0-d9dc-4108-9f25-7a3dbe880445\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-19 08:30:17','{\"percentcomplete\":\"0\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"\",\"actualduration\":\"1.20\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.2,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-09-16\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','6143a17f-ee84-4928-93a5-be07d5cd6425','update','2008-09-19 08:30:18','{\"percentcomplete\":\"0\",\"taskid\":\"6143a17f-ee84-4928-93a5-be07d5cd6425\",\"resourcename\":\"\",\"actualduration\":\"1.50\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.5,\"startdate\":\"2008-09-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"B\",\"enddate\":\"2008-09-19\"}',1),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-19 08:30:19','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"\",\"actualduration\":\"1.60\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.6,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"C\",\"enddate\":\"2008-09-23\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','c67fe9b0-d9dc-4108-9f25-7a3dbe880445','update','2008-09-19 08:30:20','{\"percentcomplete\":\"0\",\"taskid\":\"c67fe9b0-d9dc-4108-9f25-7a3dbe880445\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"D\",\"enddate\":\"2008-09-26\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','update','2008-09-19 08:30:21','{\"percentcomplete\":\"0\",\"taskid\":\"dca59db2-0234-4c22-9d00-d649b1fe888f\",\"resourcename\":\"\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"E\",\"enddate\":\"2008-09-29\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','9bf4c17d-ca61-4180-a202-05408a56be3d','update','2008-09-19 08:30:22','{\"percentcomplete\":\"0\",\"taskid\":\"9bf4c17d-ca61-4180-a202-05408a56be3d\",\"resourcename\":\"\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"F\",\"enddate\":\"2008-10-1\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','update','2008-09-19 08:30:23','{\"percentcomplete\":\"0\",\"taskid\":\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-10-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"G\",\"enddate\":\"2008-10-7\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','update','2008-09-19 08:30:24','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-09-17\"}',7),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','e098d989-f405-4928-8c63-d3e6ac449e12','update','2008-09-19 08:30:25','{\"percentcomplete\":\"0\",\"taskid\":\"e098d989-f405-4928-8c63-d3e6ac449e12\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"I\",\"enddate\":\"2008-09-19\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','a3852498-8153-487b-b172-dbbc7a63c59f','update','2008-09-19 08:30:25','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"\",\"actualduration\":\"0.60\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0.6,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"J\",\"enddate\":\"2008-09-22\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-19 08:30:26','{\"percentcomplete\":\"0\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"K\",\"enddate\":\"2008-09-24\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','update','2008-09-19 08:30:27','{\"percentcomplete\":\"0\",\"taskid\":\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"L\",\"enddate\":\"2008-09-27\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','predecessor','2008-09-19 08:41:24','{taskid:\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",taskname:\"H\",duration:1,startdate:\"2008-09-17\",enddate:\"2008-09-17\",predecessor:\"1\",resourcename:\"Anand\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',7),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','6143a17f-ee84-4928-93a5-be07d5cd6425','predecessor','2008-09-19 08:41:26','{taskid:\"6143a17f-ee84-4928-93a5-be07d5cd6425\",taskname:\"B\",duration:1.5,startdate:\"2008-09-18\",enddate:\"2008-09-19\",predecessor:\"8\",resourcename:\"Neha\",parent:0,level:0,percentcomplete:\"70\",actstartdate:\"2008-09-18\",actualduration:\"1.5\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',1),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','predecessor','2008-09-19 08:41:39','{taskid:\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",taskname:\"K\",duration:1,startdate:\"2008-09-24\",enddate:\"2008-09-24\",predecessor:\"3\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-09-24\",actualduration:\"1\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','c67fe9b0-d9dc-4108-9f25-7a3dbe880445','predecessor','2008-09-19 08:41:44','{taskid:\"c67fe9b0-d9dc-4108-9f25-7a3dbe880445\",taskname:\"D\",duration:2,startdate:\"2008-09-25\",enddate:\"2008-09-26\",predecessor:\"11\",resourcename:\"Harry\",parent:0,level:0,percentcomplete:\"40\",actstartdate:\"2008-09-25\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','97a8799a-a1cb-4a12-bea5-e80af7d1c56d','predecessor','2008-09-19 08:41:50','{taskid:\"97a8799a-a1cb-4a12-bea5-e80af7d1c56d\",taskname:\"L\",duration:1,startdate:\"2008-09-27\",enddate:\"2008-09-27\",predecessor:\"4\",resourcename:\"Neha,Anand,Harry\",parent:0,level:0,percentcomplete:\"90\",actstartdate:\"2008-09-27\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','dca59db2-0234-4c22-9d00-d649b1fe888f','predecessor','2008-09-19 08:41:54','{taskid:\"dca59db2-0234-4c22-9d00-d649b1fe888f\",taskname:\"E\",duration:0,startdate:\"2008-09-29\",enddate:\"2008-09-29\",predecessor:\"12\",resourcename:\"Salini\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-28\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','9bf4c17d-ca61-4180-a202-05408a56be3d','predecessor','2008-09-19 08:41:57','{taskid:\"9bf4c17d-ca61-4180-a202-05408a56be3d\",taskname:\"F\",duration:0,startdate:\"2008-10-1\",enddate:\"2008-10-1\",predecessor:\"5\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','694.109287725797','87c412a3-1504-40ee-ac83-2128a7d0e12c','predecessor','2008-09-19 08:42:08','{taskid:\"87c412a3-1504-40ee-ac83-2128a7d0e12c\",taskname:\"G\",duration:3,startdate:\"2008-10-4\",enddate:\"2008-10-7\",predecessor:\"6\",resourcename:\"Neha\",parent:0,level:0,percentcomplete:\"70\",actstartdate:\"2008-10-4\",actualduration:\"3\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',6),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','predecessor','2008-09-19 09:54:19','{taskid:\"9bf4c17d-ca61-4180-a202-05408a56be3d\",taskname:\"F\",duration:0,startdate:\"2008-10-1\",enddate:\"2008-10-1\",predecessor:\"\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','predecessor','2008-09-19 09:54:23','{taskid:\"9bf4c17d-ca61-4180-a202-05408a56be3d\",taskname:\"F\",duration:0,startdate:\"2008-10-1\",enddate:\"2008-10-1\",predecessor:\"5\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','update','2008-09-19 09:54:27','{\"percentcomplete\":\"0\",\"taskid\":\"9bf4c17d-ca61-4180-a202-05408a56be3d\",\"resourcename\":\"anup\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"5\",\"duration\":0,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"F\",\"enddate\":\"2008-10-1\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','predecessor','2008-09-19 09:54:37','{taskid:\"9bf4c17d-ca61-4180-a202-05408a56be3d\",taskname:\"F\",duration:0,startdate:\"2008-10-1\",enddate:\"2008-10-1\",predecessor:\"\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0e85805a-2671-4403-a8cc-3bd0b837eaee','insert','2008-09-19 09:54:54','{\"percentcomplete\":\"0\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','insert','2008-09-19 09:54:57','{\"percentcomplete\":\"0\",\"taskid\":\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-19 09:55:00','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"\",duration:4,startdate:\"2008-09-30\",enddate:\"2008-10-3\",predecessor:\"13\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"4\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','update','2008-09-19 09:55:04','{\"percentcomplete\":\"0\",\"taskid\":\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"13\",\"duration\":2,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','update','2008-09-19 09:55:08','{\"percentcomplete\":\"0\",\"taskid\":\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"13\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-19 09:55:15','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-19 09:55:21','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"13\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-19 09:55:25','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','update','2008-09-19 09:55:37','{\"percentcomplete\":\"0\",\"taskid\":\"9bf4c17d-ca61-4180-a202-05408a56be3d\",\"resourcename\":\"anup\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"F\",\"enddate\":\"2008-10-2\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','9bf4c17d-ca61-4180-a202-05408a56be3d','predecessor','2008-09-19 09:55:41','{taskid:\"9bf4c17d-ca61-4180-a202-05408a56be3d\",taskname:\"F\",duration:0,startdate:\"2008-10-2\",enddate:\"2008-10-2\",predecessor:\"5\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','insert','2008-09-19 09:55:52','{\"percentcomplete\":\"0\",\"taskid\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-9\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-19 09:56:04','{\"percentcomplete\":\"0\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"M\",\"enddate\":\"2008-09-24\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','update','2008-09-19 09:56:04','{\"percentcomplete\":\"0\",\"taskid\":\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"N\",\"enddate\":\"2008-10-2\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','update','2008-09-19 09:56:07','{\"percentcomplete\":\"0\",\"taskid\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"0\",\"enddate\":\"2008-10-9\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','update','2008-09-19 09:56:14','{\"percentcomplete\":\"0\",\"taskid\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"0P\",\"enddate\":\"2008-10-9\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 09:56:25','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"14\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 09:56:33','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 09:58:06','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"14\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 09:58:07','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 10:13:43','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"14\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','90778.54459147806','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-19 10:14:20','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','094da8c7-5551-484b-a150-b16bcf680c32','insert','2008-09-19 13:51:37','{\"percentcomplete\":\"0\",\"taskid\":\"094da8c7-5551-484b-a150-b16bcf680c32\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','930f3a5d-356e-408a-9c88-7629a394b014','insert','2008-09-19 13:51:44','{\"percentcomplete\":\"0\",\"taskid\":\"930f3a5d-356e-408a-9c88-7629a394b014\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','094da8c7-5551-484b-a150-b16bcf680c32','deleteTask','2008-09-19 13:52:46','{\"taskid\":\"094da8c7-5551-484b-a150-b16bcf680c32\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','930f3a5d-356e-408a-9c88-7629a394b014','deleteTask','2008-09-19 13:52:46','{\"taskid\":\"930f3a5d-356e-408a-9c88-7629a394b014\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','981df597-dc6b-45e8-ad0d-5e00b4d306fd','insert','2008-09-19 13:53:14','{\"percentcomplete\":\"0\",\"taskid\":\"981df597-dc6b-45e8-ad0d-5e00b4d306fd\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','981df597-dc6b-45e8-ad0d-5e00b4d306fd','update','2008-09-19 13:53:25','{\"percentcomplete\":\"0\",\"taskid\":\"981df597-dc6b-45e8-ad0d-5e00b4d306fd\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','19090.33651630846','fde31917-8a86-4ce5-8968-6c7935f56282','insert','2008-09-19 13:53:32','{\"percentcomplete\":\"0\",\"taskid\":\"fde31917-8a86-4ce5-8968-6c7935f56282\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','fde31917-8a86-4ce5-8968-6c7935f56282','deleteTask','2008-09-19 13:54:28','{\"taskid\":\"fde31917-8a86-4ce5-8968-6c7935f56282\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','981df597-dc6b-45e8-ad0d-5e00b4d306fd','deleteTask','2008-09-19 13:54:28','{\"taskid\":\"981df597-dc6b-45e8-ad0d-5e00b4d306fd\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','68626b80-f3c4-4984-945a-2e0082b62a53','insert','2008-09-19 13:54:57','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','68626b80-f3c4-4984-945a-2e0082b62a53','update','2008-09-19 13:55:01','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','68626b80-f3c4-4984-945a-2e0082b62a53','update','2008-09-19 13:55:05','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','insert','2008-09-19 13:55:14','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-19 13:55:19','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-19 13:55:23','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','predecessor','2008-09-19 13:55:25','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"\",duration:1,startdate:\"2008-10-2\",enddate:\"2008-10-2\",predecessor:\"16\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','predecessor','2008-09-19 13:55:31','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"\",duration:1,startdate:\"2008-10-3\",enddate:\"2008-10-3\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','35263.97740336613','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-19 13:55:33','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','63270.13637529353','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-19 16:05:27','{\"percentcomplete\":\"100\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"M\",\"enddate\":\"2008-09-23\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','63270.13637529353','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-19 16:05:34','{\"percentcomplete\":\"67\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"M\",\"enddate\":\"2008-09-24\"}',12),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','bd788bf5-2bda-412f-aa54-1a4ed0afc5e7','insert','2008-09-20 06:00:07','{\"percentcomplete\":\"0\",\"taskid\":\"bd788bf5-2bda-412f-aa54-1a4ed0afc5e7\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-16\"}',0),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','insert','2008-09-20 06:00:13','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-18\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','insert','2008-09-20 06:00:19','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','update','2008-09-20 06:00:23','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','update','2008-09-20 06:00:28','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','update','2008-09-20 06:00:33','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','update','2008-09-20 06:00:47','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-18\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','update','2008-09-20 06:00:50','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','update','2008-09-20 06:01:03','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-18\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','insert','2008-09-20 06:01:24','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:01:27','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"2.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2.5,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:01:30','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:01:35','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc','insert','2008-09-20 06:01:44','{\"percentcomplete\":\"0\",\"taskid\":\"8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',4),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','update','2008-09-20 06:03:00','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:03:07','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:03:10','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','update','2008-09-20 06:03:15','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"1.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.5,\"startdate\":\"2008-09-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','update','2008-09-20 06:03:18','{\"percentcomplete\":\"0\",\"taskid\":\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-20\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','bd788bf5-2bda-412f-aa54-1a4ed0afc5e7','update','2008-09-20 06:03:24','{\"percentcomplete\":\"0\",\"taskid\":\"bd788bf5-2bda-412f-aa54-1a4ed0afc5e7\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-15\"}',0),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','update','2008-09-20 06:03:33','{\"percentcomplete\":\"0\",\"taskid\":\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-17\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:03:38','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-27\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc','update','2008-09-20 06:03:52','{\"percentcomplete\":\"0\",\"taskid\":\"8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-23\"}',4),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc','update','2008-09-20 06:04:11','{\"percentcomplete\":\"0\",\"taskid\":\"8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-22\"}',4),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','update','2008-09-20 06:04:22','{\"percentcomplete\":\"0\",\"taskid\":\"708488bb-d97c-43c7-83da-c4edfde5eca4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','insert','2008-09-20 06:04:26','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-09-20 06:04:32','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-09-20 06:04:38','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-09-20 06:04:41','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-09-20 06:04:44','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-27\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','1f95357e-3bac-4eb8-95a8-9cab9f6c9968','predecessor','2008-09-20 06:04:53','{taskid:\"1f95357e-3bac-4eb8-95a8-9cab9f6c9968\",taskname:\"\",duration:1,startdate:\"2008-09-17\",enddate:\"2008-09-17\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3feb57ab-5554-4bc9-b59c-a3bacf834d62','predecessor','2008-09-20 06:04:55','{taskid:\"3feb57ab-5554-4bc9-b59c-a3bacf834d62\",taskname:\"\",duration:1,startdate:\"2008-09-20\",enddate:\"2008-09-20\",predecessor:\"3\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-20\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc','predecessor','2008-09-20 06:04:58','{taskid:\"8b0a9e80-1aa9-45c9-b9fb-99205a87f4fc\",taskname:\"\",duration:1,startdate:\"2008-09-22\",enddate:\"2008-09-22\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-22\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','708488bb-d97c-43c7-83da-c4edfde5eca4','predecessor','2008-09-20 06:05:00','{taskid:\"708488bb-d97c-43c7-83da-c4edfde5eca4\",taskname:\"\",duration:1,startdate:\"2008-09-24\",enddate:\"2008-09-24\",predecessor:\"5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-24\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','predecessor','2008-09-20 06:05:02','{taskid:\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",taskname:\"\",duration:1,startdate:\"2008-09-27\",enddate:\"2008-09-27\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-27\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','insert','2008-09-20 06:23:13','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:22','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-10\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:35','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:37','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:45','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:47','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:49','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:23:53','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:24:00','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:24:05','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:24:10','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:24:17','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:24:21','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:30:14','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-09-20 06:30:18','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','a3e77585-3c33-420b-b3b3-bbfa7c7c33e0','insert','2008-09-20 06:30:30','{\"percentcomplete\":\"0\",\"taskid\":\"a3e77585-3c33-420b-b3b3-bbfa7c7c33e0\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-24\"}',7),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3b6566c0-9878-4a47-b33f-cff10670ff33','insert','2008-09-20 06:30:33','{\"percentcomplete\":\"0\",\"taskid\":\"3b6566c0-9878-4a47-b33f-cff10670ff33\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',8),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','5a585e13-3476-4622-986a-d590dfa684f9','insert','2008-09-20 06:30:37','{\"percentcomplete\":\"0\",\"taskid\":\"5a585e13-3476-4622-986a-d590dfa684f9\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',9),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3975ad7b-b24e-451d-89f2-c54327957007','insert','2008-09-20 06:30:49','{\"percentcomplete\":\"0\",\"taskid\":\"3975ad7b-b24e-451d-89f2-c54327957007\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',10),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3975ad7b-b24e-451d-89f2-c54327957007','update','2008-09-20 06:30:54','{\"percentcomplete\":\"0\",\"taskid\":\"3975ad7b-b24e-451d-89f2-c54327957007\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',10),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3975ad7b-b24e-451d-89f2-c54327957007','update','2008-09-20 06:30:57','{\"percentcomplete\":\"0\",\"taskid\":\"3975ad7b-b24e-451d-89f2-c54327957007\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',10),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','08496de4-d5e8-44ff-80a4-0168af8c677a','insert','2008-09-20 06:31:05','{\"percentcomplete\":\"0\",\"taskid\":\"08496de4-d5e8-44ff-80a4-0168af8c677a\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','08496de4-d5e8-44ff-80a4-0168af8c677a','update','2008-09-20 06:31:09','{\"percentcomplete\":\"0\",\"taskid\":\"08496de4-d5e8-44ff-80a4-0168af8c677a\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','08496de4-d5e8-44ff-80a4-0168af8c677a','update','2008-09-20 06:31:12','{\"percentcomplete\":\"0\",\"taskid\":\"08496de4-d5e8-44ff-80a4-0168af8c677a\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',11),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','08496de4-d5e8-44ff-80a4-0168af8c677a','update','2008-09-20 06:31:19','{\"percentcomplete\":\"0\",\"taskid\":\"08496de4-d5e8-44ff-80a4-0168af8c677a\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',11),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','49e1e3fa-6e9f-4214-9e8b-08185fc40af8','insert','2008-09-20 06:31:26','{\"percentcomplete\":\"0\",\"taskid\":\"49e1e3fa-6e9f-4214-9e8b-08185fc40af8\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2008-09-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',12),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','91914b5d-9b7e-457b-bde0-bb5433cf8b7d','insert','2008-09-20 06:31:34','{\"percentcomplete\":\"0\",\"taskid\":\"91914b5d-9b7e-457b-bde0-bb5433cf8b7d\",\"resourcename\":\"\",\"actualduration\":\"9\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":9,\"startdate\":\"2008-09-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',13),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','612f12cb-8d41-437e-ad7b-e0ad9517a747','insert','2008-09-20 06:31:38','{\"percentcomplete\":\"0\",\"taskid\":\"612f12cb-8d41-437e-ad7b-e0ad9517a747\",\"resourcename\":\"\",\"actualduration\":\"11\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":11,\"startdate\":\"2008-09-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',14),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','6e53d06f-2c58-497d-9b53-8fce7e2f3cf5','insert','2008-09-20 06:31:45','{\"percentcomplete\":\"0\",\"taskid\":\"6e53d06f-2c58-497d-9b53-8fce7e2f3cf5\",\"resourcename\":\"\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','6e53d06f-2c58-497d-9b53-8fce7e2f3cf5','update','2008-09-20 06:32:01','{\"percentcomplete\":\"0\",\"taskid\":\"6e53d06f-2c58-497d-9b53-8fce7e2f3cf5\",\"resourcename\":\"\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','6e53d06f-2c58-497d-9b53-8fce7e2f3cf5','update','2008-09-20 06:32:04','{\"percentcomplete\":\"0\",\"taskid\":\"6e53d06f-2c58-497d-9b53-8fce7e2f3cf5\",\"resourcename\":\"\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','a3e77585-3c33-420b-b3b3-bbfa7c7c33e0','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"a3e77585-3c33-420b-b3b3-bbfa7c7c33e0\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3b6566c0-9878-4a47-b33f-cff10670ff33','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"3b6566c0-9878-4a47-b33f-cff10670ff33\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','5a585e13-3476-4622-986a-d590dfa684f9','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"5a585e13-3476-4622-986a-d590dfa684f9\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','3975ad7b-b24e-451d-89f2-c54327957007','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"3975ad7b-b24e-451d-89f2-c54327957007\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','08496de4-d5e8-44ff-80a4-0168af8c677a','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"08496de4-d5e8-44ff-80a4-0168af8c677a\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','49e1e3fa-6e9f-4214-9e8b-08185fc40af8','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"49e1e3fa-6e9f-4214-9e8b-08185fc40af8\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','91914b5d-9b7e-457b-bde0-bb5433cf8b7d','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"91914b5d-9b7e-457b-bde0-bb5433cf8b7d\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','612f12cb-8d41-437e-ad7b-e0ad9517a747','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"612f12cb-8d41-437e-ad7b-e0ad9517a747\"}',-1),('4cc73d74-3152-42dc-a626-12479e455ca0','14652.465397329728','6e53d06f-2c58-497d-9b53-8fce7e2f3cf5','deleteTask','2008-09-20 06:32:27','{\"taskid\":\"6e53d06f-2c58-497d-9b53-8fce7e2f3cf5\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','971.3851408438279','e098d989-f405-4928-8c63-d3e6ac449e12','predecessor','2008-09-20 07:00:23','{taskid:\"e098d989-f405-4928-8c63-d3e6ac449e12\",taskname:\"I\",duration:1,startdate:\"2008-09-19\",enddate:\"2008-09-19\",predecessor:\"2\",resourcename:\"Harry\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',8),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','0c2ae6eb-46ec-4cd4-9fd8-0fd2f6c58149','insert','2008-09-21 20:11:07','{\"percentcomplete\":\"0\",\"taskid\":\"0c2ae6eb-46ec-4cd4-9fd8-0fd2f6c58149\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',0),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','225f4934-b5cb-4e1e-bc3e-64031bffc006','insert','2008-09-21 20:11:09','{\"percentcomplete\":\"0\",\"taskid\":\"225f4934-b5cb-4e1e-bc3e-64031bffc006\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',1),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','225f4934-b5cb-4e1e-bc3e-64031bffc006','predecessor','2008-09-21 20:11:14','{taskid:\"225f4934-b5cb-4e1e-bc3e-64031bffc006\",taskname:\"\",duration:6,startdate:\"2008-09-29\",enddate:\"2008-10-6\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-28\",actualduration:\"6\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','0fa7e406-5f82-4cff-914b-74ab2913d920','insert','2008-09-21 20:11:16','{\"percentcomplete\":\"0\",\"taskid\":\"0fa7e406-5f82-4cff-914b-74ab2913d920\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',2),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','e9cd6738-0f09-4c32-8d53-7b3feb6d3c87','insert','2008-09-21 20:11:17','{\"percentcomplete\":\"0\",\"taskid\":\"e9cd6738-0f09-4c32-8d53-7b3feb6d3c87\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',3),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','7c1319e6-e809-400f-b8c1-4fc856fd77d9','insert','2008-09-21 20:11:17','{\"percentcomplete\":\"0\",\"taskid\":\"7c1319e6-e809-400f-b8c1-4fc856fd77d9\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',4),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','bde34271-2ca0-4b66-bfba-ed493350c2d9','insert','2008-09-21 20:11:18','{\"percentcomplete\":\"0\",\"taskid\":\"bde34271-2ca0-4b66-bfba-ed493350c2d9\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',5),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','c4daebe5-70a3-4296-8c19-dd714e682489','insert','2008-09-21 20:11:19','{\"percentcomplete\":\"0\",\"taskid\":\"c4daebe5-70a3-4296-8c19-dd714e682489\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',6),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','7c7dbac0-0cf3-4224-96b5-4346037789ae','insert','2008-09-21 20:11:20','{\"percentcomplete\":\"0\",\"taskid\":\"7c7dbac0-0cf3-4224-96b5-4346037789ae\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',7),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','7dee4d6d-6154-4d2b-ab11-758356638dd4','insert','2008-09-21 20:11:20','{\"percentcomplete\":\"0\",\"taskid\":\"7dee4d6d-6154-4d2b-ab11-758356638dd4\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',8),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','82038c30-8270-467d-84ae-d363a4214a21','insert','2008-09-21 20:11:21','{\"percentcomplete\":\"0\",\"taskid\":\"82038c30-8270-467d-84ae-d363a4214a21\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',9),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','8a1cf72a-2553-4040-b95f-82865947b6e0','insert','2008-09-21 20:11:22','{\"percentcomplete\":\"0\",\"taskid\":\"8a1cf72a-2553-4040-b95f-82865947b6e0\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',10),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','031ef49a-d101-4e87-9e88-e06243de478e','insert','2008-09-21 20:11:22','{\"percentcomplete\":\"0\",\"taskid\":\"031ef49a-d101-4e87-9e88-e06243de478e\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',11),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','031ef49a-d101-4e87-9e88-e06243de478e','update','2008-09-21 20:11:24','{\"percentcomplete\":\"0\",\"taskid\":\"031ef49a-d101-4e87-9e88-e06243de478e\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',11),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','72b9a61f-7c68-46bf-8685-ca199805b38e','insert','2008-09-21 20:11:24','{\"percentcomplete\":\"0\",\"taskid\":\"72b9a61f-7c68-46bf-8685-ca199805b38e\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',12),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','4372d227-16d7-4c04-8faa-cd08f079793d','insert','2008-09-21 20:11:25','{\"percentcomplete\":\"0\",\"taskid\":\"4372d227-16d7-4c04-8faa-cd08f079793d\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',13),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','f32cf8e1-5bc7-48f5-a048-1555a3646290','insert','2008-09-21 20:11:25','{\"percentcomplete\":\"0\",\"taskid\":\"f32cf8e1-5bc7-48f5-a048-1555a3646290\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-26\"}',14),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','dd7ec156-808e-494b-98db-0c022431ee73','insert','2008-09-21 20:11:26','{\"percentcomplete\":\"0\",\"taskid\":\"dd7ec156-808e-494b-98db-0c022431ee73\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-1\"}',15),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','f32cf8e1-5bc7-48f5-a048-1555a3646290','predecessor','2008-09-21 20:11:40','{taskid:\"f32cf8e1-5bc7-48f5-a048-1555a3646290\",taskname:\"\",duration:2,startdate:\"2008-09-25\",enddate:\"2008-09-26\",predecessor:\"16\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-25\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','4372d227-16d7-4c04-8faa-cd08f079793d','predecessor','2008-09-21 20:11:42','{taskid:\"4372d227-16d7-4c04-8faa-cd08f079793d\",taskname:\"\",duration:3,startdate:\"2008-09-24\",enddate:\"2008-09-26\",predecessor:\"15\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-24\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',13),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','72b9a61f-7c68-46bf-8685-ca199805b38e','predecessor','2008-09-21 20:11:47','{taskid:\"72b9a61f-7c68-46bf-8685-ca199805b38e\",taskname:\"\",duration:3,startdate:\"2008-09-25\",enddate:\"2008-09-29\",predecessor:\"14\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-25\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',12),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','8a1cf72a-2553-4040-b95f-82865947b6e0','predecessor','2008-09-21 20:11:48','{taskid:\"8a1cf72a-2553-4040-b95f-82865947b6e0\",taskname:\"\",duration:2,startdate:\"2008-09-25\",enddate:\"2008-09-26\",predecessor:\"12\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-25\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',10),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','8a1cf72a-2553-4040-b95f-82865947b6e0','predecessor','2008-09-21 20:11:50','{taskid:\"8a1cf72a-2553-4040-b95f-82865947b6e0\",taskname:\"\",duration:2,startdate:\"2008-10-3\",enddate:\"2008-10-6\",predecessor:\"12,9\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-25\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',10),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','031ef49a-d101-4e87-9e88-e06243de478e','predecessor','2008-09-21 20:11:50','{taskid:\"031ef49a-d101-4e87-9e88-e06243de478e\",taskname:\"\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"13\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',11),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','7dee4d6d-6154-4d2b-ab11-758356638dd4','predecessor','2008-09-21 20:11:51','{taskid:\"7dee4d6d-6154-4d2b-ab11-758356638dd4\",taskname:\"\",duration:3,startdate:\"2008-09-30\",enddate:\"2008-10-2\",predecessor:\"8\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',8),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','c4daebe5-70a3-4296-8c19-dd714e682489','predecessor','2008-09-21 20:12:01','{taskid:\"c4daebe5-70a3-4296-8c19-dd714e682489\",taskname:\"\",duration:3,startdate:\"2008-09-29\",enddate:\"2008-10-1\",predecessor:\"11\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-29\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',6),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','7c1319e6-e809-400f-b8c1-4fc856fd77d9','predecessor','2008-09-21 20:12:05','{taskid:\"7c1319e6-e809-400f-b8c1-4fc856fd77d9\",taskname:\"\",duration:4,startdate:\"2008-09-30\",enddate:\"2008-10-3\",predecessor:\"6\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"4\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','0fa7e406-5f82-4cff-914b-74ab2913d920','predecessor','2008-09-21 20:12:06','{taskid:\"0fa7e406-5f82-4cff-914b-74ab2913d920\",taskname:\"\",duration:4,startdate:\"2008-09-30\",enddate:\"2008-10-3\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"4\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','e9cd6738-0f09-4c32-8d53-7b3feb6d3c87','predecessor','2008-09-21 20:12:08','{taskid:\"e9cd6738-0f09-4c32-8d53-7b3feb6d3c87\",taskname:\"\",duration:3,startdate:\"2008-09-30\",enddate:\"2008-10-2\",predecessor:\"5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','bde34271-2ca0-4b66-bfba-ed493350c2d9','predecessor','2008-09-21 20:12:11','{taskid:\"bde34271-2ca0-4b66-bfba-ed493350c2d9\",taskname:\"\",duration:4,startdate:\"2008-09-30\",enddate:\"2008-10-3\",predecessor:\"7\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"4\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('fb116081-31f6-4e03-a933-754657827e15','79100.5308739841','dd7ec156-808e-494b-98db-0c022431ee73','predecessor','2008-09-21 20:12:14','{taskid:\"dd7ec156-808e-494b-98db-0c022431ee73\",taskname:\"\",duration:2,startdate:\"2008-09-30\",enddate:\"2008-10-1\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-30\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',15),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','e2e52bae-9ca3-4de2-8f15-b41c654bcb43','insert','2008-09-22 08:16:32','{\"percentcomplete\":\"0\",\"taskid\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"resourcename\":\"\",\"actualduration\":\"8\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":8,\"startdate\":\"2007-02-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-15\"}',0),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','33a8c3f5-4f77-40ed-aadf-828527c96001','insert','2008-09-22 08:16:35','{\"percentcomplete\":\"0\",\"taskid\":\"33a8c3f5-4f77-40ed-aadf-828527c96001\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-02-14\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-15\"}',1),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc','insert','2008-09-22 08:16:37','{\"percentcomplete\":\"0\",\"taskid\":\"a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-02-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-14\"}',2),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','insert','2008-09-22 08:16:41','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2007-02-5\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-7\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','e2e52bae-9ca3-4de2-8f15-b41c654bcb43','update','2008-09-22 08:16:48','{\"percentcomplete\":\"0\",\"taskid\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"resourcename\":\"\",\"actualduration\":\"8\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":8,\"startdate\":\"2007-02-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"gf\",\"enddate\":\"2007-02-15\"}',0),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','33a8c3f5-4f77-40ed-aadf-828527c96001','update','2008-09-22 08:16:49','{\"percentcomplete\":\"0\",\"taskid\":\"33a8c3f5-4f77-40ed-aadf-828527c96001\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-02-14\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"gf\",\"enddate\":\"2007-02-15\"}',1),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc','update','2008-09-22 08:16:50','{\"percentcomplete\":\"0\",\"taskid\":\"a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-02-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"gf\",\"enddate\":\"2007-02-14\"}',2),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','update','2008-09-22 08:16:52','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2007-02-5\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"g\",\"enddate\":\"2007-02-7\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','33a8c3f5-4f77-40ed-aadf-828527c96001','indent','2008-09-22 08:16:56','{taskid:\"33a8c3f5-4f77-40ed-aadf-828527c96001\",taskname:\"gf\",duration:2,startdate:\"2007-02-14\",enddate:\"2007-02-15\",predecessor:\"\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-14\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc','indent','2008-09-22 08:16:59','{taskid:\"a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc\",taskname:\"gf\",duration:2,startdate:\"2007-02-13\",enddate:\"2007-02-14\",predecessor:\"\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-13\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','63791.235862566675','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','indent','2008-09-22 08:17:02','{taskid:\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",taskname:\"g\",duration:3,startdate:\"2007-02-5\",enddate:\"2007-02-7\",predecessor:\"\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-5\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('a45dad15-1a11-4453-9612-a67cc344c5f5','84800.01909254558','d132fae0-100b-41d1-a4bc-b814d0f0c0a2','insert','2008-09-23 05:13:02','{\"percentcomplete\":\"0\",\"taskid\":\"d132fae0-100b-41d1-a4bc-b814d0f0c0a2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"kick-off\",\"enddate\":\"2008-09-23\"}',0),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','36e69bd0-4071-482c-a739-55a193b0206b','insert','2008-09-23 10:29:41','{\"percentcomplete\":\"0\",\"taskid\":\"36e69bd0-4071-482c-a739-55a193b0206b\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"list out features of feedback forum\",\"enddate\":\"2008-09-24\"}',0),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','36e69bd0-4071-482c-a739-55a193b0206b','update','2008-09-23 10:30:30','{\"percentcomplete\":\"0\",\"taskid\":\"36e69bd0-4071-482c-a739-55a193b0206b\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"List out features of feedback forum\",\"enddate\":\"2008-09-23\"}',0),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','94221030-5aa5-4ce1-992d-ad6fce94a962','insert','2008-09-23 10:30:57','{\"percentcomplete\":\"0\",\"taskid\":\"94221030-5aa5-4ce1-992d-ad6fce94a962\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Idenitify the database require\",\"enddate\":\"2008-09-24\"}',1),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','25befe4b-e904-44d6-80ec-fa6695b16828','insert','2008-09-23 10:31:53','{\"percentcomplete\":\"0\",\"taskid\":\"25befe4b-e904-44d6-80ec-fa6695b16828\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Create database tab;e\",\"enddate\":\"2008-09-24\"}',2),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','25befe4b-e904-44d6-80ec-fa6695b16828','update','2008-09-23 10:31:58','{\"percentcomplete\":\"0\",\"taskid\":\"25befe4b-e904-44d6-80ec-fa6695b16828\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Create database table\",\"enddate\":\"2008-09-24\"}',2),('f84648ff-e3d7-46d2-803a-eee7348bd05c','81332.10382917212','04f024bc-693b-4b26-b9d2-fd0f81f987d1','insert','2008-09-23 10:32:14','{\"percentcomplete\":\"0\",\"taskid\":\"04f024bc-693b-4b26-b9d2-fd0f81f987d1\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\" Normalise databse tables\",\"enddate\":\"2008-09-24\"}',3),('f84648ff-e3d7-46d2-803a-eee7348bd05c','51887.63841609361','912e1d6b-a790-47f7-ab32-2160f9c6eaea','insert','2008-09-23 10:49:42','{\"percentcomplete\":\"0\",\"taskid\":\"912e1d6b-a790-47f7-ab32-2160f9c6eaea\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-24\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-24\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"idenatify pages\",\"enddate\":\"2008-09-24\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','predecessor','2008-09-23 12:01:07','{taskid:\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",taskname:\"0P\",duration:0,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"6\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','df4c937f-0b6d-4ad5-a29e-db32d72c239c','insert','2008-09-23 12:01:13','{\"percentcomplete\":\"0\",\"taskid\":\"df4c937f-0b6d-4ad5-a29e-db32d72c239c\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-9\"}',17),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','4565e0f5-16c2-48d8-97f8-010d79fb5403','insert','2008-09-23 12:01:22','{\"percentcomplete\":\"0\",\"taskid\":\"4565e0f5-16c2-48d8-97f8-010d79fb5403\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',18),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-23 12:01:51','{\"percentcomplete\":\"8\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"14.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14.5,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-6\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-23 12:01:57','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Anand\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"C\",\"enddate\":\"2008-10-10\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','6143a17f-ee84-4928-93a5-be07d5cd6425','update','2008-09-23 12:01:59','{\"percentcomplete\":\"17\",\"taskid\":\"6143a17f-ee84-4928-93a5-be07d5cd6425\",\"resourcename\":\"Salini\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"8\",\"duration\":6,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"2\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"B\",\"enddate\":\"2008-10-15\"}',1),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','update','2008-09-23 12:02:01','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"Anand\",\"actualduration\":\"6.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"1\",\"duration\":6.5,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-10-14\"}',7),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-23 12:02:04','{\"percentcomplete\":\"100\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"M\",\"enddate\":\"2008-09-24\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-23 12:02:14','{\"percentcomplete\":\"100\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-27\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"M\",\"enddate\":\"2008-09-30\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','96639.81402587528','a3852498-8153-487b-b172-dbbc7a63c59f','update','2008-09-23 12:02:17','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"Salini\",\"actualduration\":\"8\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":8,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"J\",\"enddate\":\"2008-10-1\"}',9),('f84648ff-e3d7-46d2-803a-eee7348bd05c','10268.141841515899','1bbefb45-dc11-4731-b851-1762254ffb74','insert','2008-09-24 06:21:32','{\"percentcomplete\":\"0\",\"taskid\":\"1bbefb45-dc11-4731-b851-1762254ffb74\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"identidy screens\",\"enddate\":\"2008-09-25\"}',5),('4d7bb4d7-073f-407a-9832-4b0619cd613e','43132.04295608336','13167710-f54b-4650-a5d3-7c428a9a4ffc','newtask','2008-09-25 06:34:06','{\"percentcomplete\":\"0\",\"taskid\":\"13167710-f54b-4650-a5d3-7c428a9a4ffc\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('4d7bb4d7-073f-407a-9832-4b0619cd613e','43132.04295608336','13167710-f54b-4650-a5d3-7c428a9a4ffc','deleteTask','2008-09-25 06:36:08','{\"taskid\":\"13167710-f54b-4650-a5d3-7c428a9a4ffc\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','49001.841084426356','8ff62ede-c46a-4a82-8c1b-ef555e6f994d','insert','2008-09-25 09:06:46','{\"percentcomplete\":\"0\",\"taskid\":\"8ff62ede-c46a-4a82-8c1b-ef555e6f994d\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-19\"}',19),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','347c5433-f569-44d4-822b-3ed672a239ed','insert','2008-09-25 09:17:31','{\"percentcomplete\":\"0\",\"taskid\":\"347c5433-f569-44d4-822b-3ed672a239ed\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',20),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','6db16a89-b4f8-4c6e-826c-a13f9d2f20a1','insert','2008-09-25 09:18:10','{\"percentcomplete\":\"0\",\"taskid\":\"6db16a89-b4f8-4c6e-826c-a13f9d2f20a1\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-17\"}',21),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','indent','2008-09-25 09:25:27','{taskid:\"68626b80-f3c4-4984-945a-2e0082b62a53\",taskname:\"\",duration:1,startdate:\"2008-10-16\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"\",parent:09c26dd6-b95c-4d49-9f3d-8822b2e329dc,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','update','2008-09-25 09:25:32','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-16\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"fvf\",\"enddate\":\"2008-10-17\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-25 09:25:32','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','df4c937f-0b6d-4ad5-a29e-db32d72c239c','update','2008-09-25 09:25:33','{\"percentcomplete\":\"0\",\"taskid\":\"df4c937f-0b6d-4ad5-a29e-db32d72c239c\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"ff\",\"enddate\":\"2008-10-9\"}',17),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','indent','2008-09-25 09:25:38','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"f\",duration:1,startdate:\"2008-10-16\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"\",parent:09c26dd6-b95c-4d49-9f3d-8822b2e329dc,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','predecessor','2008-09-25 09:26:01','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"f\",duration:1,startdate:\"2008-10-16\",enddate:\"2008-10-17\",predecessor:\"16\",resourcename:\"\",parent:09c26dd6-b95c-4d49-9f3d-8822b2e329dc,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','09c26dd6-b95c-4d49-9f3d-8822b2e329dc','update','2008-09-25 09:26:48','{\"percentcomplete\":\"0\",\"taskid\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"resourcename\":\"\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"6\",\"duration\":2,\"startdate\":\"2008-10-16\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"0P\",\"enddate\":\"2008-10-20\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','update','2008-09-25 09:26:49','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"fvf\",\"enddate\":\"2008-10-2\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','outdent','2008-09-25 09:26:54','{taskid:\"68626b80-f3c4-4984-945a-2e0082b62a53\",taskname:\"fvf\",duration:1,startdate:\"2008-09-30\",enddate:\"2008-09-30\",predecessor:\"\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"true\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','indent','2008-09-25 09:27:09','{taskid:\"68626b80-f3c4-4984-945a-2e0082b62a53\",taskname:\"fvf\",duration:1,startdate:\"2008-10-16\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"\",parent:09c26dd6-b95c-4d49-9f3d-8822b2e329dc,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"true\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','68626b80-f3c4-4984-945a-2e0082b62a53','update','2008-09-25 09:27:20','{\"percentcomplete\":\"0\",\"taskid\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"09c26dd6-b95c-4d49-9f3d-8822b2e329dc\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"fvf\",\"enddate\":\"2008-10-2\"}',15),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-25 09:27:20','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-2\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','63439.46601462505','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','outdent','2008-09-25 09:27:22','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"f\",duration:1,startdate:\"2008-10-2\",enddate:\"2008-10-2\",predecessor:\"\",resourcename:\"\",parent:09c26dd6-b95c-4d49-9f3d-8822b2e329dc,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','49001.841084426356','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-25 09:37:23','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Anand\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-10\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','49001.841084426356','36ed8e14-7046-4d2d-9ea3-03876f0085dd','insert','2008-09-25 09:37:36','{\"percentcomplete\":\"0\",\"taskid\":\"36ed8e14-7046-4d2d-9ea3-03876f0085dd\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',22),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','11751.042917625098','ebdd52eb-02b6-461b-8c70-185e52676de9','insert','2008-09-25 15:40:49','{\"percentcomplete\":\"0\",\"taskid\":\"ebdd52eb-02b6-461b-8c70-185e52676de9\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-25\"}',0),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','update','2008-09-25 16:02:43','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2007-02-5\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"g\",\"enddate\":\"2007-02-9\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','update','2008-09-25 16:03:32','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"10\",\"parent\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":10,\"startdate\":\"2007-02-5\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"g\",\"enddate\":\"2007-02-16\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','update','2008-09-25 16:04:12','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"19.5\",\"parent\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":19.5,\"startdate\":\"2007-02-5\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"g\",\"enddate\":\"2007-03-2\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','update','2008-09-25 16:04:28','{\"percentcomplete\":\"0\",\"taskid\":\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2007-02-5\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-02-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"g\",\"enddate\":\"2007-02-9\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','2d1f1614-2133-4c5f-a8a5-668abe39efa5','insert','2008-09-25 16:04:52','{\"percentcomplete\":\"0\",\"taskid\":\"2d1f1614-2133-4c5f-a8a5-668abe39efa5\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2007-02-14\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-22\"}',4),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc','update','2008-09-25 16:04:55','{\"percentcomplete\":\"0\",\"taskid\":\"a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":\"e2e52bae-9ca3-4de2-8f15-b41c654bcb43\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-02-20\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-02-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"gf\",\"enddate\":\"2007-02-21\"}',2),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','predecessor','2008-09-25 16:04:58','{taskid:\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",taskname:\"g\",duration:5,startdate:\"2007-02-5\",enddate:\"2007-02-9\",predecessor:\"5\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-5\",actualduration:\"5\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','b912341e-937f-4bc5-abc3-d3a32603cfda','insert','2008-09-25 16:05:30','{\"percentcomplete\":\"0\",\"taskid\":\"b912341e-937f-4bc5-abc3-d3a32603cfda\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2007-02-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-16\"}',5),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','2d1f1614-2133-4c5f-a8a5-668abe39efa5','update','2008-09-25 16:05:54','{\"percentcomplete\":\"0\",\"taskid\":\"2d1f1614-2133-4c5f-a8a5-668abe39efa5\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2007-02-19\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-19\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-27\"}',4),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','b912341e-937f-4bc5-abc3-d3a32603cfda','update','2008-09-25 16:05:56','{\"percentcomplete\":\"0\",\"taskid\":\"b912341e-937f-4bc5-abc3-d3a32603cfda\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2007-02-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-16\"}',5),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','3cf040a5-de40-496b-ae00-2b77d8b68fa9','insert','2008-09-25 16:05:59','{\"percentcomplete\":\"0\",\"taskid\":\"3cf040a5-de40-496b-ae00-2b77d8b68fa9\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2007-02-16\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-20\"}',6),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','3cf040a5-de40-496b-ae00-2b77d8b68fa9','predecessor','2008-09-25 16:06:41','{taskid:\"3cf040a5-de40-496b-ae00-2b77d8b68fa9\",taskname:\"\",duration:3,startdate:\"2007-02-27\",enddate:\"2007-03-1\",predecessor:\"6\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2007-02-12\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',6),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','3cf040a5-de40-496b-ae00-2b77d8b68fa9','update','2008-09-25 16:06:57','{\"percentcomplete\":\"0\",\"taskid\":\"3cf040a5-de40-496b-ae00-2b77d8b68fa9\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"6\",\"duration\":3,\"startdate\":\"2007-02-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-03-2\"}',6),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','3cf040a5-de40-496b-ae00-2b77d8b68fa9','predecessor','2008-09-25 16:07:14','{taskid:\"3cf040a5-de40-496b-ae00-2b77d8b68fa9\",taskname:\"\",duration:3,startdate:\"2007-02-28\",enddate:\"2007-03-2\",predecessor:\"6,5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2007-02-28\",actualduration:\"3\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',6),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','ac17a1c2-b61a-4cff-b881-d1f2db8af43c','predecessor','2008-09-25 16:07:27','{taskid:\"ac17a1c2-b61a-4cff-b881-d1f2db8af43c\",taskname:\"g\",duration:5,startdate:\"2007-03-1\",enddate:\"2007-03-7\",predecessor:\"5,3\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-23\",actualduration:\"5\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','79921.41763679683','a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc','predecessor','2008-09-25 16:07:32','{taskid:\"a2da86b9-f1e2-4bc3-b388-b7d4bcc726fc\",taskname:\"gf\",duration:2,startdate:\"2007-02-26\",enddate:\"2007-02-27\",predecessor:\"2\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-20\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','96362.04173635558','33a8c3f5-4f77-40ed-aadf-828527c96001','predecessor','2008-09-25 16:07:41','{taskid:\"33a8c3f5-4f77-40ed-aadf-828527c96001\",taskname:\"gf\",duration:2,startdate:\"2007-02-14\",enddate:\"2007-02-15\",predecessor:\"6\",resourcename:\"\",parent:e2e52bae-9ca3-4de2-8f15-b41c654bcb43,level:1,percentcomplete:\"0\",actstartdate:\"2007-02-14\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('68afdd4d-13a2-44cc-8228-6352153cb31d','40603.74037362635','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-25 16:24:14','{\"percentcomplete\":\"100\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"Anand\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Ma\",\"enddate\":\"2008-09-25\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','27064.777305349708','0e85805a-2671-4403-a8cc-3bd0b837eaee','update','2008-09-25 16:26:41','{\"percentcomplete\":\"17\",\"taskid\":\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",\"resourcename\":\"Anand,Salini\",\"actualduration\":\"6\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Ma\",\"enddate\":\"2008-10-3\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','a3852498-8153-487b-b172-dbbc7a63c59f','update','2008-09-26 11:46:22','{\"percentcomplete\":\"0\",\"taskid\":\"a3852498-8153-487b-b172-dbbc7a63c59f\",\"resourcename\":\"Salini\",\"actualduration\":\"10.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":10.5,\"startdate\":\"2008-09-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"J\",\"enddate\":\"2008-10-7\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-26 11:46:36','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Anand\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-6\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','e098d989-f405-4928-8c63-d3e6ac449e12','predecessor','2008-09-26 11:48:11','{taskid:\"e098d989-f405-4928-8c63-d3e6ac449e12\",taskname:\"I\",duration:1,startdate:\"2008-10-23\",enddate:\"2008-10-23\",predecessor:\"2,22\",resourcename:\"Harry\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-09-19\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','a3852498-8153-487b-b172-dbbc7a63c59f','indent','2008-09-26 11:48:56','{taskid:\"a3852498-8153-487b-b172-dbbc7a63c59f\",taskname:\"J\",duration:10.5,startdate:\"2008-10-23\",enddate:\"2008-11-6\",predecessor:\"\",resourcename:\"Salini\",parent:e098d989-f405-4928-8c63-d3e6ac449e12,level:1,percentcomplete:\"0\",actstartdate:\"2008-09-22\",actualduration:\"10.5\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',9),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','indent','2008-09-26 11:49:16','{taskid:\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",taskname:\"f\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"\",parent:68626b80-f3c4-4984-945a-2e0082b62a53,level:2,percentcomplete:\"0\",actstartdate:\"2008-10-2\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-26 11:49:18','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-10-17\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-24\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-26 11:49:21','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-10-17\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-21\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-26 11:49:51','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"9.5\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":9.5,\"startdate\":\"2008-10-17\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-30\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-26 11:49:55','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-10-17\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-10-24\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0294ced7-34ac-4ecc-9cc9-c0ed5b107e66','update','2008-09-26 11:50:00','{\"percentcomplete\":\"0\",\"taskid\":\"0294ced7-34ac-4ecc-9cc9-c0ed5b107e66\",\"resourcename\":\"\",\"actualduration\":\"6\",\"parent\":\"68626b80-f3c4-4984-945a-2e0082b62a53\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":6,\"startdate\":\"2008-10-27\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"f\",\"enddate\":\"2008-11-3\"}',16),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','0e85805a-2671-4403-a8cc-3bd0b837eaee','indent','2008-09-26 11:50:49','{taskid:\"0e85805a-2671-4403-a8cc-3bd0b837eaee\",taskname:\"Ma\",duration:6,startdate:\"2008-10-16\",enddate:\"2008-10-23\",predecessor:\"\",resourcename:\"Anand,Salini\",parent:97a8799a-a1cb-4a12-bea5-e80af7d1c56d,level:1,percentcomplete:\"17\",actstartdate:\"2008-09-25\",actualduration:\"6\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',12),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-26 11:51:03','{\"percentcomplete\":\"40\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"anup\",\"actualduration\":\"2.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":2.5,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"2\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"K\",\"enddate\":\"2008-10-9\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','77178.91569454345','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','update','2008-09-26 11:51:09','{\"percentcomplete\":\"25\",\"taskid\":\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",\"resourcename\":\"anup\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":4,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"2\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"K\",\"enddate\":\"2008-10-10\"}',10),('68afdd4d-13a2-44cc-8228-6352153cb31d','29602.45146362359','e3e8d02e-c75d-4977-8f0b-76ced5dee33f','newtask','2008-09-26 11:57:10','{\"percentcomplete\":\"0\",\"taskid\":\"e3e8d02e-c75d-4977-8f0b-76ced5dee33f\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-26 12:08:13','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Anand\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-20\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-26 12:08:52','{\"percentcomplete\":\"8\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"14.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14.5,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-7\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-09-26 12:08:57','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Anand\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-25\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-25\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-15\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','6bcab897-69f6-4292-80d6-6eefc65601cf','insert','2008-09-26 12:09:30','{\"percentcomplete\":\"0\",\"taskid\":\"6bcab897-69f6-4292-80d6-6eefc65601cf\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',24),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','df4c937f-0b6d-4ad5-a29e-db32d72c239c','predecessor','2008-09-26 12:09:38','{taskid:\"df4c937f-0b6d-4ad5-a29e-db32d72c239c\",taskname:\"ff\",duration:2,startdate:\"2008-10-8\",enddate:\"2008-10-9\",predecessor:\"25\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',18),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-26 12:10:12','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"N\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"25\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','predecessor','2008-09-26 12:10:18','{taskid:\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",taskname:\"H\",duration:6.5,startdate:\"2008-10-7\",enddate:\"2008-10-15\",predecessor:\"1,25\",resourcename:\"Anand\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-17\",actualduration:\"6.5\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','predecessor','2008-09-26 12:11:08','{taskid:\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",taskname:\"C\",duration:14,startdate:\"2008-09-24\",enddate:\"2008-10-14\",predecessor:\"25\",resourcename:\"Anand\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-25\",actualduration:\"14\",ismilestone:\"false\",priority:\"0\",notes:\"&nbsp;dxx\",isparent:\"false\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','update','2008-09-26 12:11:14','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"Anand\",\"actualduration\":\"6.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"1,25\",\"duration\":6.5,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-10-15\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','34419.10164468793','8ff62ede-c46a-4a82-8c1b-ef555e6f994d','predecessor','2008-09-26 12:11:22','{taskid:\"8ff62ede-c46a-4a82-8c1b-ef555e6f994d\",taskname:\"\",duration:2,startdate:\"2008-09-18\",enddate:\"2008-09-19\",predecessor:\"9\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-18\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',20),('a45dad15-1a11-4453-9612-a67cc344c5f5','14506.929802781043','beb946bc-be77-4fc4-8e16-adfc41a2309d','insert','2008-09-27 03:46:02','{\"percentcomplete\":\"0\",\"taskid\":\"beb946bc-be77-4fc4-8e16-adfc41a2309d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"analysis\",\"enddate\":\"2008-09-29\"}',1),('4d7bb4d7-073f-407a-9832-4b0619cd613e','73744.85845347754','b5ad200d-76df-49ee-ad22-646994e20f56','update','2008-09-27 10:00:37','{\"percentcomplete\":\"0\",\"taskid\":\"b5ad200d-76df-49ee-ad22-646994e20f56\",\"resourcename\":\"Shabbir\",\"actualduration\":\"2.5\",\"parent\":\"6831ae10-65df-4926-95c9-269dc8c5811b\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2.5,\"startdate\":\"2008-01-1\",\"level\":3,\"priority\":\"1\",\"actstartdate\":\"2008-01-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define project charter\",\"enddate\":\"2008-01-3\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','58976.77612903749','0a5e346d-ae94-4ea4-9d3c-db871bdf6d41','predecessor','2008-09-27 15:07:23','{taskid:\"0a5e346d-ae94-4ea4-9d3c-db871bdf6d41\",taskname:\"N\",duration:2,startdate:\"2008-10-1\",enddate:\"2008-10-2\",predecessor:\"25,4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',14),('4cc73d74-3152-42dc-a626-12479e455ca0','35346.420689507904','1beaa95f-010d-407b-b231-c085b3ab4883','insert','2008-09-28 14:46:03','{\"percentcomplete\":\"0\",\"taskid\":\"1beaa95f-010d-407b-b231-c085b3ab4883\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',7),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','d495ae83-3892-4616-9567-f37f7f6fe86a','insert','2008-09-28 20:37:17','{\"percentcomplete\":\"0\",\"taskid\":\"d495ae83-3892-4616-9567-f37f7f6fe86a\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Mindmap\",\"enddate\":\"2008-09-29\"}',0),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','d495ae83-3892-4616-9567-f37f7f6fe86a','update','2008-09-28 20:37:22','{\"percentcomplete\":\"0\",\"taskid\":\"d495ae83-3892-4616-9567-f37f7f6fe86a\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Mindmap\",\"enddate\":\"2008-10-17\"}',0),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','f29c37c2-ea5c-403c-894a-9bb547d8063d','insert','2008-09-28 20:45:15','{\"percentcomplete\":\"0\",\"taskid\":\"f29c37c2-ea5c-403c-894a-9bb547d8063d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"yup\",\"enddate\":\"2008-09-29\"}',1),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','f6138103-d97d-49d8-965e-367108e1cce5','insert','2008-09-28 20:45:19','{\"percentcomplete\":\"0\",\"taskid\":\"f6138103-d97d-49d8-965e-367108e1cce5\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"uh huh\",\"enddate\":\"2008-09-29\"}',2),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','f29c37c2-ea5c-403c-894a-9bb547d8063d','update','2008-09-28 20:45:28','{\"percentcomplete\":\"0\",\"taskid\":\"f29c37c2-ea5c-403c-894a-9bb547d8063d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-10\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-10\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"yup\",\"enddate\":\"2008-10-10\"}',1),('4c7b72be-1429-4566-86f1-5203d7c2bf35','4016.9233543910223','f6138103-d97d-49d8-965e-367108e1cce5','update','2008-09-28 20:45:36','{\"percentcomplete\":\"0\",\"taskid\":\"f6138103-d97d-49d8-965e-367108e1cce5\",\"resourcename\":\"\",\"actualduration\":\"3\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":3,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"uh huh\",\"enddate\":\"2008-10-1\"}',2),('6c748358-239a-4943-9223-c24e14876f9a','41141.65677860499','84ac52b0-823c-4ef6-b10c-ca83b4f3ad55','newtask','2008-09-29 04:23:45','{\"percentcomplete\":\"0\",\"taskid\":\"84ac52b0-823c-4ef6-b10c-ca83b4f3ad55\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','91187.3533547303','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-09-30 03:53:27','{\"percentcomplete\":\"8\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"14.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14.5,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-7\"}',0),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','18478.133726975586','0a4b9406-42f5-4f97-84c1-834a5246703f','update','2008-10-01 06:05:27','{\"percentcomplete\":\"0\",\"taskid\":\"0a4b9406-42f5-4f97-84c1-834a5246703f\",\"resourcename\":\"\",\"actualduration\":\"4.5\",\"parent\":\"fefdf120-8cb1-419f-ba6b-f45374db3908\",\"isparent\":\"false\",\"predecessor\":\"6\",\"duration\":4.5,\"startdate\":\"2006-08-16\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2006-08-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Project Statement of Work\",\"enddate\":\"2006-08-22\"}',6),('4d7bb4d7-073f-407a-9832-4b0619cd613e','94316.8572860588','554475e1-7947-4df5-a045-c65bf2503c83','update','2008-10-01 13:28:50','{\"percentcomplete\":\"0\",\"taskid\":\"554475e1-7947-4df5-a045-c65bf2503c83\",\"resourcename\":\"Shabbir\",\"actualduration\":\"0.0d\",\"parent\":\"4c76d07f-9658-4a2b-82ee-91ddf8556a45\",\"isparent\":\"false\",\"predecessor\":\"10\",\"duration\":0,\"startdate\":\"2008-01-4\",\"level\":3,\"priority\":\"1\",\"actstartdate\":\"2008-01-4\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"Scope complete\",\"enddate\":\"2008-01-4\"}',10),('0fab2280-3534-4af4-93fb-7424fe307f90','11905.243272559852','b1e730f7-d14d-40c0-a09a-6ee78f9e9d08','insert','2008-10-01 19:25:08','{\"percentcomplete\":\"0\",\"taskid\":\"b1e730f7-d14d-40c0-a09a-6ee78f9e9d08\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"HTML Main Template\",\"enddate\":\"2008-10-1\"}',0),('0fab2280-3534-4af4-93fb-7424fe307f90','11905.243272559852','9462c8a7-47fb-4005-9cb6-e9e39788b5fe','insert','2008-10-01 19:27:48','{\"percentcomplete\":\"0\",\"taskid\":\"9462c8a7-47fb-4005-9cb6-e9e39788b5fe\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-1\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-2\"}',0),('30693afa-e8b1-4992-a67c-543ec50d3584','75138.11337450883','2826432a-57c1-4b25-9673-55abc72d3d56','insert','2008-10-03 01:17:22','{\"percentcomplete\":\"0\",\"taskid\":\"2826432a-57c1-4b25-9673-55abc72d3d56\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Documentacion\",\"enddate\":\"2008-10-2\"}',0),('30693afa-e8b1-4992-a67c-543ec50d3584','75138.11337450883','89538e24-0584-48b8-8ece-fd446279c6a1','insert','2008-10-03 01:17:55','{\"percentcomplete\":\"0\",\"taskid\":\"89538e24-0584-48b8-8ece-fd446279c6a1\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-2\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Modelo de Datos\",\"enddate\":\"2008-10-2\"}',1),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','21e1d3cd-2466-4402-856f-a536c0821efe','insert','2008-10-04 10:19:22','{\"percentcomplete\":\"0\",\"taskid\":\"21e1d3cd-2466-4402-856f-a536c0821efe\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Design\",\"enddate\":\"2008-10-6\"}',0),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','8f73b2e5-acab-4f3c-a9e3-eb92c9d63512','insert','2008-10-04 10:19:55','{\"percentcomplete\":\"0\",\"taskid\":\"8f73b2e5-acab-4f3c-a9e3-eb92c9d63512\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Supply\",\"enddate\":\"2008-10-6\"}',1),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','2c4b31e0-a65b-4bd9-99eb-5a290846bc8f','insert','2008-10-04 10:20:10','{\"percentcomplete\":\"0\",\"taskid\":\"2c4b31e0-a65b-4bd9-99eb-5a290846bc8f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Transport\",\"enddate\":\"2008-10-6\"}',2),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','b87b2863-a942-4c2a-b38e-bac3376b250b','insert','2008-10-04 10:20:13','{\"percentcomplete\":\"0\",\"taskid\":\"b87b2863-a942-4c2a-b38e-bac3376b250b\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Erection\",\"enddate\":\"2008-10-6\"}',3),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','41319fef-2718-45ca-b1fd-ef3941f68137','insert','2008-10-04 10:22:05','{\"percentcomplete\":\"0\",\"taskid\":\"41319fef-2718-45ca-b1fd-ef3941f68137\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Testing\",\"enddate\":\"2008-10-6\"}',4),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','1fcc06da-5f44-4bdc-8970-dff0aae19c0e','insert','2008-10-04 10:22:11','{\"percentcomplete\":\"0\",\"taskid\":\"1fcc06da-5f44-4bdc-8970-dff0aae19c0e\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Commissioning\",\"enddate\":\"2008-10-6\"}',5),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','8f73b2e5-acab-4f3c-a9e3-eb92c9d63512','predecessor','2008-10-04 10:22:53','{taskid:\"8f73b2e5-acab-4f3c-a9e3-eb92c9d63512\",taskname:\"Supply\",duration:60,startdate:\"2008-10-6\",enddate:\"2008-12-26\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-6\",actualduration:\"60\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','2c4b31e0-a65b-4bd9-99eb-5a290846bc8f','predecessor','2008-10-04 10:22:55','{taskid:\"2c4b31e0-a65b-4bd9-99eb-5a290846bc8f\",taskname:\"Transport\",duration:60,startdate:\"2008-10-6\",enddate:\"2008-12-26\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-6\",actualduration:\"60\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','b87b2863-a942-4c2a-b38e-bac3376b250b','predecessor','2008-10-04 10:22:58','{taskid:\"b87b2863-a942-4c2a-b38e-bac3376b250b\",taskname:\"Erection\",duration:150,startdate:\"2008-10-6\",enddate:\"2009-05-1\",predecessor:\"3\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-6\",actualduration:\"150\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','41319fef-2718-45ca-b1fd-ef3941f68137','predecessor','2008-10-04 10:23:00','{taskid:\"41319fef-2718-45ca-b1fd-ef3941f68137\",taskname:\"Testing\",duration:60,startdate:\"2008-10-6\",enddate:\"2008-12-26\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-6\",actualduration:\"60\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('cde52806-d91a-4f31-9059-31eae437a1ac','98388.43012725127','1fcc06da-5f44-4bdc-8970-dff0aae19c0e','predecessor','2008-10-04 10:23:02','{taskid:\"1fcc06da-5f44-4bdc-8970-dff0aae19c0e\",taskname:\"Commissioning\",duration:50,startdate:\"2008-10-6\",enddate:\"2008-12-12\",predecessor:\"5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-6\",actualduration:\"50\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('2fcb1fb1-ec19-409f-b62a-036b9826526c','64739.52308921603','da0ff8c2-3f16-45fa-8883-5a6931ffcbbd','insert','2008-10-04 11:22:51','{\"percentcomplete\":\"0\",\"taskid\":\"da0ff8c2-3f16-45fa-8883-5a6931ffcbbd\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"commissioning\",\"enddate\":\"2008-10-6\"}',0),('cde52806-d91a-4f31-9059-31eae437a1ac','55582.03108527344','eaa2d389-c910-4dae-bd33-8b080af87c10','template','2008-10-04 12:18:23','[{\"percentcomplete\":\"0\",\"taskid\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"resourcename\":\"\",\"actualduration\":\"101.0d\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":101,\"startdate\":\"2007-01-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-01-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Change Management \",\"enddate\":\"2007-05-21\"},{\"percentcomplete\":\"0\",\"taskid\":\"b1af5de3-dda5-458b-99ff-bd945667114c\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"2.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-01-3\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-01-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Conduct Change Management Plan Workshop\",\"enddate\":\"2007-01-4\"},{\"percentcomplete\":\"0\",\"taskid\":\"27d968f9-96eb-4ca5-8145-91ee0ed47afb\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"5.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2007-01-5\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-01-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop Change Management Plan\",\"enddate\":\"2007-01-11\"},{\"percentcomplete\":\"0\",\"taskid\":\"bab9d94b-e21f-4d88-91ae-af619eb96629\",\"resourcename\":\"613526e0-e9de-4cdd-9319-8c018d9bb2d7\",\"actualduration\":\"94.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":94,\"startdate\":\"2007-01-12\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2007-01-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Deploy Change Management Activities as per plan\",\"enddate\":\"2007-05-21\"},{\"percentcomplete\":\"0\",\"taskid\":\"d7511350-c0c3-48f8-ae27-b08b81bf5449\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"2.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2007-01-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-01-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Conduct Change Management Plan Workshop\",\"enddate\":\"2007-01-4\"},{\"percentcomplete\":\"0\",\"taskid\":\"beafaf1a-33d5-4040-beaa-e72e62426122\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"5.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2007-01-5\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-01-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop Change Management Plan\",\"enddate\":\"2007-01-11\"},{\"percentcomplete\":\"0\",\"taskid\":\"eaa2d389-c910-4dae-bd33-8b080af87c10\",\"resourcename\":\"613526e0-e9de-4cdd-9319-8c018d9bb2d7\",\"actualduration\":\"94.0d\",\"parent\":\"35cfb1e3-9870-474d-a727-351170f01df8\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":94,\"startdate\":\"2007-01-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-01-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Deploy Change Management Activities as per plan\",\"enddate\":\"2007-05-21\"}]',6),('3c6593e7-69eb-4182-9781-4a992b036822','55582.03108527344','925f7639-11bc-4877-ba94-f248a49121ad','insert','2008-10-04 12:41:19','{\"percentcomplete\":\"0\",\"taskid\":\"925f7639-11bc-4877-ba94-f248a49121ad\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Installation of Substations\",\"enddate\":\"2008-10-6\"}',0),('a81637f4-9bbf-41cb-bab7-0cd334b96413','55582.03108527344','3f7f74e5-c79d-42c1-8ab6-90a5507557d4','insert','2008-10-04 12:42:00','{\"percentcomplete\":\"0\",\"taskid\":\"3f7f74e5-c79d-42c1-8ab6-90a5507557d4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"2000 km pipeline\",\"enddate\":\"2008-10-6\"}',0),('3c6593e7-69eb-4182-9781-4a992b036822','55582.03108527344','1cb9ec98-4f15-4be3-855a-a668cfd740b4','insert','2008-10-04 12:42:53','{\"percentcomplete\":\"0\",\"taskid\":\"1cb9ec98-4f15-4be3-855a-a668cfd740b4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review supplier quotations\",\"enddate\":\"2008-10-6\"}',1),('3c6593e7-69eb-4182-9781-4a992b036822','55582.03108527344','1cb9ec98-4f15-4be3-855a-a668cfd740b4','update','2008-10-04 12:43:09','{\"percentcomplete\":\"0\",\"taskid\":\"1cb9ec98-4f15-4be3-855a-a668cfd740b4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review supplier quotations\",\"enddate\":\"2008-10-4\"}',1),('a81637f4-9bbf-41cb-bab7-0cd334b96413','55582.03108527344','5c4ac9b6-b943-4fa2-ba23-5e0bddc42fcb','insert','2008-10-04 12:44:05','{\"percentcomplete\":\"0\",\"taskid\":\"5c4ac9b6-b943-4fa2-ba23-5e0bddc42fcb\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Prepare draft of risk management plan\",\"enddate\":\"2008-10-6\"}',1),('a81637f4-9bbf-41cb-bab7-0cd334b96413','55582.03108527344','5c4ac9b6-b943-4fa2-ba23-5e0bddc42fcb','update','2008-10-04 12:44:27','{\"percentcomplete\":\"40\",\"taskid\":\"5c4ac9b6-b943-4fa2-ba23-5e0bddc42fcb\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-5\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-5\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Prepare draft of risk management plan\",\"enddate\":\"2008-10-5\"}',1),('c3313ec1-6120-4a57-aa35-20af1616b2dd','55582.03108527344','1fa8a43a-8463-4856-be5e-4f0f5661726b','update','2008-10-04 12:45:27','{\"percentcomplete\":\"26.153846153846157\",\"taskid\":\"1fa8a43a-8463-4856-be5e-4f0f5661726b\",\"resourcename\":\"\",\"actualduration\":\"27.5d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":187.5,\"startdate\":\"2008-02-13\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-02-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Detailed Design and Prototype\",\"enddate\":\"2008-10-31\"}',33),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','7367ee86-2cc7-491b-9867-0ce5dc775352','predecessor','2008-10-04 12:49:11','{taskid:\"7367ee86-2cc7-491b-9867-0ce5dc775352\",taskname:\"Mobilise project team resources\",duration:2.0d,startdate:\"2008-01-15\",enddate:\"2008-01-16\",predecessor:\"4\",resourcename:\"azrul\",parent:0025a01f-1157-4309-885f-de769979eabf,level:3,percentcomplete:\"0\",actstartdate:\"2008-01-15\",actualduration:\"2.0d\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','ed5c89e8-a9b0-4084-826a-1b811c72b493','update','2008-10-04 12:53:47','{\"percentcomplete\":\"17.857142857142858\",\"taskid\":\"ed5c89e8-a9b0-4084-826a-1b811c72b493\",\"resourcename\":\"\",\"actualduration\":\"21.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":21,\"startdate\":\"2008-09-10\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Business Process Re-engineering\",\"enddate\":\"2008-10-8\"}',21),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','ed5c89e8-a9b0-4084-826a-1b811c72b493','update','2008-10-04 12:53:59','{\"percentcomplete\":\"39.285714285714285\",\"taskid\":\"ed5c89e8-a9b0-4084-826a-1b811c72b493\",\"resourcename\":\"\",\"actualduration\":\"21.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":21,\"startdate\":\"2008-09-10\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Business Process Re-engineering\",\"enddate\":\"2008-10-8\"}',21),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','ed5c89e8-a9b0-4084-826a-1b811c72b493','update','2008-10-04 12:54:06','{\"percentcomplete\":\"41.66666666666667\",\"taskid\":\"ed5c89e8-a9b0-4084-826a-1b811c72b493\",\"resourcename\":\"\",\"actualduration\":\"21.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":21,\"startdate\":\"2008-09-10\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Business Process Re-engineering\",\"enddate\":\"2008-10-8\"}',21),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','ed5c89e8-a9b0-4084-826a-1b811c72b493','update','2008-10-04 12:54:14','{\"percentcomplete\":\"48.80952380952381\",\"taskid\":\"ed5c89e8-a9b0-4084-826a-1b811c72b493\",\"resourcename\":\"\",\"actualduration\":\"21.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":21,\"startdate\":\"2008-09-10\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Business Process Re-engineering\",\"enddate\":\"2008-10-8\"}',21),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','09083421-5192-4799-8091-ceae497aab2a','update','2008-10-04 12:54:23','{\"percentcomplete\":\"25\",\"taskid\":\"09083421-5192-4799-8091-ceae497aab2a\",\"resourcename\":\"\",\"actualduration\":\"17.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Functional Requirement Study\",\"enddate\":\"2008-10-8\"}',26),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','09083421-5192-4799-8091-ceae497aab2a','update','2008-10-04 12:54:29','{\"percentcomplete\":\"36.875\",\"taskid\":\"09083421-5192-4799-8091-ceae497aab2a\",\"resourcename\":\"\",\"actualduration\":\"17.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Functional Requirement Study\",\"enddate\":\"2008-10-8\"}',26),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','09083421-5192-4799-8091-ceae497aab2a','update','2008-10-04 12:54:40','{\"percentcomplete\":\"60.3125\",\"taskid\":\"09083421-5192-4799-8091-ceae497aab2a\",\"resourcename\":\"\",\"actualduration\":\"17.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Functional Requirement Study\",\"enddate\":\"2008-10-8\"}',26),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','09083421-5192-4799-8091-ceae497aab2a','update','2008-10-04 12:54:52','{\"percentcomplete\":\"69.6875\",\"taskid\":\"09083421-5192-4799-8091-ceae497aab2a\",\"resourcename\":\"\",\"actualduration\":\"17.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Functional Requirement Study\",\"enddate\":\"2008-10-8\"}',26),('c3313ec1-6120-4a57-aa35-20af1616b2dd','57781.17596533801','09083421-5192-4799-8091-ceae497aab2a','update','2008-10-04 12:55:02','{\"percentcomplete\":\"69.6875\",\"taskid\":\"09083421-5192-4799-8091-ceae497aab2a\",\"resourcename\":\"\",\"actualduration\":\"17.0d\",\"parent\":\"1aabad70-cd32-489d-a3fb-4d8568c519c4\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-01-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Functional Requirement Study\",\"enddate\":\"2008-10-8\"}',26),('4d7bb4d7-073f-407a-9832-4b0619cd613e','81528.31539904168','25e82f3d-0daf-4865-8d5f-f392dfd35a4a','update','2008-10-05 06:28:09','{\"percentcomplete\":\"0\",\"taskid\":\"25e82f3d-0daf-4865-8d5f-f392dfd35a4a\",\"resourcename\":\"\",\"actualduration\":\"9\",\"parent\":\"ec3093e8-a2ed-40af-8aad-73738c1cf375\",\"isparent\":\"false\",\"predecessor\":\"23,21\",\"duration\":9,\"startdate\":\"2008-01-8\",\"level\":5,\"priority\":\"1\",\"actstartdate\":\"2008-01-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Gather personnel experience and opinion on KM via interviews \",\"enddate\":\"2008-01-18\"}',23),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-10-05 18:23:31','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-23\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-10-05 18:23:37','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-08-31\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-08-31\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-5\"}',6),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-10-05 18:23:39','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"4\",\"duration\":1,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-10-05 18:23:42','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"4\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','1beaa95f-010d-407b-b231-c085b3ab4883','update','2008-10-05 18:23:44','{\"percentcomplete\":\"0\",\"taskid\":\"1beaa95f-010d-407b-b231-c085b3ab4883\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',7),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','f6d56342-f499-49e0-b0ac-fad9a9eb3e67','update','2008-10-05 18:23:46','{\"percentcomplete\":\"0\",\"taskid\":\"f6d56342-f499-49e0-b0ac-fad9a9eb3e67\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"4\",\"duration\":4,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-6\"}',5),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','1beaa95f-010d-407b-b231-c085b3ab4883','update','2008-10-05 18:23:57','{\"percentcomplete\":\"0\",\"taskid\":\"1beaa95f-010d-407b-b231-c085b3ab4883\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-3\"}',7),('4cc73d74-3152-42dc-a626-12479e455ca0','98775.60189109367','1beaa95f-010d-407b-b231-c085b3ab4883','update','2008-10-05 18:24:03','{\"percentcomplete\":\"0\",\"taskid\":\"1beaa95f-010d-407b-b231-c085b3ab4883\",\"resourcename\":\"\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-09-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',7),('6bc99117-bbd9-4a0c-8da9-d3c6d9c4afb1','89788.87695517711','888b28b4-a07b-4c25-a391-bc83b89aabaf','newtask','2008-10-06 05:28:33','{\"percentcomplete\":\"0\",\"taskid\":\"888b28b4-a07b-4c25-a391-bc83b89aabaf\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('6bc99117-bbd9-4a0c-8da9-d3c6d9c4afb1','89788.87695517711','2f6bfeee-5aa5-4464-900e-a28ce1b5d3d8','newtask','2008-10-06 05:28:37','{\"percentcomplete\":\"0\",\"taskid\":\"2f6bfeee-5aa5-4464-900e-a28ce1b5d3d8\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('4cc73d74-3152-42dc-a626-12479e455ca0','42981.65747895837','4cb47474-8128-41e1-ac86-8a833ffb26da','update','2008-10-06 07:06:04','{\"percentcomplete\":\"0\",\"taskid\":\"4cb47474-8128-41e1-ac86-8a833ffb26da\",\"resourcename\":\"\",\"actualduration\":\"5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-09-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-9\"}',6),('c3313ec1-6120-4a57-aa35-20af1616b2dd','11285.084030010195','03aa6047-6be1-4eec-a71c-0e9947e2837a','update','2008-10-06 07:11:31','{\"percentcomplete\":\"85\",\"taskid\":\"03aa6047-6be1-4eec-a71c-0e9947e2837a\",\"resourcename\":\"christian,azrul,ravi\",\"actualduration\":\"4\",\"parent\":\"1fa8a43a-8463-4856-be5e-4f0f5661726b\",\"isparent\":\"false\",\"predecessor\":\"35\",\"duration\":4,\"startdate\":\"2008-10-9\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop detailed design and Prototype\",\"enddate\":\"2008-10-14\"}',35),('c3313ec1-6120-4a57-aa35-20af1616b2dd','11285.084030010195','03aa6047-6be1-4eec-a71c-0e9947e2837a','update','2008-10-06 07:11:38','{\"percentcomplete\":\"85\",\"taskid\":\"03aa6047-6be1-4eec-a71c-0e9947e2837a\",\"resourcename\":\"christian,azrul,ravi\",\"actualduration\":\"4\",\"parent\":\"1fa8a43a-8463-4856-be5e-4f0f5661726b\",\"isparent\":\"false\",\"predecessor\":\"35\",\"duration\":4,\"startdate\":\"2008-10-11\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop detailed design and Prototype\",\"enddate\":\"2008-10-15\"}',35),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','ad4035ad-632c-452b-a693-93d2e03b4d2d','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"ad4035ad-632c-452b-a693-93d2e03b4d2d\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','47b94342-f3b9-48a2-a457-acacd038d893','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"47b94342-f3b9-48a2-a457-acacd038d893\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','3358a769-3806-4d4d-9079-7528a6e0d0e6','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"3358a769-3806-4d4d-9079-7528a6e0d0e6\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','e1eb4fa7-9f0a-4875-b40d-f00328f13212','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"e1eb4fa7-9f0a-4875-b40d-f00328f13212\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','408cbdd2-9d16-419f-ad10-638576c2c265','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"408cbdd2-9d16-419f-ad10-638576c2c265\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','e6e9d5e2-4dc6-4f39-ae70-b3ce505cd10d','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"e6e9d5e2-4dc6-4f39-ae70-b3ce505cd10d\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','28ab917b-be5d-4541-8791-4005f2533a33','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"28ab917b-be5d-4541-8791-4005f2533a33\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','029a63b7-6343-4aee-8746-699ce13fde32','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"029a63b7-6343-4aee-8746-699ce13fde32\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','c2b49e56-2121-48f2-91a1-7409fc1e3847','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"c2b49e56-2121-48f2-91a1-7409fc1e3847\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','5ba8ae1f-028b-4531-bcfd-fc3a690742b9','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"5ba8ae1f-028b-4531-bcfd-fc3a690742b9\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','66fe7707-ca72-42b8-9e91-98aa4d9a3747','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"66fe7707-ca72-42b8-9e91-98aa4d9a3747\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','2104007f-e37d-4da3-8c98-0377e425cc04','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"2104007f-e37d-4da3-8c98-0377e425cc04\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','d4974560-0378-4cf2-8a40-80dd4bebeed5','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"d4974560-0378-4cf2-8a40-80dd4bebeed5\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','01c6c14f-4143-4c11-a502-d376128dbd03','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"01c6c14f-4143-4c11-a502-d376128dbd03\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','dffc15c1-81af-498b-a7c3-0df3adf0f114','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"dffc15c1-81af-498b-a7c3-0df3adf0f114\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','b578d332-fb2d-4887-8e6a-8905e5352d21','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"b578d332-fb2d-4887-8e6a-8905e5352d21\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','31eeb4e4-c33e-46ab-beda-fb3045ca21cf','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"31eeb4e4-c33e-46ab-beda-fb3045ca21cf\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','2df57685-5d54-4b04-b62e-dbce49336733','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"2df57685-5d54-4b04-b62e-dbce49336733\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','c1656a70-cd6d-4644-ab2e-189cc2afecab','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"c1656a70-cd6d-4644-ab2e-189cc2afecab\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','9b83beaa-2f03-4ae2-a1c6-826fdf8c7d53','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"9b83beaa-2f03-4ae2-a1c6-826fdf8c7d53\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','66edc2a9-e175-412f-a0e8-103eacacfc2f','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"66edc2a9-e175-412f-a0e8-103eacacfc2f\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','e59acbd5-4028-4ed8-bcc9-f780ffe91b63','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"e59acbd5-4028-4ed8-bcc9-f780ffe91b63\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','475b7d54-3f70-421f-a31c-6d9815e98e95','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"475b7d54-3f70-421f-a31c-6d9815e98e95\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','7cd48e28-5f40-4ea8-bd9d-5d6d5fd4926e','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"7cd48e28-5f40-4ea8-bd9d-5d6d5fd4926e\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','e1ae3ffb-3c84-40fb-9c7c-f8e54e89cdcf','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"e1ae3ffb-3c84-40fb-9c7c-f8e54e89cdcf\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','dd8be546-6554-407e-978d-169a10487e25','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"dd8be546-6554-407e-978d-169a10487e25\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','224f337e-5e2d-44fc-b3cb-ad3b6c731ee7','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"224f337e-5e2d-44fc-b3cb-ad3b6c731ee7\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','5669daff-e0b5-4a31-a404-594375bb4dbe','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"5669daff-e0b5-4a31-a404-594375bb4dbe\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','31e4a539-16a4-456a-8554-9d0c47f0ef35','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"31e4a539-16a4-456a-8554-9d0c47f0ef35\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','341f6a06-a7f7-484a-9f85-e6ee44234352','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"341f6a06-a7f7-484a-9f85-e6ee44234352\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','0ce1f63f-c402-42b3-aa84-1d8d02c59665','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"0ce1f63f-c402-42b3-aa84-1d8d02c59665\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','53eae9c7-65a1-480b-815e-324eddae21d9','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"53eae9c7-65a1-480b-815e-324eddae21d9\"}',-1),('cde52806-d91a-4f31-9059-31eae437a1ac','11285.084030010195','d0a9765c-f0c9-4b7e-bffc-93ffd5019406','deleteTask','2008-10-06 07:22:52','{\"taskid\":\"d0a9765c-f0c9-4b7e-bffc-93ffd5019406\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','97849.50770208095','0d0445f1-980d-4f05-ba56-a47973f1af39','newtask','2008-10-06 08:50:04','{\"percentcomplete\":\"0\",\"taskid\":\"0d0445f1-980d-4f05-ba56-a47973f1af39\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','97849.50770208095','cf5fa16a-a754-4e7c-b7ad-9cb7535e175a','newtask','2008-10-06 08:50:16','{\"percentcomplete\":\"0\",\"taskid\":\"cf5fa16a-a754-4e7c-b7ad-9cb7535e175a\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','17015.527339878612','cf5fa16a-a754-4e7c-b7ad-9cb7535e175a','deleteTask','2008-10-06 09:04:19','{\"taskid\":\"cf5fa16a-a754-4e7c-b7ad-9cb7535e175a\"}',-1),('68afdd4d-13a2-44cc-8228-6352153cb31d','17015.527339878612','0d0445f1-980d-4f05-ba56-a47973f1af39','deleteTask','2008-10-06 09:04:19','{\"taskid\":\"0d0445f1-980d-4f05-ba56-a47973f1af39\"}',-1),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','1236.7511514114415','9f1f0336-1566-48a3-8486-073581f7e8b1','update','2008-10-06 09:50:55','{\"percentcomplete\":\"0\",\"taskid\":\"9f1f0336-1566-48a3-8486-073581f7e8b1\",\"resourcename\":\"\",\"actualduration\":\"1.0d\",\"parent\":\"fefdf120-8cb1-419f-ba6b-f45374db3908\",\"isparent\":\"false\",\"predecessor\":\"2,3\",\"duration\":1,\"startdate\":\"2006-08-23\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2006-08-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Contract\",\"enddate\":\"2006-08-23\"}',5),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','1236.7511514114415','9f1f0336-1566-48a3-8486-073581f7e8b1','update','2008-10-06 09:51:01','{\"percentcomplete\":\"0\",\"taskid\":\"9f1f0336-1566-48a3-8486-073581f7e8b1\",\"resourcename\":\"\",\"actualduration\":\"1.0d\",\"parent\":\"fefdf120-8cb1-419f-ba6b-f45374db3908\",\"isparent\":\"false\",\"predecessor\":\"2,3\",\"duration\":1,\"startdate\":\"2006-08-23\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2006-08-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Contract\",\"enddate\":\"2006-08-23\"}',5),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','1236.7511514114415','9f1f0336-1566-48a3-8486-073581f7e8b1','update','2008-10-06 09:51:21','{\"percentcomplete\":\"0\",\"taskid\":\"9f1f0336-1566-48a3-8486-073581f7e8b1\",\"resourcename\":\"\",\"actualduration\":\"4.5\",\"parent\":\"fefdf120-8cb1-419f-ba6b-f45374db3908\",\"isparent\":\"false\",\"predecessor\":\"2,3\",\"duration\":4.5,\"startdate\":\"2006-08-24\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2006-08-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Contract\",\"enddate\":\"2006-08-30\"}',5),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','1236.7511514114415','9f1f0336-1566-48a3-8486-073581f7e8b1','update','2008-10-06 09:51:27','{\"percentcomplete\":\"0\",\"taskid\":\"9f1f0336-1566-48a3-8486-073581f7e8b1\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"fefdf120-8cb1-419f-ba6b-f45374db3908\",\"isparent\":\"false\",\"predecessor\":\"2,3\",\"duration\":1,\"startdate\":\"2006-08-24\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2006-08-23\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Contract\",\"enddate\":\"2006-08-24\"}',5),('4ea601e4-c65c-42d1-ac6a-201cea1dccaf','1236.7511514114415','cb81e362-135b-4905-be43-7e3f1c9ea84a','insert','2008-10-06 09:52:02','{\"percentcomplete\":\"0\",\"taskid\":\"cb81e362-135b-4905-be43-7e3f1c9ea84a\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2006-08-25\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2006-08-25\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2006-08-25\"}',50),('708f4756-651e-46c4-83d2-2a5989740d96','22307.451055541118','e15f9574-0661-4791-ada6-1c3798d242a3','insert','2008-10-06 10:23:22','{\"percentcomplete\":\"0\",\"taskid\":\"e15f9574-0661-4791-ada6-1c3798d242a3\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Do Stuff\",\"enddate\":\"2008-10-6\"}',0),('708f4756-651e-46c4-83d2-2a5989740d96','22307.451055541118','1b588bb9-e615-4ea6-8dd0-847c635e3acf','insert','2008-10-06 10:23:54','{\"percentcomplete\":\"0\",\"taskid\":\"1b588bb9-e615-4ea6-8dd0-847c635e3acf\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project leading\",\"enddate\":\"2008-10-6\"}',1),('4d7bb4d7-073f-407a-9832-4b0619cd613e','24854.61684965786','d5442380-2423-4dc5-b7a1-c6170ef1b835','update','2008-10-06 10:26:51','{\"percentcomplete\":\"0\",\"taskid\":\"d5442380-2423-4dc5-b7a1-c6170ef1b835\",\"resourcename\":\"lipika\",\"actualduration\":\"3.5\",\"parent\":\"9e2fb68c-7f1a-4448-a13b-2d1dacb4c9d6\",\"isparent\":\"false\",\"predecessor\":\"6\",\"duration\":3.5,\"startdate\":\"2008-01-2\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"2008-01-2\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Identify risks and risk mitigation approach\",\"enddate\":\"2008-01-7\"}',13),('68afdd4d-13a2-44cc-8228-6352153cb31d','14683.880412717282','347c5433-f569-44d4-822b-3ed672a239ed','predecessor','2008-10-07 10:01:23','{taskid:\"347c5433-f569-44d4-822b-3ed672a239ed\",taskname:\"\",duration:15,startdate:\"2008-09-15\",enddate:\"2008-10-6\",predecessor:\"1\",resourcename:\"Neha,Anand\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-09-14\",actualduration:\"15\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',21),('68afdd4d-13a2-44cc-8228-6352153cb31d','14683.880412717282','6bcab897-69f6-4292-80d6-6eefc65601cf','update','2008-10-07 10:01:35','{\"percentcomplete\":\"0\",\"taskid\":\"6bcab897-69f6-4292-80d6-6eefc65601cf\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-29\"}',24),('a498999b-c7cd-4981-9d82-7affadc1b6a1','5774.438194930553','40f1025d-82f5-42b9-a59b-be25a72deca7','insert','2008-10-07 11:56:50','{\"percentcomplete\":\"0\",\"taskid\":\"40f1025d-82f5-42b9-a59b-be25a72deca7\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-7\"}',0),('a498999b-c7cd-4981-9d82-7affadc1b6a1','5774.438194930553','6f2bc875-6db8-46d8-8e11-39a074aa818b','insert','2008-10-07 11:56:55','{\"percentcomplete\":\"0\",\"taskid\":\"6f2bc875-6db8-46d8-8e11-39a074aa818b\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-10\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','6f2bc875-6db8-46d8-8e11-39a074aa818b','deleteTask','2008-10-07 12:27:34','{\"taskid\":\"6f2bc875-6db8-46d8-8e11-39a074aa818b\"}',-1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','1e39d164-6350-433a-bb64-8a5700c5da68','insert','2008-10-07 12:27:38','{\"percentcomplete\":\"0\",\"taskid\":\"1e39d164-6350-433a-bb64-8a5700c5da68\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-8\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','1e39d164-6350-433a-bb64-8a5700c5da68','deleteTask','2008-10-07 12:27:43','{\"taskid\":\"1e39d164-6350-433a-bb64-8a5700c5da68\"}',-1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','8e9eba03-3834-4e8c-a0be-347480413fc7','insert','2008-10-07 12:27:48','{\"percentcomplete\":\"0\",\"taskid\":\"8e9eba03-3834-4e8c-a0be-347480413fc7\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-10\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-10\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','8e9eba03-3834-4e8c-a0be-347480413fc7','update','2008-10-07 12:27:52','{\"percentcomplete\":\"0\",\"taskid\":\"8e9eba03-3834-4e8c-a0be-347480413fc7\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-10\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-10\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-10\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','8e9eba03-3834-4e8c-a0be-347480413fc7','update','2008-10-07 12:28:00','{\"percentcomplete\":\"0\",\"taskid\":\"8e9eba03-3834-4e8c-a0be-347480413fc7\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-9\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','8e9eba03-3834-4e8c-a0be-347480413fc7','update','2008-10-07 12:28:04','{\"percentcomplete\":\"0\",\"taskid\":\"8e9eba03-3834-4e8c-a0be-347480413fc7\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-10\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','ae7db874-e431-41c7-8aec-4240974abf69','insert','2008-10-07 12:28:13','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:28:16','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:28:18','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-12\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:28:21','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','83f9342e-a16a-4074-a76c-775453d0e676','insert','2008-10-07 12:28:26','{\"percentcomplete\":\"0\",\"taskid\":\"83f9342e-a16a-4074-a76c-775453d0e676\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-16\"}',3),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','fe941a08-dacc-448d-82e0-c45d0a51a880','insert','2008-10-07 12:28:32','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-20\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','fe941a08-dacc-448d-82e0-c45d0a51a880','update','2008-10-07 12:28:38','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-20\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','fe941a08-dacc-448d-82e0-c45d0a51a880','update','2008-10-07 12:28:40','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-18\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','fe941a08-dacc-448d-82e0-c45d0a51a880','update','2008-10-07 12:28:44','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-18\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','fe941a08-dacc-448d-82e0-c45d0a51a880','update','2008-10-07 12:28:48','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-20\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','8ca29400-41ac-4b5a-81fd-c6fab34a1c72','insert','2008-10-07 12:28:52','{\"percentcomplete\":\"0\",\"taskid\":\"8ca29400-41ac-4b5a-81fd-c6fab34a1c72\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-23\"}',5),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','0351b33c-ac59-419d-80e4-fa2b6943932e','insert','2008-10-07 12:29:00','{\"percentcomplete\":\"0\",\"taskid\":\"0351b33c-ac59-419d-80e4-fa2b6943932e\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-8\"}',6),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','391b9056-03a6-4ef7-91d4-4cd50a3e8821','insert','2008-10-07 12:29:05','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','391b9056-03a6-4ef7-91d4-4cd50a3e8821','update','2008-10-07 12:29:08','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"0.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0.5,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','391b9056-03a6-4ef7-91d4-4cd50a3e8821','update','2008-10-07 12:29:10','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','391b9056-03a6-4ef7-91d4-4cd50a3e8821','update','2008-10-07 12:29:13','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-13\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','391b9056-03a6-4ef7-91d4-4cd50a3e8821','update','2008-10-07 12:29:15','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-11\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-11\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','1a5764fd-37a5-485b-98ec-4eeedddc93b2','insert','2008-10-07 12:29:19','{\"percentcomplete\":\"0\",\"taskid\":\"1a5764fd-37a5-485b-98ec-4eeedddc93b2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-14\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-14\"}',8),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','insert','2008-10-07 12:29:24','{\"percentcomplete\":\"0\",\"taskid\":\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-17\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','31693.42065230012','5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d','insert','2008-10-07 12:29:30','{\"percentcomplete\":\"0\",\"taskid\":\"5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-21\"}',10),('a498999b-c7cd-4981-9d82-7affadc1b6a1','86159.46853533387','40f1025d-82f5-42b9-a59b-be25a72deca7','update','2008-10-07 12:32:14','{\"percentcomplete\":\"0\",\"taskid\":\"40f1025d-82f5-42b9-a59b-be25a72deca7\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-6\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-6\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-7\"}',0),('a498999b-c7cd-4981-9d82-7affadc1b6a1','86159.46853533387','8e9eba03-3834-4e8c-a0be-347480413fc7','update','2008-10-07 12:32:18','{\"percentcomplete\":\"0\",\"taskid\":\"8e9eba03-3834-4e8c-a0be-347480413fc7\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"B\",\"enddate\":\"2008-10-10\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','86159.46853533387','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:32:20','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"C\",\"enddate\":\"2008-10-13\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','86159.46853533387','83f9342e-a16a-4074-a76c-775453d0e676','update','2008-10-07 12:32:22','{\"percentcomplete\":\"0\",\"taskid\":\"83f9342e-a16a-4074-a76c-775453d0e676\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"D\",\"enddate\":\"2008-10-16\"}',3),('a498999b-c7cd-4981-9d82-7affadc1b6a1','86159.46853533387','fe941a08-dacc-448d-82e0-c45d0a51a880','update','2008-10-07 12:32:24','{\"percentcomplete\":\"0\",\"taskid\":\"fe941a08-dacc-448d-82e0-c45d0a51a880\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-18\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-18\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"E\",\"enddate\":\"2008-10-20\"}',4),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','8ca29400-41ac-4b5a-81fd-c6fab34a1c72','update','2008-10-07 12:32:50','{\"percentcomplete\":\"0\",\"taskid\":\"8ca29400-41ac-4b5a-81fd-c6fab34a1c72\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"F\",\"enddate\":\"2008-10-23\"}',5),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','0351b33c-ac59-419d-80e4-fa2b6943932e','update','2008-10-07 12:32:52','{\"percentcomplete\":\"0\",\"taskid\":\"0351b33c-ac59-419d-80e4-fa2b6943932e\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"G\",\"enddate\":\"2008-10-8\"}',6),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','391b9056-03a6-4ef7-91d4-4cd50a3e8821','update','2008-10-07 12:32:54','{\"percentcomplete\":\"0\",\"taskid\":\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-11\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-10-11\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','1a5764fd-37a5-485b-98ec-4eeedddc93b2','update','2008-10-07 12:32:55','{\"percentcomplete\":\"0\",\"taskid\":\"1a5764fd-37a5-485b-98ec-4eeedddc93b2\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-14\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-14\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"I\",\"enddate\":\"2008-10-14\"}',8),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','update','2008-10-07 12:32:57','{\"percentcomplete\":\"0\",\"taskid\":\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"J\",\"enddate\":\"2008-10-17\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','62260.947563814465','5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d','update','2008-10-07 12:33:37','{\"percentcomplete\":\"0\",\"taskid\":\"5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"K\",\"enddate\":\"2008-10-21\"}',10),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:59:01','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"1.75\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.75,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"C\",\"enddate\":\"2008-10-14\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','ae7db874-e431-41c7-8aec-4240974abf69','update','2008-10-07 12:59:04','{\"percentcomplete\":\"0\",\"taskid\":\"ae7db874-e431-41c7-8aec-4240974abf69\",\"resourcename\":\"\",\"actualduration\":\"1.75\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1.75,\"startdate\":\"2008-10-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"C\",\"enddate\":\"2008-10-13\"}',2),('eb4e498a-1565-4cf3-83e3-aa5071662555','61674.82160408765','8805df66-b651-4312-9463-7000d46d6807','insert','2008-10-07 13:07:50','{\"percentcomplete\":\"0\",\"taskid\":\"8805df66-b651-4312-9463-7000d46d6807\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Dopust\",\"enddate\":\"2008-10-7\"}',0),('eb4e498a-1565-4cf3-83e3-aa5071662555','61674.82160408765','8805df66-b651-4312-9463-7000d46d6807','update','2008-10-07 13:08:31','{\"percentcomplete\":\"0\",\"taskid\":\"8805df66-b651-4312-9463-7000d46d6807\",\"resourcename\":\"Trick\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Dopust\",\"enddate\":\"2008-10-23\"}',0),('eb4e498a-1565-4cf3-83e3-aa5071662555','61674.82160408765','8805df66-b651-4312-9463-7000d46d6807','update','2008-10-07 13:08:33','{\"percentcomplete\":\"0\",\"taskid\":\"8805df66-b651-4312-9463-7000d46d6807\",\"resourcename\":\"Trick\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Dopust\",\"enddate\":\"2008-10-24\"}',0),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','ab4b0596-9485-4828-a8ce-3656b447ff90','insert','2008-10-07 13:36:54','{\"percentcomplete\":\"0\",\"taskid\":\"ab4b0596-9485-4828-a8ce-3656b447ff90\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-8\"}',11),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','9cefcf2f-cb03-4d2f-9ebc-901a8de075db','insert','2008-10-07 13:36:58','{\"percentcomplete\":\"0\",\"taskid\":\"9cefcf2f-cb03-4d2f-9ebc-901a8de075db\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-15\"}',12),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','ab4b0596-9485-4828-a8ce-3656b447ff90','update','2008-10-07 13:37:10','{\"percentcomplete\":\"0\",\"taskid\":\"ab4b0596-9485-4828-a8ce-3656b447ff90\",\"resourcename\":\"\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"Test\",\"enddate\":\"2008-10-8\"}',11),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','9cefcf2f-cb03-4d2f-9ebc-901a8de075db','update','2008-10-07 13:37:21','{\"percentcomplete\":\"0\",\"taskid\":\"9cefcf2f-cb03-4d2f-9ebc-901a8de075db\",\"resourcename\":\"\",\"actualduration\":\"0\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":0,\"startdate\":\"2008-10-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-15\",\"ismilestone\":\"true\",\"notes\":\"\",\"taskname\":\"Test1\",\"enddate\":\"2008-10-15\"}',12),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','ae7db874-e431-41c7-8aec-4240974abf69','predecessor','2008-10-07 13:37:51','{taskid:\"ae7db874-e431-41c7-8aec-4240974abf69\",taskname:\"C\",duration:1.75,startdate:\"2008-10-12\",enddate:\"2008-10-13\",predecessor:\"2\",resourcename:\"Adman\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-12\",actualduration:\"1.75\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','8ca29400-41ac-4b5a-81fd-c6fab34a1c72','predecessor','2008-10-07 13:37:55','{taskid:\"8ca29400-41ac-4b5a-81fd-c6fab34a1c72\",taskname:\"F\",duration:2,startdate:\"2008-10-22\",enddate:\"2008-10-23\",predecessor:\"5\",resourcename:\"Res 2\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-22\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','predecessor','2008-10-07 13:38:01','{taskid:\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",taskname:\"J\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"9\",resourcename:\"Alice\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','9cefcf2f-cb03-4d2f-9ebc-901a8de075db','predecessor','2008-10-07 13:38:04','{taskid:\"9cefcf2f-cb03-4d2f-9ebc-901a8de075db\",taskname:\"Test1\",duration:0,startdate:\"2008-10-15\",enddate:\"2008-10-15\",predecessor:\"12\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-15\",actualduration:\"0\",ismilestone:\"true\",priority:\"1\",notes:\"\",isparent:\"false\"}',12),('eb4e498a-1565-4cf3-83e3-aa5071662555','54830.77199261232','8805df66-b651-4312-9463-7000d46d6807','update','2008-10-07 14:01:22','{\"percentcomplete\":\"0\",\"taskid\":\"8805df66-b651-4312-9463-7000d46d6807\",\"resourcename\":\"Trick\",\"actualduration\":\"12\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":12,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Amplio web page\",\"enddate\":\"2008-10-23\"}',0),('eb4e498a-1565-4cf3-83e3-aa5071662555','54830.77199261232','9772287d-834f-41d0-ac0c-75480d659a9b','insert','2008-10-07 14:01:34','{\"percentcomplete\":\"0\",\"taskid\":\"9772287d-834f-41d0-ac0c-75480d659a9b\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"pripravit framework\",\"enddate\":\"2008-10-7\"}',1),('eb4e498a-1565-4cf3-83e3-aa5071662555','54830.77199261232','9772287d-834f-41d0-ac0c-75480d659a9b','indent','2008-10-07 14:01:51','{taskid:\"9772287d-834f-41d0-ac0c-75480d659a9b\",taskname:\"pripravit framework\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"\",resourcename:\"\",parent:8805df66-b651-4312-9463-7000d46d6807,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('eb4e498a-1565-4cf3-83e3-aa5071662555','51317.48881962297','2911fd62-2818-484d-bd8a-59396b8da194','insert','2008-10-07 14:02:36','{\"percentcomplete\":\"0\",\"taskid\":\"2911fd62-2818-484d-bd8a-59396b8da194\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"pripravi dizajn\",\"enddate\":\"2008-10-7\"}',2),('eb4e498a-1565-4cf3-83e3-aa5071662555','51317.48881962297','2911fd62-2818-484d-bd8a-59396b8da194','indent','2008-10-07 14:02:41','{taskid:\"2911fd62-2818-484d-bd8a-59396b8da194\",taskname:\"pripravi dizajn\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"\",resourcename:\"\",parent:8805df66-b651-4312-9463-7000d46d6807,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('eb4e498a-1565-4cf3-83e3-aa5071662555','9062.911624961967','27314e87-54bc-42a9-8c8c-1b70f4271b70','insert','2008-10-07 14:07:12','{\"percentcomplete\":\"0\",\"taskid\":\"27314e87-54bc-42a9-8c8c-1b70f4271b70\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Bus Stop\",\"enddate\":\"2008-10-7\"}',3),('eb4e498a-1565-4cf3-83e3-aa5071662555','9062.911624961967','aa0c5778-3def-4d1b-a9c3-2cc77db60c63','insert','2008-10-07 14:07:23','{\"percentcomplete\":\"0\",\"taskid\":\"aa0c5778-3def-4d1b-a9c3-2cc77db60c63\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"PSD v HTML\",\"enddate\":\"2008-10-7\"}',4),('eb4e498a-1565-4cf3-83e3-aa5071662555','9062.911624961967','aa0c5778-3def-4d1b-a9c3-2cc77db60c63','indent','2008-10-07 14:07:27','{taskid:\"aa0c5778-3def-4d1b-a9c3-2cc77db60c63\",taskname:\"PSD v HTML\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"\",resourcename:\"\",parent:27314e87-54bc-42a9-8c8c-1b70f4271b70,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('eb4e498a-1565-4cf3-83e3-aa5071662555','9062.911624961967','ba208c98-87d8-4134-bc83-9de7efb14bb7','newtask','2008-10-07 14:07:50','{\"percentcomplete\":\"0\",\"taskid\":\"ba208c98-87d8-4134-bc83-9de7efb14bb7\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":\"27314e87-54bc-42a9-8c8c-1b70f4271b70\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',4),('eb4e498a-1565-4cf3-83e3-aa5071662555','9062.911624961967','ba208c98-87d8-4134-bc83-9de7efb14bb7','deleteTask','2008-10-07 14:07:57','{\"taskid\":\"ba208c98-87d8-4134-bc83-9de7efb14bb7\"}',-1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','predecessor','2008-10-07 14:08:48','{taskid:\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",taskname:\"J\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"Alice\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-10-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','predecessor','2008-10-07 14:08:51','{taskid:\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",taskname:\"J\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"9\",resourcename:\"Alice\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-10-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','14225.018060937355','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','predecessor','2008-10-07 14:08:56','{taskid:\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",taskname:\"J\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"\",resourcename:\"Alice\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-10-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','dd4fa0a7-0c10-45d8-bbef-f6e078a92eed','predecessor','2008-10-07 14:47:57','{taskid:\"dd4fa0a7-0c10-45d8-bbef-f6e078a92eed\",taskname:\"J\",duration:1,startdate:\"2008-10-17\",enddate:\"2008-10-17\",predecessor:\"8\",resourcename:\"Alice\",parent:0,level:0,percentcomplete:\"30\",actstartdate:\"2008-10-17\",actualduration:\"1\",ismilestone:\"false\",priority:\"0\",notes:\"\",isparent:\"false\"}',9),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','391b9056-03a6-4ef7-91d4-4cd50a3e8821','predecessor','2008-10-07 14:48:02','{taskid:\"391b9056-03a6-4ef7-91d4-4cd50a3e8821\",taskname:\"H\",duration:1.5,startdate:\"2008-10-13\",enddate:\"2008-10-14\",predecessor:\"7\",resourcename:\"Res 4\",parent:0,level:0,percentcomplete:\"100\",actstartdate:\"2008-10-11\",actualduration:\"1.5\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',7),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','83f9342e-a16a-4074-a76c-775453d0e676','predecessor','2008-10-07 14:48:10','{taskid:\"83f9342e-a16a-4074-a76c-775453d0e676\",taskname:\"D\",duration:2,startdate:\"2008-10-15\",enddate:\"2008-10-16\",predecessor:\"3\",resourcename:\"Res 1\",parent:0,level:0,percentcomplete:\"50\",actstartdate:\"2008-10-15\",actualduration:\"2\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',3),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','8e9eba03-3834-4e8c-a0be-347480413fc7','predecessor','2008-10-07 14:48:14','{taskid:\"8e9eba03-3834-4e8c-a0be-347480413fc7\",taskname:\"B\",duration:2,startdate:\"2008-10-9\",enddate:\"2008-10-10\",predecessor:\"1\",resourcename:\"james\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-9\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d','predecessor','2008-10-07 14:48:20','{taskid:\"5c7d0a3e-7a9a-4a21-9a49-7faef6dd554d\",taskname:\"K\",duration:1,startdate:\"2008-10-21\",enddate:\"2008-10-21\",predecessor:\"10\",resourcename:\"james\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-21\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',10),('a498999b-c7cd-4981-9d82-7affadc1b6a1','12017.830740660429','fe941a08-dacc-448d-82e0-c45d0a51a880','predecessor','2008-10-07 14:48:27','{taskid:\"fe941a08-dacc-448d-82e0-c45d0a51a880\",taskname:\"E\",duration:2.13,startdate:\"2008-10-20\",enddate:\"2008-10-22\",predecessor:\"4\",resourcename:\"Rohit\",parent:0,level:0,percentcomplete:\"70\",actstartdate:\"2008-10-18\",actualduration:\"2.13\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','562e46ad-f785-402e-88c7-01b976758815','newtask','2008-10-07 15:46:11','{\"percentcomplete\":\"0\",\"taskid\":\"562e46ad-f785-402e-88c7-01b976758815\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','507ecc9f-9483-4d90-9589-0e46ee02ba55','newtask','2008-10-07 15:55:21','{\"percentcomplete\":\"0\",\"taskid\":\"507ecc9f-9483-4d90-9589-0e46ee02ba55\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','562e46ad-f785-402e-88c7-01b976758815','predecessor','2008-10-07 16:00:23','{taskid:\"562e46ad-f785-402e-88c7-01b976758815\",taskname:\"cabosoft.com svn checkin\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','562e46ad-f785-402e-88c7-01b976758815','indent','2008-10-07 16:01:51','{taskid:\"562e46ad-f785-402e-88c7-01b976758815\",taskname:\"cabosoft.com svn checkin\",duration:1,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"\",resourcename:\"madrid\",parent:507ecc9f-9483-4d90-9589-0e46ee02ba55,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','507ecc9f-9483-4d90-9589-0e46ee02ba55','update','2008-10-07 16:01:53','{\"percentcomplete\":\"0\",\"taskid\":\"507ecc9f-9483-4d90-9589-0e46ee02ba55\",\"resourcename\":\"madrid\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"cabosoft.com Services Page\",\"enddate\":\"2008-10-8\"}',0),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','562e46ad-f785-402e-88c7-01b976758815','update','2008-10-07 16:01:53','{\"percentcomplete\":\"0\",\"taskid\":\"562e46ad-f785-402e-88c7-01b976758815\",\"resourcename\":\"madrid\",\"actualduration\":\"1\",\"parent\":\"507ecc9f-9483-4d90-9589-0e46ee02ba55\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"cabosoft.com svn checkin\",\"enddate\":\"2008-10-7\"}',1),('b8584550-d91b-4938-881b-b90d4f5ded33','99138.93682916787','562e46ad-f785-402e-88c7-01b976758815','outdent','2008-10-07 16:01:54','{taskid:\"562e46ad-f785-402e-88c7-01b976758815\",taskname:\"cabosoft.com svn checkin\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"\",resourcename:\"madrid\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','91b02e83-6a5e-4eed-834a-92c8f35db693','insert','2008-10-07 16:59:17','{\"percentcomplete\":\"0\",\"taskid\":\"91b02e83-6a5e-4eed-834a-92c8f35db693\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Logo y Nombre\",\"enddate\":\"2008-10-7\"}',0),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','7b029c39-6442-47bb-9b8e-2e90144384d3','insert','2008-10-07 17:00:09','{\"percentcomplete\":\"0\",\"taskid\":\"7b029c39-6442-47bb-9b8e-2e90144384d3\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Mision, Vision y Filosofia\",\"enddate\":\"2008-10-7\"}',1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','insert','2008-10-07 17:01:02','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2008-10-7\"}',2),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','insert','2008-10-07 17:01:14','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-10-7\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3911567e-00ce-49c6-9d32-f542f2de73dd','newtask','2008-10-07 17:01:39','{\"percentcomplete\":\"0\",\"taskid\":\"3911567e-00ce-49c6-9d32-f542f2de73dd\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3911567e-00ce-49c6-9d32-f542f2de73dd','update','2008-10-07 17:03:41','{\"percentcomplete\":\"0\",\"taskid\":\"3911567e-00ce-49c6-9d32-f542f2de73dd\",\"resourcename\":\"\",\"actualduration\":\"30\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":30,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Business Plan\",\"enddate\":\"2008-11-17\"}',1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3911567e-00ce-49c6-9d32-f542f2de73dd','predecessor','2008-10-07 17:03:41','{taskid:\"3911567e-00ce-49c6-9d32-f542f2de73dd\",taskname:\"Business Plan\",duration:30,startdate:\"2008-10-7\",enddate:\"2008-11-17\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"30\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','7b029c39-6442-47bb-9b8e-2e90144384d3','predecessor','2008-10-07 17:03:44','{taskid:\"7b029c39-6442-47bb-9b8e-2e90144384d3\",taskname:\"Mision, Vision y Filosofia\",duration:30,startdate:\"2008-10-7\",enddate:\"2008-11-17\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"30\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','predecessor','2008-10-07 17:03:52','{taskid:\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",taskname:\"Plan de Ventas y RP\",duration:30,startdate:\"2008-10-7\",enddate:\"2008-11-17\",predecessor:\"3\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"30\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','predecessor','2008-10-07 17:04:34','{taskid:\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",taskname:\"Plan de Ventas y RP\",duration:15,startdate:\"2009-01-20\",enddate:\"2009-02-9\",predecessor:\"3,5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"15\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:07','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-10-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-11-17\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:09','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-10-28\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-28\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-11-17\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:15','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-10\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:16','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-10\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:21','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-10\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:26','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-20\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-20\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-10\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:31','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-12-11\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-11\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-31\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','update','2008-10-07 17:05:32','{\"percentcomplete\":\"0\",\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-12-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2009-01-2\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','93e74d95-33d2-4540-9de6-2cafb8c89f12','deleteTask','2008-10-07 17:06:07','{\"taskid\":\"93e74d95-33d2-4540-9de6-2cafb8c89f12\"}',-1),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:06:45','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2009-01-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2009-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-02-4\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:06:49','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2009-01-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2009-01-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-02-4\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:06:52','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2009-01-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2009-01-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-01-27\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:06:54','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2008-12-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-01-6\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:06:58','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2008-12-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-01-6\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:07:03','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2008-12-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-01-6\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:07:07','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2008-12-12\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-12\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2009-01-1\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca','update','2008-10-07 17:07:08','{\"percentcomplete\":\"0\",\"taskid\":\"3dda0408-e7d0-4a68-b6e2-9002d2f3c7ca\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":15,\"startdate\":\"2008-12-9\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2008-12-29\"}',3),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','0dc8314f-a723-4297-a7d9-df5e3342ebd3','insert','2008-10-07 17:07:16','{\"percentcomplete\":\"0\",\"taskid\":\"0dc8314f-a723-4297-a7d9-df5e3342ebd3\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-10-7\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','0dc8314f-a723-4297-a7d9-df5e3342ebd3','update','2008-10-07 17:07:40','{\"percentcomplete\":\"0\",\"taskid\":\"0dc8314f-a723-4297-a7d9-df5e3342ebd3\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-11-24\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','0dc8314f-a723-4297-a7d9-df5e3342ebd3','update','2008-10-07 17:07:45','{\"percentcomplete\":\"0\",\"taskid\":\"0dc8314f-a723-4297-a7d9-df5e3342ebd3\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-11-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-11-24\"}',4),('087fc728-db06-4139-a478-8721bbd70f68','34459.003700297544','0dc8314f-a723-4297-a7d9-df5e3342ebd3','predecessor','2008-10-07 17:07:56','{taskid:\"0dc8314f-a723-4297-a7d9-df5e3342ebd3\",taskname:\"Incubadora de Empresas\",duration:15,startdate:\"2008-11-4\",enddate:\"2008-11-24\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-11-4\",actualduration:\"15\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('68afdd4d-13a2-44cc-8228-6352153cb31d','59389.846608596854','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','update','2008-10-07 23:32:52','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"Anand\",\"actualduration\":\"6.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"1,25\",\"duration\":6.5,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-10-15\"}',8),('68afdd4d-13a2-44cc-8228-6352153cb31d','59389.846608596854','728daaa3-6876-4bee-b3e9-cddaf6ebbf36','predecessor','2008-10-07 23:33:00','{taskid:\"728daaa3-6876-4bee-b3e9-cddaf6ebbf36\",taskname:\"K\",duration:4,startdate:\"2008-10-21\",enddate:\"2008-10-24\",predecessor:\"4,9\",resourcename:\"anup\",parent:0,level:0,percentcomplete:\"25\",actstartdate:\"2008-10-8\",actualduration:\"4\",ismilestone:\"false\",priority:\"2\",notes:\"\",isparent:\"false\"}',11),('68afdd4d-13a2-44cc-8228-6352153cb31d','59389.846608596854','48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6','update','2008-10-07 23:33:06','{\"percentcomplete\":\"0\",\"taskid\":\"48fa5a57-5e6d-45b1-a9c9-2fdc37419ba6\",\"resourcename\":\"Anand\",\"actualduration\":\"6.5\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"1,25\",\"duration\":6.5,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"H\",\"enddate\":\"2008-10-15\"}',8),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','507ecc9f-9483-4d90-9589-0e46ee02ba55','deleteTask','2008-10-08 05:19:32','{\"taskid\":\"507ecc9f-9483-4d90-9589-0e46ee02ba55\"}',-1),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','562e46ad-f785-402e-88c7-01b976758815','deleteTask','2008-10-08 05:19:36','{\"taskid\":\"562e46ad-f785-402e-88c7-01b976758815\"}',-1),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','27ba2d30-2c15-4e67-a19e-fe0ece0bc05f','insert','2008-10-08 05:38:34','{\"percentcomplete\":\"0\",\"taskid\":\"27ba2d30-2c15-4e67-a19e-fe0ece0bc05f\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Madrid\'s Tasks\",\"enddate\":\"2008-10-7\"}',0),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','cffb9d83-1b32-494b-93d5-b757ab1dab31','insert','2008-10-08 05:39:03','{\"percentcomplete\":\"0\",\"taskid\":\"cffb9d83-1b32-494b-93d5-b757ab1dab31\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-7\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-7\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"cabosoft.com Services page\",\"enddate\":\"2008-10-7\"}',1),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','cffb9d83-1b32-494b-93d5-b757ab1dab31','indent','2008-10-08 05:39:18','{taskid:\"cffb9d83-1b32-494b-93d5-b757ab1dab31\",taskname:\"cabosoft.com Services page\",duration:1,startdate:\"2008-10-7\",enddate:\"2008-10-7\",predecessor:\"\",resourcename:\"madrid\",parent:27ba2d30-2c15-4e67-a19e-fe0ece0bc05f,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-7\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','cffb9d83-1b32-494b-93d5-b757ab1dab31','deleteTask','2008-10-08 05:39:26','{\"taskid\":\"cffb9d83-1b32-494b-93d5-b757ab1dab31\"}',-1),('b8584550-d91b-4938-881b-b90d4f5ded33','38892.65733677358','27ba2d30-2c15-4e67-a19e-fe0ece0bc05f','deleteTask','2008-10-08 05:39:30','{\"taskid\":\"27ba2d30-2c15-4e67-a19e-fe0ece0bc05f\"}',-1),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','3878eb08-0f6d-488b-a817-995bd14bf2bd','insert','2008-10-08 16:24:50','{\"percentcomplete\":\"0\",\"taskid\":\"3878eb08-0f6d-488b-a817-995bd14bf2bd\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Mision - Vision - Filosofia\",\"enddate\":\"2008-10-8\"}',0),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','4fbab37d-8b96-47e0-a284-270476914783','insert','2008-10-08 16:25:59','{\"percentcomplete\":\"0\",\"taskid\":\"4fbab37d-8b96-47e0-a284-270476914783\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Logotipo y Nombre\",\"enddate\":\"2008-10-8\"}',1),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','4fbab37d-8b96-47e0-a284-270476914783','predecessor','2008-10-08 16:26:12','{taskid:\"4fbab37d-8b96-47e0-a284-270476914783\",taskname:\"Logotipo y Nombre\",duration:10,startdate:\"2008-10-8\",enddate:\"2008-10-21\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1c6e7a07-7c22-4617-af92-aedc9d022a68','insert','2008-10-08 16:27:09','{\"percentcomplete\":\"0\",\"taskid\":\"1c6e7a07-7c22-4617-af92-aedc9d022a68\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Contactos MTY\",\"enddate\":\"2008-10-8\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1c6e7a07-7c22-4617-af92-aedc9d022a68','predecessor','2008-10-08 16:27:19','{taskid:\"1c6e7a07-7c22-4617-af92-aedc9d022a68\",taskname:\"Contactos MTY\",duration:10,startdate:\"2008-10-8\",enddate:\"2008-10-21\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1990d9da-7d8f-4aae-a5c2-c64c8dae4a15','insert','2008-10-08 16:27:50','{\"percentcomplete\":\"0\",\"taskid\":\"1990d9da-7d8f-4aae-a5c2-c64c8dae4a15\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2008-10-8\"}',3),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1990d9da-7d8f-4aae-a5c2-c64c8dae4a15','predecessor','2008-10-08 16:28:14','{taskid:\"1990d9da-7d8f-4aae-a5c2-c64c8dae4a15\",taskname:\"Plan de Ventas y RP\",duration:10,startdate:\"2008-10-8\",enddate:\"2008-10-21\",predecessor:\"3\",resourcename:\"carlos\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','4fbab37d-8b96-47e0-a284-270476914783','indent','2008-10-08 16:28:33','{taskid:\"4fbab37d-8b96-47e0-a284-270476914783\",taskname:\"Logotipo y Nombre\",duration:10,startdate:\"2008-10-30\",enddate:\"2008-11-12\",predecessor:\"\",resourcename:\"brenda,carlos\",parent:3878eb08-0f6d-488b-a817-995bd14bf2bd,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','c7feb15c-7879-4d27-8db9-69cc5e02a6ea','newtask','2008-10-08 16:29:17','{\"percentcomplete\":\"0\",\"taskid\":\"c7feb15c-7879-4d27-8db9-69cc5e02a6ea\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','c7feb15c-7879-4d27-8db9-69cc5e02a6ea','update','2008-10-08 16:29:43','{\"percentcomplete\":\"0\",\"taskid\":\"c7feb15c-7879-4d27-8db9-69cc5e02a6ea\",\"resourcename\":\"\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":15,\"startdate\":\"2008-10-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-29\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Pre Business Plan\",\"enddate\":\"2008-11-18\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','c7feb15c-7879-4d27-8db9-69cc5e02a6ea','predecessor','2008-10-08 16:29:45','{taskid:\"c7feb15c-7879-4d27-8db9-69cc5e02a6ea\",taskname:\"Pre Business Plan\",duration:15,startdate:\"2008-10-29\",enddate:\"2008-11-18\",predecessor:\"2\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-29\",actualduration:\"15\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1c6e7a07-7c22-4617-af92-aedc9d022a68','predecessor','2008-10-08 16:29:50','{taskid:\"1c6e7a07-7c22-4617-af92-aedc9d022a68\",taskname:\"Contactos MTY\",duration:10,startdate:\"2008-11-13\",enddate:\"2008-11-26\",predecessor:\"2,3\",resourcename:\"carlos\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','1c6e7a07-7c22-4617-af92-aedc9d022a68','predecessor','2008-10-08 16:30:14','{taskid:\"1c6e7a07-7c22-4617-af92-aedc9d022a68\",taskname:\"Contactos MTY\",duration:10,startdate:\"2008-12-4\",enddate:\"2008-12-17\",predecessor:\"3\",resourcename:\"carlos\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','295029b2-65d8-477b-bb94-225a1c800db1','insert','2008-10-08 16:30:38','{\"percentcomplete\":\"0\",\"taskid\":\"295029b2-65d8-477b-bb94-225a1c800db1\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-10-8\"}',5),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','14661.672855705776','295029b2-65d8-477b-bb94-225a1c800db1','predecessor','2008-10-08 16:30:45','{taskid:\"295029b2-65d8-477b-bb94-225a1c800db1\",taskname:\"Incubadora de Empresas\",duration:10,startdate:\"2008-10-8\",enddate:\"2008-10-21\",predecessor:\"5\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"10\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',5),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','4fbab37d-8b96-47e0-a284-270476914783','update','2008-10-08 19:29:47','{\"percentcomplete\":\"0\",\"taskid\":\"4fbab37d-8b96-47e0-a284-270476914783\",\"resourcename\":\"brenda,carlos\",\"actualduration\":\"10\",\"parent\":\"3878eb08-0f6d-488b-a817-995bd14bf2bd\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":10,\"startdate\":\"2008-10-9\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-9\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Logotipo y Nombre\",\"enddate\":\"2008-10-20\"}',1),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','c7feb15c-7879-4d27-8db9-69cc5e02a6ea','update','2008-10-08 19:29:53','{\"percentcomplete\":\"0\",\"taskid\":\"c7feb15c-7879-4d27-8db9-69cc5e02a6ea\",\"resourcename\":\"carlos\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"2\",\"duration\":15,\"startdate\":\"2008-11-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Pre Business Plan\",\"enddate\":\"2008-11-29\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','c7feb15c-7879-4d27-8db9-69cc5e02a6ea','update','2008-10-08 19:30:00','{\"percentcomplete\":\"0\",\"taskid\":\"c7feb15c-7879-4d27-8db9-69cc5e02a6ea\",\"resourcename\":\"carlos\",\"actualduration\":\"15\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"2\",\"duration\":15,\"startdate\":\"2008-10-22\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-22\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Pre Business Plan\",\"enddate\":\"2008-11-7\"}',2),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','1c6e7a07-7c22-4617-af92-aedc9d022a68','update','2008-10-08 19:30:14','{\"percentcomplete\":\"0\",\"taskid\":\"1c6e7a07-7c22-4617-af92-aedc9d022a68\",\"resourcename\":\"carlos\",\"actualduration\":\"10\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"3\",\"duration\":10,\"startdate\":\"2008-12-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Contactos MTY\",\"enddate\":\"2008-12-15\"}',3),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','1990d9da-7d8f-4aae-a5c2-c64c8dae4a15','update','2008-10-08 19:30:23','{\"percentcomplete\":\"0\",\"taskid\":\"1990d9da-7d8f-4aae-a5c2-c64c8dae4a15\",\"resourcename\":\"carlos\",\"actualduration\":\"10\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"4\",\"duration\":10,\"startdate\":\"2008-11-21\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-11-21\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Plan de Ventas y RP\",\"enddate\":\"2008-12-2\"}',4),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','295029b2-65d8-477b-bb94-225a1c800db1','update','2008-10-08 19:30:35','{\"percentcomplete\":\"0\",\"taskid\":\"295029b2-65d8-477b-bb94-225a1c800db1\",\"resourcename\":\"carlos\",\"actualduration\":\"10\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"5\",\"duration\":10,\"startdate\":\"2008-12-3\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-3\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-13\"}',5),('1d26961b-dd0d-43b2-b347-e45d9e19f2f4','41503.17134901158','295029b2-65d8-477b-bb94-225a1c800db1','update','2008-10-08 19:30:39','{\"percentcomplete\":\"0\",\"taskid\":\"295029b2-65d8-477b-bb94-225a1c800db1\",\"resourcename\":\"carlos\",\"actualduration\":\"10\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"5\",\"duration\":10,\"startdate\":\"2008-12-4\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-12-4\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Incubadora de Empresas\",\"enddate\":\"2008-12-15\"}',5),('51021923-5986-4256-bb46-9c7dbb69faf3','13636.627048254013','fdddd448-a515-4446-880e-1c4dbe5c0d13','template','2008-10-09 00:57:22','[{\"percentcomplete\":\"0\",\"taskid\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"resourcename\":\"\",\"actualduration\":\"101.0d\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":101,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Change Management \",\"enddate\":\"2009-02-23\"},{\"percentcomplete\":\"0\",\"taskid\":\"cf00bb27-4aff-4b02-95b7-1bfb0940932b\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"2.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Conduct Change Management Plan Workshop\",\"enddate\":\"2008-10-9\"},{\"percentcomplete\":\"0\",\"taskid\":\"389faba9-f8b8-477f-91d3-f3f97e3f5581\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"5.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-10-10\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-10\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop Change Management Plan\",\"enddate\":\"2008-10-16\"},{\"percentcomplete\":\"0\",\"taskid\":\"b482b1f9-a668-4a59-bb64-68c2bff67350\",\"resourcename\":\"613526e0-e9de-4cdd-9319-8c018d9bb2d7\",\"actualduration\":\"94.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":94,\"startdate\":\"2008-10-17\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Deploy Change Management Activities as per plan\",\"enddate\":\"2009-02-23\"},{\"percentcomplete\":\"0\",\"taskid\":\"17d735c5-5585-4dd0-9396-5a3f50dfb774\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"2.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Conduct Change Management Plan Workshop\",\"enddate\":\"2008-10-9\"},{\"percentcomplete\":\"0\",\"taskid\":\"b14f78dc-2be5-4cf8-8a5a-d5dfef30bfd8\",\"resourcename\":\"c3713345-b9df-45ea-a97d-d16274541d35\",\"actualduration\":\"5.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5,\"startdate\":\"2008-10-10\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-10\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop Change Management Plan\",\"enddate\":\"2008-10-16\"},{\"percentcomplete\":\"0\",\"taskid\":\"fdddd448-a515-4446-880e-1c4dbe5c0d13\",\"resourcename\":\"613526e0-e9de-4cdd-9319-8c018d9bb2d7\",\"actualduration\":\"94.0d\",\"parent\":\"dba129e5-9e2e-4c54-89d5-4aace30ebd0a\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":94,\"startdate\":\"2008-10-17\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-17\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Deploy Change Management Activities as per plan\",\"enddate\":\"2009-02-23\"}]',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','47cfd87b-ff29-474f-ba72-8241177b60a0','insert','2008-10-09 04:09:51','{\"percentcomplete\":\"0\",\"taskid\":\"47cfd87b-ff29-474f-ba72-8241177b60a0\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Receive ProSAFE Sources\",\"enddate\":\"2008-10-8\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','b82aefb8-966f-463e-9d1a-e5367c337419','insert','2008-10-09 04:10:16','{\"percentcomplete\":\"0\",\"taskid\":\"b82aefb8-966f-463e-9d1a-e5367c337419\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review \",\"enddate\":\"2008-10-8\"}',1),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','b82aefb8-966f-463e-9d1a-e5367c337419','update','2008-10-09 04:10:26','{\"percentcomplete\":\"0\",\"taskid\":\"b82aefb8-966f-463e-9d1a-e5367c337419\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Review Application and Source\",\"enddate\":\"2008-10-8\"}',1),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','b82aefb8-966f-463e-9d1a-e5367c337419','predecessor','2008-10-09 04:10:31','{taskid:\"b82aefb8-966f-463e-9d1a-e5367c337419\",taskname:\"Review Application and Source\",duration:1,startdate:\"2008-10-8\",enddate:\"2008-10-8\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','64a586e3-1dcc-4bbd-9650-5ed5586543c6','insert','2008-10-09 04:11:29','{\"percentcomplete\":\"0\",\"taskid\":\"64a586e3-1dcc-4bbd-9650-5ed5586543c6\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-8\"}',2),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','64a586e3-1dcc-4bbd-9650-5ed5586543c6','deleteTask','2008-10-09 04:12:05','{\"taskid\":\"64a586e3-1dcc-4bbd-9650-5ed5586543c6\"}',-1),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','0965b898-698d-4cff-be44-0f48a5fd8763','paste','2008-10-09 04:12:11','[{\"percentcomplete\":\"0\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-8\"}]',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','47cfd87b-ff29-474f-ba72-8241177b60a0','indent','2008-10-09 04:12:29','{taskid:\"47cfd87b-ff29-474f-ba72-8241177b60a0\",taskname:\"Receive ProSAFE Sources\",duration:1,startdate:\"2008-10-8\",enddate:\"2008-10-8\",predecessor:\"\",resourcename:\"madrid\",parent:0965b898-698d-4cff-be44-0f48a5fd8763,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','b82aefb8-966f-463e-9d1a-e5367c337419','indent','2008-10-09 04:12:34','{taskid:\"b82aefb8-966f-463e-9d1a-e5367c337419\",taskname:\"Review Application and Source\",duration:1,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"2\",resourcename:\"madrid,jimb,bradc\",parent:0965b898-698d-4cff-be44-0f48a5fd8763,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-09 04:16:59','{\"percentcomplete\":\"50\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','54aac8b4-8344-46e4-afcd-5a10791383fd','newtask','2008-10-09 04:17:15','{\"percentcomplete\":\"0\",\"taskid\":\"54aac8b4-8344-46e4-afcd-5a10791383fd\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',2),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','54aac8b4-8344-46e4-afcd-5a10791383fd','predecessor','2008-10-09 04:18:16','{taskid:\"54aac8b4-8344-46e4-afcd-5a10791383fd\",taskname:\"Install sources and applcaton for review\",duration:0.50,startdate:\"2008-10-8\",enddate:\"2008-10-8\",predecessor:\"2\",resourcename:\"\",parent:0965b898-698d-4cff-be44-0f48a5fd8763,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"0.50\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','33079.64645382121','b82aefb8-966f-463e-9d1a-e5367c337419','predecessor','2008-10-09 04:18:38','{taskid:\"b82aefb8-966f-463e-9d1a-e5367c337419\",taskname:\"Review Application and Source\",duration:0.50,startdate:\"2008-10-9\",enddate:\"2008-10-9\",predecessor:\"3\",resourcename:\"madrid,jimb,bradc\",parent:0965b898-698d-4cff-be44-0f48a5fd8763,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-8\",actualduration:\"0.50\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','53075.27647530899','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-09 04:40:12','{\"percentcomplete\":\"0\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','77755.664888012','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-09 15:23:30','{\"percentcomplete\":\"100\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','77755.664888012','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-09 15:24:15','{\"percentcomplete\":\"100\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','77755.664888012','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-09 15:24:23','{\"percentcomplete\":\"100\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('1ab9c787-fcde-42ec-b5e8-cd0f455f8d30','18253.046879544854','b912341e-937f-4bc5-abc3-d3a32603cfda','update','2008-10-10 07:08:09','{\"percentcomplete\":\"0\",\"taskid\":\"b912341e-937f-4bc5-abc3-d3a32603cfda\",\"resourcename\":\"\",\"actualduration\":\"7\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":7,\"startdate\":\"2007-02-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2007-02-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2007-02-16\"}',5),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:53:12','{\"percentcomplete\":\"9\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-3\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:53:19','{\"percentcomplete\":\"9\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-3\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:53:27','{\"percentcomplete\":\"9\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-3\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','7e8a8d78-d213-417f-b6f5-8153850a2a67','insert','2008-10-10 13:53:37','{\"percentcomplete\":\"0\",\"taskid\":\"7e8a8d78-d213-417f-b6f5-8153850a2a67\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-09-29\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-09-27\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-09-30\"}',25),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:56:00','{\"percentcomplete\":\"8\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":14,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-6\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:56:01','{\"percentcomplete\":\"7\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"16\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":16,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-8\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:56:03','{\"percentcomplete\":\"5\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"21\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":21,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-15\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','c262229a-ae59-43a3-b6e3-8968993b960f','insert','2008-10-10 13:56:19','{\"percentcomplete\":\"0\",\"taskid\":\"c262229a-ae59-43a3-b6e3-8968993b960f\",\"resourcename\":\"\",\"actualduration\":\"2\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-15\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-15\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-10-16\"}',26),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:56:21','{\"percentcomplete\":\"6\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"18\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":18,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-10\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','2841.2988165819274','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-10 13:56:25','{\"percentcomplete\":\"9\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-09-16\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-16\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-3\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-10 20:16:58','{\"percentcomplete\":\"100\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-10 20:17:07','{\"percentcomplete\":\"100\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":2,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-9\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','77449a47-64c6-4dbc-baf9-e831d93ed367','insert','2008-10-10 20:18:00','{\"percentcomplete\":\"0\",\"taskid\":\"77449a47-64c6-4dbc-baf9-e831d93ed367\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-10\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-10\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Requirements Call\",\"enddate\":\"2008-10-10\"}',4),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','77449a47-64c6-4dbc-baf9-e831d93ed367','predecessor','2008-10-10 20:18:19','{taskid:\"77449a47-64c6-4dbc-baf9-e831d93ed367\",taskname:\"Project Requirements Call\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"4\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','77449a47-64c6-4dbc-baf9-e831d93ed367','indent','2008-10-10 20:18:25','{taskid:\"77449a47-64c6-4dbc-baf9-e831d93ed367\",taskname:\"Project Requirements Call\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"4\",resourcename:\"\",parent:0965b898-698d-4cff-be44-0f48a5fd8763,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','95639.22268361069','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-10 20:19:36','{\"percentcomplete\":\"50\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-13\"}',0),('0f9d4b99-5d79-478e-b167-bcef3a8ec842','37979.470674098535','0965b898-698d-4cff-be44-0f48a5fd8763','update','2008-10-10 20:36:26','{\"percentcomplete\":\"50\",\"taskid\":\"0965b898-698d-4cff-be44-0f48a5fd8763\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-10-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Project Initiation\",\"enddate\":\"2008-10-13\"}',0),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','c715d6db-8c27-4c07-ae19-41f8b19b7ecb','newtask','2008-10-11 10:25:54','{\"percentcomplete\":\"0\",\"taskid\":\"c715d6db-8c27-4c07-ae19-41f8b19b7ecb\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',0),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','2033f7f2-60ec-4046-817f-3a24deadd5ac','insert','2008-10-11 10:27:01','{\"percentcomplete\":\"0\",\"taskid\":\"2033f7f2-60ec-4046-817f-3a24deadd5ac\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Develop\",\"enddate\":\"2008-10-13\"}',1),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','e7ff0cbc-602d-47ef-a258-a2d1b3c56a63','insert','2008-10-11 10:27:20','{\"percentcomplete\":\"0\",\"taskid\":\"e7ff0cbc-602d-47ef-a258-a2d1b3c56a63\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Build\",\"enddate\":\"2008-10-13\"}',2),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','d3f3ac09-43cb-4d9c-a722-6583ff51deed','insert','2008-10-11 10:27:24','{\"percentcomplete\":\"0\",\"taskid\":\"d3f3ac09-43cb-4d9c-a722-6583ff51deed\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Deploy\",\"enddate\":\"2008-10-13\"}',3),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','f86779ac-8bfe-4214-8a18-00012595c953','insert','2008-10-11 10:27:53','{\"percentcomplete\":\"0\",\"taskid\":\"f86779ac-8bfe-4214-8a18-00012595c953\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define Scope\",\"enddate\":\"2008-10-13\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','f86779ac-8bfe-4214-8a18-00012595c953','indent','2008-10-11 10:28:09','{taskid:\"f86779ac-8bfe-4214-8a18-00012595c953\",taskname:\"Define Scope\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:d3f3ac09-43cb-4d9c-a722-6583ff51deed,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','529dd2d5-2f30-497b-8f83-53408337dba4','paste','2008-10-11 10:29:24','[{\"percentcomplete\":\"0\",\"taskid\":\"529dd2d5-2f30-497b-8f83-53408337dba4\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define Scope\",\"enddate\":\"2008-10-13\"}]',1),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','529dd2d5-2f30-497b-8f83-53408337dba4','indent','2008-10-11 10:29:31','{taskid:\"529dd2d5-2f30-497b-8f83-53408337dba4\",taskname:\"Define Scope\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:c715d6db-8c27-4c07-ae19-41f8b19b7ecb,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','f86779ac-8bfe-4214-8a18-00012595c953','deleteTask','2008-10-11 10:29:37','{\"taskid\":\"f86779ac-8bfe-4214-8a18-00012595c953\"}',-1),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','2146e7cf-d2ba-4600-8027-67e46921a774','newtask','2008-10-11 10:29:45','{\"percentcomplete\":\"0\",\"taskid\":\"2146e7cf-d2ba-4600-8027-67e46921a774\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',2),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','2146e7cf-d2ba-4600-8027-67e46921a774','indent','2008-10-11 10:30:31','{taskid:\"2146e7cf-d2ba-4600-8027-67e46921a774\",taskname:\"Define Team\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:c715d6db-8c27-4c07-ae19-41f8b19b7ecb,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',2),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b48212ef-a216-4551-8623-3a70f0b59bb7','newtask','2008-10-11 10:30:33','{\"percentcomplete\":\"0\",\"taskid\":\"b48212ef-a216-4551-8623-3a70f0b59bb7\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',3),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b5729ce1-90a3-4bc8-837d-61502808e985','newtask','2008-10-11 10:31:10','{\"percentcomplete\":\"0\",\"taskid\":\"b5729ce1-90a3-4bc8-837d-61502808e985\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b48212ef-a216-4551-8623-3a70f0b59bb7','indent','2008-10-11 10:31:46','{taskid:\"b48212ef-a216-4551-8623-3a70f0b59bb7\",taskname:\"IT Roles\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:c715d6db-8c27-4c07-ae19-41f8b19b7ecb,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b48212ef-a216-4551-8623-3a70f0b59bb7','indent','2008-10-11 10:31:47','{taskid:\"b48212ef-a216-4551-8623-3a70f0b59bb7\",taskname:\"IT Roles\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:2146e7cf-d2ba-4600-8027-67e46921a774,level:2,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',3),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b5729ce1-90a3-4bc8-837d-61502808e985','indent','2008-10-11 10:31:49','{taskid:\"b5729ce1-90a3-4bc8-837d-61502808e985\",taskname:\"Partner Roles\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:c715d6db-8c27-4c07-ae19-41f8b19b7ecb,level:1,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','b5729ce1-90a3-4bc8-837d-61502808e985','indent','2008-10-11 10:31:50','{taskid:\"b5729ce1-90a3-4bc8-837d-61502808e985\",taskname:\"Partner Roles\",duration:1,startdate:\"2008-10-13\",enddate:\"2008-10-13\",predecessor:\"\",resourcename:\"\",parent:2146e7cf-d2ba-4600-8027-67e46921a774,level:2,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"1\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','2146e7cf-d2ba-4600-8027-67e46921a774','update','2008-10-11 10:31:54','{\"percentcomplete\":\"0\",\"taskid\":\"2146e7cf-d2ba-4600-8027-67e46921a774\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":\"c715d6db-8c27-4c07-ae19-41f8b19b7ecb\",\"isparent\":\"true\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define Team\",\"enddate\":\"2008-10-13\"}',2),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','5e513c63-5b83-4fe6-8596-23c3f90230ac','newtask','2008-10-11 10:31:59','{\"percentcomplete\":\"0\",\"taskid\":\"5e513c63-5b83-4fe6-8596-23c3f90230ac\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":\"2146e7cf-d2ba-4600-8027-67e46921a774\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":2,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',4),('80a2a999-ed44-4e0f-8a35-706eede64577','19357.36336759576','ca86e132-6eb0-4aa6-9562-3fe4bb29b378','newtask','2008-10-11 10:32:26','{\"percentcomplete\":\"0\",\"taskid\":\"ca86e132-6eb0-4aa6-9562-3fe4bb29b378\",\"resourcename\":\"\",\"actualduration\":\"\",\"parent\":\"c715d6db-8c27-4c07-ae19-41f8b19b7ecb\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":\"\",\"startdate\":\"\",\"level\":1,\"priority\":\"1\",\"actstartdate\":\"\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"\"}',1),('4d7bb4d7-073f-407a-9832-4b0619cd613e','89723.7566799668','b5ad200d-76df-49ee-ad22-646994e20f56','update','2008-10-11 18:19:13','{\"percentcomplete\":\"0\",\"taskid\":\"b5ad200d-76df-49ee-ad22-646994e20f56\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":\"6831ae10-65df-4926-95c9-269dc8c5811b\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-01-1\",\"level\":3,\"priority\":\"1\",\"actstartdate\":\"2008-01-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define project charter\",\"enddate\":\"2008-01-4\"}',3),('4d7bb4d7-073f-407a-9832-4b0619cd613e','89723.7566799668','b5ad200d-76df-49ee-ad22-646994e20f56','update','2008-10-11 18:19:16','{\"percentcomplete\":\"0\",\"taskid\":\"b5ad200d-76df-49ee-ad22-646994e20f56\",\"resourcename\":\"\",\"actualduration\":\"5.5\",\"parent\":\"6831ae10-65df-4926-95c9-269dc8c5811b\",\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":5.5,\"startdate\":\"2008-01-1\",\"level\":3,\"priority\":\"1\",\"actstartdate\":\"2008-01-1\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"Define project charter\",\"enddate\":\"2008-01-8\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','85195.80541031397','b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2','update','2008-10-12 05:24:56','{\"percentcomplete\":\"9\",\"taskid\":\"b1a82ab8-ddd9-4812-9f9b-7b1ad3e30db2\",\"resourcename\":\"anup\",\"actualduration\":\"13\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":13,\"startdate\":\"2008-09-26\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-26\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"A\",\"enddate\":\"2008-10-14\"}',0),('68afdd4d-13a2-44cc-8228-6352153cb31d','85195.80541031397','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-10-12 05:25:02','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Harry,Salini\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"25\",\"duration\":14,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-17\"}',3),('68afdd4d-13a2-44cc-8228-6352153cb31d','85195.80541031397','4565e0f5-16c2-48d8-97f8-010d79fb5403','predecessor','2008-10-12 05:25:14','{taskid:\"4565e0f5-16c2-48d8-97f8-010d79fb5403\",taskname:\"\",duration:2,startdate:\"2008-09-22\",enddate:\"2008-09-23\",predecessor:\"19\",resourcename:\"Salini\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-1\",actualduration:\"2\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',19),('68afdd4d-13a2-44cc-8228-6352153cb31d','85195.80541031397','6db16a89-b4f8-4c6e-826c-a13f9d2f20a1','predecessor','2008-10-12 05:25:17','{taskid:\"6db16a89-b4f8-4c6e-826c-a13f9d2f20a1\",taskname:\"\",duration:5,startdate:\"2008-10-13\",enddate:\"2008-10-17\",predecessor:\"20\",resourcename:\"Harry,Salini\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"5\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',22),('4d7bb4d7-073f-407a-9832-4b0619cd613e','97668.10530537278','f36a8bf8-21d6-4c79-a3c9-816905b104d6','insert','2008-10-12 19:45:31','{\"percentcomplete\":\"0\",\"taskid\":\"f36a8bf8-21d6-4c79-a3c9-816905b104d6\",\"resourcename\":\"\",\"actualduration\":\"4\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":4,\"startdate\":\"2008-01-8\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-01-8\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"\",\"enddate\":\"2008-01-11\"}',231),('88463095-833c-41ee-9f4f-a93446d05d98','10401.964008490339','3edd0328-34d9-4be9-9f5d-503f68b4c534','insert','2008-10-13 03:57:09','{\"percentcomplete\":\"0\",\"taskid\":\"3edd0328-34d9-4be9-9f5d-503f68b4c534\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"abastur 2007\",\"enddate\":\"2008-10-13\"}',0),('88463095-833c-41ee-9f4f-a93446d05d98','10401.964008490339','66b96061-ecc3-4f89-8f7e-6882d1b49df8','insert','2008-10-13 03:57:17','{\"percentcomplete\":\"0\",\"taskid\":\"66b96061-ecc3-4f89-8f7e-6882d1b49df8\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"abastur 2008\",\"enddate\":\"2008-10-13\"}',1),('88463095-833c-41ee-9f4f-a93446d05d98','10401.964008490339','66b96061-ecc3-4f89-8f7e-6882d1b49df8','predecessor','2008-10-13 03:57:34','{taskid:\"66b96061-ecc3-4f89-8f7e-6882d1b49df8\",taskname:\"abastur 2008\",duration:15,startdate:\"2008-10-13\",enddate:\"2008-10-31\",predecessor:\"1\",resourcename:\"\",parent:0,level:0,percentcomplete:\"0\",actstartdate:\"2008-10-13\",actualduration:\"15\",ismilestone:\"false\",priority:\"1\",notes:\"\",isparent:\"false\"}',1),('88463095-833c-41ee-9f4f-a93446d05d98','10401.964008490339','d7c99033-d782-4994-9bba-b8f707037ed6','insert','2008-10-13 04:01:05','{\"percentcomplete\":\"0\",\"taskid\":\"d7c99033-d782-4994-9bba-b8f707037ed6\",\"resourcename\":\"\",\"actualduration\":\"1\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"\",\"duration\":1,\"startdate\":\"2008-10-13\",\"level\":0,\"priority\":\"1\",\"actstartdate\":\"2008-10-13\",\"ismilestone\":\"false\",\"notes\":\"\",\"taskname\":\"revisar revista\",\"enddate\":\"2008-10-13\"}',2),('68afdd4d-13a2-44cc-8228-6352153cb31d','86246.44824303687','8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2','update','2008-10-13 04:07:03','{\"percentcomplete\":\"0\",\"taskid\":\"8f04d0d9-c8f4-48e9-bec9-b32ee3a0caf2\",\"resourcename\":\"Harry,Salini\",\"actualduration\":\"14\",\"parent\":0,\"isparent\":\"false\",\"predecessor\":\"25\",\"duration\":14,\"startdate\":\"2008-09-30\",\"level\":0,\"priority\":\"0\",\"actstartdate\":\"2008-09-30\",\"ismilestone\":\"false\",\"notes\":\"&nbsp;dxx\",\"taskname\":\"C\",\"enddate\":\"2008-10-17\"}',3);
/*!40000 ALTER TABLE `proj_buffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_companyschedule`
--

DROP TABLE IF EXISTS `proj_companyschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_companyschedule` (
  `workinghour` int(2) NOT NULL default '8',
  `companyid` varchar(36) default NULL,
  KEY `companyid` (`companyid`),
  CONSTRAINT `proj_companyschedule_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_companyschedule`
--

LOCK TABLES `proj_companyschedule` WRITE;
/*!40000 ALTER TABLE `proj_companyschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_companyschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_resourcecategory`
--

DROP TABLE IF EXISTS `proj_resourcecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_resourcecategory` (
  `categoryid` int(11) NOT NULL auto_increment,
  `categoryname` text NOT NULL,
  PRIMARY KEY  (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='Project Resource Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_resourcecategory`
--

LOCK TABLES `proj_resourcecategory` WRITE;
/*!40000 ALTER TABLE `proj_resourcecategory` DISABLE KEYS */;
INSERT INTO `proj_resourcecategory` VALUES (1,'Member'),(2,'Hardware'),(3,'Board Member'),(4,'Developer'),(5,'Webmaster'),(6,'Subcontractor'),(7,'Expert Team Member'),(8,'Senior Manager'),(9,'Design'),(10,'Testing'),(12,'Misc'),(13,'Production'),(14,'Manufacturing'),(15,'Editorial'),(16,'Tech'),(17,'Lab Manager'),(18,'Development Engineer'),(19,'User'),(20,'Research'),(21,'Project Coordinator'),(22,'APT - Project Manager'),(23,'APT Solutions'),(24,'FPNSW - Support'),(25,'WSC - Website Steering Committe'),(26,'WUG - Website User Group'),(27,'WTSG - Technical Support Group'),(29,'Marketing'),(30,'Test Member'),(31,'Layout'),(32,'Drainage'),(33,'Lighting'),(34,'Signals'),(35,'Safety'),(36,'Traffic Engineering'),(37,'Cycleway'),(38,'Strategic Planning'),(39,'3d graphics'),(40,'Webdeveloper (HTML/CSS)'),(41,'Tools'),(42,'Vendor'),(43,'Supplier'),(44,'Utilities'),(45,'support'),(46,'Energy Supplier'),(47,'Cocreation designer'),(48,'PDG'),(55,'Manager of Reporting and Analysis'),(56,'Director of Training'),(57,'Project Leader'),(58,'Manager, Human Resources'),(59,'Compensation Consultant'),(60,'Recruiting Manager'),(62,'Human Resources Consultant'),(63,'Project Leader, Special Projects');
/*!40000 ALTER TABLE `proj_resourcecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_resources`
--

DROP TABLE IF EXISTS `proj_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_resources` (
  `resourceid` varchar(50) NOT NULL default '0',
  `resourcename` text NOT NULL,
  `projid` varchar(50) NOT NULL,
  `billable` bit(1) NOT NULL default b'1',
  `stdrate` double default '0',
  `categoryid` int(11) default '1',
  `typeid` int(11) default '1',
  `colorcode` varchar(10) default '#FF0000',
  `inuseflag` bit(1) default b'1',
  `wuvalue` double NOT NULL default '100',
  PRIMARY KEY  (`resourceid`,`projid`),
  KEY `projid_Fk` (`projid`),
  KEY `typeid` (`typeid`),
  KEY `category_fk` (`categoryid`),
  CONSTRAINT `category_fk` FOREIGN KEY (`categoryid`) REFERENCES `proj_resourcecategory` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projid_Fk` FOREIGN KEY (`projid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_resources`
--

LOCK TABLES `proj_resources` WRITE;
/*!40000 ALTER TABLE `proj_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_resourcetype`
--

DROP TABLE IF EXISTS `proj_resourcetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_resourcetype` (
  `typeid` int(11) NOT NULL auto_increment,
  `typename` text NOT NULL,
  PRIMARY KEY  (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_resourcetype`
--

LOCK TABLES `proj_resourcetype` WRITE;
/*!40000 ALTER TABLE `proj_resourcetype` DISABLE KEYS */;
INSERT INTO `proj_resourcetype` VALUES (1,'Work'),(2,'Material'),(3,'Cost');
/*!40000 ALTER TABLE `proj_resourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_task`
--

DROP TABLE IF EXISTS `proj_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_task` (
  `taskindex` bigint(10) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `taskname` varchar(512) default '',
  `duration` varchar(25) default NULL,
  `durationtype` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `percentcomplete` int(11) default '0',
  `notes` text,
  `priority` int(1) NOT NULL default '1',
  `estimated` tinyint(1) default '0',
  `barvisstatus` tinyint(1) default '0',
  `deadline` datetime default NULL,
  `constrainttype` varchar(50) default NULL,
  `constraintdate` datetime default NULL,
  `tasktype` varchar(50) default NULL,
  `caltype` varchar(50) default NULL,
  `level` varchar(11) default '0',
  `parent` varchar(50) default '0',
  `projectid` varchar(50) default NULL,
  `actualduration` varchar(25) default NULL,
  `actualstartdate` datetime default NULL,
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `predecessor` varchar(500) default NULL,
  `isparent` bit(1) NOT NULL default b'0',
  `workholidays` varchar(512) NOT NULL default '',
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_task`
--

LOCK TABLES `proj_task` WRITE;
/*!40000 ALTER TABLE `proj_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_tasklinks`
--

DROP TABLE IF EXISTS `proj_tasklinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_tasklinks` (
  `fromtask` varchar(50) NOT NULL,
  `totask` varchar(50) NOT NULL,
  `timestamp` datetime default NULL,
  KEY `fromtask` (`fromtask`),
  KEY `totask` (`totask`),
  CONSTRAINT `proj_tasklinks_ibfk_1` FOREIGN KEY (`fromtask`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proj_tasklinks_ibfk_2` FOREIGN KEY (`totask`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_tasklinks`
--

LOCK TABLES `proj_tasklinks` WRITE;
/*!40000 ALTER TABLE `proj_tasklinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_tasklinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_taskresourcemapping`
--

DROP TABLE IF EXISTS `proj_taskresourcemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_taskresourcemapping` (
  `taskid` varchar(50) NOT NULL,
  `resourceid` varchar(50) NOT NULL,
  `resduration` double NOT NULL default '100',
  `timestamp` datetime default NULL,
  PRIMARY KEY  (`taskid`,`resourceid`),
  KEY `resourceid` (`resourceid`),
  CONSTRAINT `tasid_FK` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_taskresourcemapping`
--

LOCK TABLES `proj_taskresourcemapping` WRITE;
/*!40000 ALTER TABLE `proj_taskresourcemapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_taskresourcemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_template`
--

DROP TABLE IF EXISTS `proj_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_template` (
  `tempid` varchar(50) NOT NULL default '0',
  `tempname` varchar(256) NOT NULL,
  `description` varchar(512) default NULL,
  `jsonstr` longtext,
  `userid` varchar(50) default NULL,
  `projid` varchar(50) default NULL,
  `shared` varchar(50) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`tempid`),
  KEY `userid` (`userid`),
  KEY `projid` (`projid`),
  CONSTRAINT `proj_template_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proj_template_ibfk_4` FOREIGN KEY (`projid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_template`
--

LOCK TABLES `proj_template` WRITE;
/*!40000 ALTER TABLE `proj_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_temptaskmapping`
--

DROP TABLE IF EXISTS `proj_temptaskmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_temptaskmapping` (
  `tempid` varchar(50) NOT NULL default '0',
  `taskid` int(11) default '0',
  `timestamp` datetime default NULL,
  PRIMARY KEY  (`tempid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_temptaskmapping`
--

LOCK TABLES `proj_temptaskmapping` WRITE;
/*!40000 ALTER TABLE `proj_temptaskmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_temptaskmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proj_workweek`
--

DROP TABLE IF EXISTS `proj_workweek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proj_workweek` (
  `projectid` varchar(36) NOT NULL,
  `day` int(1) default NULL,
  `intime` time default NULL,
  `outtime` time default NULL,
  `isholiday` bit(1) NOT NULL default b'1',
  KEY `projectid` (`projectid`),
  CONSTRAINT `proj_workweek_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proj_workweek`
--

LOCK TABLES `proj_workweek` WRITE;
/*!40000 ALTER TABLE `proj_workweek` DISABLE KEYS */;
/*!40000 ALTER TABLE `proj_workweek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `image` varchar(256) NOT NULL,
  `projectid` varchar(50) NOT NULL default '0',
  `projectname` text,
  `description` text,
  `startdate` datetime default NULL,
  `companyid` varchar(36) default NULL,
  `createdon` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `nickname` varchar(50) default NULL,
  `discription` varchar(512) NOT NULL default '',
  `archived` bit(1) NOT NULL default b'0',
  `o_diff` int(11) NOT NULL default '1',
  `p_diff` int(11) NOT NULL default '1',
  `pertstatus` int(11) NOT NULL default '0',
  PRIMARY KEY  (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmembers`
--

DROP TABLE IF EXISTS `projectmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectmembers` (
  `projectid` varchar(50) default '0',
  `status` int(11) default NULL,
  `userid` varchar(50) default NULL,
  `colorcode` varchar(10) default NULL,
  `inuseflag` bit(1) default b'1',
  `planpermission` int(1) NOT NULL default '4',
  `quicklink` bit(1) NOT NULL default b'1',
  `notification_subscription` int(11) NOT NULL default '0',
  `milestonestack` bit(1) NOT NULL default b'0',
  KEY `projectid` (`projectid`),
  KEY `userid` (`userid`),
  CONSTRAINT `projectmembers_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projectmembers_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmembers`
--

LOCK TABLES `projectmembers` WRITE;
/*!40000 ALTER TABLE `projectmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectspacificdocs`
--

DROP TABLE IF EXISTS `projectspacificdocs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectspacificdocs` (
  `docid` varchar(50) NOT NULL,
  `projectid` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectspacificdocs`
--

LOCK TABLES `projectspacificdocs` WRITE;
/*!40000 ALTER TABLE `projectspacificdocs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectspacificdocs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projecttags`
--

DROP TABLE IF EXISTS `projecttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projecttags` (
  `projectid` varchar(50) default NULL,
  `tagname` text,
  `userid` varchar(50) default NULL,
  KEY `projectid` (`projectid`),
  KEY `userid` (`userid`),
  CONSTRAINT `projecttags_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projecttags_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttags`
--

LOCK TABLES `projecttags` WRITE;
/*!40000 ALTER TABLE `projecttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `projecttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projreport_template`
--

DROP TABLE IF EXISTS `projreport_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projreport_template` (
  `tempid` varchar(50) NOT NULL default '0',
  `tempname` varchar(256) NOT NULL,
  `description` varchar(512) default NULL,
  `configstr` longtext,
  `userid` varchar(50) default NULL,
  `shared` varchar(50) default NULL,
  `timestamp` datetime default NULL,
  PRIMARY KEY  (`tempid`),
  KEY `userid` (`userid`),
  CONSTRAINT `projreport_template_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projreport_template`
--

LOCK TABLES `projreport_template` WRITE;
/*!40000 ALTER TABLE `projreport_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `projreport_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportscolumn`
--

DROP TABLE IF EXISTS `reportscolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportscolumn` (
  `columnid` varchar(36) NOT NULL,
  `module` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `dataindex` varchar(50) default NULL,
  `ismandatory` bit(1) default NULL,
  `renderer` varchar(30) default NULL,
  `type` int(3) default NULL,
  `tablename` varchar(50) default NULL,
  `fieldname` varchar(50) NOT NULL,
  `headerkey` varchar(50) default NULL,
  PRIMARY KEY  (`columnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportscolumn`
--

LOCK TABLES `reportscolumn` WRITE;
/*!40000 ALTER TABLE `reportscolumn` DISABLE KEYS */;
INSERT INTO `reportscolumn` VALUES ('project_archived','Project','archived','Archieved','archived','\0','booleanfield',1,'project','archived',''),('project_createdon','Project','createdon','Created Date','createdon','\0','date',2,'project','createdon',''),('project_description','Project','description','Description','description','\0','textfield',4,'project','description',''),('project_projectname','Project','projectname','Project Name','projectname','','textfield',4,'project','projectname',''),('project_startdate','Project','startdate','Start Date','startdate','\0','date',2,'project','startdate','');
/*!40000 ALTER TABLE `reportscolumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportscolumnmapping`
--

DROP TABLE IF EXISTS `reportscolumnmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportscolumnmapping` (
  `columnid` varchar(36) NOT NULL,
  `reportid` varchar(36) NOT NULL,
  `displayheader` varchar(50) default NULL,
  `quicksearch` bit(1) default b'0',
  `summary` varchar(10) default NULL,
  `displayorder` int(2) default NULL,
  KEY `reportid_ibfk1` (`reportid`),
  CONSTRAINT `reportid_ibfk1` FOREIGN KEY (`reportid`) REFERENCES `customreports` (`reportid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportscolumnmapping`
--

LOCK TABLES `reportscolumnmapping` WRITE;
/*!40000 ALTER TABLE `reportscolumnmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportscolumnmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roletype`
--

DROP TABLE IF EXISTS `roletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roletype` (
  `roletypeid` int(11) NOT NULL auto_increment,
  `roletype` varchar(50) NOT NULL,
  PRIMARY KEY  (`roletypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roletype`
--

LOCK TABLES `roletype` WRITE;
/*!40000 ALTER TABLE `roletype` DISABLE KEYS */;
/*!40000 ALTER TABLE `roletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selectedcalendars`
--

DROP TABLE IF EXISTS `selectedcalendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selectedcalendars` (
  `cid` varchar(50) NOT NULL,
  `userid` varchar(36) NOT NULL,
  KEY `selectedcalendars_ibfk_1` (`cid`),
  KEY `selectedcalendars_ibfk_2` (`userid`),
  CONSTRAINT `selectedcalendars_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `calendars` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectedcalendars_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selectedcalendars`
--

LOCK TABLES `selectedcalendars` WRITE;
/*!40000 ALTER TABLE `selectedcalendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `selectedcalendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selectedreport`
--

DROP TABLE IF EXISTS `selectedreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selectedreport` (
  `userid` varchar(36) NOT NULL,
  `reportid` varchar(36) NOT NULL,
  KEY `selectedreport_fk1` (`userid`),
  KEY `selectedreport_fk2` (`reportid`),
  CONSTRAINT `selectedreport_fk1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `selectedreport_fk2` FOREIGN KEY (`reportid`) REFERENCES `customreports` (`reportid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store custom report selected to display in dashboar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selectedreport`
--

LOCK TABLES `selectedreport` WRITE;
/*!40000 ALTER TABLE `selectedreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `selectedreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharecalendarmap`
--

DROP TABLE IF EXISTS `sharecalendarmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharecalendarmap` (
  `cid` varchar(36) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `permissionlevel` int(11) default '0',
  `timestamp` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `colorcode` varchar(7) NOT NULL default '0',
  KEY `userid` (`userid`),
  KEY `cid` (`cid`),
  CONSTRAINT `sharecalendarmap_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `calendars` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharecalendarmap`
--

LOCK TABLES `sharecalendarmap` WRITE;
/*!40000 ALTER TABLE `sharecalendarmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `sharecalendarmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subactivitylist`
--

DROP TABLE IF EXISTS `subactivitylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subactivitylist` (
  `parentactivityid` int(11) NOT NULL,
  `parentfeatureid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `activityname` varchar(50) NOT NULL,
  `displayactivityname` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subactivitylist`
--

LOCK TABLES `subactivitylist` WRITE;
/*!40000 ALTER TABLE `subactivitylist` DISABLE KEYS */;
INSERT INTO `subactivitylist` VALUES (5,2,1,'AccessAllProjects','Manage members of all Projects'),(5,2,2,'AccessOnlyAssigned','Manage members only of Assigned Projects');
/*!40000 ALTER TABLE `subactivitylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptionmap`
--

DROP TABLE IF EXISTS `subscriptionmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptionmap` (
  `companyid` varchar(36) NOT NULL default '',
  `token` varchar(36) NOT NULL default '',
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptionmap`
--

LOCK TABLES `subscriptionmap` WRITE;
/*!40000 ALTER TABLE `subscriptionmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptionmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subid` int(11) NOT NULL,
  `companyid` varchar(36) NOT NULL,
  `billdate` datetime NOT NULL,
  `frequency` int(11) NOT NULL default '1',
  `numproj` int(11) NOT NULL default '1',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `isactive` int(11) NOT NULL,
  `renewal` int(11) NOT NULL default '0',
  `subnum` varchar(20) default NULL,
  `enddate` date NOT NULL default '1970-01-01',
  `nextstate` int(11) NOT NULL,
  PRIMARY KEY  (`subid`),
  KEY `companyid` (`companyid`),
  CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superuser`
--

DROP TABLE IF EXISTS `superuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superuser` (
  `userid` varchar(36) NOT NULL,
  KEY `userid` (`userid`),
  CONSTRAINT `superuser_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superuser`
--

LOCK TABLES `superuser` WRITE;
/*!40000 ALTER TABLE `superuser` DISABLE KEYS */;
INSERT INTO `superuser` VALUES ('ea8267e4-6275-48fa-9519-bc1739779170');
/*!40000 ALTER TABLE `superuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemtimezone`
--

DROP TABLE IF EXISTS `systemtimezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemtimezone` (
  `id` varchar(10) default NULL,
  `name` varchar(200) default NULL,
  `difference` varchar(32) default NULL,
  `sortorder` int(11) default NULL,
  `tzid` varchar(200) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemtimezone`
--

LOCK TABLES `systemtimezone` WRITE;
/*!40000 ALTER TABLE `systemtimezone` DISABLE KEYS */;
INSERT INTO `systemtimezone` VALUES ('26','(GMT-06:00) Central Time','-06:00',26,'America/Chicago');
/*!40000 ALTER TABLE `systemtimezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tagid` varchar(50) NOT NULL default '0',
  `tagname` text,
  `userid` varchar(50) default NULL,
  PRIMARY KEY  (`tagid`),
  KEY `tagid` (`tagid`),
  KEY `userid` (`userid`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_progressrequest`
--

DROP TABLE IF EXISTS `task_progressrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_progressrequest` (
  `requestid` varchar(50) NOT NULL,
  `requestby` varchar(50) NOT NULL,
  `requestto` varchar(512) NOT NULL,
  `taskid` varchar(50) NOT NULL,
  `requestdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`requestid`),
  KEY `new_fk_constraint` (`taskid`),
  CONSTRAINT `task_progressrequest_ibfk_1` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_progressrequest`
--

LOCK TABLES `task_progressrequest` WRITE;
/*!40000 ALTER TABLE `task_progressrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_progressrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_urlmap`
--

DROP TABLE IF EXISTS `task_urlmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_urlmap` (
  `taskid` varchar(50) NOT NULL,
  `url` varchar(1024) default NULL,
  KEY `task_urlmap_ibfk_1` (`taskid`),
  CONSTRAINT `task_urlmap_ibfk_1` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_urlmap`
--

LOCK TABLES `task_urlmap` WRITE;
/*!40000 ALTER TABLE `task_urlmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_urlmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskchecklistmapping`
--

DROP TABLE IF EXISTS `taskchecklistmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskchecklistmapping` (
  `mappingid` varchar(36) NOT NULL,
  `taskid` varchar(36) NOT NULL,
  `checklistid` varchar(36) NOT NULL,
  `mappedby` varchar(36) default NULL,
  PRIMARY KEY  (`mappingid`),
  KEY `taskchecklistmapping_ibfk_1` (`taskid`),
  KEY `taskchecklistmapping_ibfk_2` (`checklistid`),
  CONSTRAINT `taskchecklistmapping_ibfk_1` FOREIGN KEY (`taskid`) REFERENCES `proj_task` (`taskid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taskchecklistmapping_ibfk_2` FOREIGN KEY (`checklistid`) REFERENCES `checklist` (`checklistid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='generates task and checklist mapping id used in todo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskchecklistmapping`
--

LOCK TABLES `taskchecklistmapping` WRITE;
/*!40000 ALTER TABLE `taskchecklistmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskchecklistmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `teamid` varchar(50) NOT NULL,
  `teamname` text NOT NULL,
  `description` text,
  `createdon` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `companyid` varchar(36) NOT NULL,
  PRIMARY KEY  (`teamid`),
  KEY `team_ibfk_1` (`companyid`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_projectmapping`
--

DROP TABLE IF EXISTS `team_projectmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_projectmapping` (
  `projectid` varchar(50) NOT NULL,
  `teamid` varchar(50) NOT NULL,
  KEY `team_projectmapping_ibfk_1` (`projectid`),
  KEY `team_projectmapping_ibfk_2` (`teamid`),
  CONSTRAINT `team_projectmapping_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE,
  CONSTRAINT `team_projectmapping_ibfk_2` FOREIGN KEY (`teamid`) REFERENCES `team` (`teamid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_projectmapping`
--

LOCK TABLES `team_projectmapping` WRITE;
/*!40000 ALTER TABLE `team_projectmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_projectmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teammembers`
--

DROP TABLE IF EXISTS `teammembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teammembers` (
  `teamid` varchar(50) NOT NULL,
  `resourceid` varchar(50) NOT NULL,
  KEY `teammembers_ibfk_1` (`teamid`),
  KEY `teammembers_ibfk_2` (`resourceid`),
  CONSTRAINT `teammembers_ibfk_1` FOREIGN KEY (`teamid`) REFERENCES `team` (`teamid`) ON DELETE CASCADE,
  CONSTRAINT `teammembers_ibfk_2` FOREIGN KEY (`resourceid`) REFERENCES `proj_resources` (`resourceid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teammembers`
--

LOCK TABLES `teammembers` WRITE;
/*!40000 ALTER TABLE `teammembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teammembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempImportData`
--

DROP TABLE IF EXISTS `tempImportData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempImportData` (
  `taskindex` int(5) NOT NULL,
  `taskid` varchar(100) NOT NULL,
  `taskname` varchar(1024) default NULL,
  `duration` varchar(20) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `percentcomplete` int(5) NOT NULL default '0',
  `priority` text NOT NULL,
  `notes` text,
  `resourcename` varchar(1024) default NULL,
  `predecessor` varchar(100) default NULL,
  `parent` varchar(50) NOT NULL default '0',
  `log` varchar(512) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempImportData`
--

LOCK TABLES `tempImportData` WRITE;
/*!40000 ALTER TABLE `tempImportData` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempImportData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timezone` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `difference` varchar(32) default NULL,
  `sortorder` int(11) default NULL,
  `tzid` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES (1,'(GMT-11:00) Apia','-11:00',1,'Pacific/Apia'),(2,'(GMT-11:00) Midway','-11:00',2,'Pacific/Midway'),(3,'(GMT-11:00) Niue','-11:00',3,'Pacific/Niue'),(4,'(GMT-11:00) Pago Pago','-11:00',4,'Pacific/Pago_Pago'),(5,'(GMT-10:00) Fakaofo','-10:00',5,'Pacific/Fakaofo'),(6,'(GMT-10:00) Hawaii Time','-10:00',6,'Pacific/Honolulu'),(7,'(GMT-10:00) Johnston','-10:00',7,'Pacific/Johnston'),(8,'(GMT-10:00) Rarotonga','-10:00',8,'Pacific/Rarotonga'),(9,'(GMT-10:00) Tahiti','-10:00',9,'Pacific/Tahiti'),(10,'(GMT-09:30) Marquesas','-09:30',10,'Pacific/Marquesas'),(11,'(GMT-09:00) Alaska Time','-09:00',11,'America/Anchorage'),(12,'(GMT-09:00) Gambier','-09:00',12,'Pacific/Gambier'),(13,'(GMT-08:00) Pacific Time','-08:00',13,'America/Los_Angeles'),(14,'(GMT-08:00) Pacific Time - Tijuana','-08:00',14,'America/Tijuana'),(15,'(GMT-08:00) Pacific Time - Vancouver','-08:00',15,'America/Vancouver'),(16,'(GMT-08:00) Pacific Time - Whitehorse','-08:00',16,'America/Whitehorse'),(17,'(GMT-08:00) Pitcairn','-08:00',17,'Pacific/Pitcairn'),(18,'(GMT-07:00) Mountain Time - Dawson Creek','-07:00',18,'America/Dawson_Creek'),(19,'(GMT-07:00) Mountain Time (America/Denver)','-07:00',19,'America/Denver'),(20,'(GMT-07:00) Mountain Time - Edmonton','-07:00',20,'America/Edmonton'),(21,'(GMT-07:00) Mountain Time - Hermosillo','-07:00',21,'America/Hermosillo'),(22,'(GMT-07:00) Mountain Time - Chihuahua, Mazatlan','-07:00',22,'America/Mazatlan'),(23,'(GMT-07:00) Mountain Time - Arizona','-07:00',23,'America/Phoenix'),(24,'(GMT-07:00) Mountain Time - Yellowknife','-07:00',24,'America/Yellowknife'),(25,'(GMT-06:00) Belize','-06:00',25,'America/Belize'),(26,'(GMT-06:00) Central Time','-06:00',26,'America/Chicago'),(27,'(GMT-06:00) Costa Rica','-06:00',27,'America/Costa_Rica'),(28,'(GMT-06:00) El Salvador','-06:00',28,'America/El_Salvador'),(29,'(GMT-06:00) Guatemala','-06:00',29,'America/Guatemala'),(30,'(GMT-06:00) Managua','-06:00',30,'America/Managua'),(31,'(GMT-06:00) Central Time - Mexico City','-06:00',31,'America/Mexico_City'),(32,'(GMT-06:00) Central Time - Regina','-06:00',32,'America/Regina'),(33,'(GMT-06:00) Central Time (America/Tegucigalpa)','-06:00',33,'America/Tegucigalpa'),(34,'(GMT-06:00) Central Time - Winnipeg','-06:00',34,'America/Winnipeg'),(35,'(GMT-06:00) Easter Island','-06:00',35,'Pacific/Easter'),(36,'(GMT-06:00) Galapagos','-06:00',36,'Pacific/Galapagos'),(37,'(GMT-05:00) Bogota','-05:00',37,'America/Bogota'),(38,'(GMT-05:00) Cayman','-05:00',38,'America/Cayman'),(39,'(GMT-05:00) Grand Turk','-05:00',39,'America/Grand_Turk'),(40,'(GMT-05:00) Guayaquil','-05:00',40,'America/Guayaquil'),(41,'(GMT-05:00) Havana','-05:00',41,'America/Havana'),(42,'(GMT-05:00) Eastern Time - Iqaluit','-05:00',42,'America/Iqaluit'),(43,'(GMT-05:00) Jamaica','-05:00',43,'America/Jamaica'),(44,'(GMT-05:00) Lima','-05:00',44,'America/Lima'),(45,'(GMT-05:00) Eastern Time - Montreal','-05:00',45,'America/Montreal'),(46,'(GMT-05:00) Nassau','-05:00',46,'America/Nassau'),(47,'(GMT-05:00) Eastern Time','-05:00',47,'America/New_York'),(48,'(GMT-05:00) Panama','-05:00',48,'America/Panama'),(49,'(GMT-05:00) Port-au-Prince','-05:00',49,'America/Port-au-Prince'),(50,'(GMT-05:00) Eastern Time - Toronto','-05:00',50,'America/Toronto'),(51,'(GMT-04:30) Caracas','-04:30',51,'America/Caracas'),(52,'(GMT-04:00) Anguilla','-04:00',52,'America/Anguilla'),(53,'(GMT-04:00) Antigua','-04:00',53,'America/Antigua'),(54,'(GMT-04:00) Aruba','-04:00',54,'America/Aruba'),(55,'(GMT-04:00) Asuncion','-04:00',55,'America/Asuncion'),(56,'(GMT-04:00) Barbados','-04:00',56,'America/Barbados'),(57,'(GMT-04:00) Boa Vista','-04:00',57,'America/Boa_Vista'),(58,'(GMT-04:00) Campo Grande','-04:00',58,'America/Campo_Grande'),(59,'(GMT-04:00) Cuiaba','-04:00',59,'America/Cuiaba'),(60,'(GMT-04:00) Curacao','-04:00',60,'America/Curacao'),(61,'(GMT-04:00) Dominica','-04:00',61,'America/Dominica'),(62,'(GMT-04:00) Grenada','-04:00',62,'America/Grenada'),(63,'(GMT-04:00) Guadeloupe','-04:00',63,'America/Guadeloupe'),(64,'(GMT-04:00) Guyana','-04:00',64,'America/Guyana'),(65,'(GMT-04:00) Atlantic Time - Halifax','-04:00',65,'America/Halifax'),(66,'(GMT-04:00) La Paz','-04:00',66,'America/La_Paz'),(67,'(GMT-04:00) Manaus','-04:00',67,'America/Manaus'),(68,'(GMT-04:00) Martinique','-04:00',68,'America/Martinique'),(69,'(GMT-04:00) Montserrat','-04:00',69,'America/Montserrat'),(70,'(GMT-04:00) Port of Spain','-04:00',70,'America/Port_of_Spain'),(71,'(GMT-04:00) Porto Velho','-04:00',71,'America/Porto_Velho'),(72,'(GMT-04:00) Puerto Rico','-04:00',72,'America/Puerto_Rico'),(73,'(GMT-04:00) Rio Branco','-04:00',73,'America/Rio_Branco'),(74,'(GMT-04:00) Santiago','-04:00',74,'America/Santiago'),(75,'(GMT-04:00) Santo Domingo','-04:00',75,'America/Santo_Domingo'),(76,'(GMT-04:00) St. Kitts','-04:00',76,'America/St_Kitts'),(77,'(GMT-04:00) St. Lucia','-04:00',77,'America/St_Lucia'),(78,'(GMT-04:00) St. Thomas','-04:00',78,'America/St_Thomas'),(79,'(GMT-04:00) St. Vincent','-04:00',79,'America/St_Vincent'),(80,'(GMT-04:00) Thule','-04:00',80,'America/Thule'),(81,'(GMT-04:00) Tortola','-04:00',81,'America/Tortola'),(82,'(GMT-04:00) Palmer','-04:00',82,'Antarctica/Palmer'),(83,'(GMT-04:00) Bermuda','-04:00',83,'Atlantic/Bermuda'),(84,'(GMT-04:00) Stanley','-04:00',84,'Atlantic/Stanley'),(85,'(GMT-03:30) Newfoundland Time - St. Johns','-03:30',85,'America/St_Johns'),(86,'(GMT-03:00) Araguaina','-03:00',86,'America/Araguaina'),(87,'(GMT-03:00) Buenos Aires','-03:00',87,'America/Argentina/Buenos_Aires'),(88,'(GMT-03:00) Salvador','-03:00',88,'America/Bahia'),(89,'(GMT-03:00) Belem','-03:00',89,'America/Belem'),(90,'(GMT-03:00) Cayenne','-03:00',90,'America/Cayenne'),(91,'(GMT-03:00) Fortaleza','-03:00',91,'America/Fortaleza'),(92,'(GMT-03:00) Godthab','-03:00',92,'America/Godthab'),(93,'(GMT-03:00) Maceio','-03:00',93,'America/Maceio'),(94,'(GMT-03:00) Miquelon','-03:00',94,'America/Miquelon'),(95,'(GMT-03:00) Montevideo','-03:00',95,'America/Montevideo'),(96,'(GMT-03:00) Paramaribo','-03:00',96,'America/Paramaribo'),(97,'(GMT-03:00) Recife','-03:00',97,'America/Recife'),(98,'(GMT-03:00) Sao Paulo','-03:00',98,'America/Sao_Paulo'),(99,'(GMT-03:00) Rothera','-03:00',99,'Antarctica/Rothera'),(100,'(GMT-02:00) Noronha','-02:00',100,'America/Noronha'),(101,'(GMT-02:00) South Georgia','-02:00',101,'Atlantic/South_Georgia'),(102,'(GMT-01:00) Scoresbysund','-01:00',102,'America/Scoresbysund'),(103,'(GMT-01:00) Azores','-01:00',103,'Atlantic/Azores'),(104,'(GMT-01:00) Cape Verde','-01:00',104,'Atlantic/Cape_Verde'),(105,'(GMT+00:00) Abidjan','+00:00',105,'Africa/Abidjan'),(106,'(GMT+00:00) Accra','+00:00',106,'Africa/Accra'),(107,'(GMT+00:00) Bamako','+00:00',107,'Africa/Bamako'),(108,'(GMT+00:00) Banjul','+00:00',108,'Africa/Banjul'),(109,'(GMT+00:00) Bissau','+00:00',109,'Africa/Bissau'),(110,'(GMT+00:00) Casablanca','+00:00',110,'Africa/Casablanca'),(111,'(GMT+00:00) Conakry','+00:00',111,'Africa/Conakry'),(112,'(GMT+00:00) Dakar','+00:00',112,'Africa/Dakar'),(113,'(GMT+00:00) El Aaiun','+00:00',113,'Africa/El_Aaiun'),(114,'(GMT+00:00) Freetown','+00:00',114,'Africa/Freetown'),(115,'(GMT+00:00) Lome','+00:00',115,'Africa/Lome'),(116,'(GMT+00:00) Monrovia','+00:00',116,'Africa/Monrovia'),(117,'(GMT+00:00) Nouakchott','+00:00',117,'Africa/Nouakchott'),(118,'(GMT+00:00) Ouagadougou','+00:00',118,'Africa/Ouagadougou'),(119,'(GMT+00:00) Sao Tome','+00:00',119,'Africa/Sao_Tome'),(120,'(GMT+00:00) Danmarkshavn','+00:00',120,'America/Danmarkshavn'),(121,'(GMT+00:00) Canary Islands','+00:00',121,'Atlantic/Canary'),(122,'(GMT+00:00) Faeroe','+00:00',122,'Atlantic/Faroe'),(123,'(GMT+00:00) Reykjavik','+00:00',123,'Atlantic/Reykjavik'),(124,'(GMT+00:00) St Helena','+00:00',124,'Atlantic/St_Helena'),(125,'(GMT+00:00) GMT (no daylight saving)','+00:00',125,'Etc/GMT'),(126,'(GMT+00:00) Dublin','+00:00',126,'Europe/Dublin'),(127,'(GMT+00:00) Lisbon','+00:00',127,'Europe/Lisbon'),(128,'(GMT+00:00) London','+00:00',128,'Europe/London'),(129,'(GMT+01:00) Algiers','+01:00',129,'Africa/Algiers'),(130,'(GMT+01:00) Bangui','+01:00',130,'Africa/Bangui'),(131,'(GMT+01:00) Brazzaville','+01:00',131,'Africa/Brazzaville'),(132,'(GMT+01:00) Ceuta','+01:00',132,'Africa/Ceuta'),(133,'(GMT+01:00) Douala','+01:00',133,'Africa/Douala'),(134,'(GMT+01:00) Kinshasa','+01:00',134,'Africa/Kinshasa'),(135,'(GMT+01:00) Lagos','+01:00',135,'Africa/Lagos'),(136,'(GMT+01:00) Libreville','+01:00',136,'Africa/Libreville'),(137,'(GMT+01:00) Luanda','+01:00',137,'Africa/Luanda'),(138,'(GMT+01:00) Malabo','+01:00',138,'Africa/Malabo'),(139,'(GMT+01:00) Ndjamena','+01:00',139,'Africa/Ndjamena'),(140,'(GMT+01:00) Niamey','+01:00',140,'Africa/Niamey'),(141,'(GMT+01:00) Porto-Novo','+01:00',141,'Africa/Porto-Novo'),(142,'(GMT+01:00) Tunis','+01:00',142,'Africa/Tunis'),(143,'(GMT+01:00) Windhoek','+01:00',143,'Africa/Windhoek'),(144,'(GMT+01:00) Amsterdam','+01:00',144,'Europe/Amsterdam'),(145,'(GMT+01:00) Andorra','+01:00',145,'Europe/Andorra'),(146,'(GMT+01:00) Central European Time (Europe/Belgrade)','+01:00',146,'Europe/Belgrade'),(147,'(GMT+01:00) Berlin','+01:00',147,'Europe/Berlin'),(148,'(GMT+01:00) Brussels','+01:00',148,'Europe/Brussels'),(149,'(GMT+01:00) Budapest','+01:00',149,'Europe/Budapest'),(150,'(GMT+01:00) Copenhagen','+01:00',150,'Europe/Copenhagen'),(151,'(GMT+01:00) Gibraltar','+01:00',151,'Europe/Gibraltar'),(152,'(GMT+01:00) Luxembourg','+01:00',152,'Europe/Luxembourg'),(153,'(GMT+01:00) Madrid','+01:00',153,'Europe/Madrid'),(154,'(GMT+01:00) Malta','+01:00',154,'Europe/Malta'),(155,'(GMT+01:00) Monaco','+01:00',155,'Europe/Monaco'),(156,'(GMT+01:00) Oslo','+01:00',156,'Europe/Oslo'),(157,'(GMT+01:00) Paris','+01:00',157,'Europe/Paris'),(158,'(GMT+01:00) Central European Time (Europe/Prague)','+01:00',158,'Europe/Prague'),(159,'(GMT+01:00) Rome','+01:00',159,'Europe/Rome'),(160,'(GMT+01:00) Stockholm','+01:00',160,'Europe/Stockholm'),(161,'(GMT+01:00) Tirane','+01:00',161,'Europe/Tirane'),(162,'(GMT+01:00) Vaduz','+01:00',162,'Europe/Vaduz'),(163,'(GMT+01:00) Vienna','+01:00',163,'Europe/Vienna'),(164,'(GMT+01:00) Warsaw','+01:00',164,'Europe/Warsaw'),(165,'(GMT+01:00) Zurich','+01:00',165,'Europe/Zurich'),(166,'(GMT+02:00) Blantyre','+02:00',166,'Africa/Blantyre'),(167,'(GMT+02:00) Bujumbura','+02:00',167,'Africa/Bujumbura'),(168,'(GMT+02:00) Cairo','+02:00',168,'Africa/Cairo'),(169,'(GMT+02:00) Gaborone','+02:00',169,'Africa/Gaborone'),(170,'(GMT+02:00) Harare','+02:00',170,'Africa/Harare'),(171,'(GMT+02:00) Johannesburg','+02:00',171,'Africa/Johannesburg'),(172,'(GMT+02:00) Kigali','+02:00',172,'Africa/Kigali'),(173,'(GMT+02:00) Lubumbashi','+02:00',173,'Africa/Lubumbashi'),(174,'(GMT+02:00) Lusaka','+02:00',174,'Africa/Lusaka'),(175,'(GMT+02:00) Maputo','+02:00',175,'Africa/Maputo'),(176,'(GMT+02:00) Maseru','+02:00',176,'Africa/Maseru'),(177,'(GMT+02:00) Mbabane','+02:00',177,'Africa/Mbabane'),(178,'(GMT+02:00) Tripoli','+02:00',178,'Africa/Tripoli'),(179,'(GMT+02:00) Amman','+02:00',179,'Asia/Amman'),(180,'(GMT+02:00) Beirut','+02:00',180,'Asia/Beirut'),(181,'(GMT+02:00) Damascus','+02:00',181,'Asia/Damascus'),(182,'(GMT+02:00) Gaza','+02:00',182,'Asia/Gaza'),(183,'(GMT+02:00) Jerusalem','+02:00',183,'Asia/Jerusalem'),(184,'(GMT+02:00) Nicosia','+02:00',184,'Asia/Nicosia'),(185,'(GMT+02:00) Athens','+02:00',185,'Europe/Athens'),(186,'(GMT+02:00) Bucharest','+02:00',186,'Europe/Bucharest'),(187,'(GMT+02:00) Chisinau','+02:00',187,'Europe/Chisinau'),(188,'(GMT+02:00) Helsinki','+02:00',188,'Europe/Helsinki'),(189,'(GMT+02:00) Istanbul','+02:00',189,'Europe/Istanbul'),(190,'(GMT+02:00) Moscow-01 - Kaliningrad','+02:00',190,'Europe/Kaliningrad'),(191,'(GMT+02:00) Kiev','+02:00',191,'Europe/Kiev'),(192,'(GMT+02:00) Minsk','+02:00',192,'Europe/Minsk'),(193,'(GMT+02:00) Riga','+02:00',193,'Europe/Riga'),(194,'(GMT+02:00) Sofia','+02:00',194,'Europe/Sofia'),(195,'(GMT+02:00) Tallinn','+02:00',195,'Europe/Tallinn'),(196,'(GMT+02:00) Vilnius','+02:00',196,'Europe/Vilnius'),(197,'(GMT+03:00) Addis Ababa','+03:00',197,'Africa/Addis_Ababa'),(198,'(GMT+03:00) Asmera','+03:00',198,'Africa/Asmara'),(199,'(GMT+03:00) Dar es Salaam','+03:00',199,'Africa/Dar_es_Salaam'),(200,'(GMT+03:00) Djibouti','+03:00',200,'Africa/Djibouti'),(201,'(GMT+03:00) Kampala','+03:00',201,'Africa/Kampala'),(202,'(GMT+03:00) Khartoum','+03:00',202,'Africa/Khartoum'),(203,'(GMT+03:00) Mogadishu','+03:00',203,'Africa/Mogadishu'),(204,'(GMT+03:00) Nairobi','+03:00',204,'Africa/Nairobi'),(205,'(GMT+03:00) Syowa','+03:00',205,'Antarctica/Syowa'),(206,'(GMT+03:00) Aden','+03:00',206,'Asia/Aden'),(207,'(GMT+03:00) Baghdad','+03:00',207,'Asia/Baghdad'),(208,'(GMT+03:00) Bahrain','+03:00',208,'Asia/Bahrain'),(209,'(GMT+03:00) Kuwait','+03:00',209,'Asia/Kuwait'),(210,'(GMT+03:00) Qatar','+03:00',210,'Asia/Qatar'),(211,'(GMT+03:00) Riyadh','+03:00',211,'Asia/Riyadh'),(212,'(GMT+03:00) Moscow+00','+03:00',212,'Europe/Moscow'),(213,'(GMT+03:00) Antananarivo','+03:00',213,'Indian/Antananarivo'),(214,'(GMT+03:00) Comoro','+03:00',214,'Indian/Comoro'),(215,'(GMT+03:00) Mayotte','+03:00',215,'Indian/Mayotte'),(216,'(GMT+03:30) Tehran','+03:30',216,'Asia/Tehran'),(217,'(GMT+04:00) Baku','+04:00',217,'Asia/Baku'),(218,'(GMT+04:00) Dubai','+04:00',218,'Asia/Dubai'),(219,'(GMT+04:00) Muscat','+04:00',219,'Asia/Muscat'),(220,'(GMT+04:00) Tbilisi','+04:00',220,'Asia/Tbilisi'),(221,'(GMT+04:00) Yerevan','+04:00',221,'Asia/Yerevan'),(222,'(GMT+04:00) Moscow+01 - Samara','+04:00',222,'Europe/Samara'),(223,'(GMT+04:00) Mahe','+04:00',223,'Indian/Mahe'),(224,'(GMT+04:00) Mauritius','+04:00',224,'Indian/Mauritius'),(225,'(GMT+04:00) Reunion','+04:00',225,'Indian/Reunion'),(226,'(GMT+04:30) Kabul','+04:30',226,'Asia/Kabul'),(227,'(GMT+05:00) Aqtau','+05:00',227,'Asia/Aqtau'),(228,'(GMT+05:00) Aqtobe','+05:00',228,'Asia/Aqtobe'),(229,'(GMT+05:00) Ashgabat','+05:00',229,'Asia/Ashgabat'),(230,'(GMT+05:00) Dushanbe','+05:00',230,'Asia/Dushanbe'),(231,'(GMT+05:00) Karachi','+05:00',231,'Asia/Karachi'),(232,'(GMT+05:00) Tashkent','+05:00',232,'Asia/Tashkent'),(233,'(GMT+05:00) Moscow+02 - Yekaterinburg','+05:00',233,'Asia/Yekaterinburg'),(234,'(GMT+05:00) Kerguelen','+05:00',234,'Indian/Kerguelen'),(235,'(GMT+05:00) Maldives','+05:00',235,'Indian/Maldives'),(236,'(GMT+05:30) India Standard Time','+05:30',236,'Asia/Calcutta'),(237,'(GMT+05:30) Colombo','+05:30',237,'Asia/Colombo'),(238,'(GMT+05:45) Katmandu','+05:45',238,'Asia/Katmandu'),(239,'(GMT+06:00) Mawson','+06:00',239,'Antarctica/Mawson'),(240,'(GMT+06:00) Vostok','+06:00',240,'Antarctica/Vostok'),(241,'(GMT+06:00) Almaty','+06:00',241,'Asia/Almaty'),(242,'(GMT+06:00) Bishkek','+06:00',242,'Asia/Bishkek'),(243,'(GMT+06:00) Dhaka','+06:00',243,'Asia/Dhaka'),(244,'(GMT+06:00) Moscow+03 - Omsk, Novosibirsk','+06:00',244,'Asia/Omsk'),(245,'(GMT+06:00) Thimphu','+06:00',245,'Asia/Thimphu'),(246,'(GMT+06:00) Chagos','+06:00',246,'Indian/Chagos'),(247,'(GMT+06:30) Rangoon','+06:30',247,'Asia/Rangoon'),(248,'(GMT+06:30) Cocos','+06:30',248,'Indian/Cocos'),(249,'(GMT+07:00) Davis','+07:00',249,'Antarctica/Davis'),(250,'(GMT+07:00) Bangkok','+07:00',250,'Asia/Bangkok'),(251,'(GMT+07:00) Hovd','+07:00',251,'Asia/Hovd'),(252,'(GMT+07:00) Jakarta','+07:00',252,'Asia/Jakarta'),(253,'(GMT+07:00) Moscow+04 - Krasnoyarsk','+07:00',253,'Asia/Krasnoyarsk'),(254,'(GMT+07:00) Phnom Penh','+07:00',254,'Asia/Phnom_Penh'),(255,'(GMT+07:00) Hanoi','+07:00',255,'Asia/Saigon'),(256,'(GMT+07:00) Vientiane','+07:00',256,'Asia/Vientiane'),(257,'(GMT+07:00) Christmas','+07:00',257,'Indian/Christmas'),(258,'(GMT+08:00) Casey','+08:00',258,'Antarctica/Casey'),(259,'(GMT+08:00) Brunei','+08:00',259,'Asia/Brunei'),(260,'(GMT+08:00) Choibalsan','+08:00',260,'Asia/Choibalsan'),(261,'(GMT+08:00) Hong Kong','+08:00',261,'Asia/Hong_Kong'),(262,'(GMT+08:00) Moscow+05 - Irkutsk','+08:00',262,'Asia/Irkutsk'),(263,'(GMT+08:00) Kuala Lumpur','+08:00',263,'Asia/Kuala_Lumpur'),(264,'(GMT+08:00) Macau','+08:00',264,'Asia/Macau'),(265,'(GMT+08:00) Makassar','+08:00',265,'Asia/Makassar'),(266,'(GMT+08:00) Manila','+08:00',266,'Asia/Manila'),(267,'(GMT+08:00) China Time - Beijing','+08:00',267,'Asia/Shanghai'),(268,'(GMT+08:00) Singapore','+08:00',268,'Asia/Singapore'),(269,'(GMT+08:00) Taipei','+08:00',269,'Asia/Taipei'),(270,'(GMT+08:00) Ulaanbaatar','+08:00',270,'Asia/Ulaanbaatar'),(271,'(GMT+08:00) Western Time - Perth','+08:00',271,'Australia/Perth'),(272,'(GMT+09:00) Dili','+09:00',272,'Asia/Dili'),(273,'(GMT+09:00) Jayapura','+09:00',273,'Asia/Jayapura'),(274,'(GMT+09:00) Pyongyang','+09:00',274,'Asia/Pyongyang'),(275,'(GMT+09:00) Seoul','+09:00',275,'Asia/Seoul'),(276,'(GMT+09:00) Tokyo','+09:00',276,'Asia/Tokyo'),(277,'(GMT+09:00) Moscow+06 - Yakutsk','+09:00',277,'Asia/Yakutsk'),(278,'(GMT+09:00) Palau','+09:00',278,'Pacific/Palau'),(279,'(GMT+09:30) Central Time - Adelaide','+09:30',279,'Australia/Adelaide'),(280,'(GMT+09:30) Central Time - Darwin','+09:30',280,'Australia/Darwin'),(281,'(GMT+10:00) Dumont D\'Urville','+10:00',281,'Antarctica/DumontDUrville'),(282,'(GMT+10:00) Moscow+07 - Yuzhno-Sakhalinsk','+10:00',282,'Asia/Vladivostok'),(283,'(GMT+10:00) Eastern Time - Brisbane','+10:00',283,'Australia/Brisbane'),(284,'(GMT+10:00) Eastern Time - Hobart','+10:00',284,'Australia/Hobart'),(285,'(GMT+10:00) Eastern Time - Melbourne, Sydney','+10:00',285,'Australia/Sydney'),(286,'(GMT+10:00) Guam','+10:00',286,'Pacific/Guam'),(287,'(GMT+10:00) Port Moresby','+10:00',287,'Pacific/Port_Moresby'),(288,'(GMT+10:00) Saipan','+10:00',288,'Pacific/Saipan'),(289,'(GMT+10:00) Truk','+10:00',289,'Pacific/Truk'),(290,'(GMT+11:00) Moscow+08 - Magadan','+11:00',290,'Asia/Magadan'),(291,'(GMT+11:00) Efate','+11:00',291,'Pacific/Efate'),(292,'(GMT+11:00) Guadalcanal','+11:00',292,'Pacific/Guadalcanal'),(293,'(GMT+11:00) Kosrae','+11:00',293,'Pacific/Kosrae'),(294,'(GMT+11:00) Noumea','+11:00',294,'Pacific/Noumea'),(295,'(GMT+11:00) Ponape','+11:00',295,'Pacific/Ponape'),(296,'(GMT+11:30) Norfolk','+11:30',296,'Pacific/Norfolk'),(297,'(GMT+12:00) Moscow+09 - Petropavlovsk-Kamchatskiy','+12:00',297,'Asia/Kamchatka'),(298,'(GMT+12:00) Auckland','+12:00',298,'Pacific/Auckland'),(299,'(GMT+12:00) Fiji','+12:00',299,'Pacific/Fiji'),(300,'(GMT+12:00) Funafuti','+12:00',300,'Pacific/Funafuti'),(301,'(GMT+12:00) Kwajalein','+12:00',301,'Pacific/Kwajalein'),(302,'(GMT+12:00) Majuro','+12:00',302,'Pacific/Majuro'),(303,'(GMT+12:00) Nauru','+12:00',303,'Pacific/Nauru'),(304,'(GMT+12:00) Tarawa','+12:00',304,'Pacific/Tarawa'),(305,'(GMT+12:00) Wake','+12:00',305,'Pacific/Wake'),(306,'(GMT+12:00) Wallis','+12:00',306,'Pacific/Wallis'),(307,'(GMT+13:00) Enderbury','+13:00',307,'Pacific/Enderbury'),(308,'(GMT+13:00) Tongatapu','+13:00',308,'Pacific/Tongatapu'),(309,'(GMT+14:00) Kiritimati','+14:00',309,'Pacific/Kiritimati');
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todotask`
--

DROP TABLE IF EXISTS `todotask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todotask` (
  `taskid` varchar(50) NOT NULL,
  `parentId` varchar(50) default NULL,
  `description` varchar(1024) default NULL,
  `taskorder` int(11) default NULL,
  `status` int(1) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `userid` varchar(50) NOT NULL,
  `grouptype` int(2) NOT NULL default '0' COMMENT 'grouptype is 0 default for individual 1 fro project ...',
  `assignedto` varchar(50) default NULL,
  `leafflag` bit(1) default NULL,
  `priority` varchar(10) default NULL,
  `taskname` varchar(512) NOT NULL,
  `duedate` datetime default '1970-01-01 00:00:00',
  `ischecklisttask` bit(1) NOT NULL default b'0',
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todotask`
--

LOCK TABLES `todotask` WRITE;
/*!40000 ALTER TABLE `todotask` DISABLE KEYS */;
/*!40000 ALTER TABLE `todotask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treenodes`
--

DROP TABLE IF EXISTS `treenodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treenodes` (
  `nodeid` varchar(64) NOT NULL,
  `courseid` varchar(64) NOT NULL,
  `iconcls` varchar(32) default NULL,
  `cls` varchar(32) default NULL,
  `nodetext` text,
  `pubdate` date default NULL,
  `expdate` date default NULL,
  `parentid` varchar(64) default NULL,
  `flag` int(11) default NULL,
  `description` varchar(64) default NULL,
  `needapprove` int(1) default NULL,
  `createdbyuserid` varchar(64) default NULL,
  `author` varchar(128) default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`nodeid`),
  KEY `courseid` (`courseid`),
  CONSTRAINT `treenodes_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treenodes`
--

LOCK TABLES `treenodes` WRITE;
/*!40000 ALTER TABLE `treenodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `treenodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uncheckedcalmap`
--

DROP TABLE IF EXISTS `uncheckedcalmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uncheckedcalmap` (
  `cid` varchar(36) NOT NULL default '',
  `userid` varchar(36) NOT NULL default '',
  KEY `uncheckedcalmap_ibfk_1` (`userid`),
  KEY `uncheckedcalmap_ibfk_2` (`cid`),
  CONSTRAINT `uncheckedcalmap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uncheckedcalmap_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `calendars` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uncheckedcalmap`
--

LOCK TABLES `uncheckedcalmap` WRITE;
/*!40000 ALTER TABLE `uncheckedcalmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `uncheckedcalmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitags`
--

DROP TABLE IF EXISTS `unitags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unitags` (
  `tagid` varchar(50) NOT NULL,
  `tagname` varchar(50) NOT NULL,
  PRIMARY KEY  (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitags`
--

LOCK TABLES `unitags` WRITE;
/*!40000 ALTER TABLE `unitags` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userForumPostFlag`
--

DROP TABLE IF EXISTS `userForumPostFlag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userForumPostFlag` (
  `post_id` varchar(50) character set utf8 NOT NULL,
  `userid` varchar(40) character set utf8 NOT NULL,
  `flag` tinyint(4) NOT NULL,
  KEY `fk45` (`userid`),
  CONSTRAINT `fk45` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userForumPostFlag`
--

LOCK TABLES `userForumPostFlag` WRITE;
/*!40000 ALTER TABLE `userForumPostFlag` DISABLE KEYS */;
/*!40000 ALTER TABLE `userForumPostFlag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userForumPostRead`
--

DROP TABLE IF EXISTS `userForumPostRead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userForumPostRead` (
  `post_id` varchar(50) character set utf8 NOT NULL,
  `userid` varchar(50) character set utf8 NOT NULL,
  `ifread` tinyint(4) NOT NULL,
  KEY `fk123` (`userid`),
  CONSTRAINT `fk123` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userForumPostRead`
--

LOCK TABLES `userForumPostRead` WRITE;
/*!40000 ALTER TABLE `userForumPostRead` DISABLE KEYS */;
/*!40000 ALTER TABLE `userForumPostRead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useralerts`
--

DROP TABLE IF EXISTS `useralerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useralerts` (
  `userid` varchar(50) default NULL,
  `alertid` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`alertid`),
  KEY `userid` (`userid`),
  CONSTRAINT `useralerts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useralerts`
--

LOCK TABLES `useralerts` WRITE;
/*!40000 ALTER TABLE `useralerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `useralerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userannouncements`
--

DROP TABLE IF EXISTS `userannouncements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userannouncements` (
  `userid` varchar(50) NOT NULL,
  `announceid` int(11) NOT NULL,
  `companyid` varchar(50) NOT NULL,
  KEY `userid` (`userid`),
  KEY `userannouncements_ibfk_1` (`announceid`),
  KEY `userannouncements_ibfk_2` (`companyid`),
  CONSTRAINT `userannouncements_ibfk_1` FOREIGN KEY (`announceid`) REFERENCES `announcements` (`announceid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userannouncements_ibfk_2` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userannouncements`
--

LOCK TABLES `userannouncements` WRITE;
/*!40000 ALTER TABLE `userannouncements` DISABLE KEYS */;
/*!40000 ALTER TABLE `userannouncements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfriendmapping`
--

DROP TABLE IF EXISTS `userfriendmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfriendmapping` (
  `userid` varchar(50) NOT NULL,
  `friendid` varchar(50) NOT NULL,
  KEY `userid` (`userid`),
  KEY `friendid` (`friendid`),
  CONSTRAINT `userfriendmapping_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userfriendmapping_ibfk_2` FOREIGN KEY (`friendid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfriendmapping`
--

LOCK TABLES `userfriendmapping` WRITE;
/*!40000 ALTER TABLE `userfriendmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `userfriendmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogin` (
  `userid` varchar(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL default '',
  `lastactivitydate` timestamp NOT NULL default '1990-01-01 00:30:00',
  `authkey` varchar(36) NOT NULL,
  `isactive` bit(1) NOT NULL default b'1',
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES ('8e94f4d8-e2d0-11e1-a6f4-001e58a79890','admin','c0b137fe2d792459f26ff763cce44574a5b5ab03','2012-08-14 11:53:30','','');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `userid` varchar(50) NOT NULL,
  `featureid` int(11) NOT NULL,
  `permissions` int(11) NOT NULL,
  KEY `featureid` (`featureid`),
  KEY `userpermissions_ibfk_2` (`userid`),
  CONSTRAINT `userpermissions_ibfk_1` FOREIGN KEY (`featureid`) REFERENCES `featurelist` (`featureid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userpermissions_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
INSERT INTO `userpermissions` VALUES ('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',1,6),('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',2,62),('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',3,62),('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',4,2),('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',5,6);
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_subactivity`
--

DROP TABLE IF EXISTS `userpermissions_subactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_subactivity` (
  `userid` varchar(50) NOT NULL,
  `featureid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `permissions` int(11) NOT NULL,
  KEY `userid_constraint` (`userid`),
  KEY `featureid_constraint` (`featureid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_subactivity`
--

LOCK TABLES `userpermissions_subactivity` WRITE;
/*!40000 ALTER TABLE `userpermissions_subactivity` DISABLE KEYS */;
INSERT INTO `userpermissions_subactivity` VALUES ('8e94f4d8-e2d0-11e1-a6f4-001e58a79890',2,5,2);
/*!40000 ALTER TABLE `userpermissions_subactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrelations`
--

DROP TABLE IF EXISTS `userrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrelations` (
  `userid1` varchar(50) NOT NULL,
  `userid2` varchar(50) NOT NULL,
  `relationid` int(11) default '0',
  KEY `userid1` (`userid1`),
  KEY `userid2` (`userid2`),
  CONSTRAINT `userrelations_ibfk_1` FOREIGN KEY (`userid1`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userrelations_ibfk_2` FOREIGN KEY (`userid2`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrelations`
--

LOCK TABLES `userrelations` WRITE;
/*!40000 ALTER TABLE `userrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `image` varchar(256) NOT NULL,
  `userid` varchar(36) NOT NULL,
  `fname` varchar(50) default '',
  `lname` varchar(50) default '',
  `roleid` int(11) default '0',
  `emailid` varchar(100) default NULL,
  `address` varchar(100) NOT NULL default '',
  `designation` varchar(15) default NULL,
  `contactno` varchar(15) NOT NULL default '',
  `aboutuser` text,
  `userstatus` text,
  `timezone` varchar(10) default NULL,
  `companyid` varchar(36) default NULL,
  `fax` varchar(20) NOT NULL default '',
  `altcontactno` varchar(15) default NULL,
  `phpbbid` int(11) default '1',
  `panno` varchar(16) default NULL,
  `ssnno` varchar(16) default NULL,
  `dateformat` int(11) NOT NULL default '15',
  `country` int(11) NOT NULL default '244',
  `notification` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`userid`),
  KEY `userid` (`userid`),
  KEY `companyid` (`companyid`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('','8e94f4d8-e2d0-11e1-a6f4-001e58a79890','admin','project',0,'demo@deskera.com','','','',NULL,'offline','236','8e94f514-e2d0-11e1-a6f4-001e58a79890','','',0,'','',18,244,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstatemap`
--

DROP TABLE IF EXISTS `userstatemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userstatemap` (
  `userid` varchar(36) NOT NULL,
  `projectid` varchar(36) NOT NULL,
  `featureid` int(11) NOT NULL,
  `state` varchar(1024) NOT NULL default '',
  `planview` varchar(5) NOT NULL default 'day',
  KEY `userid` (`userid`),
  KEY `projectid` (`projectid`),
  KEY `featureid` (`featureid`),
  CONSTRAINT `userstatemap_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userstatemap_ibfk_2` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userstatemap_ibfk_3` FOREIGN KEY (`featureid`) REFERENCES `featureslist` (`featureid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatemap`
--

LOCK TABLES `userstatemap` WRITE;
/*!40000 ALTER TABLE `userstatemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `userstatemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertags`
--

DROP TABLE IF EXISTS `usertags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertags` (
  `userid` varchar(50) NOT NULL,
  `tagname` text,
  `tagid` varchar(50) NOT NULL,
  `groupid` varchar(10) default NULL,
  `pcid` varchar(50) default NULL,
  PRIMARY KEY  (`tagid`),
  KEY `userid` (`userid`),
  CONSTRAINT `usertags_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userlogin` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertags`
--

LOCK TABLES `usertags` WRITE;
/*!40000 ALTER TABLE `usertags` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgetmanagement`
--

DROP TABLE IF EXISTS `widgetmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgetmanagement` (
  `userid` varchar(50) NOT NULL,
  `widgetstate` varchar(2048) NOT NULL,
  `helpflag` bit(1) NOT NULL,
  `customwidget` bit(1) NOT NULL default b'0',
  KEY `widgetmanagement_ibfk_1` (`userid`),
  CONSTRAINT `widgetmanagement_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgetmanagement`
--

LOCK TABLES `widgetmanagement` WRITE;
/*!40000 ALTER TABLE `widgetmanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgetmanagement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-16 15:33:11
