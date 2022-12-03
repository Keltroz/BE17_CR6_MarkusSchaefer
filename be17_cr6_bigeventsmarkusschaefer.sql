-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2022 at 05:54 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be17_cr6_bigeventsmarkusschaefer`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221202174010', '2022-12-02 18:40:25', 93);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`id`, `name`, `date`, `time`, `description`, `picture`, `capacity`, `contact_email`, `contact_phone`, `address`, `url`) VALUES
(24, 'Brian Adams', '2022-12-03', '19:30:00', 'So Happy It Hurts Tour', 'brian adams.jpg', 5000, NULL, '+43 1 79 999 79', 'Vienna Stadthalle\r\nHalle D\r\nRoland-Rainer-Platz 1\r\n1150 Wien ', 'www.stadthalle.com\r\n\r\nWien-Ticket\r\nwww.wien-ticket.at  '),
(25, 'Muse - Will Of The People World Tour 2023\r\n', '2023-06-03', '17:00:00', 'After the worldwide chart success of their ninth studio album \"Will Of The People\", Muse go on a tour of the same name. Special Guests: Royal Blood', 'muse.jpg', 7500, NULL, NULL, 'Stadium Wiener Neustadt\r\nFerdinand-Graf-von-Zeppelin-Straße 10\r\n2700 Wiener Neustadt', 'https://www.oeticket.com/artist/muse/?affiliate=B38'),
(26, 'In Flames', '2022-12-04', '18:30:00', 'In Flames are coming to Vienna in December 2022. They also have At The Gates, Imminence and Orbit Culture with them.', 'in flames.jpg', 6000, NULL, NULL, 'Palladium Köln\r\nSchanzenstraße 36\r\n51063 Köln\r\nDeutschland', 'https://www.oeticket.com/artist/in-flames/?affiliate=B38'),
(27, 'Der gestiefelte Kater ', '2022-12-04', '16:00:00', 'Fairy tale opera in two acts based on the fairy tale of the same name by Charles Perrault.\r\n\r\nPupils of the Upper Secondary School of the Vienna Boys\' Choir\r\nStudents in the preparatory course dance MUK under the direction of Vera-Viktoria Szirmay, ballet\r\n\r\nConductors: Manolo Cagnin and David Jussel\r\nDirection and artistic direction: Barbara Palmetzhofer', 'der gestiefelte kater.jpg', 4000, NULL, '+43 1 347 80 80', 'Am Augartenspitz 1\r\n1020 Wien', 'www.muth.at'),
(28, 'Lipizzaner Special', '2022-12-26', '11:00:00', 'During the “Lipizzaner Special” three program points out of the Spanish Riding School’s repertoire transmit an idea of the High School of Classical Horsemanship, known as the “white Lipizzaner ballet” all around the globe.\r\n\r\nBesides the “Schools on and above the ground”, including the famous “Levade” or the spectacular “Capriole”, visitors will be able to experience alternately the so called “Work in hand”, the “Work on the long rein”, a solo program including “All the steps and movements of the High School” and the world famous “School Quadrille”. Including additional comments during the short intervals between the individual riding displays and accompanied by the most beautiful sounds of classical music, the condensed, new program lasts approx. 45 minutes.', 'lipizzaner.jpg', 2800, 'office@srs.at', '+43 1 533 90 31', 'Michaelerplatz 1 (Besucherzentrum/VisitorCenter)1010 Wien', 'www.srs.at');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
