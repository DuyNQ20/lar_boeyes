-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 11:33 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eyesight`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_academicyear`
--

CREATE TABLE `tbl_academicyear` (
  `academicYear_id` int(50) NOT NULL,
  `academicYear_name` text NOT NULL,
  `academicYear_begin` text NOT NULL,
  `academicYear_end` text NOT NULL,
  `academicYear_classnumber` int(11) NOT NULL,
  `school_id` int(50) NOT NULL,
  `acadamicYear_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_academicyear`
--

INSERT INTO `tbl_academicyear` (`academicYear_id`, `academicYear_name`, `academicYear_begin`, `academicYear_end`, `academicYear_classnumber`, `school_id`, `acadamicYear_createdate`) VALUES
(3, 'K10', '2014', '2019', 5, 120, '10/10/2018'),
(4, 'K11', '2015', '2020', 7, 120, '10/10/2018'),
(5, 'K12', '2016', '2021', 6, 120, '10/10/2018'),
(6, 'K13', '2017', '2022', 4, 120, '10/10/2018'),
(7, 'K14', '2018', '2023', 5, 120, '10/10/2018'),
(8, 'K21', '2014', '2019', 5, 121, '10/10/2018'),
(9, 'K22', '2015', '2020', 5, 121, '10/10/2018'),
(10, 'K23', '2016', '2021', 6, 121, '10/10/2018'),
(11, 'K24', '2017', '2022', 7, 121, '10/10/2018'),
(12, 'K25', '2018', '2023', 5, 121, '10/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `acc_id` int(50) NOT NULL,
  `acc_code` text NOT NULL,
  `acc_username` text NOT NULL,
  `acc_password` text NOT NULL,
  `role_id` int(50) NOT NULL,
  `acc_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`acc_id`, `acc_code`, `acc_username`, `acc_password`, `role_id`, `acc_createdate`) VALUES
(1, 'bs001', 'caovanhoc', '123456', 1, '10/10/2018'),
(2, 'yte001', 'maivanhoc', '234567', 2, '10/10/2018'),
(3, 'admin001', 'vuthihue', '345678', 4, '10/10/2018'),
(4, 'cb001', 'lethihe', '456789', 3, '10/10/2018'),
(5, '', 'admin', '123456', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `class_id` int(50) NOT NULL,
  `class_name` text NOT NULL,
  `class_teacher` text NOT NULL,
  `class_year` text NOT NULL,
  `academicYear_id` int(50) NOT NULL,
  `class_stunumber` int(11) NOT NULL,
  `school_id` int(50) NOT NULL,
  `class_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`class_id`, `class_name`, `class_teacher`, `class_year`, `academicYear_id`, `class_stunumber`, `school_id`, `class_createdate`) VALUES
(1, '5a', 'Nguyễn Thảo Mai', '2018-2019', 3, 25, 120, '10/10/2018'),
(2, '5b', 'Trần Mỹ Linh', '2018-2019', 3, 27, 120, '10/10/2018'),
(3, '5c', 'Dương Hồng Hạnh', '2018-2019', 3, 30, 120, '10/10/2018'),
(4, '5d', 'Mai Kiều Trang', '2018-2019', 3, 34, 120, '10/10/2018'),
(5, '5e', 'Kiều Hoài Thương', '2018-2019', 3, 36, 120, '10/10/2018'),
(6, '4a', 'Đặng Thị Linh Chi', '2017-2018', 3, 25, 120, '10/10/2018'),
(7, '4b', 'Phạm Thị Hồng Vân', '2017-2018', 3, 27, 120, '10/10/2018'),
(8, '4c', 'Đinh Thị Thuý Diệu', '2017-2018', 3, 30, 120, '10/10/2018'),
(9, '4d', 'Trần Thị Thu Trang', '2017-2018', 3, 34, 120, '10/10/2018'),
(10, '4e', 'Bùi Thị Phương Dung', '2017-2018', 3, 36, 120, '10/10/2018'),
(11, '5a', 'Nguyễn Thị Phương Dung', '2018-2019', 8, 24, 121, '11/10/2018'),
(12, '5b', 'Mai Hồng Duyên', '2018-2019', 8, 30, 121, '11/10/2018'),
(13, '5c', 'Đào Thị Giang', '2018-2019', 8, 34, 121, '11/10/2018'),
(14, '5d', 'Vũ Thị Giang', '2018-2019', 8, 26, 121, '11/10/2018'),
(15, '5e', 'Lê Thị Hằng', '2018-2019', 8, 28, 121, '11/10/2018'),
(16, '3a', 'Nguyễn Thanh Hằng', '2016-2017', 3, 25, 120, '20/10/2018'),
(17, '3b', 'Chu Thị Mỹ Hạnh', '2016-2017', 3, 27, 120, '20/10/2018'),
(18, '3c', 'Nguyễn Thị Hảo', '2016-2017', 3, 30, 120, '20/10/2018'),
(19, '3d', 'Lê Thị Hậu', '2016-2017', 3, 34, 120, '20/10/2018'),
(20, '3e', 'Bùi Thị Thu Hiền', '2016-2017', 3, 36, 120, '20/10/2018'),
(21, '2a', 'Đào Thị Thu Hiền', '2015-2016', 3, 25, 120, '20/10/2018'),
(22, '2b', 'Phùng Phương Hoa', '2015-2016', 3, 27, 120, '20/10/2018'),
(23, '2c', 'Trần Huy Hoàng', '2015-2016', 3, 30, 120, '20/10/2018'),
(24, '2d', 'Hoàng Ánh Hồng', '2015-2016', 3, 34, 120, '20/10/2018'),
(25, '2e', 'Nguyễn Thị Hồng', '2015-2016', 3, 36, 120, '20/10/2018'),
(26, '1a', 'Nguyễn Thị Hương', '2014-2016', 3, 25, 120, '20/10/2018'),
(27, '1b', 'Nguyễn Thị Lan Hương', '2014-2016', 3, 27, 120, '20/10/2018'),
(28, '1c', 'Nguyễn Thị Thu Hướng', '2014-2016', 3, 30, 120, '20/10/2018'),
(29, '1d', 'Đỗ Thị Xuân Hường', '2014-2016', 3, 34, 120, '20/10/2018'),
(30, '1e', 'Nguyễn Thị Hường', '2014-2016', 3, 36, 120, '20/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eyesight`
--

CREATE TABLE `tbl_eyesight` (
  `eyesight_id` int(50) NOT NULL,
  `stu_id` int(50) NOT NULL,
  `class_id` int(50) NOT NULL,
  `class_name` text NOT NULL,
  `eyesight_date` text NOT NULL,
  `eyesight_diopter` float NOT NULL,
  `user_id` int(50) NOT NULL,
  `eyesight_note` text,
  `eyesight_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_eyesight`
--

INSERT INTO `tbl_eyesight` (`eyesight_id`, `stu_id`, `class_id`, `class_name`, `eyesight_date`, `eyesight_diopter`, `user_id`, `eyesight_note`, `eyesight_createdate`) VALUES
(1, 2, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(2, 3, 1, '5a', '2018/09/13', 1.75, 3, NULL, '10/10/2018'),
(3, 4, 1, '5a', '2018/09/13', 2.5, 3, NULL, '10/10/2018'),
(4, 5, 1, '5a', '2018/09/13', 1, 3, NULL, '10/10/2018'),
(5, 6, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(6, 7, 1, '5a', '2018/09/13', 0.5, 3, NULL, '10/10/2018'),
(7, 8, 1, '5a', '2018/09/13', 0.75, 3, NULL, '10/10/2018'),
(8, 9, 1, '5a', '2018/09/13', 3, 3, NULL, '10/10/2018'),
(9, 10, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(10, 11, 1, '5a', '2018/09/13', 1.75, 3, NULL, '10/10/2018'),
(11, 12, 1, '5a', '2018/09/13', 2.5, 3, NULL, '10/10/2018'),
(12, 13, 1, '5a', '2018/09/13', 1, 3, NULL, '10/10/2018'),
(13, 14, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(14, 15, 1, '5a', '2018/09/13', 0.5, 3, NULL, '10/10/2018'),
(15, 16, 1, '5a', '2018/09/13', 0.75, 3, NULL, '10/10/2018'),
(16, 17, 1, '5a', '2018/09/13', 3, 3, NULL, '10/10/2018'),
(17, 18, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(18, 19, 1, '5a', '2018/09/13', 1.75, 3, NULL, '10/10/2018'),
(19, 20, 1, '5a', '2018/09/13', 2.5, 3, NULL, '10/10/2018'),
(20, 21, 1, '5a', '2018/09/13', 1, 3, NULL, '10/10/2018'),
(21, 22, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(22, 23, 1, '5a', '2018/09/13', 0.5, 3, NULL, '10/10/2018'),
(23, 24, 1, '5a', '2018/09/13', 0.75, 3, NULL, '10/10/2018'),
(24, 25, 1, '5a', '2018/09/13', 2, 3, NULL, '10/10/2018'),
(25, 26, 1, '5a', '2018/09/13', 1, 3, NULL, '10/10/2018'),
(26, 2, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(27, 3, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(28, 4, 6, '4a', '2017/09/10', 2.75, 3, NULL, '10/10/2018'),
(29, 5, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(30, 6, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(31, 7, 6, '4a', '2017/09/10', 0.25, 3, NULL, '10/10/2018'),
(32, 8, 6, '4a', '2017/09/10', 0.75, 3, NULL, '10/10/2018'),
(33, 9, 6, '4a', '2017/09/10', 3.25, 3, NULL, '10/10/2018'),
(34, 10, 6, '4a', '2017/09/10', 2.5, 3, NULL, '10/10/2018'),
(35, 11, 6, '4a', '2017/09/10', 1.75, 3, NULL, '10/10/2018'),
(36, 12, 6, '4a', '2017/09/10', 2.75, 3, NULL, '10/10/2018'),
(37, 13, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(38, 14, 6, '4a', '2017/09/10', 2.5, 3, NULL, '10/10/2018'),
(39, 15, 6, '4a', '2017/09/10', 0.5, 3, NULL, '10/10/2018'),
(40, 16, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(41, 17, 6, '4a', '2017/09/10', 3, 3, NULL, '10/10/2018'),
(42, 18, 6, '4a', '2017/09/10', 2.25, 3, NULL, '10/10/2018'),
(43, 19, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(44, 20, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(45, 21, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(46, 22, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(47, 23, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(48, 24, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(49, 25, 6, '4a', '2017/09/10', 2, 3, NULL, '10/10/2018'),
(50, 26, 6, '4a', '2017/09/10', 1, 3, NULL, '10/10/2018'),
(51, 27, 11, '5a', '2018/10/15', 2, 8, NULL, '15/10/2018'),
(52, 28, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(53, 29, 11, '5a', '2018/10/15', 2, 8, NULL, '15/10/2018'),
(54, 30, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(55, 31, 11, '5a', '2018/10/15', 2.5, 8, NULL, '15/10/2018'),
(56, 32, 11, '5a', '2018/10/15', 0.25, 8, NULL, '15/10/2018'),
(57, 33, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(58, 34, 11, '5a', '2018/10/15', 3, 8, NULL, '15/10/2018'),
(59, 35, 11, '5a', '2018/10/15', 2.5, 8, NULL, '15/10/2018'),
(60, 36, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(61, 37, 11, '5a', '2018/10/15', 2.75, 8, NULL, '15/10/2018'),
(62, 38, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(63, 39, 11, '5a', '2018/10/15', 2.5, 8, NULL, '15/10/2018'),
(64, 40, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(65, 41, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(66, 42, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(67, 43, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(68, 44, 11, '5a', '2018/10/15', 2, 8, NULL, '15/10/2018'),
(69, 45, 11, '5a', '2018/10/15', 2, 8, NULL, '15/10/2018'),
(70, 46, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(71, 47, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(72, 48, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(73, 49, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(74, 50, 11, '5a', '2018/10/15', 0.5, 8, NULL, '15/10/2018'),
(75, 51, 11, '5a', '2018/10/15', 1, 8, NULL, '15/10/2018'),
(76, 2, 16, '3a', '2016/09/11', 1.5, 3, NULL, '20/10/2018'),
(77, 3, 16, '3a', '2016/09/11', 1.5, 3, NULL, '20/10/2018'),
(78, 4, 16, '3a', '2016/09/11', 2.25, 3, NULL, '20/10/2018'),
(79, 5, 16, '3a', '2016/09/11', 0.25, 3, NULL, '20/10/2018'),
(80, 6, 16, '3a', '2016/09/11', 1.25, 3, NULL, '20/10/2018'),
(81, 7, 16, '3a', '2016/09/11', 0.5, 3, NULL, '20/10/2018'),
(82, 8, 16, '3a', '2016/09/11', 0.25, 3, NULL, '20/10/2018'),
(83, 9, 16, '3a', '2016/09/11', 2.5, 3, NULL, '20/10/2018'),
(84, 10, 16, '3a', '2016/09/11', 2.25, 3, NULL, '20/10/2018'),
(85, 11, 16, '3a', '2016/09/11', 1.25, 3, NULL, '20/10/2018'),
(86, 12, 16, '3a', '2016/09/11', 2.25, 3, NULL, '20/10/2018'),
(87, 13, 16, '3a', '2016/09/11', 0.25, 3, NULL, '20/10/2018'),
(88, 14, 16, '3a', '2016/09/11', 1.75, 3, NULL, '20/10/2018'),
(89, 15, 16, '3a', '2016/09/11', 0.5, 3, NULL, '20/10/2018'),
(90, 16, 16, '3a', '2016/09/11', 0.25, 3, NULL, '20/10/2018'),
(91, 17, 16, '3a', '2016/09/11', 2.75, 3, NULL, '20/10/2018'),
(92, 18, 16, '3a', '2016/09/11', 1.75, 3, NULL, '20/10/2018'),
(93, 19, 16, '3a', '2016/09/11', 1.25, 3, NULL, '20/10/2018'),
(94, 20, 16, '3a', '2016/09/11', 1.5, 3, NULL, '20/10/2018'),
(95, 21, 16, '3a', '2016/09/11', 0.75, 3, NULL, '20/10/2018'),
(96, 22, 16, '3a', '2016/09/11', 1.25, 3, NULL, '20/10/2018'),
(97, 23, 16, '3a', '2016/09/11', 0.25, 3, NULL, '20/10/2018'),
(98, 24, 16, '3a', '2016/09/11', 0.75, 3, NULL, '20/10/2018'),
(99, 25, 16, '3a', '2016/09/11', 1.5, 3, NULL, '20/10/2018'),
(100, 26, 16, '3a', '2016/09/11', 0.75, 3, NULL, '20/10/2018'),
(101, 2, 21, '2a', '2015/09/18', 1.25, 3, NULL, '20/10/2018'),
(102, 3, 21, '2a', '2015/09/18', 1, 3, NULL, '20/10/2018'),
(103, 4, 21, '2a', '2015/09/18', 2, 3, NULL, '20/10/2018'),
(104, 5, 21, '2a', '2015/09/18', 0, 3, NULL, '20/10/2018'),
(105, 6, 21, '2a', '2015/09/18', 1, 3, NULL, '20/10/2018'),
(106, 7, 21, '2a', '2015/09/18', 0, 3, NULL, '20/10/2018'),
(107, 8, 21, '2a', '2015/09/18', 2.5, 3, NULL, '20/10/2018'),
(108, 9, 21, '2a', '2015/09/18', 2, 3, NULL, '20/10/2018'),
(109, 10, 21, '2a', '2015/09/18', 2.25, 3, NULL, '20/10/2018'),
(110, 11, 21, '2a', '2015/09/18', 1, 3, NULL, '20/10/2018'),
(111, 12, 21, '2a', '2015/09/18', 2, 3, NULL, '20/10/2018'),
(112, 13, 21, '2a', '2015/09/18', 0, 3, NULL, '20/10/2018'),
(113, 14, 21, '2a', '2015/09/18', 1.5, 3, NULL, '20/10/2018'),
(114, 15, 21, '2a', '2015/09/18', 0.5, 3, NULL, '20/10/2018'),
(115, 16, 21, '2a', '2015/09/18', 0, 3, NULL, '20/10/2018'),
(116, 17, 21, '2a', '2015/09/18', 2.5, 3, NULL, '20/10/2018'),
(117, 18, 21, '2a', '2015/09/18', 1.75, 3, NULL, '20/10/2018'),
(118, 19, 21, '2a', '2015/09/18', 1, 3, NULL, '20/10/2018'),
(119, 20, 21, '2a', '2015/09/18', 1.25, 3, NULL, '20/10/2018'),
(120, 21, 21, '2a', '2015/09/18', 0.5, 3, NULL, '20/10/2018'),
(121, 22, 21, '2a', '2015/09/18', 1, 3, NULL, '20/10/2018'),
(122, 23, 21, '2a', '2015/09/18', 0, 3, NULL, '20/10/2018'),
(123, 24, 21, '2a', '2015/09/18', 0.75, 3, NULL, '20/10/2018'),
(124, 25, 21, '2a', '2015/09/18', 1.25, 3, NULL, '20/10/2018'),
(125, 26, 21, '2a', '2015/09/18', 0.5, 3, NULL, '20/10/2018'),
(126, 2, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(127, 3, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(128, 4, 26, '1a', '2014/10/18', 1.5, 3, NULL, '20/10/2018'),
(129, 5, 26, '1a', '2014/10/18', 0, 3, NULL, '20/10/2018'),
(130, 6, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(131, 7, 26, '1a', '2014/10/18', 0, 3, NULL, '20/10/2018'),
(132, 8, 26, '1a', '2014/10/18', 2, 3, NULL, '20/10/2018'),
(133, 9, 26, '1a', '2014/10/18', 1.75, 3, NULL, '20/10/2018'),
(134, 10, 26, '1a', '2014/10/18', 2, 3, NULL, '20/10/2018'),
(135, 11, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(136, 12, 26, '1a', '2014/10/18', 2, 3, NULL, '20/10/2018'),
(137, 13, 26, '1a', '2014/10/18', 0, 3, NULL, '20/10/2018'),
(138, 14, 26, '1a', '2014/10/18', 1.25, 3, NULL, '20/10/2018'),
(139, 15, 26, '1a', '2014/10/18', 0.5, 3, NULL, '20/10/2018'),
(140, 16, 26, '1a', '2014/10/18', 0, 3, NULL, '20/10/2018'),
(141, 17, 26, '1a', '2014/10/18', 2, 3, NULL, '20/10/2018'),
(142, 18, 26, '1a', '2014/10/18', 1.5, 3, NULL, '20/10/2018'),
(143, 19, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(144, 20, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(145, 21, 26, '1a', '2014/10/18', 0.25, 3, NULL, '20/10/2018'),
(146, 22, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(147, 23, 26, '1a', '2014/10/18', 0, 3, NULL, '20/10/2018'),
(148, 24, 26, '1a', '2014/10/18', 0.5, 3, NULL, '20/10/2018'),
(149, 25, 26, '1a', '2014/10/18', 1, 3, NULL, '20/10/2018'),
(150, 26, 26, '1a', '2014/10/18', 0.5, 3, NULL, '20/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role_id` int(50) NOT NULL,
  `role_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`role_id`, `role_name`) VALUES
(1, 'Bác sĩ'),
(2, 'Y tế học đường'),
(3, 'Cán bộ trường học'),
(4, 'Quản trị hệ thống');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school`
--

CREATE TABLE `tbl_school` (
  `school_id` int(50) NOT NULL,
  `school_name` text NOT NULL,
  `school_address` text NOT NULL,
  `school_phone` text NOT NULL,
  `school_email` text NOT NULL,
  `school_managercode` text NOT NULL,
  `school_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_school`
--

INSERT INTO `tbl_school` (`school_id`, `school_name`, `school_address`, `school_phone`, `school_email`, `school_managercode`, `school_createdate`) VALUES
(120, 'Trường tiểu học Ba Đình', 'Số 145 Hoàng Hoa Thám', '438471371', 'badinhschool@gmail.com', 'CB01', '10/10/2018'),
(121, 'Trường tiểu học Đại Yên', 'Số 167 Phố Đội Cấn', '437221272', 'daiyenschool@gmail.com', 'CB02', '10/10/2018'),
(122, 'Trường tiểu học Dl Hà Nội', 'Ngõ 463 Phố Đội Cấn', '437626425', 'dlhanoischool@gmail.com', 'CB03', '10/10/2018'),
(123, 'Trường tiểu học Hoàng Diệu', 'Số 526 Phố Đội Cấn', '437660881', 'hoangdieuschool@gmail.com', 'CB04', '10/10/2018'),
(124, 'Trường tiểu học Hoàng Hoa Thám', 'Số 2 Phố Vĩnh Phúc', '437611279', 'hoanghoathamschool@gmail.com', 'CB05', '10/10/2018'),
(125, 'Trường tiểu học Kim Đồng', 'Phố Trần Huy Liệu', '438452179', 'kimdongschool@gmail.com', 'CB06', '10/10/2018'),
(126, 'Trường tiểu học Nghĩa Dũng', 'Số 55 Phố Nghĩa Dũng', '437167079', 'nghiadungschool@gmail.com', 'CB07', '10/10/2018'),
(127, 'Trường tiểu học Ngọc Hà', 'Hồ B52 Làng Ngọc Hà', '438235180', 'ngochaschool@gmail.com', 'CB08', '10/10/2018'),
(128, 'Trường tiểu học Ngọc Khánh', 'Số 5 Phố Nguyễn Công Hoan', '437717711', 'ngockhanhschool@gmail.com', 'CB09', '10/10/2018'),
(129, 'Trường tiểu học Nguyễn Bá Ngọc', 'Số 18 Ngõ 294 Phố Đội Cấn', '437625771', 'nguyenbangocschool@gmail.com', 'CB10', '10/10/2018'),
(130, 'Trường tiểu học Nguyễn Tri Phương', 'Số 190 Phố Quán Thánh', '437164979', 'nguyentriphuongschool@gmail.com', 'CB11', '10/10/2018'),
(131, 'Trường tiểu học Nguyễn Trung Trực', 'Số 23 Phố Nguyễn Trung Trực', '438261441', 'nguyentrungtrucschool@gmail.com', 'CB12', '10/10/2018'),
(132, 'Trường tiểu học Phan Chu Trinh', 'Số 40 Phố Nguyễn Thái Học', '437470473', 'phanchutrinhschool@gmail.com', 'CB13', '10/10/2018'),
(133, 'Trường tiểu học Thành Công A', 'Khu D – Tt Thành Công', '438359766', 'thanhcongaschool@gmail.com', 'CB14', '10/10/2018'),
(134, 'Trường tiểu học Thành Công B', 'Khu D – Tt Thành Công', '438313385', 'thanhcongbschool@gmail.com', 'CB15', '10/10/2018'),
(135, 'Trường tiểu học Thủ Lệ', 'Tt Thủ Lệ 2', '438346946', 'thuleschool@gmail.com', 'CB16', '10/10/2018'),
(136, 'Trường tiểu học Vạn Phúc', 'Ngõ 294 Phố Đội Cấn', '438236477', 'vanphucschool@gmail.com', 'CB17', '10/10/2018'),
(137, 'Trường tiểu học Việt Nam – Cu Ba', 'Số 105 Phố Nguyễn Trường Tộ', '437161175', 'vietnamcubaschool@gmail.com', 'CB18', '10/10/2018'),
(138, 'Trường tiểu học Bc Tràng An', '29 Nhà Chung', '438288854', 'bctranganschool@gmail.com', 'CB19', '10/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `stu_id` int(50) NOT NULL,
  `stu_code` text NOT NULL,
  `stu_name` text NOT NULL,
  `stu_gender` text NOT NULL,
  `stu_birthday` text NOT NULL,
  `stu_birthplace` text NOT NULL,
  `stu_address` text NOT NULL,
  `class_id` int(50) NOT NULL,
  `academicYear_id` int(11) NOT NULL,
  `stu_fathername` text NOT NULL,
  `stu_fatherphone` text NOT NULL,
  `stu_mothername` text NOT NULL,
  `stu_motherphone` text NOT NULL,
  `stu_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`stu_id`, `stu_code`, `stu_name`, `stu_gender`, `stu_birthday`, `stu_birthplace`, `stu_address`, `class_id`, `academicYear_id`, `stu_fathername`, `stu_fatherphone`, `stu_mothername`, `stu_motherphone`, `stu_createdate`) VALUES
(2, '1141440032', 'Phạm Thị Vân Anh', 'Nữ', '20/02/2008', 'Yên Bái', 'Hà Nội', 1, 3, 'Phạm  Văn An', '914656822', 'Bùi Thị Kim Anh', '969203254', '10/10/2018'),
(3, '1141440005', 'Trịnh Thị Mai Anh', 'Nữ', '20/02/2008', 'Hà Nội', 'Hà Nội', 1, 3, 'Trịnh Văn Anh', '983977695', 'Hoàng Thùy Anh', '971509592', '10/10/2018'),
(4, '1141440024', 'Đỗ Mai Chi', 'Nữ', '20/02/2008', 'Lào Cai', 'Hà Nội', 1, 3, 'Đỗ Văn Bằng', '353747837', 'Huỳnh Thị Ngọc Anh', '1689548479', '10/10/2018'),
(5, '1141440037', 'Hà Kim Chi', 'Nữ', '20/02/2008', 'Cao Bằng', 'Hà Nội', 1, 3, 'Hà Văn Bình', '971949599', 'Nguyễn Thị Lan Anh', '1689863278', '10/10/2018'),
(6, '1141440051', 'Nguyễn Mạnh Cường', 'Nam', '20/02/2008', 'Lạng Sơn', 'Hà Nội', 1, 3, 'Nguyễn Văn Bộ', '354905728', 'Nguyễn Thiên Anh', '327242750', '10/10/2018'),
(7, '1141440053', 'Nguyễn Tiến Đạt', 'Nam', '20/02/2008', 'Sơn La', 'Hà Nội', 1, 3, 'Nguyễn Văn Chiến', '981898596', 'Phí Thị Ngọc Anh', '355619456', '10/10/2018'),
(8, '1141440035', 'Phạm Phúc Đạt', 'Nam', '20/02/2008', 'Đà Nẵng', 'Hà Nội', 1, 3, 'Phạm  Văn Đình', '397304744', 'Trần Thị Lan Anh', '396544273', '10/10/2018'),
(9, '1141440057', 'Phạm Văn Đạt', 'Nam', '20/02/2008', 'Nghệ An', 'Hà Nội', 1, 3, 'Phạm  Văn Đức', '963711662', 'Trần Thị Phương Anh', '1635960622', '10/10/2018'),
(10, '1141440040', 'Trịnh Thùy Dung', 'Nữ', '20/02/2008', 'Thái Bình', 'Hà Nội', 1, 3, 'Trịnh Văn Đức', '966107463', 'Đặng Thị Linh Chi', '345505538', '10/10/2018'),
(11, '1141440056', 'Vũ Huy Dũng', 'Nam', '20/02/2008', 'Hải Phòng', 'Hà Nội', 1, 3, 'Vũ Văn Giang', '962233213', 'Phạm Thị Hồng Vân', '384797947', '10/10/2018'),
(12, '1141440011', 'Chu Thị Duyên', 'Nữ', '20/02/2008', 'Quảng Ninh', 'Hà Nội', 1, 3, 'Chu Văn Hải', '359470215', 'Đinh Thị Thuý Diệu', '356015826', '10/10/2018'),
(13, '1141440025', 'Nguyễn Thu Hà', 'Nữ', '20/02/2008', 'Nghệ Tĩnh', 'Hà Nội', 1, 3, 'Nguyễn Văn Hiệp', '837066466', 'Trần Thị Thu Trang', '332749514', '10/10/2018'),
(14, '1141440049', 'Nguyễn Thị Mỹ Hạnh', 'Nữ', '20/02/2008', 'Phú Thọ', 'Hà Nội', 1, 3, 'Nguyễn Văn Hiệp', '346503040', 'Bùi Thị Phương Dung', '982884713', '10/10/2018'),
(15, '1141440038', 'Nguyễn Văn Hiền', 'Nữ', '20/02/2008', 'Yên Bái', 'Hà Nội', 1, 3, 'Nguyễn Văn Hiệu', '1679933562', 'Nguyễn Thị Phương Dung', '961951195', '10/10/2018'),
(16, '1141440036', 'Lê Minh Hiếu', 'Nam', '20/02/2008', 'Hà Nội', 'Hà Nội', 1, 3, 'Lê Văn Hòa', '345480567', 'Mai Hồng Duyên', '969308360', '10/10/2018'),
(17, '1141440002', 'Tăng Thị Hoa', 'Nữ', '20/02/2008', 'Lào Cai', 'Hà Nội', 1, 3, 'Tăng  Văn Hoàng', '395839078', 'Đào Thị Giang', '968533074', '10/10/2018'),
(18, '1141440001', 'Trương Thị Hòa', 'Nữ', '20/02/2008', 'Cao Bằng', 'Hà Nội', 1, 3, 'Trương Văn Hoàng', '388114448', 'Vũ Thị Giang', '912470822', '10/10/2018'),
(19, '1141440026', 'Nguyễn Thị Thu Hoài', 'Nữ', '20/02/2008', 'Lạng Sơn', 'Hà Nội', 1, 3, 'Nguyễn Văn Hoàng', '1648414597', 'Lê Thị Hằng', '964104647', '10/10/2018'),
(20, '1141440010', 'Đàm Thị Minh Huê', 'Nữ', '20/02/2008', 'Sơn La', 'Hà Nội', 1, 3, 'Đàm Văn Hoàng', '337383611', 'Nguyễn Thanh Hằng', '386138536', '10/10/2018'),
(21, '1141440018', 'Hà Văn Hùng', 'Nam', '20/02/2008', 'Đà Nẵng', 'Hà Nội', 1, 3, 'Hà Văn Hùng', '362225161', 'Chu Thị Mỹ Hạnh', '394543066', '10/10/2018'),
(22, '1141440048', 'Nguyễn Xuân Hưng', 'Nam', '20/02/2008', 'Nghệ An', 'Hà Nội', 1, 3, 'Nguyễn Văn Hưng', '965772097', 'Nguyễn Thị Hảo', '359629370', '10/10/2018'),
(23, '1141440017', 'Đinh Thị Hương', 'Nữ', '20/02/2008', 'Thái Bình', 'Hà Nội', 1, 3, 'Đinh  Văn Hưng', '948659902', 'Lê Thị Hậu', '395570599', '10/10/2018'),
(24, '1141440045', 'Nguyễn Quang Huy', 'Nam', '20/02/2008', 'Hải Phòng', 'Hà Nội', 1, 3, 'Nguyễn Văn Huy', '369151341', 'Bùi Thị Thu Hiền', '963555402', '10/10/2018'),
(25, '1141440050', 'Hà Thị Ngọc Huyền', 'Nữ', '20/02/2008', 'Quảng Ninh', 'Hà Nội', 1, 3, 'Hà Văn Huynh', '365997303', 'Đào Thị Thu Hiền', '977468402', '10/10/2018'),
(26, '1141440054', 'Nguyễn Thị Ngọc Huyền', 'Nữ', '20/02/2008', 'Nghệ Tĩnh', 'Hà Nội', 1, 3, 'Nguyễn Văn Kiên', '989460737', 'Phùng Phương Hoa', '339381195', '10/10/2018'),
(27, '1141440028', 'Nguyễn Thị Thu Huyền', 'Nữ', '15/11/2008', 'Phú Thọ', 'Hà Nội', 11, 8, 'Nguyễn Văn Lâm', '378053635', 'Trần Huy Hoàng', '914656822', '12/10/2018'),
(28, '1141440016', 'Phan Đình Khải', 'Nam', '15/11/2008', 'Yên Bái', 'Hà Nội', 11, 8, 'Phan  Văn Lập', '961013970', 'Hoàng Ánh Hồng', '983977695', '12/10/2018'),
(29, '1141440022', 'Hoàng Thị Kiều', 'Nữ', '15/11/2008', 'Hà Nội', 'Hà Nội', 11, 8, 'Hoàng Văn Lợi', '387479998', 'Nguyễn Thị Hồng', '353747837', '12/10/2018'),
(30, '1141440039', 'Đỗ Thị Linh', 'Nữ', '15/11/2008', 'Lào Cai', 'Hà Nội', 11, 8, 'Đỗ Văn Long', '988534197', 'Nguyễn Thị Hương', '971949599', '12/10/2018'),
(31, '1141440044', 'Phạm Văn Lĩnh', 'Nữ', '15/11/2008', 'Cao Bằng', 'Hà Nội', 11, 8, 'Phạm  Văn Lý', '374316032', 'Nguyễn Thị Lan Hương', '354905728', '12/10/2018'),
(32, '1141440043', 'Nguyễn Hải Lý', 'Nam', '15/11/2008', 'Lạng Sơn', 'Hà Nội', 11, 8, 'Nguyễn Văn Mạnh', '', 'Nguyễn Thị Thu Hướng', '981898596', '12/10/2018'),
(33, '1141440033', 'Vũ Thị Lý', 'Nữ', '15/11/2008', 'Sơn La', 'Hà Nội', 11, 8, 'Vũ Văn Ngọc', '971896897', 'Đỗ Thị Xuân Hường', '397304744', '12/10/2018'),
(34, '1141440006', 'Nguyễn Thị Hương Mai', 'Nữ', '15/11/2008', 'Đà Nẵng', 'Hà Nội', 11, 8, 'Nguyễn Văn Nhiên', '393236508', 'Nguyễn Thị Hường', '963711662', '12/10/2018'),
(35, '1141440013', 'Nguyễn Thị Thanh Mai', 'Nữ', '15/11/2008', 'Nghệ An', 'Hà Nội', 11, 8, 'Nguyễn Văn Phong', '349207558', 'Đặng Thị Huyền', '966107463', '12/10/2018'),
(36, '1141440015', 'Vương Đắc Mạnh', 'Nam', '15/11/2008', 'Thái Bình', 'Hà Nội', 11, 8, 'Vương Văn Phòng', '961717593', 'Đoàn Thị Thanh Huyền', '962233213', '12/10/2018'),
(37, '1141440003', 'Phạm Thị Hà My', 'Nữ', '15/11/2008', 'Hải Phòng', 'Hà Nội', 11, 8, 'Phạm  Văn Phương', '384076805', 'Nguyễn Thị Huyền', '359470215', '12/10/2018'),
(38, '1141440021', 'Nguyễn Thị Nhàn', 'Nữ', '15/11/2008', 'Quảng Ninh', 'Hà Nội', 11, 8, 'Nguyễn Văn Sơn', '384149481', 'Phùng Thị Huyền', '837066466', '12/10/2018'),
(39, '1141440027', 'Nguyễn Hoàng Ninh', 'Nam', '15/11/2008', 'Nghệ Tĩnh', 'Hà Nội', 11, 8, 'Nguyễn Văn Tân', '967803523', 'Bùi Thị Lan', '346503040', '12/10/2018'),
(40, '1141440023', 'Vũ Trọng Phúc', 'Nam', '15/11/2008', 'Phú Thọ', 'Hà Nội', 11, 8, 'Vũ Văn Thắng', '968954840', 'Phi Thị Lan', '1679933562', '12/10/2018'),
(41, '1141440020', 'Nguyễn Xuân Quyền', 'Nam', '15/11/2008', 'Yên Bái', 'Hà Nội', 11, 8, 'Nguyễn Văn Thắng', '342406825', 'Đỗ Khánh Linh', '345480567', '12/10/2018'),
(42, '1141440029', 'Đào Như Quỳnh', 'Nữ', '15/11/2008', 'Hà Nội', 'Hà Nội', 11, 8, 'Đào Văn Thành', '971754793', 'Hoàng Diệu Linh', '395839078', '12/10/2018'),
(43, '1141440008', 'Lương Thị Thắm', 'Nữ', '15/11/2008', 'Lào Cai', 'Hà Nội', 11, 8, 'Lương Văn Thành', '967480133', 'Hoàng Thị Thùy Linh', '388114448', '12/10/2018'),
(44, '1141440030', 'Trịnh Hồng Thắm', 'Nữ', '15/11/2008', 'Cao Bằng', 'Hà Nội', 11, 8, 'Trịnh Văn Thế', '353609334', 'Lê Thị Diệu Linh', '1648414597', '12/10/2018'),
(45, '1141440007', 'Nguyễn Đức Thắng', 'Nam', '15/11/2008', 'Lạng Sơn', 'Hà Nội', 11, 8, 'Nguyễ Văn Thế', '373867281', 'Nguyễn Thị Linh', '337383611', '12/10/2018'),
(46, '1141440055', 'Phạm Thị Thanh', 'Nữ', '15/11/2008', 'Sơn La', 'Hà Nội', 11, 8, 'Phạm  Văn Thuận', '358327971', 'Nguyễn Thị Thùy Linh', '362225161', '12/10/2018'),
(47, '1141440042', 'Trịnh Thị Thanh', 'Nữ', '15/11/2008', 'Đà Nẵng', 'Hà Nội', 11, 8, 'Trịnh Văn Thuận', '333256203', 'Phạm Thị Thùy Linh', '965772097', '12/10/2018'),
(48, '1141440047', 'Dương Thị Thu', 'Nữ', '15/11/2008', 'Nghệ An', 'Hà Nội', 11, 8, 'Dương Văn Thụy', '982098606', 'Tăng Lê Khánh Loan', '948659902', '12/10/2018'),
(49, '1141440019', 'Thịnh Thị Thu', 'Nữ', '15/11/2008', 'Thái Bình', 'Hà Nội', 11, 8, 'Thịnh Văn Toàn', '964637683', 'Vũ Thị Thanh Loan', '369151341', '12/10/2018'),
(50, '1141440034', 'Lưu Thị Thương', 'Nữ', '15/11/2008', 'Hải Phòng', 'Hà Nội', 11, 8, 'Lưu Văn Trí', '1666531661', 'Hoàng Thị Mai', '365997303', '12/10/2018'),
(51, '1141440046', 'Hoàng Thị Thúy', 'Nữ', '15/11/2008', 'Quảng Ninh', 'Hà Nội', 11, 8, 'Hoàng Văn Trường', '969203254', 'Nguyễn Thị Kiều Mai', '989460737', '12/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(50) NOT NULL,
  `user_fullname` text NOT NULL,
  `user_birthday` text NOT NULL,
  `user_gender` text NOT NULL,
  `user_phone` text NOT NULL,
  `user_email` text NOT NULL,
  `user_address` text NOT NULL,
  `user_work` text NOT NULL,
  `user_company` text NOT NULL,
  `acc_code` text NOT NULL,
  `user_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fullname`, `user_birthday`, `user_gender`, `user_phone`, `user_email`, `user_address`, `user_work`, `user_company`, `acc_code`, `user_createdate`) VALUES
(2, 'Cao Văn Học', '20/07/1997', 'Nam', '0955255361', 'caovanhocuser@gmail.com', 'Hà Nội', 'bác sĩ', 'Việt Đức', 'bs001', '10/10/2018'),
(3, 'Mai Văn Học', '20/07/1997', 'Nam', '0374565545', 'maivanhocuser@gmail.com', 'Hà Nội', 'y tế học đường', 'Trường tiểu học Ba Đình', 'yte001', '10/10/2018'),
(4, 'Vũ Thị Huế', '20/07/1997', 'Nữ', '0256889999', 'vuthihueuser@gmail.com', 'Hà Nội', 'admin', '3F Group', 'admin001', '10/10/2018'),
(5, 'Lê Thị Huệ', '20/07/1997', 'Nữ', '0255689754', 'lethiheuser@gmail.com', 'Hà Nội', 'cán bộ', 'Trường tiểu học Ba Đình', 'cb001', '10/10/2018'),
(7, 'Nguyễn Văn Nam', '20/07/1997', 'Nam', '0358956575', 'nguyenvannamuser@gmail.com', 'Hà Nội', 'cán bộ', 'Trường tiểu học Đại Yên', 'cb002', '10/10/2018'),
(8, 'Nguyễn Quang Duy', '20/07/1997', 'Nam', '0347569854', 'nguyenquangduyuser@gmail.com', 'Hà Nội', 'y tế', 'Trường tiểu học Đại Yên', 'yte002', '10/10/2018');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warning`
--

CREATE TABLE `tbl_warning` (
  `warning_id` int(50) NOT NULL,
  `warning_content` text NOT NULL,
  `user_id` int(50) NOT NULL,
  `warning_date` text NOT NULL,
  `warning_createdate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_academicyear`
--
ALTER TABLE `tbl_academicyear`
  ADD PRIMARY KEY (`academicYear_id`);

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `tbl_eyesight`
--
ALTER TABLE `tbl_eyesight`
  ADD PRIMARY KEY (`eyesight_id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_school`
--
ALTER TABLE `tbl_school`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`stu_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_warning`
--
ALTER TABLE `tbl_warning`
  ADD PRIMARY KEY (`warning_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_academicyear`
--
ALTER TABLE `tbl_academicyear`
  MODIFY `academicYear_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `acc_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `class_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_eyesight`
--
ALTER TABLE `tbl_eyesight`
  MODIFY `eyesight_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `role_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_school`
--
ALTER TABLE `tbl_school`
  MODIFY `school_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `stu_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_warning`
--
ALTER TABLE `tbl_warning`
  MODIFY `warning_id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
