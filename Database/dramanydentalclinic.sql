-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2019 at 03:56 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dramanydentalclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `AddressID` int(10) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) NOT NULL,
  `ParentID` int(10) NOT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `Address`, `ParentID`) VALUES
(1, 'Egypt', 1),
(2, 'KSA', 2),
(3, 'Italy', 3);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `DocID` int(10) NOT NULL AUTO_INCREMENT,
  `Docname` varchar(30) NOT NULL,
  `Docphone` varchar(15) NOT NULL,
  `DocaddressID` int(5) NOT NULL,
  `Docbirthdate` date NOT NULL,
  `Docshifttime` varchar(20) NOT NULL,
  `DocjobtypeID` int(10) NOT NULL,
  `Docsalary` int(10) NOT NULL,
  PRIMARY KEY (`DocID`),
  KEY `DocaddressID_2` (`DocaddressID`),
  KEY `DocjobtypeID_2` (`DocjobtypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DocID`, `Docname`, `Docphone`, `DocaddressID`, `Docbirthdate`, `Docshifttime`, `DocjobtypeID`, `Docsalary`) VALUES
(1, 'ahmed', '01061436604', 1, '1999-06-24', 'night', 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `EmpID` int(10) NOT NULL AUTO_INCREMENT,
  `Empname` varchar(30) NOT NULL,
  `Empphone` varchar(15) NOT NULL,
  `EmpaddressID` int(5) NOT NULL,
  `Empbirthdate` date NOT NULL,
  `Empshifttime` varchar(20) NOT NULL,
  `EmpjobtypeID` int(10) NOT NULL,
  `Empsalary` int(10) NOT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `EmpaddressID_2` (`EmpaddressID`),
  KEY `EmpjobtypeID_2` (`EmpjobtypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobtype`
--

DROP TABLE IF EXISTS `jobtype`;
CREATE TABLE IF NOT EXISTS `jobtype` (
  `JobtypeID` int(10) NOT NULL AUTO_INCREMENT,
  `jobtypename` varchar(20) NOT NULL,
  PRIMARY KEY (`JobtypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobtype`
--

INSERT INTO `jobtype` (`JobtypeID`, `jobtypename`) VALUES
(1, 'surgery dentist'),
(2, 'Helper'),
(3, 'dentist');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `ManagerID` int(10) NOT NULL AUTO_INCREMENT,
  `Managername` varchar(30) NOT NULL,
  `Managerphone` varchar(15) NOT NULL,
  `ManageraddressID` int(5) NOT NULL,
  `Managerbirthdate` date NOT NULL,
  `Managershiftime` varchar(10) NOT NULL,
  `ManagerjobtypeID` int(10) NOT NULL,
  `Managersalary` int(10) NOT NULL,
  PRIMARY KEY (`ManagerID`),
  KEY `ManageraddressID_2` (`ManageraddressID`),
  KEY `ManagerjobtypeID_2` (`ManagerjobtypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ManagerID`, `Managername`, `Managerphone`, `ManageraddressID`, `Managerbirthdate`, `Managershiftime`, `ManagerjobtypeID`, `Managersalary`) VALUES
(1, 'simone', '2525', 3, '1997-08-27', 'morning', 2, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `medicalhistory`
--

DROP TABLE IF EXISTS `medicalhistory`;
CREATE TABLE IF NOT EXISTS `medicalhistory` (
  `MhistoryID` int(10) NOT NULL AUTO_INCREMENT,
  `DIagnosis` varchar(500) NOT NULL,
  `PatientID` int(20) NOT NULL,
  PRIMARY KEY (`MhistoryID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicalhistory`
--

INSERT INTO `medicalhistory` (`MhistoryID`, `DIagnosis`, `PatientID`) VALUES
(1, 'Tooth Decay', 1),
(2, 'Tooth Removal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `PatID` int(10) NOT NULL AUTO_INCREMENT,
  `Patname` varchar(30) NOT NULL,
  `Patphone` int(15) NOT NULL,
  `PataddressID` int(5) NOT NULL,
  `Patbirthdate` date NOT NULL,
  `Patbloodtype` varchar(3) NOT NULL,
  `PathealthcareID` int(20) NOT NULL,
  `PatlocalID` int(10) NOT NULL,
  PRIMARY KEY (`PatID`),
  KEY `PataddressID_2` (`PataddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatID`, `Patname`, `Patphone`, `PataddressID`, `Patbirthdate`, `Patbloodtype`, `PathealthcareID`, `PatlocalID`) VALUES
(1, 'khaled', 123456789, 1, '1999-06-10', 'A', 654321, 123456);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `UsertypeID` int(5) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UsertypeID_2` (`UsertypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `UsertypeID`) VALUES
(1, 'ahmed', '185917', 1),
(12, 'simone', '185919', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `UsertypeID` int(10) NOT NULL AUTO_INCREMENT,
  `Usertype` varchar(30) NOT NULL,
  PRIMARY KEY (`UsertypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UsertypeID`, `Usertype`) VALUES
(1, 'Doctor'),
(2, 'Manager'),
(3, 'employee');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ParentID`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`DocjobtypeID`) REFERENCES `jobtype` (`JobtypeID`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`DocaddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`EmpjobtypeID`) REFERENCES `jobtype` (`JobtypeID`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`EmpaddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`ManagerjobtypeID`) REFERENCES `jobtype` (`JobtypeID`),
  ADD CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`ManageraddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `medicalhistory`
--
ALTER TABLE `medicalhistory`
  ADD CONSTRAINT `fk_med` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatID`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`PataddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`UsertypeID`) REFERENCES `usertype` (`UsertypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
