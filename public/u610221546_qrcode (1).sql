-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 03, 2024 at 10:21 AM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u610221546_qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `qr_name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_05_03_000001_create_customer_columns', 1),
(9, '2019_05_03_000002_create_subscriptions_table', 1),
(10, '2019_05_03_000003_create_subscription_items_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_11_03_095742_create_reset_code_passwords_table', 1),
(14, '2024_02_13_132606_create_documents_table', 1),
(15, '2024_02_19_123615_create_p_d_f_s_table', 1),
(16, '2024_05_07_140809_create_url_texts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'qbidapi', 'e6124c91b89629dccead6174c4ebbf2ed47824207ef70f4e66d6f2a0669c3f07', '[\"*\"]', NULL, NULL, '2024-04-04 03:55:19', '2024-04-04 03:55:19'),
(2, 'App\\Models\\User', 2, 'qbidapi', '13f074c6f78c9bbe68d401ef0c07eff49155aba91a24a162ec7eddeb0e22b972', '[\"*\"]', '2024-04-04 10:48:41', NULL, '2024-04-04 09:59:06', '2024-04-04 10:48:41'),
(3, 'App\\Models\\User', 3, 'qbidapi', '6852080ed1707928bea3e3b3627afcbe306539d178da5f28d643a0be0a366717', '[\"*\"]', '2024-04-04 10:16:53', NULL, '2024-04-04 10:15:18', '2024-04-04 10:16:53'),
(4, 'App\\Models\\User', 2, 'app_api', '3fedca4f675f0ae49a727c1cab6a5691fda8989c622aa619f2ef8551c9e1c9f7', '[\"*\"]', '2024-04-05 05:11:14', NULL, '2024-04-04 10:49:26', '2024-04-05 05:11:14'),
(5, 'App\\Models\\User', 2, 'app_api', '9bf94b1903b63f36936587566af62348330e075cf44cf467cd2a3c180afc20e7', '[\"*\"]', '2024-04-05 05:35:15', NULL, '2024-04-05 05:15:35', '2024-04-05 05:35:15'),
(6, 'App\\Models\\User', 2, 'app_api', 'a2cd0cd8de366585cb314db61936da9fee54c01444f605d8338511de1a0c5323', '[\"*\"]', '2024-04-05 09:27:09', NULL, '2024-04-05 05:41:48', '2024-04-05 09:27:09'),
(7, 'App\\Models\\User', 4, 'qbidapi', '6a043bc10a84ce9e2b0773dd9d2735969593d22374720d6f40e6d3444d25c347', '[\"*\"]', '2024-04-08 05:24:04', NULL, '2024-04-05 09:28:13', '2024-04-08 05:24:04'),
(8, 'App\\Models\\User', 4, 'app_api', '1ca5928f1e70121b8bc7f540f452eac15ec199cd4f4946c13f8ed13d8a1661a1', '[\"*\"]', '2024-04-08 05:47:33', NULL, '2024-04-08 05:25:06', '2024-04-08 05:47:33'),
(9, 'App\\Models\\User', 5, 'qbidapi', 'ca3034ddfe6a3bfc8bf3ed671b22fcf838ea249c951fc119465a315e3eea092b', '[\"*\"]', '2024-05-10 17:24:53', NULL, '2024-04-26 21:02:54', '2024-05-10 17:24:53'),
(10, 'App\\Models\\User', 6, 'qbidapi', '811504cf82af8053e834276d1ffbda4abebe777432d39c4587f02f38c3e37d17', '[\"*\"]', '2024-05-07 15:17:33', NULL, '2024-04-29 09:56:22', '2024-05-07 15:17:33'),
(11, 'App\\Models\\User', 7, 'qbidapi', '4abe52f51ef684a97017725e662924303976b1554bf36d2aa6f124ffb88751c7', '[\"*\"]', '2024-04-29 14:50:31', NULL, '2024-04-29 14:40:21', '2024-04-29 14:50:31'),
(12, 'App\\Models\\User', 7, 'app_api', '4cb89b792e5c92acb268cd6dba2c50ec8c7b905bb9cec5c3c2716069474442a6', '[\"*\"]', '2024-05-13 10:09:12', NULL, '2024-04-29 15:02:15', '2024-05-13 10:09:12'),
(13, 'App\\Models\\User', 1, 'app_api', '41ff0ce583c9b86d01645986274a7610b8f4c6d238bd07397ab765e4943b68e4', '[\"*\"]', '2024-05-01 12:38:19', NULL, '2024-05-01 12:20:05', '2024-05-01 12:38:19'),
(14, 'App\\Models\\User', 1, 'app_api', 'b4b3d914219c764708663806574fe8172aa1292e11d3ba1cb57201a11f9669e9', '[\"*\"]', '2024-05-01 13:07:05', NULL, '2024-05-01 12:39:48', '2024-05-01 13:07:05'),
(15, 'App\\Models\\User', 1, 'app_api', 'bd9cbcbf03157184548613ea82469dc1ab2315bf536d81175c6c58be3dd0a91a', '[\"*\"]', '2024-05-01 13:08:48', NULL, '2024-05-01 13:07:43', '2024-05-01 13:08:48'),
(16, 'App\\Models\\User', 1, 'app_api', '467c92ffcc132b28941072c19660d1caa36c5888b15eddad3d1d4d20eb334363', '[\"*\"]', '2024-05-01 13:30:42', NULL, '2024-05-01 13:14:08', '2024-05-01 13:30:42'),
(17, 'App\\Models\\User', 1, 'app_api', 'a955c0f21156bba7447376a7e8527f40e5b67a7f22471b2866c0fd52c0e39a9e', '[\"*\"]', '2024-05-01 14:14:49', NULL, '2024-05-01 13:31:26', '2024-05-01 14:14:49'),
(18, 'App\\Models\\User', 8, 'qbidapi', 'd13fa0be8bb686aef85345c07c090fc842dc793cbede173491a0572e8afb3fcf', '[\"*\"]', '2024-05-04 01:08:55', NULL, '2024-05-04 00:49:07', '2024-05-04 01:08:55'),
(19, 'App\\Models\\User', 8, 'app_api', 'ddcf43e0f035c0cd437ac5730e07ac1429a25d4d9eab31a68f770ff1b9b91a19', '[\"*\"]', '2024-05-04 02:06:51', NULL, '2024-05-04 01:14:58', '2024-05-04 02:06:51'),
(20, 'App\\Models\\User', 8, 'app_api', '5bd2aa1d2b46059f9b484d98bfee4c1f721cec4ba42408114c6da9bc2699e1ff', '[\"*\"]', NULL, NULL, '2024-05-04 02:07:35', '2024-05-04 02:07:35'),
(21, 'App\\Models\\User', 8, 'app_api', '67960e0c3c28ce399ceaff12ef78d17efd57ada59f066317a5b703284f67f365', '[\"*\"]', '2024-05-13 15:16:29', NULL, '2024-05-04 16:29:21', '2024-05-13 15:16:29'),
(22, 'App\\Models\\User', 1, 'app_api', 'cb571bbb7e588cecf68880e534484dc150c16be15689d5b74b37361e00b56ef8', '[\"*\"]', '2024-05-13 09:54:26', NULL, '2024-05-07 10:20:57', '2024-05-13 09:54:26'),
(23, 'App\\Models\\User', 9, 'qbidapi', '82fd173e5a27cd8fe3d423d17ffdfa39e49dcf5116c96435088318ca0017b32c', '[\"*\"]', '2024-05-29 19:42:33', NULL, '2024-05-10 17:25:49', '2024-05-29 19:42:33'),
(24, 'App\\Models\\User', 1, 'app_api', '193662b5863ca946f668fe298d02fa9c13a8bcc3ccd4e09981f51f3b3c1ee2db', '[\"*\"]', '2024-05-13 09:59:00', NULL, '2024-05-13 09:57:13', '2024-05-13 09:59:00'),
(25, 'App\\Models\\User', 1, 'app_api', 'b18b46b21aff0345d1d061b1a60dee0aa7abeb3584b3d596712fe13e8f99a0b6', '[\"*\"]', '2024-05-13 16:13:09', NULL, '2024-05-13 10:00:30', '2024-05-13 16:13:09'),
(26, 'App\\Models\\User', 7, 'app_api', '2c2d568e8000ceba850f5304adc453e06aa5e87575c122ed0e40659d3b4a83bb', '[\"*\"]', NULL, NULL, '2024-05-13 10:09:48', '2024-05-13 10:09:48'),
(27, 'App\\Models\\User', 7, 'app_api', '0dabcef79f70508a12b71209e23a03b319df37b8c512faf6c4bece0de41321e9', '[\"*\"]', '2024-05-13 12:17:58', NULL, '2024-05-13 11:17:08', '2024-05-13 12:17:58'),
(28, 'App\\Models\\User', 7, 'app_api', 'c682e029da2b6a18a750a5f2f76eb1e21e6b474ff449596be95314954f6bbed9', '[\"*\"]', '2024-05-13 12:24:55', NULL, '2024-05-13 12:24:31', '2024-05-13 12:24:55'),
(29, 'App\\Models\\User', 7, 'app_api', '80652f8ad0e346a57cb7f8e533e7e471cb2bf0d4e7524beb1bbd4fa1b20eeb5c', '[\"*\"]', '2024-05-13 13:23:14', NULL, '2024-05-13 12:27:39', '2024-05-13 13:23:14'),
(30, 'App\\Models\\User', 7, 'app_api', '6a5cd8c2d0cfd60121f03852ea6c5339f374a52a18c778f0664a660ac993903b', '[\"*\"]', NULL, NULL, '2024-05-13 13:25:02', '2024-05-13 13:25:02'),
(31, 'App\\Models\\User', 7, 'app_api', '97203f947b0857f7b01adcdf1e3fc8508c918b49e008c3319fe9e61aeaf36022', '[\"*\"]', NULL, NULL, '2024-05-13 13:27:05', '2024-05-13 13:27:05'),
(32, 'App\\Models\\User', 7, 'app_api', 'a96f84f7e24ebfd52b8ba8b1a08ef5414555cd59db2cf29c912f7533ace76a6f', '[\"*\"]', NULL, NULL, '2024-05-13 13:27:46', '2024-05-13 13:27:46'),
(33, 'App\\Models\\User', 7, 'app_api', 'c4a164989a623ca5e93abbc7c3989a471b4ee4b11e375cf89fb3e5bbee98dc2d', '[\"*\"]', NULL, NULL, '2024-05-13 13:36:35', '2024-05-13 13:36:35'),
(34, 'App\\Models\\User', 7, 'app_api', '225d50807a76bafa4634cfc67a0b77f8a37ea41fad10612a948c5e0f544e87af', '[\"*\"]', NULL, NULL, '2024-05-13 13:49:25', '2024-05-13 13:49:25'),
(35, 'App\\Models\\User', 7, 'app_api', '26c7d7870bb8096be197901b3c9b289477fc6817be4aadfdc222898c7af4d9c5', '[\"*\"]', NULL, NULL, '2024-05-13 13:49:38', '2024-05-13 13:49:38'),
(36, 'App\\Models\\User', 7, 'app_api', '517f1abaa74cd7225b9bb7a470ce71847a55508b2f0f1cfed94c5e26d63b9319', '[\"*\"]', NULL, NULL, '2024-05-13 13:50:55', '2024-05-13 13:50:55'),
(37, 'App\\Models\\User', 7, 'app_api', 'f1f190d5e798cd864531cb76906133a0133d49d40cd6fbac0d359251670b6e05', '[\"*\"]', NULL, NULL, '2024-05-13 13:51:04', '2024-05-13 13:51:04'),
(38, 'App\\Models\\User', 7, 'app_api', '32ecc73e8650c54cd3b3586e179f69ac1410c538cb51c4dee1c0fef284000446', '[\"*\"]', '2024-05-13 13:57:38', NULL, '2024-05-13 13:51:35', '2024-05-13 13:57:38'),
(39, 'App\\Models\\User', 8, 'app_api', 'd5e601290311be43fee59acdca1bca105eb5694b1efc23ad3c1eb0f0fd95dd91', '[\"*\"]', '2024-05-21 20:28:50', NULL, '2024-05-13 15:22:57', '2024-05-21 20:28:50'),
(40, 'App\\Models\\User', 10, 'qbidapi', '4739c880b4b6fa5884e8de3b7d88a6f9bf52120ef172eb8fd807d07de1c00722', '[\"*\"]', NULL, NULL, '2024-05-16 12:51:18', '2024-05-16 12:51:18'),
(41, 'App\\Models\\User', 11, 'qbidapi', 'c5f17f0ea2ad7907024bcc28fa9fe0e44970db8f515a436ac946f00f2c586b5f', '[\"*\"]', NULL, NULL, '2024-05-16 12:54:04', '2024-05-16 12:54:04'),
(42, 'App\\Models\\User', 12, 'qbidapi', '103390e9c6855f78db63a59576ffc360e31c7dc5dd19edb3fca4bfe028b6fc48', '[\"*\"]', NULL, NULL, '2024-05-16 12:56:35', '2024-05-16 12:56:35'),
(43, 'App\\Models\\User', 13, 'qbidapi', '06d5e1fea995c34ab2915ebdbd4f448f0be18556af04993d341205220ed188af', '[\"*\"]', NULL, NULL, '2024-05-16 13:01:34', '2024-05-16 13:01:34'),
(44, 'App\\Models\\User', 14, 'qbidapi', '3057e4c0b8796af323cc3bcca1e1f8e06177fc836450b727aabff7158b860130', '[\"*\"]', NULL, NULL, '2024-05-16 13:01:47', '2024-05-16 13:01:47'),
(45, 'App\\Models\\User', 15, 'qbidapi', '125431455864fe944813a421dee50d7de01e25d8e753ce2cf7f0492140e2a326', '[\"*\"]', NULL, NULL, '2024-05-16 13:02:20', '2024-05-16 13:02:20'),
(46, 'App\\Models\\User', 16, 'qbidapi', 'b831c36b1e82b3a8e78f1ca81add8846b5676c465f9eea26af3a1ab7a68d25d8', '[\"*\"]', NULL, NULL, '2024-05-16 13:03:50', '2024-05-16 13:03:50'),
(47, 'App\\Models\\User', 17, 'qr_code api', '4f0493a89a2531f136b741885d6226194c223800ff55a7af0640aadbe622f0ae', '[\"*\"]', NULL, NULL, '2024-05-16 13:04:24', '2024-05-16 13:04:24'),
(48, 'App\\Models\\User', 18, 'qr_code api', '9dde146e78f274840a70bb3a61284e663d2533b6cdda19828e0af2d99b718712', '[\"*\"]', NULL, NULL, '2024-05-16 13:04:34', '2024-05-16 13:04:34'),
(49, 'App\\Models\\User', 19, 'qr_code api', '7a6ee4e364f2d2e30fb193185febe18aa088e39b71b4d48023fe6255d6e22dad', '[\"*\"]', NULL, NULL, '2024-05-16 13:05:18', '2024-05-16 13:05:18'),
(50, 'App\\Models\\User', 20, 'qr_code api', 'fb469ab3c48a2089675bddb51e2ecffea4302637a7533a7c06c4d3dc97de4f3c', '[\"*\"]', NULL, NULL, '2024-05-16 13:05:28', '2024-05-16 13:05:28'),
(51, 'App\\Models\\User', 21, 'qbidapi', '117a65d7b5bd7431808359b212213228e882b9dcb2c742aa93101240b81956ae', '[\"*\"]', NULL, NULL, '2024-05-16 13:05:54', '2024-05-16 13:05:54'),
(52, 'App\\Models\\User', 22, 'qbidapi', '220582c4fc2475f43cebd91dfdd076d4720855d14d2cdda28076d27c6e626134', '[\"*\"]', NULL, NULL, '2024-05-16 13:06:21', '2024-05-16 13:06:21'),
(53, 'App\\Models\\User', 23, 'qbidapi', 'd191976ddaafaf08989bdaa0044f193dfb661e3ec2140dd0785756967a7374c1', '[\"*\"]', '2024-05-16 17:51:02', NULL, '2024-05-16 17:49:23', '2024-05-16 17:51:02'),
(54, 'App\\Models\\User', 10, 'app_api', '67f46d67b64bdb909c30beeea73b33b04e846a3ba8d57396677d175de604cf9f', '[\"*\"]', '2024-05-16 18:29:58', NULL, '2024-05-16 18:28:50', '2024-05-16 18:29:58'),
(55, 'App\\Models\\User', 10, 'app_api', '0fbb58605f7d961bf77fb7d7730e25e8ad33546e43f84b04ec394437622d79c5', '[\"*\"]', '2024-05-16 18:44:20', NULL, '2024-05-16 18:43:56', '2024-05-16 18:44:20'),
(56, 'App\\Models\\User', 24, 'qbidapi', 'a2d18d3d5505ede3ca4d459e1ae22a843b45b5948ef56a2ee038951ca5119268', '[\"*\"]', '2024-05-16 18:59:50', NULL, '2024-05-16 18:59:32', '2024-05-16 18:59:50'),
(57, 'App\\Models\\User', 25, 'qbidapi', '23d9cbe8118a3dc96fe7567afd7ca9204ded5fcab574bca6c013d169e9385a80', '[\"*\"]', NULL, NULL, '2024-05-17 08:00:58', '2024-05-17 08:00:58'),
(58, 'App\\Models\\User', 25, 'app_api', '192a82af995327c4f05b3175b02533796a2768f0e32564cc870e752534dc2119', '[\"*\"]', '2024-05-17 16:56:40', NULL, '2024-05-17 09:04:55', '2024-05-17 16:56:40'),
(59, 'App\\Models\\User', 25, 'app_api', '3a052cdc18f63851dec33cd6bd063ce20f000fd4f778d69f906423b4aa590746', '[\"*\"]', NULL, NULL, '2024-05-17 09:04:55', '2024-05-17 09:04:55'),
(60, 'App\\Models\\User', 7, 'app_api', 'a25bf697723f839eef1618a845e5fc0afa7ae51e6e2d73826247950e04392c23', '[\"*\"]', NULL, NULL, '2024-05-20 14:10:08', '2024-05-20 14:10:08'),
(61, 'App\\Models\\User', 7, 'app_api', '58852c23e9a150e17f8552ec0078bafb3fd32128c40534f73ee4d164c237eeae', '[\"*\"]', '2024-05-20 14:42:11', NULL, '2024-05-20 14:41:18', '2024-05-20 14:42:11'),
(62, 'App\\Models\\User', 7, 'app_api', '8d2c2ac3a1923e42f2b90334ddd5eb92e42e328112ab36b9a375342b24ba4849', '[\"*\"]', NULL, NULL, '2024-05-20 14:44:44', '2024-05-20 14:44:44'),
(63, 'App\\Models\\User', 26, 'qbidapi', '04b1a589524273faf5b1361e056117555c82c3ea7cbf5c5525119c73d8ea707e', '[\"*\"]', NULL, NULL, '2024-05-20 14:49:38', '2024-05-20 14:49:38'),
(64, 'App\\Models\\User', 7, 'app_api', '28f977a21c2c9ef9026ef97dad6ffd5a2631eb24db1b621b138545bc1705e439', '[\"*\"]', NULL, NULL, '2024-05-20 14:52:01', '2024-05-20 14:52:01'),
(65, 'App\\Models\\User', 7, 'app_api', '3771914df5f7128b1aa643cbaa7dc41c6abeeefa614f832246114e3aa1a95d98', '[\"*\"]', '2024-05-29 13:45:44', NULL, '2024-05-20 15:53:32', '2024-05-29 13:45:44'),
(66, 'App\\Models\\User', 8, 'app_api', 'b6bf07dc421f907452332f105d351cbfdef1d97333102f2942192550d5da2778', '[\"*\"]', '2024-05-21 20:35:07', NULL, '2024-05-21 20:34:59', '2024-05-21 20:35:07'),
(67, 'App\\Models\\User', 8, 'app_api', 'e4a2c97136f01b0b93517bb6f5294d97878c1b29a76564dbdaebf3e2b0c585f3', '[\"*\"]', '2024-05-22 18:51:59', NULL, '2024-05-21 20:46:48', '2024-05-22 18:51:59'),
(68, 'App\\Models\\User', 8, 'app_api', 'a3ec644eb9614989bd113926fc05552b44062f6816662f05d55c5fa05e9e8fb9', '[\"*\"]', '2024-05-24 17:31:35', NULL, '2024-05-22 18:57:12', '2024-05-24 17:31:35'),
(69, 'App\\Models\\User', 7, 'app_api', '63e6814d1c070ff133056c009e581d91d82e17468268a7c3e3624c091121dc95', '[\"*\"]', NULL, NULL, '2024-05-23 08:13:29', '2024-05-23 08:13:29'),
(70, 'App\\Models\\User', 7, 'app_api', '6eed3caa4f70adce41edf1b4de13834e5804757e2a4006b444954991799395e0', '[\"*\"]', '2024-05-23 08:16:01', NULL, '2024-05-23 08:13:29', '2024-05-23 08:16:01'),
(71, 'App\\Models\\User', 7, 'app_api', '70204be3d6bcf5c08e8a1e4244ad31d1fd2cfc3b2c4322eb8d5a4e88def14bca', '[\"*\"]', NULL, NULL, '2024-05-23 08:16:25', '2024-05-23 08:16:25'),
(72, 'App\\Models\\User', 7, 'app_api', 'a4ea5b7dac3bd076365407dc79e15b5229fdda717d260473c2c0931ab83748a9', '[\"*\"]', '2024-05-24 07:55:29', NULL, '2024-05-24 07:16:45', '2024-05-24 07:55:29'),
(73, 'App\\Models\\User', 8, 'app_api', '8cb5b8d005c09c1f18f7dc270295c2cbfbf2ed08cc421044e2b35b7877ea7078', '[\"*\"]', '2024-06-01 20:40:49', NULL, '2024-05-25 22:21:03', '2024-06-01 20:40:49'),
(74, 'App\\Models\\User', 27, 'qbidapi', '9c9836e68ef4a4909f4b7ce8c6e436d7334f3329045e2923334b00830e59e688', '[\"*\"]', '2024-05-29 15:56:38', NULL, '2024-05-29 14:15:19', '2024-05-29 15:56:38'),
(75, 'App\\Models\\User', 1, 'app_api', '478de1b6d3f6b005af37ead286ced935ac0f5b5302592df81552a30c0769d9d6', '[\"*\"]', '2024-05-30 13:12:12', NULL, '2024-05-30 12:30:47', '2024-05-30 13:12:12'),
(76, 'App\\Models\\User', 1, 'app_api', '31ba27269856145c271ca17a9b104fb64411f672a125d6dbf74ed9fbbe43fab5', '[\"*\"]', '2024-05-30 13:11:53', NULL, '2024-05-30 12:31:00', '2024-05-30 13:11:53'),
(77, 'App\\Models\\User', 1, 'app_api', '115f9d2e87caaa404ac501af0ba422641ecdb834a6211eef8a9dd6652e339ff7', '[\"*\"]', '2024-05-31 15:17:18', NULL, '2024-05-30 15:19:18', '2024-05-31 15:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `p_d_f_s`
--

CREATE TABLE `p_d_f_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `filename` text DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `qr_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_d_f_s`
--

INSERT INTO `p_d_f_s` (`id`, `user_id`, `file`, `filename`, `path`, `type`, `qr_name`, `created_at`, `updated_at`) VALUES
(131, '7', NULL, 'F71758F6-489D-4E39-9253-1D96F0E540FB.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/f4ac798da1a8e6c824532577554b1421.jpg', 'image', NULL, '2024-05-13 12:29:48', '2024-05-13 12:29:48'),
(132, '7', NULL, 'F71758F6-489D-4E39-9253-1D96F0E540FB.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/f4ac798da1a8e6c824532577554b1421.jpg', 'image', NULL, '2024-05-13 12:29:48', '2024-05-13 12:29:48'),
(133, '7', NULL, 'BD443768-D2FD-4F11-AC4A-423B7053B35C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/77ff0d581d1083ecb28e37704e87e0b1.jpg', 'image', NULL, '2024-05-13 12:38:49', '2024-05-13 12:38:49'),
(134, '7', NULL, 'BD443768-D2FD-4F11-AC4A-423B7053B35C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/77ff0d581d1083ecb28e37704e87e0b1.jpg', 'image', NULL, '2024-05-13 12:38:49', '2024-05-13 12:38:49'),
(135, '7', NULL, 'BD443768-D2FD-4F11-AC4A-423B7053B35C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/d228467ac25a3fd921f5e66f67c69b89.jpg', 'image', NULL, '2024-05-13 12:38:50', '2024-05-13 12:38:50'),
(136, '7', NULL, 'BABB2B5E-D50E-4D8B-91A5-424BC2A28C2C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/8cc4f0fb691a36db0ff766f698e3e2b3.jpg', 'image', NULL, '2024-05-13 13:00:15', '2024-05-13 13:00:15'),
(137, '7', NULL, 'BABB2B5E-D50E-4D8B-91A5-424BC2A28C2C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/8cc4f0fb691a36db0ff766f698e3e2b3.jpg', 'image', NULL, '2024-05-13 13:00:15', '2024-05-13 13:00:15'),
(138, '7', NULL, '1EB63726-69B8-42A1-8522-CF5221CBF130.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/136f054f46a197cad138757356f335b7.jpg', 'image', NULL, '2024-05-13 13:01:29', '2024-05-13 13:01:29'),
(139, '7', NULL, '1EB63726-69B8-42A1-8522-CF5221CBF130.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/136f054f46a197cad138757356f335b7.jpg', 'image', NULL, '2024-05-13 13:01:29', '2024-05-13 13:01:29'),
(140, '7', NULL, '1EB63726-69B8-42A1-8522-CF5221CBF130.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/ff36d8f6a59824d0c837f96e4e29904b.jpg', 'image', NULL, '2024-05-13 13:01:30', '2024-05-13 13:01:30'),
(141, '7', NULL, 'C4ACA336-F90E-4C27-9C42-93034F7EC492.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/b2f60d17bc01b06f8a978f1518f7805b.jpg', 'image', NULL, '2024-05-13 13:04:07', '2024-05-13 13:04:07'),
(142, '7', NULL, 'C4ACA336-F90E-4C27-9C42-93034F7EC492.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/b2f60d17bc01b06f8a978f1518f7805b.jpg', 'image', NULL, '2024-05-13 13:04:07', '2024-05-13 13:04:07'),
(143, '7', NULL, 'EA4CB1DB-2E0A-41B0-ABE8-1C48FC203B93.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/9be9348d63e8c45b56840ee5b5cdd921.jpg', 'image', NULL, '2024-05-13 13:06:16', '2024-05-13 13:06:16'),
(144, '7', NULL, 'EA4CB1DB-2E0A-41B0-ABE8-1C48FC203B93.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/9be9348d63e8c45b56840ee5b5cdd921.jpg', 'image', NULL, '2024-05-13 13:06:16', '2024-05-13 13:06:16'),
(145, '7', NULL, 'A3E5B1AA-BACA-4321-A3B9-205642700DF2.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/70243d5cb0d3e06a4ef998f908807391.jpg', 'image', 'beautiull', '2024-05-13 13:07:46', '2024-05-13 13:07:46'),
(146, '7', NULL, 'A3E5B1AA-BACA-4321-A3B9-205642700DF2.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/f922793bed7761a7fdbdec0f3af7f174.jpg', 'image', 'beautifull', '2024-05-13 13:08:02', '2024-05-13 13:08:02'),
(147, '7', NULL, 'A3E5B1AA-BACA-4321-A3B9-205642700DF2.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/f922793bed7761a7fdbdec0f3af7f174.jpg', 'image', 'beautifull', '2024-05-13 13:08:02', '2024-05-13 13:08:02'),
(148, '7', NULL, 'D4530913-48DB-4E17-B75F-41466D5D992A.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/c4fc46a3ae2969d248d224181f3a39a9.jpg', 'image', 'wow', '2024-05-13 13:09:04', '2024-05-13 13:09:04'),
(149, '7', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/0e76ebe53a14c14868057f42a466549c.pdf', 'pdf', 'pdf file here', '2024-05-13 13:15:43', '2024-05-13 13:15:43'),
(150, '7', NULL, '9B3E2E12-7796-43C4-9428-282FF34F0A25.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/1171276be4d2396f8615c57ed9df538a.jpg', 'image', 'image', '2024-05-13 13:22:19', '2024-05-13 13:22:19'),
(151, '7', NULL, '9B3E2E12-7796-43C4-9428-282FF34F0A25.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/1171276be4d2396f8615c57ed9df538a.jpg', 'image', 'image', '2024-05-13 13:22:19', '2024-05-13 13:22:19'),
(152, '7', NULL, '9B3E2E12-7796-43C4-9428-282FF34F0A25.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/1171276be4d2396f8615c57ed9df538a.jpg', 'image', 'image', '2024-05-13 13:22:19', '2024-05-13 13:22:19'),
(159, '23', NULL, '7232B96C-AA27-41AD-8481-3A2238F71847.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/c915c2c156fd964dc4db6db43eb61a72.jpg', 'image', '145', '2024-05-16 17:50:07', '2024-05-16 17:50:07'),
(160, '10', NULL, 'AE673E19-7325-4953-9DE7-F560DCB39BFF.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/d83dbd8671ce72ed46b6e0d39c39e78a.jpg', 'image', 'ncnddb', '2024-05-16 18:29:58', '2024-05-16 18:29:58'),
(161, '10', NULL, 'AE673E19-7325-4953-9DE7-F560DCB39BFF.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/d83dbd8671ce72ed46b6e0d39c39e78a.jpg', 'image', 'ncnddb', '2024-05-16 18:29:58', '2024-05-16 18:29:58'),
(162, '10', NULL, '53FAD757-7D60-4114-A548-E50325F9728E.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/15ce8a5df507ac6b5e7a55d3aea945b0.jpg', 'image', 'dhddhhdhd', '2024-05-16 18:44:20', '2024-05-16 18:44:20'),
(163, '24', NULL, 'FE21AD6D-7DD1-4814-8B39-BF919F5206B8.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/8601f3d5415a70a2c2359ed1e62c2adc.jpg', 'image', 'bhh', '2024-05-16 18:59:50', '2024-05-16 18:59:50'),
(164, '25', NULL, '2ABB31C9-6044-4B46-B9CF-5FF750101641.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/346ed43d774e025ed44062eb116a74b0.jpg', 'image', 'image code', '2024-05-17 09:29:07', '2024-05-17 09:29:07'),
(165, '25', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/8269a0a6d23ddaa2806f30a6e6a655b0.pdf', 'pdf', 'pdf code', '2024-05-17 09:29:33', '2024-05-17 09:29:33'),
(166, '25', NULL, 'A206FF05-8DD6-4972-8147-133C70BD2D91.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/af951aa8c78d30cea33bac54da1da5c3.jpg', 'image', 'hhhhh', '2024-05-17 09:30:22', '2024-05-17 09:30:22'),
(167, '7', NULL, '0D930CAA-523D-444A-B1A3-6B70E44CABF7.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/b81a19faead336f627e83ea1ed40d537.jpg', 'image', 'helloooooo', '2024-05-20 15:55:15', '2024-05-20 15:55:15'),
(168, '7', NULL, '0D930CAA-523D-444A-B1A3-6B70E44CABF7.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/413b1c0734b355e69e1368c840c04d3c.jpg', 'image', 'helloooooo', '2024-05-20 15:55:17', '2024-05-20 15:55:17'),
(169, '7', NULL, '8C3AE925-F6A2-429B-96A7-2445CC884784.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/27757007e0f5e1c5cc490168a142cb96.jpg', 'image', 'image genrate', '2024-05-20 16:01:07', '2024-05-20 16:01:07'),
(170, '7', NULL, '8C3AE925-F6A2-429B-96A7-2445CC884784.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/c6b938ad6c9ee44ffd5836c37b49361b.jpg', 'image', 'image genrate', '2024-05-20 16:01:08', '2024-05-20 16:01:08'),
(171, '7', NULL, '8C3AE925-F6A2-429B-96A7-2445CC884784.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/c6b938ad6c9ee44ffd5836c37b49361b.jpg', 'image', 'image genrate', '2024-05-20 16:01:08', '2024-05-20 16:01:08'),
(172, '7', NULL, 'A1B61D2B-9C23-47EA-84A9-0141D1F06DCB.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/b5d264b3499c356d656d572177530fa0.jpg', 'image', 'g', '2024-05-20 16:01:42', '2024-05-20 16:01:42'),
(173, '7', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/959546ee243bc6e0be1d1a5f65501c8b.pdf', 'pdf', '[pdf', '2024-05-20 16:02:59', '2024-05-20 16:02:59'),
(174, '7', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/581c7c97f9b8261b13f92eac6de47f70.pdf', 'pdf', '[pdf', '2024-05-20 16:03:22', '2024-05-20 16:03:22'),
(183, '9', NULL, 'F3EF3739-2CC9-43F2-96D8-A24469035359.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/1763167ba929564b23cf1ef8b4676a7b.jpg', 'image', 'Versace Eros', '2024-05-22 20:12:00', '2024-05-22 20:12:00'),
(186, '7', NULL, '17D1633B-2644-4259-85D4-287ED48EB588.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/28d7a65ee9e5f5e7746fed562b00f50c.jpg', 'image', 'hhhhhh', '2024-05-24 07:53:41', '2024-05-24 07:53:41'),
(187, '7', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/d643ba01e00d7d50c254358e1cd47c2b.pdf', 'pdf', 'ooooo', '2024-05-24 07:53:58', '2024-05-24 07:53:58'),
(192, '9', NULL, '0646F4EA-B73E-4213-BD36-BDB730C0FD47.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/6ac244e4c9c9fee5edf3e1406e9fc763.jpg', 'image', 'erios', '2024-05-25 20:41:53', '2024-05-25 20:41:53'),
(194, '8', NULL, '9C85DC74-3ACF-4370-B199-E1483A6C37E7.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/f285e3a047a9d0f0edfe6f7505a2a1db.jpg', 'image', 'time to go', '2024-05-25 22:23:14', '2024-05-25 22:23:14'),
(195, '8', NULL, '830925AF-2CD7-4B9A-9984-58D1FC02C453.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/52fa36107bf6ffe98246c2bd04223b30.jpg', 'image', 'vacation', '2024-05-26 19:18:23', '2024-05-26 19:18:23'),
(196, '27', NULL, '2F9968F1-FFFB-4743-B952-484EFA165175.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/8d2a8acbff9b50b3c7c17f450ef4d707.jpg', 'image', 'dhgsg', '2024-05-29 14:31:27', '2024-05-29 14:31:27'),
(197, '27', NULL, '778D1DC2-49F9-42CD-ADFA-E66AF7909A0C.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/2c9cd1958353bfe3d1ab620f12c56d65.jpg', 'image', 'image', '2024-05-29 15:33:57', '2024-05-29 15:33:57'),
(198, '27', NULL, '23DD6043-E8A1-489A-AB52-B6E2C43B797D.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/bb433907a5a298a0fb1b3a80d01e5c35.jpg', 'image', 'image', '2024-05-29 15:41:02', '2024-05-29 15:41:02'),
(199, '27', NULL, 'file-sample_150kB.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/4892d5d953656f7700c252f04f62380c.pdf', 'pdf', 'pdf test', '2024-05-29 15:56:16', '2024-05-29 15:56:16'),
(200, '9', NULL, 'F7D9E7E8-E75D-4F79-81FC-DB0EC3F9FE88.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/c6e24d706f01bb475823323cdaebe617.jpg', 'image', 'Digit Phone', '2024-05-29 19:41:57', '2024-05-29 19:41:57'),
(201, '9', NULL, 'C63435FA-E88F-4D08-A915-5A79C8B2854D.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/0061be2b2382c243fcbca98f77be3bbd.jpg', 'image', 'laptop', '2024-05-29 19:42:33', '2024-05-29 19:42:33'),
(202, '8', NULL, '69CF87E3-1957-44A7-8957-53C1FC126DF9.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/63021e4cdcc8a6b6a64448514d3d49af.jpg', 'image', 'Brooklyn', '2024-05-29 22:38:17', '2024-05-29 22:38:17'),
(203, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/a346e98d22dc9f89f2c0e06cbde51f0a.pdf', 'pdf', 'pdf file here', '2024-05-31 09:13:58', '2024-05-31 09:13:58'),
(204, '1', NULL, '737BB479-9108-4950-804E-F3FBB36F3007.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/b50fa5c30f16fef56c7019e046139616.jpg', 'image', '78987897985', '2024-05-31 09:18:19', '2024-05-31 09:18:19'),
(205, '1', NULL, 'C477D677-4A89-4BA4-925D-054D916F46CC.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/497ee32f891d1d010fb0b39018c5d694.jpg', 'image', 'image', '2024-05-31 11:20:11', '2024-05-31 11:20:11'),
(206, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/f29b95dc834ac98ac8daaaa38382c464.pdf', 'pdf', 'pdf', '2024-05-31 11:20:48', '2024-05-31 11:20:48'),
(207, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/016b78e6004ca91bb2cd1541dd67d777.pdf', 'pdf', 'pdf', '2024-05-31 11:27:29', '2024-05-31 11:27:29'),
(208, '1', NULL, '63946047-ABA7-4558-9402-3EBF29832FC4.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/75111ef49834bf014c9c360ad44eedf4.jpg', 'image', 'hjhkjhjkkjik', '2024-05-31 12:27:44', '2024-05-31 12:27:44'),
(209, '1', NULL, '0DBD90D0-6C1E-4482-8F85-9D4A7BFA5C42.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/9e5877d39df13f0514e544cd03df8fce.jpg', 'image', 'image', '2024-05-31 14:30:23', '2024-05-31 14:30:23'),
(210, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/8d1900c8db878efdc49e64f14a5d1bfd.pdf', 'pdf', 'pdf', '2024-05-31 14:32:28', '2024-05-31 14:32:28'),
(211, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/bc488e313b2bfa005884756016f0e368.pdf', 'pdf', 'pdf', '2024-05-31 14:33:42', '2024-05-31 14:33:42'),
(212, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/c4f0d600fc6a7cdb40c2aeffb88fce98.pdf', 'pdf', 'kkkkkk', '2024-05-31 14:35:16', '2024-05-31 14:35:16'),
(213, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/88731f5f3d2387ab1a7b2bfc50ac9b65.pdf', 'pdf', 'dsdasdas', '2024-05-31 14:38:55', '2024-05-31 14:38:55'),
(214, '1', NULL, '5497FCB6-3860-43FD-81E7-0D02B383703D.jpg', 'https://qrcode.ad-wize.net/uploads/pdf/49aa262a0ed88b7130b1ba6fb24454cd.jpg', 'image', 'image', '2024-05-31 14:39:15', '2024-05-31 14:39:15'),
(215, '1', NULL, '15432B8A-B269-48A6-9AFC-EE35CCB376B6.png', 'https://qrcode.ad-wize.net/uploads/pdf/a1e54d88f2a0d2f1a3c4315546fc68df.png', 'image', 'image', '2024-05-31 15:08:27', '2024-05-31 15:08:27'),
(216, '1', NULL, 'Get_Started_With_Smallpdf.pdf', 'https://qrcode.ad-wize.net/uploads/pdf/02c1ee1f6f9a7c2b86fd19145b5729fa.pdf', 'pdf', 'pdf', '2024-05-31 15:08:51', '2024-05-31 15:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_texts`
--

CREATE TABLE `url_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `qr_name` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url_texts`
--

INSERT INTO `url_texts` (`id`, `user_id`, `text`, `type`, `qr_name`, `created_at`, `updated_at`) VALUES
(31, 7, 'https://www.google.com/search?q=flower+images&oq=flower+images&gs_lcrp=EgZjaHJvbWUyDAgAEEUYORixAxiABDINCAEQABiDARixAxiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDINCAUQABiDARixAxiABDIHCAYQABiABDIHCAcQABiABDIHCAgQABiABDIHCAkQABiABNIBCDQzMThqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8', 'url', NULL, '2024-05-13 12:29:21', '2024-05-13 12:29:21'),
(32, 7, 'https://www.google.com/search?q=flower+images&oq=flower+images&gs_lcrp=EgZjaHJvbWUyDAgAEEUYORixAxiABDINCAEQABiDARixAxiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDINCAUQABiDARixAxiABDIHCAYQABiABDIHCAcQABiABDIHCAgQABiABDIHCAkQABiABNIBCDQzMThqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8', 'url', NULL, '2024-05-13 12:29:21', '2024-05-13 12:29:21'),
(33, 7, 'text here', 'text', NULL, '2024-05-13 12:30:11', '2024-05-13 12:30:11'),
(34, 7, 'gladgfagf', 'text', 'text', '2024-05-13 13:16:47', '2024-05-13 13:16:47'),
(35, 7, 'https://www.google.com/search?q=flower+images&oq=flower+images&gs_lcrp=EgZjaHJvbWUyDAgAEEUYORixAxiABDINCAEQABiDARixAxiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDINCAUQABiDARixAxiABDIHCAYQABiABDIHCAcQABiABDIHCAgQABiABDIHCAkQABiABNIBCDQzMThqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8', 'url', 'link here', '2024-05-13 13:23:14', '2024-05-13 13:23:14'),
(36, 25, 'https://www.google.com/search?q=flower+images&oq=flower+&gs_lcrp=EgZjaHJvbWUqBggBEEUYOzIGCAAQRRg5MgYIARBFGDsyDQgCEAAYkgMYgAQYigUyCggDEAAYkgMYgAQyCggEEAAYsQMYgAQyDQgFEAAYgwEYsQMYgAQyCggGEAAYsQMYgAQyBwgHEAAYgAQyDQgIEAAYgwEYsQMYgAQyBwgJEAAYjwLSAQgzNzk2ajBqN6gCCLACAQ&sourceid=chrome&ie=UTF-8', 'url', 'link code', '2024-05-17 09:28:39', '2024-05-17 09:28:39'),
(37, 25, 'text here', 'text', 'text code', '2024-05-17 09:29:57', '2024-05-17 09:29:57'),
(38, 7, 'https://www.youtube.com/watch?v=TlgumE2xe_E', 'url', 'test link', '2024-05-20 15:54:24', '2024-05-20 15:54:24'),
(39, 7, 'text link hjkfkdkfjdjkf', 'text', 'test link', '2024-05-20 15:57:56', '2024-05-20 15:57:56'),
(40, 7, 'fgghjfgjhsdghjfg fgsjfgjhgjdfhsdgfhjsg', 'text', 'test', '2024-05-20 15:58:45', '2024-05-20 15:58:45'),
(41, 7, 'ethers heresy hjhkjhf dkjfhkjdfhkfh isj', 'text', 'qr', '2024-05-24 07:33:29', '2024-05-24 07:33:29'),
(42, 7, 'sdfsfsdf', 'text', 'dsfdfdsf', '2024-05-24 07:33:46', '2024-05-24 07:33:46'),
(43, 7, 'https://www.google.com/search?q=flower+image&oq=flower+image+&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQABiABDIGCAIQRRg7MgcIAxAAGIAEMgcIBBAAGIAEMgcIBRAAGIAEMgcIBhAAGIAEMgcIBxAAGIAEMgcICBAAGIAEMgcICRAAGIAE0gEINjE2MmowajeoAgiwAgE&sourceid=chrome&ie=UTF-8#vhid=E3cXFT-hJSkf6M&vssid=l', 'url', 'hello', '2024-05-24 07:51:37', '2024-05-24 07:51:37'),
(44, 7, 'asdghjklqwertyuiopzxcbmn', 'text', 'text', '2024-05-24 07:54:27', '2024-05-24 07:54:27'),
(45, 27, 'tddffjdfjxxjxjxugxuxufxufj', 'text', 'test text', '2024-05-29 15:48:13', '2024-05-29 15:48:13'),
(46, 27, 'https://www.youtub.com', 'url', 'url test', '2024-05-29 15:54:17', '2024-05-29 15:54:17'),
(47, 1, 'dasdasdasdasd', 'text', 'asdsd', '2024-05-30 13:03:44', '2024-05-30 13:03:44'),
(48, 1, 'wwqqweqw', 'text', 'ewqwewq', '2024-05-30 13:07:45', '2024-05-30 13:07:45'),
(49, 1, 'gggdfsdsdfff', 'text', 'sdfsdfsdfsfd', '2024-05-30 13:08:35', '2024-05-30 13:08:35'),
(50, 1, 'Etewtruyewuyrterytwtexttextsy', 'text', 'text', '2024-05-31 10:57:47', '2024-05-31 10:57:47'),
(51, 1, 'xzczxczxczxczxczcc', 'text', 'text', '2024-05-31 10:58:31', '2024-05-31 10:58:31'),
(52, 1, 'ghjgjhfgjghgjhdghas', 'text', 'text', '2024-05-31 11:00:24', '2024-05-31 11:00:24'),
(53, 1, 'https://www.youtube.com/', 'url', 'url here', '2024-05-31 11:06:47', '2024-05-31 11:06:47'),
(55, 1, 'https://www.youtube.com/', 'url', 'dhsjdhjkhdkjahsjdhks', '2024-05-31 11:12:00', '2024-05-31 11:12:00'),
(56, 1, 'https://jsonformatter.curiousconcept.com/#', 'url', '1254', '2024-05-31 11:15:20', '2024-05-31 11:15:20'),
(57, 1, 'https://www.youtube.com/', 'url', '852', '2024-05-31 11:18:17', '2024-05-31 11:18:17'),
(58, 1, 'gjhjhjgjhghgjhghtext', 'text', 'text', '2024-05-31 11:25:22', '2024-05-31 11:25:22'),
(59, 1, '789654123olpikmnj', 'text', 'text', '2024-05-31 11:26:41', '2024-05-31 11:26:41'),
(60, 1, 'textttext', 'text', 'text', '2024-05-31 11:28:20', '2024-05-31 11:28:20'),
(61, 1, 'hdhhgdhghdfdfg', 'text', 'text', '2024-05-31 11:29:46', '2024-05-31 11:29:46'),
(62, 1, 'https://www.youtube.com/', 'url', 'dgsduysgduygs', '2024-05-31 11:31:38', '2024-05-31 11:31:38'),
(63, 1, 'ghosthghjgh', 'text', '852', '2024-05-31 11:41:27', '2024-05-31 11:41:27'),
(64, 1, 'https://www.youtube.com/', 'url', 'link', '2024-05-31 14:31:04', '2024-05-31 14:31:04'),
(65, 1, 'https://www.youtube.com/', 'url', 'ink', '2024-05-31 14:36:43', '2024-05-31 14:36:43'),
(66, 1, 'sdsdasdasd', 'text', 'text', '2024-05-31 14:37:50', '2024-05-31 14:37:50'),
(67, 1, 'https://www.youtube.com/', 'url', 'data', '2024-05-31 14:38:40', '2024-05-31 14:38:40'),
(68, 1, 'https://oblador.github.io/react-native-vector-icons/', 'url', 'hhhhhhh', '2024-05-31 15:06:11', '2024-05-31 15:06:11'),
(69, 1, 'text dhfhkjhfkjkdjfhjdhfjkdf', 'text', 'text here', '2024-05-31 15:09:30', '2024-05-31 15:09:30'),
(70, 1, 'ghhgfgfhfghhfhgfghfghg', 'text', 'kkkk', '2024-05-31 15:11:47', '2024-05-31 15:11:47'),
(71, 1, 'https://qrcode.ad-wize.net/uploads/pdf/b50fa5c30f16fef56c7019e046139616.jpg', 'url', 'kkkk', '2024-05-31 15:17:18', '2024-05-31 15:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `company_name`, `email`, `phone`, `email_verified_at`, `email_code`, `password`, `address`, `city`, `state`, `zip`, `photo`, `role`, `status`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'jhon', NULL, NULL, 'user@gmail.com', NULL, '2024-04-04 03:55:19', NULL, '$2y$10$2BCJOcQbbxzZNduYobg6FOKBl6tkM.c8Rg4LVZWFrphDnhUhPAzoC', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/3ad3cef7cb1e36cc08e7426947e83262PayMefirst.jpg', 'user', 'active', NULL, '2024-04-04 03:55:19', '2024-05-30 15:18:54', NULL, NULL, NULL, NULL),
(2, 'fsdfs', NULL, NULL, 'a@gmail.com', NULL, '2024-04-04 09:59:06', NULL, '$2y$10$1.43xdehuEjtjk7oEYCk5uxZwn.jFrcg7siDMBQRx6Xg0AJS5VZ9S', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/213ba0868c0c71594f0226113f5394aaPayMefirst.jpg', 'user', 'active', NULL, '2024-04-04 09:59:06', '2024-04-04 10:48:41', NULL, NULL, NULL, NULL),
(3, 'jhon', NULL, NULL, 'userr@gmail.com', '341346354', '2024-04-04 10:15:18', NULL, '$2y$10$t1QR2yduYN2PGbnyY0tvOubQpwJlTTZe6MsToaAYFpv8qMvu/Wzd6', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-04-04 10:15:18', '2024-04-04 10:15:18', NULL, NULL, NULL, NULL),
(4, 'buser', NULL, NULL, 'b@gmail.com', NULL, '2024-04-05 09:28:13', NULL, '$2y$10$eFOJlw7D.GVolyxTMWXzgO3SPz3KO47s23lhauTImHc4FkMhm8dPW', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/147366f23a4d7f06c16ec6277d056c3aPayMefirst.jpg', 'user', 'active', NULL, '2024-04-05 09:28:13', '2024-04-08 05:25:59', NULL, NULL, NULL, NULL),
(5, 'Nora Miller', NULL, NULL, 'nora.miller@digitalneststudio.com', NULL, '2024-04-26 21:02:54', NULL, '$2y$10$qaJGabrNOB4PDqB4laWz/eNcnnzJ/reKmWgEgJIIFc5PlyFuCNS4S', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-04-26 21:02:54', '2024-04-26 21:02:54', NULL, NULL, NULL, NULL),
(6, 'chris', NULL, NULL, 'chris@gmail.com', NULL, '2024-04-29 09:56:22', NULL, '$2y$10$kz/PPlNFIb5xt72gUfO5SeOxNHHuEROma38ZEgPsG/46RA0QC0Ame', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-04-29 09:56:22', '2024-04-29 09:56:22', NULL, NULL, NULL, NULL),
(7, 'alex', NULL, NULL, 'alex@gmail.com', NULL, '2024-04-29 14:40:21', NULL, '$2y$10$RgyqazxZ4NBZD97hQyL1bOurDluvkx9AI.PwNPGCxzjNkHdiGpwwK', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/9843ad8b11dd6cb99a4856b92fc20097jpg', 'user', 'active', NULL, '2024-04-29 14:40:21', '2024-05-23 08:18:30', NULL, NULL, NULL, NULL),
(8, 'Rich', NULL, NULL, 'richard3649@gmail.com', NULL, '2024-05-04 00:49:07', NULL, '$2y$10$O7qTQ8dwtV9uqQM3M9IVQefKuOVF9tHN0i7tJBVrzsBi3.qimoKpO', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-04 00:49:07', '2024-05-04 00:49:07', NULL, NULL, NULL, NULL),
(9, 'Nora Miller', NULL, NULL, 'misha.ali.khan6@gmail.com', NULL, '2024-05-10 17:25:49', NULL, '$2y$10$HpxjMh4mJUFK3L1ONhOlmusjOZ.ujADHjY6KQgKuQ2OXdnMc9p.4m', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-10 17:25:49', '2024-05-22 20:03:37', NULL, NULL, NULL, NULL),
(10, 'test user', NULL, NULL, 'tuser@gmail.com', NULL, '2024-05-16 12:51:18', NULL, '$2y$10$ACO2d76LGzRu6aqzM9jYvOGd0UpWPMb1po8EhHYO8ZgESVOoEbEUq', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 12:51:18', '2024-05-16 12:51:18', NULL, NULL, NULL, NULL),
(11, 'test user', NULL, NULL, 'tuser1@gmail.com', NULL, '2024-05-16 12:54:04', NULL, '$2y$10$ezH7ImydtOjhmmjcYLNo9ORTrqFkqkzXTUlSld3c4yGLovxic4..O', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/840c509417c6ff1e9057aa798a5bd0b9jpg', 'user', 'active', NULL, '2024-05-16 12:54:04', '2024-05-16 12:54:04', NULL, NULL, NULL, NULL),
(12, 'test', NULL, NULL, 'tt@gmail.com', NULL, '2024-05-16 12:56:35', NULL, '$2y$10$cQq7nFR3N6YrErXLkWpRSuoHd1EpEIeoE8NBt8kKeweEaavK.2rFy', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 12:56:35', '2024-05-16 12:56:35', NULL, NULL, NULL, NULL),
(13, 'test', NULL, NULL, 'tt1@gmail.com', NULL, '2024-05-16 13:01:34', NULL, '$2y$10$rqn5orM6E9ONZ4tVyqNbteizXtqT7M2bolHh0MsqT5eSgBZqJ1AE.', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/12816f3676606dea93da4d66f0ece40fjpg', 'user', 'active', NULL, '2024-05-16 13:01:34', '2024-05-16 13:01:34', NULL, NULL, NULL, NULL),
(14, 'test', NULL, NULL, 'tt12@gmail.com', NULL, '2024-05-16 13:01:47', NULL, '$2y$10$W5s2WZnQaN/Q67YjCbOpsOq2L9BK3e4kqB/92J6I.J//jdA9WVnm6', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/82127eb18be0b58d1febfa42283ef690jpg', 'user', 'active', NULL, '2024-05-16 13:01:47', '2024-05-16 13:01:47', NULL, NULL, NULL, NULL),
(15, 'jhon', NULL, NULL, 'userer@gmail.com', '341346354', '2024-05-16 13:02:20', NULL, '$2y$10$NhsbRcUaFiYhtXNnmm3dTuNYprF8L85GzJcXmI7Fv5VumcKHyXLqe', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:02:20', '2024-05-16 13:02:20', NULL, NULL, NULL, NULL),
(16, 'jhon', NULL, NULL, 'usereer@gmail.com', '341346354', '2024-05-16 13:03:50', NULL, '$2y$10$FH89mJlzFZ/kd.gJPz3kp.TtSEOTm31vZHp5Sypsdbz59wvyQB2be', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:03:50', '2024-05-16 13:03:50', NULL, NULL, NULL, NULL),
(17, 'jhon', NULL, NULL, 'usereaer@gmail.com', '341346354', '2024-05-16 13:04:24', NULL, '$2y$10$2a8Lkt7DmbNxiFphGZly8eZRy3XRN4XfSzt3YJFvexS7gIJ.pZfIy', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:04:24', '2024-05-16 13:04:24', NULL, NULL, NULL, NULL),
(18, 'jhon', NULL, NULL, 'usereaer@gmail.comd', '341346354', '2024-05-16 13:04:34', NULL, '$2y$10$DwAKHmfYox3nEP2I.0SekODQAOz/LsBA4pU7dB7ln9yRiUpem.Jc6', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:04:34', '2024-05-16 13:04:34', NULL, NULL, NULL, NULL),
(19, 'jhon', NULL, NULL, 'usereaer@gmail.comds', '341346354', '2024-05-16 13:05:18', NULL, '$2y$10$P9yvfeorLk2I4UENsR94hefKcRIsbe3a.cEVGYPCcxO./wTnrqMxm', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:05:18', '2024-05-16 13:05:18', NULL, NULL, NULL, NULL),
(20, 'jhon', NULL, NULL, 'usereaer@gmail.comdsd', '341346354', '2024-05-16 13:05:28', NULL, '$2y$10$PTFehSI31TJwl6dF8qPgUehbamP/rBOgwElnH8M/o2u7fxo0eZqIa', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:05:28', '2024-05-16 13:05:28', NULL, NULL, NULL, NULL),
(21, 'jhon', NULL, NULL, 'usereaer@gmail.comdsda', '341346354', '2024-05-16 13:05:54', NULL, '$2y$10$md48mBBYmeLPiFmjEuLelea5nXdmblWcQ8.benWLZzC1m1ze4XWd6', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-16 13:05:54', '2024-05-16 13:05:54', NULL, NULL, NULL, NULL),
(22, 'test', NULL, NULL, 'tt123@gmail.com', NULL, '2024-05-16 13:06:21', NULL, '$2y$10$LjN8sE1B8LNq0tXhmh.U3O1MulhYfK8F/csfyssFEavwyVjmysSia', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/666c88f9fb8b476f78e2df3a269bd94cjpg', 'user', 'active', NULL, '2024-05-16 13:06:21', '2024-05-16 13:06:21', NULL, NULL, NULL, NULL),
(23, 'd', NULL, NULL, 'd@gmail.com', NULL, '2024-05-16 17:49:23', NULL, '$2y$10$b003FM127mWnYr9MgJxizOZyTMJdvdMcKFgy4SeE6dVbRTn6mXRuW', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/2659cb5d766c0206309ff26dbfeda039jpg', 'user', 'active', NULL, '2024-05-16 17:49:23', '2024-05-16 17:49:23', NULL, NULL, NULL, NULL),
(24, 'cnd', NULL, NULL, 'z@gmail.com', NULL, '2024-05-16 18:59:32', NULL, '$2y$10$CBktPHHf3DZ/B7nloefn8OZH7mmy9/NNSDRjzrSJfsStOWMcWCTou', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/4a276aa6ab0a2b9c11c1a525df877d0bjpg', 'user', 'active', NULL, '2024-05-16 18:59:32', '2024-05-16 18:59:32', NULL, NULL, NULL, NULL),
(25, 'hello', NULL, NULL, 'hello@gmail.com', NULL, '2024-05-17 08:00:58', NULL, '$2y$10$lghxEh0ONWRmOz2/Ihomk.hPMMeOaAXXtFdh7E.HHPMmT5bae3XN.', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-17 08:00:58', '2024-05-17 08:00:58', NULL, NULL, NULL, NULL),
(26, 'eva', NULL, NULL, 'eva@gmail.con', NULL, '2024-05-20 14:49:38', NULL, '$2y$10$1I.NG3Ap9e1dJ12k3evpteUx2QV41kTKY2kqvBOkTgb93UbZRiy8S', NULL, NULL, NULL, NULL, NULL, 'user', 'active', NULL, '2024-05-20 14:49:38', '2024-05-20 14:49:38', NULL, NULL, NULL, NULL),
(27, 'a', NULL, NULL, 'ab@gmail.com', NULL, '2024-05-29 14:15:19', NULL, '$2y$10$MmnZ0FqX4t3oIxfcnpsv0eh8amy9xrngeQLObkY.9uFGEMWVkbDyW', NULL, NULL, NULL, NULL, 'https://qrcode.ad-wize.net/uploads/user/profiles/9738cdd679d90114db666afda1a3013ejpg', 'user', 'active', NULL, '2024-05-29 14:15:19', '2024-05-29 14:15:19', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `p_d_f_s`
--
ALTER TABLE `p_d_f_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `url_texts`
--
ALTER TABLE `url_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `p_d_f_s`
--
ALTER TABLE `p_d_f_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `url_texts`
--
ALTER TABLE `url_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
