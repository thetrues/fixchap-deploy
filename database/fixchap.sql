-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2026 at 09:18 AM
-- Server version: 8.0.46-0ubuntu0.22.04.4
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fixchap`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `activity_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `request_id` int NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `activity_type`, `request_id`, `description`, `created_at`, `updated_at`) VALUES
(22, 2, 'payment_confirmation', 2812, 'Payment confirmed for Request #2812.', '2026-02-18 05:59:05', '2026-02-18 05:59:05'),
(23, 3, 'payment_confirmation', 2860, 'Payment confirmed for Request #2860.', '2026-06-26 08:50:18', '2026-06-26 08:50:18'),
(24, 3, 'payment_confirmation', 2873, 'Payment confirmed for Request #2873.', '2026-08-10 03:52:04', '2026-08-10 03:52:04'),
(25, 3, 'payment_confirmation', 2875, 'Payment confirmed for Request #2875.', '2026-08-10 04:19:00', '2026-08-10 04:19:00'),
(26, 3, 'payment_confirmation', 2876, 'Payment confirmed for Request #2876.', '2026-08-10 04:29:42', '2026-08-10 04:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `geo_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `address_title`, `geo_name`, `latitude`, `longitude`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(67, 124, NULL, 'Chato St, 16-22 Mikocheni, Dar es Salaam', -6.7755666924116, 39.260703027248, 1, '2026-02-18 08:34:50', '2026-02-18 08:34:50', NULL),
(68, 126, NULL, 'DSM, Unnamed Road Segerea, Dar es Salaam', -6.8417305454231, 39.194215759635, 1, '2026-02-22 03:47:22', '2026-02-22 03:47:22', NULL),
(69, 127, NULL, 'DSM, Unnamed Road Kunduchi, Dar es Salaam', -6.6549361756627, 39.190650768578, 1, '2026-02-22 10:51:19', '2026-02-22 10:51:19', NULL),
(70, 129, NULL, 'Unnamed Road Segerea, Dar es Salaam', -6.8434139602469, 39.185783229768, 1, '2026-02-24 20:21:54', '2026-02-24 20:21:54', NULL),
(71, 130, NULL, 'Dodoma, Unnamed Road Makole, Dodoma', -6.1732196544497, 35.758781097829, 1, '2026-02-26 12:14:09', '2026-02-26 12:14:09', NULL),
(72, 131, NULL, 'DSM, Unnamed Road Bunju, Dar es Salaam', -6.6280339877249, 39.165211692452, 1, '2026-02-26 16:47:01', '2026-02-26 16:47:01', NULL),
(73, 4106, 'work', 'Gongo la Mboto, Dar es Salaam, Tanzania', -6.8822828, 39.156355, 1, '2026-03-04 12:30:44', '2026-03-04 12:30:44', NULL),
(74, 129, NULL, 'DSM, Unnamed Road Tabata, Dar es Salaam', -6.8321772120664, 39.221570268273, 1, '2026-03-07 21:10:28', '2026-03-07 21:10:28', NULL),
(75, 135, 'Ruaha Road, House No.18, Kibada, Kigamboni (near St. Joseph Nursery & Primary School)', 'Kongowe Rd Kibada, Dar es Salaam', -6.902158313468, 39.339283704758, 1, '2026-03-12 02:15:49', '2026-03-12 02:15:49', NULL),
(76, 134, NULL, 'A7 Picha Ya Ndege,', -6.7644332333405, 38.952669426799, 1, '2026-03-13 14:13:01', '2026-03-13 14:13:01', NULL),
(77, 4107, 'work', 'Goba, Tanzania', -6.740599899999999, 39.1489979, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(78, 4108, 'work', 'Mabibo Makutano, Dar es Salaam, Tanzania', -6.805590899999999, 39.2258028, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(79, 4109, 'work', 'Mbezi mwisho bus terminal, Dar es Salaam, Tanzania', -6.786849000000001, 39.1118599, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(80, 4110, 'work', 'Mbagala zakhem, Dar es Salaam, Tanzania', -6.9103526, 39.2697344, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(81, 4111, 'work', 'Mikocheni B, Dar es Salaam, Tanzania', -6.755636, 39.2401484, 1, '2026-03-17 07:02:02', '2026-03-17 07:02:02', NULL),
(82, 4112, 'work', 'Mikocheni, Tanzania', -6.7620444, 39.2418168, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(83, 4113, 'work', 'Mbezi Beach, Dar es Salaam, Tanzania', -6.7231131, 39.2299405, 1, '2026-03-17 09:16:56', '2026-03-17 09:16:56', NULL),
(84, 4114, 'work', 'Kipawa, Dar es Salaam, Tanzania', -6.8572967, 39.2110177, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(85, 137, NULL, 'Haile Selassie Rd, 151 Msasani, Dar es Salaam', -6.7653255176347, 39.27460256964, 1, '2026-03-17 18:19:05', '2026-03-17 18:19:05', NULL),
(86, 4115, 'work', 'Kawe, Dar es Salaam, Tanzania', -6.7482674, 39.2419845, 1, '2026-03-18 05:41:58', '2026-03-18 05:41:58', NULL),
(87, 4116, 'work', 'Goba, Tanzania', -6.740599899999999, 39.1489979, 1, '2026-03-18 06:25:04', '2026-03-18 06:25:04', NULL),
(88, 4117, 'work', 'Kariakoo market, Swahili Street, Dar es Salaam, Tanzania', -6.8196612, 39.2750446, 1, '2026-03-18 06:50:35', '2026-03-18 06:50:35', NULL),
(89, 4118, 'work', 'Sinza Mori Road, Dar es Salaam, Tanzania', -6.7769402, 39.228349, 1, '2026-03-18 07:53:30', '2026-03-18 07:53:30', NULL),
(90, 4119, 'work', 'Segerea Prison, Dar es Salaam, Tanzania', -6.8399899, 39.1804755, 1, '2026-03-18 08:25:33', '2026-03-18 08:25:33', NULL),
(91, 4120, 'work', 'Kunduchi, Tanzania', -6.6614771, 39.2003461, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(92, 4121, 'work', 'Buguruni Sheli, Dar es Salaam, Tanzania', -6.8388898, 39.2436506, 1, '2026-03-18 10:48:09', '2026-03-18 10:48:09', NULL),
(93, 4122, 'work', 'Kibamba shule., Dar es Salaam, Tanzania', -6.8136109, 39.1087937, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(94, 4123, 'work', 'Gongo la Mboto, Dar es Salaam, Tanzania', -6.8822828, 39.156355, 1, '2026-03-18 11:44:14', '2026-03-18 11:44:14', NULL),
(95, 4124, 'work', 'Vingunguti, Tanzania', -6.8455021, 39.2250963, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(96, 4125, 'work', 'Kivule fremu kumi, Dar es Salaam, Tanzania', -6.9535654, 39.1776919, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(97, 4126, 'work', 'Sinza Mori Road, Dar es Salaam, Tanzania', -6.7769402, 39.228349, 1, '2026-03-18 14:54:01', '2026-03-18 14:54:01', NULL),
(98, 139, NULL, 'Akachube Rd, 33 Kijitonyama, Dar es Salaam', -6.7812268791003, 39.245438240469, 1, '2026-03-21 11:57:20', '2026-03-21 11:57:20', NULL),
(99, 4127, 'work', 'Tabata, Tanzania', -6.830875, 39.220923, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(100, 4128, 'work', 'Buguruni Sheli, Dar es Salaam, Tanzania', -6.8388898, 39.2436506, 1, '2026-03-23 08:21:21', '2026-03-23 08:21:21', NULL),
(101, 4129, 'work', 'Mbezi Msumi, Mbezi Msumi, Dar es Salaam, Tanzania', -6.7240283, 39.1056452, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(102, 4130, 'work', 'Viwege kwa Mpemba Sokoni, Tanzania', -6.9386755, 39.1471682, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(103, 4131, 'work', 'Gongo la Mboto, Dar es Salaam, Tanzania', -6.8822828, 39.156355, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(104, 4132, 'work', 'Mbagala rangi tatu, Tanzania', -6.9319301, 39.25568190000001, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(105, 4133, 'work', 'Manzese, Tanzania', -6.7971123, 39.2336791, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(106, 4134, 'work', 'Mbezi Mwisho Old / Stendi ya Makabe / Kinyerezi, Mbezi Mwisho Bus Stop, Dar es Salaam, Tanzania', -6.786992499999999, 39.1123574, 1, '2026-03-25 09:59:14', '2026-03-25 09:59:14', NULL),
(107, 141, NULL, 'Samora Ave, Nnamdi Azikiwe Ave Kisutu, Dar es Salaam', -6.8165052442373, 39.289436861873, 1, '2026-03-25 12:01:15', '2026-03-25 12:01:15', NULL),
(108, 141, NULL, 'Unnamed Road Kerege,', -6.5871931827907, 39.059421680868, 1, '2026-03-25 12:03:28', '2026-03-25 12:03:28', NULL),
(109, 4135, 'work', 'Mikocheni B, Dar es Salaam, Tanzania', -6.755636, 39.2401484, 1, '2026-03-25 12:56:19', '2026-03-25 12:56:19', NULL),
(110, 4136, 'work', 'Mbagala zakhem, Dar es Salaam, Tanzania', -6.9103526, 39.2697344, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(111, 4137, 'work', 'Mbagala zakhem, Dar es Salaam, Tanzania', -6.9103526, 39.2697344, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(112, 147, NULL, 'Chato St, 16-22 Mikocheni, Dar es Salaam', -6.7755666924116, 39.260703027248, 1, '2026-04-02 11:26:22', '2026-04-02 11:26:22', NULL),
(113, 149, NULL, 'Mnadazagawa St, 3 Kawe, Dar es Salaam', -6.7244249111424, 39.214712530375, 1, '2026-04-15 08:09:23', '2026-04-15 08:09:23', NULL),
(114, 124, NULL, 'A7, A7 Ubungo, Dar es Salaam', -6.7917303926556, 39.20686237514, 1, '2026-04-16 11:21:51', '2026-04-16 11:21:51', NULL),
(115, 150, NULL, 'Mbezi Beach B, Unnamed Road Kawe, Dar es Salaam', -6.7055917801411, 39.215234555304, 1, '2026-04-20 09:00:39', '2026-04-20 09:00:39', NULL),
(116, 4138, 'work', 'Chanika, Dar es Salaam, Tanzania', -6.8197008, 39.2730602, 1, '2026-04-22 12:03:26', '2026-04-22 12:03:26', NULL),
(117, 151, NULL, 'Beach Street, 31-29 ,', -6.7188599566395, 39.234813675284, 1, '2026-04-22 19:11:58', '2026-04-22 19:11:58', NULL),
(118, 4139, 'work', 'Yombo Vituka, Dar es Salaam, Tanzania', -6.8498522, 39.2453435, 1, '2026-04-29 08:27:38', '2026-04-29 08:27:38', NULL),
(119, 153, NULL, 'Senga Rd, 25 Mikocheni, Dar es Salaam', -6.768363600117, 39.250567629933, 1, '2026-05-02 18:06:19', '2026-05-02 18:06:19', NULL),
(120, 4140, 'work', 'Magomeni, Dar es Salaam, Tanzania', -6.8107874, 39.2596277, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(121, 161, NULL, 'Mori St, 68-52 Sinza, Dar es Salaam', -6.7760614328669, 39.226228930056, 1, '2026-05-19 16:18:29', NULL, NULL),
(122, 4141, 'work', 'Sinza, Tanzania', -6.786459300000001, 39.2230125, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(123, 4142, 'work', 'Segerea Prison, Dar es Salaam, Tanzania', -6.8399899, 39.1804755, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(124, 167, NULL, 'CocaCola Rd, Bagamoyo Rd Mikocheni, Dar es Salaam', -6.7644249097852, 39.229606837034, 1, '2026-06-29 18:32:48', '2026-06-29 18:32:48', NULL),
(125, 168, NULL, 'Ally Sykes road, Mwai Kibaki Rd Kawe, Dar es Salaam', -6.7231130087415, 39.22994043678, 1, '2026-07-06 04:00:15', '2026-07-06 04:00:15', NULL),
(126, 4143, 'work', 'Kijitonyama, Tanzania', -6.7742732, 39.2334023, 1, '2026-07-14 14:58:48', '2026-07-14 14:58:48', NULL),
(127, 173, NULL, 'Santiago Chile St, Almasi Road Kawe, Dar es Salaam', -6.7196108113353, 39.225968420506, 1, '2026-07-19 13:35:22', '2026-07-19 13:35:22', NULL),
(128, 177, NULL, 'Mpakani Road, Mpakani Road Goba, Dar es Salaam', -6.7292775873598, 39.179154150188, 1, '2026-07-23 07:27:53', '2026-07-23 07:27:53', NULL),
(129, 157, NULL, 'DSM, Unnamed Road Mjimwema, Dar es Salaam', -6.8390058442317, 39.339560978115, 1, '2026-08-02 09:45:31', '2026-08-02 09:45:31', NULL),
(130, 4144, 'work', 'Africana Bus stop, Dar es Salaam, Tanzania', -6.703367999999999, 39.2077938, 1, '2026-08-02 10:15:49', '2026-08-02 10:15:49', NULL),
(131, 178, NULL, 'Mwinyijuma Rd, Igusure St Mwananyamala, Dar es Salaam', -6.7887287463162, 39.256609976292, 1, '2026-08-03 19:08:49', '2026-08-03 19:08:49', NULL),
(132, 129, NULL, 'Morogoro, A7 Kichangani, Morogoro', -6.803063635969, 37.680517472327, 1, '2026-08-04 07:21:21', '2026-08-04 07:21:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int NOT NULL,
  `asset_desc` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `request_id` int DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`id`, `asset_desc`, `file_name`, `request_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'REQUEST_DESC', 'rqs2622-171195941670.jpg', 2622, 1, '2024-04-01 11:16:56', NULL),
(2, 'REQUEST_DESC', 'rqs2626-171336054484.jpg', 2626, 1, '2024-04-17 16:29:04', NULL),
(3, 'REQUEST_DESC', 'rqs2627-171411500665.jpg', 2627, 1, '2024-04-26 10:03:26', NULL),
(4, 'REQUEST_DESC', 'rqs2628-171411746233.jpg', 2628, 1, '2024-04-26 10:44:22', NULL),
(5, 'REQUEST_DESC', 'rqs2630-172616741599.jpg', 2630, 1, '2024-09-12 21:56:55', NULL),
(6, 'REQUEST_DESC', 'rqs2631-172616828842.jpg', 2631, 1, '2024-09-12 22:11:28', NULL),
(7, 'REQUEST_DESC', 'rqs2632-172616910188.jpg', 2632, 1, '2024-09-12 22:25:01', NULL),
(8, 'REQUEST_DESC', 'rqs-172949276148.jpg', NULL, 1, '2024-10-21 09:39:21', NULL),
(9, 'REQUEST_DESC', 'rqs-172949285587.jpg', NULL, 1, '2024-10-21 09:40:55', NULL),
(10, 'REQUEST_DESC', 'rqs2640-172997272657.jpg', 2640, 1, '2024-10-26 22:58:46', NULL),
(11, 'REQUEST_DESC', 'rqs2644-173364915442.jpg', 2644, 1, '2024-12-08 12:12:34', NULL),
(12, 'REQUEST_DESC', 'rqs2664-173955283519.jpg', 2664, 1, '2025-02-14 20:07:15', NULL),
(13, 'REQUEST_DESC', 'rqs2665-173979351837.jpg', 2665, 1, '2025-02-17 14:58:38', NULL),
(14, 'REQUEST_DESC', 'rqs-173979510574.jpg', NULL, 1, '2025-02-17 12:25:05', '2025-02-17 09:25:05'),
(15, 'REQUEST_DESC', 'rqs-174012015095.jpg', NULL, 1, '2025-02-21 06:42:30', '2025-02-21 03:42:30'),
(16, 'REQUEST_DESC', 'rqs-174144538926.jpg', NULL, 1, '2025-03-08 14:49:49', '2025-03-08 11:49:49'),
(17, 'REQUEST_DESC', 'rqs-174160089585.jpg', NULL, 1, '2025-03-10 10:01:35', '2025-03-10 07:01:35'),
(18, 'REQUEST_DESC', 'rqs2673-174188396158.jpg', 2673, 1, '2025-03-13 19:39:21', NULL),
(19, 'REQUEST_DESC', 'rqs-174469203718.jpg', NULL, 1, '2025-04-15 04:40:37', '2025-04-15 01:40:37'),
(20, 'REQUEST_DESC', 'rqs-174656344496.jpg', NULL, 1, '2025-05-06 20:30:44', '2025-05-06 17:30:44'),
(21, 'REQUEST_DESC', 'rqs-174740725538.jpg', NULL, 1, '2025-05-16 14:54:15', '2025-05-16 11:54:15'),
(22, 'REQUEST_DESC', 'rqs2728-175100878274.jpg', 2728, 1, '2025-06-27 10:19:42', NULL),
(23, 'REQUEST_DESC', 'rqs2733-175102856218.jpg', 2733, 1, '2025-06-27 15:49:22', NULL),
(24, 'REQUEST_DESC', 'rqs-175103797012.jpg', NULL, 1, '2025-06-27 15:26:10', '2025-06-27 12:26:10'),
(25, 'REQUEST_DESC', 'rqs-175972462919.jpg', NULL, 1, '2025-10-06 04:23:49', '2025-10-06 01:23:49'),
(26, 'REQUEST_DESC', 'rqs-175972540564.jpg', NULL, 1, '2025-10-06 04:36:45', '2025-10-06 01:36:45'),
(27, 'REQUEST_DESC', 'rqs-175972581018.jpg', NULL, 1, '2025-10-06 04:43:30', '2025-10-06 01:43:30'),
(28, 'REQUEST_DESC', 'rqs-175972706694.jpg', NULL, 1, '2025-10-06 05:04:26', '2025-10-06 02:04:26'),
(29, 'REQUEST_DESC', 'rqs-176146525997.jpg', NULL, 1, '2025-10-26 07:54:19', '2025-10-26 04:54:19'),
(30, 'REQUEST_DESC', 'rqs-176172196224.jpg', NULL, 1, '2025-10-29 07:12:42', '2025-10-29 04:12:42'),
(31, 'REQUEST_DESC', 'rqs-176319329734.jpg', NULL, 1, '2025-11-15 07:54:57', '2025-11-15 04:54:57'),
(32, 'REQUEST_DESC', 'rqs-176374731920.jpg', NULL, 1, '2025-11-21 17:48:39', '2025-11-21 14:48:39'),
(33, 'REQUEST_DESC', 'rqs-176374812963.jpg', NULL, 1, '2025-11-21 18:02:09', '2025-11-21 15:02:09'),
(34, 'REQUEST_DESC', 'rqs-176374856423.jpg', NULL, 1, '2025-11-21 18:09:24', '2025-11-21 15:09:24'),
(35, 'REQUEST_DESC', 'rqs-176426256236.jpg', NULL, 1, '2025-11-27 16:56:02', '2025-11-27 13:56:02'),
(36, 'REQUEST_DESC', 'rqs-176475848578.jpg', NULL, 1, '2025-12-03 10:41:25', '2025-12-03 07:41:25'),
(37, 'REQUEST_DESC', 'rqs-176702453211.jpg', NULL, 1, '2025-12-29 16:08:52', '2025-12-29 13:08:52'),
(38, 'REQUEST_DESC', 'rqs-176813857799.jpg', NULL, 1, '2026-01-11 13:36:17', '2026-01-11 10:36:17'),
(39, 'REQUEST_DESC', 'rqs-176963195515.jpg', NULL, 1, '2026-01-28 20:25:55', '2026-01-28 17:25:55'),
(40, 'REQUEST_DESC', 'rqs-177083909872.jpg', NULL, 1, '2026-02-11 19:44:58', '2026-02-11 16:44:58'),
(41, 'REQUEST_DESC', 'rqs-177140369043.jpg', NULL, 1, '2026-02-18 08:34:50', '2026-02-18 05:34:50'),
(42, 'REQUEST_DESC', 'rqs-177140486852.jpg', NULL, 1, '2026-02-18 08:54:28', '2026-02-18 05:54:28'),
(43, 'REQUEST_DESC', 'rqs-177140713369.jpg', NULL, 1, '2026-02-18 09:32:13', '2026-02-18 06:32:13'),
(44, 'REQUEST_DESC', 'rqs-177173204345.jpg', NULL, 1, '2026-02-22 03:47:23', '2026-02-22 00:47:23'),
(45, 'REQUEST_DESC', 'rqs-177364229417.jpg', NULL, 1, '2026-03-16 06:24:54', '2026-03-16 03:24:54'),
(46, 'REQUEST_DESC', 'rqs-177409424083.jpg', NULL, 1, '2026-03-21 11:57:20', '2026-03-21 08:57:20'),
(47, 'REQUEST_DESC', 'rqs-177444007593.jpg', NULL, 1, '2026-03-25 12:01:15', '2026-03-25 09:01:15'),
(48, 'REQUEST_DESC', 'rqs-177444007557.jpg', NULL, 1, '2026-03-25 12:01:15', '2026-03-25 09:01:15'),
(49, 'REQUEST_DESC', 'rqs-177444020886.jpg', NULL, 1, '2026-03-25 12:03:28', '2026-03-25 09:03:28'),
(50, 'REQUEST_DESC', 'rqs-177688511888.jpg', NULL, 1, '2026-04-22 19:11:58', '2026-04-22 16:11:58'),
(51, 'REQUEST_DESC', 'rqs-177935311170.jpg', NULL, 1, '2026-05-21 08:45:11', '2026-05-21 05:45:11'),
(52, 'REQUEST_DESC', 'rqs-178049497837.jpg', NULL, 1, '2026-06-03 13:56:18', '2026-06-03 10:56:18'),
(53, 'REQUEST_DESC', 'rqs-178049735070.jpg', NULL, 1, '2026-06-03 14:35:50', '2026-06-03 11:35:50'),
(54, 'REQUEST_DESC', 'rqs-178116713626.jpg', NULL, 1, '2026-06-11 08:38:56', '2026-06-11 05:38:56'),
(55, 'REQUEST_DESC', 'rqs-178170600092.jpg', 2858, 1, '2026-06-17 14:20:00', '2026-06-17 11:20:00'),
(56, 'REQUEST_DESC', 'rqs-178170706655.jpg', 2859, 1, '2026-06-17 14:37:46', '2026-06-17 11:37:46'),
(57, 'REQUEST_DESC', 'rqs-178247395842.jpg', 2860, 1, '2026-06-26 11:39:18', '2026-06-26 08:39:18'),
(58, 'REQUEST_DESC', 'rqs-178298241982.jpg', 2862, 1, '2026-07-02 08:53:40', '2026-07-02 05:53:40'),
(59, 'REQUEST_DESC', 'rqs-178479167341.jpg', 2868, 1, '2026-07-23 07:27:53', '2026-07-23 04:27:53'),
(60, 'REQUEST_DESC', 'rqs-178634397793.jpg', 2873, 1, '2026-08-10 06:39:37', '2026-08-10 03:39:37'),
(61, 'REQUEST_DESC', 'rqs-178634718528.jpg', 2877, 1, '2026-08-10 07:33:05', '2026-08-10 04:33:05'),
(62, 'REQUEST_DESC', 'rqs-178634718525.jpg', 2877, 1, '2026-08-10 07:33:05', '2026-08-10 04:33:05'),
(63, 'REQUEST_DESC', 'rqs-178894610567.jpg', 2880, 1, '2026-09-09 09:28:25', '2026-09-09 06:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `altenative_mobile` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_services`
--

CREATE TABLE `company_services` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `service_id` int NOT NULL,
  `created_at` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `handyman`
--

CREATE TABLE `handyman` (
  `id` int NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `hanyman_desc_id` int DEFAULT NULL,
  `services` text COLLATE utf8mb4_general_ci,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handyman`
--

INSERT INTO `handyman` (`id`, `tag`, `hanyman_desc_id`, `services`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4104, '255749795987', 8, '[\"Electrical\",\"Satellite Dish\",\"Air Condition (AC)\",\"CCTV Camera\",\"Computer Repair\",\"macOS\"]', 1, '2026-02-17 14:36:46', '2026-07-24 12:24:20', NULL),
(4105, '255686770012', 9, '[\"Electrical\",\"Air Condition (AC)\",\"Pressure Cookers (EPCs)\"]', 1, '2026-02-17 17:15:22', '2026-04-16 11:23:13', NULL),
(4106, '255628025165', 10, '[\"Electrical\"]', 1, '2026-03-04 12:30:44', '2026-03-04 12:30:44', NULL),
(4107, '255674838856', 11, '[\"Computer Repair\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\",\"Electrical\",\"Satellite Dish\"]', 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(4108, '255786061217', 12, '[\"Induction Stoves\",\"Air Fryers\",\"Pressure Cookers (EPCs)\",\"Rice Cooker\"]', 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(4109, '255756051056', 13, '[\"Induction Stoves\",\"Air Fryers\",\"Pressure Cookers (EPCs)\",\"Rice Cooker\",\"Electrical\"]', 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(4110, '255656901661', 14, '[\"Induction Stoves\",\"Air Fryers\",\"Pressure Cookers (EPCs)\",\"Rice Cooker\"]', 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(4111, '255785613027', 15, '[\"Air Fryers\",\"Induction Stoves\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\",\"CCTV Camera\"]', 1, '2026-03-17 07:02:01', '2026-03-18 07:19:38', NULL),
(4112, '255781386814', 16, '[\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\"]', 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(4113, '255713978820', 17, '[\"Plumbing\"]', 1, '2026-03-17 09:16:56', '2026-03-17 09:16:56', NULL),
(4114, '255719592388', 18, '[\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\"]', 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(4115, '255676447255', 19, '[\"Painting\"]', 1, '2026-03-18 05:41:58', '2026-03-18 05:41:58', NULL),
(4116, '255654780764', 20, '[\"Fridge\",\"Air Condition (AC)\"]', 1, '2026-03-18 06:25:03', '2026-03-18 06:25:03', NULL),
(4117, '255659849909', 21, '[\"Fridge\",\"Air Condition (AC)\"]', 1, '2026-03-18 06:50:35', '2026-03-18 06:50:35', NULL),
(4118, '255687477067', 22, '[\"Plumbing\"]', 1, '2026-03-18 07:53:30', '2026-03-18 07:53:30', NULL),
(4119, '255612985885', 23, '[\"Electrical\"]', 1, '2026-03-18 08:25:33', '2026-03-18 08:25:33', NULL),
(4120, '255777103922', 24, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(4121, '255659793873', 25, '[\"Plumbing\"]', 1, '2026-03-18 10:48:08', '2026-03-18 10:48:09', NULL),
(4122, '255672059772', 26, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(4123, '255778206741', 27, '[\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\",\"Electrical\"]', 1, '2026-03-18 11:44:13', '2026-05-05 12:04:38', NULL),
(4124, '255619443244', 28, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(4125, '255621226614', 29, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(4126, '255753772480', 30, '[\"Plumbing\"]', 1, '2026-03-18 14:54:01', '2026-03-18 14:54:01', NULL),
(4127, '255716732427', 31, '[\"Pressure Cookers (EPCs)\",\"Computer Repair\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(4128, '255783032949', 32, '[\"Air Condition (AC)\"]', 1, '2026-03-23 08:21:21', '2026-03-23 08:21:21', NULL),
(4129, '255744842247', 33, '[\"Electrical\",\"Air Fryers\",\"Rice Cooker\",\"Induction Stoves\",\"Pressure Cookers (EPCs)\"]', 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(4130, '255624519605', 34, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(4131, '255626950010', 35, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Electrical\",\"CCTV Camera\"]', 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(4132, '255682965032', 36, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-24 10:01:56', '2026-03-24 10:01:57', NULL),
(4133, '255693141490', 37, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(4134, '255684010212', 38, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\",\"Electrical\"]', 1, '2026-03-25 09:59:14', '2026-03-25 10:18:48', NULL),
(4135, '255754492120', 39, '[\"Electrical\",\"Air Condition (AC)\"]', 1, '2026-03-25 12:56:19', '2026-03-25 12:56:19', NULL),
(4136, '255787750459', 40, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(4137, '255653646690', 41, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(4138, '255786296197', 42, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Air Fryers\",\"Rice Cooker\",\"Induction Stoves\"]', 1, '2026-04-22 12:03:26', '2026-04-22 12:03:26', NULL),
(4139, '255625848473', 43, '[\"Pressure Cookers (EPCs)\",\"Rice Cooker\",\"Induction Stoves\",\"Air Fryers\",\"Electrical\"]', 1, '2026-04-29 08:27:38', '2026-06-30 05:56:34', NULL),
(4140, '255755508338', 44, '[\"Electrical\",\"Air Fryers\",\"Induction Stoves\",\"Rice Cooker\",\"Pressure Cookers (EPCs)\"]', 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(4141, '255746254117', 45, '[\"Electrical\",\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(4142, '255785176699', 46, '[\"Pressure Cookers (EPCs)\",\"Induction Stoves\",\"Air Fryers\",\"Rice Cooker\"]', 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(4143, '255782248388', 47, '[\"Carpentry\"]', 1, '2026-07-14 14:58:48', '2026-07-14 14:58:48', NULL),
(4144, '255789664113', 48, '[\"Air Condition (AC)\"]', 1, '2026-08-02 10:15:49', '2026-08-02 10:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `handyman_availability`
--

CREATE TABLE `handyman_availability` (
  `id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handyman_availability`
--

INSERT INTO `handyman_availability` (`id`, `handyman_id`, `status_id`, `created_at`, `updated_at`) VALUES
(56, 4104, 1, '2026-02-17 14:36:46', '2026-02-17 11:36:46'),
(57, 4105, 1, '2026-02-17 17:15:22', '2026-02-17 14:15:22'),
(58, 4106, 1, '2026-03-04 12:30:44', '2026-03-04 09:30:44'),
(59, 4107, 1, '2026-03-16 07:28:42', '2026-03-16 04:28:42'),
(60, 4108, 1, '2026-03-16 07:40:21', '2026-03-16 04:40:21'),
(61, 4109, 1, '2026-03-16 10:29:17', '2026-03-16 07:29:17'),
(62, 4110, 1, '2026-03-16 11:20:23', '2026-03-16 08:20:23'),
(63, 4111, 1, '2026-03-17 07:02:02', '2026-03-17 04:02:02'),
(64, 4112, 1, '2026-03-17 07:09:18', '2026-03-17 04:09:18'),
(65, 4113, 1, '2026-03-17 09:16:56', '2026-03-17 06:16:56'),
(66, 4114, 1, '2026-03-17 11:35:13', '2026-03-17 08:35:13'),
(67, 4115, 1, '2026-03-18 05:41:58', '2026-03-18 02:41:58'),
(68, 4116, 1, '2026-03-18 06:25:04', '2026-03-18 03:25:04'),
(69, 4117, 1, '2026-03-18 06:50:35', '2026-03-18 03:50:35'),
(70, 4118, 1, '2026-03-18 07:53:30', '2026-03-18 04:53:30'),
(71, 4119, 1, '2026-03-18 08:25:33', '2026-03-18 05:25:33'),
(72, 4120, 1, '2026-03-18 08:40:13', '2026-03-18 05:40:13'),
(73, 4121, 1, '2026-03-18 10:48:09', '2026-03-18 07:48:09'),
(74, 4122, 1, '2026-03-18 11:35:46', '2026-03-18 08:35:46'),
(75, 4123, 1, '2026-03-18 11:44:14', '2026-03-18 08:44:14'),
(76, 4124, 1, '2026-03-18 11:52:56', '2026-03-18 08:52:56'),
(77, 4125, 1, '2026-03-18 13:10:53', '2026-03-18 10:10:53'),
(78, 4126, 1, '2026-03-18 14:54:01', '2026-03-18 11:54:01'),
(79, 4127, 1, '2026-03-23 07:01:12', '2026-03-23 04:01:12'),
(80, 4128, 1, '2026-03-23 08:21:21', '2026-03-23 05:21:21'),
(81, 4129, 1, '2026-03-23 10:48:09', '2026-03-23 07:48:09'),
(82, 4130, 1, '2026-03-24 08:55:08', '2026-03-24 05:55:08'),
(83, 4131, 1, '2026-03-24 09:03:48', '2026-03-24 06:03:48'),
(84, 4132, 1, '2026-03-24 10:01:57', '2026-03-24 07:01:57'),
(85, 4133, 1, '2026-03-25 09:50:44', '2026-03-25 06:50:44'),
(86, 4134, 1, '2026-03-25 09:59:14', '2026-03-25 06:59:14'),
(87, 4135, 1, '2026-03-25 12:56:19', '2026-03-25 09:56:19'),
(88, 4135, 1, '2026-03-25 14:31:53', '2026-03-25 11:31:53'),
(89, 4136, 1, '2026-04-01 08:11:26', '2026-04-01 05:11:26'),
(90, 4137, 1, '2026-04-01 08:22:23', '2026-04-01 05:22:23'),
(91, 4135, 1, '2026-04-20 09:04:46', '2026-04-20 06:04:46'),
(92, 4138, 1, '2026-04-22 12:03:26', '2026-04-22 09:03:26'),
(93, 4139, 1, '2026-04-29 08:27:38', '2026-04-29 05:27:38'),
(94, 4140, 1, '2026-05-12 10:21:29', '2026-05-12 07:21:29'),
(95, 4141, 1, '2026-05-20 11:33:21', '2026-05-20 08:33:21'),
(96, 4142, 1, '2026-05-20 11:38:58', '2026-05-20 08:38:58'),
(97, 4143, 1, '2026-07-14 14:58:48', '2026-07-14 11:58:48'),
(98, 4144, 1, '2026-08-02 10:15:49', '2026-08-02 07:15:49'),
(99, 4113, 1, '2026-08-24 05:34:41', '2026-08-24 02:34:41');

-- --------------------------------------------------------

--
-- Table structure for table `handyman_desc`
--

CREATE TABLE `handyman_desc` (
  `id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middlename` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alternative_mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handyman_desc`
--

INSERT INTO `handyman_desc` (`id`, `handyman_id`, `mobile`, `firstname`, `middlename`, `lastname`, `alternative_mobile`, `email`, `gender`, `profile_photo`, `birthdate`, `address`, `latitude`, `longitude`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 4104, '255749795987', 'Samweli', 'Adballah', 'Abdallah', '0712395987', 'salimu12@gmailcom', 'Male', '1771339006.png', '1992-01-12', '569C+J9V, Dar es Salaam, Tanzania', -6.830875, 39.220923, 1, '2026-02-17 14:36:46', '2026-07-24 12:24:20', NULL),
(9, 4105, '255686770012', 'Prince', 'Prosper', 'Chila', '255686770012', 'tillyaprince@gmail.com', 'Male', '1773928025.jpeg', '1991-08-01', 'Mikocheni, Dar es Salaam, Tanzania', -6.7620444, 39.2418168, 1, '2026-02-17 17:15:22', '2026-04-16 11:23:13', NULL),
(10, 4106, '255628025165', 'Boazi', 'Richard', 'Mpema', NULL, 'mpemaboazi002@gmail.com', 'male', '1772627586.jpg', '2000-01-02', NULL, NULL, NULL, 1, '2026-03-04 12:30:44', '2026-03-04 12:33:06', NULL),
(11, 4107, '255674838856', 'Raphael', 'Frank', 'Idava', '255622513537', 'raphaelyibura486@gmail.com', 'male', '1773646122.jpg', '1997-06-27', NULL, NULL, NULL, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(12, 4108, '255786061217', 'Mwanaisha', 'Athumani', 'Mchaga', '255797862040', 'ishermchaga@gmail.com', 'female', '1773646821.jpg', '1999-12-15', NULL, NULL, NULL, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(13, 4109, '255756051056', 'Edwin', 'Edward', 'Mayani', NULL, 'edwinmayani@gmail.com', 'male', '1773656957.jpg', '2003-05-15', NULL, NULL, NULL, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(14, 4110, '255656901661', 'Mossi', 'Iddi', 'Umande', NULL, 'moshiumande@gmail.com', 'male', '1773660023.jpg', '1988-06-25', NULL, NULL, NULL, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(15, 4111, '255785613027', 'Edward', 'Michael', 'Mhina', '255750613027', 'eddymhina9@gmail.com', 'Male', '1773818378.jpeg', '1995-11-15', NULL, -6.7736667, 39.276505, 1, '2026-03-17 07:02:01', '2026-03-18 07:19:38', NULL),
(16, 4112, '255781386814', 'Krizant', 'Philimon', 'Abel', NULL, 'krizantabel99@gmail.com', 'male', '1773731358.jpg', '2003-07-14', NULL, NULL, NULL, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(17, 4113, '255713978820', 'Othuman', 'Juma', 'Mgate', NULL, 'info@fixchap.co.tz', 'Male', '1773739693.jpeg', '1994-12-12', NULL, -6.7231131, 39.2299405, 1, '2026-03-17 09:16:56', '2026-03-17 09:28:13', NULL),
(18, 4114, '255719592388', 'Jackson', 'Richard', 'Tesha', '255788078493', 'richtesh@gmail.com', 'male', '1773747313.jpg', '1990-04-24', NULL, NULL, NULL, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(19, 4115, '255676447255', 'Musa', 'Adam', 'James', '255694694671', 'musajames992@gmail.com', 'male', '1773812518.jpg', '1984-10-14', NULL, NULL, NULL, 1, '2026-03-18 05:41:58', '2026-03-18 05:41:58', NULL),
(20, 4116, '255654780764', 'Alexzandra', 'Boniphace', 'Shiyo', '255680212206', 'alexshiyo55@gmail.com', 'male', '1773815103.jpg', '1999-02-19', NULL, NULL, NULL, 1, '2026-03-18 06:25:03', '2026-03-18 06:25:03', NULL),
(21, 4117, '255659849909', 'Ramadhani', 'Iddi', 'Ramadhani', '255628373427', 'ramadhaniddi7@gmail.com', 'male', '1773816635.jpg', '1994-10-02', NULL, NULL, NULL, 1, '2026-03-18 06:50:35', '2026-03-18 06:50:35', NULL),
(22, 4118, '255687477067', 'Sadick', 'Shaibu', 'Mtambalike', '255716164667', 'info@fixchap.co.tz', 'male', '1773820410.jpg', '1989-03-13', NULL, NULL, NULL, 1, '2026-03-18 07:53:30', '2026-03-18 07:53:30', NULL),
(23, 4119, '255612985885', 'Jordan', 'Oscar', 'Mandary', '255693461127', 'jmendezi835@gmail.com', 'male', '1773822333.jpg', '2002-03-02', NULL, NULL, NULL, 1, '2026-03-18 08:25:33', '2026-03-18 08:25:33', NULL),
(24, 4120, '255777103922', 'Zulfa', 'Mussa', 'Kuyonga', NULL, 'zulfakuyonga@gmail.com', 'female', '1773823213.jpg', '1997-10-12', NULL, NULL, NULL, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(25, 4121, '255659793873', 'Ramadhani', 'Abdallah', 'Chanzi', '255692458435', 'info@fixchap.co.tz', 'male', '1773830888.jpg', '1987-01-12', NULL, NULL, NULL, 1, '2026-03-18 10:48:09', '2026-03-18 10:48:09', NULL),
(26, 4122, '255672059772', 'Jafari', 'Seif', 'Ramadhani', NULL, 'seifjafari53@gmail.com', 'male', '1773833746.jpg', '1997-07-07', NULL, NULL, NULL, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(27, 4123, '255778206741', 'Nadya', 'Mzafalu', 'Njoki', NULL, 'nmzafalu@gmail.com', 'Female', '1777982678.jpeg', '2004-02-13', 'Gongo la Mboto, Dar es Salaam, Tanzania', -6.8822828, 39.156355, 1, '2026-03-18 11:44:13', '2026-05-05 12:04:38', NULL),
(28, 4124, '255619443244', 'Ismail', 'Iddi', 'Magenge', NULL, 'ismailmagenge@gmail.com', 'male', '1773834776.jpg', '1995-01-24', NULL, NULL, NULL, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(29, 4125, '255621226614', 'Hemedi', 'Kachea', 'Alex', NULL, 'hemedialex@gmail.com', 'male', '1773839453.jpg', '1999-05-07', NULL, NULL, NULL, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(30, 4126, '255753772480', 'Geofrey', 'Nestory', 'Kapaya', '255686331320', 'info@fixchap.co.tz', 'male', '1773845641.jpg', '1985-06-17', NULL, NULL, NULL, 1, '2026-03-18 14:54:01', '2026-03-18 14:54:01', NULL),
(31, 4127, '255716732427', 'Epifania', 'Hipolite', 'Shayo', '255674304184', 'shayoepi@gmail.com', 'female', '1774249272.jpg', '1987-01-06', NULL, NULL, NULL, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(32, 4128, '255783032949', 'Lugomba', 'Shabani', 'Makumbuli', '255714958850', 'info@fixchap.co.tz', 'Male', '1774254182.jpeg', '1980-01-15', NULL, -6.8388898, 39.2436506, 1, '2026-03-23 08:21:21', '2026-03-23 08:23:02', NULL),
(33, 4129, '255744842247', 'Speratus', 'Sparon', 'Rugarabamu', NULL, 'tibagirwage1989@gmail.com', 'male', '1774262889.jpg', '1989-11-26', NULL, NULL, NULL, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(34, 4130, '255624519605', 'Edwin', 'Daniel', 'Makwago', NULL, 'yourkidd@gmail.com', 'male', '1774342508.jpg', '2000-07-01', NULL, NULL, NULL, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(35, 4131, '255626950010', 'Eliud', 'Modest', 'Timotheo', NULL, 'eliudtimothy840@gmail.com', 'male', '1774343028.jpg', '1995-12-29', NULL, NULL, NULL, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(36, 4132, '255682965032', 'Isihaka', 'Abeid', 'Mussa', NULL, 'isackmussa4@iclould.com', 'male', '1774346516.jpg', '2002-11-18', NULL, NULL, NULL, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(37, 4133, '255693141490', 'Zahara', 'Hussein', 'Kingalu', NULL, NULL, 'female', '1774432244.jpg', '1994-05-27', 'Manzese, Tanzania', -6.7971123, 39.2336791, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(38, 4134, '255684010212', 'Shafii', 'Salehe', 'Minangu', NULL, 'minangushafii@gmail.com', 'Male', '1774433928.jpeg', '2004-07-24', 'Mbezi Mwisho Old / Stendi ya Makabe / Kinyerezi, Mbezi Mwisho Bus Stop, Dar es Salaam, Tanzania', -6.786992499999999, 39.1123574, 1, '2026-03-25 09:59:14', '2026-03-25 10:18:48', NULL),
(39, 4135, '255754492120', 'Jele', 'Sadock', 'Kisoli', '255659188642', 'info@fixchap.co.tz', 'Male', '1774443415.jpeg', '1991-01-01', 'Mikocheni B, Dar es Salaam, Tanzania', -6.755636, 39.2401484, 1, '2026-03-25 12:56:19', '2026-03-25 12:56:55', NULL),
(40, 4136, '255787750459', 'Hashimu', 'Ally', 'Machela', NULL, 'hashimually1998@gmail.com', 'male', '1775031085.jpg', '1998-05-05', 'Mbagala zakhem, Dar es Salaam, Tanzania', -6.9103526, 39.2697344, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(41, 4137, '255653646690', 'Sande', 'Agustino', 'Nchimbi', NULL, NULL, 'male', '1775031743.jpg', '1996-07-26', 'Mbagala zakhem, Dar es Salaam, Tanzania', -6.9103526, 39.2697344, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(42, 4138, '255786296197', 'Msalo', 'Erasto', 'Mtigandi', NULL, 'msaromtigandi4@gmail.com', 'Male', '1776942483.jpeg', '2001-02-05', 'Chanika, Dar es Salaam, Tanzania', -6.8197008, 39.2730602, 1, '2026-04-22 12:03:26', '2026-04-23 11:08:03', NULL),
(43, 4139, '255625848473', 'Amani', 'Aron', 'Shimwela', '255676345586', 'zedonynyangwe@gmail.com', 'Male', '1777451258.jpg', '1984-07-29', 'Yombo Vituka, Dar es Salaam, Tanzania', -6.8498522, 39.2453435, 1, '2026-04-29 08:27:38', '2026-05-05 09:59:42', NULL),
(44, 4140, '255755508338', 'NURU', 'YUSUPH', 'SELEMAN', '255755508338', 'lightseleman1994@gmail.com', 'female', '1778581289.jpg', '1994-11-29', 'Magomeni, Dar es Salaam, Tanzania', -6.8107874, 39.2596277, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(45, 4141, '255746254117', 'PIUS', 'BAHATI', 'JOVIN', '255787368073', 'bahatipius830@gmail.com', 'male', '1779276801.jpg', '1996-04-20', 'Sinza, Tanzania', -6.786459300000001, 39.2230125, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(46, 4142, '255785176699', 'LILIAN', 'CLEMENT', 'MAKONO', '255785176699', 'lilianmakono8@gmail.com', 'female', '1779277138.jpg', '2000-05-15', 'Segerea Prison, Dar es Salaam, Tanzania', -6.8399899, 39.1804755, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(47, 4143, '255782248388', 'Abdallah', 'Sheiza', 'Sheiza', '255719549599', 'info@fixchap.co.tz', 'male', '1784041128.jpg', '1981-03-21', 'Kijitonyama, Tanzania', -6.7742732, 39.2334023, 1, '2026-07-14 14:58:48', '2026-07-14 14:58:48', NULL),
(48, 4144, '255789664113', 'Said', 'Shaban', 'Kapate', '0678225019', 'wupepo@gmail.com', 'male', '1785665749.jpg', '1992-05-05', 'Africana Bus stop, Dar es Salaam, Tanzania', -6.703367999999999, 39.2077938, 1, '2026-08-02 10:15:49', '2026-08-02 10:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `handyman_request_reject`
--

CREATE TABLE `handyman_request_reject` (
  `id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `request_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handyman_request_reject`
--

INSERT INTO `handyman_request_reject` (`id`, `handyman_id`, `request_id`, `created_at`, `updated_at`) VALUES
(7, 4105, 2852, '2026-05-28 08:58:45', '2026-05-28 08:58:45'),
(8, 4105, 2853, '2026-06-03 14:19:11', '2026-06-03 14:19:11'),
(9, 4105, 2848, '2026-06-03 14:19:24', '2026-06-03 14:19:24'),
(10, 4105, 2852, '2026-06-17 14:15:20', '2026-06-17 14:15:20'),
(11, 4105, 2864, '2026-07-02 09:14:33', '2026-07-02 09:14:33'),
(12, 4144, 2856, '2026-08-02 10:33:08', '2026-08-02 10:33:08'),
(13, 4144, 2854, '2026-08-02 10:33:15', '2026-08-02 10:33:15'),
(14, 4144, 2853, '2026-08-02 10:33:22', '2026-08-02 10:33:22'),
(15, 4105, 2854, '2026-08-10 06:54:27', '2026-08-10 06:54:27'),
(16, 4105, 2856, '2026-08-10 06:54:33', '2026-08-10 06:54:33'),
(17, 4105, 2861, '2026-08-10 06:54:37', '2026-08-10 06:54:37'),
(18, 4117, 2858, '2026-08-19 16:25:28', '2026-08-19 16:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `handyman_service`
--

CREATE TABLE `handyman_service` (
  `id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `service_id` int NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handyman_service`
--

INSERT INTO `handyman_service` (`id`, `handyman_id`, `service_id`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, 4106, 1, 1, '2026-03-04 12:30:44', '2026-03-04 12:30:44', NULL),
(31, 4107, 27, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(32, 4107, 31, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(33, 4107, 32, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(34, 4107, 35, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(35, 4107, 26, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(36, 4107, 1, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(37, 4107, 3, 1, '2026-03-16 07:28:42', '2026-03-16 07:28:42', NULL),
(38, 4108, 31, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(39, 4108, 34, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(40, 4108, 26, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(41, 4108, 35, 1, '2026-03-16 07:40:21', '2026-03-16 07:40:21', NULL),
(42, 4109, 31, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(43, 4109, 32, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(44, 4109, 26, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(45, 4109, 35, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(46, 4109, 1, 1, '2026-03-16 10:29:17', '2026-03-16 10:29:17', NULL),
(51, 4110, 31, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(52, 4110, 33, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(53, 4110, 26, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(54, 4110, 35, 1, '2026-03-16 11:20:23', '2026-03-16 11:20:23', NULL),
(61, 4112, 31, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(62, 4112, 32, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(63, 4112, 35, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(64, 4112, 26, 1, '2026-03-17 07:09:18', '2026-03-17 07:09:18', NULL),
(67, 4113, 2, 1, '2026-03-17 09:28:13', '2026-03-17 09:28:13', NULL),
(68, 4114, 31, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(69, 4114, 33, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(70, 4114, 35, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(71, 4114, 26, 1, '2026-03-17 11:35:13', '2026-03-17 11:35:13', NULL),
(72, 4115, 4, 1, '2026-03-18 05:41:58', '2026-03-18 05:41:58', NULL),
(73, 4116, 16, 1, '2026-03-18 06:25:03', '2026-03-18 06:25:03', NULL),
(74, 4116, 9, 1, '2026-03-18 06:25:03', '2026-03-18 06:25:03', NULL),
(75, 4117, 16, 1, '2026-03-18 06:50:35', '2026-03-18 06:50:35', NULL),
(76, 4117, 9, 1, '2026-03-18 06:50:35', '2026-03-18 06:50:35', NULL),
(77, 4111, 33, 1, '2026-03-18 07:19:38', '2026-03-18 07:19:38', NULL),
(78, 4111, 31, 1, '2026-03-18 07:19:38', '2026-03-18 07:19:38', NULL),
(79, 4111, 35, 1, '2026-03-18 07:19:38', '2026-03-18 07:19:38', NULL),
(80, 4111, 26, 1, '2026-03-18 07:19:38', '2026-03-18 07:19:38', NULL),
(81, 4111, 17, 1, '2026-03-18 07:19:38', '2026-03-18 07:19:38', NULL),
(82, 4118, 2, 1, '2026-03-18 07:53:30', '2026-03-18 07:53:30', NULL),
(83, 4119, 1, 1, '2026-03-18 08:25:33', '2026-03-18 08:25:33', NULL),
(84, 4120, 1, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(85, 4120, 26, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(86, 4120, 31, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(87, 4120, 32, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(88, 4120, 35, 1, '2026-03-18 08:40:13', '2026-03-18 08:40:13', NULL),
(91, 4121, 2, 1, '2026-03-18 10:48:09', '2026-03-18 10:48:09', NULL),
(92, 4122, 1, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(93, 4122, 26, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(94, 4122, 31, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(95, 4122, 32, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(96, 4122, 35, 1, '2026-03-18 11:35:46', '2026-03-18 11:35:46', NULL),
(101, 4124, 26, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(102, 4124, 31, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(103, 4124, 32, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(104, 4124, 35, 1, '2026-03-18 11:52:56', '2026-03-18 11:52:56', NULL),
(105, 4125, 26, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(106, 4125, 31, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(107, 4125, 32, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(108, 4125, 35, 1, '2026-03-18 13:10:53', '2026-03-18 13:10:53', NULL),
(109, 4126, 2, 1, '2026-03-18 14:54:01', '2026-03-18 14:54:01', NULL),
(112, 4127, 26, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(113, 4127, 27, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(114, 4127, 31, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(115, 4127, 32, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(116, 4127, 35, 1, '2026-03-23 07:01:12', '2026-03-23 07:01:12', NULL),
(118, 4128, 9, 1, '2026-03-23 08:23:02', '2026-03-23 08:23:02', NULL),
(119, 4129, 1, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(120, 4129, 32, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(121, 4129, 35, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(122, 4129, 31, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(123, 4129, 26, 1, '2026-03-23 10:48:09', '2026-03-23 10:48:09', NULL),
(124, 4130, 26, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(125, 4130, 31, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(126, 4130, 32, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(127, 4130, 35, 1, '2026-03-24 08:55:08', '2026-03-24 08:55:08', NULL),
(128, 4131, 26, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(129, 4131, 31, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(130, 4131, 32, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(131, 4131, 35, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(132, 4131, 1, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(133, 4131, 17, 1, '2026-03-24 09:03:48', '2026-03-24 09:03:48', NULL),
(134, 4132, 1, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(135, 4132, 26, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(136, 4132, 31, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(137, 4132, 33, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(138, 4132, 35, 1, '2026-03-24 10:01:57', '2026-03-24 10:01:57', NULL),
(145, 4133, 26, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(146, 4133, 31, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(147, 4133, 33, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(148, 4133, 35, 1, '2026-03-25 09:50:44', '2026-03-25 09:50:44', NULL),
(153, 4134, 26, 1, '2026-03-25 10:18:48', '2026-03-25 10:18:48', NULL),
(154, 4134, 31, 1, '2026-03-25 10:18:48', '2026-03-25 10:18:48', NULL),
(155, 4134, 33, 1, '2026-03-25 10:18:48', '2026-03-25 10:18:48', NULL),
(156, 4134, 35, 1, '2026-03-25 10:18:48', '2026-03-25 10:18:48', NULL),
(157, 4134, 1, 1, '2026-03-25 10:18:48', '2026-03-25 10:18:48', NULL),
(160, 4135, 1, 1, '2026-03-25 12:56:55', '2026-03-25 12:56:55', NULL),
(161, 4135, 9, 1, '2026-03-25 12:56:55', '2026-03-25 12:56:55', NULL),
(162, 4136, 26, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(163, 4136, 31, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(164, 4136, 32, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(165, 4136, 35, 1, '2026-04-01 08:11:26', '2026-04-01 08:11:26', NULL),
(166, 4137, 1, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(167, 4137, 26, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(168, 4137, 31, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(169, 4137, 32, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(170, 4137, 35, 1, '2026-04-01 08:22:23', '2026-04-01 08:22:23', NULL),
(171, 4105, 1, 1, '2026-04-16 11:23:13', '2026-04-16 11:23:13', NULL),
(172, 4105, 9, 1, '2026-04-16 11:23:13', '2026-04-16 11:23:13', NULL),
(173, 4105, 26, 1, '2026-04-16 11:23:13', '2026-04-16 11:23:13', NULL),
(179, 4138, 1, 1, '2026-04-23 11:08:03', '2026-04-23 11:08:03', NULL),
(180, 4138, 26, 1, '2026-04-23 11:08:03', '2026-04-23 11:08:03', NULL),
(181, 4138, 33, 1, '2026-04-23 11:08:03', '2026-04-23 11:08:03', NULL),
(182, 4138, 35, 1, '2026-04-23 11:08:03', '2026-04-23 11:08:03', NULL),
(183, 4138, 31, 1, '2026-04-23 11:08:03', '2026-04-23 11:08:03', NULL),
(190, 4123, 31, 1, '2026-05-05 12:04:38', '2026-05-05 12:04:38', NULL),
(191, 4123, 32, 1, '2026-05-05 12:04:38', '2026-05-05 12:04:38', NULL),
(192, 4123, 35, 1, '2026-05-05 12:04:38', '2026-05-05 12:04:38', NULL),
(193, 4123, 26, 1, '2026-05-05 12:04:38', '2026-05-05 12:04:38', NULL),
(194, 4123, 1, 1, '2026-05-05 12:04:38', '2026-05-05 12:04:38', NULL),
(199, 4140, 1, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(200, 4140, 32, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(201, 4140, 31, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(202, 4140, 35, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(203, 4140, 26, 1, '2026-05-12 10:21:29', '2026-05-12 10:21:29', NULL),
(204, 4141, 1, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(205, 4141, 26, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(206, 4141, 31, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(207, 4141, 32, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(208, 4141, 35, 1, '2026-05-20 11:33:21', '2026-05-20 11:33:21', NULL),
(209, 4142, 26, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(210, 4142, 31, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(211, 4142, 33, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(212, 4142, 35, 1, '2026-05-20 11:38:58', '2026-05-20 11:38:58', NULL),
(213, 4139, 26, 1, '2026-06-30 05:56:33', '2026-06-30 05:56:33', NULL),
(214, 4139, 35, 1, '2026-06-30 05:56:34', '2026-06-30 05:56:34', NULL),
(215, 4139, 31, 1, '2026-06-30 05:56:34', '2026-06-30 05:56:34', NULL),
(216, 4139, 32, 1, '2026-06-30 05:56:34', '2026-06-30 05:56:34', NULL),
(217, 4139, 1, 1, '2026-06-30 05:56:34', '2026-06-30 05:56:34', NULL),
(218, 4143, 6, 1, '2026-07-14 14:58:48', '2026-07-14 14:58:48', NULL),
(219, 4104, 1, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(220, 4104, 3, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(221, 4104, 9, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(222, 4104, 17, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(223, 4104, 27, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(224, 4104, 24, 1, '2026-07-24 12:19:14', '2026-07-24 12:19:14', NULL),
(225, 4144, 9, 1, '2026-08-02 10:15:49', '2026-08-02 10:15:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int NOT NULL,
  `code` int NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `code`, `mobile`, `status_id`, `created_at`, `updated_at`) VALUES
(561, 5110, '255749795987', 6, '2026-02-17 14:46:53', '2026-02-17 11:47:04'),
(562, 6500, '255749795987', 6, '2026-02-17 14:53:15', '2026-02-17 11:53:26'),
(563, 7735, '255712395987', 6, '2026-02-17 14:54:09', '2026-02-17 11:54:24'),
(564, 8897, '255749795987', 6, '2026-02-17 14:55:03', '2026-02-17 11:55:14'),
(565, 2550, '255749795987', 6, '2026-02-17 14:57:15', '2026-02-17 11:57:28'),
(566, 7829, '255746770063', 6, '2026-02-17 17:15:57', '2026-02-17 14:16:12'),
(567, 9893, '255746770063', 6, '2026-02-18 08:32:00', '2026-02-18 05:32:12'),
(568, 1020, '255686770012', 6, '2026-02-18 08:32:43', '2026-02-18 05:32:53'),
(569, 1106, '255746770063', 6, '2026-02-18 09:23:59', '2026-02-18 06:24:10'),
(570, 6968, '255746770063', 6, '2026-02-19 07:02:35', '2026-02-19 04:03:08'),
(571, 1729, '255753068623', 6, '2026-02-21 22:20:07', '2026-02-21 19:20:27'),
(572, 3098, '255754011649', 6, '2026-02-22 03:43:13', '2026-02-22 00:43:23'),
(573, 9692, '255793147150', 6, '2026-02-22 10:49:58', '2026-02-22 07:50:05'),
(574, 8693, '255713906221', 6, '2026-02-22 12:03:48', '2026-02-22 09:03:56'),
(575, 4400, '255712395987', 6, '2026-02-24 20:20:04', '2026-02-24 17:20:14'),
(576, 3006, '255764587748', 6, '2026-02-26 12:02:01', '2026-02-26 09:02:18'),
(577, 3961, '255759421622', 6, '2026-02-26 16:39:40', '2026-02-26 13:39:50'),
(578, 1570, '255797407662', 6, '2026-03-06 06:55:25', '2026-03-06 04:18:49'),
(579, 7315, '255797407662', 6, '2026-03-06 07:18:49', '2026-03-06 04:19:01'),
(580, 2928, '255749795987', 6, '2026-03-07 21:14:01', '2026-03-07 18:14:13'),
(581, 2892, '255698527585', 6, '2026-03-09 09:51:31', '2026-03-09 06:51:49'),
(582, 8382, '255614054291', 6, '2026-03-12 01:29:35', '2026-03-11 22:29:46'),
(583, 5444, '255763640052', 6, '2026-03-12 02:06:14', '2026-03-11 23:06:31'),
(584, 7144, '255781386814', 6, '2026-03-15 18:09:59', '2026-03-15 15:10:12'),
(585, 1020, '255686770012', 6, '2026-03-16 06:14:19', '2026-03-16 03:14:24'),
(586, 9916, '255746770063', 6, '2026-03-16 06:26:18', '2026-03-16 03:26:31'),
(587, 3008, '255764263608', 6, '2026-03-17 18:17:21', '2026-03-17 15:17:28'),
(588, 3271, '255676447255', 6, '2026-03-18 05:42:51', '2026-03-18 02:51:03'),
(589, 1020, '255686770012', 6, '2026-03-18 08:49:04', '2026-03-18 05:49:10'),
(590, 9921, '255755736156', 6, '2026-03-18 09:12:02', '2026-03-18 06:12:29'),
(591, 1020, '255686770012', 6, '2026-03-18 09:49:55', '2026-03-18 06:49:59'),
(592, 1020, '255686770012', 6, '2026-03-18 09:50:36', '2026-03-18 06:50:41'),
(593, 7218, '255749795987', 6, '2026-03-18 09:54:40', '2026-03-18 06:55:45'),
(594, 2493, '255412585336', 1, '2026-03-18 11:50:14', '2026-03-18 08:50:14'),
(595, 1020, '255686770012', 6, '2026-03-18 20:40:46', '2026-03-18 17:40:52'),
(596, 1020, '255686770012', 6, '2026-03-19 13:03:59', '2026-03-19 10:04:06'),
(597, 1020, '255686770012', 6, '2026-03-19 13:13:45', '2026-03-19 10:17:20'),
(598, 1020, '255686770012', 6, '2026-03-19 13:17:15', '2026-03-19 10:18:20'),
(599, 1020, '255686770012', 6, '2026-03-19 13:24:35', '2026-03-19 10:24:42'),
(600, 1020, '255686770012', 6, '2026-03-19 13:25:23', '2026-03-19 10:25:28'),
(601, 1020, '255686770012', 6, '2026-03-19 13:43:23', '2026-03-19 10:43:28'),
(602, 1751, '255659849909', 6, '2026-03-20 13:06:47', NULL),
(603, 1020, '255686770012', 6, '2026-03-20 21:48:44', '2026-03-20 18:48:50'),
(604, 5593, '255716305006', 6, '2026-03-21 11:52:45', '2026-03-21 08:52:54'),
(605, 2406, '255716305006', 6, '2026-03-21 11:55:06', '2026-03-21 08:55:12'),
(606, 2320, '255627106048', 6, '2026-03-23 22:30:51', NULL),
(607, 3519, '255754712002', 6, '2026-03-23 20:40:33', '2026-03-23 17:40:49'),
(608, 8645, '255659849909', 6, '2026-03-24 16:13:15', NULL),
(609, 4312, '255683532313', 6, '2026-03-25 14:53:23', NULL),
(610, 1614, '255686759813', 6, '2026-03-25 11:54:56', '2026-03-25 08:55:14'),
(611, 6143, '255686759813', 6, '2026-03-25 13:05:15', '2026-03-25 10:05:35'),
(612, 5343, '255686759813', 6, '2026-03-25 13:06:58', '2026-03-25 10:07:13'),
(613, 8800, '255750759883', 6, '2026-03-25 13:11:21', '2026-03-25 10:11:57'),
(614, 7770, '255686759813', 6, '2026-03-25 13:12:45', '2026-03-25 10:13:00'),
(615, 9906, '255625816702', 6, '2026-03-25 13:39:03', '2026-03-25 10:39:55'),
(616, 8272, '255686759813', 6, '2026-03-25 13:43:04', '2026-03-25 10:43:19'),
(617, 1628, '255686759813', 6, '2026-03-25 14:04:45', '2026-03-25 11:05:01'),
(618, 4356, '255746254117', 6, '2026-03-25 14:28:21', '2026-03-25 11:28:43'),
(619, 2817, '255754492120', 6, '2026-03-25 14:31:28', '2026-03-25 11:31:50'),
(620, 6433, '255686759813', 6, '2026-03-25 18:15:23', '2026-03-25 15:15:41'),
(621, 7514, '255621416049', 6, '2026-03-25 20:31:00', '2026-03-25 17:31:08'),
(622, 1323, '255686759813', 6, '2026-03-27 00:59:41', '2026-03-26 22:00:03'),
(623, 4328, '255789664113', 6, '2026-03-27 13:32:01', '2026-03-27 10:32:24'),
(624, 1991, '255789664113', 6, '2026-03-27 14:33:58', '2026-03-27 11:34:28'),
(625, 6497, '255787027497', 6, '2026-03-30 06:36:11', '2026-03-30 03:40:38'),
(626, 4393, '255787027497', 6, '2026-03-30 06:40:38', '2026-03-30 03:46:51'),
(627, 6457, '255787027497', 6, '2026-03-30 06:46:51', '2026-03-30 03:47:47'),
(628, 2492, '255626140761', 6, '2026-03-30 11:30:12', '2026-03-30 08:30:42'),
(629, 9972, '255626140761', 6, '2026-03-30 11:35:59', '2026-03-30 08:36:17'),
(630, 5200, '255628025165', 6, '2026-04-02 11:23:17', '2026-04-02 08:23:40'),
(631, 1020, '255686770012', 6, '2026-04-02 11:28:11', '2026-04-02 08:28:14'),
(632, 9408, '255746000907', 6, '2026-04-06 07:43:02', NULL),
(633, 4609, '255744576188', 6, '2026-04-09 17:41:05', '2026-04-09 14:41:41'),
(634, 3848, '255744576188', 6, '2026-04-09 18:00:40', '2026-04-09 15:01:26'),
(635, 2121, '255712770011', 6, '2026-04-10 11:04:49', '2026-04-10 08:05:00'),
(636, 2316, '255744576188', 6, '2026-04-13 15:30:41', '2026-04-13 12:30:58'),
(637, 4873, '255694100405', 6, '2026-04-15 07:26:45', '2026-04-15 04:27:15'),
(638, 8128, '255716732427', 6, '2026-04-15 07:27:14', '2026-04-15 04:27:46'),
(639, 9684, '255694100405', 6, '2026-04-15 09:19:02', '2026-04-15 06:19:21'),
(640, 2159, '255788901256', 6, '2026-04-20 08:59:18', '2026-04-20 05:59:35'),
(641, 4487, '255754492120', 6, '2026-04-20 09:03:28', '2026-04-20 06:04:33'),
(642, 5105, '255754492120', 6, '2026-04-20 09:05:41', '2026-04-20 06:07:18'),
(643, 1020, '255686770012', 6, '2026-04-20 09:09:57', '2026-04-20 06:10:03'),
(644, 5634, '255674789852', 6, '2026-04-22 19:08:44', '2026-04-22 16:09:04'),
(645, 5952, '255712670704', 6, '2026-04-27 13:57:07', '2026-04-27 10:57:19'),
(646, 7511, '255714817455', 6, '2026-04-29 12:14:50', '2026-04-29 09:15:08'),
(647, 9826, '255749401919', 1, '2026-04-30 12:23:01', '2026-04-30 09:23:01'),
(648, 5259, '255763580371', 6, '2026-05-02 18:03:28', '2026-05-02 15:03:40'),
(649, 7597, '255713978820', 6, '2026-05-03 05:33:43', '2026-05-03 02:38:08'),
(650, 8190, '255760255266', 6, '2026-05-03 13:49:03', '2026-05-03 10:49:18'),
(651, 3470, '255658111341', 6, '2026-05-06 14:07:12', '2026-05-06 11:07:33'),
(652, 9763, '255658111341', 6, '2026-05-06 14:19:47', '2026-05-06 11:20:37'),
(653, 4455, '255658111341', 6, '2026-05-06 14:27:28', '2026-05-06 11:27:53'),
(654, 7705, '255750211341', 6, '2026-05-06 14:30:07', '2026-05-06 11:30:21'),
(655, 7716, '255658111341', 6, '2026-05-06 14:51:37', '2026-05-06 11:51:54'),
(656, 3132, '255658111341', 6, '2026-05-06 14:59:17', '2026-05-06 11:59:36'),
(657, 6076, '255635246931', 6, '2026-05-07 04:46:15', '2026-05-07 01:46:48'),
(658, 3089, '255750211341', 6, '2026-05-14 12:17:07', '2026-05-14 09:17:31'),
(659, 2566, '255746770063', 6, '2026-05-14 12:23:42', '2026-05-14 09:23:50'),
(660, 1020, '255686770012', 6, '2026-05-14 12:37:14', '2026-05-14 09:37:18'),
(661, 5496, '255658111341', 6, '2026-05-14 13:23:03', '2026-05-14 10:23:19'),
(662, 6882, '255738141901', 6, '2026-05-14 14:14:15', '2026-05-14 11:14:42'),
(663, 5746, '255738141901', 6, '2026-05-14 14:15:56', '2026-05-14 11:16:16'),
(664, 5385, '255656516931', 6, '2026-05-14 16:22:47', '2026-05-14 13:23:03'),
(665, 4281, '255656516931', 6, '2026-05-14 16:28:35', '2026-05-14 13:28:55'),
(666, 8648, '255719973980', 6, '2026-05-14 17:12:57', '2026-05-14 14:13:17'),
(667, 9776, '255755656565', 6, '2026-05-18 12:20:49', '2026-05-18 09:21:13'),
(668, 9910, '255712477741', 6, '2026-05-18 12:21:37', '2026-05-18 09:21:57'),
(669, 7632, '255716693016', 6, '2026-05-19 16:14:53', NULL),
(670, 9472, '255674775500', 1, '2026-05-21 22:34:04', '2026-05-21 19:34:04'),
(671, 1937, '255749775500', 6, '2026-05-21 22:34:22', '2026-05-21 19:34:43'),
(672, 4491, '255749775500', 6, '2026-05-21 22:38:31', '2026-05-21 19:38:54'),
(673, 9799, '255749775500', 6, '2026-05-31 20:35:00', '2026-05-31 17:35:21'),
(674, 7084, '255784416282', 6, '2026-06-03 12:35:59', '2026-06-03 09:36:12'),
(675, 1020, '255686770012', 6, '2026-06-03 13:54:44', '2026-06-03 10:54:49'),
(676, 3106, '255746770063', 1, '2026-06-03 14:00:31', '2026-06-03 11:00:31'),
(677, 7306, '255746770063', 1, '2026-06-03 14:11:06', '2026-06-03 11:11:06'),
(678, 1020, '255686770012', 6, '2026-06-03 14:18:46', '2026-06-03 11:18:54'),
(679, 1020, '255686770012', 6, '2026-06-05 09:37:14', '2026-06-05 06:37:20'),
(680, 6586, '255797404662', 1, '2026-06-06 10:51:16', '2026-06-06 07:51:16'),
(681, 3067, '255797407662', 6, '2026-06-06 10:51:58', '2026-06-06 07:52:19'),
(682, 4244, '255758347960', 6, '2026-06-07 07:35:03', '2026-06-07 04:35:19'),
(683, 6713, '255758347960', 6, '2026-06-07 07:38:34', '2026-06-07 04:38:51'),
(684, 1169, '255612929319', 1, '2026-06-08 15:59:11', '2026-06-08 12:59:11'),
(685, 7505, '255750020767', 6, '2026-06-08 15:59:43', '2026-06-08 13:00:07'),
(686, 3971, '255715537654', 1, '2026-06-11 07:14:22', '2026-06-11 04:14:22'),
(687, 1849, '255617839281', 1, '2026-06-12 12:20:11', '2026-06-12 09:20:11'),
(688, 8444, '255714670904', 1, '2026-06-13 13:41:58', '2026-06-13 10:41:58'),
(689, 8277, '255780460100', 1, '2026-06-13 13:47:48', '2026-06-13 10:47:48'),
(690, 6235, '255780460100', 1, '2026-06-13 14:33:03', '2026-06-13 11:33:03'),
(691, 6467, '255780460100', 1, '2026-06-13 14:35:50', '2026-06-13 11:35:50'),
(692, 9522, '255683532313', 1, '2026-06-18 15:50:44', NULL),
(693, 2111, '255616803336', 6, '2026-06-19 15:19:09', '2026-06-19 12:22:25'),
(694, 2980, '255616803336', 6, '2026-06-19 15:22:25', '2026-06-23 12:34:41'),
(695, 6745, '255656507602', 1, '2026-06-19 15:23:22', '2026-06-19 12:23:22'),
(696, 3635, '255679621548', 6, '2026-06-22 10:33:19', '2026-06-23 12:43:23'),
(697, 6631, '255616803339', 1, '2026-06-23 15:34:34', '2026-06-23 12:34:34'),
(698, 2309, '255616803336', 6, '2026-06-23 15:34:41', '2026-06-23 12:34:53'),
(699, 4917, '255679621548', 6, '2026-06-23 15:43:23', '2026-06-23 12:43:41'),
(700, 1020, '255686770012', 6, '2026-06-26 11:37:51', '2026-06-26 08:37:57'),
(701, 9334, '255746770063', 6, '2026-06-26 11:41:02', '2026-06-26 08:41:35'),
(702, 1020, '255686770012', 6, '2026-06-26 11:42:20', '2026-06-26 08:42:26'),
(703, 1020, '255686770012', 6, '2026-06-26 11:44:52', '2026-06-26 08:44:56'),
(704, 5771, '255712642041', 6, '2026-06-27 06:20:33', '2026-06-27 03:25:24'),
(705, 4040, '255622606497', 6, '2026-06-29 18:29:34', '2026-06-29 15:30:10'),
(706, 8683, '255715433739', 6, '2026-06-29 19:59:12', '2026-06-29 16:59:31'),
(707, 4259, '255754385444', 6, '2026-06-29 20:14:21', '2026-06-29 17:14:45'),
(708, 3590, '255653446050', 6, '2026-06-30 05:02:58', '2026-06-30 02:03:14'),
(709, 6555, '255716000606', 6, '2026-07-10 16:54:53', NULL),
(710, 5383, '255755916373', 6, '2026-07-11 11:05:00', '2026-07-11 08:05:16'),
(711, 9526, '255782248388', 6, '2026-07-14 14:49:59', '2026-07-14 11:50:35'),
(712, 1917, '255782248388', 6, '2026-07-14 14:59:24', '2026-07-14 11:59:41'),
(713, 8297, '255719613891', 6, '2026-07-19 08:16:39', '2026-07-19 05:16:55'),
(714, 7920, '255767210520', 6, '2026-07-19 13:33:43', '2026-07-19 10:33:58'),
(715, 2950, '255782248388', 6, '2026-07-19 13:52:40', '2026-07-19 10:54:19'),
(716, 5760, '255767210520', 6, '2026-07-20 07:48:08', '2026-07-20 04:48:25'),
(717, 4673, '255699125661', 6, '2026-07-20 15:03:08', '2026-07-20 12:03:42'),
(718, 5001, '255628945374', 6, '2026-07-20 15:56:18', '2026-07-20 12:57:24'),
(719, 1304, '255628945374', 6, '2026-07-20 16:01:43', '2026-07-20 13:02:17'),
(720, 4432, '255717669678', 6, '2026-07-21 06:48:33', '2026-07-21 03:48:59'),
(721, 4361, '255717669678', 6, '2026-07-21 07:01:56', '2026-07-21 04:02:15'),
(722, 1876, '255686002420', 1, '2026-07-23 07:20:36', '2026-07-23 04:20:36'),
(723, 3376, '255754373308', 6, '2026-07-23 07:22:20', '2026-07-23 04:22:34'),
(724, 4714, '255712395987', 6, '2026-07-24 09:22:18', '2026-10-01 02:53:30'),
(725, 7811, '255749795987', 6, '2026-07-24 12:24:27', '2026-07-24 09:24:37'),
(726, 5766, '255789664113', 6, '2026-08-02 10:32:18', '2026-08-02 07:32:54'),
(727, 8617, '255782891969', 6, '2026-08-03 19:00:13', '2026-08-03 16:00:38'),
(728, 7257, '255617216953', 6, '2026-08-07 18:50:07', '2026-08-07 15:50:30'),
(729, 1020, '255686770012', 6, '2026-08-10 06:41:43', '2026-08-10 03:41:59'),
(730, 7205, '255620575029', 6, '2026-08-11 13:43:46', '2026-08-11 10:44:02'),
(731, 1030, '255714817455', 6, '2026-08-14 16:10:01', '2026-08-14 13:10:21'),
(732, 9586, '255638654552', 6, '2026-08-16 18:21:04', '2026-08-16 15:21:21'),
(733, 8283, '255777490957', 6, '2026-08-17 11:25:27', '2026-08-17 08:25:57'),
(734, 5028, '255654636701', 6, '2026-08-23 17:12:59', '2026-08-23 14:13:19'),
(735, 5006, '255713978820', 6, '2026-08-24 05:32:43', '2026-08-24 02:34:14'),
(736, 3695, '255674397464', 6, '2026-08-24 11:13:05', '2026-08-24 08:13:24'),
(737, 1020, '255686770012', 6, '2026-08-27 04:38:07', '2026-08-27 01:38:15'),
(738, 1020, '255686770012', 6, '2026-08-27 05:17:11', '2026-08-27 05:18:14'),
(739, 1020, '255686770012', 6, '2026-08-27 08:18:14', '2026-08-27 05:18:20'),
(740, 3799, '255542832678', 6, '2026-08-28 13:49:08', '2026-08-28 10:49:33'),
(741, 6026, '255542832678', 6, '2026-08-28 13:49:33', '2026-08-28 10:52:03'),
(742, 6020, '255542832678', 1, '2026-08-28 13:52:03', '2026-08-28 10:52:03'),
(743, 7850, '255789664113', 6, '2026-08-29 16:29:55', '2026-08-29 13:30:13'),
(744, 6441, '255769323435', 1, '2026-09-03 20:34:44', '2026-09-03 17:34:44'),
(745, 5350, '255712770011', 1, '2026-09-05 16:20:31', '2026-09-05 13:20:31'),
(746, 1020, '255686770012', 6, '2026-09-09 09:24:39', '2026-09-09 06:24:44'),
(747, 1020, '255686770012', 6, '2026-09-09 09:27:47', '2026-09-09 06:27:49'),
(748, 6431, '255712395987', 6, '2026-10-01 05:53:30', '2026-10-01 02:53:51'),
(749, 5417, '255719032614', 6, '2026-10-01 13:53:29', '2026-10-01 10:53:48'),
(750, 5169, '255611269906', 6, '2026-10-07 20:46:15', '2026-10-07 17:46:46'),
(751, 8102, '255795848886', 6, '2026-10-10 09:45:50', '2026-10-10 06:46:16'),
(752, 7999, '255713103470', 6, '2026-10-12 12:18:07', '2026-10-12 09:18:33'),
(753, 5940, '255717665100', 6, '2026-10-18 15:10:21', '2026-10-18 12:10:54'),
(754, 3893, '255788218003', 1, '2026-10-18 16:43:07', '2026-10-18 13:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int NOT NULL,
  `description` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` double NOT NULL,
  `service_id` int NOT NULL,
  `price_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `description`, `amount`, `service_id`, `price_type`, `status_id`, `priority`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Check up/Job Assesment', 15000, 9, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2024-10-25 15:49:28', NULL),
(2, 'AC Basic Repair', 25000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(3, 'AC capacitor (device)', 15000, 9, 'REPAIR', 16, 0, '2023-12-23 00:00:00', '2026-05-03 05:55:35', NULL),
(4, 'AC Capacitor Change', 25000, 9, 'REPAIR', 16, 0, '2023-12-23 00:00:00', '2026-05-03 05:54:54', NULL),
(5, 'AC Compressor Change', 50000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(6, 'Gas per Kg', 25000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(7, 'AC Indoor Set Installation', 30000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(8, 'AC Installation', 80000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(9, 'AC Basic Servicing', 25000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(10, 'AC Intensive Servicing', 30000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(11, 'AC Major repair', 35000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(12, 'AC Outdoor Set Installation', 50000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(13, 'AC Re-positioning', 50000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(14, 'AC Servicing & leakage fix', 45000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(15, 'AC Servicing & Repair', 40000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(16, 'AC service and Gas refilling', 40000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(17, 'AC Un-installation & Installation', 90000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(18, 'AC water leakage fix', 20000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(19, 'Portable AC Service', 30000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(20, 'AVS Installation/Repair', 15000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(21, 'Un-installing AC/kufungua AC', 20000, 9, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(22, 'Check up/Job Assesment', 10000, 1, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(23, 'Power Malfunction Basic Diagnosis', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(24, 'Power Malfunction Intensive Diagnosis', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(25, '3 phase Main switch installation', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(26, '3 phase switch installation', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(27, 'Bread slicer repair', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(28, 'Complete Bulb point change', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(29, 'Bulb Change/repair per point (1 point)', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(30, 'Bulb change/repair per point (more than 1 pt)', 5000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(31, 'Ceiling Fan installation', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(32, 'Ceiling fan major repair', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(33, 'Ceiling fan minor repair', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(34, 'Ceiling fan repair(more than one)', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(35, 'Change over switch installation', 40000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(36, 'Cooker Switch installation', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(37, 'Diagnosis & Element Change', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(38, 'Earth rod fixing', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(39, 'Earthing per point', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2024-10-25 15:50:29', NULL),
(40, 'Electric Cooker Switch Repair', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(41, 'Electric fence diagnosis&repair', 40000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(42, 'Electric fence minor repair', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(43, 'Electric kettle Repair', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(44, 'Generator wire installation', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(45, 'Heater Repair', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(46, 'Lamp repair', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(47, 'LCD lights repair per set', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(48, 'MCB Change', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(49, 'Minor electric Bell repair', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(50, 'Mud cable installation', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(51, 'New Wiring per point', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(52, 'New Wiring per room', 50000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(53, 'Portable Heater repair', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(54, 'Separate Meter Installation', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(55, 'Socket Change/repair', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(56, 'Standing fan repair', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(57, 'Steamer Installation', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(58, 'Switch repair (more than one)', 5000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(59, 'Trunk installation', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(60, 'Tube Light installation', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(61, 'Water Heater Installation on existing point', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(62, 'Water pump repair', 30000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(63, 'Water Motor wiring repair', 25000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(64, 'Wiring DP switch per point', 15000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(65, 'Wiring less than 10meters per pt', 10000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(66, 'Heater Wiring and Installation', 40000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(67, 'Water pump installation', 20000, 1, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(68, 'Check up/Job Assesment', 10000, 2, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(69, 'Flexible pipe Basic repair', 15000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(70, 'Flexible pipe intensive repair', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(71, 'Sink Basic Repair', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(72, 'Sink Intensive repair', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(73, 'Sink Installation', 35000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(74, 'Kitchen Sink Basic repair', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(75, 'Kitchen Sink Intensive repair', 30000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(76, 'Bath Tab Basic Repair', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(77, 'Bath Tab Intensive Repair', 35000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(78, 'Water pipes Basic Repair', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(79, 'Water pipes Intensive Repair', 35000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(80, 'Heater Installation', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(81, 'Heater Installation and pipes set-up', 45000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(82, 'Mixer Installation', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(83, 'Mixer Basic Repair', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(84, 'Water Tank installation', 90000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(85, 'Water Tank repair', 50000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(86, 'Water Tank cleaning', 60000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(87, 'Water Meter installation', 30000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(88, 'Water pump Basic repair', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(89, 'Water pump intensive repair', 40000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(90, 'New water point installation', 35000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(91, 'Outdoor water pipe installation', 25000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(92, 'Shower sink un-installation', 30000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(93, 'Siphon flushing system repair', 60000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(94, 'Toilet Bowl installation', 40000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(95, 'Toilet Bowl minor Repair', 15000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(96, 'Toilet Bowl Repair', 40000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(97, 'Unclogging sewage system channels', 100000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(98, 'Washing Machine Installation and water point', 40000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(99, 'Clearing chokes indoors per pt', 20000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(100, 'Clearing chokes outdoor per pt', 30000, 2, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(101, 'Check up/Job Assesment', 10000, 6, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(102, 'Major Repair/Assembling', 25000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(103, 'Minor Repair/Assembling', 15000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(104, 'Major Repair/Assembling', 40000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(105, 'Small Windows shutter & net repair', 5000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(106, 'Window net Repair per window', 5000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(107, 'Door closer repair', 10000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(108, 'Door complete repair', 30000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(109, 'Door installation', 60000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(110, 'Door Knob (Kitasa) Repair', 15000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(111, 'Door knob repair (more than two)', 10000, 6, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(112, ' Check up/Job Assesment ', 10000, 3, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(113, ' Decoder Installation ', 25000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(114, ' Decoder Repair Indoors ', 10000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(115, ' Decoder repair Outdoor ', 20000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(116, ' Decoder un-installation ', 15000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(117, ' Dish uninstallation & Re-installation ', 35000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(118, ' Explorer dish installation ', 35000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(119, ' Explorer dish installation and un-installation ', 45000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(120, ' Explorer Dish outdoor repair ', 30000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(121, ' Explorer dish un-installation ', 15000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(122, ' Extra view installation & configuration ', 30000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(123, ' Free to Air Repair Outdoors ', 25000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(124, ' Free to Air Decoder Installation ', 40000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(125, ' Free to Air repair indoors ', 15000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(126, ' TV Holder/Stand Mounting (Above 40inch TV) ', 40000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(127, ' TV Holder/Stand Mounting (40inch TV and below) ', 30000, 3, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(128, 'Check up/Job Assesment', 10000, 26, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(129, 'Electric Cooker Servicing', 25000, 26, 'REPAIR', 2, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(130, 'Oven short circuit', 35000, 26, 'REPAIR', 2, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(131, 'Oven regulator change/repair', 50000, 26, 'REPAIR', 2, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(132, 'Changing electric cooker thermostat', 25000, 26, 'REPAIR', 2, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(133, ' Check up/Job Assesment ', 10000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(134, ' Gas Cooker Servicing ', 25000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(135, ' Oven short circuit ', 35000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(136, ' Oven regulator change/repair ', 50000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(137, ' Changing electric cooker thermostat ', 25000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(138, ' Cooker Plates repair ', 25000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(139, ' Cooker Knobs repair/change ', 15000, 25, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(140, 'Check up/Job Assesment', 10000, 16, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(141, 'Changing Fridge Thermostat', 30000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(142, 'Fixing Evaporator', 20000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(143, 'Fixing Fridge Relay', 20000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(144, 'Fridge Compressor Installation/Change', 40000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(145, 'Fridge Condenser change', 30000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(146, 'Fridge Condenser Change and Gas', 65000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(147, 'Fridge Defrost system maintanance', 35000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(148, 'Fridge Fan Installation/Repair', 25000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(149, 'Fridge filter change and gas refilling', 35000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(150, 'Fridge Major Repair', 30000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(151, 'Fridge minor wiring fix', 20000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(152, 'Fridge Service', 30000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(153, 'Gas leakage fix', 20000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(154, 'Gas refilling', 30000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(155, 'Minor Fridge Repair', 25000, 16, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(156, 'Check up/Job Assesment', 10000, 27, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(157, 'Bios reset & Os Installation', 40000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(158, 'Complete Operating System installation', 25000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(159, 'Computer servicing', 25000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(160, 'Computer Servicing more than 3', 20000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(161, 'Computer/Laptop charging system repair', 30000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(162, 'Desktop Keyboard Repair', 15000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(163, 'Hard drive Partitioning', 15000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(164, 'LAN wiring and set up per PC', 15000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(165, 'Laptop adapter repair', 25000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(166, 'Laptop keyboard repair/installation', 30000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(167, 'Laptop screen installation/repair', 30000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(168, 'Minor hardware repair', 20000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(169, 'Minor Sofware settings', 20000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(170, 'Motherboard (circuit) repair', 35000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(171, 'OS complete installation', 35000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(172, 'PC Hardware Diagnosis', 15000, 27, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(173, 'Check up/Job Assesment', 10000, 4, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(174, 'Painting per sq meter', 1500, 4, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(175, 'Grill Painting per sq ft', 800, 4, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(176, 'Roof Painting per sq meter', 2500, 4, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(177, 'Check up/Job Assesment', 10000, 17, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(178, 'CCTV Control Center repositioning', 45000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(179, 'Security Camera Installation-2pcs', 80000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(180, 'Security Camera Installation-4pcs', 130000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(181, 'Security Camera Installation-8pcs', 250000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(182, 'Security Camera system Basic Maintenance', 30000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(183, 'Security Camera system Intensive Maintenance', 45000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(184, 'Power Supply Change', 30000, 17, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(185, 'Check up/Job Assesment', 10000, 14, 'ASSESSMENT', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(186, 'Door Knob Installation', 25000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(187, 'Door Closer installation', 25000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(188, 'Door closer repair', 20000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(189, 'Window Rail Repair', 15000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(190, 'Aluminium Basic Maintanance', 20000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(191, 'Aluminium Intensive Maintanance', 40000, 14, 'REPAIR', 1, 0, '2023-12-23 00:00:00', '2023-12-23 00:00:00', NULL),
(192, 'Assessment', 10000, 25, 'ASSESSMENT', 1, 0, '2024-04-29 12:21:47', '2024-04-29 12:21:23', NULL),
(193, 'Broken Power Cord', 20000, 26, 'REPAIR', 1, 1, '2024-10-02 08:58:25', '2024-10-02 05:57:49', NULL),
(194, 'Broken Lid Hinge', 20000, 26, 'REPAIR', 1, 1, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(195, 'EPC Lid Malfunction', 30000, 26, 'REPAIR', 1, 0, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(196, 'EPC Buttons not working', 25000, 26, 'REPAIR', 1, 0, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(197, 'EPC Servicing', 40000, 26, 'REPAIR', 1, 0, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(198, 'Sealing Ring Leaking Steam', 35000, 26, 'REPAIR', 1, 0, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(199, 'EPC has Electric Shock', 30000, 26, 'REPAIR', 1, 1, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(200, 'EPC Overheating', 35000, 26, 'REPAIR', 1, 1, '2024-10-02 09:02:11', '2024-10-02 05:57:49', NULL),
(202, 'Assesment', 15000, 31, 'ASSESSMENT', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(203, 'Induction Cooker does not turn on', 30000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(204, 'Broken Cooktop', 35000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(205, 'Shuts off unexpectedly', 30000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(206, 'Fan not moving', 30000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(207, 'Blocked Air vents', 25000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(208, 'Functions too slowly', 35000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(209, 'Overheating', 40000, 31, 'REPAIR', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(210, 'Assesment', 15000, 32, 'ASSESSMENT', 1, 1, '2024-10-23 07:55:06', '2024-10-23 07:55:06', NULL),
(211, 'Not turning on', 30000, 32, 'REPAIR', 1, 1, '2024-10-23 07:55:06', '2024-10-23 07:55:06', NULL),
(212, 'Inconsistent Heating', 40000, 32, 'REPAIR', 1, 1, '2024-10-23 07:55:06', '2024-10-23 07:55:06', NULL),
(213, 'Assesment', 15000, 33, 'ASSESSMENT', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(214, 'Not turning on', 30000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(215, 'Inconsistent Heating', 40000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(216, 'Broken power cord', 25000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(217, 'Basket not opening properly', 25000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(218, 'Overheating issue', 40000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(219, 'Timer malfunction', 25000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(220, 'Fan not working', 30000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(221, 'Display not working', 40000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(222, 'Error codes fix', 35000, 33, 'REPAIR', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(223, 'Assesment', 15000, 34, 'ASSESSMENT', 1, 1, '2024-10-23 08:00:14', '2024-10-23 08:00:14', NULL),
(224, 'Assesment', 15000, 35, 'ASSESSMENT', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(225, 'Rice cooker not turning on', 30000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(226, 'Broken power cord', 25000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(227, 'Indicator lights not working', 25000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(228, 'Lid not closing properly', 25000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(229, 'Rice cooker shuts off/malfunction', 30000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(230, 'Not Cooking properly', 30000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(231, 'Leaking water', 25000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(232, 'Warm mode fix', 30000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL),
(233, 'Error codes fix', 35000, 35, 'REPAIR', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`id`, `request_id`, `description`, `status_id`, `created_by`, `created_at`, `updated_at`) VALUES
(5204, 2811, NULL, 1, NULL, '2026-02-18 08:36:44', '2026-02-18 08:37:16'),
(5205, 2812, NULL, 1, NULL, '2026-02-18 08:56:12', '2026-02-18 08:56:43'),
(5206, 2815, NULL, 1, NULL, '2026-02-22 10:51:19', '2026-02-22 10:51:19'),
(5207, 2818, NULL, 1, NULL, '2026-02-26 16:47:02', '2026-02-26 16:47:02'),
(5208, 2824, NULL, 1, NULL, '2026-03-07 21:10:28', '2026-03-07 21:10:28'),
(5209, 2825, NULL, 1, NULL, '2026-03-07 21:13:17', '2026-03-07 21:13:17'),
(5210, 2827, NULL, 1, NULL, '2026-03-07 21:17:34', '2026-03-07 21:17:34'),
(5211, 2828, NULL, 1, NULL, '2026-03-07 21:17:56', '2026-03-07 21:17:56'),
(5212, 2829, NULL, 1, NULL, '2026-03-07 21:26:59', '2026-03-07 21:26:59'),
(5213, 2830, NULL, 1, NULL, '2026-03-07 21:28:47', '2026-03-07 21:28:47'),
(5214, 2831, NULL, 1, NULL, '2026-03-07 21:30:09', '2026-03-07 21:30:09'),
(5215, 2832, NULL, 1, NULL, '2026-03-07 21:31:52', '2026-03-07 21:31:52'),
(5216, 2833, NULL, 1, NULL, '2026-03-07 21:32:14', '2026-03-07 21:32:14'),
(5218, 2839, NULL, 1, NULL, '2026-03-21 12:04:15', '2026-03-21 12:04:25'),
(5219, 2840, NULL, 1, NULL, '2026-03-25 12:01:15', '2026-03-25 12:01:15'),
(5220, 2841, NULL, 1, NULL, '2026-03-25 12:03:28', '2026-03-25 12:03:28'),
(5221, 2843, NULL, 1, NULL, '2026-04-02 11:56:06', '2026-04-02 11:57:14'),
(5222, 2846, NULL, 1, NULL, '2026-04-16 11:21:51', '2026-04-16 11:21:51'),
(5223, 2849, NULL, 1, NULL, '2026-04-22 19:11:58', '2026-04-22 19:11:58'),
(5224, 2850, NULL, 1, NULL, '2026-05-02 18:06:19', '2026-05-02 18:06:19'),
(5225, 2851, NULL, 1, NULL, '2026-05-19 16:18:30', NULL),
(5226, 2847, NULL, 4, NULL, '2026-05-25 15:22:00', '2026-05-25 15:22:00'),
(5227, 2860, 'ni materials needed', 1, NULL, '2026-06-26 11:46:20', '2026-06-26 11:47:12'),
(5229, 2862, 'major repair', 1, NULL, '2026-07-02 08:58:16', '2026-07-02 08:58:59'),
(5230, 2863, NULL, 12, NULL, '2026-07-02 09:05:49', '2026-07-02 09:06:10'),
(5231, 2863, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-07-02 09:06:10', '2026-07-02 09:06:10'),
(5232, 2865, NULL, 1, NULL, '2026-07-06 04:00:15', '2026-07-06 04:00:15'),
(5233, 2867, 'Hii inajumuisha nauli ya boda kuja na kurudi, unaweza kutumia lipa namba kulipia baada ya ku-accept bill. Asante', 1, NULL, '2026-07-19 13:35:22', '2026-07-19 17:19:04'),
(5234, 2869, NULL, 1, NULL, '2026-08-02 09:45:31', '2026-08-02 09:45:31'),
(5235, 2870, 'We will reach out  to share the list of materials needed, this is the labor charge only. Karibu sana', 1, NULL, '2026-08-03 19:08:49', '2026-08-05 06:30:38'),
(5236, 2821, NULL, 12, NULL, '2026-08-04 06:53:02', '2026-08-04 06:53:17'),
(5237, 2821, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-08-04 06:53:17', '2026-08-04 06:53:17'),
(5238, 2820, NULL, 12, NULL, '2026-08-04 06:55:02', '2026-08-04 06:55:11'),
(5239, 2820, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-08-04 06:55:11', '2026-08-04 06:55:11'),
(5241, 2871, NULL, 12, NULL, '2026-08-04 07:21:51', '2026-08-04 07:22:00'),
(5242, 2871, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-08-04 07:22:00', '2026-08-04 07:22:00'),
(5243, 2872, NULL, 12, NULL, '2026-08-04 07:55:18', '2026-08-04 07:55:30'),
(5244, 2872, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-08-04 07:55:30', '2026-08-04 07:55:30'),
(5245, 2873, 'Testing the App', 1, NULL, '2026-08-10 06:44:24', '2026-08-10 06:49:19'),
(5247, 2874, 'Testing the Billing process', 1, NULL, '2026-08-10 07:01:43', '2026-08-10 07:02:49'),
(5248, 2875, NULL, 12, NULL, '2026-08-10 07:15:46', '2026-08-10 07:17:55'),
(5249, 2875, 'Assessment Fee (Quote Rejection)', 1, NULL, '2026-08-10 07:17:55', '2026-08-10 07:17:55'),
(5251, 2876, 'Testing the billing process', 1, NULL, '2026-08-10 07:26:46', '2026-08-10 07:27:59'),
(5252, 2877, 'Testing the billing process', 1, NULL, '2026-08-10 07:36:57', '2026-08-10 07:37:25'),
(5253, 2878, NULL, 1, NULL, '2026-08-24 05:07:27', '2026-08-24 05:07:27'),
(5254, 2880, 'Testing the App', 1, NULL, '2026-09-09 09:33:03', '2026-09-09 09:33:59'),
(5255, 2881, NULL, 1, NULL, '2026-09-24 11:08:57', '2026-09-24 11:08:57'),
(5256, 2882, NULL, 1, NULL, '2026-09-24 13:00:23', '2026-09-24 13:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item`
--

CREATE TABLE `quotation_item` (
  `id` int NOT NULL,
  `quotation_id` int NOT NULL,
  `price_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` double NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quotation_item`
--

INSERT INTO `quotation_item` (`id`, `quotation_id`, `price_id`, `quantity`, `unit_price`, `status_id`, `created_by`, `created_at`, `updated_at`) VALUES
(310, 5204, 2, 1, 25000, 1, NULL, '2026-02-18 08:36:44', '2026-02-18 08:36:44'),
(311, 5205, 2, 1, 25000, 1, NULL, '2026-02-18 08:56:12', '2026-02-18 08:56:12'),
(312, 5206, 24, 1, 30000, 1, NULL, '2026-02-22 10:51:19', '2026-02-22 10:51:19'),
(313, 5207, 102, 1, 25000, 1, NULL, '2026-02-26 16:47:02', '2026-02-26 16:47:02'),
(314, 5208, 69, 1, 15000, 1, NULL, '2026-03-07 21:10:28', '2026-03-07 21:10:28'),
(315, 5209, 69, 1, 15000, 1, NULL, '2026-03-07 21:13:17', '2026-03-07 21:13:17'),
(316, 5210, 69, 1, 15000, 1, NULL, '2026-03-07 21:17:34', '2026-03-07 21:17:34'),
(317, 5211, 69, 1, 15000, 1, NULL, '2026-03-07 21:17:56', '2026-03-07 21:17:56'),
(318, 5212, 69, 1, 15000, 1, NULL, '2026-03-07 21:26:59', '2026-03-07 21:26:59'),
(319, 5213, 69, 1, 15000, 1, NULL, '2026-03-07 21:28:47', '2026-03-07 21:28:47'),
(320, 5214, 69, 1, 15000, 1, NULL, '2026-03-07 21:30:09', '2026-03-07 21:30:09'),
(321, 5215, 69, 1, 15000, 1, NULL, '2026-03-07 21:31:52', '2026-03-07 21:31:52'),
(322, 5216, 69, 1, 15000, 1, NULL, '2026-03-07 21:32:14', '2026-03-07 21:32:14'),
(324, 5218, 23, 1, 25000, 1, NULL, '2026-03-21 12:04:15', '2026-03-21 12:04:15'),
(325, 5219, 25, 1, 30000, 1, NULL, '2026-03-25 12:01:15', '2026-03-25 12:01:15'),
(326, 5220, 23, 1, 25000, 1, NULL, '2026-03-25 12:03:28', '2026-03-25 12:03:28'),
(327, 5221, 2, 1, 25000, 1, NULL, '2026-04-02 11:56:07', '2026-04-02 11:56:07'),
(328, 5221, 3, 1, 15000, 1, NULL, '2026-04-02 11:56:07', '2026-04-02 11:56:07'),
(329, 5222, 193, 1, 20000, 1, NULL, '2026-04-16 11:21:51', '2026-04-16 11:21:51'),
(330, 5223, 174, 1, 1500, 1, NULL, '2026-04-22 19:11:58', '2026-04-22 19:11:58'),
(333, 5224, 72, 1, 25000, 1, NULL, '2026-05-04 10:47:11', '2026-05-04 10:47:11'),
(334, 5225, 69, 1, 15000, 1, NULL, '2026-05-19 16:18:30', NULL),
(335, 5226, 194, 1, 20000, 1, NULL, '2026-05-25 15:22:00', '2026-05-25 15:22:00'),
(336, 5227, 9, 1, 25000, 1, NULL, '2026-06-26 11:46:20', '2026-06-26 11:46:20'),
(338, 5229, 11, 1, 35000, 1, NULL, '2026-07-02 08:58:16', '2026-07-02 08:58:16'),
(339, 5230, 23, 1, 25000, 1, NULL, '2026-07-02 09:05:49', '2026-07-02 09:05:49'),
(340, 5231, 22, 1, 10000, 1, NULL, '2026-07-02 09:06:10', '2026-07-02 09:06:10'),
(341, 5232, 103, 1, 15000, 1, NULL, '2026-07-06 04:00:15', '2026-07-06 04:00:15'),
(343, 5233, 108, 1, 30000, 1, NULL, '2026-07-19 17:19:04', '2026-07-19 17:19:04'),
(344, 5234, 7, 1, 30000, 1, NULL, '2026-08-02 09:45:31', '2026-08-02 09:45:31'),
(346, 5236, 113, 2, 25000, 1, NULL, '2026-08-04 06:53:02', '2026-08-04 06:53:02'),
(347, 5236, 114, 1, 10000, 1, NULL, '2026-08-04 06:53:02', '2026-08-04 06:53:02'),
(348, 5237, 112, 1, 10000, 1, NULL, '2026-08-04 06:53:17', '2026-08-04 06:53:17'),
(349, 5238, 113, 1, 25000, 1, NULL, '2026-08-04 06:55:02', '2026-08-04 06:55:02'),
(350, 5238, 114, 1, 10000, 1, NULL, '2026-08-04 06:55:02', '2026-08-04 06:55:02'),
(351, 5239, 112, 1, 10000, 1, NULL, '2026-08-04 06:55:11', '2026-08-04 06:55:11'),
(353, 5241, 28, 1, 15000, 1, NULL, '2026-08-04 07:21:51', '2026-08-04 07:21:51'),
(354, 5242, 22, 1, 10000, 1, NULL, '2026-08-04 07:22:00', '2026-08-04 07:22:00'),
(355, 5243, 26, 1, 25000, 1, NULL, '2026-08-04 07:55:18', '2026-08-04 07:55:18'),
(356, 5243, 30, 1, 5000, 1, NULL, '2026-08-04 07:55:18', '2026-08-04 07:55:18'),
(357, 5244, 22, 1, 10000, 1, NULL, '2026-08-04 07:55:30', '2026-08-04 07:55:30'),
(358, 5235, 174, 200, 1500, 1, NULL, '2026-08-05 06:30:38', '2026-08-05 06:30:38'),
(359, 5245, 2, 1, 25000, 1, NULL, '2026-08-10 06:44:24', '2026-08-10 06:44:24'),
(361, 5247, 7, 1, 30000, 1, NULL, '2026-08-10 07:01:43', '2026-08-10 07:01:43'),
(362, 5248, 23, 1, 25000, 1, NULL, '2026-08-10 07:15:46', '2026-08-10 07:15:46'),
(363, 5249, 22, 1, 10000, 1, NULL, '2026-08-10 07:17:55', '2026-08-10 07:17:55'),
(365, 5251, 195, 1, 30000, 1, NULL, '2026-08-10 07:26:46', '2026-08-10 07:26:46'),
(366, 5252, 2, 1, 25000, 1, NULL, '2026-08-10 07:36:57', '2026-08-10 07:36:57'),
(367, 5253, 69, 1, 15000, 1, NULL, '2026-08-24 05:07:27', '2026-08-24 05:07:27'),
(368, 5254, 9, 1, 25000, 1, NULL, '2026-09-09 09:33:03', '2026-09-09 09:33:03'),
(369, 5255, 69, 1, 15000, 1, NULL, '2026-09-24 11:08:57', '2026-09-24 11:08:57'),
(370, 5256, 69, 1, 15000, 1, NULL, '2026-09-24 13:00:23', '2026-09-24 13:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `ratings` double NOT NULL,
  `review` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating_review`
--

INSERT INTO `rating_review` (`id`, `request_id`, `handyman_id`, `ratings`, `review`, `status_id`, `created_at`, `updated_at`) VALUES
(37, 2811, 0, 5, 'Great Service!', 1, '2026-02-18 08:48:33', '2026-02-18 05:48:33'),
(38, 2812, 0, 5, 'great', 1, '2026-02-18 09:00:04', '2026-02-18 06:00:04'),
(39, 2839, 4105, 1, 'poor timing', 1, '2026-03-21 12:08:21', '2026-03-21 09:08:21'),
(40, 2843, 4105, 5, 'good job', 1, '2026-04-02 12:00:04', '2026-04-02 09:00:04'),
(41, 2860, 4105, 5, 'great service', 1, '2026-06-26 11:50:38', '2026-06-26 08:50:38'),
(42, 2820, 4104, 5, NULL, 1, '2026-08-04 06:56:05', '2026-08-04 03:56:05'),
(43, 2873, 4105, 5, 'great service', 1, '2026-08-10 06:52:55', '2026-08-10 03:52:55'),
(44, 2874, 4105, 4, 'good service', 1, '2026-08-10 07:10:44', '2026-08-10 04:10:44'),
(45, 2875, 4105, 4, 'good service', 1, '2026-08-10 07:19:40', '2026-08-10 04:19:40'),
(46, 2876, 4105, 5, 'great work!', 1, '2026-08-10 07:30:08', '2026-08-10 04:30:08'),
(47, 2877, 4105, 5, 'good job!', 1, '2026-08-10 07:39:10', '2026-08-10 04:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `service_id` int NOT NULL,
  `address_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `attend_time` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_type` int NOT NULL DEFAULT '1',
  `status_id` int NOT NULL DEFAULT '1',
  `flag_status_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `service_id`, `address_id`, `company_id`, `attend_time`, `description`, `request_type`, `status_id`, `flag_status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2811, 124, 9, 67, NULL, '2026-02-18 13:00:00', 'Test', 1, 1, 13, '2026-02-18 08:34:50', '2026-02-18 08:48:33', NULL),
(2812, 124, 9, 67, NULL, '2026-02-18 13:14:00', 'Test', 1, 15, 13, '2026-02-18 08:54:28', '2026-02-18 09:00:04', NULL),
(2813, 124, 1, 67, NULL, '2026-02-18 13:52:00', 'test', 1, 1, 8, '2026-02-18 09:32:13', '2026-02-18 09:43:55', NULL),
(2814, 126, 1, 68, NULL, '2026-02-22 09:01:00', 'today', 1, 1, 8, '2026-02-22 03:47:22', '2026-03-25 14:32:04', NULL),
(2815, 127, 1, 69, NULL, '2026-02-22 15:11:00', 'Feni yangu ya chini imeharibika nataka aje kufix motor', 1, 1, 10, '2026-02-22 10:51:19', '2026-02-22 10:51:19', NULL),
(2816, 129, 3, 70, NULL, '2026-02-25 08:01:00', NULL, 1, 1, 12, '2026-02-24 20:21:54', '2026-04-21 12:26:58', NULL),
(2817, 130, 33, 71, NULL, '2026-02-27 14:01:00', NULL, 1, 1, 12, '2026-02-26 12:14:09', '2026-02-26 12:14:38', NULL),
(2818, 131, 6, 72, NULL, '2026-02-28 10:00:00', 'Installing curtain rods on 8 windows, please come with a ladder.', 1, 1, 12, '2026-02-26 16:47:01', '2026-03-01 18:52:49', NULL),
(2819, 129, 3, 70, NULL, '2026-03-08 08:01:00', NULL, 1, 1, 12, '2026-03-07 20:33:52', '2026-08-27 07:36:04', NULL),
(2820, 129, 3, 70, NULL, '2026-03-09 08:01:00', NULL, 1, 14, 13, '2026-03-07 20:35:55', '2026-08-04 06:56:05', NULL),
(2821, 129, 3, 70, NULL, '2026-03-08 10:01:00', NULL, 1, 14, 11, '2026-03-07 20:49:50', '2026-08-04 06:53:50', NULL),
(2822, 129, 3, 70, NULL, '2026-03-08 10:01:00', NULL, 1, 1, 12, '2026-03-07 20:57:46', '2026-08-27 07:36:57', NULL),
(2823, 129, 3, 70, NULL, '2026-03-08 10:01:00', NULL, 1, 1, 8, '2026-03-07 21:07:54', '2026-08-27 07:35:07', NULL),
(2824, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:10:28', '2026-08-27 07:34:43', NULL),
(2825, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 10, '2026-03-07 21:13:17', '2026-03-07 21:13:17', NULL),
(2826, 129, 3, 70, NULL, '2026-03-08 08:01:00', NULL, 1, 1, 12, '2026-03-07 21:15:05', '2026-08-27 07:35:55', NULL),
(2827, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:17:34', '2026-04-21 12:27:12', NULL),
(2828, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:17:56', '2026-08-27 07:37:29', NULL),
(2829, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 10, '2026-03-07 21:26:59', '2026-03-07 21:26:59', NULL),
(2830, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:28:47', '2026-08-27 07:37:59', NULL),
(2831, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:30:09', '2026-08-27 07:37:12', NULL),
(2832, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:31:52', '2026-08-27 07:38:12', NULL),
(2833, 129, 2, 74, NULL, '2026-03-08 10:00:00', 'test', 1, 1, 12, '2026-03-07 21:32:14', '2026-08-27 07:37:46', NULL),
(2834, 135, 9, 75, NULL, '2026-03-14 09:00:00', 'Check the 2 ACs and service them', 1, 1, 12, '2026-03-12 02:15:49', '2026-03-17 11:44:27', NULL),
(2835, 135, 25, 75, NULL, '2026-03-14 09:00:00', 'Check and fix the gas cooker and oven and re-label the knobs to make it easy to use', 1, 1, 12, '2026-03-12 02:19:44', '2026-03-17 11:44:50', NULL),
(2836, 134, 1, 76, NULL, '2026-03-13 18:33:00', NULL, 1, 1, 12, '2026-03-13 14:13:01', '2026-03-13 14:13:26', NULL),
(2837, 124, 9, 67, NULL, '2026-03-16 12:30:00', 'test', 1, 1, 8, '2026-03-16 06:24:54', '2026-03-16 06:37:53', NULL),
(2838, 137, 4, 85, NULL, '2026-03-22 11:00:00', NULL, 1, 1, 8, '2026-03-17 18:19:05', '2026-03-18 05:51:09', NULL),
(2839, 139, 1, 98, NULL, '2026-03-22 09:01:00', 'my heater is not working', 1, 1, 13, '2026-03-21 11:57:20', '2026-03-21 12:08:21', NULL),
(2840, 141, 1, 107, NULL, '2026-03-26 07:11:00', NULL, 1, 1, 10, '2026-03-25 12:01:15', '2026-03-25 12:01:15', NULL),
(2841, 141, 1, 108, NULL, '2026-03-27 08:01:00', NULL, 1, 1, 12, '2026-03-25 12:03:28', '2026-03-25 13:01:47', NULL),
(2842, 147, 9, 112, NULL, '2026-04-02 15:46:00', NULL, 1, 1, 8, '2026-04-02 11:26:22', '2026-04-02 11:28:38', NULL),
(2843, 147, 9, 112, NULL, '2026-04-03 11:00:00', NULL, 1, 1, 13, '2026-04-02 11:52:59', '2026-04-02 12:00:04', NULL),
(2844, 149, 26, 113, NULL, '2026-04-15 13:00:00', NULL, 1, 1, 8, '2026-04-15 08:09:23', '2026-04-15 08:17:41', NULL),
(2845, 149, 26, 113, NULL, '2026-04-15 13:00:00', NULL, 1, 1, 12, '2026-04-15 08:10:13', '2026-04-15 08:14:28', NULL),
(2846, 124, 26, 114, NULL, '2026-04-17 09:00:00', 'My EPC is not working', 1, 1, 12, '2026-04-16 11:21:51', '2026-04-16 11:25:22', NULL),
(2847, 124, 26, 114, NULL, '2026-04-17 10:00:00', 'my EPC is not working', 1, 1, 9, '2026-04-16 11:27:13', '2026-05-25 15:22:00', NULL),
(2848, 150, 1, 115, NULL, '2026-04-20 14:00:00', NULL, 1, 1, 7, '2026-04-20 09:00:39', '2026-04-20 09:00:39', NULL),
(2849, 151, 4, 117, NULL, '2026-04-23 09:00:00', NULL, 1, 1, 12, '2026-04-22 19:11:58', '2026-04-22 19:12:53', NULL),
(2850, 153, 2, 119, NULL, '2026-05-03 08:00:00', 'Bila kukosa', 1, 1, 15, '2026-05-02 18:06:19', '2026-05-04 11:31:30', NULL),
(2851, 161, 2, 121, NULL, '2026-05-19 18:00:00', 'Tap needs to be reattached to the water source', 1, 1, 12, '2026-05-19 16:18:29', NULL, NULL),
(2852, 129, 1, 74, NULL, '2026-05-22 08:01:00', NULL, 1, 1, 12, '2026-05-21 08:45:11', '2026-08-27 07:36:49', NULL),
(2853, 124, 9, 67, NULL, '2026-06-04 08:00:00', 'Testing', 1, 1, 7, '2026-06-03 13:56:17', '2026-06-03 13:56:17', NULL),
(2854, 124, 9, 67, NULL, '2026-06-04 09:00:00', 'testing', 1, 1, 7, '2026-06-03 14:35:50', '2026-06-03 14:35:50', NULL),
(2855, 124, 9, 67, NULL, '2026-06-04 08:00:00', 'Testing', 1, 1, 8, '2026-06-03 14:37:23', '2026-06-17 15:48:28', NULL),
(2856, 124, 9, 67, NULL, '2026-06-06 08:00:00', 'Testing', 1, 1, 7, '2026-06-05 09:40:09', '2026-06-05 09:40:09', NULL),
(2857, 129, 1, 70, NULL, '2026-06-11 13:00:00', 'picture', 1, 1, 8, '2026-06-11 08:38:56', '2026-06-17 15:47:51', NULL),
(2858, 129, 16, 74, NULL, '2026-06-18 08:00:00', 'test pics', 1, 1, 12, '2026-06-17 14:20:00', '2026-08-27 07:36:18', NULL),
(2859, 129, 16, 70, NULL, '2026-06-18 08:00:00', 'test', 1, 1, 12, '2026-06-17 14:37:46', '2026-08-27 07:36:28', NULL),
(2860, 124, 9, 67, NULL, '2026-06-26 17:00:00', 'Test', 1, 15, 13, '2026-06-26 11:39:18', '2026-06-26 11:50:38', NULL),
(2861, 167, 1, 124, NULL, '2026-07-01 07:00:00', NULL, 1, 1, 7, '2026-06-29 18:32:48', '2026-06-29 18:32:48', NULL),
(2862, 124, 9, 67, NULL, '2026-07-02 16:00:00', 'Testing', 1, 1, 15, '2026-07-02 08:53:39', '2026-07-24 11:57:57', NULL),
(2863, 124, 1, 114, NULL, '2026-07-02 17:00:00', 'Testing the App', 1, 14, 11, '2026-07-02 09:04:40', '2026-07-02 09:06:23', NULL),
(2864, 124, 1, 67, NULL, '2026-07-02 14:00:00', NULL, 1, 1, 7, '2026-07-02 09:14:20', '2026-07-02 09:14:20', NULL),
(2865, 168, 6, 125, NULL, '2026-07-06 10:00:00', 'Old Bagamoyo Avenue no. 27', 1, 1, 10, '2026-07-06 04:00:15', '2026-07-06 04:00:15', NULL),
(2866, 168, 6, 125, NULL, '2026-07-17 09:00:00', NULL, 1, 1, 8, '2026-07-14 14:48:39', '2026-07-14 14:59:50', NULL),
(2867, 173, 6, 127, NULL, '2026-07-19 17:55:00', 'mlango umegoma kufunguka, kitasa kimefeli. funguo ipo', 1, 1, 15, '2026-07-19 13:35:22', '2026-07-20 08:02:15', NULL),
(2868, 177, 1, 128, NULL, '2026-07-23 17:00:00', 'Hahaddf', 1, 1, 8, '2026-07-23 07:27:53', '2026-07-24 12:29:33', NULL),
(2869, 157, 9, 129, NULL, '2026-08-03 16:00:00', 'fuu', 1, 8, 10, '2026-08-02 09:45:31', '2026-08-03 09:16:04', NULL),
(2870, 178, 4, 131, NULL, '2026-08-04 10:00:00', 'Kupaka rangi maeneo ya ndani ya nyumba', 1, 1, 10, '2026-08-03 19:08:49', '2026-08-03 19:08:49', NULL),
(2871, 129, 1, 132, NULL, '2026-08-04 12:00:00', NULL, 1, 14, 11, '2026-08-04 07:21:21', '2026-08-04 07:22:28', NULL),
(2872, 129, 1, 132, NULL, '2026-08-04 12:15:00', NULL, 1, 14, 15, '2026-08-04 07:54:28', '2026-08-04 07:56:25', NULL),
(2873, 124, 9, 67, NULL, '2026-08-10 12:00:00', 'Testing App', 1, 15, 13, '2026-08-10 06:39:37', '2026-08-10 06:52:55', NULL),
(2874, 124, 9, 114, NULL, '2026-08-10 12:00:00', 'Testing the App', 1, 1, 13, '2026-08-10 06:57:06', '2026-08-10 07:10:44', NULL),
(2875, 124, 1, 67, NULL, '2026-08-10 12:00:00', 'Testing', 1, 15, 13, '2026-08-10 07:13:27', '2026-08-10 07:19:40', NULL),
(2876, 124, 26, 67, NULL, '2026-08-10 12:00:00', 'Testing the App', 1, 15, 13, '2026-08-10 07:22:13', '2026-08-10 07:30:08', NULL),
(2877, 124, 9, 67, NULL, '2026-08-10 12:00:00', 'Testing the App', 1, 1, 13, '2026-08-10 07:33:05', '2026-08-10 07:39:10', NULL),
(2878, 153, 2, 119, NULL, '2026-08-24 10:00:00', 'Off Senga Road on Kilimanjaro Street', 1, 1, 15, '2026-08-24 05:07:27', '2026-08-24 09:08:07', NULL),
(2879, 129, 2, 74, NULL, '2026-08-27 13:00:00', NULL, 1, 1, 7, '2026-08-27 08:19:14', '2026-08-27 08:19:14', NULL),
(2880, 124, 9, 67, NULL, '2026-09-09 13:00:00', 'Testing', 1, 1, 11, '2026-09-09 09:28:25', '2026-09-09 09:42:29', NULL),
(2881, 153, 2, 119, NULL, '2026-09-24 15:30:00', 'fixing a licking pipe/flexible', 1, 1, 10, '2026-09-24 11:08:57', '2026-09-24 11:08:58', NULL),
(2882, 153, 2, 119, NULL, '2026-09-24 17:20:00', 'flexible to be fixed', 1, 1, 10, '2026-09-24 13:00:23', '2026-09-24 13:00:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_cancellation_reason`
--

CREATE TABLE `request_cancellation_reason` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `description` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_cancellation_reason`
--

INSERT INTO `request_cancellation_reason` (`id`, `request_id`, `description`, `created_at`, `updated_at`) VALUES
(38, 2817, 'I was just testing the app.', '2026-02-26 12:14:38', '2026-02-26 12:14:38'),
(39, 2818, 'Other reasons.', '2026-03-01 18:52:49', '2026-03-01 18:52:49'),
(40, 2836, 'I was just testing the app.', '2026-03-13 14:13:26', '2026-03-13 14:13:26'),
(41, 2834, 'I was just testing the app.', '2026-03-17 11:44:27', '2026-03-17 11:44:27'),
(42, 2835, 'Other reasons.', '2026-03-17 11:44:50', '2026-03-17 11:44:50'),
(43, 2841, 'I solved the issue in another way.', '2026-03-25 13:01:47', '2026-03-25 13:01:47'),
(44, 2841, 'Other reasons.', '2026-03-25 13:02:00', '2026-03-25 13:02:00'),
(45, 2845, 'I was just testing the app.', '2026-04-15 08:14:28', '2026-04-15 08:14:28'),
(46, 2846, 'I was just testing the app.', '2026-04-16 11:25:22', '2026-04-16 11:25:22'),
(47, 2816, 'Other reasons.', '2026-04-21 12:26:58', '2026-04-21 12:26:58'),
(48, 2827, 'Changes on my schedule.', '2026-04-21 12:27:12', '2026-04-21 12:27:12'),
(49, 2849, 'I was just testing the app.', '2026-04-22 19:12:53', '2026-04-22 19:12:53'),
(50, 2851, 'Changes on my schedule.', '2026-05-19 16:43:13', NULL),
(51, 2824, 'I was just testing the app.', '2026-08-27 07:34:43', '2026-08-27 07:34:43'),
(52, 2826, 'I was just testing the app.', '2026-08-27 07:35:55', '2026-08-27 07:35:55'),
(53, 2819, 'I was just testing the app.', '2026-08-27 07:36:04', '2026-08-27 07:36:04'),
(54, 2858, 'I was just testing the app.', '2026-08-27 07:36:18', '2026-08-27 07:36:18'),
(55, 2859, 'I was just testing the app.', '2026-08-27 07:36:28', '2026-08-27 07:36:28'),
(56, 2852, 'I was just testing the app.', '2026-08-27 07:36:49', '2026-08-27 07:36:49'),
(57, 2822, 'I was just testing the app.', '2026-08-27 07:36:57', '2026-08-27 07:36:57'),
(58, 2831, 'I was just testing the app.', '2026-08-27 07:37:12', '2026-08-27 07:37:12'),
(59, 2828, 'I was just testing the app.', '2026-08-27 07:37:29', '2026-08-27 07:37:29'),
(60, 2833, 'I was just testing the app.', '2026-08-27 07:37:46', '2026-08-27 07:37:46'),
(61, 2830, 'I was just testing the app.', '2026-08-27 07:37:59', '2026-08-27 07:37:59'),
(62, 2832, 'I was just testing the app.', '2026-08-27 07:38:12', '2026-08-27 07:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `request_handyman`
--

CREATE TABLE `request_handyman` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `handyman_id` int NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `assigned_at` datetime DEFAULT NULL,
  `assigned_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `replacement_reason` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `previous_handyman_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_handyman`
--

INSERT INTO `request_handyman` (`id`, `request_id`, `handyman_id`, `status_id`, `assigned_at`, `assigned_by`, `replacement_reason`, `previous_handyman_id`, `created_at`, `updated_at`) VALUES
(146, 2811, 4105, 1, NULL, NULL, NULL, NULL, '2026-02-18 08:35:35', '2026-02-18 08:35:35'),
(147, 2812, 4105, 1, NULL, NULL, NULL, NULL, '2026-02-18 08:55:18', '2026-02-18 08:55:18'),
(148, 2813, 4105, 1, NULL, NULL, NULL, NULL, '2026-02-18 09:43:55', '2026-02-18 09:43:55'),
(149, 2820, 4104, 1, NULL, NULL, NULL, NULL, '2026-03-12 07:14:32', '2026-03-12 07:14:32'),
(150, 2838, 4115, 1, NULL, NULL, NULL, NULL, '2026-03-18 05:51:09', '2026-03-18 05:51:09'),
(151, 2839, 4105, 1, NULL, NULL, NULL, NULL, '2026-03-21 11:58:03', '2026-03-21 11:58:03'),
(152, 2837, 4117, 1, NULL, NULL, NULL, NULL, '2026-03-23 08:40:35', NULL),
(153, 2840, 4135, 1, NULL, NULL, NULL, NULL, '2026-03-25 12:58:06', '2026-03-25 12:58:06'),
(154, 2841, 4122, 1, NULL, NULL, NULL, NULL, '2026-03-25 12:59:44', '2026-03-25 12:59:44'),
(155, 2814, 4135, 1, NULL, NULL, NULL, NULL, '2026-03-25 14:32:04', '2026-03-25 14:32:04'),
(156, 2842, 4135, 1, NULL, NULL, NULL, NULL, '2026-04-02 11:28:38', '2026-04-02 11:28:38'),
(157, 2843, 4105, 1, NULL, NULL, NULL, NULL, '2026-04-02 11:53:47', '2026-04-02 11:53:47'),
(158, 2844, 4127, 1, NULL, NULL, NULL, NULL, '2026-04-15 08:17:41', '2026-04-15 08:17:41'),
(159, 2847, 4105, 1, NULL, NULL, NULL, NULL, '2026-04-16 11:27:58', '2026-04-16 11:27:58'),
(160, 2848, 4135, 1, NULL, NULL, NULL, NULL, '2026-04-20 09:06:17', '2026-04-20 09:06:17'),
(161, 2850, 4113, 1, NULL, NULL, NULL, NULL, '2026-05-03 05:41:38', '2026-05-03 05:41:38'),
(162, 2853, 4105, 1, NULL, NULL, NULL, NULL, '2026-06-03 14:20:17', '2026-06-03 14:20:17'),
(163, 2857, 4105, 1, NULL, NULL, NULL, NULL, '2026-06-17 15:47:51', '2026-06-17 15:47:51'),
(164, 2855, 4105, 1, NULL, NULL, NULL, NULL, '2026-06-17 15:48:28', '2026-06-17 15:48:28'),
(165, 2860, 4105, 1, NULL, NULL, NULL, NULL, '2026-06-26 11:42:41', '2026-06-26 11:42:41'),
(166, 2861, 4135, 1, NULL, NULL, NULL, NULL, '2026-06-30 06:28:10', '2026-06-30 06:28:10'),
(167, 2862, 4105, 1, NULL, NULL, NULL, NULL, '2026-07-02 08:55:35', '2026-07-02 08:55:35'),
(168, 2863, 4105, 1, NULL, NULL, NULL, NULL, '2026-07-02 09:05:12', '2026-07-02 09:05:12'),
(169, 2866, 4143, 1, NULL, NULL, NULL, NULL, '2026-07-14 14:59:50', '2026-07-14 14:59:50'),
(170, 2867, 4143, 1, NULL, NULL, NULL, NULL, '2026-07-19 15:16:42', '2026-07-19 15:16:42'),
(171, 2868, 4104, 1, NULL, NULL, NULL, NULL, '2026-07-24 12:29:33', '2026-07-24 12:29:33'),
(172, 2869, 4144, 1, NULL, NULL, NULL, NULL, '2026-08-02 10:35:51', '2026-08-02 10:35:51'),
(173, 2870, 4115, 1, NULL, NULL, NULL, NULL, '2026-08-04 05:01:48', '2026-08-04 05:01:48'),
(174, 2821, 4104, 1, NULL, NULL, NULL, NULL, '2026-08-04 06:52:40', '2026-08-04 06:52:40'),
(175, 2823, 4104, 1, NULL, NULL, NULL, NULL, '2026-08-04 07:19:01', '2026-08-04 07:19:01'),
(176, 2871, 4104, 1, NULL, NULL, NULL, NULL, '2026-08-04 07:21:40', '2026-08-04 07:21:40'),
(177, 2872, 4104, 1, NULL, NULL, NULL, NULL, '2026-08-04 07:54:42', '2026-08-04 07:54:42'),
(178, 2873, 4105, 1, NULL, NULL, NULL, NULL, '2026-08-10 06:42:21', '2026-08-10 06:42:21'),
(179, 2874, 4105, 1, NULL, NULL, NULL, NULL, '2026-08-10 06:58:06', '2026-08-10 06:58:06'),
(180, 2875, 4105, 1, NULL, NULL, NULL, NULL, '2026-08-10 07:14:30', '2026-08-10 07:14:30'),
(181, 2876, 4105, 1, NULL, NULL, NULL, NULL, '2026-08-10 07:23:43', '2026-08-10 07:23:43'),
(182, 2877, 4105, 1, NULL, NULL, NULL, NULL, '2026-08-10 07:36:32', '2026-08-10 07:36:32'),
(183, 2878, 4113, 1, NULL, NULL, NULL, NULL, '2026-08-24 05:36:39', '2026-08-24 05:36:39'),
(184, 2880, 4105, 1, NULL, NULL, NULL, NULL, '2026-09-09 09:30:08', '2026-09-09 09:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `status_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`id`, `request_id`, `status_id`, `created_at`, `updated_at`) VALUES
(747, 2811, 7, '2026-02-18 08:34:50', '2026-02-18 08:34:50'),
(748, 2811, 8, '2026-02-18 08:35:35', '2026-02-18 08:35:35'),
(749, 2811, 9, '2026-02-18 08:36:44', '2026-02-18 08:36:44'),
(750, 2811, 10, '2026-02-18 08:37:16', '2026-02-18 08:37:16'),
(751, 2811, 11, '2026-02-18 08:38:13', '2026-02-18 08:38:13'),
(752, 2811, 11, '2026-02-18 08:47:35', '2026-02-18 08:47:35'),
(753, 2811, 15, '2026-02-18 08:48:03', '2026-02-18 08:48:03'),
(754, 2811, 13, '2026-02-18 08:48:33', '2026-02-18 08:48:33'),
(755, 2812, 7, '2026-02-18 08:54:28', '2026-02-18 08:54:28'),
(756, 2812, 8, '2026-02-18 08:55:18', '2026-02-18 08:55:18'),
(757, 2812, 9, '2026-02-18 08:56:12', '2026-02-18 08:56:12'),
(758, 2812, 10, '2026-02-18 08:56:43', '2026-02-18 08:56:43'),
(759, 2812, 11, '2026-02-18 08:57:17', '2026-02-18 08:57:17'),
(760, 2812, 11, '2026-02-18 08:58:19', '2026-02-18 08:58:19'),
(761, 2812, 11, '2026-02-18 08:58:22', '2026-02-18 08:58:22'),
(762, 2812, 15, '2026-02-18 08:59:05', '2026-02-18 08:59:05'),
(763, 2812, 13, '2026-02-18 09:00:04', '2026-02-18 09:00:04'),
(764, 2813, 7, '2026-02-18 09:32:13', '2026-02-18 09:32:13'),
(765, 2813, 8, '2026-02-18 09:43:55', '2026-02-18 09:43:55'),
(766, 2814, 7, '2026-02-22 03:47:23', '2026-02-22 03:47:23'),
(767, 2815, 7, '2026-02-22 10:51:19', '2026-02-22 10:51:19'),
(768, 2816, 7, '2026-02-24 20:21:54', '2026-02-24 20:21:54'),
(769, 2817, 7, '2026-02-26 12:14:09', '2026-02-26 12:14:09'),
(770, 2817, 12, '2026-02-26 12:14:38', '2026-02-26 12:14:38'),
(771, 2818, 7, '2026-02-26 16:47:01', '2026-02-26 16:47:01'),
(772, 2818, 12, '2026-03-01 18:52:49', '2026-03-01 18:52:49'),
(773, 2819, 7, '2026-03-07 20:33:52', '2026-03-07 20:33:52'),
(774, 2820, 7, '2026-03-07 20:35:55', '2026-03-07 20:35:55'),
(775, 2821, 7, '2026-03-07 20:49:50', '2026-03-07 20:49:50'),
(776, 2822, 7, '2026-03-07 20:57:46', '2026-03-07 20:57:46'),
(777, 2823, 7, '2026-03-07 21:07:54', '2026-03-07 21:07:54'),
(778, 2824, 7, '2026-03-07 21:10:28', '2026-03-07 21:10:28'),
(779, 2825, 7, '2026-03-07 21:13:17', '2026-03-07 21:13:17'),
(780, 2826, 7, '2026-03-07 21:15:05', '2026-03-07 21:15:05'),
(781, 2827, 7, '2026-03-07 21:17:34', '2026-03-07 21:17:34'),
(782, 2828, 7, '2026-03-07 21:17:56', '2026-03-07 21:17:56'),
(783, 2829, 7, '2026-03-07 21:26:59', '2026-03-07 21:26:59'),
(784, 2830, 7, '2026-03-07 21:28:47', '2026-03-07 21:28:47'),
(785, 2831, 7, '2026-03-07 21:30:09', '2026-03-07 21:30:09'),
(786, 2832, 7, '2026-03-07 21:31:52', '2026-03-07 21:31:52'),
(787, 2833, 7, '2026-03-07 21:32:14', '2026-03-07 21:32:14'),
(788, 2834, 7, '2026-03-12 02:15:49', '2026-03-12 02:15:49'),
(789, 2835, 7, '2026-03-12 02:19:44', '2026-03-12 02:19:44'),
(790, 2820, 8, '2026-03-12 07:14:32', '2026-03-12 07:14:32'),
(791, 2836, 7, '2026-03-13 14:13:01', '2026-03-13 14:13:01'),
(792, 2836, 12, '2026-03-13 14:13:26', '2026-03-13 14:13:26'),
(793, 2837, 7, '2026-03-16 06:24:54', '2026-03-16 06:24:54'),
(794, 2834, 12, '2026-03-17 11:44:27', '2026-03-17 11:44:27'),
(795, 2835, 12, '2026-03-17 11:44:50', '2026-03-17 11:44:50'),
(796, 2838, 7, '2026-03-17 18:19:05', '2026-03-17 18:19:05'),
(797, 2838, 8, '2026-03-18 05:51:09', '2026-03-18 05:51:09'),
(798, 2839, 7, '2026-03-21 11:57:20', '2026-03-21 11:57:20'),
(799, 2839, 8, '2026-03-21 11:58:03', '2026-03-21 11:58:03'),
(800, 2839, 9, '2026-03-21 12:02:46', '2026-03-21 12:02:46'),
(801, 2839, 8, '2026-03-21 12:03:02', '2026-03-21 12:03:02'),
(802, 2839, 9, '2026-03-21 12:04:15', '2026-03-21 12:04:15'),
(803, 2839, 10, '2026-03-21 12:04:25', '2026-03-21 12:04:25'),
(804, 2839, 11, '2026-03-21 12:04:41', '2026-03-21 12:04:41'),
(805, 2839, 11, '2026-03-21 12:05:42', '2026-03-21 12:05:42'),
(806, 2839, 15, '2026-03-21 12:08:03', '2026-03-21 12:08:03'),
(807, 2839, 13, '2026-03-21 12:08:21', '2026-03-21 12:08:21'),
(808, 2837, 8, '2026-03-23 08:40:35', NULL),
(809, 2840, 8, '2026-03-25 12:01:15', '2026-03-25 12:58:06'),
(810, 2841, 8, '2026-03-25 12:03:28', '2026-03-25 12:59:44'),
(811, 2841, 12, '2026-03-25 13:01:47', '2026-03-25 13:01:47'),
(812, 2841, 12, '2026-03-25 13:02:00', '2026-03-25 13:02:00'),
(813, 2814, 8, '2026-03-25 14:32:04', '2026-03-25 14:32:04'),
(814, 2842, 7, '2026-04-02 11:26:22', '2026-04-02 11:26:22'),
(815, 2842, 8, '2026-04-02 11:28:38', '2026-04-02 11:28:38'),
(816, 2843, 7, '2026-04-02 11:52:59', '2026-04-02 11:52:59'),
(817, 2843, 8, '2026-04-02 11:53:47', '2026-04-02 11:53:47'),
(818, 2843, 9, '2026-04-02 11:56:07', '2026-04-02 11:56:07'),
(819, 2843, 10, '2026-04-02 11:57:14', '2026-04-02 11:57:14'),
(820, 2843, 11, '2026-04-02 11:57:56', '2026-04-02 11:57:56'),
(821, 2843, 15, '2026-04-02 11:59:02', '2026-04-02 11:59:02'),
(822, 2843, 13, '2026-04-02 12:00:04', '2026-04-02 12:00:04'),
(823, 2844, 7, '2026-04-15 08:09:23', '2026-04-15 08:09:23'),
(824, 2845, 7, '2026-04-15 08:10:13', '2026-04-15 08:10:13'),
(825, 2845, 12, '2026-04-15 08:14:28', '2026-04-15 08:14:28'),
(826, 2844, 8, '2026-04-15 08:17:41', '2026-04-15 08:17:41'),
(827, 2846, 7, '2026-04-16 11:21:51', '2026-04-16 11:21:51'),
(828, 2846, 12, '2026-04-16 11:25:22', '2026-04-16 11:25:22'),
(829, 2847, 7, '2026-04-16 11:27:13', '2026-04-16 11:27:13'),
(830, 2847, 8, '2026-04-16 11:27:58', '2026-04-16 11:27:58'),
(831, 2848, 8, '2026-04-20 09:00:39', '2026-04-20 09:06:17'),
(832, 2816, 12, '2026-04-21 12:26:58', '2026-04-21 12:26:58'),
(833, 2827, 12, '2026-04-21 12:27:12', '2026-04-21 12:27:12'),
(834, 2849, 7, '2026-04-22 19:11:58', '2026-04-22 19:11:58'),
(835, 2849, 12, '2026-04-22 19:12:53', '2026-04-22 19:12:53'),
(836, 2850, 8, '2026-05-02 18:06:19', '2026-05-03 05:41:38'),
(837, 2850, 11, '2026-05-03 11:47:12', '2026-05-03 11:47:12'),
(838, 2850, 15, '2026-05-04 11:31:30', '2026-05-04 11:31:30'),
(839, 2851, 7, '2026-05-19 16:18:29', NULL),
(840, 2851, 12, '2026-05-19 16:43:13', NULL),
(841, 2852, 7, '2026-05-21 08:45:11', '2026-05-21 08:45:11'),
(842, 2847, 9, '2026-05-25 15:22:00', '2026-05-25 15:22:00'),
(843, 2853, 8, '2026-06-03 13:56:17', '2026-06-03 14:20:17'),
(844, 2854, 7, '2026-06-03 14:35:50', '2026-06-03 14:35:50'),
(845, 2855, 7, '2026-06-03 14:37:23', '2026-06-03 14:37:23'),
(846, 2856, 7, '2026-06-05 09:40:09', '2026-06-05 09:40:09'),
(847, 2857, 7, '2026-06-11 08:38:56', '2026-06-11 08:38:56'),
(848, 2858, 7, '2026-06-17 14:20:00', '2026-06-17 14:20:00'),
(849, 2859, 7, '2026-06-17 14:37:46', '2026-06-17 14:37:46'),
(850, 2857, 8, '2026-06-17 15:47:51', '2026-06-17 15:47:51'),
(851, 2855, 8, '2026-06-17 15:48:28', '2026-06-17 15:48:28'),
(852, 2860, 7, '2026-06-26 11:39:18', '2026-06-26 11:39:18'),
(853, 2860, 8, '2026-06-26 11:42:41', '2026-06-26 11:42:41'),
(854, 2860, 9, '2026-06-26 11:46:20', '2026-06-26 11:46:20'),
(855, 2860, 10, '2026-06-26 11:47:12', '2026-06-26 11:47:12'),
(856, 2860, 11, '2026-06-26 11:47:59', '2026-06-26 11:47:59'),
(857, 2860, 11, '2026-06-26 11:48:38', '2026-06-26 11:48:38'),
(858, 2860, 15, '2026-06-26 11:50:18', '2026-06-26 11:50:18'),
(859, 2860, 13, '2026-06-26 11:50:38', '2026-06-26 11:50:38'),
(860, 2861, 8, '2026-06-29 18:32:48', '2026-06-30 06:28:10'),
(861, 2862, 7, '2026-07-02 08:53:39', '2026-07-02 08:53:39'),
(862, 2862, 8, '2026-07-02 08:55:36', '2026-07-02 08:55:36'),
(863, 2862, 9, '2026-07-02 08:57:11', '2026-07-02 08:57:11'),
(864, 2862, 8, '2026-07-02 08:57:43', '2026-07-02 08:57:43'),
(865, 2862, 9, '2026-07-02 08:58:16', '2026-07-02 08:58:16'),
(866, 2862, 10, '2026-07-02 08:58:59', '2026-07-02 08:58:59'),
(867, 2862, 11, '2026-07-02 08:59:23', '2026-07-02 08:59:23'),
(868, 2862, 11, '2026-07-02 09:02:30', '2026-07-02 09:02:30'),
(869, 2862, 11, '2026-07-02 09:02:40', '2026-07-02 09:02:40'),
(870, 2863, 7, '2026-07-02 09:04:40', '2026-07-02 09:04:40'),
(871, 2863, 8, '2026-07-02 09:05:12', '2026-07-02 09:05:12'),
(872, 2863, 9, '2026-07-02 09:05:49', '2026-07-02 09:05:49'),
(873, 2863, 14, '2026-07-02 09:06:10', '2026-07-02 09:06:10'),
(874, 2863, 11, '2026-07-02 09:06:23', '2026-07-02 09:06:23'),
(875, 2864, 7, '2026-07-02 09:14:20', '2026-07-02 09:14:20'),
(876, 2865, 7, '2026-07-06 04:00:15', '2026-07-06 04:00:15'),
(877, 2866, 7, '2026-07-14 14:48:39', '2026-07-14 14:48:39'),
(878, 2866, 8, '2026-07-14 14:59:50', '2026-07-14 14:59:50'),
(879, 2867, 8, '2026-07-19 13:35:22', '2026-07-19 15:16:42'),
(880, 2867, 11, '2026-07-19 17:19:52', '2026-07-19 17:19:52'),
(881, 2867, 15, '2026-07-20 08:02:15', '2026-07-20 08:02:15'),
(882, 2868, 7, '2026-07-23 07:27:53', '2026-07-23 07:27:53'),
(883, 2862, 15, '2026-07-24 11:57:57', '2026-07-24 11:57:57'),
(884, 2868, 8, '2026-07-24 12:29:33', '2026-07-24 12:29:33'),
(885, 2869, 8, '2026-08-02 09:45:31', '2026-08-02 10:35:51'),
(886, 2869, 12, '2026-08-03 08:58:10', '2026-08-03 08:58:10'),
(887, 2869, 8, '2026-08-03 09:16:04', '2026-08-03 09:16:04'),
(888, 2870, 8, '2026-08-03 19:08:49', '2026-08-04 05:01:48'),
(889, 2821, 8, '2026-08-04 06:52:40', '2026-08-04 06:52:40'),
(890, 2821, 9, '2026-08-04 06:53:02', '2026-08-04 06:53:02'),
(891, 2821, 14, '2026-08-04 06:53:17', '2026-08-04 06:53:17'),
(892, 2821, 11, '2026-08-04 06:53:50', '2026-08-04 06:53:50'),
(893, 2820, 9, '2026-08-04 06:55:02', '2026-08-04 06:55:02'),
(894, 2820, 14, '2026-08-04 06:55:11', '2026-08-04 06:55:11'),
(895, 2820, 11, '2026-08-04 06:55:21', '2026-08-04 06:55:21'),
(896, 2820, 15, '2026-08-04 06:55:45', '2026-08-04 06:55:45'),
(897, 2820, 13, '2026-08-04 06:56:05', '2026-08-04 06:56:05'),
(898, 2823, 8, '2026-08-04 07:19:01', '2026-08-04 07:19:01'),
(899, 2823, 9, '2026-08-04 07:19:13', '2026-08-04 07:19:13'),
(900, 2871, 7, '2026-08-04 07:21:21', '2026-08-04 07:21:21'),
(901, 2871, 8, '2026-08-04 07:21:40', '2026-08-04 07:21:40'),
(902, 2871, 9, '2026-08-04 07:21:51', '2026-08-04 07:21:51'),
(903, 2871, 14, '2026-08-04 07:22:00', '2026-08-04 07:22:00'),
(904, 2871, 11, '2026-08-04 07:22:28', '2026-08-04 07:22:28'),
(905, 2872, 7, '2026-08-04 07:54:28', '2026-08-04 07:54:28'),
(906, 2872, 8, '2026-08-04 07:54:42', '2026-08-04 07:54:42'),
(907, 2872, 9, '2026-08-04 07:55:18', '2026-08-04 07:55:18'),
(908, 2872, 14, '2026-08-04 07:55:30', '2026-08-04 07:55:30'),
(909, 2872, 11, '2026-08-04 07:55:54', '2026-08-04 07:55:54'),
(910, 2872, 15, '2026-08-04 07:56:25', '2026-08-04 07:56:25'),
(911, 2873, 7, '2026-08-10 06:39:37', '2026-08-10 06:39:37'),
(912, 2873, 8, '2026-08-10 06:42:21', '2026-08-10 06:42:21'),
(913, 2873, 9, '2026-08-10 06:44:24', '2026-08-10 06:44:24'),
(914, 2873, 10, '2026-08-10 06:49:19', '2026-08-10 06:49:19'),
(915, 2873, 11, '2026-08-10 06:50:11', '2026-08-10 06:50:11'),
(916, 2873, 11, '2026-08-10 06:51:05', '2026-08-10 06:51:05'),
(917, 2873, 11, '2026-08-10 06:51:06', '2026-08-10 06:51:06'),
(918, 2873, 15, '2026-08-10 06:52:04', '2026-08-10 06:52:04'),
(919, 2873, 13, '2026-08-10 06:52:55', '2026-08-10 06:52:55'),
(920, 2874, 7, '2026-08-10 06:57:06', '2026-08-10 06:57:06'),
(921, 2874, 8, '2026-08-10 06:58:06', '2026-08-10 06:58:06'),
(922, 2874, 9, '2026-08-10 06:59:34', '2026-08-10 06:59:34'),
(923, 2874, 8, '2026-08-10 07:00:10', '2026-08-10 07:00:10'),
(924, 2874, 9, '2026-08-10 07:01:43', '2026-08-10 07:01:43'),
(925, 2874, 10, '2026-08-10 07:02:49', '2026-08-10 07:02:49'),
(926, 2874, 11, '2026-08-10 07:08:08', '2026-08-10 07:08:08'),
(927, 2874, 15, '2026-08-10 07:08:45', '2026-08-10 07:08:45'),
(928, 2874, 13, '2026-08-10 07:10:44', '2026-08-10 07:10:44'),
(929, 2875, 7, '2026-08-10 07:13:27', '2026-08-10 07:13:27'),
(930, 2875, 8, '2026-08-10 07:14:30', '2026-08-10 07:14:30'),
(931, 2875, 9, '2026-08-10 07:15:46', '2026-08-10 07:15:46'),
(932, 2875, 14, '2026-08-10 07:17:55', '2026-08-10 07:17:55'),
(933, 2875, 11, '2026-08-10 07:18:34', '2026-08-10 07:18:34'),
(934, 2875, 15, '2026-08-10 07:19:00', '2026-08-10 07:19:00'),
(935, 2875, 13, '2026-08-10 07:19:40', '2026-08-10 07:19:40'),
(936, 2876, 7, '2026-08-10 07:22:13', '2026-08-10 07:22:13'),
(937, 2876, 8, '2026-08-10 07:23:43', '2026-08-10 07:23:43'),
(938, 2876, 9, '2026-08-10 07:25:17', '2026-08-10 07:25:17'),
(939, 2876, 8, '2026-08-10 07:25:56', '2026-08-10 07:25:56'),
(940, 2876, 9, '2026-08-10 07:26:46', '2026-08-10 07:26:46'),
(941, 2876, 10, '2026-08-10 07:27:59', '2026-08-10 07:27:59'),
(942, 2876, 11, '2026-08-10 07:28:39', '2026-08-10 07:28:39'),
(943, 2876, 11, '2026-08-10 07:29:22', '2026-08-10 07:29:22'),
(944, 2876, 15, '2026-08-10 07:29:42', '2026-08-10 07:29:42'),
(945, 2876, 13, '2026-08-10 07:30:08', '2026-08-10 07:30:08'),
(946, 2877, 7, '2026-08-10 07:33:05', '2026-08-10 07:33:05'),
(947, 2877, 8, '2026-08-10 07:36:32', '2026-08-10 07:36:32'),
(948, 2877, 9, '2026-08-10 07:36:57', '2026-08-10 07:36:57'),
(949, 2877, 10, '2026-08-10 07:37:25', '2026-08-10 07:37:25'),
(950, 2877, 11, '2026-08-10 07:37:44', '2026-08-10 07:37:44'),
(951, 2877, 15, '2026-08-10 07:38:18', '2026-08-10 07:38:18'),
(952, 2877, 13, '2026-08-10 07:39:10', '2026-08-10 07:39:10'),
(953, 2878, 8, '2026-08-24 05:07:27', '2026-08-24 05:36:39'),
(954, 2878, 11, '2026-08-24 08:09:43', '2026-08-24 08:09:43'),
(955, 2878, 15, '2026-08-24 09:08:07', '2026-08-24 09:08:07'),
(956, 2824, 12, '2026-08-27 07:34:43', '2026-08-27 07:34:43'),
(957, 2823, 8, '2026-08-27 07:35:07', '2026-08-27 07:35:07'),
(958, 2826, 12, '2026-08-27 07:35:55', '2026-08-27 07:35:55'),
(959, 2819, 12, '2026-08-27 07:36:04', '2026-08-27 07:36:04'),
(960, 2858, 12, '2026-08-27 07:36:18', '2026-08-27 07:36:18'),
(961, 2859, 12, '2026-08-27 07:36:28', '2026-08-27 07:36:28'),
(962, 2852, 12, '2026-08-27 07:36:49', '2026-08-27 07:36:49'),
(963, 2822, 12, '2026-08-27 07:36:57', '2026-08-27 07:36:57'),
(964, 2831, 12, '2026-08-27 07:37:12', '2026-08-27 07:37:12'),
(965, 2828, 12, '2026-08-27 07:37:29', '2026-08-27 07:37:29'),
(966, 2833, 12, '2026-08-27 07:37:46', '2026-08-27 07:37:46'),
(967, 2830, 12, '2026-08-27 07:37:59', '2026-08-27 07:37:59'),
(968, 2832, 12, '2026-08-27 07:38:12', '2026-08-27 07:38:12'),
(969, 2879, 7, '2026-08-27 08:19:14', '2026-08-27 08:19:14'),
(970, 2880, 7, '2026-09-09 09:28:25', '2026-09-09 09:28:25'),
(971, 2880, 8, '2026-09-09 09:30:08', '2026-09-09 09:30:08'),
(972, 2880, 9, '2026-09-09 09:33:03', '2026-09-09 09:33:03'),
(973, 2880, 10, '2026-09-09 09:33:59', '2026-09-09 09:33:59'),
(974, 2880, 11, '2026-09-09 09:42:29', '2026-09-09 09:42:29'),
(975, 2880, 11, '2026-09-09 09:43:09', '2026-09-09 09:43:09'),
(976, 2881, 7, '2026-09-24 11:08:57', '2026-09-24 11:08:57'),
(977, 2882, 7, '2026-09-24 13:00:23', '2026-09-24 13:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int NOT NULL,
  `service_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `created_at` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_name`, `status_id`, `priority`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Electrical', 1, 1, NULL, NULL, NULL),
(2, 'Plumbing', 1, 1, NULL, NULL, NULL),
(3, 'Satellite Dish', 1, 1, NULL, NULL, NULL),
(4, 'Painting', 1, 1, NULL, NULL, NULL),
(5, 'Windows', 1, 1, NULL, NULL, NULL),
(6, 'Carpentry', 1, 1, NULL, NULL, NULL),
(7, '', 2, 1, NULL, NULL, NULL),
(8, '', 2, 1, NULL, NULL, NULL),
(9, 'Air Condition (AC)', 1, 1, NULL, NULL, NULL),
(10, '', 2, 1, NULL, NULL, NULL),
(11, '', 2, 1, NULL, NULL, NULL),
(12, '', 2, 1, NULL, NULL, NULL),
(13, '', 2, 1, NULL, NULL, NULL),
(14, 'Aluminium & Glasswork', 1, 1, NULL, NULL, NULL),
(15, '', 2, 1, NULL, NULL, NULL),
(16, 'Fridge', 1, 1, NULL, NULL, NULL),
(17, 'CCTV Camera', 1, 1, NULL, NULL, NULL),
(18, '', 2, 1, NULL, NULL, NULL),
(19, '', 2, 1, NULL, NULL, NULL),
(20, '', 2, 1, NULL, NULL, NULL),
(21, '', 2, 1, NULL, NULL, NULL),
(22, '', 2, 1, NULL, NULL, NULL),
(23, '', 2, 1, NULL, NULL, NULL),
(24, 'macOS', 1, 1, NULL, NULL, NULL),
(25, 'Gas cookers & ovens', 1, 1, NULL, NULL, NULL),
(26, 'Pressure Cookers (EPCs)', 1, 1, NULL, NULL, NULL),
(27, 'Computer Repair', 1, 1, NULL, NULL, NULL),
(28, '', 2, 1, NULL, NULL, NULL),
(29, '', 2, 1, NULL, NULL, NULL),
(30, '', 2, 1, NULL, NULL, NULL),
(31, 'Induction Stoves', 1, 1, '2024-10-23 07:53:29', '2024-10-23 07:53:29', NULL),
(32, 'Air Fryers', 1, 1, '2024-10-23 07:55:06', '2024-10-23 07:55:06', NULL),
(33, 'Air Fryers', 1, 1, '2024-10-23 07:59:02', '2024-10-23 07:59:02', NULL),
(34, 'Air Fryers', 1, 1, '2024-10-23 08:00:14', '2024-10-23 08:00:14', NULL),
(35, 'Rice Cooker', 1, 1, '2024-10-23 08:06:25', '2024-10-23 08:06:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `handyman_id` int DEFAULT NULL,
  `session_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `fcm_token` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `device_desc` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_seen` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `user_id`, `handyman_id`, `session_code`, `fcm_token`, `status_id`, `device_desc`, `last_seen`, `created_at`, `updated_at`) VALUES
(320, NULL, 4104, '4104177134024821', 'e4lDEgKC50v5uBsf_qjKBQ:APA91bHn8aJplKZjk42BxmuQlWkv7U5z0CQcq2WV167he6hZ4eVGXRFVS-QQhr2Xia_SuPDddanyLxlEklkXOPLyqrC2DT5lgJywuiz03F5Qu1FxSj8CuHI', 1, 'ios Version 26.2.1 (Build 23C71)', '2026-02-17 17:57:28', '2026-02-17 14:57:28', '2026-02-17 14:57:28'),
(321, NULL, 4105, '4105177134857272', 'fCJWwiiz-k_ImQSVYxJyNg:APA91bHmcqwLLh5grmJKKMeCgBgguUwjWPY_qClGAz2G9-8VEUAYaEaZvuJlAyF1rsT0fechw_3DLxrc4a4K5T-6pUhIzvyu90WEmEVJxujBDU22bcyt0hk', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-02-17 20:16:12', '2026-02-17 17:16:12', '2026-02-17 17:16:12'),
(322, NULL, 4105, '4105177140353217', 'fCJWwiiz-k_ImQSVYxJyNg:APA91bHmcqwLLh5grmJKKMeCgBgguUwjWPY_qClGAz2G9-8VEUAYaEaZvuJlAyF1rsT0fechw_3DLxrc4a4K5T-6pUhIzvyu90WEmEVJxujBDU22bcyt0hk', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-02-18 11:32:12', '2026-02-18 08:32:12', '2026-02-18 08:32:12'),
(323, 124, NULL, '124177140357364', 'eMPjqQl5S0UXm7rbsVO2Qk:APA91bGCje3OAxCEir5p-09h-WVj7Ld-a-4-UoR9JMebc2WvGinmoKr9DPaLsehN9_X4gm9pQi_BGh-CzOCQQ4aZbHOOHD5kUVSgHl9snlmvHXm7aA_M0mc', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-02-18 11:32:53', '2026-02-18 08:32:53', '2026-02-18 08:32:53'),
(324, NULL, 4105, '4105177140665080', 'fCJWwiiz-k_ImQSVYxJyNg:APA91bHmcqwLLh5grmJKKMeCgBgguUwjWPY_qClGAz2G9-8VEUAYaEaZvuJlAyF1rsT0fechw_3DLxrc4a4K5T-6pUhIzvyu90WEmEVJxujBDU22bcyt0hk', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-02-18 12:24:10', '2026-02-18 09:24:10', '2026-02-18 09:24:10'),
(325, NULL, 4105, '4105177148458840', 'fCJWwiiz-k_ImQSVYxJyNg:APA91bHmcqwLLh5grmJKKMeCgBgguUwjWPY_qClGAz2G9-8VEUAYaEaZvuJlAyF1rsT0fechw_3DLxrc4a4K5T-6pUhIzvyu90WEmEVJxujBDU22bcyt0hk', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-02-19 10:03:08', '2026-02-19 07:03:08', '2026-02-19 07:03:08'),
(326, 125, NULL, '125177171242728', 'd4NFvmDdQ1WSU1_wgt4uOy:APA91bEUhbnx53mg01YWuG8FQLUmJnAsJQvfahnRZDvDs9_s02KvyxCGZ8RQJSbt3PVTGVFWAbYutdhUox_N1ymmUWkUa1RTUpcRdX65rqd6tPgZcHYmaOg', 1, 'android X682B-H694ABT-Q-GL-220729V430', '2026-02-22 01:20:27', '2026-02-21 22:20:27', '2026-02-21 22:20:27'),
(327, 126, NULL, '126177173180337', 'cTlJz_6v-kyztPSuHfLUvS:APA91bEfbiZamjb5uxI6YjpMk0h0TB4WWlUrRec4vkm7-H3EY4QIsxUZ2unfkbYR5iIeH-oKM5fsIBZcDLDn4WXBzeCUIgGA-_KdyDl9_kvG9j9mVMqq-Ko', 1, 'ios Version 26.2 (Build 23C55)', '2026-02-22 06:43:23', '2026-02-22 03:43:23', '2026-02-22 03:43:23'),
(328, 127, NULL, '127177175740567', 'd-PQbldak0rbkq24I3ndV3:APA91bGBpy6bECusU4dE3cmj5lFXHJNMEzuDwUsG0vYrCuhQCzXM3IfaTI37hxYM2ptpPQftcxCcB_cDYpAu4sH2QXoJmCgvdhjydv_0FT-d3pE6zKq6us4', 1, 'ios Version 16.7.14 (Build 20H370)', '2026-02-22 13:50:05', '2026-02-22 10:50:05', '2026-02-22 10:50:05'),
(329, 128, NULL, '128177176183617', 'dfsPxyIOKUMBun8rgNhfIp:APA91bF0bcQrRj6Y5LXTCXEosv-2rxYSYU1VnwEjg2slHMTqtZpvB6ROIfKy9OP7wsMlqYH_ocgi8VNq82dcQunhhaoDH9kS4TWMA6oRihfI8oOZtv3QldU', 1, 'ios Version 26.1 (Build 23B85)', '2026-02-22 15:03:57', '2026-02-22 12:03:56', '2026-02-22 12:03:56'),
(330, 129, NULL, '129177196441432', 'e4x6hyl-bU5xvDiIPpPduU:APA91bGccnyXKKOzHQumEUsWbwB0EEz40oO_tktxA1ynftvuWYLnAjut4CDpBIpG-AaWJX6DDpjpq-Q7ez0G_c5oY9J5ohaepavmGAUkZxGW-deytOWulYo', 1, 'ios Version 26.2.1 (Build 23C71)', '2026-02-24 23:20:14', '2026-02-24 20:20:14', '2026-02-24 20:20:14'),
(331, 130, NULL, '130177210733826', 'e4_RGN8KSQyXE74jXGWOeW:APA91bEdZnStlDOHIRp0aHcLbe_1LatfrwxAlb5PPHRL_qk_LJ4YH0y9PmCdwBd26-qdr6do8LOogGKqLXrgn9TZt9KeRuCuXFMb68cCAffaQ4wWU3MeIvo', 1, 'android R11st_11_C.19', '2026-02-26 15:02:18', '2026-02-26 12:02:18', '2026-02-26 12:02:18'),
(332, 131, NULL, '131177212399010', 'dRatrjAi8kUXiHW_Ha1B-v:APA91bFmtxvAp9Y7XoxPXtYuQfpHC1teNZ1WkTYh0XvVrtl8WjYrWEpYaLwo6qAyhyCU8XlDNwbwBpXbWM9LvgBJMNQPLNEcVRwMQYPhf3Rm5ZKXQ9S_rdk', 1, 'ios Version 18.3.2 (Build 22D82)', '2026-02-26 19:39:50', '2026-02-26 16:39:50', '2026-02-26 16:39:50'),
(333, 132, NULL, '132177278154139', 'cXK7rU4VSyirPxmkheXprN:APA91bG84jogruDBc-Yordl78AEibBtl0hQ3pdggHwDkOyc_yWrU3PX9Rb0W7tE3RElAqo_1j5Mik-KLZboJjxJxX_Rcxm0C6WumjF3ZwdaSuWkeRZG90So', 1, 'android CPH2581_15.0.0.863(EX01)', '2026-03-06 10:19:01', '2026-03-06 07:19:01', '2026-03-06 07:19:01'),
(334, NULL, 4104, '4104177291805369', 'e4lDEgKC50v5uBsf_qjKBQ:APA91bHn8aJplKZjk42BxmuQlWkv7U5z0CQcq2WV167he6hZ4eVGXRFVS-QQhr2Xia_SuPDddanyLxlEklkXOPLyqrC2DT5lgJywuiz03F5Qu1FxSj8CuHI', 1, 'ios Version 26.3 (Build 23D127)', '2026-03-08 00:14:13', '2026-03-07 21:14:13', '2026-03-07 21:14:13'),
(335, 133, NULL, '133177304990935', 'c3W4bK_kT1ygGsnJJaKVlt:APA91bFxl7eOXhzovszbBFVX-fxgic1oF6lUW0aqah1EyLUO1VxYixcwjavWHvUSVvQMrhgVm2S1LtsbQRiYcTprc0RFpHH40UKPSWfeHxGd48uO2TkcBDI', 1, 'android QP1A.190711.020.G960USQU9FVB2', '2026-03-09 12:51:49', '2026-03-09 09:51:49', '2026-03-09 09:51:49'),
(336, 134, NULL, '134177327898666', 'dtknGRcJSleC8-0Qj7vYGm:APA91bFnpqUSlCwwjLfLjlp9jgVC-ta4DuMKNFC07qeExmL_rNdsUIhBxQDQt-IHN1XIEJyv8Cy-k4rifGg2-cuOximJ3NSS_yr5abB8wdSItiwqDkoqYSU', 1, 'android UP1A.231005.007.A055FXXS9CYG2', '2026-03-12 04:29:46', '2026-03-12 01:29:46', '2026-03-12 01:29:46'),
(337, 135, NULL, '135177328119199', 'cJA7iJHITQiBraQDlDXF9l:APA91bEhhOmjRrYpp5vcuVppaYOhSfcvqj9lDO3WeoarG4p-sPIvbHewgD5OAiZOB6YkSRJ9I3QZzceGNFu_DVJJQCpNecbOoxyaMvUTMtT0efcfyoLPOeQ', 1, 'android BP2A.250605.031.A3.A256EXXS9DYK2', '2026-03-12 05:06:31', '2026-03-12 02:06:31', '2026-03-12 02:06:31'),
(338, 136, NULL, '136177359821368', 'cJVbnsyBQmOrhhjBPgZHLg:APA91bGlScLXPZ3nBgjF5m77e0mVX-nyAcPRfCeAU_PHQKdfOh3EgcMKTEbQhDS3XZaEPLcUuCKZHtxLvm0kws3msEH8TBWE2SOwMtEZWCarzzD5LF_PFyo', 1, 'android TQ3A.230805.001.S2', '2026-03-15 21:10:13', '2026-03-15 18:10:13', '2026-03-15 18:10:13'),
(339, 124, NULL, '124177364166470', 'e297cRVQSkQgvZUHi7puC-:APA91bFPXEhcVlYlarRTA92TB9hATOlHZ_X_D7WLbihij7OyOrByFUXuNkXkMOtWiLsIs5YZHFWJ7sp8NmwfHSeIh2tE4YxZBqkpiv57RaKZvQPVRDLvqZI', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-03-16 09:14:24', '2026-03-16 06:14:24', '2026-03-16 06:14:24'),
(340, NULL, 4105, '4105177364239146', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 18.6.2 (Build 22G100)', '2026-03-16 09:26:31', '2026-03-16 06:26:31', '2026-03-16 06:26:31'),
(341, 137, NULL, '137177377144849', 'dSvZoOUnE0P-hUXypMZS6e:APA91bH6rHyiuq-nz4APEX44roE6EKb1p5W8voCOmcuSSzU3lQYm4ouwzX1eJzCd_aBFrmS98j-AxO40a9k-ln9OhGNSCJy0OxnlqDGh-1GqZap1hVajEp4', 1, 'ios Version 18.5 (Build 22F76)', '2026-03-17 21:17:28', '2026-03-17 18:17:28', '2026-03-17 18:17:28'),
(342, NULL, 4115, '4115177381306390', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-18 08:51:03', '2026-03-18 05:51:03', '2026-03-18 05:51:03'),
(343, 124, NULL, '124177382375010', 'fCBHZDtHTU6JtsrN_xhgQS:APA91bELHhbxwgFkBg9DMCNqAYlL7TQ9z1KbM1M5QE0peRrUWBD9VcvJZGG9bkSskp2TI0lqSk_4Hn6j_v3-n5tLekMNZC3W5pIicNi0e1sFtjApaQ68mpU', 1, 'android X6525-F069ABCDEFGHIGaGbGcGdGeGfGgGhGiGmGnGoGq-TGo-OP-250919V1964', '2026-03-18 11:49:10', '2026-03-18 08:49:10', '2026-03-18 08:49:10'),
(344, 138, NULL, '138177382514948', 'c504GiSevUCShWmczvcKTv:APA91bFHbP4ZTqJmtMzDPj73Z6bkYIQP1AGQz5t_suTZ4BBrGbNgo4yQiLy4IUqWFzy_Rosazcb_yUqsskHXPJYs6x9b-trrI0Wsi02z5wPAqM0RSJrx4kA', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-18 12:12:29', '2026-03-18 09:12:29', '2026-03-18 09:12:29'),
(345, NULL, 4104, '4104177382774524', 'e4lDEgKC50v5uBsf_qjKBQ:APA91bHn8aJplKZjk42BxmuQlWkv7U5z0CQcq2WV167he6hZ4eVGXRFVS-QQhr2Xia_SuPDddanyLxlEklkXOPLyqrC2DT5lgJywuiz03F5Qu1FxSj8CuHI', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-18 12:55:45', '2026-03-18 09:55:45', '2026-03-18 09:55:45'),
(346, 124, NULL, '124177386645222', 'fo75PME9H0cPvHl9TGgKal:APA91bFTzKLAN_t9g_eZQPdvNLDCr6lLnQcQwtL9IuxvHG0MG1VXUhHGxrVoKfLNz5X1kyBrlXqNPbVEbIXU4YztXSvZXq9qaUQrIbS5QBfK7oiedp8P0QU', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-18 23:40:52', '2026-03-18 20:40:52', '2026-03-18 20:40:52'),
(347, NULL, 4105, '4105177392668226', 'ckkL3ip5Tq2s7vXlBkRDo6:APA91bHMcTzLuSW7xcPWBXHqs0TS7PXKGeprCqcAl2rnFIfE93MtX6IygKpnOwhK-hcRvtdvA5sVV-ZgGKj5uH-PG1l179kXMt44dghyjTwwiUnRcxx3PYI', 1, 'android AP4A.250105.002', '2026-03-19 16:24:42', '2026-03-19 13:24:42', '2026-03-19 13:24:42'),
(348, NULL, 4105, '4105177392672871', 'e4lDEgKC50v5uBsf_qjKBQ:APA91bHn8aJplKZjk42BxmuQlWkv7U5z0CQcq2WV167he6hZ4eVGXRFVS-QQhr2Xia_SuPDddanyLxlEklkXOPLyqrC2DT5lgJywuiz03F5Qu1FxSj8CuHI', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-19 16:25:28', '2026-03-19 13:25:28', '2026-03-19 13:25:28'),
(349, NULL, 4105, '4105177392780856', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-03-19 16:43:28', '2026-03-19 13:43:28', '2026-03-19 13:43:28'),
(350, NULL, 4117, '4117177400122317', 'dRV54v7dQkiO5ZzI5j7P7r:APA91bFyTxmnoe0sxghBXKe2ayhRUc9vm8UXidWAgINJr_VE1LnxwZp4mgaXa3Sfhaom88k-pKgOK3a_iMVfATqMhAplZFCDqV-Erf7xz5UPqtYD-rTYCis', 1, 'android KI7-V7510AACDGHJKLMN-T-GL-250218V5302', '2026-03-20 13:07:03', '2026-03-20 13:07:03', NULL),
(351, NULL, 4105, '4105177404333052', 'd7H3Zf7BSg23YEyDoSf20g:APA91bHIx-4PlL_coYCixRKjB2CW7sZkevAHN7JjAnEIL7_Nwg9PsSt_fMFfMSOv-EvaByaEtB06qAXDcP9ZyAiFxvmtFVVJshJKoi7T4Kx_Xg1EuynfPgE', 1, 'android X6525-F069ABCDEFGHIGaGbGcGdGeGfGgGhGiGmGnGoGq-TGo-OP-250919V1964', '2026-03-21 00:48:50', '2026-03-20 21:48:50', '2026-03-20 21:48:50'),
(352, 139, NULL, '139177409397466', 'eYgeODvYPk43s7F0Xbyi7n:APA91bGXFNQQLjJaDSCowtYSfjVP0SfiyhUgQVWD65DxLylz0XRDUJ3r3BnORk00tPj2g4HQ6hOUE96lx_fBy4L7GTT88DNePlqYT99TwoXqGPp240zHDxY', 1, 'ios Version 26.2.1 (Build 23C71)', '2026-03-21 14:52:54', '2026-03-21 11:52:54', '2026-03-21 11:52:54'),
(353, 139, NULL, '139177409411212', 'eYgeODvYPk43s7F0Xbyi7n:APA91bGXFNQQLjJaDSCowtYSfjVP0SfiyhUgQVWD65DxLylz0XRDUJ3r3BnORk00tPj2g4HQ6hOUE96lx_fBy4L7GTT88DNePlqYT99TwoXqGPp240zHDxY', 1, 'ios Version 26.2.1 (Build 23C71)', '2026-03-21 14:55:12', '2026-03-21 11:55:12', '2026-03-21 11:55:12'),
(354, 140, NULL, '140177429844925', 'eJ_R5vVgQcC6FjNyoHTAIc:APA91bGbiippLSI8u8gGiy3Z_opuafA-yqXJsE-q3Q3CAjgUzrkXSlVZGNaOxHHmbdlow9ZVqPMvlvfA91yp5QLN6XQmHel6T3_eFvjLCUBwdy3ZtnGPLEk', 1, 'android BP2A.250605.031.A3.A566BXXS9BZB7', '2026-03-23 23:40:49', '2026-03-23 20:40:49', '2026-03-23 20:40:49'),
(355, NULL, 4117, '4117177435801067', 'dRV54v7dQkiO5ZzI5j7P7r:APA91bFyTxmnoe0sxghBXKe2ayhRUc9vm8UXidWAgINJr_VE1LnxwZp4mgaXa3Sfhaom88k-pKgOK3a_iMVfATqMhAplZFCDqV-Erf7xz5UPqtYD-rTYCis', 1, 'android KI7-V7510AACDGHJKLMN-T-GL-250218V5302', '2026-03-24 16:13:30', '2026-03-24 16:13:30', NULL),
(356, 141, NULL, '141177443971445', 'cxa6QX2gSvCiYymajGTONN:APA91bGQNMV3Sg2Ec6Rjn8BBTEfPAU3oZP4KoT-zcnIc8U-Ew4Ofv0anSDIs2rvq8Yv0f2Ug0T7MotsBmFo8SlJb3axa1wHQIXcAxyg1PL9gHWhX0-xEJ5o', 1, 'android AP3A.240905.015.A2.A055FXXSDDZA1', '2026-03-25 14:55:14', '2026-03-25 11:55:14', '2026-03-25 11:55:14'),
(357, 142, NULL, '142177444599572', 'ccRSYhtSR1WuXQc3BuQ226:APA91bFWtc_c_bCvpcSCgRgOeA28P3X0-QQ06Kadxj6ac4RiMmidyxO5ZD2S__DMugPSmjmuW_5S-UXnbqjoVO94t4-mTB1iOoEXcg19OZWKpKtCsPO2BIc', 1, 'android X6525D-F069MIaIbIc-UGo-OP-240621V624', '2026-03-25 16:39:55', '2026-03-25 13:39:55', '2026-03-25 13:39:55'),
(358, 143, NULL, '143177444892340', 'ecb0xeUQQYGN7pVjveWQ-i:APA91bFw-L1UmVP8Ekl2MNs3IhGpuvjtG_ParEeajNNGcyBe5jVWkxbKgwOuss-6tPPNqQM-xVD2o_gevylsMiAR46md9W_suQ9Ywms9n-p4ju80n8hnH5s', 1, 'android CD7-H6214ABDE-Q-GL-211201V787', '2026-03-25 17:28:43', '2026-03-25 14:28:43', '2026-03-25 14:28:43'),
(359, NULL, 4135, '4135177444911051', 'd01qznxNR0azO4Zvj_xdYB:APA91bGyUWQKzZIwIUA7aU-gpj6qdC7lD3qFWgy6D_bvEExcMuVyHi7vxkW-HWdEpD1_Cdhe-ZZz1EQubWzamQiDgRFVO553Vq8nnlNIDy1k3S-R35QrBa0', 1, 'android TP1A.220624.014.A127FXXSDDXJ1', '2026-03-25 17:31:50', '2026-03-25 14:31:50', '2026-03-25 14:31:50'),
(360, 144, NULL, '144177447066837', 'fFpFOc5rIUgOpxzOnWTvrv:APA91bFhDrWF8JobP8Kpej9L5HVBZwS4Sp7TBYo2plDmComi4hK-ZVzOoua6D6A_9rvidncrGBNF5ONU3uNVrRU2y4yE2w1GtRfP0R5SEVnY2Sb3pmufMqo', 1, 'ios Version 26.2.1 (Build 23C71)', '2026-03-25 23:31:08', '2026-03-25 20:31:08', '2026-03-25 20:31:08'),
(361, 145, NULL, '145177485326782', 'dNaZYCKiQpueLWZssF_S7B:APA91bEOVGYAdwTZZTTNLIXXXShT6ZEB4D0Y58l9gCZVDDNqI09osZCQMBKfSFUAClnh8MjqygYXQZNVyL2GIRxZh-uRhjb3woeRTlKYPpuqqz816xUDUKw', 1, 'android V23R072B', '2026-03-30 09:47:47', '2026-03-30 06:47:47', '2026-03-30 06:47:47'),
(362, 146, NULL, '146177487024297', 'eddqe3KJRnqqO5Zsv2MEhp:APA91bFrqwc73KnOqXZIfTLpTpvafLEP3ZJxeWDKPEXT7977LJ1TqQLkLcvKyctLiYavWu-On2w-aIr58eFsmcDGA-jKP-vUzJS2elY5RxBuqG5LBPT8g9Y', 1, 'android Nova 50 Pro-M-HORSE-V01-20250116', '2026-03-30 14:30:42', '2026-03-30 11:30:42', '2026-03-30 11:30:42'),
(363, 146, NULL, '146177487057767', 'eddqe3KJRnqqO5Zsv2MEhp:APA91bFrqwc73KnOqXZIfTLpTpvafLEP3ZJxeWDKPEXT7977LJ1TqQLkLcvKyctLiYavWu-On2w-aIr58eFsmcDGA-jKP-vUzJS2elY5RxBuqG5LBPT8g9Y', 1, 'android Nova 50 Pro-M-HORSE-V01-20250116', '2026-03-30 14:36:17', '2026-03-30 11:36:17', '2026-03-30 11:36:17'),
(364, 147, NULL, '147177512902016', 'ccCP0MdlokS9gQAGc7hZsu:APA91bEypp7zXYIVCmp3xLqT2mLR_R4PtcfKW_9jSoLy6unv44MaUJF4ZW9VtU0nfs9CjyD_-vE1GNgzatYoyW67Xz4UcIRAkdKULMRru8YD8eGGDnLdx3Q', 1, 'ios Version 16.7.15 (Build 20H380)', '2026-04-02 14:23:40', '2026-04-02 11:23:40', '2026-04-02 11:23:40'),
(365, NULL, 4105, '4105177512929538', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (a) (Build 23D771330a)', '2026-04-02 14:28:15', '2026-04-02 11:28:15', '2026-04-02 11:28:15'),
(366, 148, NULL, '148177581910054', 'f2rGUaLpQFiGvHiQ5c0uzW:APA91bHEno30FgiDNUaDgGyREZB-_ApU3w9wma8vJmzlSzvRCvoTVNDpVDyDm-o0aAf7TLqJUDKLc4Zv9ASGeF3ildP1ZwdmwaaZmOZyZD1v9MB4kR1eAEQ', 1, 'android CPH2823_15.0.2.704(EX01)', '2026-04-10 14:05:00', '2026-04-10 11:05:00', '2026-04-10 11:05:00'),
(367, 149, NULL, '149177623803520', 'f4VJ_c0XQ2KVDoJvEGeSWN:APA91bED5l1r8MSTSm0obnhnUamkrPSG-bkNOHpfUTfIVJh7PfoBJqbQHi9nF8d_2yZZ8dUWZ36vcqkOK9ojkJU_PQH6IseSlXGpMrkUviai0N60I97hr7w', 1, 'android BP2A.250605.031.A3.S9010ZHSAGZB4', '2026-04-15 10:27:15', '2026-04-15 07:27:15', '2026-04-15 07:27:15'),
(368, NULL, 4127, '4127177623806694', 'c5xk7HhuQSO3u0pDjbADSE:APA91bFr8j25B0RpCqFbqjzxBPkrcc5FyJQFdtCWUZy9Xy9fexZlxGOpNLWZcx5jo0rjPdjeA28tioacNI-v2TdJOVIWgcK5IlR4x8cm-Qoiyz_2-Upw0t0', 1, 'android TP1A.220624.014.N770FXXS9HXA3', '2026-04-15 10:27:46', '2026-04-15 07:27:46', '2026-04-15 07:27:46'),
(369, 149, NULL, '149177624476184', 'f4VJ_c0XQ2KVDoJvEGeSWN:APA91bED5l1r8MSTSm0obnhnUamkrPSG-bkNOHpfUTfIVJh7PfoBJqbQHi9nF8d_2yZZ8dUWZ36vcqkOK9ojkJU_PQH6IseSlXGpMrkUviai0N60I97hr7w', 1, 'android BP2A.250605.031.A3.S9010ZHSAGZB4', '2026-04-15 12:19:21', '2026-04-15 09:19:21', '2026-04-15 09:19:21'),
(370, 150, NULL, '150177667557566', 'd7BoS69Bn0A3taeSVtvL8p:APA91bGq0HA6DZF5ZrbPDap0WY21b6sluAGa0ocrySHOMmBWBjM2V-7GlTQAURyyfwl1UVdk6BONChnGZluZS2XdAFWI-rHbmnl9xLw4GDn6KqY2iyihU54', 1, 'ios Version 26.4.1 (Build 23E254)', '2026-04-20 11:59:35', '2026-04-20 08:59:35', '2026-04-20 08:59:35'),
(371, NULL, 4135, '4135177667587388', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (a) (Build 23D771330a)', '2026-04-20 12:04:33', '2026-04-20 09:04:33', '2026-04-20 09:04:33'),
(372, NULL, 4135, '4135177667603856', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (a) (Build 23D771330a)', '2026-04-20 12:07:18', '2026-04-20 09:07:18', '2026-04-20 09:07:18'),
(373, NULL, 4105, '4105177667620379', 'e2y9i97kDkt-kRNB1XxWZY:APA91bEYGBvEJ9l-eBjVd3FWmEkiSRPJoeUqBMjgg58WRyCJzTcs-6PJ05brlv5bHwAADM4-KaLoJBmPX5aRCO9WZKNLqU8FxOVIEIXmtdxQTLSuLGmAy4A', 1, 'ios Version 26.3.1 (a) (Build 23D771330a)', '2026-04-20 12:10:03', '2026-04-20 09:10:03', '2026-04-20 09:10:03'),
(374, 151, NULL, '151177688494474', 'c3DOVhm0UUoHngpnwKeQ9V:APA91bGs0V4LtDnPhxFf1LGqqFSqcL246suUxoUKmpfPJeKnFo3oZDNqcm8Gw7YDIeda1_he3T2EaC8FLktJNqQ-67UrCPnflwPLMOW2z_E0GGYZZ6Dzlrg', 1, 'ios Version 26.3.1 (a) (Build 23D771330a)', '2026-04-22 22:09:04', '2026-04-22 19:09:04', '2026-04-22 19:09:04'),
(375, 152, NULL, '152177746490893', 'cFvCdqW5QQinOBZo1xc32D:APA91bHsMmVn7GK-F5_ViWU8uQPTe_k_PwXkYgKwp69Z-5e7b5HlStUVD9wwzK3hWaACGOpkmi-Z7vRlqn6NepvoviAWV_htCcTWci5kI15q16KIG9_wuao', 1, 'android CP1A.260405.005', '2026-04-29 15:15:08', '2026-04-29 12:15:08', '2026-04-29 12:15:08'),
(376, 153, NULL, '153177774502091', 'eY9lruIa70VHtpvH7blghA:APA91bF1ptB4UT7VaqzA7YFLr7C8a1vaFjfdqy4XgWYLR5Y7fkNC06-Q5hOSqfTrgbvHpjjYCZaeBV4o124M_l3a6MuF807KmJ-MVeTh2trCH_IBHwYI34g', 1, 'ios Version 26.3.1 (Build 23D8133)', '2026-05-02 21:03:40', '2026-05-02 18:03:40', '2026-05-02 18:03:40'),
(377, NULL, 4113, '4113177778668864', 'c-xjDMP7YkCfvh4kKlGG_z:APA91bFjZmp-SIviKU14foZEXB5-MzXAM3EuJQ-CIkqkXWujEIJgygB4qprfPLGR5ZQ-OyCwD_tHtfVIDa-AIMxLyNfLjzj8ja7QCOVhNYhJC6Cy-i3Sqfs', 1, 'ios Version 26.4.2 (Build 23E261)', '2026-05-03 08:38:08', '2026-05-03 05:38:08', '2026-05-03 05:38:08'),
(378, 154, NULL, '154177781615961', 'd9R_A_xlS7-ZSxYa2aXAtI:APA91bExiT5SUC3gkwJTUzSIWKyh1aZirbanAHCW0Fvl-0z9OQkB99fIj2tYdxKg1iJ8RbXevNfESjqVAmjKWZkzUEgCPBOG9LIt6u8xU4RInsYNVONoB7E', 1, 'android RP1A.200720.012.A226LKLU2AVA2', '2026-05-03 16:49:19', '2026-05-03 13:49:19', '2026-05-03 13:49:19'),
(379, 155, NULL, '155177876143078', 'cLlaskc3N0puutodYS9w5e:APA91bH3xhB-ZhjqSmfdZpIjTFJTO26RzK-3u6oJ_yy3BqFDAHzhNzVsbpJh0l4mJlS_5tuoOUk1y_7mfmM9Zz71PWUBcfOmX8gnLqV50njTgcz0HWsheyE', 1, 'ios Version 26.4.2 (Build 23E261)', '2026-05-14 15:23:50', '2026-05-14 12:23:50', '2026-05-14 12:23:50'),
(380, 124, NULL, '124177876223870', 'cLlaskc3N0puutodYS9w5e:APA91bH3xhB-ZhjqSmfdZpIjTFJTO26RzK-3u6oJ_yy3BqFDAHzhNzVsbpJh0l4mJlS_5tuoOUk1y_7mfmM9Zz71PWUBcfOmX8gnLqV50njTgcz0HWsheyE', 1, 'ios Version 26.4.2 (Build 23E261)', '2026-05-14 15:37:18', '2026-05-14 12:37:18', '2026-05-14 12:37:18'),
(381, 156, NULL, '156177876499985', 'caJjzftRRneVd32RapKhYZ:APA91bEVLLjw8oRWDiDbCUQ0F-x1C8H7mhn7fASyifwa_8fXg0XmK1lba0kki0331GQa1gWKkOZJ2LUqwxcaYp6KB3z_oZigIM21ZD318o6zKMMF-JNflQk', 1, 'android CP1A.260405.005', '2026-05-14 16:23:19', '2026-05-14 13:23:19', '2026-05-14 13:23:19'),
(382, 157, NULL, '157177876808297', 'eTjoxZI2FEq7p0s6ir_btC:APA91bH3xSnOA2phYy5-G7VamuPFkIs4fmouebXcTyd01JsFhhpFqeEvBSzLfuKsQHdk9LKCaJEM9SiP58NEQdI7CAQLUWK_pUG_NVwAU_x_qq5d6KA7f_I', 1, 'ios Version 18.5 (Build 22F76)', '2026-05-14 17:14:42', '2026-05-14 14:14:42', '2026-05-14 14:14:42'),
(383, 157, NULL, '157177876817642', 'eTjoxZI2FEq7p0s6ir_btC:APA91bH3xSnOA2phYy5-G7VamuPFkIs4fmouebXcTyd01JsFhhpFqeEvBSzLfuKsQHdk9LKCaJEM9SiP58NEQdI7CAQLUWK_pUG_NVwAU_x_qq5d6KA7f_I', 1, 'ios Version 18.5 (Build 22F76)', '2026-05-14 17:16:16', '2026-05-14 14:16:16', '2026-05-14 14:16:16'),
(384, 158, NULL, '158177877613548', 'cfA58QqUQ0eCR86_yKa0kX:APA91bF8JdP64BTFzGnVYGYuR1nqz3esjNuCBN5eXeWrANjj86LGKa9jT_RtNUXmxi_Wnx_2UQ_dx1HTjqhU-5S6mdlBZ11foB0HyJwbvaiK2Sn6QNRF4uc', 1, 'android BP2A.250605.031.A3.A165FXXS6CYL1', '2026-05-14 19:28:55', '2026-05-14 16:28:55', '2026-05-14 16:28:55'),
(385, 159, NULL, '159177877879740', 'ffyxvxlHfUu_kYrfZzesfK:APA91bF5PKa4RjBmoR8GxcOfW6kFnT5CY4XcOFQLucQBb6dob7hngCNDIL_JhxteKk7D_kYy8fTCGBno6n-ntC-Ofg6iy9vk8iQNjesIohws35p_rIrZvFI', 1, 'ios Version 26.4.2 (Build 23E261)', '2026-05-14 20:13:17', '2026-05-14 17:13:17', '2026-05-14 17:13:17'),
(386, 160, NULL, '160177910691761', 'f60iW3xDSTOqpoC8ZA5zvX:APA91bHkamhM4c8NLiu7va8Am7Xn0F1MGnGh3KVNiDDQ9HBec2nDnz3rypH8DtkERpXqBlmXDgmNgcO-xpnH3vTS1XpAjgHbj0P4PVUwEpejijMFERS_oiY', 1, 'android BP2A.250605.031.A3.A566BXXSABZD2', '2026-05-18 15:21:57', '2026-05-18 12:21:57', '2026-05-18 12:21:57'),
(387, 161, NULL, '161177919650821', 'dc2U7Rr2TkykE9H_6D43XT:APA91bGhw8PZxqt_hx-G8Gc7Kc0jEE42bksYkhuYrMdCttT3YBSwzlvOsYvoYpPBEvTF59nQiHQeonB0uf3Wlqol-doKxiCIV7vktyidm3JeK2MWuY9e4rc', 1, 'android BP2A.250605.031.A3.A556EXXSECZD1', '2026-05-19 16:15:08', '2026-05-19 16:15:08', NULL),
(388, 162, NULL, '162178049017280', 'f0086Xv8MkpFqDkD9IcfdV:APA91bGFi20SLLf1itv4ZO3zp6TzZ7ApNz_kFrIOzncXLLr69q5uV98yrmcv56bYV70vwb6SRDiu2D525b9qbidfWxgzSHy3INPvcgConMilhpJML8Yjmw8', 1, 'ios Version 18.7.9 (Build 22H355)', '2026-06-03 15:36:12', '2026-06-03 12:36:12', '2026-06-03 12:36:12'),
(389, 124, NULL, '124178049488924', 'cTz79Snp10V9mPHn5_Ya1z:APA91bGD853DQ9vHJ_hs0tNELx2VlGaXtn4ZikxblRCt0tLMp4AjyZdDh9GcJSgJUhnUJq3Tv7hNDTR3y_mLJQVn6tcf3RCJrQ-LvT8xae0HFNO_iFqYSog', 1, 'ios Version 26.5 (Build 23F77)', '2026-06-03 16:54:49', '2026-06-03 13:54:49', '2026-06-03 13:54:49'),
(390, NULL, 4105, '4105178049633411', 'cKYl6CR8q0PqlMiyFizMsU:APA91bE8YLtXOZx3C9pyM0Lt6ReH611Bg8rGzmm2UjOQTfycgHFir9JMSXeM1s-oWp77bKPeLfmMuNfl8vs2IECDC_kZwHC7XM15-QCJYyKvDUMkaYAQjxg', 1, 'ios Version 26.5 (Build 23F77)', '2026-06-03 17:18:54', '2026-06-03 14:18:54', '2026-06-03 14:18:54'),
(391, 124, NULL, '124178065224071', 'fQvwLV4_HUipmoB6yRxp5j:APA91bGGhlIm-IhW73JZAn74M470k7xjkjdwI8PBXpX17CH_AlDn7r2VyZ4j5gxIXKA72cP76FPiOns2MtHNxLFgZe9roON3I0eBQrxOcZZacglZRSl7JAE', 1, 'ios Version 26.5 (Build 23F77)', '2026-06-05 12:37:20', '2026-06-05 09:37:20', '2026-06-05 09:37:20'),
(392, 163, NULL, '163178093440720', 'cYsOCX_WRYSIZGkyQ8PJNR:APA91bHYy5d65eVILLQSNihXXcRzaNwv-rT6ETh3VtxzyUUDj5dnSqAtzpd8KzViPxeBwzuq2U0_0vzWV9t28DgVXiymfnGpQDGwYW_pHJ5zGEq0zB6qNsc', 1, 'android QKQ1.200628.002 test-keys', '2026-06-08 19:00:07', '2026-06-08 16:00:07', '2026-06-08 16:00:07'),
(393, 164, NULL, '164178222889369', 'fQbXRqU0SZ6W8ZW_X2TYh-:APA91bHr-L0IBeC45TtMTKKZc1IwpX9L0_O4cGUWOZZdhQorytzEUyuANzd4_-NyjMO_-U4tqbgy2f8PbF6tej82i501TUjADaF4zyb-APr-bjj6tiXye4s', 1, 'android TP1A.220624.014.A325NKSU3DWE3', '2026-06-23 18:34:53', '2026-06-23 15:34:53', '2026-06-23 15:34:53'),
(394, 165, NULL, '165178222942155', 'eulnI7GART6QJxCMXYkva1:APA91bEY1gv0hQ2PqBvfCxoyFe3fY7j82ikjBCQ-IWXZnwYNrR7bsHnGauvUGSv4K6d_GofIlx7C1AambjaaRfbPC8-Jz6L8UPPDQUVPqZP73F70X37QvdM', 1, 'android TP1A.220624.014.N986USQSEHYH1', '2026-06-23 18:43:41', '2026-06-23 15:43:41', '2026-06-23 15:43:41'),
(395, 124, NULL, '124178247387753', 'cBz0kvTbp0teq-Y2HtrXET:APA91bGRXweOpe8bTShaRRWJM9qbLB9OFiiIbPxOWfqNOiPhMb4lgPXgT4I2tNPrRfc3foiZN8G3EZx8uIACnJeB4tCpRnJnt515ywlaZjpA6dIdnyOXsjQ', 1, 'ios Version 26.5.1 (Build 23F81)', '2026-06-26 14:37:57', '2026-06-26 11:37:57', '2026-06-26 11:37:57'),
(396, NULL, 4105, '4105178247414613', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.1 (Build 23F81)', '2026-06-26 14:42:26', '2026-06-26 11:42:26', '2026-06-26 11:42:26'),
(397, NULL, 4105, '4105178247429686', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.1 (Build 23F81)', '2026-06-26 14:44:56', '2026-06-26 11:44:56', '2026-06-26 11:44:56'),
(398, 166, NULL, '166178254152434', 'cXRDELlWSLm0nchGX75fsy:APA91bGUvljdR3x35i6nG_clRrlCX9qc-QGmeCbxoHxNj3NFd4PRcdTou4Z4qkqA6UChQFTFO2ef1VeXJSS37xVnN1nWKmYz0OWR4WHrZU6BSs9fQlxUm6s', 1, 'android BP2A.250605.031.A3.A175FXXS5BZD2', '2026-06-27 09:25:24', '2026-06-27 06:25:24', '2026-06-27 06:25:24'),
(399, 167, NULL, '167178275781051', 'eAmhLqFHSMCC10hQWGX1MZ:APA91bHD1rYYi03sgjJp1Wj0RhBxpi6Sy5QVtoIc5_o6wrCGKQkvjHYB8Zx8fObmMb4W7MpeEvu5je7_nAduVPMfwgd6EUqrv3YcxX7GFSaySusnXZEivJ4', 1, 'android TP1A.220624.014.A032FXXS9CZA2', '2026-06-29 21:30:10', '2026-06-29 18:30:10', '2026-06-29 18:30:10'),
(400, 168, NULL, '168178276317143', 'fg_OwuGIR5KIoNyQNBS2FV:APA91bECCSc1jrI3yLfvocso88ekbU0pl5KM5ejCOa2zU50S1zRJwEcehFnfOznTq7sNSlhnAYLlhKbyPskhXq5mvuy6efJfAMxwCvksNpuut08NlXZa8p0', 1, 'android BP4A.251205.006.S918BXXSAFZE1', '2026-06-29 22:59:31', '2026-06-29 19:59:31', '2026-06-29 19:59:31'),
(401, 169, NULL, '169178276408595', 'caECQcE8ReGtabuHSnVRus:APA91bEZCrR6UUZgKYuV5Hpt_TiAjCIkFZZOsStvWuxl-8qSsUgNu_H6Y-F6ddOcrpS56KlUL2NYAC31dei1MK4X_yeOcBePqPoiRts_za7NF3a80SdgUIE', 1, 'android SP1A.210812.016.A125FXXS6CXJ5', '2026-06-29 23:14:45', '2026-06-29 20:14:45', '2026-06-29 20:14:45'),
(402, 170, NULL, '170178279579445', 'edsS564fT5GocconjuD4te:APA91bE-dL-Gq0rNFJugchlzreI20MhZqtrFF79mLLqoQWAZyIkGuEpCzFFOVxde5W24cjyarOZ05Aejf3lFSQ8b-pffpEIuJZ2s3zxPumPcMgtf3hmgaCs', 1, 'android UP1A.231005.007.M236LKSSDEZB2', '2026-06-30 08:03:14', '2026-06-30 05:03:14', '2026-06-30 05:03:14'),
(403, 171, NULL, '171178369170626', 'ft8sulvzTLOWBVy0uOay71:APA91bEi7RFTokbF5MMllF0dzlo42t-ZWrTsZqQMMGFw42lvhkW7uiZHEhjfzgw97Dc8m6LwFORwZQu1OvudSjy2mKkYleVvv2l_q6eD7YjLQ2cZeSzqvN0', 1, 'android BP4A.251205.006.A546EXXUJFZE9', '2026-07-10 16:55:06', '2026-07-10 16:55:06', NULL),
(404, 172, NULL, '172178376791634', 'd8SHuWXMTPCO9l2XJlylN5:APA91bGNCsK6Lduti69jjviBHdy8H9oLe0S5QC3lsvWhIpfErp25tEENDU290vS0ZYH6dFiiSNFn0f4DW_WX6Ii1Z9EDMhPBRG4Co1fITl9dTsvdQsCuyxk', 1, 'android BP4A.251205.006.S918U1UES7FZE3', '2026-07-11 14:05:16', '2026-07-11 11:05:16', '2026-07-11 11:05:16'),
(405, NULL, 4143, '4143178404118196', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.1 (Build 23F81)', '2026-07-14 17:59:41', '2026-07-14 14:59:41', '2026-07-14 14:59:41'),
(406, 173, NULL, '173178446803814', 'dc1cKMoh30bekPNlBTaTFp:APA91bFzo-iwPwbaAfysXFB65PaBSEHsGWE1QovZ0NeZLv-pdR0pEpHWEsKSrdi9P9jPjb-Ob-BcQ2p_-WRX6wYowr5reXQnXRdwLulqm489oSMO49ypqkM', 1, 'ios Version 26.5.2 (Build 23F84)', '2026-07-19 16:33:58', '2026-07-19 13:33:58', '2026-07-19 13:33:58'),
(407, NULL, 4143, '4143178446925955', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.2 (Build 23F84)', '2026-07-19 16:54:19', '2026-07-19 13:54:19', '2026-07-19 13:54:19'),
(408, 173, NULL, '173178453370573', 'dc1cKMoh30bekPNlBTaTFp:APA91bFzo-iwPwbaAfysXFB65PaBSEHsGWE1QovZ0NeZLv-pdR0pEpHWEsKSrdi9P9jPjb-Ob-BcQ2p_-WRX6wYowr5reXQnXRdwLulqm489oSMO49ypqkM', 1, 'ios Version 26.5.2 (Build 23F84)', '2026-07-20 10:48:25', '2026-07-20 07:48:25', '2026-07-20 07:48:25'),
(409, 174, NULL, '174178455982294', 'ex08TZuhsE-Mv6IylIg-Ry:APA91bH_GSgizjsxrIuCWM1Z0K1aLnmc_KiS6c2C5srJ2yYlk9Pfe5UlDRtQRwwhVxuhvr2qSbVWePuMcf8IEI3V_idWvhqzsrDV8Mn5Do2cNFiw-dcH7wE', 1, 'ios Version 16.7.16 (Build 20H392)', '2026-07-20 18:03:42', '2026-07-20 15:03:42', '2026-07-20 15:03:42'),
(410, 175, NULL, '175178456304432', 'f0pk1zL6QX6KqJs3FTVWMP:APA91bEXwo_g7CNgwhqQuLBc0oH_dbXZFADPF1jrQ3tEaCdIhHZFLYBb5X3mOzt0NHZUxG_ZEHdRDvuvE1Z-q2TMF8LH0L_yh9zZyRu269szPCVGmcQWcP0', 1, 'android BP4A.251205.006.A165FXXSADZF2', '2026-07-20 18:57:24', '2026-07-20 15:57:24', '2026-07-20 15:57:24'),
(411, 175, NULL, '175178456333739', 'f0pk1zL6QX6KqJs3FTVWMP:APA91bEXwo_g7CNgwhqQuLBc0oH_dbXZFADPF1jrQ3tEaCdIhHZFLYBb5X3mOzt0NHZUxG_ZEHdRDvuvE1Z-q2TMF8LH0L_yh9zZyRu269szPCVGmcQWcP0', 1, 'android BP4A.251205.006.A165FXXSADZF2', '2026-07-20 19:02:17', '2026-07-20 16:02:17', '2026-07-20 16:02:17'),
(412, 176, NULL, '176178461653928', 'cGgMc1nQR5uco56Y5YvJ8j:APA91bHLzR4LSIU6sCbnE2h_XGtxk6GuIANL2jq_FVDm9ESmUV7TN5FzE7Vl3q85YuZTRbtvS_CIR7K_kCkxEowwr_3f_3b_RVQ9K_C7qW1kBcACevJnIKA', 1, 'android X693-H697BCDEFTU-R-GL-230524V832', '2026-07-21 09:48:59', '2026-07-21 06:48:59', '2026-07-21 06:48:59'),
(413, 176, NULL, '176178461733591', 'cGgMc1nQR5uco56Y5YvJ8j:APA91bHLzR4LSIU6sCbnE2h_XGtxk6GuIANL2jq_FVDm9ESmUV7TN5FzE7Vl3q85YuZTRbtvS_CIR7K_kCkxEowwr_3f_3b_RVQ9K_C7qW1kBcACevJnIKA', 1, 'android X693-H697BCDEFTU-R-GL-230524V832', '2026-07-21 10:02:15', '2026-07-21 07:02:15', '2026-07-21 07:02:15'),
(414, 177, NULL, '177178479135534', 'ftOlJrsGQTabQTwVlqL6Y3:APA91bGIr6-pZNRRuWvnwkb31oKW9npRQ4fqGA5e5vnyj0e2UHawGqi0gxvzIHov9LLk9BZYk6Upfo_dwyqjJtFfHP5X_zgt_enjy1JEZt2CCGb6B1kZasU', 1, 'android CP2A.260705.006', '2026-07-23 10:22:35', '2026-07-23 07:22:35', '2026-07-23 07:22:35'),
(415, NULL, 4104, '4104178489587722', 'e4lDEgKC50v5uBsf_qjKBQ:APA91bHn8aJplKZjk42BxmuQlWkv7U5z0CQcq2WV167he6hZ4eVGXRFVS-QQhr2Xia_SuPDddanyLxlEklkXOPLyqrC2DT5lgJywuiz03F5Qu1FxSj8CuHI', 1, 'ios Version 26.5 (Build 23F77)', '2026-07-24 15:24:37', '2026-07-24 12:24:37', '2026-07-24 12:24:37'),
(416, NULL, 4144, '4144178566677470', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.2 (Build 23F84)', '2026-08-02 13:32:54', '2026-08-02 10:32:54', '2026-08-02 10:32:54'),
(417, 178, NULL, '178178578363832', 'dVfzMxAbRluowcbaGTpdrZ:APA91bHOmkCk7TSuxwiIOfup-PVE8tmybliho8PSChHCLvyKPOH3LzgwAqHFExycss4wJNoCZH962WnH4yqm4y6floyyPi54IUkmtVepFfCRKPOya9tuVK4', 1, 'android SP1A.210812.016.G975USQU6IVE7', '2026-08-03 22:00:38', '2026-08-03 19:00:38', '2026-08-03 19:00:38'),
(418, 179, NULL, '179178612863041', 'fGcKfY-LQTSTI2oVpmtVIv:APA91bHSGKmCnEDjUKc2L4fGhyH-Wc9MmmKqSlFwtN1qLi4K41eLsDNkPPwMLf7B2CGInxp-9XhZ1OnGBQu7PxEpBnV-NNRitb6R06uKe5SJShGDWn7JUHw', 1, 'android BP2A.250605.031.A3.S908USQU8GYJ1', '2026-08-07 21:50:30', '2026-08-07 18:50:30', '2026-08-07 18:50:30'),
(419, NULL, 4105, '4105178634411990', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.5.2 (Build 23F84)', '2026-08-10 09:41:59', '2026-08-10 06:41:59', '2026-08-10 06:41:59'),
(420, 180, NULL, '180178645584227', 'eWiWUqk-Rn6CmZtNwRBiug:APA91bGLp6-3BEzUHWlCrVKePkd998hy0cUbHhwLas_jq9HwLxQU8rn71J7Ha0XSRU-0tw1qhHTvgfrECG_ZcEdbz-DfZnCQHbXrJLEmpNedP419402Yu5s', 1, 'android SP1A.210812.016.G973USQU9IXE3', '2026-08-11 16:44:02', '2026-08-11 13:44:02', '2026-08-11 13:44:02'),
(421, 152, NULL, '152178672382194', 'dHUPLGzFTiSZ0bVbtmbi6A:APA91bG-zykD_7glIL0K5WuiZeP6MNSA7z2JzinDfCjE_zU-6LENawFEYQwwC_40tL_NQAoY63Y0z6vUDBXdEWlTfGlbUVQQZNcJugCHaMT_gc1ZCdfgOqo', 1, 'android CP2A.260705.006', '2026-08-14 19:10:21', '2026-08-14 16:10:21', '2026-08-14 16:10:21'),
(422, 181, NULL, '181178690448170', 'fBNOXEE_Ts-4hOR3JzWte-:APA91bH70vvTlkycyZIcxhMLW4rad2GVJAIptOwkm1FSD8GrEVR9dpOVKIVQzl4XlBxf47csZHYn_AQUZfffmu6QVRNpWiy9KocRAliTi8FPOiY-F45xrPU', 1, 'android AP3A.240905.015.A2.A057FXXSEDZE2', '2026-08-16 21:21:21', '2026-08-16 18:21:21', '2026-08-16 18:21:21'),
(423, 182, NULL, '182178696595812', 'e1tb-aoeRrGy9f2_Rkl0G9:APA91bGPFS648sTnjYyj19uz6WZJdDUe8jlUPlZrTgQO0jX0AMT52t7KKNXS7gx44Kk-vf7gl_VC4Th9MNRrwjcz1D8LIwRyVIHS11-3aI9Q8dweGac9_vk', 1, 'android 14.9_Z2453_AXIAN', '2026-08-17 14:25:58', '2026-08-17 11:25:58', '2026-08-17 11:25:58'),
(424, 183, NULL, '183178750519993', 'felpAiuYQUgWk-peO1lbAE:APA91bFFuoo2XPWrpNtZ24ER6Wu2hliFAwghNDAYFU1bfyXStTWrVtlnV0wXmVBsppKxsCzUfOG2P9loBspmd1ooPpgYwy1MHTOw2MA1nvj948NC27WrUoM', 1, 'ios Version 26.6 (Build 23G71)', '2026-08-23 20:13:19', '2026-08-23 17:13:19', '2026-08-23 17:13:19'),
(425, NULL, 4113, '4113178754965464', 'eet5XG3ppEY_oL6aJMTCeN:APA91bGTiS4aexS8rXzt7ec2CKEN0Nh06A9yMowfJxzD2IRVA5QGWfsUHf9zch-G_jlPTZ-3EWLK7ogsGrpKnYToBZE9TeQxr6x0voRTbl5EZOCfcVYU7xI', 1, 'ios Version 26.6 (Build 23G71)', '2026-08-24 08:34:14', '2026-08-24 05:34:14', '2026-08-24 05:34:14'),
(426, 184, NULL, '184178757000428', 'dk00CtWrSXy33q-kxJtRjj:APA91bFLWQrBopLIn5qvdeyfLZ4-7V1UkaUFSg2G2MxRAkcXJ8kGkzlNF7BkUV-ioAeYdxveKMSjccjXE7psRi24Jy0hT0NSTK0Sc046KHldCm4_UXXNdyo', 1, 'android CP2A.260705.006', '2026-08-24 14:13:24', '2026-08-24 11:13:24', '2026-08-24 11:13:24'),
(427, 124, NULL, '124178780549536', 'cFJmH8ehTjmplNMUnKmT5z:APA91bHsOzcXD7-ag8hEJx-EDX_sYzUjBZPLCALwmOxVODxLdFbdclgfwv7JdlmOyslzEztCvUpTA29bGgMWJudK-bHEO6pDmuRszaB7YPuv3kB3ot2vQNw', 1, 'android X6525-F069ABCDEFGHIGaGbGcGdGeGfGgGhGiGmGnGoGq-TGo-OP-250919V1964', '2026-08-27 07:38:15', '2026-08-27 04:38:15', '2026-08-27 04:38:15'),
(428, 124, NULL, '124178781870082', 'c0phrcBISD21davtfU9Q0C:APA91bHNWKaLsFnpIDn474vg84MpT5nJ1KACe5xC66OOJ94UBq8wQPeIzMmFwhe5BfchF5CFEJmV49WomZ4yhGonfKV-yDj5IaCw32dlj4rThXmatXIfiEM', 1, 'android BP4A.251205.006.A176BXXS6CZG7', '2026-08-27 11:18:20', '2026-08-27 08:18:20', '2026-08-27 08:18:20'),
(429, 185, NULL, '185178802101337', 'dV6hultTQEGuRQY-YqNOcK:APA91bGQuHAjq_dmX14jzKHQIILiIf3tqdv7MZtohooebw_TpyejSLPLS-V7bFKtjXnQmyoFU331hXcZQ3YuG-SrN2Prcc9rx9UPJK4bUbKZesvF-TX0nzc', 1, 'android KL5-XK678ABCDEFGHIJKLMNAc-U-OP-260615V2258', '2026-08-29 19:30:13', '2026-08-29 16:30:13', '2026-08-29 16:30:13'),
(430, 124, NULL, '124178894588485', 'f4CBWRGpWUM_gp6CgJtsgw:APA91bERwPCOnUXNdLiL-FL41igvXc-mLSfUgqEYHXSvR4WJf8PFFgZarObPMdC-RwRbTC2B1ovwOLI-2pAEfzjzoOd_2FY0cLvn4J70WJ0SdtKlBne3x9w', 1, 'ios Version 26.6.1 (Build 23G83)', '2026-09-09 12:24:44', '2026-09-09 09:24:44', '2026-09-09 09:24:44'),
(431, NULL, 4105, '4105178894606920', 'e7crPYkZmE5EnqnSj7wxOa:APA91bFYvQcopQwueCU-B5DgOHMnq6iWgMZCWRqF7nYSXCI6tOLnoUFEMoripPOMnP84oQnT0dE6RnahREVKzOb5RyzNRMz1NZuP89tFZOat81InRghR-48', 1, 'ios Version 26.6.1 (Build 23G83)', '2026-09-09 12:27:49', '2026-09-09 09:27:49', '2026-09-09 09:27:49'),
(432, 129, NULL, '129179083403114', 'eb-PZU-ZbEcAv0rv0UUr_v:APA91bE2n2Xpaic_Vik8GYx_jw7o1ad8p_a7bJWQT6pEdyeLgu4mEXY5Sow0YjdSkYWVAuuVmfq36XuWNU1Poy5HoXLMV5lU1HEEzZK6JB0EDwelS3Mjzs4', 1, 'ios Version 26.6.1 (Build 23G83)', '2026-10-01 08:53:51', '2026-10-01 05:53:51', '2026-10-01 05:53:51'),
(433, 186, NULL, '186179086282876', 'fNxmWZVJQ6iYCgK2P8ALUo:APA91bHAAqJNA1peS-GOKosw2XAT8CbM8GBBR6n57JMWOmOeGS8BpMLF0ENOBskxbDmChPbRV_SYxjBsTNVo175jonSmSDFJC6D_HTbWuFVyksearOV-Ugw', 1, 'android UP1A.231005.007', '2026-10-01 16:53:48', '2026-10-01 13:53:48', '2026-10-01 13:53:48'),
(434, 187, NULL, '187179140600694', 'd0kpAiUsQECG2DPna2jYH3:APA91bHY9BI2r89VFCXy7TFTU6n4Ct1VTE053hn8bOod_YNb-Mih5m8T2o0Ue48W_mnYHc2YuMsoqE2jnVWq-T1BZaJHMP_yCDuNLSeVg9_X30aSE6JeCG0', 1, 'android BP4A.251205.006.A075FXXS7CZI1', '2026-10-07 23:46:46', '2026-10-07 20:46:46', '2026-10-07 20:46:46'),
(435, 188, NULL, '188179162557614', 'epU9rCIfiEY7oTnEeH2iAR:APA91bEbcWOffnASYTKuO09xozcic6bVLnwKM5JcIyO3SlIZtY2fQOp6Nxm2fW9Rjp_qNuj3jx_EB-muFl2PYXVD23u10y9CMHcrLAgzQ_6N33WK4V7OOwI', 1, 'ios Version 26.6.2 (Build 23G90)', '2026-10-10 12:46:16', '2026-10-10 09:46:16', '2026-10-10 09:46:16'),
(436, 189, NULL, '189179180751438', 'e-uplIWpR_aHGKhKgUHWPY:APA91bEYN87o4YAM2cfKkxgq_uQzExWnidc6rh4fyoocRqY7cHW5aZ83t4Dfn9vSPA8Kz-5M-ZzahuKcWl50h-cFfVV1kNBeHqOpCpwYcUOQBMNyOz-6HUo', 1, 'android CP3A.260905.009', '2026-10-12 15:18:34', '2026-10-12 12:18:34', '2026-10-12 12:18:34'),
(437, 190, NULL, '190179233625540', 'duzbS3_ORfazBGGSb33vcq:APA91bFqnn1QJQW7mkbIBiWbTN6TOt-kFGlzZ7cj8Ee3CCPJvB0y0Yt4w0Qy8EShzutFZ-v_V0CXSYn8T_xCDJUdjnp2WDbihnR50nnhcAzjP0IyJZzqH3I', 1, 'android SP1A.210812.016.G970USQU9IWH2', '2026-10-18 18:10:55', '2026-10-18 15:10:55', '2026-10-18 15:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0zpjFtJ8hlWRIoMuwrStEwSipwnyzBv64j1dv4J3', NULL, '54.82.28.1', 'header-probe/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1pvRmtiQUxaSURnR2I2TWNjZ2l1a3gxVTlZT2JxdUVTOVdEZ2xTTSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792944458),
('6QZZcf0ILHtnCfYhIPZj73izFWx4ZqDVKceunMEi', NULL, '34.198.189.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNHdGZGlocWtDNUlRN2xOTGhGN2pyR2F3b3JSb1d2YWpraEt5alZCTyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1793004317),
('7dqZK9fnDhHdctL1jUs785CllmHHnE5RDYntkyEA', NULL, '82.102.18.180', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUGg3WUxkWlBBR2FXbXNLZmNqMHR3aHVkS1lqZ3V5Nks4NTRMdmtWUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792778378),
('8RlS74O28vTqlHde0HzjSsTfYB0hEaYQzye60CeI', NULL, '194.164.107.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEdWeUJEeFgxOE5uRGZaQjJMQTZyTzRFRGdxdEd4MUVuWkdZdmxlUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792665426),
('ABLYZssJwdakVVhtlHhHDpetTKsWFXIBsGlD7JsV', NULL, '198.98.52.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiamwxV2RTUFhRdlBYQzUzVFRHQ0hCc0dsbHppMlpHUWZGdWlrVnNwbiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792703335),
('AgFvx9IfzX0p4mo6g6LaGOKeULtIqcGlg2zsMt7D', NULL, '102.202.75.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV294TEs5Q2xzWmRoS3BXOWFVblY5ZHNaVG1wcFFNVmFyQjJFZjh3diI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792737035),
('AxeHW7PNa12H6TRyR1SUi5FfY1ShKo7sPRftSNXZ', NULL, '34.78.64.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUVE2RHZZdVdTTUg1Nzh6ZFZVc296MnNSSWlLNEZPMUlGRjNEN25oaSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792768969),
('B9GqTv3tnctmH9gGHPROzMCid1C4uUSWmhbPiU1c', NULL, '194.164.107.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSVFzMUZCSFRTRjlJQVVVVzZmWDVHbGJ2N3dVblVObVVxR2RJZ3lkZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792665425),
('FcbvVyGSknH8PXILQXZUUuxjlnvwxZlVii1co4XM', NULL, '198.98.52.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZTIzWXI1b1dqU3JVdkl4MnJvUGN3MXVZblk1YVRQYWt1ZlZJbG9GZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792703329),
('fRPCeETNyr3tSy4oK4qNsEpwowizrKwo5cY1Noql', NULL, '198.98.52.229', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibllkT0ZOTTNTeERmMzg4c0VJZGhMV2hPUmZJUXEwZ241YUhuajZ2bSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Lz9yZXN0X3JvdXRlPSUyRiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwczovL2FkbWluLmZpeGNoYXAuY28udHovbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792703331),
('KehpHu9jdjzLzkLyJx1sz1nfYUMLUxDUAGWnPnmH', NULL, '207.175.36.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnM0dWdaOFNQRWNGUUo1QUV6aDN0cDhXRVJMazRudWhnVWxrTlZRbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792690302),
('kQ8XQpXJsmf4cCwyRdzI7NmpxDLvkjhKS6LWRMPA', NULL, '164.90.208.56', 'Mozilla/5.0 (l9scan/2.0.032313e2331313e2130323e23313; +https://leakix.net)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzN3T2t0QWVkYXNQUlVteXhRa0dBQlNNTllnSHNJQmZEUjB3Wk15RyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792821782),
('lPEPRg0tfUIdZZ9Y4z4XE0ZMtgb3683GgLX8F4KM', NULL, '207.175.36.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGlHdTVuQTJtMWJranhZWmkxeW5ialpTbWFJU1dGMkMyOEV1UDFXRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792690302),
('nkSTGdZ04MSP7B5ZrIgiHRRuRJBoMBjqq4Yn1FHl', NULL, '34.78.64.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia25KSjVTdEJreGxpd3prN3lXcFBXWU04cVNsNjQxenhsNGFHWjVuNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792768970),
('p7dCeLYQZLpI0Q78LLzwLsgAnhqApCWwuSAt3L1i', NULL, '164.90.208.56', 'Mozilla/5.0 (l9scan/2.0.032313e2331313e2130323e23313; +https://leakix.net)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUE5pYmE1eXF3SFJjU0pZWU5qSTNIeFlINHBuTE1EWW1KZ2hKeEZFSiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2MToiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Lz9yZXN0X3JvdXRlPSUyRndwJTJGdjIlMkZ1c2VycyUyRiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjYxOiJodHRwczovL2FkbWluLmZpeGNoYXAuY28udHovP3Jlc3Rfcm91dGU9JTJGd3AlMkZ2MiUyRnVzZXJzJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792821820),
('pySvA8cEPI7jstWLOkoqZHXQE8UUnoKowOMJW1jT', NULL, '34.236.123.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3BOSnc3T2tGcEt4RlVpVVZkWDdUakl4M0g5MjRWSER0VEY3TlFnMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792907343),
('V2YYLOHlY5kz9UZxvbE0YUjVmPtUT2E7Fp2AJVVQ', NULL, '34.198.189.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFRkaFlQdmhldzVObXdRdWZUSWRFS25KYXRIdnplTjhEbW5GNm02eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1793004318),
('vghg2piFm9p6KmeqyBgf1a3kXf2oNgMztFKJAZkP', NULL, '130.12.180.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzh2MXNHY1VkdUpqSExPd3lhMnVXa004RlhGZlNOckdOUTdzQkJkdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50ei9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792708122),
('vZgTYGAJe2MvBvzZqa3GRGib7EMAY9XaSJh8nA6p', NULL, '23.235.221.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3N1dG5YTmRHeEM3RXFXejhhbjh1SXRqUm5KWEhUaDdRTkVrc1BNWSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6L2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwczovL2FkbWluLmZpeGNoYXAuY28udHovbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1792667594),
('wou3qZmdFJ9vwCVJuoD98MwwWUE9RLdqpwqBRRmZ', NULL, '130.12.180.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibkhBUzA3OFVrRnJac0ZZMEU1a3NzWm9NNVJsbVlZMklONlM0bUg4TCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792708090),
('wZfi8Z7Hg1hnJyGX14KYO9kKygCWmuT22d9yLCR5', NULL, '34.236.123.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNldNR3U5c21qNW1rVVlPM05YZm0yamZxaVRUc3BmWXZzeEthNHM4MCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792907343),
('Z1Gl5HUn9CAbrz6ESMaIjg3pP6iHmtwEygv8Yl37', NULL, '54.82.28.1', 'header-probe/2.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSm5rNGxLTklXRndtWmE0VWxVSjVIWlY3RWlleTdRVWZaQzdrazJseCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1792944459),
('zxJdxnA5z2Z4rW81kW3GKZ0DroTEoVmaHQewzVxY', NULL, '164.90.208.56', 'Mozilla/5.0 (l9scan/2.0.032313e2331313e2130323e23313; +https://leakix.net)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRXBSdmxNcFkydFY5WXBPTlNKOVhaOG1EMnY2MEtQdUpRSDd2QmRRSiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cHM6Ly9hZG1pbi5maXhjaGFwLmNvLnR6Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vYWRtaW4uZml4Y2hhcC5jby50eiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1792821791);

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `reference` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `status_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`id`, `user_id`, `mobile`, `content`, `reference`, `status_id`, `created_at`, `updated_at`) VALUES
(320, NULL, '255749795987', '5110+is+your+FixChap+authentication+code.', '53203077', 5, '2026-02-17 14:46:55', '2026-02-17 14:46:55'),
(321, NULL, '255749795987', '6500+is+your+FixChap+authentication+code.', '53203081', 5, '2026-02-17 14:53:17', '2026-02-17 14:53:17'),
(322, NULL, '255712395987', '7735+is+your+FixChap+authentication+code.', '53203083', 5, '2026-02-17 14:54:10', '2026-02-17 14:54:10'),
(323, NULL, '255749795987', '8897+is+your+FixChap+authentication+code.', '53203084', 5, '2026-02-17 14:55:04', '2026-02-17 14:55:04'),
(324, NULL, '255749795987', '2550+is+your+FixChap+authentication+code.', '53203085', 5, '2026-02-17 14:57:17', '2026-02-17 14:57:17'),
(325, NULL, '255746770063', '7829+is+your+FixChap+authentication+code.', '53203884', 5, '2026-02-17 17:15:59', '2026-02-17 17:15:59'),
(326, NULL, '255746770063', '9893+is+your+FixChap+authentication+code.', '53206120', 5, '2026-02-18 08:32:03', '2026-02-18 08:32:03'),
(327, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53206124', 5, '2026-02-18 08:32:45', '2026-02-18 08:32:45'),
(328, NULL, '255746770063', '1106+is+your+FixChap+authentication+code.', '53206284', 5, '2026-02-18 09:24:01', '2026-02-18 09:24:01'),
(329, NULL, '255746770063', '6968+is+your+FixChap+authentication+code.', '53210459', 5, '2026-02-19 07:02:37', '2026-02-19 07:02:37'),
(330, NULL, '255753068623', '1729+is+your+FixChap+authentication+code.', '53226907', 5, '2026-02-21 22:20:09', '2026-02-21 22:20:09'),
(331, NULL, '255754011649', '3098+is+your+FixChap+authentication+code.', '53226948', 5, '2026-02-22 03:43:15', '2026-02-22 03:43:15'),
(332, NULL, '255793147150', '9692+is+your+FixChap+authentication+code.', '53228030', 5, '2026-02-22 10:50:00', '2026-02-22 10:50:00'),
(333, NULL, '255713906221', '8693+is+your+FixChap+authentication+code.', '53228096', 5, '2026-02-22 12:03:50', '2026-02-22 12:03:50'),
(334, NULL, '255712395987', '4400+is+your+FixChap+authentication+code.', '53240960', 5, '2026-02-24 20:20:06', '2026-02-24 20:20:06'),
(335, NULL, '255764587748', '3006+is+your+FixChap+authentication+code.', '53247514', 5, '2026-02-26 12:02:06', '2026-02-26 12:02:06'),
(336, NULL, '255759421622', '3961+is+your+FixChap+authentication+code.', '53249243', 5, '2026-02-26 16:39:42', '2026-02-26 16:39:42'),
(337, NULL, '255797407662', '1570+is+your+FixChap+authentication+code.', '53279436', 5, '2026-03-06 06:55:26', '2026-03-06 06:55:26'),
(338, NULL, '255797407662', '7315+is+your+FixChap+authentication+code.', '53279481', 5, '2026-03-06 07:18:50', '2026-03-06 07:18:50'),
(339, NULL, '255749795987', '2928+is+your+FixChap+authentication+code.', '53282906', 5, '2026-03-07 21:14:03', '2026-03-07 21:14:03'),
(340, NULL, '255698527585', '2892+is+your+FixChap+authentication+code.', '53286125', 5, '2026-03-09 09:51:33', '2026-03-09 09:51:33'),
(341, NULL, '255614054291', '8382+is+your+FixChap+authentication+code.', '53303104', 5, '2026-03-12 01:29:37', '2026-03-12 01:29:37'),
(342, NULL, '255763640052', '5444+is+your+FixChap+authentication+code.', '53303107', 5, '2026-03-12 02:06:15', '2026-03-12 02:06:15'),
(343, NULL, '255781386814', '7144+is+your+FixChap+authentication+code.', '53313782', 5, '2026-03-15 18:10:01', '2026-03-15 18:10:01'),
(344, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53314589', 5, '2026-03-16 06:14:21', '2026-03-16 06:14:21'),
(345, NULL, '255746770063', '9916+is+your+FixChap+authentication+code.', '53314687', 5, '2026-03-16 06:26:20', '2026-03-16 06:26:20'),
(346, NULL, '255764263608', '3008+is+your+FixChap+authentication+code.', '53323943', 5, '2026-03-17 18:17:22', '2026-03-17 18:17:22'),
(347, NULL, '255676447255', '3271+is+your+FixChap+authentication+code.', '53324354', 5, '2026-03-18 05:42:53', '2026-03-18 05:42:53'),
(348, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53325626', 5, '2026-03-18 08:49:06', '2026-03-18 08:49:06'),
(349, NULL, '255755736156', '9921+is+your+FixChap+authentication+code.', '53325772', 5, '2026-03-18 09:12:04', '2026-03-18 09:12:04'),
(350, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53325961', 5, '2026-03-18 09:49:56', '2026-03-18 09:49:56'),
(351, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53325975', 5, '2026-03-18 09:50:37', '2026-03-18 09:50:37'),
(352, NULL, '255749795987', '7218+is+your+FixChap+authentication+code.', '53325990', 5, '2026-03-18 09:54:41', '2026-03-18 09:54:41'),
(353, NULL, '255412585336', '2493+is+your+FixChap+authentication+code.', '53326345', 5, '2026-03-18 11:50:16', '2026-03-18 11:50:16'),
(354, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53327610', 5, '2026-03-18 20:40:48', '2026-03-18 20:40:48'),
(355, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330331', 5, '2026-03-19 13:04:01', '2026-03-19 13:04:01'),
(356, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330376', 5, '2026-03-19 13:13:47', '2026-03-19 13:13:47'),
(357, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330381', 5, '2026-03-19 13:17:16', '2026-03-19 13:17:16'),
(358, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330415', 5, '2026-03-19 13:24:37', '2026-03-19 13:24:37'),
(359, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330419', 5, '2026-03-19 13:25:24', '2026-03-19 13:25:24'),
(360, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53330478', 5, '2026-03-19 13:43:25', '2026-03-19 13:43:25'),
(361, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53334194', 5, '2026-03-20 21:48:46', '2026-03-20 21:48:46'),
(362, NULL, '255716305006', '5593+is+your+FixChap+authentication+code.', '53335510', 5, '2026-03-21 11:52:47', '2026-03-21 11:52:47'),
(363, NULL, '255716305006', '2406+is+your+FixChap+authentication+code.', '53335514', 5, '2026-03-21 11:55:07', '2026-03-21 11:55:07'),
(364, NULL, '255754712002', '3519+is+your+FixChap+authentication+code.', '53340226', 5, '2026-03-23 20:40:34', '2026-03-23 20:40:34'),
(365, NULL, '255686759813', '1614+is+your+FixChap+authentication+code.', '53345260', 5, '2026-03-25 11:54:57', '2026-03-25 11:54:57'),
(366, NULL, '255686759813', '6143+is+your+FixChap+authentication+code.', '53345474', 5, '2026-03-25 13:05:17', '2026-03-25 13:05:17'),
(367, NULL, '255686759813', '5343+is+your+FixChap+authentication+code.', '53345480', 5, '2026-03-25 13:06:59', '2026-03-25 13:06:59'),
(368, NULL, '255750759883', '8800+is+your+FixChap+authentication+code.', '53345492', 5, '2026-03-25 13:11:23', '2026-03-25 13:11:23'),
(369, NULL, '255686759813', '7770+is+your+FixChap+authentication+code.', '53345496', 5, '2026-03-25 13:12:46', '2026-03-25 13:12:46'),
(370, NULL, '255625816702', '9906+is+your+FixChap+authentication+code.', '53345583', 5, '2026-03-25 13:39:04', '2026-03-25 13:39:04'),
(371, NULL, '255686759813', '8272+is+your+FixChap+authentication+code.', '53345594', 5, '2026-03-25 13:43:05', '2026-03-25 13:43:05'),
(372, NULL, '255686759813', '1628+is+your+FixChap+authentication+code.', '53345720', 5, '2026-03-25 14:04:46', '2026-03-25 14:04:46'),
(373, NULL, '255746254117', '4356+is+your+FixChap+authentication+code.', '53345778', 5, '2026-03-25 14:28:22', '2026-03-25 14:28:22'),
(374, NULL, '255754492120', '2817+is+your+FixChap+authentication+code.', '53345792', 5, '2026-03-25 14:31:29', '2026-03-25 14:31:29'),
(375, NULL, '255686759813', '6433+is+your+FixChap+authentication+code.', '53346280', 5, '2026-03-25 18:15:24', '2026-03-25 18:15:24'),
(376, NULL, '255621416049', '7514+is+your+FixChap+authentication+code.', '53346314', 5, '2026-03-25 20:31:02', '2026-03-25 20:31:02'),
(377, NULL, '255686759813', '1323+is+your+FixChap+authentication+code.', '53348998', 5, '2026-03-27 00:59:43', '2026-03-27 00:59:43'),
(378, NULL, '255789664113', '4328+is+your+FixChap+authentication+code.', '53350742', 5, '2026-03-27 13:32:03', '2026-03-27 13:32:03'),
(379, NULL, '255789664113', '1991+is+your+FixChap+authentication+code.', '53350878', 5, '2026-03-27 14:33:59', '2026-03-27 14:33:59'),
(380, NULL, '255787027497', '6497+is+your+FixChap+authentication+code.', '53355235', 5, '2026-03-30 06:36:13', '2026-03-30 06:36:13'),
(381, NULL, '255787027497', '4393+is+your+FixChap+authentication+code.', '53355247', 5, '2026-03-30 06:40:39', '2026-03-30 06:40:39'),
(382, NULL, '255787027497', '6457+is+your+FixChap+authentication+code.', '53355270', 5, '2026-03-30 06:46:52', '2026-03-30 06:46:52'),
(383, NULL, '255626140761', '2492+is+your+FixChap+authentication+code.', '53356607', 5, '2026-03-30 11:30:14', '2026-03-30 11:30:14'),
(384, NULL, '255626140761', '9972+is+your+FixChap+authentication+code.', '53356619', 5, '2026-03-30 11:36:00', '2026-03-30 11:36:00'),
(385, NULL, '255628025165', '5200+is+your+FixChap+authentication+code.', '53365692', 5, '2026-04-02 11:23:19', '2026-04-02 11:23:19'),
(386, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53365713', 5, '2026-04-02 11:28:12', '2026-04-02 11:28:12'),
(387, NULL, '255744576188', '4609+is+your+FixChap+authentication+code.', '53385919', 5, '2026-04-09 17:41:07', '2026-04-09 17:41:07'),
(388, NULL, '255744576188', '3848+is+your+FixChap+authentication+code.', '53385931', 5, '2026-04-09 18:00:41', '2026-04-09 18:00:41'),
(389, NULL, '255712770011', '2121+is+your+FixChap+authentication+code.', '53388176', 5, '2026-04-10 11:04:50', '2026-04-10 11:04:50'),
(390, NULL, '255744576188', '2316+is+your+FixChap+authentication+code.', '53397409', 5, '2026-04-13 15:30:43', '2026-04-13 15:30:43'),
(391, NULL, '255694100405', '4873+is+your+FixChap+authentication+code.', '53401623', 5, '2026-04-15 07:26:47', '2026-04-15 07:26:47'),
(392, NULL, '255716732427', '8128+is+your+FixChap+authentication+code.', '53401628', 5, '2026-04-15 07:27:14', '2026-04-15 07:27:14'),
(393, NULL, '255694100405', '9684+is+your+FixChap+authentication+code.', '53402681', 5, '2026-04-15 09:19:04', '2026-04-15 09:19:04'),
(394, NULL, '255788901256', '2159+is+your+FixChap+authentication+code.', '53417519', 5, '2026-04-20 08:59:20', '2026-04-20 08:59:20'),
(395, NULL, '255754492120', '4487+is+your+FixChap+authentication+code.', '53417539', 5, '2026-04-20 09:03:29', '2026-04-20 09:03:29'),
(396, NULL, '255754492120', '5105+is+your+FixChap+authentication+code.', '53417559', 5, '2026-04-20 09:05:42', '2026-04-20 09:05:42'),
(397, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53417577', 5, '2026-04-20 09:09:58', '2026-04-20 09:09:58'),
(398, NULL, '255674789852', '5634+is+your+FixChap+authentication+code.', '53425337', 5, '2026-04-22 19:08:45', '2026-04-22 19:08:45'),
(399, NULL, '255712670704', '5952+is+your+FixChap+authentication+code.', '53439099', 5, '2026-04-27 13:57:09', '2026-04-27 13:57:09'),
(400, NULL, '255714817455', '7511+is+your+FixChap+authentication+code.', '53443143', 5, '2026-04-29 12:14:51', '2026-04-29 12:14:51'),
(401, NULL, '255749401919', '9826+is+your+FixChap+authentication+code.', '53445223', 5, '2026-04-30 12:23:03', '2026-04-30 12:23:03'),
(402, NULL, '255763580371', '5259+is+your+FixChap+authentication+code.', '53449866', 5, '2026-05-02 18:03:30', '2026-05-02 18:03:30'),
(403, NULL, '255713978820', '7597+is+your+FixChap+authentication+code.', '53450229', 5, '2026-05-03 05:33:45', '2026-05-03 05:33:45'),
(404, NULL, '255760255266', '8190+is+your+FixChap+authentication+code.', '53451167', 5, '2026-05-03 13:49:05', '2026-05-03 13:49:05'),
(405, NULL, '255658111341', '3470+is+your+FixChap+authentication+code.', '53458050', 5, '2026-05-06 14:07:13', '2026-05-06 14:07:13'),
(406, NULL, '255658111341', '9763+is+your+FixChap+authentication+code.', '53458128', 5, '2026-05-06 14:19:48', '2026-05-06 14:19:48'),
(407, NULL, '255658111341', '4455+is+your+FixChap+authentication+code.', '53458145', 5, '2026-05-06 14:27:29', '2026-05-06 14:27:29'),
(408, NULL, '255750211341', '7705+is+your+FixChap+authentication+code.', '53458150', 5, '2026-05-06 14:30:08', '2026-05-06 14:30:08'),
(409, NULL, '255658111341', '7716+is+your+FixChap+authentication+code.', '53458163', 5, '2026-05-06 14:51:38', '2026-05-06 14:51:38'),
(410, NULL, '255658111341', '3132+is+your+FixChap+authentication+code.', '53458223', 5, '2026-05-06 14:59:18', '2026-05-06 14:59:18'),
(411, NULL, '255635246931', '6076+is+your+FixChap+authentication+code.', '53458552', 5, '2026-05-07 04:46:17', '2026-05-07 04:46:17'),
(412, NULL, '255750211341', '3089+is+your+FixChap+authentication+code.', '53490653', 5, '2026-05-14 12:17:08', '2026-05-14 12:17:08'),
(413, NULL, '255746770063', '2566+is+your+FixChap+authentication+code.', '53490669', 5, '2026-05-14 12:23:43', '2026-05-14 12:23:43'),
(414, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53490693', 5, '2026-05-14 12:37:15', '2026-05-14 12:37:15'),
(415, NULL, '255658111341', '5496+is+your+FixChap+authentication+code.', '53490754', 5, '2026-05-14 13:23:04', '2026-05-14 13:23:04'),
(416, NULL, '255738141901', '6882+is+your+FixChap+authentication+code.', '53490787', 5, '2026-05-14 14:14:16', '2026-05-14 14:14:16'),
(417, NULL, '255738141901', '5746+is+your+FixChap+authentication+code.', '53490791', 5, '2026-05-14 14:15:57', '2026-05-14 14:15:57'),
(418, NULL, '255656516931', '5385+is+your+FixChap+authentication+code.', '53490915', 5, '2026-05-14 16:22:48', '2026-05-14 16:22:48'),
(419, NULL, '255656516931', '4281+is+your+FixChap+authentication+code.', '53490921', 5, '2026-05-14 16:28:36', '2026-05-14 16:28:36'),
(420, NULL, '255719973980', '8648+is+your+FixChap+authentication+code.', '53490950', 5, '2026-05-14 17:12:59', '2026-05-14 17:12:59'),
(421, NULL, '255755656565', '9776+is+your+FixChap+authentication+code.', '53497242', 5, '2026-05-18 12:20:51', '2026-05-18 12:20:51'),
(422, NULL, '255712477741', '9910+is+your+FixChap+authentication+code.', '53497243', 5, '2026-05-18 12:21:38', '2026-05-18 12:21:38'),
(423, NULL, '255674775500', '9472+is+your+FixChap+authentication+code.', '53503191', 5, '2026-05-21 22:34:06', '2026-05-21 22:34:06'),
(424, NULL, '255749775500', '1937+is+your+FixChap+authentication+code.', '53503192', 5, '2026-05-21 22:34:23', '2026-05-21 22:34:23'),
(425, NULL, '255749775500', '4491+is+your+FixChap+authentication+code.', '53503193', 5, '2026-05-21 22:38:32', '2026-05-21 22:38:32'),
(426, NULL, '255749775500', '9799+is+your+FixChap+authentication+code.', '53530997', 5, '2026-05-31 20:35:01', '2026-05-31 20:35:01'),
(427, NULL, '255784416282', '7084+is+your+FixChap+authentication+code.', '53536551', 5, '2026-06-03 12:36:01', '2026-06-03 12:36:01'),
(428, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53536646', 5, '2026-06-03 13:54:46', '2026-06-03 13:54:46'),
(429, NULL, '255746770063', '3106+is+your+FixChap+authentication+code.', '53536651', 5, '2026-06-03 14:00:32', '2026-06-03 14:00:32'),
(430, NULL, '255746770063', '7306+is+your+FixChap+authentication+code.', '53536655', 5, '2026-06-03 14:11:07', '2026-06-03 14:11:07'),
(431, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53536661', 5, '2026-06-03 14:18:48', '2026-06-03 14:18:48'),
(432, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53539983', 5, '2026-06-05 09:37:16', '2026-06-05 09:37:16'),
(433, NULL, '255797404662', '6586+is+your+FixChap+authentication+code.', '53542152', 5, '2026-06-06 10:51:18', '2026-06-06 10:51:18'),
(434, NULL, '255797407662', '3067+is+your+FixChap+authentication+code.', '53542153', 5, '2026-06-06 10:52:00', '2026-06-06 10:52:00'),
(435, NULL, '255758347960', '4244+is+your+FixChap+authentication+code.', '53542444', 5, '2026-06-07 07:35:05', '2026-06-07 07:35:05'),
(436, NULL, '255758347960', '6713+is+your+FixChap+authentication+code.', '53542445', 5, '2026-06-07 07:38:35', '2026-06-07 07:38:35'),
(437, NULL, '255612929319', '1169+is+your+FixChap+authentication+code.', '53545268', 5, '2026-06-08 15:59:13', '2026-06-08 15:59:13'),
(438, NULL, '255750020767', '7505+is+your+FixChap+authentication+code.', '53545272', 5, '2026-06-08 15:59:44', '2026-06-08 15:59:44'),
(439, NULL, '255715537654', '3971+is+your+FixChap+authentication+code.', '53557523', 5, '2026-06-11 07:14:24', '2026-06-11 07:14:24'),
(440, NULL, '255617839281', '1849+is+your+FixChap+authentication+code.', '53560128', 5, '2026-06-12 12:20:13', '2026-06-12 12:20:13'),
(441, NULL, '255714670904', '8444+is+your+FixChap+authentication+code.', '53561874', 5, '2026-06-13 13:42:00', '2026-06-13 13:42:00'),
(442, NULL, '255780460100', '8277+is+your+FixChap+authentication+code.', '53561878', 5, '2026-06-13 13:47:50', '2026-06-13 13:47:50'),
(443, NULL, '255780460100', '6235+is+your+FixChap+authentication+code.', '53561898', 5, '2026-06-13 14:33:03', '2026-06-13 14:33:03'),
(444, NULL, '255780460100', '6467+is+your+FixChap+authentication+code.', '53561900', 5, '2026-06-13 14:35:51', '2026-06-13 14:35:51'),
(445, NULL, '255616803336', '2111+is+your+FixChap+authentication+code.', '53574063', 5, '2026-06-19 15:19:11', '2026-06-19 15:19:11'),
(446, NULL, '255616803336', '2980+is+your+FixChap+authentication+code.', '53574066', 5, '2026-06-19 15:22:26', '2026-06-19 15:22:26'),
(447, NULL, '255656507602', '6745+is+your+FixChap+authentication+code.', '53574067', 5, '2026-06-19 15:23:23', '2026-06-19 15:23:23'),
(448, NULL, '255679621548', '3635+is+your+FixChap+authentication+code.', '53577819', 5, '2026-06-22 10:33:21', '2026-06-22 10:33:21'),
(449, NULL, '255616803339', '6631+is+your+FixChap+authentication+code.', '53579851', 5, '2026-06-23 15:34:36', '2026-06-23 15:34:36'),
(450, NULL, '255616803336', '2309+is+your+FixChap+authentication+code.', '53579852', 5, '2026-06-23 15:34:42', '2026-06-23 15:34:42'),
(451, NULL, '255679621548', '4917+is+your+FixChap+authentication+code.', '53579858', 5, '2026-06-23 15:43:24', '2026-06-23 15:43:24'),
(452, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53585471', 5, '2026-06-26 11:37:53', '2026-06-26 11:37:53'),
(453, NULL, '255746770063', '9334+is+your+FixChap+authentication+code.', '53585477', 5, '2026-06-26 11:41:03', '2026-06-26 11:41:03'),
(454, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53585481', 5, '2026-06-26 11:42:21', '2026-06-26 11:42:21'),
(455, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53585484', 5, '2026-06-26 11:44:53', '2026-06-26 11:44:53'),
(456, NULL, '255712642041', '5771+is+your+FixChap+authentication+code.', '53586009', 5, '2026-06-27 06:20:34', '2026-06-27 06:20:34'),
(457, NULL, '255622606497', '4040+is+your+FixChap+authentication+code.', '53590293', 5, '2026-06-29 18:29:36', '2026-06-29 18:29:36'),
(458, NULL, '255715433739', '8683+is+your+FixChap+authentication+code.', '53590358', 5, '2026-06-29 19:59:13', '2026-06-29 19:59:13'),
(459, NULL, '255754385444', '4259+is+your+FixChap+authentication+code.', '53590363', 5, '2026-06-29 20:14:23', '2026-06-29 20:14:23'),
(460, NULL, '255653446050', '3590+is+your+FixChap+authentication+code.', '53590424', 5, '2026-06-30 05:02:59', '2026-06-30 05:02:59'),
(461, NULL, '255755916373', '5383+is+your+FixChap+authentication+code.', '53619144', 5, '2026-07-11 11:05:01', '2026-07-11 11:05:01'),
(462, NULL, '255782248388', '9526+is+your+FixChap+authentication+code.', '53624653', 5, '2026-07-14 14:50:01', '2026-07-14 14:50:01'),
(463, NULL, '255782248388', '1917+is+your+FixChap+authentication+code.', '53624669', 5, '2026-07-14 14:59:26', '2026-07-14 14:59:26'),
(464, NULL, '255719613891', '8297+is+your+FixChap+authentication+code.', '53632623', 5, '2026-07-19 08:16:41', '2026-07-19 08:16:41'),
(465, NULL, '255767210520', '7920+is+your+FixChap+authentication+code.', '53632876', 5, '2026-07-19 13:33:45', '2026-07-19 13:33:45'),
(466, NULL, '255782248388', '2950+is+your+FixChap+authentication+code.', '53632887', 5, '2026-07-19 13:52:41', '2026-07-19 13:52:41'),
(467, NULL, '255767210520', '5760+is+your+FixChap+authentication+code.', '53633602', 5, '2026-07-20 07:48:10', '2026-07-20 07:48:10'),
(468, NULL, '255699125661', '4673+is+your+FixChap+authentication+code.', '53634779', 5, '2026-07-20 15:03:10', '2026-07-20 15:03:10'),
(469, NULL, '255628945374', '5001+is+your+FixChap+authentication+code.', '53634819', 5, '2026-07-20 15:56:19', '2026-07-20 15:56:19'),
(470, NULL, '255628945374', '1304+is+your+FixChap+authentication+code.', '53634833', 5, '2026-07-20 16:01:44', '2026-07-20 16:01:44'),
(471, NULL, '255717669678', '4432+is+your+FixChap+authentication+code.', '53635750', 5, '2026-07-21 06:48:34', '2026-07-21 06:48:34'),
(472, NULL, '255717669678', '4361+is+your+FixChap+authentication+code.', '53635784', 5, '2026-07-21 07:01:57', '2026-07-21 07:01:57'),
(473, NULL, '255686002420', '1876+is+your+FixChap+authentication+code.', '53639108', 5, '2026-07-23 07:20:37', '2026-07-23 07:20:37'),
(474, NULL, '255754373308', '3376+is+your+FixChap+authentication+code.', '53639115', 5, '2026-07-23 07:22:21', '2026-07-23 07:22:21'),
(475, NULL, '255712395987', '4714+is+your+FixChap+authentication+code.', '53641361', 5, '2026-07-24 09:22:20', '2026-07-24 09:22:20'),
(476, NULL, '255749795987', '7811+is+your+FixChap+authentication+code.', '53641609', 5, '2026-07-24 12:24:28', '2026-07-24 12:24:28'),
(477, NULL, '255789664113', '5766+is+your+FixChap+authentication+code.', '53654372', 5, '2026-08-02 10:32:20', '2026-08-02 10:32:20'),
(478, NULL, '255782891969', '8617+is+your+FixChap+authentication+code.', '53656975', 5, '2026-08-03 19:00:15', '2026-08-03 19:00:15'),
(479, NULL, '255617216953', '7257+is+your+FixChap+authentication+code.', '53663493', 5, '2026-08-07 18:50:09', '2026-08-07 18:50:09'),
(480, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53667048', 5, '2026-08-10 06:41:45', '2026-08-10 06:41:45'),
(481, NULL, '255620575029', '7205+is+your+FixChap+authentication+code.', '53670232', 5, '2026-08-11 13:43:47', '2026-08-11 13:43:47'),
(482, NULL, '255714817455', '1030+is+your+FixChap+authentication+code.', '53676114', 5, '2026-08-14 16:10:03', '2026-08-14 16:10:03'),
(483, NULL, '255638654552', '9586+is+your+FixChap+authentication+code.', '53678472', 5, '2026-08-16 18:21:06', '2026-08-16 18:21:06'),
(484, NULL, '255777490957', '8283+is+your+FixChap+authentication+code.', '53679955', 5, '2026-08-17 11:25:29', '2026-08-17 11:25:29'),
(485, NULL, '255654636701', '5028+is+your+FixChap+authentication+code.', '53691127', 5, '2026-08-23 17:13:01', '2026-08-23 17:13:01'),
(486, NULL, '255713978820', '5006+is+your+FixChap+authentication+code.', '53691339', 5, '2026-08-24 05:32:45', '2026-08-24 05:32:45'),
(487, NULL, '255674397464', '3695+is+your+FixChap+authentication+code.', '53692637', 5, '2026-08-24 11:13:07', '2026-08-24 11:13:07'),
(488, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53698264', 5, '2026-08-27 04:38:08', '2026-08-27 04:38:08'),
(489, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53698291', 5, '2026-08-27 05:17:13', '2026-08-27 05:17:13'),
(490, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53698947', 5, '2026-08-27 08:18:16', '2026-08-27 08:18:16'),
(491, NULL, '255542832678', '3799+is+your+FixChap+authentication+code.', '53701065', 5, '2026-08-28 13:49:10', '2026-08-28 13:49:10'),
(492, NULL, '255542832678', '6026+is+your+FixChap+authentication+code.', '53701066', 5, '2026-08-28 13:49:34', '2026-08-28 13:49:34'),
(493, NULL, '255542832678', '6020+is+your+FixChap+authentication+code.', '53701114', 5, '2026-08-28 13:52:04', '2026-08-28 13:52:04'),
(494, NULL, '255789664113', '7850+is+your+FixChap+authentication+code.', '53702761', 5, '2026-08-29 16:29:56', '2026-08-29 16:29:56'),
(495, NULL, '255769323435', '6441+is+your+FixChap+authentication+code.', '53710767', 5, '2026-09-03 20:34:46', '2026-09-03 20:34:46'),
(496, NULL, '255712770011', '5350+is+your+FixChap+authentication+code.', '53713642', 5, '2026-09-05 16:20:32', '2026-09-05 16:20:32'),
(497, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53721054', 5, '2026-09-09 09:24:41', '2026-09-09 09:24:41'),
(498, NULL, '255686770012', '1020+is+your+FixChap+authentication+code.', '53721059', 5, '2026-09-09 09:27:47', '2026-09-09 09:27:47'),
(499, NULL, '255712395987', '6431+is+your+FixChap+authentication+code.', '53759243', 5, '2026-10-01 05:53:31', '2026-10-01 05:53:31'),
(500, NULL, '255719032614', '5417+is+your+FixChap+authentication+code.', '53760474', 5, '2026-10-01 13:53:31', '2026-10-01 13:53:31'),
(501, NULL, '255611269906', '5169+is+your+FixChap+authentication+code.', '53771269', 5, '2026-10-07 20:46:17', '2026-10-07 20:46:17'),
(502, NULL, '255795848886', '8102+is+your+FixChap+authentication+code.', '53774977', 5, '2026-10-10 09:45:52', '2026-10-10 09:45:52'),
(503, NULL, '255713103470', '7999+is+your+FixChap+authentication+code.', '53777023', 5, '2026-10-12 12:18:08', '2026-10-12 12:18:08'),
(504, NULL, '255717665100', '5940+is+your+FixChap+authentication+code.', '53784047', 5, '2026-10-18 15:10:22', '2026-10-18 15:10:22'),
(505, NULL, '255788218003', '3893+is+your+FixChap+authentication+code.', '53784064', 5, '2026-10-18 16:43:09', '2026-10-18 16:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `status_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status_code`) VALUES
(1, 'ACTIVE'),
(2, 'DELETED'),
(3, 'UPDATED'),
(4, 'PENDING'),
(5, 'NOT AVAILABLE'),
(6, 'EXPIRED'),
(7, 'SEARCHING_HANDYMAN'),
(8, 'HANDYMAN_CONFIRMED'),
(9, 'QUOTATION_RAISED'),
(10, 'ON_WORK'),
(11, 'WORK_COMPLETED'),
(12, 'CANCELLED'),
(13, 'CLOSED'),
(14, 'PRE_CANCELLED'),
(15, 'PAYMENT_CONFIRMED'),
(16, 'INACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `transactionsms`
--

CREATE TABLE `transactionsms` (
  `id` int NOT NULL,
  `request_id` int NOT NULL,
  `sms` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `handyman_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionsms`
--

INSERT INTO `transactionsms` (`id`, `request_id`, `sms`, `handyman_id`, `created_at`, `updated_at`) VALUES
(31, 2811, 'Testing payment', NULL, '2026-02-18 08:47:35', '2026-02-18 08:47:35'),
(32, 2812, 'Testing', NULL, '2026-02-18 08:58:19', '2026-02-18 08:58:19'),
(33, 2812, 'Testing', NULL, '2026-02-18 08:58:22', '2026-02-18 08:58:22'),
(34, 2839, 'hhhhh', NULL, '2026-03-21 12:05:42', '2026-03-21 12:05:42'),
(35, 2860, 'Check the payment message', NULL, '2026-06-26 11:48:38', '2026-06-26 11:48:38'),
(36, 2862, 'Tedting', NULL, '2026-07-02 09:02:30', '2026-07-02 09:02:30'),
(37, 2862, 'Testing', NULL, '2026-07-02 09:02:40', '2026-07-02 09:02:40'),
(38, 2863, 'Paid lets check', NULL, '2026-07-02 09:06:23', '2026-07-02 09:06:23'),
(39, 2821, '0803MCQ8J Imepokelewa. Umetuma TZS 7,000.00 kwa MWAJUMA CHAZUA - Mixx by Yas (0775329054) tarehe 2026-08-03 22:32:35. Ada ni BURE. Muamala wa 5 kati ya 150-Hello Mwezi. Salio jipya ni TZS 4,952.00. Msaada 0800 714 888 / 0800 784 888', NULL, '2026-08-04 06:53:50', '2026-08-04 06:53:50'),
(40, 2820, '0803MCQ8J Imepokelewa. Umetuma TZS 7,000.00 kwa MWAJUMA CHAZUA - Mixx by Yas (0775329054) tarehe 2026-08-03 22:32:35. Ada ni BURE. Muamala wa 5 kati ya 150-Hello Mwezi. Salio jipya ni TZS 4,952.00. Msaada 0800 714 888 / 0800 784 888', NULL, '2026-08-04 06:55:21', '2026-08-04 06:55:21'),
(41, 2871, '0803MCQ8J Imethibitishwa. Umetuma TZS 7,000.00 kwa MWAJUMA CHAZUA - Mixx by Yas (0775329054) tarehe 2026-08-03 22:32:35. TIPS kumbukumbu 26595802817918.  Msaada 0800 714 888/0800 784 888', NULL, '2026-08-04 07:22:28', '2026-08-04 07:22:28'),
(42, 2872, '0803MCMC5 Imepokelewa. Umetuma TZS 91,000.00 kwa LIPA ELIZABETH TADEO PASCHAL - 57719998 tarehe 2026-08-03 21:57:47. Ada ni BURE. Muamala wa 4 kati ya 150-Hello Mwezi. Salio jipya ni TZS 11,952.00. Msaada 0800 714 888 / 0800 784 888', NULL, '2026-08-04 07:55:54', '2026-08-04 07:55:54'),
(43, 2873, 'Testing the App', NULL, '2026-08-10 06:51:05', '2026-08-10 06:51:05'),
(44, 2873, 'Testing the App', NULL, '2026-08-10 06:51:06', '2026-08-10 06:51:06'),
(45, 2875, 'Testing Payment confirmation process', NULL, '2026-08-10 07:18:34', '2026-08-10 07:18:34'),
(46, 2876, 'Testing the payment process', NULL, '2026-08-10 07:29:22', '2026-08-10 07:29:22'),
(47, 2880, 'Testing the display of paybill message', NULL, '2026-09-09 09:43:09', '2026-09-09 09:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `tag` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `tag`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(124, '255686770012', 1, '2026-02-18 08:32:53', '2026-02-18 08:32:53', NULL),
(125, '255753068623', 1, '2026-02-21 22:20:27', '2026-02-21 22:20:27', NULL),
(126, '255754011649', 1, '2026-02-22 03:43:23', '2026-02-22 03:43:23', NULL),
(127, '255793147150', 1, '2026-02-22 10:50:05', '2026-02-22 10:50:05', NULL),
(128, '255713906221', 1, '2026-02-22 12:03:56', '2026-02-22 12:03:56', NULL),
(129, '255712395987', 1, '2026-02-24 20:20:14', '2026-02-24 20:20:14', NULL),
(130, '255764587748', 1, '2026-02-26 12:02:18', '2026-02-26 12:02:18', NULL),
(131, '255759421622', 1, '2026-02-26 16:39:50', '2026-02-26 16:39:50', NULL),
(132, '255797407662', 1, '2026-03-06 07:19:01', '2026-03-06 07:19:01', NULL),
(133, '255698527585', 1, '2026-03-09 09:51:49', '2026-03-09 09:51:49', NULL),
(134, '255614054291', 1, '2026-03-12 01:29:46', '2026-03-12 01:29:46', NULL),
(135, '255763640052', 1, '2026-03-12 02:06:31', '2026-03-12 02:06:31', NULL),
(136, '255781386814', 1, '2026-03-15 18:10:13', '2026-03-15 18:10:13', NULL),
(137, '255764263608', 1, '2026-03-17 18:17:28', '2026-03-17 18:17:28', NULL),
(138, '255755736156', 1, '2026-03-18 09:12:29', '2026-03-18 09:12:29', NULL),
(139, '255716305006', 1, '2026-03-21 11:52:54', '2026-03-21 11:52:54', NULL),
(140, '255754712002', 1, '2026-03-23 20:40:49', '2026-03-23 20:40:49', NULL),
(141, '255686759813', 1, '2026-03-25 11:55:14', '2026-03-25 11:55:14', NULL),
(142, '255625816702', 1, '2026-03-25 13:39:55', '2026-03-25 13:39:55', NULL),
(143, '255746254117', 1, '2026-03-25 14:28:43', '2026-03-25 14:28:43', NULL),
(144, '255621416049', 1, '2026-03-25 20:31:08', '2026-03-25 20:31:08', NULL),
(145, '255787027497', 1, '2026-03-30 06:47:47', '2026-03-30 06:47:47', NULL),
(146, '255626140761', 1, '2026-03-30 11:30:42', '2026-03-30 11:30:42', NULL),
(147, '255628025165', 1, '2026-04-02 11:23:40', '2026-04-02 11:23:40', NULL),
(148, '255712770011', 1, '2026-04-10 11:05:00', '2026-04-10 11:05:00', NULL),
(149, '255694100405', 1, '2026-04-15 07:27:15', '2026-04-15 07:27:15', NULL),
(150, '255788901256', 1, '2026-04-20 08:59:35', '2026-04-20 08:59:35', NULL),
(151, '255674789852', 1, '2026-04-22 19:09:04', '2026-04-22 19:09:04', NULL),
(152, '255714817455', 1, '2026-04-29 12:15:08', '2026-04-29 12:15:08', NULL),
(153, '255763580371', 1, '2026-05-02 18:03:40', '2026-05-02 18:03:40', NULL),
(154, '255760255266', 1, '2026-05-03 13:49:19', '2026-05-03 13:49:19', NULL),
(155, '255746770063', 1, '2026-05-14 12:23:50', '2026-05-14 12:23:50', NULL),
(156, '255658111341', 1, '2026-05-14 13:23:19', '2026-05-14 13:23:19', NULL),
(157, '255738141901', 1, '2026-05-14 14:14:42', '2026-05-14 14:14:42', NULL),
(158, '255656516931', 1, '2026-05-14 16:28:55', '2026-05-14 16:28:55', NULL),
(159, '255719973980', 1, '2026-05-14 17:13:17', '2026-05-14 17:13:17', NULL),
(160, '255712477741', 1, '2026-05-18 12:21:57', '2026-05-18 12:21:57', NULL),
(161, '255716693016', 1, '2026-05-19 16:15:08', NULL, NULL),
(162, '255784416282', 1, '2026-06-03 12:36:12', '2026-06-03 12:36:12', NULL),
(163, '255750020767', 1, '2026-06-08 16:00:07', '2026-06-08 16:00:07', NULL),
(164, '255616803336', 1, '2026-06-23 15:34:53', '2026-06-23 15:34:53', NULL),
(165, '255679621548', 1, '2026-06-23 15:43:41', '2026-06-23 15:43:41', NULL),
(166, '255712642041', 1, '2026-06-27 06:25:24', '2026-06-27 06:25:24', NULL),
(167, '255622606497', 1, '2026-06-29 18:30:10', '2026-06-29 18:30:10', NULL),
(168, '255715433739', 1, '2026-06-29 19:59:31', '2026-06-29 19:59:31', NULL),
(169, '255754385444', 1, '2026-06-29 20:14:45', '2026-06-29 20:14:45', NULL),
(170, '255653446050', 1, '2026-06-30 05:03:14', '2026-06-30 05:03:14', NULL),
(171, '255716000606', 1, '2026-07-10 16:55:06', NULL, NULL),
(172, '255755916373', 1, '2026-07-11 11:05:16', '2026-07-11 11:05:16', NULL),
(173, '255767210520', 1, '2026-07-19 13:33:58', '2026-07-19 13:33:58', NULL),
(174, '255699125661', 1, '2026-07-20 15:03:42', '2026-07-20 15:03:42', NULL),
(175, '255628945374', 1, '2026-07-20 15:57:24', '2026-07-20 15:57:24', NULL),
(176, '255717669678', 1, '2026-07-21 06:48:59', '2026-07-21 06:48:59', NULL),
(177, '255754373308', 1, '2026-07-23 07:22:35', '2026-07-23 07:22:35', NULL),
(178, '255782891969', 1, '2026-08-03 19:00:38', '2026-08-03 19:00:38', NULL),
(179, '255617216953', 1, '2026-08-07 18:50:30', '2026-08-07 18:50:30', NULL),
(180, '255620575029', 1, '2026-08-11 13:44:02', '2026-08-11 13:44:02', NULL),
(181, '255638654552', 1, '2026-08-16 18:21:21', '2026-08-16 18:21:21', NULL),
(182, '255777490957', 1, '2026-08-17 11:25:58', '2026-08-17 11:25:58', NULL),
(183, '255654636701', 1, '2026-08-23 17:13:19', '2026-08-23 17:13:19', NULL),
(184, '255674397464', 1, '2026-08-24 11:13:24', '2026-08-24 11:13:24', NULL),
(185, '255789664113', 1, '2026-08-29 16:30:13', '2026-08-29 16:30:13', NULL),
(186, '255719032614', 1, '2026-10-01 13:53:48', '2026-10-01 13:53:48', NULL),
(187, '255611269906', 1, '2026-10-07 20:46:46', '2026-10-07 20:46:46', NULL),
(188, '255795848886', 1, '2026-10-10 09:46:16', '2026-10-10 09:46:16', NULL),
(189, '255713103470', 1, '2026-10-12 12:18:34', '2026-10-12 12:18:34', NULL),
(190, '255717665100', 1, '2026-10-18 15:10:54', '2026-10-18 15:10:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `is_admin`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$rux9zXImRvEJBX6bcrIaIuEgHP3vXt8ojiBZYeiZzB5/JRk8Eg3ze', NULL, '2024-09-02 06:02:51', '2024-09-02 06:02:51', 'admin', 1),
(2, 'Prince', 'prince.prosper@ymail.com', NULL, '$2y$12$Lqqhp5zTYBBHrl7Myao/ruunU83SraSQTbXyPIW6rLmeQtm3.adrm', NULL, '2024-09-19 09:58:24', '2024-09-19 09:58:24', 'admin', 1),
(3, 'Prince Tillya', 'tillyaprince@gmail.com', NULL, '$2y$12$QDSQRnB6Gxu9aDV1m3hQpeYRIOn3BXwiShT3kCBV6EKB3BeyJKDIO', NULL, '2026-02-18 06:39:51', '2026-02-25 04:57:38', 'admin', 0),
(4, 'Boaz', 'mpemaboazi002@gmail.com', NULL, '$2y$12$vH4BlNVpgtKs6UjhuE0A2ejyQXyvW0pl.pk7fl54mCu6L6p/v4V.K', NULL, '2026-02-25 04:55:16', '2026-02-25 07:20:28', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_desc`
--

CREATE TABLE `user_desc` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `middlename` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alternative_mobile` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_photo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_desc`
--

INSERT INTO `user_desc` (`id`, `user_id`, `mobile`, `firstname`, `middlename`, `lastname`, `alternative_mobile`, `email`, `gender`, `profile_photo`, `birthdate`, `password`, `reset_code`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(171, 124, '255686770012', 'Prince', 'Prosper', 'Tillya', '255712770011', 'prince.prosper@ymail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-18 08:32:53', '2026-02-18 08:33:39', NULL),
(172, 125, '255753068623', 'Benald', 'stephan', 'Leiya', '255788118034', 'benaldstehan912@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-21 22:20:27', '2026-02-21 22:22:58', NULL),
(173, 126, '255754011649', 'guava', 'musa', 'william', '255758588484', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-22 03:43:23', '2026-02-22 03:43:56', NULL),
(174, 127, '255793147150', 'Barbara', NULL, 'Mlata', '255620147150', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-22 10:50:05', '2026-02-22 10:50:29', NULL),
(175, 128, '255713906221', 'neema', NULL, 'kimaro', '255713330558', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-22 12:03:56', '2026-02-22 12:04:36', NULL),
(176, 129, '255712395987', 'Samweli', 'A', 'Mohamed', '255749795987', 'salimu12@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-02-24 20:20:14', '2026-02-24 20:20:52', NULL),
(177, 130, '255764587748', 'Norman', NULL, 'Mushi', '255757449734', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-26 12:02:18', '2026-02-26 12:03:01', NULL),
(178, 131, '255759421622', 'Veronica', NULL, 'Victor', '255620725133', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-26 16:39:50', '2026-02-26 16:40:24', NULL),
(179, 132, '255797407662', 'Hajara', NULL, 'Haruna', '255779431432', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-06 07:19:01', '2026-03-06 07:20:42', NULL),
(180, 133, '255698527585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-09 09:51:49', '2026-03-09 09:51:49', NULL),
(181, 134, '255614054291', 'Junior', 'Benson', 'Kimei', '255765693311', 'Jrtz5311@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-12 01:29:46', '2026-03-12 01:37:06', NULL),
(182, 135, '255763640052', 'Joseph', NULL, 'Evarist', '255784640052', 'jemtz1904@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-12 02:06:31', '2026-03-12 02:07:33', NULL),
(183, 136, '255781386814', 'krizant', 'philimon', 'Abel', '255747611555', 'krizantabel99@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-15 18:10:13', '2026-03-15 18:11:28', NULL),
(184, 137, '255764263608', 'Avith', NULL, 'Philip', '255719263608', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-17 18:17:28', '2026-03-17 18:18:08', NULL),
(185, 138, '255755736156', 'sonia', NULL, 'vaitha', '255755199955', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-18 09:12:29', '2026-03-18 09:30:39', NULL),
(186, 139, '255716305006', 'kai', 'Emmanuel', 'Mollel', '255686770012', 'kaimollel@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-21 11:52:54', '2026-03-21 11:54:20', NULL),
(187, 140, '255754712002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-23 20:40:49', '2026-03-23 20:40:49', NULL),
(188, 141, '255686759813', 'Deonatus', 'matage', 'sospeter', '255750759883', 'deonatussospeter73@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 11:55:14', '2026-03-25 11:56:14', NULL),
(189, 142, '255625816702', 'bukwimba', 'zabron', 'mvaiponya', '255766758566', 'mvaiponya3@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 13:39:55', '2026-03-25 13:40:37', NULL),
(190, 143, '255746254117', 'pius', 'bahati', 'jovin', '255787368073', 'bahatipius830@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 14:28:43', '2026-03-25 14:29:34', NULL),
(191, 144, '255621416049', 'Jacob', NULL, 'Saramba', '255763428214', 'Ojodesaramba@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 20:31:08', '2026-03-25 20:32:39', NULL),
(192, 145, '255787027497', 'hemedi', 'selemani', 'kipingu', '255756747466', 'hemediselemani84@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-03-30 06:47:47', '2026-03-30 06:49:03', NULL),
(193, 146, '255626140761', 'Monika', 'joakim', 'mushi', '255747171667', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-30 11:30:42', '2026-03-30 11:32:22', NULL),
(194, 147, '255628025165', 'Boazi', NULL, 'Mpema', '255796244165', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-02 11:23:40', '2026-04-02 11:24:44', NULL),
(195, 148, '255712770011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-10 11:05:00', '2026-04-10 11:05:00', NULL),
(196, 149, '255694100405', 'Winfrida', 'Fred', 'Shangali', '255713901310', 'Winfridashangali@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-04-15 07:27:15', '2026-04-15 07:29:15', NULL),
(197, 150, '255788901256', 'Simon', NULL, 'Mtabazi', '255758701253', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-20 08:59:35', '2026-04-20 09:00:14', NULL),
(198, 151, '255674789852', 'David', NULL, 'Byamungu', '255760789899', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-22 19:09:04', '2026-04-22 19:10:04', NULL),
(199, 152, '255714817455', 'Julius', NULL, 'mahela', '255652745662', 'julius.mahelajr@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-04-29 12:15:08', '2026-04-29 12:17:24', NULL),
(200, 153, '255763580371', 'Eliguard', 'E', 'Dawson', '255784857101', 'eliguardd@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-05-02 18:03:40', '2026-05-02 18:04:37', NULL),
(201, 154, '255760255266', 'Fundi', 'AutoMechanic', 'Johnny', '255619579679', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-03 13:49:19', '2026-05-03 13:58:05', NULL),
(202, 155, '255746770063', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 12:23:50', '2026-05-14 12:23:50', NULL),
(203, 156, '255658111341', 'Bernard', 'Simon', 'Mumwi', '255750211341', 'berneism2511@hotmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 13:23:19', '2026-05-14 13:23:57', NULL),
(204, 157, '255738141901', 'fk', NULL, 'franm', '255741269901', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 14:14:42', '2026-05-14 14:15:13', NULL),
(205, 158, '255656516931', 'odre', 'Otto', 'Sylvester', '255635246931', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 16:28:55', '2026-05-14 16:30:12', NULL),
(206, 159, '255719973980', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-05-14 17:13:17', '2026-05-14 17:13:17', NULL),
(207, 160, '255712477741', 'SALUM', NULL, 'SALUM', '255756247096', 'salummohd7838@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-05-18 12:21:57', '2026-05-18 12:22:43', NULL),
(208, 161, '255716693016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-05-19 16:15:08', '2026-05-19 13:15:57', NULL),
(209, 161, '255716693016', 'Flavia', '', 'Jason', '255718672043', 'flaviajason90@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-05-19 16:15:08', NULL, NULL),
(210, 162, '255784416282', 'taufk', 'amani', 'kawisa', '255778007849', 'taufikikawisa@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-03 12:36:12', '2026-06-03 12:37:12', NULL),
(211, 163, '255750020767', 'white', 'hat', 'hat', '255775770649', 'mehatwhite@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-08 16:00:07', '2026-06-08 16:00:38', NULL),
(212, 164, '255616803336', 'ally', 'John', 'Jonathan', '255656507602', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-06-23 15:34:53', '2026-06-23 15:35:45', NULL),
(213, 165, '255679621548', 'Ernest', 'Lucas', 'masele', '255679621548', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-06-23 15:43:41', '2026-06-23 15:44:38', NULL),
(214, 166, '255712642041', 'Summa', NULL, 'Jay', '255687098007', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-06-27 06:25:24', '2026-06-27 06:25:44', NULL),
(215, 167, '255622606497', 'daniel', NULL, 'hosea', '255715080235', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-06-29 18:30:10', '2026-06-29 18:31:16', NULL),
(216, 168, '255715433739', 'Adam', 'Bernard', 'Nderumaki', '255754320055', 'Nderumakia@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-29 19:59:31', '2026-06-29 20:00:27', NULL),
(217, 169, '255754385444', 'Stephen', NULL, 'Shayo', '255683620693', 'stephenshayo@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-06-29 20:14:45', '2026-06-29 20:17:46', NULL),
(218, 170, '255653446050', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-06-30 05:03:14', '2026-06-30 05:03:14', NULL),
(219, 171, '255716000606', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2026-07-10 16:55:06', '2026-07-10 13:55:54', NULL),
(220, 171, '255716000606', 'malaki', 'mramba', 'malaki', '255767000606', 'mackproducts5@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-10 16:55:06', NULL, NULL),
(221, 172, '255755916373', 'Frimin', 'A', 'Tarimo', '255712002361', 'frimantita@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-11 11:05:16', '2026-07-11 11:06:00', NULL),
(222, 173, '255767210520', 'Pius', NULL, 'Makalle', '255758837914', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-19 13:33:58', '2026-07-19 13:34:16', NULL),
(223, 174, '255699125661', 'RAJABU', NULL, 'RASHIDI', '255763935676', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-20 15:03:42', '2026-07-27 12:48:29', NULL),
(224, 175, '255628945374', 'Evaristi', 'Fredrick', 'Shirima', '255748435374', 'evaristshirima08@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-20 15:57:24', '2026-07-20 16:00:53', NULL),
(225, 176, '255717669678', 'Godlove', 'Selestin', 'Tesha', '255767118623', 'godlovetesha86@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-21 06:48:59', '2026-07-21 06:50:03', NULL),
(226, 177, '255754373308', 'Ibrahim', 'Maxmillan', 'Cyprian', '255686002420', 'Ibrahmaxmillan@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-07-23 07:22:35', '2026-07-23 07:23:50', NULL),
(227, 178, '255782891969', 'Doris', 'Eugene', 'Lyimo', '255676455652', 'doris.elyimo@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-08-03 19:00:38', '2026-08-03 19:03:54', NULL),
(228, 179, '255617216953', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-07 18:50:30', '2026-08-07 18:50:30', NULL),
(229, 180, '255620575029', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-11 13:44:02', '2026-08-11 13:44:02', NULL),
(230, 181, '255638654552', 'moses', 'silem', 'silem', '255740544147', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-16 18:21:21', '2026-08-16 18:21:55', NULL),
(231, 182, '255777490957', 'Julius', 'mussa', 'shija', '255622429113', 'goldendesign46@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-08-17 11:25:58', '2026-08-17 11:26:36', NULL),
(232, 183, '255654636701', 'aux', NULL, 'preg', '255685266527', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-23 17:13:19', '2026-08-23 17:14:32', NULL),
(233, 184, '255674397464', 'Edson', NULL, 'Stanley', '255756752376', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-24 11:13:24', '2026-08-24 11:14:19', NULL),
(234, 185, '255789664113', 'said', 'shaban', 'kapate', '255678225019', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-29 16:30:13', '2026-08-29 16:31:25', NULL),
(235, 186, '255719032614', 'Dominic', NULL, 'Dogani', '255717438196', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-10-01 13:53:48', '2026-10-01 13:54:05', NULL),
(236, 187, '255611269906', 'john', 'robson', 'njabanigwa', '255776069906', 'johnrobson504@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-10-07 20:46:46', '2026-10-07 20:50:54', NULL),
(237, 188, '255795848886', 'seki', NULL, 'Muli', '255622804033', 'legitinvestment48@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-10-10 09:46:16', '2026-10-10 09:49:01', NULL),
(238, 189, '255713103470', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-10-12 12:18:34', '2026-10-12 12:18:34', NULL),
(239, 190, '255717665100', 'Emmanuel', 'Frank', 'Geoffrey', '255756795153', 'mannuelg86@icloud.com', NULL, NULL, NULL, NULL, NULL, 1, '2026-10-18 15:10:54', '2026-10-18 15:12:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_services`
--
ALTER TABLE `company_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `handyman`
--
ALTER TABLE `handyman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `handyman_availability`
--
ALTER TABLE `handyman_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hanyman_id` (`handyman_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `handyman_desc`
--
ALTER TABLE `handyman_desc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `handyman_request_reject`
--
ALTER TABLE `handyman_request_reject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `handyman_id` (`handyman_id`),
  ADD KEY `reqeust_id` (`request_id`);

--
-- Indexes for table `handyman_service`
--
ALTER TABLE `handyman_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `handyman_id` (`handyman_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_id` (`quotation_id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `request_cancellation_reason`
--
ALTER TABLE `request_cancellation_reason`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `request_handyman`
--
ALTER TABLE `request_handyman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `handyman_id` (`handyman_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `handyman_id` (`handyman_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactionsms`
--
ALTER TABLE `transactionsms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_desc`
--
ALTER TABLE `user_desc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_services`
--
ALTER TABLE `company_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `handyman`
--
ALTER TABLE `handyman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4145;

--
-- AUTO_INCREMENT for table `handyman_availability`
--
ALTER TABLE `handyman_availability`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `handyman_desc`
--
ALTER TABLE `handyman_desc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `handyman_request_reject`
--
ALTER TABLE `handyman_request_reject`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `handyman_service`
--
ALTER TABLE `handyman_service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=755;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5257;

--
-- AUTO_INCREMENT for table `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2883;

--
-- AUTO_INCREMENT for table `request_cancellation_reason`
--
ALTER TABLE `request_cancellation_reason`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `request_handyman`
--
ALTER TABLE `request_handyman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=978;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=438;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transactionsms`
--
ALTER TABLE `transactionsms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_desc`
--
ALTER TABLE `user_desc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
