-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 07:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_palette`
--

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color` char(55) NOT NULL,
  `color_price` varchar(55) NOT NULL,
  `color_status` varchar(55) NOT NULL DEFAULT 'A' COMMENT 'A = Available\r\nU = Unavailable',
  `color_time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color`, `color_price`, `color_status`, `color_time_added`) VALUES
(1, 'Pastel Green', '10.00', 'A', '2023-10-17 18:45:33'),
(2, 'Pastel Pink', '10.00', 'A', '2023-10-17 18:45:33'),
(3, 'Pastel Blue', '10.00', 'A', '2023-10-17 18:45:33'),
(4, 'Pastel Yellow', '10.00', 'A', '2023-10-17 18:45:33'),
(5, 'Pastel Turquoise', '10.00', 'A', '2023-10-17 18:45:33'),
(6, 'Lavender', '10.00', 'A', '2023-10-17 18:45:33'),
(7, 'Maroon', '10.00', 'A', '2023-10-17 18:45:33'),
(8, 'White', '10.00', 'A', '2023-10-17 18:45:33'),
(9, 'Black', '10.00', 'A', '2023-10-17 18:45:33'),
(10, 'Brown', '10.00', 'A', '2023-10-17 18:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `designs`
--

CREATE TABLE `designs` (
  `design_id` int(11) NOT NULL,
  `design` char(55) NOT NULL,
  `design_price` varchar(55) NOT NULL,
  `design_status` varchar(55) NOT NULL DEFAULT 'A' COMMENT 'A =  Available\r\nU = Unavailable',
  `design_time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designs`
--

INSERT INTO `designs` (`design_id`, `design`, `design_price`, `design_status`, `design_time_added`) VALUES
(1, 'Floral', '20.00', 'A', '2023-10-17 19:00:05'),
(2, 'Cartoon', '20.00', 'A', '2023-10-17 19:00:05'),
(3, 'Gradient', '20.00', 'A', '2023-10-17 19:00:05'),
(4, 'Dainty', '30.00', 'A', '2023-10-17 19:00:05'),
(5, 'Rossette', '40.00', 'A', '2023-10-17 19:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `flavors`
--

CREATE TABLE `flavors` (
  `flavor_id` int(11) NOT NULL,
  `flavor` varchar(255) NOT NULL,
  `flavor_price` varchar(55) NOT NULL,
  `flavor_status` varchar(55) NOT NULL DEFAULT 'A' COMMENT 'A = Available\r\nU = Unavailable',
  `flavor_time_added` datetime(1) NOT NULL DEFAULT current_timestamp(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flavors`
--

INSERT INTO `flavors` (`flavor_id`, `flavor`, `flavor_price`, `flavor_status`, `flavor_time_added`) VALUES
(1, 'Espresso Elegance (Mocha)', '80.00', 'A', '2023-10-17 19:10:44.7'),
(2, 'Yema Blissful Burst (Yema)', '80.00', 'A', '2023-10-17 19:10:44.8'),
(3, 'Tropical Mango Tango (Mango)', '80.00', 'A', '2023-10-17 19:10:44.8'),
(4, 'Purple Velvet Fantasy (Ube)', '80.00', 'A', '2023-10-17 19:10:44.8'),
(5, 'Chocoholic Delight (Chocolate)', '90.00', 'A', '2023-10-17 19:10:44.8'),
(6, 'Crimson Velvet Symphony (Red Velvet)', '90.00', 'A', '2023-10-17 19:10:44.8'),
(7, 'Creamy Cheesecake Supreme (Cheesecake)', '90.00', 'A', '2023-10-17 19:10:44.8'),
(8, 'Midnight Truffle Temptation (Dark Chocolate)', '90.00', 'A', '2023-10-17 19:10:44.8'),
(9, 'Luscious Lemon Sunshine (Lemon)', '90.00', 'A', '2023-10-17 19:10:44.8'),
(10, 'Strawberry Fields Forever (Strawberry)', '90.00', 'A', '2023-10-17 19:10:44.8');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_id` int(55) NOT NULL,
  `item_category` varchar(55) NOT NULL,
  `item_size` varchar(55) NOT NULL,
  `item_size_price` int(55) NOT NULL,
  `item_status` varchar(55) NOT NULL DEFAULT 'A' COMMENT 'A - Available\r\nO - Out of Stock',
  `item_time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_id`, `item_category`, `item_size`, `item_size_price`, `item_status`, `item_time_added`) VALUES
(1, 'Bento Cake', '3 inches x 4 inches', 100, 'A', '2023-10-17 18:35:34'),
(2, 'Bento Cake', '4 inches x 4 inches', 120, 'A', '2023-10-17 18:35:34'),
(3, 'Bento Cake', '5 inches x 4 inches', 150, 'A', '2023-10-17 18:35:34'),
(4, 'Bento Cake', '5 inches x 5 inches', 160, 'A', '2023-10-17 18:35:34'),
(5, 'Swiss Roll', '3 inches x 6 inches', 120, 'A', '2023-10-17 18:35:34'),
(6, 'Swiss Roll', '3 inches x 9 inches', 150, 'A', '2023-10-17 18:35:34'),
(7, 'Swiss Roll', '3 inches x 12 inches', 180, 'A', '2023-10-17 18:35:34'),
(8, 'Cake in a Can', '7 inches x 11 inches', 500, 'A', '2023-10-17 18:35:34'),
(9, 'Cake in a Can', '9 inches x 11 inches', 700, 'A', '2023-10-17 18:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `flavor_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  `topping_id` int(11) NOT NULL,
  `order_quantity` int(55) NOT NULL,
  `order_status` varchar(55) NOT NULL DEFAULT 'TP' COMMENT 'TP = To pay\r\nTS = To ship\r\nS = Shipped\r\nR = Received\r\nC = Cancelled',
  `date_ordered` datetime NOT NULL DEFAULT current_timestamp(),
  `order_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `item_id`, `flavor_id`, `color_id`, `design_id`, `topping_id`, `order_quantity`, `order_status`, `date_ordered`, `order_price`) VALUES
(1, 17, 7, 3, 5, 3, 2, 2, 'TS', '2023-10-17 20:57:53', '');

-- --------------------------------------------------------

--
-- Table structure for table `toppings`
--

CREATE TABLE `toppings` (
  `topping_id` int(11) NOT NULL,
  `topping` char(55) NOT NULL,
  `topping_price` varchar(55) NOT NULL,
  `topping_status` varchar(55) NOT NULL DEFAULT 'A' COMMENT 'A =  Available\r\nU = Unavailable',
  `topping_date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toppings`
--

INSERT INTO `toppings` (`topping_id`, `topping`, `topping_price`, `topping_status`, `topping_date_added`) VALUES
(1, 'Gold Flakes', '10.00', 'A', '2023-10-17 19:03:15'),
(2, 'Crushed Grahams', '10.00', 'A', '2023-10-17 19:03:15'),
(3, 'Oreo', '10.00', 'A', '2023-10-17 19:03:15'),
(4, 'Chocolate Bar', '10.00', 'A', '2023-10-17 19:03:15'),
(5, 'Stick-O', '10.00', 'A', '2023-10-17 19:03:15'),
(6, 'Leche Flan', '15.00', 'A', '2023-10-17 19:03:15'),
(7, 'Strawberry', '20.00', 'A', '2023-10-17 19:03:15'),
(8, 'Butterfly', '20.00', 'A', '2023-10-17 19:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email_add` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `user_type` char(1) NOT NULL DEFAULT 'U' COMMENT 'U = User\r\nA = Admin',
  `user_status` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'A = Active\r\nI = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_fullname`, `username`, `password`, `email_add`, `contact_number`, `address`, `user_date_added`, `user_type`, `user_status`) VALUES
(1, 'Ace Baylon', 'AceOfSpades', '5paD3s!', 'ace.baylon@gmail.com', '09452238759', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(2, 'Angelique Ann Rebancos', 'AngelicAnniverse', 'A!1gicAnn!', 'angelique.rebancos@gmail.com', '09674893556', 'Oas, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(3, 'Anjo Baraquiel', 'AnjoAstronomer', 'Astr0!n0m3r', 'anjo.baraquiel@gmail.com', '09874637893', 'Camalig, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(4, 'Camille Sabaupan', 'CamilleCanvas', 'C@nva$123', 'camille.sabaupan@gmail.com', '09098465375', 'Buhi, Cam Sua', '2023-10-16 15:51:21', 'U', 'A'),
(5, 'Christian Rob Llacer', 'ChromaticRob', 'ChroMat!c!2', 'christian.llacer@gmail.com', '09564298502', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(6, 'Dandreb Ken Saurane', 'DandrebDoodle', 'Dandreb#D00Dle', 'dandreb.saurane@gmail.com', '09956382694', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(7, 'Daniel Benitez', 'DreamingDaniel', 'Dr3@M!n9D@n!3l', 'daniel.benitez@gmail.com', '09964734528', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(8, 'Darwin Frenandez', 'DarwinDynamo', 'D@rw!nDyN@mo0', 'daniel.fernandez@gmail.com', '09734529764', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(9, 'Effie Shane Balaguer', 'EffervescentEffie', '3ff3rV3Scent!', 'effie.balaguer@gmail.com', '09458739217', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(10, 'Gemma Rose Umali', 'GemmaGraffiti', 'G3mmaGr@ff1t!', 'gemma.umali@gmail.com', '09973562016', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(11, 'Glorianne Ordona', 'GlorianneMosaic', 'MosaicGloR1!', 'glorianne.ordona@gmail.com', '09245178527', 'Daraga, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(12, 'Hajji Talagtag', 'HajjiHologram', 'H@jj!HOlogRa@m!', 'hajji.talagtag@gmail.com', '09973520164', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(13, 'Ianna Beatriz Llorera', 'IannaInkbot', '!@nnaInkblOt4', 'ianna.llorera@gmail.com', '09985362910', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(14, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', 'james.dimasayo@gmail.com', '09236730916', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(15, 'Jan Denice Basilonia', 'DeniceDaydream', 'D3nic3#D@ydr3@M', 'jan.basilonia@gmail.com', '09178892617', 'Bacacay, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(16, 'Jed Mike Herrera', 'JediJukeBox', 'J3d!Juk3b0x$', 'jed.herra@gmail.com', '093782501749', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(17, 'Jerico Rentosa', 'JericoJazzmaster', 'J3r!c0J@zzm@$t3r!', 'jerico.rentosa@gmail.com', '09563902617', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(18, 'Jesuer Bogate', 'JesuerJigsawPuzzel', 'J3$u3rJ!g$@wPuzz!3', 'jesuer.bogate@gmail.com', '09678673918', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(19, 'Joede Belen', 'JoedeJamboree', 'J0eed3J@m80r33', 'joede.belen@gmail.com', '09784167037', 'Bacacay, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(20, 'John Paul Abion', 'AbionAdventurer', 'Ab!0n@dv3vntur3R', 'john.abion@gmail.com', '09672974519', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(21, 'John Vincent Martinez', 'VincentVoyage', 'V!nc3ntV0y@g3#', 'john.martinez@gmail.com', '09986145027', 'Buhi, Cam Sur', '2023-10-16 15:51:21', 'U', 'A'),
(22, 'Joshua Bill Jove', 'BillJoveBard', 'B!llJov3B@rd7', 'joshua.jove@gmail.com', '09156382950', 'Iriga, Cam Sur', '2023-10-16 15:51:21', 'U', 'A'),
(23, 'Kenneth Lotivo', 'KennethKaleidoscope', 'K3nn3thK@I31d0sc0p3', 'kenneth.lotivo@gmail.com', '09891563782', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(24, 'Kirsten Hailey Dimaiwat', 'KirstenKaledioscope', 'k!rst3nK@l3!d0sc0p3', 'kirsten.dimaiwat@gmail.com', '09953618392', 'Legazpi, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(25, 'Llorico Tua', 'LlricoLyricist', 'Llor1c0Lyr!c!$t', 'llorico.tua@gmail.com', '09256728943', 'Ligao, Albay', '2023-10-16 15:51:21', 'A', 'A'),
(26, 'Louise James Mangampo', 'LuminousLouise', 'LuminOu$LOu!$3', 'louise.mangampo@email.com', '09178394820', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(27, 'Mark Vincent Cardinal', 'MarkCardinalCanvas', 'M@rkC@rd!n@lC@nv@$', 'mark.cardinal@email.com', '09678925301', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(28, 'Michelle Pablico', 'MysticMichelle', 'My$ticM!ch3ll3', 'michelle.pablico@email.com', '09095361835', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(29, 'Patricia Penaflor', 'PatriciaPixel', 'P@tr!c!@Pix3l', 'patricia.penaflor@email.com', '09654017342', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(30, 'Phamela Shane Mitra', 'PhamelaPhoton', 'Ph@m3l@Ph0t0n@', 'phamela.mitra@email.com', '09782630173', 'Tabaco, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(31, 'Piolo Pagdagdagan', 'PioloPolymath', 'P!0l0P0lym@th', 'piolo.pagdagdagan@email.com', '09183689361', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(32, 'Raymark Dagasdas', 'ReymarkRemix', 'R@ym@rkRem!x5', 'raymark.dagasdas@email.com', '09245385901', 'Camalig, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(33, 'Renzo Sales', 'RenzoRhapsody', 'R3nz0Rhap$ody', 'renzo.sales@email.com', '09483016734', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(34, 'Sherwin Bolanos', 'SherwinSymphony', 'Sh3rw!n$ymph0ny', 'sherwin.bolanos@email.com', '09967163920', 'Tabaco, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(35, 'Tristan Joseph Llorera', 'TristanTinkerer', 'Tr!$t@nT!nk3r3r', 'tristan.llorea@email.com', '09772708453', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(37, 'John Raven M. Latosa', 'JRavenLatosa', 'JayArt123', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:14:00', 'U', 'A'),
(38, 'Marielle Pallermo', 'MaiMai123', 'M@im@i', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(39, 'Angeline Velasco', 'Angie05', '@ngie0515', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(40, 'Jeniffer Persia', 'Jane04', 'J3nj3n', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(41, 'Vonnie Trinanes', 'Von0', 'von0123', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_fullname` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email_add` varchar(255) NOT NULL,
  `user_date_added` datetime NOT NULL,
  `user_status` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'A = Active\r\nI = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`user_id`, `user_fullname`, `username`, `password`, `email_add`, `user_date_added`, `user_status`) VALUES
(1, 'Ace Baylon', 'AceOfSpades', '5paD3s!', 'ace.baylon@gmail.com', '2023-10-16 15:44:31', 'A'),
(2, 'Angelique Ann Rebancos', 'AngelicAnniverse', 'A!1gicAnn!', 'angelique.rebancos@gmail.com', '2023-10-16 15:44:31', 'A'),
(3, 'Anjo Baraquiel', 'AnjoAstronomer', 'Astr0!n0m3r', 'anjo.baraquiel@gmail.com', '2023-10-16 15:44:31', 'A'),
(4, 'Camille Sabaupan', 'CamilleCanvas', 'C@nva$123', 'camille.sabaupan@gmail.com', '2023-10-16 15:44:31', 'A'),
(5, 'Christian Rob Llacer', 'ChromaticRob', 'ChroMat!c!2', 'christian.llacer@gmail.com', '2023-10-16 15:44:31', 'A'),
(6, 'Dandreb Ken Saurane', 'DandrebDoodle', 'Dandreb#D00Dle', 'dandreb.saurane@gmail.com', '2023-10-16 15:44:31', 'A'),
(7, 'Daniel Benitez', 'DreamingDaniel', 'Dr3@M!n9D@n!3l', 'daniel.benitez@gmail.com', '2023-10-16 15:44:31', 'A'),
(8, 'Darwin Frenandez', 'DarwinDynamo', 'D@rw!nDyN@mo0', 'daniel.fernandez@gmail.com', '2023-10-16 15:44:31', 'A'),
(9, 'Effie Shane Balaguer', 'EffervescentEffie', '3ff3rV3Scent!', 'effie.balaguer@gmail.com', '2023-10-16 15:44:31', 'A'),
(10, 'Gemma Rose Umali', 'GemmaGraffiti', 'G3mmaGr@ff1t!', 'gemma.umali@gmail.com', '2023-10-16 15:44:31', 'A'),
(11, 'Glorianne Ordona', 'GlorianneMosaic', 'MosaicGloR1!', 'glorianne.ordona@gmail.com', '2023-10-16 15:44:31', 'A'),
(12, 'Hajji Talagtag', 'HajjiHologram', 'H@jj!HOlogRa@m!', 'hajji.talagtag@gmail.com', '2023-10-16 15:44:31', 'A'),
(13, 'Ianna Beatriz Llorera', 'IannaInkbot', '!@nnaInkblOt4', 'ianna.llorera@gmail.com', '2023-10-16 15:44:31', 'A'),
(14, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', 'james.dimasayo@gmail.com', '2023-10-16 15:44:31', 'A'),
(15, 'Jan Denice Basilonia', 'DeniceDaydream', 'D3nic3#D@ydr3@M', 'jan.basilonia@gmail.com', '2023-10-16 15:44:31', 'A'),
(16, 'Jed Mike Herrera', 'JediJukeBox', 'J3d!Juk3b0x$', 'jed.herra@gmail.com', '2023-10-16 15:44:31', 'A'),
(17, 'Jerico Rentosa', 'JericoJazzmaster', 'J3r!c0J@zzm@$t3r!', 'jerico.rentosa@gmail.com', '2023-10-16 15:44:31', 'A'),
(18, 'Jesuer Bogate', 'JesuerJigsawPuzzel', 'J3$u3rJ!g$@wPuzz!3', 'jesuer.bogate@gmail.com', '2023-10-16 15:44:31', 'A'),
(19, 'Joede Belen', 'JoedeJamboree', 'J0eed3J@m80r33', 'joede.belen@gmail.com', '2023-10-16 15:44:31', 'A'),
(20, 'John Paul Abion', 'AbionAdventurer', 'Ab!0n@dv3vntur3R', 'john.abion@gmail.com', '2023-10-16 15:44:31', 'A'),
(21, 'John Vincent Martinez', 'VincentVoyage', 'V!nc3ntV0y@g3#', 'john.martinez@gmail.com', '2023-10-16 15:44:31', 'A'),
(22, 'Joshua Bill Jove', 'BillJoveBard', 'B!llJov3B@rd7', 'joshua.jove@gmail.com', '2023-10-16 15:44:31', 'A'),
(23, 'Kenneth Lotivo', 'KennethKaleidoscope', 'K3nn3thK@I31d0sc0p3', 'kenneth.lotivo@gmail.com', '2023-10-16 15:44:31', 'A'),
(24, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', 'james.dimasayo@gmail.com', '2023-10-16 15:44:31', 'A'),
(25, 'Ace Baylon', 'AceOfSpades', '5paD3s!', 'ace.baylon@gmail.com', '2023-10-16 15:44:31', 'A'),
(26, 'Angelique Ann Rebancos', 'AngelicAnniverse', 'A!1gicAnn!', 'angelique.rebancos@gmail.com', '2023-10-16 15:44:31', 'A'),
(27, 'Anjo Baraquiel', 'AnjoAstronomer', 'Astr0!n0m3r', 'anjo.baraquiel@gmail.com', '2023-10-16 15:44:31', 'A'),
(28, 'Camille Sabaupan', 'CamilleCanvas', 'C@nva$123', 'camille.sabaupan@gmail.com', '2023-10-16 15:44:31', 'A'),
(29, 'Christian Rob Llacer', 'ChromaticRob', 'ChroMat!c!2', 'christian.llacer@gmail.com', '2023-10-16 15:44:31', 'A'),
(30, 'Dandreb Ken Saurane', 'DandrebDoodle', 'Dandreb#D00Dle', 'dandreb.saurane@gmail.com', '2023-10-16 15:44:31', 'A'),
(31, 'Daniel Benitez', 'DreamingDaniel', 'Dr3@M!n9D@n!3l', 'daniel.benitez@gmail.com', '2023-10-16 15:44:31', 'A'),
(32, 'Darwin Frenandez', 'DarwinDynamo', 'D@rw!nDyN@mo0', 'daniel.fernandez@gmail.com', '2023-10-16 15:44:31', 'A'),
(33, 'Effie Shane Balaguer', 'EffervescentEffie', '3ff3rV3Scent!', 'effie.balaguer@gmail.com', '2023-10-16 15:44:31', 'A'),
(34, 'Gemma Rose Umali', 'GemmaGraffiti', 'G3mmaGr@ff1t!', 'gemma.umali@gmail.com', '2023-10-16 15:44:31', 'A'),
(35, 'Glorianne Ordona', 'GlorianneMosaic', 'MosaicGloR1!', 'glorianne.ordona@gmail.com', '2023-10-16 15:44:31', 'A'),
(36, 'Hajji Talagtag', 'HajjiHologram', 'H@jj!HOlogRa@m!', 'hajji.talagtag@gmail.com', '2023-10-16 15:44:31', 'A'),
(37, 'Ianna Beatriz Llorera', 'IannaInkbot', '!@nnaInkblOt4', 'ianna.llorera@gmail.com', '2023-10-16 15:44:31', 'A'),
(38, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', 'james.dimasayo@gmail.com', '2023-10-16 15:44:31', 'A'),
(39, 'Jan Denice Basilonia', 'DeniceDaydream', 'D3nic3#D@ydr3@M', 'jan.basilonia@gmail.com', '2023-10-16 15:44:31', 'A'),
(40, 'Jed Mike Herrera', 'JediJukeBox', 'J3d!Juk3b0x$', 'jed.herra@gmail.com', '2023-10-16 15:44:31', 'A'),
(41, 'Jerico Rentosa', 'JericoJazzmaster', 'J3r!c0J@zzm@$t3r!', 'jerico.rentosa@gmail.com', '2023-10-16 15:44:31', 'A'),
(42, 'Jesuer Bogate', 'JesuerJigsawPuzzel', 'J3$u3rJ!g$@wPuzz!3', 'jesuer.bogate@gmail.com', '2023-10-16 15:44:31', 'A'),
(43, 'John Paul Abion', 'AbionAdventurer', 'Ab!0n@dv3vntur3R', 'john.abion@gmail.com', '2023-10-16 15:44:31', 'A'),
(44, 'John Vincent Martinez', 'VincentVoyage', 'V!nc3ntV0y@g3#', 'john.martinez@gmail.com', '2023-10-16 15:44:31', 'A'),
(45, 'Joshua Bill Jove', 'BillJoveBard', 'B!llJov3B@rd7', 'joshua.jove@gmail.com', '2023-10-16 15:44:31', 'A'),
(46, 'Kenneth Lotivo', 'KennethKaleidoscope', 'K3nn3thK@I31d0sc0p3', 'kenneth.lotivo@gmail.com', '2023-10-16 15:44:31', 'A'),
(47, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', 'james.dimasayo@gmail.com', '2023-10-16 15:44:31', 'A'),
(48, 'Kirsten Hailey Dimaiwat', 'KirstenKaledioscope', 'k!rst3nK@l3!d0sc0p3', 'kirsten.dimaiwat@gmail.com', '2023-10-16 15:44:31', 'A'),
(49, 'Llorico Tua', 'LlricoLyricist', 'Llor1c0Lyr!c!$t', 'llorico.tua@gmail.com', '2023-10-16 15:44:31', 'A'),
(50, 'Louise James Mangampo', 'LuminousLouise', 'LuminOu$LOu!$3', 'louise.mangampo@email.com', '2023-10-16 15:44:31', 'A'),
(51, 'Mark Vincent Cardinal', 'MarkCardinalCanvas', 'M@rkC@rd!n@lC@nv@$', 'mark.cardinal@email.com', '2023-10-16 15:44:31', 'A'),
(52, 'Michelle Pablico', 'MysticMichelle', 'My$ticM!ch3ll3', 'michelle.pablico@email.com', '2023-10-16 15:44:31', 'A'),
(53, 'Patricia Penaflor', 'PatriciaPixel', 'P@tr!c!@Pix3l', 'patricia.penaflor@email.com', '2023-10-16 15:44:31', 'A'),
(54, 'Phamela Shane Mitra', 'PhamelaPhoton', 'Ph@m3l@Ph0t0n@', 'phamela.mitra@email.com', '2023-10-16 15:44:31', 'A'),
(55, 'Piolo Pagdagdagan', 'PioloPolymath', 'P!0l0P0lym@th', 'piolo.pagdagdagan@email.com', '2023-10-16 15:44:31', 'A'),
(56, 'Raymark Dagasdas', 'ReymarkRemix', 'R@ym@rkRem!x5', 'raymark.dagasdas@email.com', '2023-10-16 15:44:31', 'A'),
(57, 'Renzo Sales', 'RenzoRhapsody', 'R3nz0Rhap$ody', 'renzo.sales@email.com', '2023-10-16 15:44:31', 'A'),
(58, 'Sherwin Bolanos', 'SherwinSymphony', 'Sh3rw!n$ymph0ny', 'sherwin.bolanos@email.com', '2023-10-16 15:44:31', 'A'),
(59, 'Tristan Joseph Llorera', 'TristanTinkerer', 'Tr!$t@nT!nk3r3r', 'tristan.llorea@email.com', '2023-10-16 15:44:31', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`design_id`);

--
-- Indexes for table `flavors`
--
ALTER TABLE `flavors`
  ADD PRIMARY KEY (`flavor_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_item_id` (`item_id`),
  ADD KEY `fk_flavor_id` (`flavor_id`),
  ADD KEY `fk_color_id` (`color_id`),
  ADD KEY `fk_topping_id` (`topping_id`),
  ADD KEY `fk_design_id` (`design_id`);

--
-- Indexes for table `toppings`
--
ALTER TABLE `toppings`
  ADD PRIMARY KEY (`topping_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flavors`
--
ALTER TABLE `flavors`
  MODIFY `flavor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_id` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `toppings`
--
ALTER TABLE `toppings`
  MODIFY `topping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_color_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`),
  ADD CONSTRAINT `fk_design_id` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`),
  ADD CONSTRAINT `fk_flavor_id` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`flavor_id`),
  ADD CONSTRAINT `fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_id`),
  ADD CONSTRAINT `fk_topping_id` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`topping_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
