-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 01:21 PM
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
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `element_id` int(11) NOT NULL,
  `element_name` varchar(100) NOT NULL,
  `step_id` int(11) NOT NULL,
  `price_amount` decimal(6,2) NOT NULL,
  `element_img` varchar(100) NOT NULL,
  `element_status` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'A = Available\r\nU = Unavailable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`element_id`, `element_name`, `step_id`, `price_amount`, `element_img`, `element_status`) VALUES
(1, '3x4 Bento Cake', 1, 100.00, 'bento.png', 'A'),
(2, 'Espresso Elegance (Mocha)', 2, 80.00, 'espresso_elegance.png', 'A'),
(3, 'Yema Blissful Burst (Yema)', 2, 80.00, 'yema.png\r\n', 'A'),
(4, 'Tropical Mango Tango (Mango)', 2, 80.00, 'tropical_mango.png', 'A'),
(5, 'Purple Velvet Fantasy (Ube)', 2, 80.00, 'purple_velvet.png', 'A'),
(6, 'Chocoholic Delight (Chocolate)', 2, 90.00, 'chocoholic_delight.png', 'A'),
(7, 'Crimson Velvet Symphony (Red Velvet)', 2, 90.00, 'crimson_velvet.png', 'A'),
(8, 'Creamy Cheesecake Supreme (Cheesecake)', 2, 90.00, 'creamy_cheesecake.png', 'A'),
(9, 'Midnight Truffle Temptation (Dark C', 2, 90.00, 'midnight_truffle.png', 'A'),
(10, 'Luscious Lemon Sunshine (Lemon)', 2, 90.00, 'luscious_lemon.png', 'A'),
(11, 'Strawberry Fields Forever (Strawberry)', 2, 90.00, 'strawberry_fields.png', 'A'),
(12, 'Pastel Green', 3, 10.00, 'pastel_green.png', 'A'),
(13, 'Pastel Pink', 3, 10.00, 'pastel_pink.png', 'A'),
(14, 'Pastel Blue', 3, 10.00, 'pastel_blue.png', 'A'),
(15, 'Pastel Yellow', 3, 10.00, 'pastel_yellow.png', 'A'),
(16, 'Pastel Turquoise', 3, 10.00, 'pastel_turquiose.png', 'A'),
(17, 'Pastel Lavender', 3, 10.00, 'pastel_lavander.png', 'A'),
(18, 'Pastel Maroon', 3, 10.00, 'pastel_maroon.png', 'A'),
(19, 'Pastel Black', 3, 10.00, 'pastel_black.png', 'A'),
(20, 'Pastel Brown', 3, 10.00, 'pastel_brown.png', 'A'),
(21, 'Floral', 4, 20.00, 'floral.png', 'A'),
(22, 'Cartoon', 4, 20.00, 'cartoon.png', 'A'),
(23, 'Gradient', 4, 20.00, 'gradient.png', 'A'),
(24, 'Dainty', 4, 30.00, 'dainty.png', 'A'),
(25, 'Gold Flakes', 5, 10.00, 'gold_flakes.png', 'A'),
(26, 'Crushed Grahams', 5, 10.00, 'crushed_graham.png', 'A'),
(27, 'Oreo', 5, 10.00, 'oreo.png', 'A'),
(28, 'Chocolate Bar', 5, 10.00, 'chocolate_bars.png', 'U'),
(29, 'Stick O', 5, 10.00, 'stick_o.png', 'A'),
(30, 'Leche Flan', 5, 15.00, 'leche_flan.png', 'A'),
(31, 'Strawberry', 5, 20.00, 'strawberry.png', 'A'),
(32, 'Butterfly', 5, 20.00, 'butterfly.png', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `multi_order`
--

CREATE TABLE `multi_order` (
  `order_step_id` int(11) NOT NULL,
  `order_reference_number` varchar(8) DEFAULT NULL,
  `order_status` varchar(1) NOT NULL DEFAULT 'P',
  `step_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `date_ordered` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `multi_order`
--

INSERT INTO `multi_order` (`order_step_id`, `order_reference_number`, `order_status`, `step_id`, `ingredient_id`, `user_id`, `order_qty`, `date_ordered`) VALUES
(1, '0M8G3X6J', 'P', 5, 4, 10, 1, '2023-11-30 08:36:09'),
(2, '0M8G3X6J', 'P', 5, 6, 10, 1, '2023-11-30 08:36:09'),
(3, '0M8G3X6J', 'P', 5, 8, 10, 1, '2023-11-30 08:36:09'),
(4, '0M8G3X6J', 'P', 5, 10, 10, 1, '2023-11-30 08:36:09'),
(5, '0M8G3X6J', 'P', 5, 13, 10, 1, '2023-11-30 08:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `step1` int(11) NOT NULL,
  `step2` int(11) NOT NULL,
  `step3` int(11) NOT NULL,
  `step4` int(11) NOT NULL,
  `step5` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `order_amount` decimal(6,2) NOT NULL,
  `order_status` varchar(1) NOT NULL DEFAULT 'P' COMMENT 'P = Pending\r\nD = Delivered\r\nC - Cancelled',
  `date_ordered` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `step1`, `step2`, `step3`, `step4`, `step5`, `user_id`, `element_id`, `order_amount`, `order_status`, `date_ordered`) VALUES
(1, 1, 2, 16, 23, 29, 1, 0, 220.00, 'C', '2023-12-26 10:46:33'),
(2, 1, 7, 13, 24, 26, 2, 0, 240.00, 'P', '2023-12-26 09:17:31'),
(3, 1, 2, 13, 21, 25, 3, 0, 220.00, 'P', '2023-12-26 09:18:48'),
(4, 1, 2, 13, 21, 26, 4, 0, 220.00, 'P', '2023-12-26 09:20:02'),
(5, 1, 2, 13, 21, 26, 5, 0, 220.00, 'P', '2023-12-26 09:20:38'),
(6, 1, 2, 13, 21, 28, 6, 0, 220.00, 'P', '2023-12-26 09:21:33'),
(7, 1, 2, 12, 21, 26, 7, 0, 220.00, 'P', '2023-12-26 09:22:25'),
(8, 1, 2, 13, 21, 26, 8, 0, 220.00, 'P', '2023-12-26 09:22:55'),
(9, 1, 2, 13, 21, 26, 13, 0, 220.00, 'P', '2023-12-26 09:23:25'),
(10, 1, 2, 15, 23, 26, 1, 0, 220.00, 'P', '2023-12-26 09:14:29'),
(11, 1, 6, 12, 21, 31, 2, 0, 240.00, 'P', '2023-12-26 09:18:03'),
(12, 1, 2, 19, 24, 26, 1, 0, 230.00, 'P', '2023-12-26 09:14:54'),
(13, 1, 2, 13, 21, 26, 21, 0, 220.00, 'P', '2023-12-26 09:24:01'),
(14, 1, 7, 15, 23, 30, 1, 0, 235.00, 'P', '2023-12-26 09:15:25'),
(15, 1, 2, 13, 23, 29, 4, 0, 220.00, 'P', '2023-12-26 09:12:53'),
(16, 1, 5, 18, 24, 29, 1, 0, 230.00, 'P', '2023-12-26 10:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `step_id` int(55) NOT NULL,
  `step_description` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`step_id`, `step_description`) VALUES
(1, 'Step 1: Choose your Cake Size'),
(2, 'Step 2: Choose your Flavor'),
(3, 'Step 3: Choose your Color'),
(4, 'Step 4: Choose your Design'),
(5, 'Step 5: Choose your Topping');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `repeat_password` varchar(55) NOT NULL,
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

INSERT INTO `users` (`user_id`, `user_fullname`, `username`, `password`, `repeat_password`, `email_add`, `contact_number`, `address`, `user_date_added`, `user_type`, `user_status`) VALUES
(1, 'Ace Baylon', 'AceOfSpades', 'Spades123', '', 'ace.baylon@gmail.com', '09452238759', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(2, 'Angelique Ann Rebancos', 'AngelicAnniverse', 'A!1gicAnn!', '', 'angelique.rebancos@gmail.com', '09674893556', 'Oas, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(3, 'Anjo Baraquiel', 'AnjoAstronomer', 'Astr0!n0m3r', '', 'anjo.baraquiel@gmail.com', '09874637893', 'Camalig, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(4, 'Camille Sabaupan', 'CamilleCanvas', 'C@nva$123', '', 'camille.sabaupan@gmail.com', '09098465375', 'Buhi, Cam Sua', '2023-10-16 15:51:21', 'U', 'A'),
(5, 'Christian Rob Llacer', 'ChromaticRob', 'ChroMat!c!2', '', 'christian.llacer@gmail.com', '09564298502', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(6, 'Dandreb Ken Saurane', 'DandrebDoodle', 'Dandreb#D00Dle', '', 'dandreb.saurane@gmail.com', '09956382694', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(7, 'Daniel Benitez', 'DreamingDaniel', 'Dr3@M!n9D@n!3l', '', 'daniel.benitez@gmail.com', '09964734528', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(8, 'Darwin Frenandez', 'DarwinDynamo', 'D@rw!nDyN@mo0', '', 'daniel.fernandez@gmail.com', '09734529764', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(9, 'Effie Shane Balaguer', 'EffervescentEffie', '3ff3rV3Scent!', '', 'effie.balaguer@gmail.com', '09458739217', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(10, 'Gemma Rose Umali', 'GemmaGraffiti', 'G3mmaGr@ff1t!', '', 'gemma.umali@gmail.com', '09973562016', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(11, 'Glorianne Ordona', 'GlorianneMosaic', 'MosaicGloR1!', '', 'glorianne.ordona@gmail.com', '09245178527', 'Daraga, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(12, 'Hajji Talagtag', 'HajjiHologram', 'H@jj!HOlogRa@m!', '', 'hajji.talagtag@gmail.com', '09973520164', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(13, 'Ianna Beatriz Llorera', 'IannaInkbot', '!@nnaInkblOt4', '', 'ianna.llorera@gmail.com', '09985362910', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(14, 'James Dimasayao', 'JamesJigsaw', 'J@mes$J!gs@w8', '', 'james.dimasayo@gmail.com', '09236730916', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(15, 'Jan Denice Basilonia', 'DeniceDaydream', 'D3nic3#D@ydr3@M', '', 'jan.basilonia@gmail.com', '09178892617', 'Bacacay, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(16, 'Jed Mike Herrera', 'JediJukeBox', 'J3d!Juk3b0x$', '', 'jed.herra@gmail.com', '093782501749', 'Libon, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(17, 'Jerico Rentosa', 'JericoJazzmaster', 'J3r!c0J@zzm@$t3r!', '', 'jerico.rentosa@gmail.com', '09563902617', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(18, 'Jesuer Bogate', 'JesuerJigsawPuzzel', 'J3$u3rJ!g$@wPuzz!3', '', 'jesuer.bogate@gmail.com', '09678673918', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(19, 'Joede Belen', 'JoedeJamboree', 'J0eed3J@m80r33', '', 'joede.belen@gmail.com', '09784167037', 'Bacacay, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(20, 'John Paul Abion', 'AbionAdventurer', 'Ab!0n@dv3vntur3R', '', 'john.abion@gmail.com', '09672974519', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(21, 'John Vincent Martinez', 'VincentVoyage', 'V!nc3ntV0y@g3#', '', 'john.martinez@gmail.com', '09986145027', 'Buhi, Cam Sur', '2023-10-16 15:51:21', 'U', 'A'),
(22, 'Joshua Bill Jove', 'BillJoveBard', 'B!llJov3B@rd7', '', 'joshua.jove@gmail.com', '09156382950', 'Iriga, Cam Sur', '2023-10-16 15:51:21', 'U', 'A'),
(23, 'Kenneth Lotivo', 'KennethKaleidoscope', 'K3nn3thK@I31d0sc0p3', '', 'kenneth.lotivo@gmail.com', '09891563782', 'Polangui, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(24, 'Kirsten Hailey Dimaiwat', 'KirstenKaledioscope', 'k!rst3nK@l3!d0sc0p3', '', 'kirsten.dimaiwat@gmail.com', '09953618392', 'Legazpi, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(25, 'Llorico Tua', 'LlricoLyricist', 'Llor1c0Lyr!c!$t', '', 'llorico.tua@gmail.com', '09256728943', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(26, 'Louise James Mangampo', 'LuminousLouise', 'LuminOu$LOu!$3', '', 'louise.mangampo@email.com', '09178394820', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(27, 'Mark Vincent Cardinal', 'MarkCardinalCanvas', 'M@rkC@rd!n@lC@nv@$', '', 'mark.cardinal@email.com', '09678925301', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(28, 'Michelle Pablico', 'MysticMichelle', 'michelle123', '', 'michelle.pablico@email.com', '09095361835', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(29, 'Patricia Penaflor', 'PatriciaPixel', 'P@tr!c!@Pix3l', '', 'patricia.penaflor@email.com', '09654017342', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(30, 'Phamela Shane Mitra', 'PhamelaPhoton', 'Ph@m3l@Ph0t0n@', '', 'phamela.mitra@email.com', '09782630173', 'Tabaco, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(31, 'Piolo Pagdagdagan', 'PioloPolymath', 'P!0l0P0lym@th', '', 'piolo.pagdagdagan@email.com', '09183689361', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(32, 'Raymark Dagasdas', 'ReymarkRemix', 'R@ym@rkRem!x5', '', 'raymark.dagasdas@email.com', '09245385901', 'Camalig, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(33, 'Renzo Sales', 'RenzoRhapsody', 'R3nz0Rhap$ody', '', 'renzo.sales@email.com', '09483016734', 'Guinobatan, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(34, 'Sherwin Bolanos', 'SherwinSymphony', 'Sh3rw!n$ymph0ny', '', 'sherwin.bolanos@email.com', '09967163920', 'Tabaco, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(35, 'Tristan Joseph Llorera', 'TristanTinkerer', 'Tr!$t@nT!nk3r3r', '', 'tristan.llorea@email.com', '09772708453', 'Ligao, Albay', '2023-10-16 15:51:21', 'U', 'A'),
(37, 'John Raven M. Latosa', 'JRavenLatosa', 'JayArt123', '', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:14:00', 'A', 'A'),
(38, 'Marielle Pallermo', 'MaiMai123', 'M@im@i', '', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(39, 'Angeline Velasco', 'Angie05', '@ngie0515', '', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(40, 'Jeniffer Persia', 'Jane04', 'J3nj3n', '', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(41, 'Vonnie Trinanes', 'Von0', 'von0123', '', 'cakepalette@gmail.com', '09764556536', 'Legazpi, Albay', '2023-10-20 13:17:53', 'A', 'A'),
(44, 'Julie Rvee Latosa', 'juliervee123', '$2y$10$SsDfINhNreFgLqtx3ihQtOjMXybdQzjAo3hBzYa.ZKn2.9VG', '', 'julie.rvee123@gmail.com', '09123764578', 'Sta. Cruz, Sorsogon City', '2023-12-16 21:15:27', 'U', 'A'),
(45, 'John Roel Latosa', 'johnlatosa123', '$2y$10$P7UP/LjbvyplGYfn1lUwzumBrIDAIgD53UYH2PXT41R2tIU6', 'johnlatosa123', 'johnroel@gmail.com', '09456765128', 'Sta. Cruz, Sorsogon City', '2023-12-17 14:00:07', 'U', 'A'),
(46, 'David La Sol', 'davidsol123', '$2y$10$yrOqTLc3qBbNbtHefwlKmuEBKfFIc8Gi5GDjgwpvFDD6fMzH', 'davidsol123', 'davidsol123@gmail.com', '09562135123', 'Polangui, Albay', '2023-12-17 14:20:25', 'U', 'A'),
(47, 'Prix Manila', 'prix123', '$2y$10$AHskn0nVL8zkc/DfcWeD1uFasvWizs1IxmrZGdaksDuGErL2', 'iloveyou123', 'prix.manila@gmail.com', '09326512345', 'Centro Occidental, Polangui', '2023-12-17 22:49:40', 'U', 'A'),
(48, 'Conran Florent', 'conran4flo', '$2y$10$jwMaRk4qQYqrASrHjyxKmen9IyAjqRYP7IbiL1LBXgu.5Im6', 'conranflo4', 'conran4florent@gmail.com', '09213143212', 'Bacon District', '2023-12-18 12:59:48', 'U', 'A'),
(49, 'Jenli Tritomo', 'jenli123', '$2y$10$rAtel7ZGfzpxPQNzYujRM.bAXd6LN2M2rP1aaR6mlPr/VKvs', 'jenlitritomo123', 'jenli.tritomo123@gmail.com', '09452761254', 'Basud, Polangui', '2023-12-18 14:23:36', 'U', 'A'),
(50, 'Dos Layuanmoko', 'uno111', '$2y$10$dlK8Sispu8mJKtYC6rZ4TOdw63uVEOvUjHu9723xPFHwt.Xm', 'unobawaldos12', 'dos.layuanmoko@gmail.com', '095445612111', 'Polangui, Albay', '2023-12-18 15:57:47', 'U', 'A'),
(51, 'Liza Soberano', 'AceOfSpades', '$2y$10$9tVpx8HdikFq7PbXoMxjP.6z6Qbf2nc2BVr5PlEa2/zDyqN4', 'lizasoberano123', 'liza.soberano123@gmail.com', '09132532441', 'Taguig', '2023-12-18 20:33:28', 'U', 'A'),
(52, 'Asgard Alaska', 'asgard.alaska123', '$2y$10$OUFMPURM85XKKUhnct.wxupCwcD7/O1FZqf1NPaej800W5jH', 'asgardalaska123', 'asgard.alaska123@gmail.com', '09432412112', 'Legazpi City', '2023-12-23 12:51:00', 'U', 'A'),
(53, 'Liam Williams', 'liam.williams123', 'liamwilliams123', 'liamwilliams123', 'liam@gmail.com', '09641232234', 'Sorsogon City', '2023-12-23 12:55:43', 'U', 'A'),
(54, 'Sanya Encantadia', 'sanya123', 'encantadia12345', 'encantadia12345', 'sanya@gmail.com', '09563421123', 'Polangui, Albay', '2023-12-24 20:37:28', 'U', 'A');

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
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`element_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`step_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `element_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
