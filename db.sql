-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for express_spring
CREATE DATABASE IF NOT EXISTS `express_spring` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `express_spring`;

-- Dumping structure for table express_spring.blog
CREATE TABLE IF NOT EXISTS `blog` (
  `blogId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '0',
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `dateAdded` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`blogId`),
  KEY `FK_blog_user` (`userId`),
  CONSTRAINT `FK_blog_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.blog: ~4 rows (approximately)
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`blogId`, `title`, `userId`, `content`, `dateAdded`) VALUES
	(1, 'Update Visual  Studio 2019', 2, '<p>Don\'t forget to update your Visual Studio 2019. More features added.</p>', '2021-03-26 19:54:39'),
	(2, 'Softwears on sale !', 1, '<p>Lots of softwares on sale this weekend at bestbuy and walmart.</p>', '2021-03-26 19:53:36'),
	(3, 'Online coding workshop', 8, '<p>Free online c# coding workship starting April 10th. Visist the website for more info.</p>', '2021-03-26 19:58:08'),
	(4, 'Scan your computer often', 2, '<p>Please take time to scan your computer once a week.</p>', '2021-03-26 20:21:06');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- Dumping structure for table express_spring.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `menuID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `cssID` varchar(12) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menuID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.menu: ~2 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menuID`, `name`, `cssID`, `dateModified`) VALUES
	(1, 'main', 'main', '2021-03-23 18:50:23'),
	(2, 'footer', 'footer', '2021-03-26 18:00:19');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table express_spring.menuitem
CREATE TABLE IF NOT EXISTS `menuitem` (
  `menuItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuID` int(10) unsigned NOT NULL,
  `html` text NOT NULL,
  `link` varchar(32) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`menuItemID`),
  KEY `menuID` (`menuID`),
  CONSTRAINT `FK_menuitem_menu` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.menuitem: ~4 rows (approximately)
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` (`menuItemID`, `menuID`, `html`, `link`, `dateModified`) VALUES
	(1, 1, 'Home', 'home', '2021-03-26 19:17:12'),
	(2, 1, 'Contact Us', 'contact', '2021-03-15 12:09:53'),
	(3, 1, 'Blog', 'blog\r\n', '2021-03-26 19:46:19'),
	(4, 1, 'Login', 'login', '2021-03-26 20:36:25');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;

-- Dumping structure for table express_spring.page
CREATE TABLE IF NOT EXISTS `page` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `pageKey` varchar(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `lastUserID` int(10) unsigned NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pageID`),
  UNIQUE KEY `pageKey` (`pageKey`),
  KEY `FK_page_user` (`lastUserID`),
  CONSTRAINT `FK_page_user` FOREIGN KEY (`lastUserID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.page: ~4 rows (approximately)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`pageID`, `pageKey`, `title`, `content`, `lastUserID`, `dateModified`) VALUES
	(1, 'Home', 'Home', '<p class="content">The phases of software application development:<hr>\r\n --- Requirements analysis<hr>\r\n---  Design<hr>\r\n---  Implementation<hr>\r\n---  Testing<hr>\r\n---  Release<hr>\r\n---  Maintenance<hr>\r\n---  Upgrade<hr>\r\n</p>', 1, '2021-03-26 21:24:14'),
	(2, 'contact', 'Have questions?', '<p>Please contact us by email: <a href="mailto: help@gamil.com">help@gmail.com</a> or by phone at 1-000-000-0000<hr>\r\n--- software installation<hr>\r\n--- software update<hr>\r\n--- software design<hr>\r\n--- hardware setup<hr>\r\n--- hardware maintainnance<hr>\r\n</p>', 8, '2021-03-26 19:35:54'),
	(3, 'blog', 'blog', '<p>Now there are two pages of posts in this blog.</p>', 1, '2021-03-26 21:34:30'),
	(4, 'login', 'login', '<form id="login" action="{{page.pageKey}}" method="POST" enctype="application/x-www-form-urlencoded">\r\n    <div>\r\n        <label for="user">User:</label>\r\n        <input name="user" id="user" type="text" />\r\n    </div>\r\n    <div>\r\n        <label for="pass">Password:</label>\r\n        <input name="pass" id="pass" type="password" />\r\n    </div>\r\n    <input type="submit" name="action" value="login" />\r\n</form>', 8, '2021-03-26 20:38:48');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;

-- Dumping structure for table express_spring.user
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `passHash` varchar(256) NOT NULL,
  `cookieHash` varchar(256) NOT NULL,
  `dateModified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table express_spring.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userID`, `username`, `passHash`, `cookieHash`, `dateModified`) VALUES
	(1, 'we', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 'Yf81+XZHvmkcyKuXmK4fntn/rp5fZp8uBjQ3nqRtH0s=', '2021-03-26 19:54:07'),
	(2, 'you', '550bd0e77e819081c9aa89043382aee9cb341730', '89553c275a3c947762ec7354d19b04eecb41e71c', '2021-03-26 19:54:15'),
	(8, 'they', 'zM9S89A8UHLuZKE290/FayfgTxX/5dHSd9WKsY2Usyc=', 'CWi8YE4eQaGFSSsc8hiONOz4ecViXr/NFMKGpNcKF60=', '2021-03-26 19:54:19'),
	(9, 'admin', 'admin', 'superadmin', '2021-03-26 21:36:59');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
