-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 10-Maio-2017 às 08:07
-- Versão do servidor: 5.5.49-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `livraria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `idAutor` int(11) NOT NULL AUTO_INCREMENT,
  `nomeAutor` varchar(100) NOT NULL,
  `nmCitacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`idAutor`, `nomeAutor`, `nmCitacao`) VALUES
(2, 'Victor Hugo L. Lopes', 'LOPES, V.H.L.'),
(3, 'Adenosina Tri Fosfato', 'FOSFATO, A.T.'),
(4, 'Gabriela Costa Menezes Lopes', 'LOPES, G.C.M.'),
(5, 'Daniel Adorno Gomes', 'GOMES, D.A.'),
(6, 'Thomas', 'THOMAS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor_has_publicacao`
--

CREATE TABLE IF NOT EXISTS `autor_has_publicacao` (
  `autor_idAutor` int(11) NOT NULL,
  `publicacao_idPublicacao` int(11) NOT NULL,
  PRIMARY KEY (`autor_idAutor`,`publicacao_idPublicacao`),
  KEY `fk_autor_has_publicacao_publicacao1_idx` (`publicacao_idPublicacao`),
  KEY `fk_autor_has_publicacao_autor_idx` (`autor_idAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `autor_has_publicacao`
--

INSERT INTO `autor_has_publicacao` (`autor_idAutor`, `publicacao_idPublicacao`) VALUES
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(2, 3),
(3, 3),
(2, 5),
(5, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao`
--

CREATE TABLE IF NOT EXISTS `publicacao` (
  `idPublicacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `anoPublicacao` year(4) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`idPublicacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `publicacao`
--

INSERT INTO `publicacao` (`idPublicacao`, `titulo`, `cidade`, `anoPublicacao`, `isbn`, `data`) VALUES
(2, 'Programando Aplicações para Web com Java', 'São Paulo', 2016, 11111222, '2016-12-06'),
(3, 'Testes de Software', 'testelândia', 2010, 111, '2016-12-13'),
(5, 'O Livro de Ouro do Java', 'Jataí', 2010, 222, '2016-12-20'),
(6, 'Web Services SOAP em Java', 'São Paulo', 2016, 3334, '0000-00-00');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `autor_has_publicacao`
--
ALTER TABLE `autor_has_publicacao`
  ADD CONSTRAINT `fk_autor_has_publicacao_autor` FOREIGN KEY (`autor_idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_autor_has_publicacao_publicacao1` FOREIGN KEY (`publicacao_idPublicacao`) REFERENCES `publicacao` (`idPublicacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
