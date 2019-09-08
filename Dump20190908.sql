-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: ra1.anystream.eu    Database: outdoor
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sso_id` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sso_id` (`sso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'tom','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','Sam','Smith','samy@xyz.com'),(2,'gio','$2a$10$u2sWKLNuljH/TtVAMxA1M.RlnQF59FKi3xxbcBRxUam0rM1uD2wz2','George','Ioannou','gvdrdt@gyfsgdyfg'),(3,'nat','$2a$10$N6orkYWTrzwSjiAj6BlwAuoFvkIWOXwOV0JQgFZ/VZCONAhJpzw6i','Natalia','K','gvdrdt@gyfsgdyfg'),(4,'adsad','$2a$10$T7meebbUYOFR2WAKFSC7J.HnWGO95UEXj7qsMUtF1kReJPTaWQ0Sm','hjf','fsesf','gvdrdt@gyfsgdyfg'),(6,'mark3','$2a$10$WlnBWjdBY73LMSEI5vdYr.4zYQRV5OkYxnQTiyeVhp.FH5zXfX6Wi','tony','stark','tonyavenger@hotmail.com'),(8,'root','$2a$10$1/YdCNmm3hqD4PAPRrndLOtpbI7ed23IpnKeocwmU1cGvkn7VLw86','testadmin','testadmin','gvdrdt@gyfsgdyfg'),(9,'mant','$2a$10$AP3/YUlfvK02a/VtlMHi3ebZ26NavnGJo/LisvlJyU3/YuFxKXY.i','Maria','Antoniou','mant@gyfsgdyfg'),(10,'bilbo','$2a$10$WvZk.iovESw25Rd.93f.NOLkMsigdvn5yRPU9vrTijyHtn1s2pBg2','el','pap','bilbo@bilbo.bil'),(11,NULL,NULL,'test','test','test@ueriy'),(12,'y','$2a$10$swMYndcsU4yHlQganmuIbOrmYB6mVRiQxa7fNwfx3ZJJgCWbOrdY2','testUser','testuser','sf@dgdr');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_user_profile`
--

DROP TABLE IF EXISTS `app_user_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `app_user_user_profile` (
  `user_id` bigint(20) NOT NULL,
  `user_profile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`user_profile_id`),
  KEY `FK_USER_PROFILE` (`user_profile_id`),
  CONSTRAINT `FK_APP_USER` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_user_profile`
--

LOCK TABLES `app_user_user_profile` WRITE;
/*!40000 ALTER TABLE `app_user_user_profile` DISABLE KEYS */;
INSERT INTO `app_user_user_profile` VALUES (2,1),(3,1),(4,1),(6,1),(9,1),(10,1),(12,1),(1,2),(8,2);
/*!40000 ALTER TABLE `app_user_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands` (
  `brands_id` int(11) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`brands_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'North Face'),(2,'Jack Wolfskin'),(3,'McKinley'),(4,'Alpha Kilo'),(5,'Black Diamond'),(6,'Compass'),(7,'Beal'),(8,'Care Plus'),(11,'Lifesystems');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Backpacks'),(2,'Tents'),(3,'Hicking-Climbing Accessories'),(4,'First-aid Kit');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `brands_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`products_id`),
  KEY `pr_fk` (`brands_id`),
  KEY `pr_fk2` (`category_id`),
  CONSTRAINT `pr_fk` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`brands_id`) ON DELETE CASCADE,
  CONSTRAINT `pr_fk2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (12,'NorthFace Backpack',300,'https://www.ems.com/on/demandware.static/-/Sites-vestis-master-catalog/default/dwbe9f85a4/product/images/2046/711/2046711/2046711_001_main.jpg','600D polyester toile, 500D nylon oxford slub, 420D nylon, 210D CorduraÂ® nylon ripstop, polyester jacquard camo',1,1),(20,'HUI LINGYANG 4 Person Easy Pop Up Tent-Automatic Setup',85,'https://images-na.ssl-images-amazon.com/images/I/61SlAOgknpL._SL1500_.jpg','Quick & Easy Setup: Instant pop-up tent with pre-assembled poles sets up in seconds.',3,2),(23,'Alpha Kilo 4000 Canvas 6 Person Bow Tent, camping tent ',276.77,'https://images-na.ssl-images-amazon.com/images/I/51kzcJkVqTL.jpg','Spend time open air, together with your circle of relatives at the campground or elk looking together with your pals, you will have to check out our 4 season, 6 individual tenting tent or clothing store tent which is easily fitted to publications, tenting, looking or fishing. ',4,2),(26,'McKINLEY Cougar 40L Backpack',128,'https://s7d2.scene7.com/is/image/atmosphere/331470470_05_a?bgColor=0,0,0,0&fmt=png-alpha&hei=528&resMode=sharp&qlt=85,1&op_sharpen=1','McKINLEYÃ¢??s Cougar is a great, durable backpack for single day or extended hikes. The ergonomic VENT 2.0 back net ensures excellent breathability. With its top lid pocket, bottle holder, trekking pole fixation and integrated rain cover, all your gear is perfectly organized and protected on the trail or in the backcountry.',3,1),(27,'The North Face Alpine Guide 2 Tent',449.99,'https://cdn.shopify.com/s/files/1/1531/7977/products/alpine_2.JPG?v=1559324413','Easy-to-pitch design lets you spend more time hiking and hanging out at the campsite and less time setting up your tent\r\nFront of the tent features highly breathable double-wall construction with dual top vents to boost airflow; back of the tent has lightweight waterproof, breathable material\r\nLarge front vestibule houses all of your gear, so you dont have to worry about rolling over onto your pack',1,2),(29,'ROUTER TRANSIT BACKPACK',150,'https://images.thenorthface.com/is/image/TheNorthFace/NF0A3KXK_GFH_hero?$638x745$','Our largest backpack at 41 liters, the durable Router Transit hauls more gear then ever while remaining travel-friendly during local commutes and weekend excursions. The lay-flat laptop compartment navigates security checkpoints with ease, and multiple fleece-lined pockets separate your tablet and smaller personal items.',1,1),(30,'Sterling Endurance Trekking Poles/Collapsible to 13 1/2\" / Hiking Poles Walking Sticks (Buy 1 Pole o',37.8,'https://images-na.ssl-images-amazon.com/images/I/61V7UTWRMTL._SL1500_.jpg','FOLDABLE â?? Collapses to 13 Â½ â?? to fit in your backpack or your carry-on bag. When not in use, store the poles in the free included cloth storage bag. These compact poles are perfect to take on backpacking trips, snowshoeing expeditions and all of your vacation adventures. Our poles have been used on every continent, even Antarctica.\r\nBUILT TO LAST - Made of a special T6 alloy of 7075 aluminum. The T6 alloy combines a number of metals including zinc and magnesium that give it lightweight, extreme durability and strength comparable to some steels.',6,3),(33,'Beal Jammy Ραμμένο Κορδονέτο 35cm',11.3,'https://www.cdc.gr/images/detailed/64/beal_jammy_35cm__83978.1557183897.jpg','5.5 mm sewn rope sling made with an aramid core and polyamide sheath. When configured as a prusik it can be used with single or half rope, on one or both half ropes.',7,3),(34,'Beal Flat Slings 30mm Army Green / 175cm',12.4,'https://www.cdc.gr/images/thumbnails/350/350/detailed/10/31615_S_AN_PLAT30.jpg','Minimum breaking load of 2200 kg, stronger than that of a tape knot.',7,3),(35,'Black Diamond Hoodwire Quickpack',111.5,'https://www.cdc.gr/images/detailed/52/381107_GRAY_HoodWire_Quickpack_12_cm_web.jpg',' This lightweight, unique design makes for hassle-free, snag-free clipping and cleaning, plus it won\'t freeze up in alpine conditions or suffer from gate whiplash.',5,3),(36,'Compass Σφυρίχτρα Προσκοπική',2.5,'https://www.cdc.gr/images/thumbnails/350/350/detailed/25/02134805078750599f63826f2.jpg','Compass Σφυρίχτρα Προσκοπική',6,3),(48,'Lifesystems Survival Whistle',8.8,'https://www.cdc.gr/images/detailed/32/2245-Survival-Whistle.jpg','The Survival Whistle is tough, lightweight and capable of producing a 122dB sound. It is the most powerful whistle in the world.',11,3),(49,'Care Plus EMERGENCY BLANKET / Κουβέρτα Επιβίωσης',4,'https://www.cdc.gr/images/detailed/52/38221-Emergency-blanket.jpg',' Η κουβέρτα αυτή δεν αφήνει την θερμοκρασία του σώματος να βγεί προς τα έξω, αλλά την αντανακλά ξανά στο σώμα, με αποτέλεσμα το σώμα να διατηρείται ζεστό.',8,4),(50,'Care Plus WATER FILTER / Φιλτρο Νερού',35.1,'https://www.cdc.gr/images/detailed/52/water_filter.png','H Careplus παρουσίασε στους λάτρεις του Outdoor το καινούργιο Αμερικανικής κατασκευής φίλτρο νερού, τελευταίας τεχνολογίας που χαρακτηρίζεται ως το τελειότερο της νέας εποχής.',8,4),(51,'HIGHLAND TRAIL XT 50',199.95,'https://exxpozed-image.de/exxpozed-res.cloudinary.com/image/upload/q_auto:eco,w_550,h_550,c_pad,b_white,d_ph.gif,e_sharpen/catalog/jack-wolfskin-highland-trail-xt-50-14a-jaw-2003021-classic-blue-1.jpg','Heading out for a few days hiking in the back country? If long, multi-day hikes are your way of unwinding, the HIGHLAND TRAIL XT 50, the second largest pack in the HIGHLAND series, is highly recommended. ',2,1),(52,'Jack Wolfskin Moab Jam Hiking Hydration Backpack',50.92,'https://images-na.ssl-images-amazon.com/images/I/71-kKWPfwqL._SL1500_.jpg','Flexible, full-contact air control system with a close fit and active ventilation for hiking.',2,1),(53,'Jack Wolfskin Travel Lodge FR Luxury',1095.95,'https://images-na.ssl-images-amazon.com/images/I/61iMilhdg1L._SL1500_.jpg','Family tent/ 5 to 7 persons/ 3 cabins with Variable configuration options/ comfortable standing room/ front can be rigged to form a Sun porch',2,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_date` date DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  `app_user_id` bigint(20) NOT NULL,
  `total` double DEFAULT NULL,
  `shipping_address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `sl_fk1` (`products_id`),
  KEY `fk_sales` (`app_user_id`),
  CONSTRAINT `fk_sales` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `sl_fk1` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2019-03-17',23,1,10,'Ανθέων 12, 15125'),(2,'2019-03-17',12,2,2,'25ης Μαρτιου 3, 15232'),(3,'2019-03-17',20,2,5,'Αγίας Παρασκευής 5, 15234'),(4,'2019-07-31',23,2,830,'Αγίου Γεωργίου 12, 15234'),(5,'2019-08-02',26,2,128,'Αγρινίου 15, 15232'),(22,'2019-08-03',30,2,75.6,'Petralona, 11852'),(23,'2019-08-04',30,2,75.6,'Petralona, 11852'),(24,'2019-08-04',51,10,199.95,'Petralona, 11852');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `st_fk` (`products_id`),
  CONSTRAINT `st_fk` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (21,98,23),(24,20,12),(25,18,20),(27,50,29),(28,481,30),(29,4,27),(32,18,26),(33,23,33),(34,30,34),(35,24,35),(36,12,36),(37,10,48),(38,17,49),(39,20,50),(40,24,51),(41,18,52),(42,19,53);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (2,'ADMIN'),(1,'USER');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-08 17:27:07
