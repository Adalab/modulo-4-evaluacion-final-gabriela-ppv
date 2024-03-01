CREATE DATABASE  IF NOT EXISTS `moviestimburton` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `moviestimburton`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: moviestimburton
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `idMovies` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `year` year NOT NULL,
  `gender` varchar(45) NOT NULL,
  `director` varchar(45) NOT NULL,
  `synopsis` text NOT NULL,
  `image` tinytext NOT NULL,
  PRIMARY KEY (`idMovies`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'El joven manos de tijera',1990,'Fantasía/Drama','Tim Burton','La historia de Edward, un joven que fue creado artificialmente y tiene cuchillas en lugar de manos.','https://cloudfront-us-east-1.images.arcpublishing.com/infobae/KXXZA5IT5VEQJLQO372PX6JH4Y.jpg'),(2,'El extraño mundo de Jack',1993,'Animación/Fantasía','Tim Burton','Jack Skellington, rey de Halloween Town, descubre la Navidad y decide secuestrar a Santa Claus para ocupar su lugar.','https://www.laizquierdadiario.com/IMG/arton211062.jpg'),(3,'Beetlejuice',1988,'Comedia/Fantasía','Tim Burton','Una joven pareja se convierte en fantasma y recurre a Beetlejuice, un exorcista para sacar a los nuevos inquilinos de su casa.','https://larepublica.cronosmedia.glr.pe/original/2022/03/07/6225764efbc504056b2ec62a.jpg'),(4,'El barbero diabólico de la calle Fleet',2007,'Drama/Musical','Tim Burton','Sweeney Todd busca venganza contra aquellos que arruinaron su vida, convirtiéndose en un barbero asesino en la Londres del siglo XIX.','https://www.phenomena-experience.com/galeria/Historico_peliculas/S/sweeney-todd-mini.jpg'),(5,'Big Fish & Begonia',2016,'Animación/Fantasía','Tim Burton ','Una joven diosa transforma en delfín humano a un joven que salvó y lo lleva al mundo místico bajo el océano.','https://c8.alamy.com/compes/a70t8t/big-fish-2003-columbia-film-con-ewan-mcgregor-y-alison-lohman-a70t8t.jpg'),(7,'Batman',1989,'Acción/Crimen','Tim Burton ','Batman lucha contra el crimen en Gotham City mientras se enfrenta al malvado Joker, quien amenaza con sumir la ciudad en el caos.','https://static.posters.cz/image/750/art-photo/batman-1989-i137216.jpg'),(8,'Mars Attacks!',1996,'Ciencia ficción/Comedia','Tim Burton ','La Tierra se ve amenazada por una invasión alienígena violenta y absurda mientras diferentes personajes intentan salvar el planeta.','https://www.flore-maquin.com/wp-content/uploads/Mars_Attack_FLOREMAQUIN.jpg'),(9,'El Cadáver de la Novia',2005,' Animación/Fantasía','Tim Burton ','Un hombre accidentalmente se casa con el cadáver de una novia mientras practica sus votos en el bosque, y es llevado al inframundo donde se encuentra en medio de un triángulo amoroso con su prometida fallecida y una joven viva.','https://images.squarespace-cdn.com/content/v1/56e834ebd51cd466c99178e5/1616437810970-2R3UZ70A17LA86PCMAK7/Cadaverdelanovia_03.jpg'),(10,'Frankenweenie',2012,' Animación/Fantasía','Tim Burton ','Un niño decide traer a su querido perro Sparky de vuelta a la vida después de que muere en un accidente, pero las consecuencias de sus experimentos son impredecibles.','https://xombit.com/files/2012/06/Frankenweenie.jpg'),(11,'Ed Wood',1994,' Biografía/Comedia','Tim Burton ','La historia real del cineasta Ed Wood, conocido por hacer algunas de las peores películas de la historia del cine, pero que se convirtió en una figura de culto.','https://images.mubicdn.net/images/film/3188/cache-9967-1481126194/image-w1280.jpg'),(12,'Alicia en el país de las maravillas',2010,' Aventura/Fantasía','Tim Burton ','Una joven, tras caer por un agujero en el suelo, se encuentra en un mundo fantástico lleno de criaturas extrañas y situaciones absurdas.','https://estaticos-cdn.prensaiberica.es/clip/86278b34-a589-4d28-b908-5d2ab13bc049_source-aspect-ratio_default_0.jpg'),(13,'Vincent',1982,'Animación/Cortometraje/Fantasía','Tim Burton',' Aunque no es una pelicula, es mi Favorito de Tim .Vincent Malloy es un niño de 7 años obsesionado con la oscuridad y la tragedia. Sueña con ser como su ídolo, Vincent Price, y vive en un mundo de fantasía macabra donde él mismo se convierte en un personaje de sus pesadillas.','https://i.pinimg.com/564x/1b/59/ce/1b59ce7baedc7da4558470333298e819.jpg'),(14,'Miss Peregrines Home for Peculiar Children',2016,'Aventura/Fantasía','Tim Burton','Un joven descubre un refugio para niños con habilidades especiales dirigido por Miss Peregrine. Pronto se da cuenta de que tiene un papel crucial en protegerlos de criaturas peligrosas que buscan destruirlos.','https://s1.ppllstatics.com/elcomercio/www/pre2017/multimedia/RC/201609/27/media/cortadas/tim-burton-kKqE-U203158844547TpE-575x323@RC.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `password` tinytext,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pedro@gmail.com','Pedro Prez','avenida pedro aguirre 55,valencia','$2b$10$IZnSx/g9j8rx//YK3YIB0u5UjhOCtvBebf3nYgpM8CmT0gPTqXj.u'),(2,'mariaanstacia@gmail.com','maria Pedraza','avenida pedro aguirre 65,Madrid','$2b$10$rCHcnZFIbR/AhWEgzx/1zuBN.8ED1qQiwDwly06I5boyxKrPu5zX6'),(3,'mjuajcia@gmail.com','maria Labra','calle aguirre 655,Madrid','$2b$10$6yzGz2Xdt5qSHCl2r8Ad8e7uBdzQ6uZYOVMx29PzhHZ69WgwWRIIK'),(4,'heber@gmail.com','heber garcia','calle  de la luna 55, madrid','$2b$10$OJj3MzFqPj38RVY6S6FyIO/UsYYGtlNP77zBbXpTLJKOgnSlWdu5a'),(5,'gabriela@gmail.com','Pedro Prez','avenida pedro aguirre 55,valencia','$2b$10$Po5tXHKcr7vyVc.eIE3C8uZ8KGJ4ZEY7LzkL5N1hxpuwdCZDd3z.6'),(6,'fiona@gmail.com','fiona','calle del poeta 11','$2b$10$rTxuMWSGUwEcrwcsFUh.yu6tbsS51XwxzrV.n5u9vlaURbENSbwRO');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_movies`
--

DROP TABLE IF EXISTS `user_has_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_movies` (
  `User_idUser` int NOT NULL,
  `Movies_idMovies` int NOT NULL,
  PRIMARY KEY (`User_idUser`,`Movies_idMovies`),
  KEY `fk_User_has_Movies_Movies1_idx` (`Movies_idMovies`),
  KEY `fk_User_has_Movies_User_idx` (`User_idUser`),
  CONSTRAINT `fk_User_has_Movies_Movies1` FOREIGN KEY (`Movies_idMovies`) REFERENCES `movies` (`idMovies`),
  CONSTRAINT `fk_User_has_Movies_User` FOREIGN KEY (`User_idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_movies`
--

LOCK TABLES `user_has_movies` WRITE;
/*!40000 ALTER TABLE `user_has_movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01 11:11:54
