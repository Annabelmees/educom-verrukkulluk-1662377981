-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2022 at 09:06 AM
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
  `artikel_foto` varchar(100) NOT NULL,
  `artikel_prijs` float NOT NULL,
  `artikel_eenheid` float NOT NULL,
  `artikel_verpakking` float NOT NULL,
  `artikel_calorieen` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`artikel_id`, `artikel_naam`, `artikel_omschrijving`, `artikel_foto`, `artikel_prijs`, `artikel_eenheid`, `artikel_verpakking`, `artikel_calorieen`) VALUES
(1, 'Knoflook', 'Perfecte smaakmaker voor ieder gerecht. Glutenvrij. ', '', 1.09, 4, 84, 158),
(2, 'Bosui', 'Lekker in salades of soepen. Veganistisch, glutenvrij. ', '', 0.65, 15, 75, 32),
(3, 'Bevroren zalmfilet', 'Atlantische zalm gekweekt in Chili; vers ingevroren en snel te bereiden. ', '', 4.99, 125, 250, 179),
(4, 'Pompoen', 'Bio seizoenspompoen, perfect geschikt voor romige soepen. Veganistisch, glutenvrij. ', '', 2.32, 100, 500, 26),
(5, 'Tofu', 'Eiwitrijke vleesvervanger op basis van sojabonen. Veganistisch, glutenvrij.  ', '', 1.27, 100, 375, 126),
(6, 'Miso paste', 'Voor soep, saus, marinades, en meer; bevat soja. Glutenvrij.  ', '', 6.78, 10, 300, 191),
(7, 'Broccoli', 'Klasse 1 groente; om te koken of als roosjes door een roerbak. ', '', 1.19, 150, 300, 34),
(8, 'Vissaus', 'Saus met ansjovisextract. Glutenvrij. ', '', 1.45, 15, 250, 41),
(9, 'Jalapeno peper', 'Groene jalapeno peper; mooie smaak en kleurtoevoeging aan ieder gerecht. Veganistisch en glutenvrij. ', '', 0.39, 20, 20, 28),
(10, 'Taco schelpen', 'Ideaal voor mexicaanse gerechten; gemaakt van maïs. Veganistisch en glutenvrij. ', '', 1.59, 11, 132, 460),
(11, 'Rundergehakt', 'Om gehaktballen van te maken, maar ook perfect geruld in sauzen of ovengerechten; verpakt onder beschermende atmosfeer. ', '', 4.89, 100, 500, 230),
(12, 'Tagliatelle', 'Italiaanse pasta bereid met scharrelei en tarwegriesmeel. Vegetarisch. ', '', 1.49, 100, 500, 370),
(13, 'Slagroom', 'Romige, gepasteuriseerde slagroom met 30% vet. Vegetarisch. ', '', 1.39, 10, 250, 292),
(14, 'Boter', 'Ongezoute roomboter met 81% melkvet. Vegetarisch, glutenvrij. ', '', 2.49, 5, 250, 744),
(15, 'Kappertjes', 'Mediterrane smaakmaker, lekker kruidig en friszuur. Glutenvrij. ', '', 0.79, 5, 100, 41),
(16, 'Olijfolie', 'Geraffineerde en vierge olijfolie, perfect geschikt voor bakken en braden vanwege de zachte smaak. Veganistisch, glutenvrij. ', '', 4.49, 15, 500, 819),
(18, 'Paprika', 'Rode paprika aan de zoete kant, sappig en perfect voor beide sauzen en salades. Veganistisch, glutenvrij. ', '', 0.99, 135, 135, 28),
(19, 'Salsa', 'Pittige dipsaus met tomaten, rode paprika, en jalapenopepers. Veganistisch, glutenvrij. ', '', 1.09, 15, 300, 46),
(20, 'Gebakken uitjes', 'Recht vanuit de Oosterse keuken, een heerlijk knapperige smaakmaker voor ieder Aziatisch gerecht. Veganistisch. ', '', 0.85, 7, 150, 590),
(21, 'Witte azijn', 'Een natuurlijk zuur voor ieder gerecht. Veganistisch. ', '', 0.45, 15, 1250, 13),
(22, 'Limoen', 'Een aromatische, friszure smaakmaker, speciaal lekker in visgerechten of cocktails. Veganistisch, glutenvrij.  ', '', 0.69, 30, 60, 30),
(23, 'Koriander', 'Sterke, anijsachtige smaak, toe te voegen op het laatste moment tijdens bereiding. Glutenvrij. ', '', 1.19, 5, 15, 38),
(24, 'Groentebouillon blokjes', 'Groentebouillon in blokjes vorm om te laten oplossen, perfect voor soepen, sauzen, ragouts, pasta\'s en meer. Vegetarisch. ', '', 0.5, 10, 120, 5),
(25, 'Zeewier snack', 'Heerlijke knapperige nori chips met olijfolie in zout. Lekker als tussendoortje of door Aziatische gerechten. Glutenvrij. ', '', 2.99, 10, 10, 637),
(26, 'Kastanje champignons', 'Kruidige paddestoelen, lekker bij vleesgerecht maar ook de ideale vleesvervanger. Veganistisch, glutenvrij. ', '', 1.49, 250, 250, 29);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pagina_info`
--

CREATE TABLE `detail_pagina_info` (
  `detail_pagina_info_id` int(11) NOT NULL,
  `gerecht_id` int(11) DEFAULT NULL,
  `record_type` text DEFAULT NULL,
  `text_inhoud` text DEFAULT NULL,
  `nummer` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pagina_info`
--

INSERT INTO `detail_pagina_info` (`detail_pagina_info_id`, `gerecht_id`, `record_type`, `text_inhoud`, `nummer`, `user_id`) VALUES
(1, 1, 'O', 'Dit gerecht is beter dan toen ik \"Imagine\" schreef!', 1, 1),
(2, 1, 'O', 'Dit recept is beter dan toen John \"Imagine\" schreef!', 2, 4),
(3, 3, 'O', 'Ik heb dit nu al 42 keer gemaakt. Iedere keer weer lekker. ', 1, 2),
(4, 2, 'O', 'De andere Beatles vinden het geweldig iedere keer als ik dit maak. ', 1, 4),
(5, 1, 'B', 'Kook de tagliatelle in water tot beetgaar. Ondertussen, snij de knoflook en broccoli fijn. Bak deze vervolgens langzaam aan in een pan met boter. ', 1, NULL),
(6, 1, 'B', 'Voeg de ontdooide zalmfilet toe; zodra deze zacht genoeg is, breek in stukken met de spatel. Zodra de zalm gaar genoeg is, schenk beetje bij beetje de slagroom erbij. ', 2, NULL),
(7, 1, 'B', 'Na een paar minuutjes simmeren, voeg de gekookte tagliatelle met een kooklepel van het pastawater toe. Serveer vervolgens met de kappertjes.', 3, NULL),
(8, 2, 'B', 'Snij de knoflook fijn en bak deze kort aan in een pan met olie. Snij ondertussen de pompoen in kleine stukjes, en voeg ze aan de pan toe. Kruid de pompoen naar wens. ', 1, NULL),
(9, 2, 'B', 'Na kort aanbakken, giet water bij de pan (genoeg zodat de pompoen onder staat) en laat het koken. Schep vervolgens enige schuim van de bovenkant en breng het vuur naar laag. Bedek de pan met een deksel en laat het simmeren voor 10 minuten. ', 2, NULL),
(10, 2, 'B', 'Voeg als laatste nog zout en vissaus naar smaak toe, en serveer met fijngesneden bosui.', 3, NULL),
(11, 3, 'B', 'Snij de knoflook fijn en bak zachtjes aan in een pan met olijfolie. Snij ondertussen de paprika in kleine stukjes, en fruit die met de knoflook mee voor circa 2 minuten. Voeg daarna het gehakt samen met wat peper en zout toe, en bak voor 4 minuten. ', 1, NULL),
(12, 3, 'B', 'Voor de jalapeno saus, fruit wat knoflook in een aparte pan in olie. Snij vervolgens de jalapeno pepers in kleine stukjes, en voeg die toe samen met de witte azijn, water, en wat zout. Zodra dit een minuutje gesimmerd heeft, voeg alles toe aan een blender samen met koriander en limoensap, en pureer tot een sausje. ', 2, NULL),
(13, 3, 'B', 'Vul de tacoschelpen nu met het gehaktmengsel, en garneer met salsa, gebakken uitjes, koriander, en de jalapeno saus. ', 3, NULL),
(14, 4, 'B', 'Snij de tofu en kastanje champignons in kleine blokjes. Snij de bosui in dunne ringetjes. ', 1, NULL),
(15, 4, 'B', 'Voeg water toe aan pan samen met een groentebouillon blokje en de miso paste. Laat dit al roerende oplossen. ', 2, NULL),
(16, 4, 'B', 'Voeg vervolgens de tofu en champignons toe aan de bouillon, en laat voor een klein minuutje doorkoken. Serveer vervolgens met zeewier en bosui.', 3, NULL),
(17, 2, 'W', NULL, 4, NULL),
(18, 4, 'W', NULL, 3, NULL),
(19, 1, 'W', NULL, 5, NULL),
(20, 2, 'W', NULL, 5, NULL),
(21, 4, 'W', NULL, 3, NULL),
(22, 2, 'F', NULL, NULL, 3),
(23, 3, 'F', NULL, NULL, 2),
(24, 3, 'F', NULL, NULL, 1),
(25, 1, 'F', NULL, NULL, 3),
(26, 1, 'F', NULL, NULL, 4);

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
(1, 1, 2, 'Pasta met zalm', NULL, '2022-09-13', 'Tagliatelle met roomsaus, broccoli, en zalmfilet.  ', 'Snel en makkelijk een heerlijk pastagerecht op tafel met zalm en broccoli in een romige saus. Maak het af met de kappertjes, en bij elkaar vormt alles de perfecte combinatie!'),
(2, 2, 1, 'Pompoensoep', NULL, '2022-09-16', 'Vietnamese pompoensoep met lenteui. ', 'Vietnamese pompoensoep, of wel Canh Bi Do, is een heerlijke, gezonde, en vullende groentesoep. Staat met een halfuur op tafel, en is het perfecte warme wintergerecht!'),
(3, 3, 3, 'Gehakt taco\'s', NULL, '2022-09-04', 'Taco\'s met gehakt, gebakken uitjes, en jalapeño dipsaus. ', 'Krokante tacoschelpen gevuld met een heerlijk gekruid gehaktmengsel en toppings. Voeg een pittige dipsaus toe en dit is TexMex topper die bij iedereen in de smaak valt!'),
(4, 4, 3, 'Misosoep met tofu', NULL, '2022-09-28', 'Japanse misosoep met zeewier en tofu. ', 'Wanneer je zin hebt in een lekkere en simpele Aziatische soep, heb je deze Japanse misosoep binnen 15 minuten op tafel staan. De tofu en champignons maken dit de perfecte en vullende bron van proteïne voor ieder vegetariër! ');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredient_id` int(1) NOT NULL,
  `gerecht_id` int(1) NOT NULL,
  `artikel_id` int(1) DEFAULT NULL,
  `ingredient_hoeveelheid` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredient_id`, `gerecht_id`, `artikel_id`, `ingredient_hoeveelheid`) VALUES
(1, 1, 1, 8),
(2, 1, 3, 250),
(3, 1, 7, 300),
(4, 2, 4, 400),
(5, 2, 2, 30),
(6, 2, 1, 8),
(7, 2, 8, 3),
(8, 3, 11, 400),
(9, 3, 10, 88),
(10, 3, 9, 160),
(11, 3, 1, 8),
(12, 4, 2, 30),
(13, 4, 6, 72),
(14, 4, 5, 375),
(15, 1, 12, 350),
(16, 1, 13, 350),
(17, 1, 14, 5),
(18, 1, 15, 15),
(19, 2, 16, 10),
(20, 3, 18, 135),
(21, 3, 19, 30),
(22, 3, 20, 14),
(23, 3, 21, 175),
(24, 3, 22, 60),
(25, 3, 23, 10),
(26, 4, 24, 10),
(27, 4, 25, 20),
(28, 4, 26, 200);

-- --------------------------------------------------------

--
-- Table structure for table `keuken_type`
--

CREATE TABLE `keuken_type` (
  `keuken_type_id` int(11) NOT NULL,
  `keuken` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keuken_type`
--

INSERT INTO `keuken_type` (`keuken_type_id`, `keuken`, `type`) VALUES
(1, 'Meditteraans.', 'Visgerecht.'),
(2, 'Aziatisch. ', 'Vegetarisch. '),
(3, 'Mexicaans. ', 'Vleesgerecht. '),
(4, 'Aziatisch. ', 'Veganistisch. ');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikel_id`);

--
-- Indexes for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  ADD PRIMARY KEY (`detail_pagina_info_id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexes for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`gerecht_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `keuken_type_id` (`keuken_type_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD KEY `gerecht_id` (`gerecht_id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indexes for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`keuken_type_id`),
  ADD KEY `record_keuken_id` (`keuken`(768));

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `artikel_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  MODIFY `detail_pagina_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `gerecht_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredient_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `keuken_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pagina_info`
--
ALTER TABLE `detail_pagina_info`
  ADD CONSTRAINT `detail_pagina_info_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`);

--
-- Constraints for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`gerecht_id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`artikel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
