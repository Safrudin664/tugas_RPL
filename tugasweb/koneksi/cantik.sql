-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2025 at 09:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cantik`
--

-- --------------------------------------------------------

--
-- Table structure for table `home_content`
--
CREATE DATABASE cantik;
USE cantik;

CREATE TABLE `home_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `image`, `url`) VALUES
(0, 'Tips Perawatan Wajah Glowing yang Mudah Dilakukan', 'img/453c1300-a714-49b4-9ab8-760f2f73ea32.jpeg', 'https://www.siloamhospitals.com/informasi-siloam/artikel/perawatan-wajah-agar-glowing'),
(0, 'Prinsip Perawatan Kulit Dasar', 'img/bkkf4rgfwe9m9eu.jpeg', 'https://www.alomedika.com/prinsip-perawatan-kulit-dasar'),
(0, 'Perawatan Kulit Wajah yang Dapat Dilakukan di Rumah', 'img/perawatan-kulit-yang-perlu-dilakukan-setiap-hari.jpg', 'https://www.alodokter.com/perawatan-kulit-wajah-yang-dapat-dilakukan-di-rumah');

-- --------------------------------------------------------

--
-- Table structure for table `isipaket`
--

CREATE TABLE `isipaket` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `features` text NOT NULL,
  `rekomendasi` enum('Ya','Tidak') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `isipaket`
--

INSERT INTO `isipaket` (`id`, `name`, `price`, `features`, `rekomendasi`, `image`, `images`) VALUES
(0, 'Perawatan Wajah', '90000', 'membersihkan kulit wajah dengan sempurna dan mendapatkan kulit yang bersih dan cerah', 'Ya', 'cantik.jpg', NULL),
(0, 'Perawatan Wajah', '90000', 'membersihkan kulit wajah dengan sempurna dan mendapatkan kulit yang bersih dan cerah', 'Ya', 'cantik1.jpg', NULL),
(0, 'Perawatan Wajah', '90000', 'membersihkan kulit wajah dengan sempurna dan mendapatkan kulit yang bersih dan cerah', 'Ya', 'cantik2.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi`
--

CREATE TABLE `konsultasi` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `complaint` text NOT NULL,
  `specialist` varchar(50) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `visit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konsultasi`
--

INSERT INTO `konsultasi` (`id`, `name`, `email`, `gender`, `phone`, `address`, `complaint`, `specialist`, `doctor`, `visit_date`, `created_at`) VALUES
(0, 'wi;;y', 'willy@email.com', 'pria', 'abcde', 'jl.condet', 'jerawat', 'dermatology', 'dr1', '2025-01-16', '2025-01-15 07:09:30'),
(0, 'ferdy', 'abang@email.com', 'pria', '12345678912', 'jakarta', 'kulit', 'internal', 'dr2', '2025-07-03', '2025-06-28 07:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `valid_until` date DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(0, 'admin', '', '$2y$10$KH174in32/.dpF4MG3xJcus3W6hmUKO9BBUa.2IViIHmvXD0Qw7Ce', 'admin', '2025-01-14 16:27:58', '2025-01-14 16:27:58'),
(0, 'tes', 'tes@email.com', '$2y$10$OPWCp62ojdtXldjlyzLMKOMjmT8kKH28IUvqneRc8Nnp5f4cwDLy.', 'user', '2025-01-14 16:28:48', '2025-01-14 16:28:48');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
