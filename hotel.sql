-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 26 2018 г., 01:01
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `hotel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int(10) NOT NULL AUTO_INCREMENT,
  `FIO` varchar(100) NOT NULL,
  `phone` decimal(11,0) NOT NULL,
  `room` int(2) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id_client`, `FIO`, `phone`, `room`) VALUES
(1, 'Ivanov Ivan Ivanovich', '89998887766', 17),
(2, 'Petrov Petr Petrovich', '81114578912', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `gym`
--

CREATE TABLE IF NOT EXISTS `gym` (
  `id_service` int(2) NOT NULL DEFAULT '11',
  `id_client` int(10) NOT NULL,
  `id_session` int(10) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_session` (`id_session`),
  KEY `id_service` (`id_service`,`id_client`,`id_session`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `gym`
--

INSERT INTO `gym` (`id_service`, `id_client`, `id_session`, `time`) VALUES
(11, 2, 1, '2018-12-09 10:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `massage`
--

CREATE TABLE IF NOT EXISTS `massage` (
  `id_service` int(2) NOT NULL DEFAULT '12',
  `id_client` int(10) NOT NULL,
  `id_session` int(10) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_session` (`id_session`),
  KEY `id_service` (`id_service`,`id_client`,`id_session`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `rendered_services`
--

CREATE TABLE IF NOT EXISTS `rendered_services` (
  `id_service` int(10) NOT NULL,
  `id_client` int(10) NOT NULL,
  KEY `id_service` (`id_service`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rendered_services`
--

INSERT INTO `rendered_services` (`id_service`, `id_client`) VALUES
(12, 2),
(14, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id_service` int(2) NOT NULL DEFAULT '10',
  `id_client` int(10) NOT NULL,
  `id_reservation` int(10) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `table` int(2) NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_reservation` (`id_reservation`),
  KEY `id_service` (`id_service`,`id_client`,`id_reservation`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `restaurant`
--

INSERT INTO `restaurant` (`id_service`, `id_client`, `id_reservation`, `time`, `table`) VALUES
(10, 2, 1, '2018-12-10 17:00:00', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sauna`
--

CREATE TABLE IF NOT EXISTS `sauna` (
  `id_service` int(2) NOT NULL DEFAULT '13',
  `id_client` int(10) NOT NULL,
  `id_session` int(10) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_session` (`id_session`),
  KEY `id_service` (`id_service`,`id_client`,`id_session`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Дамп данных таблицы `sauna`
--

INSERT INTO `sauna` (`id_service`, `id_client`, `id_session`, `time`) VALUES
(13, 2, 110, '2018-12-09 18:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id_service` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `cost` int(5) NOT NULL,
  PRIMARY KEY (`id_service`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id_service`, `name`, `cost`) VALUES
(10, 'restaurant', 0),
(11, 'gym', 500),
(12, 'massage', 1500),
(13, 'sauna', 1000),
(14, 'tour', 4000);

-- --------------------------------------------------------

--
-- Структура таблицы `tour`
--

CREATE TABLE IF NOT EXISTS `tour` (
  `id_service` int(2) NOT NULL DEFAULT '14',
  `id_client` int(10) NOT NULL,
  `id_session` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_session` (`id_session`),
  KEY `id_service` (`id_service`,`id_client`,`id_session`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `tour`
--

INSERT INTO `tour` (`id_service`, `id_client`, `id_session`, `name`, `time`) VALUES
(14, 2, 2, 'Tour of the rivers and canals', '2018-12-12 11:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(99) NOT NULL,
  `password` varchar(99) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`) VALUES
(1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b'),
(2, 'ivanov', 'c4ca4238a0b923820dcc509a6f75849b');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gym`
--
ALTER TABLE `gym`
  ADD CONSTRAINT `gym_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gym_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `massage`
--
ALTER TABLE `massage`
  ADD CONSTRAINT `massage_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `massage_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rendered_services`
--
ALTER TABLE `rendered_services`
  ADD CONSTRAINT `rendered_services_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `rendered_services_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sauna`
--
ALTER TABLE `sauna`
  ADD CONSTRAINT `sauna_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `sauna_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Ограничения внешнего ключа таблицы `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
