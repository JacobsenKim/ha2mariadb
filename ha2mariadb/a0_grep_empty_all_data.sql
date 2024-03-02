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
--
-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;
--
-- Database: `homeassistant`
--
-- 1)
--
-- ERROR 1452 (23000) at line 1: Cannot add or update a child row: a foreign key constraint fails (`homeassistant`.`events`, CONSTRAINT `events_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `event_data` (`data_id`))
ALTER TABLE `homeassistant`.events DROP FOREIGN KEY events_ibfk_1;
--
-- ERROR 1452 (23000) at line 29536: Cannot add or update a child row: a foreign key constraint fails (`homeassistant`.`events`, CONSTRAINT `events_ibfk_2` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`event_type_id`))
ALTER TABLE `homeassistant`.events DROP FOREIGN KEY events_ibfk_2;
--
-- ERROR 1451 (23000) at line 53: Cannot delete or update a parent row: a foreign key constraint fails (`homeassistant`.`states`, CONSTRAINT `states_ibfk_1` FOREIGN KEY (`old_state_id`) REFERENCES `states` (`state_id`))
ALTER TABLE `homeassistant`.states DROP FOREIGN KEY states_ibfk_1;
--
-- ERROR 1451 (23000) at line 43: Cannot delete or update a parent row: a foreign key constraint fails (`homeassistant`.`states`, CONSTRAINT `states_ibfk_2` FOREIGN KEY (`attributes_id`) REFERENCES `state_attributes` (`attributes_id`))
ALTER TABLE `homeassistant`.states DROP FOREIGN KEY states_ibfk_2;
--
-- ERROR 1452 (23000) at line 1: Cannot add or update a child row: a foreign key constraint fails (`homeassistant`.`states`, CONSTRAINT `states_ibfk_3` FOREIGN KEY (`metadata_id`) REFERENCES `states_meta` (`metadata_id`))
ALTER TABLE `homeassistant`.states DROP FOREIGN KEY states_ibfk_3;
--
-- ERROR 1452 (23000) at line 1: Cannot add or update a child row: a foreign key constraint fails (`homeassistant`.`statistics`, CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE)
ALTER TABLE `homeassistant`.statistics DROP FOREIGN KEY statistics_ibfk_1;

-- ERROR 1452 (23000) at line 5: Cannot add or update a child row: a foreign key constraint fails (`homeassistant`.`statistics_short_term`, CONSTRAINT `statistics_short_term_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE)
ALTER TABLE `homeassistant`.statistics_short_term DROP FOREIGN KEY statistics_short_term_ibfk_1;
--
-- 2)
--
-- Delete all data
--
DELETE FROM `homeassistant`.`event_data`;
DELETE FROM `homeassistant`.`state_attributes`;
DELETE FROM `homeassistant`.`statistics_meta`;
DELETE FROM `homeassistant`.`recorder_runs`;
DELETE FROM `homeassistant`.`schema_changes`;
DELETE FROM `homeassistant`.`statistics_runs`;
DELETE FROM `homeassistant`.`events`;
DELETE FROM `homeassistant`.`statistics`;
DELETE FROM `homeassistant`.`statistics_short_term`;
DELETE FROM `homeassistant`.`states`;
DELETE FROM `homeassistant`.`event_types`;
DELETE FROM `homeassistant`.`states_meta`;
--
-- 3)
--
-- Fix tables and open so we can import.
--
-- # Find all char(0) change to char(36)
ALTER TABLE `homeassistant`.`events` CHANGE `event_type` `event_type` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `event_data` `event_data` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `origin` `origin` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `time_fired` `time_fired` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_id` `context_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_user_id` `context_user_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_parent_id` `context_parent_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `homeassistant`.`states` CHANGE `entity_id` `entity_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `attributes` `attributes` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `last_changed` `last_changed` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `last_updated` `last_updated` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_id` `context_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_user_id` `context_user_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `context_parent_id` `context_parent_id` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `homeassistant`.`statistics` CHANGE `created` `created` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `start` `start` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `last_reset` `last_reset` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `homeassistant`.`statistics_short_term` CHANGE `created` `created` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `start` `start` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL, CHANGE `last_reset` `last_reset` CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
--
-- # `origin_idx` smallint(6) to `origin_idx` int(11)
ALTER TABLE `homeassistant`.`states` CHANGE `origin_idx` `origin_idx` INT(11) NULL DEFAULT NULL;
--
-- 4) -- ERROR 1062 (23000) at line 29: Duplicate entry
--
-- ###############################################################################################
-- Remember to change back to UNIQUE after data import is finish and delete the duplicate entries.
-- ###############################################################################################
--
-- ERROR 1062 (23000) at line 29: Duplicate entry
--
--ALTER TABLE `homeassistant`.`states` DROP INDEX `ix_states_metadata_id_last_updated_ts`, ADD INDEX `ix_states_metadata_id_last_updated_ts` (`metadata_id`, `last_updated_ts`) USING BTREE;
-- # Import the data and delete the duplicate entries then run
-- ALTER TABLE `homeassistant`.`states` DROP INDEX `ix_states_metadata_id_last_updated_ts`, ADD UNIQUE `ix_states_metadata_id_last_updated_ts` (`metadata_id`, `last_updated_ts`) USING BTREE;
--
-- ERROR 1062 (23000) at line 10: Duplicate entry '0-0' for key 'ix_statistics_short_term_statistic_id_start_ts'
--
--ALTER TABLE `homeassistant`.`statistics_short_term` DROP INDEX `ix_statistics_short_term_statistic_id_start_ts`, ADD INDEX `ix_statistics_short_term_statistic_id_start_ts` (`metadata_id`, `start_ts`) USING BTREE;
-- # Import the data and delete the duplicate entries then run
-- ALTER TABLE `homeassistant`.`statistics_short_term` DROP INDEX `ix_statistics_short_term_statistic_id_start_ts`, ADD UNIQUE `ix_statistics_short_term_statistic_id_start_ts` (`metadata_id`, `start_ts`) USING BTREE;
--
-- ERROR 1062 (23000) at line 14187: Duplicate entry '0-0' for key 'ix_statistics_statistic_id_start_ts'
--
--ALTER TABLE `homeassistant`.`statistics` DROP INDEX `ix_statistics_statistic_id_start_ts`, ADD INDEX `ix_statistics_statistic_id_start_ts` (`metadata_id`, `start_ts`) USING BTREE;
-- # Import the data and delete the duplicate entries then run
-- ALTER TABLE `homeassistant`.`statistics` DROP INDEX `ix_statistics_statistic_id_start_ts`, ADD UNIQUE `ix_statistics_statistic_id_start_ts` (`metadata_id`, `start_ts`) USING BTREE;
--
COMMIT;
--
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
