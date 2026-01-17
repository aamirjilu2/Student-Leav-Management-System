-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 01:22 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `std_leave`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(4, 'Information Technology', 'IT', '2022-10-22 07:22:36'),
(5, 'Computer Engineering', 'CSE', '2022-10-22 07:22:52'),
(6, 'Artificial Intelligence', 'AIDS', '2022-10-22 07:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblfaculty`
--

CREATE TABLE `tblfaculty` (
  `std_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblfaculty`
--

INSERT INTO `tblfaculty` (`std_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(01, 'IT', 'FACULTY', 'ITF@KSR', 'e10adc3949ba59abbe56e057f20f883e', 'male', '01 August 2023', 'IT', 'KSR', '30', '123456789', 1, '2023-08-12 06:42:34', 'Faculty', 'NO-IMAGE-AVAILABLE.jpg'),
(02, 'CSE', 'FACULTY', 'CSEF@KSRCT', 'e10adc3949ba59abbe56e057f20f883e', 'male', '01 August 2023', 'CSE', 'KSR', '00', '123456789', 1, '2023-08-12 06:45:20', 'Faculty', 'NO-IMAGE-AVAILABLE.jpg');


-- --------------------------------------------------------

--
-- Table structure for table `tblhod`
--

CREATE TABLE `tblhod` (
  `std_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblhod`
--

INSERT INTO `tblhod` (`std_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(01, 'IT', 'HOD', 'ITHOD@KSR', 'e10adc3949ba59abbe56e057f20f883e', 'male', '01 August 2023', 'IT', 'KSR', '0', '123456789', 1, '2023-08-12 06:32:12', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(02, 'CSE', 'HOD', 'CSEHOD@KSR', '3d9188577cc9bfe9291ac66b5cc872b7', 'male', '01 August 2023', 'CSE', 'KSRCT', '00', '123456789', 1, '2023-08-12 06:44:42', 'HOD', 'NO-IMAGE-AVAILABLE.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` date NOT NULL,
  `HODRemark` mediumtext DEFAULT NULL,
  `registra_remarks` mediumtext NOT NULL,
  `HODRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `HOD_status` int(11) NOT NULL DEFAULT 0,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `num_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `HODRemark`, `registra_remarks`, `HODRemarkDate`, `Status`, `HOD_status`, `IsRead`, `empid`, `num_days`) VALUES
(20, 'Casual Leave', '08-08-2023', '08-08-2023', 'I Taking a leave for fever', '2023-08-07', NULL, '', NULL, 0, 0, 1, 70, 1),
(21, 'Casual Leave', '08-08-2023', '09-08-2023', 'CSE', '2023-08-07', 'Done', '', '2023-08-09 14:16:29 ', 1, 0, 1, 71, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `date_from` varchar(200) NOT NULL,
  `date_to` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `date_from`, `date_to`, `CreationDate`) VALUES
(9, 'Casual Leave', 'I Want To Take Leave', '22-10-2022', '12-12-2029', '2022-10-22 07:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `std_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`std_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(01, 'IT', 'STUDENT', 'ITSTUDENT@KSR', 'e10adc3949ba59abbe56e057f20f883e', 'male', '01 August 2023', 'IT', 'KSR', '30', '123456789', 1, '2023-08-12 06:45:54', 'Students', 'NO-IMAGE-AVAILABLE.jpg'),
(02, 'CSE', 'STUDENT', 'CSESTUDENT@KSR', 'e10adc3949ba59abbe56e057f20f883e', 'male', '01 August 2023', 'CSE', 'KSR', '28', '123456789', 1, '2023-08-12 06:46:31', 'Students', 'NO-IMAGE-AVAILABLE.jpg');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`std_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
