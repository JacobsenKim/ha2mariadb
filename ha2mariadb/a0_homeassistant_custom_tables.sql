-- # Domain: https://github.com/JacobsenKim/ha2mariadb
-- # Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
-- # Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions

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

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `events`
--
-- How the table is exportet from sqlite3
-- INSERT INTO events (event_id,event_type,event_data,origin,origin_idx,time_fired,context_id,context_user_id,
-- context_parent_id,data_id,time_fired_ts,context_id_bin,context_user_id_bin,context_parent_id_bin,event_type_id) VALUES

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_type` char(0) DEFAULT NULL,
  `event_data` char(0) DEFAULT NULL,
  `origin` char(0) DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
  `time_fired` char(0) DEFAULT NULL,
  `context_id` char(0) DEFAULT NULL,
  `context_user_id` char(0) DEFAULT NULL,
  `context_parent_id` char(0) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  `time_fired_ts` double DEFAULT NULL,
  `context_id_bin` tinyblob DEFAULT NULL,
  `context_user_id_bin` tinyblob DEFAULT NULL,
  `context_parent_id_bin` tinyblob DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `events`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `event_data`
--
-- How the table is exportet from sqlite3
-- INSERT INTO event_data (data_id,hash,shared_data) VALUES

CREATE TABLE `event_data` (
  `data_id` int(11) NOT NULL,
  `hash` int(10) UNSIGNED DEFAULT NULL,
  `shared_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `event_data`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `event_types`
--
-- How the table is exportet from sqlite3
--  INSERT INTO event_types (event_type_id,event_type) VALUES

CREATE TABLE `event_types` (
  `event_type_id` int(11) NOT NULL,
  `event_type` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `event_types`
--
-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `recorder_runs`
--
-- How the table is exportet from sqlite3
-- INSERT INTO recorder_runs (run_id,"start","end",closed_incorrect,created) VALUES

CREATE TABLE `recorder_runs` (
  `run_id` int(11) NOT NULL,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) DEFAULT NULL,
  `closed_incorrect` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `recorder_runs`
--
-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `schema_changes`
--
-- How the table is exportet from sqlite3
-- INSERT INTO schema_changes (change_id,schema_version,changed) VALUES

CREATE TABLE `schema_changes` (
  `change_id` int(11) NOT NULL,
  `schema_version` int(11) DEFAULT NULL,
  `changed` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `schema_changes`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `states`
--
-- How the table is exportet from sqlite3
-- INSERT INTO states (state_id,entity_id,state,"attributes",event_id,last_changed,last_updated,old_state_id,attributes_id,
-- context_id,context_user_id,context_parent_id,origin_idx,last_updated_ts,last_changed_ts,context_id_bin,context_user_id_bin
--,context_parent_id_bin,metadata_id) VALUES

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `entity_id` char(0) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `attributes` char(0) DEFAULT NULL,
  `event_id` smallint(6) DEFAULT NULL,
  `last_changed` char(0) DEFAULT NULL,
  `last_updated` char(0) DEFAULT NULL,
  `old_state_id` int(11) DEFAULT NULL,
  `attributes_id` int(11) DEFAULT NULL,
  `context_id` char(0) DEFAULT NULL,
  `context_user_id` char(0) DEFAULT NULL,
  `context_parent_id` char(0) DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
  `last_updated_ts` double DEFAULT NULL,
  `last_changed_ts` double DEFAULT NULL,
  `context_id_bin` tinyblob DEFAULT NULL,
  `context_user_id_bin` tinyblob DEFAULT NULL,
  `context_parent_id_bin` tinyblob DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



--
-- Data dump for tabellen `states`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `states_meta`
--
-- How the table is exportet from sqlite3
-- INSERT INTO states_meta (metadata_id,entity_id) VALUES

CREATE TABLE `states_meta` (
  `metadata_id` int(11) NOT NULL,
  `entity_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `states_meta`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `state_attributes`
--
-- How the table is exportet from sqlite3
-- INSERT INTO state_attributes (attributes_id,hash,shared_attrs) VALUES

CREATE TABLE `state_attributes` (
  `attributes_id` int(11) NOT NULL,
  `hash` int(10) UNSIGNED DEFAULT NULL,
  `shared_attrs` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `state_attributes`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `statistics`
--
-- How the table is exportet from sqlite3
-- INSERT INTO statistics (id,created,"start",mean,min,max,last_reset,state,sum,metadata_id,created_ts,start_ts,last_reset_ts) VALUES

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `created` char(0) DEFAULT NULL,
  `start` char(0) DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` char(0) DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  `created_ts` double DEFAULT NULL,
  `start_ts` double DEFAULT NULL,
  `last_reset_ts` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `statistics_meta`
--
-- How the table is exportet from sqlite3
-- INSERT INTO statistics_meta (id,statistic_id,"source",unit_of_measurement,has_mean,has_sum,name) VALUES


CREATE TABLE `statistics_meta` (
  `id` int(11) NOT NULL,
  `statistic_id` varchar(255) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `unit_of_measurement` varchar(255) DEFAULT NULL,
  `has_mean` tinyint(1) DEFAULT NULL,
  `has_sum` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `statistics_runs`
--
-- How the table is exportet from sqlite3
-- INSERT INTO statistics_runs (run_id,"start") VALUES

CREATE TABLE `statistics_runs` (
  `run_id` int(11) NOT NULL,
  `start` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data dump for tabellen `statistics_runs`
--
-- --------------------------------------------------------
--
-- Struktur-dump for tabellen `statistics_short_term`
--
-- How the table is exportet from sqlite3
-- INSERT INTO statistics_short_term (id,created,"start",mean,min,max,last_reset,state,sum,metadata_id,created_ts,start_ts,last_reset_ts) VALUES

CREATE TABLE `statistics_short_term` (
  `id` int(11) NOT NULL,
  `created` char(0) DEFAULT NULL,
  `start` char(0) DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` char(0) DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  `created_ts` double DEFAULT NULL,
  `start_ts` double DEFAULT NULL,
  `last_reset_ts` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
