-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2026 at 06:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bone_predict`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinical_data`
--

CREATE TABLE `clinical_data` (
  `id` varchar(255) NOT NULL,
  `patientId` varchar(255) NOT NULL,
  `weight` float DEFAULT NULL,
  `smokingStatus` varchar(255) DEFAULT NULL,
  `alcoholConsumption` varchar(255) DEFAULT NULL,
  `hasDiabetes` tinyint(1) DEFAULT NULL,
  `hasHypertension` tinyint(1) DEFAULT NULL,
  `hasOsteoporosis` tinyint(1) DEFAULT NULL,
  `probingDepth` float DEFAULT NULL,
  `cal` float DEFAULT NULL,
  `bleedingOnProbing` tinyint(1) DEFAULT NULL,
  `bleedingIndex` float DEFAULT NULL,
  `plaqueIndex` float DEFAULT NULL,
  `toothMobility` varchar(255) DEFAULT NULL,
  `gingivalPhenotype` varchar(255) DEFAULT NULL,
  `cbctImageUrl` varchar(255) DEFAULT NULL,
  `createdAt` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clinical_data`
--

INSERT INTO `clinical_data` (`id`, `patientId`, `weight`, `smokingStatus`, `alcoholConsumption`, `hasDiabetes`, `hasHypertension`, `hasOsteoporosis`, `probingDepth`, `cal`, `bleedingOnProbing`, `bleedingIndex`, `plaqueIndex`, `toothMobility`, `gingivalPhenotype`, `cbctImageUrl`, `createdAt`) VALUES
('0211dcc3-3960-496c-9718-7ab62c802143', 'P-4902', 70, 'Current', 'Occasional', 0, 1, 1, 3, 5, 1, 50, 2, 'II', 'Thick Flat', 'img_001.jpg', 1774515028862),
('1d170568-6f11-4a38-8f08-76a0c40f15b1', 'P-571852', 70, 'Never', 'Occasional', 1, 1, 1, 2, 3, 0, 10, 2, 'I', 'Thin Scalloped', 'img_004.jpg', 1773595585803),
('3d8ab499-eb45-4d02-9aab-d0887138f6b5', 'P-329212', 70, 'Never', 'Occasional', 1, 1, 1, 2, 3, 1, 25, 2, 'I', 'Thin Scalloped', 'img_004.jpg', 1773597335813),
('48128994-5b40-4ab3-a146-e490f25ed5a1', 'P-337086', 70, 'Never', 'Occasional', 1, 1, 1, 2, 3, 1, 25, 2, 'I', 'Thin Scalloped', 'img_004.jpg', 1773645356762),
('5359efcd-0651-4683-92a8-8405f35826d3', 'P-428622', 70, 'Current', 'Occasional', 0, 1, 1, 2, 3, 1, 25, 2, 'II', 'Thick Flat', 'img_001.jpg', 1774510446629),
('72ceb97c-72fe-48dc-abfc-d3dbc7303831', 'P-862979', 70, 'Former', 'Occasional', 1, 1, 1, 1, 5, 1, 25, 1, 'I', 'Thin Scalloped', 'img_004.jpg', 1773716885947),
('a71def32-3976-479f-8dd7-6cdeeda037d4', 'P-73668', 70, 'Former', 'Occasional', 0, 1, 0, 2, 1, 1, 12, 2, 'I', 'Thin Scalloped', 'img_003.jpg', 1773593091057),
('CD-8MH2HRKYP', 'P-H3DG23KUG', 70, '2', '0', 1, 0, 0, 3, 4, 1, 25, 25, '2', 'Thick', 'cbct_scan_1.png', 1773719346779);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `email`, `password`) VALUES
(1, 'Dr. Test', 'doctor@test.com', 'doctor123'),
(2, 'Devi', 'devi@gmail.com', 'devi123'),
(4, 'Devi ramya', 'deviramya@gmail.com', 'ramya123'),
(5, 'Dharani', 'dharaninarasing25@gmail.com', 'Dharani123'),
(6, 'lavanya', 'lavanyaharshuu@gmail.com', 'Lavanya123'),
(7, 'Layna', 'layna4115@gmail.com', 'Layna@123'),
(8, 'Lavanya', 'lavanya@gmail.com', 'Lav1');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(6) NOT NULL,
  `createdAt` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `email`, `otp`, `createdAt`) VALUES
(1, 'dharaninarasing25@gmail.com', '255065', 1773636399166),
(2, 'dharaninarasing25@gmail.com', '254441', 1773636910078),
(3, 'dharaninarasing25@gmail.com', '949091', 1773637557315),
(4, 'dharaninarasing25@gmail.com', '208660', 1773637817129),
(5, 'dharaninarasing25@gmail.com', '842073', 1773643509593),
(6, 'lavanyaharshuu@gmail.com', '050532', 1773652485805),
(7, 'lavanyaharshuu@gmail.com', '143433', 1773652536897),
(8, 'lavanyaharshuu@gmail.com', '480022', 1773652920920);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNumber` varchar(255) NOT NULL,
  `doctorId` varchar(255) NOT NULL,
  `createdAt` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `firstName`, `lastName`, `dob`, `gender`, `contactNumber`, `doctorId`, `createdAt`) VALUES
('P-329212', 'priya', 'patel', '22/10/2001', 'Female', '6304545093', 'Devi ramya', 1773597329212),
('P-337086', 'priya', ' patel', '23/12/2001', 'Female', '6304545093', 'Dharani', 1773645337086),
('P-428622', 'arjun', 'Kumar', '23/04/2000', 'Male', '9347659266', '6', 1774510428623),
('P-43090', 'priya', 'patel', '23/10/2001', 'Female', '9347656508', 'Devi ramya', 1773597043090),
('P-4902', 'Rahul', 'patel', '12/02/1977', 'Male', '9347659266', '5', 1774515004902),
('P-571852', 'Priya', 'patel', '23/10/1982', 'Female', '6307676093', 'Devi ramya', 1773595571852),
('P-73668', 'anita', 'verma', '22/01/2001', 'Female', '8304545093', 'Devi ramya', 1773593073668),
('P-780009', 'ravi', '', '', 'Male', '', '7', 1774686780009),
('P-850453', 'arjun', 'das', '23/01/2001', 'Male', '9246435355', 'Devi', 1773473850453),
('P-862979', 'Diya', 'John', '27/05/2006', 'Female', '9548237156', '8', 1773716862979),
('P-887907', 'devi', '', '', 'Female', '', '5', 1774772887908),
('P-AG8AG01QT', 'Arjun', 'naidu', '2001-02-12', 'Male', '93676565098', '5', 1773721696353),
('P-H3DG23KUG', 'sita', 'naidu', '2000-01-23', 'Female', '93676565098', '5', 1773719221362),
('P-qlx34ue7t', 'ram', 'kumar', '2001-01-12', 'Male', '6307878093', '5', 1773718370440);

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

CREATE TABLE `predictions` (
  `id` varchar(255) NOT NULL,
  `clinicalDataId` varchar(255) NOT NULL,
  `riskScore` float NOT NULL,
  `riskCategory` varchar(255) NOT NULL,
  `modelUsed` varchar(255) DEFAULT 'Random Forest',
  `confidenceScore` float DEFAULT NULL,
  `resultsSummary` text DEFAULT NULL,
  `createdAt` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predictions`
--

INSERT INTO `predictions` (`id`, `clinicalDataId`, `riskScore`, `riskCategory`, `modelUsed`, `confidenceScore`, `resultsSummary`, `createdAt`) VALUES
('0c714783-2540-49f1-b3db-ffdc9c7eff50', '72ceb97c-72fe-48dc-abfc-d3dbc7303831', 0.85, 'High Risk', 'Random Forest', 0.92, 'High Risk', 1773716950282),
('abab567c-41a3-4a3d-b9a7-a6d40d41f405', '5359efcd-0651-4683-92a8-8405f35826d3', 0.15, 'Low Risk', 'Random Forest', 0.92, 'Low Risk', 1774510506091),
('b94e026a-9da7-4336-be1f-623affd234e8', '48128994-5b40-4ab3-a146-e490f25ed5a1', 0.15, 'Low Risk', 'Random Forest', 0.92, 'Low Risk', 1773645390075),
('bb20a9a8-7e16-4168-ae32-d919f72b927f', '1d170568-6f11-4a38-8f08-76a0c40f15b1', 0.85, 'High Risk', 'Random Forest', 0.92, 'High Risk', 1773595616435),
('ec1425ec-a7b2-493d-9956-b7d6487b8922', '3d8ab499-eb45-4d02-9aab-d0887138f6b5', 0.15, 'Low Risk', 'Random Forest', 0.92, 'Low Risk', 1773597384592),
('PR-CNZL8UKAK', 'CD-8MH2HRKYP', 85, 'High Risk', 'RandomForest-v1', 0.92, 'AI analysis completed for patient P-H3DG23KUG. Result: High Risk', 1773719346779);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` text DEFAULT NULL,
  `specialty` text DEFAULT NULL,
  `institution` text DEFAULT NULL,
  `license_no` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `specialty`, `institution`, `license_no`) VALUES
(1, 'Dr. Test', 'doctor@test.com', 'doctor123', NULL, 'Periodontics', 'City Hospital', NULL),
(2, 'shyam', 'shyam@gmail.com', 'shyam@123', NULL, NULL, NULL, NULL),
(5, 'shyam', 'shyam12@gmail.com', 'shyam@123', NULL, NULL, NULL, NULL),
(6, 'lara', 'lara12@gmail.com', 'lara@12', NULL, NULL, NULL, NULL),
(7, 'Ram', 'ram12@gmail.com', 'ram@123', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinical_data`
--
ALTER TABLE `clinical_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predictions`
--
ALTER TABLE `predictions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clinicalDataId` (`clinicalDataId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinical_data`
--
ALTER TABLE `clinical_data`
  ADD CONSTRAINT `clinical_data_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `predictions`
--
ALTER TABLE `predictions`
  ADD CONSTRAINT `predictions_ibfk_1` FOREIGN KEY (`clinicalDataId`) REFERENCES `clinical_data` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
