--# v.1.0.0
--# Domain: https://github.com/JacobsenKim/ha2mariadb
--# Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
--# Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
--#
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Vært: core-mariadb:3306
-- Genereringstid: 26. 02 2024 kl. 02:13:02
-- Serverversion: 10.6.12-MariaDB
-- PHP-version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeassistant`
--
-- ############################################################
-- # Once its done importing, we need to make a few tweaks... #
-- ############################################################
-- # https://gist.github.com/PattaFeuFeu/c4475457854f42f64f21268777d64d87
-- 
-- From phpmyadmin in consol run "SELECT MAX(event_id) AS Count FROM events;" and so on for all the tabels,
--
-- the number returned edit it in AUTO_INCREMENT=412; +1 so if it return 411 you enter 412.
--
-- Once all 12 is ok save and drop this file in "output" folder and run "sql_import_remote.sh" to import change to the DB.
--
-- ##########################################################################################
-- You can find the numbers in the log. ./output/0000_a_mysql_import.log and it shows in terminal when you import the first part and data.
--
-- Numbers in the log is with +1 so its copy/paste.
-- ##########################################################################################
-- Tilføj AUTO_INCREMENT i tabel `events`
-- SELECT MAX(event_id) AS Count FROM events;
ALTER TABLE `events` MODIFY COLUMN `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5096;

--
-- Tilføj AUTO_INCREMENT i tabel `event_data`
-- SELECT MAX(data_id) AS Count FROM event_data;
ALTER TABLE `event_data` MODIFY COLUMN `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;

--
-- Tilføj AUTO_INCREMENT i tabel `event_types`
-- SELECT MAX(event_type_id) AS Count FROM event_types;
ALTER TABLE `event_types` MODIFY COLUMN `event_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tilføj AUTO_INCREMENT i tabel `recorder_runs`
-- SELECT MAX(run_id) as Count FROM recorder_runs;
ALTER TABLE `recorder_runs` MODIFY COLUMN `run_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tilføj AUTO_INCREMENT i tabel `schema_changes`
-- SELECT MAX(change_id) AS Count FROM schema_changes;
ALTER TABLE `schema_changes` MODIFY COLUMN `change_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tilføj AUTO_INCREMENT i tabel `states`
-- SELECT MAX(state_id) AS Count FROM states;
ALTER TABLE `states` MODIFY COLUMN `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20353;

--
-- Tilføj AUTO_INCREMENT i tabel `states_meta`
-- SELECT MAX(metadata_id) AS Count FROM states_meta;
ALTER TABLE `states_meta` MODIFY COLUMN `metadata_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Tilføj AUTO_INCREMENT i tabel `state_attributes`
-- SELECT MAX(attributes_id) AS Count FROM state_attributes;
ALTER TABLE `state_attributes` MODIFY COLUMN `attributes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;

--
-- Tilføj AUTO_INCREMENT i tabel `statistics`
-- SELECT MAX(id) AS Count FROM statistics;
ALTER TABLE `statistics` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- Tilføj AUTO_INCREMENT i tabel `statistics_meta`
-- SELECT MAX(id) AS Count FROM statistics_meta;
ALTER TABLE `statistics_meta` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tilføj AUTO_INCREMENT i tabel `statistics_runs`
-- SELECT MAX(run_id) AS Count FROM statistics_runs;
ALTER TABLE `statistics_runs` MODIFY COLUMN `run_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=636;

--
-- Tilføj AUTO_INCREMENT i tabel `statistics_short_term`
-- SELECT MAX(id) AS Count FROM statistics_short_term;
ALTER TABLE `statistics_short_term` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7564;

-- #################################################################
-- Do not edit below.
-- #################################################################
--
-- Begrænsninger for dumpede tabeller
--
--
-- Begrænsninger for tabel `events`
--
ALTER TABLE `events` ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `event_data` (`data_id`);
ALTER TABLE `events` ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`event_type_id`);

--
-- Begrænsninger for tabel `states`
--
ALTER TABLE `states` ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`old_state_id`) REFERENCES `states` (`state_id`);
ALTER TABLE `states` ADD CONSTRAINT `states_ibfk_2` FOREIGN KEY (`attributes_id`) REFERENCES `state_attributes` (`attributes_id`);
ALTER TABLE `states` ADD CONSTRAINT `states_ibfk_3` FOREIGN KEY (`metadata_id`) REFERENCES `states_meta` (`metadata_id`);

--
-- Begrænsninger for tabel `statistics`
--
ALTER TABLE `statistics` ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `statistics_short_term`
--
ALTER TABLE `statistics_short_term` ADD CONSTRAINT `statistics_short_term_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
