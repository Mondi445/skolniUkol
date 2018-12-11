-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 11. pro 2018, 10:33
-- Verze serveru: 10.1.37-MariaDB
-- Verze PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `skolniukol`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `su_ci_session`
--

CREATE TABLE `su_ci_session` (
  `id` varchar(40) COLLATE utf8_czech_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_czech_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `su_ci_session`
--

INSERT INTO `su_ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('99ob569fkt3oc7ib356q4om8qvjepu8h', '::1', 1544520772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534343532303737323b);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `su_ci_session`
--
ALTER TABLE `su_ci_session`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
