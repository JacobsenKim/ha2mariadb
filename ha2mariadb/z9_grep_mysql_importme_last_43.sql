--#
--# Domain: https://github.com/JacobsenKim/ha2mariadb
--# Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
--# Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
--# Homeassistant schema_version = 43
--
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: core-mariadb:3306
-- Generation Time: Apr 17, 2024 at 03:41 PM
-- Server version: 10.11.6-MariaDB
-- PHP Version: 8.1.27
--
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
--
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `homeassistant`
--
-- --------------------------------------------------------
--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `ix_events_context_id_bin` (`context_id_bin`(16)),
  ADD KEY `ix_events_data_id` (`data_id`),
  ADD KEY `ix_events_event_type_id_time_fired_ts` (`event_type_id`,`time_fired_ts`),
  ADD KEY `ix_events_time_fired_ts` (`time_fired_ts`);

--
-- Indexes for table `event_data`
--
ALTER TABLE `event_data`
  ADD PRIMARY KEY (`data_id`),
  ADD KEY `ix_event_data_hash` (`hash`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`event_type_id`),
  ADD UNIQUE KEY `ix_event_types_event_type` (`event_type`);

--
-- Indexes for table `migration_changes`
--
ALTER TABLE `migration_changes`
  ADD PRIMARY KEY (`migration_id`);

--
-- Indexes for table `recorder_runs`
--
ALTER TABLE `recorder_runs`
  ADD PRIMARY KEY (`run_id`),
  ADD KEY `ix_recorder_runs_start_end` (`start`,`end`);

--
-- Indexes for table `schema_changes`
--
ALTER TABLE `schema_changes`
  ADD PRIMARY KEY (`change_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `ix_states_old_state_id` (`old_state_id`),
  ADD KEY `ix_states_attributes_id` (`attributes_id`),
  ADD KEY `ix_states_metadata_id_last_updated_ts` (`metadata_id`,`last_updated_ts`),
  ADD KEY `ix_states_context_id_bin` (`context_id_bin`(16)),
  ADD KEY `ix_states_last_updated_ts` (`last_updated_ts`);

--
-- Indexes for table `states_meta`
--
ALTER TABLE `states_meta`
  ADD PRIMARY KEY (`metadata_id`),
  ADD UNIQUE KEY `ix_states_meta_entity_id` (`entity_id`);

--
-- Indexes for table `state_attributes`
--
ALTER TABLE `state_attributes`
  ADD PRIMARY KEY (`attributes_id`),
  ADD KEY `ix_state_attributes_hash` (`hash`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_statistics_statistic_id_start_ts` (`metadata_id`,`start_ts`),
  ADD KEY `ix_statistics_start_ts` (`start_ts`);

--
-- Indexes for table `statistics_meta`
--
ALTER TABLE `statistics_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_statistics_meta_statistic_id` (`statistic_id`);

--
-- Indexes for table `statistics_runs`
--
ALTER TABLE `statistics_runs`
  ADD PRIMARY KEY (`run_id`),
  ADD KEY `ix_statistics_runs_start` (`start`);

--
-- Indexes for table `statistics_short_term`
--
ALTER TABLE `statistics_short_term`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_statistics_short_term_statistic_id_start_ts` (`metadata_id`,`start_ts`),
  ADD KEY `ix_statistics_short_term_start_ts` (`start_ts`);

--
-- AUTO_INCREMENT for dumped tables
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
-- You can find the numbers in the log. ./output/0000_a_mysql_import.log, and it shows in terminal when you import and press Y after import is finish.
--
-- Numbers in the terminal and log is with +1 so its copy/paste.
-- ##########################################################################################
--
-- Tilføj AUTO_INCREMENT i tabel `events`
-- SELECT MAX(event_id) AS Count FROM events;
ALTER TABLE `events` MODIFY COLUMN `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607772;
--
-- Tilføj AUTO_INCREMENT i tabel `event_data`
-- SELECT MAX(data_id) AS Count FROM event_data;
ALTER TABLE `event_data` MODIFY COLUMN `data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26759;
--
-- Tilføj AUTO_INCREMENT i tabel `event_types`
-- SELECT MAX(event_type_id) AS Count FROM event_types;
ALTER TABLE `event_types` MODIFY COLUMN `event_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- Tilføj AUTO_INCREMENT i tabel `recorder_runs`
-- SELECT MAX(run_id) as Count FROM recorder_runs;
ALTER TABLE `recorder_runs` MODIFY COLUMN `run_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1064;
--
-- Tilføj AUTO_INCREMENT i tabel `schema_changes`
-- SELECT MAX(change_id) AS Count FROM schema_changes;
ALTER TABLE `schema_changes` MODIFY COLUMN `change_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Tilføj AUTO_INCREMENT i tabel `states`
-- SELECT MAX(state_id) AS Count FROM states;
ALTER TABLE `states` MODIFY COLUMN `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88502449;
--
-- Tilføj AUTO_INCREMENT i tabel `states_meta`
-- SELECT MAX(metadata_id) AS Count FROM states_meta;
ALTER TABLE `states_meta` MODIFY COLUMN `metadata_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1166;
--
-- Tilføj AUTO_INCREMENT i tabel `state_attributes`
-- SELECT MAX(attributes_id) AS Count FROM state_attributes;
ALTER TABLE `state_attributes` MODIFY COLUMN `attributes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6585630;
--
-- Tilføj AUTO_INCREMENT i tabel `statistics`
-- SELECT MAX(id) AS Count FROM statistics;
ALTER TABLE `statistics` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=985006;
--
-- Tilføj AUTO_INCREMENT i tabel `statistics_meta`
-- SELECT MAX(id) AS Count FROM statistics_meta;
ALTER TABLE `statistics_meta` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;
--
-- Tilføj AUTO_INCREMENT i tabel `statistics_runs`
-- SELECT MAX(run_id) AS Count FROM statistics_runs;
ALTER TABLE `statistics_runs` MODIFY COLUMN `run_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130054;
--
-- Tilføj AUTO_INCREMENT i tabel `statistics_short_term`
-- SELECT MAX(id) AS Count FROM statistics_short_term;
ALTER TABLE `statistics_short_term` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11760627;

-- #################################################################
-- Do not edit below.
-- #################################################################
--
--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`data_id`) REFERENCES `event_data` (`data_id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`event_type_id`);

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`old_state_id`) REFERENCES `states` (`state_id`),
  ADD CONSTRAINT `states_ibfk_2` FOREIGN KEY (`attributes_id`) REFERENCES `state_attributes` (`attributes_id`),
  ADD CONSTRAINT `states_ibfk_3` FOREIGN KEY (`metadata_id`) REFERENCES `states_meta` (`metadata_id`);

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statistics_short_term`
--
ALTER TABLE `statistics_short_term`
  ADD CONSTRAINT `statistics_short_term_ibfk_1` FOREIGN KEY (`metadata_id`) REFERENCES `statistics_meta` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
