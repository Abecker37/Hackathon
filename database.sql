-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `simple-mvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `title`) VALUES
(1, 'Stuff'),
(2, 'Doodads');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE `card` (
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` VARCHAR(15),
  `image` VARCHAR(255),
  `country` VARCHAR(50)
);

INSERT INTO `card` (`title`, `description`, `price`, `image`, `country`) VALUES
("Séjour en Ukraine", 
"Venez prouver votre amour du Kremlin en défilant fièrement dans les rues de Kiev et connaître une mort digne des plus grands pontes de l'ère soviétique.",
"500,00€",
"24fee860-8457-11ed-90a7-556e529f9f89.jpg",
"Ukraine"),
("Road-trip au Bengladesh en période de mousson",
"Soyez quelqu'un d'original en vous noyant sous des milliers de mètres cube d'eau de pluie au coeur de la capitale des catastrophes naturelles.",
"900,00€",
"bengladesh.webp",
"Bengladesh"),
("Balade en 3008 avec Pierre Palmade",
"Vous aimez la vitesse ? Vous l'aimerez d'autant plus sous l'emprise de stupéfiants, accompagné d'un conducteur plein d'humour qui saura vous emmener au (septième) ciel.",
"20 000,00€",
"1200x768_l-acteur-pierre-palmade.png",
"Seine-et-Marne"),
("Une nuit au quartier populaire de San Salvador",
"Vous n'aurez jamais eu autant de choix dans la manière de rendre votre dernier souffle, grâce à la créativité sans limites de jeunes chômeurs, enfants du pays où vivre au-delà de 30 ans est un exploit en soi.",
"900,00€",
"gang1-3457419823.png",
"El Salavdor"),
("Stage en cellule avec la BRAV-M",
"Au plus près de chez vous, au plus près du peuple, vous vous sentirez fier et patriote de voir votre heure venir sous les matraques endiablées de nos chers gardiens de la paix.",
"135,00€",
"BRAV-M.png",
"France"),
("Descente des Chutes du Niagara en kanoë-kayak",
"C'est à faire au moins une fois dans une vie, par chance, c'est cette (dernière) fois que nous vous offrons avec notre habituelle amabilité, le gilet de sauvetage est en revanche à vos frais.",
"2 200,00€",
"68.jpg",
"Canada"),
("Altercation verbale avec Kim Jong-Un",
"Vous détestez l'autorité ? Sautez sur l'occasion grâce à cette offre inédite et allez vomir votre aigreur sur l'un des hommes d'état les plus respectés au monde pour finir torturé, émasculé, écartelé, vous et votre arrogance.",
"5 000 000 KPW",
"coree-nord_1149433_1250x625.jpeg",
"Corée du Nord"),
("Safari en Tesla",
"Laissez la faune des brousses vous tenir compagnie après 400km de paysages époustouflants en pleine nature et savourez votre fin avec la classe d'un self-made man écoresponsable.",
"43 200,00€",
"Tesla-desert-Dubai-e1662040751781.jpg",
"Niger"),
("Saut en parachute avec serviette",
"Votre rêve à vous, c'est de jouer les Inspecteurs Gadget devant tout le monde pour amuser la galerie. Ce rêve devient réalité en vous laissant l'opportunité de ne faire qu'un avec la terre après un vol riche en fous rires. Petit farceur va!",
"250,00",
"serviette.webp",
"Allemagne");
