-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 04. pro 2018, 21:43
-- Verze serveru: 10.1.29-MariaDB
-- Verze PHP: 7.2.0

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
-- Struktura tabulky `su_barva`
--

CREATE TABLE `su_barva` (
  `idBarva` int(11) NOT NULL,
  `barva` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_groups`
--

CREATE TABLE `su_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `su_groups`
--

INSERT INTO `su_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktura tabulky `su_karoserie`
--

CREATE TABLE `su_karoserie` (
  `idKaroserie` int(11) NOT NULL,
  `typKaroserie` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

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
  `nazevModel` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `delete` tinyint(4) DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `prevodovka_idPrevodovka` int(11) NOT NULL,
  `motor_idMotor` int(11) NOT NULL,
  `karoserie_idKaroserie` int(11) NOT NULL,
  `barva_idBarva` int(11) NOT NULL,
  `znacka_idZnacka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_motor`
--

CREATE TABLE `su_motor` (
  `idMotor` int(11) NOT NULL,
  `objem` int(11) DEFAULT NULL,
  `palivo` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `výkon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `su_prevodovka`
--

CREATE TABLE `su_prevodovka` (
  `idPrevodovka` int(11) NOT NULL,
  `typ` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `pocetStupnu` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

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

--
-- Vypisuji data pro tabulku `su_users`
--

INSERT INTO `su_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1268889823, 1, 'Admin', 'istrator', 'ADMIN', '0');

-- --------------------------------------------------------

--
-- Struktura tabulky `su_users_groups`
--

CREATE TABLE `su_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `su_users_groups`
--

INSERT INTO `su_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `su_znacka`
--

CREATE TABLE `su_znacka` (
  `idZnacka` int(11) NOT NULL,
  `nazevZnacky` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `su_barva`
--
ALTER TABLE `su_barva`
  ADD PRIMARY KEY (`idBarva`);

--
-- Klíče pro tabulku `su_groups`
--
ALTER TABLE `su_groups`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `su_karoserie`
--
ALTER TABLE `su_karoserie`
  ADD PRIMARY KEY (`idKaroserie`);

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
  ADD KEY `fk_su_model_su_prevodovka1_idx` (`prevodovka_idPrevodovka`),
  ADD KEY `fk_su_model_su_motor1_idx` (`motor_idMotor`),
  ADD KEY `fk_su_model_su_karoserie1_idx` (`karoserie_idKaroserie`),
  ADD KEY `fk_su_model_su_barva1_idx` (`barva_idBarva`),
  ADD KEY `fk_su_model_su_znacka1_idx` (`znacka_idZnacka`);

--
-- Klíče pro tabulku `su_motor`
--
ALTER TABLE `su_motor`
  ADD PRIMARY KEY (`idMotor`);

--
-- Klíče pro tabulku `su_prevodovka`
--
ALTER TABLE `su_prevodovka`
  ADD PRIMARY KEY (`idPrevodovka`);

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
-- AUTO_INCREMENT pro tabulku `su_barva`
--
ALTER TABLE `su_barva`
  MODIFY `idBarva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_groups`
--
ALTER TABLE `su_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `su_karoserie`
--
ALTER TABLE `su_karoserie`
  MODIFY `idKaroserie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_login_attempts`
--
ALTER TABLE `su_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_model`
--
ALTER TABLE `su_model`
  MODIFY `idModel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_motor`
--
ALTER TABLE `su_motor`
  MODIFY `idMotor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_prevodovka`
--
ALTER TABLE `su_prevodovka`
  MODIFY `idPrevodovka` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `su_users`
--
ALTER TABLE `su_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `su_users_groups`
--
ALTER TABLE `su_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `su_znacka`
--
ALTER TABLE `su_znacka`
  MODIFY `idZnacka` int(11) NOT NULL AUTO_INCREMENT;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `su_model`
--
ALTER TABLE `su_model`
  ADD CONSTRAINT `fk_su_model_su_barva1` FOREIGN KEY (`barva_idBarva`) REFERENCES `su_barva` (`idBarva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_su_model_su_karoserie1` FOREIGN KEY (`karoserie_idKaroserie`) REFERENCES `su_karoserie` (`idKaroserie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_su_model_su_motor1` FOREIGN KEY (`motor_idMotor`) REFERENCES `su_motor` (`idMotor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_su_model_su_prevodovka1` FOREIGN KEY (`prevodovka_idPrevodovka`) REFERENCES `su_prevodovka` (`idPrevodovka`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_su_model_su_znacka1` FOREIGN KEY (`znacka_idZnacka`) REFERENCES `su_znacka` (`idZnacka`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Omezení pro tabulku `su_users_groups`
--
ALTER TABLE `su_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `su_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `su_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
