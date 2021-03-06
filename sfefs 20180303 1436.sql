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
 ('GSau33331',1519586392598,1519586466134,73536),
 ('GSau33331',1519650429593,1519659084518,8654925),
 ('GSau33331',1519667539358,1519667547550,8192),
 ('GSau33331',1519667697733,1519674788136,7090403),
 ('GSau33331',1519709179033,1519814459084,105280051),
 ('GSau33331',1520047550142,1520053339438,5789296),
 ('GSau33332',1519586393308,1519586466820,73512),
 ('GSau33332',1519650430771,1519659086606,8655835),
 ('GSau33332',1519673752199,1519674783368,1031169),
 ('GSau33332',1519709192648,1519814461308,105268660),
 ('GSau33332',1520047553798,1520053345807,5792009),
 ('GSau33333',1519586393949,1519586467469,73520),
 ('GSau33333',1519650431667,1519659093245,8661578),
 ('GSau33333',1519709194800,1519814464396,105269596),
 ('GSau33333',1520047558229,1520053348375,5790146),
 ('GSau33334',1519586394869,1519586468197,73328),
 ('GSau33334',1519650432321,1519659090454,8658133),
 ('GSau33334',1519709197088,1519814467300,105270212),
 ('GSau33334',1520047563694,1520053353926,5790232);
INSERT INTO `attendance` (`id`,`inTime`,`outTime`,`totalTime`) VALUES 
 ('GSau33335',1519586395756,1519586468988,73232),
 ('GSau33335',1519650433104,1519659089502,8656398),
 ('GSau33335',1519667606693,1519674779128,7172435),
 ('GSau33335',1519709199696,1519814469853,105270157),
 ('GSau33335',1520047566454,1520053356094,5789640),
 ('GSau33336',1519586397045,1519586470108,73063),
 ('GSau33336',1519650433817,1519659088798,8654981),
 ('GSau33336',1519667573206,1519673453287,5880081),
 ('GSau33336',1519709202617,1519814472483,105269866),
 ('GSau33336',1520047569662,1520053357983,5788321),
 ('SSau22222',1519489627525,1519489638892,11367),
 ('SSau22222',1519573854167,1519574633002,778835),
 ('SSau22222',1519574656906,1519574781954,125048),
 ('SSau22222',1519574797323,1519575155547,358224),
 ('SSau22222',1519576000131,1519576175748,175617),
 ('SSau22222',1519576210364,1519576468221,257857),
 ('SSau22222',1519586424637,1519586488365,63728),
 ('SSau22222',1519650428296,1519659083222,8654926),
 ('SSau22222',1519659685791,1519666764683,7078892),
 ('SSau22222',1519667190133,1519667447533,257400);
INSERT INTO `attendance` (`id`,`inTime`,`outTime`,`totalTime`) VALUES 
 ('SSau22222',1519667614790,1519670810922,3196132),
 ('SSau22222',1519670833625,1519673735798,2902173),
 ('SSau22222',1519709206112,1519814454437,105248325),
 ('SSau22222',1520047543142,1520053337279,5794137);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;


--
-- Table structure for table `security`.`client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `clientId` varchar(50) NOT NULL DEFAULT '',
  `amount` varchar(45) NOT NULL DEFAULT '',
  `expiryDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  `society` varchar(45) NOT NULL DEFAULT '',
  `joinDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  `towerNum` int(10) unsigned NOT NULL DEFAULT '0',
  `guardReq` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`clientId`,`amount`,`expiryDate`,`society`,`joinDate`,`towerNum`,`guardReq`) VALUES 
 ('CSau11111','3000',1520066560000,'Ajnara',1519586392598,10,20);
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
 ('Saurabh Client','male','9716313131','CSau11111','No Doc','atram@patram.com'),
 ('akash guard wala','male','9874563201','GSau30000','afe ','q3rwqs@w2.wef'),
 ('Saurabh Guard1','male','9116313131','GSau33331','No Doc','atram1@patram.com'),
 ('Saurabh Guard2','male','9116313131','GSau33332','No Doc','atram1@patram.com'),
 ('Saurabh Guard3','male','9116313131','GSau33333','No Doc','atram1@patram.com'),
 ('Saurabh Guard4','male','9116313131','GSau33334','No Doc','atram1@patram.com'),
 ('5 saurabh','male','9116313131','GSau33335','No Doc','atram1@patram.com'),
 ('Saurabh naukar malik ka','male','9116313131','GSau33336','No Doc','atram1@patram.com'),
 ('sarah guard1','male','9638527413','GSau33337','No Doc for now2','aka2345sh.it@hotmail.com'),
 ('safrah gua','female','9876543210','GSau33338','fds','sdf@fds.dfgd');
INSERT INTO `details` (`name`,`sex`,`mobile`,`id`,`doc`,`mailId`) VALUES 
 ('Saurabh Supervisor','male','9116111131','SSau22222','No Doc','atram1@patram.com'),
 ('sau sup 2','male','9116345677','SSau22223','docu','1@2.3');
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
 ('GSau30000','SSau22223','T1'),
 ('GSau33331','SSau22222','T1'),
 ('GSau33332','SSau22222','T1'),
 ('GSau33333','SSau22222','T2'),
 ('GSau33334','SSau22222','T3'),
 ('GSau33335','SSau22222','T3'),
 ('GSau33336','SSau22222','T8'),
 ('GSau33337','SSau22223','T4'),
 ('GSau33338','SSau22223','T5');
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
 ('AAka27410','agile','admin'),
 ('ARah63210','agile','admin'),
 ('ASau23650','agile','admin'),
 ('CSau11111','qwerty','client'),
 ('SSau22222','qwerty','supervisor');
/*!40000 ALTER TABLE `login_info` ENABLE KEYS */;


--
-- Table structure for table `security`.`supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE `supervisor` (
  `supId` varchar(50) NOT NULL DEFAULT '',
  `clientId` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`supId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security`.`supervisor`
--

/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` (`supId`,`clientId`) VALUES 
 ('SSau22222','CSau11111'),
 ('SSau22223','CSau11111');
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

--
-- Procedure `security`.`getAttendance`
--

DROP PROCEDURE IF EXISTS `getAttendance`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAttendance`(in uid varchar(50), in inBound bigint(13), in outBound bigint(13))
BEGIN
    select inTime, outTime, totalTime FROM attendance where id = uid and inTime > inBound and inTime < outBound;
END $$

DELIMITER ;

--
-- Procedure `security`.`getClientData`
--

DROP PROCEDURE IF EXISTS `getClientData`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientData`(in uid varchar(50))
BEGIN
     declare supNum int(10);
     declare guaNum int(10);
     declare totalNum int(10);
     select count(supId) into supNum from supervisor where clientId=uid;
     select count(guardId) into guaNum from guards where supId IN (select supId from supervisor where clientId=uid);
     select c.society, c.joinDate, c.expiryDate, c.amount,c.towerNum,c.guardReq, supNum+guaNum
     from client c where c.clientId = uid;
END $$

DELIMITER ;

--
-- Procedure `security`.`getDetails`
--

DROP PROCEDURE IF EXISTS `getDetails`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getDetails`(in uid varchar(50))
BEGIN
      select name, sex, mobile, doc, mailId from details where id=uid;
END $$

DELIMITER ;

--
-- Procedure `security`.`getGuardData`
--

DROP PROCEDURE IF EXISTS `getGuardData`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getGuardData`(in uid varchar(50))
BEGIN
     select d.name, g.guardId
     from  guards g, details d
     where g.guardId = d.id and g.supId=uid;

END $$

DELIMITER ;

--
-- Procedure `security`.`getSupGuardID`
--

DROP PROCEDURE IF EXISTS `getSupGuardID`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSupGuardID`(in uid varchar(50))
BEGIN
  select distinct g.guardid,s.supId from supervisor s,guards g where s.clientId=uid and s.supId=g.supId;
END $$

DELIMITER ;

--
-- Procedure `security`.`getUserFromUid`
--

DROP PROCEDURE IF EXISTS `getUserFromUid`;
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserFromUid`(in uid varchar(50))
BEGIN
   select name FROM details where id=uid;
END $$

DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
