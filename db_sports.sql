-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 04 Février 2026 à 00:35
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `db_sports`
--

-- --------------------------------------------------------

--
-- Structure de la table `ecoles`
--

DROP TABLE IF EXISTS `ecoles`;
CREATE TABLE `ecoles` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `ecoles`
--

INSERT INTO `ecoles` (`id`, `nom`) VALUES
(1, 'École A'),
(2, 'École B'),
(3, 'École C');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE `eleves` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `ecole_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`id`, `nom`, `ecole_id`) VALUES
(252, 'Charlie C.', 1),
(253, 'Alice D.', 2),
(254, 'Noah Q.', 3),
(255, 'Lina U.', 2),
(256, 'Sarah E.', 2),
(257, 'Bob Z.', 3),
(258, 'Charlie P.', 3),
(259, 'Emma H.', 3),
(260, 'Noah F.', 2),
(261, 'Alice G.', 2),
(262, 'Charlie C.', 2),
(263, 'Mila A.', 3),
(264, 'Alice U.', 3),
(265, 'Leo M.', 3),
(266, 'Mila G.', 3),
(267, 'Sarah M.', 1),
(268, 'Lucas W.', 2),
(269, 'Eva G.', 1),
(270, 'Nina C.', 3),
(271, 'Bob I.', 2),
(272, 'Charlie E.', 2),
(273, 'Bob R.', 1),
(274, 'Lina V.', 3),
(275, 'Paul D.', 2),
(276, 'Emma N.', 1),
(277, 'Lucas N.', 2),
(278, 'Alice I.', 2),
(279, 'Charlie K.', 1),
(280, 'Sarah B.', 2),
(281, 'Mila S.', 2),
(282, 'David Y.', 3),
(283, 'Hugo C.', 3),
(284, 'David U.', 1),
(285, 'Leo B.', 3),
(286, 'Paul Y.', 1),
(287, 'Lucas Z.', 3),
(288, 'Emma Y.', 3),
(289, 'Lucas K.', 1),
(290, 'Nina T.', 1),
(291, 'Eva S.', 3),
(292, 'Eva Y.', 1),
(293, 'Mila A.', 2),
(294, 'Mila I.', 1),
(295, 'David B.', 2),
(296, 'Nina I.', 3);

-- --------------------------------------------------------

--
-- Structure de la table `eleves_sports`
--

DROP TABLE IF EXISTS `eleves_sports`;
CREATE TABLE `eleves_sports` (
  `eleve_id` int(11) NOT NULL,
  `sport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `eleves_sports`
--

INSERT INTO `eleves_sports` (`eleve_id`, `sport_id`) VALUES
(253, 1),
(255, 1),
(260, 1),
(276, 1),
(285, 1),
(287, 1),
(288, 1),
(290, 1),
(294, 1),
(276, 2),
(289, 2),
(291, 2),
(252, 3),
(253, 3),
(255, 3),
(259, 3),
(260, 3),
(261, 3),
(277, 3),
(281, 3),
(282, 3),
(288, 3),
(293, 3),
(253, 4),
(273, 4),
(277, 4),
(280, 4),
(281, 4),
(287, 4),
(288, 4),
(290, 4),
(291, 4),
(293, 4),
(252, 5),
(255, 5),
(259, 5),
(260, 5),
(265, 5),
(267, 5),
(271, 5),
(273, 5),
(274, 5),
(279, 5),
(281, 5),
(287, 5),
(289, 5),
(294, 5);

-- --------------------------------------------------------

--
-- Structure de la table `sports`
--

DROP TABLE IF EXISTS `sports`;
CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `sports`
--

INSERT INTO `sports` (`id`, `nom`) VALUES
(1, 'boxe'),
(2, 'judo'),
(3, 'football'),
(4, 'natation'),
(5, 'cyclisme');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ecoles`
--
ALTER TABLE `ecoles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ecole_id` (`ecole_id`);

--
-- Index pour la table `eleves_sports`
--
ALTER TABLE `eleves_sports`
  ADD PRIMARY KEY (`eleve_id`,`sport_id`),
  ADD KEY `sport_id` (`sport_id`);

--
-- Index pour la table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ecoles`
--
ALTER TABLE `ecoles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `eleves`
--
ALTER TABLE `eleves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
--
-- AUTO_INCREMENT pour la table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecoles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `eleves_sports`
--
ALTER TABLE `eleves_sports`
  ADD CONSTRAINT `eleves_sports_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eleves_sports_ibfk_2` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
