-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Dez-2019 às 05:08
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_web2`
--
CREATE DATABASE IF NOT EXISTS `db_web2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_web2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agua_potavel`
--

DROP TABLE IF EXISTS `agua_potavel`;
CREATE TABLE IF NOT EXISTS `agua_potavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aguapot_user` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE IF NOT EXISTS `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_user` varchar(45) NOT NULL,
  `renda_id` int(11) NOT NULL,
  `agua_potavel_id` int(11) NOT NULL,
  `saneamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`renda_id`,`agua_potavel_id`,`saneamento_id`),
  KEY `fk_cidade_renda1` (`renda_id`),
  KEY `fk_cidade_agua_potavel1` (`agua_potavel_id`),
  KEY `fk_cidade_saneamento1` (`saneamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_user` char(2) NOT NULL,
  `renda_id` int(11) NOT NULL,
  `saneamento_id` int(11) NOT NULL,
  `agua_potavel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`renda_id`,`saneamento_id`,`agua_potavel_id`),
  KEY `fk_estado_renda1` (`renda_id`),
  KEY `fk_estado_saneamento1` (`saneamento_id`),
  KEY `fk_estado_agua_potavel1` (`agua_potavel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `renda`
--

DROP TABLE IF EXISTS `renda`;
CREATE TABLE IF NOT EXISTS `renda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `renda_user` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `saneamento`
--

DROP TABLE IF EXISTS `saneamento`;
CREATE TABLE IF NOT EXISTS `saneamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saneamento_user` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `renda_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `cidade_id` int(11) NOT NULL,
  `agua_potavel_id` int(11) NOT NULL,
  `saneamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`renda_id`,`estado_id`,`cidade_id`,`agua_potavel_id`,`saneamento_id`),
  KEY `fk_user_renda` (`renda_id`),
  KEY `fk_user_estado1` (`estado_id`),
  KEY `fk_user_cidade1` (`cidade_id`),
  KEY `fk_user_agua_potavel1` (`agua_potavel_id`),
  KEY `fk_user_saneamento1` (`saneamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `fk_cidade_agua_potavel1` FOREIGN KEY (`agua_potavel_id`) REFERENCES `agua_potavel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cidade_renda1` FOREIGN KEY (`renda_id`) REFERENCES `renda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cidade_saneamento1` FOREIGN KEY (`saneamento_id`) REFERENCES `saneamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estado`
--
ALTER TABLE `estado`
  ADD CONSTRAINT `fk_estado_agua_potavel1` FOREIGN KEY (`agua_potavel_id`) REFERENCES `agua_potavel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_renda1` FOREIGN KEY (`renda_id`) REFERENCES `renda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_saneamento1` FOREIGN KEY (`saneamento_id`) REFERENCES `saneamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_agua_potavel1` FOREIGN KEY (`agua_potavel_id`) REFERENCES `agua_potavel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_cidade1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_renda` FOREIGN KEY (`renda_id`) REFERENCES `renda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_saneamento1` FOREIGN KEY (`saneamento_id`) REFERENCES `saneamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
