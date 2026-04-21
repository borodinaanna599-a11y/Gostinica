-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: Gostinica
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Gostinica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Gostinica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Gostinica`;

--
-- Table structure for table `Bronirovanija`
--

DROP TABLE IF EXISTS `Bronirovanija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bronirovanija` (
  `id_bronirovanija` int NOT NULL AUTO_INCREMENT,
  `id_klienta` int NOT NULL,
  `id_nomera` int NOT NULL,
  `id_polzovatelja` int NOT NULL,
  `дата_заезда` date NOT NULL,
  `дата_выезда` date NOT NULL,
  `дата_создания` datetime DEFAULT CURRENT_TIMESTAMP,
  `статус` enum('Подтверждена','Отменена','Завершена') DEFAULT 'Подтверждена',
  `сумма_предоплаты` decimal(10,2) DEFAULT '0.00',
  `комментарий` text,
  PRIMARY KEY (`id_bronirovanija`),
  KEY `id_klienta` (`id_klienta`),
  KEY `id_nomera` (`id_nomera`),
  KEY `id_polzovatelja` (`id_polzovatelja`),
  CONSTRAINT `bronirovanija_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `Klienty` (`id_klienta`) ON DELETE CASCADE,
  CONSTRAINT `bronirovanija_ibfk_2` FOREIGN KEY (`id_nomera`) REFERENCES `Nomera` (`id_nomera`) ON DELETE CASCADE,
  CONSTRAINT `bronirovanija_ibfk_3` FOREIGN KEY (`id_polzovatelja`) REFERENCES `Polzovateli` (`id_polzovatelja`) ON DELETE CASCADE,
  CONSTRAINT `bronirovanija_chk_1` CHECK ((`дата_выезда` > `дата_заезда`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bronirovanija`
--

LOCK TABLES `Bronirovanija` WRITE;
/*!40000 ALTER TABLE `Bronirovanija` DISABLE KEYS */;
INSERT INTO `Bronirovanija` VALUES (1,1,4,2,'2024-06-01','2024-06-05','2026-04-17 09:28:13','Завершена',3500.00,'Заселение после 14:00'),(2,2,3,2,'2024-06-10','2024-06-15','2026-04-17 09:28:13','Завершена',7000.00,'Нужна детская кроватка'),(3,3,5,2,'2024-05-20','2024-05-25','2026-04-17 09:28:13','Завершена',14000.00,NULL),(4,4,2,1,'2024-06-15','2024-06-18','2026-04-17 09:28:13','Завершена',2500.00,'Номер с видом на парк'),(5,5,9,2,'2024-05-01','2024-05-10','2026-04-17 09:28:13','Отменена',0.00,'Клиент отменил'),(6,6,10,2,'2024-07-01','2024-07-07','2026-04-17 09:28:13','Завершена',12000.00,'Заезд утром'),(7,1,1,1,'2026-04-22','2026-04-24','2026-04-21 15:50:34','Подтверждена',0.00,NULL),(8,1,2,1,'2026-04-22','2026-04-24','2026-04-21 16:01:51','Отменена',15.00,NULL);
/*!40000 ALTER TABLE `Bronirovanija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dopolnitelnye_uslugi`
--

DROP TABLE IF EXISTS `Dopolnitelnye_uslugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dopolnitelnye_uslugi` (
  `id_uslugi` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(100) NOT NULL,
  `цена` decimal(10,2) NOT NULL,
  `единица_измерения` varchar(20) DEFAULT 'шт',
  `описание` text,
  PRIMARY KEY (`id_uslugi`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dopolnitelnye_uslugi`
--

LOCK TABLES `Dopolnitelnye_uslugi` WRITE;
/*!40000 ALTER TABLE `Dopolnitelnye_uslugi` DISABLE KEYS */;
INSERT INTO `Dopolnitelnye_uslugi` VALUES (1,'Мини-бар',500.00,'сутки','Напитки и снеки в номере'),(2,'Химчистка',800.00,'шт','Химчистка одежды'),(3,'Парковка',300.00,'сутки','Охраняемая парковка'),(4,'Завтрак',400.00,'шт','Шведский стол'),(5,'Трансфер',1500.00,'шт','Такси до аэропорта'),(6,'Экскурсия',2000.00,'шт','Обзорная экскурсия по городу'),(7,'Спа-услуги',2500.00,'сеанс','Массаж, сауна'),(8,'Конференц-зал',5000.00,'час','Аренда зала для переговоров');
/*!40000 ALTER TABLE `Dopolnitelnye_uslugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kategorii_nomerov`
--

DROP TABLE IF EXISTS `Kategorii_nomerov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Kategorii_nomerov` (
  `id_kategorii` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(50) NOT NULL,
  `базовая_цена` decimal(10,2) NOT NULL,
  `описание` text,
  PRIMARY KEY (`id_kategorii`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kategorii_nomerov`
--

LOCK TABLES `Kategorii_nomerov` WRITE;
/*!40000 ALTER TABLE `Kategorii_nomerov` DISABLE KEYS */;
INSERT INTO `Kategorii_nomerov` VALUES (1,'Эконом',2500.00,'Одноместный номер, душ, ТВ'),(2,'Стандарт',3500.00,'Двухместный номер, ТВ, сейф, кондиционер'),(3,'Люкс',7000.00,'Двухкомнатный номер, джакузи, мини-бар'),(4,'Сьют',12000.00,'Трехкомнатный номер, кухня, гостиная');
/*!40000 ALTER TABLE `Kategorii_nomerov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Klienty`
--

DROP TABLE IF EXISTS `Klienty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Klienty` (
  `id_klienta` int NOT NULL AUTO_INCREMENT,
  `фамилия` varchar(50) NOT NULL,
  `имя` varchar(50) NOT NULL,
  `отчество` varchar(50) DEFAULT NULL,
  `серия_паспорта` varchar(10) DEFAULT NULL,
  `номер_паспорта` varchar(20) DEFAULT NULL,
  `дата_рождения` date DEFAULT NULL,
  `телефон` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `дата_первого_визита` date DEFAULT (curdate()),
  PRIMARY KEY (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Klienty`
--

LOCK TABLES `Klienty` WRITE;
/*!40000 ALTER TABLE `Klienty` DISABLE KEYS */;
INSERT INTO `Klienty` VALUES (1,'Иванов','Иван','Иванович','4510','123456','1985-05-15','+79001234567','ivanov@mail.ru','2026-04-17'),(2,'Петрова','Елена','Сергеевна','4520','654321','1990-08-22','+79007654321','petrova@mail.ru','2026-04-17'),(3,'Сидоров','Алексей','Владимирович','4530','111222','1978-11-03','+79001112233','sidorov@mail.ru','2026-04-17'),(4,'Кузнецова','Мария','Андреевна','4540','333444','1995-02-10','+79004445566','kuznetsova@mail.ru','2026-04-17'),(5,'Смирнов','Дмитрий','Алексеевич','4550','555666','1982-07-19','+79007778899','smirnov@mail.ru','2026-04-17'),(6,'Васильева','Анна','Петровна','4560','777888','1988-12-01','+79009998877','vasilyeva@mail.ru','2026-04-17');
/*!40000 ALTER TABLE `Klienty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nomera`
--

DROP TABLE IF EXISTS `Nomera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nomera` (
  `id_nomera` int NOT NULL AUTO_INCREMENT,
  `id_zdanija` int NOT NULL,
  `номер_комнаты` varchar(10) NOT NULL,
  `этаж` int NOT NULL,
  `id_kategorii` int NOT NULL,
  `статус` enum('Свободен','Занят','Забронирован','На_уборке') DEFAULT 'Свободен',
  `вместимость` int NOT NULL,
  PRIMARY KEY (`id_nomera`),
  KEY `id_zdanija` (`id_zdanija`),
  KEY `id_kategorii` (`id_kategorii`),
  CONSTRAINT `nomera_ibfk_1` FOREIGN KEY (`id_zdanija`) REFERENCES `Zdanija` (`id_zdanija`) ON DELETE CASCADE,
  CONSTRAINT `nomera_ibfk_2` FOREIGN KEY (`id_kategorii`) REFERENCES `Kategorii_nomerov` (`id_kategorii`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nomera`
--

LOCK TABLES `Nomera` WRITE;
/*!40000 ALTER TABLE `Nomera` DISABLE KEYS */;
INSERT INTO `Nomera` VALUES (1,1,'101',1,1,'Забронирован',1),(2,1,'102',1,1,'Свободен',1),(3,1,'201',2,2,'Свободен',2),(4,1,'202',2,2,'Свободен',2),(5,1,'301',3,3,'Свободен',2),(6,1,'302',3,3,'Свободен',2),(7,2,'401',1,1,'Свободен',1),(8,2,'402',1,2,'Свободен',2),(9,2,'501',2,3,'Свободен',2),(10,3,'502',1,4,'Свободен',4);
/*!40000 ALTER TABLE `Nomera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Okazannye_uslugi`
--

DROP TABLE IF EXISTS `Okazannye_uslugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Okazannye_uslugi` (
  `id_okazannoj_uslugi` int NOT NULL AUTO_INCREMENT,
  `id_prozhivanija` int NOT NULL,
  `id_uslugi` int NOT NULL,
  `количество` int DEFAULT '1',
  `дата_оказания` datetime DEFAULT CURRENT_TIMESTAMP,
  `стоимость` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_okazannoj_uslugi`),
  KEY `id_prozhivanija` (`id_prozhivanija`),
  KEY `id_uslugi` (`id_uslugi`),
  CONSTRAINT `okazannye_uslugi_ibfk_1` FOREIGN KEY (`id_prozhivanija`) REFERENCES `Prozhivanija` (`id_prozhivanija`) ON DELETE CASCADE,
  CONSTRAINT `okazannye_uslugi_ibfk_2` FOREIGN KEY (`id_uslugi`) REFERENCES `Dopolnitelnye_uslugi` (`id_uslugi`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Okazannye_uslugi`
--

LOCK TABLES `Okazannye_uslugi` WRITE;
/*!40000 ALTER TABLE `Okazannye_uslugi` DISABLE KEYS */;
INSERT INTO `Okazannye_uslugi` VALUES (1,1,4,5,'2024-05-21 08:30:00',2000.00),(2,1,3,5,'2024-05-20 18:00:00',1500.00),(3,1,7,1,'2024-05-22 15:00:00',2500.00),(4,2,4,4,'2024-06-02 08:00:00',1600.00),(5,2,1,4,'2024-06-02 20:00:00',2000.00),(6,3,4,5,'2024-06-11 08:30:00',2000.00),(7,3,3,5,'2024-06-10 18:00:00',1500.00),(8,4,4,3,'2024-06-16 08:00:00',1200.00),(9,5,4,7,'2024-07-02 08:30:00',2800.00),(10,5,5,2,'2024-07-01 10:00:00',3000.00),(11,5,6,1,'2024-07-03 14:00:00',2000.00);
/*!40000 ALTER TABLE `Okazannye_uslugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Oplaty`
--

DROP TABLE IF EXISTS `Oplaty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Oplaty` (
  `id_oplaty` int NOT NULL AUTO_INCREMENT,
  `id_bronirovanija` int DEFAULT NULL,
  `id_prozhivanija` int DEFAULT NULL,
  `id_polzovatelja` int NOT NULL,
  `сумма` decimal(10,2) NOT NULL,
  `дата_оплаты` datetime DEFAULT CURRENT_TIMESTAMP,
  `способ_оплаты` enum('Наличные','Карта','Безналичный') NOT NULL,
  `тип_оплаты` enum('Предоплата','Окончательный_расчет') NOT NULL,
  PRIMARY KEY (`id_oplaty`),
  KEY `id_bronirovanija` (`id_bronirovanija`),
  KEY `id_prozhivanija` (`id_prozhivanija`),
  KEY `id_polzovatelja` (`id_polzovatelja`),
  CONSTRAINT `oplaty_ibfk_1` FOREIGN KEY (`id_bronirovanija`) REFERENCES `Bronirovanija` (`id_bronirovanija`) ON DELETE SET NULL,
  CONSTRAINT `oplaty_ibfk_2` FOREIGN KEY (`id_prozhivanija`) REFERENCES `Prozhivanija` (`id_prozhivanija`) ON DELETE SET NULL,
  CONSTRAINT `oplaty_ibfk_3` FOREIGN KEY (`id_polzovatelja`) REFERENCES `Polzovateli` (`id_polzovatelja`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Oplaty`
--

LOCK TABLES `Oplaty` WRITE;
/*!40000 ALTER TABLE `Oplaty` DISABLE KEYS */;
INSERT INTO `Oplaty` VALUES (1,NULL,1,3,14000.00,'2026-04-17 09:28:13','Карта','Предоплата'),(2,NULL,1,3,21000.00,'2026-04-17 09:28:13','Наличные','Окончательный_расчет'),(3,NULL,2,3,3500.00,'2026-04-17 09:28:13','Наличные','Предоплата'),(4,NULL,2,3,14000.00,'2026-04-17 09:28:13','Карта','Окончательный_расчет'),(5,NULL,3,3,7000.00,'2026-04-17 09:28:13','Карта','Предоплата'),(6,NULL,3,3,14000.00,'2026-04-17 09:28:13','Наличные','Окончательный_расчет'),(7,NULL,4,3,2500.00,'2026-04-17 09:28:13','Карта','Предоплата'),(8,NULL,4,3,8000.00,'2026-04-17 09:28:13','Наличные','Окончательный_расчет'),(9,NULL,5,3,12000.00,'2026-04-17 09:28:13','Безналичный','Предоплата'),(10,NULL,5,3,60000.00,'2026-04-17 09:28:13','Карта','Окончательный_расчет');
/*!40000 ALTER TABLE `Oplaty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Polzovateli`
--

DROP TABLE IF EXISTS `Polzovateli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Polzovateli` (
  `id_polzovatelja` int NOT NULL AUTO_INCREMENT,
  `логин` varchar(50) NOT NULL,
  `пароль` varchar(255) NOT NULL,
  `роль` enum('Администратор','Менеджер','Бухгалтер') NOT NULL,
  `фио` varchar(150) NOT NULL,
  `дата_последнего_входа` datetime DEFAULT NULL,
  PRIMARY KEY (`id_polzovatelja`),
  UNIQUE KEY `логин` (`логин`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Polzovateli`
--

LOCK TABLES `Polzovateli` WRITE;
/*!40000 ALTER TABLE `Polzovateli` DISABLE KEYS */;
INSERT INTO `Polzovateli` VALUES (1,'admin1','hash123','Администратор','Алексеева Анна Владимировна',NULL),(2,'manager1','hash456','Менеджер','Борисов Сергей Петрович',NULL),(3,'buh1','hash789','Бухгалтер','Васильева Ольга Игоревна',NULL),(4,'manager2','hash111','Менеджер','Громова Екатерина Дмитриевна',NULL);
/*!40000 ALTER TABLE `Polzovateli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prozhivanija`
--

DROP TABLE IF EXISTS `Prozhivanija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prozhivanija` (
  `id_prozhivanija` int NOT NULL AUTO_INCREMENT,
  `id_bronirovanija` int DEFAULT NULL,
  `id_klienta` int NOT NULL,
  `id_nomera` int NOT NULL,
  `id_polzovatelja` int NOT NULL,
  `дата_заезда` datetime NOT NULL,
  `дата_выезда` datetime DEFAULT NULL,
  `итоговая_сумма` decimal(10,2) DEFAULT '0.00',
  `статус` enum('Активно','Завершено') DEFAULT 'Активно',
  PRIMARY KEY (`id_prozhivanija`),
  KEY `id_bronirovanija` (`id_bronirovanija`),
  KEY `id_klienta` (`id_klienta`),
  KEY `id_nomera` (`id_nomera`),
  KEY `id_polzovatelja` (`id_polzovatelja`),
  CONSTRAINT `prozhivanija_ibfk_1` FOREIGN KEY (`id_bronirovanija`) REFERENCES `Bronirovanija` (`id_bronirovanija`) ON DELETE SET NULL,
  CONSTRAINT `prozhivanija_ibfk_2` FOREIGN KEY (`id_klienta`) REFERENCES `Klienty` (`id_klienta`) ON DELETE CASCADE,
  CONSTRAINT `prozhivanija_ibfk_3` FOREIGN KEY (`id_nomera`) REFERENCES `Nomera` (`id_nomera`) ON DELETE CASCADE,
  CONSTRAINT `prozhivanija_ibfk_4` FOREIGN KEY (`id_polzovatelja`) REFERENCES `Polzovateli` (`id_polzovatelja`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prozhivanija`
--

LOCK TABLES `Prozhivanija` WRITE;
/*!40000 ALTER TABLE `Prozhivanija` DISABLE KEYS */;
INSERT INTO `Prozhivanija` VALUES (1,3,3,5,1,'2024-05-20 14:30:00','2024-05-25 12:00:00',35000.00,'Завершено'),(2,1,1,4,1,'2024-06-01 14:00:00','2024-06-05 12:00:00',17500.00,'Завершено'),(3,2,2,3,2,'2024-06-10 15:00:00','2024-06-15 11:00:00',21000.00,'Завершено'),(4,4,4,2,1,'2024-06-15 13:00:00','2024-06-18 12:00:00',10500.00,'Завершено'),(5,6,6,10,2,'2024-07-01 12:00:00','2024-07-07 10:00:00',72000.00,'Завершено');
/*!40000 ALTER TABLE `Prozhivanija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zdanija`
--

DROP TABLE IF EXISTS `Zdanija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zdanija` (
  `id_zdanija` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(100) NOT NULL,
  `адрес` varchar(255) NOT NULL,
  `количество_этажей` int NOT NULL,
  PRIMARY KEY (`id_zdanija`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zdanija`
--

LOCK TABLES `Zdanija` WRITE;
/*!40000 ALTER TABLE `Zdanija` DISABLE KEYS */;
INSERT INTO `Zdanija` VALUES (1,'Корпус А','ул. Центральная, д.1',5),(2,'Корпус Б','ул. Центральная, д.2',3),(3,'Корпус В','ул. Парковая, д.10',2);
/*!40000 ALTER TABLE `Zdanija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-21 21:23:20
