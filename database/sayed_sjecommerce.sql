-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2023 at 06:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sayed_sjecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `first_name`, `last_name`, `company`, `address_1`, `address_2`, `city`, `state`, `post_code`, `country`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 3, 'Dr. Marcia Murray', 'Gavin Konopelski', 'Goldner, Cole and Bode', '64849 Murphy Prairie Apt. 244\nEast Kaseyport, PA 14219', '9992 Lynch Court\nEstelville, RI 68283-1830', 'Port Dakota', 'New York', '58801-0045', 'Sri Lanka', 'paucek.linda@example.net', '+1-281-578-8395', '2023-03-04 23:41:15', '2023-03-04 23:41:15'),
(2, 2, 'Charity Bauch', 'Rae Robel MD', 'Hamill LLC', '657 Maggio Extension\nReannafurt, TX 05135-1807', '9751 Hoppe Heights Suite 820\nManuelview, DE 87617', 'Batzview', 'Mississippi', '83381', 'Sudan', 'lbogan@example.net', '(986) 554-6394', '2023-03-04 23:41:15', '2023-03-04 23:41:15'),
(3, 4, 'Dr. Jaylan Feest', 'Dr. Vidal Haley', 'Kutch Group', '1017 Harry Points Apt. 303\nSouth Deangelo, OH 18452', '59535 Upton Mills Suite 383\nSouth Bonnietown, AZ 33637-3118', 'Port Chanceborough', 'Tennessee', '50016', 'Saint Vincent and the Grenadines', 'wiegand.adrienne@example.net', '(872) 666-8796', '2023-03-04 23:41:15', '2023-03-04 23:41:15'),
(4, 3, 'Laurel Batz MD', 'Buddy O\'Hara', 'Jacobson, Boehm and Homenick', '769 Isabell Streets\nKhalidstad, GA 60034', '9691 Smitham Walks Suite 828\nNew Danyka, WV 98905-3455', 'North Robbbury', 'Virginia', '14498-3256', 'Macao', 'harmon.kessler@example.org', '(314) 235-4218', '2023-03-04 23:41:15', '2023-03-04 23:41:15'),
(5, 5, 'Orlo Schneider', 'Mrs. Heather Bailey', 'Schinner, Runte and Littel', '210 Romaguera Manor\nNew Reinhold, NC 01267', '4028 Alberta Motorway\nLake Carolinabury, CA 50777', 'Lake Harmon', 'Kentucky', '91306', 'Guinea-Bissau', 'jabari.waters@example.com', '1-612-914-3612', '2023-03-04 23:41:15', '2023-03-04 23:41:15'),
(6, 6, 'Jenna Gaines', 'Gaines', 'Mclaughlin Whitney Traders', 'Eveniet tempore co', 'Similique minima ita', 'Dolor eum molestiae', 'Nostrud et lorem omn', 'Min', NULL, 'niluka@mailinator.com', '741', '2023-03-05 02:06:02', '2023-03-05 02:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-03-04 23:40:58', '2023-03-04 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `shop_id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int NOT NULL,
  `expire_at` date NOT NULL,
  `limit` int NOT NULL,
  `minimum_cart` int NOT NULL,
  `used` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58');

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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-03-04 23:40:57', '2023-03-04 23:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-03-04 23:40:57', '2023-03-04 23:40:57', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2023-03-04 23:40:57', '2023-03-04 23:40:57', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2023-03-04 23:40:58', '2023-03-04 23:40:58', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2023-03-04 23:40:58', '2023-03-04 23:40:58', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2023-03-04 23:40:58', '2023-03-04 23:40:58', 'voyager.pages.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(29, '2023_02_22_055833_create_products_table', 1),
(30, '2023_02_22_072723_create_shops_table', 1),
(31, '2023_02_22_073354_create_orders_table', 1),
(32, '2023_02_22_080337_create_addresses_table', 1),
(33, '2023_02_22_112352_add_new_shop_id__to_table', 1),
(34, '2023_02_23_111131_create_wishlists_table', 1),
(35, '2023_02_25_071011_create_coupons_table', 1),
(36, '2023_02_25_074950_create_prodcats_table', 1),
(37, '2023_02_25_075231_create_prodcat_products_table', 1),
(38, '2023_03_05_055741_create_ordera_product_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `shop_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `currency` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int NOT NULL,
  `discount_code` int DEFAULT NULL,
  `shipping_total` int DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` int NOT NULL,
  `total` int NOT NULL,
  `tax` int DEFAULT NULL,
  `customer_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing` json DEFAULT NULL,
  `shipping` json DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_paid` timestamp NULL DEFAULT NULL,
  `date_completed` timestamp NULL DEFAULT NULL,
  `refund_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aptment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paren_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shop_id`, `status`, `currency`, `discount`, `discount_code`, `shipping_total`, `shipping_method`, `subtotal`, `total`, `tax`, `customer_note`, `billing`, `shipping`, `payment_method`, `payment_method_title`, `transaction_id`, `date_paid`, `date_completed`, `refund_amount`, `first_name`, `last_name`, `company`, `address_1`, `address_2`, `city`, `state`, `post_code`, `aptment`, `email`, `phone`, `created_at`, `updated_at`, `paren_id`) VALUES
(1, 5, 1, 1, 'HNL', 18, 12, 12, 'est', 494, 446, 13, 'Provident et alias quia nisi nobis impedit explicabo. Quam odio suscipit rerum reprehenderit. Nesciunt dicta non numquam distinctio aspernatur. Aut nulla voluptatibus fuga blanditiis dolore.', NULL, NULL, 'MasterCard', 'American Express', 'PNKXPUDH4DQ', NULL, NULL, NULL, 'Dr. Arnold Legros', 'Miss Fatima Shanahan II', NULL, '16776 Edmund Trail', '9287 Langosh Throughway', 'Katrineborough', 'New Jersey', '70704', 'Elisaberg', 'yost.boris@toy.com', '+12342422643', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(2, 2, 1, 1, 'XOF', 20, 18, 32, 'consequatur', 484, 198, 14, 'Illo voluptatem voluptate voluptatem aut tenetur. Culpa eligendi exercitationem enim laudantium. Ea eius quaerat excepturi enim qui optio provident. Quo ratione qui optio sed et.', NULL, NULL, 'Visa', 'MasterCard', 'GGPJNROVK01', NULL, NULL, NULL, 'Eunice Gislason', 'Dr. Valentina Gislason', NULL, '801 Marquise Row Apt. 031', '62153 Auer Tunnel', 'South Sheldonshire', 'Washington', '70863', 'Port Edisonfort', 'manuel.wisozk@beatty.com', '(972) 482-2894', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(3, 3, 1, 1, 'UGX', 10, 12, 22, 'aliquam', 272, 151, 11, 'Autem est voluptatem veniam alias. Qui quis nulla et cumque et.', NULL, NULL, 'Visa', 'MasterCard', 'CSWDZQSR', NULL, NULL, NULL, 'Mrs. Drew Olson MD', 'Pearline Kuhlman', NULL, '359 Haskell Alley Suite 404', '623 Mertz Drive Apt. 401', 'Anthonychester', 'California', '21455-3665', 'Schusterfort', 'jamarcus.feil@fay.com', '212.623.1432', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(4, 1, 1, 1, 'IDR', 15, 13, 18, 'molestias', 358, 221, 19, 'Numquam ad eligendi voluptatem enim minima blanditiis sapiente. Qui in quasi asperiores voluptatum explicabo. Tempora nulla quis iure repudiandae.', NULL, NULL, 'Visa', 'MasterCard', 'IHJLKGW8KDC', NULL, NULL, NULL, 'Zoey Purdy', 'Savanah Mitchell', NULL, '9601 Aliyah Center', '779 Nicolas Falls', 'Chadrickmouth', 'Oklahoma', '99771-1748', 'East Tamia', 'coy99@marks.com', '+19715813113', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(5, 1, 1, 1, 'CAD', 12, 15, 25, 'ad', 291, 258, 16, 'Fugit officiis laudantium rerum nobis quia dolor illo. Nihil qui unde error quis. Doloremque qui repudiandae minus aut. Hic facilis voluptates dolores ratione quam et. Aut iure at ullam et.', NULL, NULL, 'Visa', 'Visa Retired', 'EVEPAFVRU84', NULL, NULL, NULL, 'Mr. Darrel Johnston', 'Dr. Zelma Hudson', NULL, '28077 Anderson Pike Apt. 688', '644 Maxime Harbors Apt. 549', 'Lehnerview', 'Connecticut', '02947-2816', 'Durganburgh', 'imogene81@hotmail.com', '+1.580.246.4754', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(6, 4, 1, 1, 'BGN', 18, 14, 21, 'nemo', 291, 399, 16, 'Quaerat dolores voluptas eaque sunt dolores. Quaerat beatae ut libero laborum.', NULL, NULL, 'Visa', 'Visa Retired', 'LFCKROFIW6T', NULL, NULL, NULL, 'Delilah Kautzer', 'Eulah Lesch', NULL, '2782 Hyatt Alley', '672 Will Gardens', 'Lake Opal', 'Georgia', '91624', 'Port Deannaberg', 'viola01@gmail.com', '+1-970-308-8464', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(7, 5, 1, 1, 'SCR', 20, 17, 15, 'assumenda', 178, 429, 17, 'Qui corporis accusamus cum dolores asperiores pariatur minima. Provident perspiciatis nam iusto magnam in vel exercitationem fuga. Iusto perferendis quam ut quos.', NULL, NULL, 'American Express', 'MasterCard', 'YSPOBF4N', NULL, NULL, NULL, 'Prof. Reggie Buckridge Sr.', 'Mrs. Erica Ankunding IV', NULL, '54436 Adella Overpass', '894 Prosacco Drive', 'Waelchiland', 'Colorado', '43523-1707', 'Port Samantashire', 'kathryne54@gmail.com', '+15202650458', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(8, 5, 1, 1, 'TMT', 18, 13, 38, 'nostrum', 159, 230, 20, 'Rem non praesentium et. Fuga enim impedit exercitationem. Ad quia officia nulla sit impedit sit quo architecto.', NULL, NULL, 'MasterCard', 'Visa', 'FMSPBT3JDXA', NULL, NULL, NULL, 'Dr. Percival Fahey DVM', 'Bud Lemke', NULL, '422 Santos Brook', '34246 Kunze Falls', 'East Camren', 'Indiana', '34657-8626', 'East Don', 'flebsack@beahan.info', '+14453131102', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(9, 1, 1, 1, 'KPW', 12, 12, 37, 'occaecati', 494, 460, 10, 'Dolores reprehenderit numquam rerum molestiae. Nulla quaerat velit ut ipsa. Officia quod quibusdam libero.', NULL, NULL, 'American Express', 'Visa', 'FRTQBVDM', NULL, NULL, NULL, 'Paolo Mosciski', 'Rodolfo Senger', NULL, '356 Chelsea Ridges Suite 155', '6228 Sallie Pass', 'Wolffburgh', 'Wisconsin', '26557', 'Brownborough', 'okuneva.nicolette@gmail.com', '+1 (972) 319-5727', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(10, 2, 1, 1, 'TJS', 13, 18, 34, 'cupiditate', 223, 268, 14, 'Dolore est rerum sit itaque. Cum ad ea quaerat maxime reiciendis maiores. Praesentium nesciunt aliquid magni voluptatibus est fugit. Et quo numquam perspiciatis sunt ut consectetur perferendis.', NULL, NULL, 'MasterCard', 'Visa', 'QNEWVIASG9P', NULL, NULL, NULL, 'Xavier Graham', 'Mrs. Lenna O\'Reilly', NULL, '9128 Halle Fork', '41207 Scotty Flats Apt. 940', 'South Dagmar', 'Oklahoma', '57217-7340', 'Bernadetteland', 'marques.hauck@ritchie.com', '240-517-4084', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(11, 2, 1, 1, 'SEK', 20, 10, 11, 'blanditiis', 272, 387, 20, 'Totam qui iusto optio quo non. Sed explicabo sed eligendi quo et sed. Sunt deserunt voluptatem enim. Autem ipsam temporibus culpa unde. Dolore iste sit necessitatibus quae.', NULL, NULL, 'MasterCard', 'Visa', 'JEVVKNBJGJG', NULL, NULL, NULL, 'Prof. Heidi Wilderman', 'Mr. Shaun Turcotte DDS', NULL, '8371 Russell Lodge Apt. 334', '710 Deckow Cove Suite 916', 'Soniashire', 'Washington', '94998-8504', 'East Mable', 'luettgen.oleta@steuber.org', '870.449.8538', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(12, 2, 1, 1, 'BND', 18, 11, 28, 'ducimus', 215, 462, 20, 'Laborum rerum temporibus et ea tenetur perspiciatis non quia. Est ipsum odit rem minus. Fuga omnis dolores sit.', NULL, NULL, 'MasterCard', 'Discover Card', 'EUOUPB5ARZM', NULL, NULL, NULL, 'Ms. Tiana Rice', 'Darrell Kuhic', NULL, '129 Zion Hollow Suite 942', '25108 Sidney Estates', 'Effertzbury', 'Ohio', '29307-3804', 'New Remington', 'hane.daphnee@weber.com', '443.385.0171', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(13, 3, 1, 1, 'NGN', 12, 19, 30, 'velit', 364, 443, 10, 'Eius ut ut quisquam est voluptas non rerum. Officiis pariatur suscipit culpa quisquam qui. Voluptate voluptate occaecati quidem.', NULL, NULL, 'MasterCard', 'Visa', 'TQUTZHXF', NULL, NULL, NULL, 'Althea Carroll Jr.', 'Joyce Steuber', NULL, '93422 Cormier Crest Suite 498', '296 Gutkowski Mews', 'South Joshuahfurt', 'Wyoming', '81350', 'Lebsackbury', 'bayer.althea@johns.com', '1-815-220-3205', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(14, 3, 1, 1, 'PGK', 13, 17, 32, 'et', 333, 372, 16, 'Mollitia sed ea animi deleniti error qui iusto. Dolorum ullam eum cum. Adipisci est dolorum temporibus tempore aperiam similique debitis officiis.', NULL, NULL, 'Visa', 'Visa', 'JVMLOGXY', NULL, NULL, NULL, 'Miss Vada Johnston', 'Dr. Omari Walker III', NULL, '8813 Allison Trafficway Apt. 561', '1981 Hintz Rapid Suite 016', 'Port Josh', 'Virginia', '02969', 'North Breannemouth', 'khalid54@will.com', '727-375-4559', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(15, 1, 1, 1, 'PKR', 12, 20, 17, 'quae', 442, 461, 15, 'Neque laborum rerum qui et. Dicta quae culpa expedita quae eveniet voluptatum nesciunt ut. Sit pariatur ab id sit facere eveniet quae.', NULL, NULL, 'Visa Retired', 'MasterCard', 'WFPGPHIDVS2', NULL, NULL, NULL, 'Britney Wintheiser III', 'Megane Swaniawski', NULL, '99945 Mueller Ramp Suite 202', '4658 Guiseppe Mall Suite 185', 'Murphyborough', 'Iowa', '70681-6356', 'Homenickton', 'loren.bartoletti@langworth.com', '(425) 273-3010', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(16, 4, 1, 1, 'RON', 15, 15, 15, 'provident', 441, 385, 20, 'Aliquid qui voluptatem repellat dolorem omnis voluptatem. Vero assumenda quo illo molestiae quia et officia. Reprehenderit sit vero qui odio.', NULL, NULL, 'Visa Retired', 'MasterCard', 'SXJQYSK1', NULL, NULL, NULL, 'Zander D\'Amore', 'Naomi Nicolas', NULL, '486 Schmeler Spurs', '7885 Goodwin Tunnel', 'Port Arely', 'West Virginia', '55463-2744', 'Klockoborough', 'erica52@gmail.com', '+17404546423', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(17, 1, 1, 1, 'GBP', 20, 17, 40, 'est', 200, 167, 17, 'Debitis tempore alias magnam. Voluptas aut fuga rerum. Voluptas rerum consequuntur veniam aspernatur dicta eos. Qui unde odio ducimus. Molestiae maiores et illo provident id esse.', NULL, NULL, 'Visa Retired', 'MasterCard', 'PUQYPSC96VS', NULL, NULL, NULL, 'Akeem Waters IV', 'Benedict Murray', NULL, '150 Koelpin Locks Suite 302', '1555 Deanna Meadows', 'Rebeccamouth', 'Maryland', '92168-5762', 'Beckerchester', 'emile.dare@pfannerstill.com', '984-680-2341', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(18, 5, 1, 1, 'MRU', 11, 12, 38, 'omnis', 219, 446, 14, 'Laborum nostrum ut est iure sequi. Natus laboriosam nulla quas possimus occaecati. Enim officiis voluptates quos quibusdam.', NULL, NULL, 'MasterCard', 'Visa', 'EJYWLYY7MCY', NULL, NULL, NULL, 'Jeff Nicolas', 'Mason Bernier', NULL, '162 Rhiannon Club', '95835 Thea Brook', 'West Meaghanview', 'Tennessee', '31939', 'South Adonishaven', 'lupe.kuhn@yahoo.com', '463.957.1603', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(19, 5, 1, 1, 'AUD', 17, 15, 23, 'quia', 488, 123, 13, 'Tempore harum id enim unde qui sit. Perferendis iste nostrum eum ratione non sapiente. Deleniti dolor voluptatum distinctio quis ducimus cum ut. Aut est porro atque assumenda est ab ratione.', NULL, NULL, 'Visa', 'MasterCard', 'MENGYRSG', NULL, NULL, NULL, 'Betty Glover', 'Dr. Else Ankunding', NULL, '8087 Rhea Point Suite 807', '276 Libbie Ford', 'New Destiny', 'South Carolina', '22599', 'Wolfberg', 'xherzog@robel.org', '+1-779-436-1132', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(20, 5, 1, 1, 'ANG', 19, 18, 16, 'quisquam', 437, 442, 16, 'Sunt numquam qui sit est quidem. Et eum sed fugit qui et ut. Repellat fuga sapiente est autem necessitatibus. Iure officia consectetur laborum omnis odit omnis.', NULL, NULL, 'Discover Card', 'MasterCard', 'DSRPOR3A', NULL, NULL, NULL, 'Rosamond Stoltenberg', 'Jazmyne Kiehn', NULL, '324 Ritchie Plaza Suite 013', '9883 Mariane Harbors Apt. 762', 'Port Garlandchester', 'California', '66477', 'Marilouburgh', 'tillman.casey@hotmail.com', '646.214.1205', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(21, 1, 1, 1, 'KRW', 13, 10, 31, 'quis', 479, 108, 14, 'Voluptatum est dolor id et sapiente. Eos aut repellendus et alias at. Ea possimus rerum amet cum. Laudantium ipsa accusamus sint voluptatem. Quia quia sint nemo unde non minus.', NULL, NULL, 'MasterCard', 'Visa', 'ZMZBIV5B', NULL, NULL, NULL, 'Aurelio Vandervort', 'Miss Orie Fisher I', NULL, '99677 Virgie Port Suite 897', '25458 Gutkowski Tunnel Suite 463', 'West Emmyburgh', 'Alabama', '35734-8872', 'New Ervin', 'anahi76@gmail.com', '+1.832.390.3458', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(22, 4, 1, 1, 'PAB', 19, 17, 24, 'commodi', 302, 366, 18, 'Nesciunt excepturi nihil illo quisquam ea illum molestias. Reprehenderit quis accusamus totam dolorem aut eius est. Quos qui ex soluta et iusto.', NULL, NULL, 'Visa', 'Visa', 'RUYLGZ6R22M', NULL, NULL, NULL, 'Priscilla Berge', 'Vida Carroll', NULL, '7902 Mertz Isle Suite 492', '825 Luigi Rapid', 'Demetriuschester', 'Wyoming', '41956-0911', 'Lake Lacybury', 'hayes.ismael@hotmail.com', '660-770-6013', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(23, 5, 1, 1, 'EUR', 15, 12, 44, 'repudiandae', 216, 426, 14, 'Repellendus in ea omnis eaque. Magni ut et assumenda. Similique dignissimos voluptatum eum sed facere impedit. Maxime in nulla ea totam dignissimos aut.', NULL, NULL, 'MasterCard', 'Visa', 'BLXGHYRSMCR', NULL, NULL, NULL, 'Cleora Monahan', 'Jack Schiller', NULL, '26853 Graham Meadows Apt. 156', '294 Larkin Route Suite 092', 'Swaniawskiburgh', 'Vermont', '82321-5314', 'Schowaltershire', 'porter19@okuneva.net', '1-443-812-2665', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(24, 5, 1, 1, 'TZS', 14, 20, 23, 'tempora', 223, 494, 13, 'Praesentium aliquid dolore quod voluptatibus ut et dignissimos. Quos excepturi amet officiis. Nemo eius voluptas quo ad aut deleniti.', NULL, NULL, 'Visa', 'MasterCard', 'NHEQHVEA', NULL, NULL, NULL, 'Hannah Ullrich', 'Martina Smith', NULL, '636 Renner Crossroad Apt. 833', '796 Ward Rue', 'Hammestown', 'Georgia', '64749-9160', 'Mckenzieshire', 'quitzon.hilbert@hotmail.com', '858-841-8879', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(25, 4, 1, 1, 'CRC', 15, 17, 10, 'ut', 328, 397, 14, 'Rerum magni inventore et ullam eum alias. Voluptate perspiciatis et nulla et quidem corrupti aut. Voluptatibus autem cupiditate molestiae magnam. Quaerat esse id nulla magnam.', NULL, NULL, 'JCB', 'Visa', 'YIDURH8R88W', NULL, NULL, NULL, 'Mr. Fred Swift MD', 'Lucas Ferry', NULL, '8304 Maurine Falls', '79642 Ritchie Passage', 'Port Buddyport', 'Arkansas', '05640', 'Bayerfort', 'oarmstrong@hotmail.com', '478.400.5689', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(26, 3, 1, 1, 'KGS', 19, 13, 27, 'quidem', 209, 484, 20, 'Dolores animi dolores ut et sit deleniti temporibus. Sit consequatur quis dignissimos officia et. Quas quia sapiente voluptates omnis. Et aut consequuntur dolor eum corrupti maxime.', NULL, NULL, 'Visa', 'Visa', 'WKTDNP76OIF', NULL, NULL, NULL, 'Athena Ryan', 'Mrs. Laura Jaskolski', NULL, '23339 Mante Drive', '779 McKenzie Rue', 'Port Karinestad', 'Nevada', '14491-2080', 'Port Maxberg', 'ewunsch@yahoo.com', '412.656.2520', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(27, 5, 1, 1, 'BYN', 17, 19, 16, 'voluptas', 248, 309, 17, 'Doloribus vero ut aliquam eum est rerum nobis facere. Ut quia facere perspiciatis omnis quaerat et autem.', NULL, NULL, 'MasterCard', 'Discover Card', 'BVEDKI6SAEC', NULL, NULL, NULL, 'Kaitlyn Boehm Sr.', 'Lilliana Kassulke', NULL, '648 Tania Wall Suite 529', '284 Boehm Rest Apt. 115', 'Murazikstad', 'Oklahoma', '49080-1937', 'Jefferyshire', 'miracle.mcdermott@gmail.com', '231.749.5823', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(28, 1, 1, 1, 'PLN', 17, 20, 43, 'nostrum', 257, 112, 15, 'Expedita quibusdam nobis libero dolores. Aut et tempora labore deleniti ut. Natus cum facere quasi. In aut harum porro laboriosam rem ut at.', NULL, NULL, 'MasterCard', 'MasterCard', 'RZXPEOTF', NULL, NULL, NULL, 'Aurelio O\'Hara', 'Randy Goldner', NULL, '72539 Kling Spring Apt. 300', '13904 Huels Corner', 'Donnellystad', 'West Virginia', '99576', 'Torpland', 'payton.ratke@yahoo.com', '1-480-415-0742', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(29, 5, 1, 1, 'HRK', 16, 13, 41, 'non', 451, 229, 10, 'Hic corrupti unde distinctio. Eligendi voluptatibus ut quo voluptas nostrum quia. Hic iste repudiandae reiciendis vitae ipsa delectus qui exercitationem. Iusto corporis dolorum corrupti eius.', NULL, NULL, 'Visa', 'Visa', 'CVDIWP7JRL5', NULL, NULL, NULL, 'River Gislason', 'Chanelle Osinski', NULL, '409 Addie Island', '83731 Camilla Crescent', 'South Demond', 'Arkansas', '76917', 'Lake Freedaland', 'considine.kathryn@gmail.com', '1-231-257-6237', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(30, 2, 1, 1, 'RUB', 12, 15, 50, 'maiores', 141, 374, 19, 'Accusantium voluptatem odit odit magni. Sed in commodi debitis dolore et ut. Id commodi ut veniam. Eum ipsum quod et dignissimos.', NULL, NULL, 'MasterCard', 'MasterCard', 'VJISRESN', NULL, NULL, NULL, 'Tia Prohaska', 'Kaycee Mraz', NULL, '77711 Zola Fork Apt. 222', '302 Michaela Turnpike', 'Margarettemouth', 'Arkansas', '38476', 'South Paxton', 'lynch.nicole@willms.com', '279-774-3842', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(31, 5, 1, 1, 'GYD', 19, 14, 24, 'laudantium', 106, 315, 17, 'Ut iste eum maxime aut. Sunt dolorum est sint iure eum molestias consequatur qui. Ipsa occaecati beatae quisquam molestiae qui tempore. Ratione rerum voluptatum doloribus suscipit repellendus.', NULL, NULL, 'MasterCard', 'MasterCard', 'XFATHP8J', NULL, NULL, NULL, 'Ansley Becker', 'Prof. Marvin Robel', NULL, '9665 Wiegand Harbor', '108 Easter Lodge', 'VonRuedenport', 'Texas', '87668', 'East Jacky', 'bfeest@yahoo.com', '818-435-0796', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(32, 5, 1, 1, 'EGP', 18, 14, 48, 'veritatis', 427, 446, 13, 'Accusamus facere molestias eius enim iure. Amet numquam magnam possimus ipsam.', NULL, NULL, 'MasterCard', 'Visa', 'AEHKQT9JLLO', NULL, NULL, NULL, 'Jairo Lindgren', 'Dr. Demond Hintz PhD', NULL, '512 Bechtelar Manors Apt. 496', '22178 Felix Well Apt. 536', 'Lake Veldabury', 'Delaware', '44250-5948', 'Lake Daniella', 'douglas.pierre@yahoo.com', '1-757-729-3246', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(33, 4, 1, 1, 'TND', 14, 14, 33, 'eaque', 234, 349, 16, 'Quia aut non quo nulla voluptas doloribus. Non vel molestias sed. Aut fugit omnis iure et officiis quae tempore. Tempora ut et temporibus molestiae magni.', NULL, NULL, 'MasterCard', 'Visa', 'BLLQGNHGP17', NULL, NULL, NULL, 'Mr. Timmothy Williamson II', 'Pansy Koepp', NULL, '8846 Angela Pines', '56125 Mohr Heights Suite 450', 'Reichelborough', 'New Hampshire', '18533', 'South Janae', 'alvis81@gmail.com', '(505) 300-3738', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(34, 1, 1, 1, 'NZD', 19, 14, 14, 'deleniti', 350, 447, 20, 'Beatae qui iure corporis eligendi quam. Quasi est aliquam modi omnis eos modi et. Consequatur est culpa iusto sunt praesentium sed. Et est eum atque voluptatibus.', NULL, NULL, 'MasterCard', 'Visa', 'BSAKUWBD', NULL, NULL, NULL, 'Mr. Deontae McLaughlin III', 'Leonard Cummerata', NULL, '877 Smitham Pike Suite 749', '951 Rosalia Meadows Apt. 471', 'Elliottside', 'Hawaii', '50352', 'New Hildegard', 'monserrat22@hotmail.com', '+1 (351) 866-0552', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(35, 5, 1, 1, 'AZN', 18, 12, 13, 'delectus', 396, 354, 14, 'Qui aut amet officia neque. A aut veritatis aut aperiam. Quidem enim aperiam et voluptate repellendus est. Quasi ea voluptatem esse praesentium autem. Consequatur illum tempora qui qui et autem.', NULL, NULL, 'MasterCard', 'American Express', 'WCHCOM3E', NULL, NULL, NULL, 'Estella Block', 'Miss Briana Kerluke', NULL, '780 Henderson Courts Suite 663', '565 Crystal Walk Suite 216', 'Cartwrightberg', 'Delaware', '86853', 'West Maxside', 'qwindler@hotmail.com', '678.203.4535', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(36, 4, 1, 1, 'RUB', 11, 12, 16, 'culpa', 173, 161, 17, 'Sed inventore blanditiis est error inventore ducimus et enim. Quidem perspiciatis est rerum tempore labore. Aut non nulla praesentium veniam. Voluptate quia eum accusamus saepe ut.', NULL, NULL, 'MasterCard', 'MasterCard', 'XXQXBRHUM04', NULL, NULL, NULL, 'Edwin Armstrong', 'Crawford Rolfson', NULL, '180 Spinka Bypass Apt. 637', '785 Koepp Street', 'Kilbackmouth', 'North Carolina', '72148', 'New Donavon', 'zbernier@gmail.com', '726-985-3040', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(37, 1, 1, 1, 'USD', 20, 13, 50, 'voluptatem', 281, 462, 20, 'Molestiae ipsam deleniti aut nihil. Culpa eius minima rerum corrupti consequatur enim explicabo. Tempora nostrum sint impedit earum nisi. Fuga possimus soluta sunt officia tempora optio.', NULL, NULL, 'Visa Retired', 'MasterCard', 'LTYUNH0K6NN', NULL, NULL, NULL, 'Dr. Deja Glover IV', 'Miss Annie Ruecker IV', NULL, '2607 Rosenbaum Lights', '9694 Marianne Drive', 'West Gonzalo', 'Washington', '41068', 'Terrytown', 'ngraham@yahoo.com', '541.212.5405', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(38, 1, 1, 1, 'BGN', 11, 15, 19, 'quia', 272, 327, 10, 'Id ut magnam odio magni non aut. Vel sed est pariatur maxime. Enim illum neque accusamus voluptate. Fugiat corrupti necessitatibus expedita reprehenderit et debitis velit. Et qui excepturi ex ut.', NULL, NULL, 'MasterCard', 'Visa', 'IFGBXKUSTOE', NULL, NULL, NULL, 'Roxane Toy Sr.', 'Lindsay Mayert', NULL, '728 Colton Glen', '59075 Dell Square', 'Caryland', 'North Carolina', '47865-8146', 'East Ted', 'rkassulke@yahoo.com', '+1-442-700-5066', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(39, 3, 1, 1, 'BWP', 16, 18, 21, 'ipsum', 463, 382, 12, 'Iste repellat aspernatur voluptatem eum consectetur illum placeat. Quo optio fugiat magnam eos velit. Odio voluptas hic est qui et atque aut. Dolor qui incidunt doloremque inventore.', NULL, NULL, 'Visa', 'JCB', 'AKVAPVJE7IU', NULL, NULL, NULL, 'Lucie Berge', 'Korey Corwin II', NULL, '54683 Rosenbaum Islands Suite 863', '5910 Kling Roads Suite 901', 'West Claraburgh', 'Arkansas', '98679-9644', 'Ullrichmouth', 'cynthia60@gmail.com', '1-850-300-5188', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(40, 2, 1, 1, 'GEL', 16, 14, 28, 'consequuntur', 412, 344, 13, 'Dicta inventore inventore voluptatem amet reiciendis dignissimos ut. Rerum nihil pariatur neque quaerat enim vitae et. Tenetur qui ullam labore quas dolorem officiis voluptate unde.', NULL, NULL, 'American Express', 'Visa', 'FFNJRP2MQJK', NULL, NULL, NULL, 'Lucio Stehr', 'Ottis Kozey', NULL, '21516 Bailey Plain Suite 367', '23493 Fae Viaduct Suite 810', 'North Casperstad', 'Florida', '84775', 'Stacyshire', 'ona14@hotmail.com', '774-739-6851', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(41, 5, 1, 1, 'MKD', 18, 18, 24, 'nulla', 355, 298, 13, 'Dolorem odio voluptatem quis iusto omnis expedita quis. Architecto rerum eius porro beatae quia aut. Delectus totam ut corrupti libero inventore est. Quod id libero numquam quod.', NULL, NULL, 'MasterCard', 'MasterCard', 'FAWKCCLRQO8', NULL, NULL, NULL, 'Vida Rolfson', 'Julian Ward', NULL, '941 Sydnie Camp Apt. 160', '558 Miller Harbor', 'Amiyaborough', 'Louisiana', '86403-8456', 'New Adolphshire', 'paula.raynor@gmail.com', '1-430-366-3806', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(42, 1, 1, 1, 'JOD', 12, 20, 20, 'id', 376, 263, 13, 'Iusto tempore recusandae aut. Nihil voluptatem odit maxime voluptatem eum voluptas inventore. Itaque eos dolores perferendis quasi.', NULL, NULL, 'JCB', 'Visa', 'DZPUKRGOMY8', NULL, NULL, NULL, 'Rodrick Orn', 'Dr. Donny Hoppe', NULL, '20765 Fahey Groves', '7966 Porter Creek Suite 013', 'Johnathanborough', 'District of Columbia', '18371', 'Geovannyberg', 'schulist.nels@waters.com', '(854) 778-4801', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(43, 2, 1, 1, 'LRD', 20, 16, 49, 'nesciunt', 189, 305, 17, 'Qui corrupti commodi nihil ut. Voluptatem velit voluptatem quia aliquam. Ipsam deleniti illo voluptate consequatur dolores.', NULL, NULL, 'MasterCard', 'MasterCard', 'ZGAXVIZPEL5', NULL, NULL, NULL, 'Stella Morar III', 'Prof. Arnulfo Reilly DDS', NULL, '405 Nils Extensions Suite 873', '582 Rice Course', 'Elberttown', 'Pennsylvania', '23212-3638', 'North Tyreseshire', 'xander.hayes@hotmail.com', '458.241.9825', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(44, 2, 1, 1, 'BSD', 14, 14, 19, 'esse', 149, 352, 19, 'Velit dolorem velit earum inventore. Rerum et praesentium voluptatem nam sit numquam enim. Id tempora et dolorem consectetur. Necessitatibus adipisci reiciendis id molestiae autem id.', NULL, NULL, 'Visa Retired', 'Visa', 'PBMHNVJ5M6X', NULL, NULL, NULL, 'Una Buckridge', 'Cara Gerlach V', NULL, '913 Rice Ports Suite 482', '61084 Will Lakes Suite 649', 'New Dovieview', 'New Hampshire', '82113', 'Lakinview', 'dariana50@hotmail.com', '+1 (843) 394-5302', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(45, 4, 1, 1, 'DKK', 11, 20, 13, 'rerum', 162, 493, 16, 'Sunt ullam non et. Iusto velit quas quibusdam sint impedit. Voluptas temporibus ullam eaque earum mollitia nisi.', NULL, NULL, 'Visa Retired', 'JCB', 'GZMPQJ7UZR5', NULL, NULL, NULL, 'Luisa Hegmann', 'Bret Larkin', NULL, '5670 Brandon Pike', '19280 Tremblay Creek', 'Kuhicfort', 'West Virginia', '20076-3181', 'Itzelmouth', 'cassie.wiegand@gmail.com', '+1.469.465.6924', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(46, 1, 1, 1, 'CUP', 18, 18, 47, 'esse', 242, 231, 13, 'Eos molestiae reiciendis quis ut. Ipsa quis eligendi autem sed hic. Sint minus at voluptas. Voluptas perferendis aperiam in ut.', NULL, NULL, 'Visa', 'MasterCard', 'HOXVKHCE', NULL, NULL, NULL, 'Kiara Mann DVM', 'Benton Schneider', NULL, '953 Retta Path', '80236 Abbott Knoll Suite 535', 'South Jessika', 'New Hampshire', '67153-2508', 'Osinskiside', 'malcolm.morissette@sporer.info', '+1-231-928-9227', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(47, 2, 1, 1, 'HTG', 10, 14, 44, 'odit', 300, 292, 10, 'In ea ea tenetur et eaque. Quia explicabo laudantium atque. Est mollitia libero quisquam ea et atque.', NULL, NULL, 'MasterCard', 'MasterCard', 'XAHXIZ5VQ2Y', NULL, NULL, NULL, 'Arjun Mosciski Jr.', 'Emile Pacocha', NULL, '464 Muller Corner Apt. 593', '26250 Ayla Drive', 'Zenahaven', 'Maryland', '77333-2186', 'Port Dannyborough', 'gleason.damon@goodwin.com', '432-699-2212', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(48, 2, 1, 1, 'ERN', 10, 11, 17, 'ducimus', 475, 246, 15, 'Ea est odio id aut nam. Voluptatum ipsum similique id enim. Maxime dolor recusandae eius ad dolorem sint. Rem vitae delectus est consequatur. Maxime necessitatibus sit ex ipsam harum aperiam.', NULL, NULL, 'Discover Card', 'Visa', 'TDCGGI5T', NULL, NULL, NULL, 'Dr. Spencer Wintheiser I', 'Daron Kiehn', NULL, '3111 Dale Light Suite 796', '2955 Aufderhar Crest', 'North Kathlynmouth', 'District of Columbia', '33302-0949', 'Oberbrunnerton', 'gaylord.reece@kutch.com', '575-335-1524', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(49, 4, 1, 1, 'BDT', 10, 10, 25, 'excepturi', 200, 298, 15, 'Aliquid nemo eum a architecto. Molestiae maxime mollitia dignissimos labore aut facilis quis iure. Sequi voluptas vel ipsam.', NULL, NULL, 'MasterCard', 'Visa', 'TMIFXPJKB90', NULL, NULL, NULL, 'Henriette Huels V', 'Kolby Rolfson Jr.', NULL, '714 Corwin Mills Apt. 266', '66844 Cassandra Mountain', 'North Kasandrastad', 'South Dakota', '63998-3168', 'South Blaise', 'leann.towne@kerluke.net', '+1-351-499-9159', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(50, 4, 1, 1, 'MUR', 12, 18, 15, 'doloribus', 320, 162, 11, 'Debitis soluta dolore sequi vero. Est quas officiis alias qui omnis eum. Minima itaque dolor ullam quia voluptatum.', NULL, NULL, 'Visa Retired', 'Visa', 'UNTNVTLPCAN', NULL, NULL, NULL, 'Jordon Wolf', 'Eugenia Hudson II', NULL, '458 Terry Stream Suite 096', '67609 Cartwright Ways', 'Mosciskiborough', 'Arkansas', '44640', 'Korbinborough', 'lquitzon@schumm.com', '+1 (640) 624-3695', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(51, 1, 2, 1, 'ETB', 10, 13, 35, 'qui', 184, 349, 14, 'Et dolore deserunt voluptas blanditiis et possimus voluptas error. In eos voluptatibus quia sit architecto. Facilis aliquam ut exercitationem quos quidem.', NULL, NULL, 'MasterCard', 'Discover Card', 'IIRZPIZI6AX', NULL, NULL, NULL, 'Kaela Luettgen DVM', 'Antonetta Ratke', NULL, '390 Myra Ville Suite 657', '25751 Dejah Avenue Apt. 142', 'Brekkebury', 'Wisconsin', '82872', 'Traceside', 'btromp@hotmail.com', '+1-910-402-2914', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(52, 2, 2, 1, 'AED', 11, 11, 20, 'rem', 335, 255, 13, 'Odit exercitationem voluptas enim autem. In atque dolorem quis delectus praesentium rem. Non sapiente nesciunt commodi maxime est itaque quidem.', NULL, NULL, 'Visa Retired', 'Visa', 'YVULPVNQRXC', NULL, NULL, NULL, 'Victoria Cormier', 'Eileen Rogahn', NULL, '605 Virginia Avenue', '4665 Paxton Divide', 'Wisozkview', 'Oklahoma', '61794', 'South Drewborough', 'purdy.destiney@hotmail.com', '727.995.5644', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(53, 4, 2, 1, 'LBP', 17, 13, 30, 'cumque', 352, 426, 14, 'Iure inventore consequuntur repudiandae rerum omnis fuga sint. Quis omnis quibusdam id qui repellat asperiores unde totam. Placeat qui et qui et odio. Qui aspernatur consequatur dolor nulla.', NULL, NULL, 'Visa Retired', 'MasterCard', 'BYWNKJWFIKH', NULL, NULL, NULL, 'Ellis Boehm', 'Prof. Ariel Weimann II', NULL, '69809 Connelly Mall Suite 227', '52349 Nora Junctions Suite 847', 'Quitzonmouth', 'Georgia', '37778', 'Dawsonstad', 'madie94@gmail.com', '+1-971-770-0664', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(54, 4, 2, 1, 'GYD', 10, 20, 32, 'qui', 497, 179, 18, 'Aut quos provident nesciunt et officia autem similique. At temporibus omnis laudantium corrupti.', NULL, NULL, 'MasterCard', 'Visa', 'LMHINNL2', NULL, NULL, NULL, 'Lisa Lakin DDS', 'Palma Padberg', NULL, '8800 Eichmann Divide', '7559 Lesch Springs Apt. 628', 'South Hillard', 'Alaska', '41883', 'East Rosella', 'qkeebler@stokes.org', '(223) 724-2372', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(55, 3, 2, 1, 'TMT', 13, 11, 46, 'harum', 150, 278, 16, 'Provident qui consequatur suscipit sunt ipsam. Rem quasi aut vel iusto ea. Quae dignissimos et provident reprehenderit perferendis fugiat. Minima officia qui eius excepturi dolor dicta.', NULL, NULL, 'Visa', 'Visa', 'GFDVQV6KF85', NULL, NULL, NULL, 'Wilber Hammes', 'Miss Abbigail Hackett', NULL, '9732 Thompson Ways Apt. 812', '6888 Francesco Stravenue', 'Rebekahside', 'Vermont', '63992', 'East Shea', 'marquardt.syble@hotmail.com', '650-793-6066', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(56, 5, 2, 1, 'AWG', 13, 10, 45, 'consequatur', 147, 358, 16, 'Magnam iure quis officia praesentium. Minus cum expedita veritatis labore vel velit a consectetur. Est aliquam consequatur blanditiis debitis eius rerum.', NULL, NULL, 'Visa Retired', 'MasterCard', 'TIBAPI9S', NULL, NULL, NULL, 'Felipa Goldner', 'Donnie Maggio', NULL, '221 Glover Spur', '8247 Chaya Via', 'Deborahborough', 'Washington', '08673-9908', 'Darioshire', 'wcremin@gmail.com', '820-633-7948', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(57, 4, 2, 1, 'CLP', 18, 12, 25, 'cupiditate', 443, 500, 17, 'At aspernatur est assumenda quidem dignissimos soluta. Distinctio recusandae illum deleniti sequi eaque voluptates. Sunt quod impedit vero et quod similique. Magni quis sed quo eaque recusandae.', NULL, NULL, 'Visa', 'American Express', 'ZSDMATZS', NULL, NULL, NULL, 'Dr. Patsy Konopelski Jr.', 'Eldridge Cormier MD', NULL, '47744 Gertrude Ranch', '389 Joy Divide', 'Metzfurt', 'Mississippi', '33828', 'Izabellaton', 'schmitt.jules@yahoo.com', '425-612-5725', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(58, 2, 2, 1, 'MOP', 15, 19, 12, 'assumenda', 210, 374, 13, 'Cumque quod id rerum fuga omnis optio. Sapiente labore quae recusandae voluptatem placeat tempore. Voluptatem consequatur nam mollitia veritatis.', NULL, NULL, 'Visa Retired', 'JCB', 'MLNIQZXXJM5', NULL, NULL, NULL, 'Lindsey O\'Conner', 'Prof. Kellen Dietrich', NULL, '732 Lula Light Suite 597', '5896 Eugene Ports', 'Gutkowskibury', 'Idaho', '86546-3792', 'East Delaneyport', 'chester00@shanahan.org', '605.701.4643', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(59, 3, 2, 1, 'XOF', 12, 14, 46, 'quasi', 432, 473, 19, 'Dolorem quo autem necessitatibus et. Totam quo voluptatum id esse. Minus nulla perferendis dolores eum quam soluta qui sint. Incidunt quis vel fuga voluptates quis autem id.', NULL, NULL, 'Visa', 'MasterCard', 'KIGKMD6I', NULL, NULL, NULL, 'Brandy Fahey', 'Prof. Lincoln Mann', NULL, '6839 Harvey Drives Apt. 216', '500 Aletha Isle Suite 016', 'East Celestineshire', 'North Carolina', '99970', 'Mullerfurt', 'bradtke.elmer@stiedemann.com', '+1.540.425.6122', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(60, 2, 2, 1, 'XPF', 14, 12, 45, 'similique', 159, 371, 20, 'Voluptates saepe ullam in incidunt modi et. Id et aut et tenetur quis in. Sunt possimus molestiae qui necessitatibus.', NULL, NULL, 'Visa', 'MasterCard', 'BBWONM3M', NULL, NULL, NULL, 'Gabriel Gaylord', 'Dr. Clifton Toy Jr.', NULL, '15092 Jed Spur', '42162 Wehner Brook', 'South Mabelle', 'Kansas', '88595-4391', 'Carissafort', 'fleta46@gmail.com', '(682) 628-5256', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(61, 4, 2, 1, 'AUD', 18, 13, 22, 'eligendi', 136, 285, 19, 'Voluptates sit non necessitatibus voluptatem qui sint officia. Eligendi vel reprehenderit rerum est deserunt. Iste et error aliquid totam et accusamus asperiores delectus.', NULL, NULL, 'Visa', 'MasterCard', 'VXIQZNGO504', NULL, NULL, NULL, 'Dr. Natasha Kuhic', 'Dr. Deborah Shields', NULL, '333 Champlin Mills Apt. 893', '12530 Shanahan Prairie', 'Lake Nonaside', 'California', '38591', 'New Augustine', 'plind@yahoo.com', '847.222.3001', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(62, 2, 2, 1, 'MVR', 18, 18, 10, 'consequatur', 414, 480, 15, 'Molestias maiores consequatur odio dolorum natus. Ea repellendus sed nostrum aliquam id error. Et et voluptas iure totam ut ducimus temporibus accusantium.', NULL, NULL, 'Visa', 'Visa', 'PPXAOEIY', NULL, NULL, NULL, 'Frederique Wintheiser', 'Mr. Kurt Walker', NULL, '60897 Jeffry Camp', '71595 Amaya Fort', 'Carolynestad', 'Arizona', '23515', 'Larsonland', 'wilfred98@yahoo.com', '731-574-0577', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(63, 1, 2, 1, 'HRK', 12, 13, 18, 'est', 290, 190, 14, 'Occaecati illo eum quae earum dolorum aut. Delectus accusantium facere quae facilis est.', NULL, NULL, 'Visa Retired', 'Visa', 'DSSIBJBZ', NULL, NULL, NULL, 'Hester Tillman', 'Aubree Carroll', NULL, '51693 Lonnie Plaza Apt. 294', '734 Weber Coves Suite 315', 'New Bernadettebury', 'Texas', '44900-0632', 'Auerfort', 'fredrick72@leannon.com', '1-838-866-1445', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(64, 1, 2, 1, 'ZMW', 19, 20, 47, 'porro', 409, 137, 13, 'Totam et sint ea rerum odit eos repudiandae. Expedita sit cum cumque in exercitationem reiciendis quo. Dolore eum ut et eos aliquid id.', NULL, NULL, 'Visa', 'Visa', 'WYUIXQSG', NULL, NULL, NULL, 'Miss Melba Herman V', 'Arianna Erdman', NULL, '3226 Eichmann Mountain', '31664 Christian Motorway Suite 056', 'East Ravenport', 'New York', '51381', 'East Vicenta', 'veronica08@gmail.com', '651-439-3149', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(65, 1, 2, 1, 'SYP', 20, 11, 38, 'sunt', 391, 154, 10, 'Quia autem assumenda numquam sunt rem et commodi eos. Dignissimos rerum ad voluptatem iusto. Cum omnis facilis corporis eum ratione iure perspiciatis.', NULL, NULL, 'MasterCard', 'JCB', 'IBQAFLKV', NULL, NULL, NULL, 'Asha Quitzon', 'Norma Heathcote', NULL, '354 Simone Extensions', '5247 Cesar Canyon Apt. 490', 'Lake Mazieland', 'New Jersey', '45559', 'Rutheborough', 'fkub@skiles.com', '351.660.4395', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(66, 5, 2, 1, 'JPY', 20, 17, 11, 'praesentium', 248, 390, 19, 'Eos corporis qui animi atque veritatis amet aliquid. Et nobis qui ut ut perferendis architecto. Rem aut cumque quia accusamus dicta voluptas. Distinctio quas aut ea animi esse non repellendus.', NULL, NULL, 'Visa', 'American Express', 'XHQSJHMBL38', NULL, NULL, NULL, 'Henriette Mayer', 'Dr. Gino Miller MD', NULL, '39047 Vincent Falls', '266 Orn Springs Suite 633', 'East Franco', 'Ohio', '68998', 'Noreneport', 'amir89@padberg.info', '+14302745854', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(67, 3, 2, 1, 'CDF', 18, 10, 34, 'nihil', 167, 337, 19, 'Qui harum enim dolorum veniam ut et ipsam. Dignissimos saepe eveniet consequuntur harum non et non. Quis consequuntur repellat delectus repellat expedita pariatur quod.', NULL, NULL, 'American Express', 'MasterCard', 'QDZBXI5G9W3', NULL, NULL, NULL, 'Mr. Rashad Emard III', 'Etha Hane', NULL, '5165 Dietrich Fork', '634 Mann Streets Suite 229', 'South Jarodland', 'Montana', '54077-9445', 'Stokesburgh', 'hunter63@hodkiewicz.com', '+1-805-576-6750', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(68, 2, 2, 1, 'AZN', 12, 20, 35, 'fugit', 451, 481, 13, 'Reiciendis debitis rerum quos dolor cupiditate est qui. Cumque vitae cum ratione est facere. Fuga sit debitis quia illo similique.', NULL, NULL, 'Visa', 'American Express', 'PYBLVE9KW3A', NULL, NULL, NULL, 'Maye Thompson Jr.', 'Ashtyn Feil', NULL, '7038 Lubowitz Forges Apt. 176', '69936 Goldner Parkway Apt. 237', 'Lake Prudence', 'North Carolina', '08017-0578', 'Port Jazminside', 'simeon.kassulke@gmail.com', '864-655-5384', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(69, 1, 2, 1, 'PAB', 12, 18, 27, 'cumque', 341, 133, 18, 'Dicta error harum quos perspiciatis. Nulla in at at ut. Sit cumque repellendus quos explicabo dolores. Qui est eos qui eum quisquam architecto saepe.', NULL, NULL, 'Visa', 'MasterCard', 'LSMSPLDJ23Q', NULL, NULL, NULL, 'Adolfo Hagenes', 'Miracle Stamm', NULL, '617 Ondricka Mountains Apt. 882', '40437 Johnathon Station Apt. 449', 'Conroyton', 'Alabama', '98278', 'East Izabella', 'alindgren@williamson.info', '1-828-753-2987', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(70, 1, 2, 1, 'ILS', 18, 17, 10, 'enim', 181, 350, 12, 'Voluptatibus vitae est totam. Commodi quaerat quis pariatur veritatis. Non veritatis quaerat voluptatibus placeat corrupti. Aut officiis sed et est ipsam labore molestias.', NULL, NULL, 'Visa', 'MasterCard', 'QUJVTIW1T1B', NULL, NULL, NULL, 'Pamela Huels', 'Ms. Edyth Hudson III', NULL, '51581 Schamberger Drive', '8431 Haag River', 'Port Margeberg', 'Ohio', '99136-4947', 'North Arno', 'ishanahan@weber.info', '(360) 921-8322', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(71, 3, 2, 1, 'PKR', 14, 20, 37, 'eveniet', 293, 376, 18, 'Praesentium sit et animi est omnis consequuntur. Provident possimus dignissimos error laborum. Iusto molestiae est et. Eius quod distinctio aut exercitationem optio consequatur laborum.', NULL, NULL, 'MasterCard', 'MasterCard', 'VRYZCBN431L', NULL, NULL, NULL, 'Baron Swaniawski', 'Aryanna Mayert V', NULL, '8268 Felicita Square', '85004 Madisyn Street', 'Port Walter', 'Alaska', '41809-9684', 'East Rosinafurt', 'leffler.theodore@sanford.com', '1-509-269-0441', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(72, 3, 2, 1, 'IQD', 15, 20, 43, 'et', 376, 364, 11, 'Tenetur eveniet quaerat dolorem eos consectetur corporis sunt. At esse vel molestiae neque. Maxime quo mollitia enim quaerat est.', NULL, NULL, 'MasterCard', 'Visa', 'ASKJSGUS', NULL, NULL, NULL, 'Grayce Mohr', 'Cornelius Hettinger', NULL, '613 Beier Shores Suite 038', '81402 Hermann Tunnel Suite 618', 'Lake Maeganfort', 'Florida', '60017-8019', 'Wilfridside', 'block.kyler@stamm.org', '585-718-1291', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(73, 3, 2, 1, 'ZMW', 20, 11, 40, 'libero', 105, 493, 15, 'Eaque in alias veniam maiores ullam blanditiis eligendi. Deserunt magni sint animi voluptatem. Ipsam vel officiis soluta numquam eius.', NULL, NULL, 'Visa', 'Visa Retired', 'XCYHUPCU', NULL, NULL, NULL, 'Prof. Bobbie Gulgowski II', 'Mr. Dillon Kulas', NULL, '419 Rogahn Creek Suite 150', '332 Bonnie Extensions Apt. 210', 'Lake Samville', 'Oregon', '61094-9883', 'Lake Mittieland', 'yharber@gmail.com', '(308) 571-6454', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(74, 3, 2, 1, 'ZAR', 19, 11, 47, 'eligendi', 255, 395, 16, 'Qui sint eaque deserunt harum fuga ut voluptates. Sequi non at consequuntur aut voluptatem autem unde sit.', NULL, NULL, 'Visa Retired', 'Visa', 'FEAATC1QL7R', NULL, NULL, NULL, 'Sydney Daugherty', 'Daryl Gerhold', NULL, '233 Kayleigh Fields', '6315 Wehner Gateway', 'Lake Kylee', 'Kansas', '54589-9912', 'Port Claudfurt', 'rlakin@littel.net', '+15317971851', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(75, 1, 2, 1, 'BHD', 15, 17, 16, 'sint', 211, 305, 15, 'Deleniti sunt quos sit sit. Ex eveniet quis aliquam. Nihil ipsam porro omnis eos omnis quia.', NULL, NULL, 'Visa', 'MasterCard', 'VGZEQU6PDOA', NULL, NULL, NULL, 'Kelsi Rath I', 'Kayden Feeney', NULL, '1048 Hector Pike', '922 Quitzon Forest Apt. 482', 'Lake Celia', 'Virginia', '62415-8641', 'North Francescostad', 'marianne47@hotmail.com', '(616) 204-1292', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(76, 2, 2, 1, 'QAR', 15, 11, 17, 'laudantium', 414, 498, 18, 'Commodi dolor placeat sequi assumenda aut unde aut. Mollitia sunt dolor est molestias vel. Non animi exercitationem quo laboriosam vel maxime veniam.', NULL, NULL, 'MasterCard', 'JCB', 'KZGFSEO0BSO', NULL, NULL, NULL, 'Mr. Zechariah Kuphal IV', 'Mr. Peter Little II', NULL, '795 Queen Skyway Apt. 100', '17692 Heloise Fords', 'Port Emile', 'Alabama', '95269-3433', 'North Cameron', 'dashawn07@bosco.org', '(586) 623-8716', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(77, 5, 2, 1, 'AUD', 16, 20, 23, 'quia', 375, 481, 11, 'Voluptatem omnis voluptas a. Deleniti aliquam consequatur quis aut nobis. Quae ex adipisci id voluptatem est. Soluta deleniti veniam doloribus dicta.', NULL, NULL, 'Discover Card', 'American Express', 'SCHVPRW2G8Y', NULL, NULL, NULL, 'Bryon Hills', 'Ollie Rutherford', NULL, '5192 Kuhlman Fork', '86395 Brooks View Suite 280', 'New Elwynbury', 'Texas', '20603', 'New Edythville', 'vharris@hotmail.com', '765.244.4921', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(78, 5, 2, 1, 'BHD', 19, 10, 30, 'cum', 211, 212, 19, 'Soluta accusantium quia et ipsa nulla amet ad. Id id delectus veniam omnis illum maiores.', NULL, NULL, 'MasterCard', 'MasterCard', 'YEKEGZJ045Q', NULL, NULL, NULL, 'Prof. Mireille Rohan', 'Mazie Funk I', NULL, '231 Katlyn Village', '827 Carter Corners', 'Port Raymondport', 'Missouri', '44869', 'Sylvesterburgh', 'jovani00@kautzer.com', '+1 (980) 447-5119', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(79, 1, 2, 1, 'DKK', 18, 13, 42, 'sunt', 360, 228, 17, 'Dolorum dolores quis enim. Consectetur quis inventore et aperiam dignissimos ex consectetur. Consequatur neque non molestiae velit ipsam in. Voluptas et et ea facere labore eius veritatis eum.', NULL, NULL, 'Visa', 'Visa', 'RJULJPWSTRX', NULL, NULL, NULL, 'Tevin Dickens', 'Lue Funk', NULL, '859 Bergnaum Groves Suite 243', '792 Hoeger Viaduct', 'West Niatown', 'Maryland', '32129', 'South Peggieland', 'spinka.leonor@oberbrunner.org', '614.260.5484', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(80, 2, 2, 1, 'DKK', 17, 19, 30, 'voluptate', 276, 375, 19, 'Molestiae libero alias numquam animi itaque est et et. Inventore pariatur optio enim sit et tenetur expedita. Mollitia cum est sit nemo. Consequatur est ut et unde veritatis sed ea.', NULL, NULL, 'Visa', 'MasterCard', 'BECRRWSF7SD', NULL, NULL, NULL, 'Chaim Dare', 'Christine Goldner', NULL, '6681 Joany Port', '352 Glover Court Apt. 374', 'Hyattstad', 'Wyoming', '55266-0391', 'Sanfordburgh', 'ofritsch@hotmail.com', '757.873.7907', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(81, 2, 2, 1, 'TRY', 14, 10, 19, 'sint', 159, 398, 16, 'Fugit sed eveniet totam nemo natus sit. Ea tempore cupiditate eius labore. Eum libero dolorem voluptas ex tempora consectetur.', NULL, NULL, 'Visa', 'Visa', 'DSZXOFP6JNQ', NULL, NULL, NULL, 'Miss Ima Spinka III', 'Jayde Zemlak', NULL, '55707 Mante Key', '6359 Medhurst Crossroad Apt. 049', 'Port Eleanoreport', 'Nebraska', '70569', 'Romagueraborough', 'boyle.nelson@yahoo.com', '1-820-806-7149', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(82, 3, 2, 1, 'MZN', 20, 12, 42, 'ipsa', 229, 286, 20, 'Sunt deleniti exercitationem ut ad nam. Et sed quis asperiores eveniet. Vitae consequatur et eum maxime dicta. Saepe possimus minus necessitatibus. Ullam odio sed eaque rerum culpa.', NULL, NULL, 'American Express', 'American Express', 'BQLZHLA6', NULL, NULL, NULL, 'Miss Lyda Kub DDS', 'Jordyn DuBuque', NULL, '56067 Crona Groves', '94797 Alva Glens Suite 237', 'West Bruce', 'Washington', '07810', 'Cummingstown', 'mlangosh@gmail.com', '1-518-914-8467', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(83, 4, 2, 1, 'KPW', 11, 19, 22, 'ipsa', 298, 337, 16, 'Est est rem quasi soluta est. Saepe aperiam sint voluptates qui tempora et aperiam. Sint a qui laudantium sint et ab. In rerum ut fugiat dolores.', NULL, NULL, 'MasterCard', 'MasterCard', 'SIVJKAA2XKU', NULL, NULL, NULL, 'Celine Toy', 'Aryanna Beier', NULL, '17698 Hannah Drive Apt. 402', '348 Victor Ferry', 'East Sadieport', 'Delaware', '23410', 'Lyricfurt', 'jan.jones@labadie.com', '+1 (229) 623-4056', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(84, 4, 2, 1, 'SZL', 17, 16, 50, 'aut', 212, 370, 12, 'Maiores aperiam et labore. Nam est quas sit expedita aut. Autem vitae est cum. Quia enim ipsam enim sed similique quas.', NULL, NULL, 'MasterCard', 'MasterCard', 'QAASNLBZTQC', NULL, NULL, NULL, 'Miss Alexandrea Adams Jr.', 'Flavio Goodwin', NULL, '26344 Hallie Walk', '393 Shawna River Apt. 551', 'Thielville', 'Minnesota', '74039', 'Tomasshire', 'aida.hane@yahoo.com', '+14247267717', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(85, 3, 2, 1, 'NZD', 10, 16, 16, 'iusto', 467, 272, 20, 'Voluptatum minima nihil nisi beatae eos dolorem odit. Non voluptatum neque qui tenetur dignissimos veniam fugiat porro. Ad sunt temporibus voluptates impedit eum.', NULL, NULL, 'JCB', 'MasterCard', 'TNYNSWA6', NULL, NULL, NULL, 'Price Kozey', 'Ima Spencer', NULL, '12383 Bryana Bridge', '4092 Fanny Centers Suite 529', 'Florinefurt', 'Rhode Island', '55983-2907', 'East Justenburgh', 'tina.mayert@hotmail.com', '+1-534-314-6390', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(86, 3, 2, 1, 'EUR', 15, 18, 34, 'necessitatibus', 359, 120, 11, 'Exercitationem sequi in vitae quo ea. Repellendus dolorem sint explicabo voluptatem aut. Voluptatem consequatur maxime enim iusto. Facilis dicta id quis est eveniet voluptas.', NULL, NULL, 'Discover Card', 'Visa Retired', 'EJYMGOHNY11', NULL, NULL, NULL, 'Camila Murray', 'Mariano Beatty', NULL, '57159 Hudson Street', '97815 Aufderhar Mill Suite 265', 'Port Emmyfort', 'Virginia', '97672', 'Mohrville', 'virgil78@gmail.com', '+1-321-559-7592', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(87, 5, 2, 1, 'BIF', 11, 15, 17, 'sit', 394, 302, 16, 'Nisi quo aut vero. Quisquam tempore voluptatum unde corrupti sint distinctio reprehenderit. Debitis mollitia ea architecto alias cupiditate et.', NULL, NULL, 'JCB', 'Visa', 'UASWJNHO6XF', NULL, NULL, NULL, 'Prof. Wade Kutch', 'Ms. Rahsaan Lesch DVM', NULL, '177 Lorenzo Junction Suite 559', '166 Sawayn Avenue', 'New Maybelleberg', 'Oregon', '61495-0871', 'Olsonbury', 'romaguera.camille@yahoo.com', '(267) 436-2218', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(88, 5, 2, 1, 'TZS', 15, 20, 10, 'molestiae', 268, 138, 10, 'Aliquid id dicta facere qui deserunt vel. Explicabo aliquam provident dicta voluptatem est sed ut. Ad praesentium voluptas debitis repellat sint.', NULL, NULL, 'MasterCard', 'Discover Card', 'YWOYGPIO', NULL, NULL, NULL, 'Alvena Daugherty', 'Vilma Glover', NULL, '4355 Stan Meadow Suite 041', '562 Laurel Cove Apt. 904', 'West Sheilaburgh', 'Mississippi', '76992', 'South Willy', 'lmitchell@hotmail.com', '+1.281.548.3422', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(89, 1, 2, 1, 'CRC', 18, 15, 24, 'nemo', 361, 385, 17, 'Quasi illum et ipsa quibusdam. Optio modi et aut porro quas. Et voluptatem cumque ab voluptatem.', NULL, NULL, 'Discover Card', 'Discover Card', 'OLSSMHQZ', NULL, NULL, NULL, 'Prof. Zella Nienow Jr.', 'Maxie Nitzsche', NULL, '7729 Tatyana Plaza', '1498 Kulas Port Suite 482', 'Heathcoteside', 'Delaware', '50525-8632', 'North Websterstad', 'rodriguez.roma@macejkovic.biz', '646.643.2382', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(90, 3, 2, 1, 'AMD', 15, 20, 49, 'et', 274, 479, 15, 'Rerum aperiam et omnis voluptas explicabo rerum iure. Dolorem officiis perspiciatis tenetur et. Sequi at possimus et.', NULL, NULL, 'MasterCard', 'Visa Retired', 'GOMPBWZTWYA', NULL, NULL, NULL, 'Araceli Mayert', 'Sarina Oberbrunner DDS', NULL, '991 Muller Court', '56275 Emile Trafficway', 'Ullrichport', 'Connecticut', '82564', 'Hillside', 'dahlia71@altenwerth.com', '+1-763-847-2236', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(91, 1, 2, 1, 'MGA', 13, 16, 10, 'vero', 135, 215, 15, 'Et eum perspiciatis est enim. Qui ipsa tempora voluptas. Occaecati hic sed ullam id sint. Debitis corporis saepe libero error. Maiores rerum vero dolorum illo. Vel ratione est qui enim dolor.', NULL, NULL, 'MasterCard', 'MasterCard', 'VTYOFIJM', NULL, NULL, NULL, 'Frankie Schultz', 'Kaleigh Runte', NULL, '5033 Otto Burgs Suite 824', '1329 Watsica Centers Apt. 536', 'Metzland', 'Washington', '47497', 'South Dora', 'jenifer.abbott@yahoo.com', '689-554-2172', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(92, 4, 2, 1, 'UZS', 19, 17, 35, 'sequi', 321, 470, 20, 'Rerum in sed autem cum aut. Atque ut dolor sunt sed repellat sit. Et qui expedita totam nisi. Consequatur eius et nihil minus laboriosam quas ullam numquam.', NULL, NULL, 'MasterCard', 'MasterCard', 'WFSDVG6W', NULL, NULL, NULL, 'Eloisa Klein', 'Dr. Liana Hartmann MD', NULL, '7754 Courtney Rest', '136 Jettie Port Suite 241', 'Windlerhaven', 'Utah', '05423-1919', 'Keelingside', 'glover.cary@gmail.com', '+1 (561) 610-7780', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(93, 4, 2, 1, 'WST', 12, 13, 11, 'perspiciatis', 245, 377, 14, 'Nemo ipsa nemo et qui aperiam. Dolores consequatur dolorem hic facilis omnis velit. In voluptas beatae consectetur.', NULL, NULL, 'American Express', 'MasterCard', 'ERCFVDXS', NULL, NULL, NULL, 'Candida Welch DVM', 'Korbin Cole V', NULL, '33222 Howell Track Apt. 482', '23374 Leffler Ville Apt. 434', 'Bauchchester', 'Iowa', '05259', 'Jammieside', 'kunze.samara@hotmail.com', '551-243-0108', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL);
INSERT INTO `orders` (`id`, `user_id`, `shop_id`, `status`, `currency`, `discount`, `discount_code`, `shipping_total`, `shipping_method`, `subtotal`, `total`, `tax`, `customer_note`, `billing`, `shipping`, `payment_method`, `payment_method_title`, `transaction_id`, `date_paid`, `date_completed`, `refund_amount`, `first_name`, `last_name`, `company`, `address_1`, `address_2`, `city`, `state`, `post_code`, `aptment`, `email`, `phone`, `created_at`, `updated_at`, `paren_id`) VALUES
(94, 5, 2, 1, 'MZN', 20, 19, 19, 'rerum', 166, 338, 10, 'Itaque eos sequi qui repellat doloremque deleniti. Repudiandae harum perspiciatis distinctio sit nobis porro. Non tempora impedit sunt omnis ut ut. Ut ipsum sit facere qui quam.', NULL, NULL, 'MasterCard', 'JCB', 'ZSXXSRJM', NULL, NULL, NULL, 'Opal Wilderman', 'Wilma Barrows', NULL, '4573 King Green Apt. 426', '4007 Mertz Creek', 'North Leonorfort', 'Mississippi', '44247-1854', 'Belleside', 'senger.arnaldo@hotmail.com', '+12484242021', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(95, 4, 2, 1, 'CAD', 12, 18, 30, 'cumque', 317, 249, 11, 'Magnam est deserunt mollitia. Omnis atque ratione praesentium animi facilis cum. At itaque deleniti ut quasi. Natus totam dolor ipsam ut numquam quidem ullam.', NULL, NULL, 'Visa', 'Visa', 'WTNSXDIG3YU', NULL, NULL, NULL, 'Alessandro Hyatt', 'Travis Bradtke', NULL, '542 Mertz Green Suite 429', '222 Curt Drive', 'Eldredbury', 'Kansas', '22813-8509', 'West Wilbert', 'tod78@hotmail.com', '+1-820-867-4396', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(96, 4, 2, 1, 'BIF', 15, 18, 25, 'perspiciatis', 428, 147, 12, 'Tenetur sit alias voluptatem voluptas. Dolores et veritatis qui. Aut possimus dolorem ut doloremque pariatur. Nam autem ipsam quas est qui ipsa non quo.', NULL, NULL, 'Visa Retired', 'Visa', 'HGSHRUS7', NULL, NULL, NULL, 'Prof. Sage Thompson', 'Sabrina Reinger', NULL, '178 Buckridge Way Apt. 212', '829 Iva Views', 'Borerhaven', 'Texas', '64731-9854', 'New Gildatown', 'oceane.mckenzie@hansen.biz', '+15208104382', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(97, 1, 2, 1, 'SBD', 10, 12, 32, 'ab', 457, 210, 14, 'Deleniti voluptatem molestiae vero animi accusamus. Qui voluptas aut dolores quibusdam voluptatem iure. Ad beatae ea adipisci porro ipsa. Iste nihil facere eaque et quo.', NULL, NULL, 'MasterCard', 'Visa', 'KVRJXFQFV9F', NULL, NULL, NULL, 'Ashly Kertzmann', 'Cleo Grimes', NULL, '980 Audrey Lodge Apt. 767', '250 Klein Village', 'Troyfort', 'New Mexico', '42597', 'East Elzafort', 'schamberger.lenna@yahoo.com', '+1 (641) 364-6953', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(98, 2, 2, 1, 'RON', 17, 11, 48, 'quia', 272, 101, 18, 'Doloremque voluptatibus dolor itaque facilis in commodi. Autem quo aut voluptatum minima necessitatibus suscipit aut.', NULL, NULL, 'American Express', 'Visa', 'BZHWEKSI5YR', NULL, NULL, NULL, 'Dr. Rowan Lubowitz', 'Max Dare MD', NULL, '75799 Mohr Forges Suite 616', '804 Bartell Summit', 'Odessafurt', 'Iowa', '61554', 'Port Hallieland', 'gregoria.macejkovic@yahoo.com', '(931) 518-1181', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(99, 5, 2, 1, 'GBP', 11, 16, 50, 'ut', 353, 450, 14, 'Impedit qui et consequatur laudantium nam rerum id deserunt. Dolor ut consequatur sit non sed quis asperiores. Eum omnis error molestias placeat delectus alias. Deserunt eveniet est incidunt cumque.', NULL, NULL, 'American Express', 'MasterCard', 'VOEVZPPC', NULL, NULL, NULL, 'Conor Rosenbaum Jr.', 'Junius Wilderman', NULL, '871 Don Canyon', '920 Scot Stravenue Apt. 791', 'Angelburgh', 'South Dakota', '01980', 'Port Jovany', 'jeremy86@kuhlman.info', '+1 (689) 712-9880', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(100, 5, 2, 1, 'CUP', 14, 12, 28, 'blanditiis', 260, 209, 13, 'Aut culpa reiciendis et et omnis commodi repudiandae. Provident aut iusto voluptatem facilis tempora nemo blanditiis. Iure repellendus veritatis et modi eveniet.', NULL, NULL, 'MasterCard', 'MasterCard', 'YNEYDP3T', NULL, NULL, NULL, 'Sheldon Boyer', 'Dr. Deontae Hoppe DDS', NULL, '84319 Koelpin Port', '47038 Rodger Ports Apt. 725', 'West Patienceberg', 'Washington', '92886', 'Rosellaville', 'jannie35@runte.biz', '726.834.1049', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(101, 4, 3, 1, 'AUD', 16, 13, 36, 'maiores', 135, 405, 12, 'Fugit ea reiciendis in aut beatae. Suscipit quia quia commodi quas eveniet earum. Tempore in voluptas non architecto.', NULL, NULL, 'MasterCard', 'MasterCard', 'XQSBJYVD9QE', NULL, NULL, NULL, 'Okey Goyette', 'Zion Bogisich', NULL, '73773 Devon Well Apt. 409', '70602 Brooklyn Village Apt. 373', 'West Stuart', 'Michigan', '87278-5930', 'Cleveburgh', 'sofia13@jacobs.com', '+17798084896', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(102, 4, 3, 1, 'ILS', 18, 14, 46, 'tenetur', 162, 196, 18, 'Tempore dolorem libero molestiae enim iure. Asperiores distinctio consectetur ut amet tenetur. Dolores saepe eos in ut impedit eum et.', NULL, NULL, 'Visa', 'Visa', 'OKVALQM9', NULL, NULL, NULL, 'Sabina Huels', 'Buford Pacocha', NULL, '7369 Lynch Loop Suite 917', '621 Pfannerstill Ways Apt. 032', 'Elysestad', 'Mississippi', '11058', 'Lavonhaven', 'johnston.arnoldo@hotmail.com', '828.872.2959', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(103, 2, 3, 1, 'MNT', 14, 13, 32, 'et', 379, 137, 12, 'Unde illo nemo voluptatem aspernatur. Molestiae qui velit voluptas perspiciatis magnam. Culpa quidem vel molestiae ipsam. Voluptatem amet sit est provident.', NULL, NULL, 'Visa', 'Discover Card', 'FCBJWVLF', NULL, NULL, NULL, 'Prof. Brando Purdy IV', 'Kolby Ziemann II', NULL, '7018 Kendra Garden Apt. 467', '81669 Lorenzo Mountains Suite 535', 'Durganton', 'Montana', '85556', 'New Eldredstad', 'ted26@hotmail.com', '1-480-634-1765', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(104, 5, 3, 1, 'ISK', 19, 20, 13, 'culpa', 252, 127, 12, 'Laborum voluptatem officiis numquam possimus. Non non commodi voluptatem deleniti. Ut est perferendis molestiae et.', NULL, NULL, 'Visa', 'Visa', 'RLQQSJU5', NULL, NULL, NULL, 'Jeanie Kassulke', 'Samara Jacobi MD', NULL, '19687 Zack Track Apt. 222', '214 Bernhard Pines Apt. 456', 'North Mable', 'Texas', '11467-9975', 'Abeview', 'metz.reggie@gmail.com', '(586) 554-9250', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(105, 4, 3, 1, 'WST', 19, 14, 50, 'asperiores', 399, 250, 15, 'Aut sed vitae velit sed. Tempore et tempora et consequatur. Odio a quia eos suscipit. Expedita omnis sit reiciendis vero.', NULL, NULL, 'MasterCard', 'Visa', 'FKACJYQOO9Z', NULL, NULL, NULL, 'Newton Oberbrunner', 'Mr. Hiram Boyle DVM', NULL, '739 Kunze Shores Suite 397', '4656 Nelda Village Apt. 908', 'North Kelley', 'Montana', '93412-7665', 'Hilmashire', 'torphy.leann@hotmail.com', '(970) 861-4831', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(106, 3, 3, 1, 'BGN', 20, 14, 37, 'nobis', 246, 385, 12, 'Error amet tenetur velit dolores et. Qui ut quaerat et qui id enim. Perferendis aperiam voluptatem excepturi repellat facilis perferendis. Ea vel consequatur eos et dolorum.', NULL, NULL, 'MasterCard', 'American Express', 'HUVTRRVH', NULL, NULL, NULL, 'Winfield Feil', 'Dr. Immanuel Schuster DDS', NULL, '37776 Raphael Haven Apt. 277', '71149 Lew Wall Apt. 040', 'Giovanniside', 'New Jersey', '11364-6888', 'North Ahmed', 'sondricka@gmail.com', '972.348.4768', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(107, 4, 3, 1, 'SLL', 20, 16, 23, 'consectetur', 442, 453, 16, 'Id omnis porro dignissimos. Tempore et molestias amet enim voluptas sunt. Eum est nihil quos et temporibus.', NULL, NULL, 'MasterCard', 'Visa', 'BMIMZIRQ', NULL, NULL, NULL, 'Randi Stoltenberg', 'Foster Homenick', NULL, '90168 Hassie Harbors', '244 Nellie Rapids Apt. 688', 'Javonteborough', 'Pennsylvania', '89164-8232', 'Jaymeport', 'eriberto91@yahoo.com', '859-237-7324', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(108, 1, 3, 1, 'SBD', 20, 20, 11, 'ullam', 151, 164, 20, 'Aliquid iusto quasi aut quis. Aut non et ipsum vel aperiam aliquid eius. Velit quae non impedit saepe eius. Et voluptatem aut maxime.', NULL, NULL, 'Visa', 'MasterCard', 'UHYNDE16', NULL, NULL, NULL, 'Rodrigo Hilpert', 'Ariane Bergstrom', NULL, '8102 Lauriane Cove', '405 Rod Parkway Suite 973', 'North Roymouth', 'South Dakota', '46716-0955', 'Bartolettibury', 'jbartoletti@yahoo.com', '308-861-4189', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(109, 2, 3, 1, 'KYD', 15, 16, 17, 'maxime', 219, 456, 12, 'Eaque distinctio temporibus nostrum. Vel molestiae veniam est modi animi repellendus qui rerum. Quas sint et dolorum molestiae aut molestiae et.', NULL, NULL, 'MasterCard', 'Visa', 'MFDATNQP', NULL, NULL, NULL, 'Zakary Swift', 'Dr. Lulu Greenholt', NULL, '28151 Dominic Brooks Apt. 555', '39219 Megane Plains Apt. 468', 'Blandahaven', 'Ohio', '98383-8819', 'Port Fleta', 'gernser@carroll.org', '1-315-235-3170', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(110, 1, 3, 1, 'BOB', 18, 17, 11, 'facilis', 225, 304, 12, 'Est distinctio exercitationem rerum facilis placeat qui. Quod recusandae iste sint vel. Rerum maiores quae illo incidunt accusantium fuga molestiae.', NULL, NULL, 'MasterCard', 'American Express', 'RYXLRT69WV3', NULL, NULL, NULL, 'Evan Pfannerstill MD', 'Vicenta Schulist', NULL, '3682 Ratke Rapid', '581 Ignatius Centers', 'Port Tomasa', 'Minnesota', '52145', 'Lake Kirsten', 'gregg.baumbach@hotmail.com', '+12728354020', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(111, 4, 3, 1, 'KGS', 11, 15, 35, 'et', 402, 484, 12, 'Aut sequi et dignissimos praesentium. Et voluptates doloremque laudantium sunt. Quisquam quam cupiditate ea sit quidem voluptatem ratione eum.', NULL, NULL, 'MasterCard', 'Discover Card', 'EUISLNU5LMZ', NULL, NULL, NULL, 'Keyon Braun', 'Iva Huels', NULL, '3437 Mann Flats Suite 030', '601 Marjorie Land Apt. 879', 'Kraigmouth', 'Illinois', '54978', 'North Bertafort', 'dayne.ohara@kiehn.net', '847.526.0849', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(112, 1, 3, 1, 'AZN', 16, 14, 40, 'dolores', 133, 384, 17, 'Molestias reiciendis libero est ut excepturi. Molestias consequatur aut at. Pariatur totam expedita doloremque rerum impedit et rerum. Neque tenetur aut vitae sed molestias maiores.', NULL, NULL, 'American Express', 'Visa', 'CFDQAFRJ', NULL, NULL, NULL, 'Prof. Brian Kuphal DVM', 'Sasha Gerhold', NULL, '93486 Vilma Lights Suite 241', '630 Elisha Dale Suite 333', 'Mustafaview', 'Connecticut', '30387-6927', 'Emorystad', 'whuels@larson.com', '1-980-772-7364', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(113, 1, 3, 1, 'JPY', 10, 13, 10, 'dolores', 273, 271, 15, 'Ea inventore non earum aut minus. Assumenda assumenda quam commodi quo et qui accusamus. Quia reprehenderit iure est iure minima non nihil.', NULL, NULL, 'Visa', 'Visa', 'WYVBDG3PG2F', NULL, NULL, NULL, 'Kaela Bradtke', 'Renee Upton', NULL, '5340 Rolfson Centers', '8699 Kohler Groves', 'Lake Arvelton', 'Missouri', '67983', 'Port Emmett', 'boyer.anita@harber.com', '(713) 305-2217', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(114, 5, 3, 1, 'KYD', 17, 11, 10, 'illo', 467, 178, 16, 'Et placeat rem quia cum amet. Omnis molestiae modi ab nisi amet laudantium deserunt. Provident accusamus quam blanditiis minus nihil alias est dolores.', NULL, NULL, 'MasterCard', 'Discover Card', 'ZHQPKW8P', NULL, NULL, NULL, 'Dwight Fadel', 'Prof. Jeffry Wilkinson', NULL, '9178 Jarod Square Suite 344', '3203 Luna Mountain Apt. 301', 'South Paul', 'New York', '27211-6702', 'Elenorshire', 'khaag@yahoo.com', '+1 (561) 308-6268', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(115, 3, 3, 1, 'QAR', 18, 20, 31, 'quaerat', 365, 233, 19, 'Eius dolorum autem consequatur eaque maiores est repellat. Numquam ut dolorem laborum et consequatur itaque. Ut autem sed amet.', NULL, NULL, 'American Express', 'MasterCard', 'QLWMIHO2YAH', NULL, NULL, NULL, 'Mrs. Rahsaan Gislason', 'Ulises Konopelski', NULL, '614 Toni Rapids Suite 413', '79853 Bergnaum Alley Suite 716', 'Lake Zitaport', 'Michigan', '54416-5125', 'South Fanniemouth', 'camylle.olson@hotmail.com', '608-262-5399', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(116, 2, 3, 1, 'TOP', 18, 20, 43, 'quas', 193, 263, 19, 'Voluptas nobis ut illum ipsum. Quia quos voluptas ut molestiae tempore. Ad tempore maiores et eaque sunt a sunt. Doloremque sint repudiandae et quod quia et cumque.', NULL, NULL, 'Visa', 'Visa', 'KHVSQOQ5SON', NULL, NULL, NULL, 'Camden Kozey', 'Ms. Dannie Dietrich V', NULL, '124 Ova Plaza', '616 Abbey Lake', 'Pfannerstillhaven', 'Connecticut', '68123-3759', 'Powlowskiberg', 'walsh.george@russel.biz', '361-699-9488', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(117, 2, 3, 1, 'TND', 19, 18, 38, 'beatae', 225, 462, 20, 'Quia excepturi ullam molestiae dolorum temporibus ut. Eum porro dolores vero in similique. Odio iure ut dolorum. Facere tempore necessitatibus impedit qui assumenda dicta.', NULL, NULL, 'MasterCard', 'MasterCard', 'STRSLQ8T', NULL, NULL, NULL, 'Prof. Webster Grady', 'Rachelle Prohaska', NULL, '3522 Shayne Trafficway Apt. 727', '66111 Randi Ramp', 'Breitenbergmouth', 'Arizona', '46010-3658', 'Leannonmouth', 'lbins@altenwerth.com', '(865) 272-1697', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(118, 3, 3, 1, 'ETB', 16, 13, 23, 'qui', 491, 383, 18, 'Non modi corrupti labore nesciunt. Itaque pariatur et enim ut. Earum aut id non. Dolores officiis consequatur architecto explicabo.', NULL, NULL, 'MasterCard', 'JCB', 'BTWATHAJ', NULL, NULL, NULL, 'Prof. Jasper Bruen II', 'Aubrey Boyer', NULL, '24438 Raynor Ranch Suite 890', '9265 Rutherford Park', 'East Elvis', 'Wyoming', '06701', 'Romagueratown', 'acummings@hotmail.com', '+17722379143', '2023-03-04 23:41:14', '2023-03-04 23:41:14', NULL),
(119, 2, 3, 1, 'BBD', 19, 10, 32, 'est', 149, 263, 16, 'Expedita nobis rerum ut nisi. Deserunt tempora ex labore necessitatibus. Consequatur est vitae asperiores minima consequatur ea.', NULL, NULL, 'Visa', 'MasterCard', 'FDJFWH6H', NULL, NULL, NULL, 'Wilhelmine Jakubowski', 'Destiny Boehm Jr.', NULL, '19607 Dovie Prairie Suite 746', '70154 Jared Island Apt. 231', 'Janiechester', 'Indiana', '59837-9415', 'New Lavernetown', 'jazmin.fahey@gmail.com', '(828) 624-2886', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(120, 3, 3, 1, 'QAR', 11, 13, 29, 'quia', 157, 316, 14, 'Consequatur ipsa aut aut soluta in et sit quaerat. Aspernatur quis sunt vitae fugiat reiciendis dignissimos vitae. Ex ea illo voluptatem.', NULL, NULL, 'Visa', 'Visa Retired', 'UPXXWOAI', NULL, NULL, NULL, 'Karelle Nicolas', 'Leta McKenzie', NULL, '26802 Elvie Prairie Suite 215', '8282 Pacocha Inlet Apt. 816', 'Port Darienberg', 'District of Columbia', '90421', 'North Wernerfort', 'stroman.braxton@hotmail.com', '+12283596145', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(121, 5, 3, 1, 'LKR', 19, 10, 12, 'exercitationem', 362, 238, 11, 'Sed eos et alias veritatis culpa cupiditate. Ut error dolores molestias molestiae consequuntur. Voluptatibus dolorem dolore unde ipsa voluptatem omnis.', NULL, NULL, 'Visa', 'Visa', 'VSTGPIEL9IX', NULL, NULL, NULL, 'Lynn Osinski', 'Anna Leffler', NULL, '1469 Beatrice Ville', '5067 Kunze Mountains', 'Lake Krystelfurt', 'Mississippi', '29352-6112', 'East Loyberg', 'gregorio80@hotmail.com', '(469) 253-0495', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(122, 5, 3, 1, 'LRD', 14, 18, 40, 'sed', 149, 490, 11, 'Soluta velit qui pariatur. Qui quos mollitia ab. Ut esse optio omnis. Voluptas aliquid quibusdam et sunt dolorem dolor.', NULL, NULL, 'MasterCard', 'MasterCard', 'RGQUOOX53YM', NULL, NULL, NULL, 'Eda Hermann II', 'Riley Wolff', NULL, '7141 Willard Villages', '801 Bogan Mountain Apt. 716', 'East Rick', 'Washington', '44591', 'Lake Estevan', 'christy.braun@hotmail.com', '(678) 483-0151', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(123, 1, 3, 1, 'KPW', 19, 11, 41, 'nesciunt', 158, 371, 17, 'Cupiditate sapiente maiores reprehenderit quae soluta distinctio. Voluptas et eius delectus laudantium aut. Eligendi quia sint est autem quis.', NULL, NULL, 'JCB', 'MasterCard', 'LBHQQT9C', NULL, NULL, NULL, 'Mr. Dallin Wyman', 'Prof. Gussie Bergnaum MD', NULL, '3625 Maynard Branch', '19150 Lindgren Plains Suite 454', 'Keeblerbury', 'Illinois', '98588-2634', 'East Clemenschester', 'pagac.jazlyn@mueller.com', '1-503-748-5659', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(124, 4, 3, 1, 'GEL', 12, 10, 31, 'adipisci', 285, 447, 11, 'Unde eum tenetur a est illum similique. Id officia nobis dolor et molestiae neque fuga.', NULL, NULL, 'Discover Card', 'JCB', 'TDQJWLU4AHG', NULL, NULL, NULL, 'Dr. Kendall Leannon PhD', 'Alize Kris', NULL, '2784 Deckow Summit', '4787 Wolf Estate', 'Lake Kaylahborough', 'Rhode Island', '54284', 'Lake Seanburgh', 'dane.murazik@satterfield.com', '(951) 950-8931', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(125, 5, 3, 1, 'UAH', 12, 14, 18, 'a', 277, 396, 16, 'Dolores delectus voluptatem animi. Doloribus delectus facere molestiae eum provident et voluptas. Autem sit voluptatem assumenda dignissimos ea pariatur non quisquam. Quasi ipsa esse ut.', NULL, NULL, 'Visa', 'Visa', 'PDQFTFBQ', NULL, NULL, NULL, 'Dandre Schuster', 'Maximillia Crist', NULL, '6677 Lesch Expressway', '57960 Auer Key', 'Lynchview', 'Texas', '58176-2587', 'East Edisonport', 'zjacobi@schoen.com', '380.354.1044', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(126, 5, 3, 1, 'BDT', 12, 15, 44, 'voluptates', 415, 285, 19, 'Soluta repellat eius corporis dolor omnis in nobis consequatur. Eum saepe velit quidem dolores in nesciunt rerum. Quae quia voluptatem animi sit.', NULL, NULL, 'American Express', 'Visa', 'OMEJKXN8', NULL, NULL, NULL, 'Catalina Feil', 'Mrs. Alexandrea Wuckert V', NULL, '46113 Lemke Parkway Apt. 186', '886 Terrell Forest Suite 309', 'Mitchellmouth', 'Louisiana', '58847-6897', 'Laurianefurt', 'rohan.francis@reichert.net', '(713) 963-9183', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(127, 3, 3, 1, 'XOF', 16, 15, 15, 'quasi', 430, 461, 12, 'Eos quo ab ipsum. Possimus molestias laborum aliquam quos. Odit minus cum architecto et illum eos illo.', NULL, NULL, 'Visa', 'Visa', 'SQEQSGGA', NULL, NULL, NULL, 'Mrs. Vernie Eichmann V', 'Jacky VonRueden IV', NULL, '75412 Parker Way', '9870 Swift Mills Suite 078', 'East Myrticeberg', 'North Dakota', '03066', 'Bartellhaven', 'fmraz@gmail.com', '+1.602.744.0111', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(128, 2, 3, 1, 'KWD', 17, 16, 45, 'autem', 188, 291, 10, 'Exercitationem cupiditate qui odio dignissimos et debitis. Possimus consequatur impedit voluptas sed aspernatur. Aut quas alias aspernatur dicta.', NULL, NULL, 'JCB', 'Discover Card', 'CPKALQJN', NULL, NULL, NULL, 'Sarah Mitchell', 'Sage Mayert', NULL, '98019 Gorczany Crescent Apt. 308', '970 Noe Land', 'Lake Erick', 'Montana', '18990', 'Gilbertohaven', 'dankunding@yahoo.com', '878-974-6960', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(129, 3, 3, 1, 'CZK', 13, 20, 14, 'magnam', 175, 398, 10, 'Non omnis maiores ea dignissimos sed. Qui eveniet hic veritatis labore iste doloremque. Nihil nobis iure rerum quisquam quos voluptatum.', NULL, NULL, 'American Express', 'Visa', 'DORGNPF8PML', NULL, NULL, NULL, 'Dr. Isom Wuckert', 'Lorenzo Hettinger', NULL, '60784 Rosemary Walk Apt. 967', '7567 Noemie Causeway Apt. 607', 'Lake Connorside', 'South Dakota', '74344', 'Rippinland', 'drowe@gmail.com', '+1 (445) 387-4594', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(130, 1, 3, 1, 'ETB', 20, 14, 42, 'aut', 149, 424, 12, 'Nesciunt in animi ea perspiciatis labore molestiae nihil ullam. Repudiandae voluptatum quos rem sint molestiae nulla quas. Consequatur iste laudantium et et enim sit qui.', NULL, NULL, 'Visa', 'Visa', 'BXNMLODD', NULL, NULL, NULL, 'Dr. Kamryn Raynor', 'Anika Bergnaum', NULL, '624 Daniel Springs', '306 Jose Plains Suite 699', 'Auroreport', 'Arizona', '50468-4339', 'North Meggie', 'zhomenick@donnelly.org', '929.842.5189', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(131, 4, 3, 1, 'ANG', 13, 13, 36, 'labore', 229, 129, 10, 'Sit quia totam eos est. Adipisci eaque blanditiis id sunt voluptatem in in. Deserunt voluptatem tenetur est velit ut molestiae.', NULL, NULL, 'MasterCard', 'MasterCard', 'IEUGXHGUUHU', NULL, NULL, NULL, 'Mrs. Jailyn Weissnat MD', 'Mr. Keenan Wilderman I', NULL, '6903 Ada Pines Suite 381', '89014 Bennie Lake', 'Edmondbury', 'New Hampshire', '91057-0395', 'Saigetown', 'maggio.orrin@mayert.com', '+15139589886', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(132, 3, 3, 1, 'XCD', 10, 11, 17, 'vitae', 283, 347, 19, 'Dolorem quia molestias nihil ut. Sint fugit vel ratione voluptatem. Veritatis dolores nesciunt nam aperiam ad sequi. Eos et molestiae et aperiam.', NULL, NULL, 'Visa', 'Visa', 'HFUUNPSF', NULL, NULL, NULL, 'Eleazar Schultz', 'Lavern Herzog', NULL, '61255 Ernest Way Apt. 750', '22943 Chance Burgs Apt. 270', 'Murphymouth', 'Oklahoma', '08248', 'East Urban', 'hudson.jocelyn@reilly.com', '1-346-816-5121', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(133, 5, 3, 1, 'BWP', 17, 11, 20, 'natus', 439, 206, 16, 'Et et aut mollitia. Aut odit aut voluptatem sit dolorum molestiae nihil. Recusandae numquam porro enim est blanditiis quidem. Libero possimus beatae blanditiis velit amet alias.', NULL, NULL, 'MasterCard', 'MasterCard', 'YPTSHYEV', NULL, NULL, NULL, 'Maximillia Collins', 'Dedrick Reichel', NULL, '82826 Hoppe Port', '123 Konopelski Trail', 'East Laverneburgh', 'Georgia', '74881', 'Melbaport', 'nebert@swaniawski.info', '346-563-4125', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(134, 2, 3, 1, 'NZD', 20, 12, 30, 'omnis', 329, 114, 18, 'Veritatis omnis voluptates in occaecati excepturi voluptatem. Cum architecto fuga asperiores. Cumque porro est soluta quis et. Minima incidunt vel commodi soluta.', NULL, NULL, 'Visa', 'Visa', 'LSCOQX22', NULL, NULL, NULL, 'Prof. Peter Windler', 'Dr. Rafael Harvey Jr.', NULL, '3851 Roel Isle', '7099 Matilda Manors', 'Bergstromton', 'Utah', '03638', 'North Marcelo', 'yschowalter@hotmail.com', '+1 (917) 452-4203', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(135, 1, 3, 1, 'STN', 10, 17, 11, 'nesciunt', 183, 453, 14, 'A odio voluptatem nesciunt natus. Ratione quibusdam modi laborum laboriosam culpa. Dolor neque consequatur neque et aliquid aspernatur.', NULL, NULL, 'Discover Card', 'Visa', 'UZDNFZHAY8R', NULL, NULL, NULL, 'Sallie Stanton', 'Sabina Lakin', NULL, '741 Clinton Course Suite 398', '725 Marquardt Burgs', 'Ravenport', 'Michigan', '75524', 'Minniemouth', 'dasia38@gmail.com', '+14704292871', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(136, 5, 3, 1, 'JPY', 11, 20, 36, 'eum', 327, 282, 16, 'Autem voluptatem odit et est quo repudiandae ut. Unde aut facilis quisquam esse. Et excepturi expedita non aspernatur vel eveniet cum. Iure quod minus aperiam et labore beatae.', NULL, NULL, 'American Express', 'Visa', 'KCHGZL9W4CQ', NULL, NULL, NULL, 'Richie Kreiger', 'Enoch Wiegand', NULL, '4395 Tremblay Isle', '93484 Reagan Grove', 'Brandytown', 'Rhode Island', '17323-1187', 'Lake Terry', 'flatley.hannah@gmail.com', '385.773.4997', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(137, 5, 3, 1, 'PYG', 13, 20, 27, 'officia', 378, 492, 13, 'Et nihil ducimus et non totam. Molestiae reprehenderit debitis dolores voluptatum facere veniam tenetur nesciunt. Aliquid aut illum ea maxime.', NULL, NULL, 'Discover Card', 'Visa', 'TNVZNFEY', NULL, NULL, NULL, 'Jailyn Purdy', 'Prof. Drake Metz', NULL, '58069 Fahey Summit Suite 785', '5130 Rudy Viaduct Apt. 654', 'South Graysonland', 'Wisconsin', '40420', 'Schinnertown', 'alfonzo34@grant.com', '341-321-9665', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(138, 4, 3, 1, 'ZAR', 11, 18, 15, 'a', 479, 197, 12, 'Veniam dolores saepe labore. Vel ea eos et sit. Optio rem aut architecto minus eum nulla et suscipit.', NULL, NULL, 'Visa', 'Visa', 'RIKRNM1OPY6', NULL, NULL, NULL, 'Miss Gracie Renner', 'Arno Gerlach', NULL, '568 Ryder Courts', '36514 Adolph Garden Suite 443', 'New Novaland', 'Florida', '38143', 'New Norberto', 'samanta86@yahoo.com', '+1-865-863-5891', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(139, 5, 3, 1, 'LBP', 15, 17, 30, 'est', 372, 429, 17, 'Maiores libero qui delectus reiciendis. Iste asperiores et non aut voluptatem dicta quibusdam. Magnam voluptate sed nisi quaerat. Tempore ut dolore necessitatibus repellendus neque.', NULL, NULL, 'Visa', 'Visa', 'XELPWO7DHKY', NULL, NULL, NULL, 'Cornell Jast', 'Ella Casper', NULL, '5330 Muller Falls Apt. 211', '691 Serena Pike Apt. 309', 'South Royce', 'Oklahoma', '68394', 'West Roger', 'reichert.joana@reinger.info', '+1 (325) 426-5889', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(140, 3, 3, 1, 'PYG', 20, 16, 45, 'aspernatur', 216, 304, 14, 'Sapiente possimus beatae quis voluptatem. Eligendi non officia impedit doloribus accusamus saepe. Rerum odio reprehenderit nesciunt.', NULL, NULL, 'MasterCard', 'Visa', 'XEUMSMAQ', NULL, NULL, NULL, 'Edythe Bergnaum', 'Wilmer Ebert MD', NULL, '8210 Doyle Cliffs Suite 706', '70486 Dillan Throughway', 'Howeburgh', 'South Dakota', '92164-4144', 'East Porter', 'xcrist@stoltenberg.com', '+1 (865) 931-9418', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(141, 5, 3, 1, 'TTD', 17, 11, 43, 'omnis', 423, 334, 17, 'Facilis eos veniam et qui qui corrupti. Nihil voluptatum numquam voluptatum animi sit quia aut. Illum laborum fugit molestias. Voluptatem dicta recusandae laborum placeat et eum.', NULL, NULL, 'Visa', 'Visa', 'XVBEIR3SSY3', NULL, NULL, NULL, 'Idell Schoen', 'Heather Rodriguez', NULL, '52507 Koch Grove Apt. 616', '954 Harber Grove Suite 133', 'Shyannshire', 'Ohio', '95483', 'Keelingstad', 'garfield90@yahoo.com', '+1.760.489.5962', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(142, 4, 3, 1, 'MVR', 13, 20, 34, 'voluptas', 442, 393, 17, 'Et distinctio quisquam quibusdam sint. Ullam eum accusantium sint ut. Temporibus sed quia deserunt molestiae magnam qui magni. Officiis qui sit doloribus sit et placeat.', NULL, NULL, 'MasterCard', 'MasterCard', 'DEKPAQMF', NULL, NULL, NULL, 'Mrs. Aurelie Lowe', 'Anastacio Goodwin', NULL, '2276 Lubowitz Court', '7502 DuBuque Crossing', 'West Karineton', 'Maryland', '00131-3200', 'Corbinbury', 'wilbert46@hotmail.com', '+13478615275', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(143, 4, 3, 1, 'RUB', 14, 11, 43, 'eaque', 270, 127, 18, 'Laudantium veniam nesciunt et tempore voluptate eum voluptatem. Voluptatem possimus molestiae asperiores perferendis deserunt.', NULL, NULL, 'MasterCard', 'MasterCard', 'XQNSMJH0ZED', NULL, NULL, NULL, 'Maud Hegmann', 'Alden Dibbert', NULL, '6068 Jazmyne Mission', '35881 Treutel Court Apt. 935', 'Port Jacinto', 'Florida', '03770-4071', 'New Ottofurt', 'ykuhic@gmail.com', '402-599-2847', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(144, 3, 3, 1, 'WST', 12, 17, 25, 'eaque', 498, 365, 20, 'Vitae aut non aspernatur totam facere. Consequuntur nemo molestias esse ad rerum recusandae dicta. Necessitatibus esse voluptas aut atque ea.', NULL, NULL, 'American Express', 'MasterCard', 'IRUKMVC9CJP', NULL, NULL, NULL, 'Rosario Schuster', 'Ronaldo Altenwerth', NULL, '73370 Lila Shore Suite 045', '21120 Junior Greens', 'Ritchiemouth', 'Oklahoma', '35696', 'East Durward', 'joshuah33@jaskolski.biz', '+1 (907) 796-4676', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(145, 4, 3, 1, 'STN', 14, 13, 30, 'pariatur', 366, 429, 11, 'Quisquam culpa nihil quia magni ullam. Quo et illum tempore quam aliquam. Ut laudantium alias ex provident sint. Ea sapiente tempora incidunt iure.', NULL, NULL, 'American Express', 'American Express', 'SRDSKMFDPZN', NULL, NULL, NULL, 'Narciso Hartmann PhD', 'Heber Kulas', NULL, '7062 Danyka Forks', '78840 Jules Ferry Suite 625', 'West Gustaveborough', 'Massachusetts', '86512', 'Port Adrianabury', 'friesen.wilfredo@gmail.com', '253-339-8410', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(146, 4, 3, 1, 'TRY', 12, 20, 24, 'quia', 275, 499, 14, 'Est dolor reprehenderit accusantium delectus. Quibusdam ipsa voluptates possimus ut ducimus minus a. Laudantium similique ducimus eligendi ipsum.', NULL, NULL, 'Visa', 'MasterCard', 'KTPHCO8F', NULL, NULL, NULL, 'Stuart Hill', 'Trevion Lemke PhD', NULL, '31862 Ankunding Union', '67578 Ressie Common Suite 750', 'West Jacksonstad', 'Illinois', '84272-0712', 'Marquardtshire', 'gusikowski.estefania@hotmail.com', '1-218-949-3880', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(147, 4, 3, 1, 'SDG', 15, 10, 21, 'eum', 455, 378, 12, 'Eos facere perspiciatis voluptatibus molestias nemo. Quas fuga quod officia porro quibusdam. Esse illum quae praesentium sunt et.', NULL, NULL, 'Visa', 'Visa', 'OTSTFE5XQSY', NULL, NULL, NULL, 'Jayde Stanton', 'Prof. George Lubowitz', NULL, '88041 Kovacek Roads Apt. 056', '9880 Tamara Orchard Apt. 242', 'Hauckburgh', 'Washington', '25356', 'O\'Konbury', 'jay.hansen@quitzon.net', '+1-432-996-2143', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(148, 5, 3, 1, 'CLP', 14, 18, 27, 'repellat', 404, 218, 14, 'Eaque ab ut suscipit distinctio molestiae totam iste. Possimus et est omnis libero est. Officiis cupiditate ut laudantium et ipsam temporibus nostrum.', NULL, NULL, 'MasterCard', 'Discover Card', 'MRDABR8133R', NULL, NULL, NULL, 'Alexie Muller I', 'Rosie Wisozk', NULL, '3175 Roberto Fort', '8240 Kaia Ville', 'New Jamaal', 'Georgia', '01316', 'Lake Orlandofurt', 'alysa32@kulas.com', '+12194820591', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(149, 3, 3, 1, 'UGX', 14, 18, 19, 'est', 195, 212, 12, 'Dolorem dolorum autem veritatis dolorem et autem. Corporis quasi dolor eveniet. Tenetur dolore ea non omnis labore quas nam. Ipsam libero velit eos quo doloribus.', NULL, NULL, 'Visa', 'Discover Card', 'HNFPYXRS', NULL, NULL, NULL, 'Prof. Maryse Von DDS', 'Ezra Stanton', NULL, '80718 Billy Brook Apt. 383', '8757 Steuber Road', 'New Tia', 'Utah', '47479-1302', 'Lake Jaylan', 'aubree89@kulas.info', '307-405-1442', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(150, 4, 3, 1, 'MKD', 11, 11, 22, 'excepturi', 110, 208, 12, 'Molestiae facere qui similique assumenda quod nobis. Ut vel omnis dolorem est nemo quae voluptatem. Ullam aut nesciunt eveniet laudantium.', NULL, NULL, 'MasterCard', 'American Express', 'NGBKYMP7', NULL, NULL, NULL, 'Mr. Gene Price', 'Grant Orn IV', NULL, '6640 Jesus Terrace', '421 O\'Hara Manor', 'New Celestino', 'Wisconsin', '82997', 'Lake Nora', 'kuhn.everardo@hotmail.com', '1-984-751-6043', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(151, 5, 4, 1, 'EUR', 17, 11, 20, 'velit', 284, 241, 13, 'Minima maxime error soluta praesentium fuga. Et autem dolores harum consequatur. Molestias minus animi quas nulla. Corporis quia magnam dolorem consectetur aut voluptas.', NULL, NULL, 'American Express', 'Visa', 'ENWDEEKQ', NULL, NULL, NULL, 'Deven Kuhn DVM', 'Ethelyn Jones', NULL, '12668 Schoen Shoal', '629 Jayson Loaf Suite 706', 'South Dejuanchester', 'New York', '83802-3797', 'Cormierville', 'robb.lindgren@yahoo.com', '(323) 360-6045', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(152, 1, 4, 1, 'SEK', 13, 11, 14, 'doloribus', 167, 187, 17, 'Provident tempore voluptatem consequatur est quia deserunt. Saepe provident harum impedit velit qui quos. Quod veritatis doloribus explicabo. Vitae quisquam iure qui repellendus ea distinctio.', NULL, NULL, 'American Express', 'Visa', 'ZWAULNOY6EN', NULL, NULL, NULL, 'Tyrese O\'Kon', 'Ms. Kailyn Brekke Sr.', NULL, '81037 Jenkins Mount', '206 Ottilie Island', 'Donatohaven', 'Kansas', '68226-0406', 'Eichmannland', 'vyost@dooley.net', '325-907-0032', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(153, 5, 4, 1, 'GBP', 16, 18, 21, 'expedita', 236, 347, 14, 'Tenetur voluptas unde quo voluptas officiis doloremque. Facilis blanditiis dolorem et culpa tempora nobis. Consectetur beatae odit a ipsam rem quo minima.', NULL, NULL, 'JCB', 'Visa Retired', 'POFUGBZ6', NULL, NULL, NULL, 'Dorian Roberts', 'Alexa Abshire Sr.', NULL, '9364 Rosenbaum Estates', '4928 Itzel Light Apt. 842', 'Lake Randy', 'Texas', '90523-0767', 'East Marjorieview', 'homenick.virginia@hotmail.com', '364-723-3645', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(154, 4, 4, 1, 'AOA', 12, 18, 15, 'hic', 422, 137, 20, 'Excepturi omnis quos dolor. Quibusdam nam voluptatem expedita ut laudantium et numquam. Quae officiis est voluptatem pariatur iusto. Dolores animi dicta ratione sunt labore illo.', NULL, NULL, 'Visa', 'MasterCard', 'VTTFQWL0', NULL, NULL, NULL, 'Prof. Maiya Ryan MD', 'Raphael Grimes', NULL, '3250 Rashawn Mountain', '82302 Barton Curve Apt. 811', 'Nyahport', 'Minnesota', '77838-9022', 'Hickleville', 'xkutch@yahoo.com', '347-506-0017', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(155, 2, 4, 1, 'NGN', 17, 14, 11, 'excepturi', 413, 339, 19, 'Qui dignissimos in voluptatibus pariatur adipisci. Perspiciatis quis qui officia accusamus laborum dicta maiores. Omnis facere officiis quasi consequatur.', NULL, NULL, 'Visa', 'MasterCard', 'DHYTFJDY', NULL, NULL, NULL, 'Malika Pfannerstill', 'Cynthia Rau III', NULL, '940 Brekke Field Apt. 751', '6361 Loraine Port Apt. 195', 'Lamarborough', 'Virginia', '20814-1785', 'New Bernadine', 'heidenreich.sydney@franecki.com', '562-336-1412', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(156, 5, 4, 1, 'CVE', 17, 20, 24, 'nam', 427, 212, 10, 'Omnis autem impedit nesciunt quidem quidem. Id veniam optio earum minima modi eaque. Perferendis provident earum suscipit aliquam dolor. Qui neque excepturi sit voluptatem velit.', NULL, NULL, 'American Express', 'Visa', 'OEGIMGA9IEE', NULL, NULL, NULL, 'Myah Raynor', 'Sage Grant IV', NULL, '937 Schmitt Villages Suite 116', '99643 Enola Rest Suite 680', 'Rempelstad', 'New York', '73530', 'Lake Ofeliachester', 'ayla65@bashirian.com', '+1 (480) 452-9267', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(157, 5, 4, 1, 'GTQ', 11, 19, 49, 'ipsa', 488, 301, 14, 'Et quia officia et labore omnis fuga. Assumenda inventore corrupti molestias omnis sed. Quae minus nam velit doloribus est id et.', NULL, NULL, 'JCB', 'Discover Card', 'UQNQXAOILVI', NULL, NULL, NULL, 'Estefania Bode', 'Ollie Terry', NULL, '747 Amparo Walks Apt. 211', '84268 Aubree Track', 'North Marjoryside', 'Indiana', '60141-2932', 'Lake Euna', 'reba.kub@hotmail.com', '734-894-2762', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(158, 3, 4, 1, 'GEL', 20, 18, 16, 'amet', 421, 386, 13, 'Veniam et rerum doloribus accusantium. Voluptatem voluptatem unde iusto quidem qui non vero.', NULL, NULL, 'Visa', 'MasterCard', 'JXGSPWWLMR3', NULL, NULL, NULL, 'Alena Mertz', 'Cullen Dooley', NULL, '75436 Clifton Walks', '1939 Krystal Ways', 'North Leonland', 'Virginia', '88230', 'New Davemouth', 'augusta.oconner@macejkovic.com', '1-616-287-8775', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(159, 4, 4, 1, 'ARS', 20, 11, 14, 'in', 335, 392, 15, 'Et vitae ut et iste repudiandae. Explicabo qui distinctio illum aut repellat veniam dolor. Et accusamus dignissimos qui et ad. Ipsum earum modi rerum vero neque.', NULL, NULL, 'MasterCard', 'Visa', 'EQGLYZUCOIT', NULL, NULL, NULL, 'Mr. Russell Hand DDS', 'Shemar Moen', NULL, '336 Levi Square Apt. 776', '58741 Mitchell Cliffs Apt. 203', 'Moseshaven', 'New York', '08125', 'Ivahshire', 'mreynolds@hotmail.com', '1-314-282-9232', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(160, 1, 4, 1, 'OMR', 20, 12, 46, 'est', 243, 408, 19, 'Dignissimos ipsam eum qui et beatae. Dolor ipsam corrupti praesentium nihil ut repellat dolores. Earum et perspiciatis voluptas. Accusamus id necessitatibus et est et.', NULL, NULL, 'Visa Retired', 'American Express', 'OSYUGRO9', NULL, NULL, NULL, 'Esther Ritchie III', 'Dr. Samson Doyle', NULL, '9336 Alivia Oval', '4166 Gunner Via', 'Port Lorenza', 'Illinois', '01937-6296', 'New Lazaroport', 'nader.lindsey@gmail.com', '1-270-615-8964', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(161, 1, 4, 1, 'TWD', 11, 12, 48, 'officiis', 250, 436, 17, 'Minus iste neque architecto aut. Omnis ipsam eum consequatur doloribus. Reiciendis molestiae quis in molestiae occaecati.', NULL, NULL, 'MasterCard', 'MasterCard', 'WWQMQOCA', NULL, NULL, NULL, 'Seth Crona', 'Gail Ziemann', NULL, '96325 Herzog Rue', '5311 Elise Circles', 'Brucetown', 'Wyoming', '21811-0269', 'South Mekhi', 'predovic.carlee@hotmail.com', '+1 (458) 250-7779', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(162, 4, 4, 1, 'ANG', 17, 10, 30, 'provident', 488, 114, 14, 'Non molestias aliquam qui quo aliquam qui. Voluptatem illum fugiat et dolorem quisquam numquam sint. Odio delectus consequatur rerum fugiat. Nihil quis libero quas atque.', NULL, NULL, 'Visa', 'Discover Card', 'GOOXLSNGW05', NULL, NULL, NULL, 'Miss Jessika Russel PhD', 'Miss Coralie Watsica DVM', NULL, '1781 Clovis Glen Suite 751', '76168 Bobbie Flat', 'Port Emmettburgh', 'New Jersey', '67926-7595', 'Wintheiserstad', 'langworth.brent@hotmail.com', '820.346.5930', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(163, 2, 4, 1, 'ERN', 10, 16, 43, 'temporibus', 382, 482, 16, 'Pariatur deleniti deleniti id enim. Facere commodi iure laborum sed. Quaerat error minus sint accusamus quibusdam quia. Placeat reiciendis exercitationem odio a qui quia.', NULL, NULL, 'Visa Retired', 'American Express', 'UJIXNI08', NULL, NULL, NULL, 'Ms. Tierra Zboncak', 'Buford Koelpin', NULL, '548 Beatty Ridges', '487 Armstrong Fork Suite 567', 'Willmston', 'Indiana', '17235', 'East Aylinborough', 'eichmann.zelda@yahoo.com', '+1.469.696.5003', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(164, 5, 4, 1, 'TRY', 19, 11, 46, 'nam', 144, 454, 11, 'Commodi quo ut sint vero itaque. Porro dolorem reprehenderit asperiores officiis iste dignissimos. Dolore placeat minus iusto suscipit.', NULL, NULL, 'MasterCard', 'MasterCard', 'PFGHATZCYJS', NULL, NULL, NULL, 'Jettie Bernhard', 'Prof. Damion Tillman', NULL, '33597 Justus Turnpike Apt. 559', '5228 Spinka Court', 'Lake Chelseyfurt', 'Connecticut', '79146', 'South Keyon', 'daugherty.hassie@gmail.com', '1-843-551-9342', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(165, 3, 4, 1, 'AFN', 17, 10, 20, 'ut', 129, 285, 11, 'Est magnam incidunt aut facilis aut corporis quas est. Tempora consequatur enim vero nemo voluptatem.', NULL, NULL, 'MasterCard', 'MasterCard', 'HZCANX6L', NULL, NULL, NULL, 'Nichole Boehm', 'Prof. Paolo Zboncak', NULL, '5416 Caleigh Stream', '633 Lyda Trail Apt. 983', 'East Casimer', 'Texas', '33237-4273', 'Kirabury', 'brakus.abbey@gmail.com', '314.950.3774', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(166, 1, 4, 1, 'VES', 15, 12, 50, 'dolores', 301, 301, 12, 'Officia neque distinctio ipsam facere non ut ea. Non placeat et non. Id assumenda incidunt est fugit commodi quaerat. Vitae sed et odio autem ipsam omnis velit.', NULL, NULL, 'MasterCard', 'MasterCard', 'RCGPYQ3K6FV', NULL, NULL, NULL, 'Prof. Mason Swift PhD', 'Virginia Mills', NULL, '9443 Carlie Tunnel Suite 707', '2997 Walker Islands Apt. 718', 'Walkerhaven', 'Illinois', '12512-0145', 'Port Makenna', 'upton.matilde@carroll.com', '662.828.3341', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(167, 1, 4, 1, 'KES', 12, 18, 38, 'quia', 237, 445, 19, 'Sit sunt sed ut eum. Atque sit sapiente omnis blanditiis neque. Quos esse nesciunt aut et enim.', NULL, NULL, 'Visa', 'MasterCard', 'SMSNWF7UY5J', NULL, NULL, NULL, 'Charlie Stokes', 'Shyanne Corwin', NULL, '1730 Bogisich Mission', '530 Colt Coves Suite 234', 'East Bernadine', 'Maryland', '28016', 'Kileyville', 'janelle34@gmail.com', '+1-484-970-3646', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(168, 5, 4, 1, 'BIF', 15, 13, 45, 'est', 189, 143, 11, 'Et veniam autem itaque minima aut. Et voluptatum rerum at quia nesciunt aut. Rem magni aut consequatur sit aut deleniti quae.', NULL, NULL, 'MasterCard', 'Visa', 'BWJXXXJQ6DV', NULL, NULL, NULL, 'Mr. Clovis Cremin Jr.', 'Mrs. Justine Bechtelar', NULL, '8375 Crona Brooks', '35074 Andreanne Plain Apt. 595', 'Lake Brock', 'Hawaii', '62410', 'Douglashaven', 'kiehn.rosemary@hotmail.com', '(862) 609-6323', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(169, 4, 4, 1, 'DKK', 17, 15, 38, 'dignissimos', 338, 364, 19, 'Velit aut deleniti mollitia dolor quaerat quaerat praesentium. Inventore autem illum ducimus ut sunt enim. Sed enim esse libero qui unde quas. Animi perferendis qui error sit.', NULL, NULL, 'Discover Card', 'MasterCard', 'JXVLBWDHR8U', NULL, NULL, NULL, 'Prof. Karen Weimann Sr.', 'Oscar Kohler', NULL, '91969 Marcelo Motorway Suite 986', '70843 Donny Summit', 'Bernardotown', 'New Mexico', '97740', 'Lennaborough', 'erik24@yahoo.com', '480-495-3433', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(170, 1, 4, 1, 'LBP', 15, 18, 28, 'molestiae', 327, 325, 13, 'Eligendi et exercitationem sit et recusandae. Distinctio eum fugit consequatur quaerat mollitia. Corrupti minus sit sapiente qui placeat et iste. Ut fuga non voluptatibus sit quasi omnis nostrum.', NULL, NULL, 'American Express', 'Visa', 'NXIFUVZ9XZI', NULL, NULL, NULL, 'Dagmar Wiegand', 'Bobbie Bogisich', NULL, '4614 Bernhard Ports Apt. 133', '976 Lorna Camp Apt. 672', 'Port Caden', 'New York', '64378', 'Marksfurt', 'arne89@kozey.com', '(913) 871-6526', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(171, 4, 4, 1, 'CHF', 18, 17, 42, 'hic', 443, 488, 10, 'Est veniam minus culpa pariatur est eligendi. Exercitationem ipsa vel non quia sed harum eius aspernatur. Quas ad labore quos praesentium in.', NULL, NULL, 'Visa', 'American Express', 'UIQBHQF1Z8I', NULL, NULL, NULL, 'Mrs. Corene Hartmann IV', 'Aliza Anderson', NULL, '59870 Bode Mission', '42652 Schulist Fall', 'Nelliebury', 'West Virginia', '03837', 'New Kaya', 'harrison.reichel@stehr.org', '+1-747-540-0492', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(172, 1, 4, 1, 'MMK', 17, 17, 27, 'et', 241, 250, 19, 'Est voluptatum consequuntur consectetur consequuntur ipsam expedita illum. Ut voluptate consequuntur dolores et. Quia id quis hic ipsa sint. Incidunt illum ullam perferendis.', NULL, NULL, 'MasterCard', 'Visa', 'LUSZIT5SNRQ', NULL, NULL, NULL, 'Ruben Lang', 'Jennifer Herzog', NULL, '847 Addison Forks Suite 937', '108 Travon Mill', 'Sheaview', 'Oklahoma', '51466', 'Tiaraburgh', 'althea.romaguera@hartmann.net', '1-251-425-6884', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(173, 5, 4, 1, 'GIP', 17, 11, 34, 'et', 245, 245, 10, 'Optio ipsa ut velit sunt consequatur. Assumenda aperiam iure quae nesciunt maxime qui ut voluptatem.', NULL, NULL, 'Discover Card', 'Visa', 'LEXVVG7M', NULL, NULL, NULL, 'Prof. Levi Dickinson I', 'Cleve Mills', NULL, '9164 Hoeger Via', '8976 Feest Route', 'Lake Sunnybury', 'West Virginia', '83371', 'West Ansleyland', 'jermey11@stanton.org', '+1 (805) 256-7333', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(174, 2, 4, 1, 'JPY', 14, 16, 43, 'eligendi', 178, 323, 12, 'Illum doloribus dolorem aperiam reiciendis iusto. Ut eligendi et ut sed. Tempora maxime magnam fuga rerum et blanditiis enim.', NULL, NULL, 'JCB', 'MasterCard', 'VXTDRK8D', NULL, NULL, NULL, 'Ellsworth Schuppe', 'Marquise Hackett', NULL, '289 Vandervort Crescent Suite 468', '45668 Halle Trafficway Suite 819', 'Camdenport', 'Rhode Island', '98211', 'East Emeryhaven', 'leannon.billy@hotmail.com', '+1-254-439-5909', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(175, 4, 4, 1, 'DKK', 18, 16, 48, 'et', 348, 472, 12, 'Corporis aliquid aliquid omnis molestiae. Nulla suscipit aspernatur qui ipsum ea ut. Inventore aut sunt sed repellat perspiciatis tempora. Alias minima est ad cumque repellat.', NULL, NULL, 'Visa', 'American Express', 'LAIVRW6W', NULL, NULL, NULL, 'Maggie Rohan', 'Dr. Birdie Volkman', NULL, '23704 Pouros Hill', '1799 Mayer Branch', 'Lake Wymanstad', 'Missouri', '47067-6351', 'Bettychester', 'hand.ara@yahoo.com', '(878) 271-7498', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(176, 4, 4, 1, 'HUF', 15, 15, 31, 'accusamus', 136, 275, 19, 'Vel qui optio provident. Nostrum debitis autem unde aperiam molestias qui et qui. Debitis sequi ut sit omnis. Sit ut soluta inventore quia ducimus omnis id.', NULL, NULL, 'Visa', 'JCB', 'VIFWEG2X', NULL, NULL, NULL, 'Amani Reinger', 'Agnes Johns Jr.', NULL, '1341 Aryanna River', '73967 O\'Connell Mountain', 'Lake Kennedi', 'Iowa', '06900', 'East Jerelshire', 'florence57@yahoo.com', '901-298-2367', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(177, 4, 4, 1, 'ISK', 11, 15, 10, 'maiores', 268, 297, 18, 'Ea commodi eaque est autem qui est. Voluptas adipisci necessitatibus assumenda error. Ipsa quia quia architecto. Assumenda rerum culpa in vel ex sed laborum.', NULL, NULL, 'Discover Card', 'Visa', 'FJHEUKSW2SI', NULL, NULL, NULL, 'Juvenal Hahn', 'Dr. Victoria Tromp', NULL, '95144 Breitenberg Plaza', '69066 Aliya View', 'West Karianne', 'Michigan', '97189-0020', 'Wizafurt', 'duncan.walsh@haley.com', '+1-479-423-1894', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(178, 5, 4, 1, 'ERN', 12, 16, 23, 'id', 398, 198, 19, 'Aut sit a animi. Laboriosam esse tenetur sed. Labore aliquam hic sit mollitia nemo est. Soluta voluptatum architecto et commodi eos sapiente modi. Eveniet distinctio id vel et.', NULL, NULL, 'MasterCard', 'MasterCard', 'FBEKMRGB', NULL, NULL, NULL, 'Mr. Jarrod Corkery', 'Mr. Kaden Murphy', NULL, '4257 Elissa Flats Suite 803', '677 Swaniawski Dale', 'Darienland', 'Louisiana', '76669', 'Lizaview', 'stella.damore@koepp.com', '+1.931.999.7854', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(179, 4, 4, 1, 'JOD', 10, 13, 18, 'ut', 448, 467, 15, 'Sunt a error doloremque iste. Delectus maiores ea laudantium et. In ut tenetur qui voluptatem laudantium eaque. Nostrum reprehenderit id facere illum quo.', NULL, NULL, 'Visa', 'Visa', 'OWLEIL2LC76', NULL, NULL, NULL, 'Wallace Hahn', 'Okey Wyman', NULL, '21018 Becker Divide', '722 Nathanial Mews', 'New Gerrybury', 'Massachusetts', '65678', 'East Trace', 'leopoldo30@hotmail.com', '+1 (321) 546-5625', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(180, 4, 4, 1, 'NIO', 13, 11, 44, 'corporis', 461, 426, 15, 'Quaerat veniam ab odio aliquid enim. Nulla nam voluptatem amet. Et ipsum beatae velit quasi.', NULL, NULL, 'Visa', 'MasterCard', 'PFGDDPLOQKU', NULL, NULL, NULL, 'Prof. Mervin Smith', 'Pearline Walter', NULL, '61625 Dominique Oval', '358 Ernser Ports Suite 872', 'New Dallinton', 'Hawaii', '73876', 'Hirthechester', 'odibbert@funk.com', '+1.747.307.8293', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(181, 5, 4, 1, 'EUR', 15, 12, 28, 'quasi', 250, 304, 12, 'Eum quasi tempora et perspiciatis distinctio non. Voluptates beatae qui omnis. Vel ut enim voluptate corporis enim dignissimos.', NULL, NULL, 'MasterCard', 'MasterCard', 'WKEVWTWAOFK', NULL, NULL, NULL, 'Myrna Nader', 'Brycen Willms', NULL, '9650 Haag Estates Suite 201', '7234 Sierra Meadow', 'Schillerton', 'Utah', '22101-9385', 'Lake Wilsonchester', 'hailee.breitenberg@hotmail.com', '+1-262-926-2113', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(182, 1, 4, 1, 'THB', 18, 14, 17, 'omnis', 379, 172, 11, 'Animi sed aliquid vel exercitationem modi. Temporibus culpa non voluptatem facilis. Fugit voluptas ea repellendus voluptas voluptas ipsa assumenda.', NULL, NULL, 'MasterCard', 'American Express', 'UBTBQXDL', NULL, NULL, NULL, 'Romaine Johnston II', 'Burley Dibbert', NULL, '407 Torey Junction Apt. 945', '639 Parker Shoals', 'Cleotown', 'Ohio', '85149', 'Jacobiland', 'karson.wiegand@gerhold.info', '+1-806-600-3233', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(183, 4, 4, 1, 'SLL', 15, 12, 32, 'officiis', 383, 472, 13, 'Quibusdam maiores excepturi quod molestiae ut cum. Et nihil repellat et pariatur. Iure veniam voluptates ad rerum soluta consequatur. Cupiditate ad commodi hic et.', NULL, NULL, 'Visa', 'Visa', 'SYPKEI1L', NULL, NULL, NULL, 'Isom Willms', 'Prof. Francis Jaskolski PhD', NULL, '7853 Keeling Shores', '3072 Daugherty Drive Apt. 000', 'Port Luz', 'Kentucky', '06944', 'Vincenzastad', 'gmann@hotmail.com', '+18566998322', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(184, 5, 4, 1, 'LBP', 14, 10, 42, 'nostrum', 323, 116, 10, 'Autem sit et numquam eos dolor. Numquam sit consectetur eum non ut. Fuga et ut quod quisquam id sapiente quaerat.', NULL, NULL, 'MasterCard', 'MasterCard', 'AVBWJTNM', NULL, NULL, NULL, 'Mrs. Violet Schimmel DDS', 'Miss Cora Hackett V', NULL, '8199 Liliane Canyon Suite 642', '91387 Kerluke Mission Apt. 372', 'Feestside', 'Georgia', '67195', 'South Darius', 'ukuphal@wisoky.info', '(641) 527-6259', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(185, 5, 4, 1, 'STN', 19, 19, 45, 'voluptatem', 395, 226, 20, 'Aperiam et omnis exercitationem quae eos et rerum cupiditate. Eos quia aliquam quae et corporis. Voluptas itaque deleniti in iusto exercitationem mollitia id.', NULL, NULL, 'Visa Retired', 'Visa Retired', 'TVNZPC7N79F', NULL, NULL, NULL, 'Piper Macejkovic DVM', 'Wilton Wolf Sr.', NULL, '36930 Deven Spurs', '614 Kozey Camp', 'New Chris', 'Tennessee', '13592-1383', 'Criststad', 'colson@gmail.com', '+1-828-282-9691', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(186, 5, 4, 1, 'WST', 12, 20, 38, 'officia', 353, 193, 10, 'Eos in quis sapiente est dolor at omnis. Eum necessitatibus odio reiciendis qui. Odit non maxime sit magnam dicta beatae. Optio et ipsam illum unde in perferendis sed.', NULL, NULL, 'American Express', 'Visa', 'BNNQEWPH', NULL, NULL, NULL, 'Sabryna Wuckert', 'Lue Rodriguez', NULL, '200 Satterfield Junctions Apt. 776', '12791 McLaughlin Summit Apt. 506', 'Tremaineburgh', 'Minnesota', '46401-6617', 'Barrowsfort', 'georgette.dibbert@yahoo.com', '(615) 842-6245', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(187, 5, 4, 1, 'JMD', 15, 15, 22, 'ratione', 381, 319, 13, 'Qui debitis veniam consequatur ea. Illum quisquam architecto magni adipisci ut occaecati natus. Qui eos quod molestias saepe omnis.', NULL, NULL, 'Visa', 'Discover Card', 'SDKJFCNF', NULL, NULL, NULL, 'Prof. Ethelyn Brown V', 'Don Kozey', NULL, '401 Harmony Lake Suite 554', '872 Steuber Track Suite 155', 'New Triston', 'Kansas', '79568-1277', 'South Aletha', 'makenna.jenkins@gmail.com', '640.415.9609', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL);
INSERT INTO `orders` (`id`, `user_id`, `shop_id`, `status`, `currency`, `discount`, `discount_code`, `shipping_total`, `shipping_method`, `subtotal`, `total`, `tax`, `customer_note`, `billing`, `shipping`, `payment_method`, `payment_method_title`, `transaction_id`, `date_paid`, `date_completed`, `refund_amount`, `first_name`, `last_name`, `company`, `address_1`, `address_2`, `city`, `state`, `post_code`, `aptment`, `email`, `phone`, `created_at`, `updated_at`, `paren_id`) VALUES
(188, 4, 4, 1, 'NIO', 20, 10, 25, 'aut', 376, 256, 15, 'Quia dolorem sint quae atque sunt architecto porro. Itaque est et reiciendis. Libero excepturi eum qui est.', NULL, NULL, 'Visa', 'MasterCard', 'XVXMRHRM', NULL, NULL, NULL, 'Prof. Armand Schoen V', 'Caterina Larson', NULL, '608 Adams Land Apt. 938', '71425 Felton Grove', 'Agnesmouth', 'Arkansas', '82375-2937', 'Lake Martineborough', 'florencio52@hotmail.com', '703.462.8839', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(189, 5, 4, 1, 'ERN', 19, 11, 17, 'soluta', 227, 124, 20, 'Nam fugit occaecati dolor est et. Quisquam sed harum sit maxime iste in facere. Tenetur ex dolor est optio eum modi magnam. Commodi non delectus occaecati sed ratione consectetur sed.', NULL, NULL, 'MasterCard', 'Visa', 'DSTBNOGE', NULL, NULL, NULL, 'Sanford Weimann', 'Karina Reinger Sr.', NULL, '157 Sarina Lodge', '6616 Kody Garden', 'Houstonfurt', 'Pennsylvania', '04343-8574', 'Schillerside', 'elena32@hotmail.com', '+1.757.774.4538', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(190, 1, 4, 1, 'CUP', 12, 10, 31, 'consequatur', 323, 390, 16, 'Quasi debitis amet aut tempora aut. Tempora ipsum non nihil sed praesentium occaecati et neque. Eum dolorum accusantium autem animi officia quaerat nulla.', NULL, NULL, 'Visa Retired', 'JCB', 'NCHVWJV1', NULL, NULL, NULL, 'Hayley Mertz', 'Alicia Bahringer', NULL, '215 Purdy Parkway Apt. 837', '2710 Waters Landing', 'East Santamouth', 'Nevada', '14742-6432', 'New Perrychester', 'savanah51@yahoo.com', '+1.541.847.7478', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(191, 3, 4, 1, 'GHS', 14, 17, 14, 'minus', 384, 388, 10, 'Reiciendis nulla nemo id ipsam. Illum aut laborum ut facere. Recusandae quo sequi quia sit sit aliquam. Perferendis dolor impedit assumenda aspernatur earum.', NULL, NULL, 'Visa', 'MasterCard', 'CIWTCDQZ', NULL, NULL, NULL, 'Marcella Gibson IV', 'Brionna Christiansen', NULL, '1896 Prosacco Union', '8860 Quigley Expressway', 'Bergstrommouth', 'New Hampshire', '10901-5997', 'New Joy', 'schiller.maybelle@yahoo.com', '574.451.1180', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(192, 4, 4, 1, 'LRD', 14, 17, 47, 'et', 132, 269, 11, 'Quis sint non quaerat sint illum. Consequatur quo assumenda dolorum voluptates. Tenetur officiis soluta aut officiis doloremque id. Et voluptatum distinctio sequi facere id minima.', NULL, NULL, 'MasterCard', 'American Express', 'JQWVKZ5JO9B', NULL, NULL, NULL, 'Fiona Shanahan MD', 'Sienna Hirthe', NULL, '7561 Wisoky Walk', '726 Jett Land Apt. 292', 'Port Gussie', 'Vermont', '32592-8199', 'Olafview', 'marquardt.eliseo@heidenreich.com', '+18504672754', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(193, 4, 4, 1, 'MZN', 18, 16, 25, 'repellat', 396, 468, 17, 'Qui fugit quo quae pariatur cum. Quaerat dolorum ducimus inventore maiores.', NULL, NULL, 'Visa Retired', 'MasterCard', 'AQIMGAOS9BV', NULL, NULL, NULL, 'Beau Mohr', 'Charlotte Botsford', NULL, '533 Hammes Mountains Apt. 195', '34318 Beatty Shore Apt. 167', 'South Alainaborough', 'Missouri', '68155-2786', 'North Theodoretown', 'selmer81@kovacek.com', '+1-682-719-6754', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(194, 2, 4, 1, 'MDL', 17, 12, 28, 'qui', 220, 421, 17, 'Consectetur incidunt id iure iure. Reprehenderit deleniti non sit repellat corporis.', NULL, NULL, 'JCB', 'Visa', 'HMQSDH8M', NULL, NULL, NULL, 'Rosamond Effertz', 'Shakira Schultz Jr.', NULL, '3334 Crona Dale', '1581 McKenzie Mills', 'Lake Kyra', 'Iowa', '84072-7493', 'South Frederic', 'frunolfsson@marks.info', '+1-414-822-8340', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(195, 5, 4, 1, 'XCD', 19, 18, 44, 'eum', 235, 288, 12, 'Sunt nulla animi quo molestiae dolor dignissimos dolorum. Sit ad quia sed sunt numquam. Ipsa tempore voluptas excepturi. Quas ea incidunt omnis reiciendis.', NULL, NULL, 'MasterCard', 'MasterCard', 'ALFGXMS2TWM', NULL, NULL, NULL, 'Benton Mertz', 'Dale West', NULL, '56582 Smitham Pike Apt. 279', '315 Zieme Burgs Apt. 280', 'Port Jeremymouth', 'New York', '82837-3559', 'Port Krystelbury', 'eframi@dare.com', '+1 (641) 651-0288', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(196, 3, 4, 1, 'LBP', 14, 11, 49, 'temporibus', 109, 204, 19, 'Nobis et ea sunt ut. Voluptates et voluptas placeat. Perspiciatis exercitationem quas deleniti nisi libero dicta. Optio aperiam aperiam sunt veritatis delectus.', NULL, NULL, 'MasterCard', 'Visa', 'KBTWKE5W', NULL, NULL, NULL, 'Solon Kiehn Sr.', 'Dr. Kobe Hermiston', NULL, '59664 Maxie Harbors Suite 476', '243 Raynor Plains', 'East Ali', 'Wisconsin', '57429', 'North Litzy', 'ottilie.gibson@hermiston.net', '+1 (689) 497-0178', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(197, 2, 4, 1, 'BTN', 14, 15, 18, 'qui', 336, 486, 12, 'Qui et aut mollitia vitae dolores earum aliquid. Distinctio eveniet odit minima qui saepe aperiam fuga quam. Unde aut sed repellat optio. Voluptatum blanditiis non odit recusandae dolorem voluptates.', NULL, NULL, 'MasterCard', 'American Express', 'EHXFHFSNN8L', NULL, NULL, NULL, 'Dixie Lockman', 'Amber Upton', NULL, '8980 Tad Glens Apt. 701', '1486 Maurice Stream Suite 052', 'Robeltown', 'Idaho', '04905-2366', 'Hilpertville', 'aubree.swift@koelpin.com', '956.880.2920', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(198, 1, 4, 1, 'UZS', 12, 10, 24, 'libero', 452, 140, 14, 'Eos voluptate libero est sit totam enim. Voluptas ullam debitis enim quisquam officia. Dolores molestiae sed quam perferendis quasi quos possimus. Nemo debitis molestiae quaerat necessitatibus.', NULL, NULL, 'Visa Retired', 'American Express', 'WEJFUE2N', NULL, NULL, NULL, 'Miss Edyth Hickle', 'Prof. Jade Moore', NULL, '842 Carmela Crossroad Suite 485', '61882 Kory Haven Apt. 782', 'North Imogeneburgh', 'Missouri', '30373', 'Lake Adrainchester', 'dickens.carlee@gusikowski.biz', '(678) 440-4301', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(199, 4, 4, 1, 'CLP', 12, 18, 14, 'esse', 266, 324, 15, 'Repellat consequatur aut natus inventore quaerat. Hic quo fugiat dolor autem laborum ipsum. Sunt aut sequi consequatur occaecati est rerum asperiores.', NULL, NULL, 'MasterCard', 'Visa', 'PKSNYTYV61F', NULL, NULL, NULL, 'Ernie Beahan IV', 'Cora Hartmann PhD', NULL, '76911 Bergstrom Springs', '872 Smitham Branch', 'Deckowton', 'Michigan', '49652-4765', 'Gayshire', 'cwillms@hotmail.com', '+1.432.930.2874', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(200, 2, 4, 1, 'SRD', 10, 13, 43, 'a', 490, 126, 16, 'Suscipit et expedita quaerat aspernatur. Et eos quo ipsum et voluptatem quam. Soluta officia ea at totam ex.', NULL, NULL, 'Visa', 'Visa Retired', 'FXMTSKGO', NULL, NULL, NULL, 'Prof. Muriel Hudson', 'Shayna Thompson MD', NULL, '30545 Estevan Mill', '8010 Parisian Vista', 'Lake Edison', 'District of Columbia', '34359-0070', 'New Jeanneburgh', 'hschaefer@gmail.com', '760.637.8853', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(201, 4, 5, 1, 'TRY', 10, 10, 28, 'consequatur', 188, 466, 18, 'Est beatae numquam laboriosam illum quis ad iusto. Libero dolorum quo nulla perspiciatis illum. Nisi ad doloribus voluptatem qui odio molestiae.', NULL, NULL, 'MasterCard', 'Visa', 'KKVPRWO7', NULL, NULL, NULL, 'Ayla Rowe', 'Chris Schmeler MD', NULL, '2892 Mann Summit', '8466 Wisoky Gardens Apt. 417', 'Marisolberg', 'Michigan', '07370', 'Lake Kristoffer', 'wdavis@gmail.com', '364-684-9339', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(202, 4, 5, 1, 'UAH', 10, 15, 48, 'ducimus', 498, 100, 13, 'Distinctio nam reprehenderit labore. Expedita molestiae quam reprehenderit in sed. Optio in reprehenderit earum eveniet.', NULL, NULL, 'Visa Retired', 'JCB', 'VENWFJGM6D6', NULL, NULL, NULL, 'Casandra Kihn', 'Rowland Simonis', NULL, '3524 Robel Mews', '4837 Coleman Meadow Apt. 249', 'West Franciscaburgh', 'Louisiana', '03121-7670', 'Flatleychester', 'rocky.simonis@yahoo.com', '+1 (848) 846-9276', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(203, 1, 5, 1, 'GBP', 16, 17, 14, 'eaque', 385, 306, 11, 'Tenetur non modi laboriosam autem. Dolor eum reprehenderit ducimus dolor labore ex non. Ut rem ipsa voluptatem vel recusandae consequatur ut. Dicta fugit a praesentium est illum placeat.', NULL, NULL, 'MasterCard', 'MasterCard', 'WLCGVADJ', NULL, NULL, NULL, 'Keanu Kulas I', 'Cassandre Frami', NULL, '792 Isabell Shores', '8742 Leuschke Mews', 'Walterstad', 'Maryland', '76175', 'West Ellis', 'julius62@yahoo.com', '832.987.3587', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(204, 4, 5, 1, 'CUC', 11, 14, 43, 'perspiciatis', 308, 114, 15, 'Qui rerum velit reprehenderit assumenda doloribus aspernatur mollitia odit. Fuga veniam nam rerum dolore impedit odio possimus laudantium. Illo illo autem porro laborum.', NULL, NULL, 'American Express', 'Visa', 'SKVBSR78A41', NULL, NULL, NULL, 'Dr. Domenico Bednar', 'Vernice Lubowitz', NULL, '292 Beier Village', '107 Delia Locks', 'Vandervortburgh', 'Arkansas', '50812', 'Cummingsberg', 'jovanny75@littel.biz', '253.917.7410', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(205, 2, 5, 1, 'EGP', 15, 12, 20, 'eveniet', 324, 311, 15, 'Est in adipisci dolorem animi nesciunt aperiam. Aut exercitationem earum fugiat possimus nihil at. Voluptas aut quis non asperiores velit quasi.', NULL, NULL, 'Visa Retired', 'Visa', 'UHFXQOQ6XWY', NULL, NULL, NULL, 'Sophie Weber', 'Bonita Moen', NULL, '583 Hammes Points Apt. 193', '9236 Kessler Forest Apt. 880', 'Abrahamport', 'Connecticut', '53482-6336', 'Townetown', 'braulio.dibbert@hotmail.com', '+1 (618) 714-3841', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(206, 5, 5, 1, 'ARS', 13, 13, 38, 'sed', 258, 460, 17, 'Eligendi voluptas veritatis omnis tenetur at. Veritatis unde eum ullam fugit consequatur. Et molestiae vitae odit.', NULL, NULL, 'Visa', 'Visa', 'HVZTPUL7MGS', NULL, NULL, NULL, 'Miss Carolyn Swift III', 'Grover Kuhn DVM', NULL, '89515 Hane Extension', '969 Jerde Terrace Suite 704', 'North Christy', 'Missouri', '89173', 'West Brennaview', 'alana41@bednar.com', '+1-559-770-9086', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(207, 2, 5, 1, 'XAF', 14, 10, 18, 'ea', 375, 106, 11, 'Voluptates ut est explicabo aut non. Et est et velit reprehenderit quo ipsum sed. Voluptatem accusantium fugit libero nam modi nulla autem. Similique quisquam veritatis amet voluptatibus rerum qui.', NULL, NULL, 'JCB', 'MasterCard', 'SXSDVGVB', NULL, NULL, NULL, 'Margret Stanton III', 'Eddie Cormier', NULL, '9190 Christopher Street', '865 Arvel Dam', 'North Judge', 'South Dakota', '92665', 'South Estel', 'charris@wyman.com', '602.823.1357', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(208, 1, 5, 1, 'BTN', 11, 12, 36, 'omnis', 285, 272, 10, 'Odio quia et est debitis occaecati. Alias quos est praesentium velit iste. Ullam voluptas recusandae vitae.', NULL, NULL, 'Visa', 'Discover Card', 'IDELXOW8NRN', NULL, NULL, NULL, 'Dr. Hailee Conn', 'Dr. Stewart Kiehn', NULL, '76004 Daphne Forest Suite 946', '1217 Kurt Path', 'Lake Yessenia', 'Vermont', '81872-1898', 'North Rowena', 'erobel@hotmail.com', '+1-276-791-6948', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(209, 1, 5, 1, 'TJS', 10, 10, 12, 'molestiae', 361, 393, 13, 'Quae et sint voluptatibus est. Eos et tempora ipsum. Distinctio id eligendi veniam ea minima voluptates sequi. Debitis architecto est odit voluptas at natus est nulla.', NULL, NULL, 'MasterCard', 'Visa', 'TKKYFE1L9HL', NULL, NULL, NULL, 'Marty Rowe', 'Amely Gorczany', NULL, '466 Harry Station', '775 Jermain Ridges', 'O\'Reillytown', 'Connecticut', '07089', 'East Meghan', 'cindy84@gmail.com', '270.202.8738', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(210, 5, 5, 1, 'WST', 10, 10, 23, 'accusantium', 106, 388, 20, 'Repellendus et et earum sit quia deserunt. Ipsa quia aut error iure. Harum facere reiciendis pariatur omnis.', NULL, NULL, 'Discover Card', 'MasterCard', 'DEYHYN87PZI', NULL, NULL, NULL, 'Fidel Rau I', 'Dr. Kayla Mayert III', NULL, '2463 Crist Pass', '540 Keeling Land Apt. 085', 'Toyfort', 'Arizona', '78099-2043', 'Rutherfordshire', 'rex44@hills.com', '608-201-2055', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(211, 5, 5, 1, 'GYD', 12, 13, 39, 'omnis', 449, 232, 13, 'Accusamus iste rerum sed natus. Aut dolores facere est cum. Voluptas nam enim voluptates facilis sapiente. Corporis quia quisquam est earum fugiat enim.', NULL, NULL, 'MasterCard', 'JCB', 'ELFESXAJF75', NULL, NULL, NULL, 'Mr. Nestor Johnson II', 'Nedra Casper', NULL, '930 Carrie Port Suite 406', '3602 Damaris Flats', 'Lake Ivy', 'Virginia', '93878', 'Rolfsonborough', 'abatz@hotmail.com', '678.276.7660', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(212, 2, 5, 1, 'LYD', 11, 11, 11, 'maiores', 287, 448, 11, 'Deserunt hic qui fugiat impedit culpa. Ipsa placeat et tenetur autem voluptas explicabo. Doloribus minus fugiat assumenda aut nulla iure.', NULL, NULL, 'Visa', 'MasterCard', 'CQLWEFSDEAI', NULL, NULL, NULL, 'Prof. Geovanny Rippin MD', 'Prof. Walter Jakubowski MD', NULL, '924 Schmeler Crossroad', '552 Beahan Spring', 'North Gerard', 'Connecticut', '12349', 'Lake Blaze', 'nrippin@stiedemann.biz', '+1-856-815-8904', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(213, 3, 5, 1, 'MMK', 11, 20, 23, 'quaerat', 218, 289, 19, 'Iste natus et iusto ad. Aut ad et dolorem delectus a aliquid non. Occaecati reprehenderit eum optio neque est qui.', NULL, NULL, 'MasterCard', 'Visa', 'TUNCEMO49MU', NULL, NULL, NULL, 'Mr. Caleb O\'Conner Jr.', 'Paula Hickle', NULL, '2793 Cole Trace', '27315 Lockman Cliff Suite 728', 'New Denaside', 'Arizona', '31039', 'Kingview', 'oberbrunner.erling@yahoo.com', '254-872-6611', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(214, 1, 5, 1, 'NOK', 20, 10, 38, 'quia', 151, 165, 12, 'Vel omnis et et et quo. Eaque qui ut libero quia veritatis dolorum consequatur aut. Soluta dolorem soluta delectus non repellendus ea. Eos alias quia ut omnis rerum et repellat amet.', NULL, NULL, 'Visa Retired', 'MasterCard', 'SHAZYMCM', NULL, NULL, NULL, 'Jewel Labadie DVM', 'Jordane Kulas', NULL, '4193 Kyler Forest Suite 169', '1340 Chad Cove', 'Lake Dollyview', 'South Dakota', '78812-8299', 'West Emma', 'darian85@schowalter.net', '(650) 405-0178', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(215, 4, 5, 1, 'CAD', 11, 20, 20, 'reiciendis', 430, 211, 16, 'Ab molestias voluptas tenetur sed deleniti esse. Minus id autem distinctio maxime et sapiente temporibus. Ipsum distinctio rerum voluptatem iure dolor sapiente.', NULL, NULL, 'MasterCard', 'Visa', 'SSXEKPWB8LE', NULL, NULL, NULL, 'Dr. Norbert Hagenes', 'Prof. Lina Gottlieb', NULL, '6377 Christa Trail Apt. 170', '268 Royal Lights', 'South Catherinestad', 'Missouri', '64686', 'Port Armandberg', 'klein.virginia@yahoo.com', '727-656-9363', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(216, 5, 5, 1, 'RUB', 18, 14, 20, 'velit', 152, 230, 10, 'Id ipsa minima laborum esse ut. Tempora magni cupiditate quis. Neque minus alias fugit nobis.', NULL, NULL, 'JCB', 'JCB', 'NQGLBO9U1QG', NULL, NULL, NULL, 'Casimir Haag', 'Hailee Tromp', NULL, '761 Murphy Summit Apt. 542', '432 Delores Falls Suite 478', 'Lemkeland', 'Illinois', '14377-0432', 'Claudfort', 'uwindler@yahoo.com', '(202) 789-1231', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(217, 5, 5, 1, 'KMF', 11, 12, 49, 'tempore', 132, 297, 17, 'Cumque odio dolores recusandae incidunt. Natus ut ut minima ipsa esse. Quidem repellat enim qui similique et. Ea corporis magnam debitis praesentium veritatis saepe.', NULL, NULL, 'Visa', 'JCB', 'KQIJGVHK244', NULL, NULL, NULL, 'Nova O\'Keefe', 'Frank Treutel', NULL, '8092 Lloyd Cove', '516 Raynor Manors Suite 653', 'East Breannetown', 'Iowa', '13272-4764', 'West Yasmin', 'kilback.camilla@hirthe.com', '+1 (631) 832-0373', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(218, 1, 5, 1, 'KGS', 10, 10, 39, 'aut', 415, 227, 18, 'Sint qui fugit dolores similique illo nihil. Ea et cupiditate non rem enim ut ducimus. Id dicta et deleniti architecto et.', NULL, NULL, 'Visa', 'MasterCard', 'PERYVCTX', NULL, NULL, NULL, 'Miss Kiana Tromp Jr.', 'Doyle Langosh PhD', NULL, '70601 Gabe Bypass', '2527 Pamela Route', 'Mosciskifurt', 'Utah', '67341', 'New Alexandrea', 'ucremin@hotmail.com', '+1 (903) 227-8145', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(219, 5, 5, 1, 'BWP', 12, 14, 17, 'quis', 112, 477, 18, 'Perferendis dolorem nam qui optio dolor saepe. Consequatur cum aspernatur cumque debitis sed atque. Enim quos et est nulla eius tenetur. Aut ea deserunt sit quo.', NULL, NULL, 'Visa', 'Visa', 'NKLJBHTH', NULL, NULL, NULL, 'Mrs. Electa Rau IV', 'Jamar Murazik', NULL, '374 Lea Plains', '50686 Vern Drive Suite 158', 'Hoppefurt', 'Maine', '91448-7658', 'New Dessieton', 'heloise.abshire@heller.com', '+1-458-201-0079', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(220, 4, 5, 1, 'ALL', 20, 10, 44, 'officia', 417, 234, 20, 'Quo incidunt ratione id voluptatibus debitis. Repellat unde ullam saepe delectus et. Sit id et est quae.', NULL, NULL, 'MasterCard', 'MasterCard', 'FMQGPW7XXWD', NULL, NULL, NULL, 'Bart Adams', 'Mack Fay', NULL, '78071 O\'Reilly Plain Apt. 197', '182 Ratke Summit', 'New Freda', 'Delaware', '22248-5397', 'Faustoville', 'fdickens@heathcote.com', '+15165202805', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(221, 1, 5, 1, 'GNF', 15, 10, 49, 'consequatur', 101, 300, 17, 'Quasi quam corrupti delectus ratione. Quam doloremque sit inventore libero similique quod. Saepe eius deleniti blanditiis quaerat.', NULL, NULL, 'Visa', 'Visa', 'EDLMXEVG', NULL, NULL, NULL, 'Bradford Tillman DDS', 'Korbin Schoen', NULL, '949 Greenfelder Causeway', '1092 Angel Islands', 'Huelsview', 'Hawaii', '22471', 'Johnsonmouth', 'tressie.hudson@yahoo.com', '406.688.0079', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(222, 3, 5, 1, 'HUF', 13, 20, 47, 'dolorum', 223, 440, 18, 'Qui quis et quisquam velit. Recusandae exercitationem eius suscipit sed. Id velit quia excepturi mollitia blanditiis magnam.', NULL, NULL, 'Visa Retired', 'Visa', 'UTFCET5X', NULL, NULL, NULL, 'Joe Rogahn II', 'Brayan Hackett', NULL, '252 Balistreri Freeway', '37547 Zackary Springs', 'Macside', 'North Dakota', '09976', 'Ulisesstad', 'cartwright.emelie@dibbert.com', '463-395-1120', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(223, 1, 5, 1, 'ARS', 15, 18, 34, 'nihil', 465, 383, 12, 'Dolor iure voluptates eum laboriosam. Similique natus eaque vitae dolor qui. Maxime et officiis quaerat veniam ab labore. Ipsam quia id perspiciatis labore quae omnis.', NULL, NULL, 'MasterCard', 'MasterCard', 'JFELFAMC', NULL, NULL, NULL, 'Sunny Roberts', 'Julien Kohler', NULL, '78687 Roob Tunnel Apt. 335', '97623 Julia Lock Suite 877', 'Koeppborough', 'Hawaii', '52982', 'New Judgefort', 'hilma75@johnson.info', '+1-213-335-7689', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(224, 3, 5, 1, 'FKP', 11, 15, 48, 'ratione', 191, 477, 20, 'Et iste et officia rerum dolor. Et magni accusantium dolorem consequatur tenetur eius. Sunt velit maiores omnis neque sed fuga.', NULL, NULL, 'Visa', 'MasterCard', 'FVDCUYF4', NULL, NULL, NULL, 'Ms. Albertha Ward PhD', 'Mr. Jarrell Pfannerstill PhD', NULL, '84515 Schoen Shoal', '779 Howe Via', 'South Romaine', 'Wyoming', '76624-2186', 'Gislasonchester', 'yanderson@yahoo.com', '(252) 463-2005', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(225, 3, 5, 1, 'CAD', 14, 18, 34, 'aut', 386, 474, 16, 'Voluptate velit sit repellendus minima culpa eaque. Eveniet labore atque sed ea. Exercitationem non voluptate porro. Modi sequi rerum tenetur et.', NULL, NULL, 'Visa', 'American Express', 'FARPESGK', NULL, NULL, NULL, 'Adella Douglas', 'Dr. Conner Paucek', NULL, '6814 Harmon Circles Apt. 209', '2329 Carli Lakes', 'Schroederton', 'California', '75753-2093', 'Urbanberg', 'gloria33@borer.net', '(484) 747-3091', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(226, 4, 5, 1, 'UAH', 20, 18, 11, 'dolore', 221, 461, 18, 'Eos hic distinctio consequatur officiis. Occaecati fugiat ea alias cupiditate. Nesciunt repudiandae ipsa et sequi beatae aut.', NULL, NULL, 'MasterCard', 'Visa', 'LBGEPE0VS6V', NULL, NULL, NULL, 'Lincoln Schumm', 'Jovanny Stark', NULL, '97465 Maya Mountain Suite 254', '6405 Rohan Mount Suite 779', 'Rubyburgh', 'Maryland', '26750', 'Jerelfurt', 'ajacobi@hotmail.com', '(872) 319-4201', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(227, 3, 5, 1, 'TJS', 12, 14, 34, 'nihil', 388, 472, 10, 'Eaque sint ut tempora vitae est sunt et. Consectetur ad quas inventore exercitationem. Consequatur vitae facere id praesentium. Excepturi ad molestias in corrupti aut.', NULL, NULL, 'Visa Retired', 'Visa', 'REWRRBUS', NULL, NULL, NULL, 'Cleta Kirlin', 'Shyann Kuhlman', NULL, '6052 Bechtelar Curve Apt. 638', '882 Steuber Mount Apt. 814', 'East Lurline', 'New Mexico', '47250-5650', 'South Lue', 'theron.wintheiser@yahoo.com', '463-496-2893', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(228, 2, 5, 1, 'KES', 19, 13, 26, 'aut', 312, 316, 16, 'Omnis accusantium voluptatem eius repellat omnis natus cumque. Mollitia et dolor et molestiae exercitationem. Aut voluptas et voluptatem molestias dolores ut eum non. Quas a fuga earum.', NULL, NULL, 'JCB', 'Visa Retired', 'SYILAMM4', NULL, NULL, NULL, 'Brennon Schiller', 'Mr. Clovis Altenwerth PhD', NULL, '94107 Sanford Falls', '89695 Crist Underpass Apt. 454', 'North Jerry', 'Maryland', '12412', 'South Roberto', 'turner.coby@morar.com', '(947) 515-2947', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(229, 1, 5, 1, 'PEN', 12, 15, 11, 'possimus', 375, 321, 15, 'Quia porro possimus enim nesciunt. Ut praesentium eaque sint error culpa. Perspiciatis numquam mollitia quia error.', NULL, NULL, 'Discover Card', 'Visa', 'EXABPBIJ4QZ', NULL, NULL, NULL, 'Brant Daugherty', 'Gladys Feest', NULL, '5696 Selina Freeway', '515 Santiago Shore Apt. 517', 'Rosannahaven', 'Arizona', '78044-4687', 'Lake Dorothy', 'mmiller@hotmail.com', '458-912-5137', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(230, 2, 5, 1, 'ANG', 16, 11, 20, 'enim', 455, 455, 13, 'Est id ut aspernatur et. Blanditiis sequi labore et similique vero est. Mollitia ut non tenetur. Dicta illo assumenda quis deserunt.', NULL, NULL, 'Visa', 'Visa', 'MHHTQGT8', NULL, NULL, NULL, 'Sylvan Casper II', 'Eldora Grant', NULL, '30420 Leannon Loop Apt. 285', '31291 Jones Overpass', 'West Maximus', 'North Dakota', '21740-4395', 'Idellborough', 'dallas58@hotmail.com', '+1-912-636-4706', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(231, 3, 5, 1, 'LKR', 14, 10, 23, 'et', 105, 210, 15, 'Quas necessitatibus odit id magni distinctio earum velit. Ratione quis ducimus sunt quo ad dolorem consequatur. Aut est eius amet sequi ut minus voluptatibus. Repellendus error et voluptates.', NULL, NULL, 'Visa', 'Visa', 'XIKQBW9IRIB', NULL, NULL, NULL, 'Meda Jacobson', 'Lorenzo Kozey I', NULL, '41819 Schmidt Crossing Apt. 906', '67324 Michelle Grove', 'East Anne', 'New York', '02071', 'Donnellyview', 'price38@hotmail.com', '1-410-223-6063', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(232, 1, 5, 1, 'YER', 13, 12, 20, 'harum', 177, 484, 19, 'Nulla velit exercitationem assumenda sit numquam sunt inventore vel. Et odio eveniet perspiciatis et fugiat. Ipsum sint cupiditate non sunt. Voluptatem dolor sed perspiciatis qui quidem nobis et id.', NULL, NULL, 'Visa Retired', 'MasterCard', 'CRAPMHDR', NULL, NULL, NULL, 'Prof. Reuben Goyette I', 'Charlene Kertzmann', NULL, '132 Sarina Mission Suite 012', '439 Mossie Rapids Apt. 744', 'Lake Delbert', 'California', '99334', 'North Derekton', 'khagenes@ferry.com', '+1-959-545-5889', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(233, 2, 5, 1, 'AZN', 19, 17, 40, 'et', 331, 368, 12, 'Sunt non qui ex ut est placeat eaque. Officia totam unde suscipit soluta esse enim tempore consequuntur. Id qui ipsum facilis.', NULL, NULL, 'MasterCard', 'Visa', 'CNWXGEO5ET5', NULL, NULL, NULL, 'Prof. Hortense Macejkovic V', 'Ceasar Ritchie', NULL, '6147 Walton Forks', '770 Velma Wells Apt. 987', 'North Sophia', 'Ohio', '76917-0618', 'East Jacky', 'funk.harmon@mante.com', '341-409-5251', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(234, 4, 5, 1, 'MGA', 11, 11, 48, 'est', 398, 215, 18, 'Et autem ipsam reprehenderit a suscipit minus dolores. Ut sed sit minima laudantium nihil aliquam exercitationem. Minus harum dignissimos doloribus. Omnis consequatur cupiditate laudantium error ut.', NULL, NULL, 'American Express', 'MasterCard', 'ZOHDZV6U', NULL, NULL, NULL, 'Demetris Ruecker', 'Gabriel Anderson', NULL, '9648 Zulauf Fields Apt. 107', '820 Wyman Courts Apt. 876', 'South Pinkton', 'Wyoming', '45067-6238', 'Cronachester', 'batz.casandra@frami.com', '+15099688496', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(235, 1, 5, 1, 'MDL', 10, 13, 25, 'hic', 159, 484, 11, 'Molestiae omnis praesentium amet deleniti excepturi. Tempore sed illum porro voluptate qui. Laudantium dolores ea hic ut veritatis sequi.', NULL, NULL, 'Discover Card', 'Visa', 'YOSLDU7A', NULL, NULL, NULL, 'Giovanna Bartell', 'Ada Klocko', NULL, '48532 Shaylee Fall', '69959 Ron Ramp', 'Lake Americoshire', 'North Carolina', '29039', 'South Marisolchester', 'jenkins.leonie@gmail.com', '(858) 352-8623', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(236, 2, 5, 1, 'EGP', 20, 17, 24, 'aut', 396, 240, 20, 'Quia earum nobis nihil fuga nisi qui rerum ab. Est amet ea totam dolorem odio natus. Iusto voluptatem quaerat blanditiis error molestiae et illo voluptas.', NULL, NULL, 'Visa Retired', 'MasterCard', 'PKDLFHS92W8', NULL, NULL, NULL, 'Aubrey Nolan II', 'Heaven Fadel II', NULL, '746 Pollich Islands', '6585 Lisa Squares', 'Kozeyland', 'North Carolina', '90032', 'Christiansenmouth', 'stroman.leonor@gmail.com', '619-376-8392', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(237, 3, 5, 1, 'AFN', 20, 14, 21, 'culpa', 131, 480, 19, 'Eum maxime perferendis labore enim voluptatibus dolorum. Repudiandae assumenda voluptas a sint. Porro et iure quia aut debitis.', NULL, NULL, 'MasterCard', 'MasterCard', 'XNGEJXV170L', NULL, NULL, NULL, 'Asia Bahringer', 'Kathlyn Hamill DDS', NULL, '135 Hellen Avenue', '987 Connelly Knoll Apt. 962', 'West Kraigview', 'New Hampshire', '82444', 'Rayfort', 'makenzie29@yahoo.com', '+1 (607) 691-9426', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(238, 4, 5, 1, 'BZD', 11, 13, 42, 'dolor', 219, 327, 14, 'Eligendi exercitationem quo id aut. Eius a molestiae illo delectus at nemo sed. In aut sint dolores ut nihil nihil. Id error non adipisci et consequatur tempora.', NULL, NULL, 'Visa', 'MasterCard', 'ZUBOJKV9', NULL, NULL, NULL, 'Eddie Conn', 'Kiley Beatty', NULL, '242 Raynor Spurs', '1681 Nicolas Ports Apt. 279', 'South Leannaside', 'Georgia', '00893-1663', 'Lake Leeport', 'bernier.nelle@treutel.com', '+1-915-314-6240', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(239, 5, 5, 1, 'AFN', 20, 11, 40, 'natus', 258, 399, 18, 'Recusandae occaecati quia consequatur est. Voluptas et cupiditate deserunt architecto dolore officia. Fugit quisquam cumque fuga qui et. Tempore cupiditate quia explicabo maxime.', NULL, NULL, 'Visa', 'Visa', 'MYOHVI91WGE', NULL, NULL, NULL, 'Michaela Koch', 'Nikolas Balistreri', NULL, '4317 Dietrich Path Apt. 249', '7156 Ramon Mountains', 'East Kacey', 'Minnesota', '08245-8050', 'Deannatown', 'richie11@hotmail.com', '+1-248-794-8057', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(240, 3, 5, 1, 'BMD', 13, 13, 23, 'perspiciatis', 237, 368, 16, 'Vel animi occaecati veritatis repudiandae libero neque. Esse veniam nesciunt explicabo laborum et. Voluptatem dolorem nemo ex eum sunt suscipit nobis.', NULL, NULL, 'Discover Card', 'Discover Card', 'IBOBKSLV42M', NULL, NULL, NULL, 'Aurelia Hayes', 'Cleora Cummerata', NULL, '43691 Felipe Port', '977 Weber Spur Apt. 219', 'Samirton', 'Missouri', '52536', 'East Mac', 'treutel.thora@kautzer.org', '(346) 959-3199', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(241, 5, 5, 1, 'ISK', 18, 20, 34, 'sequi', 138, 288, 11, 'Voluptatem iure et quam autem est perspiciatis laboriosam quae. Sed voluptatem aspernatur quis ducimus et et eum. Aut facilis nesciunt non.', NULL, NULL, 'MasterCard', 'MasterCard', 'NHVXGC2UTQJ', NULL, NULL, NULL, 'Alivia Becker', 'Gerhard Wilkinson', NULL, '48260 Lora Lane Suite 738', '83125 Konopelski Underpass Suite 414', 'West Evie', 'Missouri', '79532-9110', 'South Andreaneville', 'theo25@hotmail.com', '(559) 753-2986', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(242, 3, 5, 1, 'IDR', 14, 14, 22, 'recusandae', 378, 455, 19, 'Sapiente soluta ab quas inventore est deserunt nemo. Id veritatis dolorem est iure temporibus amet blanditiis. Qui ut adipisci sit possimus.', NULL, NULL, 'MasterCard', 'MasterCard', 'HUUIHTAE', NULL, NULL, NULL, 'Jocelyn Volkman', 'Wilton Yost', NULL, '4085 Hessel Gardens Apt. 828', '47819 Sporer Spurs', 'South Lia', 'Georgia', '20963', 'West Weston', 'dhill@konopelski.net', '432.358.0579', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(243, 2, 5, 1, 'TRY', 18, 16, 31, 'sed', 481, 207, 18, 'Sed et voluptatem sunt velit. Molestiae voluptas doloribus et ea nulla quia saepe. Provident animi ut ullam consequuntur et fuga. Consequatur mollitia neque impedit magnam nam.', NULL, NULL, 'Visa', 'Discover Card', 'XBKNFCYL', NULL, NULL, NULL, 'Cassie Balistreri', 'Selina Strosin', NULL, '298 Robel Well Apt. 286', '79180 Maritza Views Apt. 381', 'Estelmouth', 'Maine', '31422', 'North Laverne', 'cremin.lawson@hotmail.com', '(662) 277-7550', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(244, 3, 5, 1, 'LBP', 19, 18, 30, 'ducimus', 245, 337, 10, 'Architecto sit similique magnam distinctio numquam molestiae. Consectetur reiciendis a odio sed quidem laborum. Dolores non delectus excepturi cum. Sunt et delectus rerum quidem.', NULL, NULL, 'JCB', 'Visa', 'TNRKHQYF', NULL, NULL, NULL, 'Faye Ferry', 'Ms. Claudine Abshire', NULL, '2629 Marguerite Plaza', '58210 Prohaska Crossing', 'Novellaberg', 'Arkansas', '14697', 'Lake Hilmashire', 'astreich@lakin.net', '(678) 283-3934', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(245, 4, 5, 1, 'VUV', 19, 17, 14, 'qui', 210, 141, 19, 'Expedita libero occaecati ut est. Dolorem maiores officiis aut dolorem ut rerum sapiente. Eos ut tempore qui quaerat doloribus quia nihil quas. Dolor voluptatem ullam cupiditate exercitationem.', NULL, NULL, 'MasterCard', 'Visa', 'ARIDQUNCMD5', NULL, NULL, NULL, 'Carmela Larson', 'Kristian Rogahn', NULL, '175 Hodkiewicz Rapids', '4354 Ted Extension', 'West Maxwell', 'Minnesota', '03702', 'Tyramouth', 'lgislason@yahoo.com', '+1-725-828-2103', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(246, 2, 5, 1, 'TZS', 14, 13, 48, 'eligendi', 329, 427, 18, 'Sed quidem consequatur fugiat placeat. Voluptatem voluptas voluptas minus est quae. Saepe placeat sed soluta delectus.', NULL, NULL, 'Visa', 'Visa', 'TSPSZP88', NULL, NULL, NULL, 'Ericka McLaughlin', 'Ernie Wolf', NULL, '869 Reginald Wall Apt. 376', '520 Green Square', 'Lake Gregoria', 'Florida', '71789', 'North Krystel', 'velva20@hotmail.com', '580-679-3433', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(247, 4, 5, 1, 'BZD', 16, 19, 27, 'quasi', 448, 101, 10, 'Ipsam laborum et quos voluptas velit eius. Quia quas et molestiae aut.', NULL, NULL, 'Visa', 'MasterCard', 'GNJSQJS5', NULL, NULL, NULL, 'Ed Rodriguez PhD', 'Chelsie Roob', NULL, '446 Keeling Harbor Apt. 703', '44807 Ratke Wall', 'Hansenbury', 'Vermont', '25161', 'Grahamtown', 'dane.rice@cremin.com', '+15853836198', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(248, 3, 5, 1, 'SLL', 14, 11, 43, 'a', 310, 254, 17, 'Non et neque deleniti. Aut vel nostrum cupiditate aut porro. Iste ea in est odio magni. Quasi sed consequatur atque quod ipsum quia. Dignissimos possimus non consequatur est sed ducimus cupiditate.', NULL, NULL, 'MasterCard', 'Visa', 'ENTSNQ1L31N', NULL, NULL, NULL, 'Mr. Osborne Prohaska', 'Dallin Krajcik', NULL, '252 Viva Meadows', '929 Emmalee Lodge Apt. 788', 'Coleside', 'Minnesota', '87226', 'New Creolamouth', 'trevor.sipes@langosh.info', '614-328-2176', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(249, 3, 5, 1, 'PYG', 14, 20, 47, 'est', 280, 257, 14, 'Id saepe maxime dicta voluptatem aut facilis. Neque dolorem ex iusto maxime ut doloremque. Sequi rem quia est consequatur placeat nihil. Quia ipsam eos voluptatem rerum.', NULL, NULL, 'MasterCard', 'Visa', 'SZCONV7C', NULL, NULL, NULL, 'Leonie Schulist DVM', 'Wilton Cruickshank I', NULL, '3789 Shaina Forges', '423 Emelia Burg', 'Marksside', 'Georgia', '01324', 'Lake Pinkieville', 'rvandervort@yahoo.com', '+1.931.348.4865', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(250, 3, 5, 1, 'NZD', 11, 15, 24, 'ut', 226, 363, 16, 'Sit ad non sequi amet. Modi at harum voluptas itaque tempora sed mollitia cumque. Ex sunt laboriosam ea tenetur. Maxime perspiciatis eum maxime amet ut. Non reprehenderit animi distinctio fugit.', NULL, NULL, 'MasterCard', 'Visa', 'DLBNEMGL', NULL, NULL, NULL, 'Connie Blick', 'Veda Ward', NULL, '490 Alia Spurs', '995 McClure Ford', 'East Rick', 'Louisiana', '19021', 'North Gwendolyn', 'cali19@bednar.net', '1-315-569-4360', '2023-03-04 23:41:15', '2023-03-04 23:41:15', NULL),
(251, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Leila', 'Conley', NULL, '83 White Milton Road', 'Velit est cupiditate', 'Ea ducimus repudian', 'islamabad', 'surav@mailinator.com', 'Quas reprehenderit', 'zuherekuji@mailinator.com', '+1 (453) 921-2068', '2023-03-04 23:44:58', '2023-03-04 23:44:58', NULL),
(252, NULL, 1, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quail', 'Stein', NULL, '797 Fabien Freeway', 'Sequi id aut minima', 'Voluptas molestiae e', 'dilli', 'vewywise@mailinator.com', 'Ut et inventore et i', 'xoba@mailinator.com', '+1 (313) 953-8203', '2023-03-04 23:47:55', '2023-03-04 23:47:55', NULL),
(253, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:48:32', '2023-03-05 01:48:32', NULL),
(254, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:49:27', '2023-03-05 01:49:27', NULL),
(255, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:50:21', '2023-03-05 01:50:21', NULL),
(256, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:51:57', '2023-03-05 01:51:57', NULL),
(257, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:52:51', '2023-03-05 01:52:51', NULL),
(258, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 882, 882, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Isabelle', 'Hyde', NULL, '581 Green Nobel Road', 'Ipsam nihil qui reru', 'Ullamco recusandae', 'islamabad', 'cuh', 'Ex fugit recusandae', 'pygajoqoj@mailinator.com', '1 658 552-8719', '2023-03-05 01:53:37', '2023-03-05 01:53:37', NULL),
(259, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, 1415, 1415, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tara', 'Hendricks', NULL, '93 East Fabien Road', 'Dolore fugit vitae', 'Aut atque dolore mol', 'islamabad', 'cumegu', 'Pariatur Qui ducimu', 'qagixaj@mailinator.com', '163252-8383', '2023-03-05 01:57:15', '2023-03-05 01:57:15', NULL),
(260, 6, NULL, 1, NULL, 0, NULL, NULL, NULL, 240, 240, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Jenna Gaines', 'Gaines', NULL, 'Eveniet tempore co', 'Similique minima ita', 'Dolor eum molestiae', NULL, 'Min', NULL, 'niluka@mailinator.com', '741', '2023-03-05 02:36:07', '2023-03-05 02:36:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `total_price` int NOT NULL,
  `variation` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `product_id`, `order_id`, `quantity`, `price`, `total_price`, `variation`, `created_at`, `updated_at`) VALUES
(1, 2, 257, 1, 882, 882, 'null', '2023-03-05 01:52:51', '2023-03-05 01:52:51'),
(2, 2, 258, 1, 882, 882, 'null', '2023-03-05 01:53:37', '2023-03-05 01:53:37'),
(3, 22, 259, 1, 240, 240, 'null', '2023-03-05 01:57:16', '2023-03-05 01:57:16'),
(4, 20, 259, 1, 526, 526, 'null', '2023-03-05 01:57:16', '2023-03-05 01:57:16'),
(5, 6, 259, 1, 649, 649, 'null', '2023-03-05 01:57:16', '2023-03-05 01:57:16'),
(6, 22, 260, 1, 240, 240, 'null', '2023-03-05 02:36:07', '2023-03-05 02:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-03-04 23:40:58', '2023-03-04 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(2, 'browse_bread', NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(3, 'browse_database', NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(4, 'browse_media', NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(5, 'browse_compass', NULL, '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(6, 'browse_menus', 'menus', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(7, 'read_menus', 'menus', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(8, 'edit_menus', 'menus', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(9, 'add_menus', 'menus', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(10, 'delete_menus', 'menus', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(11, 'browse_roles', 'roles', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(12, 'read_roles', 'roles', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(13, 'edit_roles', 'roles', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(14, 'add_roles', 'roles', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(15, 'delete_roles', 'roles', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(16, 'browse_users', 'users', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(17, 'read_users', 'users', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(18, 'edit_users', 'users', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(19, 'add_users', 'users', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(20, 'delete_users', 'users', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(21, 'browse_settings', 'settings', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(22, 'read_settings', 'settings', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(23, 'edit_settings', 'settings', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(24, 'add_settings', 'settings', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(25, 'delete_settings', 'settings', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(26, 'browse_categories', 'categories', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(27, 'read_categories', 'categories', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(28, 'edit_categories', 'categories', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(29, 'add_categories', 'categories', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(30, 'delete_categories', 'categories', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(31, 'browse_posts', 'posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(32, 'read_posts', 'posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(33, 'edit_posts', 'posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(34, 'add_posts', 'posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(35, 'delete_posts', 'posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(36, 'browse_pages', 'pages', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(37, 'read_pages', 'pages', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(38, 'edit_pages', 'pages', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(39, 'add_pages', 'pages', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(40, 'delete_pages', 'pages', '2023-03-04 23:40:58', '2023-03-04 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-03-04 23:40:58', '2023-03-04 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `prodcats`
--

CREATE TABLE `prodcats` (
  `id` bigint UNSIGNED NOT NULL,
  `shop_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodcats`
--

INSERT INTO `prodcats` (`id`, `shop_id`, `name`, `logo`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Dr. Lucius Stracke PhD', 'cat/1.png', 'watsica.mozelle', NULL, NULL, NULL),
(2, 1, 'Judson Wolf', 'cat/2.png', 'rosalyn21', NULL, NULL, NULL),
(3, 2, 'Noemie Stanton', 'cat/3.png', 'uriel.stark', NULL, NULL, NULL),
(4, 4, 'Vincenza Hickle', 'cat/4.png', 'turcotte.hillary', NULL, NULL, NULL),
(5, 1, 'Mr. Joel Steuber Jr.', 'cat/5.png', 'leola.sanford', NULL, NULL, NULL),
(6, 1, 'Terry Hammes', 'cat/1.png', 'purdy.kaya', NULL, NULL, NULL),
(7, 4, 'Aileen Schultz', 'cat/2.png', 'elizabeth07', NULL, NULL, NULL),
(8, 5, 'Miss Eliane Prohaska', 'cat/3.png', 'elwin16', NULL, NULL, NULL),
(9, 5, 'Felicia Jacobson II', 'cat/4.png', 'kenny.bernhard', NULL, NULL, NULL),
(10, 1, 'Alford Skiles', 'cat/5.png', 'desmond04', NULL, NULL, NULL),
(11, 3, 'Charlene Watsica', 'cat/1.png', 'pstamm', NULL, NULL, NULL),
(12, 5, 'Sandrine Ritchie Sr.', 'cat/2.png', 'sgoldner', NULL, NULL, NULL),
(13, 5, 'Darwin Welch', 'cat/3.png', 'eliane48', NULL, NULL, NULL),
(14, 5, 'Prof. Alanna Pollich', 'cat/4.png', 'monte05', NULL, NULL, NULL),
(15, 4, 'Alvis Marks', 'cat/5.png', 'merdman', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prodcat_product`
--

CREATE TABLE `prodcat_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `prodcat_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodcat_product`
--

INSERT INTO `prodcat_product` (`id`, `product_id`, `prodcat_id`, `created_at`, `updated_at`) VALUES
(1, 32, 2, '2023-03-05 08:41:06', '2023-03-05 08:41:06'),
(2, 32, 4, '2023-03-05 08:41:06', '2023-03-05 08:41:06'),
(3, 33, 2, '2023-03-05 08:43:06', '2023-03-05 08:43:06'),
(4, 33, 4, '2023-03-05 08:43:06', '2023-03-05 08:43:06'),
(39, 34, 9, '2023-03-06 00:52:22', '2023-03-06 00:52:22'),
(41, 35, 2, '2023-03-06 00:53:37', '2023-03-06 00:53:37'),
(42, 35, 7, '2023-03-06 00:53:37', '2023-03-06 00:53:37'),
(43, 35, 5, '2023-03-06 00:53:47', '2023-03-06 00:53:47'),
(44, 36, 2, '2023-03-06 01:03:01', '2023-03-06 01:03:01'),
(45, 36, 5, '2023-03-06 01:03:01', '2023-03-06 01:03:01'),
(46, 37, 2, '2023-03-06 01:05:32', '2023-03-06 01:05:32'),
(47, 37, 5, '2023-03-06 01:05:32', '2023-03-06 01:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `shop_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `sale_price` int NOT NULL,
  `total_sale` int DEFAULT NULL,
  `downloads` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `manage_stock` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dimensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating_count` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `variations` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `shop_id`, `name`, `slug`, `type`, `status`, `featured`, `description`, `short_description`, `sku`, `price`, `sale_price`, `total_sale`, `downloads`, `manage_stock`, `quantity`, `weight`, `dimensions`, `rating_count`, `parent_id`, `image`, `images`, `variations`, `created_at`, `updated_at`) VALUES
(1, 2, 'Cassandre Kiehn Jr.', 'sed-rerum-magnam-at-delectus-maxime-delectus', 'corrupti', 1, 0, 'Saepe cumque aspernatur saepe repudiandae. Et quas consequuntur voluptas eligendi consequatur ducimus esse. Atque et odit et est consectetur. Repellendus rem similique nihil ut laborum.', 'Voluptate neque ut explicabo porro accusantium nisi cupiditate et. Harum ipsam nisi quasi repellat eum. Sint culpa tenetur officiis et nobis ipsum voluptatibus placeat.', 'ut', 975, 363, 53, 'Deserunt iure expedita molestiae facilis est molestiae. Enim et hic iusto nihil dolores ut natus. Placeat delectus qui vel consequatur.', 0, 76, NULL, NULL, 5, NULL, 'products/1.png', 'products/1.png', NULL, NULL, NULL),
(2, 1, 'Ms. Litzy Cummings', 'iure-odit-autem-cupiditate-quis', 'nemo', 1, 0, 'Quidem voluptatibus quae fugiat eaque. Veniam suscipit molestiae quibusdam.', 'Earum voluptate consequuntur reprehenderit ipsum soluta vel magni. Perferendis ut iure corrupti saepe ducimus explicabo et nam. Qui impedit maxime modi beatae.', 'eius', 192, 956, 77, 'Libero aspernatur reprehenderit nesciunt ipsam vero minima est. Et harum laboriosam magni fugiat aperiam molestiae quis et. A repellat cupiditate explicabo in.', 0, 67, NULL, NULL, 3, NULL, 'products/2.png', 'products/2.png', NULL, NULL, '2023-03-05 01:53:37'),
(3, 1, 'Prof. Elliott Murazik II', 'a-eveniet-velit-reprehenderit-et-iure-explicabo-aut', 'repellendus', 1, 0, 'Et sed consequuntur at amet repudiandae sequi perspiciatis quo. Ut eius consectetur esse qui quaerat. Sit id maiores corporis ducimus. Neque voluptates velit beatae sit ut pariatur facere.', 'Voluptatem consequuntur minus aut dolorem quibusdam necessitatibus. Aut aut ex voluptas et et velit. Voluptate voluptatum corporis nam ut beatae est nihil nobis.', 'quae', 330, 218, 68, 'Eaque fugit est recusandae in aperiam. Incidunt repellendus animi et commodi sit nulla.', 0, 16, NULL, NULL, 4, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(4, 5, 'Dr. Demario Kuhlman', 'ex-dicta-quia-harum-quaerat-enim', 'veniam', 1, 0, 'Fuga ex temporibus labore doloremque voluptatem consequatur. Rerum dolore sit autem harum consequatur. Quos quo magnam sunt veritatis voluptas quae qui.', 'Est modi nobis odio. Ut suscipit quasi quo neque. In illo quidem debitis aut dolorem.', 'voluptates', 612, 798, 14, 'Rerum suscipit dicta eum id quis fugiat. Dolor mollitia repellendus delectus autem laudantium officia voluptatem. Debitis ut nobis perferendis nisi.', 0, 71, NULL, NULL, 3, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(5, 5, 'Jaleel Kuphal DVM', 'quas-quia-veniam-quia-ea-quam-id', 'quidem', 1, 0, 'Dolores in et qui commodi. Ducimus et aliquid et magni corrupti recusandae corrupti aut. Quibusdam incidunt consectetur ab beatae.', 'Temporibus perspiciatis atque aliquam quibusdam enim est delectus. Dignissimos ipsa pariatur deserunt explicabo. Deserunt accusamus et ratione autem.', 'quidem', 340, 279, 63, 'Ut quam iste facilis omnis saepe ducimus. Voluptate recusandae hic vel mollitia. Iste est quo error consequatur officia.', 0, 11, NULL, NULL, 3, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(6, 4, 'Maude Smitham', 'qui-inventore-sit-sit-sed-repellat-deleniti', 'ut', 1, 0, 'Pariatur distinctio quia quasi quae culpa molestias ipsa tenetur. Sed aut quia sint.', 'Sit culpa quia adipisci natus aperiam. Illum aspernatur atque voluptate et. Voluptates dolores eius cupiditate cupiditate non ut quae velit.', 'non', 338, 649, 80, 'Ut voluptate nihil ducimus repellat natus harum. Accusamus quae sequi et molestiae. Assumenda adipisci neque provident.', 0, 61, NULL, NULL, 5, NULL, 'products/1.png', 'products/1.png', NULL, NULL, '2023-03-05 01:57:16'),
(7, 1, 'Meaghan Krajcik', 'autem-aut-perspiciatis-sequi-corporis-debitis-distinctio', 'assumenda', 1, 0, 'Sed itaque voluptatum inventore unde amet aut. Maiores a quisquam velit quis eius sit illum. Dolore sint quas alias excepturi commodi. Explicabo et necessitatibus dolore facilis ullam eum.', 'Sunt sint consequatur qui. Ut ratione voluptate aliquid adipisci id laborum provident. Sit aspernatur ullam consectetur tempora nulla.', 'est', 919, 456, 59, 'Rerum illo excepturi placeat omnis. Ad qui porro rerum voluptas quis ut est saepe. Rerum velit cum ipsum dolores necessitatibus quia voluptas.', 0, 50, NULL, NULL, 4, NULL, 'products/2.png', 'products/2.png', NULL, NULL, NULL),
(8, 4, 'Vinnie Fahey', 'consequatur-a-tempora-quis-maxime-voluptatibus-eligendi', 'dolorem', 1, 0, 'Blanditiis non non velit aliquid. Nisi explicabo ut est sit repudiandae inventore. Rerum hic rerum dignissimos necessitatibus amet neque ab sit. Repellat quia non illo.', 'Consequuntur sit placeat dicta aut adipisci quos cumque. Sint modi corporis quaerat ut ratione cum. Necessitatibus mollitia commodi aliquid et veniam suscipit.', 'voluptates', 644, 767, 42, 'Et quia deleniti hic facere cum et. Numquam iure ducimus dolorem enim porro. Molestiae odio reiciendis alias est vel perspiciatis.', 0, 33, NULL, NULL, 4, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(9, 2, 'Mr. Aiden Wolff', 'eos-ipsam-assumenda-saepe-voluptas-excepturi', 'odit', 1, 0, 'Delectus voluptas debitis inventore nemo quibusdam sit dolorem. Placeat dolor ea molestiae in illo. Ut magnam qui tenetur expedita nobis. Cupiditate eius placeat ducimus optio inventore.', 'Numquam minima illum et voluptatibus. Blanditiis expedita magni sit adipisci magni ipsum.', 'ut', 256, 763, 48, 'Ad odit illo ut. Debitis asperiores soluta aut autem.', 0, 78, NULL, NULL, 2, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(10, 1, 'Annalise Kovacek', 'autem-mollitia-repellat-laboriosam-mollitia-repudiandae-nostrum-tenetur', 'unde', 1, 0, 'Occaecati ea aspernatur nam. Facere quo quia modi explicabo velit non laudantium id. Dolorem modi ad occaecati perspiciatis illum nihil est. Quia nobis autem quaerat molestiae molestiae.', 'Aut dolorum culpa exercitationem facilis qui. Eos voluptate optio recusandae.', 'repellendus', 711, 892, 20, 'Tempora sed nulla aliquam cum minima sed ut. Suscipit officia voluptate incidunt accusamus et quis dolor. Molestiae maxime nisi nulla. Beatae ut aut repudiandae.', 0, 61, NULL, NULL, 3, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(11, 5, 'Kennith Bartell Jr.', 'ea-laudantium-omnis-quos-perferendis-ab-eum', 'et', 1, 0, 'Qui id rem dolores impedit. Modi architecto veniam dolor. Aperiam repudiandae aliquid officia tempora quia iusto voluptatem. Sed ea et explicabo cupiditate et.', 'Rerum est maxime repudiandae exercitationem recusandae. Dolor nisi est impedit ut explicabo. Sequi dolores esse eum sint.', 'iste', 377, 951, 72, 'Sed ut dolore et qui. Incidunt occaecati minus atque nam reiciendis ut quas. Sed nostrum voluptas voluptatem voluptas. Laudantium provident voluptate sunt cupiditate ullam ut occaecati beatae.', 0, 70, NULL, NULL, 3, NULL, 'products/1.png', 'products/1.png', NULL, NULL, NULL),
(12, 2, 'Cassidy Krajcik', 'fugiat-sed-culpa-voluptate-quia-accusantium-suscipit-sunt', 'voluptatem', 1, 0, 'Harum ducimus blanditiis tempora nesciunt. Fuga sit eos libero. Suscipit natus consequatur libero neque. Maxime provident facere officiis minus eveniet et error.', 'Delectus est vero commodi. Quam a quia ut enim non non. Possimus ipsa enim officia nobis nobis velit explicabo.', 'provident', 436, 701, 29, 'Quam asperiores quibusdam aut dolorem consequatur. Nihil omnis est nihil veniam expedita quia. Et qui sed consequuntur modi rerum. Voluptas corporis quo laudantium placeat qui voluptas.', 0, 77, NULL, NULL, 4, NULL, 'products/2.png', 'products/2.png', NULL, NULL, NULL),
(13, 5, 'Noah Kohler DDS', 'expedita-esse-beatae-nostrum-accusamus', 'temporibus', 1, 0, 'Omnis sint maiores neque laborum. Ratione vero dolorem vitae rerum maiores cupiditate. Nostrum impedit sit aut eligendi ratione. Laborum harum cupiditate ut et repellat natus autem animi.', 'Illum illo ad necessitatibus est non sequi. Est voluptatibus iste sed reiciendis eum earum quos. Reprehenderit quidem corrupti nam et numquam.', 'quae', 225, 780, 81, 'Velit quisquam laboriosam ut inventore quia voluptatem amet voluptatum. Qui quod earum dolor repellat accusamus. Saepe soluta fugit beatae inventore.', 0, 56, NULL, NULL, 2, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(14, 1, 'Jedidiah Koelpin', 'non-qui-enim-voluptatem-quaerat', 'facilis', 1, 0, 'Et nobis reiciendis rerum corrupti ipsam vel at omnis. Nisi magni soluta accusamus iste ut numquam rem. In odio dolorum est. Officia et eius necessitatibus cum esse dolorem dolorem.', 'Nihil vel dolore vel porro. Ducimus aut non beatae maiores similique. Libero aut voluptatem est voluptatem dignissimos. In libero alias voluptate quasi.', 'et', 317, 350, 62, 'Nesciunt fuga eligendi tempore tempore minima saepe. Incidunt rerum unde id id maxime vel sapiente. Consequatur cumque velit qui quaerat. Odit quam est qui porro voluptatem.', 0, 22, NULL, NULL, 5, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(15, 5, 'Ivah Considine', 'nesciunt-qui-iste-numquam-aliquid-illum-non-quaerat', 'veniam', 1, 0, 'Ea officiis quibusdam eaque nihil illum officiis. Est eos corporis nesciunt. Eos ad officia at sed non et. Aperiam aut voluptatem temporibus.', 'Fugit perferendis rerum non inventore consequatur nihil soluta. Temporibus repudiandae aut voluptas similique sit aut. Et id totam expedita reiciendis.', 'ab', 576, 721, 71, 'Neque accusantium quia ut. Eum est nihil aperiam voluptas sed et ea eligendi. Amet ut minus eaque voluptas.', 0, 87, NULL, NULL, 3, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(16, 2, 'Barbara Larkin', 'non-facilis-optio-vero-explicabo-et', 'minima', 1, 0, 'Id doloremque tenetur sapiente et voluptatem. Aliquam optio provident alias incidunt. Natus ut dolore incidunt voluptatum atque.', 'Blanditiis eum qui dolorum occaecati culpa blanditiis ipsa. Rerum quia harum est rem facilis eos iusto rerum. Architecto aut velit quia.', 'est', 748, 297, 35, 'Et ipsa quia nam et porro maxime. Et quae voluptatem ut suscipit dolores itaque. Ex ducimus laboriosam pariatur ullam debitis. Modi qui qui sint neque consequatur.', 0, 46, NULL, NULL, 1, NULL, 'products/1.png', 'products/1.png', NULL, NULL, NULL),
(17, 4, 'Dr. Boris Sipes', 'aliquid-quas-et-velit-similique-minima', 'quis', 1, 0, 'Numquam placeat ad ipsam non et voluptatem. Quos officia qui eius tenetur asperiores voluptatem. Eos recusandae suscipit aut asperiores. Nobis distinctio iusto iste molestiae qui error.', 'Et voluptatem laudantium nam blanditiis. Dolor sequi odit eum magnam omnis aliquid commodi. Aut adipisci sequi sed aperiam deleniti molestiae nulla enim. Esse eveniet necessitatibus ab.', 'voluptas', 854, 532, 42, 'Quis et autem aut et et. Qui et inventore laboriosam dolorum. Ut nulla assumenda facilis.', 0, 94, NULL, NULL, 4, NULL, 'products/2.png', 'products/2.png', NULL, NULL, NULL),
(18, 4, 'Rowan DuBuque', 'quis-mollitia-ullam-quasi-culpa-minima', 'perferendis', 1, 0, 'Error culpa pariatur ipsam sit fugit dolor voluptas. Exercitationem nesciunt rerum voluptatem atque. Facilis repellendus officia eos iste nostrum molestiae est.', 'Voluptatem non enim inventore quo. Facilis impedit facere quia ut asperiores. A quia illo quo qui facilis. Repellendus sunt molestiae enim hic corporis eveniet ut.', 'neque', 932, 266, 60, 'Repellat quasi eius et voluptatum. Omnis ad error molestiae dignissimos sapiente porro. Sed recusandae qui et eveniet aliquid consequatur accusantium accusantium.', 0, 50, NULL, NULL, 5, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(19, 3, 'Dr. Keagan Herman II', 'possimus-non-vel-autem-sunt-consequatur-vitae-voluptate', 'velit', 1, 0, 'Placeat aspernatur reprehenderit enim fuga laudantium. Expedita et cumque ut est. Eaque distinctio voluptas nostrum sunt itaque voluptatibus maiores voluptas.', 'Eum excepturi aut vitae omnis accusantium sit eos velit. Deleniti voluptas laudantium provident et quam aliquid blanditiis. Quas et aut est.', 'unde', 628, 866, 58, 'Numquam veniam non ipsam. Porro incidunt nisi repellendus occaecati expedita beatae facere. Voluptatem dolore unde enim quisquam atque placeat.', 0, 14, NULL, NULL, 2, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(20, 5, 'Bethel Mueller', 'nemo-non-dicta-dolor-eaque-numquam', 'ut', 1, 0, 'Voluptates nemo modi maxime qui omnis sed. Pariatur est sit beatae nisi. Dolorem facere est nulla aut similique. Eos ipsa pariatur repellendus et praesentium qui.', 'Quibusdam voluptates nobis quibusdam impedit. Doloremque molestiae necessitatibus nam nam nobis vitae. Ullam autem sed voluptatum deleniti enim. Alias est sapiente sint a libero consequatur quae.', 'commodi', 779, 526, 91, 'Voluptate consectetur adipisci minima harum. Sint id ipsa dicta repellat deserunt. Sapiente corrupti assumenda deserunt et facere deleniti nobis.', 0, 58, NULL, NULL, 5, NULL, 'products/5.png', 'products/5.png', NULL, NULL, '2023-03-05 01:57:16'),
(21, 4, 'Prof. Kristoffer Hyatt DVM', 'aut-eaque-occaecati-praesentium-itaque-blanditiis-sed-inventore', 'error', 1, 0, 'Aut sed qui corrupti voluptas molestiae nemo. Voluptatem dolor aut officia tempore. Autem sed impedit enim velit sit. Consequatur fugit eos quia qui architecto rerum ratione.', 'Quas qui quidem quidem incidunt sequi et doloribus. Libero dolore consequatur quo nulla possimus libero temporibus. Tenetur perferendis incidunt nisi. Repudiandae dolorum minima est commodi in.', 'eum', 450, 550, 32, 'Et maxime aut eos perspiciatis ab quod qui. Officia maiores exercitationem corporis animi unde. Aut modi vel illum et non vitae.', 0, 25, NULL, NULL, 2, NULL, 'products/1.png', 'products/1.png', NULL, NULL, NULL),
(22, 2, 'Prof. Gabriel VonRueden II', 'et-earum-dolorem-sit-nemo-ut-molestiae-numquam-praesentium', 'sed', 1, 0, 'Quia ut tenetur quis quia quis non rerum harum. Error voluptatem temporibus unde dolor sit. Ut suscipit veniam veniam soluta itaque.', 'Veniam ea rem doloribus voluptas veritatis ducimus rerum. Et ipsam doloremque molestiae rerum. Quam eos omnis unde sint quia enim.', 'et', 100, 240, 94, 'Quae ducimus deserunt qui fugit animi fugit. Aperiam explicabo sed unde sapiente et vel. Eveniet omnis aut non at numquam. Voluptatibus dolore ipsa quis explicabo sed.', 0, 73, NULL, NULL, 1, NULL, 'products/2.png', 'products/2.png', NULL, NULL, '2023-03-05 02:36:07'),
(23, 5, 'Hobart Armstrong', 'tempore-recusandae-voluptatem-non-reprehenderit-similique-saepe', 'voluptas', 1, 0, 'Laborum maxime quis ut et facilis qui et. Et natus fuga qui reprehenderit voluptatem. Rerum alias maiores aut est officia. Quaerat et dolores dicta vel voluptatibus est eligendi.', 'Voluptate ea qui necessitatibus exercitationem aut. Tenetur dignissimos laudantium aliquid fuga nostrum similique. Et facilis ut dolorem aliquid natus delectus itaque.', 'consequatur', 313, 433, 26, 'Maxime dolorem aliquam occaecati et doloribus. Ratione id ab voluptas quia dolore maxime. Eaque nulla quia excepturi ipsa. Sed maiores magnam quidem aliquid quis. Nesciunt eveniet a quaerat cum.', 0, 14, NULL, NULL, 4, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(24, 5, 'Jonathon Hackett DVM', 'ut-fugiat-sunt-voluptatum-modi-enim', 'sint', 1, 0, 'Voluptatum tempore dolor ea magnam. Consequatur numquam omnis nihil qui praesentium. Animi sed quia nihil saepe voluptatem ipsa. Eveniet minima autem laboriosam aut.', 'Nam ducimus mollitia minus non. Veniam rerum tempora cum porro. Consequatur excepturi repudiandae et fuga. Harum aperiam beatae aperiam soluta adipisci dolores.', 'natus', 995, 440, 62, 'Incidunt magni ut laudantium ut et sequi qui mollitia. Sit debitis ut vero quia ex. Explicabo omnis ipsa tenetur expedita dolore sint minima. Doloremque dolor ab hic itaque.', 0, 17, NULL, NULL, 1, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(25, 1, 'Ms. Nelda Lakin III', 'assumenda-veritatis-est-tenetur-praesentium-libero-vel', 'quia', 1, 0, 'Et soluta officiis eum consequatur commodi. Esse adipisci voluptas consequatur impedit aut rerum. Ab impedit eum eaque ab ad incidunt et.', 'Optio sit ipsa qui consequuntur eum. Eos odio enim veritatis aut quo temporibus atque debitis.', 'iusto', 857, 429, 26, 'Reprehenderit earum tempore architecto qui et. Nostrum quas eligendi reprehenderit natus officia quidem delectus. Similique voluptatem dicta excepturi in. Iure atque omnis esse neque sint.', 0, 35, NULL, NULL, 3, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(26, 4, 'Kristopher Larkin', 'odit-vero-ea-voluptates', 'est', 1, 0, 'Consequatur dolorem quis sequi voluptatem rem inventore. Quia aliquid necessitatibus error neque ad. Libero esse non laboriosam vel maiores alias. Sit repellat magnam laborum totam rerum quis.', 'Ad eligendi deleniti quia aut magnam numquam saepe quis. Blanditiis facilis et exercitationem possimus culpa in. Odio nemo labore ut ea sunt autem.', 'error', 327, 532, 38, 'Veniam natus quasi quam est saepe. Voluptates blanditiis ut ut accusamus et consectetur. Nesciunt sint voluptatibus laboriosam aliquid dicta quia. Mollitia aspernatur facilis est qui.', 0, 34, NULL, NULL, 4, NULL, 'products/1.png', 'products/1.png', NULL, NULL, NULL),
(27, 4, 'Miles Bartoletti', 'soluta-et-quia-aperiam-et-molestiae-error-id', 'consequatur', 1, 0, 'In ut inventore modi id. Pariatur sed recusandae et ab nemo incidunt odit. Deleniti saepe laborum rerum. Est et aperiam in est deleniti.', 'Consequuntur voluptate qui aspernatur delectus qui aut. Molestiae quo illum dignissimos amet autem velit natus cum.', 'iste', 851, 720, 53, 'Est inventore ipsam consequuntur eum. Dolor sit non tempore reiciendis dolor id nulla in.', 0, 82, NULL, NULL, 3, NULL, 'products/2.png', 'products/2.png', NULL, NULL, NULL),
(28, 2, 'Sandrine Brakus Jr.', 'et-et-atque-a-excepturi-omnis-velit-expedita', 'omnis', 1, 0, 'Reprehenderit quos aut voluptatum vel tempore. Dignissimos quia non in tempora occaecati. Voluptas sit autem ut distinctio et delectus. Minima natus numquam ut cupiditate sed ab.', 'Ut soluta porro est voluptatem et earum. Ducimus sit debitis unde eum. Et omnis temporibus consectetur necessitatibus dignissimos dolor. Et ab quod eveniet.', 'et', 648, 736, 53, 'Ut et sit commodi molestiae. Rerum odit dolore aspernatur voluptatum consequuntur soluta aut sapiente. Quis recusandae earum quidem alias id inventore placeat. Laboriosam harum accusamus eveniet.', 0, 37, NULL, NULL, 4, NULL, 'products/3.png', 'products/3.png', NULL, NULL, NULL),
(29, 4, 'Kristian Abbott DDS', 'temporibus-quod-in-sed-sint-necessitatibus-eligendi', 'rem', 1, 0, 'Iste omnis et et rerum minima. Sint exercitationem assumenda aut sed. Mollitia voluptas ipsum a fugit sapiente. Et voluptate eius velit amet sapiente voluptatem.', 'Aperiam assumenda illum natus blanditiis ea voluptas nam. Suscipit provident doloremque aut in beatae omnis est. Aut voluptatem hic molestiae rem sed sit aliquam atque.', 'iusto', 214, 251, 40, 'Nisi eius impedit quam sit alias laboriosam. Dolorem fugiat et blanditiis ut et occaecati optio quia. Eius ipsa possimus ratione dolore quisquam inventore quis. Nam non sit nostrum amet.', 0, 56, NULL, NULL, 2, NULL, 'products/4.png', 'products/4.png', NULL, NULL, NULL),
(30, 2, 'Lazaro Bailey', 'eveniet-id-ut-nam-non-eum-accusantium-qui', 'facere', 1, 0, 'Ea rerum suscipit sit dicta quos consectetur natus. Aperiam non dicta et saepe pariatur voluptates. Ea repudiandae cumque et quo. Molestiae temporibus natus iure quibusdam ratione dignissimos.', 'Consequatur velit expedita eligendi voluptas laboriosam fugit. Sunt unde distinctio maxime. Ipsam et veniam minima suscipit ut.', 'veniam', 960, 564, 55, 'Eos officia est quaerat debitis ratione numquam voluptas. Necessitatibus expedita est distinctio quia corporis. Tempore laborum eaque distinctio error sed exercitationem.', 0, 95, NULL, NULL, 2, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(31, 2, 'Loyce Walter', 'optio-quae-nostrum-consequuntur-sit', 'libero', 1, 0, 'Sequi ut reprehenderit neque dolores occaecati molestiae. Est illum quae quidem ullam laboriosam.', 'Nisi eaque ea culpa mollitia sed in quisquam. Maxime sint esse provident laboriosam voluptas architecto et.', 'voluptate', 201, 586, 29, 'Inventore fuga pariatur nesciunt rerum ab voluptates. Eum error nesciunt inventore mollitia omnis facilis eaque.', 0, 74, NULL, NULL, 3, NULL, 'products/5.png', 'products/5.png', NULL, NULL, NULL),
(32, 7, 'sogazynux@mailinator.com', 'sogazynux-at-mailinatorcom', NULL, 1, 0, 'Nisi ipsum rerum eni', 'Et id sint hic sit', '924', 395, 899, NULL, NULL, 0, 641, 'Nisi eos eaque irure', 'Ipsum tenetur debiti', NULL, NULL, 'products/mMSzDZWPJEe22EMjMt40XFkKsvlILA016VwuZSbJ.jpg', '[\"products\\/G0XnAyyd7z2PRw0urNgMwSEibD853B3EKfBUyqwu.jpg\",\"products\\/r5CxMOkjFLcPGMp3rwqMpy7AVwxGQARVSYb0w6ZL.jpg\",\"products\\/PwGf5aYLzmyGXAK30AuOZZVBQWnluF4dlPoPjXyt.jpg\"]', NULL, '2023-03-05 08:41:06', '2023-03-05 08:41:06'),
(33, 7, 'zukuqawa@mailinator.com', 'zukuqawa-at-mailinatorcom', NULL, 1, 0, 'Enim corrupti exerc', 'Consequatur consect', '529', 496, 69, NULL, NULL, 0, 957, 'Quisquam et optio i', 'Ducimus culpa eu su', NULL, NULL, 'products/AjHFP8DxF7dtmYrJB4bldPEGUOpXgyOpzS9ADMFd.jpg', '[\"products\\/sZe7MYpACZc5nCf8HrnrJcAnEKtG1nLeYwdvGxKK.jpg\",\"products\\/5WT92H0Elzjvybb8QNpPbkftb7SMdHeaygbMZHI6.jpg\"]', NULL, '2023-03-05 08:43:06', '2023-03-05 08:43:06'),
(34, 8, 'tohud@mailinator.com', 'tohud-at-mailinatorcom-34', NULL, 1, 0, 'Quibusdam nesciunt', 'Sint possimus dolor', '414', 474, 505, NULL, NULL, 0, 428, 'Facere consequatur', 'Ea incidunt et et c', NULL, NULL, 'products/BDfh44OHBjZIuvDh96hSYcBzuqevfgrZmOtYTBeJ.jpg', '[\"products\\/hCGBa6pxoloPVlwxctKp182hd7tjnXAvtwiynuXJ.jpg\",\"products\\/hfYjv7mNGvz14JhFIxdmIy3sNhwaocXlcaFi08tr.jpg\",\"products\\/EUXbj5pQjSsnyZtchd6axR0Uk97Bxsirc8Vhz6eH.jpg\"]', NULL, '2023-03-05 22:04:25', '2023-03-06 00:52:37'),
(35, 8, 'cohiqa@mailinator.com', 'cohiqa-at-mailinatorcom-35', NULL, 1, 0, 'Illum quis aut magn', 'Excepteur at officia', '880', 812, 13, NULL, NULL, 0, 661, 'Fugiat consequat E', 'Consequatur ipsam in', NULL, NULL, 'products/0Xp93mJB6HG3GJwAmSLfRL0PZbSXGkD0VU6IKTUP.png', '[\"product-images\\/OH9oz50yFd7qIQmM9ClTG70hnpBXx7BVCrAHA28K.jpg\"]', NULL, '2023-03-05 22:32:58', '2023-03-06 01:00:50'),
(36, 8, 'kylijy@mailinator.com', 'kylijy-at-mailinatorcom-36', NULL, 1, 0, 'Iure veritatis commo', 'Consequatur odio ea', '631', 877, 787, NULL, NULL, 0, 886, 'Dolorem corrupti re', 'Quo fugiat ut ut ex', NULL, NULL, 'products/T8H3iSwuN3FMLMgbyeSAWP7LH82PmLxmRHHpmcHz.jpg', '[\"product-images\\/Nzap5vww9Zu4yPB686sqAfLn1LEtMlTnA2g9aycj.jpg\"]', NULL, '2023-03-06 01:03:01', '2023-03-06 01:03:23'),
(37, 8, 'xekyvu@mailinator.com', 'xekyvu-at-mailinatorcom-37', NULL, 1, 0, 'Repellendus Quia vi', 'Unde quod veniam si', '838', 959, 999, NULL, NULL, 0, 910, 'Dolores architecto q', 'Ex reprehenderit qu', NULL, NULL, 'products/0KMZ6SMzkfoT5KyJ2mGFvvE8xHCxHrsHwzVX3cq8.jpg', '[\"product-images\\/4Pl6lgAO2VAyOYjPpukWEYQ25Yp06dqrNhg214W2.png\",\"product-images\\/EjDkWqYAcpeeGfO35awznvx5D3Ua0AKfy97SwdaB.png\",\"product-images\\/ddQCcAIJJieFUswqlizqrz1uHkMVQgQjW8n9iUk7.png\",\"product-images\\/inLqP6VV0WhUWaDBHbvgnC3GJvwZ94YYjY4ZcdWD.png\"]', NULL, '2023-03-06 01:05:32', '2023-03-06 01:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(2, 'user', 'Normal User', '2023-03-04 23:40:57', '2023-03-04 23:40:57'),
(3, 'vendor', 'Vendor', '2023-03-04 23:40:57', '2023-03-04 23:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_registration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `user_id`, `slug`, `email`, `phone`, `logo`, `description`, `short_description`, `tags`, `terms`, `company_name`, `company_registration`, `city`, `state`, `post_code`, `country`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Alexandria Kreiger', 5, 'olueilwitz', 'creynolds@example.com', '+1-574-787-9346', 'shop/shop1.png', 'Odio et quis eum velit voluptatem. Delectus distinctio ipsa molestiae dolores laboriosam.\n\nFugiat dolores consectetur quo nobis eligendi modi. Quae adipisci amet labore eos culpa. Sed sit error incidunt impedit amet.\n\nEt et quo molestiae. Veniam itaque laudantium et cupiditate earum consequatur veniam quia. Repellendus illum est dolor reprehenderit. Eligendi minima doloribus cum odit voluptatem aliquam.', 'Earum nam est consequuntur voluptatem amet dolor. Qui nam aliquid doloribus itaque. Quia ut quo suscipit non autem fugit.', '[\"voluptate\",\"a\",\"laudantium\"]', 'Assumenda sit aut sint non sit vel. Ut neque animi corporis dolor cum. Dolores dolorem sed dicta et earum similique.', 'willms.karley', '61b395eb-81b7-363a-84b2-ac51ed0aa33a', 'Schuppechester', 'Massachusetts', '57934', 'Canada', '1', NULL, NULL),
(2, 'Kennedy Botsford', 3, 'abelardo26', 'patsy11@example.org', '458-625-3478', 'shop/shop2.png', 'Voluptas optio et animi animi sunt sunt ea. Tempora iste quia quidem cumque possimus rem. Minima quis aspernatur eum quidem totam odit non. Dolore enim officiis illo tempora.\n\nFuga dolorem adipisci sit reiciendis. Quis sed rerum accusamus facere dolores. Cumque nam perferendis autem quo fugiat impedit nobis.\n\nEt omnis veniam nesciunt aut. Dolorem explicabo similique explicabo minus. Non autem itaque saepe quisquam dolor quia.', 'Voluptates nesciunt quam excepturi aut. Saepe ullam aut qui reiciendis consequatur fugit. Eum corrupti nobis eos aperiam provident similique porro dignissimos. Veniam quae aut consectetur ea aperiam.', '[\"eos\",\"quaerat\",\"doloremque\"]', 'Unde est aut ut quibusdam inventore ut esse voluptatem. Non delectus voluptatibus qui. Eum architecto voluptatem est.', 'curt.bauch', 'cbfdbfb9-271c-36ac-8557-3d58d146bb74', 'South Linwoodfurt', 'Arizona', '60346-5007', 'French Guiana', '1', NULL, NULL),
(3, 'Prof. Johnny Stiedemann III', 2, 'lew.haley', 'raleigh13@example.com', '1-401-800-4852', 'shop/shop3.png', 'Et minus delectus ab ut laboriosam. Doloremque cum velit modi harum et cum. Perspiciatis et corrupti exercitationem fuga eos et amet dolores.\n\nQui ab et neque assumenda. Et placeat aut inventore a. Necessitatibus voluptatum at consequuntur harum.\n\nSuscipit at voluptate explicabo impedit a repudiandae delectus non. Ut omnis facere et totam nobis neque.', 'Voluptatem eligendi eius consequatur officia mollitia corporis. Velit voluptates totam et est aliquid numquam. Laudantium qui dolores sunt. Suscipit sed ducimus voluptas voluptas.', '[\"dolor\",\"totam\",\"nesciunt\"]', 'Amet temporibus voluptatibus tempore quo. Delectus pariatur doloribus reiciendis et. Atque deserunt autem voluptatem consequatur deleniti velit nostrum.', 'ureilly', '9855d4c7-54db-3658-b9f4-a500c19c0bda', 'Biankahaven', 'Nebraska', '86090-3192', 'Turkey', '1', NULL, NULL),
(4, 'Josue Murphy MD', 2, 'susie.treutel', 'marmstrong@example.org', '(423) 731-2020', 'shop/shop4.png', 'Laboriosam facere explicabo fugiat aut quibusdam. Hic magni assumenda voluptatibus quae non hic. Deserunt similique iure sed amet. Suscipit neque dolorem autem dolores.\n\nUt consequatur deserunt autem repudiandae eos odit. Quisquam qui laboriosam quibusdam modi est repellat quaerat.\n\nAut molestias facere aut dolores. Ea velit et animi ut ut. Sunt veniam recusandae laborum fugiat repellendus deleniti. Ad eum et autem omnis neque expedita non dolorem.', 'Ducimus eum sequi ea recusandae impedit esse. Error vero sed consectetur dolor. Quia sit iusto totam eveniet vel.', '[\"cupiditate\",\"in\",\"maiores\"]', 'Velit nihil hic maiores et aliquid. Ratione odit dolores facere aperiam quam. Architecto sit enim unde nulla aut ipsam omnis. Amet reprehenderit unde veniam alias aut incidunt vel.', 'krista25', 'd38ece5f-6f67-3a87-97be-4faff17ab9ae', 'East Lunaview', 'Oregon', '93542-2765', 'Romania', '1', NULL, NULL),
(5, 'Dr. Elian White', 5, 'else10', 'torp.kaela@example.net', '832.704.8520', 'shop/shop3.png', 'Assumenda eligendi impedit ut repellendus ullam suscipit sed. Sint est consequatur aspernatur quas. Ad officia animi dolorum cum quia in laudantium. Rerum iste ullam sunt sint in aut.\n\nTempora velit eos et sit aliquam et omnis. Dolor consequuntur enim illo ex maiores minima. Quia sit sed natus magnam cumque repellat. Quaerat unde dicta est et.\n\nAut repellendus maxime quos eius aliquid minima enim ut. Quas ut eveniet velit earum est. Inventore deleniti non possimus.', 'Sit quia laudantium tenetur ex aut. Aut sit tenetur ullam sunt blanditiis et. At quia sed velit non.', '[\"nisi\",\"natus\",\"minus\"]', 'Illo quod et ut aperiam. Minus id quam sit odio earum doloribus qui. Vero necessitatibus nisi quia porro sapiente nobis minima.', 'clara.lakin', '4ecebbe6-ce3d-3d42-81bf-49df3b10fc29', 'Runteton', 'Illinois', '15517-6303', 'Tonga', '1', NULL, NULL),
(6, 'Nerea Erickson', 8, 'nerea-erickson', 'dani@gmail.com', '+1 (724) 687-2758', 'logos/uj4kpi6MwYSWK3TuJ9rRIIWC5RdNA8CBsPvSoeLx.png', 'Necessitatibus accus', 'Corrupti tenetur lo', '[\"nisi\",\"natus\",\"minus\"]', NULL, 'Dickson Lucas Trading', 'Chaney and Jacobson Trading', 'California', 'Dignissimos neque ci', '12312', 'Bangladesh', '0', '2023-03-05 04:29:34', '2023-03-05 04:29:34'),
(7, 'Elvis Hoffman', 9, 'elvis-hoffman', 'vyfuk@mailinator.com', '+1 (295) 792-2177', 'logos/inhNrdbI9W8gVYCPCZdNE7BG1gyHaMHHPdu3QKRv.jpg', 'Deserunt recusandae', 'Ut sed rerum quo rer', '[\"nisi\",\"natus\",\"minus\"]', NULL, 'Valentine Freeman Plc', 'Hancock Vinson Traders', 'Voluptatem nesciunt', 'Consequatur cillum c', '123', 'Hic sint cillum null', '0', '2023-03-05 08:24:20', '2023-03-05 08:24:20'),
(8, 'Sage Giles', 10, 'sage-giles', 'cicodogo@mailinator.com', '+1 (205) 308-1351', 'logos/FeK0HKDXoGbLb09nbKIozhk09LsNP1APrs71k3OE.jpg', 'Eaque corporis fugit', 'Quisquam excepteur f', '[\"nisi\",\"natus\",\"minus\"]', NULL, 'Griffin Rodriguez Associates', 'Patton and Franks Co', 'Inventore sunt dolor', 'Quas mollitia volupt', '123', 'Dolore cumque volupt', '0', '2023-03-05 22:02:46', '2023-03-05 22:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-03-04 23:40:58', '2023-03-04 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Prof. Vicenta Lowe', 'hintz.kadin@example.com', 'users/default.png', '2023-03-04 23:40:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rMG2xz3fSR', NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(2, 1, 'Lenore Bergnaum', 'howell.eleazar@example.net', 'users/default.png', '2023-03-04 23:40:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0GlanhbEwu', NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(3, 2, 'Johanna Mohr', 'crona.miracle@example.net', 'users/default.png', '2023-03-04 23:40:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UXhfkpkdzq', NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(4, 1, 'Seamus McCullough III', 'gerald66@example.net', 'users/default.png', '2023-03-04 23:40:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uBHjtuHTBw', NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(5, 2, 'Ms. Margaret Moore DVM', 'caden57@example.com', 'users/default.png', '2023-03-04 23:40:58', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VWEVDdDOfn', NULL, '2023-03-04 23:40:58', '2023-03-04 23:40:58'),
(6, 2, 'Jenna Gaines', 'niluka@mailinator.com', 'users/bHI5m8nkcAA4k6Y1NhEq9HfHsAeDzc3gQ6hhS7FR.png', NULL, '$2y$10$ymZAFafvP/oGtZ9iiaTsrOVKvtQuu/jBKmvOM4qdJ.rVL4fystlFu', NULL, NULL, '2023-03-05 02:05:05', '2023-03-05 02:36:07'),
(7, 3, 'Gail James', 'pisudicuta@mailinator.com', 'users/default.png', NULL, '$2y$10$SghZYgo0YnLxcmf2C/y9tOI8AvOpQ49T48kyN6Z26Pr5LV.MonHda', NULL, NULL, '2023-03-05 03:09:16', '2023-03-05 03:09:16'),
(8, 3, 'Alma Fleming', 'josogefa@mailinator.com', 'users/default.png', NULL, '$2y$10$q4GkRHxW6thKczmcblkhie3X..198gIt/bmgX11uXvU7IYJRoxCGi', NULL, NULL, '2023-03-05 04:17:29', '2023-03-05 04:17:29'),
(9, 3, 'Aidan Rodgers', 'jybag@mailinator.com', 'users/default.png', NULL, '$2y$10$j.bQAtllv/GGrY8cBMEE0Oxq7hRppwWSryw8mhuHAL8wQu92vXeTG', NULL, NULL, '2023-03-05 08:23:27', '2023-03-05 08:23:27'),
(10, 3, 'Hedley Drake', 'vendor@gmail.com', 'users/default.png', NULL, '$2y$10$DNY/0IvI8UEBkwYiUVwZxObJNlDprMH9z1APMzsongmhI4du2dkIK', NULL, NULL, '2023-03-05 22:02:16', '2023-03-05 22:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordera_product_product_id_foreign` (`product_id`),
  ADD KEY `ordera_product_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

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
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `prodcats`
--
ALTER TABLE `prodcats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodcats_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prodcat_product_product_id_foreign` (`product_id`),
  ADD KEY `prodcat_product_prodcat_id_foreign` (`prodcat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shops_slug_unique` (`slug`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prodcats`
--
ALTER TABLE `prodcats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `ordera_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordera_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodcats`
--
ALTER TABLE `prodcats`
  ADD CONSTRAINT `prodcats_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  ADD CONSTRAINT `prodcat_product_prodcat_id_foreign` FOREIGN KEY (`prodcat_id`) REFERENCES `prodcats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prodcat_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
