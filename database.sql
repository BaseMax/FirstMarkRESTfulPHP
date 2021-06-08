-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 08, 2021 at 11:19 PM
-- Server version: 10.5.10-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FirstMarkRESTfulPHP`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `phoneNumber` varchar(17) COLLATE utf8mb4_persian_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `username` varchar(36) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `biography` varchar(256) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `website` varchar(256) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `image` int(10) UNSIGNED DEFAULT NULL,
  `datetimeRegister` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '1=active, 2=without verification'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `phoneNumber`, `name`, `username`, `biography`, `website`, `image`, `datetimeRegister`, `status`) VALUES
(1, '989134950787', NULL, NULL, NULL, NULL, NULL, 1623111743, 2);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(10) UNSIGNED NOT NULL,
  `accountID` int(10) UNSIGNED DEFAULT NULL,
  `sessionID` varchar(36) COLLATE utf8mb4_persian_ci NOT NULL,
  `authID` varchar(36) COLLATE utf8mb4_persian_ci NOT NULL,
  `datetimeRegister` int(11) UNSIGNED NOT NULL,
  `datetimeLastUse` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `accountID`, `sessionID`, `authID`, `datetimeRegister`, `datetimeLastUse`) VALUES
(1, NULL, '24fc83bf-8a20-477f-b045-1706bd1ed0a7', '24fc83bf-8a20-477f-b045-1706bd1ed0a7', 1623109112, 1623109112);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(10) UNSIGNED NOT NULL,
  `accountID` int(10) UNSIGNED NOT NULL,
  `authID` varchar(36) COLLATE utf8mb4_persian_ci NOT NULL,
  `sessionID` varchar(36) COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `verifyCode` smallint(5) UNSIGNED NOT NULL,
  `verifyCodeAttemp` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `versionCode` tinyint(3) UNSIGNED NOT NULL,
  `platform` tinyint(3) UNSIGNED NOT NULL COMMENT '1=web, 2=android, 3=ios',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '0=banned, 1=only session, 2=normal id',
  `datetime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `accountID`, `authID`, `sessionID`, `verifyCode`, `verifyCodeAttemp`, `versionCode`, `platform`, `status`, `datetime`) VALUES
(1, 2, '79009322-59c3-45a6-b0da-c30632e97331', '0712a18e-7a3a-4c9a-9d51-2d56d94a5c94', 255, 15, 0, 1, 0, 0),
(2, 3, 'b0e8e7d2-f112-4128-bc18-08e1e189d1c2', NULL, 6000, 0, 0, 1, 1, 0),
(3, 4, '412627a3-7093-4b05-b08e-135aaace35fc', NULL, 255, 0, 0, 1, 1, 0),
(4, 1, '8884208a-1be7-4a7d-a21d-bc239ad3bfbf', NULL, 255, 0, 0, 2, 1, 0),
(5, 1, '60a0a4cf-588b-4928-90b5-9aa66af92454', NULL, 255, 0, 0, 2, 1, 0),
(6, 1, 'a63745b4-7fd6-4619-9f40-89407f8399b5', NULL, 255, 0, 0, 2, 1, 0),
(7, 1, '0fc0fa47-5660-4a1d-bb4a-f134982cec8d', NULL, 255, 0, 0, 2, 1, 0),
(8, 1, '35e6587c-35ce-4a1c-a218-37a12f69a91f', NULL, 255, 0, 0, 2, 1, 0),
(9, 1, '735d1e53-9102-4da4-bf45-549abc61a3bd', NULL, 255, 0, 0, 2, 1, 0),
(10, 1, '16d9e588-4112-4574-9e26-ef0a481541a3', NULL, 255, 0, 0, 2, 1, 0),
(11, 1, '8a7cfcdd-52cb-4e87-8fc9-74ae8c3370a2', NULL, 255, 0, 0, 2, 1, 0),
(12, 1, 'ad736b61-c8e9-4754-a59b-6a7efca46d2f', NULL, 255, 0, 0, 2, 1, 0),
(13, 1, '0dd99d44-1589-4dbc-9663-31ffef59de97', NULL, 255, 0, 0, 2, 1, 0),
(14, 1, '7a5ff435-cd30-4f54-82c4-56184139c226', NULL, 255, 0, 0, 2, 1, 0),
(15, 1, 'ec9565bb-b062-46f3-8f41-9b52e6e2bc06', NULL, 255, 0, 0, 2, 1, 0),
(16, 1, '457a8b4e-b394-42fb-ab6f-35e22d86953e', NULL, 255, 0, 0, 2, 1, 0),
(17, 1, '1b1b9eb5-d045-4643-8fbc-3bfb21c5a862', NULL, 255, 0, 0, 2, 1, 0),
(18, 1, 'dcc9f9bc-887e-4efb-866e-b8fddb97ca17', NULL, 255, 0, 0, 2, 1, 0),
(19, 1, '981849e6-13ad-4bae-af2d-e56bd8abc068', NULL, 255, 0, 0, 2, 1, 0),
(20, 1, 'aee6c707-5411-4e14-982f-638b1bb2f152', NULL, 255, 0, 0, 2, 1, 0),
(21, 1, 'e0e356d3-0f02-4e74-b098-71c548760ede', NULL, 255, 0, 0, 2, 1, 0),
(22, 1, '3ed35dec-19a3-4c30-ab26-9d8f590d74f7', NULL, 255, 0, 0, 2, 1, 0),
(23, 1, 'ad6e0fd9-6a11-458f-98c3-22020007e37f', NULL, 255, 0, 0, 2, 1, 0),
(24, 1, 'f97770a6-4acc-4d4f-940f-7dade62c65e9', NULL, 255, 0, 0, 2, 1, 0),
(25, 1, 'd142bd4f-a623-41c2-8e47-8e1d88576e3a', NULL, 255, 0, 0, 2, 1, 0),
(26, 1, '9fde4ed6-c021-48c3-b5be-cbe91e9ca8da', NULL, 255, 0, 0, 2, 1, 0),
(27, 1, 'ee158b4d-68fc-4b54-912b-e877f47a0634', NULL, 255, 0, 0, 2, 1, 0),
(28, 1, '59f169eb-cf0c-4432-b173-9d9482d092f3', NULL, 255, 0, 0, 2, 1, 0),
(29, 1, 'f218c776-daa1-438a-b25e-95344116ed09', NULL, 255, 0, 0, 2, 1, 0),
(30, 1, '55ae7ec4-d932-4558-a1d3-366726993306', NULL, 255, 0, 0, 2, 1, 0),
(31, 1, 'dda219f4-c6f0-4770-8405-8773330e7243', NULL, 255, 0, 0, 2, 1, 0),
(32, 1, 'a940a1b8-6d72-41d9-8e1d-75a78b3a93f5', NULL, 255, 0, 0, 2, 1, 0),
(33, 1, 'b4c97c28-5c78-4b4e-8453-fd4d3c7a4cdd', NULL, 255, 0, 0, 2, 1, 0),
(34, 1, 'cc55efd7-1f81-4c00-9bbb-b02de03cef71', NULL, 255, 0, 0, 2, 1, 0),
(35, 1, 'ac43b8c7-7d44-4b29-ad4b-2e3c8165cd95', NULL, 255, 0, 0, 2, 1, 0),
(36, 1, '27f54527-bc76-42d0-ade3-dd3e65a61737', NULL, 255, 0, 0, 2, 1, 0),
(37, 1, '9d2c4a0a-89f8-43ba-9314-27342567dfa8', NULL, 255, 0, 0, 2, 1, 0),
(38, 1, '8e5ca5ed-57c5-4605-9aed-a86f4218ab0e', NULL, 255, 0, 0, 2, 1, 0),
(39, 1, 'ef660dae-98bb-4c83-addc-e4aa53f07d69', NULL, 255, 0, 0, 2, 1, 0),
(40, 1, 'fdae751a-e610-48b9-bd0f-ada426eec40a', NULL, 255, 0, 0, 2, 1, 0),
(41, 1, '834b268a-08a0-40b5-9f81-2c4eb204db4d', NULL, 255, 0, 0, 2, 1, 0),
(42, 1, '27932f67-2f5a-4a89-90f5-0ce3192b49b0', NULL, 255, 0, 0, 2, 1, 0),
(43, 1, '3d2c962c-13a7-4679-ab25-b292fe7d5200', NULL, 255, 0, 0, 2, 1, 0),
(44, 1, '3414e009-9018-472d-b57c-9aa45b00de53', NULL, 255, 0, 0, 2, 1, 0),
(45, 1, 'c09aca27-3336-4bc7-82be-880c31426ca9', NULL, 255, 0, 0, 2, 1, 0),
(46, 1, 'd5078462-8724-493c-ab72-cd1129c8ec32', NULL, 255, 0, 0, 2, 1, 0),
(47, 1, '81ee2586-98d2-4569-b92c-a990433a8826', NULL, 255, 0, 0, 2, 1, 0),
(48, 1, 'e695d233-8efe-4c17-8328-59ed7226dd2a', NULL, 255, 0, 0, 2, 1, 1623112487),
(49, 1, '718c3d90-b978-4537-89cf-525275036722', NULL, 255, 0, 0, 2, 1, 1623112489),
(50, 1, '1dc11d2c-fba5-48e5-9d15-b9b97ad54c88', NULL, 255, 0, 0, 2, 1, 1623112490),
(51, 1, '196e912d-e376-4d4c-a3bf-48bb0deb49e7', NULL, 255, 0, 0, 2, 1, 1623112491),
(52, 1, '33db4c3b-5083-4655-920f-175798a89463', NULL, 255, 0, 0, 2, 1, 1623112499),
(53, 1, '03bfdeaf-8fc7-47ca-910e-e78c50328b62', NULL, 255, 0, 0, 2, 1, 1623112500),
(54, 1, '26236eca-f119-43f4-b864-d0a5aca33112', NULL, 255, 0, 0, 2, 1, 1623112501),
(55, 1, 'ae22b4c7-31b8-4e3e-a5cc-0b06e4db46a8', NULL, 255, 0, 0, 2, 1, 1623112501),
(56, 1, '46530af3-47ba-4bec-9add-2034a6f18398', NULL, 255, 0, 0, 2, 1, 1623112501),
(57, 1, '288d3682-22f4-4def-a5bf-16bc9977bb58', NULL, 255, 0, 0, 2, 1, 1623112502),
(58, 1, '1f3056bd-eaec-475f-bfd0-f7b0132564dd', NULL, 255, 0, 0, 2, 1, 1623112502),
(59, 1, '5797fb91-e7c6-413d-a7ad-3ac67cbddd36', NULL, 255, 0, 0, 2, 1, 1623112502),
(60, 1, '841faab3-9a60-416a-9a39-4aef5989df09', NULL, 255, 0, 0, 2, 1, 1623112504),
(61, 1, '564a2d2f-0bad-4520-8a97-4c399b7e71a0', NULL, 255, 0, 0, 2, 1, 1623112504),
(62, 1, '6edab04f-fd48-4bf1-b803-51ecb9283953', NULL, 255, 0, 0, 2, 1, 1623112505),
(63, 1, '4018516a-d457-4ec2-a619-7d549999f26b', NULL, 255, 0, 0, 2, 1, 1623112505),
(64, 1, '41d65718-9b87-4849-ac15-c5b89ee57944', NULL, 255, 0, 0, 2, 1, 1623112541),
(65, 1, '8c0c7acd-0505-4c3e-a307-2d07b513c2be', NULL, 255, 0, 0, 2, 1, 1623113015),
(66, 1, '99f50044-7ea2-4b1d-bae6-f2f7ca6b45fb', NULL, 255, 0, 0, 2, 1, 1623113016),
(67, 1, '0fb27759-1686-4be2-b981-9aef93e2b741', NULL, 1369, 0, 1, 2, 1, 1623114191),
(68, 1, 'd0f2ddfb-3ebb-4d02-8c2c-07ee3763e672', NULL, 4655, 0, 1, 2, 1, 1623114193);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phoneNumber_2` (`phoneNumber`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `status` (`status`),
  ADD KEY `phoneNumber` (`phoneNumber`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authID` (`authID`),
  ADD KEY `sessionID` (`sessionID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authID` (`authID`),
  ADD KEY `sessionID` (`sessionID`),
  ADD KEY `versionCode` (`versionCode`),
  ADD KEY `accountID` (`accountID`),
  ADD KEY `status` (`status`),
  ADD KEY `versionCode_2` (`versionCode`),
  ADD KEY `versionCode_3` (`versionCode`),
  ADD KEY `versionCode_4` (`versionCode`),
  ADD KEY `verifyCode` (`verifyCode`),
  ADD KEY `datetime` (`datetime`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
