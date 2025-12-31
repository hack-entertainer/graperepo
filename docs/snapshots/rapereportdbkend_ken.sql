-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2025 at 11:29 AM
-- Server version: 5.7.44
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rapereportdbkend_ken`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum is', 'lorem-ipsum-is', '/storage/photos/1/Banner/banner-01.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'active', '2020-08-14 01:47:38', '2020-08-14 01:48:21'),
(2, 'Lorem Ipsum', 'lorem-ipsum', '/storage/photos/1/Banner/banner-07.jpg', '<p>Up to 90%</p>', 'active', '2020-08-14 01:50:23', '2020-08-14 01:50:23'),
(4, 'Banner', 'banner', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2020-08-17 20:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(4, 7, 2, 2, 1939.03, 'new', 1, 1939.03, '2020-08-14 22:13:51', '2020-08-14 22:14:59'),
(10, 10, NULL, 2, 270.00, 'new', 1, 270.00, '2020-08-17 21:07:33', '2020-08-17 21:17:03'),
(11, 9, NULL, 2, 190.00, 'new', 3, 580.00, '2020-08-17 21:08:35', '2025-05-06 10:43:10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Fashion', 'mens-fashion', NULL, '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2020-08-14 04:26:15'),
(2, 'Women\'s Fashion', 'womens-fashion', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2020-08-14 04:26:40'),
(3, 'Kid\'s', 'kids', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2020-08-14 04:27:42'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2020-08-14 04:32:14'),
(5, 'Jeans pants', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2020-08-14 04:32:49'),
(6, 'Sweater & Jackets', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2020-08-14 04:33:37'),
(7, 'Rain Coats & Trenches', 'rain-coats-trenches', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:34:04', '2020-08-14 04:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL),
(5, 'abcd', 'fixed', 250.00, 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', NULL, '2020-08-17 21:15:12', '2020-08-17 21:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2023_06_21_164432_create_jobs_table', 2),
(23, '2025_05_28_152152_create_reports_table', 2),
(24, '2025_05_28_173316_add_reporter_info_to_reports_table', 3),
(25, '2025_05_29_213441_create_report_responses_table', 4),
(26, '2025_05_30_050643_add_file_path_to_report_responses', 5),
(27, '2025_05_30_111828_create_report_comments_table', 6),
(28, '2025_05_30_121009_add_payment_fields_to_report_comments', 7),
(29, '2025_06_23_102224_add_subject_and_event_address_fields_to_reports_table', 8),
(30, '2025_06_23_111426_add_subject_contact_fields_to_reports_table', 8),
(31, '2025_06_23_133348_add_credits_comment_fields_to_users_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-PMIQF5MYPK', NULL, 14399.00, 1, 573.90, 13925.10, 6, 'cod', 'unpaid', 'delivered', 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9800887778', 'NP', '44600', 'Koteshwor', 'Kathmandu', '2020-08-14 07:20:44', '2020-08-14 09:37:37'),
(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-14 22:14:49', '2020-08-14 22:15:19'),
(3, 'ORD-1CKWRWTTIK', NULL, 200.00, 1, NULL, 300.00, 1, 'paypal', 'paid', 'process', 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9807009999', 'NP', '44600', 'Kathmandu', 'Kadaghari', '2020-08-15 06:40:49', '2020-08-17 20:52:40'),
(4, 'ORD-HVO0KX0YHW', NULL, 23660.00, 3, 150.00, 23910.00, 6, 'paypal', 'paid', 'new', 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9800098878', 'NP', '44600', 'Pokhara', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'ABSOLUTE AND COMPLETE REQUIREMENT FOR  REPORTING UNDER ONE’S OWN NAME', 'absolute-and-complete-requirement-for-reporting-under-ones-own-name', '<p>Every Report on RapeReportDB.com must be made under the Actual Name of the Person to Whom the Sexual Violence or Misconduct was committed.</p><div><br></div>', '<p>Every Report on RapeReportDB.com must be made under the Actual Name of the Person to Whom the Sexual Violence or Misconduct was committed.</p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>The Reason for this strict, no-Exceptions Policy of requiring all Reports to be made under The Reporter’s own Name is instituted and enforced for the express purpose of reducing, and eventually hopefully eliminating (at some point in the future), the Stigma that is now ascribed -- altogether-unfittingly and -improperly, IMHO -- in our current culture to Persons Subjected to Acts of Sexual Violence or Misconduct.</span></p><div><br></div>', NULL, 'http://localhost/storage/photos/1/09_25_42 PM.png', '', 7, NULL, NULL, 'active', '2025-05-30 07:30:07', '2025-05-30 07:30:18'),
(8, 'NOMENCLATURE  -  (Definitions and Usage of Words and Phrases)', 'nomenclature-definitions-and-usage-of-words-and-phrases', '<p>As you may have noticed, pronouns can cause some problems.</p><div><br></div>', '<p>As you may have noticed, pronouns can cause some problems.</p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>I don’t like the word Victim, mostly because I sense some resistance among Victims to the word. --- Thus, I try to avoid the use of the word Victim.</span></p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>Victims are thus referred to as Reporters, Rapees or Persons Subjected to Acts of Sexual Violence or Misconduct.&nbsp;&nbsp;</span></p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>I also don’t like the word Rapist. --- The reason why I don’t like the word Rapist is because the word Rapist has the suffix “–ist” at the end of it. --- This suffix -- “-ist” -- is currently a part of the word “Rapist” precisely because Rape used to have a Good Connotation (which the “–ist” suffix otherwise Connotes). --- Around 300 years ago, this was apparently true.</span></p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>Well, it certainly isn’t true anymore. --- Rapers are not anything good or possessed of even the slightest socially-redeeming value. --- Rapers should be Identified and Shunned from decent society.</span></p><p><br></p><p><span style=\"white-space: normal;\"><span style=\"white-space:pre\">	</span>Rapers are referred to, in the alternative, as Report Subjects or simply Subjects, or else Sexual Deviates or Deviants.</span></p><div><br></div>', '<p><br></p>', NULL, '', 7, NULL, NULL, 'active', '2025-05-30 07:33:02', '2025-05-30 07:33:02'),
(9, 'PREFERRED STYLE OF REPORTING: -- CLINICAL & PROFESSIONAL', 'preferred-style-of-reporting-clinical-professional', '<p>Although I am not requiring it absolutely, I strongly urge all Reporters to Report in as fact-based and emotion-free a manner as they possibly can</p>', '<p>Although I am not requiring it absolutely, I strongly urge all Reporters to Report in as fact-based and emotion-free a manner as they possibly can. --- The reason for this is my Firm Belief that the most Clinical Description is the most persuasive. --- Name-Calling is strongly discouraged at all times, by all Parties and Commenters.</p><p><span style=\"white-space: pre;\">	</span>Language should be as clinical as possible. --- Our Species’ Primary and Secondary Sex Characteristics are known as: the Vagina, the Penis, the Breasts, the Mouth and the Anus. --- Colloquialisms for these body parts, or any other body parts, for that matter, are disfavored and discouraged at all times.</p><p><span style=\"white-space: pre;\">	</span>There is an important exception to this Policy of Discouraging Emotional, Name-Calling or Non-Clinical language: -- Anything that the Raper says that is relevant in the slightest way to the Rape or other Sexual Misconduct NOT ONLY CAN BE REPORTED, BUT SHOULD BE REPORTED.&nbsp;&nbsp;</p><p>Statements made by Deviants that are Audible to the Persons they Subject to Acts of Sexual Violence or Misconduct during the Commission of their Rapes or other Misconduct are properly known as CONFESSIONS;&nbsp; and CONFESSIONS Absolutely and Un-Equivocally Should be Reported in all Cases wherein they occur, with the greatest detail that the Reporter can possibly muster.</p><p><span style=\"white-space: pre;\">	</span>The account of the Rape given by the Rapee, however, should always, to the extent reasonably-practical, maintain the clinical, un-emotional tone that best serves the Adjudication Process.</p>', NULL, NULL, '', 7, NULL, NULL, 'active', '2025-05-30 07:35:32', '2025-05-30 07:36:28'),
(10, 'Culture of Presumptive Belief of Reporters', 'culture-of-presumptive-belief-of-reporters', '<p>The Culture of this Site is that Reporters are presumptively believed.&nbsp; Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</p>', '<p>The Culture of this Site is that Reporters are presumptively believed.&nbsp; Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</p><p><br></p><p>At bottom, Verdicts after Trial will be decided by means of popular Vote of Registered non-Parties. --- This is essentially Trial by Jury, where the Jury is the Participating Public.</p><p><br></p><p>Motions will be Decided by Paralegals providing Adjudication Services in return for being Paid by RapeReportDB.com, according to the Federal Rules of Civil Procedure and the Federal Rules of Evidence, taking Full Note of the results of Public Votes on said Motions..</p><p><br></p><p>Reporters, and Subjects who Answer, BOTH bear the burden of proving their Allegations via the submission of Admissible Evidence.</p><div><br></div>', NULL, NULL, '', 7, NULL, NULL, 'active', '2025-05-30 07:40:48', '2025-05-30 07:40:48'),
(11, 'PROCESS FOR PRIVATE, LIMITED, QUASI-JUDICIAL REDRESS OF GRIEVANCES ARISING FROM ACTS OF SEXUAL VIOLENCE AND / OR SEXUAL MISCONDUCT', 'process-for-private-limited-quasi-judicial-redress-of-grievances-arising-from-acts-of-sexual-violence-and-or-sexual-misconduct', '<p>The Private, Limited process that RapeReportDB.com will provide is</p>', '<p>The Private, Limited process that RapeReportDB.com will provide is</p><p>deliberately modeled after the legal due process rendered in Civil Courts across our</p><p>Country every weekday of the year.</p><p><br></p><p>10</p><p>The Civil Litigation process begins with the Filing of a Summons and</p><p>Complaint. --- Here, the Complaint is your Written Report posted on the site. ---</p><p>The Complaint must be Written, in the first instance.</p><p><br></p><p>The Reporter must Report all known information about the Identity and</p><p>Location of the Raper or other Sexual Deviant, in order to best achieve the specific</p><p>objective of informing the Raper or other Sexual Deviant of the Report that has</p><p>been made against them.</p>', NULL, NULL, '', 7, NULL, NULL, 'active', '2025-06-23 14:48:14', '2025-06-23 14:48:38'),
(12, 'Participation in Private System of Adjudication is Never Required, but Non- Participation Carries the Possibility of Grant of Motions to Dismiss', 'participation-in-private-system-of-adjudication-is-never-required-but-non-participation-carries-the-possibility-of-grant-of-motions-to-dismiss', '<p>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to</p>', '<p>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to</p><p>Participate at any time beyond the Original Report. --- Participation in the Private</p><p>Adjudication process is something I always hope for – not least because I make</p><p>more money that way – BUT IS NEVER REQUIRED.</p><p><br></p><p>HOWEVER, one of the Motions permitted under the Federal Rules of Civil</p><p>Procedure are Motions to Dismiss (F.R. Civ. P. Rule 12). --- Motions to Dismiss</p><p><br></p><p>11</p><p>by Subjects that are NOT RESPONDED TO will result in a Notation on that</p><p>Report in the RapeReportDB.com Database that a Motion to Dismiss has been</p><p>Granted for Failure to Participate in the Adjudication of said Motion to Dismiss.</p>', NULL, NULL, '', 7, NULL, NULL, 'active', '2025-06-23 14:49:15', '2025-06-23 14:49:29'),
(13, 'Reports, once Posted, are Never Removed, Motions to Dismiss that are Granted are Noted in Report Data', 'reports-once-posted-are-never-removed-motions-to-dismiss-that-are-granted-are-noted-in-report-data', '<p>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED.---&nbsp;<span style=\"font-size: 1rem;\">Motions to Dismiss that are Granted</span></p>', '<p>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED. ---</p><p>Motions to Dismiss that are Granted are Noted in the Report Data (just like all</p><p>other Motions are), but Reports themselves ARE NEVER REMOVED from the</p><p>Database.</p><p><br></p><p>(Posting in-Perpetuity will require Additional Fees from Reporters in future</p><p>years to maintain their Report on the Database. --- This Fee is currently $12 per</p><p>year, and is subject to increase beginning on January 1 st , 2027, for Reports Posted</p><p>after that date.)</p><p><br></p><p>12</p><p>Once the Report has been Posted, and at least attempted to be delivered, then</p><p>comes the Answer from those Report Subjects who can be identified and Served</p><p>with the Report who Choose to Answer.</p><p><br></p><p>After the Answer is Filed, Replies from the Reporter, and Sur-Replies from</p><p>the Subject of the Report are Permitted.</p><p><br></p><p>Then, the Processes of Motions and Discovery begin, ending, where</p><p>possible, with a Trial. --- Trials, when they happen, will be via Zoom, Teams or</p><p>other, similar Video Service.</p><p><br></p><p>Judgments will be rendered via Jury Verdict, with Registered non-Parties</p><p>Voting on the Verdict. --- Motions will be decided by Paralegals, Fully-</p><p>Independent-of, but taking Equally-Full Note-of the Vote of Registered non-Party</p><p>Users of RapeReportDB.com.</p><p><br></p><p>The Justice that I offer will be Real, and Just.</p><p><br></p><p>13</p><p>The Rules will be those of the Federal Rules of Civil Procedure and the</p><p>Federal Rules of Evidence, modified as necessary and appropriate for the purpose</p><p>of the private Web-based Adjudications that I now Offer.</p><p><br></p><p>(Where there is Conflict between the United States Circuit Courts of Appeal</p><p>on any Issue where there is NO Controlling Precedent from the United States</p><p>Supreme Court, the Precedent from the Second Circuit shall Control on that issue.)</p><p><br></p><p>If the Raper or other Sexual Deviant should choose to Answer, then the</p><p>Reporter will, of course, have the right to Reply to any Answer Filed by the</p><p>Subject of the Report.</p><p><br></p><p>Although Video Reporting is Offered, and is presumptively Evidence</p><p>Admissible at Trial, Written Pleadings will always be required, at least in the first</p><p>instance, specifically in order to best enable the Publication and Research</p><p>Functions designed-into this Site.</p><p><br></p><p>Essentially, there is a Jury, and it is the Entire User Community of the Site,</p><p>which is open to all citizens of our Planet.</p>', NULL, NULL, '', 7, NULL, NULL, 'active', '2025-06-23 14:50:17', '2025-06-23 14:51:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Rules on the site', 'rules-on-the-site', 'active', '2025-05-30 07:23:10', '2025-05-30 07:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Melange Casual Black', 'melange-casual-black', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 1, 4, 4, '2020-08-14 04:38:26', '2020-08-14 04:42:46'),
(2, 'White Sports Casual T-', 'white-sports-casual-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/1d60f-2.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 04:40:21', '2020-08-14 06:26:01'),
(3, 'Summer Round Neck T', 'summer-round-neck-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 2, NULL, 2, '2020-08-14 05:57:48', '2020-08-14 05:57:48'),
(4, 'Melange Ethnic Kurthi', 'melange-ethnic-kurthi', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, 0, 2, NULL, 1, '2020-08-14 06:04:13', '2020-08-14 06:04:13'),
(5, 'Cotton High Quality Kurt', 'cotton-high-quality-kurt', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/086c2-a1.jpg,/storage/photos/1/Products/09a16-mpd000t_6.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, 0, 3, NULL, 3, '2020-08-14 06:10:52', '2020-08-14 09:37:36'),
(6, 'Ladies Cotton Kurti Sha', 'ladies-cotton-kurti-sha', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/6a8b5-wsd013t.jpg,/storage/photos/1/Products/5ded8-image1xxl-5-.jpg,/storage/photos/1/Products/74840-image4xxl-6-.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, 1, 3, NULL, 4, '2020-08-14 06:13:20', '2020-08-14 06:31:42'),
(7, 'GRAY BABY ROMPERS', 'gray-baby-rompers', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/08ec9-n3.jpg,/storage/photos/1/Products/07e30-mtk006b.jpg,/storage/photos/1/Products/18b18-wbk003b.jpg', 0, 'L', 'hot', 'active', 1999.00, 3.00, 0, 3, NULL, 1, '2020-08-14 06:23:33', '2020-08-14 22:15:19'),
(8, 'Baby Girls\' 2-Piece Yell', 'baby-girls-2-piece-yell', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/calvin-klein.jpg,/storage/photos/1/Products/calvin.jpg,/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg', 1, 'S', 'new', 'active', 200.00, 0.00, 0, 3, NULL, 2, '2020-08-14 06:25:42', '2020-08-14 09:37:36'),
(9, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04776-pms000a.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, 0, 2, NULL, 3, '2020-08-15 06:52:44', '2020-08-15 06:53:14'),
(10, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply-2008183507-655', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.&nbsp;</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 3, 'L,XL', 'hot', 'active', 300.00, 10.00, 0, 1, 4, 3, '2020-08-17 20:50:07', '2020-08-17 20:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, 9, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reporter_id` bigint(20) UNSIGNED NOT NULL,
  `reporter_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reporter_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` date NOT NULL,
  `event_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_reporter_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('unpaid','paid','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_comment` int(11) NOT NULL DEFAULT '0',
  `subject_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `reporter_id`, `reporter_name`, `reporter_email`, `type_event`, `description`, `event_date`, `event_location`, `video_link`, `subject_fullname`, `subject_location`, `alternate_reporter_name`, `report_number`, `status`, `is_paid`, `payment_status`, `paid_at`, `created_at`, `updated_at`, `subject_address`, `subject_city`, `subject_state`, `subject_zipcode`, `subject_country`, `event_address`, `event_city`, `event_state`, `event_zipcode`, `event_country`, `video_path`, `letter_path`, `total_comment`, `subject_email`, `subject_phone`) VALUES
(3, 2, 'Steve Nguyen', 'user@gmail.com', 'Rape', 'Smith Jane repeatedly made threatening remarks and publicly humiliated me during meetings. This has continued over several months, creating an unbearable working environment.', '2025-05-28', 'NY, USA', 'https://www.youtube.com/watch?v=7oqk_L1b4D4', 'Smith Jane', 'NY, USA', NULL, '2025-RRDB-6839F9BDDE42C', 'pending', 1, 'paid', '2025-05-30 18:32:29', '2025-05-30 18:32:29', '2025-05-30 18:32:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(4, 36, 'Karen Thomas', 'karenthomas@gmail.com', 'Sexual Harassment', 'During multiple team interactions,  David Parker made sexually suggestive jokes and comments directed at me. Despite my requests to stop, the behavior continued and made me feel unsafe.', '2025-05-27', 'Albany, NY, USA', 'https://www.youtube.com/watch?v=Egsp7JM8-Ds', 'David Parker', 'Albany, NY, USA', NULL, '2025-RRDB-6839FEC01B5DE', 'pending', 1, 'paid', '2025-05-30 18:53:52', '2025-05-30 18:53:52', '2025-05-30 18:53:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(5, 38, 'Jacksmith', 'jacksmith@yopmail.com', 'Rape', 'test', '2025-06-04', NULL, NULL, 'John Doe', 'Somerset NJ usa', NULL, '2025-RRDB-684B023BA57A3', 'pending', 1, 'paid', '2025-06-12 16:37:15', '2025-06-12 16:37:15', '2025-06-12 16:37:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(6, 39, 'Steven William', 'stevenwilliam@yopmail.com', 'Rape', 'this is a  test', '2025-06-02', NULL, 'https://www.youtube.com/watch?v=X4my07dsyrw', 'David Shon', 'New York city, NY USA', NULL, '2025-RRDB-684B24A907FA6', 'pending', 1, 'paid', '2025-06-12 19:04:09', '2025-06-12 19:04:09', '2025-06-12 19:04:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_comments`
--

CREATE TABLE `report_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `user_fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('unpaid','paid','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_comments`
--

INSERT INTO `report_comments` (`id`, `user_id`, `report_id`, `user_fullname`, `content`, `is_paid`, `payment_status`, `paid_at`, `created_at`, `updated_at`) VALUES
(2, 34, 3, 'Emily Brown', 'This situation seems serious. Is there any HR involvement?', 1, 'paid', '2025-05-30 18:45:11', '2025-05-30 18:45:11', '2025-05-30 18:45:11'),
(3, 35, 3, 'Michael Lee', 'I think we need to hear more from other colleagues before making a judgment.', 1, 'paid', '2025-05-30 18:49:00', '2025-05-30 18:49:00', '2025-05-30 18:49:00'),
(4, 2, 4, 'Steve Nguyen', 'The evidence provided seems compelling. I vote in favor of the Reporter.', 1, 'paid', '2025-05-30 19:05:43', '2025-05-30 19:05:43', '2025-05-30 19:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `report_responses`
--

CREATE TABLE `report_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `user_fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('subject_responses','reporter_reply') COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('unpaid','paid','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_responses`
--

INSERT INTO `report_responses` (`id`, `user_id`, `report_id`, `user_fullname`, `type`, `content`, `file_path`, `is_paid`, `payment_status`, `paid_at`, `created_at`, `updated_at`) VALUES
(11, 33, 3, 'Smith Jane', 'subject_responses', 'I strongly deny ever threatening or humiliating the reporter. All my interactions during meetings have been professional and task-focused. If the reporter perceived them otherwise, I regret the misunderstanding.', 'reports_responses/dummy_1748630224.pdf', 1, 'paid', '2025-05-30 18:37:32', '2025-05-30 18:37:32', '2025-05-30 18:37:32'),
(12, 2, 3, 'Steve Nguyen', 'reporter_reply', 'During several team briefings, Smith Jane made sarcastic remarks about my appearance and openly questioned my competence in front of peers.', NULL, 1, 'paid', '2025-05-30 18:41:28', '2025-05-30 18:41:28', '2025-05-30 18:41:28'),
(13, 37, 4, 'David Parker', 'subject_responses', 'I acknowledge we exchanged messages after hours, but they were brief and work-related. I had no intent to cause discomfort and will ensure clearer boundaries moving forward.', 'reports_responses/471569339-10162487268307698-9200908633938096809-n_1748631483.jpg', 1, 'paid', '2025-05-30 18:58:28', '2025-05-30 18:58:28', '2025-05-30 18:58:28'),
(14, 36, 4, 'Karen Thomas', 'reporter_reply', 'I have never made comments about anyone’s accent or background. This claim is completely false. I value diversity and have always treated all colleagues with respect', NULL, 1, 'paid', '2025-05-30 19:03:44', '2025-05-30 19:03:44', '2025-05-30 19:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, '<section data-aos=\"\\&quot;fade-up\\&quot;\" class=\"bg-light py-5\">\r\n  <div class=\"container\">\r\n    <div class=\"card shadow-sm border-0\">\r\n      <div class=\"card-body\">\r\n        <h2 class=\"section-title text-primary mb-4\" style=\"text-transform: uppercase;\">Welcome to RapeReportDB.com</h2>\r\n        <ul class=\"list-unstyled fs-5\" style=\"font-weight: bold;\">\r\n          <li class=\"mb-3\"> My name is John Sovak d-b-a Deviate Report DB.com, and I am the Owner and Operator of RapeReportDB.com</li>\r\n          <li class=\"mb-3\"> Contact Information:</li>\r\n          <li class=\"mb-3\"> E-Mail Address:  <a href=\"mailto:deviateReportdb.com@gmail.com\" style=\"color: #0d6efd;\">DeviateReportDB.com@gmail.com</a> </li>\r\n          <li class=\"mb-3\"> Telephone Number:  <a href=\"tel:+18453571740\" style=\"color: #0d6efd;\">(845) 357-1740</a></li>\r\n          <li class=\"mb-3\"> <small>(Please Note that Phone Calls from Numbers Unknown to me are NOT Answered. --- Initial Inquiries MUST BE via E-Mail.)</small> </li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<section data-aos=\"\\&quot;fade-up\\&quot;\" class=\"bg-light py-5\">\r\n  <div class=\"container\">\r\n    <div class=\"card shadow-sm border-0\">\r\n      <div class=\"card-body\">\r\n        <h2 class=\"section-title text-primary mb-4\"><i class=\"ti-tag\"></i>Purpose of RapeReportDB.com</h2>\r\n        <ul class=\"list-unstyled fs-5\">\r\n          <li class=\"mb-3\"><i class=\"ti-check\"></i> To provide a means for persons to Report any and all experiences that they have experienced involving Sexual Misconduct (e.g., Rape, Sexual Assault, Sexual Abuse and/or Sexual Harassment) committed against them by another person.</li>\r\n          <li class=\"mb-3\"><i class=\"ti-check\"></i> To Provide a means of Private, Limited, Quasi-Judicial Redress for Grievances arising from occurrences of Sexual Violence and/or All Levels and Forms of lesser Sexual Misconduct.</li>\r\n          <li class=\"mb-3\"><i class=\"ti-check\"></i> To Lessen and Ultimately Eliminate the Stigma that Now Attaches to Persons Subject to Acts of Sexual Violence and/or Sexual Misconduct.</li>\r\n          <li class=\"mb-3\"><i class=\"ti-check\"></i> To Create and Maintain the RapeReportDB.com Database as a permanent Data Base, for the Express Purpose of Publicizing, Shunning and Ostracizing All Sexual Predators who Populate our American and Planet Earth Communities.</li>\r\n          <li class=\"mb-3\"><i class=\"ti-check\"></i> To Create, and Continually Enhance, the Social Utility of the RapeReportDB.com Database as a means for the Discernment, Discovery and Identification of Serial, Repeat or other Patterns of Sexual Violence and/or Misconduct, or the Perpetrators thereof.</li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<!-- Start Shop Services Area -->\r\n<section class=\"shop-services section home\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-6 col-md-6 col-12\">\r\n                <!-- Start Single Service -->\r\n                <div class=\"single-service\">\r\n                    <i class=\"ti-rocket\"></i>\r\n                    <h4>Reporter</h4>\r\n                    <p>Persons who report acts of sexual misconduct. Also referred to as Rapees.</p>\r\n                </div>\r\n                <!-- End Single Service -->\r\n            </div>\r\n            <div class=\"col-lg-6 col-md-6 col-12\">\r\n                <!-- Start Single Service -->\r\n                <div class=\"single-service\">\r\n                    <i class=\"ti-reload\"></i>\r\n                    <h4>Subject</h4>\r\n                    <p>Persons accused of sexual misconduct. Also referred to as Deviants.</p>\r\n                </div>\r\n                <!-- End Single Service -->\r\n            </div>\r\n            \r\n        </div>\r\n    </div>\r\n</section>\r\n<!-- End Shop Services Area -->\r\n<section data-aos=\"\\&quot;fade-up\\&quot;\" class=\"aos-init aos-animate\">\r\n  <div class=\"container\">\r\n    <h2 class=\"section-title text-center\">Fees</h2>\r\n    <div class=\"table-responsive\">\r\n      <table class=\"table table-bordered text-center\">\r\n        <thead class=\"table-dark\">\r\n          <tr>\r\n            <th>Service</th>\r\n            <th>Fee (USD)</th>\r\n          </tr>\r\n        </thead>\r\n        <tbody>\r\n          <tr><td>Report / Answer / Reply</td><td>$49.00</td></tr>\r\n          <tr><td>Comment / Vote</td><td>$0.49</td></tr>\r\n          <tr><td>Video Statement</td><td>$29.00</td></tr>\r\n          <tr><td>Physical Letter to Subject</td><td>$29.00</td></tr>\r\n        </tbody>\r\n      </table>\r\n      <center>(Payments are made through the Stripe Payment Platform, so the Prices stated above are subject to an additional 3% plus 30 cents per Transaction to cover Stripe’s Fees. --- So: -- $49.00 = $50.77, actual; -- $12.25 = $12.92, actual; -- $29.00 = $30.17, actual; -- and, finally -- $300 = $309.30, actual.)</center>\r\n    </div>\r\n  </div>\r\n</section>\r\n\r\n<section data-aos=\"\\&quot;fade-up\\&quot;\" class=\"bg-light aos-init aos-animate\">\r\n  <div class=\"container\">\r\n    <h2 class=\"section-title text-center\">A Process of Private, quasi-Judicial Dispute Resolution is also Offered, but is NOT (= NEVER) Required.</h2>\r\n    <p class=\"lead text-center\">A Process of Private, quasi-Judicial Dispute Resolution is also Offered, but is NOT (= NEVER) Required.</p>\r\n    <p class=\"lead text-center\">The system of Private Dispute Resolution that I Offer allows for All Paid Users to participate in the Adjudication of both Motions and Trials via Voting thereon.</p>\r\n    <p class=\"lead text-center\">Independent Paralegals Adjudicate the Motions after Users Vote thereon, and they will also make Rulings at Trial, ALL according to the Federal Rules of Civil Procedure and the Federal Rules of Evidence.\r\n\r\n</p>\r\n  </div>\r\n</section>', '<div><b><u>ABSOLUTE AND COMPLETE REQUIREMENT FOR&nbsp;<span style=\"font-size: 1rem;\">REPORTING UNDER ONE’S OWN NAME</span></u></b></div><div><br></div><div>Every Report on RapeReportDB.com must be made under the Actual Name&nbsp;<span style=\"font-size: 1rem;\">of the Person to Whom the Sexual Violence or Misconduct was committed.</span></div><div><br></div><div>The Reason for this strict, no-Exceptions Policy of requiring all Reports to&nbsp;<span style=\"font-size: 1rem;\">be made under The Reporter’s own Name is instituted and enforced for the express&nbsp;</span><span style=\"font-size: 1rem;\">purpose of reducing, and eventually hopefully eliminating (at some point in the&nbsp;</span><span style=\"font-size: 1rem;\">future), the Stigma that is now ascribed -- altogether-unfittingly and -improperly,&nbsp;</span><span style=\"font-size: 1rem;\">IMHO -- in our current culture to Persons Subjected to Acts of Sexual Violence or&nbsp;</span><span style=\"font-size: 1rem;\">Misconduct.</span></div><div><br></div><div><br></div><div><b><u>NOMENCLATURE - (Definitions and Usage of Words and Phrases)</u></b></div><div><br></div><div>As you may have noticed, pronouns can cause some problems.</div><div><br></div><div>I don’t like the word Victim, mostly because I sense some resistance among&nbsp;<span style=\"font-size: 1rem;\">Victims to the word. --- Thus, I try to avoid the use of the word Victim.</span></div><div><br></div><div>Victims are thus referred to as Reporters, Rapees or Persons Subjected to&nbsp;<span style=\"font-size: 1rem;\">Acts of Sexual Violence or Misconduct.</span></div><div><br></div><div>I also don’t like the word Rapist. --- The reason why I don’t like the word&nbsp;<span style=\"font-size: 1rem;\">Rapist is because the word Rapist has the suffix “–ist” at the end of it. --- This&nbsp;</span><span style=\"font-size: 1rem;\">suffix -- “-ist” -- is currently a part of the word “Rapist” precisely because Rape&nbsp;</span><span style=\"font-size: 1rem;\">used to have a Good Connotation (which the “–ist” suffix otherwise Connotes). ---&nbsp;</span><span style=\"font-size: 1rem;\">Around 300 years ago, this was apparently true.</span></div><div><br></div><div>Well, it certainly isn’t true anymore. --- Rapers are not anything good or&nbsp;<span style=\"font-size: 1rem;\">possessed of even the slightest socially-redeeming value. --- Rapers should be&nbsp;</span><span style=\"font-size: 1rem;\">Identified and Shunned from decent society.</span></div><div><br></div><div>Rapers are referred to, in the alternative, as Report Subjects or simply&nbsp;<span style=\"font-size: 1rem;\">Subjects, or else Sexual Deviates or Deviants.</span></div><div><span style=\"font-size: 1rem;\"><br></span></div><div><br></div><div><b><u>PREFERRED STYLE OF REPORTING: -- CLINICAL &amp;amp; PROFESSIONAL</u></b></div><div><br></div><div>Although I am not requiring it absolutely, I strongly urge all Reporters to&nbsp;&nbsp;<span style=\"font-size: 1rem;\">Report in as fact-based and emotion-free a manner as they possibly can. --- The&nbsp;</span><span style=\"font-size: 1rem;\">reason for this is my Firm Belief that the most Clinical Description is the most&nbsp;</span><span style=\"font-size: 1rem;\">persuasive. --- Name-Calling is strongly discouraged at all times, by all Parties and&nbsp;</span><span style=\"font-size: 1rem;\">Commenters.</span></div><div><br></div><div>Language should be as clinical as possible. --- Our Species’ Primary and&nbsp;<span style=\"font-size: 1rem;\">Secondary Sex Characteristics are known as: the Vagina, the Penis, the Breasts, the&nbsp;</span><span style=\"font-size: 1rem;\">Mouth and the Anus. --- Colloquialisms for these body parts, or any other body&nbsp;</span><span style=\"font-size: 1rem;\">parts, for that matter, are disfavored and discouraged at all times.</span></div><div><br></div><div>There is an important exception to this Policy of Discouraging Emotional,&nbsp;<span style=\"font-size: 1rem;\">Name-Calling or Non-Clinical language: -- Anything that the Raper says that is&nbsp;</span><span style=\"font-size: 1rem;\">relevant in the slightest way to the Rape or other Sexual Misconduct NOT ONLY&nbsp;</span><span style=\"font-size: 1rem;\">CAN BE REPORTED, BUT SHOULD BE REPORTED.</span></div><div><br></div><div>Statements made by Deviants that are Audible to the Persons they Subject to&nbsp;<span style=\"font-size: 1rem;\">Acts of Sexual Violence or Misconduct during the Commission of their Rapes or&nbsp;</span><span style=\"font-size: 1rem;\">other Misconduct are properly known as CONFESSIONS; and CONFESSIONS&nbsp;</span><span style=\"font-size: 1rem;\">Absolutely and Un-Equivocally Should be Reported in all Cases wherein they&nbsp;</span><span style=\"font-size: 1rem;\">occur, with the greatest detail that the Reporter can possibly muster.</span></div><div><br></div><div>The account of the Rape given by the Rapee, however, should always, to the&nbsp;<span style=\"font-size: 1rem;\">extent reasonably-practical, maintain the clinical, un-emotional tone that best&nbsp;</span><span style=\"font-size: 1rem;\">serves the Adjudication Process.&nbsp;</span></div><div><br></div><div><span style=\"font-size: 1rem;\"><br></span><span style=\"font-size: 1rem;\"><b><u>Culture of Presumptive Belief of Reporters</u></b></span></div><div><br></div><div>The Culture of this Site is that Reporters are presumptively believed.&nbsp;<span style=\"font-size: 1rem;\">Subjects of Reports may Answer, if they choose to, and are encouraged to do so.</span></div><div><br></div><div>At bottom, Verdicts after Trial will be decided by means of popular Vote of&nbsp;<span style=\"font-size: 1rem;\">Registered non-Parties. --- This is essentially Trial by Jury, where the Jury is the&nbsp;</span><span style=\"font-size: 1rem;\">Participating Public.</span></div><div><br></div><div>Motions will be Decided by Paralegals providing Adjudication Services in&nbsp;<span style=\"font-size: 1rem;\">return for being Paid by RapeReportDB.com, according to the Federal Rules of&nbsp;</span><span style=\"font-size: 1rem;\">Civil Procedure and the Federal Rules of Evidence, taking Full Note of the results&nbsp;</span><span style=\"font-size: 1rem;\">of Public Votes on said Motions..</span></div><div><br></div><div>Reporters, and Subjects who Answer, BOTH bear the burden of proving&nbsp;<span style=\"font-size: 1rem;\">their Allegations via the submission of Admissible Evidence.</span></div><div><br></div><div><b><u>FEES</u></b></div><div><br></div><div>The Fee for the Posting of a Report to the RapeReportDB.com Database is&nbsp;<span style=\"font-size: 1rem;\">$49. --- The Fee for the Filing of an Answer is also $49. --- The Report and the&nbsp;</span><span style=\"font-size: 1rem;\">Answer are collectively known as the Pleadings part of the litigation process.</span></div><div><br></div><div>Replies (to Answers) by Reporters, and Sur-Replies (to Replies) by Subjects, are&nbsp;<span style=\"font-size: 1rem;\">also permitted during the Pleadings phase, and also cost $49 each.</span></div><div><br></div><div>The Fee to Post a Comment and//or a Vote is $0.49. --- Comments are sold&nbsp;<span style=\"font-size: 1rem;\">in sets of 25, for $12.25, or 100 for $49. --- All Votes and Comments MUST be&nbsp;</span><span style=\"font-size: 1rem;\">Made under the Commenter’s // Voter’s Own Name, just like for Reporters and&nbsp;</span><span style=\"font-size: 1rem;\">Subjects.</span></div><div><br></div><div>Two additional Fees may apply.</div><div><br></div><div>First, the Price to Post a Video Statement is $29. --- Also, in Cases where the&nbsp;<span style=\"font-size: 1rem;\">Reporter has a Physical Address for a Subject, there is also another, separate Fee of&nbsp;</span><span style=\"font-size: 1rem;\">$29 for sending that Subject a Physical Letter to a Physical Address.</span></div><div><br></div><div>(All Fee amounts stated above are the actual amounts collected by&nbsp;<span style=\"font-size: 1rem;\">RapeReportDB.com. --- Persons Filing Reports and Answers and Casting Votes or&nbsp;</span><span style=\"font-size: 1rem;\">Making Comments pay all of the processing fees required to deliver the Net&nbsp;</span><span style=\"font-size: 1rem;\">Amount stated above to the Site. --- All amounts stated are in US Dollars ($).)</span></div><div><br></div><div>(Payments are made through the Stripe Payment Platform, so the Prices&nbsp;<span style=\"font-size: 1rem;\">stated above are subject to an additional 3% plus 30 cents per Transaction to cover&nbsp;</span><span style=\"font-size: 1rem;\">Stripe’s Fees. --- So: -- $49.00 = $50.77, actual; -- $12.25 = $12.92, actual; --&nbsp;</span><span style=\"font-size: 1rem;\">$29.00 = $30.17, actual; -- and, finally -- $300 = $309.30, actual.)</span></div><div><br></div><div><div><b><u>PROCESS FOR PRIVATE, LIMITED, QUASI-JUDICIAL REDRESS OF&nbsp;&nbsp;<span style=\"font-size: 1rem;\">GRIEVANCES ARISING FROM ACTS OF SEXUAL VIOLENCE AND /&nbsp;</span><span style=\"font-size: 1rem;\">OR SEXUAL MISCONDUCT</span></u></b></div><div><br></div><div>The Private, Limited process that RapeReportDB.com will provide is&nbsp;<span style=\"font-size: 1rem;\">deliberately modeled after the legal due process rendered in Civil Courts across our&nbsp;</span><span style=\"font-size: 1rem;\">Country every weekday of the year.</span></div><div><br></div><div>The Civil Litigation process begins with the Filing of a Summons and&nbsp;<span style=\"font-size: 1rem;\">Complaint. --- Here, the Complaint is your Written Report posted on the site. ---&nbsp;</span><span style=\"font-size: 1rem;\">The Complaint must be Written, in the first instance.</span></div><div><br></div><div>The Reporter must Report all known information about the Identity and&nbsp;<span style=\"font-size: 1rem;\">Location of the Raper or other Sexual Deviant, in order to best achieve the specific&nbsp;</span><span style=\"font-size: 1rem;\">objective of informing the Raper or other Sexual Deviant of the Report that has&nbsp;</span><span style=\"font-size: 1rem;\">been made against them.</span></div><div><br></div><div><b><u>Participation in Private System of Adjudication is Never Required, but Non-<span style=\"font-size: 1rem;\">Participation Carries the Possibility of Grant of Motions to Dismiss</span></u></b></div><div><br></div><div>Reporters AND Subjects, BOTH, are UNDER NO OBLIGATION to&nbsp;<span style=\"font-size: 1rem;\">Participate at any time beyond the Original Report. --- Participation in the Private&nbsp;</span><span style=\"font-size: 1rem;\">Adjudication process is something I always hope for – not least because I make&nbsp;</span><span style=\"font-size: 1rem;\">more money that way – BUT IS NEVER REQUIRED.</span></div><div><br></div><div>HOWEVER, one of the Motions permitted under the Federal Rules of Civil&nbsp;<span style=\"font-size: 1rem;\">Procedure are Motions to Dismiss (F.R. Civ. P. Rule 12). --- Motions to Dismiss&nbsp;&nbsp;</span><span style=\"font-size: 1rem;\">by Subjects that are NOT RESPONDED TO will result in a Notation on that&nbsp;</span><span style=\"font-size: 1rem;\">Report in the RapeReportDB.com Database that a Motion to Dismiss has been&nbsp;</span><span style=\"font-size: 1rem;\">Granted for Failure to Participate in the Adjudication of said Motion to Dismiss.</span></div><div><br></div><div>Reports, once Posted, are Never Removed, Motions to Dismiss that are&nbsp;<span style=\"font-size: 1rem;\">Granted are Noted in Report Data</span></div><div><br></div><div>ALL REPORTS, once Posted on the Site, ARE NEVER REMOVED. ---&nbsp;<span style=\"font-size: 1rem;\">Motions to Dismiss that are Granted are Noted in the Report Data (just like all&nbsp;</span><span style=\"font-size: 1rem;\">other Motions are), but Reports themselves ARE NEVER REMOVED from the&nbsp;</span><span style=\"font-size: 1rem;\">Database.</span></div><div><br></div><div>(Posting in-Perpetuity will require Additional Fees from Reporters in future&nbsp;<span style=\"font-size: 1rem;\">years to maintain their Report on the Database. --- This Fee is currently $12 per&nbsp;</span><span style=\"font-size: 1rem;\">year, and is subject to increase beginning on January 1 st , 2027, for Reports Posted&nbsp;</span><span style=\"font-size: 1rem;\">after that date.)</span></div><div><br></div><div>Once the Report has been Posted, and at least attempted to be delivered, then&nbsp;<span style=\"font-size: 1rem;\">comes the Answer from those Report Subjects who can be identified and Served&nbsp;</span><span style=\"font-size: 1rem;\">with the Report who Choose to Answer.</span></div><div><br></div><div>After the Answer is Filed, Replies from the Reporter, and Sur-Replies from&nbsp;<span style=\"font-size: 1rem;\">the Subject of the Report are Permitted.</span></div><div><br></div><div>Then, the Processes of Motions and Discovery begin, ending, where&nbsp;<span style=\"font-size: 1rem;\">possible, with a Trial. --- Trials, when they happen, will be via Zoom, Teams or&nbsp;</span><span style=\"font-size: 1rem;\">other, similar Video Service.</span></div><div><br></div><div>Judgments will be rendered via Jury Verdict, with Registered non-Parties&nbsp;<span style=\"font-size: 1rem;\">Voting on the Verdict. --- Motions will be decided by Paralegals, Fully-</span><span style=\"font-size: 1rem;\">Independent-of, but taking Equally-Full Note-of the Vote of Registered non-arty</span></div><div>Users of RapeReportDB.com.</div><div><br></div><div>The Justice that I offer will be Real, and Just.</div><div><br></div><div>The Rules will be those of the Federal Rules of Civil Procedure and the&nbsp;<span style=\"font-size: 1rem;\">Federal Rules of Evidence, modified as necessary and appropriate for the purpose&nbsp;</span><span style=\"font-size: 1rem;\">of the private Web-based Adjudications that I now Offer.</span></div><div><br></div><div>(Where there is Conflict between the United States Circuit Courts of Appeal&nbsp;<span style=\"font-size: 1rem;\">on any Issue where there is NO Controlling Precedent from the United States&nbsp;</span><span style=\"font-size: 1rem;\">Supreme Court, the Precedent from the Second Circuit shall Control on that issue.)</span></div><div><br></div><div>If the Raper or other Sexual Deviant should choose to Answer, then the&nbsp;<span style=\"font-size: 1rem;\">Reporter will, of course, have the right to Reply to any Answer Filed by the&nbsp;</span><span style=\"font-size: 1rem;\">Subject of the Report.</span></div><div><br></div><div>Although Video Reporting is Offered, and is presumptively Evidence&nbsp;<span style=\"font-size: 1rem;\">Admissible at Trial, Written Pleadings will always be required, at least in the first&nbsp;</span><span style=\"font-size: 1rem;\">instance, specifically in order to best enable the Publication and Research&nbsp;</span><span style=\"font-size: 1rem;\">Functions designed-into this Site.</span></div><div><br></div><div>Essentially, there is a Jury, and it is the Entire User Community of the Site,&nbsp;<span style=\"font-size: 1rem;\">which is open to all citizens of our Planet.</span></div><div><span style=\"font-size: 1rem;\"><br></span></div><div><br></div><div><b><u>Fees for Motions and Trials</u></b></div><div><br></div><div>The Fee for the Filing of Motions will be $300 each, minimum. --- ($300 =&nbsp;<span style=\"font-size: 1rem;\">$309.30 actual.) --- Responses to Motions are encouraged and there will be an&nbsp;</span><span style=\"font-size: 1rem;\">additional Fee for Posting said Responses.</span></div><div><br></div><div>There will also be a Fee for Trials, which will be determined shortly and&nbsp;<span style=\"font-size: 1rem;\">then published here as soon as it is decided.</span></div><div><span style=\"font-size: 1rem;\"><br></span></div></div>', '/storage/photos/1/logo.png', 'https://rapereportdb.kendemo.com/storage/photos/1/ken2.jpg', 'A platform for reporting and exposing acts of sexual misconduct, with full transparency and public record.', '(845) 357-1740', 'DeviateReportDB.com@gmail.com', NULL, '2025-07-24 11:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kahtmandu', 100.00, 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
(2, 'Out of valley', 300.00, 'active', '2020-08-14 04:22:41', '2020-08-14 04:22:41'),
(3, 'Pokhara', 400.00, 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
(4, 'Dharan', 400.00, 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits_comment` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `credits_comment`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', 'PSLHIhDu2c8wfL9DwFBg3WHdbnK7GQbbuJshYGuxlXpHZUcZ6MaSjtqY3bmz', 1, NULL, '2025-06-30 16:43:41'),
(2, 'Steve Nguyen', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, 0, NULL, '2020-08-15 07:30:07'),
(33, 'Smith Jane', 'smithjane@gmail.com', NULL, '$2y$10$RJrA2O9B2230fLwH5QdjueVjof//Cv5byJyXWbOxw.PUAwDQAGu.e', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-05-30 18:33:50', '2025-05-30 18:33:50'),
(34, 'Emily Brown', 'emilybrown@gmail.com', NULL, '$2y$10$..zuGeg3XNH41Wt7prIMF.2EGCdtP7CjTYlt01sjNqdcIBVt/NNge', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-05-30 18:44:01', '2025-05-30 18:44:01'),
(35, 'Michael Lee', 'michaellee@gmail.com', NULL, '$2y$10$SOvgFfvwS0IdsAuULHEx1eJ1bZ9wj2S8nhYB9o/DAQ7BBS32e0Yhy', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-05-30 18:47:42', '2025-05-30 18:47:42'),
(36, 'Karen Thomas', 'karenthomas@gmail.com', NULL, '$2y$10$YB1yDLpDqKw4wes8zcOJOO7a7xHkEsKqRpzSxWPb1g7UVAWOnv7Aa', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-05-30 18:50:05', '2025-05-30 18:50:05'),
(37, 'David Parker', 'davidparker@gmail.com', NULL, '$2y$10$o.xuBPVSulpbxHbyf3dTjeRRyJe2/tqiu3RtH1q.kVsdnFUu6HILm', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-05-30 18:56:36', '2025-05-30 18:56:36'),
(38, 'Jacksmith', 'jacksmith@yopmail.com', NULL, '$2y$10$d.sq5kXpvfcUoNdxqnwUDufw5hzRlRK918Nq7ABBkSs1.y253dz9m', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-06-12 16:32:43', '2025-06-12 16:32:43'),
(39, 'Steven William', 'stevenwilliam@yopmail.com', NULL, '$2y$10$V2yj71Dqmsd2sOIcKpzuzOOrZKN/6bNoyOKB4fU.xHRlnPr9Z3tiq', NULL, 'user', NULL, NULL, 'active', NULL, 0, '2025-06-12 18:59:25', '2025-06-12 18:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 9, NULL, 2, 190.00, 1, 190.00, '2025-05-06 10:42:57', '2025-05-06 10:42:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reports_report_number_unique` (`report_number`),
  ADD KEY `reports_reporter_id_foreign` (`reporter_id`);

--
-- Indexes for table `report_comments`
--
ALTER TABLE `report_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_comments_user_id_foreign` (`user_id`),
  ADD KEY `report_comments_report_id_foreign` (`report_id`);

--
-- Indexes for table `report_responses`
--
ALTER TABLE `report_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_responses_user_id_foreign` (`user_id`),
  ADD KEY `report_responses_report_id_foreign` (`report_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_comments`
--
ALTER TABLE `report_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report_responses`
--
ALTER TABLE `report_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_reporter_id_foreign` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_comments`
--
ALTER TABLE `report_comments`
  ADD CONSTRAINT `report_comments_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_responses`
--
ALTER TABLE `report_responses`
  ADD CONSTRAINT `report_responses_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_responses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
