-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Mar-2017 às 02:17
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selmabordados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `pago` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2017_03_25_174900_create_tipos_produtos_table', 1),
(3, '2017_03_25_192051_create_produtos_table', 1),
(4, '2017_03_25_194205_create_tipos_usuarios_table', 1),
(5, '2017_03_25_195146_create_usuarios_table', 1),
(6, '2017_03_25_230017_create_compras_table', 1),
(7, '2017_03_25_230118_create_transacoes_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `caminho_imagem` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_produto_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`, `caminho_imagem`, `tipo_produto_id`, `created_at`, `updated_at`) VALUES
(1, 'Toalha de rosto com nome', '45.00', 'public/imagens/produtos/VE8UgnVwJJghhtGtI1PaRXDC3KUbX2sbPPS69Qwt.jpeg', 2, '2017-03-27 04:01:56', '2017-03-27 04:34:14'),
(2, 'Bolsinha de toalha com nome', '45.00', 'public/imagens/produtos/DxaJHr7MVSv1GLm9aQGO0l35sdlSM0gspksApIB9.jpeg', 9, '2017-03-27 04:32:11', '2017-03-27 04:32:11'),
(3, 'Marcadores de livro', '10.00', 'public/imagens/produtos/5P9yl7xvOhixqLqTdyotiQTeFxKLqrNqF5Y7bNNg.jpeg', 7, '2017-03-27 04:32:48', '2017-03-27 04:32:48'),
(4, 'Toalha de banho com nome', '55.00', 'public/imagens/produtos/Az5CnUDGTDJjvBhUEQXd6dAkxV830VTZXfeV94Uz.jpeg', 1, '2017-03-27 04:33:32', '2017-03-27 04:33:32'),
(5, 'Fralda de boca bailarina', '12.00', 'public/imagens/produtos/nzzfGB8jXQxjRU5ogHtDa0P2ZIU5vFMtY4FiUf2P.jpeg', 5, '2017-03-27 04:35:16', '2017-03-27 04:35:31'),
(6, 'Fralda de boca Minnie', '12.00', 'public/imagens/produtos/q8VWJKmrxKIwnuuXWmjSPuI9kQMAqZNoS5H9dRfP.jpeg', 5, '2017-03-27 04:37:00', '2017-03-27 04:37:00'),
(7, 'Fralda de boca abelha', '12.00', 'public/imagens/produtos/cDdPFrHbTLwkR5Pm6C34MzwygKdIA2mTZKfkoCBY.jpeg', 5, '2017-03-27 04:37:25', '2017-03-27 04:37:25'),
(8, 'Toalha de fralda com nome', '20.00', 'public/imagens/produtos/os5hbYhOtiV0qhSD9uAZKpYKtwjzTBbfNznGpRtM.jpeg', 10, '2017-03-27 04:41:52', '2017-03-27 04:41:52'),
(9, 'Toalha de lavabo Academia', '25.00', 'public/imagens/produtos/p8otE3KJv029pXm9UKeivVuIfUXYE5r5jpaJOChx.jpeg', 8, '2017-03-27 04:42:27', '2017-03-27 04:42:27'),
(10, 'Toalha de lavabo Academia', '25.00', 'public/imagens/produtos/z2jPnTQSEdYZin2TW1RtOhiLFiwG14B7ROZ7NyAp.jpeg', 8, '2017-03-27 04:42:52', '2017-03-27 04:42:52'),
(11, 'Toalha lavabo batizado', '25.00', 'public/imagens/produtos/jNY925nvGFl0dcuB4tptz9jprNHq5C3figoFYm7l.jpeg', 8, '2017-03-27 04:44:14', '2017-03-27 04:44:14'),
(12, 'Toalha lavabo Vovó Coruja', '20.00', 'public/imagens/produtos/LOfsOeaCNkjIv1syz4MmifXw0Wn6f7F8BS3d5bot.jpeg', 8, '2017-03-27 04:46:17', '2017-03-27 04:46:17'),
(13, 'Tolha de rosto Harry Potter com nome', '45.00', 'public/imagens/produtos/1i7QbXVHqArMx7WkQfgSqj99CilRtCJ70xH7b5a5.jpeg', 2, '2017-03-27 04:46:58', '2017-03-27 04:46:58'),
(14, 'Toalha de rosto', '40.00', 'public/imagens/produtos/RI4Ip9qPqdLDfRnNeyO0h6PbB3d9x4XmKJEoUN0I.jpeg', 2, '2017-03-27 04:47:25', '2017-03-27 04:47:25'),
(15, 'Toalha de rosto', '40.00', 'public/imagens/produtos/KJN3cz1SdKsaYUt4nrRzfFhAfjcYE21XuUxKLZ8r.jpeg', 2, '2017-03-27 04:47:54', '2017-03-27 04:47:54'),
(16, 'Toalha de rosto', '40.00', 'public/imagens/produtos/pv30lk9wxcEElPJaWavUlt9tfDvDiOP3aLbNirUQ.jpeg', 2, '2017-03-27 04:48:19', '2017-03-27 04:48:19'),
(17, 'Toalha lavabo com nome', '25.00', 'public/imagens/produtos/fqKNmUoOMNF8M6xmtpcDtASxbS1dZwO8KhaPGb2d.jpeg', 8, '2017-03-27 04:49:00', '2017-03-27 04:49:00'),
(18, 'Toalha lavabo com nome', '25.00', 'public/imagens/produtos/25w6rRqeqeE1hEg8sDPpOIbcFsW0n9OLlnspsLXm.jpeg', 8, '2017-03-27 04:49:30', '2017-03-27 04:49:30'),
(19, 'Toalha lavabo com nome', '25.00', 'public/imagens/produtos/M1mA4Hei8eyRYyFnL3dXXFDbjLvbl1w98Fz2fh8H.jpeg', 8, '2017-03-27 04:52:23', '2017-03-27 04:52:23'),
(20, 'Toalha lavabo batizado', '25.00', 'public/imagens/produtos/ibUn1x6lgIl9EaNpebds6SUsHd7trgZa7Cu4jJwb.jpeg', 8, '2017-03-27 04:52:50', '2017-03-27 04:52:50'),
(21, 'Batemão', '15.00', 'public/imagens/produtos/0KCrcalBkLHctvpKMuVaMtBctN0DuJbsnsHUCNbh.jpeg', 6, '2017-03-27 05:01:42', '2017-03-27 05:01:42'),
(22, 'Batemão', '15.00', 'public/imagens/produtos/ZeciyZs4bvIXYi7HVQByZBN44SQ3rTxlGfuyuLQR.jpeg', 6, '2017-03-27 05:02:09', '2017-03-27 05:02:09'),
(23, 'Marcador de livro Grifinória', '10.00', 'public/imagens/produtos/OhFnLU2GYL19XGOP7aYcfpu4yVXoGNvlJiaw7caC.jpeg', 7, '2017-03-27 05:02:50', '2017-03-27 05:02:50'),
(24, 'Marcador de livro Nossa Senhora', '10.00', 'public/imagens/produtos/gieeFcIMYNvlteB18tFAl0QdgHLLHumt64HpGoNo.jpeg', 7, '2017-03-27 05:03:25', '2017-03-27 05:03:25'),
(25, 'Pano de prato', '20.00', 'public/imagens/produtos/Dr3JnEbJmx3EIyIaTtSa9o55L41jmdg0iPkTH7Xf.jpeg', 3, '2017-03-27 05:04:01', '2017-03-27 05:04:01'),
(26, 'Semaninha - Panos de prato', '130.00', 'public/imagens/produtos/bSfkSq1aUOT7QzmbTT3fD11qCwKYu2I31cZlFffr.jpeg', 3, '2017-03-27 05:04:39', '2017-03-27 05:04:39'),
(27, 'Toalha de rosto com nome', '55.00', 'public/imagens/produtos/wBSf5NmTk0Sevt0Xyk5cMZbAuvoGh6AvpJSql9UC.jpeg', 1, '2017-03-27 05:05:20', '2017-03-27 05:05:20'),
(28, 'Toalha de fralda', '17.00', 'public/imagens/produtos/8HiVIT2gSNZmCpIclDW8Le78xTLKBrrWeyfVtCa1.jpeg', 10, '2017-03-27 05:05:57', '2017-03-27 05:05:57'),
(29, 'Tolha de rosto Harry Potter com nome', '35.00', 'public/imagens/produtos/tmJwasGYqlIif3azppQV8jNkVZp5pezqjWsa01ns.jpeg', 2, '2017-03-27 05:07:02', '2017-03-27 05:07:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_produtos`
--

CREATE TABLE `tipos_produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipos_produtos`
--

INSERT INTO `tipos_produtos` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Toalha de banho', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(2, 'Toalha de rosto', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(3, 'Pano de prato', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(4, 'Caminho de mesa', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(5, 'Fralda de boca', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(6, 'Batemão', '2017-03-27 04:15:31', '2017-03-27 04:15:31'),
(7, 'Marcador de livros', '2017-03-27 04:16:39', '2017-03-27 04:33:58'),
(8, 'Toalha lavabo', '2017-03-27 04:30:02', '2017-03-27 04:30:02'),
(9, 'Bolsinha Toalha', '2017-03-27 04:31:42', '2017-03-27 04:31:42'),
(10, 'Tolha de fralda', '2017-03-27 04:41:20', '2017-03-27 04:41:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2017-03-27 03:30:24', '2017-03-27 03:30:24'),
(2, 'Cliente', '2017-03-27 03:30:24', '2017-03-27 03:30:24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(10) UNSIGNED NOT NULL,
  `compra_id` int(10) UNSIGNED NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `cor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bordado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_usuario_id` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `endereco` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo_usuario_id`, `endereco`, `telefone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'admin@selmabordados.com', '$2y$10$i3ZZag4WhqwHCz2rTpUjz.OhxIVOkJrWOG9ih1X.PSD4zdbWmL5v.', 1, 'Seu computador', NULL, NULL, '2017-03-27 03:30:25', '2017-03-27 03:30:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_usuario_id_foreign` (`usuario_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_tipo_produto_id_foreign` (`tipo_produto_id`);

--
-- Indexes for table `tipos_produtos`
--
ALTER TABLE `tipos_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transacoes_compra_id_foreign` (`compra_id`),
  ADD KEY `transacoes_produto_id_foreign` (`produto_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_email_unique` (`email`),
  ADD KEY `usuarios_tipo_usuario_id_foreign` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tipos_produtos`
--
ALTER TABLE `tipos_produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_tipo_produto_id_foreign` FOREIGN KEY (`tipo_produto_id`) REFERENCES `tipos_produtos` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transacoes_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_tipo_usuario_id_foreign` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipos_usuarios` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
