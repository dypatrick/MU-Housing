
-- MySQL Script generated by MySQL Workbench
-- Sun Dec  3 21:29:24 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`StudentInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StudentInfo` (
  `bannerNumber` INT NOT NULL,
  `levelID` INT NOT NULL,
  `majorID` INT NOT NULL,
  `advisorID` INT NOT NULL,
  `parkingLot` INT NOT NULL,
  `firstName` VARCHAR(20) NOT NULL,
  `lastName` VARCHAR(20) NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `postCode` INT NOT NULL,
  `phoneNumber` CHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `nationality` VARCHAR(11) NOT NULL,
  `specialNeeds` VARCHAR(3) NOT NULL,
  `comments` VARCHAR(45) NOT NULL,
  `status` VARCHAR(7) NOT NULL,
  `vin` CHAR(17) NOT NULL,
  `color` VARCHAR(6) NULL,
  `manufacturer` VARCHAR(10) NULL,
  `brand` VARCHAR(15) NULL,
  PRIMARY KEY (`bannerNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ParkingLot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ParkingLot` (
  `parkingLot` INT NOT NULL,
  `lotName` VARCHAR(10) NOT NULL,
  `address` VARCHAR(20) NULL,
  `maxSpace` INT NULL,
  `availability` VARCHAR(3) NULL,
  PRIMARY KEY (`parkingLot`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StudentLevel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StudentLevel` (
  `levelID` INT NOT NULL,
  `levelName` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`levelID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Major` (
  `majorID` INT NOT NULL,
  `majorName` VARCHAR(20) NULL,
  PRIMARY KEY (`majorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`NOK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`NOK` (
  `nokID` INT NOT NULL,
  `bannerNumber` INT NOT NULL,
  `firstName` VARCHAR(20) NULL,
  `lastName` VARCHAR(20) NULL,
  `street` VARCHAR(30) NULL,
  `city` VARCHAR(15) NULL,
  `phoneNumber` CHAR(10) NULL,
  `relationship` VARCHAR(12) NULL,
  PRIMARY KEY (`nokID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StudentCourse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StudentCourse` (
  `bannerNumber` INT NOT NULL,
  `courseNO` INT NOT NULL,
  `semester` VARCHAR(5) NULL,
  `year` INT NULL,
  `instructor` VARCHAR(40) NULL,
  `phoneNumber` CHAR(10) NULL,
  `email` VARCHAR(30) NULL,
  `roomNumber` VARCHAR(4) NULL,
  `deptName` VARCHAR(20) NULL,
  PRIMARY KEY (`bannerNumber`, `courseNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `courseNO` INT NOT NULL,
  `courseName` VARCHAR(25) NULL,
  PRIMARY KEY (`courseNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lease` (
  `leaseNO` INT NOT NULL,
  `bannerNumber` INT NOT NULL,
  `placeNO` INT NOT NULL,
  `numOfSemester` INT NOT NULL,
  `moveInDate` DATE NOT NULL,
  `moveOutDate` DATE NOT NULL,
  PRIMARY KEY (`leaseNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `invoiceNO` INT NOT NULL,
  `leaseNO` INT NOT NULL,
  `semester` VARCHAR(5) NULL,
  `payDue` DATE NOT NULL,
  `date` DATE NOT NULL,
  `paymentMethod` VARCHAR(11) NOT NULL,
  `dateOfFirstRem` DATE NULL,
  `dateOfSecondRem` DATE NULL,
  PRIMARY KEY (`invoiceNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `placeNO` INT NOT NULL,
  `flatNO` INT NULL,
  `hallNO` INT NULL,
  `roomNO` INT NULL,
  `rentRate` DECIMAL(13,2) NULL,
  PRIMARY KEY (`placeNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hall` (
  `hallNO` INT NOT NULL,
  `staffNO` INT NULL,
  `street` VARCHAR(30) NULL,
  `city` VARCHAR(15) NULL,
  `postCode` INT NULL,
  `hallName` VARCHAR(20) NULL,
  `phoneNumber` CHAR(10) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flat` (
  `flatNO` INT NOT NULL,
  `street` VARCHAR(30) NULL,
  `city` VARCHAR(15) NULL,
  `postCode` INT NULL,
  `numOfRooms` INT NULL,
  PRIMARY KEY (`flatNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `staffNO` INT NOT NULL,
  `firstName` VARCHAR(20) NULL,
  `lastName` VARCHAR(20) NULL,
  `email` VARCHAR(35) NULL,
  `street` VARCHAR(30) NULL,
  `city` VARCHAR(15) NULL,
  `postCode` INT NULL,
  `dateOfBirth` DATETIME(6) NULL,
  `gender` CHAR(1) NULL,
  `location` VARCHAR(13) NULL,
  `position` VARCHAR(15) NULL,
  PRIMARY KEY (`staffNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inspection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Inspection` (
  `inspcNO` INT NOT NULL,
  `staffNO` INT NULL,
  `flatNO` INT NULL,
  `dateOfInspc` DATE NULL,
  `satisfcCondition` VARCHAR(3) NULL,
  `comments` VARCHAR(45) NULL,
  PRIMARY KEY (`inspcNO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Advisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Advisor` (
  `advisorID` INT NOT NULL,
  `positionID` INT NULL,
  `deptNO` INT NULL,
  `firstName` VARCHAR(20) NULL,
  `lastName` VARCHAR(20) NULL,
  `phoneNumber` VARCHAR(10) NULL,
  `email` VARCHAR(30) NULL,
  `roomNumber` INT NULL,
  PRIMARY KEY (`advisorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `positionID` INT NOT NULL,
  `positionName` VARCHAR(20) NULL,
  PRIMARY KEY (`positionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `departmentNO` INT NOT NULL,
  `departmentName` VARCHAR(20) NULL,
  PRIMARY KEY (`departmentNO`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`StudentInfo`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555011, 0001, 0381, 901999999, 1, 'Antonio', 'Brown', '127 N Sparks St', 'State College', 16801, '8145555551', 'Brown@marshall.edu', '1996-12-17', 'M', 'Asian', 'Yes', 'Therapy Animal', 'Placed', '00000000000000010', 'Black', 'GMC', 'Envoy');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555002, 0006, 0385, 901999992, 2, 'David', 'DeCastro', '17 Hilltop Ave', 'Morgantown', 26501, '3041111111', 'DeCastro@marshall.edu', '1998-02-23', 'M', 'Caucasian', 'Yes', 'Gluten Free Diet', 'Placed', '00000000000000001', 'Blue', 'Toyota', 'Corolla');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555003, 0004, 0389, 901999994, 3, 'LeVeon', 'Bell', '21 Jump St', 'Morgantown', 26501, '3041111112', 'Bell@marshall.edu', '1999-09-07', 'F', 'Asian', 'Yes', 'See Medical Notes', 'Placed', '00000000000000002', 'Blue', 'Subaru', 'Forrester');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555004, 0003, 0388, 901999999, 4, 'James', 'Harrison', '34 Huffley St', 'Penn Hills', 15235, '4125555555', 'Harrison@marshall.edu', '1996-04-08', 'M', 'A American', 'No', 'None', 'Placed', '00000000000000003', 'Gray', 'Chrysler', 'Pacifica');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555005, 0002, 0385, 901999991, 5, 'Ryan', 'Shazier', '3346 Bel Aire Dr', 'Murrysville', 15668, '7245555555', 'Shazier@marshall.edu', '1997-07-14', 'M', 'Caucasian', 'No', 'None', 'Placed', '00000000000000004', 'Green', 'Pontiac', 'Azteca');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555006, 0001, 0381, 901999993, 1, 'Chris', 'Boswell', '8902 Universal Rd', 'Hurricane', 25526, '3041111113', 'Boswell@marshall.edu', '1985-05-31', 'F', 'Uzbekistani ', 'No', 'None', 'Placed', '00000000000000005', 'Black', 'Toyota', 'Camry');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555007, 0005, 0380, 901999994, 2, 'TJ', 'Watt', '4401 Huffington Alley', 'Morgantown', 26501, '3041111114', 'Watt@marshall.edu', '1999-06-10', 'F', 'Caucasian', 'Yes', 'Therapy Animal', 'Placed', '00000000000000006', 'White', 'GMC', 'Envoy');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555008, 0003, 0383, 901999998, 3, 'Cameron', 'Heyward', '3 Meadow Gate Dr', 'Pittsburgh', 15237, '4125555556', 'Heyward@marshall.edu', '1997-07-06', 'M', 'A American', 'No', 'None', 'Placed', '00000000000000007', 'Gold', 'Ford', 'Explorer');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555009, 0002, 0383, 901999997, 4, 'Tom', 'Maddox', '112 Lang Ave', 'Barboursville', 25504, '3041111115', 'Maddox@marshall.edu', '1999-04-12', 'M', 'Caucasian', 'No', 'Needs placed', 'Waiting', '00000000000000008', 'Gray', 'Mercury', 'Milan');
INSERT INTO `mydb`.`StudentInfo` (`bannerNumber`, `levelID`, `majorID`, `advisorID`, `parkingLot`, `firstName`, `lastName`, `street`, `city`, `postCode`, `phoneNumber`, `email`, `dateOfBirth`, `gender`, `nationality`, `specialNeeds`, `comments`, `status`, `vin`, `color`, `manufacturer`, `brand`) VALUES (901555101, 0005, 0387, 901999996, 5, 'Landry', 'Jones', '34 Ogely Ave', 'Pittsburgh', 15237, '4125555557', 'Jones@marshall.edu', '1992-07-22', 'F', 'Caucasian', 'No', 'Needs placed', 'Waiting', '00000000000000009', 'Red', 'Ford', 'Explorer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ParkingLot`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ParkingLot` (`parkingLot`, `lotName`, `address`, `maxSpace`, `availability`) VALUES (1, 'North', '17 College Ave', 250, 'No');
INSERT INTO `mydb`.`ParkingLot` (`parkingLot`, `lotName`, `address`, `maxSpace`, `availability`) VALUES (2, 'South', '11 First ave', 250, 'Yes');
INSERT INTO `mydb`.`ParkingLot` (`parkingLot`, `lotName`, `address`, `maxSpace`, `availability`) VALUES (3, 'East', '33 Hal Greer Blvd', 400, 'Yes');
INSERT INTO `mydb`.`ParkingLot` (`parkingLot`, `lotName`, `address`, `maxSpace`, `availability`) VALUES (4, 'West', '11 West Univ Ave', 300, 'No');
INSERT INTO `mydb`.`ParkingLot` (`parkingLot`, `lotName`, `address`, `maxSpace`, `availability`) VALUES (5, 'Center', '22 Freemont Ave', 150, 'No');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`StudentLevel`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0001, 'Freshman');
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0002, 'Sophomore');
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0003, 'Junior');
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0004, 'Senior');
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0005, 'Graduate');
INSERT INTO `mydb`.`StudentLevel` (`levelID`, `levelName`) VALUES (0006, 'Medical');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Major`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0380, 'Mathematics');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0381, 'Mech Eng');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0382, 'Chemistry');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0383, 'Business');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0384, 'Biology');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0385, 'Geology');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0386, 'Psychology');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0387, 'Sociology');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0388, 'Physics');
INSERT INTO `mydb`.`Major` (`majorID`, `majorName`) VALUES (0389, 'Communications');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`NOK`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666001, 901555001, 'Jim', 'Halpert', '38 Gov Ave', 'Morgantown', '3040001111', 'Parent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666002, 901555002, 'Pam', 'Beasley', '67 Swine Ct', 'Pittsburgh', '4120001111', 'Sibling');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666003, 901555003, 'Dwight', 'Schrute', '1993 Livermore St', 'Lancaster', '8140001111', 'Parent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666004, 901555004, 'Oscar', 'Martinez', '11 Grand Way', 'Huntington', '3040001112', 'Parent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666005, 901555005, 'Stanley', 'Hudson', '8226 Apple Hill Dr', 'Huntington', '3040001113', 'GrandParent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666006, 901555006, 'Angela', 'Martin', '16 Hops Way', 'Pittsburgh', '4120001112', 'Parent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666007, 901555007, 'Michael', 'Scott', '1776 Ohio Ave', 'Pittsburgh', '4120001113', 'Parent');
INSERT INTO `mydb`.`NOK` (`nokID`, `bannerNumber`, `firstName`, `lastName`, `street`, `city`, `phoneNumber`, `relationship`) VALUES (901666008, 901555008, 'Robert', 'California', '15 Columbus Ave', 'Morgantown', '3040001114', 'Sibling');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Course`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6001, 'Chemistry I');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6002, 'Chemistry II');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6003, 'Linear Algebra');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6004, 'Diff Equations');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6005, 'Intro to Psychology');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6006, 'Physics I');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6007, 'Physics II');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6008, 'Modern Physics');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6009, 'Modern Algebra');
INSERT INTO `mydb`.`Course` (`courseNO`, `courseName`) VALUES (6010, 'Topology');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Lease`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54321, 901555001, 2001, 1, '2017-08-21', '2017-12-18');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54322, 901555002, 2002, 3, '2017-08-21', '2018-08-14');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54323, 901555003, 2003, 2, '2017-08-21', '2017-05-10');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54324, 901555004, 2004, 2, '2017-08-21', '2017-05-10');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54325, 901555005, 2005, 2, '2017-08-21', '2018-05-10');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54326, 901555006, 2006, 1, '2017-08-21', '2017-12-18');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54327, 901555007, 2007, 3, '2017-08-21', '2018-08-14');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54328, 901555008, 2008, 2, '2017-08-21', '2018-05-10');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54329, 901555001, 2031, 3, '2016-08-20', '2017-08-15');
INSERT INTO `mydb`.`Lease` (`leaseNO`, `bannerNumber`, `placeNO`, `numOfSemester`, `moveInDate`, `moveOutDate`) VALUES (54320, 901555005, 2041, 2, '2016-08-20', '2017-05-10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Invoice`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (12345, 54321, 'S2017', '2017-08-21', '2017-09-28' , 'Credit', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (22345, 54322, 'S2017', '2017-08-21', '2017-08-14', 'Credit', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (32345, 54323, 'S2017', '2017-08-21', '2017-08-15', 'Debit', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (52345, 54324, 'S2017', '2017-08-21', '2017-08-18', 'Check', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (62345, 54325, 'S2017', '2017-08-21', '2017-08-18', 'Debit', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (72345, 54326, 'S2017', '2017-08-21', '2017-08-19', 'Debit', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (82345, 54327, 'S2017', '2017-08-21', '2017-08-20', 'Check', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (92345, 54328, 'S2017', '2017-08-21', '2017-08-15', 'Check', '2017-07-01', '2017-08-13');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (02345, 54329, 'F2016', '2017-08-21', '2016-08-15', 'Credit', '2016-07-01', '2016-08-14');
INSERT INTO `mydb`.`Invoice` (`invoiceNO`, `leaseNO`, `semester`, `payDue`, `date`, `paymentMethod`, `dateOfFirstRem`, `dateOfSecondRem`) VALUES (42345, 54320, 'F2016', '2017-08-21', '2016-08-15', 'Credit', '2016-07-01', '2016-08-14');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2001, 999, NULL, 1, '500.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2002, 998, NULL, 2, '600.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2003, 997, NULL, 3, '600.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2004,null , 2, 108, '525.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2005,null , 3, 209, '550.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2006, null, 1, 225, '700.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2007, 993, NULL, 2, '550.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2008, 992, NULL, 5, '675.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2031, 991, NULL, 2, '500.00');
INSERT INTO `mydb`.`Room` (`placeNO`, `flatNO`, `hallNO`, `roomNO`, `rentRate`) VALUES (2041, 998, NULL, 2, '650.00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Hall`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Hall` (`hallNO`, `staffNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES (1, 901009000, '10 College Ave', 'Huntington', 25701, 'Belichik', '3049990001');
INSERT INTO `mydb`.`Hall` (`hallNO`, `staffNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES (2, 901001100, '11 Colege Ave', 'Huntington', 25701, 'Tomlin', '3049990002');
INSERT INTO `mydb`.`Hall` (`hallNO`, `staffNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES (3, 901001200, '12 College Ave', 'Huntington', 25701, 'Reed', '3049990003');
INSERT INTO `mydb`.`Hall` (`hallNO`, `staffNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES (4, 901001300, '15 College Ave', 'Huntington', 25701, 'Jackson', '3049990004');
INSERT INTO `mydb`.`Hall` (`hallNO`, `staffNO`, `street`, `city`, `postCode`, `hallName`, `phoneNumber`) VALUES (5, 901001400, '20 College Ave', 'Huntington', 25701, 'Carroll', '3049990005');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Flat`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (999, '118 Allen Ave, Apt 1', 'Huntington', 25701, 2);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (991, '118 Allen Ave, Apt 2', 'Huntngton', 25701, 2);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (992, '118 Allen Ave, Apt 3', 'Huntington', 25701, 4);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (993, '113 Watkins Ave, Apt 10', 'Huntington', 25701, 6);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (994, '113 Watkins Ave, Apt 9', 'Huntington', 25701, 6);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (995, '113 Watkins Ave, Apt 8', 'Huntington', 25701, 5);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (996, '110 Ivy Lane, Apt 7', 'Huntington', 25701, 2);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (997, '110 Ivy Lane, Apt 6 ', 'Huntington', 25701, 3);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (998, '110 Ivy Lane, Apt 5', 'Huntington', 25701, 4);
INSERT INTO `mydb`.`Flat` (`flatNO`, `street`, `city`, `postCode`, `numOfRooms`) VALUES (990, '110 Ivy Lane, Apt 4', 'Huntington', 25701, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901001000, 'Ben', 'Roethlisberger', 'Roethlisberger@marshall.edu', '505 Adams Ave', 'Huntington', 25701, '1992-07-22', 'F', 'Flat', 'Houekeeping');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901002000, 'Eli', 'Manning', 'Manning@marshall.edu', '12 Buena Vista Dr', 'South Point', 45680, '1954-03-11', 'M', 'Flat', 'Desk');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901003000, 'Russell', 'Wilson', 'Wilson@marshall.edu', '15 Bel Aire Dr', 'Huntington', 25701, '1994-02-06', 'M', 'Flat', 'Desk');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901004000, 'Tom', 'Brady', 'Brady@marshall.edu', '18 Meadow Brook Dr', 'Huntington', 25701, '1983-05-03', 'F', 'Flat', 'Housekeeping');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901005000, 'Aaron', 'Rodgers', 'Rodgers@marshall.edu', '10 Kizer Ave', 'Barboursville', 25705, '1967-04-11', 'F', 'Flat', 'Desk');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901006000, 'Blake', 'Bortles', 'Bortles@marshall.edu', '118 Mackenzie Dr', 'Huntington', 25701, '1974-11-21', 'F', 'Flat', 'Housekeeping');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901007000, 'Carson', 'Wentz', 'Wentz@marshall.edu', '13 Electric Ave', 'Huntington', 25701, '1990-12-22', 'M', 'Flat', 'RA');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901008000, 'Dak', 'Prescott', 'Prescott@marshall.edu', '4055 Adkins St', 'Huntington', 25701, '1995-08-26', 'M', 'Flat', 'Housekeeping');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901009000, 'Joe', 'Flacco', 'Flacco@marshall.edu', '11 Graham St', 'Huntington', 25701, '1957-09-22', 'M', 'Res Hall', 'Manager');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901001100, 'Andy', 'Dalton', 'Dalton@marshall.edu', '20114 Elvis Blvd', 'Huntington', 25701, '1980-07-14', 'F', 'Res Hall', 'Manager');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901001200, 'Walter', 'White', 'White@marshall.edu', '15 Meadow Brook Dr', 'Huntington', 25701, '1987-05-07', 'M', 'Res Hall', 'Manager');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901001300, 'Jesse', 'Pinkman', 'Pinkman@marshall.edu', '11 Fill Court', 'Huntington', 25701, '1953-11-07', 'F', 'Res Hall', 'Manager');
INSERT INTO `mydb`.`Staff` (`staffNO`, `firstName`, `lastName`, `email`, `street`, `city`, `postCode`, `dateOfBirth`, `gender`, `location`, `position`) VALUES (901001400, 'Gustav', 'Fring', 'Fring@marshall.edu', '8 Summer Drive', 'Huntington', 25701, '1991-12-03', 'M', 'Res Hall', 'Manager');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Inspection`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (01000, 901001000, 991, '2017-09-01', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (02000, 901002000, 992, '2017-09-01', 'no', 'Broken blinds, large hole in door.');
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (03000, 901003000, 993, '2017-05-10', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (04000, 901008000, 994, '2017-03-17', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (05000, 901001000, 995, '2017-07-22', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (06000, 901005000, 996, '2017-09-28', 'no', 'Large stains, cigarette burns on carpet.');
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (07000, 901003000, 997, '2017-08-20', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (08000, 901001000, 998, '2017-11-01', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (09000, 901002000, 999, '2017-04-08', 'yes', NULL);
INSERT INTO `mydb`.`Inspection` (`inspcNO`, `staffNO`, `flatNO`, `dateOfInspc`, `satisfcCondition`, `comments`) VALUES (01100, 901001000, 990, '2017-11-15', 'no', 'Apartment is dirty, pet stains on carpet.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Advisor`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999999, 0050, 56789, 'Jack', 'Lambert', '304111111', 'Lambert@marshall.edu', 101);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999998, 0030, 56789, 'Joe', 'Greene', '304111112', 'Green@marshall.edu', 102);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999997, 0060, 66789, 'Jack', 'Hamm', '304111113', 'Hamm@marshall.edu', 103);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999996, 0020, 76789, 'John', 'Stallworth', '304111114', 'Stallworth@marshall.edu', 104);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999995, 0050, 66789, 'Lynn', 'Swann', '304111115', 'Swann@marshall.edu', 105);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999994, 0030, 57789, 'Terry', 'Bradshaw', '304111116', 'Bradshaw@marshall.edu', 106);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999993, 0020, 58789, 'Mel', 'Blount', '304111117', 'Blount@marshall.edu', 107);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999992, 0040, 59789, 'Franco', 'Harris', '304111118', 'Harris@marshall.edu', 108);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999991, 0010, 57889, 'Rocky', 'Bleier', '304111119', 'Bleier@marshall.edy', 109);
INSERT INTO `mydb`.`Advisor` (`advisorID`, `positionID`, `deptNO`, `firstName`, `lastName`, `phoneNumber`, `email`, `roomNumber`) VALUES (901999990, 0030, 57889, 'Chuck', 'Noll', '304111110', 'Noll@marshall.edu', 110);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Position`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0010, 'Support');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0020, 'Lecturer');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0030, 'Professor');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0040, 'Adjunct Professor');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0050, 'Assistant Professor');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0060, 'Faculty');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0070, 'Post Doc');
INSERT INTO `mydb`.`Position` (`positionID`, `positionName`) VALUES (0080, 'Tenure Track');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Department`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (56789, 'Mathematics');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (66789, 'Communications');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (76789, 'English');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (86789, 'Geology');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (96789, 'Geography');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (57789, 'Biology');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (58789, 'Engineering');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (59789, 'Sociology');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (58889, 'Psychology');
INSERT INTO `mydb`.`Department` (`departmentNO`, `departmentName`) VALUES (57889, 'Chemistry');

COMMIT;
