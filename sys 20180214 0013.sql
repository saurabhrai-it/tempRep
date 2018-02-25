-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema security
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ security;
USE security;

--
-- Table structure for table `security`.`admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` varchar(50) NOT NULL DEFAULT '',
  `superAdminId` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`,`superAdminId`) VALUES 
 ('AAka27410','ASau23650'),
 ('ARah63210','ASau23650'),
 ('ASau23650','Saurabh Rai');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Table structure for table `security`.`attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `inTime` bigint(13) unsigned NOT NULL,
  `outTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `totalTime` bigint(13) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`inTime`,`outTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`attendance`
--

/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` (`id`,`inTime`,`outTime`,`totalTime`) VALUES 
 ('SSau22222',1519481252462,1519489003323,25096),
 ('SSau22222',1519481590142,1519489003323,25096),
 ('SSau22222',1519488978227,1519489003323,25096),
 ('SSau22222',1519489627525,1519489638892,11367),
 ('SSau22222',1519533048423,1519568160521,1519568160521),
 ('SSau22222',1519573854167,1519574633002,778835),
 ('SSau22222',1519574656906,1519574781954,125048),
 ('SSau22222',1519574797323,1519575155547,358224),
 ('SSau22222',1519576000131,1519576175748,175617),
 ('SSau22222',1519576210364,1519576468221,257857);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;


--
-- Table structure for table `security`.`client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `clientId` varchar(50) NOT NULL DEFAULT '',
  `amount` varchar(45) NOT NULL DEFAULT '',
  `expiryDate` date NOT NULL DEFAULT '0000-00-00',
  `society` varchar(45) NOT NULL DEFAULT '',
  `joinDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`clientId`,`amount`,`expiryDate`,`society`,`joinDate`) VALUES 
 ('CSau11112','3000','2194-12-10','Ajnara','1994-10-12');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


--
-- Table structure for table `security`.`details`
--

DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `sex` varchar(10) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `id` varchar(45) NOT NULL DEFAULT '',
  `doc` varchar(500) NOT NULL DEFAULT '',
  `mailId` varchar(50) NOT NULL DEFAULT 'noMailId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`details`
--

/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` (`name`,`sex`,`mobile`,`id`,`doc`,`mailId`) VALUES 
 ('Akash Singh','male','9638527410','AAka27410','No Doc for now','akash.it@hotmail.com'),
 ('Rahul Kumar','male','9874563210','ARah63210','No Doc for now','rahul@erer.com'),
 ('Saurabh Rai','male','9874123650','ASau23650','No Doc for now','saurabhrai.it@hotmail.com'),
 ('Saurabh Client','male','9716313131','CSau11112','No Doc','atram@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33331','No Doc','atram1@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33332','No Doc','atram1@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33333','No Doc','atram1@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33334','No Doc','atram1@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33335','No Doc','atram1@patram.com'),
 ('Saurabh Guard','male','9116313131','GSau33336','No Doc','atram1@patram.com'),
 ('Saurabh Supervisor','male','9116111131','SSau22222','No Doc','atram1@patram.com');
/*!40000 ALTER TABLE `details` ENABLE KEYS */;


--
-- Table structure for table `security`.`guards`
--

DROP TABLE IF EXISTS `guards`;
CREATE TABLE `guards` (
  `guardId` varchar(50) NOT NULL DEFAULT '',
  `supId` varchar(45) NOT NULL DEFAULT '',
  `tower` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`guardId`),
  KEY `supId` (`supId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`guards`
--

/*!40000 ALTER TABLE `guards` DISABLE KEYS */;
INSERT INTO `guards` (`guardId`,`supId`,`tower`) VALUES 
 ('GSau33331','SSau22222','T1'),
 ('GSau33332','SSau22222','T1'),
 ('GSau33333','SSau22222','T2'),
 ('GSau33334','SSau22222','T3'),
 ('GSau33335','SSau22222','T3'),
 ('GSau33336','SSau22222','T3');
/*!40000 ALTER TABLE `guards` ENABLE KEYS */;


--
-- Table structure for table `security`.`login_info`
--

DROP TABLE IF EXISTS `login_info`;
CREATE TABLE `login_info` (
  `uid` varchar(50) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(45) NOT NULL DEFAULT 'gaurd',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`login_info`
--

/*!40000 ALTER TABLE `login_info` DISABLE KEYS */;
INSERT INTO `login_info` (`uid`,`pass`,`type`) VALUES 
 ('','','admin'),
 ('AAka27410','agile','admin'),
 ('ARah63210','agile','admin'),
 ('ASau23650','agile','admin'),
 ('SSau22222','qwerty','supervisor');
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;


--
-- Table structure for table `security`.`supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE `supervisor` (
  `supId` varchar(50) NOT NULL DEFAULT '',
  `clientId` varchar(50) NOT NULL DEFAULT '',
  `tower` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`supId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`supervisor`
--

/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` (`supId`,`clientId`,`tower`) VALUES 
 ('SSau22222','CSau11112','T1');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;


--
-- Procedure `security`.`addAdmin`
--

DROP PROCEDURE IF EXISTS `addAdmin`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addAdmin`(in name varchar(50), in sex varchar(45),in doc varchar(500), in mob varchar(50), in mailId varchar(50), in pass varchar(50), in superId varchar(50),out m varchar(100))
BEGIN

   declare uid varchar(9);

   declare nm varchar(3);

   declare mo varchar(5);

   declare continue handler for 1062

      set m='Already registered';

   set m='Successfully inserted the record';

   select LEFT(name,3) into nm;

   select RIGHT(mob,5) into mo;

   set uid=concat('A',nm,mo);

   insert into details values(name, sex, mob, uid, doc, mailId);

   insert into login_info values(uid,pass,"admin");

   insert into admin values(uid,superId);

   commit;
END $$

DELIMITER ;

--
-- Procedure `security`.`addAttendance`
--

DROP PROCEDURE IF EXISTS `addAttendance`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addAttendance`(in uid varchar(45), in inTime1 bigint(13), in outTime1 bigint(13), out m varchar(100))
BEGIN
      declare timeDiff bigint(13);
      declare inTime2 bigint(13);
      declare continue handler for 1329
       set m = 'invalid1';
     declare continue handler for 1062
       set m = 'invalid2';
     if outTime1 = 0 then
         insert into attendance values(uid,inTime1,outTime1,0);
         set m = 'Done1';         
     else
         select inTime into inTime2 from attendance where id=uid and outTime=0;
         set timeDiff = outTime1 - inTime2;
         update attendance set outTime=outTime1, totalTime=timeDiff where id=uid and outTime=0;
         set m = 'Done2';
     end if;
END $$

DELIMITER ;

--
-- Procedure `security`.`checkId`
--

DROP PROCEDURE IF EXISTS `checkId`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkId`(in u varchar(50), in p varchar(50), out m varchar(50))
BEGIN
    declare continue handler for 1329
      set m = 'Invalid';
    select name into m from details where id=(select uid from login_info where uid=u and binary pass=p);
END $$

DELIMITER ;

--
-- Procedure `security`.`checkInTimePresent`
--

DROP PROCEDURE IF EXISTS `checkInTimePresent`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkInTimePresent`(in userId varchar(50), out msg varchar(100))
BEGIN
      declare continue handler for 1329
       set msg = 'invalid';
      select inTime into msg from attendance where id=userId and outTime=0;
END $$

DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
