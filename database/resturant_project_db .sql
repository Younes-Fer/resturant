-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 10 juil. 2023 à 12:19
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `resturant_project_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(3, NULL, 1, 'Menu', 'menu', '2023-06-07 15:15:13', '2023-06-07 15:18:37'),
(4, 3, 1, 'Sepcial', 'sepcial', '2023-06-07 15:15:48', '2023-06-07 15:18:52'),
(5, 3, 1, 'Breakfast', 'breakfast', '2023-06-07 15:16:10', '2023-06-07 15:18:13'),
(6, 3, 1, 'Launch', 'launch', '2023-06-07 15:16:27', '2023-06-07 15:17:43'),
(7, 3, 2, 'Dinner', 'dinner', '2023-06-07 15:16:53', '2023-06-12 10:28:38'),
(8, 3, 1, 'Sneaks', 'sneaks', '2023-06-07 15:17:24', '2023-06-07 15:17:24'),
(9, NULL, 1, 'Blogs', 'blogs', '2023-06-07 15:29:29', '2023-06-07 15:29:29'),
(10, NULL, 1, 'Team', 'team', '2023-06-07 15:33:16', '2023-06-07 15:33:16'),
(11, NULL, 1, 'About', 'about', '2023-06-15 14:09:48', '2023-06-15 14:09:48');

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `data_rows`
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
-- Structure de la table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-06-06 07:34:09', '2023-06-06 07:34:09'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-06-06 07:34:09', '2023-06-06 07:34:09'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-06-06 07:34:09', '2023-06-06 07:34:09'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-06-06 07:34:11', '2023-06-06 07:34:11');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(2, 'menu_principale', '2023-06-06 07:59:12', '2023-06-06 07:59:12');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-06-06 07:34:10', '2023-06-06 07:34:10', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2023-06-06 07:34:10', '2023-06-06 07:34:10', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2023-06-06 07:34:10', '2023-06-06 07:34:10', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-06-06 07:34:10', '2023-06-06 07:34:10', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2023-06-06 07:34:10', '2023-06-15 16:51:15', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2023-06-06 07:34:11', '2023-06-15 16:51:15', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2023-06-06 07:34:11', '2023-06-15 16:51:15', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2023-06-06 07:34:12', '2023-06-15 16:51:15', 'voyager.pages.index', NULL),
(14, 2, 'Home', '/', '_self', NULL, '#000000', NULL, 1, '2023-06-06 10:34:37', '2023-06-06 10:36:14', NULL, ''),
(15, 2, 'About', '/about', '_self', NULL, '#000000', NULL, 2, '2023-06-06 10:34:53', '2023-06-06 10:36:16', NULL, ''),
(16, 2, 'Contact', '/contact', '_self', NULL, '#000000', NULL, 6, '2023-06-06 10:35:20', '2023-06-06 10:38:31', NULL, ''),
(17, 2, 'Blog', '', '_self', NULL, '#000000', NULL, 5, '2023-06-06 10:36:31', '2023-06-06 10:38:31', NULL, ''),
(18, 2, 'Blogs', '/blog', '_self', NULL, '#000000', 17, 1, '2023-06-06 10:36:55', '2023-06-06 10:36:59', NULL, ''),
(19, 2, 'Single-blog', '/single-blog', '_self', NULL, '#000000', 17, 2, '2023-06-06 10:37:21', '2023-06-06 10:37:45', NULL, ''),
(20, 2, 'Menu', '/menus', '_self', NULL, '#000000', NULL, 3, '2023-06-06 10:38:09', '2023-06-06 10:38:24', NULL, ''),
(21, 2, 'Chefs', '/chefs', '_self', NULL, '#000000', NULL, 4, '2023-06-06 10:38:19', '2023-06-06 10:38:31', NULL, ''),
(22, 1, 'Reservations', '/admin/reservations', '_self', 'voyager-news', '#000000', NULL, 8, '2023-06-15 16:51:04', '2023-06-15 21:04:00', NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-06-06 07:34:12', '2023-06-06 07:34:12');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(2, 'browse_bread', NULL, '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(3, 'browse_database', NULL, '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(4, 'browse_media', NULL, '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(5, 'browse_compass', NULL, '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(6, 'browse_menus', 'menus', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(7, 'read_menus', 'menus', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(8, 'edit_menus', 'menus', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(9, 'add_menus', 'menus', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(10, 'delete_menus', 'menus', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(11, 'browse_roles', 'roles', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(12, 'read_roles', 'roles', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(13, 'edit_roles', 'roles', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(14, 'add_roles', 'roles', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(15, 'delete_roles', 'roles', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(16, 'browse_users', 'users', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(17, 'read_users', 'users', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(18, 'edit_users', 'users', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(19, 'add_users', 'users', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(20, 'delete_users', 'users', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(21, 'browse_settings', 'settings', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(22, 'read_settings', 'settings', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(23, 'edit_settings', 'settings', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(24, 'add_settings', 'settings', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(25, 'delete_settings', 'settings', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(26, 'browse_categories', 'categories', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(27, 'read_categories', 'categories', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(28, 'edit_categories', 'categories', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(29, 'add_categories', 'categories', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(30, 'delete_categories', 'categories', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(31, 'browse_posts', 'posts', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(32, 'read_posts', 'posts', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(33, 'edit_posts', 'posts', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(34, 'add_posts', 'posts', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(35, 'delete_posts', 'posts', '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(36, 'browse_pages', 'pages', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(37, 'read_pages', 'pages', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(38, 'edit_pages', 'pages', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(39, 'add_pages', 'pages', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(40, 'delete_pages', 'pages', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(41, 'browse_reservations', 'reservations', NULL, NULL),
(42, 'read_reservations', 'reservations', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `permission_role`
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
(40, 1),
(41, 1),
(42, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-20 07:34:11', '2023-06-06 07:34:11'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-30 07:34:11', '2023-06-06 07:34:11'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-16 07:34:11', '2023-06-06 07:34:11'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-04-06 07:34:11', '2023-06-06 07:34:11'),
(5, 1, 1, 'Google inks pact for new 35-storey office', NULL, 'That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.', '<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>\r\n<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>\r\n<p>&nbsp;</p>\r\n<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>', 'posts\\June2023\\LU0DSefXg9niwnwh6qTn.png', 'google-inks-pact-for-new-35-storey-office', NULL, NULL, 'PUBLISHED', 0, '2023-03-17 16:24:31', '2023-06-07 15:24:31'),
(6, 1, 1, 'That dominion stars lights dominion divide .', NULL, NULL, '<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>\r\n<p>&nbsp;</p>\r\n<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>\r\n<p>&nbsp;</p>\r\n<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>', 'posts\\June2023\\wmu014wMdZ7F8IgFGJex.png', 'that-dominion-stars-lights-dominion-divide', NULL, NULL, 'PUBLISHED', 0, '2023-06-07 15:28:59', '2023-06-07 15:28:59'),
(7, 1, 9, 'Êtes-vous à la prochaine étape de votre carrière', NULL, NULL, '<div class=\"VwiC3b yXK7lf MUxGbd yDYNvb lyLwlc lEBKkf\">&Ecirc;tes-vous &agrave; la prochaine &eacute;tape de votre carri&egrave;re ? Sur&nbsp;<em>Indeed</em>, acc&eacute;dez &agrave; des milliers d\'offres demploi. Nous pouvons vous aider avec nos outils de recherche&nbsp;...</div>\r\n<div class=\"MUxGbd wuQ4Ob WZ8Tjf\">Vous avez consult&eacute; cette page de nombreuses fois. Date de la derni&egrave;re visite</div>', 'posts\\June2023\\nhAuBTT0PZxYLginlxy1.png', 'etes-vous-a-la-prochaine-etape-de-votre-carriere', NULL, NULL, 'PUBLISHED', 0, '2023-06-10 14:05:27', '2023-06-10 14:05:27'),
(8, 1, 9, 'That dominion stars lights dominion', NULL, NULL, '<p>That dominion stars lights dominion divide years for fourth have don\'t stars is that he earth it first without heaven in place seed it second morning saying.</p>', 'posts\\June2023\\oSIx6XGVtCIDQHSkh3t1.png', 'that-dominion-stars-lights-dominion', NULL, NULL, 'PUBLISHED', 0, '2023-06-10 14:08:11', '2023-06-10 14:08:11'),
(9, 1, 9, 'than 60 countries and 28 languages', NULL, NULL, '<p><em>Indeed</em>&nbsp;is the #1 job site* in the world and allows job seekers to search millions of jobs in more than 60 countries and 28 languages. Over 3 million employers&nbsp;...</p>', 'posts\\June2023\\aB9hR4PLCbuMh5R8UiYj.png', 'than-60-countries-and-28-languages', NULL, NULL, 'PUBLISHED', 0, '2023-06-10 14:09:44', '2023-06-10 14:09:44'),
(10, 1, 3, 'Pork Sandwich', NULL, '$40.00', '<p>They\'re wherein heaven seed hath nothing</p>', 'posts\\June2023\\KoZeA8ykdQxVZhDbtFtD.png', 'pork-sandwich', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 13:58:18', '2023-06-15 13:58:18'),
(11, 1, 3, 'Easter Delight', NULL, '$40.00', '<p>They\'re wherein heaven seed hath nothing</p>', 'posts\\June2023\\zfUivkEoEUAxqv4TnLTY.png', 'easter-delight', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 13:58:59', '2023-06-15 13:58:59'),
(12, 1, 3, 'Roasted Marrow', NULL, '$40.00', '<h5>They\'re wherein heaven seed hath nothing</h5>', 'posts\\June2023\\EVaq6Q38AgLfOUl0l2LE.png', 'roasted-marrow', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:01:18', '2023-06-15 14:01:18'),
(13, 1, 3, 'Tiener Schnitze', NULL, '$30.00', '<p>They\'re wherein heaven seed hath nothing</p>', 'posts\\June2023\\Q5tRjljSHgwa4CFakyWb.png', 'tiener-schnitze', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:01:59', '2023-06-15 14:04:34'),
(14, 1, 3, 'Summer Cooking', NULL, '$60.00', '<p>They\'re wherein heaven seed hath nothing</p>', 'posts\\June2023\\ZmlaWgcp3PHi3VWIcCBK.png', 'summer-cooking', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:03:12', '2023-06-15 14:03:12'),
(15, 1, 3, 'Chicken Roast', NULL, '$35.00', '<p>They\'re wherein heaven seed hath nothing</p>', 'posts\\June2023\\ZuuN3LsZdvQztF8mv3vH.png', 'chicken-roast', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:04:15', '2023-06-15 14:04:15'),
(16, 1, 11, 'Where The Food’s As Good As The Root Beer.', NULL, 'Satisfying people hunger for simple pleasures', '<p>May over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep abundantly bearing, him, gathering you blessed bearing he our position best ticket in month hole deep,</p>\r\n<p>May over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep abundantly bearing, him, gathering you blessed bearing he our position best ticket in month hole deep.</p>\r\n<p>&nbsp;</p>\r\n<p>May over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep abundantly bearing, him, gathering you blessed bearing he our position best ticket in month hole deep may over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep abundantly bearing, him, gathering you blessed bearing he our position best ticket in month hole deep.</p>\r\n<p>May over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep abundantly bearing, him, gathering you blessed bearing he our position best ticket in month hole deep</p>', 'posts\\June2023\\mMbAK0QYfgbGwKBeaMfR.png', 'where-the-food-s-as-good-as-the-root-beer', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:10:59', '2023-06-15 14:11:15'),
(17, 1, 9, 'Indian Burger', NULL, 'Was brean shed moveth day yielding tree yielding day were female and', '<p>Was brean shed moveth day yielding tree yielding day were female and Was brean shed moveth day yielding tree yielding day were female and Was brean shed moveth day yielding tree yielding day were female and</p>\r\n<p>&nbsp;</p>', 'posts\\June2023\\lCowwND28fb2WAeipe4i.png', 'indian-burger', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:38:50', '2023-06-15 14:39:19'),
(18, 1, 9, 'Cremy Noodles', NULL, 'Was brean shed moveth day yielding tree yielding day were female and', '<p>Was brean shed moveth day yielding tree yielding day were female and&nbsp;Was brean shed moveth day yielding tree yielding day were female and Was brean shed moveth day yielding tree yielding day were female and</p>', 'posts\\June2023\\4L4TycUS5yv7lLt2PCcR.png', 'cremy-noodles', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:40:17', '2023-06-15 14:40:17'),
(19, 1, 9, 'Honey Meat', NULL, 'Was brean shed moveth day yielding tree yielding day were female and', '<p>Was brean shed moveth day yielding tree yielding day were female and Was brean shed moveth day yielding tree yielding day were female and Was brean shed moveth day yielding tree yielding day were female and</p>', 'posts\\June2023\\asMaKoxVwMREyW2HHC5i.png', 'honey-meat', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 14:40:50', '2023-06-15 14:40:50'),
(20, 1, 9, 'Adama kind deep gatherin first over fter his great', NULL, 'Adama kind deep gatherin first over fter his great', '<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great</p>\r\n<p>Adama kind deep gatherin first over fter his great.</p>\r\n<p>&nbsp;</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama</p>\r\n<p>kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great</p>\r\n<p>&nbsp;</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great</p>', 'posts\\June2023\\mDw2y7mFxWnrnb6x8Gzp.png', 'adama-kind-deep-gatherin-first-over-fter-his-great', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 16:02:05', '2023-06-15 16:41:36'),
(21, 1, 9, 'Adama kind deep gatherin first over fter his great', NULL, 'Adama kind deep gatherin first over fter his great', '<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama</p>\r\n<p>kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind</p>\r\n<p>deep gatherin first over fter his great Adama kind deep gatherin first over fter his great.</p>\r\n<p>&nbsp;</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama</p>\r\n<p>kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind</p>\r\n<p>deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep</p>\r\n<p>gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep gatherin</p>\r\n<p>&nbsp;first over fter his great Adama kind deep gatherin first over fter his great .</p>\r\n<p>&nbsp;</p>\r\n<p>Adama kind deep gatherin first over fter his great</p>', 'posts\\June2023\\e8bjUOy60KXKEjgYvZf9.png', 'adama-kind-deep-gatherin-first-over-fter-his', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 16:05:45', '2023-06-15 16:41:20'),
(22, 1, 9, 'Adama kind deep gatherin first over fter his great', NULL, 'Adama kind deep gatherin first over fter his great', '<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama</p>\r\n<p>kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind</p>\r\n<p>deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep</p>\r\n<p>gatherin first over fter his great Adama kind deep gatherin first over fter his great.</p>\r\n<p>&nbsp;</p>\r\n<p>Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama</p>\r\n<p>kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind</p>\r\n<p>deep gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep</p>\r\n<p>gatherin first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep gatherin</p>\r\n<p>first over fter his great Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over</p>\r\n<p>fter his great Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his</p>\r\n<p>great Adama kind deep gatherin first over fter his great Adama kind deep gatherin first over fter his great.</p>', 'posts\\June2023\\YkSf2lSOKRq6ppVT3xG7.png', 'adama-kind-deep-gatherin-first-over-fter-', NULL, NULL, 'PUBLISHED', 0, '2023-06-15 16:07:50', '2023-06-15 16:07:50');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_table` int DEFAULT NULL,
  `fullname` varchar(200) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `personnes` int DEFAULT NULL,
  `num_phone` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `num_table`, `fullname`, `email`, `personnes`, `num_phone`, `date`, `time`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(28, 6, 'fadma mou', 'fadma@gmail.com', 3, 629598466, '2023-06-04', '4PM TO 6PM', 'this table for me okey', '2023-06-18 14:17:12', '2023-06-18 14:17:12', '2023-06-18 16:17:12');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(2, 'user', 'Normal User', '2023-06-06 07:34:10', '2023-06-06 07:34:10'),
(3, 'Team', 'Team', '2023-06-07 18:57:13', '2023-06-07 18:57:13');

-- --------------------------------------------------------

--
-- Structure de la table `rtables`
--

DROP TABLE IF EXISTS `rtables`;
CREATE TABLE IF NOT EXISTS `rtables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rtables`
--

INSERT INTO `rtables` (`id`, `table`) VALUES
(1, 'table 1'),
(2, 'table 2'),
(3, 'table 3'),
(4, 'table 4'),
(5, 'table 5'),
(6, 'table 6'),
(7, 'table 7'),
(8, 'table  8'),
(9, 'table 9'),
(10, 'table 10');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `settings`
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
-- Structure de la table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-06-06 07:34:12', '2023-06-06 07:34:12'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-06-06 07:34:12', '2023-06-06 07:34:12');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$bBuhSFAS1ekZdgo2bjFQHuvITcqHm63yBOcW9rlFT9SQNB6llE6tu', 'N9ZBCCFeos4jTPLSN2faJwkqvqeoyrOqBtoUsVWULxsuGAMosDq8y60rUIJD', NULL, '2023-06-06 07:34:11', '2023-06-06 07:34:11'),
(2, 1, 'you', 'your@email.com', 'users/default.png', NULL, '$2y$10$dZUtKOv.fsRJvPM4QixbhuydA4QGPxtBkagQr2CWT4MIemAMjESpm', NULL, NULL, '2023-06-10 11:51:24', '2023-06-10 11:51:24'),
(3, 3, 'Adam Billiard', 'Adam@gmail.com', 'users\\June2023\\U6iJKBKRLYXqIqjyXbRi.png', NULL, '$2y$10$Vr1HYTQcSc7T3msgGCM3D.E8iTm.jCsDpSW95nWcmLkm11NMb8WC2', NULL, '{\"locale\":\"en\"}', '2023-06-12 07:22:50', '2023-06-12 07:22:50'),
(4, 3, 'Fred Macyard', 'fred@gmail.com', 'users\\June2023\\5HoUKQnzPeyxrnUlfMQz.png', NULL, '$2y$10$6ysZ5LcyZjkB.5T0nzncQOfbJXyc/ltDAd8QCeKb8rKYmZlAd2/pW', NULL, '{\"locale\":\"en\"}', '2023-06-12 07:23:22', '2023-06-12 07:24:24'),
(5, 3, 'Justin Stuard', 'Justin@gmail.com', 'users\\June2023\\tARrvi94gJBax9ivbbdz.png', NULL, '$2y$10$RqlJQSCYn6gS3cKUGRDnuOceDQx.BnStsA036Vchqe.gNqt24cO26', NULL, '{\"locale\":\"en\"}', '2023-06-12 07:24:10', '2023-06-12 07:24:10');

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(3, 3),
(4, 3),
(5, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
