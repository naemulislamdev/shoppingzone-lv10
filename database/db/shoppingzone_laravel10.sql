-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 08:01 AM
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
-- Database: `client_laravel10`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `branch_id` int(11) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `branch_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Shopping Zone BD', '+8801977593593', 1, 1, '2024-11-25-67444fefd1874.png', 'shoppingzonebd@gmail.com', NULL, '$2y$10$5SoiXbEFR4I9SXAb5b8wKeThodRhQ0eqUEebu3IqAXWIINMr.oSR2', 'xiOhgRefKXCg8DVd22X2EaWlzHfqB8XaAiiXyr7gV3fveTPd7XheiLFlG5nt', '2022-09-18 01:58:18', '2024-11-25 10:22:39', 1),
(5, 'Admin', '01922806406', 3, 2, '2022-12-06-638ecb64e02ee.png', 'admin@gmail.com', NULL, '$2y$10$9eWrnsN/neRMjPd8L95kFOWVYZZfHFFcokJXtoI0BWev9CJtHdknW', 'NamEEhSJ53lQ1eWvPlQAohDQ2UZdWX6fXStIhPMFUIxd2eMoxtzHDkWsK6jp', '2022-12-06 10:56:04', '2022-12-06 10:56:04', 1),
(6, 'Ashik', '01926325585', 3, 1, '2023-03-20-64188fa488dde.png', 'absayeed.ashik@gmail.com', NULL, '$2y$10$M0ZfF5Fw6pkIw1mISbKsUut6/mz0tSKEtye8c89q28M9m5hlPsnYe', 'IBF29EZ5cLuLAYB88QebFVtDl46k5X3ahYKyjgfjvFVfAmYgmqm2yjGUHoeA', '2023-03-20 16:53:56', '2023-03-20 16:53:56', 1),
(7, 'Masud', '01912872414', 3, 2, '2023-03-29-6424270e40a5d.png', 'masudjsr89@gmail.com', NULL, '$2y$10$mv4BLylze7rm0C/JXKVp4ud/uGaVjFnokKwnrnPfTQSp8UUXu7Iw6', 'LZakqjFoZ2IQs7kpIcwg7VjJxC7nXonD1PwnHo6sQYn3va1spdz22eJgv4uk', '2023-03-29 11:54:54', '2023-04-12 13:28:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(2, 'Uploader', '[\"product_management\"]', 1, '2022-09-21 09:55:16', '2022-09-21 09:55:16'),
(3, 'Admin', '[\"order_management\",\"product_management\",\"marketing_section\",\"business_section\",\"user_section\",\"support_section\",\"business_settings\",\"web_&_app_settings\",\"report\",\"employee_section\",\"dashboard\",\"pos_management\",\"refund_management\"]', 1, '2022-09-24 14:14:10', '2022-10-26 17:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(3, 1, 523.15476190479, 0, '2023-04-17 07:28:45', '2023-07-27 19:24:20', 0.00, 27.82, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(8, 'Size', '2022-12-01 21:22:46', '2022-12-01 21:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(58, '2024-08-12-66ba34b563521.png', 'Main Banner', 1, '2022-12-01 20:48:03', '2024-08-12 16:13:41', 'category/slug:monipuri-sharee', 'product', 796),
(59, '2024-08-13-66bb2f7174f8a.png', 'Main Banner', 1, '2022-12-01 20:50:15', '2024-08-13 10:03:29', 'category/slug:pure-cotton-sharee', 'category', 542),
(60, '2024-08-12-66ba3497b36eb.png', 'Main Banner', 1, '2022-12-01 21:13:55', '2024-11-14 10:57:55', 'http://127.0.0.1:8000/products?id=543&data_from=category&page=1', 'category', 542),
(61, '2024-08-13-66bb2e06cc667.png', 'Popup Banner', 0, '2022-12-05 00:55:39', '2024-11-23 12:37:57', 'https://sajerbela.com/', 'product', 796),
(62, '2024-08-12-66ba347485cef.png', 'Footer Banner', 1, '2022-12-05 00:56:23', '2024-08-12 16:12:36', 'https://sajerbela.com/', 'category', 542),
(63, '2023-03-28-64231d3301c93.png', 'Main Section Banner', 1, '2022-12-05 01:19:00', '2023-05-28 13:37:29', 'category/slug:sharee-collection', 'category', 487);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `map_url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `map_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mohammadpur Branch', 'mohammadpur@shoppingzonebd.com', '01674437137', 'Mohammadpur, Dhaka, Bangladesh', NULL, 1, '2024-07-27 16:34:43', '2024-07-30 13:52:11'),
(2, 1, 'Banani', 'banani@shoppingzonebd.com', '01674437137', 'Banani, Dhaka, Bangladesh', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14602.680955438507!2d90.38622158076086!3d23.794754327000987!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c70c15ea1de1%3A0x97856381e88fb311!2sBanani%2C%20Dhaka!5e0!3m2!1sen!2sbd!', 1, '2024-07-30 14:05:45', '2024-08-19 18:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(72, 'Lafz', '2023-01-01-63b171dc1bc05.png', 1, '2022-12-01 03:18:05', '2023-01-01 17:43:24'),
(73, 'Dr Rhazes', '2022-12-01-6388bf641b2b7.png', 1, '2022-12-01 03:18:23', '2022-12-01 20:51:16'),
(74, 'Awefe', '2023-01-01-63b1716283243.png', 1, '2022-12-01 21:23:22', '2023-01-01 17:41:22'),
(75, 'Imported', '2022-12-02-6389157208941.png', 1, '2022-12-02 02:58:26', '2022-12-02 02:58:26'),
(76, 'Mash', '2022-12-02-638915844bf51.png', 1, '2022-12-02 02:58:44', '2022-12-02 02:58:44'),
(77, 'Export Quality', '2022-12-02-6389159ea7f3a.png', 1, '2022-12-02 02:59:10', '2022-12-02 02:59:10'),
(78, 'Veslo', '2022-12-02-6389165ecf677.png', 1, '2022-12-02 02:59:34', '2022-12-02 03:02:22'),
(79, 'Mbrella', '2022-12-02-6389163af11e1.png', 1, '2022-12-02 03:01:46', '2022-12-02 03:01:46'),
(80, 'Vero', '2022-12-02-638916465508f.png', 1, '2022-12-02 03:01:58', '2022-12-02 03:01:58'),
(81, 'FA', '2023-01-01-63b1712e3731d.png', 1, '2022-12-02 03:05:16', '2023-01-01 17:40:30'),
(82, 'Palmolive', '2023-01-01-63b1711576457.png', 1, '2022-12-02 03:05:31', '2023-01-01 17:40:05'),
(83, 'Himalaya', '2023-01-01-63b170f45e49a.png', 1, '2022-12-02 03:05:43', '2023-01-01 17:39:32'),
(84, 'Simple', '2023-01-01-63b170dc82ace.png', 1, '2022-12-02 03:05:51', '2023-01-01 17:39:08'),
(85, 'Zyan & Myza', '2023-03-23-641be6cf81b53.png', 1, '2023-03-23 05:42:39', '2023-03-23 05:42:39'),
(86, 'SAJERBELA', '2023-03-29-642334e4cab26.png', 1, '2023-03-28 18:41:40', '2023-03-28 18:41:40'),
(87, 'Ariz\'s Territory', '2023-03-29-6423e1d073779.png', 1, '2023-03-29 06:59:28', '2023-03-29 06:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '2', '2020-10-11 07:43:44', '2022-09-17 20:47:08'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":2,\"name\":\"Bangla\",\"direction\":\"ltr\",\"code\":\"bd\",\"status\":1,\"default\":false}]', '2020-10-11 07:53:02', '2022-10-19 23:37:08'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-08-03 06:14:35'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-08-03 06:14:35'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '01842593593', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Shopping Zone BD', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2024-11-23-6741ce971282b.png', NULL, '2024-11-23 12:46:15'),
(13, 'company_mobile_logo', '2024-11-23-6741ce9714753.png', NULL, '2024-11-23 12:46:15'),
(14, 'terms_condition', '<p>Welcome to Sajerbela, an online fashion destination. Please read these terms and conditions carefully before using our website. By accessing and using our website, you agree to be bound by these terms and conditions.</p>\r\n\r\n<p>Intellectual Property: All content on our website, including text, images, graphics, logos, and product descriptions, is the property of Sajerbela and is protected by copyright and other intellectual property laws. You may not use any content from our website without our prior written consent.</p>\r\n\r\n<p>Products and Pricing: We strive to provide accurate product information and pricing on our website, but errors may occur. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update information at any time without prior notice. Prices are subject to change without notice.</p>\r\n\r\n<p>Orders: All orders are subject to availability and acceptance by us. We reserve the right to reject any order at any time for any reason. By placing an order, you are offering to purchase a product and are subject to these terms and conditions.</p>\r\n\r\n<p>Payment and Shipping: We accept various forms of payment and will ship orders to the shipping address provided at checkout. Shipping times may vary based on location and other factors.</p>\r\n\r\n<p>Returns and Refunds: We want our customers to be satisfied with their purchases. If you are not satisfied with your purchase, you may return it within 14 days of receipt for a refund or exchange, subject to our return policy.</p>\r\n\r\n<p>Limitation of Liability: Sajerbela will not be liable for any damages or losses arising from the use of our website or the purchase of our products, including direct, indirect, incidental, or consequential damages.</p>\r\n\r\n<p>Governing Law: These terms and conditions are governed by the laws of [insert governing law]. Any dispute arising from the use of our website or the purchase of our products will be subject to the exclusive jurisdiction of the courts of [insert jurisdiction].</p>\r\n\r\n<p>Updates to Terms and Conditions: We may update these terms and conditions from time to time. Customers should review these terms and conditions periodically to stay informed of any changes.</p>\r\n\r\n<p>Contact: If you have any questions or concerns about these terms and conditions, please contact us at info@sajerbela.com.</p>', NULL, '2023-03-27 23:15:37'),
(15, 'about_us', '<p>Sajerbela is an online fashion destination that offers a wide variety of clothing and accessories for women. The website features a carefully curated collection of high-quality garments, designed to cater to every occasion and personality. From casual wear to formal attire, Sajerbela has something for everyone. The website also offers a range of accessories such as bags, shoes, jewelry, and other essentials that complete the perfect look.</p>\r\n\r\n<p>Sajerbela is committed to providing customers with an exceptional shopping experience. The website offers a user-friendly interface that makes it easy for customers to search for products, add them to their cart, and checkout securely. The website also offers fast shipping and excellent customer service.</p>\r\n\r\n<p>At Sajerbela, we believe that fashion should be accessible to everyone, which is why we offer affordable prices without sacrificing quality. We are dedicated to keeping up with the latest fashion trends and offering a diverse range of styles to ensure that customers can express their unique style and personality.</p>\r\n\r\n<p>We are committed to protecting our customers&#39; privacy and use industry-standard encryption and other security measures to protect personal information from unauthorized access, disclosure, and use.</p>\r\n\r\n<p>Overall, Sajerbela is the ultimate fashion destination for women who want to look and feel their best.</p>', NULL, '2023-03-27 23:16:44'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'info@shoppingzonebd.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#ec5504\",\"secondary\":\"#1955ae\"}', '2020-10-11 13:53:02', '2024-11-23 12:46:15'),
(19, 'company_footer_logo', '2024-11-23-6741ce97163ae.png', NULL, '2024-11-23 12:46:15'),
(20, 'company_copyright_text', 'Developed by EvertechIT', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2022-11-29 16:28:47'),
(22, 'download_app_google_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2022-11-29 16:28:52'),
(23, 'company_fav_icon', '2024-07-01-6682b80d651af.png', '2020-10-11 13:53:02', '2024-07-01 14:07:09'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '20', NULL, '2022-10-20 19:29:50'),
(34, 'seller_registration', '1', NULL, '2022-10-20 19:29:54'),
(35, 'pnc_language', '[\"en\",\"bd\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>At Sajerbela, we take the privacy of our customers very seriously. This privacy policy outlines the type of personal information we collect and how we use it.</p>\r\n\r\n<p>Personal Information We Collect: We may collect personal information from customers such as name, email address, shipping address, billing address, phone number, and payment information when customers make a purchase on our website. We may also collect non-personal information such as IP address, browser type, and pages viewed on our website.</p>\r\n\r\n<p>How We Use Personal Information: We use personal information to fulfill orders, provide customer service, and improve the overall shopping experience. We may also use personal information to communicate with customers about products, promotions, and other relevant information. We may share personal information with third-party service providers who help us with payment processing, shipping, and other related services.</p>\r\n\r\n<p>Security: We take the security of personal information very seriously and take reasonable measures to protect it. We use industry-standard encryption and other security measures to protect personal information from unauthorized access, disclosure, and use.</p>\r\n\r\n<p>Cookies: We use cookies on our website to improve the shopping experience and to gather information about how customers use our website. Customers can choose to disable cookies in their browser settings, but this may limit their ability to use certain features of our website.</p>\r\n\r\n<p>Updates to Privacy Policy: We may update this privacy policy from time to time. Customers should review this policy periodically to stay informed of any changes.</p>\r\n\r\n<p>Contact: If you have any questions or concerns about our privacy policy, please contact us at info@sajerbela.com.</p>', NULL, '2023-03-27 23:14:04'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'multi_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, '2022-10-19 11:44:52'),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'BD', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-08-03 06:14:35'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '5', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#c87446\",\"text_color\":\"#340404\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '1', NULL, '2022-10-20 19:38:47'),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-08-03 06:14:35'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, '2024-06-30 16:05:05'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', '137/5 katasur Mohammadpur', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '1', NULL, NULL),
(77, 'loyalty_point_status', '1', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'timezone', 'Asia/Dhaka', NULL, NULL),
(84, 'default_location', '{\"lat\":\"23.786520\",\"lng\":\"91.267316\"}', NULL, NULL),
(85, 'currency_symbol_position', 'left', '2022-09-19 08:22:53', '2022-11-29 16:28:41'),
(86, 'loader_gif', '2024-11-23-6741ce9717eb7.png', NULL, NULL),
(87, 'shop_banner', '2024-07-01-6682b80cb45af.png', NULL, NULL),
(88, 'new_product_approval', '1', NULL, NULL),
(89, 'product_wise_shipping_cost_approval', '1', NULL, NULL),
(90, 'releans_sms', '{\"status\":\"1\",\"api_key\":null,\"from\":null,\"otp_template\":null}', '2022-10-19 11:44:12', '2022-10-19 11:44:12'),
(91, 'company_hotline', '01406667669', NULL, NULL),
(92, 'maintenance_mode', '0', '2024-11-23 12:26:50', '2024-11-23 12:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `campaing_detalies`
--

CREATE TABLE `campaing_detalies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` varchar(191) DEFAULT NULL,
  `product_id` varchar(191) DEFAULT NULL,
  `start_day` varchar(191) DEFAULT NULL,
  `end_day` varchar(191) DEFAULT NULL,
  `discountCam` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaing_detalies`
--

INSERT INTO `campaing_detalies` (`id`, `auth_id`, `product_id`, `start_day`, `end_day`, `discountCam`, `created_at`, `updated_at`) VALUES
(481, '1', '799', '2024-09-02', '2024-09-03', '10', NULL, NULL),
(484, '1', '796', '2024-09-03', '2024-09-04', '7', NULL, NULL),
(485, '1', '808', '2024-09-04', '2024-09-05', '3', NULL, NULL),
(486, '1', '807', '2024-09-02', '2024-09-03', '5', NULL, NULL),
(487, '1', '810', NULL, NULL, NULL, NULL, NULL),
(488, '1', '811', NULL, NULL, NULL, NULL, NULL),
(489, '1', '812', NULL, NULL, NULL, NULL, NULL),
(490, '1', '813', NULL, NULL, NULL, NULL, NULL),
(491, '1', '814', NULL, NULL, NULL, NULL, NULL),
(492, '1', '815', NULL, NULL, NULL, NULL, NULL),
(493, '1', '816', NULL, NULL, NULL, NULL, NULL),
(495, '1', '817', NULL, NULL, NULL, NULL, NULL),
(496, '1', '818', NULL, NULL, NULL, NULL, NULL),
(497, '1', '819', NULL, NULL, NULL, NULL, NULL),
(499, '1', '803', NULL, NULL, NULL, NULL, NULL),
(501, '1', '820', NULL, NULL, NULL, NULL, NULL),
(502, '1', '821', NULL, NULL, NULL, NULL, NULL),
(503, '1', '822', NULL, NULL, NULL, NULL, NULL),
(509, '1', '802', NULL, NULL, NULL, NULL, NULL),
(515, '1', '823', NULL, NULL, NULL, NULL, NULL),
(523, '1', '824', NULL, NULL, NULL, NULL, NULL),
(527, '1', '826', NULL, NULL, NULL, NULL, NULL),
(530, '1', '825', NULL, NULL, NULL, NULL, NULL),
(533, '1', '827', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` varchar(50) DEFAULT NULL,
  `variant` varchar(200) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(2821, NULL, NULL, 770, NULL, NULL, NULL, NULL, 1, 5.952380952381, 0, 0.29761904761905, 'women-top-bottom-set-gGcvIk', 'Women Top Bottom Set', '2023-07-14-64b12b3b11510.png', NULL, 'admin', '2024-07-23 04:21:44', '2024-07-23 04:21:44', NULL, 0.00, NULL),
(2822, NULL, NULL, 771, NULL, NULL, NULL, NULL, 1, 5.952380952381, 0, 0.29761904761905, 'women-top-bottom-set-laresT', 'Women Top Bottom Set', '2023-07-14-64b12b9a9f3bf.png', NULL, 'admin', '2024-07-23 04:28:08', '2024-07-23 04:28:08', NULL, 0.00, NULL),
(2827, NULL, NULL, 769, NULL, NULL, NULL, NULL, 1, 5.952380952381, 0, 0.29761904761905, 'women-top-bottom-set-p7Uz6T', 'Women Top Bottom Set', '2023-07-14-64b12ae4419bf.png', NULL, 'admin', '2024-07-23 08:21:43', '2024-07-23 08:21:43', NULL, 0.00, NULL),
(2828, NULL, NULL, 697, NULL, NULL, NULL, NULL, 1, 30.952380952381, 0, 6.1904761904762, 'aarong-cotton-saree-Yl4JFb', 'Aarong Cotton Saree', '2023-03-31-6426d8e68e2c2.png', NULL, 'admin', '2024-07-23 08:23:06', '2024-07-23 08:23:06', NULL, 0.00, NULL),
(2829, NULL, NULL, 772, NULL, NULL, NULL, NULL, 1, 5.952380952381, 0, 0.29761904761905, 'women-top-bottom-set-06tboG', 'Women Top Bottom Set', '2023-07-14-64b12c990fff9.png', NULL, 'admin', '2024-07-23 08:24:28', '2024-07-23 08:24:28', NULL, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(137, NULL, 5, 1.43, '2024-07-23 13:06:39', '2024-07-23 13:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(542, 'Face Makup', 'face-makup', '2024-08-12-66ba2b072dccd.png', 0, 0, '2024-08-10 15:36:13', '2024-08-12 15:32:23', 0, 2),
(543, 'Face & Body Care', 'face-body-care', '2024-08-12-66ba2b2551fd2.png', 0, 0, '2024-08-10 15:37:48', '2024-08-12 15:32:53', 0, 3),
(544, 'Lip Beauty', 'lip-beauty', '2024-08-12-66ba2b4488e6e.png', 0, 0, '2024-08-10 15:40:01', '2024-08-19 15:06:05', 1, 4),
(545, 'Hair Care', 'hair-care', '2024-08-12-66ba2b6daaac5.png', 0, 0, '2024-08-10 15:41:10', '2024-08-12 15:34:05', 0, 5),
(546, 'Clothing', 'clothing', '2024-08-11-66b8914b0e56f.png', 0, 0, '2024-08-11 10:24:11', '2024-08-11 10:24:29', 1, 6),
(547, 'Video Shopping', 'video-shopping', '2024-08-13-66bb2580cb0d1.png', 0, 0, '2024-08-13 09:21:05', '2024-08-13 09:21:05', 0, 7),
(548, 'subcategory1', 'subcategory1', NULL, 542, 1, '2024-08-15 09:41:45', '2024-08-15 09:41:45', 0, 0),
(549, 'subcategory2', 'subcategory2', NULL, 542, 1, '2024-08-15 09:41:57', '2024-08-15 09:41:57', 0, 0),
(550, 'subcategory1', 'subcategory1', NULL, 543, 1, '2024-08-15 09:42:16', '2024-08-15 09:42:16', 0, 0),
(551, 'subcategory2', 'subcategory2', NULL, 543, 1, '2024-08-15 09:42:31', '2024-08-15 09:42:31', 0, 0),
(552, 'subcategory1', 'subcategory1', NULL, 545, 1, '2024-08-15 09:44:14', '2024-08-15 09:44:14', 0, 0),
(553, 'subcategory2', 'subcategory2', NULL, 545, 1, '2024-08-15 09:44:24', '2024-08-15 09:44:24', 0, 0),
(554, 'subcategory1', 'subcategory1', NULL, 546, 1, '2024-08-15 09:44:34', '2024-08-15 09:44:34', 0, 0),
(555, 'subcategory2', 'subcategory2', NULL, 546, 1, '2024-08-15 09:44:42', '2024-08-15 09:44:42', 0, 0),
(556, 'child category1', 'child-category1', NULL, 548, 2, '2024-08-15 09:45:17', '2024-08-15 09:45:17', 0, 0),
(557, 'child category2', 'child-category2', NULL, 548, 2, '2024-08-15 09:47:18', '2024-08-15 09:47:18', 0, 0),
(558, 'Women Top Bottom Sets', 'women-top-bottom-sets', NULL, 550, 2, '2024-08-15 10:16:56', '2024-08-15 10:16:56', 0, 0),
(559, 'Long shirt', 'long-shirt', NULL, 550, 2, '2024-08-15 10:17:09', '2024-08-15 10:17:09', 0, 0),
(560, 'child category1', 'child-category1', NULL, 549, 2, '2024-08-15 10:17:24', '2024-08-15 10:17:24', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(22, 0, 468, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(23, 0, 469, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(24, 0, 470, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(25, 0, 473, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(26, 0, 474, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(27, 0, 475, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(28, 0, 476, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(29, 0, 477, 0.00, NULL, '2022-12-09 13:28:56', '2022-12-09 13:28:56'),
(30, 0, 479, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41'),
(31, 0, 486, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41'),
(32, 0, 487, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41'),
(33, 0, 488, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41'),
(34, 0, 489, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41'),
(35, 0, 490, 0.00, NULL, '2023-03-29 11:59:41', '2023-03-29 11:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `message`, `sent_by_customer`, `sent_by_seller`, `seen_by_customer`, `seen_by_seller`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 17, 36, 'hello', 1, 0, 0, 1, 1, '2023-03-23 17:06:29', NULL, 36),
(2, 31, 36, 'hello', 1, 0, 0, 1, 1, '2023-03-23 17:09:52', NULL, 36),
(3, 31, 1, 'hello', 1, 0, 0, 1, 1, '2023-03-23 17:12:18', NULL, 1),
(4, 31, 1, 'how are you', 1, 0, 0, 1, 1, '2023-03-23 17:12:29', NULL, 1),
(5, 31, 36, 'hello', 1, 0, 0, 0, 1, '2023-03-25 09:57:21', '2023-03-25 10:12:22', 36),
(6, 17, 36, 'fdfdfd', 1, 0, 0, 0, 1, '2023-03-25 10:04:19', '2023-03-25 10:12:25', 36),
(7, 31, 36, 'hello', 0, 1, 1, 0, 1, '2023-03-25 10:12:50', NULL, 36),
(8, 17, 36, 'hello', 0, 1, 1, 0, 1, '2023-03-25 10:16:46', NULL, 36),
(9, 17, 36, 'jamil', 0, 1, 1, 0, 1, '2023-03-25 10:25:34', NULL, 36),
(10, 31, 36, 'aminul2g opu', 0, 1, 1, 0, 1, '2023-03-25 10:37:58', NULL, 36),
(11, 31, 36, 'hello', 1, 0, 0, 1, 1, '2023-03-25 12:08:45', NULL, 36),
(12, 31, 36, 'hi', 1, 0, 0, 1, 1, '2023-03-25 14:52:32', NULL, 36),
(13, 31, 36, 'how are you.?', 1, 0, 0, 1, 1, '2023-03-25 14:52:42', NULL, 36);

-- --------------------------------------------------------

--
-- Table structure for table `client_reviews`
--

CREATE TABLE `client_reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ratings` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `customer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_reviews`
--

INSERT INTO `client_reviews` (`id`, `name`, `comment`, `ratings`, `status`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Asikul Islam', 'In this shopping zone bd website is very excellent', '4', 1, 97, '2024-08-19 20:17:29', '2024-08-19 20:17:29'),
(2, 'Md. Jakir', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '4', 1, 95, '2024-08-28 21:35:44', '2024-08-28 21:35:44'),
(3, 'Md. Robiul', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum', '3', 1, 95, '2024-08-29 15:21:53', '2024-08-29 15:21:53'),
(4, 'Md. Miraj', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum', '2', 1, 95, '2024-08-29 15:23:10', '2024-08-29 15:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(144, 'test color', '#21365e', '2024-11-25 13:20:59', '2024-11-25 13:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `reasons` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `name`, `phone`, `reasons`, `images`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nur Tanzir', '01674437137', 'test complain', '2024-11-07-672cb7db3e3f3.png', NULL, 0, '2024-11-07 18:51:39', '2024-11-07 18:51:39'),
(2, 'Md. Naemul Islam', '01376587654', 'asldkf', '2024-11-27-6746ea0da1d50.png', NULL, 0, '2024-11-27 15:44:45', '2024-11-27 15:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'Naemul Islam', 'naemulislam.dev@gmail.com', '01732805218', 'test', 'Hello sir', 1, '0', '2024-08-03 06:47:25', '2024-08-08 09:33:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', 'ihkgh', 'chadnivabi', '2022-09-21', '2022-09-30', 5.95, 0.12, 0.12, 'amount', 1, '2022-09-21 09:36:23', '2022-09-21 09:36:23', 1),
(2, 'discount_on_purchase', 'Fashion', 'opu', '2023-03-29', '2023-04-06', 9.52, 0.06, 10.00, 'percentage', 1, '2022-12-17 18:46:19', '2023-03-29 11:16:08', 5),
(3, 'discount_on_purchase', 'first order', 'syx3x06vo7', '2024-08-22', '2024-08-23', 23.81, 0.24, 0.30, 'amount', 1, '2024-08-22 14:41:10', '2024-08-22 15:00:15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `payable` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'what you pay',
  `delivery_charge` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'take form Customer',
  `cod_charge` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'cash on delevery charge',
  `inside_dhaka_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `outside_dhaka_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `phone`, `payable`, `delivery_charge`, `cod_charge`, `inside_dhaka_amount`, `outside_dhaka_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FlingEX Hubs', '01376587654', 50.00, 100.00, 50.00, 60.00, 120.00, 1, '2024-09-04 13:41:30', '2024-09-04 13:41:30'),
(2, 'RedX', '09612002000', 80.00, 100.00, 0.00, 60.00, 130.00, 1, '2024-09-12 09:41:12', '2024-09-12 09:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '0.011904761904762', 0, NULL, '2022-11-29 17:26:13'),
(2, 'BDT', '৳', 'BDT', '1', 1, NULL, '2022-09-17 20:47:08'),
(3, 'Indian Rupi', '₹', 'INR', '0.71428571428571', 0, '2020-10-15 17:23:04', '2022-09-17 20:47:15'),
(4, 'Euro', '€', 'EUR', '1.1904761904762', 0, '2021-05-25 21:00:23', '2022-09-17 20:47:17'),
(5, 'YEN', '¥', 'JPY', '1.3095238095238', 0, '2021-06-10 22:08:31', '2022-09-17 20:47:19'),
(6, 'Ringgit', 'RM', 'MYR', '0.04952380952381', 0, '2021-07-03 11:08:33', '2022-09-17 20:47:22'),
(7, 'Rand', 'R', 'ZAR', '0.1697619047619', 0, '2021-07-03 11:12:38', '2022-09-17 20:47:24'),
(9, 'BDT1', '৳', '125678', '1', 0, '2022-11-29 17:32:18', '2023-03-23 14:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `is_active`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'MD. Rahim', 'Mia', '01722029717', 'deliverman@shoppingzonebd.com.bd', '435345345', 'nid', '[]', '2024-09-12-66e2b5cf876dd.png', '$2y$10$qrfnpyXjD47DK05embmvl.GTxG/AP4m7z6xijt6uFYhGHlObkNXbO', 1, '2024-09-12 09:35:12', '2024-09-12 09:35:12', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facebook_posts`
--

CREATE TABLE `facebook_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facebook_posts`
--

INSERT INTO `facebook_posts` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(4, 'facebook', 'https://www.facebook.com/sajerbelashop', '0', '2023-03-27 23:24:03', '2023-03-28 07:26:46'),
(10, 'facebook', 'https://www.facebook.com/sajerbelashop/posts/241801755044729', '1', '2023-04-02 22:24:14', '2023-04-02 22:24:14'),
(11, 'facebook', 'https://fb.watch/jFKBnUHPkj/', '1', '2023-04-02 22:25:17', '2023-04-02 22:25:17'),
(12, 'facebook', 'https://fb.watch/jFLt62txql/', '1', '2023-04-02 22:40:07', '2023-04-02 22:40:07'),
(14, 'facebook', 'https://www.facebook.com/sajerbelashop/posts/278306318060939', '1', '2023-06-05 22:43:23', '2023-06-05 22:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(24, 'Flash Deals', '2024-09-02', '2024-09-05', 1, 0, NULL, NULL, '2024-08-10-66b73e2ac5ceb.png', 'flash-deals', '2022-12-05 15:12:15', '2024-09-02 10:50:41', NULL, 'flash_deal'),
(25, 'collection', '2022-12-06', '2022-12-31', 0, 0, NULL, NULL, '2022-12-05-638db75635bbf.png', 'collection', '2022-12-05 15:18:14', '2023-05-31 10:57:45', NULL, 'flash_deal'),
(26, 'Deal of the day', '2022-12-14', '2022-12-09', 0, 0, NULL, NULL, '2022-12-29-63ad8f7b52fb3.png', 'deal-of-the-day', '2022-12-29 19:00:43', '2023-05-31 10:57:50', NULL, 'flash_deal'),
(27, 'Deal of the day', '2022-12-31', '2023-07-28', 0, 0, NULL, NULL, 'def.png', 'deal-of-the-day', '2022-12-31 19:04:12', '2022-12-31 19:07:31', NULL, 'feature_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(261, 24, 729, 0.00, NULL, '2024-08-10 14:38:16', '2024-08-10 14:38:16'),
(262, 24, 799, 0.00, NULL, '2024-09-02 10:51:16', '2024-09-02 10:51:16'),
(263, 24, 807, 0.00, NULL, '2024-09-02 13:50:13', '2024-09-02 13:50:13'),
(264, 24, 796, 0.00, NULL, '2024-09-02 14:23:16', '2024-09-02 14:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Q: How can I place an order?', 'A: You can place an order by browsing our website and adding the products you want to your cart. Once you are ready to checkout, you can proceed to payment and shipping options.', 1, 1, '2023-03-27 23:17:38', '2023-03-27 23:17:38'),
(2, 'Q: What payment methods do you accept?', 'A: We accept various forms of payment, including credit cards, and debit cards. We prefer cash on Delivery to you.', 1, 1, '2023-03-27 23:18:42', '2023-03-27 23:18:42'),
(3, 'Q: How can I stay informed of new products and trends?', 'A: You can stay informed of new products and trends by following us on social media or by signing up for our email newsletter.', 1, 1, '2023-03-27 23:19:13', '2023-03-27 23:19:13'),
(4, 'Q: Do you offer promotions or discounts?', 'A: Yes, we offer promotions and discounts from time to time. Be sure to sign up for our email newsletter to stay informed of any promotions or discounts.', 1, 1, '2023-03-27 23:19:30', '2023-03-27 23:19:30'),
(5, 'Q: How can I contact customer service?', 'A: You can contact customer service by email or phone. Our contact information can be found on our website.', 1, 1, '2023-03-27 23:19:48', '2023-03-27 23:19:48'),
(6, 'Q: Do you offer international shipping?', 'A: Yes, we offer international shipping to select countries. Shipping times may vary based on location and other factors.', 1, 1, '2023-03-27 23:20:11', '2023-03-27 23:20:11'),
(7, 'Q: How can I track my order?', 'A: Once your order is shipped, you will receive an email with tracking information. You can use this information to track your order online.', 1, 1, '2023-03-27 23:20:27', '2023-03-27 23:20:27'),
(8, 'Q: What is your return policy?', 'A: We want our customers to be satisfied with their purchases. If you are not satisfied with your purchase, you may return it within 14 days of receipt for a refund or exchange, subject to our return policy.', 1, 1, '2023-03-27 23:20:44', '2023-03-27 23:20:44'),
(9, 'Q: What is your shipping policy?', 'A: We offer fast shipping to various locations. Shipping times may vary based on location and other factors.', 1, 1, '2023-03-27 23:21:04', '2023-03-27 23:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `main_banner` varchar(191) DEFAULT NULL,
  `left_side_banner` varchar(191) DEFAULT NULL,
  `right_side_banner` varchar(255) DEFAULT NULL,
  `mid_banner` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_pages`
--

INSERT INTO `landing_pages` (`id`, `title`, `slug`, `status`, `main_banner`, `left_side_banner`, `right_side_banner`, `mid_banner`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(2, 'special offer', 'special-offer', '0', '2023-05-31-647723a2bc34c.png', NULL, NULL, NULL, NULL, NULL, '2023-05-30 11:27:17', '2023-05-31 10:38:26'),
(3, 'Summer offer', 'summer-offer', '0', '2023-05-31-647716951c15e.png', NULL, NULL, '2023-05-31-647716951d2af.png', NULL, NULL, '2023-05-31 09:42:45', '2023-05-31 10:40:26'),
(4, 'test', 'test', '0', '2023-06-04-647ca8f8d870a.png', NULL, NULL, '2023-06-04-647ca8f8d9190.png', NULL, NULL, '2023-06-04 15:08:40', '2023-06-04 15:08:40'),
(5, 'Eid Special', 'eid-special', '0', '2023-06-04-647ca9a26e099.png', NULL, NULL, '2023-06-04-647ca9a26ebf4.png', NULL, NULL, '2023-06-04 15:11:30', '2023-06-04 15:11:30'),
(6, 'Eid Double Special', 'eid-double-special', '0', '2023-06-04-647caa2dca23e.png', NULL, NULL, 'def.png', NULL, NULL, '2023-06-04 15:13:49', '2023-06-04 15:13:49'),
(7, 'EID SPECIAL', 'eid-special', '1', '2023-06-07-647fb9236072a.png', NULL, NULL, '2023-06-07-647fb92361d9b.png', NULL, NULL, '2023-06-06 22:54:27', '2023-06-06 22:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages_products`
--

CREATE TABLE `landing_pages_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `landing_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_pages_products`
--

INSERT INTO `landing_pages_products` (`id`, `landing_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 3, 697, '2023-05-31 10:40:52', '2023-05-31 10:40:52'),
(5, 3, 724, '2023-05-31 10:41:00', '2023-05-31 10:41:00'),
(7, 3, 725, '2023-06-04 15:08:41', '2023-06-04 15:08:41'),
(21, 5, 697, '2023-06-08 11:35:41', '2023-06-08 11:35:41'),
(22, 5, 725, '2023-06-08 11:35:41', '2023-06-08 11:35:41'),
(75, 2, 702, '2023-06-10 14:47:26', '2023-06-10 14:47:26'),
(77, 2, 700, '2023-06-10 14:47:26', '2023-06-10 14:47:26'),
(78, 2, 697, '2023-06-10 14:47:26', '2023-06-10 14:47:26'),
(83, 7, 752, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(84, 7, 751, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(85, 7, 750, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(86, 7, 749, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(87, 7, 748, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(88, 7, 747, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(89, 7, 746, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(90, 7, 745, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(91, 7, 744, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(92, 7, 743, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(93, 7, 742, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(94, 7, 741, '2023-06-11 15:55:30', '2023-06-11 15:55:30'),
(95, 7, 740, '2023-06-11 15:55:30', '2023-06-11 15:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loyalty_point_transactions`
--

INSERT INTO `loyalty_point_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `balance`, `reference`, `transaction_type`, `created_at`, `updated_at`) VALUES
(1, 23, '0bf21920-680b-480a-a49e-e5d3d6600fb0', 0.000, 0.000, 0.000, '100096', 'order_place', '2023-02-08 19:13:44', '2023-02-08 19:13:44'),
(2, 17, '640cee22-d2ad-4f95-bbf0-ab77f299e5c4', 0.000, 0.000, 0.000, '100098', 'order_place', '2023-02-08 19:49:45', '2023-02-08 19:49:45'),
(3, 17, 'fce31baa-ca03-43ee-984b-94211d3c9d2e', 0.000, 0.000, 0.000, '100098', 'order_place', '2023-02-08 19:50:45', '2023-02-08 19:50:45'),
(4, 17, '63b36687-dd17-440b-ba48-40a5614514ee', 0.000, 0.000, 0.000, '100099', 'order_place', '2023-02-08 19:52:39', '2023-02-08 19:52:39'),
(5, 27, 'd9a7a982-618c-47f1-9d49-bf359dbab920', 0.000, 0.000, 0.000, '100102', 'order_place', '2023-02-14 05:36:30', '2023-02-14 05:36:30'),
(6, 31, '3a1a8bae-0316-433a-98d2-4b43b76d9f21', 0.000, 0.000, 0.000, '100106', 'order_place', '2023-03-22 16:40:30', '2023-03-22 16:40:30'),
(7, 17, '380e572f-0945-4d68-b20a-9e8fab61adff', 0.000, 0.000, 0.000, '100003', 'order_place', '2023-03-23 20:06:17', '2023-03-23 20:06:17'),
(8, 37, '12d0cbdc-5233-4db0-a30e-87865aa2e5b6', 0.000, 0.000, 0.000, '100008', 'order_place', '2023-04-17 07:28:45', '2023-04-17 07:28:45'),
(9, 40, '1db7f0b8-6da8-4858-a7b4-630c79541ab5', 0.000, 0.000, 0.000, '100003', 'order_place', '2023-04-17 07:29:43', '2023-04-17 07:29:43'),
(10, 37, '3488ec22-089d-4534-8e80-4cb723e88496', 0.000, 0.000, 0.000, '100010', 'order_place', '2023-04-19 12:36:25', '2023-04-19 12:36:25'),
(11, 21, '1e89c456-d295-4c27-81a1-867213512eec', 0.000, 0.000, 0.000, '100005', 'order_place', '2023-04-19 12:37:23', '2023-04-19 12:37:23'),
(12, 53, '494304e3-0b8a-4f0e-9fb6-a78ebac3e2c8', 0.000, 0.000, 0.000, '100039', 'order_place', '2023-06-21 14:44:41', '2023-06-21 14:44:41'),
(13, 53, 'a213e913-db90-4d55-9e08-26674e1f7d3d', 0.000, 0.000, 0.000, '100038', 'order_place', '2023-06-21 14:45:13', '2023-06-21 14:45:13'),
(14, 37, 'fc0ef4df-4996-4a2c-a0bd-88c7c0503ccd', 0.000, 0.000, 0.000, '100013', 'order_place', '2023-06-21 14:45:41', '2023-06-21 14:45:41'),
(15, 53, 'a81c2d0e-7a57-49f5-be30-327a97463731', 0.000, 0.000, 0.000, '100021', 'order_place', '2023-06-21 14:46:36', '2023-06-21 14:46:36'),
(16, 53, '2c6f145e-baa5-45d8-ad71-8a3481579d05', 0.000, 0.000, 0.000, '100032', 'order_place', '2023-06-21 14:46:53', '2023-06-21 14:46:53'),
(17, 53, 'c2e43fa2-3947-40c3-b350-febd3c87a1f9', 0.000, 0.000, 0.000, '100020', 'order_place', '2023-06-21 14:47:07', '2023-06-21 14:47:07'),
(18, 53, '1238aaa1-5254-40eb-a667-275a27b270ea', 0.000, 0.000, 0.000, '100037', 'order_place', '2023-06-21 14:47:24', '2023-06-21 14:47:24'),
(19, 53, '9de6642a-baac-4d45-8293-989c430a6a4d', 0.000, 0.000, 0.000, '100036', 'order_place', '2023-06-21 14:47:49', '2023-06-21 14:47:49'),
(20, 53, '51f25460-76b8-4022-8b83-41f11892c74f', 0.000, 0.000, 0.000, '100034', 'order_place', '2023-06-21 14:48:13', '2023-06-21 14:48:13'),
(21, 53, 'e8d76186-dbe3-448b-b1c6-4532d3a7c44d', 0.000, 0.000, 0.000, '100030', 'order_place', '2023-07-06 18:20:49', '2023-07-06 18:20:49'),
(22, 53, '71ff8d58-f4ac-4b52-b169-6a1a4ad667d9', 0.000, 0.000, 0.000, '100043', 'order_place', '2023-07-06 18:21:28', '2023-07-06 18:21:28'),
(23, 53, 'd96de276-3f13-453f-a82d-7daa3b2fccd2', 0.000, 0.000, 0.000, '100042', 'order_place', '2023-07-06 18:22:48', '2023-07-06 18:22:48'),
(24, 53, '6598143b-31e7-4a2e-bb89-75291d6dc59b', 0.000, 0.000, 0.000, '100026', 'order_place', '2023-07-06 18:23:47', '2023-07-06 18:23:47'),
(25, 53, '04fa946d-5b10-4360-b05d-24a50bea9536', 0.000, 0.000, 0.000, '100025', 'order_place', '2023-07-06 18:24:31', '2023-07-06 18:24:31'),
(26, 53, '55ef459c-f868-4764-826c-f9d12b2484e6', 0.000, 0.000, 0.000, '100028', 'order_place', '2023-07-06 18:25:49', '2023-07-06 18:25:49'),
(27, 53, '3559f3d3-8691-43c0-a30d-7f2e71e3a483', 0.000, 0.000, 0.000, '100024', 'order_place', '2023-07-06 18:26:17', '2023-07-06 18:26:17'),
(28, 53, 'f7cfd230-9331-451c-87d1-b76d77000dc8', 0.000, 0.000, 0.000, '100044', 'order_place', '2023-07-06 18:26:46', '2023-07-06 18:26:46'),
(29, 53, '47580757-0a13-4d73-9956-ee99a72b8659', 0.000, 0.000, 0.000, '100023', 'order_place', '2023-07-06 18:27:42', '2023-07-06 18:27:42'),
(30, 53, '16408847-eadf-4981-ab0e-b41102d88baf', 0.000, 0.000, 0.000, '100041', 'order_place', '2023-07-26 19:32:56', '2023-07-26 19:32:56'),
(31, 53, 'ca121ae9-d7b0-464e-8c00-5adf319ecc94', 0.000, 0.000, 0.000, '100040', 'order_place', '2023-07-26 19:33:33', '2023-07-26 19:33:33'),
(32, 53, 'ff72e34e-007f-48a7-b0de-20e022aacd31', 0.000, 0.000, 0.000, '100051', 'order_place', '2023-07-27 19:20:47', '2023-07-27 19:20:47'),
(33, 53, '3c0fb71b-4eb0-42b7-bc60-fa90453fcecd', 0.000, 0.000, 0.000, '100044', 'order_place', '2023-07-27 19:21:19', '2023-07-27 19:21:19'),
(34, 37, '75fc2032-2013-48af-9f6a-c9c72d30c6bd', 0.000, 0.000, 0.000, '100045', 'order_place', '2023-07-27 19:21:45', '2023-07-27 19:21:45'),
(35, 53, 'c43ca1a7-cc92-4f5f-a603-8ba7d5b2d17a', 0.000, 0.000, 0.000, '100052', 'order_place', '2023-07-27 19:23:32', '2023-07-27 19:23:32'),
(36, 41, 'ce5ca2c4-9861-4a30-9815-8a03d8b60e43', 0.000, 0.000, 0.000, '100047', 'order_place', '2023-07-27 19:24:20', '2023-07-27 19:24:20'),
(37, 95, '85d0ac4e-cbf2-4257-95ec-ad06f28c4d6b', 0.000, 0.000, 0.000, '100008', 'order_place', '2024-10-14 15:31:53', '2024-10-14 15:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `meta_adds`
--

CREATE TABLE `meta_adds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_adds`
--

INSERT INTO `meta_adds` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Discover the Latest Fashion Trends with SajerBela - Your Ultimate Fashion Destination', 'Shop the latest fashion trends at Sajerbela - the ultimate online fashion destination for men and women. Browse through a handpicked collection of stylish clothing and accessories that cater to every occasion and personality. Enjoy fast shipping and exceptional customer service. Discover your unique style with Sajerbela today.', NULL, '2023-03-27 23:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(177, '2022_07_26_103744_add_notification_count_to_notifications_table', 67),
(178, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 67),
(179, '2023_01_09_191024_create_facebook_posts_table', 67),
(182, '2023_01_15_161129_create_campaing_detalies_table', 68),
(183, '2023_01_17_025418_create_product_campans_table', 68),
(184, '2023_01_28_151945_create_meta_adds_table', 69),
(185, '2023_05_29_162202_create_landing_pages_table', 70),
(186, '2023_05_30_180819_create_landing_pages_products_table', 71),
(187, '2024_08_11_200541_create_social_pages_table', 72),
(188, '2024_08_12_181211_create_couriers_table', 72),
(189, '2024_08_12_203837_create_pos_payment_types_table', 72);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `notification_count`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'hello', 'dsdffdfeerdfdf', 1, '2023-03-23-641c3d654f81e.png', 1, '2023-03-23 11:52:05', '2023-03-23 11:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00eb2df0633fb0e9fe288400beb21fc5a7b75a1c9a24ddec4e9a4b71e7b4a9e4157a9e23bdf99133', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 11:32:34', '2023-04-15 11:32:34', '2024-04-15 17:32:34'),
('0229df0598b88c7342a6a6d8b348981901fb94d60966aae596553355e247d80d9ebfef2ce1e134d6', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 20:20:04', '2022-12-15 20:20:04', '2023-12-15 20:20:04'),
('02d681a2de7217dff2a5e6c0a9568a51d93f1af8bcc01b81597d74582e5cbb19b1ba78d58ec81abc', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-19 17:02:13', '2022-12-19 17:02:13', '2023-12-19 17:02:13'),
('041a2dbbc207bb69ab65482e562e9922a0131a07c24b917b1f4aae4102361167847bdfa0f7de8511', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:54:13', '2023-07-18 20:54:13', '2024-07-19 02:54:13'),
('046f9dbae866974c2dc0783f53e093c948e84cf2697ba91ad29a713c280068974dd6b642f9e4d6a0', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 11:42:20', '2023-06-14 11:42:20', '2024-06-14 17:42:20'),
('0546f2f5e55c320e54f1721a56425665fdb6288eec6d4883e29e6008d42e9f1c9dae5571d66ce99c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-19 18:59:30', '2023-03-19 18:59:30', '2024-03-20 00:59:30'),
('05bbcc9ec50dc4662f9c4f48f27472b494353b4db9da8299883ce9261dfeaef6fa1160228dabd034', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 14:11:59', '2023-07-18 14:11:59', '2024-07-18 20:11:59'),
('05cc262bbdd27de40b320e171d88f1d178a6bd6881ca2e1fcd54b48c96a8c140c2770ed25cbecd07', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 18:41:25', '2023-07-18 18:41:25', '2024-07-19 00:41:25'),
('05e245eada064bf79aac176e92a6e23ae57fb8d167b2a857037be3e95691aee94c3acfa7f201b214', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:18:23', '2023-07-18 13:18:23', '2024-07-18 19:18:23'),
('0636cb52fd2da34099c2ed683cdf0415e1bce0f9ce8837a642b7a31dff49eb377a50bbbdca3d5952', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-20 19:39:01', '2022-12-20 19:39:01', '2023-12-20 19:39:01'),
('06d2cf5353c101e49636ce77a0748886024987708272946ac7c0978a970e859327928820afce12ec', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 15:21:45', '2022-12-06 15:21:45', '2023-12-06 15:21:45'),
('06ff41e9ca20d3f96b384bd076ad0e234933ec6c2dd445ed21c3bad50993de1d6db8e35e1c1e24c3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:28:52', '2022-12-21 21:28:52', '2023-12-21 21:28:52'),
('070ef41bb958515d4faf6b592d6001bb563b9cfb40b54b1a83bef2f06cccfaef611820af49495546', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 22:09:54', '2022-12-06 22:09:54', '2023-12-06 22:09:54'),
('0749a266bbb82dd36990a06687dbc477c87fa251180b188537860588d6eef5ead91f44b78a0c1357', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 11:47:53', '2023-04-04 11:47:53', '2024-04-04 17:47:53'),
('07c19cb69dda9c5744747575aa548494111b908cea1fc17c22eb63d839d10976150e5b3974e2dbea', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:20:15', '2023-07-18 20:20:15', '2024-07-19 02:20:15'),
('07c9fb3d7de85794c7b71363570202c73f16d7c60cc03746619bd5ee91260cc70532b5a9c30469b2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 22:11:41', '2023-07-16 22:11:41', '2024-07-17 04:11:41'),
('07d904f1c331930076b32006272eb096580b4dec84488b09f1d347070ed008a6a59bea70b3bfa163', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 19:03:44', '2023-06-14 19:03:44', '2024-06-15 01:03:44'),
('083ec95fb61a49e6300da2d952f6e0f66df7943de033407d0e8f23d1860c8c42902d45a0403ed534', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 17:20:58', '2022-11-25 17:20:58', '2023-11-25 23:20:58'),
('087ea143e6de17b186d2173e16c493957ac6264d78fa58b45610966125729e121c0561e28db0f150', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:04:29', '2023-07-18 13:04:29', '2024-07-18 19:04:29'),
('088df7eeb1b7cd08bccffcf28d71e4269f01d5c8410c85517bbbfa783c920cfa76616e61b6fa0294', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:53:24', '2022-11-29 03:53:24', '2023-11-29 03:53:24'),
('09cbef5a6c2163a58701dcf7f8c0237a86bb2f83e8a69605be423e0f2d2e2aae83191d85f1f3eb83', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 03:01:49', '2022-11-30 03:01:49', '2023-11-30 03:01:49'),
('0a59b880541127a6eb74932a1f832d37e5000353eb599846b38a2aa6f7a9bd843e968b1cc0ed0cbc', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:37:26', '2023-07-18 13:37:26', '2024-07-18 19:37:26'),
('0ab0aec174e1b6c1813fe8d6c56fe08eefd1e1e603dc8135fe3aaf22adc6b7df576629c92c5b5f96', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-05 16:27:47', '2023-01-05 16:27:47', '2024-01-05 16:27:47'),
('0ac3551a799989336617829509d8a22461767bf194b7c94e3fc39b7739a224a0645430a983112772', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-13 13:19:16', '2023-03-13 13:19:16', '2024-03-13 19:19:16'),
('0b196822b7f920dd4b6a9614c8e7e2081528ed664f1fdcfb52a3ff95ae9939b820545f0c6e54607d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 01:35:04', '2022-12-16 01:35:04', '2023-12-16 01:35:04'),
('0b27723a585fd0b8ba3ee995244b4b69ca14f052f15e56302f45d83583a05038bfb7afc4a532b368', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:08:51', '2023-04-15 10:08:51', '2024-04-15 16:08:51'),
('0b29cec65ee8346cab451e189dd78f03067f20f39c5b652427f53af44e4097de2a1e8af90fe54f47', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:30:24', '2022-12-21 21:30:24', '2023-12-21 21:30:24'),
('0b8bbcfd21ed0274aad9400306eac065af925e1fa8fc9cf0d209a2102ecc5b7f9dc847c6dcf322b7', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:11:16', '2023-07-18 20:11:16', '2024-07-19 02:11:16'),
('0b9da356f92a0364cbb0394ed0cc850c2107c227c35a7dfc80cda9327fe131f372fc74ba04335399', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:20:45', '2022-12-02 01:20:45', '2023-12-02 01:20:45'),
('0c3504f3d8e7b3f973a80fa53d7ea31c18f4121f13e798a2f064ed9875b7c36c2adf2bc27526adca', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 14:13:36', '2023-06-18 14:13:36', '2024-06-18 20:13:36'),
('0c400aa2e25b5d081697ea0df7f18b2075dc34d68a00e463c68027395abc8347ce120bf19ea6934b', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 08:44:06', '2023-04-15 08:44:06', '2024-04-15 14:44:06'),
('0c7ad4e34d2f4b2727040e115d4a40f1767a7230cd345e43eda744c45973817dd8a2f3f75e4a3d68', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 21:49:54', '2022-12-14 21:49:54', '2023-12-14 21:49:54'),
('0cdc83a411bba453d9054580be4f88fdfcfeed25b42939872aa66ae981ee21e9027854cbe61dbc45', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-17 11:36:35', '2023-03-17 11:36:35', '2024-03-17 17:36:35'),
('0f4b001aa91ea978d90edbc498e5c7719cd1ac6c36808c3e3bc6611648d42de4e3ccf335a80ccdec', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:28:37', '2023-07-18 20:28:37', '2024-07-19 02:28:37'),
('0fa758c2e64234ff050df63353afabcd1f647fa1c787f95d6df5a0ce46b0a64b97fd5a48f3812015', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 21:33:09', '2023-01-08 21:33:09', '2024-01-08 21:33:09'),
('1131bf932de2bdcc0f9da5b6cbd44b3b678fd9ec4af75afe60a46d3d39d2da27ae9fc7b8ce5263d9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 03:50:36', '2022-12-25 03:50:36', '2023-12-25 03:50:36'),
('11ff5a08288f9d997ea4407ac4a0d33d56a8d4f1dbf6a6186e6af9c9ae74bec5945cd143445e6af6', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 14:11:39', '2023-06-18 14:11:39', '2024-06-18 20:11:39'),
('12a97a0478fce675dadb40fb3d1d89f2d550c5f8d2c89cd2fd9afb53f94ccfe96a601019d1787bae', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:10:07', '2023-07-18 13:10:07', '2024-07-18 19:10:07'),
('132cb584f1abb81a0ee1830afe3a4ad7a7184f6aebe520bf2b7cbc53878167cf439bacbe85b73830', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:33:10', '2023-07-16 12:33:10', '2024-07-16 18:33:10'),
('1378eb22a96f9d4b9f881ee0d12beb8629972bc8174b7acffe630d4a111a604671e241e783c50ef3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:45:50', '2022-12-02 01:45:50', '2023-12-02 01:45:50'),
('137cfb17d354ee382d762cef25c5f852618014e9c788fa703eb8593a53a4cb26e5975981f4aecf9c', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 14:58:47', '2022-11-26 14:58:47', '2023-11-26 20:58:47'),
('13b411979e4fe06d4119c5756261983ec76ea6851e337a0c5e8cd69c1a59f6cfcd7abf6f3a33d18c', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-24 09:28:38', '2023-07-24 09:28:38', '2024-07-24 15:28:38'),
('13d9c38b1cf8f062cc811eea55196478f4ddcd8776d9ab014a7e115d66bf1fbc11f7ce5606e07209', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 18:30:19', '2023-06-18 18:30:19', '2024-06-19 00:30:19'),
('13dc2af6e665a18e04dc309df96370c1df758e47546881d0475ea6df58b7f18ea9b8423be92eafe8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 02:10:57', '2022-12-25 02:10:57', '2023-12-25 02:10:57'),
('14d67d1f9e282eb7cb7054e78f56cdbe5a9f199ca2fbd5a5f19e06a8380939f2c11f068a8e351557', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 20:28:49', '2022-12-13 20:28:49', '2023-12-13 20:28:49'),
('14f0f1da18990201f088dc843abdc9fd793222e71ef7d2b22c8a409d32d7d08cd69ab95c0cc3a911', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-09 00:28:12', '2023-01-09 00:28:12', '2024-01-09 00:28:12'),
('158cae9044606874e1f698b8854d0a494d6b0b515af6295fd15251519b9c1e8d9123d83135a46e75', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:38:27', '2022-11-30 01:38:27', '2023-11-30 01:38:27'),
('15ce315522399505327035c85f82ac353dc6cebc6afefd8b67ada5ae998ce83a90beeba0d3fd7487', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 15:19:07', '2022-12-06 15:19:07', '2023-12-06 15:19:07'),
('177dec6a51c6965272c641c94d5a49aaa99826faacec7cf8757b8c73fd20a47903701b581aaa658e', 55, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 09:07:42', '2023-07-16 09:07:42', '2024-07-16 15:07:42'),
('179da62daa7184899235de62471ea273da3ab47429f8c2b5868de30f4a01ebcc2838bfe397d6f91a', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 15:33:55', '2022-11-29 15:33:55', '2023-11-29 15:33:55'),
('17b2dc23e82d8ef8305732b16d177d1680951153698c239f35c021be6784bf431ecaf0bc711f808a', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:47:36', '2023-07-18 13:47:36', '2024-07-18 19:47:36'),
('17fade103bfe473363bb27220d1d82b8f4d00c04743345f5a523acac7ec9c84795d009c1e6c60945', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 20:20:03', '2023-06-14 20:20:03', '2024-06-15 02:20:03'),
('190acc8e83a777050d6cbc273f08460dfdcb5d2274d71d7816089aea91ca56d3e3fb7bdf5b5c191e', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:11:39', '2022-11-30 02:11:39', '2023-11-30 02:11:39'),
('194b54baa47e09340724323f339b4289517cfd80846e6d566c44758c35a8279f2ce30a00cca02635', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-26 09:29:29', '2023-06-26 09:29:29', '2024-06-26 15:29:29'),
('19684e8434bf431cbf5989da294b740e93c6d770d9df4979e6a8d58a73f7ac51e35fb091119c1c97', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 21:20:48', '2022-12-15 21:20:48', '2023-12-15 21:20:48'),
('1a49aca25d78ebcc8162274047aff9df6ba1e1bd0c34562dad0d7f705dbc639ab373547202d8f90f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:26:59', '2022-12-21 21:26:59', '2023-12-21 21:26:59'),
('1a6793f4989a11739797e901baaf313a3795c2b23569e85e0c9fed81bd2e75f6546e2bdfd374a99c', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 09:30:00', '2022-11-26 09:30:00', '2023-11-26 15:30:00'),
('1ac05d62818a8d28b9ab73a28025163cc89cfab11fb61c586b3c9dc0a3596edf232c7e60ba9f222e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 19:21:52', '2022-12-13 19:21:52', '2023-12-13 19:21:52'),
('1dab344ffe2ffe4d52dfcf367627b7d7e3d79d0ee3f169550d8f949790a21eba216825c9b1232e96', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 10:37:32', '2023-07-18 10:37:32', '2024-07-18 16:37:32'),
('1e9c6beea394a2543e9052716288e8949828f8fdecbdca6cefc3401988e65f766d10665eba7c3df9', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-29 17:41:19', '2023-03-29 17:41:19', '2024-03-29 23:41:19'),
('202331afa36a094a984a220ed6e47ba5fdbad229c6475fe02cd0970e2544ceb616d06daedbf7dae7', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 04:26:02', '2022-11-29 04:26:02', '2023-11-29 04:26:02'),
('202e44b2f3de73dc337da486a7c55ab6b56f4bc67437153ce62b18587edf5b3f39f950b998750607', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-20 11:24:46', '2023-03-20 11:24:46', '2024-03-20 17:24:46'),
('209a8f2a5932dc532da03bdb730420d42892b09b92b1de49359dbae293b9253bb10b876c0bd09b8c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 14:45:23', '2023-07-16 14:45:23', '2024-07-16 20:45:23'),
('217d39ab3f2b6168a545cfc1cd812a2d43743e09b0efbbf34129de2b896f4e41b56ae7a1a326d605', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 14:37:34', '2023-06-18 14:37:34', '2024-06-18 20:37:34'),
('2197c8430da19a1f0f1723ce578e61af9de0bd049ebe746e6d333eae156d68d1317c1011e61f86f4', 39, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 23:38:07', '2023-03-31 23:38:07', '2024-04-01 05:38:07'),
('21aac4090461b23dfb61cf10deebb287990016cc183ea3cb6850c1fec66a489b281d9698137195d3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:04:08', '2023-07-18 20:04:08', '2024-07-19 02:04:08'),
('221f5e49d71ff34f6a3b58b48320e9d1f7d6f481dde1abdd3f3f1ea7306735bfe18d7a581d739d09', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 02:06:04', '2022-12-25 02:06:04', '2023-12-25 02:06:04'),
('22608c1bca7a27d3eb575b5422b6ca0ae14eace75ccab9858cfe27721645597b5e58556bb41484eb', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 11:52:47', '2023-04-15 11:52:47', '2024-04-15 17:52:47'),
('22db569e24b024eb71ca8794430d6f46fb9a2e55557952ac984af2a167a8e86ab3cd2157a1fa5671', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-22 15:19:14', '2023-02-22 15:19:14', '2024-02-22 21:19:14'),
('23258b5c4803cd1bac6c09212770710f98b0a88644b136bdcf988f962d4cbd84aeb5f62d862a6063', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 22:02:05', '2022-12-22 22:02:05', '2023-12-22 22:02:05'),
('233dc873aa4867acb687a48f806e40b145c9007f4f906b29db2decb0246a58329445dfea7f82c81b', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-05-20 15:08:26', '2023-05-20 15:08:26', '2024-05-20 21:08:26'),
('24650fca51a34c95090e8103396d36223ab4804c383a46321e4409819f568d46f3341a8912c5cff8', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-07 09:09:03', '2023-06-07 09:09:03', '2024-06-07 15:09:03'),
('24c4cd9ada4ce7fd54c68af6d654dc7537673f5b450ec0c87e8c8f1f2b7a202ca0a379b62c7855d3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 09:11:54', '2023-07-18 09:11:54', '2024-07-18 15:11:54'),
('252228c20a6a525b7563788905e88550c46463d00c31a533a6b055fa173cea99a4c15595fc5d10f4', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:41:24', '2023-07-18 13:41:24', '2024-07-18 19:41:24'),
('2637ae0049442521172eb54ad91967f1739df8312061508ffd6cfaa258eaf6f313feb0cb2c3b4492', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-21 12:07:50', '2023-06-21 12:07:50', '2024-06-21 18:07:50'),
('267410cfdbf0c9270c6fff03b3db3ad4dbc773788b69e85741cffe6fca8416c27f7d237a299a0950', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:51:01', '2023-07-18 12:51:01', '2024-07-18 18:51:01'),
('26fe3356d33f0ec4b6a0f1b54340f506cbf5d84425bd1f7410476db1cbcf7c3ecc1f7ee9e2ba2b43', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:17:39', '2023-07-18 20:17:39', '2024-07-19 02:17:39'),
('2738072acc93f7bb225d4250b0915524e327dd24ef0a2f9771a7d9bea5f8ffffb45048725326babb', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 12:37:42', '2022-11-26 12:37:42', '2023-11-26 18:37:42'),
('27644da74abe131a5572986b416027424942d4864de45b218e61da37a6c0534fe69082d5ac2e25bd', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 17:40:28', '2022-11-25 17:40:28', '2023-11-25 23:40:28'),
('27a7487ef8f98ef78462be30d5c8048ff49b88ec0157961239efe60fd2c191172cf2339aa5886419', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-02-14 05:34:09', '2023-02-14 05:34:09', '2024-02-14 11:34:09'),
('28513a755dfec723beb5ac1a68c7ec1cbb3b54336bf7a2adbd1abd4dd91aed922708f3cf7d412d5e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 20:48:59', '2023-06-14 20:48:59', '2024-06-15 02:48:59'),
('28e153069d9a5dd10ef48cf5c4922058d9ab1f0f21c40b91718356354bec60f5de959936f46b4dc1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:02:38', '2023-07-18 13:02:38', '2024-07-18 19:02:38'),
('28e6efddd680fcb1f0c16ce7289295a0476255f40f120bdf6afd86a038bcbc0ff9dcf1955d86b4cb', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:50:47', '2022-11-29 03:50:47', '2023-11-29 03:50:47'),
('2a409a87ef5ed0b1a8cc29fa562b44c4c683ab67a8b181c635bf360b2d020600fe5b3752cb24ce46', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-24 17:58:43', '2022-12-24 17:58:43', '2023-12-24 17:58:43'),
('2b3049dec6876a1071fe42291315a527ea7d733e012ccbdcb1bb0a345c20ff59cbc312fec7183867', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 11:38:07', '2023-07-18 11:38:07', '2024-07-18 17:38:07'),
('2b821e37f86ae740cf2b46611916637a544abfe3270965c97290733b0cd077171a913dcf871c60d7', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-04-16 13:01:52', '2023-04-16 13:01:52', '2024-04-16 19:01:52'),
('2c1adf30b1783f3a351a25b711595a2a018004e387047ba3747246fc6858a41143746bb2d1b38e64', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 14:59:32', '2023-06-18 14:59:32', '2024-06-18 20:59:32'),
('2c4f142bee9853dbce55379eef99b54803edeccde879661ca55bc003baaee755be5485d09a4551c5', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:57:16', '2023-07-18 13:57:16', '2024-07-18 19:57:16'),
('2cf821883275698afcaff0ecfed0d1fa84c6f66921bf2de68fab3cd98387d599b2474d2f5af93199', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 03:55:17', '2022-12-25 03:55:17', '2023-12-25 03:55:17'),
('2d6e51a062bf258e14d21476b847a817f1c64bf78e2070f96e292b5dce837d45e07989348c287624', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-01 06:31:13', '2023-04-01 06:31:13', '2024-04-01 12:31:13'),
('2ec6c98fe0f05684d8ec920afd7e7285cf5c547a56232ecfb39054e417a050b989308fea255eab57', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:09:41', '2023-04-15 10:09:41', '2024-04-15 16:09:41'),
('2f353c58090b63a9919436588ac2d52900f439b55cc5d75bea2e9b13adfa6de77b01faea4ae28ce3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-10 18:41:06', '2023-03-10 18:41:06', '2024-03-11 00:41:06'),
('304fcf4a28d1389886f52d55f04eeb173972226d398b3e8efbed3a2638c49446e33f1fff7f5d1a96', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:32:04', '2022-11-30 02:32:04', '2023-11-30 02:32:04'),
('305beb3092b71e5b505abc2e378a838f124dcca857fab9530888b1d0e92e61a66b82855426cb68b4', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 12:08:05', '2023-03-30 12:08:05', '2024-03-30 18:08:05'),
('3188df4aa872e04ba26e03d345dfaf0ff147dc6ea8086ae96c08890ddc53e722fbe6b1a0f1ade28e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 14:16:39', '2023-07-16 14:16:39', '2024-07-16 20:16:39'),
('31c7b8fe4ecfdebea4b7d852cf83448eb71b2b80929023de1ef980590519b9c449aa6ecdddfdd92c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:22:58', '2023-07-18 20:22:58', '2024-07-19 02:22:58'),
('330a04ffe8d38de46e744f4c100e6e3ee2d6883c7cfa0a3eddfb95faa56149f24ed77df83477b17e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-02-02 20:36:50', '2023-02-02 20:36:50', '2024-02-03 02:36:50'),
('33e73f1a44bdec0cd3e8990486db57ca421ed985f48ca91bd4c5c31a96d0f028f63b55eb13bafb45', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-10-10 09:33:01', '2023-10-10 09:33:01', '2024-10-10 15:33:01'),
('37f405a6b6edd43377bd5819d4492ede0db49941a380c6c922413651489078c9a479706b7e601fa7', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:59:22', '2022-11-29 03:59:22', '2023-11-29 03:59:22'),
('3a8b5c266439ad22ae3ccaab13d79914e6242e2a3e6daa306405798bcc7cfd09c3c8aeb6f096ddc8', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 10:18:30', '2023-03-30 10:18:30', '2024-03-30 16:18:30'),
('3aee24feecb6c2b90ea8723a3f0a2d647107d57975b26c0dc2df385b1438fae00937e974c1654323', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-06 13:44:23', '2023-07-06 13:44:23', '2024-07-06 19:44:23'),
('3b07c55bcfac34d4a9644ff3f76e4d5c4b5f0d50813c7ac3fe0b9c92bac13b0fd5c649b6bfcac148', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 20:51:09', '2022-12-21 20:51:09', '2023-12-21 20:51:09'),
('3b1ad1e55a2373eb533ea2a6c5dc78cd571549929a3e2309f8eca6668eefd2ca52ebe8d7fd4ab9fe', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 14:51:30', '2023-02-24 14:51:30', '2024-02-24 20:51:30'),
('3b2694a126060961f81f80348c0cb8a7dc4e662c34d0521bcfd2421e810e4b4dc56050c24a9ad4af', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:26:04', '2022-12-21 21:26:04', '2023-12-21 21:26:04'),
('3b7b0caebce118298af0debf903cd76202427e5058e0c3d6510c1508011189c28f4c5ad4833cfad9', 23, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 18:40:05', '2023-01-08 18:40:05', '2024-01-08 18:40:05'),
('3ba37df8f80adb483048f715f41ee83a744b210111a5573b792c1aab5b8d128a727fde0d347acde0', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 11:43:31', '2023-07-18 11:43:31', '2024-07-18 17:43:31'),
('3c2f1c70712ed734cc2bbd12ff56e158c8840c2a8de83030173101f070897600ccb03d76c6d36da8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 03:53:19', '2022-12-25 03:53:19', '2023-12-25 03:53:19'),
('3c887cbc505e9988be4c25591964d4de655b666081f3a11cbed12dd947cecde86e1f72629dcf6a18', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:36:08', '2022-12-16 03:36:08', '2023-12-16 03:36:08'),
('3d130a2fe67337602ad06ef1ae90e4f9aad98b434333d9beb508e185fbd69c6854f55bcc4155c666', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 17:42:42', '2022-11-25 17:42:42', '2023-11-25 23:42:42'),
('3dac2db254178a370b44c15d83bd4e571d73fc657bd855c83c301d3c63d39cc5e4a74cd8d2094155', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:02:01', '2023-07-16 12:02:01', '2024-07-16 18:02:01'),
('3ecae604cf201d141b99c600c37aaa264a141c35a30f27a52e978861aa9019228457b582a5b22594', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:41:22', '2023-07-18 19:41:22', '2024-07-19 01:41:22'),
('3edbad9f4404d71d727805273fff46c451872f205bed119b03ad8a241a0b687321b13ac2948ca953', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:27:19', '2023-07-18 20:27:19', '2024-07-19 02:27:19'),
('3f0aa28a0d6d00cbe1d2c4409865eb1aa01ef3137716cedb40a0a5d4ecfafb46edaa04d69ab6a0c9', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 18:08:44', '2022-11-25 18:08:44', '2023-11-26 00:08:44'),
('3f1cb6056e160de1345b700967d9cd89ce53a528b3781b0bd82dfcaa7e725da99b6414b697e718fd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 03:58:38', '2022-12-22 03:58:38', '2023-12-22 03:58:38'),
('3f65fa41c8e26de6717fa025255a6d4f30dd91c960f2824af58cbd5c0544d7e4c413e2824571e1ef', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:00:37', '2023-07-18 13:00:37', '2024-07-18 19:00:37'),
('40067061759fda6f2cdf5bc727d4c7b692bd4479b16128be2d2a1bb289edca2a2f6988951f252159', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-18 18:19:51', '2022-12-18 18:19:51', '2023-12-18 18:19:51'),
('4030195873f1a5b81013600278c21bb784d332dff3639020a707d2b658ee343324ce0ff97841ea98', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-20 05:24:36', '2022-12-20 05:24:36', '2023-12-20 05:24:36'),
('40d31fb7e4ff7d42554689de675426cb779fb29342e76458b3e351044f16b9b9af6476a9bb56ca68', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-22 15:20:23', '2023-02-22 15:20:23', '2024-02-22 21:20:23'),
('415b7390a050f9b038dd9d2cd987393d29701bbcab35d182c5d331aebdb39e81202e4855fd5a14a4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:25:01', '2022-12-25 04:25:01', '2023-12-25 04:25:01'),
('4164f3e6ea41e2000835ad2859e945288a7eb57dad42033e05accc7a0c2c41a4492c78203e362bfd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:14:09', '2023-07-18 13:14:09', '2024-07-18 19:14:09'),
('417012477443a9daccfcbcde972299559718ce5dd7371209d48dae1b9ab4fd9476a070b844f1176b', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 11:27:24', '2022-11-30 11:27:24', '2023-11-30 11:27:24'),
('41e8c9a1ca27b95069c576258b49357682f900e6bbc3a85005c2ab6c6309af6f34e5117b7669d39b', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 00:03:52', '2022-11-30 00:03:52', '2023-11-30 00:03:52'),
('4208376555171185af67bb4b7c823dfc90b9d0a36ce134c9c6afe06e9effe3873b434207b68d908e', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 18:22:51', '2022-11-25 18:22:51', '2023-11-26 00:22:51'),
('421101ef7eb424b6f47f8bf4a294f079bce40d49afd9d8a11aa28f186609c2cdb79552e29de622ad', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:03:07', '2023-04-15 10:03:07', '2024-04-15 16:03:07'),
('424e19c9fbe86cbbd362f41d6d59db6396f1cc88f2f65d1c469cde73da220c6d771727cd1577665c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-19 09:22:33', '2023-07-19 09:22:33', '2024-07-19 15:22:33'),
('4273e5eab399d1770ea03ce8ddfd3b4abf48769e0d84dbf0b351da41528997183b02e34ec0255706', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:17:50', '2022-12-25 04:17:50', '2023-12-25 04:17:50'),
('42d724be16542ec2c5de461f9c92c67fa3865c78de8a918020f7c60598e0a17fbbf51e6fe58ec5b4', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-21 16:20:45', '2023-03-21 16:20:45', '2024-03-21 22:20:45'),
('4370fc9fce2d9183bc9426f9549f976bcaf2152513ad72230f8ca8e79fdc2f0ced5e0d29dbe525af', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 18:16:40', '2022-11-25 18:16:40', '2023-11-26 00:16:40'),
('437e4db319011b2d007e6ac59062198313389ae569ad87dd2eceb157e81e6b1ed2f65eb9252e3494', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 19:10:18', '2022-12-15 19:10:18', '2023-12-15 19:10:18'),
('446b5e109a2c4f56b277e99cd32c8b27b434d77dacc4c39615cbc44ef49b6ea496b507c00c044d62', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 09:10:37', '2022-11-26 09:10:37', '2023-11-26 15:10:37'),
('44d7737cbbe6633b07fde0939ef837d8000c82b89aef679c9aadc0404119ed873c2cd2f94239bd34', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:46:43', '2022-12-02 01:46:43', '2023-12-02 01:46:43'),
('45042a3612ae7bc4b0290372b51e67a83ed0aab441f660106507a2d48afeca70b1d46ef1d96b5121', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:54:35', '2023-07-18 13:54:35', '2024-07-18 19:54:35'),
('45b309d85b5e82801335a3c62d01723cb97a0f86a40ff60f890c8d935526d8c273b584a22e5172b6', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:12:55', '2023-07-18 20:12:55', '2024-07-19 02:12:55'),
('4651dc613da6c455bf5c5ba3bb76402fd1e43f2e770a1e91b5242ead4f61d7cafa915060af3330d9', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-06-06 09:00:33', '2023-06-06 09:00:33', '2024-06-06 15:00:33'),
('47c42eb8c10ec902c1afa7919211473f67bf7210b0d2414310eb1ed6b4275e3af89a3d139d35529e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 20:22:52', '2022-12-13 20:22:52', '2023-12-13 20:22:52'),
('47c5caab7c0a581f24463100d711b43a334138a971c5bf3ec0e914dadae7b03f1eb2a88a6ef9e540', 25, 1, 'LaravelAuthApp', '[]', 0, '2023-01-12 01:44:18', '2023-01-12 01:44:18', '2024-01-12 01:44:18'),
('480a0c3c01bb9e5681c90e2e1a1b9f7b95c8d3fdc35e789a892e57f2bf92c0116e3a9ed503f5ab9b', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:33:13', '2022-11-30 01:33:13', '2023-11-30 01:33:13'),
('48d31a9a95f923711e773788b381cfdf089eceb3ca278c1b79d3d21e07060d60835eaac8d78b22c4', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 01:07:37', '2022-12-14 01:07:37', '2023-12-14 01:07:37'),
('4a262efcfc109950d6089341ab62262ae1e92e7984d242336514ce23cc107470f2032e82772b2427', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-04-12 13:05:01', '2023-04-12 13:05:01', '2024-04-12 19:05:01'),
('4b1399b5dd6246161dda5eabad7400571c5d0316fce02c41c5aeb66d87c7c66816ffbe63435c54e3', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-27 11:01:50', '2022-11-27 11:01:50', '2023-11-27 17:01:50'),
('4b1555eb9ff678ad3407debe643b3b3759c9e167ca9e3fc39bdebf8221835db42e4499a950878739', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 18:14:56', '2023-01-08 18:14:56', '2024-01-08 18:14:56'),
('4b40d00e2fdd7374f9c847793d92abcd6cf5ee132b166153d2aae7a13823fff1570d86996451df3d', 32, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 12:37:18', '2023-02-24 12:37:18', '2024-02-24 18:37:18'),
('4b74cad1041dd8cc30c3c8c842e3bb7a17f3da5eac7f4bbf000d35f58b0d3c7033e7fde09013a176', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 13:23:12', '2023-07-16 13:23:12', '2024-07-16 19:23:12'),
('4c840f9ce1349b8924e71536c5d3ac6562e0d11622fb5924f655fec39b3a6ccbc3039e3e676bc4aa', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-28 07:29:47', '2022-11-28 07:29:47', '2023-11-28 13:29:47'),
('4d7f6500c45ec2fd6d7a8db8371840bbe2fdb96ad65a4a8043fd9de57514bf4fe3ad9f8227d12ed3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-04 18:58:59', '2023-01-04 18:58:59', '2024-01-04 18:58:59'),
('4e129d82aa122af1bf7d9fa2cb6e60af0a6c5787d9c394f9c2d565d85536fbc851c4bd3f958aac8a', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:45:02', '2023-07-18 13:45:02', '2024-07-18 19:45:02'),
('4e238c7ea4390889f981c6e6b2502795e7900df5d3746beaa3bf74e10b0be4b4f93e2a5d9011ca11', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 20:49:30', '2022-12-21 20:49:30', '2023-12-21 20:49:30'),
('4e7b4421b6dc04a03a235e971a957907ffdc10fc0a2c5242a5d27f16a3a3bfb846ffaa596a605cc5', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-27 14:03:11', '2023-07-27 14:03:11', '2024-07-27 20:03:11'),
('4ed1eccd6a18a2497dd74dc1ed03e1f8b8ce16f0d802f304d95874e17d51d6012114ee76c4b4844b', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:06:30', '2023-07-18 13:06:30', '2024-07-18 19:06:30'),
('4ef803d770607383c192bee81cb00f6f1a832b783217c22db300704a1b937d294391cdcdead53093', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 21:48:00', '2022-12-15 21:48:00', '2023-12-15 21:48:00'),
('4f03ad6d0787dcaee04d5690faa54338354ee70fb7ea61d9f05dfb8e01480661a717f3601862e664', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-04-13 09:32:55', '2023-04-13 09:32:55', '2024-04-13 15:32:55'),
('4fb419020f1b725610b533c98257f5e6f59a07307effda7d1e83a424c21a7316fc3a813d004ffb6f', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 20:02:52', '2022-12-13 20:02:52', '2023-12-13 20:02:52'),
('5042e742b8b347ed8d5cb134f1e60786c84990c12b37da8bc7678fe302ef5cc641d53695f8d6140f', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 13:05:13', '2023-04-15 13:05:13', '2024-04-15 19:05:13'),
('50b90f086491ca157c70f167d98efcf06912891bc2bb7fe11c97d15df617061759460b4e6c07c482', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 22:25:25', '2022-12-21 22:25:25', '2023-12-21 22:25:25'),
('515571c9de45c643d8cd5fbf26b6fb451abc4964f3008117f350b1b80b2019343885b923ed308695', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-22 11:50:24', '2023-07-22 11:50:24', '2024-07-22 17:50:24'),
('51f46ab776afb6abb67e619ab0c9462925ba08a2a0cc30cde138004b35107132d97d676de4221cdc', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 19:55:48', '2022-12-13 19:55:48', '2023-12-13 19:55:48'),
('526769bb63ff335ebc454130c1cb7ec1fff1c95817e72f65fd07fbbf867f9dd38c53e665101eacbc', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-17 11:29:33', '2023-03-17 11:29:33', '2024-03-17 17:29:33'),
('535657c0a2914f0c270b080176028ba79f9f08044ea5ff52fe7d9a123e7bac7c4cec266287bad199', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 20:31:48', '2022-12-13 20:31:48', '2023-12-13 20:31:48'),
('5367276887395c0090b4301620fec5f8dc9e2eb619c9dc49a040fd95167110cd5a21893c5726129c', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-17 16:20:15', '2023-06-17 16:20:15', '2024-06-17 22:20:15'),
('536b82726bb5ba227a1eaf05bc19f3b65d5d8799417a3414491a578dd529d07e1cf7d029e891329f', 40, 1, 'LaravelAuthApp', '[]', 0, '2023-04-10 14:18:27', '2023-04-10 14:18:27', '2024-04-10 20:18:27'),
('548e53305d40483fd4fa1f9488a8a4ed396d529e8e605712af251f221bf7a9e5b7aaaa9c99187194', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 19:56:19', '2022-12-13 19:56:19', '2023-12-13 19:56:19'),
('54f9be6e7379ee55f4da5a986d92ec1e4e2414069e1d79f98c3569f796613e51b77a776a0cd73f61', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 21:52:56', '2023-07-16 21:52:56', '2024-07-17 03:52:56'),
('551f108cebd91da30fbfe0a45abe2740d2b0b59d33fff6b50e7a19954cee49bd0631e551e95e5918', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:09:03', '2022-12-22 04:09:03', '2023-12-22 04:09:03'),
('5546bc29db539875aa74a7059fe81707091476a27ddf24568bbc91aab05ee981038d2c9e3d7e2f69', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 14:49:45', '2023-02-24 14:49:45', '2024-02-24 20:49:45'),
('5669c9ae92d4330d47313185bb274e19c2e1cfc8eea50b68c34c1d345074fc3c4d3b8703b9ef1bc1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:24:10', '2023-07-18 12:24:10', '2024-07-18 18:24:10'),
('57267adb3947e0807eb20e47261a76ea7ca57c896248422965ac3b0a5a33d98edeccf6ebf6843a3a', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 11:50:21', '2023-03-31 11:50:21', '2024-03-31 17:50:21'),
('575de4f937a140f47cbde558b7d490237bb1717c6d2a2fb45dc48712c50f78269fbcee398fdbae1f', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-18 19:01:28', '2023-06-18 19:01:28', '2024-06-19 01:01:28'),
('58f4b748489a4b4425564720cce5e0d3d8f749f4c3babcc31ee19c4665305ace29ee64412e9bc4b8', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 21:06:03', '2023-07-18 21:06:03', '2024-07-19 03:06:03'),
('5990ab9da0deeee870a01cac0aa2341d36c51513a9784662b40ec8628bc613af65737f54cacccc7b', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 17:54:42', '2023-01-08 17:54:42', '2024-01-08 17:54:42'),
('5a024a843e6de494f0f4a4b0cbb82c8719cc4f38dc725dd695ec1caf2ed11f0c32843424cee1e0db', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-04-17 15:50:59', '2023-04-17 15:50:59', '2024-04-17 21:50:59'),
('5ca2aafbe265e5bbc92d0187d347567f79356ee153e54da319ff45b3920083e529113ac8e5014ca4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 16:33:21', '2022-12-11 16:33:21', '2023-12-11 16:33:21'),
('5dfa89a0f3e8b3e791df309b878dd748ba3e87deca9f671bcd5ef97e1c855ff770da0624414ea619', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:15:07', '2023-07-18 20:15:07', '2024-07-19 02:15:07'),
('5eb35dba256452846de721ad584863d25c1ae2fee77ea06c93a04538b96b1871a2df22519d72771f', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:43:17', '2023-07-18 19:43:17', '2024-07-19 01:43:17'),
('5ebd1dfaa029904ce2089c4c2189419484db11187012046628c6da9dba70b8834c9da32619153137', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 18:45:43', '2023-07-18 18:45:43', '2024-07-19 00:45:43'),
('6045fb3703e17a37f8cf0bd115eedbac0cd4d32bc2d4f8832a83f8c8480554972a9d75dbf2db1beb', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-12 21:10:44', '2023-01-12 21:10:44', '2024-01-12 21:10:44'),
('6177578e187c751c96748a0167e1bf9cb2ed8afbf359e3696f2b80d8ffcff0734ac782f02d51cb31', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-03 21:17:16', '2022-12-03 21:17:16', '2023-12-03 21:17:16'),
('62138a504dd2cc854aa6229f7e854ba0d808b4bcb23cdb2c2beef0afa0f1864635250e380464002c', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 16:34:05', '2023-01-08 16:34:05', '2024-01-08 16:34:05'),
('6270a05bb2969ac1794710423362eb5288cf5f7fb11f261db7b4e6c14a636eab01c27eb3061f75b1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:07:47', '2022-12-25 04:07:47', '2023-12-25 04:07:47'),
('629c92dd603bb1e0087173baf6263be1f583176f21b526b370e69041602be400d85a4cd46c057868', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 11:30:13', '2022-11-26 11:30:13', '2023-11-26 17:30:13'),
('633d19b6b284a1619394050cfffc49519d57d0c84ad26e562f23e7ad3dfe5e44720d1d38652162e9', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 01:21:17', '2022-12-14 01:21:17', '2023-12-14 01:21:17'),
('634343fd2e56e21b286ad26a62bb405953249302ff5ae931230d728b8d3423ab88435d8c35af95a1', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-19 08:48:02', '2023-07-19 08:48:02', '2024-07-19 14:48:02'),
('63fabe3b0f19fdf9e3089ecdc177881793b51101c5b797db2b51f5410d484721ef7152d4e3f4dd3d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:04:09', '2022-12-02 01:04:09', '2023-12-02 01:04:09'),
('6445237667a8404663f28ca60dbceadf45bc50fac4a6ee0dc23bf39570ab9f43ddfdd1a22d3acf47', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-25 09:22:36', '2023-03-25 09:22:36', '2024-03-25 15:22:36'),
('648d660f29151fab43e0ea0778a5fb719d81ac5fbd72deb452e033ea61d15f4ea098b801343a1959', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 06:20:43', '2023-03-30 06:20:43', '2024-03-30 12:20:43'),
('64ecc7222bc36073844e7ee719f442ec6f1752c41eaacddb38ef618be4acb3d6c44ccd2341667328', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:33:52', '2023-04-15 10:33:52', '2024-04-15 16:33:52'),
('65494ce34d0bbebec8284270c2aedd8cf0646a3d268229ae542472b44c52eab02cc018d082fee13f', 38, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 17:58:28', '2023-03-31 17:58:28', '2024-03-31 23:58:28'),
('666a90f3152b12dc489169cc92deb3634fa69008e7d14fe3650b1f9b34603022666cb313a2ae4dd1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 17:58:10', '2023-04-04 17:58:10', '2024-04-04 23:58:10'),
('6690caf208b3888b09b6861abc29197344c18fa008bb2edfaebb36ff98774b791a203f93b5820f7c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 20:48:46', '2022-12-21 20:48:46', '2023-12-21 20:48:46'),
('66edd6550a4bc3b621d9a4a5a2e644b1f92a7e6b7f32bceb236c05fd951e519fc821dbb60bd6e105', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 22:17:23', '2023-07-16 22:17:23', '2024-07-17 04:17:23'),
('67002878c37952436f8a5a39305a532cb83fae90e63ce41d18788cbf213e8052f7cc1bccd8bcd933', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-29 17:48:13', '2023-03-29 17:48:13', '2024-03-29 23:48:13'),
('6780c1ee50295fd3a0ab47fd9c0efcf6546c4c8dc3030778e5efd14616452cd68c1a60e103312942', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:58:24', '2022-11-29 03:58:24', '2023-11-29 03:58:24'),
('67a877b6cf02410f83c42af9698f3d81db3a4dbb55f3bcf1e70ef6047729c5a11c93dc99aea89fb3', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 18:22:26', '2022-11-25 18:22:26', '2023-11-26 00:22:26'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('688725fe46c8a42569d731d4424972df6f541b6045afbb97d25bd4a57d9cd0ea3e796ce6890593a6', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:07:39', '2023-07-16 12:07:39', '2024-07-16 18:07:39'),
('68a86dc37bb50a75bee20ccad71e3f53a48cb9d0859f13ea30875e5604e6989509ac017764298f53', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 22:55:09', '2023-07-16 22:55:09', '2024-07-17 04:55:09'),
('69b39d46dbbb6489e746ddeae0f39af3e4072874b55ec0433e1a46b4b99a530c62e48f0aaf4cdb0e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 03:57:14', '2022-12-22 03:57:14', '2023-12-22 03:57:14'),
('69bef2b9b662a978b6ae9d75b526dfe7620030002dbf83266094e8aa7e95506483ba630c59a3099a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 19:12:39', '2022-12-15 19:12:39', '2023-12-15 19:12:39'),
('69d2d47ba022145db667ce949221d46719e471fce88a6e531c3f40c68890197b53b9dfbf40ae61c0', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:33:46', '2022-11-30 02:33:46', '2023-11-30 02:33:46'),
('69d9e884b08dd613ff966c37c67b4c9782b0ab46d490debd27e274fc9fa0b861513f5624da38abaf', 25, 1, 'LaravelAuthApp', '[]', 0, '2023-06-04 14:59:21', '2023-06-04 14:59:21', '2024-06-04 20:59:21'),
('6a2ac5336082f02be8e9b5b8ac2e1c2e4c06a9630ed616a4617186717cbd130c18f94da0e3a1b1fd', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 14:11:15', '2023-03-31 14:11:15', '2024-03-31 20:11:15'),
('6a7a7caee737595d6e2162531b1d356cab90d95209d40670ddd037175d9fd02cc4f1263430fd307e', 40, 1, 'LaravelAuthApp', '[]', 0, '2023-04-10 08:21:42', '2023-04-10 08:21:42', '2024-04-10 14:21:42'),
('6ab58c17d71311216302cf96cbc2d623844c30913c165898e0eb0093bbeeb265a7a68330a89d9d6d', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:28:27', '2023-07-18 13:28:27', '2024-07-18 19:28:27'),
('6b10ac5d392dcac0213d78854ae09ca5bf7fb7d8c041e5488ad226c836c5fa60ba195608b1614f79', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 17:27:03', '2023-03-30 17:27:03', '2024-03-30 23:27:03'),
('6b827c873212fde304a8b95097adb03dcf9527b962e7a2f22f9bc2ab5deecd7d26bf927a98a775eb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 00:02:57', '2022-12-12 00:02:57', '2023-12-12 00:02:57'),
('6cdda71aa434b4c90433b9c8877371e90df639967ccbdef65e4bf9c1d2c6a23d8b26edd55918ec51', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:56:27', '2023-07-18 20:56:27', '2024-07-19 02:56:27'),
('6dabf546ce2b056fac338ef793d20c4d086833ceaeee31058f1d9144bc8480e4dab7163bfa584e40', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-04-10 06:12:38', '2023-04-10 06:12:38', '2024-04-10 12:12:38'),
('6dca0a46d90d27926c6bac8bf8d5f2e578e01baa97272840c7b3623dadd895c43127fa31cf857a99', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 19:51:31', '2022-12-11 19:51:31', '2023-12-11 19:51:31'),
('6eac56fc3adabf3e800143822e3e6d376e5121f2cf67649df49359c6e0c20f57d46539a6fdf96bc4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 04:38:37', '2022-12-11 04:38:37', '2023-12-11 04:38:37'),
('6f1fee108ff89ee2f10ec5f5d79ad2cc68e89e88beb86d65e04580f5472a5bfa16d8b8d8a5360e3f', 38, 1, 'LaravelAuthApp', '[]', 0, '2023-03-29 11:59:03', '2023-03-29 11:59:03', '2024-03-29 17:59:03'),
('6fb8fb939989f575ea2a668312b7afe4d5f689623083b44613a0f2a7b83d78f6e59d76057ea2d3c8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 20:18:01', '2022-12-22 20:18:01', '2023-12-22 20:18:01'),
('7003b116cde85db3cf63cb703b0e992e97cf90907c6708bc3763f43e09e68b6887c41cc70d0d4994', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-05-28 09:43:28', '2023-05-28 09:43:28', '2024-05-28 15:43:28'),
('707bb73a40bb994e3988cb2cd62edbeb0052c51b5f18928ac2f811fd7d5679f6f41a76f3ff94b267', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 18:40:34', '2023-07-18 18:40:34', '2024-07-19 00:40:34'),
('715fdd7c2e85d1d829048a0b522541b6dd067e08d4b5570480680ce1a87e292f0c213029d2b36b3f', 64, 1, 'LaravelAuthApp', '[]', 0, '2023-07-26 09:35:06', '2023-07-26 09:35:06', '2024-07-26 15:35:06'),
('7267211055973cd87debdf48f464c5715f4b4b38331b2948f01267754ef4af3546bacd78e5d3bbf1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:59:41', '2023-07-18 13:59:41', '2024-07-18 19:59:41'),
('726d611e369e1af2f2cd426db0ac8622e28da41a08f6d823306d31ffd6dc7e5de84aa45e0363fea3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-09 01:44:35', '2023-01-09 01:44:35', '2024-01-09 01:44:35'),
('72864bea75c16e753e3d11310ac98b47e028ef7b0e9ca10a4050430a951291f1b26696cc70a66769', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 12:08:23', '2023-04-15 12:08:23', '2024-04-15 18:08:23'),
('73d7fdd67e678a781151415f300ddf813060254500e5f732f93b60332052842fb53d1bd437ad61bd', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 16:23:00', '2022-12-22 16:23:00', '2023-12-22 16:23:00'),
('73f95d2db479579737ecbf76d5bccf27ef15096d1031dd423ab9d4f67ad5de21059d8bd160336728', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 14:58:02', '2023-07-16 14:58:02', '2024-07-16 20:58:02'),
('748afeec59a22211358d75a1ca4a48f3b8d8e341bd5c59df20645d25179b83fa1267857d60f01cf6', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:21:51', '2022-12-25 04:21:51', '2023-12-25 04:21:51'),
('7599f33966e199a1ad565cd3ec7ed46b9818d9106c330d0b4b07015452225309d23d9c886738e764', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:08:12', '2023-07-18 20:08:12', '2024-07-19 02:08:12'),
('76281c91ef0f28e055919810a5bbc03a6f93ce670df5f91b07b1ebdf5b9a2280c6970d36877488bf', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-18 01:17:38', '2022-12-18 01:17:38', '2023-12-18 01:17:38'),
('7687884fd093d7086716bc82f492e9df65291d434ff2c99f5229b9a2bf2b04a376abb4ec18ed5bc3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 19:37:51', '2022-12-17 19:37:51', '2023-12-17 19:37:51'),
('76ce605ea366e72d4b18b30ab0f4358cae1559fcdcd467a5b6ef9587d8dd16ff1d34f1e8b3ba4f7d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 16:03:51', '2022-12-21 16:03:51', '2023-12-21 16:03:51'),
('771e46c4390da018fe4deb0c5430dc724109968dc3d264b8fe10f857b626d87efcd2e73b41e78ec1', 18, 1, 'LaravelAuthApp', '[]', 0, '2023-01-11 16:55:35', '2023-01-11 16:55:35', '2024-01-11 16:55:35'),
('77c4539c5fca89fd4e5b71018e1316c5e6f12604d47df3b408585c7a8f653fa6d659f9340dcb7c97', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 11:56:47', '2023-07-16 11:56:47', '2024-07-16 17:56:47'),
('77c4991bb5b0f208bb34f7019456bca20a47254efeb0093d2489894d49bb346ec9964b7653450ff8', 61, 1, 'LaravelAuthApp', '[]', 0, '2023-07-19 03:57:40', '2023-07-19 03:57:40', '2024-07-19 09:57:40'),
('77f1a8d239dff61dd6608abb4e981070d1ac40e4e82543c2fd4a9082580630248226bfa2632a3792', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 10:03:03', '2023-03-30 10:03:03', '2024-03-30 16:03:03'),
('784f03099b94a61f05c14d0784ee8a1628bfff032cd11266937ad73347bb409d9dc8d719aabe327f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:40:04', '2022-11-30 01:40:04', '2023-11-30 01:40:04'),
('78bb208e5724594b2e380929bdfde484b9ab4a829e49560d8f713281d29e57966773ce28900b3fef', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 10:06:03', '2023-06-14 10:06:03', '2024-06-14 16:06:03'),
('79b3125c3e6b13784ef15755f6aa02c95e3eafe339a2c55a852cbdc7f2496ddfcd2ce95a1171cd60', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:26:31', '2022-11-30 02:26:31', '2023-11-30 02:26:31'),
('7a8ee05dce29082d0115faf7f449cf9d68086d5dc3d232c52515c8af12e9ed14fa5bd77a13b85e88', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 15:29:50', '2022-11-29 15:29:50', '2023-11-29 15:29:50'),
('7aca258746f06f7063c56b7832e29a6796b8e60c12ec8c44d41f13753443d70eab9d7c516b7f97af', 20, 1, 'LaravelAuthApp', '[]', 0, '2023-01-10 20:03:06', '2023-01-10 20:03:06', '2024-01-10 20:03:06'),
('7ae793b70bbaeffe03d5cd9fa1000cb413a0703abe5d6dbc486e561a47e910942f8d8911a4e0cb09', 18, 1, 'LaravelAuthApp', '[]', 0, '2023-01-10 19:54:35', '2023-01-10 19:54:35', '2024-01-10 19:54:35'),
('7b6309a24d09c95e4b8dd08cf42400e48b9645a82fca3db5be5fbd3d7fe9e2884efa4990c79ea3ef', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 14:22:45', '2023-06-13 14:22:45', '2024-06-13 20:22:45'),
('7c75733305709daebcaf48c93117fe1a13d99a6bfc2fe1f4af3cd3e2bf2c40eba9c52bd33a9a9780', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-28 21:18:28', '2023-03-28 21:18:28', '2024-03-29 03:18:28'),
('7d47b3fb69761388a7acd26276a7e0a7c567863d3b510264ed76b52b59670f589b591863d5cd3a80', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 02:08:41', '2022-12-25 02:08:41', '2023-12-25 02:08:41'),
('7d859d5ca3f3505d50787450796f5b40374ccb75d134b9b6623dcdf30d7ba17824b72f8879bed1c8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 01:14:25', '2022-12-22 01:14:25', '2023-12-22 01:14:25'),
('7dc5927c589b2f71677514af3fe22fc42ef2b0c4abd3026984c8122f1b1b2a372157eaba1344de42', 68, 1, 'LaravelAuthApp', '[]', 0, '2023-10-16 07:29:33', '2023-10-16 07:29:33', '2024-10-16 13:29:33'),
('7e204f444ec90ffe0591142ab9dde87fae019d16d06e1d0bfa01672d55ba72399f7db4b11daca868', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 01:58:59', '2022-12-11 01:58:59', '2023-12-11 01:58:59'),
('7e32332ae0c6b6173a816c46dfb882dc9cfd284df1f762f3ceebb9b7fe00072d4f57dc794f573ff9', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 19:40:53', '2022-11-25 19:40:53', '2023-11-26 01:40:53'),
('7e7ba450002371bad6e1a691a3bd3ae6de000e7bc075ddf160968a0a2f24e3ed6351e7515ae5aeb7', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 03:43:54', '2022-11-30 03:43:54', '2023-11-30 03:43:54'),
('7f5ebd5a468204aadb9b04e3e85ec3e3cfc1afd89ed09bc0032853f70ac05113bdb78ac9c69f110d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:20:33', '2022-12-25 04:20:33', '2023-12-25 04:20:33'),
('7fb78c5b09f1c4a5a6b1ab3af735ac4c2d4bcc13a82647e039fa2c6d4b7bda5f2c8e7fe3ca902606', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:25:08', '2022-11-30 02:25:08', '2023-11-30 02:25:08'),
('7fbb3b924b00cefd81abf2759c04aa845de16b47f92d267a1afee3e2e59f30cf7491b535cc817fbb', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 12:49:11', '2022-11-30 12:49:11', '2023-11-30 12:49:11'),
('7fdc57d5d76e25bb49e14a5b0502f65128fec0a480f4261010ab1d38e89dc9fbf99b4034ffc77073', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 15:48:07', '2022-12-21 15:48:07', '2023-12-21 15:48:07'),
('806c60b028afbfcbb585ba170b3cb5a6a71952a52799ef7c916a6912fc1c2c78d22aa648e0c57d80', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:30:26', '2022-11-30 01:30:26', '2023-11-30 01:30:26'),
('80cf6cd99257f5e3bc8bbba956b07bab1b2ec28a8cd0a4bc6c3c26994b26b8cb6f9080ce340e0cb0', 63, 1, 'LaravelAuthApp', '[]', 0, '2023-07-21 16:48:57', '2023-07-21 16:48:57', '2024-07-21 22:48:57'),
('811fe708d8d5c352366c2f5c75469cee2e05f32034d15a5794e8b5549217a7adc59f8ae42077e4a1', 66, 1, 'LaravelAuthApp', '[]', 0, '2023-08-30 17:08:04', '2023-08-30 17:08:04', '2024-08-30 23:08:04'),
('8124dbf59696078ae2e1446cbff5e94eb4ab7f0b1390a7921a48b3c22dc6b6e2c16f35bd465fcf91', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:51:57', '2022-12-02 01:51:57', '2023-12-02 01:51:57'),
('8157297a7022ea52ba7fbdb0f626dfd34e729f1139181084e3fcdbef1eeaf35eed9c2b6e8929013c', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-01-12 19:22:06', '2023-01-12 19:22:06', '2024-01-12 19:22:06'),
('815d407d46de1bf35abd6ecdc8d62307ba94ec66d8ad8ab7a53146dec2568bea3f0a49a39586f069', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 20:52:40', '2022-12-15 20:52:40', '2023-12-15 20:52:40'),
('8196360cce1dbbea58f22fbf53e85e9af02220e43f53da2d630ecc33a58cc8dfed23e72dbf840c8f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:59:36', '2022-11-30 01:59:36', '2023-11-30 01:59:36'),
('82822429f27dde9fc8e410bf4ffa437463683ff1b61e4bf3edd0f12d32c925f1bc71751494ce3d14', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 12:45:19', '2022-11-30 12:45:19', '2023-11-30 12:45:19'),
('83c5557489062667ac7d35db00b085db039c1813f5f8577ca6f915db2ec22efeab587882a0737a8a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 02:45:35', '2022-12-16 02:45:35', '2023-12-16 02:45:35'),
('840ed22a02dee9a89da5d85bb970e5fb5b97ef03af234be05221d54274487e0d04de1c2149996666', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 14:01:23', '2023-07-18 14:01:23', '2024-07-18 20:01:23'),
('847a3acebb13b81fe2a00031626e68f1d304d5a066e4218a2bd3a1b4ada7949c69dc841bb1b2fab3', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:05:28', '2023-07-16 12:05:28', '2024-07-16 18:05:28'),
('8494f9c222c3a79c4db25b6dd3f958c28bddb9906567d2c3043573b63f179f0a19bb2a3b7e3fd2a1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-18 03:54:04', '2022-12-18 03:54:04', '2023-12-18 03:54:04'),
('84a0c3f4ae99e7395abe3bbded2a9227279522347c06e8d185ecb2a21970f5848c8293adb87cdfde', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:23:26', '2022-12-25 04:23:26', '2023-12-25 04:23:26'),
('84f255d081e1b394e3a85bf9f687d8846c39d11123ba9612b7306dc4abe030b8a2f34d6341699f4b', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-04 15:30:44', '2023-06-04 15:30:44', '2024-06-04 21:30:44'),
('854fbe30453e8669a68b233894a4e339f846d35d2ee47286d6632ae0784dfc0ff9ca83d360e62a2f', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-07 21:25:12', '2022-12-07 21:25:12', '2023-12-07 21:25:12'),
('85fec5f5404f4c7f3aabdd8684b86d520824080b9580601e066300986acbf82542d622691408894e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-01 18:58:36', '2022-12-01 18:58:36', '2023-12-01 18:58:36'),
('862193e81120c47c8a544302dd25e280f1fab8fef27fda027cb37d0002b5f259515c4959842fefad', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:55:26', '2023-07-18 13:55:26', '2024-07-18 19:55:26'),
('86a3d4ba3327928ed7409868e15ab2b5d06363d3497d7189cc99afdb79319ac3685cb4199d6e2d5c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 01:16:12', '2022-12-22 01:16:12', '2023-12-22 01:16:12'),
('86c268e25331c759f0f1287f10c5668c4c83c8571a26cba9c51543330c828c4168197c3449c3f5e2', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 18:51:05', '2022-12-14 18:51:05', '2023-12-14 18:51:05'),
('86ced1a056614446553c26aec34ba8cf62e2aba92c12c05843eeab93621e3f53f8f011e6e9c0e92b', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:59:47', '2023-07-18 19:59:47', '2024-07-19 01:59:47'),
('8760b881c84542c7de7b424cc34c3c208fab877d1e50a67a916266676375839194ec266b0dc71c37', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:47:31', '2022-12-21 21:47:31', '2023-12-21 21:47:31');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('89ac3bfc7cf9adee37ce54d7fe8542ef0a0e993184fa90fe46384347b1f0b3591c544a75b5432f75', 38, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 18:53:45', '2023-03-31 18:53:45', '2024-04-01 00:53:45'),
('89e010251b9d54cbd0e1640ef7b6f9c2b8311c5dd871dd16caadc4ddecee60c8f2d980c70f7a940a', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:31:26', '2023-07-18 19:31:26', '2024-07-19 01:31:26'),
('89fa463f6b773bd73c7844ea299ab9878a02e52294eede85ba743062fd79a796af24715ed5ae1823', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-08-14 11:59:30', '2023-08-14 11:59:30', '2024-08-14 17:59:30'),
('8bdbecbaabd0e643e1ccf17cbe5352a4f38ac55edbd39008ac0954ebed752e5f85c84d4cad6a80a4', 35, 1, 'LaravelAuthApp', '[]', 0, '2023-02-25 07:05:47', '2023-02-25 07:05:47', '2024-02-25 13:05:47'),
('8be2d84f67760c797a45e5f32d26743be72011fd0beb632ff2e0df7578fc6a5db227246537fc404f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 04:22:38', '2022-11-29 04:22:38', '2023-11-29 04:22:38'),
('8c5ae1702ca660141c87f1ae680a0ddc5b262f604e79020a86edd6fcebe08b049b19f446aebc30a5', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:14:07', '2022-12-25 04:14:07', '2023-12-25 04:14:07'),
('8c82d6997b6063560df5bc5ca13ffbaa422c687a12ae19593059c59471c86bd696f5f120ff2562eb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 18:45:45', '2022-12-11 18:45:45', '2023-12-11 18:45:45'),
('8c9f2bdef59a720240d32982555fce00de9ddc134383481a18767fcd4687830b7c34effa7af1f393', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 11:54:40', '2023-07-18 11:54:40', '2024-07-18 17:54:40'),
('8d07e12ef428c37ddfa151c415a1c3144ceffae3ab70a608f597ec1ff839a00d98eef50d70b3fd87', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 22:28:42', '2022-12-21 22:28:42', '2023-12-21 22:28:42'),
('8d7dbacca12d851c744334695d291b9e6b000ce70baa27b21ae7ece6fbb2ef1fab8fa5b646953bfd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:29:46', '2023-07-18 20:29:46', '2024-07-19 02:29:46'),
('8ff14885e3ccd3e5502ffa106630e8706714bc41664a52d35ec28c8b83c8b25dcb5dcdafc82bd79b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:22:08', '2022-12-22 04:22:08', '2023-12-22 04:22:08'),
('8ff789cef13292b9ccc614f7298b08e978a98068a7dbb7ac7a42c535b50932393aef4ef6784bcf68', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 03:27:01', '2023-06-13 03:27:01', '2024-06-13 09:27:01'),
('906055b7827431238f5e78a00eba4efdf70e48b7961f7b77664b959cdac5bc1a6445ec2a30df7778', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-04-10 06:08:16', '2023-04-10 06:08:16', '2024-04-10 12:08:16'),
('908f02748a2d2da4d8a18ae16d887ba42448677af0bad30d9a144840817554f7e3141e6e23a02dbd', 67, 1, 'LaravelAuthApp', '[]', 0, '2023-09-01 19:06:40', '2023-09-01 19:06:40', '2024-09-02 01:06:40'),
('90cab62b8716daeb83a680eeef8d51a4c3ce27673b9f8a3f101702a38e10e6fd42ac48f81eefceac', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-29 15:56:57', '2023-03-29 15:56:57', '2024-03-29 21:56:57'),
('90d88b98cf88df59580e369e88f2afca1ad63de6b55b716a067b4c7f7d4c1f044228331655843256', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:16:13', '2023-07-18 12:16:13', '2024-07-18 18:16:13'),
('90e4347f458cd85d1d0f24f846078a9a9ea5627e18a9ff18a0bb5aa921575d8857bdb947efc0e147', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 18:05:15', '2023-01-08 18:05:15', '2024-01-08 18:05:15'),
('912655992eb8d4506992a46d11adc29bf6f528b6848985c55affcfea6e66bbb353aa8852a8492b44', 44, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 18:11:49', '2023-04-04 18:11:49', '2024-04-05 00:11:49'),
('91972eae899b9eeab3ca2efb02872458c63b017553e43125db1b81085d9e548e229573c5b13ea829', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-23 17:05:57', '2023-03-23 17:05:57', '2024-03-23 23:05:57'),
('92693abe55ef5f8fc426f47e435e98b759f1b9190588f0ee588e290a2ebfcccf8256000530d8d8b7', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 18:23:55', '2022-11-25 18:23:55', '2023-11-26 00:23:55'),
('927837d8e14a2261e6ec5a4a01ec2e8b04390d3d6bb0d908244f75ef10c3851179cddc2c5d0ef171', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:57:36', '2022-11-30 01:57:36', '2023-11-30 01:57:36'),
('92d4a2cb8aca3102ac181e399511aed764f6b62f8d0bf48af7c6d3f8b7a0455061989741d3fd89c3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 22:50:44', '2022-12-02 22:50:44', '2023-12-02 22:50:44'),
('92f6644c71d9cadbb84560d5c07e64c32f5e2688a18b71e6797707fd6da37ee72bdcc17a08dd018e', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-25 17:19:41', '2022-11-25 17:19:41', '2023-11-25 23:19:41'),
('93253b5c9b5fc2b779ba132bb251eda0a670b1da0b37974979babaab3ddaf0b7fe5627e828682161', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:02:09', '2022-12-22 04:02:09', '2023-12-22 04:02:09'),
('9336a8dbf069b6a126beb5a19b8748c36ca3718b57f2898b1a97827be24aea6b19a7cea1787a0da8', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 13:03:28', '2023-07-16 13:03:28', '2024-07-16 19:03:28'),
('93ccb1eb18c7e140bc8f2e012628465f281ed31dc7a54476a6a051459792d8639b38e943f8860a69', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 05:45:23', '2023-02-24 05:45:23', '2024-02-24 11:45:23'),
('94bd921fe2012cc323fe53a9ef7e076c258a11552b75aad9de4ac16a5e5b267980b8973d92b10276', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 17:01:20', '2022-12-11 17:01:20', '2023-12-11 17:01:20'),
('954b438e5b4abcc1e96125c94dcd456c952cf8ae0b67303cab4222815d673c8316d3e052b8fb6877', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-20 11:25:57', '2023-03-20 11:25:57', '2024-03-20 17:25:57'),
('95576e01e64933f3ec27233fff6544e4d225e4d6f722f2d7da792e65e1e49319545ee0ce9d08e3d0', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 22:35:09', '2023-07-16 22:35:09', '2024-07-17 04:35:09'),
('9589e8db1b5af5b4645aeeb33d43979cc12f359048041fdcf1a6169d2fe0da59a59bdf04f6902756', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:58:08', '2023-07-18 12:58:08', '2024-07-18 18:58:08'),
('966ae64553a11cd8befbf51ceb549008fd2e7f0ce8b609ab670725b1ec7760da280eed7779148996', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 16:12:52', '2022-11-29 16:12:52', '2023-11-29 16:12:52'),
('98a73da4f6205493aa1c8fc98eeb1871090eda33e1112025274cec07ce859cf1736ba3cdf1be2b26', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 19:14:23', '2023-06-14 19:14:23', '2024-06-15 01:14:23'),
('99c77fdc410c7e768f753f1201ffbe6062f6232b418d6ef913a79bb6eeb01cfaeeda09346df47ed4', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 20:40:07', '2023-07-16 20:40:07', '2024-07-17 02:40:07'),
('9a1924f41bb26f3fa23f89045bdc6f98a36546ad4b5d5849cca52455b3e76fc181ea10bd6a57846a', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:52:51', '2023-07-18 12:52:51', '2024-07-18 18:52:51'),
('9a7788e122672b1da51f43575bf42de7085c581a3cca1684db29e7705f046e9c6ce7c32c7d49bb9e', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 15:21:33', '2023-06-13 15:21:33', '2024-06-13 21:21:33'),
('9ad62356333e2314f385be2e12bfa8df0355dc34e780f57d03e039b7bc484d3b529d5bf41e909b0e', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 03:43:16', '2022-11-30 03:43:16', '2023-11-30 03:43:16'),
('9b2b627f88afca38aa709b285022b9675c857e90473c33154d9d0f122f746a605ae6e32ab40dc482', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 11:31:52', '2022-11-26 11:31:52', '2023-11-26 17:31:52'),
('9b7468608c62c672432c5534f394ef17cb9d7e3e2e5a1e27fbdc5abbecbf59ae60a509a51acc429c', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:38:57', '2022-12-16 03:38:57', '2023-12-16 03:38:57'),
('9c2807f2eafdfbd0fa034f8e5d14eda4ce7cb117164e6e3a59a21d7dbd4c33a2e07d472889285728', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 19:57:54', '2022-12-06 19:57:54', '2023-12-06 19:57:54'),
('9c5d8a9b90d7f1ecff1b3e1784cd424a9ff8ca098ca2b9f716f771129650e0438e25869720f0e8c7', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-12 14:50:57', '2023-06-12 14:50:57', '2024-06-12 20:50:57'),
('9caca088c93efc74c3871cbeba5ca622eb36abd6259ee8e207a0a12b7a19647eb7d92a9c99717bbd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-28 20:01:58', '2023-03-28 20:01:58', '2024-03-29 02:01:58'),
('9cc5fb383853673af232c823ae0b42b5cad9e262a5a3ff3892c4b1ba1bb4b4f6d93ea6edb996f739', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 21:05:44', '2023-06-14 21:05:44', '2024-06-15 03:05:44'),
('9d1a9b9ac822aa8ef9d04ccd56c1356316312514a8c0ed83e113b0c71526d0ee0406818825aafceb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 00:46:36', '2022-12-15 00:46:36', '2023-12-15 00:46:36'),
('9d3e884efb9d0529e14e3d3aaff7e25b3096d5c65462c8074d6388bc6b89255c93420d6f4ae84437', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:16:18', '2023-07-16 12:16:18', '2024-07-16 18:16:18'),
('9fcb7d19025e63a4aba90741f96a9966b2dd163ab9a1d7d8044c3c2bd21d7c0aabe59429cfcd56c3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:00:32', '2022-12-22 04:00:32', '2023-12-22 04:00:32'),
('9fd2823b45b47dc23606ec61020fdd10ec74c7bffc16089ab0cfa934d6ca6d13b8a492378af60fc3', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 17:54:01', '2023-01-08 17:54:01', '2024-01-08 17:54:01'),
('a092e4daf280c8a6f11fc96f972cb3930d189df526edb3e33543087cc9415e040a9b94bb862cad83', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:20:14', '2022-11-30 02:20:14', '2023-11-30 02:20:14'),
('a122449b5d7b50b0ca83a94445e1e275da13d6f4af6920daa08c47be7ca8b7607408684b60cca16a', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:27:55', '2022-11-30 01:27:55', '2023-11-30 01:27:55'),
('a13d8d7b2f2fec8dcda7499c5dfbbccc7bb81a6a5649abb5143368cf556e6a2573b403931c69d3d2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-04 15:23:17', '2023-06-04 15:23:17', '2024-06-04 21:23:17'),
('a1ab1316a26d33a2d20669fe49b1060fb8d2ac85a1a349d0a03a06a1acb77e00c07e07f154b0f666', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:39:18', '2023-07-18 13:39:18', '2024-07-18 19:39:18'),
('a1e8c8316761954331ac5932a6871a0dc7ae608ed381441571d16c922e0d94880b3d38353c7490b9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:25:59', '2022-12-16 03:25:59', '2023-12-16 03:25:59'),
('a23baa2c5f9b9f6a3f01b9ed31eccdc71ffba52a3e628a2c834c05abaefb408426d79afe3fa5902d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 19:30:07', '2022-12-17 19:30:07', '2023-12-17 19:30:07'),
('a489c0704933235c93fea2f229848a376a78d7ae01086ff0bacf70673c41d6841e9e5e7d2b3998c1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:24:07', '2022-12-21 21:24:07', '2023-12-21 21:24:07'),
('a4a6f5f9f61586b91388a54820901befd92da06e65f3c3bfa687f2f3d814698f3406de7afb552f6e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 19:51:18', '2022-12-13 19:51:18', '2023-12-13 19:51:18'),
('a53f7b4bb0a91119e72b97419f155c6f877814ecc9fe91c583f3f3ae82ce9971a94f559c983e5d5e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:19:11', '2022-12-22 04:19:11', '2023-12-22 04:19:11'),
('a59d56a7cbe9a40624279bc043880363a4b80d1f58aa66453ddccf96fa9254173b977defbe698152', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-02-22 04:46:11', '2023-02-22 04:46:11', '2024-02-22 10:46:11'),
('a5af9ea7e5be432a98efcfbc9d4b9a3304c494cfcc4300882b3cca1b50832de6a58b3b6dac3e408c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 11:24:30', '2023-04-15 11:24:30', '2024-04-15 17:24:30'),
('a693ecc5cd77fc2ca70be2fdfd0ac8fa51486cd0f67d6e95db49449d96d295c3c1ab0395ba3268b6', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 18:17:28', '2023-01-08 18:17:28', '2024-01-08 18:17:28'),
('a6be1fda0456b628b1b45046aa68ef9a5d988329d1231dced0ad502a8e8f913da5b48b25bc169fb9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 16:30:36', '2022-12-11 16:30:36', '2023-12-11 16:30:36'),
('a734a50a2b381009f8657e849ff430c7a5081acb35354197aad586cea4c60f622623ec5e0774a00f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 03:27:52', '2022-11-30 03:27:52', '2023-11-30 03:27:52'),
('a77117feb43db350fbabaf6192897dd02355a6b2682ab9f8accfa77148152d7535d5c1fe8e4b025d', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 15:28:46', '2022-11-29 15:28:46', '2023-11-29 15:28:46'),
('a83359066e2db8d6aa9d3c15b8e8a5fb12d1e5ce7e57dfb4aab08c81e376998eaa3c7d364cfc97bc', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:55:19', '2022-11-30 01:55:19', '2023-11-30 01:55:19'),
('a874f75ade628bb1ae99293bee9989bb43fddfbc4dc763e8c4bf9da01345f6c654f24c69740fecc6', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:43:59', '2022-12-25 04:43:59', '2023-12-25 04:43:59'),
('a93187d13f3c0f71b536da4460423d123baaf73518052a72b95014af56ae90dc5328c528874c9b77', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:32:18', '2023-07-18 12:32:18', '2024-07-18 18:32:18'),
('aa16a1736d76129af1cb747e2c38094c85d1ad3a41686918dba2bc0d7f63748dda2c2e8eda212cc3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-07 16:06:08', '2022-12-07 16:06:08', '2023-12-07 16:06:08'),
('aa21ba756f5da331315a442526272f2c1bcbc5f6a37c627b381e3422642c62d65fd3271ab6051fcd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 14:04:00', '2023-06-13 14:04:00', '2024-06-13 20:04:00'),
('aa71a3a02b2626df87407fdc155d1f54bcf7a63e8fe5399c7f1040b8469a9abb42f0367a0a444cb0', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:51:41', '2023-07-18 13:51:41', '2024-07-18 19:51:41'),
('aaff76f47bfab0b224f7d76c00e590edf4c8be693783c7e15ea4d9149df9c8d291f353a76b7d723b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 17:12:20', '2022-12-11 17:12:20', '2023-12-11 17:12:20'),
('acbae3a92609b587f4b63c27e84178377e9e5f86dede7bf3f92807c6f9f66a024e5f833120469f6d', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-20 06:07:08', '2023-07-20 06:07:08', '2024-07-20 12:07:08'),
('adf37f2aaa6b156fda77dc33f129060ea2b3e3a9a333aa43a8a19724ccafe2513f6d291b3011a103', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:37:12', '2022-12-16 03:37:12', '2023-12-16 03:37:12'),
('af287ca1a4042fe1d98605edd04570abf75e6df05b90692f59d8d605324e4d4feb80ff153b149207', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-05 08:31:10', '2023-04-05 08:31:10', '2024-04-05 14:31:10'),
('af2e18379e7f2445ec3aa3c3c57f929ce16aaad9974402a5f4902e287c2e233fc4ead557c9740dc7', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:01:39', '2023-07-18 13:01:39', '2024-07-18 19:01:39'),
('b120ca8ccc7f828ab4b0d6fe3d7fc1003591ec8f0cbe3b3ba540ad930d72af551b6db3768c4746eb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:50:46', '2022-12-02 01:50:46', '2023-12-02 01:50:46'),
('b15b940bba99d70e8dbb34687fd7583644edcbb07830867ce8688602b6d6d1135a138c6a3ab87ad7', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:13:45', '2022-11-30 02:13:45', '2023-11-30 02:13:45'),
('b1f15db40572c4150febcd061b87a1a9afd715fb84a6b69642ca3468bcd64ef9f5ae12d73a7738e7', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-02-22 04:19:38', '2023-02-22 04:19:38', '2024-02-22 10:19:38'),
('b200fdd9689212f8a932d6ecf25318280c368a4600d5b2c5a30f18c7ba743cbd7813e77f3ce9191d', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 23:14:41', '2022-12-10 23:14:41', '2023-12-10 23:14:41'),
('b2cce82205dd65c9b693d5043be620f7c04c795d1345d0414f050b7dd385bede936fdbc5b7878b96', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 19:38:13', '2022-12-22 19:38:13', '2023-12-22 19:38:13'),
('b2d5c9370ffd89f1c0a05330e8e690e99c4f2fa522443fb25772b3244aa9c0174e430ee9f2890c51', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 00:51:26', '2022-11-30 00:51:26', '2023-11-30 00:51:26'),
('b2f2801e29562b37d28855e2ccc0973805fc81c4ecfc406c36277abd97bfa2ab991e4ffbc2e95a62', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-02-13 05:53:27', '2023-02-13 05:53:27', '2024-02-13 11:53:27'),
('b307705d09a2ae4b16996148fd02e9681e96c4255e9dd2570baca640c5a8e370a9db2cc4ce81e964', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:45:52', '2023-07-18 12:45:52', '2024-07-18 18:45:52'),
('b3d2b76db021e9b272476a0fbdb8b4fb4565532357462ed9f51bb8c60bb7a31ff9f8b01d08127ac4', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 15:07:56', '2023-02-24 15:07:56', '2024-02-24 21:07:56'),
('b3eebe8c3bcd2c7104f45c3107bf643ab12b9dd1293bb7da5475c55e28bb88de7f1fcd1bd73f616b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:02:39', '2022-12-25 04:02:39', '2023-12-25 04:02:39'),
('b42b06dc0770cb79d44b996f5a6d537e699b2a4df0ea1bd2d3bd0cfa18aeb3475b3cfc2cf543f711', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 23:40:07', '2023-01-08 23:40:07', '2024-01-08 23:40:07'),
('b47293c011784a20b62cf6dcd4f4ee96a8c7060df16a9df25779c44ce21bdddc616f5206f92283c4', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-05-28 13:20:42', '2023-05-28 13:20:42', '2024-05-28 19:20:42'),
('b5ab060ce1842afa826911109e259b93b2b4bb08bd104bd52a44f5e163fca7c241fba89dc77183c3', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-08 15:40:11', '2022-12-08 15:40:11', '2023-12-08 15:40:11'),
('b67be95314bc9cc9642959c6ddc1b1cfdf7302b8f2a6d2bec1304f2916b3dbdc85cecbaaa033de57', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:29:09', '2023-07-18 19:29:09', '2024-07-19 01:29:09'),
('b69dab65825451a8c11ea750540e5ac1c1b2acca4fcb27ccc87202e818fc5200730846f9eff58055', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 20:48:56', '2022-12-15 20:48:56', '2023-12-15 20:48:56'),
('b758f3ff15a67d2b6478d911aa91a6764017a0229943cc325f3e2a40dca4d737f12bf655ce19a070', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:17:32', '2022-11-30 02:17:32', '2023-11-30 02:17:32'),
('b8391e2626ecc50fb7b442028e0cb6b727685241937d584754d094da5d22a46cf576bfbaeb83105a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:01:27', '2022-12-25 04:01:27', '2023-12-25 04:01:27'),
('b95959bbd86a487afad3618d15a7ed6d75f3120ab3fb13deab7da29591494f6103999664731b38d2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 14:41:27', '2023-06-13 14:41:27', '2024-06-13 20:41:27'),
('b978e460b240e0b2a897ba012e7d6c91f72344766d3b0b5ea9ef2cac87594005c33e37a9d3d087f6', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:08:17', '2023-07-18 13:08:17', '2024-07-18 19:08:17'),
('ba057bbf2f13d7aa52fc59cb99b0f4d29e9409cd0b53ecbbb7eb94d5fbb1dd4be30b72dcb1c8dabf', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 15:09:13', '2023-02-24 15:09:13', '2024-02-24 21:09:13'),
('ba0d62fcc16617918ef8f5f9de3f077d2cc6c1d7f40addf4af37217d2982c23146ad1e5329bc9082', 43, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 18:01:03', '2023-04-04 18:01:03', '2024-04-05 00:01:03'),
('ba32716eea554d81949446734ca38b96ca4be2684f8d6088e290b379efdd3d3bd26bb58567ac9ae7', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-02 01:43:19', '2022-12-02 01:43:19', '2023-12-02 01:43:19'),
('bb9ef25bdf7ef194a9c5094266074c1764bf38cd6c5fdf915a997a28408d7d782bd80ec8702eacb7', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 21:26:50', '2022-12-15 21:26:50', '2023-12-15 21:26:50'),
('bc35dbb1f83617f9d0a46a6bebaf4c1d953785364974d25d018cb239c474e73d66b2f7fa66bb3348', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:47:08', '2023-07-18 12:47:08', '2024-07-18 18:47:08'),
('bc460fa89769b171312fbe00610abfb383fe8b0f5ca4c70a8abc51d148b6cbda858719fbd0efae65', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-21 18:45:56', '2023-03-21 18:45:56', '2024-03-22 00:45:56'),
('bc4ddb283da1dc9b3b04ba64e883d15047f407493551c8fbe26795a37a6229c5eecf89164449f683', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 13:04:29', '2023-07-16 13:04:29', '2024-07-16 19:04:29'),
('bd1d5c58498457c4f4ac1a0eeb8de0aedb911d339ba82352cf8dc1ecb62406365a1c5450e07745ea', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:06:55', '2022-12-22 04:06:55', '2023-12-22 04:06:55'),
('bd73d7ed70126f2fdb5b822b6e50dc424eb0e2f2fa1b6918f44baa2eaac3fb4fac628c25cacbe7fd', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-31 22:09:46', '2023-03-31 22:09:46', '2024-04-01 04:09:46'),
('bde3e8acfcd2d60bcb0ba73e43e1e257699bed9b732cf306aa5673c6037d5e8fd7275e74bb9b0cd0', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:18:24', '2022-11-30 02:18:24', '2023-11-30 02:18:24'),
('be0af85422f817d478d53a8bccdefd6154477069c32d6800b1d7a4859a379696fbf19a0cb63658df', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-23 07:56:01', '2023-02-23 07:56:01', '2024-02-23 13:56:01'),
('be18cbced4b7815c2dffa5a0bd7fd197ba30cbeef62a5f33c5b8c227e07bab1760345698ea3963f4', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 14:45:21', '2022-11-30 14:45:21', '2023-11-30 14:45:21'),
('bf61e5bee245b548d79407d38957da552f980301f787edf84a6bd0703beccc5e5e24f985bbb5e3c9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:42:27', '2022-12-21 21:42:27', '2023-12-21 21:42:27'),
('bfca989f57f0534c3139489d99313434d372227ca10d50756aebd210dede32289605dce4589d21e7', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:02:46', '2023-07-18 20:02:46', '2024-07-19 02:02:46'),
('c066656111c9734a18687800ab8e64543541cd19b66dd405eec9146a070c8e3d37966933f70ee421', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 18:29:13', '2022-11-26 18:29:13', '2023-11-27 00:29:13'),
('c0a53236951c02e5ece5af2b5d8ceff46102da4c1daeb93b84f9c10e2490d4ba39447a9b19f17cf9', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:37:39', '2023-07-18 12:37:39', '2024-07-18 18:37:39'),
('c19464642b606ed06864581aa4c940189df4df8d53c8c7bae771516726c4ed2e960d2634eee59e05', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-14 21:30:35', '2023-06-14 21:30:35', '2024-06-15 03:30:35'),
('c237a57c0cea2795099f87a12f0ef04e6a442a6f453ea5488afb323894161fb2d6be186c11ed0e54', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 16:27:03', '2022-11-30 16:27:03', '2023-11-30 16:27:03'),
('c25b78f5f787bd6b5b4f7006d58a152fb64b2cf5906a9be7e888d972bc24d5f47d53c64d2e58e7a0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:14:57', '2022-12-25 04:14:57', '2023-12-25 04:14:57'),
('c3cb0268a6b7401302c359fb00972616bdb8a4b9746df2b52e69893ed4c43a70c1ff26515cf9aa1e', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 01:53:59', '2022-11-30 01:53:59', '2023-11-30 01:53:59'),
('c4293026c0ed6d4bc669f56db0c83d875892e85922aa6fa25b4a06aa3b330a7be2e1fc28db525bfd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-03-19 19:26:38', '2023-03-19 19:26:38', '2024-03-20 01:26:38'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('c537879f92109771938c727e8df855cdeefbae5a97ee8d4b1944d27bf19122836cb84dae7d7a3c42', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-03-24 05:32:02', '2023-03-24 05:32:02', '2024-03-24 11:32:02'),
('c53aa071f270b2fde41fe42814fb152468a7f55be24f55e48053535a16e475779098a803a48a66df', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-07 15:45:03', '2022-12-07 15:45:03', '2023-12-07 15:45:03'),
('c57d4bbfd876a840656c378b98600c5f8ca62582a5a8378c1fc38e7a75524646b1cf0de9df009f80', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:18:32', '2022-12-25 04:18:32', '2023-12-25 04:18:32'),
('c6140992432d282df2d9d7a343f42da3faa654f51732856025fc8a8ce58acfa902e8c2ed18313182', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:44:34', '2022-11-29 03:44:34', '2023-11-29 03:44:34'),
('c65cae641abd89d47a97acda22adfa9ca44d0a37806be457499fd71df66d5ba29807f9ea5fb20eb2', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:16:32', '2023-04-15 10:16:32', '2024-04-15 16:16:32'),
('c700a29f3e59db916b75c8dc8477ccc0532ad7e05da5b6213f169066c197f8ac2f2353a135ca72b7', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 14:12:37', '2022-12-13 14:12:37', '2023-12-13 14:12:37'),
('c70eba7e97fd87aeff66be1c316424b9571f26b6d95e94fb434dcb3d7e45a9ec869d93fa099cb11e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:41:42', '2022-12-16 03:41:42', '2023-12-16 03:41:42'),
('c7223e00a6f6e52793a0978fbb91e2186dbccb423f065247c7c24d0782a8d94d15a7a758a33e4816', 20, 1, 'LaravelAuthApp', '[]', 0, '2023-01-01 21:24:27', '2023-01-01 21:24:27', '2024-01-01 21:24:27'),
('c76124d6ed52d97da4a91f603da9ede492d2e2add591a873791c9f397f9b9b74db312fcc499d82e6', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 17:50:19', '2023-03-30 17:50:19', '2024-03-30 23:50:19'),
('c7d1f3bba8315978fcb42db3ef250889faa798bbb17702b394e0241e594de546af8671ff00ec7055', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 20:48:24', '2022-12-21 20:48:24', '2023-12-21 20:48:24'),
('c7d6f1030231e6914645af9a626d5d70eaf5117dfc7454d2142247be64e3098fed53e87841d37487', 27, 1, 'LaravelAuthApp', '[]', 0, '2023-02-24 05:43:44', '2023-02-24 05:43:44', '2024-02-24 11:43:44'),
('c805ceeb71c1a347af9499fd60f545f375502fc4742ae56d5c6c4ea20c841e8662530e75a19b030e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:10:38', '2023-07-16 12:10:38', '2024-07-16 18:10:38'),
('c8163928c1148913a1901cd15333be75c189f93d49feb3ec9ec6620a90f2f9301225264bb260776d', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-04 20:16:04', '2022-12-04 20:16:04', '2023-12-04 20:16:04'),
('c8840d711c8927dec48bb1900a10943141520bbf167e373fb3dccf4931c7cf83ce8e0c82c904ca1f', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 21:46:51', '2022-11-29 21:46:51', '2023-11-29 21:46:51'),
('c8ada27c50a6668c56176dfc6adc9bf7e29a460472e8b20e9acdb4cc0c0fcd7514150120ba2bb4b1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:26:27', '2023-07-16 12:26:27', '2024-07-16 18:26:27'),
('c8fb07756a82a204c6d5f4fddf3bff909d6401db7b94f7491ef2af9aae48ac61e3cb0ae36a121a51', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:30:20', '2022-12-16 03:30:20', '2023-12-16 03:30:20'),
('cb1e35f9f769f4e7e7fd55c327f4602a0b6f2a78d6658c916fab9d9dec5b5bd848d84f7e8fafdad2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 14:59:32', '2023-06-13 14:59:32', '2024-06-13 20:59:32'),
('cbcf8ae60d93e4053711e1e1cffd04aa54e5a87d60b5a0d7ad5abf599f86b249a5ad8d432aefa985', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 09:28:53', '2023-04-04 09:28:53', '2024-04-04 15:28:53'),
('cbd5cbcd49011188c6bede8b5293eb5da799fe3be9cc6a20151ee6736bcf31d2505e823b2dced8be', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 23:29:29', '2023-01-08 23:29:29', '2024-01-08 23:29:29'),
('cd02e6797558fbee397514be19b2214892c890b7506a8eca3af96ddf25947677ae549b62e926f7b8', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-03-30 09:40:50', '2023-03-30 09:40:50', '2024-03-30 15:40:50'),
('cd549af9fb3f0b825b594b619805c04c0c3370a95270eb22853fcfdf99a26f4abd5fae45cc812d94', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 20:18:59', '2022-12-06 20:18:59', '2023-12-06 20:18:59'),
('cd7e1412bb2d428224f59004e454ceb41962ac2355c0ac502ae628ce9e78552af9f24eeabfccdf09', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 11:43:15', '2023-04-04 11:43:15', '2024-04-04 17:43:15'),
('ce16a80b5b8a51e48bdad6a8156eef43cd5591ded4c42b604df3119d99981f4cc377f570fb43852c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:43:50', '2023-07-18 13:43:50', '2024-07-18 19:43:50'),
('ce75cff4e4a953e12993eed1a3e9122d6778189867be877d1789679bb1a98e6ff3f6b515dc06467d', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 21:26:06', '2022-12-15 21:26:06', '2023-12-15 21:26:06'),
('cf461b1d91c87eb15a023d8064d60bc019066c5bc5affb27544f4dedc5cf2ccbc698872682341828', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 16:06:16', '2022-12-17 16:06:16', '2023-12-17 16:06:16'),
('cf8da2ac9873559bfa6c03abcfec9d5e1e9f7d2bd85af8297dd84696a4bcf40caa813c270c1c9ee5', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-02-02 21:13:43', '2023-02-02 21:13:43', '2024-02-03 03:13:43'),
('d1b69cb977064caf3da0921d97917ad3e2b278f04dfc37f3d1423055a52f892f381204c3518311f7', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 14:10:09', '2023-07-18 14:10:09', '2024-07-18 20:10:09'),
('d1faef1cbce55b09a11da1fe1840b433be49308db319a3da2d16ac542da30ff1d9bffe8addd1a42f', 34, 1, 'LaravelAuthApp', '[]', 0, '2023-02-25 06:49:48', '2023-02-25 06:49:48', '2024-02-25 12:49:48'),
('d2cfd8b9e70323821e3538a8dd5bc3e2d99a77c238a47662c1b19b05e87dabaeae150e382a561bd0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 19:50:50', '2022-12-13 19:50:50', '2023-12-13 19:50:50'),
('d327c9665ddd1f55799916c7077b4e0a4db56fda03d82c9dad72241c316fad0b9b981bcb282bbe12', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 16:37:00', '2023-01-08 16:37:00', '2024-01-08 16:37:00'),
('d342cc17fb85e177187ce7ceba1dfc3bb8feed4333b04e3441b36ac8a8617e971fc91a66cd5c1a01', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-12 15:52:16', '2022-12-12 15:52:16', '2023-12-12 15:52:16'),
('d3a1070371575383ee168463aa1dab129ba2b90e302472ae55e2dd64ecdeddb2ec37c0f43e760080', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 16:29:21', '2022-11-30 16:29:21', '2023-11-30 16:29:21'),
('d431d08db65daa905cac2b084acc39a5dc059b6befdc84a2f0188bb18df89e303ac6647d030c4ef7', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 11:08:04', '2023-07-18 11:08:04', '2024-07-18 17:08:04'),
('d50295326fe264293e28b1599d0f4a5c7abfbd89b4d385667e60201140c991d41d0dcbf2b6d0b5ab', 24, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 21:35:26', '2023-01-08 21:35:26', '2024-01-08 21:35:26'),
('d5271839b84c84d783681b2af368abb8720e396926588934d5d975537e93ae20e5a51d0ab15b50d1', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 04:00:25', '2022-11-29 04:00:25', '2023-11-29 04:00:25'),
('d5b2fbdd58c2b4d4cb481adcc34bd0899c391c0f94f69f2e190948cf7d97e3623e379b8495092b0d', 20, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 21:31:09', '2022-12-22 21:31:09', '2023-12-22 21:31:09'),
('d5f750ef48dd74c5273d8407e6088d1f034f7614eb1ccef03a429add8ba885c767e9ef346ee8112c', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:42:26', '2023-07-18 12:42:26', '2024-07-18 18:42:26'),
('d606815bf4ac18add3bcf33196b679ac045c69c7025dae7aa755c55edc3981973555ee4a7b092a10', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-06-13 15:07:34', '2023-06-13 15:07:34', '2024-06-13 21:07:34'),
('d63aee2472ac9be2dc4331a9c52a13c2a83f82ad2cfe89f07f370d5c8262a1c1e98b290fa6136268', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 12:06:25', '2022-11-30 12:06:25', '2023-11-30 12:06:25'),
('d6779defe9c8be302771beaa96ea65c8665dd58a63673875207b05c63dc9eada34c0cb05b0c075a2', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 14:37:31', '2023-07-18 14:37:31', '2024-07-18 20:37:31'),
('d68a2f618a9c8cb74a504b522e83f5d5e1d9ca24eeaeaa72489dc70a59a620e71d543f4a1874a2a9', 41, 1, 'LaravelAuthApp', '[]', 0, '2023-04-03 12:16:09', '2023-04-03 12:16:09', '2024-04-03 18:16:09'),
('d6e3ee41ecde534b12e1243784184b7fb8d0f639d957a7b6283c4aa17640878e3bc1a33dac091268', 54, 1, 'LaravelAuthApp', '[]', 0, '2023-06-26 08:16:48', '2023-06-26 08:16:48', '2024-06-26 14:16:48'),
('d788cd5218165b6fc4c25bd2ade193982e8cd55711e647954c0296bda8502c59debafc84546a2494', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 07:33:04', '2023-04-15 07:33:04', '2024-04-15 13:33:04'),
('d805ea2b67217dcd650bcf694319d3b773c44ecfc656f65d7118f99f95666eb28b21c08c8c718bc6', 57, 1, 'LaravelAuthApp', '[]', 0, '2023-07-17 02:37:30', '2023-07-17 02:37:30', '2024-07-17 08:37:30'),
('d8d8ccc9de12a7ac1555c35cb1ce932f31e86af04a3e40ff77799cf2fb82f578879563fe2f8f6dc1', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 18:45:12', '2022-12-15 18:45:12', '2023-12-15 18:45:12'),
('d924b8efe788239d4e97db8ba125967be62a0469860f01e6e534a8bba5d3e872682373883435a6a1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:05:53', '2023-07-18 20:05:53', '2024-07-19 02:05:53'),
('d97fd439df199af20795321356575550476c668270c32605a53ec6fef202a239a1ea0587349fe1ec', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 03:03:23', '2022-11-30 03:03:23', '2023-11-30 03:03:23'),
('d98019270aee9401dbb5ec3975e483bd55c8b26d298677d39b2021e1c2a947dcb9b3b4b351a20098', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:52:31', '2023-07-18 13:52:31', '2024-07-18 19:52:31'),
('d9b1d3c4cffe9c7f24a213f9919444f2e8fa449c32f540f257cc3a65703c6d11dd8fd641d6f2b889', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:19:30', '2023-07-18 13:19:30', '2024-07-18 19:19:30'),
('d9b4e212053d709c1389639e00b8ca7568d6ce96a67fc3362e703f913d75ce090a2091100c6b7c81', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:09:49', '2022-12-25 04:09:49', '2023-12-25 04:09:49'),
('d9b814116d0fcb1490f872fa85ef2f1711c3c95494cb18588a71ab3a1f92ba93b287c0ce152ad98f', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 12:12:37', '2023-07-16 12:12:37', '2024-07-16 18:12:37'),
('db24e14e91972e57647f7af8a35645d826bf555b89893a16a31fed093b22dc4a3a77f7fb1ffcc189', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 21:09:01', '2022-12-13 21:09:01', '2023-12-13 21:09:01'),
('db83fd9e5df366faee0b853adade4c7922b9afb59c8324faf80054efd9630bb9477c6a278eac154b', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-25 14:32:10', '2023-02-25 14:32:10', '2024-02-25 20:32:10'),
('dbfc602ff07aeb2ada79c98fce263526d3a6f1cadc9eb712dab423894603c3f268ba0f700550ef1d', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 19:51:23', '2023-07-18 19:51:23', '2024-07-19 01:51:23'),
('dbfdb3c1001ede6fda5367610ee0a767c438fd44843d40c454919d2ffe87bad444020aa31a149cb0', 41, 1, 'LaravelAuthApp', '[]', 0, '2023-07-15 16:59:13', '2023-07-15 16:59:13', '2024-07-15 22:59:13'),
('dcb3b67ced0015be6159e1108f4c3d6b366d88686f6b40385e76fc60d2ca19f5bd89a897826c0175', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-28 21:07:44', '2022-11-28 21:07:44', '2023-11-28 21:07:44'),
('dd228ba3a71424fdefcebcaec7761167f2e752ab10832e82360718aac1b551f8e9636db65d8fc0fa', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-06-26 15:36:50', '2023-06-26 15:36:50', '2024-06-26 21:36:50'),
('dd2a7214b43d537967340c12c7026661b31f1593d2f831259eafcdc770d494c0d39feca9a01c6dc4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:26:53', '2022-12-25 04:26:53', '2023-12-25 04:26:53'),
('de8967edec54e38fac08bd57c3c6cbbb620878b5c8a563e4988b1cc0520402d299bcea56bd719ac4', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 21:17:09', '2022-12-22 21:17:09', '2023-12-22 21:17:09'),
('de982283473bf5e63d6a571ac211d6732c8f25780d072fc878a212d64d79c2350763861fd7156fa2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-12 16:11:49', '2023-01-12 16:11:49', '2024-01-12 16:11:49'),
('de9f45e3be264721255d5ea59bad20f909625af9797624d31198c731c68e4a54be165696264352b3', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:13:33', '2022-11-30 02:13:33', '2023-11-30 02:13:33'),
('df19f420f11178dd33b07334e225709a600b62994bf5eb6e641920dd79db79a6e53d14fdc3f6ed86', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:00:45', '2022-12-25 04:00:45', '2023-12-25 04:00:45'),
('df2714a57cb40d60176b2b1aa7aad67ba7cc47e0397e7aa2675db717b1314e8d07dafe74b0b69dcb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:11:37', '2022-12-25 04:11:37', '2023-12-25 04:11:37'),
('dfc051812460c5acdd5d2b12e8fb09fca755810a84e19e4b148aa8084ac8ee9ab90507333a8866e9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:16:25', '2022-12-25 04:16:25', '2023-12-25 04:16:25'),
('dff4660a40968372196e96c6465ef74355c98af4fac4198396f80fa3a0b7503fa64b7dbf5cc0a1ee', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 20:55:21', '2023-07-18 20:55:21', '2024-07-19 02:55:21'),
('e1b1becbdb839d5ad74fe4ba7b41431cb77ee765aa1cce6d6ac3a48583c2de103bcab0153ec3ac11', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 12:59:16', '2023-07-18 12:59:16', '2024-07-18 18:59:16'),
('e20ae157e82ebfba5bdfeefb55c2be34653acff18510887080bd595d5cbc5561e34131c9f904f3da', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 19:29:15', '2022-12-22 19:29:15', '2023-12-22 19:29:15'),
('e2d403bcc100b2ede6affc9e94d0f98abfbf3ce73dc469524acfe4f83dc7f3f59cdf8ad4de6df4a1', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-26 04:55:09', '2023-02-26 04:55:09', '2024-02-26 10:55:09'),
('e30835f8b84d2c3f264e0a47e6bfe2461aa4f84cb6d02f44e3022d267e7b1695dc234489103c736e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:47:55', '2023-04-15 10:47:55', '2024-04-15 16:47:55'),
('e32a5d3932aa6d2d3e42d3d5ae47a56c9cdccfcb56fbb0c985adc89c6b118f30ea4f70f2125ac7ff', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-09 00:47:30', '2023-01-09 00:47:30', '2024-01-09 00:47:30'),
('e3abeeff66122b4288abe1a2a8ca7ff0fc33dcbb95e2003c4f535d2c8beb137fd4d41bf56b5c78c2', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 14:41:14', '2022-11-29 14:41:14', '2023-11-29 14:41:14'),
('e41eec78ea218e6e08b7242ba9484a684cb994dca8a4240c6eecc2d36030a1bfdb5311138a6ef777', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:40:51', '2022-12-16 03:40:51', '2023-12-16 03:40:51'),
('e47c5c9ad96406d020246e3929fc3201eb9c6cc5435d3dcf59b3a4d0a70d7addc873c0ac60b3400e', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:05:01', '2022-12-22 04:05:01', '2023-12-22 04:05:01'),
('e4b60e362053bde8cae305da700ab395299835c3b984bcec68ab7d0a99d092257e6e66489bf152f4', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 19:28:48', '2022-12-06 19:28:48', '2023-12-06 19:28:48'),
('e500f0828ac5ca8835bdcf6a8643846bf983b8bda92b8d2fac51b73075a32fdc88d269a375483d3e', 53, 1, 'LaravelAuthApp', '[]', 0, '2023-07-25 13:57:48', '2023-07-25 13:57:48', '2024-07-25 19:57:48'),
('e5360b1fb5df3877cd565bc54a5fd10950cad968e5049a17dbc0c206828441aa79fb19c3c4f855f6', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-07 15:47:30', '2022-12-07 15:47:30', '2023-12-07 15:47:30'),
('e5492eacc0780f411e872cc55048ab1477929958454ea9f5883f995f09398056b0244cde79147ed2', 41, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 11:45:18', '2023-07-16 11:45:18', '2024-07-16 17:45:18'),
('e5968a05385861c5c9b82aaae5fbb4e45733c6cf95e370e56632a2a58a674168ecc1aa53a2e48348', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 20:48:34', '2022-12-21 20:48:34', '2023-12-21 20:48:34'),
('e716e77d0064415bb9c2f2c1aa1db9e5ea21c0cbbbaba168d72f5ccacc15d52995798e7c183428dd', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 13:24:42', '2023-07-16 13:24:42', '2024-07-16 19:24:42'),
('e745b6bdee23f6b9f6eba1e474e405b0a9b97190bde8afb480f0b646472b204b9f1ce6a861f094fa', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-02-25 14:23:29', '2023-02-25 14:23:29', '2024-02-25 20:23:29'),
('e746c652f2e4f20a16ad862c3aa906a2d5b6f2178865587c9c123d64a16d4944b7a1ab1e0b7f7fbf', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 11:27:49', '2023-04-15 11:27:49', '2024-04-15 17:27:49'),
('e75d2a75377e893e38ab7652a0a82ba8dba3e93bb1f0c34b35a1d82e1d72ec4104e1709b692eb1f5', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-11 03:14:00', '2022-12-11 03:14:00', '2023-12-11 03:14:00'),
('e7853b60c023689b1db0b8e05c351254e14ef2988fe5366ff881cb5d84588ea80071f72ca4fee47f', 58, 1, 'LaravelAuthApp', '[]', 0, '2023-07-17 12:05:02', '2023-07-17 12:05:02', '2024-07-17 18:05:02'),
('e7af9c00ff353169e3941c73e3607a9f1bb177b8c414f8511c2f7bdccdbeb8e1ad7ad812082ae3e2', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-05-02 13:58:11', '2023-05-02 13:58:11', '2024-05-02 19:58:11'),
('e7b1859556400f95ba8e2824ba9dffccac0926a33d4aa0941f864f41eb3b773a37b68b4f5de6f14d', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:34:07', '2023-07-18 13:34:07', '2024-07-18 19:34:07'),
('e82d17b3732d09c82a162fdaed3f13e3364d39dfa2eb7e3f19172704290183dd009b2381039917e1', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-16 14:09:52', '2023-07-16 14:09:52', '2024-07-16 20:09:52'),
('e86ab13b7c9215bdb80f58d6fd9ae5a35bd7b148f1753169a5b89f724097e74fc95dd356c7bf2331', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-13 20:12:50', '2022-12-13 20:12:50', '2023-12-13 20:12:50'),
('e86ca6f70bd51abc667949680c9de9bfbdfdba7602dcf8cea5af5f297ef5b1e5776f95152b8b5396', 26, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 11:42:54', '2023-04-15 11:42:54', '2024-04-15 17:42:54'),
('e89535a1c0964029f1412c5225fca9a5ba74e52ed1658e99e8c41c1bf92a0600e7b08b29f5574718', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 22:29:25', '2022-12-21 22:29:25', '2023-12-21 22:29:25'),
('e8ec8cf5581c25e5a2dc4eec2bcfd8d0ac24401ce22e64ace7e36a04b72f22e9c5f7f939b928c6a8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:46:22', '2022-12-21 21:46:22', '2023-12-21 21:46:22'),
('e99f9e71c4f9f56a2f5be79103fce6e54162411748140c5a98cba94e92eb4471c2feb7ff2d260438', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 03:57:03', '2022-11-29 03:57:03', '2023-11-29 03:57:03'),
('e9f816a15ce7e6ea343f2b1035fef9823d72167795cf7786099657508055e1e7bfe4a579f0a22154', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:45:49', '2022-12-21 21:45:49', '2023-12-21 21:45:49'),
('e9fd31656a966a7652dd5927580b4fb38867a4e8ca5a3e308fb18d1ef9f1e372bf47536c07c859e0', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-16 03:40:14', '2022-12-16 03:40:14', '2023-12-16 03:40:14'),
('ea07cd04a0e91908a80363a3bf5443383e344f9fea032dc3ae8a080d1c62a5baddc1441d15640a59', 23, 1, 'LaravelAuthApp', '[]', 0, '2023-01-12 20:09:46', '2023-01-12 20:09:46', '2024-01-12 20:09:46'),
('ea19d3430d22ff1482735f54c283b124ef1d7d17479badc35dc7a244a2f660d5e534b2972c55329e', 15, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 16:25:35', '2022-11-30 16:25:35', '2023-11-30 16:25:35'),
('eb9a7f098e362e0d72900956b431161077aab4c7f7813589bc89ceaa76c52b92ce0da2d45994eb0a', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-07 20:40:44', '2022-12-07 20:40:44', '2023-12-07 20:40:44'),
('eb9f67da21979d49f59c822c71a62b209600483b6c9c187bfb64567b5aebcfdeab8a247357224152', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 04:31:50', '2022-11-29 04:31:50', '2023-11-29 04:31:50'),
('ebb272ef9fe2e742e48aa94093973fc481380304c1d630486fdc96aaf722c676c974c2d87cdc208c', 21, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 16:06:39', '2023-01-08 16:06:39', '2024-01-08 16:06:39'),
('ecf93f13ed6be87105ecbe89f8cd550a4d4afc4163534ef128d9f0b6dce6e01768450fe92a684b2a', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:47:10', '2022-11-30 02:47:10', '2023-11-30 02:47:10'),
('ecfdff4ee141820bdf416584713c975cb084f453d7393dca887b3b22e35262c128fc6facb33874e6', 27, 1, 'LaravelAuthApp', '[]', 0, '2024-01-29 19:32:01', '2024-01-29 19:32:01', '2025-01-29 20:32:01'),
('ef8caf9203be350941384ab6bddb41cf9310073d37670ed588a6237d80f84e29eacf1b414b14f5e1', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-30 02:18:40', '2022-11-30 02:18:40', '2023-11-30 02:18:40'),
('f02e5a73bc272d78e93e05f1eb32f3fd5500b0209ffcfd7d1b47192075b721f6160e540b3ed75ef4', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 15:19:47', '2022-12-06 15:19:47', '2023-12-06 15:19:47'),
('f0b2f706fc0e983e06054e2c2ceadf81c4e93c171139d24bd66928f6730f1ff049ae1d101aaf7a12', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 21:55:13', '2022-12-10 21:55:13', '2023-12-10 21:55:13'),
('f0f51247027a229306448713db3f48491f149654a8d4cdfac8241755ed863c61a1c230267917e016', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 15:48:58', '2022-12-17 15:48:58', '2023-12-17 15:48:58'),
('f1b94e915c2cb52a3a663f05efafad3447af62922f75df0b7f886709a697d82ac8675df4ff34661f', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-04-01 06:37:06', '2023-04-01 06:37:06', '2024-04-01 12:37:06'),
('f3275a3536e43c8f21b7074dcab918851243860620f5fdd712f0dade7d6de383f4092c9471c67ca2', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-29 04:26:27', '2022-11-29 04:26:27', '2023-11-29 04:26:27'),
('f392269c9f86e73dc03fb9b02f9617de952cc519160d195920f0074b1ca8538222d344e8bd2f50e8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 16:00:27', '2022-12-17 16:00:27', '2023-12-17 16:00:27'),
('f39570e2be04a70c3512b091443e0e1836a95b160a7261a50f6048fd6cfbd41741642603f09fab58', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:44:16', '2022-12-21 21:44:16', '2023-12-21 21:44:16'),
('f3cf70495004c3dc8edd3b231c4fe295d92d8b9dbc08a3393661c0dc64d838bfe088d42af92681f3', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-03-28 18:57:59', '2023-03-28 18:57:59', '2024-03-29 00:57:59'),
('f6486be7dec97af73214c2713c79713efee504d720d2de69746f76a945c2f10d19fb32b2c253ec44', 38, 1, 'LaravelAuthApp', '[]', 0, '2023-04-13 16:49:18', '2023-04-13 16:49:18', '2024-04-13 22:49:18'),
('f6f6fd668ee344aae791e67f58c9c8a0afe3498f993d89b6abe690679041e82dc73c66f2188efae6', 22, 1, 'LaravelAuthApp', '[]', 0, '2023-02-02 20:40:03', '2023-02-02 20:40:03', '2024-02-03 02:40:03'),
('f7e1e96791ee2a64b88e4b2c6c43c241c303799f39856eddff0ff1685b31a69b9240d2b29de79bdb', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 21:31:51', '2022-12-21 21:31:51', '2023-12-21 21:31:51'),
('f82c1c314084a3a5120b6bc0bf69c9ecb25ba9149bfac54ab44ed762e2185cb5bb1dd728c8729fa0', 44, 1, 'LaravelAuthApp', '[]', 0, '2023-04-04 20:06:28', '2023-04-04 20:06:28', '2024-04-05 02:06:28'),
('f867091c678f7c55f780e68230a17467bf06f8168db0983e37f3482595c19cb9e1219a720179810d', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-04-15 10:12:58', '2023-04-15 10:12:58', '2024-04-15 16:12:58'),
('f8c959c4a0aa32c03016c1d486e38e9230ad17cdfcfc5270305902cfbbc9b661647a4d72f6925d31', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-03 18:18:57', '2022-12-03 18:18:57', '2023-12-03 18:18:57'),
('f90be14aa7a99050048224c6f157aff82ce731a2aaed6ad1307d05bb733ab9cae92d1a1a564a7664', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-25 04:22:45', '2022-12-25 04:22:45', '2023-12-25 04:22:45'),
('f9158a8c21c2d54a0810dfe7dc5f188fad83d005f366f7c94cf57b12170f470e3c4821e35f30b599', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-11-26 09:33:31', '2022-11-26 09:33:31', '2023-11-26 15:33:31'),
('f91bda94d603472dde1a5fb01e2d7ab62f972a6ed11827c32c15e8f8d885ebd8607c6b343c863eba', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-07-09 15:15:29', '2023-07-09 15:15:29', '2024-07-09 21:15:29'),
('fa704dea679fd48c28bdd436360cbebb1328f1628365203b596865be8f5d4ae75f42659d88cbc3a8', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-01-08 18:25:45', '2023-01-08 18:25:45', '2024-01-08 18:25:45'),
('fabc6872692a7bba4dbae79ce868b5e648215d4042584c59938fb212cb2fe34538678cc2a3d4afa8', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-02-08 18:02:43', '2023-02-08 18:02:43', '2024-02-09 00:02:43'),
('faf2d325484dec2c591f0e352f7057b9d56b7a5d34e2179e93bbe2187e9ac4a74d7ea0483b200829', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-06 16:32:16', '2022-12-06 16:32:16', '2023-12-06 16:32:16'),
('fb32dff6b2e64c4ab3926b381d79e2b2917e29a680ffeda4d21df514607a43ccc768c749fa405f9e', 37, 1, 'LaravelAuthApp', '[]', 0, '2023-04-16 08:33:04', '2023-04-16 08:33:04', '2024-04-16 14:33:04'),
('fbc92a42a075301e4d2ae183016e5eb4fdb9a11f93663bb1004651574ca0a505892f6822c8ddbe25', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 21:38:16', '2022-12-15 21:38:16', '2023-12-15 21:38:16'),
('fc4b1f3db81242fac65efca0f731c895bfdd5a296e5f80186eaf46f89f09d4bc7b44b7c463f0b74b', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 04:08:17', '2022-12-22 04:08:17', '2023-12-22 04:08:17'),
('fc5afd49e2d02d432ed9493533194db5ed988d3af4d5fd087fcc5a5be8abd2cfe2b3a397e2f361ba', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-22 21:42:10', '2022-12-22 21:42:10', '2023-12-22 21:42:10'),
('fcb861ceb3051375a3000698b2eb2c6f329657f08dd391e38cbe1368aa342408a0942da7783fdd0e', 17, 1, 'LaravelAuthApp', '[]', 0, '2023-07-18 13:31:27', '2023-07-18 13:31:27', '2024-07-18 19:31:27'),
('fd5c1c9ed4d9add7e8a47ada0819ad8d67c232fdb9abb86d2255a2e52c66d6fad1215eaec2d87acf', 31, 1, 'LaravelAuthApp', '[]', 0, '2023-04-02 09:47:58', '2023-04-02 09:47:58', '2024-04-02 15:47:58'),
('fdadca771c7a96ce6632ed89b25d10462aae4165b4a268e157c2b1866e44903bae11e2e44c8c08a9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-04 21:11:24', '2022-12-04 21:11:24', '2023-12-04 21:11:24'),
('fdb91ca84610eaff1590d88c7437a5eb179e86104f7373c6954c70c18eb700fc5acbac8fde4af793', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-10 05:03:01', '2022-12-10 05:03:01', '2023-12-10 05:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `social_page_id` int(11) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `advance_amount` double DEFAULT 0,
  `advance_payment_method` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `social_page_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `advance_amount`, `advance_payment_method`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '95', NULL, 'customer', 'paid', 'confirmed', 'cash_on_delivery', NULL, 16.174285714286, 0, NULL, '205', '2024-08-17 14:37:09', '2024-08-17 14:44:24', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100002, '95', NULL, 'customer', 'unpaid', 'canceled', 'cash_on_delivery', NULL, 19.985, 0, NULL, '206', '2024-08-18 13:24:10', '2024-10-15 10:23:48', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, 'test note for status update', NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100003, '95', NULL, 'customer', 'unpaid', 'pending', 'cash_on_delivery', NULL, 16.894285714286, 0, NULL, '207', '2024-08-18 13:50:45', '2024-08-18 13:50:53', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100004, '95', NULL, 'customer', 'unpaid', 'pending', 'cash_on_delivery', NULL, 21.900476190476, 0, NULL, '208', '2024-08-18 13:53:00', '2024-08-18 13:53:13', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100005, '97', NULL, 'customer', 'paid', 'confirmed', 'cash_on_delivery', NULL, 24.507619047619, 0, NULL, '209', '2024-08-18 14:08:19', '2024-08-18 14:10:05', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100006, '95', NULL, 'customer', 'unpaid', 'processing', 'cash_on_delivery', NULL, 42.850952380953, 0, NULL, '210', '2024-08-22 14:58:52', '2024-10-14 16:05:25', 0.24, 'coupon_discount', NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100007, '95', NULL, 'customer', 'unpaid', 'canceled', 'cash_on_delivery', NULL, 34.757619047619, 0, NULL, '211', '2024-08-22 15:13:45', '2024-10-14 14:16:49', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100008, '95', NULL, 'customer', 'paid', 'canceled', 'cash_on_delivery', NULL, 43.45380952381, 0, NULL, '212', '2024-08-22 15:24:29', '2024-10-14 15:32:55', 0, NULL, NULL, 0, 0.00, 'def-order-group', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100009, '95', NULL, 'customer', 'unpaid', 'confirmed', 'cash_on_delivery', NULL, 55.948095238096, 0, NULL, '213', '2024-08-28 15:45:25', '2024-10-10 14:26:45', 0, NULL, '0', 4, 0.71, 'def-order-group', '325397', NULL, NULL, '{\"id\":213,\"customer_id\":95,\"contact_person_name\":\"\\u09a8\\u09be\\u0987\\u09ae\\u09c1\\u09b2 \\u0987\\u09b8\\u09b2\\u09be\\u09ae\",\"address_type\":\"home\",\"address\":\"Dhaka,\",\"city\":\"city\",\"zip\":null,\"phone\":\"01677765487\",\"created_at\":\"2024-08-28T15:45:25.000000Z\",\"updated_at\":\"2024-08-28T15:45:25.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'test note', NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100010, '95', NULL, 'customer', 'unpaid', 'pending', 'cash_on_delivery', NULL, 117.53380952381, 0, NULL, '214', '2024-08-29 10:26:52', '2024-09-12 10:03:40', 0, NULL, '0', 4, 0.71, 'def-order-group', '559305', NULL, NULL, '{\"id\":214,\"customer_id\":95,\"contact_person_name\":\"Md. Rokibul Islam\",\"address_type\":\"home\",\"address\":\"Barisal patuakhali\",\"city\":\"city\",\"zip\":null,\"phone\":\"015098765432\",\"created_at\":\"2024-08-29T10:26:52.000000Z\",\"updated_at\":\"2024-08-29T10:26:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'Urgent', NULL, NULL, 'apps', 0.00, NULL, 1, NULL, 'third_party_delivery', 'FlingEX Hubs', '423423e'),
(100011, '95', 1, 'customer', 'paid', 'delivered', 'Cash on delevery', NULL, 10.892857142857, 0, NULL, NULL, '2024-09-04 14:03:43', '2024-09-04 14:03:43', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(100012, '95', 1, 'customer', 'paid', 'EXCHANGE', 'Cash on delevery', NULL, 16.178571428572, 0, NULL, NULL, '2024-09-04 14:13:17', '2024-09-11 14:42:39', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(100013, '95', 1, 'customer', 'paid', 'delivered', 'Cash on delevery', NULL, 10.892857142857, 0, NULL, NULL, '2024-09-04 14:18:06', '2024-09-04 14:18:06', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(100014, '95', 1, 'customer', 'paid', 'EXCHANGE', 'Cash on delevery', NULL, 15, 0, NULL, NULL, '2024-09-04 14:19:27', '2024-09-11 14:32:30', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(100015, '95', 1, 'customer', 'paid', 'EXCHANGE', 'Cash on delevery', NULL, 9.0476190476191, 0, NULL, NULL, '2024-09-04 14:21:43', '2024-09-11 14:31:44', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(100016, '98', NULL, 'customer', 'unpaid', 'confirmed', NULL, NULL, 5.952380952381, 0, NULL, '215', '2024-10-03 08:57:33', '2024-10-10 13:28:35', 0, NULL, '0', 5, 1.43, 'def-order-group', '935411', NULL, NULL, '{\"id\":215,\"customer_id\":98,\"contact_person_name\":\"Nur Tanzir\",\"address_type\":\"home\",\"address\":\"Dhaka,Bangladesh\",\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-10-03T08:57:33.000000Z\",\"updated_at\":\"2024-10-03T08:57:33.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'test order', NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100017, '98', NULL, 'customer', 'unpaid', 'canceled', 'online_payment', '', 200, 0, NULL, '216', '2024-10-07 14:37:53', '2024-10-10 15:45:44', 0, NULL, NULL, 4, 0.71, 'def-order-group', '909216', NULL, NULL, '{\"id\":216,\"customer_id\":98,\"contact_person_name\":\"Tanzir Nur\",\"address_type\":\"home\",\"address\":null,\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-10-07T14:37:52.000000Z\",\"updated_at\":\"2024-10-07T14:37:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'test note', 216, '{\"id\":216,\"customer_id\":98,\"contact_person_name\":\"Tanzir Nur\",\"address_type\":\"home\",\"address\":null,\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-10-07T14:37:52.000000Z\",\"updated_at\":\"2024-10-07T14:37:52.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', 'apps', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100018, '98', NULL, 'customer', 'unpaid', 'canceled', 'online_payment', '', 200, 0, NULL, '217', '2024-10-07 14:56:08', '2024-10-15 09:43:39', 0, NULL, NULL, 4, 0.71, 'def-order-group', '421309', NULL, NULL, '{\"id\":217,\"customer_id\":98,\"contact_person_name\":\"Tanzir Nur\",\"address_type\":\"home\",\"address\":null,\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-10-07T14:56:07.000000Z\",\"updated_at\":\"2024-10-07T14:56:07.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'test', 217, '{\"id\":217,\"customer_id\":98,\"contact_person_name\":\"Tanzir Nur\",\"address_type\":\"home\",\"address\":null,\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-10-07T14:56:07.000000Z\",\"updated_at\":\"2024-10-07T14:56:07.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', 'apps', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100019, '98', NULL, 'customer', 'unpaid', 'pending', 'cash_on_delivery', NULL, 19.275, 150, 'Bkash', '218', '2024-11-14 10:42:19', '2024-11-14 11:24:54', 0, NULL, '0', 4, 0.71, 'def-order-group', '212623', NULL, NULL, '{\"id\":218,\"customer_id\":98,\"contact_person_name\":\"Nur Tanzir\",\"address_type\":\"home\",\"address\":\"Dhaka,Bangladesh\",\"city\":\"city\",\"zip\":null,\"phone\":\"01674437137\",\"created_at\":\"2024-11-14T10:42:18.000000Z\",\"updated_at\":\"2024-11-14T10:42:18.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100020, '95', NULL, 'customer', 'unpaid', 'canceled', 'cash_on_delivery', NULL, 15.464285714286, 0, NULL, '219', '2024-11-27 09:25:45', '2024-12-01 08:55:21', 0, NULL, '0', 5, 1.43, 'def-order-group', '202575', NULL, NULL, '{\"id\":219,\"customer_id\":95,\"contact_person_name\":\"Md. Naemul Islam\",\"address_type\":\"home\",\"address\":\"asdf\",\"city\":\"city\",\"zip\":null,\"phone\":\"01376587654\",\"created_at\":\"2024-11-27T09:25:45.000000Z\",\"updated_at\":\"2024-11-27T09:25:45.000000Z\",\"state\":null,\"country\":null,\"latitude\":null,\"longitude\":null,\"is_billing\":null}', NULL, 'test', NULL, NULL, 'default_type', 0.00, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(457, 100001, 800, 0, '{\"id\":800,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-RvzSEj\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2c40deee1.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2c40e3382.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":20,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:33:58.000000Z\",\"updated_at\":\"2024-08-12T15:38:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"189645\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 15.464285714286, 0, 0, 'pending', 'unpaid', '2024-08-17 14:37:10', '2024-08-17 14:37:10', 4, 'XL', '{\"Size\":\"XL\"}', 'discount_on_product', 1, 0),
(458, 100002, 796, 0, '{\"id\":796,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Co ords\",\"slug\":\"co-ords-MuReuL\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66b8ffd038809.png\\\",\\\"2024-08-12-66b8ffd0c76d8.png\\\"]\",\"thumbnail\":\"2024-08-12-66b8ffd0c8451.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.416666666667,\"purchase_price\":19.642857142857,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":16,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:15:44.000000Z\",\"updated_at\":\"2024-08-14T13:41:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Co ords\",\"meta_description\":\"Co ords\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"169051\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 21.416666666667, 0, 2.1416666666667, 'pending', 'unpaid', '2024-08-18 13:24:10', '2024-10-15 10:23:48', 4, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 0, 0),
(459, 100003, 800, 0, '{\"id\":800,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-RvzSEj\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2c40deee1.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2c40e3382.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":19,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:33:58.000000Z\",\"updated_at\":\"2024-08-17T14:37:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"189645\",\"reviews_count\":3,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":800,\"customer_id\":95,\"comment\":\"Good\",\"attachment\":\"[]\",\"rating\":2,\"status\":1,\"created_at\":\"2024-08-17T15:21:05.000000Z\",\"updated_at\":\"2024-08-17T15:21:05.000000Z\"},{\"id\":2,\"product_id\":800,\"customer_id\":95,\"comment\":\"Excellent\",\"attachment\":\"[\\\"2024-08-18-66c1e060149ef.png\\\"]\",\"rating\":4,\"status\":1,\"created_at\":\"2024-08-18T11:52:00.000000Z\",\"updated_at\":\"2024-08-18T11:52:00.000000Z\"},{\"id\":3,\"product_id\":800,\"customer_id\":95,\"comment\":null,\"attachment\":\"[]\",\"rating\":1,\"status\":1,\"created_at\":\"2024-08-18T12:01:12.000000Z\",\"updated_at\":\"2024-08-18T12:01:12.000000Z\"}]}', 1, 15.464285714286, 0, 0, 'pending', 'unpaid', '2024-08-18 13:50:45', '2024-08-18 13:50:45', 5, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(460, 100004, 799, 0, '{\"id\":799,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Beautiful Co-ords Set\",\"slug\":\"beautiful-co-ords-set-UnxWqk\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2d1ca76d2.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2d1cb13c9.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.190476190476,\"purchase_price\":19.047619047619,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":18,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 40\\/42 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:29:00.000000Z\",\"updated_at\":\"2024-08-14T13:53:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Beautiful Co-ords Set\",\"meta_description\":\"Beautiful Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"118985\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 21.190476190476, 0, 0, 'pending', 'unpaid', '2024-08-18 13:53:00', '2024-08-18 13:53:00', 4, 'XL', '{\"Size\":\"XL\"}', 'discount_on_product', 1, 0),
(461, 100005, 797, 0, '{\"id\":797,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Shrug with Inner\",\"slug\":\"shrug-with-inner-j9mKIE\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66b90106e31db.png\\\",\\\"2024-08-12-66b90106e759c.png\\\"]\",\"thumbnail\":\"2024-08-12-66b90106e8884.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":23.797619047619236,\\\"sku\\\":\\\"SwI-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"L\\\",\\\"price\\\":23.797619047619236,\\\"sku\\\":\\\"SwI-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":23.797619047619236,\\\"sku\\\":\\\"SwI-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":23.797619047619236,\\\"sku\\\":\\\"SwI-XXL\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":23.797619047619,\"purchase_price\":21.428571428572,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":18,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 52\\/54\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:20:54.000000Z\",\"updated_at\":\"2024-08-14T13:53:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Shrug with Inner\",\"meta_description\":\"Shrug with Inner\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"176969\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 23.797619047619, 0, 0, 'pending', 'unpaid', '2024-08-18 14:08:19', '2024-08-18 14:08:19', 4, 'L', '{\"Size\":\"L\"}', 'discount_on_product', 1, 0),
(462, 100006, 799, 0, '{\"id\":799,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Beautiful Co-ords Set\",\"slug\":\"beautiful-co-ords-set-UnxWqk\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2d1ca76d2.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2d1cb13c9.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.190476190476,\"purchase_price\":19.047619047619,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 40\\/42 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:29:00.000000Z\",\"updated_at\":\"2024-08-18T13:53:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Beautiful Co-ords Set\",\"meta_description\":\"Beautiful Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"118985\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 21.190476190476, 0, 0, 'pending', 'unpaid', '2024-08-22 14:58:52', '2024-08-22 14:58:52', 4, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(463, 100007, 798, 0, '{\"id\":798,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Designer Co-ords Set\",\"slug\":\"designer-co-ords-set-Bga7st\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ccb1fee4.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ccb24dac.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":22.02380952381,\"purchase_price\":20.833333333333,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"flat\",\"current_stock\":19,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 42\\/44 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:24:42.000000Z\",\"updated_at\":\"2024-08-14T10:56:01.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Designer Co-ords Set\",\"meta_description\":\"Designer Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107037\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 22.02380952381, 0, 10, 'pending', 'unpaid', '2024-08-22 15:13:45', '2024-10-14 14:16:49', 4, 'L', '{\"Size\":\"L\"}', 'discount_on_product', 0, 0),
(464, 100008, 797, 0, '{\"id\":797,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Shrug with Inner\",\"slug\":\"shrug-with-inner-j9mKIE\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66b90106e31db.png\\\",\\\"2024-08-12-66b90106e759c.png\\\"]\",\"thumbnail\":\"2024-08-12-66b90106e8884.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":25.0000000000002,\\\"sku\\\":\\\"SwI-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"L\\\",\\\"price\\\":25.0000000000002,\\\"sku\\\":\\\"SwI-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":25.0000000000002,\\\"sku\\\":\\\"SwI-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":25.0000000000002,\\\"sku\\\":\\\"SwI-XXL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":25,\"purchase_price\":21.428571428572,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":4,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 52\\/54\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:20:54.000000Z\",\"updated_at\":\"2024-08-22T14:37:07.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Shrug with Inner\",\"meta_description\":\"Shrug with Inner\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"176969\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":4,\"product_id\":797,\"customer_id\":97,\"comment\":\"Excellent product\",\"attachment\":\"[\\\"2024-08-18-66c200e620c61.png\\\",\\\"2024-08-18-66c200e66c987.png\\\"]\",\"rating\":5,\"status\":1,\"created_at\":\"2024-08-18T14:10:46.000000Z\",\"updated_at\":\"2024-08-18T14:10:46.000000Z\"}]}', 1, 25, 0, 0, 'pending', 'unpaid', '2024-08-22 15:24:29', '2024-10-14 15:32:55', 5, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 0, 0),
(465, 100008, 798, 0, '{\"id\":798,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Designer Co-ords Set\",\"slug\":\"designer-co-ords-set-Bga7st\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ccb1fee4.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ccb24dac.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-L\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":22.02380952381,\"purchase_price\":20.833333333333,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 42\\/44 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:24:42.000000Z\",\"updated_at\":\"2024-08-22T15:13:45.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Designer Co-ords Set\",\"meta_description\":\"Designer Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107037\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 22.02380952381, 0, 5, 'pending', 'unpaid', '2024-08-22 15:24:30', '2024-10-14 15:32:55', 1, 'XXL', '{\"Size\":\"XXL\"}', 'discount_on_product', 0, 0),
(466, 100009, 798, 0, '{\"id\":798,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Designer Co-ords Set\",\"slug\":\"designer-co-ords-set-Bga7st\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ccb1fee4.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ccb24dac.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-L\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-XXL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":22.02380952381,\"purchase_price\":20.833333333333,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"flat\",\"current_stock\":16,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 42\\/44 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:24:42.000000Z\",\"updated_at\":\"2024-08-22T15:24:30.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Designer Co-ords Set\",\"meta_description\":\"Designer Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107037\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 22.02380952381, 0, 10, 'pending', 'unpaid', '2024-08-28 15:45:25', NULL, 4, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(467, 100009, 799, 0, '{\"id\":799,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Beautiful Co-ords Set\",\"slug\":\"beautiful-co-ords-set-UnxWqk\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2d1ca76d2.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2d1cb13c9.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.19047619047636,\\\"sku\\\":\\\"BCS-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.190476190476,\"purchase_price\":19.047619047619,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":15,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 40\\/42 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:29:00.000000Z\",\"updated_at\":\"2024-08-22T14:58:52.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Beautiful Co-ords Set\",\"meta_description\":\"Beautiful Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"118985\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 21.190476190476, 0, 0, 'pending', 'unpaid', '2024-08-28 15:45:25', NULL, 1, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(468, 100010, 798, 0, '{\"id\":798,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Designer Co-ords Set\",\"slug\":\"designer-co-ords-set-Bga7st\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ccb1fee4.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ccb24dac.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/tmpMzu7AXwA?si=az3Sz3AnL6QxgAtM\",\"colors\":\"[\\\"#00FFFF\\\",\\\"#FFA500\\\",\\\"#FF4500\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"        L\\\",\\\"        XL\\\",\\\"        XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":22.02380952381,\"purchase_price\":20.833333333333,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"flat\",\"current_stock\":60,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 42\\/44 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:24:42.000000Z\",\"updated_at\":\"2024-08-29T10:09:29.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Designer Co-ords Set\",\"meta_description\":\"Designer Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107037\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 22.02380952381, 0, 5, 'pending', 'unpaid', '2024-08-29 10:26:52', NULL, 4, 'Orange-L', '{\"color\":\"Orange\",\"Size\":\"L\"}', 'discount_on_product', 1, 0),
(469, 100010, 796, 0, '{\"id\":796,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Co ords\",\"slug\":\"co-ords-MuReuL\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66b8ffd038809.png\\\",\\\"2024-08-12-66b8ffd0c76d8.png\\\"]\",\"thumbnail\":\"2024-08-12-66b8ffd0c8451.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.416666666667,\"purchase_price\":19.642857142857,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":15,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:15:44.000000Z\",\"updated_at\":\"2024-08-18T13:24:10.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Co ords\",\"meta_description\":\"Co ords\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"169051\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 2, 21.416666666667, 0, 4.2833333333334, 'pending', 'unpaid', '2024-08-29 10:26:52', NULL, 1, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(470, 100010, 798, 0, '{\"id\":798,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Designer Co-ords Set\",\"slug\":\"designer-co-ords-set-Bga7st\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ccb1fee4.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ccb24dac.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/tmpMzu7AXwA?si=az3Sz3AnL6QxgAtM\",\"colors\":\"[\\\"#00FFFF\\\",\\\"#FFA500\\\",\\\"#FF4500\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"        L\\\",\\\"        XL\\\",\\\"        XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Aqua-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Aqua-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Aqua-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-L\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Orange-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Orange-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-Orange-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-M\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-L\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-XL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"OrangeRed-XXL\\\",\\\"price\\\":22.0238095238097,\\\"sku\\\":\\\"DCS-OrangeRed-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":22.02380952381,\"purchase_price\":20.833333333333,\"tax\":0,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"flat\",\"current_stock\":60,\"minimum_order_qty\":1,\"details\":\"Fixed body M36 L 40 XL 44 XXL 48. Long 42\\/44 \\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:24:42.000000Z\",\"updated_at\":\"2024-08-29T10:26:52.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Designer Co-ords Set\",\"meta_description\":\"Designer Co-ords Set\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107037\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 3, 22.02380952381, 0, 15, 'pending', 'unpaid', '2024-08-29 10:26:52', NULL, 1, 'Aqua-XXL', '{\"color\":\"Aqua\",\"Size\":\"XXL\"}', 'discount_on_product', 1, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(471, 100010, 809, 0, '{\"id\":809,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Lip pink flash\",\"slug\":\"lip-pink-flash-6Jjy3P\",\"category_ids\":\"[{\\\"id\\\":\\\"544\\\",\\\"position\\\":1}]\",\"brand_id\":73,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-19-66c364392f5b6.png\\\"]\",\"thumbnail\":\"2024-08-19-66c36439349b3.png\",\"size_chart\":null,\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/3JzyVR7IivQ\",\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":11.309523809524,\"purchase_price\":9.5238095238096,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":20,\"minimum_order_qty\":1,\"details\":\"Lip pink flash\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-19T15:26:49.000000Z\",\"updated_at\":\"2024-08-19T15:26:49.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"137897\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 11.309523809524, 0, 1.1309523809524, 'pending', 'unpaid', '2024-08-29 10:26:52', NULL, 1, '', '[]', 'discount_on_product', 1, 0),
(472, 100011, 809, 1, '{\"id\":809,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Lip pink flash\",\"slug\":\"lip-pink-flash-6Jjy3P\",\"category_ids\":\"[{\\\"id\\\":\\\"544\\\",\\\"position\\\":1}]\",\"brand_id\":73,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-19-66c364392f5b6.png\\\"]\",\"thumbnail\":\"2024-08-19-66c36439349b3.png\",\"size_chart\":null,\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/3JzyVR7IivQ\",\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":11.309523809524,\"purchase_price\":9.5238095238096,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":20,\"minimum_order_qty\":1,\"details\":\"Lip pink flash\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-19T15:26:49.000000Z\",\"updated_at\":\"2024-08-19T15:26:49.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"137897\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 11.309523809524, 0, 1.1309523809524, 'delivered', 'paid', '2024-09-04 14:03:43', '2024-09-04 14:03:43', NULL, '', '[]', 'discount_on_product', 1, 0),
(473, 100012, 801, 1, '{\"id\":801,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-p9eP3r\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ba515aee.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ba51a3c0.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":19,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:42:39.000000Z\",\"updated_at\":\"2024-08-14T14:06:18.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123280\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 15.464285714286, 0, 0, 'delivered', 'paid', '2024-09-04 14:13:17', '2024-09-04 14:13:17', NULL, 'L', '{\"Size\":\"L\"}', 'discount_on_product', 1, 0),
(474, 100013, 809, 1, '{\"id\":809,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Lip pink flash\",\"slug\":\"lip-pink-flash-6Jjy3P\",\"category_ids\":\"[{\\\"id\\\":\\\"544\\\",\\\"position\\\":1}]\",\"brand_id\":73,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-19-66c364392f5b6.png\\\"]\",\"thumbnail\":\"2024-08-19-66c36439349b3.png\",\"size_chart\":null,\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/embed\\/3JzyVR7IivQ\",\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":11.309523809524,\"purchase_price\":9.5238095238096,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":19,\"minimum_order_qty\":1,\"details\":\"Lip pink flash\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-19T15:26:49.000000Z\",\"updated_at\":\"2024-09-04T14:03:43.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"137897\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 11.309523809524, 0, 1.1309523809524, 'delivered', 'paid', '2024-09-04 14:18:06', '2024-09-04 14:18:06', NULL, '', '[]', 'discount_on_product', 1, 0),
(475, 100014, 803, 1, '{\"id\":803,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Kurti\",\"slug\":\"kurti-UsoQyM\",\"category_ids\":\"[{\\\"id\\\":\\\"547\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-13-66bb26fa6279a.png\\\"]\",\"thumbnail\":\"2024-08-13-66bb26fa6699f.png\",\"size_chart\":\"2024-08-20-66c45d462bacf.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.facebook.com\\/reel\\/276505568880629\",\"video_shopping\":1,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"9\\\",\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_9\\\",\\\"title\\\":\\\"Color\\\",\\\"options\\\":[\\\"red\\\",\\\"  green\\\",\\\"  blue\\\",\\\"#00FFFF\\\"]},{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"red-M\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-red-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"red-L\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-red-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"red-XL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-red-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"red-XXL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-red-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"green-M\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-green-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"green-L\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-green-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"green-XL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-green-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"green-XXL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-green-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"blue-M\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-blue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"blue-L\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-blue-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"blue-XL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-blue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"blue-XXL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-blue-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"#00FFFF-M\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-#00FFFF-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"#00FFFF-L\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-#00FFFF-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"#00FFFF-XL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-#00FFFF-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"#00FFFF-XXL\\\",\\\"price\\\":14.2857142857144,\\\"sku\\\":\\\"K-#00FFFF-XXL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":14.285714285714,\"purchase_price\":13.095238095238,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":16,\"minimum_order_qty\":1,\"details\":\"Kurti\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-13T09:27:22.000000Z\",\"updated_at\":\"2024-08-29T09:51:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"117594\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 14.285714285714, 0, 0, 'delivered', 'paid', '2024-09-04 14:19:27', '2024-09-04 14:19:27', NULL, 'red-M', '{\"Color\":\"red\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(476, 100015, 808, 1, '{\"id\":808,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Beauty Glazed mud\",\"slug\":\"beauty-glazed-mud-f0Ggds\",\"category_ids\":\"[{\\\"id\\\":\\\"544\\\",\\\"position\\\":1}]\",\"brand_id\":73,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-19-66c361da46216.png\\\"]\",\"thumbnail\":\"2024-08-19-66c361da4af16.png\",\"size_chart\":null,\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.facebook.com\\/100079613568387\\/videos\\/1017890326732317\",\"video_shopping\":1,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":8.3333333333334,\"purchase_price\":7.1428571428572,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":20,\"minimum_order_qty\":1,\"details\":\"Beauty Glazed mud\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-19T15:16:42.000000Z\",\"updated_at\":\"2024-09-04T10:08:52.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"173870\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 8.3333333333334, 0, 0, 'delivered', 'paid', '2024-09-04 14:21:43', '2024-09-04 14:21:43', NULL, '', '[]', 'discount_on_product', 1, 0),
(477, 100016, 806, 0, '{\"id\":806,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Buy Beauty Glazed Velvet Super Matte Lip & Cheek\",\"slug\":\"buy-beauty-glazed-velvet-super-matte-lip-cheek-38vw7a\",\"category_ids\":\"[{\\\"id\\\":\\\"544\\\",\\\"position\\\":1}]\",\"brand_id\":73,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-19-66c35db7af920.png\\\"]\",\"thumbnail\":\"2024-08-19-66c35db7b4eea.png\",\"size_chart\":null,\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":5.952380952381,\"purchase_price\":4.7619047619048,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"minimum_order_qty\":1,\"details\":\"Buy Beauty Glazed Velvet Super Matte Lip & Cheek\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-19T14:59:03.000000Z\",\"updated_at\":\"2024-08-19T14:59:03.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107930\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 5.952380952381, 0, 0, 'pending', 'unpaid', '2024-10-03 08:57:33', NULL, 5, NULL, NULL, 'discount_on_product', 1, 0),
(478, 100019, 796, 0, '{\"id\":796,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Co ords\",\"slug\":\"co-ords-MuReuL\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66b8ffd038809.png\\\",\\\"2024-08-12-66b8ffd0c76d8.png\\\"]\",\"thumbnail\":\"2024-08-12-66b8ffd0c8451.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"color_variant\":null,\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-M\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"L\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":21.41666666666684,\\\"sku\\\":\\\"Co-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":21.416666666667,\"purchase_price\":19.642857142857,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":14,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:15:44.000000Z\",\"updated_at\":\"2024-10-15T10:23:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Co ords\",\"meta_description\":\"Co ords\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"169051\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 21.416666666667, 0, 2.1416666666667, 'pending', 'unpaid', '2024-11-14 10:42:19', NULL, 4, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(479, 100020, 801, 0, '{\"id\":801,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-p9eP3r\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2ba515aee.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2ba51a3c0.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"color_variant\":null,\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":6},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:42:39.000000Z\",\"updated_at\":\"2024-09-11T15:00:51.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123280\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 15.464285714286, 0, 0, 'pending', 'unpaid', '2024-11-27 09:25:45', '2024-12-01 08:55:21', 5, 'M', '{\"Size\":\"M\"}', 'discount_on_product', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_exchanges`
--

CREATE TABLE `order_exchanges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `previous_order_id` int(11) DEFAULT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `social_page_id` int(11) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `advance_amount` double DEFAULT 0,
  `advance_payment_method` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double DEFAULT 0,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_exchanges`
--

INSERT INTO `order_exchanges` (`id`, `previous_order_id`, `customer_id`, `social_page_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `advance_amount`, `advance_payment_method`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(1, 100014, '0', 1, 'customer', 'paid', 'delivered', 'Cash on delevery', NULL, 1.8928571428572, 0, NULL, NULL, '2024-09-11 14:41:25', '2024-09-11 14:41:25', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'EXCHANGE', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL),
(2, 100012, '0', 1, 'customer', 'paid', 'delivered', 'Cash on delevery', NULL, 0.71428571428572, 0, NULL, NULL, '2024-09-11 15:00:52', '2024-09-11 15:00:52', 0, NULL, NULL, 4, 0.71, 'def-order-group', '0', 1, 'admin', NULL, NULL, NULL, NULL, NULL, 'EXCHANGE', 0.00, NULL, 1, NULL, NULL, 'FlingEX Hubs', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_exchange_details`
--

CREATE TABLE `order_exchange_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_exchange_details`
--

INSERT INTO `order_exchange_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(469, 1, 800, 1, '{\"id\":800,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-RvzSEj\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2c40deee1.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2c40e3382.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":18,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:33:58.000000Z\",\"updated_at\":\"2024-08-18T13:50:45.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"189645\",\"reviews_count\":3,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":800,\"customer_id\":95,\"comment\":\"Good\",\"attachment\":\"[]\",\"rating\":2,\"status\":1,\"created_at\":\"2024-08-17T15:21:05.000000Z\",\"updated_at\":\"2024-08-17T15:21:05.000000Z\"},{\"id\":2,\"product_id\":800,\"customer_id\":95,\"comment\":\"Excellent\",\"attachment\":\"[\\\"2024-08-18-66c1e060149ef.png\\\"]\",\"rating\":4,\"status\":1,\"created_at\":\"2024-08-18T11:52:00.000000Z\",\"updated_at\":\"2024-08-18T11:52:00.000000Z\"},{\"id\":3,\"product_id\":800,\"customer_id\":95,\"comment\":null,\"attachment\":\"[]\",\"rating\":1,\"status\":1,\"created_at\":\"2024-08-18T12:01:12.000000Z\",\"updated_at\":\"2024-08-18T12:01:12.000000Z\"}]}', 1, 15.464285714286, 0, 0, 'delivered', 'paid', '2024-09-11 14:41:24', '2024-09-11 14:41:24', NULL, 'XL', '{\"Size\":\"XL\"}', 'discount_on_product', 1, 0),
(470, 2, 800, 1, '{\"id\":800,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long shirt\",\"slug\":\"long-shirt-RvzSEj\",\"category_ids\":\"[{\\\"id\\\":\\\"546\\\",\\\"position\\\":1}]\",\"brand_id\":77,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2024-08-12-66ba2c40deee1.png\\\"]\",\"thumbnail\":\"2024-08-12-66ba2c40e3382.png\",\"size_chart\":null,\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"video_shopping\":0,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"[\\\"8\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_8\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"M\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-M\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"L\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"XL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XL\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"XXL\\\",\\\"price\\\":15.464285714285838,\\\"sku\\\":\\\"Ls-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":15.464285714286,\"purchase_price\":14.285714285714,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"\\ud83d\\uded2\\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09b0\\u09a4\\u09c7 \\u0995\\u09b2 \\u0995\\u09b0\\u09c1\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b9\\u099f \\u09b2\\u09be\\u0987\\u09a8 \\u09a8\\u09be\\u09ae\\u09cd\\u09ac\\u09be\\u09b0 \\u098f \\u260e +88 01406-667669 \\u0985\\u09a5\\u09ac\\u09be \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u0987\\u09a8\\u09ac\\u0995\\u09cd\\u09b8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0 \\u09aa\\u09a6\\u09cd\\u09a7\\u09a4\\u09bf = \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09df--------------> \\u09b9\\u09cb\\u09ae \\u09a1\\u09c7\\u09b2\\u09bf\\u09ad\\u09be\\u09b0\\u09c0, \\ud83d\\udc49 \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7------>\\u0995\\u09a8\\u09cd\\u09a1\\u09bf\\u09b6\\u09a8 \\u0995\\u09c1\\u09b0\\u09bf\\u09df\\u09be\\u09b0, \\u09a1\\u09c7\\u09b2\\u09ad\\u09be\\u09b0\\u09c0 \\u099a\\u09be\\u09b0\\u09cd\\u099c-----> \\u09a2\\u09be\\u0995\\u09be\\u09df = \\u09ee\\u09e6 \\u099f\\u09be\\u0995\\u09be, \\u09a2\\u09be\\u0995\\u09be\\u09b0 \\u09ac\\u09be\\u0987\\u09b0\\u09c7 = \\u09e7\\u09eb\\u09e6 \\u099f\\u09be\\u0995\\u09be\\u0964\",\"short_description\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2024-08-11T18:33:58.000000Z\",\"updated_at\":\"2024-09-11T14:41:24.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Long shirt\",\"meta_description\":\"Long shirt\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"189645\",\"reviews_count\":3,\"translations\":[],\"reviews\":[{\"id\":1,\"product_id\":800,\"customer_id\":95,\"comment\":\"Good\",\"attachment\":\"[]\",\"rating\":2,\"status\":1,\"created_at\":\"2024-08-17T15:21:05.000000Z\",\"updated_at\":\"2024-08-17T15:21:05.000000Z\"},{\"id\":2,\"product_id\":800,\"customer_id\":95,\"comment\":\"Excellent\",\"attachment\":\"[\\\"2024-08-18-66c1e060149ef.png\\\"]\",\"rating\":4,\"status\":1,\"created_at\":\"2024-08-18T11:52:00.000000Z\",\"updated_at\":\"2024-08-18T11:52:00.000000Z\"},{\"id\":3,\"product_id\":800,\"customer_id\":95,\"comment\":null,\"attachment\":\"[]\",\"rating\":1,\"status\":1,\"created_at\":\"2024-08-18T12:01:12.000000Z\",\"updated_at\":\"2024-08-18T12:01:12.000000Z\"}]}', 1, 15.464285714286, 0, 0, 'delivered', 'paid', '2024-09-11 15:00:52', '2024-09-11 15:00:52', NULL, 'XL', '{\"Size\":\"XL\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_histories`
--

INSERT INTO `order_histories` (`id`, `order_id`, `details`, `created_by`, `created_at`, `updated_at`) VALUES
(121, 100019, '{\"order\":\"Method:Bkash, Advance: 150\",\"discount\":0}', 'admin', '2024-11-14 11:24:55', '2024-11-14 17:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('chrysta3lv5z987e1z@outlook.com', 'jx48uLDstJynwcCvz8HNPigP7DiddKMbMY5Ro69Lz7UGDo8GHYVGxsh2nH1YsXmWqejY79TiaUhMG8xGcP6w4KxBhimUMfUYdL1QzJqPhDDBfLJmPo1LcjJi', '2022-09-21 09:45:09', 'seller'),
('chrysta3lv5z987e1z@outlook.com', '5JgCroGvJ49i31h2RRceTZp0X324lVo7e0d6P0JoboEI77x2DkaXxb3BUGd36LRxZAEVHUMF42zZdUdfsMnERFXGQ67auFqZAOfrSOkxsAr3FnFjwh6sde0s', '2022-09-21 09:45:19', 'seller'),
('chrysta3lv5z987e1z@outlook.com', 'wXc0OetvtRkrQV2Ze1WKTgADSuLf3IrkU5pYyULnNMsfnKh6mn5P4r63V3e5VKudEgapL2TjhO35bmZnIslypJakv2dJFybaz36WrdpXQJUXbLI0pz6qu3hk', '2022-09-21 09:47:23', 'customer'),
('curtrina37ataoe6ng@outlook.com', 'hVpKkb8djhCWMdy6T57LtWbgAlPPrkQsbhEVCuzWdbYRD6yj84VcdC0OYK9kHOu5lHZ929zfiM9e3aWaaeL0VASmiliA4FHoPBYgqXLlsKdLjy39gkNtHmGC', '2022-09-23 09:07:54', 'seller'),
('curtrina37ataoe6ng@outlook.com', 'Jc29RwJsR0uPXPPXah4swmqo5HeqoU1zcSBZQhUSbKJH58HyOwJ5u1I9ZbROIxVaIvvDUpiu01UuLvDxOJ6L7tbz0FXr3H6aqQNUr4aJD5xplX53crAkdz9N', '2022-09-23 09:10:07', 'customer'),
('dimapanovv0@outlook.com', 'q7f9mzpLLjWaPRwJMLziG77oj2c7L0EcDFYFaBBnEBj8JbGv9jSYEXlbdTIL2FsdSsbVIE3vGiuV8NleLECxYSeaqTUjlggNLdlSTNetxKP6sRLgyFhMNQyr', '2022-10-12 06:46:26', 'seller'),
('dimapanovv0@outlook.com', 'lRW7Hvtfz5nEKxkn6bQ6mYiDKY1QAwoMi9UPneT5vNKdpndPyp83yemEyfw59CYZyj2G6NWNl5gggTpyPL65muLdVbh2FzaFlRFkNbwIwxS0AEaZLA3xzD4M', '2022-10-12 06:46:40', 'seller'),
('dimapanovv0@outlook.com', 'wrZuFdVhYnS4ZABjtNoOp40wZtOxnlE51QXu20xjXHh1rOxgQeBI8QDvyynY50FSASPXUR7WYwITjvf5Plu4wSU0T5yv4HLtu7FjuXvX5RpAvKSYQF6sjREU', '2022-10-12 06:48:05', 'customer'),
('mikhailb6li@outlook.com', '14x723O6X3uQEcEQauIwIY30plORQVPy2PfwNjMK1SqWL17fQwUhjxjjWS6ISzmblxC8XEQpfcBdDwtxDuBJXgU8RTDNDPTJmUrCiGhhqKAA6ZlooaOxeEnt', '2022-10-19 16:38:19', 'seller'),
('mikhailb6li@outlook.com', 'tntTaLmRwHSeFi7FnJeVTuJiM9VozJSIeEDdoPPZJ8XVsC3d7rbOKnxgn5ya3j15Aq3OKuQq5DbugeVck666oNLaD7t0yCWRaF00dtLNe5LJoXiyxATD7nLQ', '2022-10-19 16:38:35', 'seller'),
('sharminzinnat95@gmail.com', 'uKRZqkKL7ouUYkfjCLN9C6l3ZXqV7TgGB3OEQTPNHEX3QUB1tVzrAbAfY7U1MDV91EIYQqqDbXX67Q0e2xS0Byn1VmLLK1rWCw0IHfWwOdnK653rEWJCJYcC', '2022-10-23 02:45:35', 'seller'),
('sharminzinnat95@gmail.com', 'renTOwUi0HoBJwAUI0sB69ZCPTftQhshrujDVaVBttN0jMvaziEQL81zhHQG4Ua134I6FTD1eBWEJlLBYMJbONSJrqZGNOTsgIkkxbcpOBrjl5JJiSUoiKze', '2022-10-23 02:46:59', 'seller'),
('sharminzinnat95@gmail.com', 'fhJjKlQsXQp6p3nAnumIl8G5iXBsoJPdmiEgLtUg10SxylrwNKVnZFpKrA0iZj9e95kLPCD3hzpdVlhj7r3kjqoAZdQ1yEXLAQGYyqGrGdCTVLSMrivGxDOE', '2022-10-23 02:49:50', 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_payment_types`
--

CREATE TABLE `pos_payment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_payment_types`
--

INSERT INTO `pos_payment_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash on delevery', 1, '2024-09-04 13:59:27', '2024-09-04 13:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `size_chart` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `video_shopping` tinyint(1) NOT NULL DEFAULT 0,
  `colors` varchar(150) DEFAULT NULL,
  `color_variant` text DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `size_chart`, `featured`, `flash_deal`, `video_provider`, `video_url`, `video_shopping`, `colors`, `color_variant`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `short_description`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(796, 'admin', 1, 'Co ords', 'co-ords-MuReuL', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66b8ffd038809.png\",\"2024-08-12-66b8ffd0c76d8.png\"]', '2024-08-12-66b8ffd0c8451.png', NULL, '1', NULL, 'youtube', NULL, 0, '[\"#FAEBD7\",\"#00FFFF\"]', '[{\"color\":\"AntiqueWhite\",\"image\":\"asdf\"},{\"color\":\"Aqua\",\"image\":\"oiuure\"}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"L\"]}]', '[{\"type\":\"-M\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-L\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-M\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-L\",\"price\":0,\"sku\":null,\"qty\":0}]', 0, 21.416666666667, 19.642857142857, '0', 'percent', '10', 'percent', 14, 1, '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:15:44', '2024-11-14 10:42:19', 1, 1, 'Co ords', 'Co ords', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '169051'),
(797, 'admin', 1, 'Shrug with Inner', 'shrug-with-inner-j9mKIE', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66b90106e31db.png\",\"2024-08-12-66b90106e759c.png\"]', '2024-08-12-66b90106e8884.png', NULL, '1', NULL, 'youtube', NULL, 0, '[]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"  L\",\"  XL\",\"  XXL\"]}]', '[{\"type\":\"M\",\"price\":25.0000000000002,\"sku\":\"SwI-M\",\"qty\":1},{\"type\":\"L\",\"price\":25.0000000000002,\"sku\":\"SwI-L\",\"qty\":1},{\"type\":\"XL\",\"price\":25.0000000000002,\"sku\":\"SwI-XL\",\"qty\":1},{\"type\":\"XXL\",\"price\":25.0000000000002,\"sku\":\"SwI-XXL\",\"qty\":1}]', 0, 25, 21.428571428572, '0', 'percent', '0', 'flat', 4, 1, 'Fixed body M36 L 40 XL 44 XXL 48. Long 52/54🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:20:54', '2024-10-14 15:32:55', 1, 1, 'Shrug with Inner', 'Shrug with Inner', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '176969'),
(798, 'admin', 1, 'Designer Co-ords Set', 'designer-co-ords-set-Bga7st', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66ba2ccb1fee4.png\"]', '2024-08-12-66ba2ccb24dac.png', NULL, '1', NULL, 'youtube', 'https://www.youtube.com/embed/tmpMzu7AXwA?si=az3Sz3AnL6QxgAtM', 1, '[\"#00FFFF\",\"#FFA500\",\"#FF4500\"]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"        L\",\"        XL\",\"        XXL\"]}]', '[{\"type\":\"Aqua-M\",\"price\":22.0238095238097,\"sku\":\"DCS-Aqua-M\",\"qty\":5},{\"type\":\"Aqua-L\",\"price\":22.0238095238097,\"sku\":\"DCS-Aqua-L\",\"qty\":5},{\"type\":\"Aqua-XL\",\"price\":22.0238095238097,\"sku\":\"DCS-Aqua-XL\",\"qty\":5},{\"type\":\"Aqua-XXL\",\"price\":22.0238095238097,\"sku\":\"DCS-Aqua-XXL\",\"qty\":2},{\"type\":\"Orange-M\",\"price\":22.0238095238097,\"sku\":\"DCS-Orange-M\",\"qty\":5},{\"type\":\"Orange-L\",\"price\":22.0238095238097,\"sku\":\"DCS-Orange-L\",\"qty\":4},{\"type\":\"Orange-XL\",\"price\":22.0238095238097,\"sku\":\"DCS-Orange-XL\",\"qty\":5},{\"type\":\"Orange-XXL\",\"price\":22.0238095238097,\"sku\":\"DCS-Orange-XXL\",\"qty\":5},{\"type\":\"OrangeRed-M\",\"price\":22.0238095238097,\"sku\":\"DCS-OrangeRed-M\",\"qty\":5},{\"type\":\"OrangeRed-L\",\"price\":22.0238095238097,\"sku\":\"DCS-OrangeRed-L\",\"qty\":5},{\"type\":\"OrangeRed-XL\",\"price\":22.0238095238097,\"sku\":\"DCS-OrangeRed-XL\",\"qty\":5},{\"type\":\"OrangeRed-XXL\",\"price\":22.0238095238097,\"sku\":\"DCS-OrangeRed-XXL\",\"qty\":5}]', 0, 22.02380952381, 20.833333333333, '0', 'percent', '5', 'flat', 63, 1, 'Fixed body M36 L 40 XL 44 XXL 48. Long 42/44 🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:24:42', '2024-10-14 15:32:55', 1, 1, 'Designer Co-ords Set', 'Designer Co-ords Set', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '107037'),
(799, 'admin', 1, 'Beautiful Co-ords Set', 'beautiful-co-ords-set-UnxWqk', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66ba2d1ca76d2.png\"]', '2024-08-12-66ba2d1cb13c9.png', NULL, '1', NULL, 'youtube', NULL, 0, '[\"#9966CC\"]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_9\",\"title\":\"Color\",\"options\":[\"green\",\"  red\"]},{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"L\",\"  XL\"]}]', '[{\"type\":\"Amethyst-green-L\",\"price\":21.19047619047636,\"sku\":\"BCS-Amethyst-green-L\",\"qty\":1},{\"type\":\"Amethyst-green-XL\",\"price\":21.19047619047636,\"sku\":\"BCS-Amethyst-green-XL\",\"qty\":1},{\"type\":\"Amethyst-red-L\",\"price\":21.19047619047636,\"sku\":\"BCS-Amethyst-red-L\",\"qty\":1},{\"type\":\"Amethyst-red-XL\",\"price\":21.19047619047636,\"sku\":\"BCS-Amethyst-red-XL\",\"qty\":1}]', 0, 21.190476190476, 19.047619047619, '0', 'percent', '0', 'flat', 4, 1, 'Fixed body M36 L 40 XL 44 XXL 48. Long 40/42 🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:29:00', '2024-09-02 10:52:20', 1, 1, 'Beautiful Co-ords Set', 'Beautiful Co-ords Set', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '118985'),
(800, 'admin', 1, 'Long shirt', 'long-shirt-RvzSEj', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66ba2c40deee1.png\"]', '2024-08-12-66ba2c40e3382.png', NULL, '1', NULL, 'youtube', NULL, 0, '[]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"  L\",\"  XL\",\"  XXL\"]}]', '[{\"type\":\"M\",\"price\":15.464285714285838,\"sku\":\"Ls-M\",\"qty\":4},{\"type\":\"L\",\"price\":15.464285714285838,\"sku\":\"Ls-L\",\"qty\":5},{\"type\":\"XL\",\"price\":15.464285714285838,\"sku\":\"Ls-XL\",\"qty\":2},{\"type\":\"XXL\",\"price\":15.464285714285838,\"sku\":\"Ls-XXL\",\"qty\":5}]', 0, 15.464285714286, 14.285714285714, '0', 'percent', '0', 'flat', 16, 1, '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:33:58', '2024-09-11 15:00:52', 1, 1, 'Long shirt', 'Long shirt', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '189645'),
(801, 'admin', 1, 'Long shirt', 'long-shirt-p9eP3r', '[{\"id\":\"546\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-12-66ba2ba515aee.png\"]', '2024-08-12-66ba2ba51a3c0.png', NULL, '1', NULL, 'youtube', NULL, 0, '[]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"  L\",\"  XL\",\"  XXL\"]}]', '[{\"type\":\"M\",\"price\":15.464285714285838,\"sku\":\"Ls-M\",\"qty\":4},{\"type\":\"L\",\"price\":15.464285714285838,\"sku\":\"Ls-L\",\"qty\":6},{\"type\":\"XL\",\"price\":15.464285714285838,\"sku\":\"Ls-XL\",\"qty\":5},{\"type\":\"XXL\",\"price\":15.464285714285838,\"sku\":\"Ls-XXL\",\"qty\":5}]', 0, 15.464285714286, 14.285714285714, '0', 'percent', '0', 'flat', 18, 1, '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-11 18:42:39', '2024-12-01 08:55:21', 1, 1, 'Long shirt', 'Long shirt', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '123280'),
(802, 'admin', 1, 'Women Top Bottom Sets', 'women-top-bottom-sets-pldk2g', '[{\"id\":\"547\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-13-66bb26227ad26.png\"]', '2024-08-13-66bb26227fa1f.png', NULL, NULL, NULL, 'youtube', 'https://www.youtube.com/embed/g3VRKWkex8w', 1, '[\"#9966CC\",\"#00FFFF\"]', '[{\"color\":\"Amethyst\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-24-674309605d726.png\"},{\"color\":\"Aqua\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-24-674314406e5ea.png\"}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"L\"]}]', '[{\"type\":\"Amethyst-M\",\"price\":8.3333333333334,\"sku\":\"WTBS-Amethyst-M\",\"qty\":1},{\"type\":\"Amethyst-L\",\"price\":8.3333333333334,\"sku\":\"WTBS-Amethyst-L\",\"qty\":1},{\"type\":\"Aqua-M\",\"price\":8.3333333333334,\"sku\":\"WTBS-Aqua-M\",\"qty\":1},{\"type\":\"Aqua-L\",\"price\":8.3333333333334,\"sku\":\"WTBS-Aqua-L\",\"qty\":1}]', 0, 8.3333333333334, 7.1428571428572, '0', 'percent', '0', 'flat', 4, 1, 'test', NULL, 0, NULL, '2024-08-13 09:23:46', '2024-11-24 12:29:52', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '177421'),
(803, 'admin', 1, 'Kurti', 'kurti-UsoQyM', '[{\"id\":\"547\",\"position\":1}]', 77, 'pc', 1, 1, '[\"2024-08-13-66bb26fa6279a.png\"]', '2024-08-13-66bb26fa6699f.png', '2024-08-20-66c45d462bacf.png', NULL, NULL, 'facebook', 'https://www.facebook.com/reel/276505568880629', 1, '[\"#9966CC\",\"#00FFFF\"]', NULL, 0, '[\"8\"]', '[{\"name\":\"choice_9\",\"title\":\"Color\",\"options\":[\"\"]},{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"L\"]}]', '[{\"type\":\"Amethyst--L\",\"image\":null,\"price\":14.2857142857144,\"sku\":\"K-Amethyst--L\",\"qty\":1},{\"type\":\"Aqua--L\",\"image\":null,\"price\":14.2857142857144,\"sku\":\"K-Aqua--L\",\"qty\":1}]', 0, 14.285714285714, 13.095238095238, '0', 'percent', '0', 'flat', 2, 1, 'Kurti', NULL, 0, NULL, '2024-08-13 09:27:22', '2024-11-23 15:00:12', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '117594'),
(804, 'admin', 1, 'Beauty Glazed mud', 'beauty-glazed-mud-qFhVqU', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c35b53d411a.png\"]', '2024-08-19-66c35b53d9708.png', NULL, NULL, NULL, 'youtube', NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 3.5714285714286, 2.9761904761905, '0', 'percent', '0', 'flat', 0, 1, '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', NULL, 0, NULL, '2024-08-19 14:48:51', '2024-08-19 14:48:51', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '141266'),
(805, 'admin', 1, 'Handaiyan 6pcs Light Lipgloss Set', 'handaiyan-6pcs-light-lipgloss-set-8kDUpk', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c35c9f6f2e9.png\"]', '2024-08-19-66c35c9f73ccb.png', NULL, NULL, NULL, 'youtube', NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 8.9285714285715, 8.3333333333334, '0', 'percent', '0', 'flat', 10, 1, NULL, NULL, 0, NULL, '2024-08-19 14:54:23', '2024-08-19 14:54:23', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '166596'),
(806, 'admin', 1, 'Buy Beauty Glazed Velvet Super Matte Lip & Cheek', 'buy-beauty-glazed-velvet-super-matte-lip-cheek-38vw7a', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c35db7af920.png\"]', '2024-08-19-66c35db7b4eea.png', NULL, NULL, NULL, 'youtube', NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 5.952380952381, 4.7619047619048, '0', 'percent', '0', 'flat', 5, 1, 'Buy Beauty Glazed Velvet Super Matte Lip & Cheek', NULL, 0, NULL, '2024-08-19 14:59:03', '2024-08-19 14:59:03', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '107930'),
(807, 'admin', 1, 'Beauty Glazed Long Lasting 8pcs Matte Lipstick Set', 'beauty-glazed-long-lasting-8pcs-matte-lipstick-set-v6eGOv', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c3608337b77.png\",\"2024-08-19-66c360833a63f.png\"]', '2024-08-19-66c36059762b9.png', NULL, NULL, NULL, 'youtube', NULL, 1, '[]', NULL, 0, 'null', '[]', '[]', 0, 10.714285714286, 9.5238095238096, '0', 'percent', '0', 'flat', 7, 1, 'Beauty Glazed Long Lasting 8pcs Matte Lipstick Set', NULL, 0, NULL, '2024-08-19 15:05:02', '2024-09-04 10:13:45', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '185339'),
(808, 'admin', 1, 'Beauty Glazed mud', 'beauty-glazed-mud-f0Ggds', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c361da46216.png\"]', '2024-08-19-66c361da4af16.png', NULL, NULL, NULL, 'youtube', 'https://www.facebook.com/100079613568387/videos/1017890326732317', 1, '[]', NULL, 0, 'null', '[]', '[]', 0, 8.3333333333334, 7.1428571428572, '0', 'percent', '0', 'flat', 19, 1, 'Beauty Glazed mud', NULL, 0, NULL, '2024-08-19 15:16:42', '2024-09-04 14:21:43', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '173870'),
(809, 'admin', 1, 'Lip pink flash', 'lip-pink-flash-6Jjy3P', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-08-19-66c364392f5b6.png\"]', '2024-08-19-66c36439349b3.png', NULL, NULL, NULL, 'youtube', 'https://www.youtube.com/embed/3JzyVR7IivQ', 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 11.309523809524, 9.5238095238096, '0', 'percent', '10', 'percent', 18, 1, 'Lip pink flash', NULL, 0, NULL, '2024-08-19 15:26:49', '2024-09-04 14:18:06', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137897'),
(810, 'admin', 1, 'test products', 'test-products-rP5FSK', '[{\"id\":\"542\",\"position\":1},{\"id\":\"548\",\"position\":2}]', 74, 'pc', 1, 1, '[\"2024-10-01-66fbcbfe1e39b.png\"]', '2024-10-01-66fbcbff1d7aa.png', '2024-10-01-66fbcbff20ac6.png', NULL, NULL, 'youtube', 'https://www.facebook.com/watch/?v=777609080795189', 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 8.3333333333334, 7.1428571428572, '0', 'percent', '0', 'percent', 100, 1, '<p>sdfsf sdf sdfdf</p>', '<p>s dfsdfsdfsdfs dfsd f</p>', 0, NULL, '2024-10-01 10:16:31', '2024-10-01 10:16:31', 1, 1, 'sf sdf', '<p>sd fsdfsdfs</p>', '2024-10-01-66fbcbff21b19.png', 1, NULL, 0.00, 0, NULL, NULL, '189466'),
(811, 'admin', 1, 'test products', 'test-products-DqFEwD', '[{\"id\":\"543\",\"position\":1},{\"id\":\"551\",\"position\":2}]', 74, 'pc', 1, 1, '[\"2024-10-01-66fbcfb70f2fb.png\",\"2024-10-01-66fbcfb73b45e.png\"]', '2024-10-01-66fbcfb73bf0a.png', '2024-10-01-66fbcfb73c509.png', NULL, NULL, 'facebook', 'https://www.facebook.com/watch/?v=777609080795189', 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 8.3333333333334, 7.1428571428572, '0', 'percent', '0', 'flat', 100, 1, '<p>fds sdfsafsaf jsafd sdljfs d sdf sdf</p>', '<p>&nbsp;sfsdaf af</p>', 0, NULL, '2024-10-01 10:32:23', '2024-10-01 10:32:23', 1, 1, 'sfd f', '<p>s dfsdf saf sfsd fas</p>', '2024-10-01-66fbcfb73dbf1.png', 1, NULL, 0.00, 0, NULL, NULL, '134958'),
(812, 'admin', 1, 'test products', 'test-products-reKCts', '[{\"id\":\"542\",\"position\":1},{\"id\":\"549\",\"position\":2}]', 74, 'kg', 1, 1, '[\"2024-10-01-66fc213da88b7.png\"]', '2024-10-01-66fc213e7a54f.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 5.952380952381, 4.7619047619048, '0', 'percent', '0', 'flat', 0, 1, '<p>sdf sad f</p>', '<p>s dfasf&nbsp;</p>', 0, NULL, '2024-10-01 16:20:14', '2024-10-01 16:20:14', 1, 1, NULL, '<p>SDF</p>', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, 'sdfsf343T'),
(813, 'admin', 1, 'test products 7', 'test-products-7-CqJ1oA', '[{\"id\":\"542\",\"position\":1},{\"id\":\"548\",\"position\":2}]', 73, 'kg', 1, 1, '[\"2024-10-01-66fc2efcda1f1.png\"]', '2024-10-01-66fc2efd2e470.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 6.6071428571429, 5.2857142857143, '0', 'percent', '0', 'flat', 0, 1, '<p>sdf sdf</p>', '<p>sd fsdf</p>', 0, NULL, '2024-10-01 17:18:53', '2024-10-01 17:18:53', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, 'eewr444'),
(814, 'admin', 1, 'test products 2', 'test-products-2-B8ufoA', '[{\"id\":\"542\",\"position\":1},{\"id\":\"548\",\"position\":2}]', 74, 'pc', 1, 1, '[\"2024-10-02-66fd026aa21de.png\"]', '2024-10-02-66fd026b92135.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 7.1428571428572, 5.952380952381, '0', 'percent', '0', 'flat', 0, 1, '<p>f sdfsa df&nbsp;</p>', '<p>&nbsp;fsdfasdfsd fsd</p>', 0, NULL, '2024-10-02 08:20:59', '2024-10-02 08:20:59', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, 'sdfsf343T5'),
(815, 'admin', 1, 'test products 66', 'test-products-66-Bsfp6G', '[{\"id\":\"542\",\"position\":1},{\"id\":\"548\",\"position\":2}]', 73, 'pc', 1, 1, '[\"2024-10-02-66fd103f2dc95.png\"]', '2024-10-02-66fd103fdc6a7.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', NULL, 0, 'null', '[]', '[]', 0, 7.1428571428572, 5.952380952381, '0', 'percent', '0', 'flat', 0, 1, NULL, NULL, 0, NULL, '2024-10-02 09:19:59', '2024-10-02 09:19:59', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '168270tt'),
(817, 'admin', 1, 'test products 3', 'test-products-3-RmZRfl', '[{\"id\":\"542\",\"position\":1}]', 74, 'kg', 1, 1, '[\"2024-11-06-672b6ecba202a.png\",\"2024-11-06-672b6ecc2666e.png\",\"2024-11-06-672b6ecc26b41.png\"]', '2024-11-06-672b6ecc2700f.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#9966CC\",\"#00FFFF\",\"#000000\"]', NULL, 0, 'null', '[]', '[{\"type\":\"Amethyst\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecc2666e.png\",\"price\":5.357142857142899,\"sku\":\"tp3-Amethyst\",\"qty\":1},{\"type\":\"Aqua\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecba202a.png\",\"price\":5.357142857142899,\"sku\":\"tp3-Aqua\",\"qty\":1},{\"type\":\"Black\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecc26b41.png\",\"price\":5.357142857142899,\"sku\":\"tp3-Black\",\"qty\":1}]', 0, 5.3571428571429, 4.7619047619048, '0', 'percent', '0', 'flat', 3, 1, '<p>sdfsa fsdfsadf</p>', '<p>sf asdfsadfs fasfaf</p>', 0, NULL, '2024-11-06 13:27:40', '2024-11-07 09:50:03', 1, 1, 'asfasdfsdf', '<p>sfsdf</p>', '2024-11-06-672b6ecc2b5b2.png', 1, NULL, 0.00, 0, NULL, NULL, '112300'),
(818, 'admin', 1, 'test products 7', 'test-products-7-Jb0Eok', '[{\"id\":\"543\",\"position\":1},{\"id\":\"550\",\"position\":2}]', 74, 'pc', 1, 1, '[\"2024-11-11-67322a879805e.png\"]', '2024-11-11-67322a8883367.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#9966CC\",\"#00FFFF\",\"#7FFFD4\"]', '[{\"color\":\"Amethyst\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecc2666e.png\"},{\"color\":\"Aqua\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecba202a.png\"},{\"color\":\"Aquamarine\",\"image\":\"http:\\/\\/localhost\\/shopping_zone_bd\\/storage\\/app\\/public\\/product\\/2024-11-06-672b6ecc2666e.png\"}]', 0, 'null', '[]', '[{\"type\":\"Amethyst\",\"price\":14.2857142857144,\"sku\":\"tp7-Amethyst\",\"qty\":1},{\"type\":\"Aqua\",\"price\":14.2857142857144,\"sku\":\"tp7-Aqua\",\"qty\":1},{\"type\":\"Aquamarine\",\"price\":14.2857142857144,\"sku\":\"tp7-Aquamarine\",\"qty\":1}]', 0, 14.285714285714, 11.904761904762, '0', 'percent', '0', 'flat', 3, 1, '<p>sd fsdf sadf sdaf sdf fsdf asdf</p>', '<p>s dfsadf asfsdf fsa fasdf&nbsp;</p>', 0, NULL, '2024-11-11 16:02:16', '2024-11-11 16:02:16', 1, 1, 'test meta title', '<p>sdf sdfsdfsad fs dfas f</p>', '2024-11-11-67322a8885c33.png', 1, NULL, 0.00, 0, NULL, NULL, '125232'),
(820, 'admin', 1, 'Long shirt test', 'long-shirt-test-VBZHHh', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-11-23-6741f346a5a27.png\",\"2024-11-23-6741f346b3c70.png\",\"2024-11-23-6741f346b4736.png\"]', '2024-11-23-6741f346b5f3b.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#7FFF00\"]', '[{\"color\":\"Chartreuse-M\",\"image\":null},{\"color\":\"Chartreuse-L\",\"image\":null}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"  L\"]}]', '[{\"type\":\"Chartreuse-M\",\"image\":\"https:\\/\\/shoppingzonebd.com.bd\\/storage\\/app\\/public\\/product\\/thumbnail\\/2024-10-05-67014e6339d38.png\",\"price\":5.952380952381,\"sku\":\"Lst-Chartreuse-M\",\"qty\":1},{\"type\":\"Chartreuse-L\",\"image\":\"https:\\/\\/shoppingzonebd.com.bd\\/storage\\/app\\/public\\/product\\/thumbnail\\/2024-10-05-67014e6339d38.png\",\"price\":5.952380952381,\"sku\":\"Lst-Chartreuse-L\",\"qty\":1}]', 0, 5.952380952381, 5.3571428571429, '0', 'percent', '0', 'flat', 2, 1, NULL, NULL, 0, NULL, '2024-11-23 15:22:46', '2024-11-23 15:46:53', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '160765'),
(821, 'admin', 1, 'Women Top Bottom Setsasdfasdf sadfasd', 'women-top-bottom-setsasdfasdf-sadfasd-yyb2Dv', '[{\"id\":\"544\",\"position\":1}]', 74, 'pc', 1, 1, '[\"2024-11-24-6743010b15d1a.png\",\"2024-11-24-6743010be843b.png\",\"2024-11-24-6743010be900f.png\",\"2024-11-24-6743010be9ac6.png\"]', '2024-11-24-6743010bea0f7.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#000000\",\"#FF0000\"]', '[{\"color\":\"Black-M\",\"image\":null},{\"color\":\"Black-L\",\"image\":null},{\"color\":\"Black-XL\",\"image\":null},{\"color\":\"Red-M\",\"image\":null},{\"color\":\"Red-L\",\"image\":null},{\"color\":\"Red-XL\",\"image\":null}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"L\",\"XL\"]}]', '[{\"type\":\"Black-M\",\"price\":595.2380952381,\"sku\":\"WTBSs-Black-M\",\"qty\":1},{\"type\":\"Black-L\",\"price\":595.2380952381,\"sku\":\"WTBSs-Black-L\",\"qty\":1},{\"type\":\"Black-XL\",\"price\":595.2380952381,\"sku\":\"WTBSs-Black-XL\",\"qty\":1},{\"type\":\"Red-M\",\"price\":595.2380952381,\"sku\":\"WTBSs-Red-M\",\"qty\":1},{\"type\":\"Red-L\",\"price\":595.2380952381,\"sku\":\"WTBSs-Red-L\",\"qty\":1},{\"type\":\"Red-XL\",\"price\":595.2380952381,\"sku\":\"WTBSs-Red-XL\",\"qty\":1}]', 0, 595.2380952381, 47.619047619048, '0', 'percent', '0', 'flat', 6, 1, NULL, NULL, 0, NULL, '2024-11-24 10:33:47', '2024-11-24 10:33:47', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '160333'),
(822, 'admin', 1, 'Women Top Bottom 44', 'women-top-bottom-44-jW4KRu', '[{\"id\":\"543\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-11-24-6743043116970.png\",\"2024-11-24-674304311b110.png\"]', '2024-11-24-674304311ba97.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#FFFFFF\",\"#FFFF00\"]', '[{\"color\":\"White\",\"image\":null},{\"color\":\"White\",\"image\":null},{\"color\":\"Yellow\",\"image\":null},{\"color\":\"Yellow\",\"image\":null}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"L\"]}]', '[{\"type\":\"-M\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-L\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-M\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"-L\",\"price\":0,\"sku\":null,\"qty\":0}]', 0, 23.809523809524, 11.904761904762, '0', 'percent', '0', 'flat', 0, 1, NULL, NULL, 0, NULL, '2024-11-24 10:47:13', '2024-11-24 10:47:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '155930'),
(823, 'admin', 1, 'Color Veriation product', 'asdfsfd-9hjmZe', '[{\"id\":\"543\",\"position\":1},{\"id\":\"551\",\"position\":2}]', 74, 'kg', 1, 1, '[\"2024-11-24-674335bcc1d51.png\",\"2024-11-24-674335bcc521e.png\",\"2024-11-24-674335bcc58e1.png\",\"2024-11-24-674335bcc6080.png\"]', '2024-11-24-674335d63ba7a.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#FAEBD7\",\"#00FFFF\",\"#7FFFD4\"]', '[{\"color\":\"AntiqueWhite\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-24-674335bcc1d51.png\"},{\"color\":\"Aqua\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-24-674335bcc521e.png\"},{\"color\":\"Aquamarine\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-24-674335bcc58e1.png\"}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"                    L\"]}]', '[{\"type\":\"AntiqueWhite-M\",\"price\":0,\"sku\":null,\"qty\":5},{\"type\":\"AntiqueWhite-L\",\"price\":0,\"sku\":null,\"qty\":5},{\"type\":\"Aqua-M\",\"price\":0,\"sku\":null,\"qty\":5},{\"type\":\"Aqua-L\",\"price\":0,\"sku\":null,\"qty\":5},{\"type\":\"Aquamarine-M\",\"price\":0,\"sku\":null,\"qty\":5},{\"type\":\"Aquamarine-L\",\"price\":0,\"sku\":null,\"qty\":5}]', 0, 47.619047619048, 35.714285714286, '0', 'percent', '0', 'flat', 30, 1, NULL, NULL, 0, NULL, '2024-11-24 11:09:20', '2024-11-24 14:20:08', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '141047'),
(824, 'admin', 1, 'test999 askdfj Naem', 'test999-zLE4SY', '[{\"id\":\"544\",\"position\":1}]', 74, 'gms', 1, 1, '[\"2024-11-24-67434603b3c9b.png\",\"2024-11-24-67434603bb76a.png\",\"2024-11-24-67434603bc296.png\",\"2024-11-24-67434dc95aeeb.png\"]', '2024-11-24-67434603bdbc9.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', '[]', 0, 'null', '[]', '[]', 0, 59.52380952381, 47.619047619048, '0', 'percent', '0', 'flat', 50, 1, '<p>asdfas fd </p>', '<p>asdfadf</p>', 0, NULL, '2024-11-24 15:28:03', '2024-11-24 16:21:37', 1, 1, 'asdfasdf asfd', NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '131703'),
(825, 'admin', 1, 'T-Shart Pro', 't-shart-pro-Hc7pBl', '[{\"id\":\"546\",\"position\":1},{\"id\":\"554\",\"position\":2}]', 73, 'pc', 1, 1, '[\"2024-11-25-6744568751af0.png\",\"2024-11-25-67445687578e2.png\",\"2024-11-25-67445687587b5.png\",\"2024-11-25-6744568759267.png\"]', '2024-11-25-6744568759e6d.png', '2024-11-25-67445c3d35b2e.png', NULL, NULL, NULL, NULL, 0, '[\"#6B8E23\",\"#FFA500\",\"#FF4500\"]', '[{\"color\":\"OliveDrab\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-25-67445687578e2.png\"},{\"color\":\"Orange\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-25-6744568759267.png\"},{\"color\":\"OrangeRed\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-25-6744568751af0.png\"}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"M\",\"    L\",\"    XL\"]}]', '[{\"type\":\"OliveDrab-M\",\"price\":0,\"sku\":null,\"qty\":20},{\"type\":\"OliveDrab-L\",\"price\":0,\"sku\":null,\"qty\":20},{\"type\":\"OliveDrab-XL\",\"price\":0,\"sku\":null,\"qty\":20},{\"type\":\"Orange-M\",\"price\":0,\"sku\":null,\"qty\":20},{\"type\":\"Orange-L\",\"price\":0,\"sku\":null,\"qty\":10},{\"type\":\"Orange-XL\",\"price\":0,\"sku\":null,\"qty\":10},{\"type\":\"OrangeRed-M\",\"price\":0,\"sku\":null,\"qty\":10},{\"type\":\"OrangeRed-L\",\"price\":0,\"sku\":null,\"qty\":10},{\"type\":\"OrangeRed-XL\",\"price\":0,\"sku\":null,\"qty\":10}]', 0, 47.619047619048, 35.714285714286, '0', 'percent', '0', 'flat', 130, 1, '<p>slkdjflk</p>', NULL, 0, NULL, '2024-11-25 10:50:47', '2024-11-25 11:15:09', 1, 1, 'tshart', '<p>stlaskfd</p>', '2024-11-25-67445c3d36418.png', 1, NULL, 0.00, 0, NULL, NULL, '116550'),
(826, 'admin', 1, 'Md. Naem asdf', 'md-naem-rr7m4x', '[{\"id\":\"544\",\"position\":1}]', 73, 'pc', 1, 1, '[\"2024-11-25-674458da99e11.png\",\"2024-11-25-67445a33b0912.png\"]', '2024-11-25-674458da9e07a.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[]', '[]', 0, 'null', '[]', '[]', 0, 4.7619047619048, 2.3809523809524, '0', 'percent', '0', 'flat', 0, 1, NULL, NULL, 0, NULL, '2024-11-25 11:00:42', '2024-11-25 11:06:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '106049'),
(827, 'admin', 1, 'Tashya Garner asdf', 'tashya-garner-asdf-vh5euC', '[{\"id\":\"544\",\"position\":1}]', 74, 'pc', 1, 1, '[\"2024-11-27-6746e85c31037.png\",\"2024-11-27-6746e85c3578b.png\",\"2024-11-27-6746e85c35da7.png\",\"2025-01-16-6788fa4102e98.png\",\"2025-01-16-6788fa41120fd.png\"]', '2024-11-27-6746e85c369fb.png', 'def.png', NULL, NULL, NULL, NULL, 0, '[\"#F0F8FF\",\"#00FFFF\"]', '[{\"color\":\"AliceBlue\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-27-6746e85c31037.png\"},{\"color\":\"Aqua\",\"image\":\"http:\\/\\/127.0.0.1:8000\\/storage\\/product\\/2024-11-27-6746e85c3578b.png\"}]', 0, '[\"8\"]', '[{\"name\":\"choice_8\",\"title\":\"Size\",\"options\":[\"L\",\"  M\"]}]', '[{\"type\":\"AliceBlue-L\",\"price\":71.428571428572,\"sku\":\"TGa-AliceBlue-L\",\"qty\":1},{\"type\":\"AliceBlue-M\",\"price\":71.428571428572,\"sku\":\"TGa-AliceBlue-M\",\"qty\":1},{\"type\":\"Aqua-L\",\"price\":71.428571428572,\"sku\":\"TGa-Aqua-L\",\"qty\":1},{\"type\":\"Aqua-M\",\"price\":71.428571428572,\"sku\":\"TGa-Aqua-M\",\"qty\":1}]', 0, 71.428571428572, 59.52380952381, '0', 'percent', '0', 'flat', 4, 1, NULL, NULL, 0, NULL, '2024-11-27 09:37:32', '2025-01-16 12:23:29', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '166202');

-- --------------------------------------------------------

--
-- Table structure for table `product_campans`
--

CREATE TABLE `product_campans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_id` varchar(191) DEFAULT NULL,
  `product_id` varchar(191) DEFAULT NULL,
  `start_day` varchar(191) DEFAULT NULL,
  `end_day` varchar(191) DEFAULT NULL,
  `discountCam` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_landing_pages`
--

CREATE TABLE `product_landing_pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `slider_img` text DEFAULT NULL,
  `product_id` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `feature_list` text DEFAULT NULL,
  `feature_img` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_landing_pages`
--

INSERT INTO `product_landing_pages` (`id`, `title`, `slug`, `slider_img`, `product_id`, `description`, `feature_list`, `feature_img`, `video_url`, `status`, `created_at`, `updated_at`) VALUES
(22, 'Most popular porduct', 'most-popular-porduct', '[\"2024-09-24-66f299adb2364.png\",\"2024-09-24-66f299adb6408.png\"]', '808', '<p>আমাদের সাবানের উভয় পাশে জাফরান পাবেন। আমরা শতভাগ গ্যারান্টি দেই কারণ প্রাকৃতিক যেসব উপাদান ত্বকের জন্য উপকারী এমন উপাদান দিয়ে সাবান তৈরি করেছি। আমি এবং আরও অনেকে উপকার পেয়েছে। আশা করছি আপনিও উপকার পাবেন।<br></p>', '[\"\\u09e8-\\u09e9 \\u09b6\\u09c7\\u09a1 \\u09ab\\u09b0\\u09cd\\u09b8\\u09be \\u0995\\u09b0\\u09ac\\u09c7 \\u09a6\\u09c1\\u0987 \\u09a5\\u09c7\\u0995\\u09c7 \\u09a4\\u09bf\\u09a8\\u099f\\u09be \\u09b8\\u09be\\u09ac\\u09be\\u09a8 \\u09ac\\u09cd\\u09af\\u09ac\\u09b9\\u09be\\u09b0\\u09c7\\u0987\\u0964\",\"\\u0995\\u09df\\u09c7\\u0995\\u09a6\\u09bf\\u09a8 \\u09ac\\u09cd\\u09af\\u09ac\\u09b9\\u09be\\u09b0 \\u0995\\u09b0\\u09be\\u09b0 \\u09b8\\u09be\\u09a5\\u09c7 \\u09b8\\u09be\\u09a5\\u09c7\\u0987 \\u0986\\u09aa\\u09a8\\u09bf \\u09aa\\u09b0\\u09bf\\u09ac\\u09b0\\u09cd\\u09a4\\u09a8 \\u09b2\\u0995\\u09cd\\u09b7\\u09cd\\u09af \\u0995\\u09b0\\u09c7 \\u09ab\\u09c7\\u09b2\\u09ac\\u09c7\\u09a8\\u0964\",\"\\u098f\\u099f\\u09be \\u09ac\\u09cd\\u09af\\u09ac\\u09b9\\u09be\\u09b0\\u09c7 \\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u09b8\\u09cd\\u0995\\u09bf\\u09a8 \\u09ac\\u09cd\\u09b0\\u09be\\u0987\\u099f \\u0995\\u09b0\\u09ac\\u09c7 \\u0964\"]', '2024-09-24-66f299adb78e0.png', 'https://www.youtube.com/embed/aKnA8bMgZIw', 0, '2024-09-24 10:51:25', '2024-09-24 10:51:25'),
(23, 'Special kurti offer', 'special-kurti-offer', '[\"2024-09-24-66f2a0f5f1d88.png\",\"2024-09-24-66f2a0f60142a.png\",\"2024-09-24-66f2a0f601dd6.png\",\"2024-09-24-66f2a0f6028f5.png\"]', '806', '<ol style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(5, 5, 5); font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 15px; white-space-collapse: preserve;\"><li style=\"margin: 0px; padding: 0px;\">Ready Three Piece</li><li style=\"margin: 0px; padding: 0px;\">Material: Maslin Cotton</li><li style=\"margin: 0px; padding: 0px;\">Size: 34 to 52 (Body)</li><li style=\"margin: 0px; padding: 0px;\">Long: 42/44/46 inch</li><li style=\"margin: 0px; padding: 0px;\">Price BDT: 2150/- only</li></ol>', '[\"Ready Three Piece\",\"Material: Maslin Cotton\",\"Size: 34 to 52 (Body)\",\"Long: 42\\/44\\/46 inch\",\"Price BDT: 2150\\/- only\"]', '2024-09-24-66f2a0f60362a.png', 'https://www.youtube.com/embed/aKnA8bMgZIw', 1, '2024-09-24 11:22:30', '2024-09-24 11:29:15'),
(24, 'Koton kurti', 'koton-kurti', '[\"2024-10-03-66fe1d81ef44b.png\",\"2024-10-03-66fe1d8288616.png\",\"2024-10-03-66fe1d8289211.png\"]', '804', '<p>koton kurti</p>', '[\"\\u09ab\\u09c7\\u09ac\\u09cd\\u09b0\\u09bf\\u0995\\u09cd\\u09b8 \\u0995\\u099f\\u09a8 \\u09b8\\u09c1\\u09a4\\u09bf\",\"\\u09ac\\u09a1\\u09bf \\u09ee\\u09e6 \\u099c\\u09be\\u09ae\\u09be \\u09b2\\u0982 \\u09ea\\u09ee\",\"\\u09aa\\u09be\\u09af\\u09bc\\u099c\\u09be\\u09ae\\u09be \\u0995\\u09be\\u09aa\\u09a1\\u09bc \\u09a6\\u09c7\\u0993\\u09af\\u09bc\\u09be \\u09e8.\\u09eb \\u0997\\u099c ( \\u09ef\\u09e6 \\u0987\\u099e\\u09cd\\u099a\\u09bf)\",\"\\u0993\\u09a1\\u09bc\\u09a8\\u09be\\u09b0 \\u0995\\u09be\\u09aa\\u09a1\\u09bc \\u09a6\\u09c7\\u0993\\u09af\\u09bc\\u09be \\u0986\\u099b\\u09c7 \\u09eb.\\u09eb \\u09b9\\u09be\\u09a4\\u0964\",\"\\u099c\\u09be\\u09ae\\u09be \\u098f\\u09ac\\u0982 \\u0993\\u09a1\\u09bc\\u09a8\\u09be\\u09a4\\u09c7 \\u09ab\\u09c1\\u09b2 \\u098f\\u09ae\\u09ac\\u09cd\\u09b0\\u09af\\u09bc\\u09a1\\u09be\\u09b0\\u09bf \\u0995\\u09b0\\u09be\\u0964\"]', '2024-10-03-66fe1d828a9a8.png', 'https://www.youtube.com/embed/aKnA8bMgZIw', 1, '2024-10-03 04:28:50', '2024-10-03 04:29:10'),
(25, 'Test Single Page Product', 'test-single-page-product', '[\"2024-10-03-66fe5b1acdd89.png\",\"2024-10-03-66fe5b1ba2d2a.png\",\"2024-10-03-66fe5b1ba767d.png\"]', '813', '<p><span style=\"color: rgb(248, 248, 242); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; white-space: pre; background-color: rgb(39, 40, 34);\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit </span><br></p>', '[\"Test Feature Title\"]', '2024-10-03-66fe5b1bb21c0.png', 'https://youtu.be/B4MwQGFd1Ik', 0, '2024-10-03 08:51:39', '2024-10-03 08:51:39'),
(26, 'Test Single Page Product', 'test-single-page-product', '[\"2024-10-03-66fe5b982f070.png\",\"2024-10-03-66fe5b98619d3.png\",\"2024-10-03-66fe5b9865719.png\"]', '815', '<p><span style=\"color: rgb(248, 248, 242); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; white-space: pre; background-color: rgb(39, 40, 34);\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit </span><br></p>', '[\"Test Feature Title\"]', '2024-10-03-66fe5b986a1a5.png', 'https://youtu.be/B4MwQGFd1Ik', 0, '2024-10-03 08:53:44', '2024-10-03 08:53:44'),
(27, 'Test Landing page 2', 'test-landing-page-2', '[\"2024-10-03-66fe5becefaac.png\",\"2024-10-03-66fe5becf2209.png\",\"2024-10-03-66fe5becf29f7.png\"]', '814', '<p><span style=\"color: rgb(248, 248, 242); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; white-space: pre; background-color: rgb(39, 40, 34);\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit </span><br></p>', '[\"Test Feature Title\"]', '2024-10-03-66fe5bed0ab36.png', 'https://youtu.be/B4MwQGFd1Ik', 0, '2024-10-03 08:55:09', '2024-10-03 08:55:09'),
(28, 'Test Landing page 3', 'test-landing-page-3', '[\"2024-10-03-66fe5c313cea3.png\",\"2024-10-03-66fe5c314a69b.png\"]', '812', '<p><span style=\"color: rgb(248, 248, 242); font-family: Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; white-space: pre; background-color: rgb(39, 40, 34);\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit </span><br></p>', '[\"Test Feature Title\"]', '2024-10-03-66fe5c314c066.png', 'https://www.facebook.com/reel/1813355412858713', 1, '2024-10-03 08:56:17', '2024-11-27 10:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_landing_page_sections`
--

CREATE TABLE `product_landing_page_sections` (
  `id` int(11) NOT NULL,
  `product_landing_page_id` varchar(255) DEFAULT NULL,
  `section_title` varchar(255) DEFAULT NULL,
  `section_description` longtext DEFAULT NULL,
  `section_img` varchar(255) DEFAULT NULL,
  `section_direction` varchar(255) DEFAULT NULL,
  `order_button` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_landing_page_sections`
--

INSERT INTO `product_landing_page_sections` (`id`, `product_landing_page_id`, `section_title`, `section_description`, `section_img`, `section_direction`, `order_button`, `created_at`, `updated_at`) VALUES
(29, '23', 'সাবানটি সানস্ক্রিন ব্যবহারের আগে কি ব্যবহার করতে হবে?', 'প্রতি দিন সকালে ফেইস ক্লিন করে দিনের মশ্চেরাইজার ব্যবহার করবেন, এর ১০-১৫মিনিট পর সানস্ক্রিন ব্যবহার করবেন (আমাদের সানস্ক্রিন রোদে যাওয়ার অন্তত ৩০মিনিট আগে এপ্লাই করবেন) । চাইলে, সানস্ক্রিন ব্যবহারের পরে এর উপর হালকা করে পাউডার দিয়ে সেট করে নিতে পারেন।\r\nসানস্ক্রিন ধুয়ে বা মুছে গেলে আবার ব্যবহার করতে হবে। বিকাল ৪টা পর্যন্ত এটা স্কিনে রাখা ভালো। এরপর অথবা রাতে ক্লিন করার সময় আগে ক্লিনজিং ওয়েল বা মাইসেলর ওয়াটার বা ক্লিজিংবাম দিয়ে ক্লিন করে নিতে হবে এবং এরপর সোপ বা ফেইসওয়াস দিয়ে ক্লিন করে নিবেন।', '2024-09-24-66f2a0f616234.png', 'right', 1, '2024-09-24 11:22:30', '2024-09-24 11:22:30'),
(30, '24', 'আমাদের কাছ থেকে কেন কিনবেন?', '1. সম্পূর্ণ অটোমেটিক মেশিন এর ডিজিটাল প্রিন্ট এবং এমব্রয়ডারি করা।\r\n2. প্রোডাক্ট ডেলিভারির সময় মান যাচাই করবেন তারপর পেমেন্ট করবেন।\r\n3. জামা প্যান্টের কাপড় এবং ওড়নাজামা প্যান্টের কাপড় এবং ওড়না সম্পূর্ণ সুতি।\r\n4. প্রোডাক্টের ১০০% গ্যারান্টি সহকারে আমরাই নিশ্চয়তা দিয়ে বিক্রি করছি।\r\n5. প্রোডাক্টের কোন সমস্যা থাকে প্রোডাক্টের ভিডিও করে দিবেন। সমস্যা যুক্তিযুক্ত মনে করি প্রোডাক্ট এক্সচেঞ্জ করে দিব।', '2024-10-03-66fe1d8299109.png', 'left', 1, '2024-10-03 04:28:50', '2024-10-03 04:28:50'),
(31, '27', 'Test Section Title 1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit', '2024-10-03-66fe5bed24f99.png', 'left', 1, '2024-10-03 08:55:09', '2024-10-03 08:55:09'),
(32, '27', 'Test Section Title 2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit', '2024-10-03-66fe5bed3a276.png', 'right', 1, '2024-10-03 08:55:09', '2024-10-03 08:55:09'),
(33, '28', 'Test Section Title 1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem. Veritatis\r\nobcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam\r\nnihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,\r\ntenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,\r\nquia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos \r\nsapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam\r\nrecusandae alias error harum maxime adipisci amet laborum. Perspiciatis \r\nminima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit', '2024-10-03-66fe5c31655c6.png', 'right', 1, '2024-10-03 08:56:17', '2024-10-03 08:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 800, 95, 'Good', '[]', 2, 1, '2024-08-17 15:21:05', '2024-08-17 15:21:05'),
(2, 800, 95, 'Excellent', '[\"2024-08-18-66c1e060149ef.png\"]', 4, 1, '2024-08-18 11:52:00', '2024-08-18 11:52:00'),
(3, 800, 95, NULL, '[]', 1, 1, '2024-08-18 12:01:12', '2024-08-18 12:01:12'),
(4, 797, 97, 'Excellent product', '[\"2024-08-18-66c200e620c61.png\",\"2024-08-18-66c200e66c987.png\"]', 5, 1, '2024-08-18 14:10:46', '2024-08-18 14:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(34, 'test seller', 'last name', '01739921850', '2022-11-30-63877ca82e69c.png', 'jamilhossain4792@gmail.com', '$2y$10$sf/uHgPya.dKQA3iEm/i5eQN6NbCs2e3K8iVgF7D.c7jVw6rNc3B2', 'suspended', 'rKSL2p7FDNmuNvREBEMyVMlObZ6JIRsT3wdBOkhoLmOCqsEpugc6ERMQbml4', '2022-11-30 21:54:16', '2023-03-22 11:05:15', NULL, NULL, NULL, NULL, 'awY7KeRuwI9iu7Ax9QGwACzo0giZ64MfvlxFVKhQqavB4ugA0fzZOv8zd9nx7gxGaVoALoGsimE1SKf1', NULL, NULL, NULL, 0),
(35, 'AWEFE', 'IT', '01677593593', '2022-12-09-63932a037378a.png', 'skasif.info@gmail.com', '$2y$10$6rSFSG6dG9jUJzXbfJdFf.qecI5V4XfjJ6ishDgWzj5DyXGAFk05m', 'pending', NULL, '2022-12-09 18:28:51', '2022-12-09 18:28:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 'jamil', 'hossain', '01739921850', '2022-12-15-639b40fd85d9a.png', 'jamilhossain21850@gmail.com', '$2y$10$mwrv60frS76SmdBZ5PpSVuYJU/XKUNs.5KqGf3ygJAExtFz20mFkW', 'approved', NULL, '2022-12-15 21:45:01', '2022-12-15 21:45:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(34, 34, 0, 0, '2022-11-30 21:54:16', '2022-11-30 21:54:16', 0.00, 0.00, 0.00, 0.00, 0.00),
(35, 35, 0, 0, '2022-12-09 18:28:51', '2022-12-09 18:28:51', 0.00, 0.00, 0.00, 0.00, 0.00),
(36, 36, 0, 0, '2022-12-15 21:45:01', '2022-12-15 21:45:01', 0.00, 0.00, 0.00, 0.00, 0.00),
(37, 1, 0, 0, '2023-02-08 19:13:44', '2023-02-08 19:13:44', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(205, '95', 'Naemul Islam', 'home', 'badda dhaka', 'city', NULL, '01376587654', '2024-08-17 14:37:09', '2024-08-17 14:37:09', NULL, NULL, NULL, NULL, NULL),
(206, '95', 'Naemul Islam', 'home', 'dahakla', 'city', NULL, '01376587654', '2024-08-18 13:24:10', '2024-08-18 13:24:10', NULL, NULL, NULL, NULL, NULL),
(207, '95', 'Naemul Islam', 'home', 'authenticate user', 'city', NULL, '01376587674', '2024-08-18 13:50:45', '2024-08-18 13:50:45', NULL, NULL, NULL, NULL, NULL),
(208, '95', 'Arabic 2', 'home', 'Old user but not authenticate', 'city', NULL, '01376587654', '2024-08-18 13:53:00', '2024-08-18 13:53:00', NULL, NULL, NULL, NULL, NULL),
(209, '97', 'Asikum Islam', 'home', 'Uttar badda, dhaka 1212', 'city', NULL, '015098765432', '2024-08-18 14:08:19', '2024-08-18 14:08:19', NULL, NULL, NULL, NULL, NULL),
(210, '95', 'Md. Baizyd', 'home', 'dhaka bangladesh', 'city', NULL, '01376587654', '2024-08-22 14:58:52', '2024-08-22 14:58:52', NULL, NULL, NULL, NULL, NULL),
(213, '95', 'নাইমুল ইসলাম', 'home', 'Dhaka,', 'city', NULL, '01677765487', '2024-08-28 15:45:25', '2024-08-28 15:45:25', NULL, NULL, NULL, NULL, NULL),
(214, '95', 'Md. Rokibul Islam', 'home', 'Barisal patuakhali', 'city', NULL, '015098765432', '2024-08-29 10:26:52', '2024-08-29 10:26:52', NULL, NULL, NULL, NULL, NULL),
(215, '98', 'Nur Tanzir', 'home', 'Dhaka,Bangladesh', 'city', NULL, '01674437137', '2024-10-03 08:57:33', '2024-10-03 08:57:33', NULL, NULL, NULL, NULL, NULL),
(216, '98', 'Tanzir Nur', 'home', NULL, 'city', NULL, '01674437137', '2024-10-07 14:37:52', '2024-10-07 14:37:52', NULL, NULL, NULL, NULL, NULL),
(217, '98', 'Tanzir Nur', 'home', NULL, 'city', NULL, '01674437137', '2024-10-07 14:56:07', '2024-10-07 14:56:07', NULL, NULL, NULL, NULL, NULL),
(218, '98', 'Nur Tanzir', 'home', 'Dhaka,Bangladesh', 'city', NULL, '01674437137', '2024-11-14 10:42:18', '2024-11-14 10:42:18', NULL, NULL, NULL, NULL, NULL),
(219, '95', 'Md. Naemul Islam', 'home', 'asdf', 'city', NULL, '01376587654', '2024-11-27 09:25:45', '2024-11-27 09:25:45', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'admin', 'Inside Dhaka', 0.71, '2 days', 1, '2023-03-29 12:00:54', '2023-03-29 12:00:54'),
(5, 1, 'admin', 'Outside Dhaka', 1.43, '4 to 6 days', 1, '2023-03-29 12:02:02', '2023-03-29 12:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(34, 34, 'Jamil', 'Mohammadpur', '01739921850', '2022-11-30-63877ca845673.png', '2022-11-30 21:54:16', '2022-11-30 21:54:16', '2022-11-30-63877ca8457b9.png'),
(35, 35, 'AWEFE', 'Banani', '01677593593', '2022-12-09-63932a03afdf5.png', '2022-12-09 18:28:51', '2022-12-09 18:28:51', '2022-12-09-63932a03aff8f.png'),
(36, 36, 'Jamil', 'test', '01739921850', '2022-12-15-639b40fda0875.png', '2022-12-15 21:45:01', '2022-12-15 21:45:01', '2022-12-15-639b40fda0dba.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(7, 'linkedin', 'https://www.linkedin.com', 'fa fa-linkedin', 1, 1, '2024-07-30 10:20:35', '2024-07-30 10:21:05'),
(8, 'facebook', 'https://www.facebook.com/shoppingzonebd300', 'fa fa-facebook', 1, 1, '2024-08-20 15:47:34', '2024-08-20 15:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `social_pages`
--

CREATE TABLE `social_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_pages`
--

INSERT INTO `social_pages` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', 'facebook.com', 1, '2024-09-04 13:42:41', '2024-09-04 13:42:41');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, NULL, '2024-09-04 15:34:56', '2024-09-04 15:34:56'),
(2, 'naemulislam.dev@gmail.com', '2024-09-04 15:36:51', '2024-09-04 15:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 95, 'product', 'Website problem', 'Urgent', 'Hi', NULL, 'open', '2024-08-17 12:19:12', '2024-11-07 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 119, 'bd', 'name', 'Guerniss BB Cream 30ml- 40', 1),
('App\\Model\\Product', 119, 'bd', 'description', '<p>Guerniss Signature BB Cream provides you the absolute &ldquo;no makeup&rdquo; look as a makeup alternative.Without Oil and Mineral infused special formula hydrates your skin adequately and helps the complexion appear smoother.It&rsquo;s also called anti-aging hydrating cream, blemish balm or beauty balm. It provides you a natural and dewy, never heavy or cakey coverage. Due to be a lighter textured, Our BB cream is also beneficial for acne prone skin.Women often like to use BB Cream in place of foundation. Or it can also be used before using foundation for a heavy look.This product is suitable for all types of skin.</p>', 2),
('App\\Model\\Product', 121, 'bd', 'name', 'Guerniss Matte & Poreless Face Powder 15g - G010', 3),
('App\\Model\\Product', 121, 'bd', 'description', '<p>Guerniss Matte and Poreless Facepowder is a creamy, cashmere like powder that delivers a buffed, polished finish, long lasting wear in a convenient compact. It apparently lessens the look of pores and mattifies shininess while blending comfortably with your skin surface. Moreover, Our poreless powder performs to absorb oil , perfects your skin and matches tone with ease to cover your skin imperfections. This amazing powder works to keep the shine down for most of the day and never creases in your wrinkles under your eyes. It&rsquo;s super handy and comes with an integrated mirror. Match your skin tone from 6 pretty multiple shade ranges to fit your need.</p>', 4),
('App\\Model\\Product', 131, 'bd', 'name', 'Guerniss Super Fine Single Eyeshadow 2g -  AC 02', 5),
('App\\Model\\Product', 131, 'bd', 'description', '<p>magnificent and attractive eye look. The most delightful part of glitter eyeshadows is that they fulfill all ages and occasions when applied perfectly. Our long lasting glitter eyeshadow is so pigmented and extraordinary that you can feel much easier to apply and blend. Beautiful 8 shades are available in ultra-fine, silky textures with velvety color. In addition, all of these are also pearly for a soft shine, shimmering for a luminous and subtle shine, metallic for intense luminance.</p>', 6),
('App\\Model\\Product', 127, 'bd', 'name', 'Guerniss Matte Face Powder 13g - GP10', 7),
('App\\Model\\Product', 127, 'bd', 'description', '<p>Your skin naturally produces sebum or a layer of oil to keep your skin protected and moisturized. Our Matte Powder abstains your face from building excessive oil by absorbing sebum and thus leaves your make up smooth, and matte finish. It also corrects unmatched coloration and creates a defensive layer against sunscreen to keep protected from both UVA or UVB rays and environmental contaminants faced in your everyday routine. Moreover, it neither spoils your foundation nor smear your blash on face. Our Product is free of phthalates, parabens, and sulfates.</p>', 8),
('App\\Model\\Product', 128, 'bd', 'name', 'Guerniss Matte Face Powder 13g - GP30', 9),
('App\\Model\\Product', 128, 'bd', 'description', '<p>produces sebum or a layer of oil to keep your skin protected and moisturized. Our Matte Powder abstains your face from building excessive oil by absorbing sebum and thus leaves your make up smooth, and matte finish. It also corrects unmatched coloration and creates a defensive layer against sunscreen to keep protected from both UVA or UVB rays and environmental contaminants faced in your everyday routine. Moreover, it neither spoils your foundation nor smear your blash on face. Our Product is free of phthalates, parabens, and sulfates.</p>', 10),
('App\\Model\\Product', 150, 'bd', 'name', 'Guerniss VC Serum N85 30ml', 11),
('App\\Model\\Product', 150, 'bd', 'description', '<p>considered as one of the best powerhouse and anti aging skin care ingredients. Vitamin C is an antioxidant that neutralizes the free radicals or unstable molecules and consequently prevent your cell damage.Our serum effectively reduces dark spot,fine lines,wrinkles,inflammation and the appearance of discoloration,stimulates collagen production, protects skin from UV damage and ultimately reveals glow and bright skin.Total benefits also include skin sagging prevention,under eye circle reduction,wound healing boost,hyper pigmentation fading,redness diminish and skin tone evening.</p>', 12),
('App\\Model\\Product', 149, 'bd', 'name', 'Guerniss Tea Tree Oil N80 30ml', 13),
('App\\Model\\Product', 149, 'bd', 'description', '<p>can use for several purposes. To keep your skin, hair and nail healthy Tea Tree Oil is an ideal serum that also removes contractive pores from the skin and works essentially for balancing acne. Prevention and reduction of dark spots is its another benefit . Besides, It also brightens and evens the skin tone. Moreover, its other benefits include Controlling Dandruff, Soothing Skin Inflammation, using as Chemical-Free Mouthwash, Removing Nail Fungus, Wound Healing, Natural Deodorant, Insect Repellent, Hand Sanitizer, Treating Athlete&rsquo;s Foot, Relieving Psoriasis, antiseptic and many more .</p>', 14),
('App\\Model\\Product', 148, 'bd', 'name', 'Guerniss Hyaluronic Serum N90 30ml', 15),
('App\\Model\\Product', 148, 'bd', 'description', '<p>at a large scale in your skin, eyes, joints and connective tissues. Its amounts decrease with exposure to UV rays of sun, tobacco smoke, environmental contaminants and the natural process of ageing. The salient features and benefits of HA includes reducing visibility of fine line and wrinkles holding moisture to the skin, stimulating skin cell regeneration, lessening pigmentation issue, making texture smoother, tightening saggy skin, increasing resilience, enhancing lipid barrier, decreasing dermatitis, healing wounds and filling all skin layer with revitalising and boosting hydration as the most important activity. There is no known side effect issue we have found. Hyaluronic acid serum is suitable for all skin types but it&rsquo;s especially helpful for dry skin.This Product is Dermatologically Tested.</p>', 16),
('App\\Model\\Product', 145, 'bd', 'name', 'Guerniss VC Collagen Gel 120ml', 17),
('App\\Model\\Product', 145, 'bd', 'description', '<p>decreases with ages and poor diet as well. Our collagen lotion absorbs swiftly into your skin to correct the appearance of dark spots and wrinkles while helping to prevent the formation of future damage. To prevent your skin dryness, dullness, crepey skin, uneven texture, fine lines, this lotion is treated as very effective and necessary. This serum is suitable for all types of skin except acne-prone and hypersensitive skin and also dermatologically tested.</p>', 18),
('App\\Model\\Product', 240, 'bd', 'name', 'Muslin Cotton Kaftan Orna Set', 19),
('App\\Model\\Product', 240, 'bd', 'description', '<p>Muslin Cotton Kaftan Orna Set , Size:FREE, Price:950tk</p>', 20),
('App\\Model\\Product', 258, 'bd', 'name', 'Boutiques Two Piece', 21),
('App\\Model\\Product', 258, 'bd', 'description', '<p>Boutiques Two Piece, Fabric- Muslin cotton, Size - body 48,Long -46-48, Price -999tk</p>', 22),
('App\\Model\\Product', 241, 'bd', 'name', 'Muslin Cotton Kaftan Orna Set', 23),
('App\\Model\\Product', 241, 'bd', 'description', '<p>Muslin Cotton Kaftan Orna Set , Size:FREE, Price:950tk</p>', 24),
('App\\Model\\Product', 242, 'bd', 'name', 'Kurti Orna Set', 25),
('App\\Model\\Product', 242, 'bd', 'description', '<p>Kurti orna set ,Material cotton Digital print with jari embroidery, Body free size, 50 inch, Long 48 ,Price -1150tk ,</p>', 26),
('App\\Model\\Product', 243, 'bd', 'name', 'Bexi Voile Kaftan', 27),
('App\\Model\\Product', 243, 'bd', 'description', '<p>Bexi Voile Kaftan, Size free ,Long 46 ,Price -850tk</p>', 28),
('App\\Model\\Product', 244, 'bd', 'name', 'Georgette Long Shirt', 29),
('App\\Model\\Product', 244, 'bd', 'description', '<p>Georgette Long Shirt Size: 34-48 Long: 47-48 Price:780tk</p>', 30),
('App\\Model\\Product', 246, 'bd', 'name', 'Long Gher Gown', 31),
('App\\Model\\Product', 246, 'bd', 'description', '<p>Long Gher Gown, Material:Linen,Size 34 to 48 Long -52/54, Price -950tk</p>', 32),
('App\\Model\\Product', 245, 'bd', 'name', 'Shrug', 33),
('App\\Model\\Product', 245, 'bd', 'description', '<p>Exclusive shrug, Material:Georgette with net ,Size 34 to 48 Long 50plus Price -1150tk</p>', 34),
('App\\Model\\Product', 247, 'bd', 'name', 'Kurti Orna Set', 35),
('App\\Model\\Product', 247, 'bd', 'description', '<p>Kurti Orna Set Fabric: Muslin Viscos Cotton, Size:Free ,Price:1250TK</p>', 36),
('App\\Model\\Product', 248, 'bd', 'name', 'Kaftan', 37),
('App\\Model\\Product', 248, 'bd', 'description', '<p>Kaftan,Material: jacquard silk ,Size free, Long 48 ,Price -850tk</p>', 38),
('App\\Model\\Product', 249, 'bd', 'name', 'Long Gown', 39),
('App\\Model\\Product', 249, 'bd', 'description', '<p>Long Gown, Fabric: Premium Georgette, Size:34-48 ,Long:52-54, Price: 999tk</p>', 40),
('App\\Model\\Product', 250, 'bd', 'name', 'Long Gown', 41),
('App\\Model\\Product', 250, 'bd', 'description', '<p>Hijab gown, Material:georgette,Size -34 to 48, Long -52/54, Price -1050tk</p>', 42),
('App\\Model\\Product', 251, 'bd', 'name', 'Long Pocket Gown', 43),
('App\\Model\\Product', 251, 'bd', 'description', '<p>Long Pocket Gown, Material:Linen,Size 34 to 48 Long -52/54, Price -900tk</p>', 44),
('App\\Model\\Product', 252, 'bd', 'name', 'Long Rainbow Gown', 45),
('App\\Model\\Product', 252, 'bd', 'description', '<p>Long Rainbow Gown Fabric: Premium Georgette Size:34-48 Long:52-54 Price: 999tk</p>', 46),
('App\\Model\\Product', 253, 'bd', 'name', 'Designer Long Gown', 47),
('App\\Model\\Product', 253, 'bd', 'description', '<p>Designer Gown,Material:Georgette,Size 34 to 48 Long -52/54 Price -1150tk</p>', 48),
('App\\Model\\Product', 254, 'bd', 'name', 'Abaya Gown', 49),
('App\\Model\\Product', 254, 'bd', 'description', '<p>Abaya Gown, Fabric: Korean Georgette ,Size:34-48, Long:52-54, Price: 1050tk</p>', 50),
('App\\Model\\Product', 260, 'bd', 'name', 'Exclusive Party Gown', 51),
('App\\Model\\Product', 260, 'bd', 'description', '<p>Exclusive Party Gown, Fabric: Diamond Georgette ,Size:34-48, Price: 1250tk</p>', 52),
('App\\Model\\Product', 261, 'bd', 'name', 'Cotton Unstitched Two Piece Price', 53),
('App\\Model\\Product', 261, 'bd', 'description', '<p>অর্ধেক দামে আজ পাবেন মাত্র ৬০০ টাকা দুইটা নিলে ১০০ টাকা ডিসকাউন্ট Cotton Unstitched Two Piece Price: 600tk</p>', 54),
('App\\Model\\Product', 262, 'bd', 'name', 'Boutiques Two Piece', 55),
('App\\Model\\Product', 262, 'bd', 'description', '<p>Boutiques Two Piece, Fabric- Muslin cotton, Size - body 48,Long -46-48, Price -999tk</p>', 56),
('App\\Model\\Product', 256, 'bd', 'name', 'shrug cum gown', 57),
('App\\Model\\Product', 256, 'bd', 'description', '<p>shrug cum gown ,Material:Georgette, Size 34 to 48 Price -999tk</p>', 58),
('App\\Model\\Product', 257, 'bd', 'name', 'Long Gown', 59),
('App\\Model\\Product', 257, 'bd', 'description', '<p>Long HIzab Gown,Material:Georgette,Size 34 to 48 Long -52/54 Price -1150tk</p>', 60),
('App\\Model\\Product', 259, 'bd', 'name', 'Long Hizab Gown', 61),
('App\\Model\\Product', 259, 'bd', 'description', '<p>Long Hizab Gown,Fabric: Georgette, Size:34-48 ,Price: 999tk</p>', 62),
('App\\Model\\Product', 284, 'bd', 'name', 'Abaya', 63),
('App\\Model\\Product', 284, 'bd', 'description', '<p>Abaya, Size:Free ,Price: 1150tk</p>', 64),
('App\\Model\\Product', 277, 'bd', 'name', 'Abaya', 65),
('App\\Model\\Product', 277, 'bd', 'description', '<p>Abaya, Size:Free ,Price: 1150tk</p>', 66),
('App\\Model\\Product', 311, 'bd', 'name', 'Boutiques Two Piece', 67),
('App\\Model\\Product', 311, 'bd', 'description', '<p>Boutiques Two Piece, Fabric- Muslin cotton, Size - body 48,Long -46-48, Price -999tk</p>', 68),
('App\\Model\\Product', 322, 'bd', 'name', 'Boutiques Special Three Piece', 69),
('App\\Model\\Product', 322, 'bd', 'description', '<p>Boutiques Special Three Piece Fabric:Muslin Cotton Size:free Price:1299tk</p>', 70),
('App\\Model\\Product', 372, 'bd', 'name', 'Jamdani Sharee', 71),
('App\\Model\\Product', 372, 'bd', 'description', '<p>Dress Name: Jamdhani Sharee, Material: Half Silk</p>', 72),
('App\\Model\\Product', 394, 'bd', 'name', 'Cape Gown', 73),
('App\\Model\\Product', 394, 'bd', 'description', '<p>Cape Gown, Fabric:Georgette ,Size:34-48, Price:1050tk</p>', 74),
('App\\Model\\Product', 415, 'bd', 'name', 'Pakistani Cotton Three', 75),
('App\\Model\\Product', 415, 'bd', 'description', '<p>Pakistani Cotton Three Piece, Price:1380tk</p>', 76),
('App\\Model\\Product', 414, 'bd', 'name', 'Cotton Three Piece', 77),
('App\\Model\\Product', 414, 'bd', 'description', '<p>Cotton Three Piece ,Size:free ,Price:1180tk</p>', 78),
('App\\Model\\Product', 408, 'bd', 'name', 'Pakistani Cotton Three Piece', 79),
('App\\Model\\Product', 408, 'bd', 'description', '<p>Pakistani Cotton Three Piece With Embroidery Work, Size: Free, Price:1580tk</p>', 80),
('App\\Model\\Product', 417, 'bd', 'name', 'Mohua Abaya', 81),
('App\\Model\\Product', 417, 'bd', 'description', '<p>Mohua Abaya : Black &amp; Deep maroon<br />\r\nAvailable Size: 50,52,54,56<br />\r\nSize customization avaPrice: 1390 Taka onlyilable</p>', 82),
('App\\Model\\Product', 615, 'bd', 'name', 'Jamdani Sharee', 83),
('App\\Model\\Product', 615, 'bd', 'description', '<p>নাম: প্রিমিয়ার&nbsp;জামদানি শাড়ি, &nbsp;মেটেরিয়ালঃ হাফ সিল্ক,</p>\r\n\r\n<p>দাম:২৭,০০০/-।<br />\r\nমেটেরিয়াল: হাফ সিল্ক, কাউন্ট: ৮৪<br />\r\nশাড়ির সাথে ব্লাউজ পিচ আছে।এই জামদানী শাড়ি সম্পূর্ণ হাতে তৈরি।&nbsp;কাটা ওয়াশ করাতে হবে। &nbsp;পানি লাগানো যাবে না। আমাদের থেকে আপনারা যে কোন ডিজাইনের জামদানী শাড়ি বানিয়ে নিতে পারবেন আপনার পছন্দসই রঙের।<br />\r\nঅরিজিনাল ঢাকাই জামদানি শাড়ি।পাইকারি এবং খুচরা বিক্রি করা হয়। হাতে বোনা অরিজিনাল ঢাকাই জামদানি ১২ হাত শাড়ি রেশম &nbsp;এবং কটনে &nbsp;কম্বিনেশনে তৈরি প্রতিটি শাড়ি । এই শাড়ির বডিতে এবং আঁচলে গর্জিয়াস কাজ &nbsp;বাজেট ফ্রেন্ডলি ঢাকাই জামদানি। আমরা সরাসরি তাঁতিদের কাছ থেকে শাড়িগুলো বানিয়ে নিয়ে আসি।পাইকারি ও খুচরা দাম অবশ্যই ভিন্ন হবে।<br />\r\nযারা পাইকারি কিনে ব্যবসা করতে ইচ্ছুক তারা সরাসরি যোগাযোগ করুন। সরাসরি এসে দেখে কেনাকাটা করার সুযোগ আছে । আমাদের লোকেশন ঢাকা মিরপুরl&nbsp;<br />\r\nজামদানি শাড়ি খুবই এক্সক্লুসিভ শাড়ি এবং খুবই সাবধানতার সাথে এটি ব্যবহার করতে হয়। সাধারণ শাড়ির মতো এটি ব্যবহার করা যাবে না। অতীতে কখনও জামদানি শাড়ি ব্যবহার করেননি তাদের জামদানি শাড়ির একটু চিন্তা-ভাবনা করে অর্ডার করুন কারণ &nbsp;কোনো ভাবে কোনো অর্ডার ক্যান্সেল করা যাবেনা।</p>\r\n\r\n<p>জামদানী শাড়ি, থ্রি পিচ,টু পিচ,১পিচ,পাঞ্জাবি &nbsp;&nbsp;নিতে ইনবক্স করুন অথবা যোগাযোগ করুন।</p>', 84),
('App\\Model\\Product', 1, 'bd', 'name', 'T-shirt', 85),
('App\\Model\\Product', 1, 'bd', 'description', '<p>High Quality Product</p>', 86),
('App\\Model\\Product', 691, 'bd', 'name', 'Zayn & Myza Iceland Aqua Bomb Sheet Mask (20g)', 141),
('App\\Model\\Product', 691, 'bd', 'description', '<p><strong>What it is?</strong></p>\r\n\r\n<p>Made in Korea, ZM Iceland Aqua Mask is made with premium Tencel Fabric that adds an instant dewy glow to your skin without any irritation or blemishes. Packed with 8 types of Hyaluronic Acids, it infuses & retains moisture in your skin, giving it a burst of hydration in no time. Hydrate efficiently, and glow instantly!</p>\r\n\r\n<p><strong>What it does?</strong></p>\r\n\r\n<p><strong>[10-MINUTE GLOW]</strong> Hyaluronic Acid - Deeply hydrates - gives a Naturally DEWY LOOK</p>\r\n\r\n<p><strong>[DEEP HYDRATION]</strong> 8 types of Hyaluronic Acids - Penetrates Deep into the skin - making the skin PLUMP & BOUNCY </p>\r\n\r\n<p><strong>[SUPERIOR MATERIAL]</strong> Premium Tencel Fabric - comfortable to wear - with NO IRRITATION & BLEMISHES</p>\r\n\r\n<p><strong>[SUPERIOR MATERIAL]</strong> Premium Tencel Fabric - comfortable to wear - with NO IRRITATION & BLEMISHES</p>\r\n\r\n<p><strong>[SUPPLE SKIN]</strong> Glacial Water from Olfus - Rich in Minerals - HYDRATES the skin - making it BOUNCY + PLUMP. </p>', 142),
('App\\Model\\Product', 690, 'bd', 'name', 'Zayn & Myza Iceland Aqua Bomb Serum (30ml)', 143),
('App\\Model\\Product', 690, 'bd', 'description', '<p><strong>What it is:</strong></p>\r\n\r\n<p>Hydrate your skin with Glacial Natural Spring Water. Packed with high-quality drinking water sourced from Olfus Springs of Iceland, ZM Iceland Aqua Serum provides the intense hydration that your skin deserves. Inspired by the most sought-after Korean skin secrets, this lightweight serum is infused with 8 types of Hyaluronic Acid of different molecular weights that penetrate the skin to infuse and lock in moisture. </p>\r\n\r\n<p><strong>What it does:</strong></p>\r\n\r\n<p>Its quick-absorbing, water-based formula gives a natural dewy glow to your skin, keeping it smooth & supple, all day long. Give your skin a bomb of hydration and get set to bid goodbye to wrinkles and fine lines.</p>\r\n\r\n<p>Lightweight serum that provides intense hydration to your skin<br />\r\nPacked with 8 types of hyaluronic acid of different molecular weights<br />\r\nQuick-absorbing, water-based formula that gives a natural dewy glow to your skin<br />\r\nPenetrates into the deepest layer of skin to infuse and lock in moisture<br />\r\nHelps reduce wrinkles and fine lines<br />\r\nSuitable for all skin types<br />\r\nThis product is 100% vegan, dermatologically tested, and Halal certified<br />\r\nIt is free from chemical nasties, alcohol, SLS/SLES; cruelty-free</p>', 144),
('App\\Model\\Product', 689, 'bd', 'name', 'Zayn & Myza Iceland Aqua Bomb Moisturiser (50ml)', 145),
('App\\Model\\Product', 689, 'bd', 'description', '<p><strong>What it is?</strong></p>\r\n\r\n<p>Made with Glacial Natural Spring Water found in Olfus Spring in Iceland, this lightweight formula naturally hydrates your skin from within. Its quick-absorbing, non-sticky formula contains 8 types of Hyaluronic Acid of different molecular weights that penetrate the skin to infuse and lock in moisture. Formulated in Korea, the gel cream forms a moist membrane on your skin surface to give a natural dewy glow to your skin, all season long.</p>\r\n\r\n<p> </p>\r\n\r\n<p><strong>What it does?</strong></p>\r\n\r\n<p>Gel-Cream formula  forms a moist barrier  keeps skin hydrated keeps the skin FIRM & SMOOTH. </p>\r\n\r\n<p>Light & Non-sticky Gel-Cream formula  Perfect for every season</p>\r\n\r\n<p>8 types of Hyaluronic Acid  SMALL MOLECULES  Penetrates Deep  keeps skin MOISTURIZED</p>\r\n\r\n<p>Hyaluronic Acid  infuses hydration  gives NATURAL DEWY GLOW</p>\r\n\r\n<p>Hyaluronic acid  retains skin moisture  fights fine lines, wrinkles & other signs of ageing </p>\r\n\r\n<p>Glacial Water from Olfus  Rich in Minerals  HYDRATES the skin  making it BOUNCY + PLUMP. </p>\r\n\r\n<p>CRUELTY-FREE  NO CHEMICAL NASTIES  SAFE TO USE  DERMATOLOGICALLY TESTED  NO SKIN IRRITANTS. No Parabens, No Sulphates, or other harmful chemicals, you can use this product with complete confidence.</p>', 146),
('App\\Model\\Product', 696, 'bd', 'name', 'Maslice Cotton White', 149),
('App\\Model\\Product', 696, 'bd', 'description', '<p>Maslice Cotton saree is a type of saree made from a lightweight cotton fabric known as Maslice cotton. Maslice cotton is a blend of cotton and silk, which gives it a lustrous finish and a soft feel. The fabric is breathable, making it suitable for wearing in warm weather.</p>\r\n\r\n<p>Maslice Cotton sarees are known for their intricate designs and vibrant colors. The sarees often feature traditional motifs such as paisleys, flowers, and geometric patterns, and are popular among women for their elegant and sophisticated look.</p>\r\n\r\n<p>The Maslice Cotton saree is a popular choice for casual and formal occasions, and can be styled in a variety of ways. They are often paired with a matching blouse and accessorized with traditional jewelry such as bangles, earrings, and necklaces.</p>\r\n\r\n<p>Maslice Cotton sarees are produced in various parts of India, including West Bengal, Assam, and Tamil Nadu. They are a popular choice for women who want to wear a comfortable and stylish saree.</p>', 150),
('App\\Model\\Product', 697, 'bd', 'name', 'Aarong Cotton Saree', 151),
('App\\Model\\Product', 697, 'bd', 'description', '<p>Aarong Cotton saree is a type of saree made from cotton fabric that is sold by Aarong, a popular retail chain in Bangladesh. Aarong is known for promoting traditional Bangladeshi handloom textiles and handicrafts, and their cotton sarees are no exception.</p>\r\n\r\n<p>Aarong Cotton sarees are made from high-quality cotton that is sourced from different regions of Bangladesh. The sarees are known for their soft and comfortable texture, which makes them ideal for wearing in warm weather. The sarees come in a range of colors and designs, from simple and elegant to bold and vibrant.</p>\r\n\r\n<p>Aarong Cotton sarees often feature traditional Bangladeshi designs and motifs, such as geometric patterns, floral designs, and abstract art. They are typically handwoven by skilled artisans using traditional techniques, which gives them a unique and authentic look.</p>\r\n\r\n<p>Aarong Cotton sarees are a popular choice for women who want to wear a comfortable and stylish saree that is also ethically made. Aarong is committed to promoting fair trade and sustainable development in Bangladesh, and their cotton sarees are a reflection of this commitment.</p>', 152),
('App\\Model\\Product', 699, 'bd', 'name', 'Half-Silk Jamdani Black', 153),
('App\\Model\\Product', 699, 'bd', 'description', '<p>Premium Half-Silk Jamdani is a type of fabric that is known for its intricate designs and luxurious feel. It is a traditional textile from Bangladesh and is woven by hand on a loom. The fabric is made by weaving cotton or silk threads with the additional use of a supplementary weft technique, which creates the intricate designs on the fabric.</p>\r\n\r\n<p>The half-silk Jamdani fabric is made by using a combination of silk and cotton threads, which gives it a lustrous finish and a soft feel. The fabric is lightweight and breathable, making it perfect for warm weather clothing such as sarees, kurtas, and dupattas.</p>\r\n\r\n<p>The Jamdani weaving technique is a time-consuming process that requires skilled artisans to create the intricate designs on the fabric. The motifs on the fabric are often inspired by nature and depict flowers, birds, and other natural elements.</p>\r\n\r\n<p>Premium Half-Silk Jamdani is considered a luxurious fabric due to its intricate designs, soft feel, and lustrous finish. It is often used to create high-end garments and is popular among fashion designers and textile enthusiasts.</p>', 154),
('App\\Model\\Product', 698, 'bd', 'name', 'Maslice Cotton Deep Red', 155),
('App\\Model\\Product', 698, 'bd', 'description', '<p>Maslice Cotton saree is a type of saree made from a lightweight cotton fabric known as Maslice cotton. Maslice cotton is a blend of cotton and silk, which gives it a lustrous finish and a soft feel. The fabric is breathable, making it suitable for wearing in warm weather.</p>\r\n\r\n<p>Maslice Cotton sarees are known for their intricate designs and vibrant colors. The sarees often feature traditional motifs such as paisleys, flowers, and geometric patterns, and are popular among women for their elegant and sophisticated look.</p>\r\n\r\n<p>The Maslice Cotton saree is a popular choice for casual and formal occasions, and can be styled in a variety of ways. They are often paired with a matching blouse and accessorized with traditional jewelry such as bangles, earrings, and necklaces.</p>\r\n\r\n<p>Maslice Cotton sarees are produced in various parts of India, including West Bengal, Assam, and Tamil Nadu. They are a popular choice for women who want to wear a comfortable and stylish saree.</p>', 156),
('App\\Model\\Product', 695, 'bd', 'name', 'Premium Half-Silk Jamdani (Deep Red)', 157),
('App\\Model\\Product', 695, 'bd', 'description', '<p>Premium Half-Silk Jamdani is a type of fabric that is known for its intricate designs and luxurious feel. It is a traditional textile from Bangladesh and is woven by hand on a loom. The fabric is made by weaving cotton or silk threads with the additional use of a supplementary weft technique, which creates the intricate designs on the fabric.</p>\r\n\r\n<p>The half-silk Jamdani fabric is made by using a combination of silk and cotton threads, which gives it a lustrous finish and a soft feel. The fabric is lightweight and breathable, making it perfect for warm weather clothing such as sarees, kurtas, and dupattas.</p>\r\n\r\n<p>The Jamdani weaving technique is a time-consuming process that requires skilled artisans to create the intricate designs on the fabric. The motifs on the fabric are often inspired by nature and depict flowers, birds, and other natural elements.</p>\r\n\r\n<p>Premium Half-Silk Jamdani is considered a luxurious fabric due to its intricate designs, soft feel, and lustrous finish. It is often used to create high-end garments and is popular among fashion designers and textile enthusiasts.</p>', 158),
('App\\Model\\Product', 703, 'bd', 'name', 'Premium Half Slik Jamdani', 159),
('App\\Model\\Product', 703, 'bd', 'description', '<p>A premium half silk jamdani saree is a high-quality, handwoven saree made using a blend of silk and cotton threads, with intricate designs and motifs created using the jamdani weaving technique.</p>\r\n\r\n<p>Premium half silk jamdani sarees are known for their superior quality and craftsmanship, and are often more expensive than regular half silk jamdani sarees. They are made using the finest quality silk and cotton threads, and the designs on the saree are often more intricate and complex, with greater attention to detail.</p>\r\n\r\n<p>These sarees are typically available in a wide range of colors, ranging from soft pastels to bold and vibrant hues. They are often adorned with intricate embroidery, sequins, or beadwork, which adds to their premium look and feel.</p>\r\n\r\n<p>Due to their premium quality and exquisite designs, these sarees are often worn on special occasions, such as weddings, festivals, and formal events. They are considered to be a timeless and elegant piece of clothing, and are often passed down from generation to generation as family heirlooms.</p>', 160),
('App\\Model\\Product', 701, 'bd', 'name', 'Premium Half Slik Jamdani (Black)', 161),
('App\\Model\\Product', 701, 'bd', 'description', '<p>A premium half silk jamdani saree is a high-quality, handwoven saree made using a blend of silk and cotton threads, with intricate designs and motifs created using the jamdani weaving technique.</p>\r\n\r\n<p>Premium half silk jamdani sarees are known for their superior quality and craftsmanship, and are often more expensive than regular half silk jamdani sarees. They are made using the finest quality silk and cotton threads, and the designs on the saree are often more intricate and complex, with greater attention to detail.</p>\r\n\r\n<p>These sarees are typically available in a wide range of colors, ranging from soft pastels to bold and vibrant hues. They are often adorned with intricate embroidery, sequins, or beadwork, which adds to their premium look and feel.</p>\r\n\r\n<p>Due to their premium quality and exquisite designs, these sarees are often worn on special occasions, such as weddings, festivals, and formal events. They are considered to be a timeless and elegant piece of clothing, and are often passed down from generation to generation as family heirlooms.</p>', 162),
('App\\Model\\Product', 709, 'bd', 'name', 'Half-Silk Monipuri Sharee', 163),
('App\\Model\\Product', 709, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 164),
('App\\Model\\Product', 720, 'bd', 'name', 'Half-Silk Monipuri Sharee', 165),
('App\\Model\\Product', 720, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 166),
('App\\Model\\Product', 719, 'bd', 'name', 'Half-Silk Monipuri Sharee', 167),
('App\\Model\\Product', 719, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 168),
('App\\Model\\Product', 718, 'bd', 'name', 'Half-Silk Monipuri Sharee', 169),
('App\\Model\\Product', 718, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 170),
('App\\Model\\Product', 717, 'bd', 'name', 'Half-Silk Monipuri Sharee', 171),
('App\\Model\\Product', 717, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 172),
('App\\Model\\Product', 716, 'bd', 'name', 'Half-Silk Monipuri Sharee', 173),
('App\\Model\\Product', 716, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 174),
('App\\Model\\Product', 715, 'bd', 'name', 'Half-Silk Monipuri Sharee', 175),
('App\\Model\\Product', 715, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 176),
('App\\Model\\Product', 714, 'bd', 'name', 'Half-Silk Monipuri Sharee', 177),
('App\\Model\\Product', 714, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 178),
('App\\Model\\Product', 713, 'bd', 'name', 'Half-Silk Monipuri Sharee', 179),
('App\\Model\\Product', 713, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 180),
('App\\Model\\Product', 712, 'bd', 'name', 'Half-Silk Monipuri Sharee', 181),
('App\\Model\\Product', 712, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 182),
('App\\Model\\Product', 711, 'bd', 'name', 'Half-Silk Monipuri Sharee', 183),
('App\\Model\\Product', 711, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 184),
('App\\Model\\Product', 710, 'bd', 'name', 'Half-Silk Monipuri Sharee', 185),
('App\\Model\\Product', 710, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 186),
('App\\Model\\Product', 708, 'bd', 'name', 'Maslice Cotton Saree', 187),
('App\\Model\\Product', 708, 'bd', 'description', '<p>Maslice cotton saree is a type of Indian saree that is made from a fabric called Maslice cotton. Maslice cotton is a lightweight and breathable cotton fabric that is commonly used to make sarees and other traditional Indian garments.</p></p>\r\n\r\n<p>Maslice cotton sarees are known for their softness, comfort, and elegant drape. They are often adorned with intricate patterns, embroidery, and embellishments, and come in a wide range of colors and designs. Maslice cotton sarees are popular among women of all ages, and are often worn for formal occasions, such as weddings and religious ceremonies, as well as for everyday wear.</p></p>', 188),
('App\\Model\\Product', 707, 'bd', 'name', 'Premium Half Slik Jamdani Saree Royal Red', 189),
('App\\Model\\Product', 707, 'bd', 'description', '<p>A premium half-silk jamdani saree is a type of traditional Indian saree that is made from a combination of silk and cotton, with intricate jamdani weaving patterns. The half-silk version typically has a cotton warp and a silk weft, resulting in a luxurious yet lightweight fabric that drapes beautifully. Jamdani is a time-intensive and skilled weaving technique that involves creating patterns on the loom using a supplementary weft, which is woven into the fabric by hand.</p>\r\n\r\n<p>A premium half-silk jamdani saree would likely feature elaborate designs and motifs, with fine details and high-quality materials. The cost of such a saree can vary depending on the specific design, the level of craftsmanship involved, and the quality of the silk and cotton used. Overall, a premium half-silk jamdani saree is a beautiful and luxurious garment that is highly valued in Indian culture.</p>', 190),
('App\\Model\\Product', 706, 'bd', 'name', 'Aarong Cotton Off-white Orange', 191),
('App\\Model\\Product', 706, 'bd', 'description', '<p>Aarong is a popular retail chain in Bangladesh that specializes in handmade and handcrafted products made by local artisans. Aarong cotton sarees are a type of traditional Bangladeshi saree that are made from high-quality cotton and are known for their intricate designs and patterns.</p>\r\n\r\n<p>Aarong cotton sarees are often made using traditional weaving techniques and feature a wide range of colors and designs, including floral, paisley, and geometric patterns. They are known for their softness, comfort, and durability, and are a popular choice for women who prefer traditional, handmade garments.</p>\r\n\r\n<p>In addition to cotton sarees, Aarong also offers a wide range of other handmade products, including clothing, accessories, home decor items, and more. The brand is committed to promoting sustainable, ethical, and fair trade practices, and works closely with local artisans to create unique, high-quality products that showcase the rich cultural heritage of Bangladesh.</p>', 192),
('App\\Model\\Product', 705, 'bd', 'name', 'Maslice Cotton Saree Navy Blue Golden', 193),
('App\\Model\\Product', 705, 'bd', 'description', '<p>Maslice cotton saree is a type of Indian saree that is made from a fabric called Maslice cotton. Maslice cotton is a lightweight and breathable cotton fabric that is commonly used to make sarees and other traditional Indian garments.</p>\r\n\r\n<p>Maslice cotton sarees are known for their softness, comfort, and elegant drape. They are often adorned with intricate patterns, embroidery, and embellishments, and come in a wide range of colors and designs. Maslice cotton sarees are popular among women of all ages, and are often worn for formal occasions, such as weddings and religious ceremonies, as well as for everyday wear.</p>', 194),
('App\\Model\\Product', 704, 'bd', 'name', 'Premium Half-Silk Jamdani Saree Yellow', 195),
('App\\Model\\Product', 704, 'bd', 'description', '<p>A Premium Half-Silk Jamdani saree is a type of traditional Indian saree made from a combination of silk and cotton fabric. The Jamdani weave is a technique where the design is woven into the fabric rather than printed on it, resulting in intricate and delicate patterns.</p>\r\n\r\n<p>The half-silk Jamdani saree is a luxurious and lightweight saree, perfect for special occasions such as weddings, parties, and formal events. The silk adds a touch of elegance and shimmer to the fabric, while the cotton makes it breathable and comfortable to wear.</p>\r\n\r\n<p>The Jamdani weave is a traditional art form that originated in Bangladesh and is now widely practiced in India. The weavers use a small, hand-operated loom to create the intricate patterns, which can take days or even weeks to complete.</p>\r\n\r\n<p>The Premium Half-Silk Jamdani saree is a beautiful and timeless piece of clothing that can be passed down through generations. It is a testament to the skill and craftsmanship of the weavers who create it, and a celebration of the rich cultural heritage of India and Bangladesh.</p>', 196),
('App\\Model\\Product', 702, 'bd', 'name', 'Dhupian Saree (Royal Blue)', 197),
('App\\Model\\Product', 702, 'bd', 'description', '<p>Dhupian saree is a type of saree that is made using a special weaving technique, which gives it a unique texture and appearance. It is a popular variety of silk saree, which is commonly worn by women in India, particularly for special occasions such as weddings and festivals.</p>\r\n\r\n<p>Dhupian sarees are made using a combination of silk and cotton threads, which gives them a smooth and lustrous finish. The weaving technique used to make these sarees creates a subtle striped pattern, which gives the saree a beautiful and elegant look.</p>\r\n\r\n<p>One of the key features of Dhupian sarees is their durability and resilience. They are designed to withstand wear and tear, and can be easily maintained with regular care. They are also known for their comfort, as the combination of silk and cotton makes them breathable and easy to wear for long periods of time.</p>\r\n\r\n<p>Dhupian sarees are available in a wide range of colors and designs, ranging from simple and elegant to bold and ornate. They are often embellished with intricate embroidery or sequin work, which adds to their beauty and appeal. Overall, Dhupian sarees are considered to be a classic and timeless piece of clothing that is suitable for a variety of occasions.</p>', 198),
('App\\Model\\Product', 700, 'bd', 'name', 'Premium Half Slik Jamdani (Olive)', 199);
INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 700, 'bd', 'description', '<p>A premium half silk jamdani saree is a high-quality, handwoven saree made using a blend of silk and cotton threads, with intricate designs and motifs created using the jamdani weaving technique.</p>\r\n\r\n<p>Premium half silk jamdani sarees are known for their superior quality and craftsmanship, and are often more expensive than regular half silk jamdani sarees. They are made using the finest quality silk and cotton threads, and the designs on the saree are often more intricate and complex, with greater attention to detail.</p>\r\n\r\n<p>These sarees are typically available in a wide range of colors, ranging from soft pastels to bold and vibrant hues. They are often adorned with intricate embroidery, sequins, or beadwork, which adds to their premium look and feel.</p>\r\n\r\n<p>Due to their premium quality and exquisite designs, these sarees are often worn on special occasions, such as weddings, festivals, and formal events. They are considered to be a timeless and elegant piece of clothing, and are often passed down from generation to generation as family heirlooms.</p>', 200),
('App\\Model\\Product', 730, 'bd', 'name', 'Maslice Cotton Sharee', 203),
('App\\Model\\Product', 730, 'bd', 'description', '<p>These sarees are made from high-quality cotton fabrics and come in a variety of designs and colors. They are available in both printed and hand-embroidered styles, and often feature traditional motifs and patterns.</p>\r\n\r\n<p>Maslice cotton sarees are popular among women in Bangladesh for their versatility and comfort, and are often worn for both casual and formal occasions. They are also a popular choice for daily wear, as they are easy to care for and can withstand frequent washing.</p>\r\n\r\n<p>Overall, Maslice cotton sarees are a great option for women looking for affordable, comfortable, and stylish sarees in Bangladesh.</p>', 204),
('App\\Model\\Product', 733, 'bd', 'name', 'Premium Half Silk Jamdani Sharee', 205),
('App\\Model\\Product', 733, 'bd', 'description', '<p>A Premium Half-Silk Jamdani saree is a type of traditional Indian saree made from a combination of silk and cotton fabric. The Jamdani weave is a technique where the design is woven into the fabric rather than printed on it, resulting in intricate and delicate patterns.</p>\r\n\r\n<p>The half-silk Jamdani saree is a luxurious and lightweight saree, perfect for special occasions such as weddings, parties, and formal events. The silk adds a touch of elegance and shimmer to the fabric, while the cotton makes it breathable and comfortable to wear.</p>\r\n\r\n<p>The Jamdani weave is a traditional art form that originated in Bangladesh and is now widely practiced in India. The weavers use a small, hand-operated loom to create the intricate patterns, which can take days or even weeks to complete.</p>\r\n\r\n<p>The Premium Half-Silk Jamdani saree is a beautiful and timeless piece of clothing that can be passed down through generations. It is a testament to the skill and craftsmanship of the weavers who create it, and a celebration of the rich cultural heritage of India and Bangladesh.</p>', 206),
('App\\Model\\Product', 728, 'bd', 'name', 'Half-Silk Jamdani Sharee Black', 207),
('App\\Model\\Product', 728, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 208),
('App\\Model\\Product', 727, 'bd', 'name', 'Half-Silk Jamdani Sharee', 209),
('App\\Model\\Product', 727, 'bd', 'description', '<p>A half silk Monipuri saree is a traditional saree made from the half silk Monipuri fabric. It is a popular choice for special occasions such as weddings, festivals, and other cultural events.</p>\r\n\r\n<p>The saree typically features intricate designs and motifs that are handwoven onto the fabric. These designs can range from geometric patterns to floral and animal motifs, and often incorporate a mix of bright and bold colors.</p>\r\n\r\n<p>The half silk Monipuri saree is known for its unique texture and lustrous finish, which is a result of the combination of silk and cotton fibers used in its production. The cotton fibers provide durability and strength to the fabric, while the silk fibers add a soft and luxurious feel.</p>\r\n\r\n<p>The saree is draped in a traditional style, with the fabric wrapped around the waist and draped over the shoulder. It is often paired with a matching blouse and accessories such as bangles and earrings to complete the traditional look.</p>\r\n\r\n<p>Overall, the half silk Monipuri saree is a beautiful and timeless piece of traditional clothing that showcases the rich cultural heritage of the Monipuri tribe.</p>', 210),
('App\\Model\\Product', 738, 'bd', 'name', 'Maslice Cotton Sharee', 211),
('App\\Model\\Product', 738, 'bd', 'description', '<p>Maslice cotton saree is a type of cotton saree that is popular in India. It is made from a lightweight and breathable cotton fabric that is comfortable to wear in hot and humid weather. The word \"maslice\" is derived from the Bengali language and refers to the fine texture of the cotton fabric used to make the saree.</p>\r\n\r\n<p>The Maslice cotton saree is known for its softness and sheen. It is typically woven using a plain weave and is decorated with simple, yet elegant designs. The saree is available in a wide range of colors and patterns, making it a versatile choice for different occasions.</p>\r\n\r\n<p>This type of saree is popular among women in India as it is easy to drape and can be worn for both casual and formal occasions. It is often paired with simple jewelry and a blouse to complete the traditional look.</p>\r\n\r\n<p>The Maslice cotton saree is also a popular choice for summer weddings and other outdoor events. The lightweight fabric makes it comfortable to wear for long hours, while the simple yet elegant designs make it a stylish option for any occasion.</p>', 212),
('App\\Model\\Product', 737, 'bd', 'name', 'Maslice Cotton Sharee', 213),
('App\\Model\\Product', 737, 'bd', 'description', '<p>Maslice cotton saree is a type of cotton saree that is popular in India. It is made from a lightweight and breathable cotton fabric that is comfortable to wear in hot and humid weather. The word \"maslice\" is derived from the Bengali language and refers to the fine texture of the cotton fabric used to make the saree.</p>\r\n\r\n<p>The Maslice cotton saree is known for its softness and sheen. It is typically woven using a plain weave and is decorated with simple, yet elegant designs. The saree is available in a wide range of colors and patterns, making it a versatile choice for different occasions.</p>\r\n\r\n<p>This type of saree is popular among women in India as it is easy to drape and can be worn for both casual and formal occasions. It is often paired with simple jewelry and a blouse to complete the traditional look.</p>\r\n\r\n<p>The Maslice cotton saree is also a popular choice for summer weddings and other outdoor events. The lightweight fabric makes it comfortable to wear for long hours, while the simple yet elegant designs make it a stylish option for any occasion.</p>', 214),
('App\\Model\\Product', 748, 'bd', 'name', 'Indian Catalog Dress 9', 217),
('App\\Model\\Product', 748, 'bd', 'description', '<p>Fabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 218),
('App\\Model\\Product', 746, 'bd', 'name', 'Indian Catalog Dress 8', 219),
('App\\Model\\Product', 746, 'bd', 'description', '<p>Discover the allure of Indian three-piece ensembles with our captivating meta description. Explore the rich heritage and intricate craftsmanship of these mesmerizing garments. Immerse yourself in the world of vibrant colors, exquisite embellishments, and timeless elegance. Experience the fusion of tradition and modernity as you delve into the story behind these iconic pieces. Uncover the secrets of Indian fashion and unleash your inner fashionista with the enigmatic charm of a three-piece masterpiece</p>', 220),
('App\\Model\\Product', 743, 'bd', 'name', 'Indian Catalog Dress 5', 221),
('App\\Model\\Product', 743, 'bd', 'description', '<p>Fabric: Soft Chundri<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 222),
('App\\Model\\Product', 750, 'bd', 'name', 'Indian Catalog Dress 12', 223),
('App\\Model\\Product', 750, 'bd', 'description', '<p>Fabric: Soft Chundri<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 224),
('App\\Model\\Product', 749, 'bd', 'name', 'Indian Catalog Dress 10', 225),
('App\\Model\\Product', 749, 'bd', 'description', '<p>Fabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 226),
('App\\Model\\Product', 747, 'bd', 'name', 'Indian Catalog Dress 8', 227),
('App\\Model\\Product', 747, 'bd', 'description', '<p>Fabric: Soft Chundri<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 228),
('App\\Model\\Product', 745, 'bd', 'name', 'Indian Catalog Dress 7', 229),
('App\\Model\\Product', 745, 'bd', 'description', '<p>Fabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 230),
('App\\Model\\Product', 744, 'bd', 'name', 'Indian Catalog Dress 6', 231),
('App\\Model\\Product', 744, 'bd', 'description', '<p>Fabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 232),
('App\\Model\\Product', 742, 'bd', 'name', 'Indian Catalog Dress 4', 233),
('App\\Model\\Product', 742, 'bd', 'description', '<p>Fabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 234),
('App\\Model\\Product', 741, 'bd', 'name', 'Indian Catalog Dress 3', 235),
('App\\Model\\Product', 741, 'bd', 'description', '<p>India catalog dress<br />\r\nFabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch</p>', 236),
('App\\Model\\Product', 740, 'bd', 'name', 'India catalog Dress 2', 237),
('App\\Model\\Product', 740, 'bd', 'description', '<p>India catalog dress<br />\r\nFabric: Soft Net<br />\r\nBottom & Inner: Butterfly<br />\r\nDupatta: Soft Net<br />\r\nCondition: Unstitch<br />\r\n </p>', 238),
('App\\Model\\Product', 752, 'bd', 'name', 'India catalog Dress 13', 239),
('App\\Model\\Product', 752, 'bd', 'description', '<p><p>India catalog dress<br /><br />\r\nFabric: Soft Net<br /><br />\r\nBottom & Inner: Butterfly<br /><br />\r\nDupatta: Soft Net<br /><br />\r\nCondition: Unstitch<br /><br />\r\n </p></p>', 240),
('App\\Model\\Product', 754, 'bd', 'name', 'Silk Premium Skin Print Sharee', 241),
('App\\Model\\Product', 754, 'bd', 'description', '<p>The term \"Premium Silk Skin Print Sharee\" suggests a high-quality silk saree (also spelled sharee) with a skin print design. Silk sarees are traditional Indian garments known for their elegance and luxurious feel. They are typically made from pure silk fabric and are popular for special occasions and festivities.</p>\r\n\r\n<p>A skin print design could refer to a pattern that resembles the texture or pattern found on human skin. It could include various designs like animal prints, reptile scales, or abstract textures inspired by the human body.</p>\r\n\r\n<p>It\'s important to note that specific saree designs and collections can vary based on the brand, region, and current fashion trends. If you are looking for a Premium Silk Skin Print Sharee, I would recommend exploring various fashion brands, boutiques, or online retailers that specialize in silk sarees. They may have a selection of sarees with unique skin print designs or can customize one based on your preferences.</p>', 242),
('App\\Model\\Product', 751, 'bd', 'name', 'India catalog Dress 12', 243),
('App\\Model\\Product', 751, 'bd', 'description', '<p><p>India catalog dress<br /><br />\r\nFabric: Soft Net<br /><br />\r\nBottom & Inner: Butterfly<br /><br />\r\nDupatta: Soft Net<br /><br />\r\nCondition: Unstitch<br /><br />\r\n </p></p>', 244),
('App\\Model\\Product', 773, 'bd', 'name', 'Women Top Bottom Set', 245),
('App\\Model\\Product', 773, 'bd', 'description', '<p>Top: A comfortable and versatile option for a casual look is a solid-colored, relaxed-fit t-shirt. Choose a classic crew neck or V-neck style in a color that suits your preferences and complements your complexion. Opt for a fabric like cotton or a blend that provides breathability and comfort. You can also consider adding some visual interest by selecting a top with a subtle pattern or a graphic print.</p>\r\n\r\n<p>Bottom: To complete the set, a pair of denim jeans or casual pants would be a great choice. If you prefer jeans, go for a medium wash or a classic blue color. Opt for a straight leg or a slim fit style, depending on your body shape and personal preference. Alternatively, you can choose casual pants made of lightweight materials like cotton or linen for a relaxed and comfortable feel. Consider a pair of chinos or joggers for a trendy yet casual look.</p>\r\n\r\n<p>To enhance the overall outfit, you can add accessories like a simple necklace or hoop earrings, a wristwatch, and a pair of comfortable sneakers or flats. Layering with a lightweight cardigan or a denim jacket can be a great option for cooler weather or a more layered look.</p>\r\n\r\n<p>Remember, personal style is subjective, so feel free to customize the outfit according to your preferences and individual fashion sense.</p>', 246),
('App\\Model\\Product', 783, 'bd', 'name', 'Jamdani Sharee', 247),
('App\\Model\\Product', 783, 'bd', 'description', 'test', 248),
('App\\Model\\Product', 801, 'bd', 'name', 'Long shirt', 249),
('App\\Model\\Product', 801, 'bd', 'description', '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 250),
('App\\Model\\Product', 800, 'bd', 'name', 'Long shirt', 251),
('App\\Model\\Product', 800, 'bd', 'description', '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 252),
('App\\Model\\Product', 798, 'bd', 'name', 'Designer Co-ords Set', 253),
('App\\Model\\Product', 798, 'bd', 'description', 'Fixed body M36 L 40 XL 44 XXL 48. Long 42/44 🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 254),
('App\\Model\\Product', 799, 'bd', 'name', 'Beautiful Co-ords Set', 255),
('App\\Model\\Product', 799, 'bd', 'description', 'Fixed body M36 L 40 XL 44 XXL 48. Long 40/42 🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 256),
('App\\Model\\Product', 803, 'bd', 'name', 'Kurti', 257),
('App\\Model\\Product', 803, 'bd', 'description', 'Kurti', 258),
('App\\Model\\Product', 807, 'bd', 'name', 'Beauty Glazed Long Lasting 8pcs Matte Lipstick Set', 259),
('App\\Model\\Product', 807, 'bd', 'description', 'Beauty Glazed Long Lasting 8pcs Matte Lipstick Set', 260),
('App\\Model\\Product', 808, 'bd', 'name', 'Beauty Glazed mud', 261),
('App\\Model\\Product', 808, 'bd', 'description', 'Beauty Glazed mud', 262),
('App\\Model\\Product', 797, 'bd', 'name', 'Shrug with Inner', 263),
('App\\Model\\Product', 797, 'bd', 'description', 'Fixed body M36 L 40 XL 44 XXL 48. Long 52/54🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 264),
('App\\Model\\Product', 796, 'bd', 'name', 'Co ords', 265),
('App\\Model\\Product', 796, 'bd', 'description', '🛒অর্ডার করতে কল করুন আমাদের হট লাইন নাম্বার এ ☎ +88 01406-667669 অথবা আমাদের ইনবক্স করুন। ডেলিভারী পদ্ধতি = 👉 ঢাকায়--------------> হোম ডেলিভারী, 👉 ঢাকার বাইরে------>কন্ডিশন কুরিয়ার, ডেলভারী চার্জ-----> ঢাকায় = ৮০ টাকা, ঢাকার বাইরে = ১৫০ টাকা।', 266),
('App\\Model\\Product', 817, 'bd', 'name', 'test products 3', 267),
('App\\Model\\Product', 817, 'bd', 'description', '<p>sdfsa fsdfsadf</p>', 268),
('App\\Model\\Product', 820, 'bd', 'name', 'Long shirt test', 269),
('App\\Model\\Product', 823, 'bd', 'name', 'asdfsfd', 270),
('App\\Model\\Product', 802, 'bd', 'name', 'Women Top Bottom Sets', 271),
('App\\Model\\Product', 802, 'bd', 'description', 'test', 272);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `otp` varchar(60) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `otp`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(95, NULL, 'Md. Naemul', 'Islam Naem', '01376587654', 'def.png', 'naemulislam.dev@gmail.com', NULL, NULL, '$2y$10$rbbyHL2TrG3wF.GqUMXr/OCuuUoDB/UlSwHQuhzyQye1iz0t335q.', '33GYtqb6nbAILwcXd5CJn5T3W1uXcRPxYg2eNcuBZ0p4kVND2t1ZPblgkcEl', '2024-08-17 12:13:24', '2024-11-27 13:20:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0.00),
(97, NULL, 'Asikum Islam', 'bd1720649828', '015098765432', 'def.png', 'asikulislam@gmail.com', NULL, NULL, '$2y$10$Qvq4jbFA7gfK3fVezhUNEuKHTUwhrjWUcQGCNtU8FvX6BntzCvA3O', 'GkBLuxscrSchJZJBofvflEvsIAdhoSajdq2Al5YGDHbvrGmsi0P4V8xeOizu', '2024-08-18 14:08:19', '2024-08-18 14:08:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(98, NULL, 'Nur Tanzir', 'bd822236167', '01674437137', 'def.png', 'tanzirnur@gmail.com', NULL, NULL, '$2y$10$Eg1gFAse0f9XczPDNcexoudZuxQKX.JeeEem4jvga.CCY2nYQ7hzO', '6Fk3o7tn5R0ldl0ZoAN4UidcUf7dLngKXsAlx9oIlbiikV2oEedx6iluNmYS', '2024-10-03 08:57:33', '2024-10-03 08:57:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `admin_bonus`, `balance`, `transaction_type`, `reference`, `created_at`, `updated_at`) VALUES
(1, 17, 'c89e7111-9c41-4e5b-b79c-c6145da13b9c', 59.524, 0.000, 0.000, 59.524, 'add_fund_by_admin', 'sdfsf', '2023-03-21 19:50:29', '2023-03-21 19:50:29'),
(2, 31, 'ee7639c1-6114-42ec-8184-75cd003fe596', 1.190, 0.000, 0.000, 1.190, 'add_fund_by_admin', NULL, '2023-03-23 13:20:49', '2023-03-23 13:20:49'),
(3, 31, '1a6a3631-6d08-4dbe-b131-6b0af98fc49d', 11.905, 0.000, 0.000, 13.095, 'add_fund_by_admin', NULL, '2023-03-23 13:22:45', '2023-03-23 13:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(14, 97, 801, '2024-08-18 15:41:37', '2024-08-18 15:41:37'),
(18, 95, 798, '2024-08-28 14:03:31', '2024-08-28 14:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaing_detalies`
--
ALTER TABLE `campaing_detalies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_reviews`
--
ALTER TABLE `client_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `facebook_posts`
--
ALTER TABLE `facebook_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_pages_products`
--
ALTER TABLE `landing_pages_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_adds`
--
ALTER TABLE `meta_adds`
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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_exchanges`
--
ALTER TABLE `order_exchanges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_exchange_details`
--
ALTER TABLE `order_exchange_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_payment_types`
--
ALTER TABLE `pos_payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_campans`
--
ALTER TABLE `product_campans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_landing_pages`
--
ALTER TABLE `product_landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_landing_page_sections`
--
ALTER TABLE `product_landing_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_pages`
--
ALTER TABLE `social_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `campaing_detalies`
--
ALTER TABLE `campaing_detalies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2830;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `client_reviews`
--
ALTER TABLE `client_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facebook_posts`
--
ALTER TABLE `facebook_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `landing_pages_products`
--
ALTER TABLE `landing_pages_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `meta_adds`
--
ALTER TABLE `meta_adds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100108;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `order_exchanges`
--
ALTER TABLE `order_exchanges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100108;

--
-- AUTO_INCREMENT for table `order_exchange_details`
--
ALTER TABLE `order_exchange_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_payment_types`
--
ALTER TABLE `pos_payment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=828;

--
-- AUTO_INCREMENT for table `product_campans`
--
ALTER TABLE `product_campans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_landing_pages`
--
ALTER TABLE `product_landing_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_landing_page_sections`
--
ALTER TABLE `product_landing_page_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `social_pages`
--
ALTER TABLE `social_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
