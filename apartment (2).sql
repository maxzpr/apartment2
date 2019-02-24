-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2019 at 04:13 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apartment`
--

-- --------------------------------------------------------

--
-- Table structure for table `aparts`
--

CREATE TABLE `aparts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elect` float DEFAULT NULL,
  `water` float DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aparts`
--

INSERT INTO `aparts` (`id`, `name`, `elect`, `water`, `detail`, `shname`, `updated_at`, `created_at`) VALUES
(1, 'test', 250000, 25, '-----', 'TS', '2019-01-17', '2019-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `ap_id` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `room_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `water_number` int(11) DEFAULT NULL,
  `elect_number` int(11) DEFAULT NULL,
  `bwater_number` mediumint(9) DEFAULT NULL,
  `belect_number` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `ap_id`, `month`, `year`, `room_id`, `water_number`, `elect_number`, `bwater_number`, `belect_number`, `note`, `updated_at`, `created_at`) VALUES
(1, 1, 1, 2562, 'TS_101', 102, 105, 1, 1, NULL, '2019-01-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

CREATE TABLE `board` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `datetime` datetime(6) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`id`, `name`, `price`, `updated_at`, `created_at`) VALUES
(1, 'ค่าทีวี', 400, '2019-01-17', '2019-01-17'),
(2, 'ค่าตู้เย็น', 300, '2019-02-07', '2019-02-07');

-- --------------------------------------------------------

--
-- Table structure for table `cost_normal`
--

CREATE TABLE `cost_normal` (
  `cost_nm_id` int(11) NOT NULL,
  `elect` varchar(45) DEFAULT NULL,
  `water` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost_save`
--

CREATE TABLE `cost_save` (
  `cost_save_id` int(11) NOT NULL,
  `rent` int(11) DEFAULT NULL,
  `elect` float DEFAULT NULL,
  `water` float DEFAULT NULL,
  `room_id` varchar(45) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `elect_num_new` varchar(45) DEFAULT NULL,
  `water_num_new` varchar(45) DEFAULT NULL,
  `elect_num_old` varchar(45) DEFAULT NULL,
  `water_num_old` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` varchar(100) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `rent` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `cost` text,
  `roomer` int(11) DEFAULT NULL,
  `ap_id` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_empty` tinyint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `type_id`, `rent`, `status`, `cost`, `roomer`, `ap_id`, `updated_at`, `created_at`, `type`, `is_empty`) VALUES
('MR001', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('TS_101', NULL, 2500, 0, '', 2, 1, '2019-02-07', '2019-01-17', 'พัดลม', 0),
('TS_102', NULL, 3500, 0, '1,2', 3, 1, '2019-02-07', '2019-02-07', 'แอร์', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `status`) VALUES
(1, 'admin', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aparts`
--
ALTER TABLE `aparts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`board_id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cost_normal`
--
ALTER TABLE `cost_normal`
  ADD PRIMARY KEY (`cost_nm_id`);

--
-- Indexes for table `cost_save`
--
ALTER TABLE `cost_save`
  ADD PRIMARY KEY (`cost_save_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
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
-- AUTO_INCREMENT for table `aparts`
--
ALTER TABLE `aparts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cost_normal`
--
ALTER TABLE `cost_normal`
  MODIFY `cost_nm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
