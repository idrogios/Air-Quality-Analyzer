-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2021 at 09:50 AM
-- Server version: 10.3.31-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lessons_air-quality`
--

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE IF NOT EXISTS `metrics` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_id` int(5) NOT NULL,
  `pm2_5` int(5) NOT NULL,
  `pm10` int(5) NOT NULL,
  `temp` int(5) NOT NULL,
  `humidity` int(5) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`m_id`, `sch_id`, `pm2_5`, `pm10`, `temp`, `humidity`, `date`) VALUES
(61, 2, 40, 47, 30, 50, '2021-10-12 13:39:24'),
(62, 2, 45, 45, 27, 51, '2021-10-12 14:39:24'),
(63, 2, 60, 68, 27, 73, '2021-10-12 15:39:24'),
(64, 3, 34, 42, 21, 82, '2021-10-13 13:39:24'),
(65, 3, 55, 60, 29, 59, '2021-10-13 14:39:24'),
(66, 3, 65, 63, 22, 77, '2021-10-13 15:39:24'),
(68, 1, 34, 34, 22, 68, '2021-10-15 15:26:22'),
(70, 1, 27, 27, 22, 67, '2021-10-15 15:26:58'),
(74, 1, 45, 45, 24, 64, '2021-10-15 15:35:53'),
(75, 1, 27, 27, 23, 66, '2021-10-15 15:48:36'),
(79, 1, 221, 244, 25, 54, '2021-10-16 08:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `sch_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `sch_name` varchar(60) NOT NULL,
  `sch_lat` decimal(8,6) NOT NULL,
  `sch_long` decimal(9,7) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`sch_id`, `sch_name`, `sch_lat`, `sch_long`, `password`) VALUES
(1, 'Idrogeios Education', '40.601783', '22.9691718', '$2y$10$SWRyb2dpb3MgMzFzdCBNaOVjLFC2odqMwUyd/n/m/3lG/B8MgcLG6'),
(2, '31st Middle School', '40.622148', '22.9527832', '$2y$10$SWRyb2dpb3MgNHRoIEd5bOx2Uy8SlAwWeih9CwRrlU6M8pxdm0W9e'),
(3, 'Vassiliadis', '40.551700', '23.0023240', '$2y$10$SWRyb2dpb3MgVmFzc2lsaOAKbIP7ZKUml3AfcU1fXzhFCpV88FuAO');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
