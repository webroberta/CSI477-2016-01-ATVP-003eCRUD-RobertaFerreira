-- MySQL Workbench Synchronization
-- Generated: 2016-07-18 16:00
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: jose

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP USER IF EXISTS 'sisProvaWeb';
CREATE USER IF NOT EXISTS 'sisProvaWeb'@'localhost' IDENTIFIED BY 'sisProvaWeb';
GRANT ALL PRIVILEGES ON * . * TO 'sisProvaWeb'@'localhost';
FLUSH PRIVILEGES; 

DROP SCHEMA IF EXISTS `prova`;
CREATE SCHEMA IF NOT EXISTS `prova` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `prova`.`pacientes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `prova`.`pacientes` (nome, login, senha) values ('maria', 'maria', 'maria');

INSERT INTO `prova`.`pacientes` (nome, login, senha) values ('joao', 'joao', 'joao');

CREATE TABLE IF NOT EXISTS `prova`.`procedimentos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `prova`.`procedimentos`(nome, preco) values
	('Hemograma completo', 100.00);

INSERT INTO `prova`.`procedimentos`(nome, preco) values
	('Procedimento teste', 500.00);

INSERT INTO `prova`.`procedimentos` (nome, preco) values
	('Procedimento laboratorial', 1000.00);

CREATE TABLE IF NOT EXISTS `prova`.`exames` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` INT(11) NOT NULL,
  `procedimento_id` INT(11) NOT NULL,
  `data` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `paciente_id`, `procedimento_id`),
  INDEX `fk_exames_has_procedimentos` (`procedimento_id` ASC),
  INDEX `fk_exames_has_pacientes` (`paciente_id` ASC),
  CONSTRAINT `fk_exames_has_pacientes`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `prova`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exames_has_procedimentos`
    FOREIGN KEY (`procedimento_id`)
    REFERENCES `prova`.`procedimentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
