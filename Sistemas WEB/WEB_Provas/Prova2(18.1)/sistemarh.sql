-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2018 at 02:26 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemarh`
--
CREATE DATABASE IF NOT EXISTS `sistemarh` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

/* DROP USER `sistemaweb`@`localhost`; */
/* CREATE USER `sistemaweb`@`localhost` identified by "123456"; */
GRANT ALL PRIVILEGES ON sistemarh.* TO `sistemaweb`@`localhost`;


USE `sistemarh`;

-- --------------------------------------------------------

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cargos`
--

INSERT INTO `cargos` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Automatizador de Testes', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(2, 'Analista de Projetos Ageis', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(3, 'Tecnico de Suporte', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(4, 'Analista Programador Web', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(5, 'Data Scientist', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(6, 'DBA MySQL', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(7, 'Desenvolvedor Python', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(8, 'Professor', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(9, 'Designer UX/UI', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(10, 'Estagiario de Suporte Tecnico', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(11, 'Desenvolvedor iOS', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(12, 'Analista Programador SQL', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(13, 'Desenvolvedor Ruby on Rails', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(14, 'Desenvolvedor Android', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(15, 'Coordenador de Projetos', '2018-07-02 17:23:01', '2018-07-02 17:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE `pessoas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Noel Santiago', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(2, 'Máximo Padrão', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(3, 'Violeta Esteves', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(4, 'Noel Gusmão', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(5, 'Irene Estrada', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(6, 'Júlia Cruz', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(7, 'Taís Rico', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(8, 'Giovane Galhardo', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(9, 'Sabrina Caldeira', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(10, 'Santiago Paes', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(11, 'Thiago Pontes', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(12, 'Melissa Delatorre', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(13, 'Simon Valdez', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(14, 'Rafael Matos', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(15, 'Ivana Molina', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(16, 'Henrique Dias', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(17, 'Adriano da Rosa', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(18, 'Hortência Rangel', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(19, 'Malena Reis', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(20, 'Manuel Queirós', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(21, 'Isaac Soto', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(22, 'Nicole Santacruz', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(23, 'Felipe Perez', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(24, 'Paulo Burgos', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(25, 'Violeta Rivera', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(26, 'Elizabeth Vega', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(27, 'Ariadna Fernandes', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(28, 'Gabriel Duarte', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(29, 'Isadora Ferreira', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(30, 'Fátima Pacheco', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(31, 'José Leal', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(32, 'Ian Feliciano', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(33, 'Amélia Gusmão', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(34, 'Alexa Abreu', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(35, 'Camilo Neves', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(36, 'Joaquin das Neves', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(37, 'Emiliano Soares', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(38, 'Camila Tamoio', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(39, 'Luana Branco', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(40, 'Suzana Camacho', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(41, 'Sofia Romero', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(42, 'Ariadna Ferraz', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(43, 'Samanta Galhardo', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(44, 'Salomé Soares', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(45, 'Fátima Cortês', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(46, 'Máximo Rodrigues', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(47, 'Pedro Lutero', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(48, 'Everton Burgos', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(49, 'Pablo Serra', '2018-07-02 17:23:01', '2018-07-02 17:23:01'),
(50, 'Camilo Dominato', '2018-07-02 17:23:01', '2018-07-02 17:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
CREATE TABLE `registros` (
  `id` int(10) UNSIGNED NOT NULL,
  `pessoa_id` int(10) UNSIGNED NOT NULL,
  `cargo_id` int(10) UNSIGNED NOT NULL,
  `salario` decimal(8,2) NOT NULL DEFAULT '0.00',
  `horas` tinyint(4) NOT NULL DEFAULT '0',
  `turno` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registros_pessoa_id_foreign` (`pessoa_id`),
  ADD KEY `registros_cargo_id_foreign` (`cargo_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `registros_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `registros_pessoa_id_foreign` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
