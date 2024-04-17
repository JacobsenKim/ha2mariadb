-- # Domain: https://github.com/JacobsenKim/ha2mariadb
-- # Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
-- # Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
-- Homeassistant schema_version = 42

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

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_type` char(0) DEFAULT NULL,
  `event_data` char(0) DEFAULT NULL,
  `origin` char(0) DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
  `time_fired` char(0) DEFAULT NULL,
  `time_fired_ts` double DEFAULT NULL,
  `context_id` char(0) DEFAULT NULL,
  `context_user_id` char(0) DEFAULT NULL,
  `context_parent_id` char(0) DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
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

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `entity_id` char(0) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `attributes` char(0) DEFAULT NULL,
  `event_id` smallint(6) DEFAULT NULL,
  `last_changed` char(0) DEFAULT NULL,
  `last_changed_ts` double DEFAULT NULL,
  `last_updated` char(0) DEFAULT NULL,
  `last_updated_ts` double DEFAULT NULL,
  `old_state_id` int(11) DEFAULT NULL,
  `attributes_id` int(11) DEFAULT NULL,
  `context_id` char(0) DEFAULT NULL,
  `context_user_id` char(0) DEFAULT NULL,
  `context_parent_id` char(0) DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
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

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `created` char(0) DEFAULT NULL,
  `created_ts` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  `start` char(0) DEFAULT NULL,
  `start_ts` double DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` char(0) DEFAULT NULL,
  `last_reset_ts` double DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `statistics_meta`
--

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

CREATE TABLE `statistics_short_term` (
  `id` int(11) NOT NULL,
  `created` char(0) DEFAULT NULL,
  `created_ts` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  `start` char(0) DEFAULT NULL,
  `start_ts` double DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` char(0) DEFAULT NULL,
  `last_reset_ts` double DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
