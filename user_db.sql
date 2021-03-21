-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2021 at 02:02 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `client_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_table`
--

CREATE TABLE `client_table` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(45) NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `rev` float NOT NULL
);

--
-- Dumping data for table `client_table`
--

INSERT INTO `client_table` (`id`, `name`, `location`, `lat`, `lon`, `rev`) VALUES
(1, 'Dr. P. Vinay Rao Clinic', 'Virar', 19.4522, 72.8078, 2),
(3, 'The Heart Clinic', 'Virar', 19.402, 72.8387, 4.7),
(4, 'ACE Heart Clinic', 'Borivali', 19.2161, 72.8488, 4.9),
(5, 'Madhavbaug Clinic', 'Borivali', 19.2279, 72.8477, 2.8),
(6, 'Cardicare Preventive Heart Clinic', 'Dahisar', 19.2539, 72.8584, 2),
(7, 'Anjana Heart Clinic And Diagnostic Center', 'Kurla', 19.0865, 72.8879, 4.7),
(8, 'Saaol Heart Center', 'Vile Parle', 19.0973, 72.8499, 4.2),
(9, 'HRUDAY HEART CARE ', 'Kandivali', 19.21, 72.8671, 5),
(10, 'Daxini Heart Center', 'Mulund', 19.1757, 72.9526, 4.9),
(11, 'Varun Cardiac Clinic', 'Ghatkopar', 19.0824, 72.9052, 3.9),
(12, 'Mumbai Heart Clinic', 'Chembur', 19.0695, 72.9038, 4.7),
(13, 'Healing Hearts Cardiac Clinic', 'Vile Parle', 19.1059, 72.841, 4.2),
(14, 'Merchant Cardiac Clinic', 'Bandra', 19.0552, 72.8299, 5),
(15, 'Dr. Amonkars Cardiac Clinic', 'Thane', 19.2284, 72.9756, 5),
(16, 'Aaradhya Cardiac Care', 'Andheri', 19.1376, 72.8259, 5),
(17, 'Pulse Cardiac Center', 'Dadar', 19.0157, 72.844, 5),
(18, 'H2H Cardiac Center', 'Sanpada', 19.0626, 73.0025, 4.9),
(19, 'Soham Clinic & Cardiac Diagnostic Center', 'Nerul', 19.0336, 73.0169, 3.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_table`
--
-- ALTER TABLE `client_table`
--   ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_table`
--
-- ALTER TABLE `client_table`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
