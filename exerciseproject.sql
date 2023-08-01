-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 28, 2023 at 10:42 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exerciseproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(18, '2023_07_21_051339_add_notification_switch_to_users_table', 1),
(19, '2023_07_21_070839_create_notifications_table', 2),
(20, '2023_07_24_072504_add_notification_on_off_to_users', 3),
(21, '2023_07_26_051725_create_post_notifications_table', 4),
(22, '2023_07_26_081058_create_post_notification_user_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `expiration_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `message`, `read`, `expiration_date`, `created_at`, `updated_at`) VALUES
(229, 2, NULL, 'hu', 0, NULL, '2023-07-28 00:50:51', '2023-07-28 00:50:51'),
(228, 1, NULL, 'hu', 0, NULL, '2023-07-28 00:50:51', '2023-07-28 00:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_notifications`
--

DROP TABLE IF EXISTS `post_notifications`;
CREATE TABLE IF NOT EXISTS `post_notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_notifications_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_notifications`
--

INSERT INTO `post_notifications` (`id`, `type`, `message`, `expiration_date`, `user_id`, `created_at`, `updated_at`) VALUES
(27, 'system', 'NOOOOOOOOOOOO', '2023-08-01', NULL, '2023-07-27 23:29:16', '2023-07-27 23:29:16'),
(26, 'invoice', 'HELLOOOOOOOO', '2023-07-31', NULL, '2023-07-27 23:26:05', '2023-07-27 23:26:05'),
(25, 'marketing', 'Good morning', '2023-07-31', NULL, '2023-07-27 06:44:14', '2023-07-27 06:44:14'),
(28, 'invoice', 'GOOD afternoon', '2023-08-05', NULL, '2023-07-28 01:15:00', '2023-07-28 01:15:00'),
(29, 'invoice', 'Congra,,,,', '2023-08-05', NULL, '2023-07-28 01:22:19', '2023-07-28 01:22:19'),
(30, 'system', 'LOVELY', '2023-08-03', NULL, '2023-07-28 02:19:30', '2023-07-28 02:19:30'),
(31, 'system', 'Thi system version is 8.00', '2023-08-15', NULL, '2023-07-28 02:22:28', '2023-07-28 02:22:28'),
(32, 'invoice', 'This laravel Notification', '2023-08-10', NULL, '2023-07-28 04:54:41', '2023-07-28 04:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `post_notification_user`
--

DROP TABLE IF EXISTS `post_notification_user`;
CREATE TABLE IF NOT EXISTS `post_notification_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_notification_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_notification_user_post_notification_id_foreign` (`post_notification_id`),
  KEY `post_notification_user_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_notification_user`
--

INSERT INTO `post_notification_user` (`id`, `post_notification_id`, `user_id`, `read`, `created_at`, `updated_at`) VALUES
(28, 32, 8, 1, NULL, NULL),
(27, 31, 2, 1, NULL, NULL),
(26, 31, 1, 1, NULL, NULL),
(25, 29, 2, 1, NULL, NULL),
(24, 28, 2, 1, NULL, NULL),
(23, 28, 1, 0, NULL, NULL),
(22, 27, 2, 1, NULL, NULL),
(21, 27, 1, 1, NULL, NULL),
(20, 26, 2, 1, NULL, NULL),
(19, 26, 1, 1, NULL, NULL),
(18, 25, 2, 1, NULL, NULL),
(17, 25, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification_switch` tinyint(1) NOT NULL DEFAULT '1',
  `notification_on_off` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone_number`, `created_at`, `updated_at`, `notification_switch`, `notification_on_off`) VALUES
(1, 'bhavik', 'bhavik@gmail.com', NULL, '$2y$10$5lqUU2HN353X1vKaE9RfduljS.qprrFqwtTi3Vtr3KnNDmTaK5fHu', NULL, '918780736965', '2023-07-21 00:20:06', '2023-07-28 04:53:47', 1, 1),
(2, 'aa', 'aaa@gmail.com', NULL, '$2y$10$/q9rhLNrVxmIE43fAMC.Heqp6h1lyVs4y8E61WdZy9UBna3g1i7ZO', NULL, '918780736996', '2023-07-21 00:26:11', '2023-07-28 04:53:45', 1, 1),
(8, 'abc', 'abc@gmail.com', NULL, '$2y$10$tUCbiMrpF4xaxKsM3nDRm.ZHU76l4U0YfpQY8nWq6sygQu5nix3OS', NULL, '8780736953', '2023-07-28 04:53:19', '2023-07-28 04:53:39', 1, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
