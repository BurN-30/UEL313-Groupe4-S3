
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Création de l'utilisateur 'watson' avec le mot de passe 'watson'
CREATE USER IF NOT EXISTS 'watson'@'localhost' IDENTIFIED BY 'watson';

-- Attribution de tous les privilèges sur la base 'watson' à l'utilisateur 'watson'
INSERT INTO mysql.db (Host, Db, User, Select_priv, Insert_priv, Update_priv, Delete_priv, Create_priv, Drop_priv, Index_priv, Alter_priv)
VALUES ('localhost', 'watson', 'watson', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y')
ON DUPLICATE KEY UPDATE
Select_priv='Y', Insert_priv='Y', Update_priv='Y', Delete_priv='Y', Create_priv='Y', Drop_priv='Y', Index_priv='Y', Alter_priv='Y';

-- Application des changements de privilèges
FLUSH PRIVILEGES;


--
-- Base de données : `watson`
--
CREATE DATABASE IF NOT EXISTS `watson` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `watson`;

-- --------------------------------------------------------

--
-- Structure de la table `tl_liens`
--

CREATE TABLE `tl_liens` (
  `lien_id` int(11) NOT NULL,
  `lien_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lien_titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lien_desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tl_liens`
--

INSERT INTO `tl_liens` (`lien_id`, `lien_url`, `lien_titre`, `lien_desc`, `user_id`) VALUES
(1, 'https://cvtic.unilim.fr/', 'Campus Virtuel TIC', 'Site internet du CvTIC.', 1),
(2, 'https://duckduckgo.com/', 'Duck Duck Go', 'Le moteur de recherche qui ne trace pas ses utilisateurs.', 1),
(3, 'https://framasoft.org/', 'Framasoft', 'Un réseau dédié à la promotion du « libre » en général et du logiciel libre en particulier.', 1),
(4, 'https://x.com/home', 'Twitter', 'A website which public refused the new name.', 1),
(5, 'https://www.instagram.com/', 'Instagram', 'Poster des images, c\'est bien, quand les gens l\'a vois, c\'est moins bien. Ou mieux ?', 1),
(6, 'https://www.microsoft.com/fr-fr', 'Microsoft', 'C\'est ici qu\'on paye la suite office à partir d\'un prix exorbitant !', 1),
(7, 'https://www.php.net/', 'Php', 'La documentation de Php, utile.', 1),
(8, 'https://react.dev/learn', 'React', 'La documentation de React, utile.', 1),
(9, 'https://angular.dev/overview', 'Angular', 'La documentation d\'Angular, utile.', 1),
(10, 'https://learn.microsoft.com/fr-fr/cpp/cpp/?view=msvc-170', 'C++', 'la documentation de C++, utile.', 1),
(11, 'https://discord.com/', 'Discord', 'Fabuleux logiciel de communication utilisable par tous.', 1),
(12, 'https://github.com/', 'Github', 'C\'est un beau logiciel', 1),
(13, 'https://www.twitch.tv//', 'Twitch', 'Twitch est un service de diffusion vidéo direct par flux ou streaming et une plateforme de vidéo à la demande lancés en juin 2011 et exploités par la société américaine Twitch Interactive, filiale du groupe Amazon.', 1),
(14, 'https://www.netflix.com/fr/', 'Netflix', 'Site de streaming de séries payant.', 1),
(15, 'https://www.amazon.fr/', 'Amazon', 'Boutique en ligne.', 1),
(16, 'https://www.cdiscount.com/', 'CDisount', 'Boutique en ligne.', 1),
(17, 'https://www.wish.com/', 'Wish', 'Boutique en ligne.', 1),
(18, 'https://fr.wikipedia.org/wiki/Sherlock_Holmes', 'Sherlock Holmes', 'Sherlock Holmes est un personnage de fiction britannique créé par Sir Arthur Conan Doyle dans le roman policier Une étude en rouge en 1887.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags`
--

CREATE TABLE `tl_tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tl_tags`
--

INSERT INTO `tl_tags` (`tag_id`, `tag_name`) VALUES
(1, 'fac'),
(2, 'vieprivee'),
(3, 'opensource'),
(4, 'apprendre');

-- --------------------------------------------------------

--
-- Structure de la table `tl_tags_liens`
--

CREATE TABLE `tl_tags_liens` (
  `tag_id` int(11) NOT NULL,
  `lien_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tl_tags_liens`
--

INSERT INTO `tl_tags_liens` (`tag_id`, `lien_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tl_users`
--

CREATE TABLE `tl_users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `usr_password` varchar(88) COLLATE utf8_unicode_ci NOT NULL,
  `usr_salt` varchar(23) COLLATE utf8_unicode_ci NOT NULL,
  `usr_role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ROLE_ADMIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `tl_users`
--

INSERT INTO `tl_users` (`usr_id`, `usr_name`, `usr_password`, `usr_salt`, `usr_role`) VALUES
(1, 'admin', 'LsJKppRTEPz4uKrkhScOE6HBSvHuaIcFbAX9FWC7h/f5HffX4TBcFt7p8M0hqvGzFXL+JV8TzEYePoimaosfMQ==', '>=28!7NLw!S37zLjs7Uu[nC', 'ROLE_ADMIN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tl_liens`
--
ALTER TABLE `tl_liens`
  ADD PRIMARY KEY (`lien_id`);

--
-- Index pour la table `tl_tags`
--
ALTER TABLE `tl_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Index pour la table `tl_users`
--
ALTER TABLE `tl_users`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tl_liens`
--
ALTER TABLE `tl_liens`
  MODIFY `lien_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `tl_tags`
--
ALTER TABLE `tl_tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tl_users`
--
ALTER TABLE `tl_users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

