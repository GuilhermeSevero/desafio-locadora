/* Tabelas podem ser criadas quando executar o serviço da API */

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `locadora` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `locadora`;

CREATE TABLE `movies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `movies` (`id`, `title`, `director`, `stock`, `created_at`, `updated_at`) VALUES
(1,	'Avengers',	'Joss Whedon',	3,	'2020-01-01 00:00:00',	'2020-03-27 03:59:05'),
(2,	'Matrix',	'Lana Wachowski',	0,	'2020-01-01 00:00:00',	'2020-03-27 04:00:15'),
(3,	'Lord of the Rings',	'Peter Jackson',	3,	'2020-01-01 00:00:00',	'2020-01-01 00:00:00'),
(4,	'Back to the Future',	'Robert Zemeckis',	1,	'2020-01-01 00:00:00',	'2020-03-27 04:01:31');

CREATE TABLE `rents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `movie_id` bigint(20) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `return` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `rents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rents_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `rents` (`id`, `user_id`, `movie_id`, `date`, `return`, `created_at`, `updated_at`) VALUES
(1,	2,	1,	'2020-03-27 03:58:57',	NULL,	'2020-03-27 03:58:57',	'2020-03-27 03:58:57'),
(2,	3,	1,	'2020-03-27 03:59:05',	NULL,	'2020-03-27 03:59:05',	'2020-03-27 03:59:05'),
(3,	2,	2,	'2020-03-27 03:59:13',	NULL,	'2020-03-27 03:59:13',	'2020-03-27 03:59:13'),
(4,	4,	4,	'2020-03-27 03:59:35',	NULL,	'2020-03-27 03:59:35',	'2020-03-27 03:59:35'),
(5,	3,	2,	'2020-03-27 04:00:15',	NULL,	'2020-03-27 04:00:15',	'2020-03-27 04:00:15'),
(6,	1,	4,	'2020-03-27 04:01:00',	'2020-03-27 04:01:31',	'2020-03-27 04:01:00',	'2020-03-27 04:01:31');

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1,	'usuario1',	'usuario1@email.com.br',	'25d55ad283aa400af464c76d713c07ad',	'2020-03-27 00:00:00',	'2020-03-27 00:00:00'),
(2,	'usuario2',	'usuario2@email.com.br',	'25d55ad283aa400af464c76d713c07ad',	'2020-03-27 00:00:00',	'2020-03-27 00:00:00'),
(3,	'usuario3',	'usuario3@email.com.br',	'25d55ad283aa400af464c76d713c07ad',	'2020-03-27 00:00:00',	'2020-03-27 00:00:00'),
(4,	'usuario4',	'usuario4@email.com.br',	'25d55ad283aa400af464c76d713c07ad',	'2020-03-27 00:00:00',	'2020-03-27 00:00:00');