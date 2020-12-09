-- MySQL Script generated by MySQL Workbench
-- So 29 Sep 2019 05:39:15 PDT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema webshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `webshop`;
-- -----------------------------------------------------
-- Schema webmemory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;
USE `webshop` ;

-- -----------------------------------------------------
-- Table `webshop`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `firstname` VARCHAR(50) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
--  `plz` INT NOT NULL,
--  `location` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `webshop`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `foto` MEDIUMBLOB NOT NULL,
  `stock` int NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `seller_id` INT NOT NULL,
  PRIMARY KEY (`id`),
   	CONSTRAINT FK_SELLER_ID FOREIGN KEY (seller_id)
    REFERENCES customer(id))
    
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webshop`.`observing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`observing` (
  `observer_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`observer_id`,`item_id` ),
  CONSTRAINT FK_OBSERVER_ID FOREIGN KEY (observer_id)
    REFERENCES customer(id),
    	CONSTRAINT FK_OBSERVED_ID FOREIGN KEY (item_id)
    REFERENCES item(id)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `webshop`.`buying`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webshop`.`purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `buyer_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `sold` TIME,  
  PRIMARY KEY (`id` ),
  CONSTRAINT FK_BUYER_ID FOREIGN KEY (buyer_id)
    REFERENCES customer(id),
    	CONSTRAINT FK_BOUGHT_ID FOREIGN KEY (item_id)
    REFERENCES item(id)
  )
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Inserts
-- -----------------------------------------------------

INSERT INTO customer (`email`, `firstname`, `name`, `password`)
VALUES ('karl.keller@test.com', 'karl', 'keller', 'keller11'), 
('sara.seif@test.com', 'sara', 'seif', 'seif11');