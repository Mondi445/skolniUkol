-- MySQL Script generated by MySQL Workbench
-- Tue Dec  4 20:19:36 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema skolniUkol
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema skolniUkol
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `skolniUkol` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema configuration
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema configuration
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `configuration` DEFAULT CHARACTER SET utf8 ;
USE `skolniUkol` ;

-- -----------------------------------------------------
-- Table `skolniUkol`.`su_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_groups` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `su_groups` (`id`, `name`, `description`) VALUES
     (1,'admin','Administrator'),
     (2,'members','General User');

-- -----------------------------------------------------
-- Table `skolniUkol`.`su_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(254) NOT NULL,
  `activation_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_time` INT(11) UNSIGNED NULL DEFAULT NULL,
  `remember_code` VARCHAR(40) NULL DEFAULT NULL,
  `created_on` INT(11) UNSIGNED NOT NULL,
  `last_login` INT(11) UNSIGNED NULL DEFAULT NULL,
  `active` TINYINT(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `company` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `su_users` (`id`,
                        `ip_address`,
                        `username`,
                        `password`,
                        `salt`,
                        `email`,
                        `activation_code`,
                        `forgotten_password_code`,
                        `created_on`,
                        `last_login`,
                        `active`,
                        `first_name`,
                        `last_name`,
                        `company`,
                        `phone`)
               VALUES
                        ('1',
                         '127.0.0.1',
                         'administrator',
                         '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36',
                         '',
                         'admin@admin.com',
                         '',
                         NULL,
                         '1268889823',
                         '1268889823',
                         '1',
                         'Admin',
                         'istrator',
                         'ADMIN',
                         '0');
-- -----------------------------------------------------
-- Table `skolniUkol`.`su_users_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_users_groups` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `group_id` MEDIUMINT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_groups_users1_idx` (`user_id` ASC),
  INDEX `fk_users_groups_groups1_idx` (`group_id` ASC),
  UNIQUE INDEX `uc_users_groups` (`group_id` ASC),
  CONSTRAINT `fk_users_groups_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `skolniUkol`.`su_users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1`
    FOREIGN KEY (`group_id`)
    REFERENCES `skolniUkol`.`su_groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `mt_users_groups` (`id`, `user_id`, `group_id`) VALUES
     (1,1,1),
     (2,1,2);

-- -----------------------------------------------------
-- Table `skolniUkol`.`su_login_attempts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_login_attempts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) NOT NULL,
  `login` VARCHAR(100) NOT NULL,
  `time` INT(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_znacka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_znacka` (
  `idZnacka` INT NOT NULL AUTO_INCREMENT,
  `nazevZnacky` VARCHAR(255) NULL,
  `pic` VARCHAR(255) NULL,
  PRIMARY KEY (`idZnacka`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_prevodovka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_prevodovka` (
  `idPrevodovka` INT NOT NULL AUTO_INCREMENT,
  `typ` VARCHAR(255) NULL,
  `pocetStupnu` TINYINT NULL,
  PRIMARY KEY (`idPrevodovka`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_motor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_motor` (
  `idMotor` INT NOT NULL AUTO_INCREMENT,
  `objem` INT NULL,
  `palivo` VARCHAR(255) NULL,
  `výkon` INT NULL,
  PRIMARY KEY (`idMotor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_karoserie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_karoserie` (
  `idKaroserie` INT NOT NULL AUTO_INCREMENT,
  `typKaroserie` VARCHAR(255) NULL,
  PRIMARY KEY (`idKaroserie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_barva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_barva` (
  `idBarva` INT NOT NULL AUTO_INCREMENT,
  `barva` VARCHAR(255) NULL,
  PRIMARY KEY (`idBarva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `skolniUkol`.`su_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `skolniUkol`.`su_model` (
  `idModel` INT NOT NULL AUTO_INCREMENT,
  `nazevModel` VARCHAR(255) NULL,
  `delete` TINYINT NULL,
  `pic` VARCHAR(255) NULL,
  `prevodovka_idPrevodovka` INT NOT NULL,
  `motor_idMotor` INT NOT NULL,
  `karoserie_idKaroserie` INT NOT NULL,
  `barva_idBarva` INT NOT NULL,
  `znacka_idZnacka` INT NOT NULL,
  PRIMARY KEY (`idModel`),
  INDEX `fk_su_model_su_prevodovka1_idx` (`prevodovka_idPrevodovka` ASC),
  INDEX `fk_su_model_su_motor1_idx` (`motor_idMotor` ASC),
  INDEX `fk_su_model_su_karoserie1_idx` (`karoserie_idKaroserie` ASC),
  INDEX `fk_su_model_su_barva1_idx` (`barva_idBarva` ASC),
  INDEX `fk_su_model_su_znacka1_idx` (`znacka_idZnacka` ASC),
  CONSTRAINT `fk_su_model_su_prevodovka1`
    FOREIGN KEY (`prevodovka_idPrevodovka`)
    REFERENCES `skolniUkol`.`su_prevodovka` (`idPrevodovka`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_su_model_su_motor1`
    FOREIGN KEY (`motor_idMotor`)
    REFERENCES `skolniUkol`.`su_motor` (`idMotor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_su_model_su_karoserie1`
    FOREIGN KEY (`karoserie_idKaroserie`)
    REFERENCES `skolniUkol`.`su_karoserie` (`idKaroserie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_su_model_su_barva1`
    FOREIGN KEY (`barva_idBarva`)
    REFERENCES `skolniUkol`.`su_barva` (`idBarva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_su_model_su_znacka1`
    FOREIGN KEY (`znacka_idZnacka`)
    REFERENCES `skolniUkol`.`su_znacka` (`idZnacka`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `configuration` ;

-- -----------------------------------------------------
-- Table `configuration`.`vyrobce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`vyrobce` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuration`.`typKomponentu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`typKomponentu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuration`.`komponent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`komponent` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(255) NOT NULL,
  `idVyrobce` INT NOT NULL,
  `idTypKomponentu` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_komponent_vyrobce_idx` (`idVyrobce` ASC),
  INDEX `fk_komponent_typKomponentu1_idx` (`idTypKomponentu` ASC),
  CONSTRAINT `fk_komponent_vyrobce`
    FOREIGN KEY (`idVyrobce`)
    REFERENCES `configuration`.`vyrobce` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_komponent_typKomponentu1`
    FOREIGN KEY (`idTypKomponentu`)
    REFERENCES `configuration`.`typKomponentu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuration`.`jednotka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`jednotka` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuration`.`parametr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`parametr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `configuration`.`hodnotyKomponentu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration`.`hodnotyKomponentu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hodnota` INT NOT NULL,
  `idKomponent` INT NOT NULL,
  `idJednotka` INT NOT NULL,
  `idParametr` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hodnotyKomponentu_komponent1_idx` (`idKomponent` ASC),
  INDEX `fk_hodnotyKomponentu_jednotka1_idx` (`idJednotka` ASC),
  INDEX `fk_hodnotyKomponentu_parametr1_idx` (`idParametr` ASC),
  CONSTRAINT `fk_hodnotyKomponentu_komponent1`
    FOREIGN KEY (`idKomponent`)
    REFERENCES `configuration`.`komponent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hodnotyKomponentu_jednotka1`
    FOREIGN KEY (`idJednotka`)
    REFERENCES `configuration`.`jednotka` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hodnotyKomponentu_parametr1`
    FOREIGN KEY (`idParametr`)
    REFERENCES `configuration`.`parametr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
