-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2022 at 10:18 AM
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
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `artikel_id` int(1) NOT NULL,
  `artikel_naam` text NOT NULL,
  `artikel_omschrijving` text DEFAULT NULL,
  `artikel_foto` varchar(100) DEFAULT NULL,
  `artikel_prijs` decimal(4,0) NOT NULL,
  `artikel_eenheid` int(2) NOT NULL,
  `artikel_verpakking` varchar(100) NOT NULL,
  `artikel_calorieën` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bereidingswijze`
--

CREATE TABLE `bereidingswijze` (
  `bereidingswijze_id` int(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `stap_nummer` int(2) NOT NULL,
  `stap_omschrijving` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pagina_info`
--

CREATE TABLE `detail_pagina_info` (
  `detail_pagina_info_id` int(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `bereidingswijze_id` int(11) NOT NULL,
  `opmerkingen_id` int(11) NOT NULL,
  `waardering_id` int(11) NOT NULL,
  `favoriet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favoriet`
--

CREATE TABLE `favoriet` (
  `favoriet_id` int(1) NOT NULL,
  `gerecht_id` int(1) NOT NULL,
  `user_id` int(1) NOT NULL,
  `favoriet` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gerecht`
--

CREATE TABLE `gerecht` (
  `gerecht_id` int(1) NOT NULL,
  `keuken_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gerecht_titel` text NOT NULL,
  `gerecht_foto` varchar(500) DEFAULT NULL,
  `gerecht_datum` date DEFAULT NULL,
  `gerecht_omschrijving_kort` text NOT NULL,
  `gerecht_omschrijving_lang` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gerecht`
--

INSERT INTO `gerecht` (`gerecht_id`, `keuken_type_id`, `user_id`, `gerecht_titel`, `gerecht_foto`, `gerecht_datum`, `gerecht_omschrijving_kort`, `gerecht_omschrijving_lang`) VALUES
(3, 1, 1, 'Pasta met zalm', NULL, '2022-09-13', '', 'Tagliatelle met roomsaus, broccoli, en zalmfilet.  '),
(4, 2, 2, 'Pompoensoep', NULL, '2022-09-16', '', 'Vietnamese pompoensoep met crème fraîche. '),
(5, 3, 3, 'Gehakt taco\'s', NULL, '2022-09-04', '', 'Taco\'s met gehakt, pittige salsa, gebakken uitjes, en jalapeño dipsaus. '),
(6, 4, 4, 'Misosoep met tofu', NULL, '2022-09-28', '', 'Japanse misosoep met zeewier en tofu. ');

-- --------------------------------------------------------

--
-- Table structure for table `ingrediënt`
--

CREATE TABLE `ingrediënt` (
  `ingrediënt_id` int(1) NOT NULL,
  `gerecht_id` int(1) NOT NULL,
  `artikel_id` int(1) NOT NULL,
  `ingrediënt_hoeveelheid` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `keuken_type`
--

CREATE TABLE `keuken_type` (
  `keuken_type_id` int(11) NOT NULL,
  `record_keuken_id` int(11) NOT NULL,
  `record_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keuken_type`
--

INSERT INTO `keuken_type` (`keuken_type_id`, `record_keuken_id`, `record_type_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 4, 1),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `opmerkingen`
--

CREATE TABLE `opmerkingen` (
  `opmerkingen_id` int(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `opmerking_nummer` int(3) NOT NULL,
  `opmerking_inhoud` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `record_keuken`
--

CREATE TABLE `record_keuken` (
  `record_keuken_id` int(11) NOT NULL,
  `keuken_omschrijving` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_keuken`
--

INSERT INTO `record_keuken` (`record_keuken_id`, `keuken_omschrijving`) VALUES
(1, 'Mediterrane keuken'),
(2, 'Aziatische keuken'),
(3, 'Indiase keuken'),
(4, 'Mexicaanse keuken');

-- --------------------------------------------------------

--
-- Table structure for table `record_type`
--

CREATE TABLE `record_type` (
  `record_type_id` int(11) NOT NULL,
  `type_omschrijving` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_type`
--

INSERT INTO `record_type` (`record_type_id`, `type_omschrijving`) VALUES
(1, 'Vleesgerecht'),
(2, 'Visgerecht'),
(3, 'Vegetarisch');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(1) NOT NULL,
  `user_naam` varchar(100) NOT NULL,
  `user_foto` varchar(200) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_wachtwoord` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_naam`, `user_foto`, `user_email`, `user_wachtwoord`) VALUES
(1, 'John_Lennon1', '', 'john.lennon@beatles.com', 'ImJohn1'),
(2, 'Paul_McCartney2', '', 'paul.mccartney@beatles.com', 'ImPaul2'),
(3, 'George_Harrison3', '', 'george.harrison@beatles.com', 'ImGeorge3'),
(4, 'Ringo_Starr4', '', 'ringo.starr@beatles.com', 'ImRingo4');

-- --------------------------------------------------------

--
-- Table structure for table `waardering`
--

CREATE TABLE `waardering` (
  `waardering_id` int(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `aantal_sterren` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikel_id`);

--
-- Indexes for table `bereidingswijze`
--
ALTER TABLE `bereidingswijze`
  ADD PRIMARY KEY (`bereidingswijze_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexes for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  ADD PRIMARY KEY (`detail_pagina_info_id`),
  ADD KEY `bereidingswijze_id` (`bereidingswijze_id`),
  ADD KEY `favoriet_id` (`favoriet_id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `opmerkingen_id` (`opmerkingen_id`),
  ADD KEY `waardering_id` (`waardering_id`);

--
-- Indexes for table `favoriet`
--
ALTER TABLE `favoriet`
  ADD PRIMARY KEY (`favoriet_id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`gerecht_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `keuken_type_id` (`keuken_type_id`);

--
-- Indexes for table `ingrediënt`
--
ALTER TABLE `ingrediënt`
  ADD PRIMARY KEY (`ingrediënt_id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indexes for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`keuken_type_id`),
  ADD KEY `record_keuken_id` (`record_keuken_id`),
  ADD KEY `record_type_id` (`record_type_id`);

--
-- Indexes for table `opmerkingen`
--
ALTER TABLE `opmerkingen`
  ADD PRIMARY KEY (`opmerkingen_id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `record_keuken`
--
ALTER TABLE `record_keuken`
  ADD PRIMARY KEY (`record_keuken_id`);

--
-- Indexes for table `record_type`
--
ALTER TABLE `record_type`
  ADD PRIMARY KEY (`record_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `waardering`
--
ALTER TABLE `waardering`
  ADD PRIMARY KEY (`waardering_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `artikel_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bereidingswijze`
--
ALTER TABLE `bereidingswijze`
  MODIFY `bereidingswijze_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  MODIFY `detail_pagina_info_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favoriet`
--
ALTER TABLE `favoriet`
  MODIFY `favoriet_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `gerecht_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingrediënt`
--
ALTER TABLE `ingrediënt`
  MODIFY `ingrediënt_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `keuken_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `opmerkingen`
--
ALTER TABLE `opmerkingen`
  MODIFY `opmerkingen_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record_keuken`
--
ALTER TABLE `record_keuken`
  MODIFY `record_keuken_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `record_type`
--
ALTER TABLE `record_type`
  MODIFY `record_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `waardering`
--
ALTER TABLE `waardering`
  MODIFY `waardering_id` int(1) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bereidingswijze`
--
ALTER TABLE `bereidingswijze`
  ADD CONSTRAINT `bereidingswijze_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`);

--
-- Constraints for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  ADD CONSTRAINT `detail_pagina_info_ibfk_1` FOREIGN KEY (`bereidingswijze_id`) REFERENCES `bereidingswijze` (`bereidingswijze_id`),
  ADD CONSTRAINT `detail_pagina_info_ibfk_2` FOREIGN KEY (`favoriet_id`) REFERENCES `favoriet` (`favoriet_id`),
  ADD CONSTRAINT `detail_pagina_info_ibfk_3` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`),
  ADD CONSTRAINT `detail_pagina_info_ibfk_4` FOREIGN KEY (`opmerkingen_id`) REFERENCES `opmerkingen` (`opmerkingen_id`),
  ADD CONSTRAINT `detail_pagina_info_ibfk_6` FOREIGN KEY (`waardering_id`) REFERENCES `waardering` (`waardering_id`);

--
-- Constraints for table `favoriet`
--
ALTER TABLE `favoriet`
  ADD CONSTRAINT `favoriet_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`),
  ADD CONSTRAINT `favoriet_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `gerecht_ibfk_2` FOREIGN KEY (`keuken_type_id`) REFERENCES `keuken_type` (`keuken_type_id`);

--
-- Constraints for table `ingrediënt`
--
ALTER TABLE `ingrediënt`
  ADD CONSTRAINT `ingrediënt_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`),
  ADD CONSTRAINT `ingrediënt_ibfk_2` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`artikel_id`);

--
-- Constraints for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD CONSTRAINT `keuken_type_ibfk_1` FOREIGN KEY (`record_keuken_id`) REFERENCES `record_keuken` (`record_keuken_id`),
  ADD CONSTRAINT `keuken_type_ibfk_2` FOREIGN KEY (`record_type_id`) REFERENCES `record_type` (`record_type_id`);

--
-- Constraints for table `opmerkingen`
--
ALTER TABLE `opmerkingen`
  ADD CONSTRAINT `opmerkingen_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`),
  ADD CONSTRAINT `opmerkingen_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `waardering`
--
ALTER TABLE `waardering`
  ADD CONSTRAINT `waardering_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
