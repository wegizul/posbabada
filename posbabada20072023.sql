-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2023 at 12:00 PM
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
-- Database: `posbabada`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_attachments`
--

CREATE TABLE `sma_attachments` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `description`) VALUES
(1, 'rb', 'Rotte Bakery', NULL, 'rotte-bakery', 'ini produk rotte'),
(2, 'bd', 'Barang Dagang', NULL, 'barang-dagang', 'Ini barang dagang');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(12, 'CAKE', 'CAKE', 'no_image.png', 0, 'cake', 'ini cake'),
(16, 'DONAT', 'DONAT', 'no_image.png', 0, 'donat', NULL),
(17, 'FAMILY PACK', 'FAMILY PACK', 'no_image.png', 0, 'family-pack', NULL),
(18, 'EKSTERNAL', 'EKSTERNAL', 'no_image.png', 0, 'eksternal', 'Ini eksternal'),
(20, 'HEALTHY BREAD', 'HEALTHY BREAD', 'no_image.png', 0, 'healthy-bread', NULL),
(22, 'JAJANAN ROTTE', 'JAJANAN ROTTE', 'no_image.png', 0, 'jajanan-rotte', 'ini jajanan rotte'),
(23, 'KAMPOENG COOKIES', 'KAMPOENG COOKIES', 'no_image.png', 0, 'kampoeng-cookies', 'ini kampung cookies'),
(25, 'MINUMAN', 'MINUMAN', 'no_image.png', 0, 'minuman', NULL),
(27, 'PACKAGING', 'PACKAGING', 'no_image.png', 0, 'packaging', 'ini packaging'),
(31, 'ROTI BURGER', 'ROTI BURGER', 'no_image.png', 0, 'roti-burger', NULL),
(33, 'ROTI MANIS JUMBO', 'ROTI MANIS JUMBO', 'no_image.png', 0, 'roti-manis-jumbo', 'ini roti manis jumbo'),
(34, 'ROTI MANIS', 'ROTI MANIS', 'no_image.png', 0, 'roti-manis', NULL),
(35, 'ROTI MINI', 'ROTI MINI', 'no_image.png', 0, 'roti-mini', 'ini roti mini'),
(36, 'ROTI TAWAR', 'ROTI TAWAR', 'no_image.png', 0, 'roti-tawar', NULL),
(37, 'ROTTE FACTORY', 'ROTTE FACTORY', 'no_image.png', 0, 'rotte-factory', 'ini rotte factory'),
(38, 'SELAI', 'SELAI', 'no_image.png', 0, 'selai', NULL),
(41, 'SOSRO', 'SOSRO', 'no_image.png', 0, 'sosro', 'ini sosro');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, 0.0000, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY AIR MOLEK', 'ROTTE BAKERY AIR MOLEK', '827136680211000', 'Jl. Jenderal Sudirman', 'Air Molek', 'Riau', '29353', 'INDONESIA', '08117050808', 'rotteairmolek@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(4, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY ARENGKA', 'ROTTE BAKERY ARENGKA', '827136680211000', 'Jl. Soekarno Hatta', 'PEKANBARU', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakeryarengka@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(5, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY BANGKINANG', 'ROTTE BAKERY BANGKINANG', '827136680211000', 'Jl Sisingamangaraja No 210A', 'BANGKINANG', 'RIAU', '', 'INDONESIA', '08117050808', 'bangkinang_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(6, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY BELILAS', 'ROTTE BAKERY BELILAS', '827136680211000', 'jl. Lintas Timur Simpang Empat Belilas', 'Indragiri Hulu', 'Riau', '', 'INDONESIA', '08117050808', 'RBbelilas@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(7, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY BERINGIN', 'ROTTE BAKERY BERINGIN', '827136680211000', 'JL BERINGIN 11', 'JL BERINGIN 11', 'RIAU', '', 'INDONESIA', '08117050808', 'beringin_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(8, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY BUKIT BARISAN', 'ROTTE BAKERY BUKIT BARISAN', '827136680211000', 'JL BUKIT BARISAN', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'bukit_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(9, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY DELIMA', 'ROTTE BAKERY DELIMA', '827136680211000', 'JL DELIMA', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'delima_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(10, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY DUMAI SUKAJADI', 'ROTTE BAKERY DUMAI SUKAJADI', '827136680211000', 'Jl . Pangeran Dipenogoro Kec. Dumai Timur', 'Dumai', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakerydumai2@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(11, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY DURI MAWAR', 'ROTTE BAKERY DURI MAWAR', '827136680211000', 'Jl. Mawar No.16, Kec. Mandau', 'Duri', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakeryduri1@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH\r\n', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(12, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY DURI SUDIRMAN', 'ROTTE BAKERY DURI SUDIRMAN', '827136680211000', 'Jl . Sudirman Kec. Mandau ', 'Duri', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakeryduri2@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(13, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY GARUDA SAKTI', 'ROTTE BAKERY GARUDA SAKTI', '827136680211000', 'JL GARUDA SAKTI', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'garuda_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(14, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY HANG TUAH', 'ROTTE BAKERY HANG TUAH', '827136680211000', 'JL HANG TUAH', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'hangtuah_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(15, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY HARAPAN RAYA', 'ROTTE BAKERY HARAPAN RAYA', '827136680211000', 'Jl. Harapan Raya', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakeryharapanraya@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(16, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY KARTAMA', 'ROTTE BAKERY KARTAMA', '827136680211000', 'JL KARTAMA', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'kartama_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(17, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY KEPENUHAN', 'ROTTE BAKERY KEPENUHAN', '827136680211000', 'Kepenuhan', 'Rokan hulu', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakerykepenuhan@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(18, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY KERINCI 2', 'ROTTE BAKERY KERINCI 2', '827136680211000', 'Jl Maharaja Indra No.55 Pangkalan Kerinci', 'pangkalan kerinci', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakerykerinci2@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(19, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY KUALU', 'ROTTE BAKERY KUALU', '827136680211000', 'Jl. Suka Karya 111, Kec. Tampan', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rottekualu@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(20, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY KUBANG', 'ROTTE BAKERY KUBANG', '827136680211000', 'JL. KUBANG RAYA', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rbkubang@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(21, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY LIPAT KAIN', 'ROTTE BAKERY LIPAT KAIN', '827136680211000', 'Jl. Lipat Kain', 'kampar', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakerylipatkain@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(22, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY MARPOYAN', 'ROTTE BAKERY MARPOYAN', '827136680211000', 'JL KHRUDIN NASUTION', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rbmarpoyan@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH\r\n', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(23, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PASIR PANGARAIAN', 'ROTTE BAKERY PASIR PANGARAIAN', '827136680211000', 'Jl. Tuanku Tambusai, Pematang Berangan', 'Pasir Pangaraian', 'Riau', '', 'INDONESIA', '08117050808', 'rbpasirpangaraian@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(24, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PASIR PUTIH', 'ROTTE BAKERY PASIR PUTIH', '827136680211000', 'JL RAYA PASIR PUTIH', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rbpasirputih@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(25, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PAUS', 'ROTTE BAKERY PAUS', '827136680211000', 'JL PAUS', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'paus_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(26, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PEPAYA', 'ROTTE BAKERY PEPAYA', '827136680211000', 'JL PEPAYA', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'pepaya_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(27, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PERAWANG', 'ROTTE BAKERY PERAWANG', '827136680211000', 'Jl. Muhammad Ali, Perawang Barat', 'Perawang', 'Riau', '', 'INDONESIA', '08117050808', 'rotteperawang@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(28, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PERAWANG 2', 'ROTTE BAKERY PERAWANG 2', '827136680211000', 'Jl. Raya Perawang Km.5 Kec. Tualang', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rottebakeryperawang2@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(29, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY PKL KERINCI', 'ROTTE BAKERY PKL KERINCI', '827136680211000', 'JL MAHARAJA INDRA', 'pangkalan kerinci', 'Riau', '', 'INDONESIA', '08117050808', 'pklkerinci_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(30, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY RAJAWALI', 'ROTTE BAKERY RAJAWALI', '827136680211000', 'JL RAJAWALI', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rajawali_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(31, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY RENGAT', 'ROTTE BAKERY RENGAT', '827136680211000', 'JL Sultan No.40', 'Rengat', 'Riau', '', 'INDONESIA', '08117050808', 'rbrengat@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(32, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SEMBILANG', 'ROTTE BAKERY SEMBILANG', '827136680211000', 'JL SEMBILANG RUMBAI', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rbsembilang@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(33, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SIAK', 'ROTTE BAKERY SIAK', '827136680211000', 'Jl. Raja Kecik, Kel. Kampung Dalam', 'Siak', 'Riau', '', 'INDONESIA', '08117050808', 'rottesiak@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(34, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SIGUNGGUNG', 'ROTTE BAKERY SIGUNGGUNG', '827136680211000', 'Jl. Dharma Bakti No. 43 B', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'Rbsigungung@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(35, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SIMPANG BADAK', 'ROTTE BAKERY SIMPANG BADAK', '827136680211000', 'Jl. Hangtuah Ujung', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'rbsimpangbadak@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran Silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(36, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SOREK', 'ROTTE BAKERY SOREK', '827136680211000', 'Jl. Lintas Timur, Sorek Satu, Pangkalan Kuras', 'Sorek', 'Riau', '', 'INDONESIA', '08117050808', 'rbsorek@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(37, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY SUBRANTAS', 'ROTTE BAKERY SUBRANTAS', '827136680211000', 'JL SUBRANTAS', 'Pekanbaru', 'Riau', '', 'INDONESIA', '08117050808', 'subrantas_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(38, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY TALUK KUANTAN', 'ROTTE BAKERY TALUK KUANTAN', '827136680211000', 'Jl. Tuanku Tambusai', 'Kuantan Singingi', 'Riau', '', 'INDONESIA', '08117050808', 'rbtalukkuantan@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(39, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY TALUK KUANTAN 2', 'ROTTE BAKERY TALUK KUANTAN 2', '827136680211000', 'Jl. Ahmad Yani 44', 'Kuantan Singingi', 'Riau', '', 'INDONESIA', '08117050808', 'rbtaluk2@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(40, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY TEMBILAHAN', 'ROTTE BAKERY TEMBILAHAN', '827136680211000', 'Jl. M. Boya, Tembilahan Kota', 'Tembilahan', 'Riau', '', 'INDONESIA', '08117050808', 'rbtembilahan@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(41, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY TOLE (UJUNG BATU)', 'ROTTE BAKERY TOLE (UJUNG BATU)', '827136680211000', 'Jl. Jenderal Sudirman No. 371', 'Ujung Batu', 'Riau', '', 'INDONESIA', '08117050808', 'rbujungbatu@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, ''),
(42, NULL, 'biller', NULL, NULL, 'ROTTE BAKERY UMBAN SARI', 'ROTTE BAKERY UMBAN SARI', '827136680211000', 'JL UMBAN SARI', 'PEKANBARU', 'RIAU', '', 'INDONESIA', '08117050808', 'umbansari_rotte@gmail.com', '', '', '', '', '', '', 'Kritik dan Saran silakan WA 08117050808\r\n\r\nTERIMA KASIH', 0, 'logo1.png', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(2, 'EUR', 'EURO', 0.7340, 0, NULL),
(3, 'IDR', 'Rupiah', 0.0000, 0, 'Rp.');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`, `discount`) VALUES
(6, 'diskon10', -10, NULL),
(7, 'diskon20', -20, NULL),
(8, 'Distributor', -15, NULL),
(9, 'General', 0, NULL),
(10, 'GOFOOD 20', 20, NULL),
(11, 'mitra', -10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(3, 'B009', 'KEAMANAN'),
(4, 'B001', 'BAHAN BAKU'),
(5, 'B010', 'OPERASIONAL LAIN'),
(6, 'B006', 'BBM & PARKIR'),
(7, 'B008', 'KEBERSIHAN'),
(8, 'B011', 'DANA SOSIAL'),
(9, 'B002', 'BAHAN PENDUKUNG'),
(10, 'B005', 'AIR & GAS'),
(11, 'B012', 'KESEHATAN'),
(13, 'B007', 'ATK'),
(14, 'B003', 'BARANG DAGANG'),
(15, 'B013', 'KONSUMSI ROTTEAM'),
(16, 'B014', 'BIAYA TENAGA KERJA'),
(17, 'B015', 'SEWA RUKO'),
(18, 'B016', 'PENYUSUTAN PERALATAN'),
(20, 'B004', 'LISTRIK DAN TELEPON'),
(21, 'B017', 'PAJAK REKLAME'),
(22, 'B018', 'PAJAK ABT ( AIR BAWAH TANAH )');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'hak akses grup kasir'),
(6, 'am-qc', 'am dan quality control'),
(7, 'operational', 'grup operational'),
(8, 'admin-toko', 'hak akses grup kacab dan leader');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_logs`
--

CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL,
  `detail` varchar(190) NOT NULL,
  `model` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_logs`
--

INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(1, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"3\",\"code\":\"\",\"name\":\"Test Product 11;TPR-11;code128;Guess;C1;pc;pc;dozen;90;100;20;No Tax;exclusive;no_image.png;SC1;Red|Blue|Black|White;CF1;CF2;CF3;CF4;CF5;CF6;HSN;Pro 11;;;Mohd Khairul;NG01;90;;;;;;;;;;;;\",\"unit\":null,\"cost\":\"0.0000\",\"price\":\"0.0000\",\"alert_quantity\":\"0.0000\",\"image\":\"\",\"category_id\":\"1\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":null,\"purchase_unit\":null,\"brand\":null,\"slug\":\"test-product-11tpr-11code128guessc1pcpcdozen9010020no-t\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-06-28 04:04:42'),
(2, 'Quotation is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"1\",\"date\":\"2023-07-03 14:39:57\",\"reference_no\":\"QUOTE2023\\/07\\/0001\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"warehouse_id\":\"1\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"note\":\"\",\"internal_note\":null,\"total\":\"3000.0000\",\"product_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"300.0000\",\"total_tax\":\"300.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"3300.0000\",\"status\":\"completed\",\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"attachment\":null,\"supplier_id\":\"2\",\"supplier\":\"Supplier Company Name\",\"hash\":\"e5fbabafde931fb8c341313ce60cf497502ed5414fba2be0e7cd0029140cf4e8\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"1\",\"quote_id\":\"1\",\"product_id\":\"6\",\"product_code\":\"ftyrt\",\"product_name\":\"sfgsdf\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"3000.0000\",\"unit_price\":\"3000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"3000.0000\",\"serial_no\":null,\"real_unit_price\":\"3000.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"unit\":\"1\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\"}]}', '2023-07-04 05:00:54'),
(3, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"16\",\"date\":\"2023-07-03 10:55:00\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0011\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"50000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"5500.0000\",\"total_tax\":\"10500.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"60500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"0\",\"paid\":\"60500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":null,\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"7978a96a88e66850fa1aa6e740cf442699f2cfe7c37dc66df5a89333bdf51586\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"18\",\"sale_id\":\"16\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":null,\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"},{\"id\":\"19\",\"sale_id\":\"16\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":null,\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:10'),
(4, 'Delivery is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"1\",\"date\":\"2023-07-03 10:58:00\",\"sale_id\":\"16\",\"do_reference_no\":\"DO2023\\/07\\/0001\",\"sale_reference_no\":\"SALE\\/POS2023\\/06\\/0011\",\"customer\":\"Walk-in Customer\",\"address\":\"<p>Jl. Sudirman<\\/p>\",\"note\":\"\",\"status\":\"delivered\",\"attachment\":null,\"delivered_by\":\"aa\",\"received_by\":\"bb\",\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null}}', '2023-07-04 05:01:15'),
(5, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"31\",\"date\":\"2023-07-04 08:40:29\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0030\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"21182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2300.0000\",\"total_tax\":\"4118.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"25300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"c207c377c8aecad1ef47589546f9aec3f07279a7283f4c04d81061a3f8d964e0\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"41\",\"sale_id\":\"31\",\"product_id\":\"6\",\"product_code\":\"ftyrt\",\"product_name\":\"sfgsdf\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"3000.0000\",\"unit_price\":\"3000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"3000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"3000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"42\",\"sale_id\":\"31\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(6, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"30\",\"date\":\"2023-07-03 15:44:31\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0029\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2000.0000\",\"total_tax\":\"3818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"da27989b50411bfd9f8c1b7d3db53f0c07f9b9c34c77105aaa8b4c82abc55e25\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"40\",\"sale_id\":\"30\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(7, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"29\",\"date\":\"2023-07-03 15:12:47\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0028\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"48182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"5300.0000\",\"total_tax\":\"10118.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"58300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"58300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"ce69fdbdbe9b1a84c6a5787300d272538ac7c0e0b63218d8cc5e9eb0e3f05af9\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"38\",\"sale_id\":\"29\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"39\",\"sale_id\":\"29\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:01:27'),
(8, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"28\",\"date\":\"2023-07-03 15:11:48\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0027\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"48182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"5300.0000\",\"total_tax\":\"10118.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"58300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"58300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"e0b1cf58aea41360249522362f5cac65a0be0388ecd4aac64669701b9d3efb28\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"36\",\"sale_id\":\"28\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"37\",\"sale_id\":\"28\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:01:27'),
(9, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"27\",\"date\":\"2023-07-03 14:15:58\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0026\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2000.0000\",\"total_tax\":\"3818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"82ce1d1b75f9fef0088fade188bad3afba9aa5f6c3cd732fcc8c1501a3d9c8a6\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"35\",\"sale_id\":\"27\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(10, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"26\",\"date\":\"2023-07-03 14:06:54\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0025\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"48182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"5300.0000\",\"total_tax\":\"10118.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"58300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"58300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"1635cf8b557561c4e6451989e2bb56989c311d6397082a6aae5feef0554ed7cb\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"33\",\"sale_id\":\"26\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"34\",\"sale_id\":\"26\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:01:27'),
(11, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"25\",\"date\":\"2023-07-03 13:59:17\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0024\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2000.0000\",\"total_tax\":\"3818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"d5f75d38c2b6a8d609b1d5c01ea874d7841040571275cc7f02b2fee3b990457f\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"32\",\"sale_id\":\"25\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(12, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"24\",\"date\":\"2023-07-03 13:34:23\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0023\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"36364.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"3636.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"4000.0000\",\"total_tax\":\"7636.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"44000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"44000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"a14fcdc0c0755c6a40369c5ee4b52d5894105e82616eb0b9276b2679d171aa37\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"31\",\"sale_id\":\"24\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"3636.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"40000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(13, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"23\",\"date\":\"2023-07-03 13:24:42\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0022\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"1818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"20000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"20000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"91b5a28eb1222d7da184c215f91998af7094c2eecb0a8151edd3ed1e73724008\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"30\",\"sale_id\":\"23\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(14, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"22\",\"date\":\"2023-07-03 13:21:26\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0021\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2000.0000\",\"total_tax\":\"3818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"b3305083af1dcac9477f49ba44b134a81e573c1f19702d4c284f9f8b3e3f2a17\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"29\",\"sale_id\":\"22\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:01:27'),
(15, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"21\",\"date\":\"2023-07-03 13:20:51\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0020\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"20000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"20000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"a0f27170f766dbf3734cf6ab77cb2bd2ad19e6f89a023c5362406126d8983938\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"28\",\"sale_id\":\"21\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"2\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(16, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"20\",\"date\":\"2023-07-03 13:16:53\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0019\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"20000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"due\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"5000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"c550369e3f3b3c2588698ba292a0a08991fdbc6a38f1abbe92284f7706c5b25b\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"27\",\"sale_id\":\"20\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"2\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(17, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"19\",\"date\":\"2023-07-03 13:15:14\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0018\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"20000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"20000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"c5d7985e8861b9e8888245ec13d3ba38497f04664a8c3e0524ea57076694b0c3\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"26\",\"sale_id\":\"19\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"2\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(18, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"18\",\"date\":\"2023-07-03 12:27:40\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0017\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"3000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"3000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"30000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"865ee42ae5090704c261e1d36a4b5e70731070b341974e86d27249d75b0f2361\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"25\",\"sale_id\":\"18\",\"product_id\":\"6\",\"product_code\":\"ftyrt\",\"product_name\":\"sfgsdf\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"3000.0000\",\"unit_price\":\"3000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"3000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"3000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(19, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"17\",\"date\":\"2023-07-03 12:26:32\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0016\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"3000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"300.0000\",\"total_tax\":\"300.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"3300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"3300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"a71f921728859a632142d73b62a465bb2f548865bece43eedf266ce51bf9e628\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"24\",\"sale_id\":\"17\",\"product_id\":\"6\",\"product_code\":\"ftyrt\",\"product_name\":\"sfgsdf\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"3000.0000\",\"unit_price\":\"3000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"3000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"3000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(20, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"15\",\"date\":\"2023-07-01 08:44:06\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0015\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"60000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"6000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"6600.0000\",\"total_tax\":\"12600.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"72600.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"72600.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"cb513e8ca717e44fb06bc49a4546d7c5251a626446792f40227a586e3a63a225\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"16\",\"sale_id\":\"15\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"6000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"66000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:02:19'),
(21, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"14\",\"date\":\"2023-07-01 08:36:25\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0014\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"90000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"9000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"9900.0000\",\"total_tax\":\"18900.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"108900.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"108900.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"af37e464ea6426d93ba3d05d4d72af67e863e3528c62bec578e1e8d32a74f954\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"15\",\"sale_id\":\"14\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"9000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"99000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:02:19'),
(22, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"13\",\"date\":\"2023-07-01 08:35:08\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0013\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"30000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"3000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"3300.0000\",\"total_tax\":\"6300.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"36300.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"36300.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"fc8279411f5a4c0f480801cfa033cd025720030dd1721ad38a9a92a2d0cd5494\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"14\",\"sale_id\":\"13\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:02:19');
INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(23, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"12\",\"date\":\"2023-07-01 08:33:51\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0012\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2200.0000\",\"total_tax\":\"4200.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"24200.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"24200.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"e9fea51deea7572df99554afa1a8171d157bde1be085e2ff36a3ea92be05c645\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"13\",\"sale_id\":\"12\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:19'),
(24, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"11\",\"date\":\"2023-06-30 16:53:00\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0011\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"33000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"33000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"30\",\"due_date\":\"2023-07-30\",\"created_by\":\"2\",\"updated_by\":\"2\",\"updated_at\":\"2023-07-03 11:36:49\",\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"33000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"bcdac6a120085db2de48c06be8dd03fa4f01b13f859910e09ab353612f086e39\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"23\",\"sale_id\":\"11\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"33000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":null,\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-04 05:02:19'),
(25, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"10\",\"date\":\"2023-06-30 16:32:34\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0010\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2200.0000\",\"total_tax\":\"4200.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"24200.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"24200.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"2737e11258ebb7bc662d49da92a8518b0b07e8210630344aea61cfca3705a33c\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"11\",\"sale_id\":\"10\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(26, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"9\",\"date\":\"2023-06-30 12:01:07\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0009\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2200.0000\",\"total_tax\":\"4200.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"24200.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"24200.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"9d010b156dce14082f4d93360ecc02a11bae5f661f189a178bae067e6a669237\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"10\",\"sale_id\":\"9\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(27, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"8\",\"date\":\"2023-06-30 10:40:39\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0008\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"80000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"8000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"8800.0000\",\"total_tax\":\"16800.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"96800.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"96800.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"7ccaf0247da3c321b4f2a3a56a13de5fff5644d2aa7e5ce3ada0b005c164d0a4\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"8\",\"sale_id\":\"8\",\"product_id\":\"5\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"6000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"66000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"},{\"id\":\"9\",\"sale_id\":\"8\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(28, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"7\",\"date\":\"2023-06-30 10:16:02\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0007\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"2200.0000\",\"total_tax\":\"4200.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"24200.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"24200.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"cdb96549e6257d6c344e5a965dbf450edbbeb878103378905e28116bf43d23be\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"7\",\"sale_id\":\"7\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(29, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"6\",\"date\":\"2023-06-28 12:20:42\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0006\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"2000.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"ee74ed27e8bce232b33c4747740bc868f08ed9259a8c6a6f3c10d3431285c9ff\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"6\",\"sale_id\":\"6\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":null,\"product_unit_code\":null,\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(30, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"5\",\"date\":\"2023-06-28 12:06:00\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0005\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"20000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2000.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"2000.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"22000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"22000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"770839bf7c6abbb3fad6c8de94441f34ba53e4b443a3bd59dad2ab03b6fe5c60\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"5\",\"sale_id\":\"5\",\"product_id\":\"2\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"20000.0000\",\"unit_price\":\"22000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"2000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":null,\"product_unit_code\":null,\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(31, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"4\",\"date\":\"2023-06-28 08:55:19\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0004\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"2\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"2500.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"2500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"2500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"9797a73a2acb3a0bbbb221dc2c334d5219f4030cedceb19725d40b41deee7cd8\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"4\",\"sale_id\":\"4\",\"product_id\":\"2\",\"product_code\":\"82520239\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"2500.0000\",\"unit_price\":\"2500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"2\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"2500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"2500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"unit1\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-04 05:02:24'),
(32, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"3\",\"date\":\"2023-06-27 16:53:28\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0003\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"5000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"5000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"5000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"9833fc76f9d5e53c8b37c710884deaae36cfdbdece4fee657177a12c2b28cde4\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"3\",\"sale_id\":\"3\",\"product_id\":\"1\",\"product_code\":\"31406876\",\"product_name\":\"Coba\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"5000.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"unit1\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":null,\"details\":null,\"variant\":null,\"hsn_code\":null,\"second_name\":null,\"base_unit_id\":null,\"base_unit_code\":null}]}', '2023-07-04 05:02:24'),
(33, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"2\",\"date\":\"2023-06-27 16:48:44\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0002\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"5000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"5000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"10000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"89ac8d3ccf0e7e65a412b071e97b4875c07f32935ec6ad21230ff6f4a91ec1af\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"2\",\"sale_id\":\"2\",\"product_id\":\"1\",\"product_code\":\"31406876\",\"product_name\":\"Coba\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"5000.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"unit1\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":null,\"details\":null,\"variant\":null,\"hsn_code\":null,\"second_name\":null,\"base_unit_id\":null,\"base_unit_code\":null}]}', '2023-07-04 05:02:24'),
(34, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"1\",\"date\":\"2023-06-24 11:23:05\",\"reference_no\":\"SALE\\/POS2023\\/06\\/0001\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"1\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"50000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"10\",\"total_discount\":\"10.0000\",\"order_discount\":\"10.0000\",\"product_tax\":\"0.0000\",\"order_tax_id\":\"1\",\"order_tax\":\"0.0000\",\"total_tax\":\"0.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"49990.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"10\",\"pos\":\"1\",\"paid\":\"49990.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"ce622267ca6a92ef815d83fc4232241e2f7b90d847960f799925abc51691405b\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"1\",\"sale_id\":\"1\",\"product_id\":\"1\",\"product_code\":\"31406876\",\"product_name\":\"Coba\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"5000.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"10.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"50000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"unit1\",\"unit_quantity\":\"10.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"NT\",\"tax_name\":\"No Tax\",\"tax_rate\":\"0.0000\",\"image\":null,\"details\":null,\"variant\":null,\"hsn_code\":null,\"second_name\":null,\"base_unit_id\":null,\"base_unit_code\":null}]}', '2023-07-04 05:02:24'),
(35, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"3\",\"date\":\"2023-07-01 08:46:00\",\"reference_no\":\"2023\\/07\\/0003\",\"warehouse_id\":\"1\",\"note\":\"&lt;p&gt;Planning produksi 1 juli&lt;&sol;p&gt;\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"4\",\"adjustment_id\":\"3\",\"product_id\":\"2\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"1\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-04 05:02:46'),
(36, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"2\",\"date\":\"2023-06-28 08:49:00\",\"reference_no\":\"2023\\/06\\/0002\",\"warehouse_id\":\"2\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"3\",\"adjustment_id\":\"2\",\"product_id\":\"2\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"2\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-04 05:02:46'),
(37, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"1\",\"date\":\"2023-06-24 11:20:00\",\"reference_no\":\"2023\\/06\\/0001\",\"warehouse_id\":\"1\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"5\",\"adjustment_id\":\"1\",\"product_id\":\"6\",\"option_id\":null,\"quantity\":\"10.0000\",\"warehouse_id\":\"1\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"ftyrt\",\"product_name\":\"sfgsdf\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-04 05:02:46'),
(38, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"2\",\"code\":\"0102\",\"name\":\"Keripik Emak CW\",\"unit\":\"1\",\"cost\":\"0.0000\",\"price\":\"20000.0000\",\"alert_quantity\":\"0.0000\",\"image\":\"no_image.png\",\"category_id\":\"1\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":null,\"tax_rate\":\"2\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-emak-cw\",\"featured\":null,\"weight\":\"0.0000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 05:06:32'),
(39, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"3\",\"code\":\"0103\",\"name\":\"Keju Kraft Single 5 (Pcs)\",\"unit\":\"3\",\"cost\":\"0.0000\",\"price\":\"13000.0000\",\"alert_quantity\":\"0.0000\",\"image\":\"no_image.png\",\"category_id\":\"3\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"10.0000\",\"tax_rate\":\"2\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"standard\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"3\",\"purchase_unit\":\"3\",\"brand\":\"2\",\"slug\":\"keju-kraft-single-5-pcs\",\"featured\":null,\"weight\":\"0.0000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 05:06:32'),
(40, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"4\",\"code\":\"0104\",\"name\":\"Keripik Kentang Original\",\"unit\":\"1\",\"cost\":\"0.0000\",\"price\":\"20000.0000\",\"alert_quantity\":\"0.0000\",\"image\":\"no_image.png\",\"category_id\":\"2\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":\"2\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"standard\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-kentang-original\",\"featured\":null,\"weight\":\"0.0000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 05:06:32'),
(41, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"5\",\"code\":\"1001\",\"name\":\"Bolu Gulung Rotte\",\"unit\":\"2\",\"cost\":\"0.0000\",\"price\":\"33000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"no_image.png\",\"category_id\":\"3\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"55.0000\",\"tax_rate\":\"2\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"2\",\"purchase_unit\":\"2\",\"brand\":\"1\",\"slug\":\"bolu-gulung-rotte\",\"featured\":null,\"weight\":\"0.0000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 05:06:32'),
(42, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"6\",\"code\":\"ftyrt\",\"name\":\"sfgsdf\",\"unit\":\"1\",\"cost\":\"0.0000\",\"price\":\"3000.0000\",\"alert_quantity\":\"0.0000\",\"image\":\"no_image.png\",\"category_id\":\"2\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":null,\"tax_rate\":\"1\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":\"\",\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":\"0\",\"supplier1price\":null,\"supplier2\":null,\"supplier2price\":null,\"supplier3\":null,\"supplier3price\":null,\"supplier4\":null,\"supplier4price\":null,\"supplier5\":null,\"supplier5price\":null,\"promotion\":null,\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":null,\"supplier3_part_no\":null,\"supplier4_part_no\":null,\"supplier5_part_no\":null,\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"76195255\",\"featured\":null,\"weight\":\"0.2000\",\"hsn_code\":null,\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 05:06:32'),
(43, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"7\",\"code\":\"TPR-11\",\"name\":\"Hahaha\",\"unit\":\"2\",\"cost\":\"90.0000\",\"price\":\"100.0000\",\"alert_quantity\":\"20.0000\",\"image\":\"no_image.png\",\"category_id\":\"1\",\"subcategory_id\":null,\"cf1\":\"CF1\",\"cf2\":\"CF2\",\"cf3\":\"CF3\",\"cf4\":\"CF4\",\"cf5\":\"CF5\",\"cf6\":\"CF6\",\"quantity\":\"0.0000\",\"tax_rate\":\"1\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"90.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"NG01\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"2\",\"purchase_unit\":\"2\",\"brand\":null,\"slug\":\"hahaha\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"Pro 11\",\"hide_pos\":\"0\"}}', '2023-07-04 06:13:51'),
(44, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"9\",\"code\":\"102\",\"name\":\"Keripik Emak CW\",\"unit\":\"1\",\"cost\":\"20000.0000\",\"price\":\"5000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"2\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-emak-cw\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:29:47'),
(45, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"10\",\"code\":\"103\",\"name\":\"Keju Kraft Single 5 (Pcs)\",\"unit\":\"1\",\"cost\":\"13000.0000\",\"price\":\"18000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"3\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keju-kraft-single-5-pcs\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:29:47'),
(46, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"11\",\"code\":\"104\",\"name\":\"Keripik Kentang Original\",\"unit\":\"1\",\"cost\":\"20000.0000\",\"price\":\"25000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"4\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-kentang-original\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:29:47'),
(47, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"8\",\"code\":\"TPR-11\",\"name\":\"Hahaha\",\"unit\":\"2\",\"cost\":\"90.0000\",\"price\":\"100.0000\",\"alert_quantity\":\"20.0000\",\"image\":\"no_image.png\",\"category_id\":\"1\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"0.0000\",\"tax_rate\":\"1\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":null,\"barcode_symbology\":\"code128\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":\"\",\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"2\",\"purchase_unit\":\"2\",\"brand\":null,\"slug\":\"hahaha\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:29:47'),
(48, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"13\",\"code\":\"102\",\"name\":\"Keripik Emak CW\",\"unit\":\"1\",\"cost\":\"20000.0000\",\"price\":\"5000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"2\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"200.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":\"0\",\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":null,\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-emak-cw\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:31:47'),
(49, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"14\",\"code\":\"103\",\"name\":\"Keju Kraft Single 5 (Pcs)\",\"unit\":\"1\",\"cost\":\"13000.0000\",\"price\":\"18000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"3\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"300.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":\"0\",\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":null,\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keju-kraft-single-5-pcs\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:31:47'),
(50, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"15\",\"code\":\"104\",\"name\":\"Keripik Kentang Original\",\"unit\":\"1\",\"cost\":\"20000.0000\",\"price\":\"25000.0000\",\"alert_quantity\":\"5.0000\",\"image\":\"\",\"category_id\":\"4\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"100.0000\",\"tax_rate\":null,\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":\"0\",\"barcode_symbology\":\"\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"0\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":null,\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"1\",\"purchase_unit\":\"1\",\"brand\":\"2\",\"slug\":\"keripik-kentang-original\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:31:47'),
(51, 'Product is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"12\",\"code\":\"TPR-11\",\"name\":\"Hahaha\",\"unit\":\"2\",\"cost\":\"90.0000\",\"price\":\"100.0000\",\"alert_quantity\":\"20.0000\",\"image\":\"no_image.png\",\"category_id\":\"1\",\"subcategory_id\":null,\"cf1\":\"\",\"cf2\":\"\",\"cf3\":\"\",\"cf4\":\"\",\"cf5\":\"\",\"cf6\":\"\",\"quantity\":\"150.0000\",\"tax_rate\":\"1\",\"track_quantity\":\"1\",\"details\":\"\",\"warehouse\":\"0\",\"barcode_symbology\":\"code128\",\"file\":null,\"product_details\":\"\",\"tax_method\":\"1\",\"type\":\"standard\",\"supplier1\":null,\"supplier1price\":\"0.0000\",\"supplier2\":null,\"supplier2price\":\"0.0000\",\"supplier3\":null,\"supplier3price\":\"0.0000\",\"supplier4\":null,\"supplier4price\":\"0.0000\",\"supplier5\":null,\"supplier5price\":\"0.0000\",\"promotion\":\"0\",\"promo_price\":null,\"start_date\":null,\"end_date\":null,\"supplier1_part_no\":null,\"supplier2_part_no\":\"\",\"supplier3_part_no\":\"\",\"supplier4_part_no\":\"\",\"supplier5_part_no\":\"\",\"sale_unit\":\"2\",\"purchase_unit\":\"2\",\"brand\":null,\"slug\":\"hahaha\",\"featured\":null,\"weight\":null,\"hsn_code\":\"0\",\"views\":\"0\",\"hide\":\"0\",\"second_name\":\"\",\"hide_pos\":\"0\"}}', '2023-07-04 06:31:47'),
(52, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"41\",\"date\":\"2023-07-07 14:21:45\",\"reference_no\":\"SL\\/POS0040\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22725.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2275.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2275.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"cc917905179fb20f6bd80cd108584b7439341f8b76975182d1524e1a35edc8e1\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"54\",\"sale_id\":\"41\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2275.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42');
INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(53, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"40\",\"date\":\"2023-07-07 14:12:34\",\"reference_no\":\"SL\\/POS0039\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22705.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2295.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2295.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"ba7fdba12029840e4f8bd468dae8e28c64b1d96bf284c9b999945c76c42d7700\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"53\",\"sale_id\":\"40\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4541.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2295.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(54, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"39\",\"date\":\"2023-07-07 14:11:46\",\"reference_no\":\"SL\\/POS0038\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22935.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2065.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2065.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"78a5084dbc0f0a1d428d790d9512df429c60298ea6d4efadc2ec1f0c5434125a\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"52\",\"sale_id\":\"39\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4587.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2065.0000\",\"tax_rate_id\":\"2\",\"tax\":\"9%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(55, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"38\",\"date\":\"2023-07-07 14:11:32\",\"reference_no\":\"SL\\/POS0037\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"4587.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"413.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"413.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"5000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"5000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"bd60016ffa671f588f39eeff9fa8a1c785e7d9276ee6cd8b4311521c301bdcd6\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"51\",\"sale_id\":\"38\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4587.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"413.0000\",\"tax_rate_id\":\"2\",\"tax\":\"9%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(56, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"37\",\"date\":\"2023-07-07 14:10:10\",\"reference_no\":\"SL\\/POS0036\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22525.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2475.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2475.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"27bec8ccf10d0324cb633b7c80c1729ab8a805ba19dc76b2251432b423042148\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"50\",\"sale_id\":\"37\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4505.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2475.0000\",\"tax_rate_id\":\"2\",\"tax\":\"11%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(57, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"36\",\"date\":\"2023-07-07 13:45:31\",\"reference_no\":\"SL\\/POS0035\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22725.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2275.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2275.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"0d5e4a89bf0ae49dab823da8b870904858a6de9666c70d291cb67790fceef867\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"49\",\"sale_id\":\"36\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2275.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(58, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"35\",\"date\":\"2023-07-07 13:43:16\",\"reference_no\":\"SL\\/POS0034\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22725.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2275.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2275.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"853794c0e8b63ebe9b7a28c6d8ef69a1109d26885627d226aba669a3244acb53\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"48\",\"sale_id\":\"35\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2275.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(59, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"34\",\"date\":\"2023-07-07 13:37:31\",\"reference_no\":\"SL\\/POS0033\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"12273.0000\",\"product_discount\":\"1500.0000\",\"order_discount_id\":\"\",\"total_discount\":\"1500.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1227.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1227.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"13500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"13500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"dc4709fccb68a17c6d9e22d6cfd33a73def56656a1d3425247724643d077bb21\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"47\",\"sale_id\":\"34\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"4091.0000\",\"unit_price\":\"4500.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1227.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"10%\",\"item_discount\":\"1500.0000\",\"subtotal\":\"13500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(60, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"33\",\"date\":\"2023-07-07 13:31:49\",\"reference_no\":\"SL\\/POS0032\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"9090.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"910.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"910.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"10000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"10000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"cf592c984cd9ec1795566d16f39832c6d7ac0ac63717a39d22b01fbec1d14711\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"45\",\"sale_id\":\"33\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"46\",\"sale_id\":\"33\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:42'),
(61, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"32\",\"date\":\"2023-07-05 12:16:38\",\"reference_no\":\"SALE\\/POS2023\\/07\\/0031\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"13635.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1365.0000\",\"order_tax_id\":\"2\",\"order_tax\":\"1500.0000\",\"total_tax\":\"2865.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"16500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"16500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"5c7a2bb913ea399a59f390eb76e182a3e6aca10c4e0c5c10cb76bb2383132cd5\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"43\",\"sale_id\":\"32\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"910.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"44\",\"sale_id\":\"32\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-07 07:49:43'),
(62, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"56\",\"date\":\"2023-07-10 11:56:45\",\"reference_no\":\"SL\\/POS0055\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"52275.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5225.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"5225.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"57500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"57500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"94ec9d96a07f232da7d0ae7af2c694cfbf49b4435b45fc3be43c894807c3c22b\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"80\",\"sale_id\":\"56\",\"product_id\":\"22\",\"product_code\":\"31128848\",\"product_name\":\"Keripik Ubi\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"10455.0000\",\"unit_price\":\"11500.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"5225.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"57500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"11500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(63, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"55\",\"date\":\"2023-07-10 11:55:19\",\"reference_no\":\"SL\\/POS0054\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"50000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5000.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"5000.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"55000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"55000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"37e01c37882cffe6c4a2d13573265375fe3e38a7d470201f9985c0a47809bd8f\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"79\",\"sale_id\":\"55\",\"product_id\":\"23\",\"product_code\":\"24701532\",\"product_name\":\"Kue Ulang Tahun\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"50000.0000\",\"unit_price\":\"55000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"5000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"55000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"55000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-10 06:23:39'),
(64, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"54\",\"date\":\"2023-07-10 11:19:40\",\"reference_no\":\"SL\\/POS0053\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22270.0000\",\"product_discount\":\"5000.0000\",\"order_discount_id\":\"\",\"total_discount\":\"5000.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2730.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2730.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"6\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"af40d44997dbd9f7bc5046b48a66ea4c90b87e9731548fad73deb1f4d328f5a6\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"77\",\"sale_id\":\"54\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2275.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"78\",\"sale_id\":\"54\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"-455.0000\",\"unit_price\":\"0.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"100%\",\"item_discount\":\"5000.0000\",\"subtotal\":\"0.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(65, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"53\",\"date\":\"2023-07-10 10:57:30\",\"reference_no\":\"SL\\/POS0052\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"58635.0000\",\"product_discount\":\"5500.0000\",\"order_discount_id\":\"\",\"total_discount\":\"5500.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5865.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"5865.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"64500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"4\",\"pos\":\"1\",\"paid\":\"64500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"61168686478d3c666deabfcfc4779fcceaa9f9647acc0f29b766e3accea22ce3\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"74\",\"sale_id\":\"53\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"75\",\"sale_id\":\"53\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"910.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"76\",\"sale_id\":\"53\",\"product_id\":\"23\",\"product_code\":\"24701532\",\"product_name\":\"Kue Ulang Tahun\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"45000.0000\",\"unit_price\":\"49500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"4500.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"10%\",\"item_discount\":\"5500.0000\",\"subtotal\":\"49500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"55000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-10 06:23:39'),
(66, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"52\",\"date\":\"2023-07-10 10:55:28\",\"reference_no\":\"SL\\/POS0051\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"10455.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1045.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1045.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"11500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"11500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"19763e8987660522c368557c77e064971a3df9d40999ca25cf9eab23311a6d6b\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"73\",\"sale_id\":\"52\",\"product_id\":\"22\",\"product_code\":\"31128848\",\"product_name\":\"Keripik Ubi\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"10455.0000\",\"unit_price\":\"11500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1045.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"11500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"11500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(67, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"51\",\"date\":\"2023-07-10 10:48:34\",\"reference_no\":\"SL\\/POS0050\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"45000.0000\",\"product_discount\":\"5500.0000\",\"order_discount_id\":\"\",\"total_discount\":\"5500.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4500.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"4500.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"49500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"49500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"f73b67ef646449377bae1a1c272dc94c2170f022092d1c039406add8dc89bca7\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"72\",\"sale_id\":\"51\",\"product_id\":\"23\",\"product_code\":\"24701532\",\"product_name\":\"Kue Ulang Tahun\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"45000.0000\",\"unit_price\":\"49500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"4500.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"10%\",\"item_discount\":\"5500.0000\",\"subtotal\":\"49500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"55000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-10 06:23:39'),
(68, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"50\",\"date\":\"2023-07-10 10:45:41\",\"reference_no\":\"SL\\/POS0049\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"15000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1500.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1500.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"16500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"16500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"190a8636b02b306d7dca4ae23336bdc62066bb48970c6b7be9dcc502d6d3bbaf\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"70\",\"sale_id\":\"50\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"71\",\"sale_id\":\"50\",\"product_id\":\"22\",\"product_code\":\"31128848\",\"product_name\":\"Keripik Ubi\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"10455.0000\",\"unit_price\":\"11500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1045.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"11500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"11500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(69, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"49\",\"date\":\"2023-07-10 10:27:07\",\"reference_no\":\"SL\\/POS0048\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"50000.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5000.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"5000.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"55000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"55000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"1e3273dda06508594879bbc91fab8f66165cc35091eb1692642073a8c880088f\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"69\",\"sale_id\":\"49\",\"product_id\":\"23\",\"product_code\":\"24701532\",\"product_name\":\"Kue Ulang Tahun\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"50000.0000\",\"unit_price\":\"55000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"5000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"55000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"55000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"}]}', '2023-07-10 06:23:39'),
(70, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"48\",\"date\":\"2023-07-10 10:22:47\",\"reference_no\":\"SL\\/POS0047\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"7\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"13635.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1365.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1365.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"15000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"15000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"137aed1780dc1a18460e7298a5c7f55f08b606df00062f9493356b203cc58138\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"68\",\"sale_id\":\"48\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"7\",\"item_tax\":\"1365.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"15000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(71, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"47\",\"date\":\"2023-07-10 10:19:31\",\"reference_no\":\"SL\\/POS0046\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"4\",\"biller\":null,\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"4545.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"455.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"455.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"5000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"1\",\"pos\":\"1\",\"paid\":\"5000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"e093f5e912362d66079ee4079a1746406253d6e969e01dc87b0ddea529fe9895\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"67\",\"sale_id\":\"47\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"455.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"5000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39');
INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(72, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"46\",\"date\":\"2023-07-07 15:47:27\",\"reference_no\":\"SL\\/POS0045\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"238635.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"23865.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"23865.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"262500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"12\",\"pos\":\"1\",\"paid\":\"262500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"03f1398e9dedaa5d2e2c22414182e9a456be1db910448b60daecc7b624ffef75\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"62\",\"sale_id\":\"46\",\"product_id\":\"23\",\"product_code\":\"24701532\",\"product_name\":\"Kue Ulang Tahun\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"50000.0000\",\"unit_price\":\"55000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"5000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"55000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"55000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"},{\"id\":\"63\",\"sale_id\":\"46\",\"product_id\":\"24\",\"product_code\":\"72231426\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"65000.0000\",\"unit_price\":\"71500.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"13000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"143000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"71500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"2\",\"product_unit_code\":\"pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"2\",\"base_unit_code\":\"pcs\"},{\"id\":\"64\",\"sale_id\":\"46\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"6.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2730.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"30000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"6.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"65\",\"sale_id\":\"46\",\"product_id\":\"22\",\"product_code\":\"31128848\",\"product_name\":\"Keripik Ubi\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"10455.0000\",\"unit_price\":\"11500.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"3135.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"34500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"11500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(73, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"45\",\"date\":\"2023-07-07 15:41:58\",\"reference_no\":\"SL\\/POS0044\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"37725.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"3775.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"3775.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"41500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"7\",\"pos\":\"1\",\"paid\":\"41500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"9ba6b7516b9cc3c6e39086147e4212a367435af1f6f7c367b459ad0d0eaac64f\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"59\",\"sale_id\":\"45\",\"product_id\":\"22\",\"product_code\":\"31128848\",\"product_name\":\"Keripik Ubi\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"10455.0000\",\"unit_price\":\"11500.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1045.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"11500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"11500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"60\",\"sale_id\":\"45\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"910.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"10000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"61\",\"sale_id\":\"45\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"4.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1820.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"4.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(74, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"44\",\"date\":\"2023-07-07 15:38:23\",\"reference_no\":\"SL\\/POS0043\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"31815.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"3185.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"3185.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"35000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"7\",\"pos\":\"1\",\"paid\":\"35000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"e8eba8763439160cd53168f1011fd2fa86b1e26c82eedbf3e3c3454701d02854\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"57\",\"sale_id\":\"44\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"4.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1820.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"4.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"},{\"id\":\"58\",\"sale_id\":\"44\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1365.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"15000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(75, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"43\",\"date\":\"2023-07-07 15:35:57\",\"reference_no\":\"SL\\/POS0042\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"13635.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1365.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1365.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"15000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"15000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"9896c3f9078c5fd83387dd5c19cdfc683ff725e2e588aaa68d1e99107d1af229\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"56\",\"sale_id\":\"43\",\"product_id\":\"21\",\"product_code\":\"20442151\",\"product_name\":\"Paha Ayam\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1365.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"15000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(76, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"42\",\"date\":\"2023-07-07 15:16:58\",\"reference_no\":\"SL\\/POS0041\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"22725.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2275.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2275.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"25000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"25000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"3ad1cb40cfd4a51f6f9da122d811ae3fbe4f76e52727110f57638abd63225438\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"55\",\"sale_id\":\"42\",\"product_id\":\"20\",\"product_code\":\"01489139\",\"product_name\":\"Donat\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4545.0000\",\"unit_price\":\"5000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2275.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"25000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"5000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"1\",\"product_unit_code\":\"bks\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"1\",\"base_unit_code\":\"bks\"}]}', '2023-07-10 06:23:39'),
(77, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"4\",\"date\":\"2023-07-05 10:54:00\",\"reference_no\":\"2023\\/07\\/0004\",\"warehouse_id\":\"7\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"6\",\"adjustment_id\":\"4\",\"product_id\":\"20\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"7\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":null,\"product_name\":null,\"image\":null,\"details\":null,\"variant\":null}]}', '2023-07-11 01:46:44'),
(78, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"5\",\"date\":\"2023-07-05 12:15:00\",\"reference_no\":\"2023\\/07\\/0005\",\"warehouse_id\":\"4\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"7\",\"adjustment_id\":\"5\",\"product_id\":\"21\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":null,\"product_name\":null,\"image\":null,\"details\":null,\"variant\":null}]}', '2023-07-11 01:46:46'),
(79, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"6\",\"date\":\"2023-07-11 10:00:00\",\"reference_no\":\"ADJ0006\",\"warehouse_id\":\"4\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"8\",\"adjustment_id\":\"6\",\"product_id\":\"26\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"9\",\"adjustment_id\":\"6\",\"product_id\":\"36\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"10\",\"adjustment_id\":\"6\",\"product_id\":\"138\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1146\",\"product_name\":\"Strawberry Double Bun\",\"image\":\"5138c3d599294f1ee45e51e62c597429.jpg\",\"details\":\"\",\"variant\":null},{\"id\":\"11\",\"adjustment_id\":\"6\",\"product_id\":\"38\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1006\",\"product_name\":\"Roti Sosis Keju Mini\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-11 06:59:53'),
(80, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"61\",\"date\":\"2023-07-11 14:11:14\",\"reference_no\":\"SL\\/POS0060\",\"customer_id\":\"4\",\"customer\":\"3453475\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"57000.0000\",\"product_discount\":\"3300.0000\",\"order_discount_id\":\"\",\"total_discount\":\"3300.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"5700.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"5700.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"62700.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"62700.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"455350ffd77f24a8fe9795585a023c4dc1fdcf6bc2aea307e2617f089e837295\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"87\",\"sale_id\":\"61\",\"product_id\":\"33\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"28500.0000\",\"unit_price\":\"31350.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"5700.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"5%\",\"item_discount\":\"3300.0000\",\"subtotal\":\"62700.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-13 03:47:56'),
(81, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"60\",\"date\":\"2023-07-11 14:08:26\",\"reference_no\":\"SL\\/POS0059\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"3\",\"biller\":\"Test Biller\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"38637.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"3863.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"3863.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"42500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"6\",\"pos\":\"1\",\"paid\":\"42500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"217021d04a43879439302f8e1e75f87f55a9c4d3426e41c283fb258edb02323f\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"85\",\"sale_id\":\"60\",\"product_id\":\"26\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"20\",\"product_unit_code\":\"Bungkus\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"20\",\"base_unit_code\":\"Bungkus\"},{\"id\":\"86\",\"sale_id\":\"60\",\"product_id\":\"38\",\"product_code\":\"1006\",\"product_name\":\"Roti Sosis Keju Mini\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"4091.0000\",\"unit_price\":\"4500.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2045.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"22500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"4500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-13 03:47:56'),
(82, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"71\",\"date\":\"2023-07-17 15:29:23\",\"reference_no\":\"SL\\/POS0070\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"18\",\"biller\":\"ROTTE BAKERY KERINCI 2\",\"warehouse_id\":\"24\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"45455.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4545.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"4545.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"50000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"90\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"4\",\"pos\":\"1\",\"paid\":\"50000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"05f6d5d2c062162283e159af3842f57be0d44545abdecdcc7e109678201daed9\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"103\",\"sale_id\":\"71\",\"product_id\":\"26\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"24\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"20\",\"product_unit_code\":\"Bungkus\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"20\",\"base_unit_code\":\"Bungkus\"},{\"id\":\"104\",\"sale_id\":\"71\",\"product_id\":\"39\",\"product_code\":\"1007\",\"product_name\":\"Roti Isi Daging\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"24\",\"item_tax\":\"2727.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"30000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(83, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"70\",\"date\":\"2023-07-15 11:31:36\",\"reference_no\":\"SL\\/POS0069\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"18182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"1818.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"1818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"20000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"2\",\"pos\":\"1\",\"paid\":\"20000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"a928d7df58d4389f8364fa49706bf103f4c86147beccacebd65de8c46e4c74b6\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"102\",\"sale_id\":\"70\",\"product_id\":\"36\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(84, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"69\",\"date\":\"2023-07-15 11:31:23\",\"reference_no\":\"SL\\/POS0068\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"75910.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"7590.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"7590.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"83500.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"7\",\"pos\":\"1\",\"paid\":\"83500.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"501c032dca0e4b25bbf72650c06926922f302e07e6396591c17207bed99b8035\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"100\",\"sale_id\":\"69\",\"product_id\":\"33\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"6000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"66000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"},{\"id\":\"101\",\"sale_id\":\"69\",\"product_id\":\"154\",\"product_code\":\"1175\",\"product_name\":\"Pizza Dought\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"3182.0000\",\"unit_price\":\"3500.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1590.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"17500.0000\",\"serial_no\":\"\",\"real_unit_price\":\"3500.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(85, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"68\",\"date\":\"2023-07-15 11:30:59\",\"reference_no\":\"SL\\/POS0067\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"48182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4818.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"4818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"53000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"53000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"822428a228432ccf01ce7684ae6fc146ec2afebbc3c69941f2e5646885223ffa\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"98\",\"sale_id\":\"68\",\"product_id\":\"36\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"},{\"id\":\"99\",\"sale_id\":\"68\",\"product_id\":\"33\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"3000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"33000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(86, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"67\",\"date\":\"2023-07-15 11:22:25\",\"reference_no\":\"SL\\/POS0066\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"45455.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4545.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"4545.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"50000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"4\",\"pos\":\"1\",\"paid\":\"50000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"7a9ea97dfb0514602ea9441833a1c67275c6432ef08108e01364471d6c81dfd1\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"96\",\"sale_id\":\"67\",\"product_id\":\"26\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"20\",\"product_unit_code\":\"Bungkus\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"20\",\"base_unit_code\":\"Bungkus\"},{\"id\":\"97\",\"sale_id\":\"67\",\"product_id\":\"36\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2727.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"30000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(87, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"66\",\"date\":\"2023-07-14 10:10:44\",\"reference_no\":\"SL\\/POS0065\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"27273.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"2727.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"2727.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"30000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"30000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"990321f96507baa6146d052ad4b2e1583f5c21fbcdf9228a7a17e800317432bc\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"95\",\"sale_id\":\"66\",\"product_id\":\"36\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"2727.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"30000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(88, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"65\",\"date\":\"2023-07-13 14:22:07\",\"reference_no\":\"SL\\/POS0064\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"13\",\"biller\":\"ROTTE BAKERY GARUDA SAKTI\",\"warehouse_id\":\"12\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"45455.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"4545.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"4545.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"50000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"50000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"5fdb5df9176225878eefd94fd4e66d32d4efac9d81459c55e71d4b0e9b603638\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"94\",\"sale_id\":\"65\",\"product_id\":\"39\",\"product_code\":\"1007\",\"product_name\":\"Roti Isi Daging\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"5.0000\",\"warehouse_id\":\"12\",\"item_tax\":\"4545.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"50000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"5.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(89, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"64\",\"date\":\"2023-07-13 14:14:50\",\"reference_no\":\"SL\\/POS0063\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"8\",\"biller\":\"ROTTE BAKERY BUKIT BARISAN\",\"warehouse_id\":\"4\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"78182.0000\",\"product_discount\":\"0.0000\",\"order_discount_id\":\"\",\"total_discount\":\"0.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"7818.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"7818.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"86000.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"5\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"3\",\"pos\":\"1\",\"paid\":\"86000.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"118e7efa30dfc63b60349b5e3ac70998b3b768e8a0bb407870b9066fa69bbf56\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"92\",\"sale_id\":\"64\",\"product_id\":\"26\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"20\",\"product_unit_code\":\"Bungkus\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"20\",\"base_unit_code\":\"Bungkus\"},{\"id\":\"93\",\"sale_id\":\"64\",\"product_id\":\"33\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"30000.0000\",\"unit_price\":\"33000.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"4\",\"item_tax\":\"6000.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"66000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28');
INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(90, 'Sale is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"63\",\"date\":\"2023-07-13 11:34:32\",\"reference_no\":\"SL\\/POS0062\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"biller_id\":\"13\",\"biller\":\"ROTTE BAKERY GARUDA SAKTI\",\"warehouse_id\":\"12\",\"note\":\"\",\"staff_note\":\"\",\"total\":\"73955.0000\",\"product_discount\":\"1650.0000\",\"order_discount_id\":\"\",\"total_discount\":\"1650.0000\",\"order_discount\":\"0.0000\",\"product_tax\":\"7395.0000\",\"order_tax_id\":\"0\",\"order_tax\":\"0.0000\",\"total_tax\":\"7395.0000\",\"shipping\":\"0.0000\",\"grand_total\":\"81350.0000\",\"sale_status\":\"completed\",\"payment_status\":\"paid\",\"payment_term\":\"0\",\"due_date\":null,\"created_by\":\"3\",\"updated_by\":null,\"updated_at\":null,\"total_items\":\"5\",\"pos\":\"1\",\"paid\":\"81350.0000\",\"return_id\":null,\"surcharge\":\"0.0000\",\"attachment\":null,\"return_sale_ref\":null,\"sale_id\":null,\"return_sale_total\":\"0.0000\",\"rounding\":\"0.0000\",\"suspend_note\":null,\"api\":\"0\",\"shop\":\"0\",\"address_id\":null,\"reserve_id\":null,\"hash\":\"284511b20788fe099c3944b0f60a4833153f89223c4622e1a233bbba32c887b2\",\"manual_payment\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"payment_method\":null},\"items\":[{\"id\":\"89\",\"sale_id\":\"63\",\"product_id\":\"26\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"18182.0000\",\"unit_price\":\"20000.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"12\",\"item_tax\":\"1818.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"20000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"20000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"20\",\"product_unit_code\":\"Bungkus\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"20\",\"base_unit_code\":\"Bungkus\"},{\"id\":\"90\",\"sale_id\":\"63\",\"product_id\":\"33\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"product_type\":\"standard\",\"option_id\":\"0\",\"net_unit_price\":\"28500.0000\",\"unit_price\":\"31350.0000\",\"quantity\":\"1.0000\",\"warehouse_id\":\"12\",\"item_tax\":\"2850.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"5%\",\"item_discount\":\"1650.0000\",\"subtotal\":\"31350.0000\",\"serial_no\":\"\",\"real_unit_price\":\"33000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"1.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"},{\"id\":\"91\",\"sale_id\":\"63\",\"product_id\":\"35\",\"product_code\":\"1003\",\"product_name\":\"Muffin Vanila Berry\",\"product_type\":\"standard\",\"option_id\":null,\"net_unit_price\":\"9091.0000\",\"unit_price\":\"10000.0000\",\"quantity\":\"3.0000\",\"warehouse_id\":\"12\",\"item_tax\":\"2727.0000\",\"tax_rate_id\":\"2\",\"tax\":\"10%\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"30000.0000\",\"serial_no\":\"\",\"real_unit_price\":\"10000.0000\",\"sale_item_id\":null,\"product_unit_id\":\"29\",\"product_unit_code\":\"Pcs\",\"unit_quantity\":\"3.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null,\"tax_code\":\"PB1\",\"tax_name\":\"PB1 @10%\",\"tax_rate\":\"10.0000\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null,\"hsn_code\":null,\"second_name\":\"\",\"base_unit_id\":\"29\",\"base_unit_code\":\"Pcs\"}]}', '2023-07-20 08:49:28'),
(91, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"11\",\"date\":\"2023-07-17 14:51:00\",\"reference_no\":\"ADJ0011\",\"warehouse_id\":\"24\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"28\",\"adjustment_id\":\"11\",\"product_id\":\"26\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"24\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"29\",\"adjustment_id\":\"11\",\"product_id\":\"273\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"24\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1307\",\"product_name\":\"16 Paha Ayam\",\"image\":\"\",\"details\":\"\",\"variant\":null},{\"id\":\"30\",\"adjustment_id\":\"11\",\"product_id\":\"39\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"24\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1007\",\"product_name\":\"Roti Isi Daging\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-20 09:19:54'),
(92, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"10\",\"date\":\"2023-07-17 13:23:52\",\"reference_no\":\"ADJ0010\",\"warehouse_id\":\"17\",\"note\":\"&lt;p&gt;plan 17&sol;7&sol;2023&lt;&sol;p&gt;\",\"attachment\":null,\"created_by\":\"224\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"24\",\"adjustment_id\":\"10\",\"product_id\":\"26\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"17\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"25\",\"adjustment_id\":\"10\",\"product_id\":\"33\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"17\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"26\",\"adjustment_id\":\"10\",\"product_id\":\"38\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"17\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1006\",\"product_name\":\"Roti Sosis Keju Mini\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"27\",\"adjustment_id\":\"10\",\"product_id\":\"273\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"17\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1307\",\"product_name\":\"16 Paha Ayam\",\"image\":\"\",\"details\":\"\",\"variant\":null}]}', '2023-07-20 09:19:54'),
(93, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"9\",\"date\":\"2023-07-13 11:29:00\",\"reference_no\":\"ADJ0009\",\"warehouse_id\":\"12\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"20\",\"adjustment_id\":\"9\",\"product_id\":\"39\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"12\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1007\",\"product_name\":\"Roti Isi Daging\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"21\",\"adjustment_id\":\"9\",\"product_id\":\"35\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"12\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1003\",\"product_name\":\"Muffin Vanila Berry\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"22\",\"adjustment_id\":\"9\",\"product_id\":\"33\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"12\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"23\",\"adjustment_id\":\"9\",\"product_id\":\"26\",\"option_id\":null,\"quantity\":\"50.0000\",\"warehouse_id\":\"12\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-20 09:19:54'),
(94, 'Quantity adjustment is being deleted by zulwegi (User Id: 2)', '{\"model\":{\"id\":\"8\",\"date\":\"2023-07-13 11:27:00\",\"reference_no\":\"ADJ0008\",\"warehouse_id\":\"4\",\"note\":\"\",\"attachment\":null,\"created_by\":\"2\",\"updated_by\":null,\"updated_at\":null,\"count_id\":null},\"items\":[{\"id\":\"16\",\"adjustment_id\":\"8\",\"product_id\":\"33\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1001\",\"product_name\":\"Bolu Gulung Rotte\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"17\",\"adjustment_id\":\"8\",\"product_id\":\"26\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"0102\",\"product_name\":\"Keripik Emak CW\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"18\",\"adjustment_id\":\"8\",\"product_id\":\"154\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1175\",\"product_name\":\"Pizza Dought\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null},{\"id\":\"19\",\"adjustment_id\":\"8\",\"product_id\":\"36\",\"option_id\":null,\"quantity\":\"100.0000\",\"warehouse_id\":\"4\",\"serial_no\":\"\",\"type\":\"addition\",\"product_code\":\"1004\",\"product_name\":\"Muffin Double Chocolate\",\"image\":\"no_image.png\",\"details\":\"\",\"variant\":null}]}', '2023-07-20 09:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Terimakasih sudah menggunakan systemPOS IT Development Babadacorp</p>', '2014-08-14 23:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 1, 2, 1, 1, 71, 2, 72, 1, 1, 1, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, NULL, 1, 1, 1, 0, 1, 1, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1),
(4, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 1, 1, 1, 1, NULL, 1, 1, 1, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_dana` decimal(10,0) DEFAULT NULL,
  `total_ovo` decimal(10,0) DEFAULT NULL,
  `total_gofood` decimal(10,0) DEFAULT NULL,
  `total_shopee` decimal(10,0) DEFAULT NULL,
  `total_qris` decimal(10,0) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_dana_submitted` decimal(10,0) DEFAULT NULL,
  `total_ovo_submitted` decimal(10,0) DEFAULT NULL,
  `total_gofood_submitted` decimal(10,0) DEFAULT NULL,
  `total_shopee_submitted` decimal(10,0) DEFAULT NULL,
  `total_qris_submitted` decimal(10,0) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.5.2',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.5.2', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(2, 'CASH PROMO'),
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(2, '0102', 'Keripik Emak CW', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(3, '0104', 'Keripik Kentang Original', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(4, '0105', 'Keripik Kentang Pedas Manis', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(5, '0106', 'Keripik Ubi Putih Original', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(6, '0107', 'Keripik Ubi Putih Pedas', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(7, '0108', 'Keripik Pisang', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(8, '1003', 'Muffin Vanila Berry', 29, 0.0000, 10000.0000, 5.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(9, '1004', 'Muffin Double Chocolate', 29, 0.0000, 10000.0000, 5.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(10, '1005', 'Roti Sosis Abon Mini', 29, 0.0000, 4500.0000, 0.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(11, '1006', 'Roti Sosis Keju Mini', 29, 0.0000, 4500.0000, 0.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(12, '1007', 'Roti Isi Daging', 29, 0.0000, 10000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(13, '1008', '16 Isi Ayam', 29, 0.0000, 8000.0000, 0.0000, 'no_image.png', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(14, '1011', '16 Premium', 29, 0.0000, 7000.0000, 0.0000, 'no_image.png', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(15, '1016', 'Black Square 12', 29, 0.0000, 25000.0000, 2.0000, '442857dd9272aca057178d1663b32c38.jpeg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(16, '1017', 'Black Forest Strawberry D18', 29, 0.0000, 110000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(17, '1018', 'Black Forest D12', 29, 0.0000, 53000.0000, 2.0000, '70b368d1d3ede30a41a6747336ba6b04.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(18, '1019', 'Black Forest Blueberry D18', 29, 0.0000, 110000.0000, 2.0000, 'fe8e0bbd1c9ea8d0bf562c44b105759e.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(19, '1020', 'Black Forest Snow D18', 29, 0.0000, 120000.0000, 2.0000, 'b615dfb241d94b5fcb40874ff86851b2.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(20, '1021', 'Black Forest Fruits', 29, 0.0000, 125000.0000, 2.0000, '802a2bec49206d1825308ea25202f708.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(21, '1022', 'Black Forest Love D15', 29, 0.0000, 85000.0000, 2.0000, 'd03d29fcbfa94371e217b2c65595afbd.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(22, '1023', 'Chiffon Classic Vanilla', 29, 0.0000, 32000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(23, '1024', 'Strawberry 12 D18', 29, 0.0000, 110000.0000, 2.0000, '87ca4e222ff25a1882cd5799e3c19707.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(24, '1025', 'Chocolate Oreo D18', 29, 0.0000, 98000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(25, '1026', 'Chocolate Blueberry D18', 29, 0.0000, 98000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(26, '1027', 'Tiramisu 12 D18', 29, 0.0000, 98000.0000, 2.0000, '0f3214a95a5f1cc975b070b875d3beed.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(27, '1028', 'Tiramisu 12 Flower D18', 29, 0.0000, 115000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(28, '1029', 'Black Forest Blueberry D22', 29, 0.0000, 205000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(29, '1030', 'Flower 12 D18', 29, 0.0000, 110000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(30, '1031', 'Pink 12 Fruits D18', 29, 0.0000, 115000.0000, 2.0000, 'fc0d6955bb4a2beea95a54603f060669.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(31, '1032', 'Chiffon Classic Pandan', 29, 0.0000, 32000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(32, '1033', 'Chiffon Classic Taro', 29, 0.0000, 32000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(33, '1034', 'Chiffon Classic Coklat', 29, 0.0000, 32000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(34, '1035', 'Charakter 12', 29, 0.0000, 205000.0000, 2.0000, '9e63808c77b612e9ba20f4ff52b82cc4.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(35, '1036', 'Wedding 12 D18', 29, 0.0000, 205000.0000, 2.0000, '374ba0e562cfa8f8159de96bd9babc56.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(36, '1037', 'France 12 Coklat D18', 29, 0.0000, 205000.0000, 2.0000, '0c1682df2904b750108ba8222449552c.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(37, '1038', 'Browking (Brownies Kering)', 29, 0.0000, 42000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(38, '1039', 'Black Forest 18x18', 29, 0.0000, 160000.0000, 2.0000, 'f49d0e2d8bb68cb5aeeaa593aaa9edc2.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(39, '1040', 'Black Forest Snow D22', 29, 0.0000, 205000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(40, '1041', 'Orange 12', 29, 0.0000, 135000.0000, 2.0000, 'bfcaa20445bfe3c09982a381d1b76ebc.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(41, '1042', 'Chiffon Topping Keju', 29, 0.0000, 37000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(42, '1043', 'Chiffon Topping Coklat', 29, 0.0000, 37000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(43, '1044', 'Chiffon Topping Combi', 29, 0.0000, 37000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(44, '1045', 'Tiramisu Tigerson D18', 29, 0.0000, 100000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(45, '1046', 'Red Velvet Cheese D18', 29, 0.0000, 150000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(46, '1047', 'Mocca 12 D18', 29, 0.0000, 98000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(47, '1048', 'Strawberry Glaze Love D15', 29, 0.0000, 101000.0000, 2.0000, 'd3593257c94013ef6b0cf945ac40c872.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(48, '1049', 'Strawberry 12 D12', 29, 0.0000, 53000.0000, 2.0000, 'a341493e174e9031977659e06230c360.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(49, '1050', 'Red 12 D12', 29, 0.0000, 53000.0000, 2.0000, '2c7b7717a032f22250d13dd2bc690b92.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(50, '1053', 'Classic Tuna Bun', 29, 0.0000, 8000.0000, 20.0000, 'd8fbbc1ed754cc2011bf858fe0dddf79.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(51, '1054', 'Sweet Banana Cho&Che', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(52, '1055', 'Banana 2212', 29, 0.0000, 9000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(53, '1056', 'Cheese Roll Bun', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(54, '1057', 'Rainbow 12 D18', 29, 0.0000, 135000.0000, 2.0000, 'adebc210154899d34ba4d7e6f0d5196d.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 0, 0, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(55, '1058', 'Banana 12 Vanilla', 29, 0.0000, 39000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(56, '1073', 'Gepeng K Hijau', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(57, '1074', 'Gepeng K Merah', 29, 0.0000, 2500.0000, 0.0000, 'a28e273f05cf4dc36b0218fb6255abc3.jpg', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(58, '1075', 'Roti Kurma', 29, 0.0000, 5000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(59, '1076', 'Roti Sisir Original', 29, 0.0000, 5000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(60, '1077', 'Roti Sisir Pandan', 29, 0.0000, 5500.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(61, '1078', 'Roti Sisir Taro', 29, 0.0000, 8500.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(62, '1079', 'Roti Telur', 29, 0.0000, 17000.0000, 0.0000, 'no_image.png', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(63, '1080', 'Korean Garlic Cheese', 29, 0.0000, 12000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(64, '1090', '12 Pisang Aren', 29, 0.0000, 9000.0000, 0.0000, 'no_image.png', 20, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(65, '1091', '36 Madu', 29, 0.0000, 13500.0000, 0.0000, 'no_image.png', 20, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(66, '1092', 'Roti Multigrain', 29, 0.0000, 13500.0000, 0.0000, 'no_image.png', 20, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(67, '1101', 'Abon Roll', 29, 0.0000, 11500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(68, '1103', 'Banana Meses Mexicana', 29, 0.0000, 7000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(69, '1104', 'Beef Fllos', 29, 0.0000, 10000.0000, 5.0000, '475cb45ee3306ff92285b046feecb6ca.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(70, '1105', 'Butter Coffe', 29, 0.0000, 7500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(71, '1106', 'Butter Vanila', 29, 0.0000, 6000.0000, 5.0000, '3b594855ea33acd1b8b3099cecc5cf0c.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(72, '1107', 'Cheese Fllos', 29, 0.0000, 6500.0000, 5.0000, '4b48bac32e3b66a3b225e06064025218.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(73, '1108', 'Coklat and Coklat', 29, 0.0000, 8500.0000, 5.0000, 'd8f9cbeb964113e674f1d63c0d55ac3a.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(74, '1109', 'Coklat Fllos', 29, 0.0000, 6500.0000, 5.0000, 'dc9b8073396e0a9f58e8f8a55aa63448.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(75, '1110', 'Coklat Oreo', 29, 0.0000, 7500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(76, '1111', 'Coklat Roll Bun', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(77, '1112', 'Coklat Spesial', 29, 0.0000, 7000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(78, '1115', 'Cream Chese Filling', 29, 0.0000, 7500.0000, 5.0000, '55a6d11cf30fac4e2400a02d69ee4f46.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(79, '1117', 'Durian Filling', 29, 0.0000, 6500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(80, '1118', 'Fit-O Coffe 50gr', 29, 0.0000, 6500.0000, 10.0000, '2090c4033ed1ee9245c1f7460283a0a4.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(81, '1119', 'Fit-O Vanilla', 29, 0.0000, 8000.0000, 5.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(82, '1120', 'Pandan Cheese', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(83, '1121', 'Pisang Coklat', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(84, '1122', 'Red Bean Flower', 29, 0.0000, 6000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(85, '1124', 'Sausage Bun', 29, 0.0000, 9000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(86, '1125', 'Vegetable Sausage', 29, 0.0000, 8000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(87, '1126', 'Vla Vanilla Bun', 29, 0.0000, 6500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(88, '1127', 'Ball Vanilla Sugar', 29, 0.0000, 10500.0000, 5.0000, '8f7b3f403e296d56ef64669deb47bad5.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(89, '1128', 'Vanila mocca jumbo', 29, 0.0000, 16000.0000, 5.0000, '21c2fe93f5a6adf1c2cbadd075c819ec.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(90, '1129', 'Sausage Twist', 29, 0.0000, 8500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(91, '1130', 'Chicken Fllos', 29, 0.0000, 11000.0000, 5.0000, '2eb3d7e3fa382bffdddff87d38828312.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(92, '1131', 'Ball Cho. Chip', 29, 0.0000, 14000.0000, 5.0000, 'a7e34638c453c9dc0e1356b8ac7bccbb.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(93, '1132', 'Coklat Strusel', 29, 0.0000, 6500.0000, 0.0000, 'bbfc77bec6bd1b0f06a2d1242b092328.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(94, '1134', 'Mexcheese Bun', 29, 0.0000, 7000.0000, 5.0000, '42e91e4f35ed1ead67977ec86aac6cbd.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(95, '1136', 'Milk Cheese Bun', 29, 0.0000, 18000.0000, 5.0000, '', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(96, '1137', 'Fit-O Vanila Mini', 29, 0.0000, 3500.0000, 2.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(97, '1140', 'Red Bean Twist Cho. Chip', 29, 0.0000, 17500.0000, 5.0000, 'b4dc9858732618d002f8d6c5381603ce.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(98, '1141', 'Vegetable Mini', 29, 0.0000, 3500.0000, 5.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(99, '1142', 'Blueberry Streusel', 29, 0.0000, 11000.0000, 5.0000, '', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(100, '1144', 'Blueberry Milk Cheese', 29, 0.0000, 20500.0000, 5.0000, '66e9bd55e00712322a4078d0cf7220b3.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(101, '1145', 'Blueberry Double Bun', 29, 0.0000, 7500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(102, '1146', 'Strawberry Double Bun', 29, 0.0000, 7500.0000, 5.0000, '5138c3d599294f1ee45e51e62c597429.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(103, '1147', 'Bread And Coffe', 29, 0.0000, 16000.0000, 5.0000, '3cf31a8600bfdecc62a5ebdc91b2bd57.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(104, '1148', 'Hot Sausage', 29, 0.0000, 8000.0000, 5.0000, 'c65ecde9c7436b64bce04f7484ac8d24.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(105, '1150', 'Raisapple sweet', 29, 0.0000, 15500.0000, 5.0000, '0b8d65b62193579d24858e466e49317c.jpg', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(106, '1151', 'Sweet Pillar', 29, 0.0000, 12000.0000, 5.0000, '', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(107, '1152', 'Pizza Van', 29, 0.0000, 9000.0000, 5.0000, 'b29c131819454e3d5288d96de1bd36bb.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(108, '1154', 'Nas22 Bun', 29, 0.0000, 6000.0000, 5.0000, 'a9dea0761166753b06ff1e85fd616013.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(109, '1155', 'Sausage Roll', 29, 0.0000, 7500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(110, '1157', 'Black Forest Sisir', 29, 0.0000, 15000.0000, 5.0000, 'e0f7a4524b73c7d57f6e216901c0b74d.jpg', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(111, '1158', 'Choco Banana Bar', 29, 0.0000, 12500.0000, 5.0000, '', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(112, '1159', 'Egg Bun', 29, 0.0000, 7500.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(113, '1162', 'Gepeng Srikaya', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(114, '1164', 'coklat milo', 29, 0.0000, 6000.0000, 0.0000, '5796301bd1a54271cb5867598f399e50.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(115, '1165', 'Strawberry Parmesan', 29, 0.0000, 6500.0000, 5.0000, '854bddc99e6f4008c113cf33778f9b5f.jpg', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(116, '1166', 'Rice Choco Bun', 29, 0.0000, 6000.0000, 5.0000, '', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(117, '1170', 'American Twist', 29, 0.0000, 17000.0000, 5.0000, '', 33, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(118, '1181', 'Strawberry Square D10', 29, 0.0000, 28000.0000, 2.0000, '85ebd3f18c26d1a3a6150d68ef112ae4.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(119, '1182', 'Tiramisu Square D10', 29, 0.0000, 28000.0000, 2.0000, '923c87c8866b6806e2782382c7364d17.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(120, '1183', 'Mini Roll 2 Rasa', 29, 0.0000, 40000.0000, 0.0000, 'no_image.png', 12, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(121, '1184', 'Kacang Telur 500gr', 20, 0.0000, 30000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(122, '1185', 'Kacang Polong (Arcis) 500gr', 20, 0.0000, 30000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(123, '1186', 'Chocolate Oreo D22', 29, 0.0000, 150000.0000, 2.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(124, '1187', 'Red Velvet D18', 29, 0.0000, 160000.0000, 2.0000, '6998616850c6c61a65e620d2861a1f57.jpg', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(125, '1190', 'Boiled Egg Bread', 29, 0.0000, 7000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(126, '1191', 'Roti Sosis Jumbo', 29, 0.0000, 15000.0000, 0.0000, 'no_image.png', 34, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(127, '1192', 'Roti Sobek 2 Rasa', 29, 0.0000, 22000.0000, 0.0000, 'no_image.png', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(128, '1193', 'Kacang Campur 500gr', 20, 0.0000, 27500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(129, '1194', 'Kacang Koro Asin 500gr', 20, 0.0000, 27500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(130, '1195', 'Kacang Koro Kulit 500gr', 20, 0.0000, 29500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(131, '1196', 'Kacang Atom Madu 500gr', 20, 0.0000, 32500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(132, '1197', 'Kue Bawang Rengat 500gr', 20, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(133, '1198', 'Kue Bawang Pedas 500gr', 20, 0.0000, 60000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(134, '1199', 'Kue Bawang 500gr', 20, 0.0000, 55000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(135, '1201', 'Pillow Cheese', 29, 0.0000, 16000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(136, '1202', 'Pillow Coklat', 29, 0.0000, 16000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(137, '1203', 'Pillow Combi', 29, 0.0000, 16000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(138, '1204', 'Pillow Vla', 29, 0.0000, 16000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(139, '1205', 'Pillow Pottato', 29, 0.0000, 17500.0000, 5.0000, '82c8a09b295f5e023c0fa4d5c5f3521e.jpg', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(140, '1206', 'Pillow Srikaya', 29, 0.0000, 16000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(141, '1207', 'Pillow Plain', 29, 0.0000, 10500.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(142, '1208', 'Pillow Kelapa', 29, 0.0000, 13000.0000, 5.0000, '', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(143, '1209', 'Pillow Cho.Chip', 29, 0.0000, 13500.0000, 5.0000, '8c764cb9b1d4c60a72b45d9361aaf8ed.jpg', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(144, '1210', 'Kacang Sembunyi', 20, 0.0000, 19000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(145, '1211', 'Stick Ubi Ungu', 20, 0.0000, 19000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(146, '1212', 'Stick Balado 360gr', 20, 0.0000, 21000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(147, '1213', 'Stick Royco 500gr', 20, 0.0000, 50000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(148, '1214', 'Stick Astor', 20, 0.0000, 19000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(149, '1215', 'Soes Kering', 20, 0.0000, 20000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(150, '1216', 'Keripik Pisang 250gr', 20, 0.0000, 26000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(151, '1217', 'Stick Ubi Ungu 500gr', 20, 0.0000, 44000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(152, '1218', 'Kacang Selimut 500gr', 20, 0.0000, 44000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(153, '1220', 'Sobek Pandan Almond Susu', 29, 0.0000, 20000.0000, 0.0000, 'no_image.png', 17, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(154, '1221', 'HAMPERS IED MUBARAK 1', 28, 0.0000, 285000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 28, 28, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(155, '1222', 'HAMPERS IED MUBARAK 2', 28, 0.0000, 355000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 28, 28, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(156, '1223', 'HAMPERS BEDUK 1', 28, 0.0000, 175000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 28, 28, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(157, '1224', 'HAMPERS BEDUK 2', 28, 0.0000, 260000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 28, 28, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(158, '1225', 'HAMPERS THR', 28, 0.0000, 168000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 28, 28, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(159, '1226', 'ARARUT CHOCOLATE LARGE', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(160, '1227', 'ARARUT CHOCOLATE MEDIUM', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(161, '1228', 'ARARUT CHOCOLATE SMALL', 29, 0.0000, 52900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(162, '1229', 'ARARUT KETAN HITAM LARGE', 29, 0.0000, 67900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(163, '1230', 'ARARUT KETAN HITAM MEDIUM', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(164, '1231', 'ARARUT KETAN HITAM SMALL', 29, 0.0000, 49900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(165, '1232', 'ARARUT SUSU LARGE', 29, 0.0000, 67900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(166, '1233', 'ARARUT SUSU MEDIUM', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(167, '1234', 'ARARUT SUSU SMALL', 29, 0.0000, 49900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(168, '1235', 'BANGKET KEJU LARGE', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(169, '1236', 'BANGKET KEJU MEDIUM', 29, 0.0000, 63900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(170, '1237', 'BANGKET KEJU SMALL', 29, 0.0000, 49900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(171, '1238', 'BLACK DATE CARAMEL LARGE', 29, 0.0000, 83900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(172, '1239', 'BLACK DATE CARAMEL MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(173, '1240', 'BLACK DATE CARAMEL SMALL', 29, 0.0000, 57900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(174, '1241', 'BLACK FOREST PEANUT LARGE', 29, 0.0000, 82900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(175, '1242', 'BLACK FOREST PEANUT MEDIUM', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(176, '1243', 'BLACK FOREST PEANUT SMALL', 29, 0.0000, 54900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(177, '1244', 'BONEKA LUCU LARGE', 29, 0.0000, 77900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(178, '1245', 'BONEKA LUCU MEDIUM', 29, 0.0000, 67900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(179, '1246', 'BONEKA LUCU SMALL', 29, 0.0000, 53900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(180, '1247', 'CHEESE CRACKER LARGE', 29, 0.0000, 86900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(181, '1248', 'CHEESE CRACKER MEDIUM', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(182, '1249', 'CHEESE CRACKER SMALL', 29, 0.0000, 57900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(183, '1250', 'CHOCOLATE BALLS MEDE LARGE', 29, 0.0000, 85900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(184, '1251', 'CHOCOLATE BALLS MEDE MEDIUM', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(185, '1252', 'CHOCOLATE BALLS MEDE SMALL', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(186, '1253', 'CHOCOLATE BALLS OREO LARGE', 29, 0.0000, 85900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(187, '1254', 'CHOCOLATE BALLS OREO MEDIUM', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(188, '1255', 'CHOCOLATE BALLS OREO SMALL', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(189, '1256', 'CHOCOLATE BALLS TIRAMISU LARGE', 29, 0.0000, 85900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(190, '1257', 'CHOCOLATE BALLS TIRAMISU MEDIUM', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(191, '1258', 'CHOCOLATE BALLS TIRAMISU SMALL', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(192, '1259', 'CHOCOLATE BLUEBERRY LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(193, '1260', 'CHOCOLATE BLUEBERRY MEDIUM', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(194, '1261', 'CHOCOLATE BLUEBERRY SMALL', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(195, '1262', 'CHOCOLATE VIOLET LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(196, '1263', 'CHOCOLATE VIOLET MEDIUM', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(197, '1264', 'CHOCOLATE VIOLET SMALL', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(198, '1265', 'COCONUT CHOCOLATE LARGE', 29, 0.0000, 87900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(199, '1266', 'COCONUT CHOCOLATE MEDIUM', 29, 0.0000, 72900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(200, '1267', 'COCONUT CHOCOLATE SMALL', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(201, '1268', 'COKLAT CRISPY LARGE', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(202, '1269', 'COKLAT CRISPY MEDIUM', 29, 0.0000, 59900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(203, '1270', 'COKLAT CRISPY SMALL', 29, 0.0000, 48900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(204, '1271', 'COKLAT KACANG LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(205, '1272', 'COKLAT KACANG MEDIUM', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(206, '1273', 'COKLAT KACANG SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(207, '1274', 'COKLAT LEMON LARGE', 29, 0.0000, 90900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(208, '1275', 'COKLAT LEMON MEDIUM', 29, 0.0000, 75900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(209, '1276', 'COKLAT LEMON SMALL', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(210, '1277', 'CORNFLAKES KISMIS SUKADE LARGE', 29, 0.0000, 81900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(211, '1278', 'CORNFLAKES KISMIS SUKADE MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(212, '1279', 'CORNFLAKES KISMIS SUKADE SMALL', 29, 0.0000, 55900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(213, '1283', 'FRUITY YUPI LARGE', 29, 0.0000, 82900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(214, '1284', 'FRUITY YUPI MEDIUM', 29, 0.0000, 74900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(215, '1285', 'FRUITY YUPI SMALL', 29, 0.0000, 56900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(216, '1286', 'HOLLANDISCHE ZEBRA LARGE', 29, 0.0000, 86900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(217, '1287', 'HOLLANDISCHE ZEBRA MEDIUM', 29, 0.0000, 72900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(218, '1288', 'HOLLANDISCHE ZEBRA SMALL', 29, 0.0000, 57900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(219, '1289', 'KASTANGEL LARGE', 29, 0.0000, 90900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(220, '1290', 'KASTANGEL MEDIUM', 29, 0.0000, 78900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(221, '1291', 'KASTANGEL SMALL', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(222, '1292', 'KELAPA STRAWBERRY LARGE', 29, 0.0000, 73900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(223, '1293', 'KELAPA STRAWBERRY MEDIUM', 29, 0.0000, 64900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(224, '1294', 'KELAPA STRAWBERRY SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(225, '1295', 'KURMA CHOCOCRUNCH LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(226, '1296', 'KURMA CHOCOCRUNCH MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(227, '1297', 'KURMA CHOCOCRUNCH SMALL', 29, 0.0000, 51900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(228, '1298', 'KURMA KACANG LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(229, '1299', 'KURMA KACANG MEDIUM', 29, 0.0000, 63900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(230, '1300', 'KURMA KACANG SMALL', 29, 0.0000, 51900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(231, '1301', '16 Rotte', 29, 0.0000, 5000.0000, 5.0000, '24ddbd5b39bc0d3eb4ce6556e562a51f.jpg', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(232, '1305', '16 Mini Rotte', 29, 0.0000, 3000.0000, 5.0000, 'dfd822940421fe1ead27b1e5fb3f9bce.jpg', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(233, '1307', '16 Paha Ayam', 29, 0.0000, 6000.0000, 5.0000, '', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(234, '1308', '16 Bomboloni', 29, 0.0000, 4000.0000, 5.0000, '', 16, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(235, '1310', 'LIDAH KUCING KEJU LARGE', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(236, '1311', 'LIDAH KUCING KEJU MEDIUM', 29, 0.0000, 55900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(237, '1312', 'LIDAH KUCING KEJU SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(238, '1313', 'LIDAH KUCING ORIGINAL LARGE', 29, 0.0000, 63900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(239, '1314', 'LIDAH KUCING ORIGINAL MEDIUM', 29, 0.0000, 53900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(240, '1315', 'LIDAH KUCING ORIGINAL SMALL', 29, 0.0000, 48900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(241, '1316', 'LIDAH KUCING RAINBOW LARGE', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(242, '1317', 'LIDAH KUCING RAINBOW MEDIUM', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(243, '1318', 'LIDAH KUCING RAINBOW SMALL', 29, 0.0000, 52900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(244, '1319', 'MEDE KELAPA LARGE', 29, 0.0000, 84900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(245, '1320', 'MEDE KELAPA MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(246, '1321', 'MEDE KELAPA SMALL', 29, 0.0000, 55900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(247, '1322', 'MELINJO LARGE', 29, 0.0000, 75900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(248, '1323', 'MELINJO MEDIUM', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(249, '1324', 'MELINJO SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(250, '1325', 'MILO MEDE LARGE', 29, 0.0000, 91900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(251, '1326', 'MILO MEDE MEDIUM', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(252, '1327', 'MILO MEDE SMALL', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(253, '1328', 'NASTAR BULAT LARGE', 29, 0.0000, 83900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(254, '1329', 'NASTAR BULAT MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(255, '1330', 'NASTAR BULAT SMALL', 29, 0.0000, 55900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(256, '1331', 'NASTAR CHOCOLATE LARGE', 29, 0.0000, 84900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(257, '1332', 'NASTAR CHOCOLATE MEDIUM', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(258, '1333', 'NASTAR CHOCOLATE SMALL', 29, 0.0000, 58900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(259, '1334', 'NASTAR DURIAN LARGE', 29, 0.0000, 84900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(260, '1335', 'NASTAR DURIAN MEDIUM', 29, 0.0000, 74900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(261, '1336', 'NASTAR DURIAN SMALL', 29, 0.0000, 57900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(262, '1337', 'NASTAR FULL KEJU LARGE', 29, 0.0000, 82900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(263, '1338', 'NASTAR FULL KEJU MEDIUM', 29, 0.0000, 74900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(264, '1339', 'NASTAR FULL KEJU SMALL', 29, 0.0000, 56900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(265, '1340', 'NASTAR GULUNG LARGE', 29, 0.0000, 83900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(266, '1341', 'NASTAR GULUNG MEDIUM', 29, 0.0000, 69900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(267, '1342', 'NASTAR GULUNG SMALL', 29, 0.0000, 55900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(268, '1343', 'NASTAR KURMA LARGE', 29, 0.0000, 80900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(269, '1344', 'NASTAR KURMA MEDIUM', 29, 0.0000, 66900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(270, '1345', 'NASTAR KURMA SMALL', 29, 0.0000, 51900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(271, '1346', 'NESTUM LARGE', 29, 0.0000, 77900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(272, '1347', 'NESTUM MEDIUM', 29, 0.0000, 63900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(273, '1348', 'NESTUM SMALL', 29, 0.0000, 51900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(274, '1349', 'NUGET KACANG LARGE', 29, 0.0000, 72900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(275, '1350', 'NUGET KACANG MEDIUM', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(276, '1351', 'NUGET KACANG SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(277, '1352', 'PUTIH SALJU SPESIAL LARGE', 29, 0.0000, 87900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(278, '1353', 'PUTIH SALJU SPESIAL MEDIUM', 29, 0.0000, 75900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(279, '1354', 'PUTIH SALJU SPESIAL SMALL', 29, 0.0000, 61900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(280, '1355', 'PUTRI KETAN HITAM LARGE', 29, 0.0000, 76900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(281, '1356', 'PUTRI KETAN HITAM MEDIUM', 29, 0.0000, 67900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(282, '1357', 'PUTRI KETAN HITAM SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(283, '1358', 'RED VELVET LARGE', 29, 0.0000, 78900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(284, '1359', 'RED VELVET MEDIUM', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(285, '1360', 'RED VELVET SMALL', 29, 0.0000, 53900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(286, '1361', 'SAGON BAKAR ORIGINAL LARGE', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(287, '1362', 'SAGON BAKAR PANDAN LARGE', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(288, '1363', 'SAGON BAKAR STRAWBERRY LARGE', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(289, '1364', 'SAGU KEJU LARGE', 29, 0.0000, 70900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(290, '1365', 'SAGU KEJU MEDIUM', 29, 0.0000, 65900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(291, '1366', 'SAGU KEJU SMALL', 29, 0.0000, 52900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(292, '1367', 'SKIPY LARGE', 29, 0.0000, 72900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(293, '1368', 'SKIPY MEDIUM', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(294, '1369', 'SKIPY SMALL', 29, 0.0000, 50900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(295, '1370', 'STICK PUFF ALMOND LARGE', 29, 0.0000, 62900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(296, '1371', 'SWEETHEART LARGE', 29, 0.0000, 85900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(297, '1372', 'SWEETHEART MEDIUM', 29, 0.0000, 73900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(298, '1373', 'SWEETHEART SMALL', 29, 0.0000, 60900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(299, '1374', 'WAFER LARGE', 29, 0.0000, 75900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(300, '1375', 'WAFER MEDIUM', 29, 0.0000, 67900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(301, '1376', 'WAFER SMALL', 29, 0.0000, 53900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(302, '1377', 'KOMBINASI NASTAR', 29, 0.0000, 104000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(303, '1378', 'KOMBINASI COKLAT', 29, 0.0000, 103000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(304, '1379', 'KOMBINASI MANIS', 29, 0.0000, 101000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(305, '1380', 'KOMBINASI GURIH', 29, 0.0000, 106000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(306, '1381', 'CHOCOLATE MIXED', 29, 0.0000, 185000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(307, '1382', 'NUTS MIXED', 29, 0.0000, 175000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(308, '1383', 'EID MUBARAK I LARGE', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(309, '1384', 'EID MUBARAK II LARGE', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(310, '1385', 'FROZEN LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(311, '1386', 'FROZEN SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(312, '1387', 'HELLO KITTY LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(313, '1388', 'HELLO KITTY SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(314, '1389', 'KUDA PONI LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(315, '1390', 'KUDA PONI SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(316, '1391', 'MARSHA LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(317, '1392', 'MARSHA SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(318, '1393', 'MUSLIM MUSLIMAH LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(319, '1394', 'MUSLIM MUSLIMAH SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(320, '1395', 'PIKACHU LARGE', 29, 0.0000, 95900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(321, '1396', 'PIKACHU SMALL', 29, 0.0000, 68900.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(322, '1401', 'Fit-O Mini', 29, 0.0000, 0.0000, 5.0000, '', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(323, '1402', 'Coklat Spesial Mini', 29, 0.0000, 3500.0000, 5.0000, '', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(324, '1411', '12 KETAN HITAM', 29, 0.0000, 30000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(325, '1415', 'BOLU GULUNG', 29, 0.0000, 39000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(326, '1416', 'BOLU GULUNG KETAN HITAM', 29, 0.0000, 40500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(327, '1417', 'KETAN HITAM', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(328, '1418', '12 TAPAI BESAR', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(329, '1419', '12 PANDAN BESAR', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(330, '1420', '12 PISANG BESAR', 29, 0.0000, 65000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(331, '1421', 'LAPIS SURABAYA PREMIUM', 29, 0.0000, 70000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(332, '1422', 'KEMOJO', 29, 0.0000, 17000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(333, '1423', 'PANDAN CHIFFON LAYAR', 29, 0.0000, 70000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(334, '1424', 'MIXED POUND 12', 29, 0.0000, 75000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(335, '1425', 'DOUBLE CHOCOLATE MALTINE', 29, 0.0000, 62000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(336, '1426', 'DOUBLE CHOCOLATE MALTINE MINI', 29, 0.0000, 35000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(337, '1427', 'RED MUFFIN 12', 29, 0.0000, 57000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(338, '1428', 'RED MUFFIN 12 MINI', 29, 0.0000, 32000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(339, '1429', 'PEANUT MOIST 12', 29, 0.0000, 52000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(340, '1430', 'PEANUT MOIST 12 MINI', 29, 0.0000, 30000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(341, '1431', 'Kurma Sukari 350Gr', 20, 0.0000, 28000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(342, '1432', 'Kurma Tunis Madu 350Gr', 20, 0.0000, 28000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(343, '1433', 'Kurma Tunis Tangkal Premium 500Gr', 20, 0.0000, 54000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(344, '1434', 'Kurma Tangkai Sanwan 500Gr', 20, 0.0000, 50000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(345, '1435', 'Kurma Khalas 500Gr', 20, 0.0000, 28000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(346, '1436', 'Kurma Anggur Natura 350Gr', 20, 0.0000, 36000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(347, '1437', 'Kurma Anggur Fatimah 500Gr', 20, 0.0000, 51000.0000, 0.0000, '', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(348, '1501', 'Tawar Ori', 29, 0.0000, 14000.0000, 5.0000, '', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(349, '1502', 'Tawar Ori 25', 29, 0.0000, 11000.0000, 5.0000, '', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(350, '1503', 'Tawar Pandan', 29, 0.0000, 14000.0000, 5.0000, '', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(351, '1504', 'Tawar Pandan 25', 29, 0.0000, 11000.0000, 5.0000, '', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(352, '1505', 'Tawar Coklat 25', 29, 0.0000, 15000.0000, 5.0000, '108a965a3168a9e590c08cf1381f7a01.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(353, '1506', 'Tawar Marble', 29, 0.0000, 15000.0000, 5.0000, '8c73af4d01fb93c12e95ccca91d9a17f.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(354, '1507', 'Tawar Marble 25', 29, 0.0000, 13000.0000, 5.0000, '', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(355, '1508', '36 Susu', 29, 0.0000, 14000.0000, 0.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(356, '1511', 'Roti Kering ORI kecil', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(357, '1512', 'Roti Kering ORI Besar', 29, 0.0000, 13500.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(358, '1513', 'Roti Kering gandum kecil', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(359, '1514', 'Roti Kering gandum Besar', 29, 0.0000, 13500.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(360, '1515', 'Burger Bun', 20, 0.0000, 6000.0000, 20.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(361, '1517', 'TAWAR KUPAS ORI', 20, 0.0000, 15000.0000, 5.0000, '1be27707aad02d05b1809b224c0199d5.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(362, '1518', 'TAWAR KUPAS PANDAN', 20, 0.0000, 15000.0000, 5.0000, '409437ee023fa50872ecbe2ce02fe35e.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(363, '1519', 'TAWAR KUPAS COKLAT', 20, 0.0000, 13000.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(364, '1520', '36 Susu panjang', 29, 0.0000, 20000.0000, 0.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(365, '1601', 'Burger Ori', 29, 0.0000, 2500.0000, 5.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(366, '1602', 'Black Burger', 29, 0.0000, 2500.0000, 5.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(367, '1603', 'Red Burger', 29, 0.0000, 2500.0000, 5.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(368, '1604', 'Black Burger 80gr', 29, 0.0000, 2530.0000, 5.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(369, '1608', 'Burger Bun Kecil (40Gr)', 29, 0.0000, 1000.0000, 100.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(370, '1609', 'Burger Bun Sedang (50Gr)', 29, 0.0000, 1500.0000, 100.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(371, '1610', 'Burger Bun Besar (80Gr)', 29, 0.0000, 2000.0000, 100.0000, 'no_image.png', 31, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(372, '1701', 'Tawar Gandum', 29, 0.0000, 16500.0000, 5.0000, 'a4c01dc7a2d4015517d65841ed0ba552.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(373, '1702', 'Tawar Gandum 25', 29, 0.0000, 16500.0000, 5.0000, '10235b1f4840a2d6c92f7560e4e125a3.jpg', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(374, '1801', 'Isian Srikaya Tawar', 29, 0.0000, 6000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(375, '1802', 'Isian Meses Tawar', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(376, '1803', 'Isian Keju Tawar', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(377, '1804', 'Isian Srikaya Meses Tawar', 29, 0.0000, 6000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(378, '1805', 'Isian Keju Meses Tawar', 29, 0.0000, 6000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(379, '1808', 'Isian Srikaya Keju Tawar', 29, 0.0000, 6000.0000, 5.0000, 'no_image.png', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(380, '1901', '38 22 Srikaya', 22, 0.0000, 7500.0000, 5.0000, '5b069ac8f86cde41fcaaed7c443f82d1.jpg', 38, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(381, '1906', 'Meses Coklat 150 Gr', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(382, '1909', '38 22 Srikaya 220gr', 22, 0.0000, 12000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(383, '1910', '38 22 strawberry 170gr', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(384, '1911', '38 22 blueberry 170gr', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(385, '1912', '38 22 lemon 170gr', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(386, '1913', '38 22 coklat 150gr', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(387, '1914', '38 22 Pineapple Org', 22, 0.0000, 13500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(388, '2001', 'Risoles Caffe', 30, 0.0000, 7000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 30, 30, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(389, '2005', 'Lemper Ayam', 29, 0.0000, 4500.0000, 0.0000, 'no_image.png', 22, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(390, '2019', 'Bakwan Rotte', 29, 0.0000, 13000.0000, 0.0000, 'no_image.png', 22, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(391, '2020', 'Bubur Kacang Hijau Rotte', 22, 0.0000, 6000.0000, 3.0000, 'no_image.png', 22, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(392, '2021', 'Ubi Goreng', 30, 0.0000, 10000.0000, 0.0000, 'no_image.png', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 30, 30, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(393, '2035', 'Puding Rotte', 29, 0.0000, 7500.0000, 0.0000, 'no_image.png', 22, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(394, '2040', 'Malaka Kaya Toast', 30, 0.0000, 6000.0000, 0.0000, 'no_image.png', 22, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 30, 30, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(395, '2041', 'pastel creamy pack', 20, 0.0000, 28000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(396, '2042', 'paste kare ayam pack', 20, 0.0000, 28000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(397, '2043', 'Risoles Ayam Pack', 20, 0.0000, 22500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(398, '2044', 'Risoles Sayur Rotte', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(399, '2045', 'Risoles Ayam Rotte', 29, 0.0000, 3000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(400, '2046', 'Risoles Sapi Rotte', 29, 0.0000, 3500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(401, '2047', 'pastel creamy', 29, 0.0000, 1500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(402, '2048', 'pastel kare ayam', 29, 0.0000, 1500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(403, '2049', 'Risoles Sapi Pack', 20, 0.0000, 26500.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(404, '2050', 'Risoles Sayur Pack', 20, 0.0000, 19000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(405, '2051', 'Risoles Ayam Pack Mini', 20, 0.0000, 20000.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(406, '2052', 'Risoles Sapi Pack Mini', 20, 0.0000, 22000.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(407, '2053', 'Risoles Sayur Pack Mini', 20, 0.0000, 17000.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(408, '2054', 'Risoles Ayam Rotte Mini', 29, 0.0000, 2000.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(409, '2055', 'Risoles Sapi Rotte Mini', 29, 0.0000, 2500.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(410, '2056', 'Risoles Sayur Rotte Mini', 29, 0.0000, 1500.0000, 0.0000, '', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(411, '2101', 'Bolu Kemojo', 29, 0.0000, 18000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(412, '2102', '12 Tapai', 29, 0.0000, 29500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(413, '2105', 'Bolu Gulung KC', 29, 0.0000, 37000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(414, '2106', '12 Pisang', 29, 0.0000, 30500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(415, '2107', '12 Ketan Kukus', 29, 0.0000, 29500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(416, '2109', 'Bolu Besar KC', 29, 0.0000, 62000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(417, '2110', 'Brownies', 29, 0.0000, 40500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(418, '2111', 'Bakpia', 29, 0.0000, 15500.0000, 0.0000, 'no_image.png', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(419, '2112', 'Roti Klasik Coklat', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 0, 0, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(420, '2113', 'Roti Klasik Kelapa', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(421, '2114', 'Roti Klasik Moka', 29, 0.0000, 2500.0000, 0.0000, 'no_image.png', 35, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(422, '2117', 'Bolu Gulung Ketan KC', 29, 0.0000, 41500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(423, '2118', '12 Pandan KC', 29, 0.0000, 30500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(424, '2119', 'Bolu Pisang Besar KC', 29, 0.0000, 56000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(425, '2120', 'Bolu Ketan Besar', 29, 0.0000, 74000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(426, '2121', '12 Caramel', 29, 0.0000, 31500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(427, '2122', 'Lapis Surabaya', 29, 0.0000, 63000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(428, '2123', '12 Butter', 29, 0.0000, 38000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(429, '2124', 'Ropia K. Hijau (14 29)', 25, 0.0000, 26000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 25, 25, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(430, '2125', 'Ropia Durian (14 29)', 25, 0.0000, 31000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 25, 25, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(431, '2134', 'Kue Soes KC', 29, 2000.0000, 3000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(432, '2135', 'Kacang Campur KC', 29, 0.0000, 16000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(433, '2136', 'Kacang Mete Kulit KC', 29, 0.0000, 16500.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(434, '2137', 'Snack Pang-pang KC', 29, 0.0000, 13500.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(435, '2138', 'Kacang Arab KC', 29, 0.0000, 16000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(436, '2139', 'Orong-orong KC', 29, 0.0000, 12000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(437, '2140', 'Manco Wijen KC', 29, 0.0000, 14000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(438, '2141', 'Kressball KC', 29, 0.0000, 15000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(439, '2142', 'Sumpia Udang KC', 29, 0.0000, 25000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(440, '2143', 'Stick Keju KC', 29, 0.0000, 26500.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(441, '2144', 'Stick Kentang KC', 29, 0.0000, 26500.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(442, '2145', 'Stick Jagung KC', 29, 0.0000, 14000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(443, '2146', 'Kripik Pisang KC', 29, 0.0000, 20000.0000, 0.0000, '', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(444, '2147', 'Kue Bawang KC', 20, 0.0000, 15000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(445, '2148', '12 Pandan Pisang', 29, 0.0000, 33000.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(446, '2149', 'Bolu Gulung Toping', 29, 0.0000, 41500.0000, 0.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(447, '2201', 'Black forest', 31, 0.0000, 13000.0000, 20.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(448, '2202', 'Tiramisu', 31, 0.0000, 12000.0000, 20.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(449, '2203', 'Mocca 12', 31, 0.0000, 12000.0000, 5.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(450, '2204', 'Cheese 12', 31, 0.0000, 23000.0000, 20.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(451, '2205', 'Strawberry 12', 31, 0.0000, 10000.0000, 5.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(452, '2206', 'Red Velvet', 31, 0.0000, 15000.0000, 20.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(453, '2207', 'Coklat Moist', 31, 0.0000, 18000.0000, 20.0000, 'no_image.png', 23, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 31, 31, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(454, '3101', 'Tebs lemon Lime 300 Ml', 19, 0.0000, 7000.0000, 0.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 19, 19, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(455, '3102', 'S-Tee 19 390 Ml', 19, 0.0000, 5500.0000, 0.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 19, 19, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(456, '3103', 'S-Tee 25 200 Ml', 25, 0.0000, 3500.0000, 0.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 25, 25, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(457, '3105', 'teh 25 250', 29, 0.0000, 5000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(458, '3106', 'teh 19 450', 29, 0.0000, 7500.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(459, '3107', 'Fruit Tea 19 500ml', 29, 0.0000, 8000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(460, '3108', 'prima 600 ml', 29, 0.0000, 4000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(461, '3109', 'country choice 250 ml', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(462, '3110', 'teh 19 350 ml', 29, 0.0000, 6500.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(463, '3111', 's-tee 350 ml', 29, 0.0000, 5000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(464, '3112', 'Fruit Tea 19 350 ml', 29, 0.0000, 6000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(465, '3113', 'Tebs Kaleng 330 ml', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(466, '3114', 'S-tee 25 330 Ml', 29, 0.0000, 4500.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(467, '3115', 'TBK 200 ML', 29, 0.0000, 5000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(468, '3116', 'Air Mineral', 22, 0.0000, 1000.0000, 0.0000, 'no_image.png', 18, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(469, '3117', 'Fruit Tea Kaleng 318 ml', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(470, '3118', 'Fruit Tea 25 200 ml', 29, 0.0000, 4000.0000, 5.0000, 'no_image.png', 41, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(471, '3119', 'Ice Chocolate Rotte', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(472, '3120', 'Klepon Ice Cream', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(473, '3121', 'Avocado Coffee Ice Cream', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(474, '3122', 'Corn Latte Ice Cream', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(475, '3123', 'Thai Tea Ice Cream', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(476, '3124', 'Sari Ketan Hitam Ice Cream', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(477, '3126', 'Lychee Tea', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(478, '3127', 'Peach Tea', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(479, '3128', 'Ice Cream 22 Mesis (10 OZ)', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(480, '3129', 'Ice Cream 22 Oreo (10 OZ)', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(481, '3201', 'Long Black / Kopi Hitam', 22, 0.0000, 10000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(482, '3202', 'Kopi Susu', 22, 0.0000, 10000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(483, '3203', 'Kopi Sanger', 22, 0.0000, 10000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(484, '3205', 'Espresso', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(485, '3206', 'Hot Cappucino', 22, 0.0000, 14000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(486, '3207', 'Coffe Latte Hot', 22, 0.0000, 14000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(487, '3209', 'Tea', 22, 0.0000, 6000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(488, '3210', 'Lemon Tea', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(489, '3211', 'Greentea Latte', 22, 0.0000, 16000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(490, '3214', 'Vietnam Drip', 22, 0.0000, 14000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(491, '3215', 'Kopi Gula Aren', 22, 0.0000, 12000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(492, '3216', 'Cappucino', 22, 0.0000, 0.0000, 5.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(493, '3218', 'Chocolate Premium', 22, 0.0000, 16000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(494, '3301', 'Red Velvet Latte Hot', 22, 0.0000, 16000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(495, '3302', 'Ice Coffe Latte', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(496, '3305', 'Kopi Susu Gula Aren', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(497, '3306', 'Es Kopi Sanger', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(498, '3307', 'Teh Susu Es', 22, 0.0000, 12000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(499, '3310', 'Red Velvet Latte Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(500, '3311', 'Ice Coffee Vanilla Latte', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(501, '3313', 'Greentea Latte Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(502, '3314', 'Chocolate Premium Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(503, '3316', 'Milkshake Strawberry Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(504, '3317', 'Milshake Coklat Ice Cream', 29, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(505, '3318', 'Milkshake Vanilla Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(506, '3323', 'Taro Latte', 22, 0.0000, 16000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(507, '3324', 'Taro Latte Ice Cream', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(508, '3328', 'Teh Es', 22, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(509, '3335', 'Teh Susu', 22, 0.0000, 8000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 22, 22, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(510, '3356', 'Choco Hazelnut Ice Cream', 30, 0.0000, 0.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 30, 30, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(511, '4106', 'BAGELEN BUTTER', 29, 0.0000, 24000.0000, 5.0000, 'b103540377397b9e314af32befa87bcc.jpg', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(512, '4107', 'BAGELEN KARE', 29, 0.0000, 25000.0000, 5.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(513, '4108', 'ROTTE JOHN BIG', 29, 0.0000, 7000.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(514, '4109', 'ROTTE JOHN SMALL', 29, 0.0000, 4000.0000, 5.0000, 'no_image.png', 36, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(515, '4110', 'BAGELEN CHEESE', 29, 0.0000, 23000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(516, '5101', 'Gula Aren', 20, 0.0000, 2000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(517, '5103', 'Whipping Cream', 20, 0.0000, 2000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 20, 20, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(518, '5104', 'Ice Cream', 30, 0.0000, 3000.0000, 0.0000, 'no_image.png', 25, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 30, 30, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(519, '5106', '25 Snack Box', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(520, '5107', 'Plastik Besar', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(521, '5108', 'Plastik Kecil', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(522, '5109', 'Plastik Menengah', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(523, '5110', '25 16 Isi 6', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(524, '5111', '25 16 Isi 12', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(525, '5112', 'Kantong Plastik Besar', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(526, '5113', 'Kantong Plastik Kecil', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(527, '5115', 'KANTONG PLASTIK SEDANG', 29, 0.0000, 0.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(528, '5116', '25 Oleh Oleh', 29, 0.0000, 2000.0000, 10.0000, 'no_image.png', 27, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 29, 29, 1, '', NULL, 0.0000, NULL, 0, 0, '', 0),
(529, '9016', '38 22 Sarikaya Pandan 220 Gr', 22, 0.0000, 12000.0000, 0.0000, 'no_image.png', 37, NULL, '', '', '', '', '', '', 0.0000, 2, 1, '', NULL, 'code128', '', '', 0, 'standard', 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, 0, 0.0000, '0000-00-00', '0000-00-00', '', '', '', '', '', 0, 0, 2, '', NULL, 0.0000, NULL, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 1, '688e4b4cdf70d54f376c88624ba5d78c.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `biller` varchar(55) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0db2fvhaae9q8dqh02bc8eik9lgr4fc4', '::1', 1689838512, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393833383531323b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('19kr3vpo9bdjtv1kop9bskafk1medo2c', '::1', 1689839138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393833393133383b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1iglciefuu2nij7hciedms25ff23ikfe', '::1', 1689819634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393831393633343b7265717565737465645f706167657c733a353a2261646d696e223b),
('6hp2b69pku824lclna5toji4ppqliinh', '::1', 1689847137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834373133373b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313638393834343630383b),
('8a34od3qk9g2eg6rdrqmavpo0nfena9u', '::1', 1689817207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393831373230373b7265717565737465645f706167657c733a353a2261646d696e223b),
('9auvqrtn854l0br23mnbffpqvnfg1156', '::1', 1689816444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393831363434343b7265717565737465645f706167657c733a353a2261646d696e223b),
('bl8i43q6vl250f0k6k05e6g4gop82vof', '::1', 1689835040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393833353034303b6964656e746974797c733a31303a225269736b616164656c61223b757365726e616d657c733a31303a225269736b616164656c61223b656d61696c7c733a32323a227269736b616164656c61303840676d61696c2e636f6d223b757365725f69647c733a323a223930223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839353830313235223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a303a22223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2235223b77617265686f7573655f69647c733a323a223234223b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2231223b62696c6c65725f69647c733a323a223138223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313638393833353033383b72656769737465725f69647c733a323a223237223b636173685f696e5f68616e647c733a31303a2232303030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032332d30372d31372031343a34383a3535223b),
('chsbf0phei1t0lkfd9qoi98led00vd4l', '::1', 1689842396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834323339363b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d6lgdk5rksh4gj2uhb37bift561kb2ma', '::1', 1689816835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393831363833353b7265717565737465645f706167657c733a353a2261646d696e223b),
('do9cj9v6o4es5ktma0thf2369mnjbi84', '::1', 1689842716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834323731363b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eiutlp0a5rsmfgu1304gvp5e12fg79bd', '::1', 1689841717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834313731373b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('g64kq7fsnn64lelpkm8r9tmd8tbrjuj8', '::1', 1689847230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834373133373b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313638393834343630383b),
('gf5a92tfog6iu6e05akacl6k7suhg9g9', '::1', 1689838827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393833383832373b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('irarubpun341j01lejbap76o8bt086iv', '::1', 1689826001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393832363030313b7265717565737465645f706167657c733a353a2261646d696e223b),
('k6n0nse7hcjb21lpgm25la7hec0cmm9a', '::1', 1689818463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393831383436333b7265717565737465645f706167657c733a353a2261646d696e223b),
('q4a3coskt38lrbaqoc1mfjfmim502vs5', '::1', 1689826001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393832363030313b7265717565737465645f706167657c733a353a2261646d696e223b),
('qcablslqf09d2hops2mv3bjkqhrrh4to', '::1', 1689844788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834343738383b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313638393834343630383b),
('to4ln8585vms4oop9420oc4bh1q9440m', '::1', 1689844485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393834343438353b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313638393834323937313b),
('v8v61m2vklcqki4ldj9cvob1hcsj1ckm', '::1', 1689837868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313638393833373836383b6964656e746974797c733a31373a226d72776734303640676d61696c2e636f6d223b757365726e616d657c733a373a227a756c77656769223b656d61696c7c733a31373a226d72776734303640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363839383334363932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b766965775f72696768747c733a313a2231223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `ksa_qrcode` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`, `ksa_qrcode`) VALUES
(1, 'rotte.png', 'rotte1.png', 'POS System', 'indonesian', 4, 0, 'IDR', 1, 50, '3.5.2', 0, 5, 'SL', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', 'COST', 0, 'default', 1, 1, 1, 1, 1, 0, 0, 1, 0, 'Asia/Jakarta', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 6, 'wegizulianda@gmail.com', 0, 4, 0, 0, 3, 0, 0, 0, 0, 0, ',', ',', 0, 8, 'zulwegi98', 'df13c485-d1da-49e2-b5f8-4291938d3ca6', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 'Rp ', 0, '_', 1, 1, 1, 'POP', 90, 'ADJ', 1, 0, 'AN', 'dompdf', 0, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(3, '2023-07-11 03:02:00', '', 4, 'full', '8d3f2ca64ac1fd871790381890bf85b5.csv', NULL, '', '', '', '', NULL, 4, 4, NULL, NULL, NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'PB1 @10%', 'PB1', 10.0000, '1'),
(3, 'GST @6%', 'GST', 6.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(19, 'Botol', 'Botol', NULL, '', '', NULL),
(20, 'Bungkus', 'Bungkus', NULL, '', '', NULL),
(21, 'Butir', 'Butir', NULL, '', '', NULL),
(22, 'Cup', 'Cup', NULL, '', '', NULL),
(23, 'Gr', 'Gram', NULL, '', '', NULL),
(24, 'Kg', 'Kilogram', NULL, '', '', NULL),
(25, 'Kotak', 'Kotak', NULL, '', '', NULL),
(26, 'Lbr', 'Lembar', NULL, '', '', NULL),
(27, 'Ltr', 'Liter', NULL, '', '', NULL),
(28, 'Paket', 'Paket', NULL, '', '', NULL),
(29, 'Pcs', 'Pieces', NULL, '', '', NULL),
(30, 'Porsi', 'Porsi', NULL, '', '', NULL),
(31, 'Slice', 'Slice', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@tecdiary.com', NULL, NULL, NULL, NULL, 1351661704, 1687574379, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3a3a31, 0x3a3a31, 'zulwegi', 'fd42c7ba11f81f30e2ac7642f39d3c4e22efd382', NULL, 'mrwg406@gmail.com', NULL, NULL, NULL, NULL, 1687574301, 1689835174, 1, 'Wegi', 'Zul', 'Babada', '08123456789', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0),
(7, '', '', 'Indah', 'Indah12345', NULL, 'indah.maharani@gmail.com', '', '', 0, '', 0, 0, 1, 'Indah', 'Maharani', 'Management', '', '', '', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(8, '', '', 'Ari', 'Ari12345', '', 'ari.kurniawan@gmail.com', '', '', 0, '', 0, 0, 1, 'Ari', 'Kurniawan', 'ROTTE BAKERY', '', '', '', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(9, '', '', 'Syafroni', 'Syafroni12345', '', 'm.syafroni@rottebakery.id', '', '', 0, '', 0, 0, 1, 'syafroni', 'syafroni', 'Rotte Bakery Direktur Operasional', '', '', '', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(10, '', '', 'Raju', 'Raju12345', '', 'raju.wardhana@gmail.com', '', '', 0, '', 0, 0, 1, 'Raju', 'Wardhana', 'Rotte Bakery Direktur', '', '', '', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(11, '', '', 'Mardhika', 'Mardhika12345', '', 'mardhika@gmail.com', '', '', 0, '', 0, 0, 1, 'mardhika', 'wirahadi', 'ROTTE BAKERY', '', '', '', 2, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(12, '', '', 'Ibnu', 'Ibnu12345', '', 'ibnu@gmail.com', '', '', 0, '', 0, 0, 1, 'ibnu', 'ibnu', 'Rotte Bakery ', '', '', '', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 1),
(13, '', '', 'Zubaidah', 'Zubaidah12345', '', 'zubaidah@gmail.com', '', '', 0, '', 0, 0, 1, 'Zubaidah', 'Zubaidah', 'ROTTE BAKERY KUBANG', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(14, '', '', 'Ela', 'Ela12345', '', 'ela@gmail.com', '', '', 0, '', 0, 0, 1, 'Ela', 'Aulia', 'ROTTE BAKERY KUBANG', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(15, '', '', 'Anissha', 'Anissha12345', '', 'anissha@gmail.com', '', '', 0, '', 0, 0, 1, 'Anissha', 'Aulia ', 'Rotte Bakery Kubang', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(16, '', '', 'Nanda', 'Nanda12345', '', 'nanda.rizka@gmail.com', '', '', 0, '', 0, 0, 1, 'nanda', 'Rizka', 'Rotte Bakery Kubang', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(17, '', '', 'Diana', 'Diana12345', '', '2003dianafitri@gmail.com', '', '', 0, '', 0, 0, 1, 'Diana', 'Fitri', 'Rotte Bakery Kubang', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(18, '', '', 'Rindiyani', 'Rindiyani12345', '', 'rindianini23@gmail.com', '', '', 0, '', 0, 0, 1, 'Rindiyani', 'Rindiyani', 'Rotte Bakery Kubang', '', '', '', 5, 16, 20, NULL, 0, 0, 0, 0, 0, 1),
(19, '', '', 'Riska', 'Riska12345', '', 'riskaamelia2312@gmail.com', '', '', 0, '', 0, 0, 1, 'Riska', 'Amelia', 'Rotte Bakery Marpoyan', '', '', '', 5, 17, 22, NULL, 0, 0, 0, 0, 0, 1),
(20, '', '', 'Viza', 'Viza12345', '', 'rahmadaniviza@gmail.com', '', '', 0, '', 0, 0, 1, 'Viza', 'Rahmadani', 'Rotte Bakery Marpoyan', '', '', '', 5, 17, 22, NULL, 0, 0, 0, 0, 0, 1),
(21, '', '', 'Wanda', 'Wanda12345', '', 'wanda.rizki@gmail.com', '', '', 0, '', 0, 0, 1, 'Wanda', 'Rizki', 'Rotte Bakery Bukit Barisan', '', '', '', 5, 4, 8, NULL, 0, 0, 0, 0, 0, 1),
(22, '', '', 'Rahmi', 'Rahmi12345', '', 'rahmi@gmail.com', '', '', 0, '', 0, 0, 1, 'Rahmi', 'Wahyuni', 'Rotte Bakery Bukit Barisan', '', '', '', 5, 4, 8, NULL, 0, 0, 0, 0, 0, 1),
(23, '', '', 'Dini', 'Dini12345', '', 'dini.aprillia@gmail.com', '', '', 0, '', 0, 0, 1, 'Dini', 'Aprillia', 'Rotte Bakery Bukit Barisan', '', '', '', 5, 4, 8, NULL, 0, 0, 0, 0, 0, 1),
(24, '', '', 'Verra', 'Verra12345', '', 'verra@gmail.com', '', '', 0, '', 0, 0, 1, 'Verra', 'Sely Auliawati', 'Rotte Bakery Bukit Barisan', '', '', '', 5, 4, 8, NULL, 0, 0, 0, 0, 0, 1),
(25, '', '', 'Cici', 'Cici12345', '', 'cici@gmail.com', '', '', 0, '', 0, 0, 1, 'Cici', 'Melinda', 'ROTTE BAKERY PASIR PUTIH', '', '', '', 5, 5, 24, NULL, 0, 0, 0, 0, 0, 1),
(26, '', '', 'Febriola', 'Febriola12345', '', 'febriola@gmail.com', '', '', 0, '', 0, 0, 1, 'Febriola', 'Rahmelia', 'Rotte Bakery Pasir Putih', '', '', '', 5, 5, 24, NULL, 0, 0, 0, 0, 0, 1),
(27, '', '', 'Lisa', 'Lisa12345', '', 'lisa@gmail.com', '', '', 0, '', 0, 0, 1, 'Lisa', 'Nurfaini', 'ROTTE BAKERY PASIR PUTIH', '', '', '', 5, 5, 24, NULL, 0, 0, 0, 0, 0, 1),
(28, '', '', 'Syarifah', 'Syarifah12345', '', 'syarifah@gmail.com', '', '', 0, '', 0, 0, 1, 'syarifah', 'rina marliana', 'ROTTE BAKERY KARTAMA', '', '', '', 5, 11, 16, NULL, 0, 0, 0, 0, 0, 1),
(29, '', '', 'Diana', 'Diana12345', '', 'dianap@gmail.com', '', '', 0, '', 0, 0, 1, 'DIANA', 'PUTRI DEWI', 'ROTTE BAKERY KARTAMA', '', '', '', 5, 11, 16, NULL, 0, 0, 0, 0, 0, 1),
(30, '', '', 'Wini', 'Wini12345', '', 'winiprastiwi504@gmail.com', '', '', 0, '', 0, 0, 1, 'Wini', 'Prastiwi', 'Rotte Bakery Kartama', '', '', '', 5, 11, 16, NULL, 0, 0, 0, 0, 0, 1),
(31, '', '', 'Khairunnisa', 'Khairunnisa12345', '', 'khairunnisa@gmail.com', '', '', 0, '', 0, 0, 1, 'khairunnisa', 'khairunnisa', 'ROTTE BAKERY PAUS', '', '', '', 5, 8, 25, NULL, 0, 0, 0, 0, 0, 1),
(32, '', '', 'Syarifah ', 'Syarifah 12345', '', 'namira@gmail.com', '', '', 0, '', 0, 0, 1, 'Syarifah ', 'Namira', 'Rotte Bakery Paus', '', '', '', 5, 8, 25, NULL, 0, 0, 0, 0, 0, 1),
(33, '', '', 'Resya', 'Resya12345', '', 'resya@gmail.com', '', '', 0, '', 0, 0, 1, 'Resya', 'Apri Yani', 'Rotte Bakery Umban Sari', '', '', '', 5, 9, 42, NULL, 0, 0, 0, 0, 0, 1),
(34, '', '', 'Resa', 'Resa12345', '', 'resa@gmail.com', '', '', 0, '', 0, 0, 1, 'Resa', 'Puspita Wahyu', 'Rotte Bakery Umban Sari', '', '', '', 5, 9, 42, NULL, 0, 0, 0, 0, 0, 1),
(35, '', '', 'Qoriatul', 'Qoriatul12345', '', 'qoriatul@gmail.com', '', '', 0, '', 0, 0, 1, 'Qoriatul', 'Salsabila', 'ROTTE BAKERY UMBAN SARI', '', '', '', 5, 9, 42, NULL, 0, 0, 0, 0, 0, 1),
(36, '', '', 'Rizny', 'Rizny12345', '', 'rizny@gmail.com', '', '', 0, '', 0, 0, 1, 'Rizny', 'Kurnia', 'ROTTE BAKERY RAJAWALI', '', '', '', 5, 6, 30, NULL, 0, 0, 0, 0, 0, 1),
(37, '', '', 'Vanny', 'Vanny12345', '', 'vannyanggrawita99@gmail.com', '', '', 0, '', 0, 0, 1, 'vanny', 'anggrawita', 'Rotte Bakery Rajawali', '', '', '', 5, 6, 30, NULL, 0, 0, 0, 0, 0, 1),
(38, '', '', 'Rifki', 'Rifki12345', '', 'rifkialfarizzi82@gmail.com', '', '', 0, '', 0, 0, 1, 'Rifki', 'Alfarizzi', 'Rotte Bakery Rajawali', '', '', '', 5, 6, 30, NULL, 0, 0, 0, 0, 0, 1),
(39, '', '', 'Nelpi', 'Nelpi12345', '', 'nelpi@gmail.com', '', '', 0, '', 0, 0, 1, 'Nelpi', 'Wismanita', 'Rotte Bakery Beringin', '', '', '', 5, 7, 7, NULL, 0, 0, 0, 0, 0, 1),
(40, '', '', 'Rozalia', 'Rozalia12345', '', 'roza@gmail.com', '', '', 0, '', 0, 0, 1, 'rozalia', 'septiani', 'ROTTE BAKERY BERINGIN', '', '', '', 5, 7, 7, NULL, 0, 0, 0, 0, 0, 1),
(41, '', '', 'Hernita', 'Hernita12345', '', 'hernita@gmail.com', '', '', 0, '', 0, 0, 1, 'Hernita', 'Novita Sari', 'ROTTE BAKERY BERINGIN', '', '', '', 5, 7, 7, NULL, 0, 0, 0, 0, 0, 1),
(42, '', '', 'Salsabila', 'Salsabila12345', '', 'salsabila@gmail.com', '', '', 0, '', 0, 0, 1, 'salsabila', 'salsabila', 'ROTTE BAKERY KERINCI 1', '', '', '', 5, 14, 29, NULL, 0, 0, 0, 0, 0, 1),
(43, '', '', 'Shefia', 'Shefia12345', '', 'shefia@gmail.com', '', '', 0, '', 0, 0, 1, 'Shefia', 'Pitriana', 'ROTTE BAKERY KERINCI 1', '', '', '', 5, 14, 29, NULL, 0, 0, 0, 0, 0, 1),
(44, '', '', 'Mismiati', 'Mismiati12345', '', 'mismiati@gmail.com', '', '', 0, '', 0, 0, 1, 'mismiati', 'mismiati', 'ROTTE BAKERY KERINCI 1', '', '', '', 5, 14, 29, NULL, 0, 0, 0, 0, 0, 1),
(45, '', '', 'Isral', 'Isral12345', '', 'isral@gmail.com', '', '', 0, '', 0, 0, 1, 'Isral', 'Wahyu Ramadhan', 'Rotte Bakery Kerinci 1', '', '', '', 5, 14, 29, NULL, 0, 0, 0, 0, 0, 1),
(46, '', '', 'Vina', 'Vina12345', '', 'vina@gmail.com', '', '', 0, '', 0, 0, 1, 'Vina', 'Threana', 'ROTTE BAKERY SUBRANTAS', '', '', '', 5, 13, 37, NULL, 0, 0, 0, 0, 0, 1),
(47, '', '', 'Briza', 'Briza12345', '', 'briza@gmail.com', '', '', 0, '', 0, 0, 1, 'Briza', 'Amelia Hutapea', 'Rotte Bakery Subrantas', '', '', '', 5, 13, 37, NULL, 0, 0, 0, 0, 0, 1),
(48, '', '', 'Lisa', 'Lisa12345', '', 'liisaoktaviia@gmail.com', '', '', 0, '', 0, 0, 1, 'Lisa', 'oktavia', 'Rotte Bakery Subrantas', '', '', '', 5, 13, 37, NULL, 0, 0, 0, 0, 0, 1),
(49, '', '', 'Meli', 'Meli12345', '', 'meli.santia@gmail.com', '', '', 0, '', 0, 0, 1, 'meli', 'santia', 'rotte bakery delima', '', '', '', 5, 10, 9, NULL, 0, 0, 0, 0, 0, 1),
(50, '', '', 'Selvia', 'Selvia12345', '', 'ssvivi20@gmail.com', '', '', 0, '', 0, 0, 1, 'Selvia', 'Selvia', 'Rotte Bakery Delima', '', '', '', 5, 10, 9, NULL, 0, 0, 0, 0, 0, 1),
(51, '', '', 'Fajariany', 'Fajariany12345', '', 'fajarianyhkk26@gmail.com', '', '', 0, '', 0, 0, 1, 'Fajariany', 'Hakiki', 'Rotte Bakery Delima', '', '', '', 5, 10, 9, NULL, 0, 0, 0, 0, 0, 1),
(52, '', '', 'Tasya', 'Tasya12345', '', 'tasyaqorima948@gmail.com', '', '', 0, '', 0, 0, 1, 'Tasya', 'Qorima', 'Rotte Bakery Delima', '', '', '', 5, 10, 9, NULL, 0, 0, 0, 0, 0, 1),
(53, '', '', 'Novia', 'Novia12345', '', 'yula.adistie@gmail.com', '', '', 0, '', 0, 0, 1, 'Novia', 'Yula Adistie', 'Rotte Bakery hangtuah', '', '', '', 5, 15, 14, NULL, 0, 0, 0, 0, 0, 1),
(54, '', '', 'Meliza', 'Meliza12345', '', 'meliza@gmail.com', '', '', 0, '', 0, 0, 1, 'Meliza', 'Meliza', 'Rotte Bakery Hangtuah', '', '', '', 5, 15, 14, NULL, 0, 0, 0, 0, 0, 1),
(55, '', '', 'Fitri', 'Fitri12345', '', 'fitri@gmail.com', '', '', 0, '', 0, 0, 1, 'Fitri', 'Ardiyani', 'ROTTE BAKERY HANGTUAH', '', '', '', 5, 15, 14, NULL, 0, 0, 0, 0, 0, 1),
(56, '', '', 'Sriayu', 'Sriayu12345', '', 'sriayu@gmail.com', '', '', 0, '', 0, 0, 1, 'Sriayu', 'astuti', 'Rotte Bakery Garuda Sakti', '', '', '', 5, 12, 13, NULL, 0, 0, 0, 0, 0, 1),
(57, '', '', 'Salbura', 'Salbura12345', '', 'salbura@gmail.com', '', '', 0, '', 0, 0, 1, 'Salbura', 'Ulfani', 'Rotte Bakery Garuda Sakti', '', '', '', 5, 12, 13, NULL, 0, 0, 0, 0, 0, 1),
(58, '', '', 'Yurike', 'Yurike12345', '', 'yurikereviana101199@gmail.com', '', '', 0, '', 0, 0, 1, 'Yurike', 'Reviana', 'Rotte Bakery Garuda Sakti', '', '', '', 5, 12, 13, NULL, 0, 0, 0, 0, 0, 1),
(59, '', '', 'Fadila', 'Fadila12345', '', 'fadila@gmail.com', '', '', 0, '', 0, 0, 1, 'Fadila', 'Ramadhani', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(60, '', '', 'Hesti', 'Hesti12345', '', 'hesti@gmail.com', '', '', 0, '', 0, 0, 1, 'Hesti', 'Bundari', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(61, '', '', 'Nova', 'Nova12345', '', 'nova@gmail.com', '', '', 0, '', 0, 0, 1, 'Nova', 'Wardianti', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(62, '', '', 'Nadila', 'Nadila12345', '', 'nadilaok7@gmail.com', '', '', 0, '', 0, 0, 1, 'Nadila', 'Oktri Pramudita', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(63, '', '', 'Ramadona', 'Ramadona12345', '', 'monaaja2423@gmail.com', '', '', 0, '', 0, 0, 1, 'ramadona', 'ramadona', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(64, '', '', 'Sindi', 'Sindi12345', '', 'sindipermatasari738@gmail.com', '', '', 0, '', 0, 0, 1, 'sindi', 'permata sari', 'Rotte Bakery Rengat', '', '', '', 5, 18, 31, NULL, 0, 0, 0, 0, 0, 1),
(65, '', '', 'Dewi', 'Dewi12345', '', 'dewiputri@gmail.com', '', '', 0, '', 0, 0, 1, 'Dewi', 'Putri Oktaviani', 'Rotte Bakery Pepaya', '', '', '', 5, 19, 26, NULL, 0, 0, 0, 0, 0, 1),
(66, '', '', 'Nia', 'Nia12345', '', 'ramadina@gmail.com', '', '', 0, '', 0, 0, 1, 'Nia', 'Ramadina', 'Rotte Bakery Pepaya', '', '', '', 5, 19, 26, NULL, 0, 0, 0, 0, 0, 1),
(67, '', '', 'Lasmaini', 'Lasmaini12345', '', 'lasmaini168@gmail.com', '', '', 0, '', 0, 0, 1, 'Lasmaini', 'Lasmain', 'Rotte Bakery Pepaya', '', '', '', 5, 19, 26, NULL, 0, 0, 0, 0, 0, 1),
(68, '', '', 'Lina', 'Lina12345', '', 'loren@gmail.com', '', '', 0, '', 0, 0, 1, 'lina', 'lorenza harahap', 'ROTTE BAKERY SEMBILANG', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(69, '', '', 'Mutiara', 'Mutiara12345', '', 'afrillya@gmail.com', '', '', 0, '', 0, 0, 1, 'Mutiara', 'Afrillya', 'ROTTE BAKERY SEMBILANG', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(70, '', '', 'Selviana', 'Selviana12345', '', 'selviana@gmail.com', '', '', 0, '', 0, 0, 1, 'selviana', 'Rosa', 'ROTTE BAKERY SEMBILANG', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(71, '', '', 'Cindy', 'Cindy12345', '', 'cindycah30@gmail.com', '', '', 0, '', 0, 0, 1, 'Cindy', 'Cahyani', 'Rotte Bakery Sembilang', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(72, '', '', 'Ratna', 'Ratna12345', '', 'indosawitbumdess@gmail.com', '', '', 0, '', 0, 0, 1, 'Ratna', 'dilla triamanda', 'Rotte Bakery Sembilang', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(73, '', '', 'Anggi', 'Anggi12345', '', 'andiniianggi@gmail.com', '', '', 0, '', 0, 0, 1, 'Anggi', 'andini', 'Rotte Bakery Sembilang', '', '', '', 5, 20, 32, NULL, 0, 0, 0, 0, 0, 1),
(74, '', '', 'Nora', 'Nora12345', '', 'nora@gmail.com', '', '', 0, '', 0, 0, 1, 'Nora', 'Lestari', 'ROTTE BAKERY BANGKINANG', '', '', '', 5, 21, 5, NULL, 0, 0, 0, 0, 0, 1),
(75, '', '', 'Hilma', 'Hilma12345', '', 'hilma@gmail.com', '', '', 0, '', 0, 0, 1, 'Hilma', 'Huwaini', 'Rotte Bakery Bangkinang', '', '', '', 5, 21, 5, NULL, 0, 0, 0, 0, 0, 1),
(76, '', '', 'Lidya', 'Lidya12345', '', 'lidya@gmail.com', '', '', 0, '', 0, 0, 1, 'Lidya', 'Tiara Afriani', 'Rotte Bakery Bangkinang', '', '', '', 5, 21, 5, NULL, 0, 0, 0, 0, 0, 1),
(77, '', '', 'Feby', 'Feby12345', '', 'feby@gmail.com', '', '', 0, '', 0, 0, 1, 'Feby', 'Yolanda Sari', 'Rotte Bakery Kualu', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(78, '', '', 'Febi', 'Febi12345', '', 'febiana@gmail.com', '', '', 0, '', 0, 0, 1, 'febi', 'Ana Ola', 'ROTTE BAKERY KUALU', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(79, '', '', 'Yolanda ', 'Yolanda 12345', '', 'auliaputriyolanda2@gmail.com', '', '', 0, '', 0, 0, 1, 'Yolanda ', 'Aulia Putri', 'Rotte Bakery Kualu', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(80, '', '', 'Yosi', 'Yosi12345', '', 'yosihusni@gmail.com', '', '', 0, '', 0, 0, 1, 'Yosi', 'Rahmathul Husni', 'Rotte Bakery Kualu', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(81, '', '', 'Galuh Fajri', 'Galuh Fajri12345', '', 'galuhfajriwardanii@gmail.com', '', '', 0, '', 0, 0, 1, 'Galuh Fajri', 'Wardani', 'Rotte Bakery Kualu', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(82, '', '', 'Nadia', 'Nadia12345', '', 'nadiamuliaputri@gmail.com', '', '', 0, '', 0, 0, 1, 'NADIA', 'MULIA PUTRI', 'Rotte Bakery Kualu', '', '', '', 5, 22, 19, NULL, 0, 0, 0, 0, 0, 1),
(83, '', '', 'Nikmatus', 'Nikmatus12345', '', 'nikmatus@gmail.com', '', '', 0, '', 0, 0, 1, 'Nikmatus', 'Sa\'adah', 'Rotte Bakery Arengka', '', '', '', 5, 23, 4, NULL, 0, 0, 0, 0, 0, 1),
(84, '', '', 'Refi', 'Refi12345', '', 'refifrtn@gmail.com', '', '', 0, '', 0, 0, 1, 'Refi', 'Fortuna', 'Rotte Bakery Arengka', '', '', '', 5, 23, 4, NULL, 0, 0, 0, 0, 0, 1),
(85, '', '', 'Steivanny', 'Steivanny12345', '', 'steivannydewysandra@gmail.com', '', '', 0, '', 0, 0, 1, 'Steivanny', 'Dewi Sandra', 'Rotte Bakery Arengka', '', '', '', 5, 23, 4, NULL, 0, 0, 0, 0, 0, 1),
(86, '', '', 'Rahmatun', 'Rahmatun12345', '', 'rahmatunnuzulliana@gmail.com', '', '', 0, '', 0, 0, 1, 'Rahmatun', 'Nuzul Lianana', 'Rotte Bakery Arengka', '', '', '', 5, 23, 4, NULL, 0, 0, 0, 0, 0, 1),
(87, '', '', 'Suryati', 'Suryati12345', '', 'suryati@gmail.com', '', '', 0, '', 0, 0, 1, 'suryati', 'suryati', 'Rotte Bakery Kerinci 2', '', '', '', 5, 24, 18, NULL, 0, 0, 0, 0, 0, 1),
(88, '', '', 'Maulidayani', 'Maulidayani12345', '', 'maulidayani@gmail.com', '', '', 0, '', 0, 0, 1, 'Maulidayani', 'Sinaga', 'Rotte Bakery Kerinci 2', '', '', '', 5, 24, 18, NULL, 0, 0, 0, 0, 0, 1),
(89, '', '', 'Jessya', 'Jessya12345', '', 'jessya@gmail.com', '', '', 0, '', 0, 0, 1, 'Jessya', 'Cahya Safitri', 'Rotte Bakery Kerinci 2', '', '', '', 5, 24, 18, NULL, 0, 0, 0, 0, 0, 1),
(90, 0x3a3a31, '', 'Riskaadela', '1526baf34964da73fd9aa02fe00048b773cba207', '', 'riskaadela08@gmail.com', '', '', 0, '', 0, 1689834751, 1, 'riska', 'Adela', 'Rotte Bakery Kerinci 2', '08', '', 'female', 5, 24, 18, NULL, 0, 0, 0, 0, 0, 1),
(91, '', '', 'Luvi', 'Luvi12345', '', 'luvikhairani6@gmail.com', '', '', 0, '', 0, 0, 1, 'luvi', 'khairani', 'Rotte Bakery Kerinci 2', '', '', '', 5, 24, 18, NULL, 0, 0, 0, 0, 0, 1),
(92, '', '', 'Widia', 'Widia12345', '', 'widia@gmail.com', '', '', 0, '', 0, 0, 1, 'widia', 'anggraini', 'Rotte Bakery Badak', '', '', '', 5, 25, 35, NULL, 0, 0, 0, 0, 0, 1),
(93, '', '', 'Budiana', 'Budiana12345', '', 'budiana@gmail.com', '', '', 0, '', 0, 0, 1, 'budiana', 'budiana', 'Rotte Bakery Badak', '', '', '', 5, 25, 35, NULL, 0, 0, 0, 0, 0, 1),
(94, '', '', 'Adhariani', 'Adhariani12345', '', 'adhariani@gmail.com', '', '', 0, '', 0, 0, 1, 'adhariani', 'verawati', 'rotte bakery badak', '', '', '', 5, 25, 35, NULL, 0, 0, 0, 0, 0, 1),
(95, '', '', 'Intan', 'Intan12345', '', 'tanitan055@gmail.com', '', '', 0, '', 0, 0, 1, 'Intan', 'Aulia', 'ROTTE BAKERY TALUK KUANTAN 2', '', '', '', 5, 26, 39, NULL, 0, 0, 0, 0, 0, 1),
(96, '', '', 'Wella', 'Wella12345', '', 'wellajulianda28@gmail.com', '', '', 0, '', 0, 0, 1, 'Wella', 'julianda', 'ROTTE BAKERY TALUK KUANTAN 2', '', '', '', 5, 26, 39, NULL, 0, 0, 0, 0, 0, 1),
(97, '', '', 'Iqbal', 'Iqbal12345', '', 'iqbal.iqbal1945@gmail.com', '', '', 0, '', 0, 0, 1, 'Iqbal', 'amy ramadhan', 'ROTTE BAKERY TALUK KUANTAN 2', '', '', '', 5, 26, 39, NULL, 0, 0, 0, 0, 0, 1),
(98, '', '', 'Jenneri', 'Jenneri12345', '', 'jenneri@gmail.com', '', '', 0, '', 0, 0, 1, 'Jenneri', 'Anna Yarti', 'ROTTE BAKERY TALUK KUANTAN', '', '', '', 5, 27, 38, NULL, 0, 0, 0, 0, 0, 1),
(99, '', '', 'Laura', 'Laura12345', '', 'laura@gmail.com', '', '', 0, '', 0, 0, 1, 'Laura', 'Ningsih', 'ROTTE BAKERY TALUK KUANTAN', '', '', '', 5, 27, 38, NULL, 0, 0, 0, 0, 0, 1),
(100, '', '', 'Andika', 'Andika12345', '', 'andika@gmail.com', '', '', 0, '', 0, 0, 1, 'Andika', 'Jafer Pratama', 'ROTTE BAKERY TALUK KUANTAN', '', '', '', 5, 27, 38, NULL, 0, 0, 0, 0, 0, 1),
(101, '', '', 'Destira', 'Destira12345', '', 'tirakuansing@gmail.com', '', '', 0, '', 0, 0, 1, 'Destira', 'Jumita', 'Rotte Bakery Taluk Kuantan', '', '', '', 5, 27, 38, NULL, 0, 0, 0, 0, 0, 1),
(102, '', '', 'Andiny', 'Andiny12345', '', 'andinymekolie03@gmail.com', '', '', 0, '', 0, 0, 1, 'Andiny', 'Tusary', 'Rotte Bakery Belilas', '', '', '', 5, 28, 6, NULL, 0, 0, 0, 0, 0, 1),
(103, '', '', 'Ela', 'Ela12345', '', 'sukmaandiniela@gmail.com', '', '', 0, '', 0, 0, 1, 'Ela', 'Sukma Andini', 'Rotte Bakery Belilas', '', '', '', 5, 28, 6, NULL, 0, 0, 0, 0, 0, 1),
(104, '', '', 'Novika', 'Novika12345', '', 'novika@gmail.com', '', '', 0, '', 0, 0, 1, 'Novika', 'Sari', 'ROTTE BAKERY UJUNG BATU', '', '', '', 5, 29, 41, NULL, 0, 0, 0, 0, 0, 1),
(105, '', '', 'Suri', 'Suri12345', '', 'ujungbatu0103@gmail.com', '', '', 0, '', 0, 0, 1, 'Suri', 'Yani', 'Rotte Bakery Ujung Batu', '', '', '', 5, 29, 41, NULL, 0, 0, 0, 0, 0, 1),
(106, '', '', 'Suci', 'Suci12345', '', 'sucipurwati0015@gmail.com', '', '', 0, '', 0, 0, 1, 'Suci', 'Purwati', 'Rotte Bakery Ujung Batu', '', '', '', 5, 29, 41, NULL, 0, 0, 0, 0, 0, 1),
(107, '', '', 'Sunni', 'Sunni12345', '', 'sunni@gmail.com', '', '', 0, '', 0, 0, 1, 'sunni', 'septiani', 'ROTTE BAKERY KEPENUHAN', '', '', '', 5, 30, 17, NULL, 0, 0, 0, 0, 0, 1),
(108, '', '', 'Eka', 'Eka12345', '', 'jalngaruda@gmail.com', '', '', 0, '', 0, 0, 1, 'Eka', 'Nurani', 'Rotte Bakery Kepenuhan', '', '', '', 5, 30, 17, NULL, 0, 0, 0, 0, 0, 1),
(109, '', '', 'Sinta', 'Sinta12345', '', 'savitra@gmail.com', '', '', 0, '', 0, 0, 1, 'Sinta', 'Savitra', 'Rotte Bakery Perawang', '', '', '', 5, 31, 27, NULL, 0, 0, 0, 0, 0, 1),
(110, '', '', 'Rini Ade', 'Rini Ade12345', '', 'sonia@gmail.com', '', '', 0, '', 0, 0, 1, 'Rini ade', 'Sonia Putri', 'Rotte Bakery Perawang', '', '', '', 5, 31, 27, NULL, 0, 0, 0, 0, 0, 1),
(111, '', '', 'Windy', 'Windy12345', '', 'siregarwindy751@gmail.com', '', '', 0, '', 0, 0, 1, 'windy', 'Afrialisa', 'Rotte Bakery Perawang', '', '', '', 5, 31, 27, NULL, 0, 0, 0, 0, 0, 1),
(112, '', '', 'Dewi', 'Dewi12345', '', 'aliena@gmail.com', '', '', 0, '', 0, 0, 1, 'Dewi', 'Aliena', 'ROTTE BAKERY DURI MAWAR', '', '', '', 5, 34, 11, NULL, 0, 0, 0, 0, 0, 1),
(113, '', '', 'Siti Kholiza', 'Siti Kholiza12345', '', 'sitikholiza469@gmail.com', '', '', 0, '', 0, 0, 1, 'Siti Kholiza', 'Siti Kholiza', 'Rotte Bakery Duri Mawar', '', '', '', 5, 34, 11, NULL, 0, 0, 0, 0, 0, 1),
(114, '', '', 'Meylani', 'Meylani12345', '', 'meylani122020@gmail.com', '', '', 0, '', 0, 0, 1, 'Meylani', 'Meylani', 'Rotte Bakery Duri Mawar', '', '', '', 5, 34, 11, NULL, 0, 0, 0, 0, 0, 1),
(115, '', '', 'Deby', 'Deby12345', '', 'deby@gmail.com', '', '', 0, '', 0, 0, 1, 'deby', 'firanti', 'Rotte Bakery Duri Sudirman', '', '', '', 5, 35, 12, NULL, 0, 0, 0, 0, 0, 1),
(116, '', '', 'Jumi', 'Jumi12345', '', 'kardi@gmail.com', '', '', 0, '', 0, 0, 1, 'Jumi', 'Kardi', 'Rotte Bakery Lipat Kain', '', '', '', 5, 36, 21, NULL, 0, 0, 0, 0, 0, 1),
(117, '', '', 'Salma Fitri', 'Salma Fitri12345', '', 'salmasalmafitri201@gmail.com', '', '', 0, '', 0, 0, 1, 'Salma Fitri', 'Salma Fitri', 'Rotte Bakery Lipat Kain', '', '', '', 5, 36, 21, NULL, 0, 0, 0, 0, 0, 1),
(118, '', '', 'Nurhasanah', 'Nurhasanah12345', '', 'nurhasanah@gmail.com', '', '', 0, '', 0, 0, 1, 'nurhasanah', 'nurhasanah', 'Rotte Bakery Dumai Sukajadi', '', '', '', 5, 37, 10, NULL, 0, 0, 0, 0, 0, 1),
(119, '', '', 'Suci', 'Suci12345', '', 'sucirahmyni@gmail.com', '', '', 0, '', 0, 0, 1, 'suci', 'rahmayani', 'Rotte Bakery Dumai', '', '', '', 5, 37, 10, NULL, 0, 0, 0, 0, 0, 1),
(120, '', '', 'Novitasari', 'Novitasari12345', '', 'novitasari@gmail.com', '', '', 0, '', 0, 0, 1, 'novitasari', 'novitasari', 'ROtte Bakery Air Molek', '', '', '', 5, 38, 3, NULL, 0, 0, 0, 0, 0, 1),
(121, '', '', 'Sri Puja', 'Sri Puja12345', '', 'sripujasintia6@gmail.com', '', '', 0, '', 0, 0, 1, 'Sri Puja', 'Sintia', 'Rotte Bakery Air Molek', '', '', '', 5, 38, 3, NULL, 0, 0, 0, 0, 0, 1),
(122, '', '', 'Junila', 'Junila12345', '', 'junylestary803@gmail.com', '', '', 0, '', 0, 0, 1, 'Junila', 'Lestari', 'Rotte Bakery Air Molek', '', '', '', 5, 38, 3, NULL, 0, 0, 0, 0, 0, 1),
(123, '', '', 'Lestari', 'Lestari12345', '', 'lestari1@gmail.com', '', '', 0, '', 0, 0, 1, 'Lestari', 'Anggraini', 'Rotte Bakery Perawang 2', '', '', '', 5, 39, 28, NULL, 0, 0, 0, 0, 0, 1),
(124, '', '', 'Putri Uzlifatul', 'Putri Uzlifatul12345', '', 'uzlifatulputri@gmail.com', '', '', 0, '', 0, 0, 1, 'Putri Uzlifatul', 'Jannah', 'Rotte Bakery Perawang 2', '', '', '', 5, 39, 28, NULL, 0, 0, 0, 0, 0, 1),
(125, '', '', 'Indah Salsa', 'Indah Salsa12345', '', 'indahsalsa2002@gmail.com', '', '', 0, '', 0, 0, 1, 'Indah Salsa', 'Cahya', 'Rotte Bakery Perawang 2', '', '', '', 5, 39, 28, NULL, 0, 0, 0, 0, 0, 1),
(126, '', '', 'Ramadan', 'Ramadan12345', '', 'ramadan@gmail.com', '', '', 0, '', 0, 0, 1, 'ramadan', 'padila', 'Rotte Bakery Harapan Raya', '', '', '', 5, 40, 15, NULL, 0, 0, 0, 0, 0, 1),
(127, '', '', 'Nurul', 'Nurul12345', '', 'oktavia@gmail.com', '', '', 0, '', 0, 0, 1, 'Nurul', 'Oktavia', 'Rotte Bakery Harapan Raya', '', '', '', 5, 40, 15, NULL, 0, 0, 0, 0, 0, 1),
(128, '', '', 'Fera', 'Fera12345', '', 'fera@gmal.com', '', '', 0, '', 0, 0, 1, 'Fera', 'Aftafia', 'Rotte Bakery Siak', '', '', '', 5, 41, 33, NULL, 0, 0, 0, 0, 0, 1),
(129, '', '', 'Rina', 'Rina12345', '', 'rina@gmail.com', '', '', 0, '', 0, 0, 1, 'Rina', 'Mardianti', 'Rotte Bakery Siak', '', '', '', 5, 41, 33, NULL, 0, 0, 0, 0, 0, 1),
(130, '', '', 'Putri', 'Putri12345', '', 'pw4702119@gmail.com', '', '', 0, '', 0, 0, 1, 'Putri', 'wahyuni', 'Rotte Bakery Siak', '', '', '', 5, 41, 33, NULL, 0, 0, 0, 0, 0, 1),
(131, '', '', 'Windi', 'Windi12345', '', 'windi@gmail.com', '', '', 0, '', 0, 0, 1, 'windi', 'ardila', 'Rotte Bakery Sorek', '', '', '', 5, 42, 36, NULL, 0, 0, 0, 0, 0, 1),
(132, '', '', 'Alhamdu', 'Alhamdu12345', '', 'alhamdu@gmail.com', '', '', 0, '', 0, 0, 1, 'Alhamdu', 'Syukri', 'Rotte Bakery Sorek', '', '', '', 5, 42, 36, NULL, 0, 0, 0, 0, 0, 1),
(133, '', '', 'Dita', 'Dita12345', '', 'ditaanjelinaaa@gmail.com', '', '', 0, '', 0, 0, 1, 'Dita', 'Dita', 'Rotte Bakery Sorek', '', '', '', 5, 42, 36, NULL, 0, 0, 0, 0, 0, 1),
(134, '', '', 'Deah', 'Deah12345', '', 'ddea698@gmail.com', '', '', 0, '', 0, 0, 1, 'DEAH', 'NURJANNAH', 'Rotte Bakery Sorek', '', '', '', 5, 42, 36, NULL, 0, 0, 0, 0, 0, 1),
(135, '', '', 'Rafita', 'Rafita12345', '', 'yaumulikram5@gmail.com', '', '', 0, '', 0, 0, 1, 'Rafita', 'Rafita', 'Rotte Bakery Tembilahan', '', '', '', 5, 44, 40, NULL, 0, 0, 0, 0, 0, 1),
(136, '', '', 'Restu', 'Restu12345', '', 'restuega2020@gmail.com', '', '', 0, '', 0, 0, 1, 'Restu', 'Ega Khairunnisa', 'Rotte Bakery Tembilahan', '', '', '', 5, 44, 40, NULL, 0, 0, 0, 0, 0, 1),
(137, '', '', 'Sari ', 'Sari 12345', '', 'sarisaumi358@gmail.com', '', '', 0, '', 0, 0, 1, 'sari ', 'saumi', 'Rotte Bakery Tembilahan', '', '', '', 5, 44, 40, NULL, 0, 0, 0, 0, 0, 1),
(138, '', '', 'Qusnul', 'Qusnul12345', '', 'qusnul@gmail.com', '', '', 0, '', 0, 0, 1, 'Qusnul', 'Fatimah', 'Rotte Bakery Pasir Pangaraian', '', '', '', 5, 45, 23, NULL, 0, 0, 0, 0, 0, 1),
(139, '', '', 'Amandha', 'Amandha12345', '', 'amanda@gmail.com', '', '', 0, '', 0, 0, 1, 'Amandha', 'Baizura', 'Rotte Bakery Sigunggung', '', '', '', 5, 47, 34, NULL, 0, 0, 0, 0, 0, 1),
(140, '', '', 'Nesi', 'Nesi12345', '', 'nesiyulita@gmail.com', '', '', 0, '', 0, 0, 1, 'Nesi', 'Yulita', 'Rotte Bakery Sigunggung', '', '', '', 5, 47, 34, NULL, 0, 0, 0, 0, 0, 1),
(141, '', '', 'Suryani', 'Suryani12345', '', 'suryanifitriharahap@gmail.com', '', '', 0, '', 0, 0, 1, 'Suryani', 'fitri harahap', 'Rotte Bakery Sigunggung', '', '', '', 5, 47, 34, NULL, 0, 0, 0, 0, 0, 1),
(142, '', '', 'Hendro', 'Hendro12345', '', 'hendrosaputraxwing@gmail.com', '', '', 0, '', 0, 0, 1, 'hendro', 'saputra', 'BKL', '', '', '', 8, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(143, '', '', 'Ahmad', 'Ahmad12345', '', 'ahmad.saepudin@gmail.com', '', '', 0, '', 0, 0, 1, 'Ahmad', 'Syaifuddin', 'Rotte Bakery Kubang', '', '', '', 8, 16, 20, NULL, NULL, NULL, 0, 0, 0, 1),
(144, '', '', 'Elisha', 'Elisha12345', '', 'elisha@gmail.com', '', '', 0, '', 0, 0, 1, 'Elisha', 'Pasima', 'Rotte Bakery Kubang', '', '', '', 8, 16, 20, NULL, NULL, NULL, 0, 0, 0, 1),
(145, '', '', 'Poppy', 'Poppy12345', '', 'poppy@gmail.com', '', '', 0, '', 0, 0, 1, 'Poppy', 'Mayangsari', 'ROTTE BAKERY MARPOYAN', '', '', '', 8, 17, 22, NULL, NULL, NULL, 0, 0, 0, 1),
(146, '', '', 'Wan', 'Wan12345', '', 'wan.maharani@gmail.com', '', '', 0, '', 0, 0, 1, 'Wan', 'Maharani', 'ROTTE BAKERY MARPOYAN', '', '', '', 8, 17, 22, NULL, NULL, NULL, 0, 0, 0, 1),
(147, '', '', 'Shinta', 'Shinta12345', '', 'shinta.noviasari@gmail.com', '', '', 0, '', 0, 0, 1, 'Shinta', 'Noviasari', 'Rotte Bakery Bukit Barisan', '', '', '', 8, 4, 8, NULL, NULL, NULL, 0, 0, 0, 1),
(148, '', '', 'Admin-Toko', 'Admin-Toko12345', '', 'cek@gmail.com', '', '', 0, '', 0, 0, 1, 'admin-toko', 'cek', 'bkl', '', '', '', 8, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(149, '', '', 'Riska', 'Riska12345', '', 'riskaauliaputrii@gmail.com', '', '', 0, '', 0, 0, 1, 'Riska', 'Aulia', 'ROTTE BAKERY PASIR PUTIH', '', '', '', 8, 5, 24, NULL, NULL, NULL, 0, 0, 0, 1),
(150, '', '', 'Putri', 'Putri12345', '', 'putri.rahmasari@gmail.com', '', '', 0, '', 0, 0, 1, 'Putri', 'Rahmasari', 'Rotte Bakery PASIR PUTIH', '', '', '', 8, 5, 24, NULL, NULL, NULL, 0, 0, 0, 1),
(151, '', '', 'Mega Mulia', 'Mega Mulia12345', '', 'subrantas_rotte@gmail.com', '', '', 0, '', 0, 0, 1, 'Mega Mulia', 'Rabbi', 'ROTTE BAKERY KARTAMA', '', '', '', 8, 11, 16, NULL, NULL, NULL, 0, 0, 0, 1),
(152, '', '', 'Andre', 'Andre12345', '', 'andre@gmail.com', '', '', 0, '', 0, 0, 1, 'Andre', 'Setiawan', 'Rotte Bakery Kartama', '', '', '', 8, 11, 16, NULL, NULL, NULL, 0, 0, 0, 1),
(153, '', '', 'Wulan', 'Wulan12345', '', 'wulan@gmail.com', '', '', 0, '', 0, 0, 1, 'Wulan', 'Wulan', 'ROTTE BAKERY KARTAMA', '', '', '', 8, 11, 16, NULL, NULL, NULL, 0, 0, 0, 1),
(154, '', '', 'Riri', 'Riri12345', '', 'ririsundari297@gmail.com', '', '', 0, '', 0, 0, 1, 'Riri', 'Sundari', 'ROTTE BAKERY PAUS', '', '', '', 8, 8, 25, NULL, NULL, NULL, 0, 0, 0, 1),
(155, '', '', 'Irma Gusnia', 'Irma Gusnia12345', '', 'irma.putri@gmail.com', '', '', 0, '', 0, 0, 1, 'irma gusnia', 'ayu putri', 'ROTTE BAKERY PAUS', '', '', '', 8, 8, 25, NULL, NULL, NULL, 0, 0, 0, 1),
(156, '', '', 'Rengga ', 'Rengga 12345', '', 'rengga.putra@gmail.com', '', '', 0, '', 0, 0, 1, 'RENGGA ', 'OKTA PUTRA', 'ROTTE BAKERY UMBAN SARI', '', '', '', 8, 9, 42, NULL, NULL, NULL, 0, 0, 0, 1),
(157, '', '', 'Nurhayati', 'Nurhayati12345', '', 'nurhayati@gmail.com', '', '', 0, '', 0, 0, 1, 'Nurhayati', 'Wulandari', 'ROTTE BAKERY UMBAN SARI', '', '', '', 8, 9, 42, NULL, NULL, NULL, 0, 0, 0, 1),
(158, '', '', 'Dinda', 'Dinda12345', '', 'dinda.rahima@gmail.com', '', '', 0, '', 0, 0, 1, 'Dinda', 'Rahima Dwika', 'ROTTE BAKERY RAJAWALI', '', '', '', 8, 6, 30, NULL, NULL, NULL, 0, 0, 0, 1),
(159, '', '', 'Nafa', 'Nafa12345', '', 'nafa@gmail.com', '', '', 0, '', 0, 0, 1, 'Nafa', 'Fadillah', 'ROTTE BAKERY RAJAWALI', '', '', '', 8, 6, 30, NULL, NULL, NULL, 0, 0, 0, 1),
(160, '', '', 'Cintia', 'Cintia12345', '', 'cintia@gmail.com', '', '', 0, '', 0, 0, 1, 'cintia', 'cintia', 'Rotte Bakery Beringin', '', '', '', 8, 7, 7, NULL, NULL, NULL, 0, 0, 0, 1),
(161, '', '', 'Nur', 'Nur12345', '', 'nur.afni@gmail.com', '', '', 0, '', 0, 0, 1, 'Nur', 'Afni', 'ROTTE BAKERY KERINCI 1', '', '', '', 8, 14, 29, NULL, NULL, NULL, 0, 0, 0, 1),
(162, '', '', 'Nuzul ', 'Nuzul 12345', '', 'nuzul@gmail.com', '', '', 0, '', 0, 0, 1, 'Nuzul ', 'Qodri Alfajri', 'ROTTE BAKERY KERINCI 1', '', '', '', 8, 14, 29, NULL, NULL, NULL, 0, 0, 0, 1),
(163, '', '', 'Nurmala', 'Nurmala12345', '', 'nurmalasinaga96@gmail.com', '', '', 0, '', 0, 0, 1, 'Nurmala', 'Sinaga', 'ROTTE BAKERY SUBRANTAS', '', '', '', 8, 13, 37, NULL, NULL, NULL, 0, 0, 0, 1),
(164, '', '', 'Indah', 'Indah12345', '', 'indah.junaina@gmail.com', '', '', 0, '', 0, 0, 1, 'Indah', 'Junaina', 'ROTTE BAKERY SUBRANTAS', '', '', '', 8, 13, 37, NULL, NULL, NULL, 0, 0, 0, 1),
(165, '', '', 'Hersavira', 'Hersavira12345', '', 'gsakti_rotte@gmail.com', '', '', 0, '', 0, 0, 1, 'Hersavira', 'RA', 'ROTTE BAKERY DELIMA', '', '', '', 8, 10, 9, NULL, NULL, NULL, 0, 0, 0, 1),
(166, '', '', 'Ocha', 'Ocha12345', '', 'ocha.angesti@gmail.com', '', '', 0, '', 0, 0, 1, 'ocha', 'angesti', 'rotte bakery Delima', '', '', '', 8, 10, 9, NULL, NULL, NULL, 0, 0, 0, 1),
(167, '', '', 'Mutiara', 'Mutiara12345', '', 'mutiarasarii@gmail.com', '', '', 0, '', 0, 0, 1, 'Mutiara', 'Sari', 'ROTTE BAKERY HANGTUAH', '', '', '', 8, 15, 14, NULL, NULL, NULL, 0, 0, 0, 1),
(168, '', '', 'Esa', 'Esa12345', '', 'esa.susanti@gmail.com', '', '', 0, '', 0, 0, 1, 'esa', 'susanti', 'rotte bakery hangtuah', '', '', '', 8, 15, 14, NULL, NULL, NULL, 0, 0, 0, 1),
(169, '', '', 'Irma', 'Irma12345', '', 'haszuriirma@yahoo.com', '', '', 0, '', 0, 0, 1, 'Irma', 'Haszuri', 'Rotte Bakery Garuda Sakti', '', '', '', 8, 12, 13, NULL, NULL, NULL, 0, 0, 0, 1),
(170, '', '', 'Afrilia', 'Afrilia12345', '', 'afrilyaapril13@gmail.com', '', '', 0, '', 0, 0, 1, 'Afrilia', 'Ningsi', 'ROTTE BAKERY GARUDA SAKTI', '', '', '', 8, 12, 13, NULL, NULL, NULL, 0, 0, 0, 1),
(171, '', '', 'Intan', 'Intan12345', '', 'intan@gmail.com', '', '', 0, '', 0, 0, 1, 'Intan', 'Ratu Purwantari', 'ROTTE BAKERY GARUDA SAKTI', '', '', '', 8, 12, 13, NULL, NULL, NULL, 0, 0, 0, 1),
(172, '', '', 'Cindy ', 'Cindy 12345', '', 'cindy.reinalda@gmail.com', '', '', 0, '', 0, 0, 1, 'Cindy ', 'Reinalda', 'ROTTE BAKERY RENGAT', '', '', '', 8, 18, 31, NULL, NULL, NULL, 0, 0, 0, 1),
(173, '', '', 'M Rafi', 'M Rafi12345', '', 'rafi.picardo@gmail.com', '', '', 0, '', 0, 0, 1, 'M RAFI', 'RICARDO', 'Rotte Bakery RENGAT', '', '', '', 8, 18, 31, NULL, NULL, NULL, 0, 0, 0, 1),
(174, '', '', 'Venia', 'Venia12345', '', 'venia@gmail.com', '', '', 0, '', 0, 0, 1, 'Venia', 'Dwi Fadilla', 'ROTTE BAKERY PEPAYA', '', '', '', 8, 19, 26, NULL, NULL, NULL, 0, 0, 0, 1),
(175, '', '', 'Caca ', 'Caca 12345', '', 'caca.meiliza@gmail.com', '', '', 0, '', 0, 0, 1, 'CACA ', 'MEILIZA', 'Rotte Bakery Sembilang', '', '', '', 8, 20, 32, NULL, NULL, NULL, 0, 0, 0, 1),
(176, '', '', 'Syafni', 'Syafni12345', '', 'santipku1111@gmail.com', '', '', 0, '', 0, 0, 1, 'Syafni', 'Santi Dewi', 'Rotte Bakery Bangkinang', '', '', '', 8, 21, 5, NULL, NULL, NULL, 0, 0, 0, 1),
(177, '', '', 'Rafiul', 'Rafiul12345', '', 'rafiul@gmail.com', '', '', 0, '', 0, 0, 1, 'Rafiul', 'Ali Akbar', 'ROTTE BAKERY BANGKINANG', '', '', '', 8, 21, 5, NULL, NULL, NULL, 0, 0, 0, 1),
(178, '', '', 'Rahmawati', 'Rahmawati12345', '', 'rahmawati.erlan@gmail.com', '', '', 0, '', 0, 0, 1, 'Rahmawati', 'Erlan', 'ROTTE BAKERY KUALU', '', '', '', 8, 22, 19, NULL, NULL, NULL, 0, 0, 0, 1),
(179, '', '', 'Nur', 'Nur12345', '', 'nur.janah@gmail.com', '', '', 0, '', 0, 0, 1, 'NUR', 'JANAH', 'ROTTE BAKERY KUALU', '', '', '', 8, 22, 19, NULL, NULL, NULL, 0, 0, 0, 1),
(180, '', '', 'Mr. Husni', 'Mr. Husni12345', '', 'husni@gmail.com', '', '', 0, '', 0, 0, 1, 'Mr. Husni', 'Fajar', 'ROTTE BAKERY KUALU', '', '', '', 8, 22, 19, NULL, NULL, NULL, 0, 0, 0, 1),
(181, '', '', 'Uttri', 'Uttri12345', '', 'uttri@gmail.com', '', '', 0, '', 0, 0, 1, 'Uttri', 'Gasilla Azmi', 'ROTTE BAKERY KUALU', '', '', '', 8, 22, 19, NULL, NULL, NULL, 0, 0, 0, 1),
(182, '', '', 'Bayu ', 'Bayu 12345', '', 'bayu.mulfahdi@gmail.com', '', '', 0, '', 0, 0, 1, 'BAYU ', 'MULFAHDI', 'Rotte Bakery Arengka', '', '', '', 8, 23, 4, NULL, NULL, NULL, 0, 0, 0, 1),
(183, '', '', 'Juwita', 'Juwita12345', '', 'juwita@gmail.com', '', '', 0, '', 0, 0, 1, 'Juwita', 'Wulandari', 'Rotte Bakery Arengka', '', '', '', 8, 23, 4, NULL, NULL, NULL, 0, 0, 0, 1),
(184, '', '', 'Siti', 'Siti12345', '', 'siti.halimah@gmail.com', '', '', 0, '', 0, 0, 1, 'Siti', 'Halimah', 'Rotte Bakery Kerinci 2', '', '', '', 8, 24, 18, NULL, NULL, NULL, 0, 0, 0, 1),
(185, '', '', 'Putra', 'Putra12345', '', 'putra@gmail.com', '', '', 0, '', 0, 0, 1, 'Putra', 'Yunanda', 'ROTTE BAKERY SIMPANG BADAK', '', '', '', 8, 25, 35, NULL, NULL, NULL, 0, 0, 0, 1),
(186, '', '', 'Febri', 'Febri12345', '', 'yunita@gmail.com', '', '', 0, '', 0, 0, 1, 'Febri', 'Yunita', 'Rotte Bakery Simpang Badak', '', '', '', 8, 25, 35, NULL, NULL, NULL, 0, 0, 0, 1),
(187, '', '', 'Winda', 'Winda12345', '', 'winda.lestari@gmail.com', '', '', 0, '', 0, 0, 1, 'Winda', 'Lestari', 'ROTTE BAKERY TALUK KUANTAN 2', '', '', '', 8, 26, 39, NULL, NULL, NULL, 0, 0, 0, 1),
(188, '', '', 'M.Tohir', 'M.Tohir12345', '', 'tohir@gmail.com', '', '', 0, '', 0, 0, 1, 'M.Tohir', 'Agus', 'ROTTE BAKERY TALUK KUANTAN 2', '', '', '', 8, 26, 39, NULL, NULL, NULL, 0, 0, 0, 1),
(189, '', '', 'Syavira', 'Syavira12345', '', 'syaviraramadhani8@gmail.com', '', '', 0, '', 0, 0, 1, 'Syavira', 'Ramadhani', 'ROTTE BAKERY TALUK KUANTAN', '', '', '', 8, 27, 38, NULL, NULL, NULL, 0, 0, 0, 1),
(190, '', '', 'Muhammad', 'Muhammad12345', '', 'telpa@gmail.com', '', '', 0, '', 0, 0, 1, 'muhammad', 'telpa', 'ROTTE BAKERY TALUK KUANTAN', '', '', '', 8, 27, 38, NULL, NULL, NULL, 0, 0, 0, 1),
(191, '', '', 'Sridevi', 'Sridevi12345', '', 'sridevipersa@gmail.com', '', '', 0, '', 0, 0, 1, 'sridevi', 'permatasari', 'Rotte Bakery Belilas', '', '', '', 8, 28, 6, NULL, NULL, NULL, 0, 0, 0, 1),
(192, '', '', 'Syahnida', 'Syahnida12345', '', 'syahnidaputri@gmail.com', '', '', 0, '', 0, 0, 1, 'syahnida', 'Putri', 'ROTTE BAKERY UJUNG BATU', '', '', '', 8, 29, 41, NULL, NULL, NULL, 0, 0, 0, 1),
(193, '', '', 'Yeni', 'Yeni12345', '', 'yenil@gmail.com', '', '', 0, '', 0, 0, 1, 'Yeni', 'Lusiana', 'Rotte Bakery Kepenuhan', '', '', '', 8, 30, 17, NULL, NULL, NULL, 0, 0, 0, 1),
(194, '', '', 'Isfa', 'Isfa12345', '', 'isfa.nursyarifah@gmail.com', '', '', 0, '', 0, 0, 1, 'Isfa', 'Nursyarifah', 'ROTTE BAKERY PERAWANG', '', '', '', 8, 31, 27, NULL, NULL, NULL, 0, 0, 0, 1),
(195, '', '', 'Fitriyani', 'Fitriyani12345', '', 'fitriyani1@gmail.com', '', '', 0, '', 0, 0, 1, 'Fitriyani', 'Fitriyani', 'ROTTE BAKERY PERAWANG', '', '', '', 8, 31, 27, NULL, NULL, NULL, 0, 0, 0, 1),
(196, '', '', 'Fani', 'Fani12345', '', 'fani@gmail.com', '', '', 0, '', 0, 0, 1, 'Fani', 'Aisyah', 'Rotte Bakery Duri Mawar', '', '', '', 8, 34, 11, NULL, NULL, NULL, 0, 0, 0, 1),
(197, '', '', 'Jupri', 'Jupri12345', '', 'jupri@gmail.com', '', '', 0, '', 0, 0, 1, 'Jupri', 'Jupri', 'Rotte Bakery Duri Mawar', '', '', '', 8, 34, 11, NULL, NULL, NULL, 0, 0, 0, 1),
(198, '', '', 'Delfi', 'Delfi12345', '', 'delfi.respidon@gmail.com', '', '', 0, '', 0, 0, 1, 'DELFI', 'RESPIDON', 'ROTTE BAKERY DURI SUDIRMAN', '', '', '', 8, 35, 12, NULL, NULL, NULL, 0, 0, 0, 1),
(199, '', '', 'Nuraini', 'Nuraini12345', '', 'nur.aini@gmail.com', '', '', 0, '', 0, 0, 1, 'NurAini', 'NurAini', 'ROTTE BAKERY DURI SUDIRMAN', '', '', '', 8, 35, 12, NULL, NULL, NULL, 0, 0, 0, 1),
(200, '', '', 'Rati', 'Rati12345', '', 'rati@gmail.com', '', '', 0, '', 0, 0, 1, 'rati', 'rati', 'Rotte Bakery Lipat Kain', '', '', '', 8, 36, 21, NULL, NULL, NULL, 0, 0, 0, 1),
(201, '', '', 'Sri ', 'Sri 12345', '', 'sridevi@gmail.com', '', '', 0, '', 0, 0, 1, 'Sri ', 'Devi', 'Rotte Bakery Dumai Sukajadi', '', '', '', 8, 37, 10, NULL, NULL, NULL, 0, 0, 0, 1),
(202, '', '', 'Rahmad', 'Rahmad12345', '', 'rahmad1@gmail.com', '', '', 0, '', 0, 0, 1, 'rahmad', 'rahmad', 'ROTTE BAKERY AIR MOLEK', '', '', '', 8, 38, 3, NULL, NULL, NULL, 0, 0, 0, 1),
(203, '', '', 'Salma', 'Salma12345', '', 'salma.navisyah@gmail.com', '', '', 0, '', 0, 0, 1, 'Salma', 'Navisyah', 'Rotte Bakery Perawang 2', '', '', '', 8, 39, 28, NULL, NULL, NULL, 0, 0, 0, 1),
(204, '', '', 'Mitahul', 'Mitahul12345', '', 'ahkyar@gmail.com', '', '', 0, '', 0, 0, 1, 'mitahul', 'ahkyar', 'Rotte Bakery Perawang 2', '', '', '', 8, 39, 28, NULL, NULL, NULL, 0, 0, 0, 1),
(205, '', '', 'Indriyani', 'Indriyani12345', '', 'indriyani@gmail.com', '', '', 0, '', 0, 0, 1, 'indriyani', 'ramayu rambe', 'Rotte Bakery Harapan Raya', '', '', '', 8, 40, 15, NULL, NULL, NULL, 0, 0, 0, 1),
(206, '', '', 'Yoga ', 'Yoga 12345', '', 'yoga.pratama@gmail.com', '', '', 0, '', 0, 0, 1, 'YOGA ', 'PRATAMA', 'Rotte Bakery Siak', '', '', '', 8, 41, 33, NULL, NULL, NULL, 0, 0, 0, 1),
(207, '', '', 'Siti Nur', 'Siti Nur12345', '', 'sitinur@gmail.com', '', '', 0, '', 0, 0, 1, 'Siti nur', 'Azizah', 'Rotte Bakery Siak', '', '', '', 8, 41, 33, NULL, NULL, NULL, 0, 0, 0, 1),
(208, '', '', 'Muhammad', 'Muhammad12345', '', 'reza@gmail.com', '', '', 0, '', 0, 0, 1, 'muhammad', 'reza', 'ROTTE BAKERY SOREK', '', '', '', 8, 42, 36, NULL, NULL, NULL, 0, 0, 0, 1),
(209, '', '', 'Junaidi', 'Junaidi12345', '', 'junaidi@gmail.com', '', '', 0, '', 0, 0, 1, 'JUNAIDI', 'JUNAIDI', 'ROTTE BAKERY TEMBILAHAN', '', '', '', 8, 44, 40, NULL, NULL, NULL, 0, 0, 0, 1),
(210, '', '', 'Yuliana', 'Yuliana12345', '', 'yuliana@gmail.com', '', '', 0, '', 0, 0, 1, 'Yuliana', 'Yuliana', 'ROTTE BAKERY TEMBILAHAN', '', '', '', 8, 44, 40, NULL, NULL, NULL, 0, 0, 0, 1),
(211, '', '', 'Ade Ita', 'Ade Ita12345', '', 'adeita@gmail.com', '', '', 0, '', 0, 0, 1, 'Ade Ita', 'Priana Siregar', 'ROTTE BAKERY PASIR PANGARAIAN', '', '', '', 8, 45, 23, NULL, NULL, NULL, 0, 0, 0, 1),
(212, '', '', 'Syarifah ', 'Syarifah 12345', '', 'syarifahs@gmail.com', '', '', 0, '', 0, 0, 1, 'syarifah ', 'Novianti', 'ROTTE BAKERY SIGUNGGUNG', '', '', '', 8, 47, 34, NULL, NULL, NULL, 0, 0, 0, 1),
(213, '', '', 'Ahmad', 'Ahmad12345', '', 'hadi@gmail.com', '', '', 0, '', 0, 0, 1, 'Ahmad', 'Hadi Saputra', 'Rotte Bakery Sigunggung', '', '', '', 8, 47, 34, NULL, NULL, NULL, 0, 0, 0, 1),
(214, '', '', 'Reni', 'Reni12345', '', 'pklkerinci_rotte@gmail.com', '', '', 0, '', 0, 0, 1, 'Reni', 'Andriani', 'ROTTE BAKERY MANAGEMEN', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(215, '', '', 'Elfira', 'Elfira12345', '', 'delima_rotte@gmail.com', '', '', 0, '', 0, 0, 1, 'Elfira', 'Rahmawati', 'ROTTE BAKERY AM', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(216, '', '', 'Ahmad', 'Ahmad12345', '', 'ahmad.effendi@gmail.com', '', '', 0, '', 0, 0, 1, 'Ahmad', 'Effendi', 'Rotte Bakery', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(217, '', '', 'Rudi', 'Rudi12345', '', 'rudi.saputra@gmail.com', '', '', 0, '', 0, 0, 1, 'RUDI', 'SAPUTRA', 'ROTTE BAKERY MANAGEMEN', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(218, '', '', 'Adi ', 'Adi 12345', '', 'adi.chandra@gmail.com', '', '', 0, '', 0, 0, 1, 'ADI ', 'CHANDRA', 'rotte bakery OM', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(219, 0x3a3a31, '', 'Amiruddin', '9c1bb35a86c5c29a4e2feeed68982896d601b8ac', '', 'amiruddin@rottebakery.id', '', '', 0, '', 0, 1689579610, 1, 'amiruddin', 'amiruddin', 'Operation Manager Area 2', '08', '', 'male', 6, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(220, '', '', 'Fahmi', 'Fahmi12345', '', 'fahmi.nanda@rottebakery.id', '', '', 0, '', 0, 0, 1, 'Fahmi', 'Nanda', 'Rotte Bakery Operation Manager', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(221, '', '', 'Fajar ', 'Fajar 12345', '', 'fajar.julianto@gmail.com', '', '', 0, '', 0, 0, 1, 'Fajar ', 'Julianto', 'ROTTE BAKERY MANAGEMEN', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(222, '', '', 'Gessy', 'Gessy12345', '', 'gessy@gmail.com', '', '', 0, '', 0, 0, 1, 'gessy', 'nofalia', 'Rotte Bakery Managemen', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(223, '', '', 'Rezky', 'Rezky12345', '', 'rezky@gmail.com', '', '', 0, '', 0, 0, 1, 'rezky', 'saputra', 'Rotte Bakery Managemen', '', '', '', 6, 0, 0, NULL, NULL, NULL, 0, 0, 0, 1),
(224, 0x3a3a31, '', 'Rino', '7c5e29f270cab12aa705f4afff95b29ac37c9261', '', 'rino@gmail.com', '', '', 0, '', 0, 1689576600, 1, 'Rino', 'Adri', 'Rotte Bakery Marpoyan', '08', '', 'male', 8, 17, 22, NULL, NULL, NULL, 0, 0, 0, 1),
(225, '', '', 'Anita', 'Anita12345', '', 'anita@gmail.com', '', '', 0, '', 0, 0, 1, 'Anita', 'Ritonga', 'ROTTE BAKERY PASIR PUTIH', '', '', '', 8, 5, 24, NULL, NULL, NULL, 0, 0, 0, 1),
(226, '', '', 'Rahmad ', 'Rahmad 12345', '', 'rahmad.syah@gmail.com', '', '', 0, '', 0, 0, 1, 'RAHMAD ', 'SYAH', 'ROTTE BAKERY PAUS', '', '', '', 8, 8, 25, NULL, NULL, NULL, 0, 0, 0, 1),
(227, '', '', 'Halim', 'Halim12345', '', 'halim@gmail.com', '', '', 0, '', 0, 0, 1, 'Halim', 'Suryanata', 'Rotte Bakey Rajawali', '', '', '', 8, 6, 30, NULL, NULL, NULL, 0, 0, 0, 1),
(228, '', '', 'Rahmat', 'Rahmat12345', '', 'rahmat@gmail.com', '', '', 0, '', 0, 0, 1, 'Rahmat', 'Hidayat', 'ROTTE BAKERY BERINGIN', '', '', '', 8, 7, 7, NULL, NULL, NULL, 0, 0, 0, 1),
(229, '', '', 'Hefrizal', 'Hefrizal12345', '', 'hefrizal@gmail.com', '', '', 0, '', 0, 0, 1, 'hefrizal', 'hefrizal', 'Rotte Bakery Kerinci 1', '', '', '', 8, 14, 29, NULL, NULL, NULL, 0, 0, 0, 1),
(230, '', '', 'Muhammad ', 'Muhammad 12345', '', 'muhammad.alfarido@gmail.com', '', '', 0, '', 0, 0, 1, 'MUHAMMAD ', 'ALFARIDO', 'Rotte Bakery Subrantas', '', '', '', 8, 13, 37, NULL, NULL, NULL, 0, 0, 0, 1),
(231, '', '', 'Putri ', 'Putri 12345', '', 'lestari@gmail.com', '', '', 0, '', 0, 0, 1, 'Putri ', 'Lestari', 'Rotte Bakery Delima', '', '', '', 8, 10, 9, NULL, NULL, NULL, 0, 0, 0, 1),
(232, '', '', 'Deprianto', 'Deprianto12345', '', 'deprianto@gmail.com', '', '', 0, '', 0, 0, 1, 'Deprianto', 'Deprianto', 'Rotte Bakery Hangtuah', '', '', '', 8, 15, 14, NULL, NULL, NULL, 0, 0, 0, 1),
(233, '', '', 'Ikmam ', 'Ikmam 12345', '', 'imam.zuhri@gmail.com', '', '', 0, '', 0, 0, 1, 'IKMAM ', 'ZUHRI', 'Rotte Bakery Garuda Sakti', '', '', '', 8, 12, 13, NULL, NULL, NULL, 0, 0, 0, 1),
(234, '', '', 'Oki', 'Oki12345', '', 'oki@gmail.com', '', '', 0, '', 0, 0, 1, 'oki', 'indra prasetio', 'Rotte Bakery Rengat', '', '', '', 8, 18, 31, NULL, NULL, NULL, 0, 0, 0, 1),
(235, '', '', 'Andre', 'Andre12345', '', 'andre.febrian@gmail.com', '', '', 0, '', 0, 0, 1, 'Andre', 'Limansa Febrian', 'Rotte Bakery Rengat', '', '', '', 8, 18, 31, NULL, NULL, NULL, 0, 0, 0, 1),
(236, '', '', 'Andre', 'Andre12345', '', 'limansa@gmail.com', '', '', 0, '', 0, 0, 1, 'Andre', 'Limansa Febrian', 'Rotte Bakery Rengat', '', '', '', 8, 18, 31, NULL, NULL, NULL, 0, 0, 0, 1),
(237, '', '', 'Agnel', 'Agnel12345', '', 'agnel@gmail.com', '', '', 0, '', 0, 0, 1, 'Agnel', 'Habibi', 'ROTTE BAKERY ARENGKA', '', '', '', 8, 23, 4, NULL, NULL, NULL, 0, 0, 0, 1),
(238, '', '', 'Fery', 'Fery12345', '', 'fery@gmail.com', '', '', 0, '', 0, 0, 1, 'Fery', 'Sawal', 'Rotte Bakery Arengka', '', '', '', 8, 23, 4, NULL, NULL, NULL, 0, 0, 0, 1),
(239, '', '', 'Rara', 'Rara12345', '', 'rara@gmail.com', '', '', 0, '', 0, 0, 1, 'rara', 'deana pertiwi', 'Rotte Bakery Kerinci 2', '', '', '', 8, 24, 18, NULL, NULL, NULL, 0, 0, 0, 1),
(240, '', '', 'Riska Ayu', 'Riska Ayu12345', '', 'riskaayu@gmail.com', '', '', 0, '', 0, 0, 1, 'Riska Ayu', 'Widya Sary', 'Rotte Bakery Perawang', '', '', '', 8, 31, 27, NULL, NULL, NULL, 0, 0, 0, 1),
(241, '', '', 'Siti Aulia', 'Siti Aulia12345', '', 'auliasiregar643@gmail.com', '', '', 0, '', 0, 0, 1, 'Siti aulia', 'Syahfitri siregar', 'Rotte Bakery Lipat Kain', '', '', '', 8, 36, 21, NULL, NULL, NULL, 0, 0, 0, 1),
(242, '', '', 'Razul', 'Razul12345', '', 'razul@gmail.com', '', '', 0, '', 0, 0, 1, 'Razul', 'Juanda', 'ROTTE BAKERY AIR MOLEK', '', '', '', 8, 38, 3, NULL, NULL, NULL, 0, 0, 0, 1),
(243, '', '', 'Fitri', 'Fitri12345', '', 'efridayani@gmail.com', '', '', 0, '', 0, 0, 1, 'fitri', 'efridayani', 'Rotte Bakery Perawang 2', '', '', '', 8, 39, 28, NULL, NULL, NULL, 0, 0, 0, 1),
(244, '', '', 'Indri', 'Indri12345', '', 'indri.astuti@gmail.com', '', '', 0, '', 0, 0, 1, 'Indri', 'Astuti', 'ROTTE BAKERY SIAK', '', '', '', 8, 41, 33, NULL, NULL, NULL, 0, 0, 0, 1),
(245, '', '', 'Mujahidul', 'Mujahidul12345', '', 'muja@gmail.com', '', '', 0, '', 0, 0, 1, 'Mujahidul', 'Umami', 'Rotte Bakery Tembilahan', '', '', '', 8, 44, 40, NULL, NULL, NULL, 0, 0, 0, 1),
(246, '', '', 'Raja', 'Raja12345', '', 'raja@gmail.com', '', '', 0, '', 0, 0, 1, 'Raja', 'Kevin Alhafid', 'Rotte Bakery Sigunggung', '', '', '', 8, 47, 34, NULL, NULL, NULL, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2023-06-24 02:34:40'),
(2, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2023-06-24 02:39:39'),
(3, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-24 02:41:04'),
(4, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-26 01:58:55'),
(5, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-26 06:48:37'),
(6, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-27 01:33:35'),
(7, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-27 04:28:04'),
(8, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-27 04:45:45'),
(9, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-28 01:15:32'),
(10, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-28 01:25:20'),
(11, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-06-30 03:15:40'),
(12, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-01 01:30:27'),
(13, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-03 01:41:54'),
(14, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-03 07:33:45'),
(15, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-03 08:23:38'),
(16, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-04 01:38:54'),
(17, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-05 01:47:19'),
(18, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-06 01:31:24'),
(19, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-06 08:28:05'),
(20, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-06 08:35:50'),
(21, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-06 09:42:36'),
(22, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-07 06:24:33'),
(23, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-07 07:59:45'),
(24, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-08 03:18:47'),
(25, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-08 03:19:50'),
(26, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 01:48:51'),
(27, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 02:40:22'),
(28, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 02:56:53'),
(29, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 03:07:05'),
(30, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 03:08:36'),
(31, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 03:14:44'),
(32, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-10 03:22:25'),
(33, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-10 04:41:26'),
(34, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-10 04:56:08'),
(35, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-11 01:40:29'),
(36, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-11 03:31:52'),
(37, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-11 06:49:15'),
(38, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-11 06:50:52'),
(39, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-11 06:51:40'),
(40, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-11 06:58:03'),
(41, 4, NULL, 0x3a3a31, 'frank', '2023-07-11 09:47:02'),
(42, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-12 04:23:49'),
(43, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-12 04:28:26'),
(44, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-12 07:46:17'),
(45, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-13 02:19:02'),
(46, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-13 02:19:37'),
(47, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-13 02:20:05'),
(48, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-13 04:32:39'),
(49, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-13 04:41:09'),
(50, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-13 07:00:38'),
(51, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-13 07:15:05'),
(52, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-13 07:20:26'),
(53, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-13 07:20:42'),
(54, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-13 09:52:03'),
(55, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-13 09:52:19'),
(56, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-14 03:09:55'),
(57, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-14 06:44:24'),
(58, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-14 08:18:29'),
(59, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-15 01:39:11'),
(60, 5, NULL, 0x3a3a31, 'kasir_dua', '2023-07-15 01:39:25'),
(61, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-17 01:41:32'),
(62, 3, NULL, 0x3a3a31, 'kasir_satu', '2023-07-17 02:42:36'),
(63, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-17 06:36:29'),
(64, 224, NULL, 0x3a3a31, 'Rino', '2023-07-17 06:50:00'),
(65, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:34:07'),
(66, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:35:47'),
(67, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:35:57'),
(68, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:36:14'),
(69, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:36:49'),
(70, 219, NULL, 0x3a3a31, 'Amiruddin', '2023-07-17 07:40:10'),
(71, 90, NULL, 0x3a3a31, 'Riskaadela', '2023-07-17 07:48:45'),
(72, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-18 05:56:05'),
(73, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-18 06:11:30'),
(74, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-20 06:31:32'),
(75, 90, NULL, 0x3a3a31, 'riskaadela', '2023-07-20 06:32:31'),
(76, 2, NULL, 0x3a3a31, 'mrwg406@gmail.com', '2023-07-20 06:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'Coklat'),
(2, 'Keju');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(4, 'RB001', 'ROTTE BAKERY BUKIT BARISAN', '<p>JL. BUKIT BARISAN, PEKANBARU</p>', '', '', '', 1),
(5, 'RB002', 'ROTTE BAKERY PASIR PUTIH', '<p>JL. RAYA PASIR PUTIH, KAMPAR</p>', '', '', '', 1),
(6, 'RB003', 'ROTTE BAKERY RAJAWALI', '<p>Jl. Garuda Sakti No.89A, Simpang Baru, Tampan, Kota Pekanbaru, Riau 28293</p>', '', '', '', 1),
(7, 'RB004', 'ROTTE BAKERY BERINGIN', '<p>Jalan Letjend S.Parman No.11 Sukamaju, Suka Maju, Sail, Kota Pekanbaru, Riau 28127</p>', '', '', '', 1),
(8, 'RB005', 'ROTTE BAKERY PAUS', '<p>JL. PAUS, PEKANBARU</p>', '', '', '', 1),
(9, 'RB006', 'ROTTE BAKERY UMBAN SARI', '<p>JL. UMBAN SARI, RUMBAI, PEKANBARU</p>', '', '', '', 1),
(10, 'RB007', 'ROTTE BAKERY DELIMA', '<p>Jl. Delima, Ruko Taman Raya Raudha No, 09, Delima, Tampan, Kota Pekanbaru, Riau 28291</p>', '', '', '', 1),
(11, 'RB008', 'ROTTE BAKERY KARTAMA', '<p>JL. KARTAMA, PEKANBARU</p>', '', '', '', 1),
(12, 'RB009', 'ROTTE BAKERY GARUDA SAKTI', '<p>Jl. Garuda Sakti, Pekanbaru Riau</p>', '', '', '', 1),
(13, 'RB010', 'ROTTE BAKERY SUBRANTAS', '<p>Jl. Soebrantas, Tampan, Pekanbaru City, Riau 28293</p>', '', '', '', 1),
(14, 'RB011', 'ROTTE BAKERY PANGKALAN KERINCI', '<p>Jalan Maharaja Indra, Pangkalan Kerinci Kota, Pangkalan Kerinci, Kabupaten Pelalawan, Riau 28654</p>', '', '', '', 1),
(15, 'RB012', 'ROTTE BAKERY HANGTUAH', '<p>Jl. Hangtuah, Rejosari, Tenayan Raya, Kota Pekanbaru, Riau 28112</p>', '', '', '', 1),
(16, 'RB013', 'ROTTE BAKERY KUBANG', '<p>JL. KUBANG RAYA, KAMPAR, RIAU</p>', '', '', '', 1),
(17, 'RB014', 'ROTTE BAKERY MARPOYAN', '<p>JL. KH NASUTION, PEKANBARU</p>', '', '', '', 1),
(18, 'RB015', 'ROTTE BAKERY RENGAT', '<p>Jl.  Sultan No. 40, Rengat, Indragiri Hulu</p>', '', '', '', 1),
(19, 'RB016', 'ROTTE BAKERY & CAFFEE PEPAYA', '<p>Jl. Pepaya, Kota Pekanbaru</p>', '', '', '', 1),
(20, 'RB017', 'ROTTE BAKERY SEMBILANG', '<p>Jl. Sembilang, Rumbai, Pekanbaru</p>', '', '', '', 1),
(21, 'RB018', 'ROTTE BAKERY BANGKINANG', '<p>Jl. Sisingamangaraja No.210A Bangkinang</p>', '', '', '', 1),
(22, 'RB019', 'ROTTE BAKERY KUALU', '<p>Jl. Suka Karya 111, Kec. Tampan, Kota Pekanbaru</p>', '', '', '', 1),
(23, 'RB020', 'ROTTE BAKERY ARENGKA', '<p>Jl. Soekarno Hatta</p>', '', '', '', 1),
(24, 'RB021', 'ROTTE BAKERY PANGKALAN KERINCI 2', '<p>Jalan Maharaja Indra No.55, Pangkalan Kerinci Kota, Pangkalan Kerinci, Kabupaten Pelalawan, Riau 28654</p>', '', '', '', 1),
(25, 'RB022', 'ROTTE BAKERY SIMPANG BADAK', 'Jl. Hangtuah Ujung, Pekanbaru', '', '', '', 1),
(26, 'RB023', 'ROTTE BAKERY TALUK KUANTAN 2', '<p>Jl. Ahmad Yani 44, Taluk Kuantan</p>', '', '', '', 1),
(27, 'RB024', 'ROTTE BAKERY TALUK KUANTAN', '<p>Jl. Tuanku Tambusai, Kel. Beringin Taluk, Kec. Kuantan Singingi Kab. Taluk Kuantan </p>', '', '', '', 1),
(28, 'RB025', 'ROTTE BAKERY BELILAS', 'Jl. Lintas Timur Simpang Empat Belilas\nRT009 RW003\nKelurahan Pangkalan Kasai\nKecamatan Siberida\nKabupaten Indragiri Hulu \nRiau', '', '', '', 1),
(29, 'RB026', 'ROTTE BAKERY TOLE (UJUNG BATU)', 'Jl. Jenderal Sudirman No. 371 RT02/RW07 Kel. Ujung Batu Kec. Ujung Batu Kab. Rokan Hulu', '', '', '', 1),
(30, 'RB027', 'ROTTE BAKERY KEPENUHAN', '<p>Kepenuhan, Rokan Hilir, RIAU</p>', '', '', '', 1),
(31, 'RB028', 'ROTTE BAKERY PERAWANG', '<p>Jl. Muhammad Ali, Perawang</p>', '', '', '', 1),
(32, 'RB029', 'ROTTE BAKERY GRAND GALAXY (TUTUP)', '<p>Ruko RGA 11 Grand Galaxy</p><p>Jl. Jaka Setia, Bekasi Selatan</p>', '', '', '', 1),
(33, 'RB030', 'ROTTE BAKERY JATI MAKMUR', '<p>Jl. Jati Makmur No.1 Pondok Gede, Bekasi</p>', '', '', '', 1),
(34, 'RB031', 'ROTTE BAKERY DURI MAWAR', '<p>Jl. Mawar No.16 Kec Mandau - Duri</p>', '', '', '', 1),
(35, 'RB032', 'ROTTE BAKERY DURI SUDIRMAN', '<p>Jl. Sudirman, Kec Mandau - Duri</p>', '', '', '', 1),
(36, 'RB033', 'ROTTE BAKERY LIPAT KAIN', '<p>Jl. Lipat Kain, Kampar, Riau</p>', '', '', '', 1),
(37, 'RB034', 'ROTTE BAKERY DUMAI SUKAJADI', '<p>Jl . Pangeran Dipenogoro, Kec Dumai Timur, Riau</p>', '', '', '', 1),
(38, 'RB035', 'ROTTE BAKERY AIR MOLEK', '<p>Jl. Jenderal Sudirman RT01 RW01 linkungan 2 Desa tanjung gading Kec pasir penyu\nKab. Indra giri Hulu 29353</p>', '', '', '', 1),
(39, 'RB036', 'ROTTE BAKERY PERAWANG 2', '<p>Jl. Raya Perawang Km.5 Kec. Tualang Kab. Siak</p>', '', '', '', 1),
(40, 'RB037', 'ROTTE BAKERY HARAPAN RAYA', '<p>Jl. Harapan Raya, Pekanbaru, RIAU </p>', '', '', '', 1),
(41, 'RB038', 'ROTTE BAKERY SIAK', '<p>Jl. Raja Kecik RT 12 RW 004 Kel. Kampung Dalam Kab. Siak</p>', '', '', '', 1),
(42, 'RB039', 'ROTTE BAKERY SOREK', 'Jl. Lintas Timur, Sorek satu, Kec. Pangkalan Kuras, Kab. Pelalawan', '', '', '', 1),
(43, 'RB040', 'ROTTE BAKERY VILLA TOMANG (TUTUP)', '<p>Ruko komplek amsterdam Jl. villa tomang baru</p><p>Kuta Jaya, Kec. Ps Kemis</p><p>Tangerang, Banten 15560</p>', '', '', '', 1),
(44, 'RB041', 'ROTTE BAKERY TEMBILAHAN', 'Jl. M. Boya, Tembilahan Kota, Tembilahan, Kabupaten Indragiri Hilir, Riau 29214', '', '', '', 1),
(45, 'RB042', 'ROTTE BAKERY PASIR PANGARAIAN', 'Jl. Tuanku Tambusai, Pematang Berangan, Rokan Hulu, RIau 28557', '', '', '', 1),
(46, 'RB043', 'ROTTE BAKERY CIOMAS (TUTUP)', 'Jl. Raya Ciomas Kreteg No.34A, RT 003, RW 04, \nPadasuka, Ciomas, Bogor, Jawa Barat 16610', '', '', '', 1),
(47, 'RB044', 'ROTTE BAKERY SIGUNGGUNG', 'Jl. Dharma Bakti No. 43 B, Sigunggung, Pekanbaru', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_no` (`reference_no`,`warehouse_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1024;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
