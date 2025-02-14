-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 10:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `contestants`
--

CREATE TABLE `contestants` (
  `contestant_id` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `subevent_id` int(11) NOT NULL,
  `contestant_ctr` int(11) NOT NULL,
  `status` text NOT NULL,
  `txt_code` text NOT NULL,
  `rand_code` int(15) NOT NULL,
  `txtPollScore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contestants`
--

INSERT INTO `contestants` (`contestant_id`, `fullname`, `subevent_id`, `contestant_ctr`, `status`, `txt_code`, `rand_code`, `txtPollScore`) VALUES
(28, 'P8 WIRE-ior', 7, 1, 'finish', '', 663656, 0),
(29, 'P5 ELITE', 7, 2, 'finish', '', 138521, 0),
(30, 'QA P8 VISION-aries', 7, 3, 'finish', '', 5026673, 0),
(31, 'QA Main AMP-ed', 7, 4, 'finish', '', 5026674, 0),
(32, 'QA Main Jig Seeker', 7, 5, 'finish', '', 5026675, 0),
(33, 'P6 Team SIGA', 7, 6, 'finish', '', 5026676, 0),
(34, 'P2 Dreamer', 7, 7, 'finish', '', 5026677, 0),
(35, 'P7 InnoVision 2.0', 7, 8, '', '', 5026678, 0),
(36, 'P1 MAVERICKS', 7, 9, '', '', 5026679, 0),
(37, 'QA Main AST-eu', 7, 10, '', '', 50266710, 0),
(38, 'P9 Phoenix', 7, 11, '', '', 50266711, 0),
(39, 'PCMC COC Ver. 4.0', 7, 12, 'finish', '', 50266712, 0),
(40, 'P8 WIRE-ior', 8, 1, '', '', 626835, 0),
(41, 'P5 ELITE', 8, 2, '', '', 665280, 0),
(42, 'QA P8 VISION-aries', 8, 3, '', '', 2855863, 0),
(43, 'QA Main AMP-ed', 8, 4, '', '', 2855864, 0),
(44, 'QA Main Jig Seeker', 8, 5, '', '', 2855865, 0),
(45, 'P6 Team SIGA', 8, 6, '', '', 2855866, 0),
(46, 'P2 Dreamer', 8, 7, '', '', 2855867, 0),
(47, 'P7 InnoVision 2.0', 8, 8, '', '', 2855868, 0),
(48, 'P1 MAVERICKS', 8, 9, '', '', 2855869, 0),
(49, 'QA Main AST-eu', 8, 10, '', '', 28558610, 0),
(50, 'P9 Phoenix', 8, 11, '', '', 28558611, 0),
(51, 'PCMC COC Ver. 4.0', 8, 12, 'finish', '', 28558612, 0);

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `criteria_id` int(11) NOT NULL,
  `subevent_id` int(11) NOT NULL,
  `criteria` text NOT NULL,
  `percentage` int(11) NOT NULL,
  `criteria_ctr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`criteria_id`, `subevent_id`, `criteria`, `percentage`, `criteria_ctr`) VALUES
(33, 7, 'SLOGAN TEAM CONTENT RELEVANCE  ', 15, 1),
(34, 7, 'CLARITY OF SLOGAN EXPLANATION', 15, 2),
(35, 7, 'CREATIVE VISUALS ', 15, 3),
(36, 7, 'ORIGINALITY    ', 5, 4),
(38, 8, 'CREATIVITY & ORIGINALITY', 20, 1),
(39, 8, 'PROJECT THEME RELEVANCE', 15, 2),
(40, 8, 'AUDIENCE IMPACT ', 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `judge_id` int(11) NOT NULL,
  `subevent_id` int(11) NOT NULL,
  `judge_ctr` int(11) NOT NULL,
  `fullname` text NOT NULL,
  `code` varchar(6) NOT NULL,
  `jtype` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`judge_id`, `subevent_id`, `judge_ctr`, `fullname`, `code`, `jtype`) VALUES
(23, 7, 1, 'MR. GEO', 'MG', ''),
(24, 7, 2, 'MR. CARY', 'MC', ''),
(25, 7, 3, 'MS. ELLEN', 'ME', ''),
(26, 7, 4, 'MR. PAUL', 'MP', ''),
(27, 7, 0, 'MR. RED', 'MR', ''),
(28, 8, 1, 'MR. GEO', 'MGG', ''),
(29, 8, 2, 'MR. CARY', 'MCC', ''),
(30, 8, 3, 'MS. ELLEN', 'MEE', ''),
(31, 8, 4, 'MR. PAUL', 'MPP', ''),
(32, 8, 0, 'MR. RED', 'MRR', '');

-- --------------------------------------------------------

--
-- Table structure for table `main_event`
--

CREATE TABLE `main_event` (
  `mainevent_id` int(11) NOT NULL,
  `event_name` text NOT NULL,
  `status` text NOT NULL,
  `organizer_id` int(11) NOT NULL,
  `sy` varchar(9) NOT NULL,
  `date_start` text NOT NULL,
  `date_end` text NOT NULL,
  `place` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `main_event`
--

INSERT INTO `main_event` (`mainevent_id`, `event_name`, `status`, `organizer_id`, `sy`, `date_start`, `date_end`, `place`) VALUES
(7, 'CIC  CYCLE 9', 'activated', 24, '2025', '2025-02-17', '2025-02-17', 'SMP PLANT 9');

-- --------------------------------------------------------

--
-- Table structure for table `messagein`
--

CREATE TABLE `messagein` (
  `Id` int(11) NOT NULL,
  `SendTime` varchar(10) DEFAULT NULL,
  `ReceiveTime` varchar(10) DEFAULT NULL,
  `MessageFrom` bigint(12) DEFAULT NULL,
  `MessageTo` varchar(10) DEFAULT NULL,
  `SMSC` varchar(10) DEFAULT NULL,
  `MessageText` varchar(4) DEFAULT NULL,
  `MessageType` varchar(10) DEFAULT NULL,
  `MessagePDU` varchar(10) DEFAULT NULL,
  `Gateway` varchar(10) DEFAULT NULL,
  `UserId` varchar(10) DEFAULT NULL,
  `sendStatus` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messagelog`
--

CREATE TABLE `messagelog` (
  `Id` int(11) NOT NULL,
  `SendTime` datetime DEFAULT NULL,
  `ReceiveTime` datetime DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  `StatusText` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageId` varchar(80) DEFAULT NULL,
  `ErrorCode` varchar(80) DEFAULT NULL,
  `ErrorText` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text DEFAULT NULL,
  `Connector` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messageout`
--

CREATE TABLE `messageout` (
  `Id` int(11) NOT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `MessageType` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Scheduled` datetime DEFAULT NULL,
  `ValidityPeriod` int(11) DEFAULT NULL,
  `IsSent` tinyint(1) NOT NULL DEFAULT 0,
  `IsRead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `organizer_id` int(11) NOT NULL,
  `fname` text NOT NULL,
  `mname` text NOT NULL,
  `lname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `pnum` varchar(15) NOT NULL,
  `access` varchar(25) NOT NULL,
  `org_id` varchar(12) NOT NULL,
  `status` varchar(12) NOT NULL,
  `company_name` varchar(55) NOT NULL,
  `company_address` varchar(55) NOT NULL,
  `company_logo` varchar(55) NOT NULL,
  `company_telephone` varchar(55) NOT NULL,
  `company_email` varchar(55) NOT NULL,
  `company_website` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`organizer_id`, `fname`, `mname`, `lname`, `username`, `password`, `email`, `pnum`, `access`, `org_id`, `status`, `company_name`, `company_address`, `company_logo`, `company_telephone`, `company_email`, `company_website`) VALUES
(24, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin@gmail.com', '09999999999', 'Organizer', '', 'offline', 'Shin-etsu', 'Shin-etsu philippines', '12539-shin-etsu.png', '123', 'admin@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `rank_system`
--

CREATE TABLE `rank_system` (
  `rs_id` int(11) NOT NULL,
  `subevent_id` varchar(12) NOT NULL,
  `contestant_id` varchar(12) NOT NULL,
  `total_rank` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_event`
--

CREATE TABLE `sub_event` (
  `subevent_id` int(11) NOT NULL,
  `mainevent_id` int(11) NOT NULL,
  `organizer_id` int(11) NOT NULL,
  `event_name` text NOT NULL,
  `status` text NOT NULL,
  `eventdate` text NOT NULL,
  `eventtime` text NOT NULL,
  `place` text NOT NULL,
  `txtpoll_status` text NOT NULL,
  `view` varchar(15) NOT NULL,
  `txtpollview` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_event`
--

INSERT INTO `sub_event` (`subevent_id`, `mainevent_id`, `organizer_id`, `event_name`, `status`, `eventdate`, `eventtime`, `place`, `txtpoll_status`, `view`, `txtpollview`) VALUES
(7, 7, 24, 'SLOGAN', 'activated', '2025-02-17', '1:00PM', 'Training Room', '', 'activated', ''),
(8, 7, 24, 'SHOUT OUT', 'activated', '2025-02-17', '1:00PM', 'Training Room', '', 'deactivated', '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_results`
--

CREATE TABLE `sub_results` (
  `subresult_id` int(11) NOT NULL,
  `subevent_id` int(11) NOT NULL,
  `mainevent_id` int(11) NOT NULL,
  `contestant_id` int(11) NOT NULL,
  `judge_id` int(11) NOT NULL,
  `total_score` decimal(11,1) NOT NULL,
  `deduction` int(11) NOT NULL,
  `criteria_ctr1` decimal(11,1) NOT NULL,
  `criteria_ctr2` decimal(11,1) NOT NULL,
  `criteria_ctr3` decimal(11,1) NOT NULL,
  `criteria_ctr4` decimal(11,1) NOT NULL,
  `criteria_ctr5` decimal(11,1) NOT NULL,
  `criteria_ctr6` decimal(11,1) NOT NULL,
  `criteria_ctr7` decimal(11,1) NOT NULL,
  `criteria_ctr8` decimal(11,1) NOT NULL,
  `criteria_ctr9` decimal(11,1) NOT NULL,
  `criteria_ctr10` decimal(11,1) NOT NULL,
  `comments` text NOT NULL,
  `rank` varchar(11) NOT NULL,
  `judge_rank_stat` varchar(15) NOT NULL,
  `place_title` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_results`
--

INSERT INTO `sub_results` (`subresult_id`, `subevent_id`, `mainevent_id`, `contestant_id`, `judge_id`, `total_score`, `deduction`, `criteria_ctr1`, `criteria_ctr2`, `criteria_ctr3`, `criteria_ctr4`, `criteria_ctr5`, `criteria_ctr6`, `criteria_ctr7`, `criteria_ctr8`, `criteria_ctr9`, `criteria_ctr10`, `comments`, `rank`, `judge_rank_stat`, `place_title`) VALUES
(71, 7, 7, 28, 27, '41.0', 0, '12.0', '12.0', '12.0', '5.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(72, 7, 7, 28, 23, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(73, 7, 7, 28, 24, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(74, 7, 7, 28, 25, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(75, 7, 7, 28, 26, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(76, 7, 7, 29, 27, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(77, 7, 7, 29, 23, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(78, 7, 7, 29, 24, '14.0', 0, '2.0', '3.0', '4.0', '5.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(79, 7, 7, 29, 25, '18.0', 0, '11.0', '1.0', '2.0', '4.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(80, 7, 7, 29, 26, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(81, 7, 7, 30, 26, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(82, 7, 7, 30, 25, '29.0', 0, '12.0', '5.0', '7.0', '5.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(83, 7, 7, 30, 24, '31.0', 0, '12.0', '12.0', '3.0', '4.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(84, 7, 7, 30, 23, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(85, 7, 7, 30, 27, '38.0', 0, '12.0', '12.0', '12.0', '2.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(86, 7, 7, 39, 23, '39.0', 0, '12.0', '12.0', '12.0', '3.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', ''),
(87, 8, 7, 51, 28, '36.0', 0, '12.0', '12.0', '12.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `textpoll`
--

CREATE TABLE `textpoll` (
  `textpoll_id` int(11) NOT NULL,
  `contestant_id` varchar(12) NOT NULL,
  `text_vote` int(11) NOT NULL,
  `subevent_id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contestants`
--
ALTER TABLE `contestants`
  ADD PRIMARY KEY (`contestant_id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`criteria_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`judge_id`);

--
-- Indexes for table `main_event`
--
ALTER TABLE `main_event`
  ADD PRIMARY KEY (`mainevent_id`);

--
-- Indexes for table `messagein`
--
ALTER TABLE `messagein`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messagelog`
--
ALTER TABLE `messagelog`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_MessageId` (`MessageId`,`SendTime`);

--
-- Indexes for table `messageout`
--
ALTER TABLE `messageout`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_IsRead` (`IsRead`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`organizer_id`);

--
-- Indexes for table `rank_system`
--
ALTER TABLE `rank_system`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `sub_event`
--
ALTER TABLE `sub_event`
  ADD PRIMARY KEY (`subevent_id`);

--
-- Indexes for table `sub_results`
--
ALTER TABLE `sub_results`
  ADD PRIMARY KEY (`subresult_id`);

--
-- Indexes for table `textpoll`
--
ALTER TABLE `textpoll`
  ADD PRIMARY KEY (`textpoll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contestants`
--
ALTER TABLE `contestants`
  MODIFY `contestant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `criteria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `judge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `main_event`
--
ALTER TABLE `main_event`
  MODIFY `mainevent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messagein`
--
ALTER TABLE `messagein`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messagelog`
--
ALTER TABLE `messagelog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messageout`
--
ALTER TABLE `messageout`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizer`
--
ALTER TABLE `organizer`
  MODIFY `organizer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `rank_system`
--
ALTER TABLE `rank_system`
  MODIFY `rs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_event`
--
ALTER TABLE `sub_event`
  MODIFY `subevent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_results`
--
ALTER TABLE `sub_results`
  MODIFY `subresult_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `textpoll`
--
ALTER TABLE `textpoll`
  MODIFY `textpoll_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
