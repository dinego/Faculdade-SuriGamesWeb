-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Maio-2015 às 03:48
-- Versão do servidor: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `surigamesweb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

CREATE TABLE IF NOT EXISTS `tbcliente` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `fone` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `passwd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgenero`
--

CREATE TABLE IF NOT EXISTS `tbgenero` (
  `genero_id` int(11) NOT NULL,
  `descricao` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbjogos`
--

CREATE TABLE IF NOT EXISTS `tbjogos` (
  `id_jogo` int(11) NOT NULL,
  `titulo` varchar(20) DEFAULT NULL,
  `descricao` varchar(30) DEFAULT NULL,
  `ano_lanc` int(11) DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblocacao`
--

CREATE TABLE IF NOT EXISTS `tblocacao` (
  `id_loc` int(11) NOT NULL,
  `emissao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `devolucao` timestamp NULL DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_jogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tbgenero`
--
ALTER TABLE `tbgenero`
  ADD PRIMARY KEY (`genero_id`);

--
-- Indexes for table `tbjogos`
--
ALTER TABLE `tbjogos`
  ADD PRIMARY KEY (`id_jogo`), ADD KEY `fk_genero` (`genero_id`);

--
-- Indexes for table `tblocacao`
--
ALTER TABLE `tblocacao`
  ADD PRIMARY KEY (`id_loc`), ADD KEY `fk_cliente` (`id_user`), ADD KEY `fk_jogo` (`id_jogo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbjogos`
--
ALTER TABLE `tbjogos`
  MODIFY `id_jogo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblocacao`
--
ALTER TABLE `tblocacao`
  MODIFY `id_loc` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbjogos`
--
ALTER TABLE `tbjogos`
ADD CONSTRAINT `fk_genero` FOREIGN KEY (`genero_id`) REFERENCES `tbgenero` (`genero_id`);

--
-- Limitadores para a tabela `tblocacao`
--
ALTER TABLE `tblocacao`
ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_user`) REFERENCES `tbcliente` (`id_user`),
ADD CONSTRAINT `fk_jogo` FOREIGN KEY (`id_jogo`) REFERENCES `tbjogos` (`id_jogo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
