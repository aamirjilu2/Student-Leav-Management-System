-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 09:52 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
(13, 'Casual Leave', '2021-05-02', '2021-05-12', 'I want to take a leave.', '2021-05-20', 'Ok', 'ok', '2021-05-24 20:26:19 ', 1, 1, 1, 7, 3),
(14, 'Medical Leave', '08-05-2021', '11-05-2021', 'Noted', '0000-00-00', 'Not this time', '', '2021-05-21 0:31:10 ', 0, 0, 1, 6, 4),
(16, 'Casual Leave', '02-05-2021', '05-05-2021', 'Nice Leave', '2021-05-20', 'Ok', 'Noted', '2021-05-24 20:42:18 ', 1, 1, 1, 7, 4),
(17, 'Casual Leave', '11-05-2021', '15-05-2021', 'Just', '2021-05-21', 'Leave Approved', 'Noted', '2021-05-24 19:56:45 ', 1, 1, 1, 7, 5),
(18, 'Casual Leave', '23-10-2022', '23-10-2022', 'I want to take leave', '2022-10-22', 'Approved as per parent approvel', 'Approved', '2022-10-23 13:03:56 ', 1, 1, 1, 67, 1);

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
(65, 'Poonkuzhali', '.', 'Poonkuzhali@ksrct.net', '2ec1e2aa7a86031d447ef36233f64008', 'female', '01 October 2022', 'IT', 'KSRCT', '30', '9150677609', 1, '2022-10-22 07:33:29', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(66, 'Vaishnavi', '.', 'vaish@ksrct.net', '8c21b683ac5a2852f004edcd9c56e072', 'female', '08 October 2022', 'IT', 'KSRCT', '30', '9445152055', 1, '2022-10-22 07:34:33', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(67, 'Mohammed', 'Aamir', 'aamirirfu@gmail.com', '0e9e1c4127bfabdcb79d46867d3e95f8', 'male', '27 June 2000', 'IT', 'KSRCT', '29', '9952873573', 1, '2022-10-22 07:39:51', 'Students', 'NO-IMAGE-AVAILABLE.jpg');

--
-- Indexes for dumped tables


--  Inexes For Table HOD


  

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
