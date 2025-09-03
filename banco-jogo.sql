-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: jogo
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `batalhas`
--

DROP TABLE IF EXISTS `batalhas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batalhas` (
  `idBatalha` int NOT NULL AUTO_INCREMENT,
  `idJogador` int NOT NULL,
  `estado` varchar(20) NOT NULL,
  `turnoAtual` int DEFAULT '0',
  `dataInicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBatalha`),
  KEY `idJogador` (`idJogador`),
  CONSTRAINT `batalhas_ibfk_1` FOREIGN KEY (`idJogador`) REFERENCES `jogadores` (`idJogador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batalhas`
--

LOCK TABLES `batalhas` WRITE;
/*!40000 ALTER TABLE `batalhas` DISABLE KEYS */;
/*!40000 ALTER TABLE `batalhas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eliminados`
--

DROP TABLE IF EXISTS `eliminados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eliminados` (
  `idEliminacao` int NOT NULL AUTO_INCREMENT,
  `idBatalha` int NOT NULL,
  `idPersonagem` int NOT NULL,
  `ordemEliminacao` int NOT NULL,
  PRIMARY KEY (`idEliminacao`),
  KEY `idBatalha` (`idBatalha`),
  KEY `idPersonagem` (`idPersonagem`),
  CONSTRAINT `eliminados_ibfk_1` FOREIGN KEY (`idBatalha`) REFERENCES `batalhas` (`idBatalha`),
  CONSTRAINT `eliminados_ibfk_2` FOREIGN KEY (`idPersonagem`) REFERENCES `personagens` (`idPersonagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eliminados`
--

LOCK TABLES `eliminados` WRITE;
/*!40000 ALTER TABLE `eliminados` DISABLE KEYS */;
/*!40000 ALTER TABLE `eliminados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inimigos`
--

DROP TABLE IF EXISTS `inimigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inimigos` (
  `idInimigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `vidaAtual` double NOT NULL,
  `vidaMaxima` double NOT NULL,
  `manaAtual` double NOT NULL,
  `manaMaxima` double NOT NULL,
  `dano` double NOT NULL,
  PRIMARY KEY (`idInimigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inimigos`
--

LOCK TABLES `inimigos` WRITE;
/*!40000 ALTER TABLE `inimigos` DISABLE KEYS */;
INSERT INTO `inimigos` VALUES (1,'Goblin Selvagem',100,100,50,50,15),(2,'Orc Brutal',150,150,60,60,20),(3,'Dragão Ancião',300,300,100,100,35);
/*!40000 ALTER TABLE `inimigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int NOT NULL AUTO_INCREMENT,
  `idJogador` int NOT NULL,
  `idPersonagem` int NOT NULL,
  `idItem` int NOT NULL,
  `quantidade` int DEFAULT '1',
  `equipado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idInventario`),
  KEY `idJogador` (`idJogador`),
  KEY `idPersonagem` (`idPersonagem`),
  KEY `idItem` (`idItem`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idJogador`) REFERENCES `jogadores` (`idJogador`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`idPersonagem`) REFERENCES `personagens` (`idPersonagem`),
  CONSTRAINT `inventario_ibfk_3` FOREIGN KEY (`idItem`) REFERENCES `loja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores` (
  `idJogador` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `saldoMoedas` int DEFAULT '0',
  PRIMARY KEY (`idJogador`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('arma','armadura','item','habilidade') NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` int NOT NULL,
  `bonusDano` int DEFAULT NULL,
  `bonusVidaMaxima` int DEFAULT NULL,
  `bonusManaMaxima` int DEFAULT NULL,
  `efeito` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
INSERT INTO `loja` VALUES (1,'Espada Simples','arma',NULL,250,10,NULL,NULL,NULL),(2,'Armadura de Couro','armadura',NULL,300,NULL,50,NULL,NULL),(3,'Orbe Místico','item',NULL,200,NULL,NULL,35,NULL),(4,'Cura Menor','habilidade',NULL,400,NULL,NULL,NULL,NULL),(5,'Amplificar Dano','habilidade',NULL,350,NULL,NULL,NULL,NULL),(6,'Bola de Fogo','habilidade',NULL,550,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personagens`
--

DROP TABLE IF EXISTS `personagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personagens` (
  `idPersonagem` int NOT NULL AUTO_INCREMENT,
  `idJogador` int DEFAULT NULL,
  `nomePersonagem` varchar(100) NOT NULL,
  `nivel` int DEFAULT '1',
  `vidaMaxima` double DEFAULT '100',
  `vidaAtual` double DEFAULT '100',
  `manaMaxima` double DEFAULT '50',
  `manaAtual` double DEFAULT '50',
  `dano` double DEFAULT '10',
  `pontosDisponiveis` int DEFAULT '5',
  `foto` longblob,
  `xp` double DEFAULT '0',
  `xpProximoNivel` double DEFAULT '100',
  `idHabilidadeEquipada` int DEFAULT NULL,
  PRIMARY KEY (`idPersonagem`),
  KEY `idJogador` (`idJogador`),
  CONSTRAINT `personagens_ibfk_1` FOREIGN KEY (`idJogador`) REFERENCES `jogadores` (`idJogador`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personagens`
--

LOCK TABLES `personagens` WRITE;
/*!40000 ALTER TABLE `personagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personagens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 23:24:37
