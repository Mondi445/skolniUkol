-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 11. pro 2018, 11:20
-- Verze serveru: 10.1.16-MariaDB
-- Verze PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktura tabulky `su_groups`
--

CREATE TABLE `su_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_login_attempts`
--

CREATE TABLE `su_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_model`
--

CREATE TABLE `su_model` (
  `idModel` int(11) NOT NULL,
  `nazev` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8_czech_ci NOT NULL,
  `karoserie` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `barva` varchar(11) COLLATE utf8_czech_ci NOT NULL,
  `znacka_idZnacka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `su_model`
--

INSERT INTO `su_model` (`idModel`, `nazev`, `pic`, `karoserie`, `barva`, `znacka_idZnacka`) VALUES
(1, 'Fabia', 'fabia.png', '0', '0', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `su_users`
--

CREATE TABLE `su_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_users_groups`
--

CREATE TABLE `su_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_znacka`
--

CREATE TABLE `su_znacka` (
  `idZnacka` int(11) NOT NULL,
  `nazevZnacky` varchar(255) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `su_znacka`
--

INSERT INTO `su_znacka` (`idZnacka`, `nazevZnacky`) VALUES
(1, 'Škoda');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `su_groups`
--
ALTER TABLE `su_groups`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `su_login_attempts`
--
ALTER TABLE `su_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `su_model`
--
ALTER TABLE `su_model`
  ADD PRIMARY KEY (`idModel`),
  ADD KEY `fk_su_model_su_znacka1_idx` (`znacka_idZnacka`);

--
-- Klíče pro tabulku `su_users`
--
ALTER TABLE `su_users`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `su_users_groups`
--
ALTER TABLE `su_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Klíče pro tabulku `su_znacka`
--
ALTER TABLE `su_znacka`
  ADD PRIMARY KEY (`idZnacka`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `su_groups`
--
ALTER TABLE `su_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `su_login_attempts`
--
ALTER TABLE `su_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `su_model`
--
ALTER TABLE `su_model`
  MODIFY `idModel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pro tabulku `su_users`
--
ALTER TABLE `su_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `su_users_groups`
--
ALTER TABLE `su_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `su_znacka`
--
ALTER TABLE `su_znacka`
  MODIFY `idZnacka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `su_model`
--
ALTER TABLE `su_model`
  ADD CONSTRAINT `fk_su_model_su_znacka1` FOREIGN KEY (`znacka_idZnacka`) REFERENCES `su_znacka` (`idZnacka`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `su_users_groups`
--
ALTER TABLE `su_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `su_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `su_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
