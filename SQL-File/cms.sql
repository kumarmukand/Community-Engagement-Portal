-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2019 at 04:43 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'f7f14b6982d5ddbbf0f2fc5406a1733b', '02-02-2019 08:09:38 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Fire', '', '2019-02-02 14:24:24', '02-02-2019 07:54:38 PM'),
(4, 'Ambulance', '', '2019-02-02 14:25:02', NULL),
(5, 'Electricity', '', '2019-02-02 14:25:23', NULL),
(6, 'Gas', '', '2019-02-02 14:25:42', NULL),
(7, 'Water', '', '2019-02-02 14:25:59', NULL),
(8, 'Food', '', '2019-02-02 14:26:23', NULL),
(9, 'Traffic', '', '2019-02-02 14:26:43', NULL),
(10, 'Roads/infrastructure', '', '2019-02-02 14:27:10', NULL),
(11, 'Police', '', '2019-02-02 14:27:26', NULL),
(12, 'Terrorism', '', '2019-02-02 14:27:41', NULL),
(13, 'Environment', '', '2019-02-02 14:27:57', NULL),
(14, 'Religious affairs', '', '2019-02-02 14:28:14', NULL),
(15, 'Disaster', '', '2019-02-02 14:28:25', NULL),
(16, 'Medical emergency', '', '2019-02-02 14:28:45', NULL),
(17, 'Banking', '', '2019-02-02 14:28:58', NULL),
(18, 'Education', '', '2019-02-02 14:29:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 1, 'closed', 'closed', '2019-02-13 17:33:45'),
(2, 2, 'in process', 'AZAZAZ', '2019-02-13 19:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(7, 'Karachi', '', '2019-02-02 14:04:12', NULL),
(8, 'Hyderabad', '', '2019-02-02 14:04:57', NULL),
(9, 'Mithi', '', '2019-02-02 14:05:51', NULL),
(10, 'Lahore', '', '2019-02-02 14:05:59', NULL),
(11, 'Islamabad', '', '2019-02-02 14:06:05', NULL),
(12, 'Quetta', '', '2019-02-02 14:06:12', NULL),
(13, 'Peshwar', '', '2019-02-02 14:06:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `complainlocation` mediumtext NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `complainlocation`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 2, 8, 'Select Subcategory', ' Complaint', 'Karachi', '', 'NPP', 'NPP', '', '2019-02-02 14:38:14', 'closed', '2019-02-13 17:33:46'),
(2, 2, 13, '', ' Complaint', 'Hyderabad', '', '', 'ABC XYD', '', '2019-02-13 19:06:30', 'in process', '2019-02-13 19:27:18'),
(3, 2, 5, '', ' Complaint', 'Mithi', '', '', 'Yyyyyy\r\n', '', '2019-02-18 15:56:08', NULL, '0000-00-00 00:00:00'),
(4, 2, 5, '', ' Complaint', 'Lahore', '', '', 'Yyyy', '', '2019-02-18 16:41:02', NULL, '0000-00-00 00:00:00'),
(5, 2, 10, '', ' Complaint', 'Quetta', '', '', 'Vsvvsvs\r\n', '', '2019-02-19 16:02:14', NULL, '0000-00-00 00:00:00'),
(6, 2, 5, '', ' Complaint', 'Mithi', '', '', 'Ddd', 'IMG-20190218-WA0023.jpg', '2019-02-20 07:13:34', NULL, '0000-00-00 00:00:00'),
(7, 2, 10, '', ' Complaint', 'Hyderabad', '', '', 'xxxxxxxxxxxxxxxxx', '', '2019-02-22 07:01:30', NULL, '0000-00-00 00:00:00'),
(8, 1, 16, '', 'General Query', 'Quetta', 'complainlocation', '', 'mcmmmmmmmmmmmm', '', '2019-02-22 07:47:08', NULL, '0000-00-00 00:00:00'),
(9, 1, 13, '', ' Complaint', 'Peshwar', 'ffffffffffffffff', '', 'ffffffffffffffeeeeeeeeeeee', '', '2019-02-22 07:53:25', NULL, '0000-00-00 00:00:00'),
(10, 1, 13, '', ' Complaint', 'Peshwar', 'ffffffffffffffff', '', 'ffffffffffffffeeeeeeeeeeee', '', '2019-02-22 08:12:58', NULL, '0000-00-00 00:00:00'),
(11, 1, 13, '', ' Complaint', 'Peshwar', 'ffffffffffffffff', '', 'ffffffffffffffeeeeeeeeeeee', '', '2019-02-22 08:15:01', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(28, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-02 11:46:48', '02-02-2019 05:17:11 PM', 1),
(29, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-02 14:07:00', '', 1),
(30, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-05 09:36:25', '', 0),
(31, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-05 09:36:52', '', 0),
(32, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-05 09:37:01', '', 0),
(33, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-05 09:37:12', '', 0),
(34, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-05 09:37:18', '05-02-2019 03:07:24 PM', 1),
(35, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-13 17:08:31', '', 0),
(36, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-13 17:08:36', '13-02-2019 10:40:35 PM', 1),
(37, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-13 17:19:57', '', 1),
(38, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-13 19:09:05', '14-02-2019 12:46:09 AM', 1),
(39, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-13 19:18:37', '14-02-2019 12:57:45 AM', 1),
(40, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-13 19:28:04', '14-02-2019 12:11:07 PM', 1),
(41, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-14 06:41:36', '', 1),
(42, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-16 12:35:59', '16-02-2019 08:41:07 PM', 1),
(43, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-17 06:57:44', '17-02-2019 05:25:58 PM', 1),
(44, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-17 11:56:41', '17-02-2019 05:28:11 PM', 1),
(45, 0, 'admin', 0x3a3a3100000000000000000000000000, '2019-02-18 15:51:09', '', 0),
(46, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-18 15:51:21', '18-02-2019 09:22:49 PM', 1),
(47, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 15:52:53', '', 1),
(48, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 15:52:54', '', 1),
(49, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 15:52:54', '', 1),
(50, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 15:53:59', '', 1),
(51, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-18 16:15:18', '', 1),
(52, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 16:21:13', '18-02-2019 10:07:44 PM', 1),
(53, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 16:38:45', '18-02-2019 10:11:07 PM', 1),
(54, 0, 'Shakti@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 17:29:29', '', 0),
(55, 0, 'shakti@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 17:30:03', '', 0),
(56, 3, 'shakti@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-18 17:31:50', '', 1),
(57, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-19 15:15:31', '', 1),
(58, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-19 16:00:21', '', 1),
(59, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-19 16:52:34', '', 1),
(60, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e34332e3139390000, '2019-02-20 06:15:09', '', 1),
(61, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e34332e3139390000, '2019-02-20 06:22:39', '', 1),
(62, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e34332e3139390000, '2019-02-20 06:48:39', '', 1),
(63, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e34332e3138330000, '2019-02-20 07:10:04', '', 1),
(64, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e34332e3834000000, '2019-02-20 07:12:26', '', 1),
(65, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 11:01:42', '', 1),
(66, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 11:28:44', '', 1),
(67, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 13:49:02', '', 1),
(68, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 15:08:27', '', 1),
(69, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 15:41:42', '', 1),
(70, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 16:13:53', '', 1),
(71, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 16:15:07', '', 1),
(72, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-20 16:31:48', '', 1),
(73, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 16:32:16', '', 1),
(74, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 16:33:39', '', 1),
(75, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 17:06:52', '', 1),
(76, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313030000000, '2019-02-20 18:05:55', '', 1),
(77, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 18:05:56', '', 1),
(78, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 18:48:59', '', 1),
(79, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313030000000, '2019-02-20 18:52:59', '', 1),
(80, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313030000000, '2019-02-20 18:54:59', '', 1),
(81, 2, 'nirmalparwani96@gmail.com', 0x3139322e3136382e302e313035000000, '2019-02-20 19:13:40', '21-02-2019 10:46:04 PM', 1),
(82, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-21 17:20:49', '', 1),
(83, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-21 17:33:59', '', 1),
(84, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-21 17:37:52', '', 1),
(85, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-21 18:17:05', '', 1),
(86, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-21 18:19:20', '22-02-2019 12:57:05 AM', 1),
(87, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-21 19:58:07', '', 1),
(88, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-21 20:00:32', '22-02-2019 01:35:30 AM', 1),
(89, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-21 20:12:04', '', 1),
(90, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-22 06:41:51', '22-02-2019 12:16:21 PM', 1),
(91, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-22 06:58:55', '', 1),
(92, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313033000000, '2019-02-22 07:22:20', '22-02-2019 03:47:52 PM', 1),
(93, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-22 20:40:57', '', 1),
(94, 68, 'K152198@nu.edu.pk', 0x3139322e3136382e302e313033000000, '2019-02-23 10:58:08', '', 1),
(95, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-23 11:08:19', '', 1),
(96, 2, 'Nirmalparwani96@gmail.com', 0x3139322e3136382e302e313036000000, '2019-02-27 12:14:16', '', 1),
(97, 2, 'nirmalparwani96@gmail.com', 0x3a3a3100000000000000000000000000, '2019-02-27 12:45:04', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(10) DEFAULT NULL,
  `CNIC` varchar(15) DEFAULT NULL,
  `Gender` varchar(13) DEFAULT NULL,
  `address` tinytext,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `CNIC`, `Gender`, `address`, `State`, `country`, `zipcode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(2, 'Nirmal', 'nirmalparwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 33610269484444, '1234567891234', 'M', 'FLAT NO .G1101,11th floor,Plot No.27,\r\nBlock G, Commissariat Line Garden Road', 'Mithi', 'Pakistan', 234653, '218b423b0ed13a1d129bd3464f5cb4c1.jpg', '2019-02-02 11:46:09', '2019-02-22 07:00:23', 1),
(3, 'Shakti', 'shakti@gmail.com', 'f28efcd9824a2e8917cbf7e887c767b3', 3363493950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 17:31:15', '0000-00-00 00:00:00', 1),
(5, 'Mukander', 'mukunder@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 333333333, '1234557891111', NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-21 18:49:56', '0000-00-00 00:00:00', 1),
(6, 'SHAKTI23', 'nirmalparw2222ani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 2222222222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:01:40', '0000-00-00 00:00:00', 1),
(7, 'SHAKTI23', 'nirmalparw2222ani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 2222222222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:02:09', '0000-00-00 00:00:00', 1),
(8, 'ccvvbbnn', 'nirmalddddparwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 5555555555, '888888888888888', NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:17:12', '0000-00-00 00:00:00', 1),
(9, 'ccvvbbnn', 'nirmalddddparwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 5555555555, '888888888888888', NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:19:47', '0000-00-00 00:00:00', 1),
(10, 'eeeeeeeeeeee', 'nirmalparwwwwwwwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 5555555555, '555555555555555', NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:20:17', '0000-00-00 00:00:00', 1),
(11, 'Nirmalfg', 'nirmalpvbbarwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 3361026948, '0', 'M', NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:22:41', '0000-00-00 00:00:00', 1),
(12, 'Nirmalfgmmmmm', 'nirmalpvbbarwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 3361026948, '999999999999999', 'F', NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:24:57', '0000-00-00 00:00:00', 1),
(13, 'Nirmalfgmmmmmssssss', 'nirmalpvbbssssssarwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 3361026948, '23333', 'M', NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:26:16', '0000-00-00 00:00:00', 1),
(14, 'Nirmalfgmmmmmssssssffffff', 'nirmalpvbbsssffsssarwani96@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 3361026948, '55555', 'F', NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:27:35', '0000-00-00 00:00:00', 1),
(15, 'Nirmal', 'nirmalkumar@hyper.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 3361026948, '55555-5555555-5', 'M', NULL, NULL, NULL, NULL, NULL, '2019-02-22 06:31:08', '0000-00-00 00:00:00', 1),
(16, 'Yyeyyey', 'nirmalparwani96@fjjj', '28bac2126f933e2614d41cce5c5d06fc', 7473737737, '73737-73737', 'Female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 08:31:23', '0000-00-00 00:00:00', 1),
(17, 'Yeyeyey', 'hehehhe@gn', '6823d2ab331fb2b0b01e1d8b5017edfc', 0, 'Hsheh-Hshehh3-H', 'Male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 08:34:32', '0000-00-00 00:00:00', 1),
(18, 'Hshshehhh', 'hshshshhshs@hh', '9a0fe27c8bcc9aad51eda55e1b735eb5', 4455, '77777', 'Female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 08:51:18', '0000-00-00 00:00:00', 1),
(19, 'Ggggg', 'vsvsvdg@g', '9a0fe27c8bcc9aad51eda55e1b735eb5', 0, 'Hhhh', 'Female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 08:54:10', '0000-00-00 00:00:00', 1),
(20, 'Gggggy', 'ggg@f', 'eda17a76227965972a37f59be349021a', 0, 'Hyyy', 'Other', NULL, NULL, NULL, NULL, NULL, '2019-02-22 09:12:39', '0000-00-00 00:00:00', 1),
(21, 'Hhh', 'bbxbbxhdh@gg', '68842b8654ec113ee10d7c50a120327a', 0, 'Hhhhh', 'Other', NULL, NULL, NULL, NULL, NULL, '2019-02-22 09:16:42', '0000-00-00 00:00:00', 1),
(22, 'Bbbb', 'hshsheh@gmail', '65ba841e01d6db7733e90a5b7f9e6f80', 0, 'Bbbb', 'Female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 09:18:58', '0000-00-00 00:00:00', 1),
(23, 'Vvvgg', 'yhhhh@gg', '732be711dae517dc200b11c3dd360186', 0, '5tttg-5tttggg', 'Female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 09:31:15', '0000-00-00 00:00:00', 1),
(24, 'Manish', 'nhhh@nu.edu.pk', '2912916c2429ab4303a251dc253745a8', 9223372036854775807, '66666', 'female', NULL, NULL, NULL, NULL, NULL, '2019-02-22 09:59:24', '0000-00-00 00:00:00', 1),
(48, 'Nirmal', 'nirmalparwani96@outlook.com', '7af0a189a8d60b07caafc529782f9ee2', 3361026948, '77777-7777777-7', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 19:59:15', '0000-00-00 00:00:00', 1),
(49, 'Nirmal', 'k152210@nu.edu.pk', '7af0a189a8d60b07caafc529782f9ee2', 3361026948, '99999-9999999-9', 'other', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:04:51', '0000-00-00 00:00:00', 1),
(50, 'mukander', 'mukanderkumar1998@gmail.com', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 11111111111, '22222-2222222-2', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:07:01', '0000-00-00 00:00:00', 1),
(51, 'Nirmal', 'nirmalkumar838@yahoo.com', '2f13f50228260cfb4957439c5d82f949', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:11:19', '0000-00-00 00:00:00', 1),
(52, 'Nirmal', 'nirmalkumar838@yahoo.com', '2f13f50228260cfb4957439c5d82f949', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:14:02', '0000-00-00 00:00:00', 1),
(53, 'Nirmal', 'nirmalkumar838@yahoo.com', '2f13f50228260cfb4957439c5d82f949', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:18:22', '0000-00-00 00:00:00', 1),
(54, 'Nirmal', 'nirmalparwani96nnn@gmail.com', '28b0d63f124bb252a0b3b4204f30fb21', 3361026948, '99999-9999999-9', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:19:29', '0000-00-00 00:00:00', 1),
(55, 'Nirmal', 'nirmalparwani96nnn@gmail.com', '28b0d63f124bb252a0b3b4204f30fb21', 3361026948, '99999-9999999-9', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:20:32', '0000-00-00 00:00:00', 1),
(56, 'Nirmal', 'nirmalparwani96nnn@gmail.com', '28b0d63f124bb252a0b3b4204f30fb21', 3361026948, '99999-9999999-9', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:21:59', '0000-00-00 00:00:00', 1),
(57, 'Nirmal', 'cmcmdmkm@gmail.com', '36281686b24537fb7a121a2551f5d246', 3361026948, '77777-7777777-7', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:22:59', '0000-00-00 00:00:00', 1),
(58, 'Nirmal', 'cmcmdmkm@gmail.com', '36281686b24537fb7a121a2551f5d246', 3361026948, '77777-7777777-7', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:25:09', '0000-00-00 00:00:00', 1),
(59, 'jjjfjfjfjfjfj', 'nirmalpannnnnrwani96@gmail.com', 'b08781280f1a29c90e2ce46049d8e1cd', 3361026948, '22222-2222222-2', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:26:03', '0000-00-00 00:00:00', 1),
(60, 'jjjfjfjfjfjfj', 'nirmalpannnnnrwani96@gmail.com', 'b08781280f1a29c90e2ce46049d8e1cd', 3361026948, '22222-2222222-2', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:27:21', '0000-00-00 00:00:00', 1),
(61, 'jjjfjfjfjfjfj', 'nirmalpannnnnrwani96@gmail.com', 'b08781280f1a29c90e2ce46049d8e1cd', 3361026948, '22222-2222222-2', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:28:14', '0000-00-00 00:00:00', 1),
(62, 'mvvvvvvvvvvvvv', 'mcccccccccccc@gmail.com', 'bec2a1ff6ccc878dff960190c5707b76', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:30:28', '0000-00-00 00:00:00', 1),
(63, 'mvvvvvvvvvvvvv', 'mcccccccccccc@gmail.com', 'bec2a1ff6ccc878dff960190c5707b76', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:30:59', '0000-00-00 00:00:00', 1),
(64, 'mvvvvvvvvvvvvv', 'mcccccccccccc@gmail.com', 'bec2a1ff6ccc878dff960190c5707b76', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:33:29', '0000-00-00 00:00:00', 1),
(65, 'mvvvvvvvvvvvvv', 'mcccccccccccc@gmail.com', 'bec2a1ff6ccc878dff960190c5707b76', 3361026948, '44444-4444444-4', 'male', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:37:06', '0000-00-00 00:00:00', 1),
(66, 'Nirmal', 'nirmalphhhhhhhharwani96@gmail.com', '6eceab862211170b17b9d316619df6a9', 3333780842, '44444-4444444-4', 'other', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:38:22', '0000-00-00 00:00:00', 1),
(67, 'Nirmal', 'nirmalphhhhhhhharwani96@gmail.com', '6eceab862211170b17b9d316619df6a9', 3333780842, '44444-4444444-4', 'other', NULL, NULL, NULL, NULL, NULL, '2019-02-22 20:39:48', '0000-00-00 00:00:00', 1),
(68, 'Chotu', 'k152198@nu.edu.pk', 'f7f14b6982d5ddbbf0f2fc5406a1733b', 8889888855, '55555-5555555', 'male', 'Uuuiii', 'Hyderabad', 'Pakistan', 666666, NULL, '2019-02-23 10:56:45', '2019-02-23 11:03:27', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
