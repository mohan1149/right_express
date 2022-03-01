-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2021 at 06:10 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poshs`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(38, 'default', 'edited', 705, 'App\\Transaction', 1, 'App\\User', '[]', '2021-05-31 18:06:22', '2021-05-31 18:06:22'),
(39, 'default', 'edited', 744, 'App\\Transaction', 1, 'App\\User', '[]', '2021-06-06 19:02:36', '2021-06-06 19:02:36'),
(40, 'default', 'edited', 747, 'App\\Transaction', 1, 'App\\User', '[]', '2021-06-06 19:54:01', '2021-06-06 19:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `AREAS`
--

CREATE TABLE `AREAS` (
  `AREA_ID` int(11) NOT NULL,
  `AREA_NAME_EN` varchar(256) NOT NULL,
  `PROVINCE_ID` int(11) NOT NULL,
  `AREA_NAME_AR` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `AREAS`
--

INSERT INTO `AREAS` (`AREA_ID`, `AREA_NAME_EN`, `PROVINCE_ID`, `AREA_NAME_AR`) VALUES
(1, 'Oyoun', 5, 'العيو'),
(2, 'Al Sawabir', 1, 'الصوابر'),
(3, 'Al Salam', 1, 'السلام'),
(4, 'Nasseem', 5, 'النسيم'),
(5, 'Al Naeem', 5, 'النعيم'),
(6, 'Waha', 5, 'الواحة'),
(7, 'Taima', 5, 'تيماء'),
(8, 'Saad Al Abdullah', 5, 'سعد العبدالله'),
(9, 'Sulaibiya', 5, 'صليبية'),
(10, 'Qasr', 5, 'القصر'),
(11, 'Qairawan', 5, 'القيروان'),
(12, 'Al Jahra', 5, 'الجهراء'),
(13, 'Abu Hasaniya', 6, 'أبوالحصانية'),
(14, 'Abu Ftaira', 6, 'أبوفطيرة'),
(15, 'Adan', 6, 'العدان'),
(16, 'Al Qurain', 6, 'القرين'),
(17, 'Al Qusour', 6, 'القصور'),
(18, 'Al Masayel', 6, 'المسايل'),
(19, 'Messila', 6, 'المسيلة'),
(20, 'Sabah Al Salem', 6, 'صباح السالم'),
(21, 'Sabhan', 6, 'صبحان'),
(22, 'Fnaitess', 6, 'فنيطيس'),
(23, 'Abraq Khaitan', 3, 'أبرق خيطان'),
(24, 'Ashbeliah', 3, 'أشبيليه'),
(25, 'Andalous', 3, 'الأندلس'),
(26, 'Mubarak Al Kabir', 6, 'مبارك الكبير'),
(27, 'Rabiya', 3, 'الرابية'),
(28, 'Rehab', 3, 'الرحاب'),
(29, 'Reggai', 3, 'الرقعي'),
(30, 'Ardhiya', 3, 'العارضية'),
(31, 'Omariya', 3, 'العميرية'),
(32, 'Ferdous', 3, 'الفردوس'),
(33, 'Farwaniya', 3, 'الفروانية'),
(34, 'Jleeb Al Shiyoukh', 3, 'جليب الشيوخ'),
(35, 'Khaitan', 3, 'خيطان'),
(36, 'Abdullah Mubarak', 3, 'عبدالله المبارك'),
(37, 'Al Bedae', 2, 'البدع'),
(38, 'Jabriya', 2, 'الجابرية'),
(39, 'Rumaithiya', 2, 'الرميثية'),
(40, 'Zahra', 1, 'الزهراء'),
(41, 'Salmiya', 2, 'السالمية'),
(42, 'Shaab', 2, 'الشعب'),
(43, 'Shuhada', 1, 'الشهداء'),
(44, 'Siddiq', 1, 'الصديق'),
(45, 'Bayan', 2, 'بيان'),
(46, 'Hitteen', 1, 'حطين'),
(47, 'Hawally', 2, 'حولي'),
(48, 'Salwa', 2, 'سلوى'),
(49, 'Mubarak Al Abdullah', 2, 'مبارك العبدالله'),
(50, 'Muishrif', 2, 'مشرف'),
(51, 'Maidan Hawally', 2, 'ميدان حولي'),
(52, 'Ali Sabah Al Salem', 4, 'علي صباح السالم'),
(53, 'Abu Halifa', 4, 'أبو حليفة'),
(54, 'Ahmadi', 4, 'الأحمدي'),
(55, 'Raqqa', 4, 'الرقة'),
(56, 'Sabahiya', 4, 'الصباحية'),
(57, 'Dhaher', 4, 'الظهر'),
(58, 'Egaila', 4, 'العقيلة'),
(59, 'Fahaheel', 4, 'الفحيحيل'),
(60, 'Fintas', 4, 'الفنطاس'),
(61, 'Mangaf', 4, 'المنقف'),
(62, 'Mahboula', 4, 'المهبولة'),
(63, 'Wafra Residential', 4, 'الوفرة السكنية'),
(64, 'Sabah Al Ahmad City', 4, 'مدينة صباح الاحمد'),
(65, 'Fahad Al ahmed', 4, 'فهد الاحمد'),
(66, 'Hadiya', 4, 'هدية'),
(67, 'Al Khalidiya', 2, 'الخالدية'),
(68, 'Dasma', 2, 'الدسمة'),
(69, 'Daiya', 1, 'الدعية'),
(70, 'Doha', 2, 'الدوحة'),
(71, 'Rawda', 1, 'الروضة'),
(72, 'Surra', 1, 'السرة'),
(73, 'Shamiya', 1, 'الشامية'),
(74, 'Sharq', 1, 'الشرق'),
(75, 'Salhiya', 1, 'الصالحية'),
(76, 'Sulaibikhat', 3, 'الصليبيخات'),
(77, 'Adailiya', 1, 'العديلية'),
(78, 'Faiha', 1, 'الفيحاء'),
(79, 'Qadsiya', 1, 'القادسية'),
(80, 'Qibla', 1, 'القبلة'),
(81, 'Mirqab', 1, 'المرقاب'),
(82, 'Mansouriya', 1, 'المنصورية'),
(83, 'Nuzha', 1, 'النزهة'),
(84, 'Nahda', 3, 'النهضة'),
(85, 'Yarmouk', 1, 'اليرموك'),
(86, 'Bneid Al Qar', 1, 'بنيد القار'),
(87, 'Jaber Al Ahmed City', 5, 'مدينة جابر الاحمد'),
(88, 'Dasman', 1, 'دسمان'),
(89, 'North West Sulaibikhat', 3, 'شمال غرب الصليبيخات'),
(90, 'Shuwaikh Residential', 1, 'الشويخ السكنية'),
(91, 'Abdullah Al Salem', 1, 'عبدالله السالم'),
(92, 'Ghornata', 3, 'غرناطة'),
(93, 'Qortuba', 1, 'قرطبة'),
(94, 'Kaifan', 1, 'كيفان'),
(95, 'Kuwait City', 1, 'مدينة الكويت');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_settings` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_labels` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `essentials_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Boston Laundry', 66, '2020-01-01', NULL, NULL, NULL, NULL, NULL, 0.00, 1, 'Asia/Kuwait', 1, 'fifo', '0.00', 'includes', '1621942500_WhatsApp Image 2021-05-23 at 4.20.20 PM.jpeg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"disable_pay_checkout\":\"1\",\"disable_draft\":\"1\",\"disable_order_tax\":\"1\",\"enable_transaction_date\":\"1\",\"inline_service_staff\":\"1\",\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"is_pos_subtotal_editable\":0}', '{\"leave_ref_no_prefix\":null,\"leave_instructions\":null,\"payroll_ref_no_prefix\":null,\"essentials_todos_prefix\":null,\"allow_users_for_attendance\":0}', 0, 1, 0, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"tables\",\"modifiers\",\"service_staff\",\"kitchen\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', 'green', NULL, 1, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":\"admin\",\"mail_password\":\"password\",\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2020-01-21 12:26:10', '2021-05-28 11:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'KUWAIT CITY', 'Blk 13 St 24 Bldg 8 Qibla Building', 'Kuwait', 'Kuwait', 'Jabriya', '6789', 1, 1, NULL, 1, 'browser', NULL, '22097005', NULL, NULL, 'https://healthstudiokuwait.com', 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"account\":null},\"bank_transfer\":{\"account\":null},\"other\":{\"account\":null},\"custom_pay_1\":{\"account\":null},\"custom_pay_2\":{\"account\":null},\"custom_pay_3\":{\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2020-01-21 12:26:10', '2020-12-03 10:25:42'),
(2, 1, 'BL0002', 'JABRIYA', 'Street 5, Jabriya, Kuwait', 'Kuwait', 'Kuwait', 'Jabriya', '12345', 1, 1, NULL, 1, 'browser', NULL, NULL, NULL, NULL, 'https://healthstudiokw.com', 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"account\":null},\"bank_transfer\":{\"account\":null},\"other\":{\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"account\":null},\"custom_pay_3\":{\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2020-02-01 08:38:22', '2020-12-03 10:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(37, 1, 1, 1, 'close', '2021-06-05 11:00:07', '180.0000', 0, 0, NULL, '2021-05-28 15:29:37', '2021-06-05 08:00:07'),
(38, 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, '2021-06-05 08:33:37', '2021-06-05 08:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1330, 37, '100.0000', 'cash', 'credit', 'initial', NULL, '2021-05-28 15:29:38', '2021-05-28 15:29:38'),
(1331, 37, '0.0000', 'cash', 'credit', 'sell', 691, '2021-05-28 15:35:39', '2021-05-28 15:35:39'),
(1332, 37, '0.0000', 'cash', 'credit', 'sell', 691, '2021-05-28 15:35:39', '2021-05-28 15:35:39'),
(1333, 37, '2.0000', 'cash', 'credit', 'sell', 692, '2021-05-28 15:36:53', '2021-05-28 15:36:53'),
(1334, 37, '0.0000', 'cash', 'credit', 'sell', 692, '2021-05-28 15:36:53', '2021-05-28 15:36:53'),
(1335, 37, '4.0000', 'cash', 'credit', 'sell', 693, '2021-05-28 15:38:17', '2021-05-28 15:38:17'),
(1336, 37, '0.0000', 'cash', 'credit', 'sell', 693, '2021-05-28 15:38:17', '2021-05-28 15:38:17'),
(1337, 37, '2.0000', 'cash', 'credit', 'sell', 694, '2021-05-28 15:38:43', '2021-05-28 15:38:43'),
(1338, 37, '0.0000', 'cash', 'credit', 'sell', 694, '2021-05-28 15:38:43', '2021-05-28 15:38:43'),
(1339, 37, '4.0000', 'cash', 'credit', 'sell', 695, '2021-05-28 15:51:23', '2021-05-28 15:51:23'),
(1340, 37, '0.0000', 'cash', 'credit', 'sell', 695, '2021-05-28 15:51:23', '2021-05-28 15:51:23'),
(1341, 37, '4.0000', 'cash', 'credit', 'sell', 696, '2021-05-28 16:02:24', '2021-05-28 16:02:24'),
(1342, 37, '0.0000', 'cash', 'credit', 'sell', 696, '2021-05-28 16:02:24', '2021-05-28 16:02:24'),
(1343, 37, '2.0000', 'cash', 'credit', 'sell', 697, '2021-05-28 16:03:29', '2021-05-28 16:03:29'),
(1344, 37, '0.0000', 'cash', 'credit', 'sell', 697, '2021-05-28 16:03:29', '2021-05-28 16:03:29'),
(1345, 37, '2.0000', 'cash', 'credit', 'sell', 698, '2021-05-28 16:05:26', '2021-05-28 16:05:26'),
(1346, 37, '0.0000', 'cash', 'credit', 'sell', 698, '2021-05-28 16:05:26', '2021-05-28 16:05:26'),
(1347, 37, '2.0000', 'cash', 'credit', 'sell', 699, '2021-05-28 16:06:11', '2021-05-28 16:06:11'),
(1348, 37, '0.0000', 'cash', 'credit', 'sell', 699, '2021-05-28 16:06:11', '2021-05-28 16:06:11'),
(1349, 37, '2.0000', 'cash', 'credit', 'sell', 700, '2021-05-28 16:07:22', '2021-05-28 16:07:22'),
(1350, 37, '0.0000', 'cash', 'credit', 'sell', 700, '2021-05-28 16:07:22', '2021-05-28 16:07:22'),
(1351, 37, '2.0000', 'cash', 'credit', 'sell', 701, '2021-05-28 16:08:57', '2021-05-28 16:08:57'),
(1352, 37, '0.0000', 'cash', 'credit', 'sell', 701, '2021-05-28 16:08:57', '2021-05-28 16:08:57'),
(1353, 37, '6.0000', 'cash', 'credit', 'sell', 702, '2021-05-28 16:11:04', '2021-05-28 16:11:04'),
(1354, 37, '0.0000', 'cash', 'credit', 'sell', 702, '2021-05-28 16:11:04', '2021-05-28 16:11:04'),
(1355, 37, '2.0000', 'cash', 'credit', 'sell', 703, '2021-05-28 16:13:32', '2021-05-28 16:13:32'),
(1356, 37, '0.0000', 'cash', 'credit', 'sell', 703, '2021-05-28 16:13:32', '2021-05-28 16:13:32'),
(1357, 37, '2.0000', 'cash', 'credit', 'sell', 705, '2021-05-31 18:06:22', '2021-05-31 18:06:22'),
(1358, 37, '2.0000', 'cash', 'credit', 'sell', 709, '2021-06-03 16:39:08', '2021-06-03 16:39:08'),
(1359, 37, '0.0000', 'cash', 'credit', 'sell', 709, '2021-06-03 16:39:08', '2021-06-03 16:39:08'),
(1360, 37, '2.0000', 'cash', 'credit', 'sell', 710, '2021-06-03 16:55:55', '2021-06-03 16:55:55'),
(1361, 37, '0.0000', 'cash', 'credit', 'sell', 710, '2021-06-03 16:55:55', '2021-06-03 16:55:55'),
(1362, 37, '2.0000', 'cash', 'credit', 'sell', 711, '2021-06-04 16:27:25', '2021-06-04 16:27:25'),
(1363, 37, '0.0000', 'cash', 'credit', 'sell', 711, '2021-06-04 16:27:25', '2021-06-04 16:27:25'),
(1364, 37, '2.0000', 'cash', 'credit', 'sell', 712, '2021-06-04 16:36:46', '2021-06-04 16:36:46'),
(1365, 37, '0.0000', 'cash', 'credit', 'sell', 712, '2021-06-04 16:36:46', '2021-06-04 16:36:46'),
(1366, 37, '2.0000', 'cash', 'credit', 'sell', 713, '2021-06-04 17:34:02', '2021-06-04 17:34:02'),
(1367, 37, '0.0000', 'cash', 'credit', 'sell', 713, '2021-06-04 17:34:02', '2021-06-04 17:34:02'),
(1368, 37, '2.0000', 'cash', 'credit', 'sell', 714, '2021-06-04 17:35:34', '2021-06-04 17:35:34'),
(1369, 37, '0.0000', 'cash', 'credit', 'sell', 714, '2021-06-04 17:35:34', '2021-06-04 17:35:34'),
(1370, 37, '2.0000', 'cash', 'credit', 'sell', 715, '2021-06-04 17:56:17', '2021-06-04 17:56:17'),
(1371, 37, '0.0000', 'cash', 'credit', 'sell', 715, '2021-06-04 17:56:17', '2021-06-04 17:56:17'),
(1372, 37, '2.0000', 'cash', 'credit', 'sell', 716, '2021-06-04 17:56:45', '2021-06-04 17:56:45'),
(1373, 37, '0.0000', 'cash', 'credit', 'sell', 716, '2021-06-04 17:56:45', '2021-06-04 17:56:45'),
(1374, 37, '2.0000', 'cash', 'credit', 'sell', 717, '2021-06-05 07:05:09', '2021-06-05 07:05:09'),
(1375, 37, '0.0000', 'cash', 'credit', 'sell', 717, '2021-06-05 07:05:09', '2021-06-05 07:05:09'),
(1376, 37, '2.0000', 'cash', 'credit', 'sell', 718, '2021-06-05 07:08:23', '2021-06-05 07:08:23'),
(1377, 37, '0.0000', 'cash', 'credit', 'sell', 718, '2021-06-05 07:08:23', '2021-06-05 07:08:23'),
(1378, 37, '2.0000', 'cash', 'credit', 'sell', 719, '2021-06-05 07:09:06', '2021-06-05 07:09:06'),
(1379, 37, '0.0000', 'cash', 'credit', 'sell', 719, '2021-06-05 07:09:06', '2021-06-05 07:09:06'),
(1380, 37, '2.0000', 'cash', 'credit', 'sell', 720, '2021-06-05 07:13:27', '2021-06-05 07:13:27'),
(1381, 37, '0.0000', 'cash', 'credit', 'sell', 720, '2021-06-05 07:13:27', '2021-06-05 07:13:27'),
(1382, 37, '2.0000', 'cash', 'credit', 'sell', 721, '2021-06-05 07:14:51', '2021-06-05 07:14:51'),
(1383, 37, '0.0000', 'cash', 'credit', 'sell', 721, '2021-06-05 07:14:51', '2021-06-05 07:14:51'),
(1384, 37, '2.0000', 'cash', 'credit', 'sell', 722, '2021-06-05 07:19:04', '2021-06-05 07:19:04'),
(1385, 37, '0.0000', 'cash', 'credit', 'sell', 722, '2021-06-05 07:19:04', '2021-06-05 07:19:04'),
(1386, 37, '2.0000', 'cash', 'credit', 'sell', 723, '2021-06-05 07:30:34', '2021-06-05 07:30:34'),
(1387, 37, '0.0000', 'cash', 'credit', 'sell', 723, '2021-06-05 07:30:34', '2021-06-05 07:30:34'),
(1388, 37, '2.0000', 'cash', 'credit', 'sell', 724, '2021-06-05 07:35:52', '2021-06-05 07:35:52'),
(1389, 37, '0.0000', 'cash', 'credit', 'sell', 724, '2021-06-05 07:35:52', '2021-06-05 07:35:52'),
(1390, 37, '2.0000', 'cash', 'credit', 'sell', 725, '2021-06-05 07:37:45', '2021-06-05 07:37:45'),
(1391, 37, '0.0000', 'cash', 'credit', 'sell', 725, '2021-06-05 07:37:45', '2021-06-05 07:37:45'),
(1392, 37, '2.0000', 'cash', 'credit', 'sell', 726, '2021-06-05 07:40:13', '2021-06-05 07:40:13'),
(1393, 37, '0.0000', 'cash', 'credit', 'sell', 726, '2021-06-05 07:40:13', '2021-06-05 07:40:13'),
(1394, 37, '2.0000', 'cash', 'credit', 'sell', 727, '2021-06-05 07:46:07', '2021-06-05 07:46:07'),
(1395, 37, '0.0000', 'cash', 'credit', 'sell', 727, '2021-06-05 07:46:07', '2021-06-05 07:46:07'),
(1396, 37, '2.0000', 'cash', 'credit', 'sell', 728, '2021-06-05 07:46:47', '2021-06-05 07:46:47'),
(1397, 37, '0.0000', 'cash', 'credit', 'sell', 728, '2021-06-05 07:46:47', '2021-06-05 07:46:47'),
(1398, 37, '2.0000', 'cash', 'credit', 'sell', 729, '2021-06-05 07:50:48', '2021-06-05 07:50:48'),
(1399, 37, '0.0000', 'cash', 'credit', 'sell', 729, '2021-06-05 07:50:48', '2021-06-05 07:50:48'),
(1400, 37, '2.0000', 'cash', 'credit', 'sell', 730, '2021-06-05 07:57:54', '2021-06-05 07:57:54'),
(1401, 37, '0.0000', 'cash', 'credit', 'sell', 730, '2021-06-05 07:57:54', '2021-06-05 07:57:54'),
(1402, 37, '2.0000', NULL, 'credit', 'sell', 731, '2021-06-05 07:59:15', '2021-06-05 07:59:15'),
(1403, 37, '0.0000', 'cash', 'credit', 'sell', 731, '2021-06-05 07:59:15', '2021-06-05 07:59:15'),
(1404, 38, '90.0000', 'cash', 'credit', 'initial', NULL, '2021-06-05 08:33:37', '2021-06-05 08:33:37'),
(1405, 38, '2.0000', 'cash', 'credit', 'sell', 732, '2021-06-05 08:58:41', '2021-06-05 08:58:41'),
(1406, 38, '0.0000', 'cash', 'credit', 'sell', 732, '2021-06-05 08:58:41', '2021-06-05 08:58:41'),
(1407, 38, '2.0000', NULL, 'credit', 'sell', 733, '2021-06-05 09:00:09', '2021-06-05 09:00:09'),
(1408, 38, '0.0000', 'cash', 'credit', 'sell', 733, '2021-06-05 09:00:09', '2021-06-05 09:00:09'),
(1409, 38, '4.0000', 'cash', 'credit', 'sell', 734, '2021-06-05 09:16:51', '2021-06-05 09:16:51'),
(1410, 38, '0.0000', 'cash', 'credit', 'sell', 734, '2021-06-05 09:16:51', '2021-06-05 09:16:51'),
(1411, 38, '6.0000', 'cash', 'credit', 'sell', 735, '2021-06-05 09:31:51', '2021-06-05 09:31:51'),
(1412, 38, '0.0000', 'cash', 'credit', 'sell', 735, '2021-06-05 09:31:51', '2021-06-05 09:31:51'),
(1413, 38, '2.0000', 'cash', 'credit', 'sell', 736, '2021-06-05 14:46:14', '2021-06-05 14:46:14'),
(1414, 38, '0.0000', 'cash', 'credit', 'sell', 736, '2021-06-05 14:46:14', '2021-06-05 14:46:14'),
(1415, 38, '2.0000', 'cash', 'credit', 'sell', 737, '2021-06-05 14:47:09', '2021-06-05 14:47:09'),
(1416, 38, '0.0000', 'cash', 'credit', 'sell', 737, '2021-06-05 14:47:09', '2021-06-05 14:47:09'),
(1417, 38, '2.0000', 'cash', 'credit', 'sell', 738, '2021-06-05 15:12:01', '2021-06-05 15:12:01'),
(1418, 38, '0.0000', 'cash', 'credit', 'sell', 738, '2021-06-05 15:12:01', '2021-06-05 15:12:01'),
(1419, 38, '10.0000', NULL, 'credit', 'sell', 739, '2021-06-05 15:15:18', '2021-06-05 15:15:18'),
(1420, 38, '0.0000', 'cash', 'credit', 'sell', 739, '2021-06-05 15:15:18', '2021-06-05 15:15:18'),
(1421, 38, '14.0000', 'cash', 'credit', 'sell', 740, '2021-06-05 15:19:04', '2021-06-05 15:19:04'),
(1422, 38, '0.0000', 'cash', 'credit', 'sell', 740, '2021-06-05 15:19:04', '2021-06-05 15:19:04'),
(1423, 38, '8.0000', 'cash', 'credit', 'sell', 741, '2021-06-05 15:22:36', '2021-06-05 15:22:36'),
(1424, 38, '0.0000', 'cash', 'credit', 'sell', 741, '2021-06-05 15:22:36', '2021-06-05 15:22:36'),
(1425, 38, '2.0000', 'cash', 'credit', 'sell', 742, '2021-06-05 15:35:05', '2021-06-05 15:35:05'),
(1426, 38, '0.0000', 'cash', 'credit', 'sell', 742, '2021-06-05 15:35:05', '2021-06-05 15:35:05'),
(1427, 38, '16.0000', 'cash', 'credit', 'sell', 743, '2021-06-05 15:37:18', '2021-06-05 15:37:18'),
(1428, 38, '0.0000', 'cash', 'credit', 'sell', 743, '2021-06-05 15:37:18', '2021-06-05 15:37:18'),
(1429, 38, '20.0000', 'cash', 'credit', 'sell', 744, '2021-06-05 15:45:50', '2021-06-05 15:45:50'),
(1430, 38, '0.0000', 'cash', 'credit', 'sell', 744, '2021-06-05 15:45:50', '2021-06-05 15:45:50'),
(1431, 38, '2.0000', NULL, 'credit', 'sell', 745, '2021-06-05 15:47:42', '2021-06-05 15:47:42'),
(1432, 38, '0.0000', 'cash', 'credit', 'sell', 745, '2021-06-05 15:47:42', '2021-06-05 15:47:42'),
(1433, 38, '4.0000', 'cash', 'credit', 'sell', 746, '2021-06-05 17:28:04', '2021-06-05 17:28:04'),
(1434, 38, '0.0000', 'cash', 'credit', 'sell', 746, '2021-06-05 17:28:04', '2021-06-05 17:28:04'),
(1435, 38, '2.0000', 'cash', 'credit', 'sell', 747, '2021-06-06 17:30:11', '2021-06-06 17:30:11'),
(1436, 38, '0.0000', 'cash', 'credit', 'sell', 747, '2021-06-06 17:30:11', '2021-06-06 17:30:11'),
(1437, 38, '6.0000', 'cash', 'credit', 'sell', 748, '2021-06-06 17:36:38', '2021-06-06 17:36:38'),
(1438, 38, '0.0000', 'cash', 'credit', 'sell', 748, '2021-06-06 17:36:38', '2021-06-06 17:36:38'),
(1439, 38, '2.0000', 'cash', 'credit', 'sell', 749, '2021-06-06 18:49:31', '2021-06-06 18:49:31'),
(1440, 38, '0.0000', 'cash', 'credit', 'sell', 749, '2021-06-06 18:49:31', '2021-06-06 18:49:31'),
(1441, 38, '4.0000', 'cash', 'credit', 'sell', 744, '2021-06-06 19:02:36', '2021-06-06 19:02:36'),
(1444, 38, '4.0000', 'cash', 'credit', 'sell', 747, '2021-06-06 19:54:00', '2021-06-06 19:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OEX_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'customer subscription status ',
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Nill' COMMENT 'subscription_used',
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Full' COMMENT 'subscription_left',
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `OEX_ACTIVATED` tinyint(1) NOT NULL,
  `OEX_PASSWORD` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `renewal_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`, `OEX_ACTIVATED`, `OEX_PASSWORD`, `renewal_count`) VALUES
(1, 1, 'customer', NULL, 'Walk in Customer', NULL, '01', NULL, NULL, NULL, NULL, NULL, '000000', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, 'Nill', 'Full', 'Oyoun', NULL, '2021-05-28 15:33:03', '2021-05-28 15:33:03', 0, '', 0),
(66, 1, 'customer', NULL, 'mohan', NULL, '549', NULL, '1', '92', '702', 'zam zam', '67661149', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 10, 'on', '0', '20', 'Farwaniya', NULL, '2021-05-28 14:54:04', '2021-06-02 10:42:42', 0, '', 1),
(69, 1, 'customer', 'w', 'deeep', NULL, '0009', 'D', NULL, NULL, NULL, NULL, '344', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 10, NULL, '0', '20', 'Oyoun', NULL, '2021-06-03 14:32:30', '2021-06-03 14:34:15', 0, '', 0),
(70, 1, 'customer', NULL, 'DADA', NULL, '18', NULL, NULL, NULL, NULL, NULL, 'W2', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 10, NULL, '0', '20', 'Oyoun', NULL, '2021-06-03 14:34:47', '2021-06-03 14:34:47', 0, '', 0),
(71, 1, 'customer', NULL, 'Abo', NULL, '0098', NULL, 'b1', 'st5', 'hn8', 'nm7', '2345678975', '3456', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 10, 'on', '0', '20', 'Al Masayel', NULL, '2021-06-06 15:47:07', '2021-06-06 15:47:36', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kuwait', 'Kuwaiti Dinar', 'KWD', 'د.ك', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `subscription_cost` double(5,2) NOT NULL DEFAULT 0.00,
  `subscription_pieces` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `subscription_cost`, `subscription_pieces`, `created_by`, `created_at`, `updated_at`) VALUES
(10, 1, '20 peices 10kd', 0.00, 10.00, 20, 1, '2021-05-18 12:38:50', '2021-05-18 12:58:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer_subscriptions`
--

CREATE TABLE `customer_subscriptions` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quota_used` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_subscriptions`
--

INSERT INTO `customer_subscriptions` (`id`, `customer_id`, `quota_used`) VALUES
(1, 1, 0),
(2, 20, 0),
(3, 21, 0),
(4, 33, 0),
(5, 34, 0),
(6, 35, 0),
(7, 36, 0),
(8, 38, 0),
(9, 40, 0),
(10, 42, 0),
(11, 43, 0),
(12, 45, 0),
(13, 46, 0),
(14, 47, 0),
(15, 48, 0),
(16, 49, 0),
(17, 50, 0),
(18, 51, 0),
(19, 52, 0),
(20, 53, 0),
(21, 55, 0),
(22, 56, 0),
(23, 57, 0),
(24, 58, 0),
(25, 59, 0),
(26, 60, 0);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `applicable_in_spg` tinyint(1) DEFAULT 0,
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_allowances_and_deductions`
--

CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('allowance','deduction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_attendances`
--

CREATE TABLE `essentials_attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_in_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clock_out_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_documents`
--

CREATE TABLE `essentials_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_document_shares`
--

CREATE TABLE `essentials_document_shares` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` int(11) NOT NULL,
  `value_type` enum('user','role') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_holidays`
--

CREATE TABLE `essentials_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leaves`
--

CREATE TABLE `essentials_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `essentials_leave_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_leave_types`
--

CREATE TABLE `essentials_leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_leave_count` int(11) DEFAULT NULL,
  `leave_count_interval` enum('month','year') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_messages`
--

CREATE TABLE `essentials_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_reminders`
--

CREATE TABLE `essentials_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todos_users`
--

CREATE TABLE `essentials_todos_users` (
  `todo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `essentials_todos_users`
--

INSERT INTO `essentials_todos_users` (`todo_id`, `user_id`) VALUES
(1, 13),
(2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `essentials_todo_comments`
--

CREATE TABLE `essentials_todo_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_to_dos`
--

CREATE TABLE `essentials_to_dos` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `task_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `essentials_user_allowance_and_deductions`
--

CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int(11) NOT NULL,
  `allowance_deduction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Rent', 1, 'RNT', NULL, '2021-05-31 18:25:15', '2021-05-31 18:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Main Invoice', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 1, NULL, NULL, 'Date', NULL, 1, 0, 0, 1, 0, 0, 0, 0, NULL, 1, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1622126174_WhatsApp Image 2021-05-23 at 4.20.20 PM.jpeg', 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 'Customer', 0, '#000000', NULL, '{\"tables\":{\"show_table\":\"1\",\"table_label\":null},\"service_staff\":{\"service_staff_label\":null}}', '{\"due_date_label\":null}', 1, 1, 'classic', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-01-21 12:26:10', '2021-05-27 14:36:14'),
(2, '12', NULL, 'Invoice No.', 'Quotation No.', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', '1622126149_WhatsApp Image 2021-05-23 at 4.20.20 PM.jpeg', 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 'Customer', 0, '#000000', NULL, '{\"tables\":{\"table_label\":\"Table\"},\"service_staff\":{\"service_staff_label\":\"Service staff\"}}', '{\"due_date_label\":\"Due Date\"}', 0, 1, 'classic', 'Credit Note', 'Ref. No.', 'Credit Amount', NULL, 1, 'All Balance Due', 'Change Return', NULL, NULL, NULL, '2020-08-29 15:25:09', '2021-05-27 14:35:49');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'year', NULL, 1, 924, 4, 1, '2020-01-21 12:26:10', '2021-06-06 19:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `KW_AREA`
--

CREATE TABLE `KW_AREA` (
  `AREA_ID` int(11) NOT NULL,
  `AREA_NAME_EN` varchar(256) NOT NULL,
  `AREA_NAME_AR` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `KW_AREA`
--

INSERT INTO `KW_AREA` (`AREA_ID`, `AREA_NAME_EN`, `AREA_NAME_AR`) VALUES
(1, 'Oyoun', 'العيون'),
(2, 'Al Sawabir', 'الصوابر'),
(3, 'Al Salam', 'السلام'),
(4, 'Nasseem', 'النسيم'),
(5, 'Al Naeem', 'النعيم'),
(6, 'Waha', 'الواحة'),
(7, 'Taima', 'تيماء'),
(8, 'Saad Al Abdullah', 'سعد العبدالله'),
(9, 'Sulaibiya', 'صليبية'),
(10, 'Qasr', 'القصر'),
(11, 'Qairawan', 'القيروان'),
(12, 'Al Jahra', 'الجهراء'),
(13, 'Abu Hasaniya', 'أبوالحصانية'),
(14, 'Abu Ftaira', 'أبوفطيرة'),
(15, 'Adan', 'العدان'),
(16, 'Al Qurain', 'القرين'),
(17, 'Al Qusour', 'القصور'),
(18, 'Al Masayel', 'المسايل'),
(19, 'Messila', 'المسيلة'),
(20, 'Sabah Al Salem', 'صباح السالم'),
(21, 'Sabhan', 'صبحان'),
(22, 'Fnaitess', 'فنيطيس'),
(23, 'Abraq Khaitan', 'أبرق خيطان'),
(24, 'Ashbeliah', 'أشبيليه'),
(25, 'Andalous', 'الأندلس'),
(26, 'Mubarak Al Kabir', 'مبارك الكبير'),
(27, 'Rabiya', 'الرابية'),
(28, 'Rehab', 'الرحاب'),
(29, 'Reggai', 'الرقعي'),
(30, 'Ardhiya', 'العارضية'),
(31, 'Omariya', 'العميرية'),
(32, 'Ferdous', 'الفردوس'),
(33, 'Farwaniya', 'الفروانية'),
(34, 'Jleeb Al Shiyoukh', 'جليب الشيوخ'),
(35, 'Khaitan', 'خيطان'),
(36, 'Abdullah Mubarak', 'عبدالله المبارك'),
(37, 'Al Bedae', 'البدع'),
(38, 'Jabriya', 'الجابرية'),
(39, 'Rumaithiya', 'الرميثية'),
(40, 'Zahra', 'الزهراء'),
(41, 'Salmiya', 'السالمية'),
(42, 'Shaab', 'الشعب'),
(43, 'Shuhada', 'الشهداء'),
(44, 'Siddiq', 'الصديق'),
(45, 'Bayan', 'بيان'),
(46, 'Hitteen', 'حطين'),
(47, 'Hawally', 'حولي'),
(48, 'Salwa', 'سلوى'),
(49, 'Mubarak Al Abdullah', 'مبارك العبدالله '),
(50, 'Muishrif', 'مشرف'),
(51, 'Maidan Hawally', 'ميدان حولي'),
(52, 'Ali Sabah Al Salem', 'علي صباح السالم'),
(53, 'Abu Halifa', 'أبو حليفة'),
(54, 'Ahmadi', 'الأحمدي'),
(55, 'Raqqa', 'الرقة'),
(56, 'Sabahiya', 'الصباحية'),
(57, 'Dhaher', 'الظهر'),
(58, 'Egaila', 'العقيلة'),
(59, 'Fahaheel', 'الفحيحيل'),
(60, 'Fintas', 'الفنطاس'),
(61, 'Mangaf', 'المنقف'),
(62, 'Mahboula', 'المهبولة'),
(63, 'Wafra Residential', 'الوفرة السكنية'),
(64, 'Sabah Al Ahmad City', 'مدينة صباح الاحمد'),
(65, 'Fahad Al ahmed', 'فهد الاحمد'),
(66, 'Hadiya', 'هدية'),
(67, 'Al Khalidiya', 'الخالدية'),
(68, 'Dasma', 'الدسمة'),
(69, 'Daiya', 'الدعية'),
(70, 'Doha', 'الدوحة'),
(71, 'Rawda', 'الروضة'),
(72, 'Surra', 'السرة'),
(73, 'Shamiya', 'الشامية'),
(74, 'Sharq', 'الشرق'),
(75, 'Salhiya', 'الصالحية'),
(76, 'Sulaibikhat', 'الصليبيخات'),
(77, 'Adailiya', 'العديلية'),
(78, 'Faiha', 'الفيحاء'),
(79, 'Qadsiya', 'القادسية'),
(80, 'Qibla', 'القبلة'),
(81, 'Mirqab', 'المرقاب'),
(82, 'Mansouriya', 'المنصورية'),
(83, 'Nuzha', 'النزهة'),
(84, 'Nahda', 'النهضة'),
(85, 'Yarmouk', 'اليرموك'),
(86, 'Bneid Al Qar', 'بنيد القار'),
(87, 'Jaber Al Ahmed City', 'مدينة جابر الاحمد'),
(88, 'Dasman', 'دسمان'),
(89, 'North West Sulaibikhat', 'شمال غرب الصليبيخات'),
(90, 'Shuwaikh Residential', 'الشويخ السكنية'),
(91, 'Abdullah Al Salem', 'عبدالله السالم'),
(92, 'Ghornata', 'غرناطة'),
(93, 'Qortuba', 'قرطبة'),
(94, 'Kaifan', 'كيفان'),
(95, 'Kuwait City', 'مدينة الكويت');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1600513703_585102308_pRonyJbXukUoTW0kaZb5CBllJmghLlvtsocqfziM.jpg', NULL, 1, 'App\\Variation', 867, '2020-09-19 12:08:23', '2020-09-19 12:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(77, 'App\\User', 2),
(77, 'App\\User', 5),
(77, 'App\\User', 6),
(77, 'App\\User', 7),
(77, 'App\\User', 8),
(77, 'App\\User', 11),
(77, 'App\\User', 13),
(77, 'App\\User', 14),
(77, 'App\\User', 15),
(77, 'App\\User', 16),
(77, 'App\\User', 17),
(77, 'App\\User', 20),
(77, 'App\\User', 21),
(77, 'App\\User', 22),
(77, 'App\\User', 23),
(77, 'App\\User', 24),
(77, 'App\\User', 28),
(77, 'App\\User', 29),
(77, 'App\\User', 31),
(77, 'App\\User', 33),
(79, 'App\\User', 5),
(79, 'App\\User', 8),
(79, 'App\\User', 11),
(79, 'App\\User', 14),
(79, 'App\\User', 19),
(79, 'App\\User', 30),
(84, 'App\\User', 3),
(84, 'App\\User', 4),
(84, 'App\\User', 10),
(84, 'App\\User', 12),
(84, 'App\\User', 14),
(84, 'App\\User', 18),
(84, 'App\\User', 19),
(84, 'App\\User', 32),
(84, 'App\\User', 34),
(85, 'App\\User', 12),
(86, 'App\\User', 25),
(86, 'App\\User', 26),
(87, 'App\\User', 27);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2),
(1, 'App\\User', 7),
(1, 'App\\User', 11),
(1, 'App\\User', 14),
(1, 'App\\User', 15),
(1, 'App\\User', 17),
(1, 'App\\User', 30);

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

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {paid_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {paid_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2020-01-21 12:17:23', NULL),
(2, 'direct_sell.access', 'web', '2020-01-21 12:17:23', NULL),
(3, 'product.opening_stock', 'web', '2020-01-21 12:17:24', '2020-01-21 12:17:24'),
(4, 'crud_all_bookings', 'web', '2020-01-21 12:17:25', '2020-01-21 12:17:25'),
(5, 'crud_own_bookings', 'web', '2020-01-21 12:17:25', '2020-01-21 12:17:25'),
(6, 'access_default_selling_price', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(7, 'purchase.payments', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(8, 'sell.payments', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(9, 'edit_product_price_from_sale_screen', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(11, 'roles.view', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(12, 'roles.create', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(13, 'roles.update', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(14, 'roles.delete', 'web', '2020-01-21 12:17:26', '2020-01-21 12:17:26'),
(15, 'account.access', 'web', '2020-01-21 12:17:27', '2020-01-21 12:17:27'),
(16, 'discount.access', 'web', '2020-01-21 12:17:27', '2020-01-21 12:17:27'),
(17, 'view_purchase_price', 'web', '2020-01-21 12:17:28', '2020-01-21 12:17:28'),
(18, 'view_own_sell_only', 'web', '2020-01-21 12:17:28', '2020-01-21 12:17:28'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2020-01-21 12:17:28', '2020-01-21 12:17:28'),
(20, 'edit_product_price_from_pos_screen', 'web', '2020-01-21 12:17:28', '2020-01-21 12:17:28'),
(21, 'access_shipping', 'web', '2020-01-21 12:17:29', '2020-01-21 12:17:29'),
(22, 'purchase.update_status', 'web', '2020-01-21 12:17:29', '2020-01-21 12:17:29'),
(23, 'list_drafts', 'web', '2020-01-21 12:17:29', '2020-01-21 12:17:29'),
(24, 'list_quotations', 'web', '2020-01-21 12:17:29', '2020-01-21 12:17:29'),
(25, 'user.view', 'web', '2020-01-21 12:17:29', NULL),
(26, 'user.create', 'web', '2020-01-21 12:17:29', NULL),
(27, 'user.update', 'web', '2020-01-21 12:17:29', NULL),
(28, 'user.delete', 'web', '2020-01-21 12:17:29', NULL),
(29, 'supplier.view', 'web', '2020-01-21 12:17:29', NULL),
(30, 'supplier.create', 'web', '2020-01-21 12:17:29', NULL),
(31, 'supplier.update', 'web', '2020-01-21 12:17:29', NULL),
(32, 'supplier.delete', 'web', '2020-01-21 12:17:29', NULL),
(33, 'customer.view', 'web', '2020-01-21 12:17:29', NULL),
(34, 'customer.create', 'web', '2020-01-21 12:17:29', NULL),
(35, 'customer.update', 'web', '2020-01-21 12:17:29', NULL),
(36, 'customer.delete', 'web', '2020-01-21 12:17:29', NULL),
(37, 'product.view', 'web', '2020-01-21 12:17:29', NULL),
(38, 'product.create', 'web', '2020-01-21 12:17:29', NULL),
(39, 'product.update', 'web', '2020-01-21 12:17:29', NULL),
(40, 'product.delete', 'web', '2020-01-21 12:17:29', NULL),
(41, 'purchase.view', 'web', '2020-01-21 12:17:29', NULL),
(42, 'purchase.create', 'web', '2020-01-21 12:17:29', NULL),
(43, 'purchase.update', 'web', '2020-01-21 12:17:29', NULL),
(44, 'purchase.delete', 'web', '2020-01-21 12:17:29', NULL),
(45, 'sell.view', 'web', '2020-01-21 12:17:29', NULL),
(46, 'sell.create', 'web', '2020-01-21 12:17:29', NULL),
(47, 'sell.update', 'web', '2020-01-21 12:17:29', NULL),
(48, 'sell.delete', 'web', '2020-01-21 12:17:29', NULL),
(49, 'purchase_n_sell_report.view', 'web', '2020-01-21 12:17:29', NULL),
(50, 'contacts_report.view', 'web', '2020-01-21 12:17:29', NULL),
(51, 'stock_report.view', 'web', '2020-01-21 12:17:29', NULL),
(52, 'tax_report.view', 'web', '2020-01-21 12:17:29', NULL),
(53, 'trending_product_report.view', 'web', '2020-01-21 12:17:29', NULL),
(54, 'register_report.view', 'web', '2020-01-21 12:17:29', NULL),
(55, 'sales_representative.view', 'web', '2020-01-21 12:17:29', NULL),
(56, 'expense_report.view', 'web', '2020-01-21 12:17:29', NULL),
(57, 'business_settings.access', 'web', '2020-01-21 12:17:29', NULL),
(58, 'barcode_settings.access', 'web', '2020-01-21 12:17:29', NULL),
(59, 'invoice_settings.access', 'web', '2020-01-21 12:17:29', NULL),
(60, 'brand.view', 'web', '2020-01-21 12:17:29', NULL),
(61, 'brand.create', 'web', '2020-01-21 12:17:29', NULL),
(62, 'brand.update', 'web', '2020-01-21 12:17:29', NULL),
(63, 'brand.delete', 'web', '2020-01-21 12:17:29', NULL),
(64, 'tax_rate.view', 'web', '2020-01-21 12:17:29', NULL),
(65, 'tax_rate.create', 'web', '2020-01-21 12:17:29', NULL),
(66, 'tax_rate.update', 'web', '2020-01-21 12:17:29', NULL),
(67, 'tax_rate.delete', 'web', '2020-01-21 12:17:29', NULL),
(68, 'unit.view', 'web', '2020-01-21 12:17:29', NULL),
(69, 'unit.create', 'web', '2020-01-21 12:17:29', NULL),
(70, 'unit.update', 'web', '2020-01-21 12:17:29', NULL),
(71, 'unit.delete', 'web', '2020-01-21 12:17:29', NULL),
(72, 'category.view', 'web', '2020-01-21 12:17:29', NULL),
(73, 'category.create', 'web', '2020-01-21 12:17:29', NULL),
(74, 'category.update', 'web', '2020-01-21 12:17:29', NULL),
(75, 'category.delete', 'web', '2020-01-21 12:17:29', NULL),
(76, 'expense.access', 'web', '2020-01-21 12:17:29', NULL),
(77, 'access_all_locations', 'web', '2020-01-21 12:17:29', NULL),
(78, 'dashboard.data', 'web', '2020-01-21 12:17:29', NULL),
(79, 'location.1', 'web', '2020-01-21 12:26:10', '2020-01-21 12:26:10'),
(80, 'essentials.create_message', 'web', '2020-01-27 15:45:29', '2020-01-27 15:45:29'),
(81, 'essentials.view_message', 'web', '2020-01-27 15:45:29', '2020-01-27 15:45:29'),
(82, 'essentials.approve_leave', 'web', '2020-01-27 15:45:30', '2020-01-27 15:45:30'),
(83, 'essentials.assign_todos', 'web', '2020-01-27 15:45:30', '2020-01-27 15:45:30'),
(84, 'location.2', 'web', '2020-02-01 08:38:22', '2020-02-01 08:38:22'),
(85, 'location.3', 'web', '2020-02-01 16:36:54', '2020-02-01 16:36:54'),
(86, 'location.4', 'web', '2020-11-15 16:02:40', '2020-11-15 16:02:40'),
(87, 'location.5', 'web', '2020-11-15 16:05:21', '2020-11-15 16:05:21');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `business_id`, `name`, `connection_type`, `capability_profile`, `char_per_line`, `ip_address`, `port`, `path`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Printer', 'windows', 'default', '42', '', '', 'COM1', 1, '2020-08-29 12:21:10', '2020-08-29 12:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `OEX_FEATURED` tinyint(1) NOT NULL DEFAULT 0,
  `subscription_definition` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`, `OEX_FEATURED`, `subscription_definition`) VALUES
(182, 'Test Product', 1, 'single', 2, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '1234567', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-28 15:28:59', '2021-05-28 15:28:59', 0, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(182, 1),
(182, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(182, NULL, 'DUMMY', 182, 1, '2021-05-28 15:28:59', '2021-05-28 15:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `PROVINCE`
--

CREATE TABLE `PROVINCE` (
  `PROVINCE_ID` int(11) NOT NULL,
  `PROVINCE_NAME_EN` varchar(256) NOT NULL,
  `PROVINCE_NAME_AR` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PROVINCE`
--

INSERT INTO `PROVINCE` (`PROVINCE_ID`, `PROVINCE_NAME_EN`, `PROVINCE_NAME_AR`) VALUES
(1, 'Al Asimah', 'العاصمة'),
(2, 'Hawally', 'حولي'),
(3, 'Farwaniya', 'الفروانية'),
(4, 'Ahmadi', 'الأحمدي'),
(5, 'Al Jahra', 'الجهراء'),
(6, 'Mubarak Al Kabir', 'مبارك الكبير'),
(7, 'Subah Al Ahmad', 'صباح الأحمد');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(2, 689, 182, 2067, '10000000010.0000', '2.0000', '0.00', '2.0000', '2.0000', '0.0000', NULL, '99.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2021-05-28 15:29:19', '2021-06-06 19:54:01'),
(3, 690, 182, 2067, '10.0000', '2.0000', '0.00', '2.0000', '2.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2021-05-28 15:29:19', '2021-05-28 16:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(4, 'contacts', 6, 1, '2021-05-28 14:54:04', '2021-06-06 15:47:07'),
(5, 'sell_payment', 55, 1, '2021-05-28 15:36:53', '2021-06-06 19:08:51'),
(6, 'expense', 4, 1, '2021-05-31 15:31:32', '2021-06-02 09:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_product_modifier_sets`
--

INSERT INTO `res_product_modifier_sets` (`modifier_set_id`, `product_id`) VALUES
(855, 690);

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Table1', '1IN', 1, NULL, '2020-10-28 13:41:37', '2020-12-03 13:32:07'),
(2, 1, 1, 'Table2', 'MW', 1, '2020-11-03 14:47:43', '2020-10-28 13:45:55', '2020-11-03 14:47:43'),
(3, 1, 2, 'Table2', '2IN', 1, NULL, '2020-11-03 14:48:01', '2020-12-03 13:32:15'),
(4, 1, 2, 'Table3', '3IN', 1, NULL, '2020-11-03 14:48:11', '2020-12-03 13:32:23'),
(5, 1, 1, 't2', NULL, 1, '2020-12-03 13:20:18', '2020-12-03 13:16:46', '2020-12-03 13:20:18'),
(6, 1, 1, 'TO GO', 'TGKW1', 15, NULL, '2020-12-03 13:30:28', '2020-12-03 13:37:49'),
(7, 1, 2, 'Table 4', '4EXT', 15, NULL, '2020-12-03 13:31:55', '2020-12-03 13:31:55'),
(8, 1, 2, 'Table 5', '5EXT', 15, NULL, '2020-12-03 13:32:46', '2020-12-03 13:32:46'),
(9, 1, 2, 'Table 6', '5EXT', 15, NULL, '2020-12-03 13:33:02', '2020-12-03 13:33:02'),
(10, 1, 2, 'Table 7', '7EXT', 15, NULL, '2020-12-03 13:33:25', '2020-12-03 13:33:25'),
(11, 1, 2, 'Table 8', '8OUT', 15, NULL, '2020-12-03 13:33:43', '2020-12-03 13:33:43'),
(12, 1, 2, 'Table 9', '9OUT', 15, NULL, '2020-12-03 13:33:55', '2020-12-03 13:33:55'),
(13, 1, 2, 'CAR1', 'Car1', 15, NULL, '2020-12-03 13:34:25', '2020-12-03 13:34:25'),
(14, 1, 2, 'CAR2', 'Car2', 15, NULL, '2020-12-03 13:34:47', '2020-12-03 13:34:47'),
(15, 1, 2, 'CAR3', 'Car3', 15, NULL, '2020-12-03 13:35:08', '2020-12-03 13:35:08'),
(16, 1, 2, 'TO GO1', 'TG1', 15, NULL, '2020-12-03 13:35:47', '2020-12-03 13:36:07'),
(17, 1, 2, 'TO GO2', 'TG2', 15, NULL, '2020-12-03 13:36:22', '2020-12-03 13:36:22'),
(18, 1, 2, 'TO GO3', 'TG3', 15, NULL, '2020-12-03 13:36:39', '2020-12-03 13:36:39'),
(19, 1, 2, 'TO GO4', 'TG4', 15, NULL, '2020-12-03 13:36:59', '2020-12-03 13:36:59'),
(20, 1, 1, 'TO GOKw', 'TGKW2', 15, NULL, '2020-12-03 13:37:37', '2020-12-03 13:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2020-01-21 12:26:10', '2020-01-21 12:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `gender` varchar(50) NOT NULL,
  `months_no` int(11) NOT NULL,
  `meals_no` int(11) NOT NULL,
  `snacks_no` int(11) NOT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `business_id`, `title`, `price`, `gender`, `months_no`, `meals_no`, `snacks_no`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Male – 150', 150, 'Male', 1, 2, 1, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(2, 1, 'Male – 190', 190, 'Male', 1, 3, 1, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(3, 1, 'Male – 235', 235, 'Male', 1, 4, 2, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(4, 1, 'Male – 280', 280, 'Male', 1, 5, 2, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(5, 1, 'Female – 135', 135, 'Female', 1, 2, 1, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(6, 1, 'Female – 145', 145, 'Female', 1, 2, 2, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL),
(7, 1, 'Female – 170', 170, 'Female', 1, 3, 2, NULL, '2020-08-31 22:00:00', '2020-08-31 22:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_registers`
--

CREATE TABLE `subscription_registers` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `client_name` varchar(150) NOT NULL,
  `client_gender` varchar(100) NOT NULL,
  `client_mobile` varchar(100) NOT NULL,
  `client_weight` int(11) NOT NULL,
  `client_height` int(11) NOT NULL,
  `client_state` varchar(150) NOT NULL,
  `client_address` varchar(1024) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_price` float NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `meals_no` int(11) NOT NULL,
  `snacks_no` int(11) NOT NULL,
  `subscription_method` varchar(100) DEFAULT NULL,
  `online_submition_date` timestamp NULL DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_paused` timestamp NULL DEFAULT NULL,
  `date_resumed` timestamp NULL DEFAULT NULL,
  `date_suspended` timestamp NULL DEFAULT NULL,
  `return_value` float NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscription_registers`
--

INSERT INTO `subscription_registers` (`id`, `business_id`, `client_name`, `client_gender`, `client_mobile`, `client_weight`, `client_height`, `client_state`, `client_address`, `contact_id`, `plan_id`, `plan_price`, `payment_method`, `payment_status`, `meals_no`, `snacks_no`, `subscription_method`, `online_submition_date`, `date_start`, `date_end`, `date_paused`, `date_resumed`, `date_suspended`, `return_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 1, 'myName', 'male', 'myPhone', 70, 180, 'El Farwanya', 'MyAddress', 0, 1, 150, 'cash', 'pending', 2, 1, 'online', '2020-12-13 06:59:14', NULL, NULL, NULL, NULL, NULL, 0, '2020-12-13 06:59:14', '2020-12-13 06:59:14', NULL),
(9, 1, 'Name', 'female', 'phone', 100, 50, 'El Ghraa', 'address', 0, 4, 280, 'cash', 'pending', 5, 2, 'online', '2020-12-13 07:35:42', NULL, NULL, NULL, NULL, NULL, 0, '2020-12-13 07:35:42', '2020-12-13 07:35:42', NULL),
(10, 1, 'mustafa', 'male', '010', 150, 50, 'Holly', 'address', 0, 5, 135, 'cash', 'pending', 2, 1, 'online', '2020-12-13 11:31:49', NULL, NULL, NULL, NULL, NULL, 0, '2020-12-13 11:31:49', '2020-12-13 11:31:49', NULL),
(11, 1, 'fffff', 'male', '975242403', 67, 160, 'Al Ahmdi', 'abdullah almubark', 0, 3, 235, 'cash', 'pending', 4, 2, 'online', '2020-12-14 16:07:24', '2021-01-03', '2021-02-03', '2021-01-02 23:00:00', NULL, NULL, 0, '2020-12-14 16:07:24', '2021-01-03 13:28:14', NULL),
(12, 1, 'weeee', 'male', '1234567', 3333, 5555, 'El Farwanya', 'abdullah almubark', 0, 1, 150, 'cash', 'pending', 2, 1, 'online', '2020-12-14 16:09:58', NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 16:09:58', '2020-12-14 16:09:58', NULL),
(13, 1, 'Hamad edrees', 'male', '+96565568869', 150, 180, 'Mubarak Al Kebir', 'العدان ق3  ش26 م37', 0, 1, 150, 'cash', 'pending', 2, 1, 'online', '2021-02-26 17:48:39', NULL, NULL, NULL, NULL, NULL, 0, '2021-02-26 17:48:39', '2021-02-26 17:48:39', NULL),
(14, 1, 'Hamad edrees', 'male', '+96565568869', 150, 180, 'Mubarak Al Kebir', 'العدان ق3  ش26 م37', 0, 1, 150, 'cash', 'pending', 2, 1, 'online', '2021-02-27 15:03:54', NULL, NULL, NULL, NULL, NULL, 0, '2021-02-27 15:03:54', '2021-02-27 15:03:54', NULL),
(15, 1, 'Mohammad Nawaf alkendri', 'male', '99455916', 71, 178, 'Mubarak Al Kebir', 'Mubarak Alkaber block 8 street15 home 20', 0, 2, 190, 'cash', 'pending', 3, 1, 'online', '2021-03-14 14:45:24', NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 14:45:24', '2021-03-14 14:45:24', NULL),
(16, 1, 'Mohammad alkandri', 'male', '99455196', 71, 178, 'Mubarak Al Kebir', 'Mubarak alkaber block 8 street15 house', 0, 2, 190, 'cash', 'pending', 3, 1, 'online', '2021-03-14 16:08:36', NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 16:08:36', '2021-03-14 16:08:36', NULL),
(17, 1, 'Moh Al-kendri', 'male', '99455196', 71, 178, 'Mubarak Al Kebir', 'Mubarak alkaberr block8 -street15- home 20', 0, 2, 190, 'cash', 'pending', 3, 1, 'online', '2021-03-14 16:09:49', NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 16:09:49', '2021-03-14 16:09:49', NULL),
(18, 1, 'Moh alkandri', 'male', '99455196', 71, 178, 'Mubarak Al Kebir', 'Mubarak alkaber -block 8 street 15 home 20', 0, 2, 190, 'cash', 'pending', 3, 1, 'online', '2021-03-14 16:11:48', NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 16:11:48', '2021-03-14 16:11:48', NULL),
(19, 1, 'Moh Al-kandri', 'male', '99455196', 71, 178, 'Mubarak Al Kebir', 'Mubarak alkaber block 8 - street15-home20', 0, 2, 190, 'cash', 'pending', 3, 1, 'online', '2021-03-14 16:21:16', NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 16:21:16', '2021-03-14 16:21:16', NULL),
(20, 1, 'Danah Faisal Ashour', 'female', '+96599073618', 68, 160, 'Al Ahmdi', 'Jaber Al-Ali, Block 2, House 11', 0, 5, 135, 'cash', 'pending', 2, 1, 'online', '2021-04-04 23:06:48', NULL, NULL, NULL, NULL, NULL, 0, '2021-04-04 23:06:48', '2021-04-04 23:06:48', NULL),
(21, 1, 'Haitham Jassem Hayat', 'male', '+96599073759', 107, 180, 'Al Ahmdi', 'Jaber Al-Ali, Block 2, House 11', 0, 1, 150, 'cash', 'pending', 2, 1, 'online', '2021-04-04 23:09:56', NULL, NULL, NULL, NULL, NULL, 0, '2021-04-04 23:09:56', '2021-04-04 23:09:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '2.19'),
(2, 'default_business_active_status', '1'),
(3, 'essentials_version', '1.1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'VAT 15%', 15.0000, 0, 1, '2021-01-25 09:36:41', '2021-01-25 09:33:56', '2021-01-25 09:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drivers`
--

CREATE TABLE `tbl_drivers` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(256) NOT NULL,
  `driver_mobile` varchar(256) NOT NULL,
  `driver_email` varchar(256) DEFAULT NULL,
  `driver_password` varchar(256) DEFAULT NULL,
  `driver_civil_id` varchar(256) DEFAULT NULL,
  `driver_company` varchar(256) DEFAULT NULL,
  `driver_notes` text DEFAULT NULL,
  `business_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_drivers`
--

INSERT INTO `tbl_drivers` (`id`, `driver_name`, `driver_mobile`, `driver_email`, `driver_password`, `driver_civil_id`, `driver_company`, `driver_notes`, `business_id`) VALUES
(1, 'Ali', '6788990', 'ali@fedex.com', 'password', '123456767', '123456767', 'Good man', 1),
(6, 'Abo', 'mobile', 'email@email.com', 'password', 'civil id', 'company', 'notes', 1),
(7, 'Farookh', '9087878', 'farookh@gmail.com', 'password', '123456789', 'FedEx', 'notes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_outside_customers`
--

CREATE TABLE `tbl_outside_customers` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(256) NOT NULL,
  `customer_phone` varchar(256) NOT NULL,
  `customer_email` varchar(256) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `customer_civil_id` varchar(256) DEFAULT NULL,
  `governorate` varchar(256) DEFAULT NULL,
  `area` varchar(256) DEFAULT NULL,
  `street` varchar(256) DEFAULT NULL,
  `building` varchar(256) DEFAULT NULL,
  `floor` varchar(256) DEFAULT NULL,
  `apartment` varchar(256) DEFAULT NULL,
  `landmark` varchar(256) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_outside_customers`
--

INSERT INTO `tbl_outside_customers` (`id`, `customer_name`, `customer_phone`, `customer_email`, `business_id`, `customer_civil_id`, `governorate`, `area`, `street`, `building`, `floor`, `apartment`, `landmark`, `notes`) VALUES
(9, 'Ali', '9876543', 'mohan@mal.com', 1, '234567', NULL, NULL, 'jordon street', 'lavida tower', 'ground', '132', 'xam zam', NULL),
(12, 'Gandolf', '7876', 'lol@games.com', 1, '12345678', '3', '33', 'wert', 'ertyu', 'rtyu', 'rtyu', 'ghjk', 'ghj');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_outside_orders`
--

CREATE TABLE `tbl_outside_orders` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT 0,
  `transaction_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `payment_type` varchar(25) NOT NULL DEFAULT 'cash',
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_outside_orders`
--

INSERT INTO `tbl_outside_orders` (`id`, `driver_id`, `customer_id`, `order_status`, `transaction_id`, `business_id`, `payment_type`, `order_date`) VALUES
(1, 1, 2, 1, 729, 1, 'cash', '2021-06-05 00:00:00'),
(2, 1, 1, 2, 730, 1, 'cash', '2021-06-05 00:00:00'),
(3, 1, 2, 3, 732, 1, 'cash', '2021-06-05 00:00:00'),
(4, 6, 4, 2, 733, 1, 'cash', '2021-06-05 00:00:00'),
(5, 7, 5, 2, 734, 1, 'cash', '2021-06-05 00:00:00'),
(6, 6, 2, 3, 735, 1, 'cash', '2021-06-05 00:00:00'),
(7, 7, 6, 0, 736, 1, 'cash', '2021-06-05 00:00:00'),
(8, 7, 3, 0, 737, 1, 'cash', '2021-06-05 18:12:01'),
(9, 1, 1, 0, 738, 1, 'cash', '2021-06-05 18:15:18'),
(10, 1, 1, 0, 739, 1, 'cash', '2021-06-05 18:19:05'),
(11, 2, 1, 0, 740, 1, 'cash', '2021-06-05 18:22:37'),
(12, 2, 1, 0, 742, 1, 'cash', '2021-06-05 18:35:06'),
(13, 7, 6, 0, 743, 1, 'cash', '2021-06-05 18:37:19'),
(14, 1, 1, 0, 745, 1, 'cash', '2021-06-05 18:47:42'),
(15, 3, 1, 1, 746, 1, 'cash', '2021-06-05 20:28:05'),
(16, 7, 9, 1, 747, 1, 'cash', '2021-06-06 20:30:12'),
(17, 6, 10, 2, 748, 1, 'other', '2021-06-06 20:36:39'),
(18, 7, 9, 3, 749, 1, 'other', '2021-06-06 21:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(20,2) NOT NULL DEFAULT 0.00,
  `essentials_allowances` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_deductions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `OEX_KITCHEN_STATUS` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `trasaction_type` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inside'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 09:56:07', '15.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '15.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 168, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-07 08:56:07', '2020-12-07 08:56:07', NULL, NULL, 'inside'),
(5, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, NULL, NULL, '2020-0202', '', NULL, '2020-12-13 13:01:34', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 0100', 'myaddress - El Ghraa', 'ordered', 'mustafa', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"myaddress\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-13 12:01:34', '2020-12-13 12:01:34', NULL, NULL, 'inside'),
(6, 1, 2, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, NULL, NULL, NULL, NULL, '2020-0203', '', NULL, '2020-12-13 13:09:08', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 01111378388', 'Zahraa Nasr city - Holly', 'ordered', 'Moustafa', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"Zahraa Nasr city\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-13 12:09:08', '2020-12-14 10:40:04', NULL, NULL, 'inside'),
(11, 1, 1, 6, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0206', '', NULL, '2020-12-14 11:34:44', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 10:34:44', '2020-12-14 10:34:44', NULL, NULL, 'inside'),
(12, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0207', '', NULL, '2020-12-14 11:36:47', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 10:36:47', '2020-12-14 10:36:47', NULL, NULL, 'inside'),
(13, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0208', '', NULL, '2020-12-14 12:17:20', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 11:17:20', '2020-12-14 11:17:20', NULL, NULL, 'inside'),
(14, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0209', '', NULL, '2020-12-14 12:19:25', '3.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 11:19:25', '2020-12-14 11:19:25', NULL, NULL, 'inside'),
(15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0210', '', NULL, '2020-12-14 13:41:59', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 12:41:59', '2020-12-14 12:41:59', NULL, NULL, 'inside'),
(16, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0211', '', NULL, '2020-12-14 14:17:13', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 13:17:13', '2020-12-14 13:17:13', NULL, NULL, 'inside'),
(17, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0212', '', NULL, '2020-12-14 14:24:17', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 13:24:17', '2020-12-14 13:24:17', NULL, NULL, 'inside'),
(18, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0213', '', NULL, '2020-12-14 14:38:41', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-14 13:38:41', '2020-12-14 13:38:41', NULL, NULL, 'inside'),
(19, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0214', '', NULL, '2020-12-14 17:12:15', '3.4700', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 222222222', 'abdullah almubark - El Ghraa', 'ordered', 'qwer', '1.0000', NULL, NULL, '3.4700', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 3, '[\"abdullah almubark\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 16:12:15', '2020-12-14 16:12:15', NULL, NULL, 'inside'),
(20, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0215', '', NULL, '2020-12-14 17:16:46', '3.4700', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 1112223334', 'qawer - El Ghraa', 'ordered', 'mohammad', '1.0000', NULL, NULL, '3.4700', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 3, '[\"qawer\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 16:16:46', '2020-12-14 16:16:46', NULL, NULL, 'inside'),
(22, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0217', '', NULL, '2020-12-15 12:09:49', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-15 11:09:49', '2020-12-15 11:09:49', NULL, NULL, 'inside'),
(23, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0218', '', NULL, '2020-12-15 12:34:06', '6.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-15 11:34:06', '2020-12-15 11:34:06', NULL, NULL, 'inside'),
(24, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0219', '', NULL, '2020-12-15 14:55:41', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-15 13:55:41', '2020-12-15 13:55:41', NULL, NULL, 'inside'),
(25, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0220', '', NULL, '2020-12-15 16:59:59', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-15 15:59:59', '2020-12-15 15:59:59', NULL, NULL, 'inside'),
(26, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0221', '', NULL, '2020-12-16 12:32:28', '3.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 11:32:28', '2020-12-16 11:32:28', NULL, NULL, 'inside'),
(27, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0222', '', NULL, '2020-12-16 13:26:52', '2.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 12:26:52', '2020-12-16 12:26:52', NULL, NULL, 'inside'),
(28, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0223', '', NULL, '2020-12-16 14:46:33', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 13:46:33', '2020-12-16 13:46:33', NULL, NULL, 'inside'),
(29, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0224', '', NULL, '2020-12-16 16:25:08', '6.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 15:25:08', '2020-12-16 15:25:08', NULL, NULL, 'inside'),
(30, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0225', '', NULL, '2020-12-16 16:47:16', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 15:47:16', '2020-12-16 15:47:16', NULL, NULL, 'inside'),
(31, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0226', '', NULL, '2020-12-16 18:04:38', '7.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-16 17:04:38', '2020-12-16 17:04:38', NULL, NULL, 'inside'),
(34, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0227', '', NULL, '2020-12-17 10:48:35', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 09:48:35', '2020-12-17 09:48:35', NULL, NULL, 'inside'),
(35, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0228', '', NULL, '2020-12-17 11:43:11', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 10:43:11', '2020-12-17 10:43:11', NULL, NULL, 'inside'),
(36, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'partial', NULL, 1, NULL, '2020-0229', '', NULL, '2020-12-17 13:57:28', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 12:57:28', '2020-12-17 12:57:28', NULL, NULL, 'inside'),
(37, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'partial', NULL, 1, NULL, '2020-0230', '', NULL, '2020-12-17 14:00:38', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 13:00:38', '2020-12-17 13:00:38', NULL, NULL, 'inside'),
(38, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0231', '', NULL, '2020-12-17 14:59:16', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 13:59:16', '2020-12-17 13:59:16', NULL, NULL, 'inside'),
(39, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0232', '', NULL, '2020-12-17 15:39:35', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-17 14:39:35', '2020-12-17 14:39:35', NULL, NULL, 'inside'),
(40, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0233', '', NULL, '2020-12-18 18:00:20', '3.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-18 17:00:20', '2020-12-18 17:00:20', NULL, NULL, 'inside'),
(41, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0234', '', NULL, '2020-12-18 20:18:51', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-18 19:18:51', '2020-12-18 19:18:51', NULL, NULL, 'inside'),
(42, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0235', '', NULL, '2020-12-19 12:48:19', '8.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-19 11:48:19', '2020-12-19 11:48:19', NULL, NULL, 'inside'),
(43, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0236', '', NULL, '2020-12-19 17:17:21', '6.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-19 16:17:21', '2020-12-19 16:23:36', NULL, NULL, 'inside'),
(44, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0237', '', NULL, '2020-12-20 13:43:38', '3.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 12:43:38', '2020-12-20 12:43:38', NULL, NULL, 'inside'),
(45, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0238', '', NULL, '2020-12-20 14:07:33', '2.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 13:07:33', '2020-12-20 13:07:33', NULL, NULL, 'inside'),
(46, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0239', '', NULL, '2020-12-20 16:18:24', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 15:18:24', '2020-12-20 15:18:24', NULL, NULL, 'inside'),
(47, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0240', '', NULL, '2020-12-20 17:16:02', '9.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 16:16:02', '2020-12-20 16:16:02', NULL, NULL, 'inside'),
(48, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0241', '', NULL, '2020-12-20 17:17:04', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 16:17:04', '2020-12-20 16:17:04', NULL, NULL, 'inside'),
(49, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0242', '', NULL, '2020-12-20 19:10:30', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 18:10:30', '2020-12-20 18:10:30', NULL, NULL, 'inside'),
(50, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0243', '', NULL, '2020-12-20 19:18:04', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 18:18:04', '2020-12-20 18:18:04', NULL, NULL, 'inside'),
(51, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0244', '', NULL, '2020-12-20 19:19:49', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-20 18:19:49', '2020-12-20 18:19:49', NULL, NULL, 'inside'),
(53, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0245', '', NULL, '2020-12-21 10:15:16', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 09:15:16', '2020-12-21 09:15:16', NULL, NULL, 'inside'),
(54, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0246', '', NULL, '2020-12-21 10:41:18', '3.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 09:41:18', '2020-12-21 09:41:18', NULL, NULL, 'inside'),
(55, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0247', '', NULL, '2020-12-21 11:39:43', '7.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 10:39:43', '2020-12-21 10:39:43', NULL, NULL, 'inside'),
(56, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0248', '', NULL, '2020-12-21 11:41:35', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 10:41:36', '2020-12-21 10:41:36', NULL, NULL, 'inside'),
(57, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0249', '', NULL, '2020-12-21 14:51:14', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: ee', 'e - El Ghraa', 'ordered', 'ee', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"e\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 13:51:14', '2020-12-21 13:51:14', NULL, NULL, 'inside'),
(58, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0250', '', NULL, '2020-12-21 14:56:52', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 33224455', 'ewrewrewvewwrf vewtfrewfdr - El Ghraa', 'ordered', 'edwstfrewtew', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"ewrewrewvewwrf vewtfrewfdr\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 13:56:52', '2020-12-21 13:56:52', NULL, NULL, 'inside'),
(59, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0251', '', NULL, '2020-12-21 15:05:38', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 4325', 'ffsdfdsf - El Ghraa', 'ordered', 'dsgf', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"ffsdfdsf\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 14:05:38', '2020-12-21 14:05:38', NULL, NULL, 'inside'),
(60, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0252', '', NULL, '2020-12-21 13:02:32', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 12:02:32', '2020-12-21 12:02:32', NULL, NULL, 'inside'),
(61, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0253', '', NULL, '2020-12-21 13:10:42', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 12:10:42', '2020-12-21 12:10:42', NULL, NULL, 'inside'),
(62, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0254', '', NULL, '2020-12-21 13:33:59', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 12:33:59', '2020-12-21 12:33:59', NULL, NULL, 'inside'),
(63, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0255', '', NULL, '2020-12-21 16:30:24', '7.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 15:30:24', '2020-12-21 15:30:24', NULL, NULL, 'inside'),
(64, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0256', '', NULL, '2020-12-21 20:41:31', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 19:41:31', '2020-12-21 19:41:31', NULL, NULL, 'inside'),
(65, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0257', '', NULL, '2020-12-21 21:47:17', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 20:47:17', '2020-12-21 20:47:17', NULL, NULL, 'inside'),
(66, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0258', '', NULL, '2020-12-21 21:47:59', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-21 20:47:59', '2020-12-21 20:47:59', NULL, NULL, 'inside'),
(67, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0259', '', NULL, '2020-12-22 11:21:45', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 10:21:45', '2020-12-22 10:21:45', NULL, NULL, 'inside'),
(68, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0260', '', NULL, '2020-12-22 12:19:19', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 11:19:19', '2020-12-22 11:19:19', NULL, NULL, 'inside'),
(69, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0261', '', NULL, '2020-12-22 12:42:07', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 11:42:07', '2020-12-22 11:42:07', NULL, NULL, 'inside'),
(70, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0262', '', NULL, '2020-12-22 12:56:02', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 11:56:02', '2020-12-22 11:56:02', NULL, NULL, 'inside'),
(71, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0263', '', NULL, '2020-12-22 13:24:17', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 12:24:17', '2020-12-22 12:24:17', NULL, NULL, 'inside'),
(72, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0264', '', NULL, '2020-12-22 14:41:55', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 13:41:55', '2020-12-22 13:41:55', NULL, NULL, 'inside'),
(73, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0265', '', NULL, '2020-12-22 15:20:57', '3.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 14:20:57', '2020-12-22 14:20:57', NULL, NULL, 'inside'),
(74, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0266', '', NULL, '2020-12-22 18:23:55', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 17:23:55', '2020-12-22 17:23:55', NULL, NULL, 'inside'),
(75, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0267', '', NULL, '2020-12-22 19:19:48', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 18:19:48', '2020-12-22 18:19:48', NULL, NULL, 'inside'),
(76, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0268', '', NULL, '2020-12-22 20:11:19', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-22 19:11:19', '2020-12-22 19:11:19', NULL, NULL, 'inside'),
(77, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0269', '', NULL, '2020-12-23 13:38:51', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 12:38:51', '2020-12-23 12:38:51', NULL, NULL, 'inside'),
(78, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0270', '', NULL, '2020-12-23 16:56:13', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 12345678', 'test - Al Ahmdi', 'ordered', 'test', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"test\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 15:56:13', '2020-12-23 15:56:13', NULL, NULL, 'inside'),
(79, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0271', '', NULL, '2020-12-23 14:26:56', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 13:26:56', '2020-12-23 13:26:56', NULL, NULL, 'inside'),
(80, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0272', '', NULL, '2020-12-23 14:31:07', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 13:31:07', '2020-12-23 13:31:07', NULL, NULL, 'inside'),
(81, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0273', '', NULL, '2020-12-23 14:41:10', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 13:41:10', '2020-12-23 13:41:10', NULL, NULL, 'inside'),
(82, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0274', '', NULL, '2020-12-23 15:22:56', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 14:22:56', '2020-12-23 14:22:56', NULL, NULL, 'inside'),
(83, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0275', '', NULL, '2020-12-23 15:35:07', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 14:35:07', '2020-12-23 14:35:07', NULL, NULL, 'inside'),
(84, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0276', '', NULL, '2020-12-23 16:15:10', '4.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 15:15:10', '2020-12-23 15:15:10', NULL, NULL, 'inside'),
(85, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0277', '', NULL, '2020-12-23 18:37:21', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 17:37:21', '2020-12-23 17:37:21', NULL, NULL, 'inside'),
(86, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0278', '', NULL, '2020-12-23 20:00:04', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 19:00:04', '2020-12-23 19:00:04', NULL, NULL, 'inside'),
(87, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0279', '', NULL, '2020-12-23 20:45:53', '15.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '15.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 15, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 19:45:53', '2020-12-23 19:45:53', NULL, NULL, 'inside'),
(88, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0280', '', NULL, '2020-12-23 21:30:30', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-23 20:30:30', '2020-12-23 20:30:30', NULL, NULL, 'inside'),
(89, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0281', '', NULL, '2020-12-24 11:36:23', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 10:36:23', '2020-12-24 10:36:23', NULL, NULL, 'inside'),
(90, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0282', '', NULL, '2020-12-24 14:08:46', '2.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 13:08:46', '2020-12-24 13:08:46', NULL, NULL, 'inside'),
(91, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0283', '', NULL, '2020-12-24 14:26:06', '6.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 13:26:06', '2020-12-24 13:26:06', NULL, NULL, 'inside'),
(92, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0284', '', NULL, '2020-12-24 16:36:42', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 15:36:42', '2020-12-24 15:36:42', NULL, NULL, 'inside'),
(93, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0285', '', NULL, '2020-12-24 19:16:40', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 18:16:40', '2020-12-24 18:16:40', NULL, NULL, 'inside'),
(94, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0286', '', NULL, '2020-12-24 19:17:40', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 18:17:40', '2020-12-24 18:17:40', NULL, NULL, 'inside'),
(95, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0287', '', NULL, '2020-12-24 22:12:30', '3.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-24 21:12:30', '2020-12-24 21:12:30', NULL, NULL, 'inside'),
(96, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0288', '', NULL, '2020-12-26 16:29:50', '3.4700', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 77777777', 'kkkkkk - El Ghraa', 'ordered', 'aaaa', '1.0000', NULL, NULL, '3.4700', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 3, '[\"kkkkkk\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-26 15:29:50', '2020-12-26 15:29:50', NULL, NULL, 'inside'),
(97, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0289', '', NULL, '2020-12-26 16:32:27', '1.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 555555555', 'lllllllll - Holly', 'ordered', 'uuuuuu', '1.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 1, '[\"lllllllll\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-26 15:32:27', '2020-12-26 15:32:27', NULL, NULL, 'inside'),
(98, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0290', '', NULL, '2020-12-26 20:29:38', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-26 19:29:38', '2020-12-26 19:29:38', NULL, NULL, 'inside'),
(99, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2020-0291', '', NULL, '2020-12-27 12:32:46', '8.4100', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 01111378388', '12345 Zqee - Al Assema', 'ordered', 'Mustafa Hassan', '1.0000', NULL, NULL, '8.4100', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 8, '[\"12345 Zqee\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 11:32:46', '2020-12-27 11:32:46', NULL, NULL, 'inside'),
(100, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0292', '', NULL, '2020-12-27 12:47:34', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 11:47:34', '2020-12-27 11:47:34', NULL, NULL, 'inside'),
(101, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0293', '', NULL, '2020-12-27 12:49:45', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 11:49:45', '2020-12-27 11:49:45', NULL, NULL, 'inside'),
(102, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0294', '', NULL, '2020-12-27 13:48:08', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 12:48:09', '2020-12-27 12:48:09', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(103, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0295', '', NULL, '2020-12-27 13:49:39', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 12:49:39', '2020-12-27 12:49:39', NULL, NULL, 'inside'),
(104, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0296', '', NULL, '2020-12-27 14:25:16', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 13:25:16', '2020-12-27 13:25:16', NULL, NULL, 'inside'),
(105, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0297', '', NULL, '2020-12-27 14:28:36', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 13:28:36', '2020-12-27 13:28:36', NULL, NULL, 'inside'),
(106, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0298', '', NULL, '2020-12-27 15:26:47', '21.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '21.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 21, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-27 14:26:47', '2020-12-27 14:26:47', NULL, NULL, 'inside'),
(107, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0299', '', NULL, '2020-12-28 08:47:41', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 07:47:41', '2020-12-28 07:47:41', NULL, NULL, 'inside'),
(108, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0300', '', NULL, '2020-12-28 11:19:03', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 10:19:03', '2020-12-28 10:19:03', NULL, NULL, 'inside'),
(109, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0301', '', NULL, '2020-12-28 12:28:22', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 11:28:22', '2020-12-28 11:28:22', NULL, NULL, 'inside'),
(110, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0302', '', NULL, '2020-12-28 12:42:59', '3.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 11:42:59', '2020-12-28 11:42:59', NULL, NULL, 'inside'),
(111, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0303', '', NULL, '2020-12-28 13:35:28', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 12:35:28', '2020-12-28 12:35:28', NULL, NULL, 'inside'),
(112, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0304', '', NULL, '2020-12-28 13:36:32', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 12:36:32', '2020-12-28 12:36:32', NULL, NULL, 'inside'),
(113, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0305', '', NULL, '2020-12-28 13:52:19', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 12:52:19', '2020-12-28 12:52:19', NULL, NULL, 'inside'),
(114, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0306', '', NULL, '2020-12-28 14:32:27', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 13:32:27', '2020-12-28 13:32:27', NULL, NULL, 'inside'),
(115, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0307', '', NULL, '2020-12-28 14:42:54', '6.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 13:42:54', '2020-12-28 13:42:54', NULL, NULL, 'inside'),
(116, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0308', '', NULL, '2020-12-28 18:46:05', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 17:46:05', '2020-12-28 17:46:05', NULL, NULL, 'inside'),
(117, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0309', '', NULL, '2020-12-28 20:30:02', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 19:30:02', '2020-12-28 19:30:02', NULL, NULL, 'inside'),
(118, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0310', '', NULL, '2020-12-28 20:47:02', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 19:47:02', '2020-12-28 19:47:02', NULL, NULL, 'inside'),
(119, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0311', '', NULL, '2020-12-28 21:05:48', '3.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-28 20:05:48', '2020-12-28 20:05:48', NULL, NULL, 'inside'),
(120, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0312', '', NULL, '2020-12-29 11:11:23', '4.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 10:11:23', '2020-12-29 10:11:23', NULL, NULL, 'inside'),
(121, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0313', '', NULL, '2020-12-29 13:09:24', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 12:09:25', '2020-12-29 12:09:25', NULL, NULL, 'inside'),
(122, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0314', '', NULL, '2020-12-29 16:20:01', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 15:20:02', '2020-12-29 15:20:02', NULL, NULL, 'inside'),
(123, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0315', '', NULL, '2020-12-29 16:21:00', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 15:21:00', '2020-12-29 15:21:00', NULL, NULL, 'inside'),
(124, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0316', '', NULL, '2020-12-29 16:57:35', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 15:57:35', '2020-12-29 15:57:35', NULL, NULL, 'inside'),
(125, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0317', '', NULL, '2020-12-29 19:13:34', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 18:13:34', '2020-12-29 18:13:34', NULL, NULL, 'inside'),
(126, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0318', '', NULL, '2020-12-29 20:25:49', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-29 19:25:49', '2020-12-29 19:25:49', NULL, NULL, 'inside'),
(127, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0319', '', NULL, '2020-12-30 08:26:27', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 07:26:27', '2020-12-30 07:26:27', NULL, NULL, 'inside'),
(128, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0320', '', NULL, '2020-12-30 11:58:41', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 10:58:41', '2020-12-30 10:58:41', NULL, NULL, 'inside'),
(129, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0321', '', NULL, '2020-12-30 12:56:38', '8.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 11:56:38', '2020-12-30 11:56:38', NULL, NULL, 'inside'),
(130, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0322', '', NULL, '2020-12-30 13:00:51', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 12:00:51', '2020-12-30 12:00:51', NULL, NULL, 'inside'),
(131, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0323', '', NULL, '2020-12-30 13:27:49', '8.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 12:27:49', '2020-12-30 12:27:49', NULL, NULL, 'inside'),
(132, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0324', '', NULL, '2020-12-30 13:28:37', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 12:28:37', '2020-12-30 12:28:37', NULL, NULL, 'inside'),
(133, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0325', '', NULL, '2020-12-30 14:16:13', '2.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 13:16:13', '2020-12-30 13:16:13', NULL, NULL, 'inside'),
(134, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0326', '', NULL, '2020-12-30 14:17:00', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 13:17:00', '2020-12-30 13:17:00', NULL, NULL, 'inside'),
(135, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0327', '', NULL, '2020-12-30 14:18:11', '3.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 13:18:11', '2020-12-30 13:18:11', NULL, NULL, 'inside'),
(136, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0328', '', NULL, '2020-12-30 16:52:32', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 15:52:32', '2020-12-30 15:52:32', NULL, NULL, 'inside'),
(137, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0329', '', NULL, '2020-12-30 17:51:08', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 16:51:08', '2020-12-30 16:51:08', NULL, NULL, 'inside'),
(138, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0330', '', NULL, '2020-12-30 18:22:14', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 17:22:14', '2020-12-30 17:22:14', NULL, NULL, 'inside'),
(139, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0331', '', NULL, '2020-12-30 18:37:54', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 17:37:54', '2020-12-30 17:37:54', NULL, NULL, 'inside'),
(140, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0332', '', NULL, '2020-12-30 20:50:02', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-30 19:50:02', '2020-12-30 19:50:02', NULL, NULL, 'inside'),
(141, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0333', '', NULL, '2020-12-31 11:29:03', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 10:29:03', '2020-12-31 10:29:03', NULL, NULL, 'inside'),
(142, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0334', '', NULL, '2020-12-31 11:58:06', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 10:58:06', '2020-12-31 10:58:06', NULL, NULL, 'inside'),
(143, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0335', '', NULL, '2020-12-31 13:25:01', '5.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 12:25:01', '2020-12-31 12:25:01', NULL, NULL, 'inside'),
(144, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0336', '', NULL, '2020-12-31 13:25:47', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 12:25:47', '2020-12-31 12:25:47', NULL, NULL, 'inside'),
(145, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2020-0337', '', NULL, '2020-12-31 17:41:48', '5.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 16:41:48', '2020-12-31 16:41:48', NULL, NULL, 'inside'),
(148, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0340', '', NULL, '2021-01-02 20:03:34', '6.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-02 19:03:34', '2021-01-02 19:03:34', NULL, NULL, 'inside'),
(149, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0341', '', NULL, '2021-01-03 13:37:05', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-03 12:37:05', '2021-01-03 12:37:05', NULL, NULL, 'inside'),
(150, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2021-0342', '', NULL, '2021-01-03 16:59:33', '13.7200', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 888888888', 'ffff - Al Ahmdi', 'ordered', 'hhhhh', '1.0000', NULL, NULL, '13.7200', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 13, '[\"ffff\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-03 15:59:33', '2021-01-03 15:59:33', NULL, NULL, 'inside'),
(151, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0343', '', NULL, '2021-01-03 17:22:30', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-03 16:22:30', '2021-01-03 16:22:30', NULL, NULL, 'inside'),
(152, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0344', '', NULL, '2021-01-03 22:16:07', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-03 21:16:07', '2021-01-03 21:16:07', NULL, NULL, 'inside'),
(153, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0345', '', NULL, '2021-01-03 22:34:29', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-03 21:34:29', '2021-01-03 21:34:29', NULL, NULL, 'inside'),
(154, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0346', '', NULL, '2021-01-04 11:09:22', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 10:09:22', '2021-01-04 10:09:22', NULL, NULL, 'inside'),
(155, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0347', '', NULL, '2021-01-04 12:47:11', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 11:47:11', '2021-01-04 11:47:11', NULL, NULL, 'inside'),
(156, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0348', '', NULL, '2021-01-04 16:03:58', '5.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 15:03:58', '2021-01-04 15:03:58', NULL, NULL, 'inside'),
(157, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0349', '', NULL, '2021-01-04 16:44:48', '2.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 15:44:48', '2021-01-04 15:44:48', NULL, NULL, 'inside'),
(158, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0350', '', NULL, '2021-01-04 17:06:58', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 16:06:58', '2021-01-04 16:06:58', NULL, NULL, 'inside'),
(159, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0351', '', NULL, '2021-01-04 18:06:57', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 17:06:57', '2021-01-04 17:06:57', NULL, NULL, 'inside'),
(160, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0352', '', NULL, '2021-01-04 21:48:09', '2.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 20:48:09', '2021-01-04 20:48:09', NULL, NULL, 'inside'),
(161, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0353', '', NULL, '2021-01-05 10:14:45', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 09:14:45', '2021-01-05 09:14:45', NULL, NULL, 'inside'),
(162, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0354', '', NULL, '2021-01-05 10:51:46', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 09:51:46', '2021-01-05 09:51:46', NULL, NULL, 'inside'),
(163, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0355', '', NULL, '2021-01-05 12:49:43', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 11:49:43', '2021-01-05 11:49:43', NULL, NULL, 'inside'),
(164, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2021-0356', '', NULL, '2021-01-05 16:07:15', '3.1500', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 87987987987', '56,uuyui - El Ghraa', 'ordered', 'iuoiu', '1.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 3, '[\"56,uuyui\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 15:07:15', '2021-01-05 15:07:15', NULL, NULL, 'inside'),
(165, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0357', '', NULL, '2021-01-05 14:37:28', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 13:37:28', '2021-01-05 13:37:28', NULL, NULL, 'inside'),
(166, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0358', '', NULL, '2021-01-05 15:09:10', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 14:09:10', '2021-01-05 14:09:10', NULL, NULL, 'inside'),
(167, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0359', '', NULL, '2021-01-05 17:12:56', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 16:12:56', '2021-01-05 16:12:56', NULL, NULL, 'inside'),
(168, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0360', '', NULL, '2021-01-05 17:46:04', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 16:46:04', '2021-01-05 16:46:04', NULL, NULL, 'inside'),
(169, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0361', '', NULL, '2021-01-05 19:50:20', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 18:50:20', '2021-01-05 18:50:20', NULL, NULL, 'inside'),
(170, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0362', '', NULL, '2021-01-05 20:01:57', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-05 19:01:57', '2021-01-05 19:01:57', NULL, NULL, 'inside'),
(171, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0363', '', NULL, '2021-01-06 08:43:46', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 07:43:46', '2021-01-06 07:43:46', NULL, NULL, 'inside'),
(172, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0364', '', NULL, '2021-01-06 12:12:50', '7.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 11:12:50', '2021-01-06 11:12:50', NULL, NULL, 'inside'),
(173, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0365', '', NULL, '2021-01-06 12:31:31', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 11:31:31', '2021-01-06 11:31:31', NULL, NULL, 'inside'),
(174, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0366', '', NULL, '2021-01-06 13:19:12', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 12:19:12', '2021-01-06 12:19:12', NULL, NULL, 'inside'),
(175, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0367', '', NULL, '2021-01-06 14:44:21', '5.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 13:44:21', '2021-01-06 13:44:21', NULL, NULL, 'inside'),
(176, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0368', '', NULL, '2021-01-06 16:21:08', '19.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '19.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 19, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 15:21:08', '2021-01-06 15:21:08', NULL, NULL, 'inside'),
(177, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0369', '', NULL, '2021-01-06 19:50:30', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 18:50:30', '2021-01-06 18:50:30', NULL, NULL, 'inside'),
(178, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0370', '', NULL, '2021-01-06 21:36:10', '4.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 20:36:10', '2021-01-06 20:36:10', NULL, NULL, 'inside'),
(179, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0371', '', NULL, '2021-01-06 22:29:48', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 21:29:48', '2021-01-06 21:29:48', NULL, NULL, 'inside'),
(180, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0372', '', NULL, '2021-01-06 22:30:50', '0.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-06 21:30:50', '2021-01-06 21:30:50', NULL, NULL, 'inside'),
(181, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0373', '', NULL, '2021-01-07 09:00:26', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 08:00:26', '2021-01-07 08:00:26', NULL, NULL, 'inside'),
(182, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0374', '', NULL, '2021-01-07 09:35:04', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 08:35:04', '2021-01-07 08:35:04', NULL, NULL, 'inside'),
(183, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0375', '', NULL, '2021-01-07 09:35:59', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 08:35:59', '2021-01-07 08:35:59', NULL, NULL, 'inside'),
(184, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0376', '', NULL, '2021-01-07 10:04:24', '4.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 09:04:24', '2021-01-07 09:04:24', NULL, NULL, 'inside'),
(185, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0377', '', NULL, '2021-01-07 11:29:36', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 10:29:36', '2021-01-07 10:29:36', NULL, NULL, 'inside'),
(187, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0379', '', NULL, '2021-01-07 13:28:39', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 12:28:39', '2021-01-07 12:28:39', NULL, NULL, 'inside'),
(188, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2021-0380', '', NULL, '2021-01-07 16:03:45', '2.0000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 97197019', '1234 - Al Assema', 'ordered', 'Dondon', '1.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 2, '[\"1234\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 15:03:45', '2021-01-07 15:03:45', NULL, NULL, 'inside'),
(189, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0381', '', NULL, '2021-01-07 14:05:51', '1.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 13:05:51', '2021-01-07 13:05:51', NULL, NULL, 'inside'),
(190, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0382', '', NULL, '2021-01-07 14:47:46', '6.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 13:47:46', '2021-01-07 13:47:46', NULL, NULL, 'inside'),
(191, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0383', '', NULL, '2021-01-07 17:23:08', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-07 16:23:08', '2021-01-07 16:23:08', NULL, NULL, 'inside'),
(192, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0384', '', NULL, '2021-01-09 15:22:14', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-09 14:22:14', '2021-01-09 14:22:14', NULL, NULL, 'inside'),
(193, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0385', '', NULL, '2021-01-09 15:27:04', '4.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-09 14:27:04', '2021-01-09 14:27:04', NULL, NULL, 'inside'),
(194, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0386', '', NULL, '2021-01-09 15:40:27', '0.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-09 14:40:27', '2021-01-09 14:40:27', NULL, NULL, 'inside'),
(195, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0387', '', NULL, '2021-01-09 16:28:59', '4.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-09 15:28:59', '2021-01-09 15:28:59', NULL, NULL, 'inside'),
(196, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0388', '', NULL, '2021-01-09 19:04:17', '8.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-09 18:04:17', '2021-01-09 18:04:18', NULL, NULL, 'inside'),
(197, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0389', '', NULL, '2021-01-10 12:15:16', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 11:15:16', '2021-01-10 11:15:16', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(198, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0390', '', NULL, '2021-01-10 13:39:31', '4.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 12:39:31', '2021-01-10 12:39:31', NULL, NULL, 'inside'),
(199, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0391', '', NULL, '2021-01-10 14:02:53', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 13:02:53', '2021-01-10 13:02:53', NULL, NULL, 'inside'),
(200, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0392', '', NULL, '2021-01-10 14:26:50', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 13:26:50', '2021-01-10 13:26:50', NULL, NULL, 'inside'),
(201, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0393', '', NULL, '2021-01-10 16:50:09', '12.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 15:50:09', '2021-01-10 15:50:09', NULL, NULL, 'inside'),
(202, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0394', '', NULL, '2021-01-10 17:03:14', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 16:03:14', '2021-01-10 16:03:14', NULL, NULL, 'inside'),
(203, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0395', '', NULL, '2021-01-10 18:01:41', '9.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 17:01:41', '2021-01-10 17:01:41', NULL, NULL, 'inside'),
(204, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0396', '', NULL, '2021-01-10 19:29:22', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 18:29:22', '2021-01-10 18:29:22', NULL, NULL, 'inside'),
(205, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0397', '', NULL, '2021-01-10 21:08:58', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-10 20:08:58', '2021-01-10 20:08:58', NULL, NULL, 'inside'),
(206, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0398', '', NULL, '2021-01-11 14:57:37', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-11 13:57:37', '2021-01-11 13:57:37', NULL, NULL, 'inside'),
(207, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0399', '', NULL, '2021-01-11 16:42:59', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-11 15:42:59', '2021-01-11 15:42:59', NULL, NULL, 'inside'),
(208, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0400', '', NULL, '2021-01-11 17:49:23', '1.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-11 16:49:23', '2021-01-11 16:49:23', NULL, NULL, 'inside'),
(209, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0401', '', NULL, '2021-01-11 20:18:38', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-11 19:18:38', '2021-01-11 19:18:38', NULL, NULL, 'inside'),
(210, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0402', '', NULL, '2021-01-11 20:19:21', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-11 19:19:21', '2021-01-11 19:19:21', NULL, NULL, 'inside'),
(211, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0403', '', NULL, '2021-01-12 08:53:08', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 07:53:08', '2021-01-12 07:53:08', NULL, NULL, 'inside'),
(212, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0404', '', NULL, '2021-01-12 09:08:49', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 08:08:49', '2021-01-12 08:08:49', NULL, NULL, 'inside'),
(213, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0405', '', NULL, '2021-01-12 09:19:39', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 08:19:39', '2021-01-12 08:19:39', NULL, NULL, 'inside'),
(214, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0406', '', NULL, '2021-01-12 12:55:33', '3.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 11:55:33', '2021-01-12 11:55:33', NULL, NULL, 'inside'),
(215, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0407', '', NULL, '2021-01-12 12:59:05', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 11:59:05', '2021-01-12 11:59:05', NULL, NULL, 'inside'),
(216, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0408', '', NULL, '2021-01-12 16:12:35', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 15:12:35', '2021-01-12 15:12:35', NULL, NULL, 'inside'),
(217, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0409', '', NULL, '2021-01-12 20:48:30', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 19:48:30', '2021-01-12 19:48:30', NULL, NULL, 'inside'),
(218, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0410', '', NULL, '2021-01-12 21:42:33', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-12 20:42:33', '2021-01-12 20:42:33', NULL, NULL, 'inside'),
(219, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0411', '', NULL, '2021-01-13 09:24:52', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 08:24:52', '2021-01-13 08:24:52', NULL, NULL, 'inside'),
(220, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0412', '', NULL, '2021-01-13 13:14:11', '4.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 12:14:11', '2021-01-13 12:14:11', NULL, NULL, 'inside'),
(221, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0413', '', NULL, '2021-01-13 13:15:08', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 12:15:08', '2021-01-13 12:15:08', NULL, NULL, 'inside'),
(222, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0414', '', NULL, '2021-01-13 13:24:46', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 12:24:46', '2021-01-13 12:24:46', NULL, NULL, 'inside'),
(223, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0415', '', NULL, '2021-01-13 15:32:27', '5.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 14:32:27', '2021-01-13 14:32:27', NULL, NULL, 'inside'),
(224, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0416', '', NULL, '2021-01-13 17:55:21', '7.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 16:55:21', '2021-01-13 16:55:21', NULL, NULL, 'inside'),
(225, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0417', '', NULL, '2021-01-13 18:56:21', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 17:56:21', '2021-01-13 17:56:21', NULL, NULL, 'inside'),
(226, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0418', '', NULL, '2021-01-13 21:05:54', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 20:05:54', '2021-01-13 20:05:54', NULL, NULL, 'inside'),
(227, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0419', '', NULL, '2021-01-13 21:16:18', '0.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-13 20:16:18', '2021-01-13 20:16:18', NULL, NULL, 'inside'),
(228, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0420', '', NULL, '2021-01-14 11:32:18', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 10:32:18', '2021-01-14 10:32:18', NULL, NULL, 'inside'),
(229, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0421', '', NULL, '2021-01-14 13:30:53', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 12:30:53', '2021-01-14 12:30:53', NULL, NULL, 'inside'),
(230, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0422', '', NULL, '2021-01-14 16:47:59', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 15:47:59', '2021-01-14 15:47:59', NULL, NULL, 'inside'),
(231, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0423', '', NULL, '2021-01-14 19:27:50', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 18:27:50', '2021-01-14 18:27:50', NULL, NULL, 'inside'),
(232, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0424', '', NULL, '2021-01-14 19:48:01', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 18:48:01', '2021-01-14 18:48:01', NULL, NULL, 'inside'),
(233, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0425', '', NULL, '2021-01-14 21:20:15', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 20:20:15', '2021-01-14 20:20:15', NULL, NULL, 'inside'),
(234, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0426', '', NULL, '2021-01-14 21:55:01', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-14 20:55:01', '2021-01-14 20:55:01', NULL, NULL, 'inside'),
(235, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0427', '', NULL, '2021-01-16 14:50:21', '5.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-16 13:50:21', '2021-01-16 13:50:21', NULL, NULL, 'inside'),
(236, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0428', '', NULL, '2021-01-16 16:07:18', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-16 15:07:18', '2021-01-16 15:07:18', NULL, NULL, 'inside'),
(237, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0429', '', NULL, '2021-01-16 17:55:51', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-16 16:55:51', '2021-01-16 16:55:51', NULL, NULL, 'inside'),
(238, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0430', '', NULL, '2021-01-16 20:24:05', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-16 19:24:05', '2021-01-16 19:24:05', NULL, NULL, 'inside'),
(239, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0431', '', NULL, '2021-01-17 09:57:02', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 08:57:02', '2021-01-17 08:57:02', NULL, NULL, 'inside'),
(240, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0432', '', NULL, '2021-01-17 12:55:25', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 11:55:25', '2021-01-17 11:55:25', NULL, NULL, 'inside'),
(241, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0433', '', NULL, '2021-01-17 13:18:06', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 12:18:06', '2021-01-17 12:18:06', NULL, NULL, 'inside'),
(242, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0434', '', NULL, '2021-01-17 13:32:38', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 12:32:39', '2021-01-17 12:32:39', NULL, NULL, 'inside'),
(243, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0435', '', NULL, '2021-01-17 13:52:51', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 12:52:51', '2021-01-17 12:52:51', NULL, NULL, 'inside'),
(244, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0436', '', NULL, '2021-01-17 16:03:10', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 15:03:10', '2021-01-17 15:03:10', NULL, NULL, 'inside'),
(245, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0437', '', NULL, '2021-01-17 18:22:44', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 17:22:44', '2021-01-17 17:22:44', NULL, NULL, 'inside'),
(246, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0438', '', NULL, '2021-01-17 18:48:58', '4.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-17 17:48:58', '2021-01-17 17:48:58', NULL, NULL, 'inside'),
(247, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0439', '', NULL, '2021-01-18 14:44:09', '3.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-18 13:44:09', '2021-01-18 13:44:09', NULL, NULL, 'inside'),
(248, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0440', '', NULL, '2021-01-18 16:36:27', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-18 15:36:27', '2021-01-18 15:36:27', NULL, NULL, 'inside'),
(249, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0441', '', NULL, '2021-01-18 20:05:37', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-18 19:05:37', '2021-01-18 19:05:37', NULL, NULL, 'inside'),
(250, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0442', '', NULL, '2021-01-18 20:10:51', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-18 19:10:51', '2021-01-18 19:10:51', NULL, NULL, 'inside'),
(251, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0443', '', NULL, '2021-01-18 21:45:30', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-18 20:45:30', '2021-01-18 20:45:30', NULL, NULL, 'inside'),
(252, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0444', '', NULL, '2021-01-19 10:09:41', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 09:09:41', '2021-01-19 09:09:41', NULL, NULL, 'inside'),
(253, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0445', '', NULL, '2021-01-19 14:21:03', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 13:21:03', '2021-01-19 13:21:03', NULL, NULL, 'inside'),
(254, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0446', '', NULL, '2021-01-19 15:19:45', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 14:19:45', '2021-01-19 14:19:45', NULL, NULL, 'inside'),
(255, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0447', '', NULL, '2021-01-19 15:46:33', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 14:46:33', '2021-01-19 14:46:33', NULL, NULL, 'inside'),
(256, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0448', '', NULL, '2021-01-19 16:31:32', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 15:31:32', '2021-01-19 15:31:32', NULL, NULL, 'inside'),
(257, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0449', '', NULL, '2021-01-19 19:24:42', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 18:24:42', '2021-01-19 18:24:42', NULL, NULL, 'inside'),
(258, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0450', '', NULL, '2021-01-19 20:22:09', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 19:22:09', '2021-01-19 19:22:10', NULL, NULL, 'inside'),
(259, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0451', '', NULL, '2021-01-19 20:23:21', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-19 19:23:21', '2021-01-19 19:23:21', NULL, NULL, 'inside'),
(260, 1, 1, 20, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0452', '', NULL, '2021-01-20 09:46:06', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 08:46:06', '2021-01-20 08:46:06', NULL, NULL, 'inside'),
(261, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0453', '', NULL, '2021-01-20 12:41:04', '3.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 11:41:04', '2021-01-20 11:41:04', NULL, NULL, 'inside'),
(262, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0454', '', NULL, '2021-01-20 14:00:19', '3.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 13:00:19', '2021-01-20 13:00:19', NULL, NULL, 'inside'),
(263, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0455', '', NULL, '2021-01-20 16:01:54', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 15:01:54', '2021-01-20 15:01:54', NULL, NULL, 'inside'),
(264, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0456', '', NULL, '2021-01-20 16:36:19', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 15:36:19', '2021-01-20 15:36:19', NULL, NULL, 'inside'),
(265, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0457', '', NULL, '2021-01-20 18:07:29', '3.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 17:07:29', '2021-01-20 17:07:29', NULL, NULL, 'inside'),
(266, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0458', '', NULL, '2021-01-20 21:19:45', '3.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-20 20:19:45', '2021-01-20 20:19:45', NULL, NULL, 'inside'),
(267, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0459', '', NULL, '2021-01-21 08:51:02', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 07:51:02', '2021-01-21 07:51:02', NULL, NULL, 'inside'),
(268, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0460', '', NULL, '2021-01-21 14:09:50', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 13:09:50', '2021-01-21 13:09:50', NULL, NULL, 'inside'),
(269, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0461', '', NULL, '2021-01-21 14:17:21', '4.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 13:17:21', '2021-01-21 13:17:21', NULL, NULL, 'inside'),
(270, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0462', '', NULL, '2021-01-21 16:19:59', '8.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 15:19:59', '2021-01-21 15:19:59', NULL, NULL, 'inside'),
(271, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0463', '', NULL, '2021-01-21 16:36:48', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 15:36:48', '2021-01-21 15:36:48', NULL, NULL, 'inside'),
(272, 1, 1, 6, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0464', '', NULL, '2021-01-21 17:40:59', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 16:40:59', '2021-01-21 16:40:59', NULL, NULL, 'inside'),
(273, 1, 1, 6, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0465', '', NULL, '2021-01-21 17:42:08', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 16:42:08', '2021-01-21 16:42:08', NULL, NULL, 'inside'),
(274, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0466', '', NULL, '2021-01-21 17:44:15', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-21 16:44:15', '2021-01-21 16:44:15', NULL, NULL, 'inside'),
(275, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0467', '', NULL, '2021-01-23 16:57:02', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 15:57:02', '2021-01-23 15:57:02', NULL, NULL, 'inside'),
(276, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0468', '', NULL, '2021-01-23 19:17:08', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 18:17:08', '2021-01-23 18:17:08', NULL, NULL, 'inside'),
(277, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0469', '', NULL, '2021-01-24 08:51:05', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 07:51:05', '2021-01-24 07:51:05', NULL, NULL, 'inside'),
(278, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0470', '', NULL, '2021-01-24 09:58:09', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 08:58:09', '2021-01-24 08:58:09', NULL, NULL, 'inside'),
(279, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0471', '', NULL, '2021-01-24 14:38:49', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 13:38:49', '2021-01-24 13:38:49', NULL, NULL, 'inside'),
(280, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0472', '', NULL, '2021-01-24 16:33:34', '6.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 15:33:34', '2021-01-24 15:33:34', NULL, NULL, 'inside'),
(281, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0473', '', NULL, '2021-01-24 22:22:24', '4.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 21:22:24', '2021-01-24 21:22:24', NULL, NULL, 'inside'),
(282, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0474', '', NULL, '2021-01-25 12:26:37', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 11:26:37', '2021-01-25 11:26:37', NULL, NULL, 'inside'),
(283, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0475', '', NULL, '2021-01-25 13:03:06', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 12:03:06', '2021-01-25 12:03:06', NULL, NULL, 'inside'),
(284, 1, 1, NULL, NULL, 'cooked', 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0476', '', NULL, '2021-01-25 13:03:49', '3.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 12:03:49', '2021-01-25 15:22:14', '0, 449, 450', NULL, 'inside'),
(285, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0477', '', NULL, '2021-01-25 14:11:27', '3.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 13:11:27', '2021-01-25 13:11:27', NULL, NULL, 'inside'),
(286, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0478', '', NULL, '2021-01-25 14:12:09', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 13:12:09', '2021-01-25 13:12:09', NULL, NULL, 'inside'),
(287, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0479', '', NULL, '2021-01-25 15:18:21', '2.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 14:18:21', '2021-01-25 14:18:21', NULL, NULL, 'inside'),
(288, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0480', '', NULL, '2021-01-25 17:22:57', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 16:22:57', '2021-01-25 16:22:57', NULL, NULL, 'inside'),
(289, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0481', '', NULL, '2021-01-25 18:10:51', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 17:10:51', '2021-01-25 17:10:51', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(290, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0482', '', NULL, '2021-01-25 21:25:45', '6.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 20:25:45', '2021-01-25 20:25:45', NULL, NULL, 'inside'),
(291, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0483', '', NULL, '2021-01-25 22:27:21', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-25 21:27:21', '2021-01-25 21:27:21', NULL, NULL, 'inside'),
(292, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0484', '', NULL, '2021-01-26 13:13:07', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 12:13:07', '2021-01-26 12:13:07', NULL, NULL, 'inside'),
(293, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0485', '', NULL, '2021-01-26 15:05:21', '3.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 14:05:21', '2021-01-26 14:05:21', NULL, NULL, 'inside'),
(294, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0486', '', NULL, '2021-01-26 15:47:47', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 14:47:47', '2021-01-26 14:47:47', NULL, NULL, 'inside'),
(295, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0487', '', NULL, '2021-01-26 22:31:48', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-26 21:31:48', '2021-01-26 21:31:48', NULL, NULL, 'inside'),
(296, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0488', '', NULL, '2021-01-27 09:59:12', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 08:59:12', '2021-01-27 08:59:12', NULL, NULL, 'inside'),
(297, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0489', '', NULL, '2021-01-27 11:37:09', '0.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 10:37:09', '2021-01-27 10:37:09', NULL, NULL, 'inside'),
(298, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0490', '', NULL, '2021-01-27 12:08:12', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 11:08:12', '2021-01-27 11:08:12', NULL, NULL, 'inside'),
(299, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0491', '', NULL, '2021-01-27 13:08:20', '1.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 12:08:20', '2021-01-27 12:08:20', NULL, NULL, 'inside'),
(300, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0492', '', NULL, '2021-01-27 13:10:22', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 12:10:22', '2021-01-27 12:10:22', NULL, NULL, 'inside'),
(301, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0493', '', NULL, '2021-01-27 14:33:18', '4.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 13:33:18', '2021-01-27 13:33:18', NULL, NULL, 'inside'),
(302, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0494', '', NULL, '2021-01-27 21:17:40', '4.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-27 20:17:40', '2021-01-27 20:17:40', NULL, NULL, 'inside'),
(303, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0495', '', NULL, '2021-01-28 13:53:21', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 12:53:21', '2021-01-28 12:53:21', NULL, NULL, 'inside'),
(304, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0496', '', NULL, '2021-01-28 17:57:04', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 16:57:04', '2021-01-28 16:57:04', NULL, NULL, 'inside'),
(305, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0497', '', NULL, '2021-01-28 18:42:19', '5.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 17:42:19', '2021-01-28 17:42:19', NULL, NULL, 'inside'),
(306, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0498', '', NULL, '2021-01-28 20:07:32', '8.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-28 19:07:32', '2021-01-28 19:07:32', NULL, NULL, 'inside'),
(307, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0499', '', NULL, '2021-01-30 19:58:51', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-30 18:58:51', '2021-01-30 18:58:51', NULL, NULL, 'inside'),
(308, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0500', '', NULL, '2021-01-31 13:06:21', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 12:06:21', '2021-01-31 12:06:21', NULL, NULL, 'inside'),
(309, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0501', '', NULL, '2021-01-31 13:41:12', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 12:41:12', '2021-01-31 12:41:12', NULL, NULL, 'inside'),
(310, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0502', '', NULL, '2021-01-31 18:37:32', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-31 17:37:32', '2021-01-31 17:37:32', NULL, NULL, 'inside'),
(311, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0503', '', NULL, '2021-02-01 08:34:54', '1.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 07:34:54', '2021-02-01 07:34:54', NULL, NULL, 'inside'),
(312, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0504', '', NULL, '2021-02-01 10:01:49', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 09:01:49', '2021-02-01 09:01:49', NULL, NULL, 'inside'),
(313, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0505', '', NULL, '2021-02-01 10:54:15', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 09:54:15', '2021-02-01 09:54:15', NULL, NULL, 'inside'),
(314, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0506', '', NULL, '2021-02-01 11:45:25', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 10:45:25', '2021-02-01 10:45:25', NULL, NULL, 'inside'),
(315, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0507', '', NULL, '2021-02-01 12:27:57', '2.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 11:27:57', '2021-02-01 11:27:57', NULL, NULL, 'inside'),
(316, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0508', '', NULL, '2021-02-01 13:49:36', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 12:49:36', '2021-02-01 12:49:36', NULL, NULL, 'inside'),
(317, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0509', '', NULL, '2021-02-01 18:59:59', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-01 17:59:59', '2021-02-01 17:59:59', NULL, NULL, 'inside'),
(318, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0510', '', NULL, '2021-02-02 10:29:26', '4.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-02 09:29:26', '2021-02-02 09:29:26', NULL, NULL, 'inside'),
(319, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0511', '', NULL, '2021-02-02 12:24:18', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-02 11:24:18', '2021-02-02 11:24:18', NULL, NULL, 'inside'),
(320, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0512', '', NULL, '2021-02-02 13:37:14', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-02 12:37:14', '2021-02-02 12:37:14', NULL, NULL, 'inside'),
(321, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0513', '', NULL, '2021-02-02 21:49:32', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-02 20:49:32', '2021-02-02 20:49:32', NULL, NULL, 'inside'),
(322, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0514', '', NULL, '2021-02-03 07:49:40', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 06:49:40', '2021-02-03 06:49:40', NULL, NULL, 'inside'),
(323, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0515', '', NULL, '2021-02-03 11:03:32', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 10:03:32', '2021-02-03 10:03:32', NULL, NULL, 'inside'),
(324, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0516', '', NULL, '2021-02-03 13:11:13', '12.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 12:11:13', '2021-02-03 12:11:14', NULL, NULL, 'inside'),
(325, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0517', '', NULL, '2021-02-03 14:25:26', '1.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 13:25:26', '2021-02-03 13:25:26', NULL, NULL, 'inside'),
(326, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0518', '', NULL, '2021-02-03 14:47:36', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 13:47:36', '2021-02-03 13:47:36', NULL, NULL, 'inside'),
(327, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0519', '', NULL, '2021-02-03 16:32:05', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 15:32:05', '2021-02-03 15:32:05', NULL, NULL, 'inside'),
(328, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0520', '', NULL, '2021-02-03 16:57:21', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 15:57:21', '2021-02-03 15:57:21', NULL, NULL, 'inside'),
(329, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0521', '', NULL, '2021-02-03 17:45:24', '5.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 16:45:24', '2021-02-03 16:45:24', NULL, NULL, 'inside'),
(330, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0522', '', NULL, '2021-02-03 22:38:57', '5.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-03 21:38:57', '2021-02-03 21:38:57', NULL, NULL, 'inside'),
(331, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0523', '', NULL, '2021-02-04 15:32:04', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-04 14:32:04', '2021-02-04 14:32:04', NULL, NULL, 'inside'),
(332, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0524', '', NULL, '2021-02-04 17:12:58', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-04 16:12:58', '2021-02-04 16:12:58', NULL, NULL, 'inside'),
(333, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0525', '', NULL, '2021-02-04 19:37:48', '14.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '14.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 14, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-04 18:37:48', '2021-02-04 18:37:48', NULL, NULL, 'inside'),
(334, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0526', '', NULL, '2021-02-04 20:15:27', '4.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-04 19:15:27', '2021-02-04 19:15:27', NULL, NULL, 'inside'),
(335, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0527', '', NULL, '2021-02-04 22:17:14', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-04 21:17:14', '2021-02-04 21:17:14', NULL, NULL, 'inside'),
(336, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0528', '', NULL, '2021-02-06 16:01:55', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-06 15:01:55', '2021-02-06 15:01:55', NULL, NULL, 'inside'),
(337, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0529', '', NULL, '2021-02-06 19:51:17', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-06 18:51:17', '2021-02-06 18:51:17', NULL, NULL, 'inside'),
(338, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0530', '', NULL, '2021-02-07 12:22:47', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-07 11:22:47', '2021-02-07 11:22:47', NULL, NULL, 'inside'),
(339, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0531', '', NULL, '2021-02-07 13:06:12', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-07 12:06:12', '2021-02-07 12:06:12', NULL, NULL, 'inside'),
(340, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0532', '', NULL, '2021-02-07 16:22:27', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-07 15:22:27', '2021-02-07 15:22:27', NULL, NULL, 'inside'),
(341, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0533', '', NULL, '2021-02-07 19:09:31', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-07 18:09:31', '2021-02-07 18:09:31', NULL, NULL, 'inside'),
(342, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0534', '', NULL, '2021-02-08 15:58:37', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-08 14:58:37', '2021-02-08 14:58:37', NULL, NULL, 'inside'),
(343, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0535', '', NULL, '2021-02-09 12:04:23', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 11:04:23', '2021-02-09 11:04:23', NULL, NULL, 'inside'),
(344, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0536', '', NULL, '2021-02-09 13:03:06', '6.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 12:03:06', '2021-02-09 12:03:06', NULL, NULL, 'inside'),
(345, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0537', '', NULL, '2021-02-09 14:15:46', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 13:15:46', '2021-02-09 13:15:46', NULL, NULL, 'inside'),
(346, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0538', '', NULL, '2021-02-09 14:16:27', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 13:16:27', '2021-02-09 13:16:27', NULL, NULL, 'inside'),
(347, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0539', '', NULL, '2021-02-09 15:02:46', '7.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 14:02:46', '2021-02-09 14:02:46', NULL, NULL, 'inside'),
(348, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0540', '', NULL, '2021-02-09 15:29:09', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 14:29:09', '2021-02-09 14:29:09', NULL, NULL, 'inside'),
(349, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0541', '', NULL, '2021-02-09 18:50:30', '9.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 17:50:30', '2021-02-09 17:50:30', NULL, NULL, 'inside'),
(350, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0542', '', NULL, '2021-02-09 18:59:34', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 17:59:34', '2021-02-09 17:59:34', NULL, NULL, 'inside'),
(351, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0543', '', NULL, '2021-02-09 20:59:56', '1.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-09 19:59:56', '2021-02-09 19:59:56', NULL, NULL, 'inside'),
(352, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0544', '', NULL, '2021-02-10 10:51:10', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 09:51:10', '2021-02-10 09:51:10', NULL, NULL, 'inside'),
(353, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0545', '', NULL, '2021-02-10 16:49:15', '3.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 15:49:15', '2021-02-10 15:49:15', NULL, NULL, 'inside'),
(354, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0546', '', NULL, '2021-02-10 18:07:33', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 17:07:33', '2021-02-10 17:07:33', NULL, NULL, 'inside'),
(355, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0547', '', NULL, '2021-02-10 18:18:37', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 17:18:37', '2021-02-10 17:18:37', NULL, NULL, 'inside'),
(356, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0548', '', NULL, '2021-02-10 19:58:00', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 18:58:00', '2021-02-10 18:58:00', NULL, NULL, 'inside'),
(357, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0549', '', NULL, '2021-02-10 20:18:31', '7.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-10 19:18:31', '2021-02-10 19:18:31', NULL, NULL, 'inside'),
(358, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0550', '', NULL, '2021-02-11 11:56:20', '0.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 10:56:20', '2021-02-11 10:56:20', NULL, NULL, 'inside'),
(359, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0551', '', NULL, '2021-02-11 12:17:25', '7.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 11:17:25', '2021-02-11 11:17:25', NULL, NULL, 'inside'),
(360, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0552', '', NULL, '2021-02-11 13:36:23', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 12:36:23', '2021-02-11 12:36:23', NULL, NULL, 'inside'),
(361, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0553', '', NULL, '2021-02-11 15:02:05', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 14:02:05', '2021-02-11 14:02:05', NULL, NULL, 'inside'),
(362, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0554', '', NULL, '2021-02-11 16:03:05', '4.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 15:03:05', '2021-02-11 15:03:05', NULL, NULL, 'inside'),
(363, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0555', '', NULL, '2021-02-11 21:35:20', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-11 20:35:20', '2021-02-11 20:35:20', NULL, NULL, 'inside'),
(364, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0556', '', NULL, '2021-02-13 15:06:50', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-13 14:06:50', '2021-02-13 14:06:50', NULL, NULL, 'inside'),
(365, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0557', '', NULL, '2021-02-13 17:36:59', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-13 16:36:59', '2021-02-14 12:07:18', '0, 595', NULL, 'inside'),
(366, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0558', '', NULL, '2021-02-13 17:55:42', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-13 16:55:42', '2021-02-13 16:55:42', NULL, NULL, 'inside'),
(367, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0559', '', NULL, '2021-02-14 16:53:46', '4.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-14 15:53:46', '2021-02-14 15:53:46', NULL, NULL, 'inside'),
(368, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0560', '', NULL, '2021-02-14 18:28:21', '4.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-14 17:28:21', '2021-02-14 17:28:21', NULL, NULL, 'inside'),
(369, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0561', '', NULL, '2021-02-14 19:45:50', '0.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-14 18:45:50', '2021-02-14 18:45:50', NULL, NULL, 'inside'),
(370, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0562', '', NULL, '2021-02-15 10:43:01', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-15 09:43:01', '2021-02-15 09:43:01', NULL, NULL, 'inside'),
(371, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0563', '', NULL, '2021-02-15 17:35:09', '9.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-15 16:35:09', '2021-02-15 16:35:09', NULL, NULL, 'inside'),
(372, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0564', '', NULL, '2021-02-15 18:33:16', '1.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-15 17:33:16', '2021-02-15 17:33:16', NULL, NULL, 'inside'),
(373, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0565', '', NULL, '2021-02-15 19:33:29', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-15 18:33:29', '2021-02-15 18:33:29', NULL, NULL, 'inside'),
(374, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0566', '', NULL, '2021-02-16 13:04:14', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-16 12:04:14', '2021-02-16 12:04:14', NULL, NULL, 'inside'),
(375, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0567', '', NULL, '2021-02-16 14:41:43', '9.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-16 13:41:43', '2021-02-16 13:41:43', NULL, NULL, 'inside'),
(376, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0568', '', NULL, '2021-02-16 20:23:36', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-16 19:23:36', '2021-02-16 19:23:36', NULL, NULL, 'inside'),
(377, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0569', '', NULL, '2021-02-16 22:38:24', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-16 21:38:24', '2021-02-16 21:38:24', NULL, NULL, 'inside'),
(378, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0570', '', NULL, '2021-02-17 16:45:18', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-17 15:45:18', '2021-02-17 15:45:18', NULL, NULL, 'inside'),
(379, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0571', '', NULL, '2021-02-18 13:51:19', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 12:51:19', '2021-02-18 12:51:20', NULL, NULL, 'inside'),
(380, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0572', '', NULL, '2021-02-18 13:52:17', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 12:52:17', '2021-02-18 12:52:17', NULL, NULL, 'inside'),
(381, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0573', '', NULL, '2021-02-18 14:55:21', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 13:55:21', '2021-02-18 13:55:21', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(382, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0574', '', NULL, '2021-02-18 15:09:27', '4.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 14:09:27', '2021-02-18 14:09:27', NULL, NULL, 'inside'),
(383, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0575', '', NULL, '2021-02-18 15:48:21', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 14:48:21', '2021-02-18 14:48:21', NULL, NULL, 'inside'),
(384, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0576', '', NULL, '2021-02-18 17:21:12', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-18 16:21:12', '2021-02-18 16:21:12', NULL, NULL, 'inside'),
(385, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0577', '', NULL, '2021-02-20 17:46:43', '2.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-20 16:46:43', '2021-02-20 16:46:43', NULL, NULL, 'inside'),
(386, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0578', '', NULL, '2021-02-20 18:17:06', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-20 17:17:06', '2021-02-20 17:17:06', NULL, NULL, 'inside'),
(387, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0579', '', NULL, '2021-02-20 18:27:23', '3.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-20 17:27:23', '2021-02-20 17:27:23', NULL, NULL, 'inside'),
(388, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0580', '', NULL, '2021-02-21 10:17:14', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-21 09:17:14', '2021-02-21 09:17:14', NULL, NULL, 'inside'),
(389, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0581', '', NULL, '2021-02-21 13:41:15', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-21 12:41:15', '2021-02-21 12:41:15', NULL, NULL, 'inside'),
(390, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0582', '', NULL, '2021-02-21 16:16:12', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-21 15:16:12', '2021-02-21 15:16:12', NULL, NULL, 'inside'),
(391, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0583', '', NULL, '2021-02-21 16:59:21', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-21 15:59:21', '2021-02-21 15:59:21', NULL, NULL, 'inside'),
(392, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0584', '', NULL, '2021-02-22 14:42:55', '2.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-22 13:42:55', '2021-02-22 13:42:55', NULL, NULL, 'inside'),
(393, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0585', '', NULL, '2021-02-22 15:58:20', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-22 14:58:20', '2021-02-22 14:58:20', NULL, NULL, 'inside'),
(394, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0586', '', NULL, '2021-02-22 18:40:26', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-22 17:40:26', '2021-02-22 17:40:26', NULL, NULL, 'inside'),
(395, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0587', '', NULL, '2021-02-23 16:30:21', '7.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-23 15:30:21', '2021-02-23 15:30:21', NULL, NULL, 'inside'),
(396, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0588', '', NULL, '2021-02-24 17:21:22', '9.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-24 16:21:22', '2021-02-24 16:21:22', NULL, NULL, 'inside'),
(397, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0589', '', NULL, '2021-02-24 19:13:15', '5.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-24 18:13:15', '2021-02-24 18:13:15', NULL, NULL, 'inside'),
(398, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0590', '', NULL, '2021-02-24 19:30:21', '5.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-24 18:30:21', '2021-02-24 18:30:21', NULL, NULL, 'inside'),
(399, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0591', '', NULL, '2021-02-25 21:26:08', '7.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-25 20:26:08', '2021-02-25 20:26:08', NULL, NULL, 'inside'),
(400, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0592', '', NULL, '2021-02-27 19:38:37', '13.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '13.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-27 18:38:37', '2021-02-27 18:38:38', NULL, NULL, 'inside'),
(401, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0593', '', NULL, '2021-02-28 20:18:16', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-02-28 19:18:16', '2021-02-28 19:18:16', NULL, NULL, 'inside'),
(402, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0594', '', NULL, '2021-03-01 12:25:23', '12.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 11:25:23', '2021-03-01 11:25:23', NULL, NULL, 'inside'),
(403, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0595', '', NULL, '2021-03-01 14:59:42', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 13:59:42', '2021-03-01 13:59:42', NULL, NULL, 'inside'),
(404, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0596', '', NULL, '2021-03-01 16:22:33', '4.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 15:22:33', '2021-03-01 15:22:33', NULL, NULL, 'inside'),
(405, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0597', '', NULL, '2021-03-01 16:24:01', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 15:24:01', '2021-03-01 15:24:01', NULL, NULL, 'inside'),
(406, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0598', '', NULL, '2021-03-01 16:33:51', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 15:33:51', '2021-03-01 15:33:51', NULL, NULL, 'inside'),
(407, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0599', '', NULL, '2021-03-01 17:26:54', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 16:26:54', '2021-03-01 16:26:54', NULL, NULL, 'inside'),
(408, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0600', '', NULL, '2021-03-01 18:47:11', '12.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 17:47:11', '2021-03-01 17:47:11', NULL, NULL, 'inside'),
(409, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0601', '', NULL, '2021-03-01 18:53:00', '8.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 17:53:00', '2021-03-01 17:53:00', NULL, NULL, 'inside'),
(410, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0602', '', NULL, '2021-03-01 19:39:12', '6.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 18:39:12', '2021-03-01 18:39:12', NULL, NULL, 'inside'),
(411, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0603', '', NULL, '2021-03-01 21:50:14', '3.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-01 20:50:14', '2021-03-01 20:50:14', NULL, NULL, 'inside'),
(412, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0604', '', NULL, '2021-03-02 11:11:34', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 10:11:34', '2021-03-02 10:11:34', NULL, NULL, 'inside'),
(413, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0605', '', NULL, '2021-03-02 12:03:22', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 11:03:22', '2021-03-02 11:03:22', NULL, NULL, 'inside'),
(414, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0606', '', NULL, '2021-03-02 13:33:46', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 12:33:46', '2021-03-02 12:33:46', NULL, NULL, 'inside'),
(415, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0607', '', NULL, '2021-03-02 15:05:25', '11.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '11.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 14:05:25', '2021-03-02 14:05:25', NULL, NULL, 'inside'),
(416, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0608', '', NULL, '2021-03-02 15:06:24', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 14:06:24', '2021-03-02 14:06:24', NULL, NULL, 'inside'),
(417, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0609', '', NULL, '2021-03-02 15:23:29', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 14:23:29', '2021-03-02 14:23:29', NULL, NULL, 'inside'),
(418, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0610', '', NULL, '2021-03-02 15:38:41', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 14:38:41', '2021-03-02 14:38:41', NULL, NULL, 'inside'),
(419, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0611', '', NULL, '2021-03-02 17:45:54', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-02 16:45:54', '2021-03-02 16:45:54', NULL, NULL, 'inside'),
(420, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0612', '', NULL, '2021-03-03 13:04:49', '3.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-03 12:04:49', '2021-03-03 12:04:49', NULL, NULL, 'inside'),
(421, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0613', '', NULL, '2021-03-03 15:31:24', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-03 14:31:24', '2021-03-03 14:31:24', NULL, NULL, 'inside'),
(422, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0614', '', NULL, '2021-03-03 18:08:54', '2.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-03 17:08:54', '2021-03-03 17:08:54', NULL, NULL, 'inside'),
(423, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0615', '', NULL, '2021-03-04 12:13:45', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-04 11:13:45', '2021-03-04 11:13:45', NULL, NULL, 'inside'),
(424, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0616', '', NULL, '2021-03-04 16:35:30', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-04 15:35:30', '2021-03-04 15:35:31', NULL, NULL, 'inside'),
(425, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0617', '', NULL, '2021-03-04 16:52:26', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-04 15:52:26', '2021-03-04 15:52:26', NULL, NULL, 'inside'),
(426, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0618', '', NULL, '2021-03-04 17:37:18', '0.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-04 16:37:18', '2021-03-04 16:37:18', NULL, NULL, 'inside'),
(427, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0619', '', NULL, '2021-03-06 13:04:13', '1.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-06 12:04:13', '2021-03-06 12:04:13', NULL, NULL, 'inside'),
(428, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0620', '', NULL, '2021-03-06 18:02:52', '2.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-06 17:02:52', '2021-03-06 17:02:53', NULL, NULL, 'inside'),
(429, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0621', '', NULL, '2021-03-06 18:28:39', '5.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-06 17:28:39', '2021-03-06 17:28:39', NULL, NULL, 'inside'),
(430, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0622', '', NULL, '2021-03-06 18:32:05', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-06 17:32:05', '2021-03-06 17:32:05', NULL, NULL, 'inside'),
(431, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0623', '', NULL, '2021-03-07 10:59:00', '2.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-07 09:59:00', '2021-03-07 09:59:00', NULL, NULL, 'inside'),
(432, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0624', '', NULL, '2021-03-07 13:14:59', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-07 12:14:59', '2021-03-07 12:14:59', NULL, NULL, 'inside'),
(433, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0625', '', NULL, '2021-03-07 14:08:01', '8.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-07 13:08:01', '2021-03-07 13:08:01', NULL, NULL, 'inside'),
(434, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0626', '', NULL, '2021-03-07 14:15:51', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-07 13:15:51', '2021-03-07 13:15:51', NULL, NULL, 'inside'),
(435, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0627', '', NULL, '2021-03-07 15:25:44', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-07 14:25:44', '2021-03-07 14:25:44', NULL, NULL, 'inside'),
(436, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0628', '', NULL, '2021-03-08 10:12:51', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-08 09:12:51', '2021-03-08 09:12:51', NULL, NULL, 'inside'),
(437, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0629', '', NULL, '2021-03-08 11:48:26', '7.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-08 10:48:26', '2021-03-08 10:48:26', NULL, NULL, 'inside'),
(438, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0630', '', NULL, '2021-03-08 12:44:23', '1.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-08 11:44:23', '2021-03-08 11:44:23', NULL, NULL, 'inside'),
(439, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0631', '', NULL, '2021-03-08 14:03:26', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-08 13:03:26', '2021-03-08 13:03:26', NULL, NULL, 'inside'),
(440, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0632', '', NULL, '2021-03-09 07:54:14', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-09 06:54:14', '2021-03-09 06:54:14', NULL, NULL, 'inside'),
(441, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0633', '', NULL, '2021-03-09 13:31:32', '3.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-09 12:31:32', '2021-03-09 12:31:32', NULL, NULL, 'inside'),
(442, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0634', '', NULL, '2021-03-09 13:50:54', '10.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-09 12:50:54', '2021-03-09 12:50:54', NULL, NULL, 'inside'),
(443, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0635', '', NULL, '2021-03-09 14:14:18', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-09 13:14:18', '2021-03-09 13:14:18', NULL, NULL, 'inside'),
(444, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0636', '', NULL, '2021-03-10 14:22:26', '11.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '11.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-10 13:22:26', '2021-03-10 13:22:26', NULL, NULL, 'inside'),
(445, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0637', '', NULL, '2021-03-11 14:51:01', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-11 13:51:01', '2021-03-11 13:51:01', NULL, NULL, 'inside'),
(446, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0638', '', NULL, '2021-03-13 11:39:57', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-13 10:39:57', '2021-03-13 10:39:58', NULL, NULL, 'inside'),
(447, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0639', '', NULL, '2021-03-13 13:03:30', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-13 12:03:30', '2021-03-13 12:03:30', NULL, NULL, 'inside'),
(448, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0640', '', NULL, '2021-03-13 14:27:19', '4.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-13 13:27:19', '2021-03-13 13:27:19', NULL, NULL, 'inside'),
(449, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0641', '', NULL, '2021-03-14 09:46:15', '0.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-14 08:46:15', '2021-03-14 08:46:15', NULL, NULL, 'inside'),
(450, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0642', '', NULL, '2021-03-15 13:04:08', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-15 12:04:08', '2021-03-15 12:04:08', NULL, NULL, 'inside'),
(451, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0643', '', NULL, '2021-03-15 13:48:01', '9.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-15 12:48:01', '2021-03-15 12:48:01', NULL, NULL, 'inside'),
(452, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0644', '', NULL, '2021-03-15 14:02:48', '22.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '22.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 22, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-15 13:02:48', '2021-03-15 13:02:48', NULL, NULL, 'inside'),
(453, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0645', '', NULL, '2021-03-15 14:18:07', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-15 13:18:07', '2021-03-15 13:18:07', NULL, NULL, 'inside'),
(454, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0646', '', NULL, '2021-03-16 07:43:29', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 06:43:29', '2021-03-16 06:43:29', NULL, NULL, 'inside'),
(455, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0647', '', NULL, '2021-03-16 09:04:44', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 08:04:44', '2021-03-16 08:04:44', NULL, NULL, 'inside'),
(456, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0648', '', NULL, '2021-03-16 10:13:21', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 09:13:21', '2021-03-16 09:13:21', NULL, NULL, 'inside'),
(457, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0649', '', NULL, '2021-03-16 10:14:07', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 09:14:07', '2021-03-16 09:14:07', NULL, NULL, 'inside'),
(458, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0650', '', NULL, '2021-03-16 12:24:06', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 11:24:06', '2021-03-16 11:24:06', NULL, NULL, 'inside'),
(459, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0651', '', NULL, '2021-03-16 13:41:34', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 12:41:34', '2021-03-16 12:41:34', NULL, NULL, 'inside'),
(460, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0652', '', NULL, '2021-03-16 14:54:11', '9.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-16 13:54:11', '2021-03-16 13:54:11', NULL, NULL, 'inside'),
(461, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0653', '', NULL, '2021-03-17 11:03:37', '0.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-17 10:03:37', '2021-03-17 10:03:37', NULL, NULL, 'inside'),
(462, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0654', '', NULL, '2021-03-17 12:04:50', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-17 11:04:50', '2021-03-17 11:04:50', NULL, NULL, 'inside'),
(463, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0655', '', NULL, '2021-03-17 12:51:12', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-17 11:51:12', '2021-03-17 11:51:12', NULL, NULL, 'inside'),
(464, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0656', '', NULL, '2021-03-17 13:29:30', '6.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-17 12:29:30', '2021-03-17 12:29:30', NULL, NULL, 'inside'),
(465, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0657', '', NULL, '2021-03-17 14:35:09', '3.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-17 13:35:09', '2021-03-17 13:35:09', NULL, NULL, 'inside'),
(466, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0658', '', NULL, '2021-03-18 09:23:43', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-18 08:23:43', '2021-03-18 08:23:43', NULL, NULL, 'inside'),
(467, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0659', '', NULL, '2021-03-20 14:50:54', '5.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-20 13:50:54', '2021-03-20 13:50:54', NULL, NULL, 'inside'),
(468, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0660', '', NULL, '2021-03-21 07:47:34', '7.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-21 06:47:34', '2021-03-21 06:47:34', NULL, NULL, 'inside'),
(469, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0661', '', NULL, '2021-03-21 08:21:30', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-21 07:21:30', '2021-03-21 07:21:30', NULL, NULL, 'inside'),
(470, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0662', '', NULL, '2021-03-21 13:03:16', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-21 12:03:16', '2021-03-21 12:03:16', NULL, NULL, 'inside'),
(471, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0663', '', NULL, '2021-03-21 15:13:35', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-21 14:13:35', '2021-03-21 14:13:35', NULL, NULL, 'inside'),
(472, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0664', '', NULL, '2021-03-22 08:10:57', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 07:10:57', '2021-03-22 07:10:57', NULL, NULL, 'inside'),
(473, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0665', '', NULL, '2021-03-22 11:09:35', '2.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 10:09:35', '2021-03-22 10:09:35', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(474, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0666', '', NULL, '2021-03-22 12:49:56', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 11:49:56', '2021-03-22 11:49:56', NULL, NULL, 'inside'),
(475, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0667', '', NULL, '2021-03-22 12:50:53', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 11:50:53', '2021-03-22 11:50:53', NULL, NULL, 'inside'),
(476, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0668', '', NULL, '2021-03-22 12:56:04', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 11:56:04', '2021-03-22 11:56:04', NULL, NULL, 'inside'),
(477, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0669', '', NULL, '2021-03-22 14:13:51', '3.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-22 13:13:51', '2021-03-22 13:13:51', NULL, NULL, 'inside'),
(478, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0670', '', NULL, '2021-03-24 11:17:21', '0.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 10:17:21', '2021-03-24 10:17:21', NULL, NULL, 'inside'),
(479, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0671', '', NULL, '2021-03-24 11:38:18', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 10:38:18', '2021-03-24 10:38:18', NULL, NULL, 'inside'),
(480, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0672', '', NULL, '2021-03-24 12:16:19', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 11:16:19', '2021-03-24 11:16:19', NULL, NULL, 'inside'),
(481, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0673', '', NULL, '2021-03-24 12:22:16', '2.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 11:22:16', '2021-03-24 11:22:16', NULL, NULL, 'inside'),
(482, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0674', '', NULL, '2021-03-24 12:56:08', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 11:56:08', '2021-03-24 11:56:08', NULL, NULL, 'inside'),
(483, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0675', '', NULL, '2021-03-24 15:28:14', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 14:28:14', '2021-03-24 14:28:14', NULL, NULL, 'inside'),
(484, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0676', '', NULL, '2021-03-24 15:53:14', '6.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 14:53:14', '2021-03-24 14:53:14', NULL, NULL, 'inside'),
(485, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0677', '', NULL, '2021-03-24 15:53:48', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 14:53:48', '2021-03-24 14:53:48', NULL, NULL, 'inside'),
(486, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0678', '', NULL, '2021-03-24 15:57:49', '2.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 14:57:49', '2021-03-24 14:57:49', NULL, NULL, 'inside'),
(487, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0679', '', NULL, '2021-03-24 20:52:40', '0.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-24 19:52:40', '2021-03-24 19:52:40', NULL, NULL, 'inside'),
(488, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0680', '', NULL, '2021-03-25 07:24:35', '1.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-25 06:24:35', '2021-03-25 06:24:35', NULL, NULL, 'inside'),
(489, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0681', '', NULL, '2021-03-25 09:24:04', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-25 08:24:04', '2021-03-25 08:24:04', NULL, NULL, 'inside'),
(490, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0682', '', NULL, '2021-03-25 10:39:51', '4.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-25 09:39:51', '2021-03-25 09:39:51', NULL, NULL, 'inside'),
(491, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0683', '', NULL, '2021-03-25 12:24:35', '6.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-25 11:24:35', '2021-03-25 11:24:35', NULL, NULL, 'inside'),
(492, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0684', '', NULL, '2021-03-27 12:38:52', '4.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-27 11:38:52', '2021-03-27 11:38:52', NULL, NULL, 'inside'),
(493, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0685', '', NULL, '2021-03-27 12:50:49', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-27 11:50:49', '2021-03-27 11:50:49', NULL, NULL, 'inside'),
(494, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0686', '', NULL, '2021-03-27 13:10:46', '6.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-27 12:10:46', '2021-03-27 12:10:46', NULL, NULL, 'inside'),
(495, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0687', '', NULL, '2021-03-28 15:08:05', '5.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-28 13:08:05', '2021-03-28 13:08:05', NULL, NULL, 'inside'),
(496, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0688', '', NULL, '2021-03-28 15:37:36', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-28 13:37:36', '2021-03-28 13:37:36', NULL, NULL, 'inside'),
(497, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0689', '', NULL, '2021-03-29 08:23:31', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 06:23:31', '2021-03-29 06:23:31', NULL, NULL, 'inside'),
(498, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0690', '', NULL, '2021-03-29 11:12:05', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 09:12:05', '2021-03-29 09:12:05', NULL, NULL, 'inside'),
(499, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0691', '', NULL, '2021-03-29 11:18:30', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 09:18:30', '2021-03-29 09:18:30', NULL, NULL, 'inside'),
(500, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0692', '', NULL, '2021-03-29 11:54:45', '11.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '11.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 09:54:45', '2021-03-29 09:54:45', NULL, NULL, 'inside'),
(501, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0693', '', NULL, '2021-03-29 15:02:26', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 13:02:26', '2021-03-29 13:02:26', NULL, NULL, 'inside'),
(502, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0694', '', NULL, '2021-03-29 15:29:47', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-29 13:29:47', '2021-03-29 13:29:47', NULL, NULL, 'inside'),
(506, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0698', '', NULL, '2021-03-30 09:14:01', '4.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-30 07:14:01', '2021-03-30 07:14:01', NULL, NULL, 'inside'),
(507, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0699', '', NULL, '2021-03-30 12:39:31', '2.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-03-30 10:39:31', '2021-03-30 10:39:31', NULL, NULL, 'inside'),
(508, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0700', '', NULL, '2021-04-01 08:22:01', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 06:22:01', '2021-04-01 06:22:01', NULL, NULL, 'inside'),
(509, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0701', '', NULL, '2021-04-01 09:47:14', '4.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 07:47:14', '2021-04-01 07:47:14', NULL, NULL, 'inside'),
(510, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0702', '', NULL, '2021-04-01 11:18:35', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 09:18:35', '2021-04-01 09:18:35', NULL, NULL, 'inside'),
(511, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0703', '', NULL, '2021-04-01 13:09:39', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 11:09:39', '2021-04-01 11:09:39', NULL, NULL, 'inside'),
(512, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0704', '', NULL, '2021-04-01 13:39:39', '12.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 11:39:39', '2021-04-01 11:39:39', NULL, NULL, 'inside'),
(513, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0705', '', NULL, '2021-04-01 13:40:14', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 11:40:14', '2021-04-01 11:40:14', NULL, NULL, 'inside'),
(514, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0706', '', NULL, '2021-04-01 15:25:54', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 13:25:54', '2021-04-01 13:25:54', NULL, NULL, 'inside'),
(515, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0707', '', NULL, '2021-04-01 15:52:52', '3.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-01 13:52:52', '2021-04-01 13:52:52', NULL, NULL, 'inside'),
(516, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2021-0708', '', NULL, '2021-04-02 15:47:41', '3.7500', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: 96690910', 'Bayan Block 6 STreet 4 Avenue 2 House 10 - Holly', 'ordered', 'Abdulaziz Alabdulmohsen', '1.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 3, '[\"Bayan Block 6 STreet 4 Avenue 2 House 10\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-02 13:47:41', '2021-04-02 13:47:41', NULL, NULL, 'inside'),
(517, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0709', '', NULL, '2021-04-03 09:43:26', '2.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-03 07:43:26', '2021-04-03 07:43:26', NULL, NULL, 'inside'),
(518, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0710', '', NULL, '2021-04-03 12:42:25', '7.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-03 10:42:25', '2021-04-03 10:42:25', NULL, NULL, 'inside'),
(519, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0711', '', NULL, '2021-04-04 10:03:29', '4.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-04 08:03:29', '2021-04-04 08:03:29', NULL, NULL, 'inside'),
(520, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0712', '', NULL, '2021-04-04 10:40:41', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-04 08:40:41', '2021-04-04 08:40:41', NULL, NULL, 'inside'),
(521, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0713', '', NULL, '2021-04-04 11:33:01', '4.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-04 09:33:01', '2021-04-04 09:33:01', NULL, NULL, 'inside'),
(522, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0714', '', NULL, '2021-04-05 11:12:33', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-05 09:12:33', '2021-04-05 09:12:33', NULL, NULL, 'inside'),
(523, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0715', '', NULL, '2021-04-05 11:59:42', '4.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-05 09:59:42', '2021-04-05 09:59:42', NULL, NULL, 'inside'),
(524, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0716', '', NULL, '2021-04-05 13:33:13', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-05 11:33:13', '2021-04-05 11:33:13', NULL, NULL, 'inside'),
(525, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0717', '', NULL, '2021-04-05 14:32:57', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-05 12:32:57', '2021-04-05 12:32:57', NULL, NULL, 'inside'),
(526, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0718', '', NULL, '2021-04-06 10:55:34', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 08:55:34', '2021-04-06 08:55:34', NULL, NULL, 'inside'),
(527, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0719', '', NULL, '2021-04-06 11:21:57', '7.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 09:21:57', '2021-04-06 09:21:57', NULL, NULL, 'inside'),
(528, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0720', '', NULL, '2021-04-06 11:57:49', '7.2000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.2000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 09:57:49', '2021-04-06 09:57:49', NULL, NULL, 'inside'),
(529, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0721', '', NULL, '2021-04-06 12:01:26', '3.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 10:01:26', '2021-04-06 10:01:26', NULL, NULL, 'inside'),
(530, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0722', '', NULL, '2021-04-06 12:40:23', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 10:40:23', '2021-04-06 10:40:23', NULL, NULL, 'inside'),
(531, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0723', '', NULL, '2021-04-06 14:23:17', '1.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 12:23:17', '2021-04-06 12:23:17', NULL, NULL, 'inside'),
(532, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0724', '', NULL, '2021-04-06 15:36:51', '12.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-06 13:36:51', '2021-04-06 13:36:51', NULL, NULL, 'inside'),
(533, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0725', '', NULL, '2021-04-07 07:13:17', '2.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 05:13:17', '2021-04-07 05:13:17', NULL, NULL, 'inside'),
(534, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0726', '', NULL, '2021-04-07 09:00:55', '6.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 07:00:55', '2021-04-07 07:00:55', NULL, NULL, 'inside'),
(535, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0727', '', NULL, '2021-04-07 09:37:47', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 07:37:47', '2021-04-07 07:37:47', NULL, NULL, 'inside'),
(536, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0728', '', NULL, '2021-04-07 10:53:22', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 08:53:22', '2021-04-07 08:53:22', NULL, NULL, 'inside'),
(537, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0729', '', NULL, '2021-04-07 12:41:16', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 10:41:16', '2021-04-07 10:41:16', NULL, NULL, 'inside'),
(538, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0730', '', NULL, '2021-04-07 13:16:27', '10.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 11:16:27', '2021-04-07 11:16:27', NULL, NULL, 'inside'),
(539, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0731', '', NULL, '2021-04-07 13:46:03', '1.3500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.3500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-07 11:46:03', '2021-04-07 11:46:03', NULL, NULL, 'inside'),
(540, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0732', '', NULL, '2021-04-08 11:48:35', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-08 09:48:35', '2021-04-08 09:48:35', NULL, NULL, 'inside'),
(541, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0733', '', NULL, '2021-04-08 13:13:17', '3.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-08 11:13:17', '2021-04-08 11:13:17', NULL, NULL, 'inside'),
(542, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0734', '', NULL, '2021-04-08 13:45:34', '17.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '17.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 17, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-08 11:45:34', '2021-04-08 11:45:34', NULL, NULL, 'inside'),
(543, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0735', '', NULL, '2021-04-08 15:14:34', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-08 13:14:34', '2021-04-08 13:14:34', NULL, NULL, 'inside'),
(544, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0736', '', NULL, '2021-04-08 15:33:34', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-08 13:33:34', '2021-04-08 13:33:34', NULL, NULL, 'inside'),
(545, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0737', '', NULL, '2021-04-10 12:52:05', '8.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-10 10:52:05', '2021-04-10 10:52:05', NULL, NULL, 'inside'),
(546, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0738', '', NULL, '2021-04-10 14:23:20', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-10 12:23:20', '2021-04-10 12:23:20', NULL, NULL, 'inside'),
(547, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0739', '', NULL, '2021-04-10 14:28:22', '7.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-10 12:28:22', '2021-04-10 12:28:22', NULL, NULL, 'inside'),
(548, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0740', '', NULL, '2021-04-11 11:22:11', '3.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-11 09:22:11', '2021-04-11 09:22:11', NULL, NULL, 'inside'),
(549, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0741', '', NULL, '2021-04-11 11:36:42', '1.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-11 09:36:42', '2021-04-11 09:36:42', NULL, NULL, 'inside'),
(550, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0742', '', NULL, '2021-04-12 12:06:36', '3.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-12 10:06:36', '2021-04-12 10:06:36', NULL, NULL, 'inside'),
(551, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0743', '', NULL, '2021-04-12 13:34:25', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-12 11:34:25', '2021-04-12 11:34:25', NULL, NULL, 'inside'),
(552, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0744', '', NULL, '2021-04-12 13:51:38', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-12 11:51:38', '2021-04-12 11:51:38', NULL, NULL, 'inside'),
(553, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0745', '', NULL, '2021-04-12 15:42:48', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-12 13:42:48', '2021-04-12 13:42:48', NULL, NULL, 'inside'),
(554, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0746', '', NULL, '2021-04-12 15:43:28', '2.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-12 13:43:28', '2021-04-12 13:43:28', NULL, NULL, 'inside'),
(562, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0754', '', NULL, '2021-04-13 18:05:03', '15.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '15.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 15, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-13 16:05:03', '2021-04-13 16:05:03', NULL, NULL, 'inside'),
(563, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0755', '', NULL, '2021-04-16 00:16:49', '9.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-15 22:16:49', '2021-04-15 22:16:49', NULL, NULL, 'inside'),
(564, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0756', '', NULL, '2021-04-17 16:45:13', '7.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-17 14:45:13', '2021-04-17 14:45:13', NULL, NULL, 'inside'),
(566, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0758', '', NULL, '2021-04-18 16:45:03', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-18 14:45:03', '2021-04-18 14:45:03', NULL, NULL, 'inside'),
(571, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, NULL, NULL, 20, NULL, '2021-0762', '', NULL, '2021-04-19 00:52:15', '12.1000', NULL, '0.0000', 'fixed', '0.0000', 0, '0.0000', 'Mobile: +96566630888', 'Block 13, St. 22nd north - Al Ahmdi', 'ordered', 'Mohammad', '1.0000', NULL, NULL, '12.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 1, 12, '[\"Block 13, St. 22nd north\"]', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 22:52:15', '2021-04-18 22:52:15', NULL, NULL, 'inside'),
(572, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0763', '', NULL, '2021-04-19 01:05:40', '8.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-18 23:05:40', '2021-04-18 23:05:41', NULL, NULL, 'inside'),
(573, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0774', '', NULL, '2021-04-19 15:01:00', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 13:05:47', '2021-04-19 14:41:30', NULL, NULL, 'inside'),
(574, 1, 2, 1, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0764', '', NULL, '2021-04-19 15:05:00', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', '1', NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 13:08:34', '2021-04-19 13:24:49', NULL, NULL, 'inside'),
(575, 1, 2, 3, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 47, 5, '2021-0765', '', NULL, '2021-04-19 15:24:00', '2.9800', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', '2', NULL, '2.9800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 13:32:30', '2021-04-19 13:45:00', NULL, NULL, 'inside'),
(576, 1, 2, 13, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0766', '', NULL, '2021-04-19 15:45:00', '3.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 13:49:08', '2021-04-19 13:49:08', NULL, NULL, 'inside'),
(577, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0767', '', NULL, '2021-04-19 15:45:00', '12.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '12.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 13:51:52', '2021-04-19 13:51:52', NULL, NULL, 'inside'),
(578, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0768', '', NULL, '2021-04-19 15:45:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 13:53:26', '2021-04-19 13:53:26', NULL, NULL, 'inside'),
(579, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0769', '', NULL, '2021-04-19 15:45:00', '3.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 13:54:28', '2021-04-19 13:54:28', NULL, NULL, 'inside'),
(580, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0770', '', NULL, '2021-04-19 15:45:00', '5.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:03:35', '2021-04-19 14:03:35', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(581, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0771', '', NULL, '2021-04-19 15:45:00', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:17:43', '2021-04-19 14:17:43', NULL, NULL, 'inside'),
(582, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0772', '', NULL, '2021-04-19 15:45:00', '7.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:29:47', '2021-04-19 14:29:47', NULL, NULL, 'inside'),
(583, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0773', '', NULL, '2021-04-19 15:45:00', '4.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:30:46', '2021-04-19 14:30:46', NULL, NULL, 'inside'),
(585, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0775', '', NULL, '2021-04-19 16:41:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:47:53', '2021-04-19 14:47:53', NULL, NULL, 'inside'),
(586, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0776', '', NULL, '2021-04-19 16:41:00', '3.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 14:50:43', '2021-04-19 14:50:43', NULL, NULL, 'inside'),
(589, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0778', '', NULL, '2021-04-19 17:07:00', '5.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 15:21:47', '2021-04-19 15:21:47', NULL, NULL, 'inside'),
(590, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0779', '', NULL, '2021-04-19 17:28:00', '7.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 15:29:37', '2021-04-19 15:29:37', NULL, NULL, 'inside'),
(591, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0780', '', NULL, '2021-04-19 17:38:00', '5.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 15:39:34', '2021-04-19 15:39:34', NULL, NULL, 'inside'),
(592, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0781', '', NULL, '2021-04-19 17:38:00', '9.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:47:18', '2021-04-19 15:47:56', NULL, NULL, 'inside'),
(593, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0782', '', NULL, '2021-04-19 17:57:00', '7.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 16:02:20', '2021-04-19 16:02:20', NULL, NULL, 'inside'),
(594, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0783', '', NULL, '2021-04-19 18:05:00', '11.9500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '11.9500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 16:08:23', '2021-04-19 16:08:23', NULL, NULL, 'inside'),
(595, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 49, 7, '2021-0784', '', NULL, '2021-04-19 18:05:00', '4.6400', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6400', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 16:12:38', '2021-04-19 16:12:38', NULL, NULL, 'inside'),
(596, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0785', '', NULL, '2021-04-19 18:05:00', '9.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 16:13:37', '2021-04-19 16:13:37', NULL, NULL, 'inside'),
(597, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0786', '', NULL, '2021-04-19 18:05:00', '6.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-19 16:14:29', '2021-04-19 16:14:29', NULL, NULL, 'inside'),
(602, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 50, 4, '2021-0787', '', NULL, '2021-04-19 18:44:00', '6.2800', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.2800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:45:27', '2021-04-19 16:57:13', NULL, NULL, 'inside'),
(605, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0788', '', NULL, '2021-04-20 14:54:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 13:01:22', '2021-04-20 13:01:22', NULL, NULL, 'inside'),
(606, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0789', '', NULL, '2021-04-20 15:12:00', '7.1000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 13:23:39', '2021-04-20 13:23:39', NULL, NULL, 'inside'),
(607, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0790', '', NULL, '2021-04-20 15:12:00', '5.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 13:25:18', '2021-04-20 13:25:18', NULL, NULL, 'inside'),
(608, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0792', '', NULL, '2021-04-20 15:12:00', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 13:34:39', '2021-04-20 13:38:13', NULL, NULL, 'inside'),
(609, 1, 2, 1, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0791', '', NULL, '2021-04-20 15:12:00', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 13:37:11', '2021-04-20 13:37:11', NULL, NULL, 'inside'),
(610, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0793', '', NULL, '2021-04-20 15:38:00', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 13:39:20', '2021-04-20 13:39:20', NULL, NULL, 'inside'),
(611, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0794', '', NULL, '2021-04-20 15:50:00', '3.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 14:32:54', '2021-04-20 14:32:54', NULL, NULL, 'inside'),
(612, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0795', '', NULL, '2021-04-20 15:50:00', '2.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 14:35:37', '2021-04-20 14:38:01', NULL, NULL, 'inside'),
(613, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0796', '', NULL, '2021-04-20 16:38:00', '9.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 14:40:02', '2021-04-20 14:40:02', NULL, NULL, 'inside'),
(614, 1, 2, 13, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0798', '', NULL, '2021-04-20 16:38:00', '6.0500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 14:55:45', '2021-04-20 15:11:03', NULL, NULL, 'inside'),
(615, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0797', '', NULL, '2021-04-20 17:03:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 15:03:37', '2021-04-20 15:03:37', NULL, NULL, 'inside'),
(616, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0799', '', NULL, '2021-04-20 17:11:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 15:12:41', '2021-04-20 15:12:41', NULL, NULL, 'inside'),
(617, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0804', '', NULL, '2021-04-20 17:11:00', '8.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:14:32', '2021-04-20 15:52:48', NULL, NULL, 'inside'),
(618, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0801', '', NULL, '2021-04-20 17:11:00', '7.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:15:43', '2021-04-20 15:24:20', NULL, NULL, 'inside'),
(619, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0800', '', NULL, '2021-04-20 17:11:00', '7.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:16:33', '2021-04-20 15:18:56', NULL, NULL, 'inside'),
(620, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0813', '', NULL, '2021-04-20 17:24:00', '19.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '19.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 19, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:25:46', '2021-04-20 16:13:46', NULL, NULL, 'inside'),
(621, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 51, 4, '2021-0806', '', NULL, '2021-04-20 17:24:00', '10.4300', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.4300', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:31:16', '2021-04-20 16:00:40', NULL, NULL, 'inside'),
(622, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0808', '', NULL, '2021-04-20 17:24:00', '4.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:33:17', '2021-04-20 16:03:06', NULL, NULL, 'inside'),
(623, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 52, 5, '2021-0802', '', NULL, '2021-04-20 17:24:00', '5.1200', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.1200', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:35:06', '2021-04-20 15:40:35', NULL, NULL, 'inside'),
(624, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0803', '', NULL, '2021-04-20 17:24:00', '3.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:38:33', '2021-04-20 15:51:53', NULL, NULL, 'inside'),
(625, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 53, 4, '2021-0809', '', NULL, '2021-04-20 17:40:00', '7.8800', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.8800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:50:37', '2021-04-20 16:04:20', NULL, NULL, 'inside'),
(626, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0812', '', NULL, '2021-04-20 17:52:00', '9.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:53:58', '2021-04-20 16:10:27', NULL, NULL, 'inside'),
(627, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0811', '', NULL, '2021-04-20 17:52:00', '8.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:55:08', '2021-04-20 16:09:45', NULL, NULL, 'inside'),
(628, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0805', '', NULL, '2021-04-20 17:52:00', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 15:58:28', '2021-04-20 15:58:28', NULL, NULL, 'inside'),
(629, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0807', '', NULL, '2021-04-20 18:00:00', '14.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '14.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 14, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 16:02:17', '2021-04-20 16:02:17', NULL, NULL, 'inside'),
(630, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0810', '', NULL, '2021-04-20 18:04:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 16:04:39', '2021-04-20 16:04:39', NULL, NULL, 'inside'),
(631, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0814', '', NULL, '2021-04-20 18:13:00', '4.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 16:17:45', '2021-04-20 16:21:43', NULL, NULL, 'inside'),
(632, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0815', '', NULL, '2021-04-20 18:21:00', '4.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 16:24:30', '2021-04-20 16:24:30', NULL, NULL, 'inside'),
(633, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0816', '', NULL, '2021-04-20 18:21:00', '8.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 16:25:11', '2021-04-20 16:26:46', NULL, NULL, 'inside'),
(634, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 55, 7, '2021-0817', '', NULL, '2021-04-20 18:26:00', '4.4100', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4100', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 17:20:59', '2021-04-20 17:20:59', NULL, NULL, 'inside'),
(635, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 56, 5, '2021-0818', '', NULL, '2021-04-20 18:26:00', '16.4600', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '16.4600', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 16, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 17:27:54', '2021-04-20 17:27:54', NULL, NULL, 'inside'),
(636, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0819', '', NULL, '2021-04-20 18:26:00', '3.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-20 17:29:56', '2021-04-20 17:29:56', NULL, NULL, 'inside'),
(637, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 57, 5, '2021-0820', '', NULL, '2021-04-21 15:02:00', '5.2300', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.2300', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:04:52', '2021-04-21 13:04:52', NULL, NULL, 'inside'),
(638, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 56, 5, '2021-0821', '', NULL, '2021-04-21 15:02:00', '3.7400', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.7400', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:07:11', '2021-04-21 13:07:11', NULL, NULL, 'inside'),
(639, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 57, 5, '2021-0822', '', NULL, '2021-04-21 15:02:00', '18.7100', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '18.7100', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 18, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:09:07', '2021-04-21 13:09:07', NULL, NULL, 'inside'),
(640, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0823', '', NULL, '2021-04-21 15:02:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:10:04', '2021-04-21 13:10:04', NULL, NULL, 'inside'),
(641, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0824', '', NULL, '2021-04-21 15:34:00', '5.9000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.9000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:50:15', '2021-04-21 13:50:15', NULL, NULL, 'inside'),
(642, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0825', '', NULL, '2021-04-21 15:34:00', '2.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:50:49', '2021-04-21 13:50:49', NULL, NULL, 'inside'),
(643, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0826', '', NULL, '2021-04-21 15:34:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:51:49', '2021-04-21 13:51:49', NULL, NULL, 'inside'),
(644, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0827', '', NULL, '2021-04-21 15:34:00', '17.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '17.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 17, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:54:19', '2021-04-21 13:54:19', NULL, NULL, 'inside'),
(645, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 57, 5, '2021-0828', '', NULL, '2021-04-21 15:34:00', '9.1800', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.1800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:56:35', '2021-04-21 13:56:35', NULL, NULL, 'inside'),
(646, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0829', '', NULL, '2021-04-21 15:34:00', '4.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 13:57:04', '2021-04-21 13:57:04', NULL, NULL, 'inside'),
(647, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0830', '', NULL, '2021-04-21 15:34:00', '3.6000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.6000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 14:49:45', '2021-04-21 14:49:45', NULL, NULL, 'inside'),
(648, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0831', '', NULL, '2021-04-21 15:34:00', '6.3000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:01:05', '2021-04-21 15:01:06', NULL, NULL, 'inside'),
(649, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0832', '', NULL, '2021-04-21 15:34:00', '2.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:16:49', '2021-04-21 15:16:49', NULL, NULL, 'inside'),
(650, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0833', '', NULL, '2021-04-21 15:34:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:20:44', '2021-04-21 15:20:44', NULL, NULL, 'inside'),
(651, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 58, 6, '2021-0834', '', NULL, '2021-04-21 15:34:00', '0.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:36:07', '2021-04-21 15:36:07', NULL, NULL, 'inside'),
(652, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0835', '', NULL, '2021-04-21 15:34:00', '5.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:36:33', '2021-04-21 15:36:34', NULL, NULL, 'inside'),
(653, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0836', '', NULL, '2021-04-21 15:34:00', '6.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:37:01', '2021-04-21 15:37:01', NULL, NULL, 'inside'),
(654, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0837', '', NULL, '2021-04-21 15:34:00', '10.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:40:54', '2021-04-21 15:40:54', NULL, NULL, 'inside'),
(655, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0838', '', NULL, '2021-04-21 15:34:00', '7.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:47:04', '2021-04-21 15:47:04', NULL, NULL, 'inside'),
(656, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 59, 7, '2021-0839', '', NULL, '2021-04-21 15:34:00', '2.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:52:52', '2021-04-21 15:52:52', NULL, NULL, 'inside'),
(657, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0840', '', NULL, '2021-04-21 17:56:00', '3.5000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '3.5000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 15:58:33', '2021-04-21 15:58:34', NULL, NULL, 'inside'),
(658, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0841', '', NULL, '2021-04-21 17:56:00', '9.5500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '9.5500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 9, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:03:29', '2021-04-21 16:03:29', NULL, NULL, 'inside'),
(659, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0842', '', NULL, '2021-04-21 17:56:00', '18.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '18.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 18, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:07:30', '2021-04-21 16:07:30', NULL, NULL, 'inside'),
(660, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 60, 4, '2021-0843', '', NULL, '2021-04-21 17:56:00', '8.6600', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.6600', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:08:33', '2021-04-21 16:08:33', NULL, NULL, 'inside'),
(661, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0844', '', NULL, '2021-04-21 17:56:00', '21.4500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '21.4500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 21, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:19:41', '2021-04-21 16:19:41', NULL, NULL, 'inside'),
(662, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0845', '', NULL, '2021-04-21 17:56:00', '4.1500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.1500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:20:25', '2021-04-21 16:20:25', NULL, NULL, 'inside'),
(663, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0846', '', NULL, '2021-04-21 17:56:00', '7.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '7.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 7, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:23:17', '2021-04-21 16:23:17', NULL, NULL, 'inside'),
(664, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0847', '', NULL, '2021-04-21 17:56:00', '10.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:33:11', '2021-04-21 16:33:12', NULL, NULL, 'inside'),
(665, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0848', '', NULL, '2021-04-21 17:56:00', '2.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 15, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 16:37:12', '2021-04-21 16:37:12', NULL, NULL, 'inside'),
(666, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0849', '', NULL, '2021-04-22 00:00:00', '13.8500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '13.8500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 30, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-04-21 22:30:53', '2021-04-21 22:30:53', NULL, NULL, 'inside'),
(667, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0850', '', NULL, '2021-05-03 13:07:00', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-03 10:09:43', '2021-05-03 10:09:43', NULL, NULL, 'inside'),
(668, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0851', '', NULL, '2021-05-03 13:07:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-03 10:10:04', '2021-05-03 10:10:04', NULL, NULL, 'inside'),
(669, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, 'kVuIr', '', NULL, '2021-05-03 13:07:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-03 10:10:18', '2021-05-03 10:10:18', NULL, NULL, 'inside'),
(670, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 45, NULL, '2021-0852', '', NULL, '2021-05-12 11:02:00', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-12 08:03:14', '2021-05-12 08:03:14', NULL, NULL, 'inside'),
(671, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'draft', 1, NULL, NULL, 1, NULL, 'L6nEp', '', NULL, '2021-05-13 17:32:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-13 15:11:34', '2021-05-13 15:11:34', NULL, NULL, 'inside'),
(672, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'draft', 1, NULL, NULL, 1, NULL, 'HAu9h', '', NULL, '2021-05-13 18:10:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-13 15:11:46', '2021-05-13 15:11:46', NULL, NULL, 'inside'),
(673, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0853', '', NULL, '2021-05-13 18:15:00', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-13 15:24:42', '2021-05-13 15:24:42', NULL, NULL, 'inside'),
(674, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0854', '', NULL, '2021-05-13 18:36:00', '5.7500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '5.7500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 5, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-13 15:37:35', '2021-05-13 15:37:35', NULL, NULL, 'inside'),
(675, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0855', '', NULL, '2021-05-20 17:21:00', '1.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-20 14:22:03', '2021-05-20 14:22:03', NULL, NULL, 'inside'),
(676, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0856', '', NULL, '2021-05-20 17:39:00', '0.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-20 14:40:23', '2021-05-20 14:40:23', NULL, NULL, 'inside'),
(677, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0857', '', NULL, '2021-05-20 20:45:00', '0.2500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.2500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-20 17:46:56', '2021-05-20 17:46:56', NULL, NULL, 'inside'),
(678, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0858', '', NULL, '2021-05-20 20:46:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-20 17:48:22', '2021-05-20 17:48:22', NULL, NULL, 'inside'),
(679, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0859', '', NULL, '2021-05-20 20:49:00', '0.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-20 17:49:38', '2021-05-20 17:49:38', NULL, NULL, 'inside'),
(680, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0860', '', NULL, '2021-05-21 20:29:00', '2.8000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-21 17:30:14', '2021-05-21 17:30:14', NULL, NULL, 'inside'),
(681, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 1, NULL, '2021-0861', '', NULL, '2021-05-23 21:30:00', '4.7000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'sw', NULL, '4.7000', NULL, NULL, NULL, NULL, 0, 1, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-23 18:31:05', '2021-05-23 18:31:05', NULL, NULL, 'inside');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `essentials_duration`, `essentials_duration_unit`, `essentials_amount_per_unit_duration`, `essentials_allowances`, `essentials_deductions`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`, `OEX_KITCHEN_STATUS`, `subscription_id`, `trasaction_type`) VALUES
(682, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0862', '', NULL, '2021-05-24 18:23:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-24 15:26:10', '2021-05-24 15:26:11', NULL, NULL, 'inside'),
(683, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0863', '', NULL, '2021-05-24 21:03:00', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'suspended', NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-24 18:04:01', '2021-05-24 18:08:22', NULL, NULL, 'inside'),
(684, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0864', '', NULL, '2021-05-27 17:19:00', '1.6500', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '1.6500', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-27 14:19:35', '2021-05-27 14:19:35', NULL, NULL, 'inside'),
(685, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0865', '', NULL, '2021-05-27 17:22:00', '0.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-27 14:22:43', '2021-05-27 14:22:43', NULL, NULL, 'inside'),
(686, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0866', '', NULL, '2021-05-27 17:23:00', '0.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-27 14:24:26', '2021-05-27 14:24:26', NULL, NULL, 'inside'),
(687, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0867', '', NULL, '2021-05-27 17:23:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-27 14:33:36', '2021-05-27 14:33:36', NULL, NULL, 'inside'),
(688, 1, 2, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0868', '', NULL, '2021-05-27 17:36:00', '4.4000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-27 14:36:41', '2021-05-27 14:36:41', NULL, NULL, 'inside'),
(689, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 18:29:19', '20000000020.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '20000000020.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 182, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 15:29:19', '2021-05-28 16:05:12', NULL, NULL, 'inside'),
(690, 1, 2, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 18:29:19', '20.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '20.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 182, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 15:29:19', '2021-05-28 16:05:12', NULL, NULL, 'inside'),
(691, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0869', '', NULL, '2021-05-28 18:35:00', '0.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 15:35:39', '2021-05-28 15:35:39', NULL, NULL, 'inside'),
(692, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0870', '', NULL, '2021-05-28 18:36:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 15:36:53', '2021-05-28 15:36:53', NULL, NULL, 'inside'),
(693, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0871', '', NULL, '2021-05-28 18:36:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 15:38:17', '2021-05-28 15:38:17', NULL, NULL, 'inside'),
(694, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0872', '', NULL, '2021-05-28 18:36:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 15:38:43', '2021-05-28 15:38:43', NULL, NULL, 'inside'),
(695, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0873', '', NULL, '2021-05-28 18:51:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 15:51:23', '2021-05-28 15:51:23', NULL, NULL, 'inside'),
(696, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0874', '', NULL, '2021-05-28 19:01:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:02:23', '2021-05-28 16:02:24', NULL, NULL, 'inside'),
(697, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0875', '', NULL, '2021-05-28 19:03:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:03:29', '2021-05-28 16:03:29', NULL, NULL, 'inside'),
(698, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0876', '', NULL, '2021-05-28 19:03:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:05:26', '2021-05-28 16:05:26', NULL, NULL, 'inside'),
(699, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0877', '', NULL, '2021-05-28 19:06:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:06:11', '2021-05-28 16:06:11', NULL, NULL, 'inside'),
(700, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0878', '', NULL, '2021-05-28 19:07:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:07:22', '2021-05-28 16:07:22', NULL, NULL, 'inside'),
(701, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0879', '', NULL, '2021-05-28 19:08:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:08:57', '2021-05-28 16:08:57', NULL, NULL, 'inside'),
(702, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0880', '', NULL, '2021-05-28 19:10:00', '6.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:11:04', '2021-05-28 16:11:04', NULL, NULL, 'inside'),
(703, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0881', '', NULL, '2021-05-28 19:13:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-28 16:13:32', '2021-05-28 16:13:32', NULL, NULL, 'inside'),
(704, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'due', NULL, NULL, NULL, NULL, 'EP2021/0001', NULL, '2021-05-31 18:31:00', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'test', NULL, '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 15:31:32', '2021-05-31 15:31:32', NULL, NULL, 'inside'),
(705, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0882', '', NULL, '2021-05-31 21:05:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'test', NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 18:06:05', '2021-05-31 18:06:22', NULL, NULL, 'inside'),
(706, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'due', NULL, NULL, NULL, NULL, 'EP2021/0002', NULL, '2021-05-31 21:20:00', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'Rent', NULL, '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 18:21:11', '2021-05-31 18:21:11', NULL, NULL, 'inside'),
(707, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'due', NULL, NULL, NULL, NULL, 'EP2021/0003', NULL, '2021-05-31 21:25:00', '50.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '50.0000', 1, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 18:25:31', '2021-05-31 18:25:31', NULL, NULL, 'inside'),
(708, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'due', NULL, NULL, NULL, NULL, 'EP2021/0004', NULL, '2021-06-02 12:36:00', '100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '100.0000', 1, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-02 09:36:26', '2021-06-02 09:36:26', NULL, NULL, 'inside'),
(709, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0883', '', NULL, '2021-06-03 19:38:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-03 16:39:08', '2021-06-03 16:39:08', NULL, NULL, 'inside'),
(710, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0884', '', NULL, '2021-06-03 19:50:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-03 16:55:55', '2021-06-03 16:55:55', NULL, NULL, 'inside'),
(711, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0885', '', NULL, '2021-06-04 19:21:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 16:27:25', '2021-06-04 16:27:25', NULL, NULL, 'inside'),
(712, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0886', '', NULL, '2021-06-04 19:36:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 16:36:46', '2021-06-04 16:36:46', NULL, NULL, 'inside'),
(713, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0887', '', NULL, '2021-06-04 20:32:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 17:34:02', '2021-06-04 17:34:02', NULL, NULL, 'inside'),
(714, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0888', '', NULL, '2021-06-04 20:35:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 17:35:34', '2021-06-04 17:35:34', NULL, NULL, 'inside'),
(715, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0889', '', NULL, '2021-06-04 20:45:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 17:56:16', '2021-06-04 17:56:17', NULL, NULL, 'inside'),
(716, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0890', '', NULL, '2021-06-04 20:51:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-04 17:56:45', '2021-06-04 17:56:45', NULL, NULL, 'inside'),
(717, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0891', '', NULL, '2021-06-05 09:56:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:05:09', '2021-06-05 07:05:09', NULL, NULL, 'inside'),
(718, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0892', '', NULL, '2021-06-05 09:56:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:08:23', '2021-06-05 07:08:23', NULL, NULL, 'inside'),
(719, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0893', '', NULL, '2021-06-05 10:08:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:09:06', '2021-06-05 07:09:06', NULL, NULL, 'inside'),
(720, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0894', '', NULL, '2021-06-05 10:13:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:13:27', '2021-06-05 07:13:27', NULL, NULL, 'inside'),
(721, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0895', '', NULL, '2021-06-05 10:13:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:14:50', '2021-06-05 07:14:51', NULL, NULL, 'inside'),
(722, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0896', '', NULL, '2021-06-05 10:18:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:19:04', '2021-06-05 07:19:04', NULL, NULL, 'inside'),
(723, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0897', '', NULL, '2021-06-05 10:30:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:30:34', '2021-06-05 07:30:34', NULL, NULL, 'inside'),
(724, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0898', '', NULL, '2021-06-05 10:35:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:35:52', '2021-06-05 07:35:52', NULL, NULL, 'inside'),
(725, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0899', '', NULL, '2021-06-05 10:37:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:37:44', '2021-06-05 07:37:45', NULL, NULL, 'inside'),
(726, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0900', '', NULL, '2021-06-05 10:39:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:40:13', '2021-06-05 07:40:13', NULL, NULL, 'inside'),
(727, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0901', '', NULL, '2021-06-05 10:45:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:46:07', '2021-06-05 07:46:07', NULL, NULL, 'inside'),
(728, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0902', '', NULL, '2021-06-05 10:46:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:46:47', '2021-06-05 07:46:47', NULL, NULL, 'inside'),
(729, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0903', '', NULL, '2021-06-05 10:50:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:50:48', '2021-06-05 07:50:48', NULL, NULL, 'inside'),
(730, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0904', '', NULL, '2021-06-05 10:57:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:57:54', '2021-06-05 07:57:54', NULL, NULL, 'inside'),
(731, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0905', '', NULL, '2021-06-05 10:57:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 07:59:15', '2021-06-05 07:59:15', NULL, NULL, 'inside'),
(732, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0906', '', NULL, '2021-06-05 11:58:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 08:58:41', '2021-06-05 08:58:41', NULL, NULL, 'inside'),
(733, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0907', '', NULL, '2021-06-05 11:58:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 09:00:09', '2021-06-05 09:00:09', NULL, NULL, 'inside'),
(734, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'due', NULL, 1, NULL, '2021-0908', '', NULL, '2021-06-05 12:16:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 09:16:51', '2021-06-05 09:16:51', NULL, NULL, 'inside'),
(735, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0909', '', NULL, '2021-06-05 12:30:00', '6.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 09:31:50', '2021-06-05 09:31:51', NULL, NULL, 'inside'),
(736, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0910', '', NULL, '2021-06-05 17:44:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 14:46:14', '2021-06-05 14:46:14', NULL, NULL, 'inside'),
(737, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0911', '', NULL, '2021-06-05 17:46:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, 'OUTSIDE', NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 14:47:09', '2021-06-05 14:47:09', NULL, NULL, 'inside'),
(738, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0912', '', NULL, '2021-06-05 18:11:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, 'OUTSIDE', NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:12:01', '2021-06-05 15:12:01', NULL, NULL, 'inside'),
(739, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0913', '', NULL, '2021-06-05 18:11:00', '10.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '10.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 10, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:15:18', '2021-06-05 15:15:18', NULL, NULL, 'inside'),
(740, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0914', '', NULL, '2021-06-05 18:18:00', '14.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '14.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 14, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:19:04', '2021-06-05 15:19:04', NULL, NULL, 'inside'),
(741, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0915', '', NULL, '2021-06-05 18:22:00', '8.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '8.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 8, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:22:36', '2021-06-05 15:22:36', NULL, NULL, 'inside'),
(742, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0916', '', NULL, '2021-06-05 18:34:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:35:05', '2021-06-05 15:35:05', NULL, NULL, 'inside'),
(743, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0917', '', NULL, '2021-06-05 18:36:00', '16.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '16.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 16, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:37:18', '2021-06-05 15:37:18', NULL, NULL, 'inside'),
(744, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0918', '', NULL, '2021-06-05 18:45:00', '24.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '24.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 24, NULL, 0, NULL, 'days', 0, NULL, NULL, '050a1c344a72eb1d24dc6f2332a07e8e', NULL, NULL, NULL, '2021-06-05 15:45:50', '2021-06-06 19:02:36', NULL, NULL, 'inside'),
(745, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0919', '', NULL, '2021-06-05 18:47:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, 'OUTSIDE', NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 15:47:41', '2021-06-05 15:47:42', NULL, NULL, 'outside'),
(746, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0920', '', NULL, '2021-06-05 20:27:00', '4.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 4, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-05 17:28:04', '2021-06-05 17:28:04', NULL, NULL, 'outside'),
(747, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0921', '', NULL, '2021-06-06 20:29:00', '6.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-06 17:30:11', '2021-06-06 19:54:01', NULL, NULL, 'outside'),
(748, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0922', '', NULL, '2021-06-06 20:36:00', '6.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '6.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 6, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-06 17:36:38', '2021-06-06 17:36:38', NULL, NULL, 'outside'),
(749, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2021-0923', '', NULL, '2021-06-06 21:48:00', '2.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '2.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, '0.00', NULL, '0.00', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, 0, NULL, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-06-06 18:49:31', '2021-06-06 18:49:31', NULL, NULL, 'outside');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(2, 11, 1, 0, '2.2500', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 11:34:44', 30, 1, NULL, NULL, NULL, 'SP2020/0002', NULL, '2020-12-14 10:34:44', '2020-12-14 10:34:44'),
(3, 12, 1, 0, '2.7500', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 11:36:47', 30, 1, NULL, NULL, NULL, 'SP2020/0003', NULL, '2020-12-14 10:36:47', '2020-12-14 10:36:47'),
(4, 13, 1, 0, '3.7500', 'card', NULL, NULL, '5921', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 12:17:20', 30, 1, NULL, NULL, NULL, 'SP2020/0004', NULL, '2020-12-14 11:17:20', '2020-12-14 11:17:20'),
(5, 14, 1, 0, '3.5000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 12:19:25', 30, 1, NULL, NULL, NULL, 'SP2020/0005', NULL, '2020-12-14 11:19:25', '2020-12-14 11:19:25'),
(6, 15, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 13:41:59', 30, 1, NULL, NULL, NULL, 'SP2020/0006', NULL, '2020-12-14 12:41:59', '2020-12-14 12:41:59'),
(7, 16, 1, 0, '2.4000', 'card', NULL, NULL, '8117', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 14:17:13', 30, 1, NULL, NULL, NULL, 'SP2020/0007', NULL, '2020-12-14 13:17:13', '2020-12-14 13:17:13'),
(8, 17, 1, 0, '2.1000', 'card', NULL, NULL, '6208', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 14:24:17', 30, 1, NULL, NULL, NULL, 'SP2020/0008', NULL, '2020-12-14 13:24:17', '2020-12-14 13:24:17'),
(9, 18, 1, 0, '1.5000', 'card', NULL, NULL, '1965', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-14 14:38:41', 30, 1, NULL, NULL, NULL, 'SP2020/0009', NULL, '2020-12-14 13:38:41', '2020-12-14 13:38:41'),
(11, 22, 1, 0, '1.5000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-15 12:09:49', 30, 1, NULL, NULL, NULL, 'SP2020/0011', NULL, '2020-12-15 11:09:49', '2020-12-15 11:09:49'),
(12, 23, 1, 0, '6.4500', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-15 12:34:06', 30, 1, NULL, NULL, NULL, 'SP2020/0012', NULL, '2020-12-15 11:34:06', '2020-12-15 11:34:06'),
(13, 24, 1, 0, '1.8000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-15 14:55:41', 30, 1, NULL, NULL, NULL, 'SP2020/0013', NULL, '2020-12-15 13:55:41', '2020-12-15 13:55:41'),
(14, 25, 1, 0, '2.7500', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:59:59', 30, 1, NULL, NULL, NULL, 'SP2020/0014', NULL, '2020-12-15 15:59:59', '2020-12-15 15:59:59'),
(15, 26, 1, 0, '3.3000', 'card', NULL, NULL, '0937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 12:32:28', 30, 1, NULL, NULL, NULL, 'SP2020/0015', NULL, '2020-12-16 11:32:28', '2020-12-16 11:32:28'),
(16, 27, 1, 0, '2.3500', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 13:26:52', 30, 1, NULL, NULL, NULL, 'SP2020/0016', NULL, '2020-12-16 12:26:52', '2020-12-16 12:26:52'),
(17, 28, 1, 0, '2.7500', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 14:46:33', 30, 1, NULL, NULL, NULL, 'SP2020/0017', NULL, '2020-12-16 13:46:33', '2020-12-16 13:46:33'),
(18, 29, 1, 0, '6.3000', 'card', NULL, NULL, '7596', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 16:25:08', 30, 1, NULL, NULL, NULL, 'SP2020/0018', NULL, '2020-12-16 15:25:08', '2020-12-16 15:25:08'),
(19, 30, 1, 0, '2.7500', 'card', NULL, NULL, '1317', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 16:47:16', 30, 1, NULL, NULL, NULL, 'SP2020/0019', NULL, '2020-12-16 15:47:16', '2020-12-16 15:47:16'),
(20, 31, 1, 0, '7.1500', 'card', NULL, NULL, '5127', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16 18:04:38', 30, 1, NULL, NULL, NULL, 'SP2020/0020', NULL, '2020-12-16 17:04:38', '2020-12-16 17:04:38'),
(21, 34, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 10:48:35', 30, 1, NULL, NULL, NULL, 'SP2020/0021', NULL, '2020-12-17 09:48:35', '2020-12-17 09:48:35'),
(22, 35, 1, 0, '3.6000', 'card', NULL, NULL, '7325', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 11:43:11', 30, 1, NULL, NULL, NULL, 'SP2020/0022', NULL, '2020-12-17 10:43:11', '2020-12-17 10:43:11'),
(23, 36, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 13:57:28', 30, 1, NULL, NULL, NULL, 'SP2020/0023', NULL, '2020-12-17 12:57:28', '2020-12-17 12:57:28'),
(24, 37, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 14:00:38', 30, 1, NULL, NULL, NULL, 'SP2020/0024', NULL, '2020-12-17 13:00:38', '2020-12-17 13:00:38'),
(25, 38, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 14:59:16', 30, 1, NULL, NULL, NULL, 'SP2020/0025', NULL, '2020-12-17 13:59:16', '2020-12-17 13:59:16'),
(26, 39, 1, 0, '3.6000', 'card', NULL, NULL, '9320', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17 15:39:35', 30, 1, NULL, NULL, NULL, 'SP2020/0026', NULL, '2020-12-17 14:39:35', '2020-12-17 14:39:35'),
(27, 40, 1, 0, '3.8000', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-18 18:00:20', 30, 1, NULL, NULL, NULL, 'SP2020/0027', NULL, '2020-12-18 17:00:20', '2020-12-18 17:00:20'),
(28, 41, 1, 0, '3.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-18 20:18:51', 30, 1, NULL, NULL, NULL, 'SP2020/0028', NULL, '2020-12-18 19:18:51', '2020-12-18 19:18:51'),
(29, 42, 1, 0, '8.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-19 12:48:19', 30, 1, NULL, NULL, NULL, 'SP2020/0029', NULL, '2020-12-19 11:48:19', '2020-12-19 11:48:19'),
(30, 43, 1, 0, '6.0500', 'card', NULL, NULL, '7016', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-19 17:23:36', 30, 1, NULL, NULL, NULL, 'SP2020/0030', NULL, '2020-12-19 16:23:36', '2020-12-19 16:23:36'),
(31, 44, 1, 0, '3.7000', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 13:43:38', 30, 1, NULL, NULL, NULL, 'SP2020/0031', NULL, '2020-12-20 12:43:38', '2020-12-20 12:43:38'),
(32, 45, 1, 0, '2.9000', 'card', NULL, NULL, '0937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 14:07:33', 30, 1, NULL, NULL, NULL, 'SP2020/0032', NULL, '2020-12-20 13:07:33', '2020-12-20 13:07:33'),
(33, 46, 1, 0, '1.5000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 16:18:24', 30, 1, NULL, NULL, NULL, 'SP2020/0033', NULL, '2020-12-20 15:18:24', '2020-12-20 15:18:24'),
(34, 47, 1, 0, '9.2000', 'card', NULL, NULL, '7561', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 17:16:02', 30, 1, NULL, NULL, NULL, 'SP2020/0034', NULL, '2020-12-20 16:16:02', '2020-12-20 16:16:02'),
(35, 48, 1, 0, '0.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 17:17:04', 30, 1, NULL, NULL, NULL, 'SP2020/0035', NULL, '2020-12-20 16:17:04', '2020-12-20 16:17:04'),
(36, 49, 1, 0, '5.2500', 'card', NULL, NULL, '0265', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 19:10:30', 30, 1, NULL, NULL, NULL, 'SP2020/0036', NULL, '2020-12-20 18:10:30', '2020-12-20 18:10:30'),
(37, 50, 1, 0, '1.5000', 'card', NULL, NULL, '5388', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 19:18:04', 30, 1, NULL, NULL, NULL, 'SP2020/0037', NULL, '2020-12-20 18:18:04', '2020-12-20 18:18:04'),
(38, 51, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-20 19:19:49', 30, 1, NULL, NULL, NULL, 'SP2020/0038', NULL, '2020-12-20 18:19:49', '2020-12-20 18:19:49'),
(39, 53, 1, 0, '3.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 10:15:16', 30, 1, NULL, NULL, NULL, 'SP2020/0039', NULL, '2020-12-21 09:15:16', '2020-12-21 09:15:16'),
(40, 54, 1, 0, '3.6500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 10:41:18', 30, 1, NULL, NULL, NULL, 'SP2020/0040', NULL, '2020-12-21 09:41:18', '2020-12-21 09:41:18'),
(41, 55, 1, 0, '7.0000', 'card', NULL, NULL, '9160', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 11:39:43', 30, 1, NULL, NULL, NULL, 'SP2020/0041', NULL, '2020-12-21 10:39:43', '2020-12-21 10:39:43'),
(42, 56, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 11:41:36', 30, 1, NULL, NULL, NULL, 'SP2020/0042', NULL, '2020-12-21 10:41:36', '2020-12-21 10:41:36'),
(43, 60, 1, 0, '4.2500', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 13:02:32', 30, 1, NULL, NULL, NULL, 'SP2020/0043', NULL, '2020-12-21 12:02:32', '2020-12-21 12:02:32'),
(44, 61, 1, 0, '3.0000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 13:10:42', 30, 1, NULL, NULL, NULL, 'SP2020/0044', NULL, '2020-12-21 12:10:42', '2020-12-21 12:10:42'),
(45, 62, 1, 0, '2.7500', 'card', NULL, NULL, '1317', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 13:33:59', 30, 1, NULL, NULL, NULL, 'SP2020/0045', NULL, '2020-12-21 12:33:59', '2020-12-21 12:33:59'),
(46, 63, 1, 0, '7.6500', 'card', NULL, NULL, '5839', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 16:30:24', 30, 1, NULL, NULL, NULL, 'SP2020/0046', NULL, '2020-12-21 15:30:24', '2020-12-21 15:30:24'),
(47, 64, 1, 0, '3.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 20:41:31', 30, 1, NULL, NULL, NULL, 'SP2020/0047', NULL, '2020-12-21 19:41:31', '2020-12-21 19:41:31'),
(48, 65, 1, 0, '5.2500', 'card', NULL, NULL, '7980', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 21:47:17', 30, 1, NULL, NULL, NULL, 'SP2020/0048', NULL, '2020-12-21 20:47:17', '2020-12-21 20:47:17'),
(49, 66, 1, 0, '2.2500', 'card', NULL, NULL, '7980', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-21 21:47:59', 30, 1, NULL, NULL, NULL, 'SP2020/0049', NULL, '2020-12-21 20:47:59', '2020-12-21 20:47:59'),
(50, 67, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 11:21:45', 30, 1, NULL, NULL, NULL, 'SP2020/0050', NULL, '2020-12-22 10:21:45', '2020-12-22 10:21:45'),
(51, 68, 1, 0, '3.6000', 'card', NULL, NULL, '4176', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 12:19:19', 30, 1, NULL, NULL, NULL, 'SP2020/0051', NULL, '2020-12-22 11:19:19', '2020-12-22 11:19:19'),
(52, 69, 1, 0, '1.5000', 'card', NULL, NULL, '7979', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 12:42:07', 30, 1, NULL, NULL, NULL, 'SP2020/0052', NULL, '2020-12-22 11:42:07', '2020-12-22 11:42:07'),
(53, 70, 1, 0, '4.4000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 12:56:02', 30, 1, NULL, NULL, NULL, 'SP2020/0053', NULL, '2020-12-22 11:56:02', '2020-12-22 11:56:02'),
(54, 71, 1, 0, '3.1500', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 13:24:17', 30, 1, NULL, NULL, NULL, 'SP2020/0054', NULL, '2020-12-22 12:24:17', '2020-12-22 12:24:17'),
(55, 72, 1, 0, '2.7500', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 14:41:55', 30, 1, NULL, NULL, NULL, 'SP2020/0055', NULL, '2020-12-22 13:41:55', '2020-12-22 13:41:55'),
(56, 73, 1, 0, '3.1000', 'card', NULL, NULL, '9567', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 15:20:57', 30, 1, NULL, NULL, NULL, 'SP2020/0056', NULL, '2020-12-22 14:20:57', '2020-12-22 14:20:57'),
(57, 74, 1, 0, '3.7500', 'card', NULL, NULL, '5196', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 18:23:55', 30, 1, NULL, NULL, NULL, 'SP2020/0057', NULL, '2020-12-22 17:23:55', '2020-12-22 17:23:55'),
(58, 75, 1, 0, '5.1500', 'card', NULL, NULL, '5479', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 19:19:48', 30, 1, NULL, NULL, NULL, 'SP2020/0058', NULL, '2020-12-22 18:19:48', '2020-12-22 18:19:48'),
(59, 76, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-22 20:11:19', 30, 1, NULL, NULL, NULL, 'SP2020/0059', NULL, '2020-12-22 19:11:19', '2020-12-22 19:11:19'),
(60, 77, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 13:38:51', 30, 1, NULL, NULL, NULL, 'SP2020/0060', NULL, '2020-12-23 12:38:51', '2020-12-23 12:38:51'),
(61, 79, 1, 0, '2.1000', 'card', NULL, NULL, '2002', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 14:26:56', 30, 1, NULL, NULL, NULL, 'SP2020/0061', NULL, '2020-12-23 13:26:56', '2020-12-23 13:26:56'),
(62, 80, 1, 0, '1.6500', 'card', NULL, NULL, '1788', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 14:31:07', 30, 1, NULL, NULL, NULL, 'SP2020/0062', NULL, '2020-12-23 13:31:07', '2020-12-23 13:31:07'),
(63, 81, 1, 0, '3.2500', 'card', NULL, NULL, '7019', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 14:41:10', 30, 1, NULL, NULL, NULL, 'SP2020/0063', NULL, '2020-12-23 13:41:10', '2020-12-23 13:41:10'),
(64, 82, 1, 0, '1.6500', 'card', NULL, NULL, '9277', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 15:22:56', 30, 1, NULL, NULL, NULL, 'SP2020/0064', NULL, '2020-12-23 14:22:56', '2020-12-23 14:22:56'),
(65, 83, 1, 0, '2.7500', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 15:35:07', 30, 1, NULL, NULL, NULL, 'SP2020/0065', NULL, '2020-12-23 14:35:07', '2020-12-23 14:35:07'),
(66, 84, 1, 0, '4.4500', 'card', NULL, NULL, '7980', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 16:15:10', 30, 1, NULL, NULL, NULL, 'SP2020/0066', NULL, '2020-12-23 15:15:10', '2020-12-23 15:15:10'),
(67, 85, 1, 0, '1.0000', 'card', NULL, NULL, '5504', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 18:37:21', 30, 1, NULL, NULL, NULL, 'SP2020/0067', NULL, '2020-12-23 17:37:21', '2020-12-23 17:37:21'),
(68, 86, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 20:00:04', 30, 1, NULL, NULL, NULL, 'SP2020/0068', NULL, '2020-12-23 19:00:04', '2020-12-23 19:00:04'),
(69, 87, 1, 0, '15.0500', 'card', NULL, NULL, '7561', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 20:45:53', 30, 1, NULL, NULL, NULL, 'SP2020/0069', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(70, 88, 1, 0, '1.5000', 'card', NULL, NULL, '6314', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 21:30:30', 30, 1, NULL, NULL, NULL, 'SP2020/0070', NULL, '2020-12-23 20:30:30', '2020-12-23 20:30:30'),
(71, 89, 1, 0, '2.1000', 'card', NULL, NULL, '1439', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 11:36:23', 30, 1, NULL, NULL, NULL, 'SP2020/0071', NULL, '2020-12-24 10:36:23', '2020-12-24 10:36:23'),
(72, 90, 1, 0, '2.2000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 14:08:46', 30, 1, NULL, NULL, NULL, 'SP2020/0072', NULL, '2020-12-24 13:08:46', '2020-12-24 13:08:46'),
(73, 91, 1, 0, '6.0500', 'card', NULL, NULL, '4861', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 14:26:06', 30, 1, NULL, NULL, NULL, 'SP2020/0073', NULL, '2020-12-24 13:26:06', '2020-12-24 13:26:06'),
(74, 92, 1, 0, '2.0000', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 16:36:42', 30, 1, NULL, NULL, NULL, 'SP2020/0074', NULL, '2020-12-24 15:36:42', '2020-12-24 15:36:42'),
(75, 93, 1, 0, '3.2500', 'card', NULL, NULL, '0838', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 19:16:40', 30, 1, NULL, NULL, NULL, 'SP2020/0075', NULL, '2020-12-24 18:16:40', '2020-12-24 18:16:40'),
(76, 94, 1, 0, '4.0000', 'card', NULL, NULL, '6930', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 19:17:40', 30, 1, NULL, NULL, NULL, 'SP2020/0076', NULL, '2020-12-24 18:17:40', '2020-12-24 18:17:40'),
(77, 95, 1, 0, '3.6500', 'card', NULL, NULL, '8810', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-24 22:12:30', 30, 1, NULL, NULL, NULL, 'SP2020/0077', NULL, '2020-12-24 21:12:30', '2020-12-24 21:12:30'),
(78, 98, 1, 0, '5.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-26 20:29:38', 30, 1, NULL, NULL, NULL, 'SP2020/0078', NULL, '2020-12-26 19:29:38', '2020-12-26 19:29:38'),
(79, 100, 1, 0, '5.5000', 'card', NULL, NULL, '8421', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 12:47:34', 30, 1, NULL, NULL, NULL, 'SP2020/0079', NULL, '2020-12-27 11:47:34', '2020-12-27 11:47:34'),
(80, 101, 1, 0, '2.7000', 'card', NULL, NULL, '1788', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 12:49:45', 30, 1, NULL, NULL, NULL, 'SP2020/0080', NULL, '2020-12-27 11:49:45', '2020-12-27 11:49:45'),
(81, 102, 1, 0, '2.7500', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 13:48:09', 30, 1, NULL, NULL, NULL, 'SP2020/0081', NULL, '2020-12-27 12:48:09', '2020-12-27 12:48:09'),
(82, 103, 1, 0, '5.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 13:49:39', 30, 1, NULL, NULL, NULL, 'SP2020/0082', NULL, '2020-12-27 12:49:39', '2020-12-27 12:49:39'),
(83, 104, 1, 0, '5.9000', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 14:25:16', 30, 1, NULL, NULL, NULL, 'SP2020/0083', NULL, '2020-12-27 13:25:16', '2020-12-27 13:25:16'),
(84, 105, 1, 0, '1.7000', 'card', NULL, NULL, '9320', 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 14:28:36', 30, 1, NULL, NULL, NULL, 'SP2020/0084', NULL, '2020-12-27 13:28:36', '2020-12-27 13:28:36'),
(85, 105, 1, 0, '0.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 14:28:36', 30, 1, NULL, NULL, NULL, 'SP2020/0085', NULL, '2020-12-27 13:28:36', '2020-12-27 13:28:36'),
(86, 106, 1, 0, '21.5000', 'card', NULL, NULL, '9160', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-27 15:26:47', 30, 1, NULL, NULL, NULL, 'SP2020/0086', NULL, '2020-12-27 14:26:47', '2020-12-27 14:26:47'),
(87, 107, 1, 0, '2.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 08:47:41', 30, 1, NULL, NULL, NULL, 'SP2020/0087', NULL, '2020-12-28 07:47:41', '2020-12-28 07:47:41'),
(88, 108, 1, 0, '2.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 11:19:03', 30, 1, NULL, NULL, NULL, 'SP2020/0088', NULL, '2020-12-28 10:19:03', '2020-12-28 10:19:03'),
(89, 109, 1, 0, '1.6500', 'card', NULL, NULL, '1879', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 12:28:22', 30, 1, NULL, NULL, NULL, 'SP2020/0089', NULL, '2020-12-28 11:28:22', '2020-12-28 11:28:22'),
(90, 110, 1, 0, '3.4000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 12:42:59', 30, 1, NULL, NULL, NULL, 'SP2020/0090', NULL, '2020-12-28 11:42:59', '2020-12-28 11:42:59'),
(91, 111, 1, 0, '2.4000', 'card', NULL, NULL, '7993', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 13:35:28', 30, 1, NULL, NULL, NULL, 'SP2020/0091', NULL, '2020-12-28 12:35:28', '2020-12-28 12:35:28'),
(92, 112, 1, 0, '1.5000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 13:36:32', 30, 1, NULL, NULL, NULL, 'SP2020/0092', NULL, '2020-12-28 12:36:32', '2020-12-28 12:36:32'),
(93, 113, 1, 0, '2.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 13:52:19', 30, 1, NULL, NULL, NULL, 'SP2020/0093', NULL, '2020-12-28 12:52:19', '2020-12-28 12:52:19'),
(94, 114, 1, 0, '1.5000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 14:32:27', 30, 1, NULL, NULL, NULL, 'SP2020/0094', NULL, '2020-12-28 13:32:27', '2020-12-28 13:32:27'),
(95, 115, 1, 0, '6.5500', 'card', NULL, NULL, '8100', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 14:42:54', 30, 1, NULL, NULL, NULL, 'SP2020/0095', NULL, '2020-12-28 13:42:54', '2020-12-28 13:42:54'),
(96, 116, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 18:46:05', 30, 1, NULL, NULL, NULL, 'SP2020/0096', NULL, '2020-12-28 17:46:05', '2020-12-28 17:46:05'),
(97, 117, 1, 0, '5.1500', 'card', NULL, NULL, '3045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 20:30:02', 30, 1, NULL, NULL, NULL, 'SP2020/0097', NULL, '2020-12-28 19:30:02', '2020-12-28 19:30:02'),
(98, 118, 1, 0, '4.7500', 'card', NULL, NULL, '4389', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 20:47:02', 30, 1, NULL, NULL, NULL, 'SP2020/0098', NULL, '2020-12-28 19:47:02', '2020-12-28 19:47:02'),
(99, 119, 1, 0, '3.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-28 21:05:48', 30, 1, NULL, NULL, NULL, 'SP2020/0099', NULL, '2020-12-28 20:05:48', '2020-12-28 20:05:48'),
(100, 120, 1, 0, '4.6500', 'card', NULL, NULL, '9676', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 11:11:23', 30, 1, NULL, NULL, NULL, 'SP2020/0100', NULL, '2020-12-29 10:11:23', '2020-12-29 10:11:23'),
(101, 121, 1, 0, '2.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 13:09:25', 30, 1, NULL, NULL, NULL, 'SP2020/0101', NULL, '2020-12-29 12:09:25', '2020-12-29 12:09:25'),
(102, 122, 1, 0, '4.7500', 'card', NULL, NULL, '6937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 16:20:02', 30, 1, NULL, NULL, NULL, 'SP2020/0102', NULL, '2020-12-29 15:20:02', '2020-12-29 15:20:02'),
(103, 123, 1, 0, '1.5000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 16:21:00', 30, 1, NULL, NULL, NULL, 'SP2020/0103', NULL, '2020-12-29 15:21:00', '2020-12-29 15:21:00'),
(104, 124, 1, 0, '2.0000', 'card', NULL, NULL, '9045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 16:57:35', 30, 1, NULL, NULL, NULL, 'SP2020/0104', NULL, '2020-12-29 15:57:35', '2020-12-29 15:57:35'),
(105, 125, 1, 0, '2.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 19:13:34', 30, 1, NULL, NULL, NULL, 'SP2020/0105', NULL, '2020-12-29 18:13:34', '2020-12-29 18:13:34'),
(106, 126, 1, 0, '0.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-29 20:25:49', 30, 1, NULL, NULL, NULL, 'SP2020/0106', NULL, '2020-12-29 19:25:49', '2020-12-29 19:25:49'),
(107, 127, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 08:26:27', 30, 1, NULL, NULL, NULL, 'SP2020/0107', NULL, '2020-12-30 07:26:27', '2020-12-30 07:26:27'),
(108, 128, 1, 0, '1.5000', 'card', NULL, NULL, '2682', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 11:58:41', 30, 1, NULL, NULL, NULL, 'SP2020/0108', NULL, '2020-12-30 10:58:41', '2020-12-30 10:58:41'),
(109, 129, 1, 0, '8.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 12:56:38', 30, 1, NULL, NULL, NULL, 'SP2020/0109', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(110, 130, 1, 0, '3.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 13:00:51', 30, 1, NULL, NULL, NULL, 'SP2020/0110', NULL, '2020-12-30 12:00:51', '2020-12-30 12:00:51'),
(111, 131, 1, 0, '8.2500', 'card', NULL, NULL, '0331', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 13:27:49', 30, 1, NULL, NULL, NULL, 'SP2020/0111', NULL, '2020-12-30 12:27:49', '2020-12-30 12:27:49'),
(112, 132, 1, 0, '3.0000', 'card', NULL, NULL, '5714', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 13:28:37', 30, 1, NULL, NULL, NULL, 'SP2020/0112', NULL, '2020-12-30 12:28:37', '2020-12-30 12:28:37'),
(113, 133, 1, 0, '2.8000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 14:16:13', 30, 1, NULL, NULL, NULL, 'SP2020/0113', NULL, '2020-12-30 13:16:13', '2020-12-30 13:16:13'),
(114, 134, 1, 0, '1.5000', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 14:17:00', 30, 1, NULL, NULL, NULL, 'SP2020/0114', NULL, '2020-12-30 13:17:00', '2020-12-30 13:17:00'),
(115, 135, 1, 0, '3.3000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 14:18:11', 30, 1, NULL, NULL, NULL, 'SP2020/0115', NULL, '2020-12-30 13:18:11', '2020-12-30 13:18:11'),
(116, 136, 1, 0, '2.0000', 'card', NULL, NULL, '3393', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 16:52:32', 30, 1, NULL, NULL, NULL, 'SP2020/0116', NULL, '2020-12-30 15:52:32', '2020-12-30 15:52:32'),
(117, 137, 1, 0, '2.7500', 'card', NULL, NULL, '0301', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 17:51:08', 30, 1, NULL, NULL, NULL, 'SP2020/0117', NULL, '2020-12-30 16:51:08', '2020-12-30 16:51:08'),
(118, 138, 1, 0, '4.7500', 'card', NULL, NULL, '9717', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 18:22:14', 30, 1, NULL, NULL, NULL, 'SP2020/0118', NULL, '2020-12-30 17:22:14', '2020-12-30 17:22:14'),
(119, 139, 1, 0, '4.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 18:37:54', 30, 1, NULL, NULL, NULL, 'SP2020/0119', NULL, '2020-12-30 17:37:54', '2020-12-30 17:37:54'),
(120, 140, 1, 0, '2.7500', 'card', NULL, NULL, '3045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-30 20:50:02', 30, 1, NULL, NULL, NULL, 'SP2020/0120', NULL, '2020-12-30 19:50:02', '2020-12-30 19:50:02'),
(121, 141, 1, 0, '5.5000', 'card', NULL, NULL, '0552', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 11:29:03', 30, 1, NULL, NULL, NULL, 'SP2020/0121', NULL, '2020-12-31 10:29:03', '2020-12-31 10:29:03'),
(122, 142, 1, 0, '2.7000', 'card', NULL, NULL, '1439', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 11:58:06', 30, 1, NULL, NULL, NULL, 'SP2020/0122', NULL, '2020-12-31 10:58:06', '2020-12-31 10:58:06'),
(123, 143, 1, 0, '5.7500', 'card', NULL, NULL, '9676', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 13:25:01', 30, 1, NULL, NULL, NULL, 'SP2020/0123', NULL, '2020-12-31 12:25:01', '2020-12-31 12:25:01'),
(124, 144, 1, 0, '2.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 13:25:47', 30, 1, NULL, NULL, NULL, 'SP2020/0124', NULL, '2020-12-31 12:25:47', '2020-12-31 12:25:47'),
(125, 145, 1, 0, '5.0000', 'card', NULL, NULL, '0914', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 17:41:48', 30, 1, NULL, NULL, NULL, 'SP2020/0125', NULL, '2020-12-31 16:41:48', '2020-12-31 16:41:48'),
(126, 148, 1, 0, '6.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-02 20:03:34', 30, 1, NULL, NULL, NULL, 'SP2021/0126', NULL, '2021-01-02 19:03:34', '2021-01-02 19:03:34'),
(127, 149, 1, 0, '6.5000', 'card', NULL, NULL, '9160', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-03 13:37:05', 30, 1, NULL, NULL, NULL, 'SP2021/0127', NULL, '2021-01-03 12:37:05', '2021-01-03 12:37:05'),
(128, 151, 1, 0, '4.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-03 17:22:30', 30, 1, NULL, NULL, NULL, 'SP2021/0128', NULL, '2021-01-03 16:22:30', '2021-01-03 16:22:30'),
(129, 152, 1, 0, '1.8000', 'card', NULL, NULL, '8339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-03 22:16:07', 30, 1, NULL, NULL, NULL, 'SP2021/0129', NULL, '2021-01-03 21:16:07', '2021-01-03 21:16:07'),
(130, 153, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-03 22:34:29', 30, 1, NULL, NULL, NULL, 'SP2021/0130', NULL, '2021-01-03 21:34:29', '2021-01-03 21:34:29'),
(131, 154, 1, 0, '2.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 11:09:22', 30, 1, NULL, NULL, NULL, 'SP2021/0131', NULL, '2021-01-04 10:09:22', '2021-01-04 10:09:22'),
(132, 155, 1, 0, '3.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 12:47:11', 30, 1, NULL, NULL, NULL, 'SP2021/0132', NULL, '2021-01-04 11:47:11', '2021-01-04 11:47:11'),
(133, 156, 1, 0, '5.3500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 16:03:58', 30, 1, NULL, NULL, NULL, 'SP2021/0133', NULL, '2021-01-04 15:03:58', '2021-01-04 15:03:58'),
(134, 157, 1, 0, '2.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 16:44:48', 30, 1, NULL, NULL, NULL, 'SP2021/0134', NULL, '2021-01-04 15:44:48', '2021-01-04 15:44:48'),
(135, 158, 1, 0, '1.5000', 'card', NULL, NULL, '3347', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 17:06:58', 30, 1, NULL, NULL, NULL, 'SP2021/0135', NULL, '2021-01-04 16:06:58', '2021-01-04 16:06:58'),
(136, 159, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 18:06:57', 30, 1, NULL, NULL, NULL, 'SP2021/0136', NULL, '2021-01-04 17:06:57', '2021-01-04 17:06:57'),
(137, 160, 1, 0, '2.3000', 'card', NULL, NULL, '2496', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-04 21:48:09', 30, 1, NULL, NULL, NULL, 'SP2021/0137', NULL, '2021-01-04 20:48:09', '2021-01-04 20:48:09'),
(138, 161, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 10:14:45', 30, 1, NULL, NULL, NULL, 'SP2021/0138', NULL, '2021-01-05 09:14:45', '2021-01-05 09:14:45'),
(139, 162, 1, 0, '2.1500', 'card', NULL, NULL, '0357', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 10:51:46', 30, 1, NULL, NULL, NULL, 'SP2021/0139', NULL, '2021-01-05 09:51:46', '2021-01-05 09:51:46'),
(140, 163, 1, 0, '5.5000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 12:49:43', 30, 1, NULL, NULL, NULL, 'SP2021/0140', NULL, '2021-01-05 11:49:43', '2021-01-05 11:49:43'),
(141, 165, 1, 0, '6.5000', 'card', NULL, NULL, '9690', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 14:37:28', 30, 1, NULL, NULL, NULL, 'SP2021/0141', NULL, '2021-01-05 13:37:28', '2021-01-05 13:37:28'),
(142, 166, 1, 0, '0.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 15:09:10', 30, 1, NULL, NULL, NULL, 'SP2021/0142', NULL, '2021-01-05 14:09:10', '2021-01-05 14:09:10'),
(143, 167, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 17:12:56', 30, 1, NULL, NULL, NULL, 'SP2021/0143', NULL, '2021-01-05 16:12:56', '2021-01-05 16:12:56'),
(144, 168, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 17:46:04', 30, 1, NULL, NULL, NULL, 'SP2021/0144', NULL, '2021-01-05 16:46:04', '2021-01-05 16:46:04'),
(145, 169, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 19:50:20', 30, 1, NULL, NULL, NULL, 'SP2021/0145', NULL, '2021-01-05 18:50:20', '2021-01-05 18:50:20'),
(146, 170, 1, 0, '3.7500', 'card', NULL, NULL, '4638', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-05 20:01:57', 30, 1, NULL, NULL, NULL, 'SP2021/0146', NULL, '2021-01-05 19:01:57', '2021-01-05 19:01:57'),
(147, 171, 1, 0, '2.5000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 08:43:46', 30, 1, NULL, NULL, NULL, 'SP2021/0147', NULL, '2021-01-06 07:43:46', '2021-01-06 07:43:46'),
(148, 172, 1, 0, '7.9000', 'card', NULL, NULL, '2460', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 12:12:50', 30, 1, NULL, NULL, NULL, 'SP2021/0148', NULL, '2021-01-06 11:12:50', '2021-01-06 11:12:50'),
(149, 173, 1, 0, '2.7500', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 12:31:31', 30, 1, NULL, NULL, NULL, 'SP2021/0149', NULL, '2021-01-06 11:31:31', '2021-01-06 11:31:31'),
(150, 174, 1, 0, '3.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 13:19:12', 30, 1, NULL, NULL, NULL, 'SP2021/0150', NULL, '2021-01-06 12:19:12', '2021-01-06 12:19:12'),
(151, 175, 1, 0, '5.4500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 14:44:21', 30, 1, NULL, NULL, NULL, 'SP2021/0151', NULL, '2021-01-06 13:44:21', '2021-01-06 13:44:21'),
(152, 176, 1, 0, '19.7500', 'card', NULL, NULL, '9160', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 16:21:08', 30, 1, NULL, NULL, NULL, 'SP2021/0152', NULL, '2021-01-06 15:21:08', '2021-01-06 15:21:08'),
(153, 177, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 19:50:30', 30, 1, NULL, NULL, NULL, 'SP2021/0153', NULL, '2021-01-06 18:50:30', '2021-01-06 18:50:30'),
(154, 178, 1, 0, '4.6500', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 21:36:10', 30, 1, NULL, NULL, NULL, 'SP2021/0154', NULL, '2021-01-06 20:36:10', '2021-01-06 20:36:10'),
(155, 179, 1, 0, '5.1500', 'card', NULL, NULL, '0331', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 22:29:48', 30, 1, NULL, NULL, NULL, 'SP2021/0155', NULL, '2021-01-06 21:29:48', '2021-01-06 21:29:48'),
(156, 180, 1, 0, '0.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-06 22:30:50', 30, 1, NULL, NULL, NULL, 'SP2021/0156', NULL, '2021-01-06 21:30:50', '2021-01-06 21:30:50'),
(157, 181, 1, 0, '2.5000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 09:00:26', 30, 1, NULL, NULL, NULL, 'SP2021/0157', NULL, '2021-01-07 08:00:26', '2021-01-07 08:00:26'),
(158, 182, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 09:35:04', 30, 1, NULL, NULL, NULL, 'SP2021/0158', NULL, '2021-01-07 08:35:04', '2021-01-07 08:35:04'),
(159, 183, 1, 0, '2.0000', 'card', NULL, NULL, '9403', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 09:35:59', 30, 1, NULL, NULL, NULL, 'SP2021/0159', NULL, '2021-01-07 08:35:59', '2021-01-07 08:35:59'),
(160, 184, 1, 0, '4.9000', 'card', NULL, NULL, '0331', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 10:04:24', 30, 1, NULL, NULL, NULL, 'SP2021/0160', NULL, '2021-01-07 09:04:24', '2021-01-07 09:04:24'),
(161, 185, 1, 0, '3.7500', 'card', NULL, NULL, '6306', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 11:29:36', 30, 1, NULL, NULL, NULL, 'SP2021/0161', NULL, '2021-01-07 10:29:36', '2021-01-07 10:29:36'),
(163, 187, 1, 0, '2.7500', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 13:28:39', 30, 1, NULL, NULL, NULL, 'SP2021/0163', NULL, '2021-01-07 12:28:39', '2021-01-07 12:28:39'),
(164, 189, 1, 0, '1.7500', 'card', NULL, NULL, '7335', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 14:05:51', 30, 1, NULL, NULL, NULL, 'SP2021/0164', NULL, '2021-01-07 13:05:51', '2021-01-07 13:05:51'),
(165, 190, 1, 0, '6.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 14:47:46', 30, 1, NULL, NULL, NULL, 'SP2021/0165', NULL, '2021-01-07 13:47:46', '2021-01-07 13:47:46'),
(166, 191, 1, 0, '4.4000', 'card', NULL, NULL, '7400', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07 17:23:08', 30, 1, NULL, NULL, NULL, 'SP2021/0166', NULL, '2021-01-07 16:23:08', '2021-01-07 16:23:08'),
(167, 192, 1, 0, '4.2500', 'card', NULL, NULL, '8077', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09 15:22:14', 30, 1, NULL, NULL, NULL, 'SP2021/0167', NULL, '2021-01-09 14:22:14', '2021-01-09 14:22:14'),
(168, 193, 1, 0, '4.2000', 'card', NULL, NULL, '7648', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09 15:27:04', 30, 1, NULL, NULL, NULL, 'SP2021/0168', NULL, '2021-01-09 14:27:04', '2021-01-09 14:27:04'),
(169, 194, 1, 0, '0.9500', 'card', NULL, NULL, '7373', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09 15:40:27', 30, 1, NULL, NULL, NULL, 'SP2021/0169', NULL, '2021-01-09 14:40:27', '2021-01-09 14:40:27'),
(170, 195, 1, 0, '4.0500', 'card', NULL, NULL, '6684', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09 16:28:59', 30, 1, NULL, NULL, NULL, 'SP2021/0170', NULL, '2021-01-09 15:28:59', '2021-01-09 15:28:59'),
(171, 196, 1, 0, '8.2000', 'card', NULL, NULL, '8973', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09 19:04:18', 30, 1, NULL, NULL, NULL, 'SP2021/0171', NULL, '2021-01-09 18:04:18', '2021-01-09 18:04:18'),
(172, 197, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 12:15:16', 30, 1, NULL, NULL, NULL, 'SP2021/0172', NULL, '2021-01-10 11:15:16', '2021-01-10 11:15:16'),
(173, 198, 1, 0, '4.6500', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 13:39:31', 30, 1, NULL, NULL, NULL, 'SP2021/0173', NULL, '2021-01-10 12:39:31', '2021-01-10 12:39:31'),
(174, 199, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 14:02:53', 30, 1, NULL, NULL, NULL, 'SP2021/0174', NULL, '2021-01-10 13:02:53', '2021-01-10 13:02:53'),
(175, 200, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 14:26:50', 30, 1, NULL, NULL, NULL, 'SP2021/0175', NULL, '2021-01-10 13:26:50', '2021-01-10 13:26:50'),
(176, 201, 1, 0, '12.6000', 'card', NULL, NULL, '9160', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 16:50:09', 30, 1, NULL, NULL, NULL, 'SP2021/0176', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(177, 202, 1, 0, '1.0000', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 17:03:14', 30, 1, NULL, NULL, NULL, 'SP2021/0177', NULL, '2021-01-10 16:03:14', '2021-01-10 16:03:14'),
(178, 203, 1, 0, '9.5000', 'card', NULL, NULL, '8077', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 18:01:41', 30, 1, NULL, NULL, NULL, 'SP2021/0178', NULL, '2021-01-10 17:01:41', '2021-01-10 17:01:41'),
(179, 204, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 19:29:22', 30, 1, NULL, NULL, NULL, 'SP2021/0179', NULL, '2021-01-10 18:29:22', '2021-01-10 18:29:22'),
(180, 205, 1, 0, '4.4000', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-10 21:08:58', 30, 1, NULL, NULL, NULL, 'SP2021/0180', NULL, '2021-01-10 20:08:58', '2021-01-10 20:08:58'),
(181, 206, 1, 0, '3.1500', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 14:57:37', 30, 1, NULL, NULL, NULL, 'SP2021/0181', NULL, '2021-01-11 13:57:37', '2021-01-11 13:57:37'),
(182, 207, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 16:42:59', 30, 1, NULL, NULL, NULL, 'SP2021/0182', NULL, '2021-01-11 15:42:59', '2021-01-11 15:42:59'),
(183, 208, 1, 0, '1.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 17:49:23', 30, 1, NULL, NULL, NULL, 'SP2021/0183', NULL, '2021-01-11 16:49:23', '2021-01-11 16:49:23'),
(184, 209, 1, 0, '2.1500', 'card', NULL, NULL, '3139', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 20:18:38', 30, 1, NULL, NULL, NULL, 'SP2021/0184', NULL, '2021-01-11 19:18:38', '2021-01-11 19:18:38'),
(185, 210, 1, 0, '1.8000', 'card', NULL, NULL, '3139', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 20:19:21', 30, 1, NULL, NULL, NULL, 'SP2021/0185', NULL, '2021-01-11 19:19:21', '2021-01-11 19:19:21'),
(186, 211, 1, 0, '4.2500', 'card', NULL, NULL, '4638', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 08:53:08', 30, 1, NULL, NULL, NULL, 'SP2021/0186', NULL, '2021-01-12 07:53:08', '2021-01-12 07:53:08'),
(187, 212, 1, 0, '2.5000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 09:08:49', 30, 1, NULL, NULL, NULL, 'SP2021/0187', NULL, '2021-01-12 08:08:49', '2021-01-12 08:08:49'),
(188, 213, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 09:19:39', 30, 1, NULL, NULL, NULL, 'SP2021/0188', NULL, '2021-01-12 08:19:39', '2021-01-12 08:19:39'),
(189, 214, 1, 0, '3.2000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 12:55:33', 30, 1, NULL, NULL, NULL, 'SP2021/0189', NULL, '2021-01-12 11:55:33', '2021-01-12 11:55:33'),
(190, 215, 1, 0, '2.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 12:59:05', 30, 1, NULL, NULL, NULL, 'SP2021/0190', NULL, '2021-01-12 11:59:05', '2021-01-12 11:59:05'),
(191, 216, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 16:12:35', 30, 1, NULL, NULL, NULL, 'SP2021/0191', NULL, '2021-01-12 15:12:35', '2021-01-12 15:12:35'),
(192, 217, 1, 0, '3.0000', 'card', NULL, NULL, '1603', 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 20:48:30', 30, 1, NULL, NULL, NULL, 'SP2021/0192', NULL, '2021-01-12 19:48:30', '2021-01-12 19:48:30'),
(193, 217, 1, 0, '0.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 20:48:30', 30, 1, NULL, NULL, NULL, 'SP2021/0193', NULL, '2021-01-12 19:48:30', '2021-01-12 19:48:30'),
(194, 218, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-12 21:42:33', 30, 1, NULL, NULL, NULL, 'SP2021/0194', NULL, '2021-01-12 20:42:33', '2021-01-12 20:42:33'),
(195, 219, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 09:24:52', 30, 1, NULL, NULL, NULL, 'SP2021/0195', NULL, '2021-01-13 08:24:52', '2021-01-13 08:24:52'),
(196, 220, 1, 0, '4.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 13:14:11', 30, 1, NULL, NULL, NULL, 'SP2021/0196', NULL, '2021-01-13 12:14:11', '2021-01-13 12:14:11'),
(197, 221, 1, 0, '1.8000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 13:15:08', 30, 1, NULL, NULL, NULL, 'SP2021/0197', NULL, '2021-01-13 12:15:08', '2021-01-13 12:15:08'),
(198, 222, 1, 0, '2.1000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 13:24:46', 30, 1, NULL, NULL, NULL, 'SP2021/0198', NULL, '2021-01-13 12:24:46', '2021-01-13 12:24:46'),
(199, 223, 1, 0, '5.8000', 'card', NULL, NULL, '0937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 15:32:27', 30, 1, NULL, NULL, NULL, 'SP2021/0199', NULL, '2021-01-13 14:32:27', '2021-01-13 14:32:27'),
(200, 224, 1, 0, '7.2500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 17:55:21', 30, 1, NULL, NULL, NULL, 'SP2021/0200', NULL, '2021-01-13 16:55:21', '2021-01-13 16:55:21'),
(201, 225, 1, 0, '1.6500', 'card', NULL, NULL, '3045', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 18:56:21', 30, 1, NULL, NULL, NULL, 'SP2021/0201', NULL, '2021-01-13 17:56:21', '2021-01-13 17:56:21'),
(202, 226, 1, 0, '4.2500', 'card', NULL, NULL, '2557', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 21:05:54', 30, 1, NULL, NULL, NULL, 'SP2021/0202', NULL, '2021-01-13 20:05:54', '2021-01-13 20:05:54'),
(203, 227, 1, 0, '0.4000', 'card', NULL, NULL, '2557', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-13 21:16:18', 30, 1, NULL, NULL, NULL, 'SP2021/0203', NULL, '2021-01-13 20:16:18', '2021-01-13 20:16:18'),
(204, 228, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 11:32:18', 30, 1, NULL, NULL, NULL, 'SP2021/0204', NULL, '2021-01-14 10:32:18', '2021-01-14 10:32:18'),
(205, 229, 1, 0, '1.8000', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 13:30:53', 30, 1, NULL, NULL, NULL, 'SP2021/0205', NULL, '2021-01-14 12:30:53', '2021-01-14 12:30:53'),
(206, 230, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 16:47:59', 30, 1, NULL, NULL, NULL, 'SP2021/0206', NULL, '2021-01-14 15:47:59', '2021-01-14 15:47:59'),
(207, 231, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 19:27:50', 30, 1, NULL, NULL, NULL, 'SP2021/0207', NULL, '2021-01-14 18:27:50', '2021-01-14 18:27:50'),
(208, 232, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 19:48:01', 30, 1, NULL, NULL, NULL, 'SP2021/0208', NULL, '2021-01-14 18:48:01', '2021-01-14 18:48:01'),
(209, 233, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 21:20:15', 30, 1, NULL, NULL, NULL, 'SP2021/0209', NULL, '2021-01-14 20:20:15', '2021-01-14 20:20:15'),
(210, 234, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-14 21:55:01', 30, 1, NULL, NULL, NULL, 'SP2021/0210', NULL, '2021-01-14 20:55:01', '2021-01-14 20:55:01'),
(211, 235, 1, 0, '5.6500', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 14:50:21', 30, 1, NULL, NULL, NULL, 'SP2021/0211', NULL, '2021-01-16 13:50:21', '2021-01-16 13:50:21'),
(212, 236, 1, 0, '5.2500', 'card', NULL, NULL, '6711', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 16:07:18', 30, 1, NULL, NULL, NULL, 'SP2021/0212', NULL, '2021-01-16 15:07:18', '2021-01-16 15:07:18'),
(213, 237, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 17:55:51', 30, 1, NULL, NULL, NULL, 'SP2021/0213', NULL, '2021-01-16 16:55:51', '2021-01-16 16:55:51'),
(214, 238, 1, 0, '3.1500', 'card', NULL, NULL, '1014', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-16 20:24:05', 30, 1, NULL, NULL, NULL, 'SP2021/0214', NULL, '2021-01-16 19:24:05', '2021-01-16 19:24:05'),
(215, 239, 1, 0, '2.1500', 'card', NULL, NULL, '9159', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 09:57:02', 30, 1, NULL, NULL, NULL, 'SP2021/0215', NULL, '2021-01-17 08:57:02', '2021-01-17 08:57:02'),
(216, 240, 1, 0, '3.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 12:55:25', 30, 1, NULL, NULL, NULL, 'SP2021/0216', NULL, '2021-01-17 11:55:25', '2021-01-17 11:55:25'),
(217, 241, 1, 0, '3.7500', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 13:18:06', 30, 1, NULL, NULL, NULL, 'SP2021/0217', NULL, '2021-01-17 12:18:06', '2021-01-17 12:18:06'),
(218, 242, 1, 0, '1.5000', 'card', NULL, NULL, '9151', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 13:32:39', 30, 1, NULL, NULL, NULL, 'SP2021/0218', NULL, '2021-01-17 12:32:39', '2021-01-17 12:32:39'),
(219, 243, 1, 0, '1.8000', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 13:52:51', 30, 1, NULL, NULL, NULL, 'SP2021/0219', NULL, '2021-01-17 12:52:51', '2021-01-17 12:52:51'),
(220, 244, 1, 0, '3.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 16:03:10', 30, 1, NULL, NULL, NULL, 'SP2021/0220', NULL, '2021-01-17 15:03:10', '2021-01-17 15:03:10'),
(221, 245, 1, 0, '3.0000', 'card', NULL, NULL, '3347', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 18:22:44', 30, 1, NULL, NULL, NULL, 'SP2021/0221', NULL, '2021-01-17 17:22:44', '2021-01-17 17:22:44'),
(222, 246, 1, 0, '4.5500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-17 18:48:58', 30, 1, NULL, NULL, NULL, 'SP2021/0222', NULL, '2021-01-17 17:48:58', '2021-01-17 17:48:58'),
(223, 247, 1, 0, '3.3000', 'card', NULL, NULL, '5408', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-18 14:44:09', 30, 1, NULL, NULL, NULL, 'SP2021/0223', NULL, '2021-01-18 13:44:09', '2021-01-18 13:44:09'),
(224, 248, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-18 16:36:27', 30, 1, NULL, NULL, NULL, 'SP2021/0224', NULL, '2021-01-18 15:36:27', '2021-01-18 15:36:27'),
(225, 249, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-18 20:05:37', 30, 1, NULL, NULL, NULL, 'SP2021/0225', NULL, '2021-01-18 19:05:37', '2021-01-18 19:05:37'),
(226, 250, 1, 0, '2.0000', 'card', NULL, NULL, '3745', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-18 20:10:51', 30, 1, NULL, NULL, NULL, 'SP2021/0226', NULL, '2021-01-18 19:10:51', '2021-01-18 19:10:51'),
(227, 251, 1, 0, '2.1000', 'card', NULL, NULL, '8973', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-18 21:45:30', 30, 1, NULL, NULL, NULL, 'SP2021/0227', NULL, '2021-01-18 20:45:30', '2021-01-18 20:45:30'),
(228, 252, 1, 0, '2.1500', 'card', NULL, NULL, '9159', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 10:09:41', 30, 1, NULL, NULL, NULL, 'SP2021/0228', NULL, '2021-01-19 09:09:41', '2021-01-19 09:09:41'),
(229, 253, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 14:21:03', 30, 1, NULL, NULL, NULL, 'SP2021/0229', NULL, '2021-01-19 13:21:03', '2021-01-19 13:21:03'),
(230, 254, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 15:19:45', 30, 1, NULL, NULL, NULL, 'SP2021/0230', NULL, '2021-01-19 14:19:45', '2021-01-19 14:19:45'),
(231, 255, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 15:46:33', 30, 1, NULL, NULL, NULL, 'SP2021/0231', NULL, '2021-01-19 14:46:33', '2021-01-19 14:46:33'),
(232, 256, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 16:31:32', 30, 1, NULL, NULL, NULL, 'SP2021/0232', NULL, '2021-01-19 15:31:32', '2021-01-19 15:31:32'),
(233, 257, 1, 0, '2.0000', 'card', NULL, NULL, '1798', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 19:24:42', 30, 1, NULL, NULL, NULL, 'SP2021/0233', NULL, '2021-01-19 18:24:42', '2021-01-19 18:24:42'),
(234, 258, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 20:22:10', 30, 1, NULL, NULL, NULL, 'SP2021/0234', NULL, '2021-01-19 19:22:10', '2021-01-19 19:22:10'),
(235, 259, 1, 0, '4.4000', 'card', NULL, NULL, '6231', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-19 20:23:21', 30, 1, NULL, NULL, NULL, 'SP2021/0235', NULL, '2021-01-19 19:23:21', '2021-01-19 19:23:21'),
(236, 260, 1, 0, '3.0000', 'card', NULL, NULL, '7867', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 09:46:06', 30, 1, NULL, NULL, NULL, 'SP2021/0236', NULL, '2021-01-20 08:46:06', '2021-01-20 08:46:06');
INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(237, 261, 1, 0, '3.5000', 'card', NULL, NULL, '9159', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 12:41:04', 30, 1, NULL, NULL, NULL, 'SP2021/0237', NULL, '2021-01-20 11:41:04', '2021-01-20 11:41:04'),
(238, 262, 1, 0, '3.0000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 14:00:19', 30, 1, NULL, NULL, NULL, 'SP2021/0238', NULL, '2021-01-20 13:00:19', '2021-01-20 13:00:19'),
(239, 263, 1, 0, '3.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 16:01:54', 30, 1, NULL, NULL, NULL, 'SP2021/0239', NULL, '2021-01-20 15:01:54', '2021-01-20 15:01:54'),
(240, 264, 1, 0, '4.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 16:36:19', 30, 1, NULL, NULL, NULL, 'SP2021/0240', NULL, '2021-01-20 15:36:19', '2021-01-20 15:36:19'),
(241, 265, 1, 0, '3.5000', 'card', NULL, NULL, '8973', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 18:07:29', 30, 1, NULL, NULL, NULL, 'SP2021/0241', NULL, '2021-01-20 17:07:29', '2021-01-20 17:07:29'),
(242, 266, 1, 0, '3.7000', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-20 21:19:45', 30, 1, NULL, NULL, NULL, 'SP2021/0242', NULL, '2021-01-20 20:19:45', '2021-01-20 20:19:45'),
(243, 267, 1, 0, '4.0000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 08:51:02', 30, 1, NULL, NULL, NULL, 'SP2021/0243', NULL, '2021-01-21 07:51:02', '2021-01-21 07:51:02'),
(244, 268, 1, 0, '3.6000', 'card', NULL, NULL, '2190', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 14:09:50', 30, 1, NULL, NULL, NULL, 'SP2021/0244', NULL, '2021-01-21 13:09:50', '2021-01-21 13:09:50'),
(245, 269, 1, 0, '4.1500', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 14:17:21', 30, 1, NULL, NULL, NULL, 'SP2021/0245', NULL, '2021-01-21 13:17:21', '2021-01-21 13:17:21'),
(246, 270, 1, 0, '8.7500', 'card', NULL, NULL, '1554', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 16:19:59', 30, 1, NULL, NULL, NULL, 'SP2021/0246', NULL, '2021-01-21 15:19:59', '2021-01-21 15:19:59'),
(247, 271, 1, 0, '3.7500', 'card', NULL, NULL, '5951', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 16:36:48', 30, 1, NULL, NULL, NULL, 'SP2021/0247', NULL, '2021-01-21 15:36:48', '2021-01-21 15:36:48'),
(248, 272, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 17:40:59', 30, 1, NULL, NULL, NULL, 'SP2021/0248', NULL, '2021-01-21 16:40:59', '2021-01-21 16:40:59'),
(249, 273, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 17:42:08', 30, 1, NULL, NULL, NULL, 'SP2021/0249', NULL, '2021-01-21 16:42:08', '2021-01-21 16:42:08'),
(250, 274, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-21 17:44:15', 30, 1, NULL, NULL, NULL, 'SP2021/0250', NULL, '2021-01-21 16:44:15', '2021-01-21 16:44:15'),
(251, 275, 1, 0, '4.2500', 'card', NULL, NULL, '5049', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-23 16:57:02', 30, 1, NULL, NULL, NULL, 'SP2021/0251', NULL, '2021-01-23 15:57:02', '2021-01-23 15:57:02'),
(252, 276, 1, 0, '1.0000', 'card', NULL, NULL, '4456', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-23 19:17:08', 30, 1, NULL, NULL, NULL, 'SP2021/0252', NULL, '2021-01-23 18:17:08', '2021-01-23 18:17:08'),
(253, 277, 1, 0, '2.5000', 'card', NULL, NULL, '0157', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-24 08:51:05', 30, 1, NULL, NULL, NULL, 'SP2021/0253', NULL, '2021-01-24 07:51:05', '2021-01-24 07:51:05'),
(254, 278, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-24 09:58:09', 30, 1, NULL, NULL, NULL, 'SP2021/0254', NULL, '2021-01-24 08:58:09', '2021-01-24 08:58:09'),
(255, 279, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-24 14:38:49', 30, 1, NULL, NULL, NULL, 'SP2021/0255', NULL, '2021-01-24 13:38:49', '2021-01-24 13:38:49'),
(256, 280, 1, 0, '6.7500', 'card', NULL, NULL, '5504', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-24 16:33:34', 30, 1, NULL, NULL, NULL, 'SP2021/0256', NULL, '2021-01-24 15:33:34', '2021-01-24 15:33:34'),
(257, 281, 1, 0, '4.4500', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-24 22:22:24', 30, 1, NULL, NULL, NULL, 'SP2021/0257', NULL, '2021-01-24 21:22:24', '2021-01-24 21:22:24'),
(258, 282, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 12:26:37', 30, 1, NULL, NULL, NULL, 'SP2021/0258', NULL, '2021-01-25 11:26:37', '2021-01-25 11:26:37'),
(259, 283, 1, 0, '0.5000', 'card', NULL, NULL, '0937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 13:03:06', 30, 1, NULL, NULL, NULL, 'SP2021/0259', NULL, '2021-01-25 12:03:06', '2021-01-25 12:03:06'),
(260, 284, 1, 0, '3.3000', 'card', NULL, NULL, '0937', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 13:03:49', 30, 1, NULL, NULL, NULL, 'SP2021/0260', NULL, '2021-01-25 12:03:49', '2021-01-25 12:03:49'),
(261, 285, 1, 0, '3.4000', 'card', NULL, NULL, '0538', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 14:11:27', 30, 1, NULL, NULL, NULL, 'SP2021/0261', NULL, '2021-01-25 13:11:27', '2021-01-25 13:11:27'),
(262, 286, 1, 0, '2.2500', 'card', NULL, NULL, '3911', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 14:12:09', 30, 1, NULL, NULL, NULL, 'SP2021/0262', NULL, '2021-01-25 13:12:09', '2021-01-25 13:12:09'),
(263, 287, 1, 0, '2.3000', 'card', NULL, NULL, '4861', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 15:18:21', 30, 1, NULL, NULL, NULL, 'SP2021/0263', NULL, '2021-01-25 14:18:21', '2021-01-25 14:18:21'),
(264, 288, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 17:22:57', 30, 1, NULL, NULL, NULL, 'SP2021/0264', NULL, '2021-01-25 16:22:57', '2021-01-25 16:22:57'),
(265, 289, 1, 0, '2.1000', 'card', NULL, NULL, '4019', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 18:10:51', 30, 1, NULL, NULL, NULL, 'SP2021/0265', NULL, '2021-01-25 17:10:51', '2021-01-25 17:10:51'),
(266, 290, 1, 0, '6.2000', 'card', NULL, NULL, '8488', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 21:25:45', 30, 1, NULL, NULL, NULL, 'SP2021/0266', NULL, '2021-01-25 20:25:45', '2021-01-25 20:25:45'),
(267, 291, 1, 0, '1.8000', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-25 22:27:21', 30, 1, NULL, NULL, NULL, 'SP2021/0267', NULL, '2021-01-25 21:27:21', '2021-01-25 21:27:21'),
(268, 292, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-26 13:13:07', 30, 1, NULL, NULL, NULL, 'SP2021/0268', NULL, '2021-01-26 12:13:07', '2021-01-26 12:13:07'),
(269, 293, 1, 0, '3.3000', 'card', NULL, NULL, '8515', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-26 15:05:21', 30, 1, NULL, NULL, NULL, 'SP2021/0269', NULL, '2021-01-26 14:05:21', '2021-01-26 14:05:21'),
(270, 294, 1, 0, '2.0000', 'card', NULL, NULL, '4451', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-26 15:47:47', 30, 1, NULL, NULL, NULL, 'SP2021/0270', NULL, '2021-01-26 14:47:47', '2021-01-26 14:47:47'),
(271, 295, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-26 22:31:48', 30, 1, NULL, NULL, NULL, 'SP2021/0271', NULL, '2021-01-26 21:31:48', '2021-01-26 21:31:48'),
(272, 296, 1, 0, '1.5000', 'card', NULL, NULL, '9403', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 09:59:12', 30, 1, NULL, NULL, NULL, 'SP2021/0272', NULL, '2021-01-27 08:59:12', '2021-01-27 08:59:12'),
(273, 297, 1, 0, '0.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 11:37:09', 30, 1, NULL, NULL, NULL, 'SP2021/0273', NULL, '2021-01-27 10:37:09', '2021-01-27 10:37:09'),
(274, 298, 1, 0, '2.1000', 'card', NULL, NULL, '5109', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 12:08:12', 30, 1, NULL, NULL, NULL, 'SP2021/0274', NULL, '2021-01-27 11:08:12', '2021-01-27 11:08:12'),
(275, 299, 1, 0, '1.3500', 'card', NULL, NULL, '5127', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 13:08:20', 30, 1, NULL, NULL, NULL, 'SP2021/0275', NULL, '2021-01-27 12:08:20', '2021-01-27 12:08:20'),
(276, 300, 1, 0, '4.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 13:10:22', 30, 1, NULL, NULL, NULL, 'SP2021/0276', NULL, '2021-01-27 12:10:22', '2021-01-27 12:10:22'),
(277, 301, 1, 0, '4.0500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 14:33:18', 30, 1, NULL, NULL, NULL, 'SP2021/0277', NULL, '2021-01-27 13:33:18', '2021-01-27 13:33:18'),
(278, 302, 1, 0, '4.1500', 'card', NULL, NULL, '0342', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-27 21:17:40', 30, 1, NULL, NULL, NULL, 'SP2021/0278', NULL, '2021-01-27 20:17:40', '2021-01-27 20:17:40'),
(279, 303, 1, 0, '2.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-28 13:53:21', 30, 1, NULL, NULL, NULL, 'SP2021/0279', NULL, '2021-01-28 12:53:21', '2021-01-28 12:53:21'),
(280, 304, 1, 0, '6.5000', 'card', NULL, NULL, '6754', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-28 17:57:04', 30, 1, NULL, NULL, NULL, 'SP2021/0280', NULL, '2021-01-28 16:57:04', '2021-01-28 16:57:04'),
(281, 305, 1, 0, '5.3500', 'card', NULL, NULL, '5009', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-28 18:42:19', 30, 1, NULL, NULL, NULL, 'SP2021/0281', NULL, '2021-01-28 17:42:19', '2021-01-28 17:42:19'),
(282, 306, 1, 0, '8.6000', 'card', NULL, NULL, '4641', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-28 20:07:32', 30, 1, NULL, NULL, NULL, 'SP2021/0282', NULL, '2021-01-28 19:07:32', '2021-01-28 19:07:32'),
(283, 307, 1, 0, '4.0000', 'card', NULL, NULL, '4641', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-30 19:58:51', 30, 1, NULL, NULL, NULL, 'SP2021/0283', NULL, '2021-01-30 18:58:51', '2021-01-30 18:58:51'),
(284, 308, 1, 0, '3.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-31 13:06:21', 30, 1, NULL, NULL, NULL, 'SP2021/0284', NULL, '2021-01-31 12:06:21', '2021-01-31 12:06:21'),
(285, 309, 1, 0, '2.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-31 13:41:12', 30, 1, NULL, NULL, NULL, 'SP2021/0285', NULL, '2021-01-31 12:41:12', '2021-01-31 12:41:12'),
(286, 310, 1, 0, '4.0000', 'card', NULL, NULL, '4451', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-31 18:37:32', 30, 1, NULL, NULL, NULL, 'SP2021/0286', NULL, '2021-01-31 17:37:32', '2021-01-31 17:37:32'),
(287, 311, 1, 0, '1.6000', 'card', NULL, NULL, '2359', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 08:34:54', 30, 1, NULL, NULL, NULL, 'SP2021/0287', NULL, '2021-02-01 07:34:54', '2021-02-01 07:34:54'),
(288, 312, 1, 0, '1.5000', 'card', NULL, NULL, '9403', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 10:01:49', 30, 1, NULL, NULL, NULL, 'SP2021/0288', NULL, '2021-02-01 09:01:49', '2021-02-01 09:01:49'),
(289, 313, 1, 0, '2.0000', 'card', NULL, NULL, '8151', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 10:54:15', 30, 1, NULL, NULL, NULL, 'SP2021/0289', NULL, '2021-02-01 09:54:15', '2021-02-01 09:54:15'),
(290, 314, 1, 0, '3.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 11:45:25', 30, 1, NULL, NULL, NULL, 'SP2021/0290', NULL, '2021-02-01 10:45:25', '2021-02-01 10:45:25'),
(291, 315, 1, 0, '2.5500', 'card', NULL, NULL, '9615', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 12:27:57', 30, 1, NULL, NULL, NULL, 'SP2021/0291', NULL, '2021-02-01 11:27:57', '2021-02-01 11:27:57'),
(292, 316, 1, 0, '4.2500', 'card', NULL, NULL, '0889', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 13:49:36', 30, 1, NULL, NULL, NULL, 'SP2021/0292', NULL, '2021-02-01 12:49:36', '2021-02-01 12:49:36'),
(293, 317, 1, 0, '4.0000', 'card', NULL, NULL, '2280', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-01 18:59:59', 30, 1, NULL, NULL, NULL, 'SP2021/0293', NULL, '2021-02-01 17:59:59', '2021-02-01 17:59:59'),
(294, 318, 1, 0, '4.0500', 'card', NULL, NULL, '9615', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-02 10:29:26', 30, 1, NULL, NULL, NULL, 'SP2021/0294', NULL, '2021-02-02 09:29:26', '2021-02-02 09:29:26'),
(295, 319, 1, 0, '1.5000', 'card', NULL, NULL, '0552', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-02 12:24:18', 30, 1, NULL, NULL, NULL, 'SP2021/0295', NULL, '2021-02-02 11:24:18', '2021-02-02 11:24:18'),
(296, 320, 1, 0, '3.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-02 13:37:14', 30, 1, NULL, NULL, NULL, 'SP2021/0296', NULL, '2021-02-02 12:37:14', '2021-02-02 12:37:14'),
(297, 321, 1, 0, '3.2500', 'card', NULL, NULL, '1693', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-02 21:49:32', 30, 1, NULL, NULL, NULL, 'SP2021/0297', NULL, '2021-02-02 20:49:32', '2021-02-02 20:49:32'),
(298, 322, 1, 0, '4.4000', 'card', NULL, NULL, '2359', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 07:49:40', 30, 1, NULL, NULL, NULL, 'SP2021/0298', NULL, '2021-02-03 06:49:40', '2021-02-03 06:49:40'),
(299, 323, 1, 0, '1.5000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 11:03:32', 30, 1, NULL, NULL, NULL, 'SP2021/0299', NULL, '2021-02-03 10:03:32', '2021-02-03 10:03:32'),
(300, 324, 1, 0, '12.7000', 'card', NULL, NULL, '4115', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 13:11:14', 30, 1, NULL, NULL, NULL, 'SP2021/0300', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(301, 325, 1, 0, '1.8000', 'card', NULL, NULL, '8089', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 14:25:26', 30, 1, NULL, NULL, NULL, 'SP2021/0301', NULL, '2021-02-03 13:25:26', '2021-02-03 13:25:26'),
(302, 326, 1, 0, '2.0000', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 14:47:36', 30, 1, NULL, NULL, NULL, 'SP2021/0302', NULL, '2021-02-03 13:47:36', '2021-02-03 13:47:36'),
(303, 327, 1, 0, '1.5000', 'card', NULL, NULL, '5298', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 16:32:05', 30, 1, NULL, NULL, NULL, 'SP2021/0303', NULL, '2021-02-03 15:32:05', '2021-02-03 15:32:05'),
(304, 328, 1, 0, '4.0000', 'card', NULL, NULL, '6684', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 16:57:21', 30, 1, NULL, NULL, NULL, 'SP2021/0304', NULL, '2021-02-03 15:57:21', '2021-02-03 15:57:21'),
(305, 329, 1, 0, '5.0000', 'card', NULL, NULL, '2718', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 17:45:24', 30, 1, NULL, NULL, NULL, 'SP2021/0305', NULL, '2021-02-03 16:45:24', '2021-02-03 16:45:24'),
(306, 330, 1, 0, '5.9500', 'card', NULL, NULL, '4641', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 22:38:57', 30, 1, NULL, NULL, NULL, 'SP2021/0306', NULL, '2021-02-03 21:38:57', '2021-02-03 21:38:57'),
(307, 331, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-04 15:32:04', 30, 1, NULL, NULL, NULL, 'SP2021/0307', NULL, '2021-02-04 14:32:04', '2021-02-04 14:32:04'),
(308, 332, 1, 0, '2.5000', 'card', NULL, NULL, '9352', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-04 17:12:58', 30, 1, NULL, NULL, NULL, 'SP2021/0308', NULL, '2021-02-04 16:12:58', '2021-02-04 16:12:58'),
(309, 333, 1, 0, '14.8000', 'card', NULL, NULL, '0625', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-04 19:37:48', 30, 1, NULL, NULL, NULL, 'SP2021/0309', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(310, 334, 1, 0, '4.1500', 'card', NULL, NULL, '2233', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-04 20:15:27', 30, 1, NULL, NULL, NULL, 'SP2021/0310', NULL, '2021-02-04 19:15:27', '2021-02-04 19:15:27'),
(311, 335, 1, 0, '4.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-04 22:17:14', 30, 1, NULL, NULL, NULL, 'SP2021/0311', NULL, '2021-02-04 21:17:14', '2021-02-04 21:17:14'),
(312, 336, 1, 0, '2.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-06 16:01:55', 30, 1, NULL, NULL, NULL, 'SP2021/0312', NULL, '2021-02-06 15:01:55', '2021-02-06 15:01:55'),
(313, 337, 1, 0, '3.6000', 'card', NULL, NULL, '1671', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-06 19:51:17', 30, 1, NULL, NULL, NULL, 'SP2021/0313', NULL, '2021-02-06 18:51:17', '2021-02-06 18:51:17'),
(314, 338, 1, 0, '2.7500', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-07 12:22:47', 30, 1, NULL, NULL, NULL, 'SP2021/0314', NULL, '2021-02-07 11:22:47', '2021-02-07 11:22:47'),
(315, 339, 1, 0, '4.5000', 'card', NULL, NULL, '4451', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-07 13:06:12', 30, 1, NULL, NULL, NULL, 'SP2021/0315', NULL, '2021-02-07 12:06:12', '2021-02-07 12:06:12'),
(316, 340, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-07 16:22:27', 30, 1, NULL, NULL, NULL, 'SP2021/0316', NULL, '2021-02-07 15:22:27', '2021-02-07 15:22:27'),
(317, 341, 1, 0, '5.5000', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-07 19:09:31', 30, 1, NULL, NULL, NULL, 'SP2021/0317', NULL, '2021-02-07 18:09:31', '2021-02-07 18:09:31'),
(318, 342, 1, 0, '2.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-08 15:58:37', 30, 1, NULL, NULL, NULL, 'SP2021/0318', NULL, '2021-02-08 14:58:37', '2021-02-08 14:58:37'),
(319, 343, 1, 0, '3.1500', 'card', NULL, NULL, '0552', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 12:04:23', 30, 1, NULL, NULL, NULL, 'SP2021/0319', NULL, '2021-02-09 11:04:23', '2021-02-09 11:04:23'),
(320, 344, 1, 0, '6.3000', 'card', NULL, NULL, '8098', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 13:03:06', 30, 1, NULL, NULL, NULL, 'SP2021/0320', NULL, '2021-02-09 12:03:06', '2021-02-09 12:03:06'),
(321, 345, 1, 0, '1.5000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 14:15:46', 30, 1, NULL, NULL, NULL, 'SP2021/0321', NULL, '2021-02-09 13:15:46', '2021-02-09 13:15:46'),
(322, 346, 1, 0, '3.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 14:16:27', 30, 1, NULL, NULL, NULL, 'SP2021/0322', NULL, '2021-02-09 13:16:27', '2021-02-09 13:16:27'),
(323, 347, 1, 0, '7.9000', 'card', NULL, NULL, '2778', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 15:02:46', 30, 1, NULL, NULL, NULL, 'SP2021/0323', NULL, '2021-02-09 14:02:46', '2021-02-09 14:02:46'),
(324, 348, 1, 0, '2.7500', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 15:29:09', 30, 1, NULL, NULL, NULL, 'SP2021/0324', NULL, '2021-02-09 14:29:09', '2021-02-09 14:29:09'),
(325, 349, 1, 0, '9.0500', 'card', NULL, NULL, '6908', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 18:50:30', 30, 1, NULL, NULL, NULL, 'SP2021/0325', NULL, '2021-02-09 17:50:30', '2021-02-09 17:50:30'),
(326, 350, 1, 0, '5.2500', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 18:59:34', 30, 1, NULL, NULL, NULL, 'SP2021/0326', NULL, '2021-02-09 17:59:34', '2021-02-09 17:59:34'),
(327, 351, 1, 0, '1.1000', 'card', NULL, NULL, '8488', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-09 20:59:56', 30, 1, NULL, NULL, NULL, 'SP2021/0327', NULL, '2021-02-09 19:59:56', '2021-02-09 19:59:56'),
(328, 352, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 10:51:10', 30, 1, NULL, NULL, NULL, 'SP2021/0328', NULL, '2021-02-10 09:51:10', '2021-02-10 09:51:10'),
(329, 353, 1, 0, '3.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 16:49:15', 30, 1, NULL, NULL, NULL, 'SP2021/0329', NULL, '2021-02-10 15:49:15', '2021-02-10 15:49:15'),
(330, 354, 1, 0, '1.5000', 'card', NULL, NULL, '0463', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 18:07:33', 30, 1, NULL, NULL, NULL, 'SP2021/0330', NULL, '2021-02-10 17:07:33', '2021-02-10 17:07:33'),
(331, 355, 1, 0, '3.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 18:18:37', 30, 1, NULL, NULL, NULL, 'SP2021/0331', NULL, '2021-02-10 17:18:37', '2021-02-10 17:18:37'),
(332, 356, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 19:58:00', 30, 1, NULL, NULL, NULL, 'SP2021/0332', NULL, '2021-02-10 18:58:00', '2021-02-10 18:58:00'),
(333, 357, 1, 0, '7.5500', 'card', NULL, NULL, '7566', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-10 20:18:31', 30, 1, NULL, NULL, NULL, 'SP2021/0333', NULL, '2021-02-10 19:18:31', '2021-02-10 19:18:31'),
(334, 358, 1, 0, '0.9500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 11:56:20', 30, 1, NULL, NULL, NULL, 'SP2021/0334', NULL, '2021-02-11 10:56:20', '2021-02-11 10:56:20'),
(335, 359, 1, 0, '7.3000', 'card', NULL, NULL, '2233', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 12:17:25', 30, 1, NULL, NULL, NULL, 'SP2021/0335', NULL, '2021-02-11 11:17:25', '2021-02-11 11:17:25'),
(336, 360, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 13:36:23', 30, 1, NULL, NULL, NULL, 'SP2021/0336', NULL, '2021-02-11 12:36:23', '2021-02-11 12:36:23'),
(337, 361, 1, 0, '2.7500', 'card', NULL, NULL, '1106', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 15:02:05', 30, 1, NULL, NULL, NULL, 'SP2021/0337', NULL, '2021-02-11 14:02:05', '2021-02-11 14:02:05'),
(338, 362, 1, 0, '4.2000', 'card', NULL, NULL, '1965', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 16:03:05', 30, 1, NULL, NULL, NULL, 'SP2021/0338', NULL, '2021-02-11 15:03:05', '2021-02-11 15:03:05'),
(339, 363, 1, 0, '1.5000', 'card', NULL, NULL, '0612', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-11 21:35:20', 30, 1, NULL, NULL, NULL, 'SP2021/0339', NULL, '2021-02-11 20:35:20', '2021-02-11 20:35:20'),
(340, 364, 1, 0, '3.1500', 'card', NULL, NULL, '1426', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-13 15:06:50', 30, 1, NULL, NULL, NULL, 'SP2021/0340', NULL, '2021-02-13 14:06:50', '2021-02-13 14:06:50'),
(341, 365, 1, 0, '0.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-13 17:36:59', 30, 1, NULL, NULL, NULL, 'SP2021/0341', NULL, '2021-02-13 16:36:59', '2021-02-13 16:36:59'),
(342, 366, 1, 0, '5.2500', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-13 17:55:42', 30, 1, NULL, NULL, NULL, 'SP2021/0342', NULL, '2021-02-13 16:55:42', '2021-02-13 16:55:42'),
(343, 367, 1, 0, '4.1000', 'card', NULL, NULL, '1772', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-14 16:53:46', 30, 1, NULL, NULL, NULL, 'SP2021/0343', NULL, '2021-02-14 15:53:46', '2021-02-14 15:53:46'),
(344, 368, 1, 0, '4.3000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-14 18:28:21', 30, 1, NULL, NULL, NULL, 'SP2021/0344', NULL, '2021-02-14 17:28:21', '2021-02-14 17:28:21'),
(345, 369, 1, 0, '0.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-14 19:45:50', 30, 1, NULL, NULL, NULL, 'SP2021/0345', NULL, '2021-02-14 18:45:50', '2021-02-14 18:45:50'),
(346, 370, 1, 0, '1.6500', 'card', NULL, NULL, '2190', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-15 10:43:01', 30, 1, NULL, NULL, NULL, 'SP2021/0346', NULL, '2021-02-15 09:43:01', '2021-02-15 09:43:01'),
(347, 371, 1, 0, '9.3000', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-15 17:35:09', 30, 1, NULL, NULL, NULL, 'SP2021/0347', NULL, '2021-02-15 16:35:09', '2021-02-15 16:35:09'),
(348, 372, 1, 0, '1.3500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-15 18:33:16', 30, 1, NULL, NULL, NULL, 'SP2021/0348', NULL, '2021-02-15 17:33:16', '2021-02-15 17:33:16'),
(349, 373, 1, 0, '3.7500', 'card', NULL, NULL, '2718', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-15 19:33:29', 30, 1, NULL, NULL, NULL, 'SP2021/0349', NULL, '2021-02-15 18:33:29', '2021-02-15 18:33:29'),
(350, 374, 1, 0, '2.4000', 'card', NULL, NULL, '4451', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16 13:04:14', 30, 1, NULL, NULL, NULL, 'SP2021/0350', NULL, '2021-02-16 12:04:14', '2021-02-16 12:04:14'),
(351, 375, 1, 0, '9.8500', 'card', NULL, NULL, '9256', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16 14:41:43', 30, 1, NULL, NULL, NULL, 'SP2021/0351', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(352, 376, 1, 0, '2.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16 20:23:36', 30, 1, NULL, NULL, NULL, 'SP2021/0352', NULL, '2021-02-16 19:23:36', '2021-02-16 19:23:36'),
(353, 377, 1, 0, '3.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-16 22:38:24', 30, 1, NULL, NULL, NULL, 'SP2021/0353', NULL, '2021-02-16 21:38:24', '2021-02-16 21:38:24'),
(354, 378, 1, 0, '2.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-17 16:45:18', 30, 1, NULL, NULL, NULL, 'SP2021/0354', NULL, '2021-02-17 15:45:18', '2021-02-17 15:45:18'),
(355, 379, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18 13:51:20', 30, 1, NULL, NULL, NULL, 'SP2021/0355', NULL, '2021-02-18 12:51:20', '2021-02-18 12:51:20'),
(356, 380, 1, 0, '2.4000', 'card', NULL, NULL, '1426', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18 13:52:17', 30, 1, NULL, NULL, NULL, 'SP2021/0356', NULL, '2021-02-18 12:52:17', '2021-02-18 12:52:17'),
(357, 381, 1, 0, '2.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18 14:55:21', 30, 1, NULL, NULL, NULL, 'SP2021/0357', NULL, '2021-02-18 13:55:21', '2021-02-18 13:55:21'),
(358, 382, 1, 0, '4.2000', 'card', NULL, '1965', '39129000007306', 'visa', 'rania zahi h sulaiman', 'june', NULL, '953', NULL, NULL, '2021-02-18 15:09:27', 30, 1, NULL, NULL, NULL, 'SP2021/0358', NULL, '2021-02-18 14:09:27', '2021-02-18 14:09:27'),
(359, 383, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18 15:48:21', 30, 1, NULL, NULL, NULL, 'SP2021/0359', NULL, '2021-02-18 14:48:21', '2021-02-18 14:48:21'),
(360, 384, 1, 0, '2.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-18 17:21:12', 30, 1, NULL, NULL, NULL, 'SP2021/0360', NULL, '2021-02-18 16:21:12', '2021-02-18 16:21:12'),
(361, 385, 1, 0, '2.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-20 17:46:43', 30, 1, NULL, NULL, NULL, 'SP2021/0361', NULL, '2021-02-20 16:46:43', '2021-02-20 16:46:43'),
(362, 386, 1, 0, '4.2500', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-20 18:17:06', 30, 1, NULL, NULL, NULL, 'SP2021/0362', NULL, '2021-02-20 17:17:06', '2021-02-20 17:17:06'),
(363, 387, 1, 0, '3.9500', 'card', NULL, NULL, '6448', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-20 18:27:23', 30, 1, NULL, NULL, NULL, 'SP2021/0363', NULL, '2021-02-20 17:27:23', '2021-02-20 17:27:23'),
(364, 388, 1, 0, '2.1500', 'card', NULL, NULL, '9159', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-21 10:17:14', 30, 1, NULL, NULL, NULL, 'SP2021/0364', NULL, '2021-02-21 09:17:14', '2021-02-21 09:17:14'),
(365, 389, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-21 13:41:15', 30, 1, NULL, NULL, NULL, 'SP2021/0365', NULL, '2021-02-21 12:41:15', '2021-02-21 12:41:15'),
(366, 390, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-21 16:16:12', 30, 1, NULL, NULL, NULL, 'SP2021/0366', NULL, '2021-02-21 15:16:12', '2021-02-21 15:16:12'),
(367, 391, 1, 0, '5.5000', 'card', NULL, '7667', '4311990000237667', 'visa', 'SALEH ALFAHAD', 'JAN', NULL, NULL, NULL, NULL, '2021-02-21 16:59:21', 30, 1, NULL, NULL, NULL, 'SP2021/0367', NULL, '2021-02-21 15:59:21', '2021-02-21 15:59:21'),
(368, 392, 1, 0, '2.5500', 'card', NULL, '9615', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 14:42:55', 30, 1, NULL, NULL, NULL, 'SP2021/0368', NULL, '2021-02-22 13:42:55', '2021-02-22 13:42:55'),
(369, 393, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 15:58:20', 30, 1, NULL, NULL, NULL, 'SP2021/0369', NULL, '2021-02-22 14:58:20', '2021-02-22 14:58:20'),
(370, 394, 1, 0, '1.5000', 'card', NULL, '5097', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-22 18:40:26', 30, 1, NULL, NULL, NULL, 'SP2021/0370', NULL, '2021-02-22 17:40:26', '2021-02-22 17:40:26'),
(371, 395, 1, 0, '7.5000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-23 16:30:21', 30, 1, NULL, NULL, NULL, 'SP2021/0371', NULL, '2021-02-23 15:30:21', '2021-02-23 15:30:21'),
(372, 396, 1, 0, '9.6500', 'card', NULL, '4471', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-24 17:21:22', 30, 1, NULL, NULL, NULL, 'SP2021/0372', NULL, '2021-02-24 16:21:22', '2021-02-24 16:21:22'),
(373, 397, 1, 0, '5.0000', 'card', NULL, '6006', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-24 19:13:15', 30, 1, NULL, NULL, NULL, 'SP2021/0373', NULL, '2021-02-24 18:13:15', '2021-02-24 18:13:15'),
(374, 398, 1, 0, '5.3000', 'card', NULL, '3347', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-24 19:30:21', 30, 1, NULL, NULL, NULL, 'SP2021/0374', NULL, '2021-02-24 18:30:21', '2021-02-24 18:30:21'),
(375, 399, 1, 0, '7.4500', 'card', NULL, '7566', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-25 21:26:08', 30, 1, NULL, NULL, NULL, 'SP2021/0375', NULL, '2021-02-25 20:26:08', '2021-02-25 20:26:08'),
(376, 400, 1, 0, '13.0000', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-27 19:38:37', 30, 1, NULL, NULL, NULL, 'SP2021/0376', NULL, '2021-02-27 18:38:37', '2021-02-27 18:38:37'),
(377, 401, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-28 20:18:16', 30, 1, NULL, NULL, NULL, 'SP2021/0377', NULL, '2021-02-28 19:18:16', '2021-02-28 19:18:16'),
(378, 402, 1, 0, '12.2500', 'card', NULL, NULL, '9300', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 12:25:23', 30, 1, NULL, NULL, NULL, 'SP2021/0378', NULL, '2021-03-01 11:25:23', '2021-03-01 11:25:23'),
(379, 403, 1, 0, '2.0000', 'card', NULL, '9225', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 14:59:42', 30, 1, NULL, NULL, NULL, 'SP2021/0379', NULL, '2021-03-01 13:59:42', '2021-03-01 13:59:42'),
(380, 404, 1, 0, '4.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 16:22:33', 30, 1, NULL, NULL, NULL, 'SP2021/0380', NULL, '2021-03-01 15:22:33', '2021-03-01 15:22:33'),
(381, 405, 1, 0, '3.7500', 'card', NULL, '7648', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 16:24:01', 30, 1, NULL, NULL, NULL, 'SP2021/0381', NULL, '2021-03-01 15:24:01', '2021-03-01 15:24:01'),
(382, 406, 1, 0, '3.7500', 'card', NULL, '5504', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 16:33:51', 30, 1, NULL, NULL, NULL, 'SP2021/0382', NULL, '2021-03-01 15:33:51', '2021-03-01 15:33:51'),
(383, 407, 1, 0, '3.2500', 'card', NULL, '9669', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 17:26:54', 30, 1, NULL, NULL, NULL, 'SP2021/0383', NULL, '2021-03-01 16:26:54', '2021-03-01 16:26:54'),
(384, 408, 1, 0, '12.1000', 'card', NULL, '1798', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 18:47:11', 30, 1, NULL, NULL, NULL, 'SP2021/0384', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(385, 409, 1, 0, '8.2500', 'card', NULL, '7228', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 18:53:00', 30, 1, NULL, NULL, NULL, 'SP2021/0385', NULL, '2021-03-01 17:53:00', '2021-03-01 17:53:00'),
(386, 410, 1, 0, '6.4000', 'card', NULL, '6006', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 19:39:12', 30, 1, NULL, NULL, NULL, 'SP2021/0386', NULL, '2021-03-01 18:39:12', '2021-03-01 18:39:12'),
(387, 411, 1, 0, '3.9000', 'card', NULL, '0342', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-01 21:50:14', 30, 1, NULL, NULL, NULL, 'SP2021/0387', NULL, '2021-03-01 20:50:14', '2021-03-01 20:50:14'),
(388, 412, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 11:11:34', 30, 1, NULL, NULL, NULL, 'SP2021/0388', NULL, '2021-03-02 10:11:34', '2021-03-02 10:11:34'),
(389, 413, 1, 0, '4.5000', 'card', NULL, NULL, '7784', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 12:03:22', 30, 1, NULL, NULL, NULL, 'SP2021/0389', NULL, '2021-03-02 11:03:22', '2021-03-02 11:03:22'),
(390, 414, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 13:33:46', 30, 1, NULL, NULL, NULL, 'SP2021/0390', NULL, '2021-03-02 12:33:46', '2021-03-02 12:33:46'),
(391, 415, 1, 0, '11.4000', 'card', NULL, '1549', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 15:05:25', 30, 1, NULL, NULL, NULL, 'SP2021/0391', NULL, '2021-03-02 14:05:25', '2021-03-02 14:05:25'),
(392, 416, 1, 0, '2.4000', 'card', NULL, '5829', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 15:06:24', 30, 1, NULL, NULL, NULL, 'SP2021/0392', NULL, '2021-03-02 14:06:24', '2021-03-02 14:06:24'),
(393, 417, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 15:23:29', 30, 1, NULL, NULL, NULL, 'SP2021/0393', NULL, '2021-03-02 14:23:29', '2021-03-02 14:23:29'),
(394, 418, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 15:38:41', 30, 1, NULL, NULL, NULL, 'SP2021/0394', NULL, '2021-03-02 14:38:41', '2021-03-02 14:38:41'),
(395, 419, 1, 0, '5.5000', 'card', NULL, '3139', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-02 17:45:54', 30, 1, NULL, NULL, NULL, 'SP2021/0395', NULL, '2021-03-02 16:45:54', '2021-03-02 16:45:54'),
(396, 420, 1, 0, '3.6500', 'card', NULL, NULL, '9096', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-03 13:04:49', 30, 1, NULL, NULL, NULL, 'SP2021/0396', NULL, '2021-03-03 12:04:49', '2021-03-03 12:04:49'),
(397, 421, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-03 15:31:24', 30, 1, NULL, NULL, NULL, 'SP2021/0397', NULL, '2021-03-03 14:31:24', '2021-03-03 14:31:24'),
(398, 422, 1, 0, '2.2000', 'card', NULL, '7724', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-03 18:08:54', 30, 1, NULL, NULL, NULL, 'SP2021/0398', NULL, '2021-03-03 17:08:54', '2021-03-03 17:08:54'),
(399, 423, 1, 0, '1.5000', 'card', NULL, NULL, '0339', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-04 12:13:45', 30, 1, NULL, NULL, NULL, 'SP2021/0399', NULL, '2021-03-04 11:13:45', '2021-03-04 11:13:45'),
(400, 424, 1, 0, '4.0000', 'card', NULL, '3139', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-04 16:35:30', 30, 1, NULL, NULL, NULL, 'SP2021/0400', NULL, '2021-03-04 15:35:30', '2021-03-04 15:35:30'),
(401, 425, 1, 0, '2.7000', 'card', NULL, '7724', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-04 16:52:26', 30, 1, NULL, NULL, NULL, 'SP2021/0401', NULL, '2021-03-04 15:52:26', '2021-03-04 15:52:26'),
(402, 426, 1, 0, '0.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-04 17:37:18', 30, 1, NULL, NULL, NULL, 'SP2021/0402', NULL, '2021-03-04 16:37:18', '2021-03-04 16:37:18'),
(403, 427, 1, 0, '1.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 13:04:13', 30, 1, NULL, NULL, NULL, 'SP2021/0403', NULL, '2021-03-06 12:04:13', '2021-03-06 12:04:13'),
(404, 428, 1, 0, '2.9000', 'card', NULL, NULL, '0331', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 18:02:53', 30, 1, NULL, NULL, NULL, 'SP2021/0404', NULL, '2021-03-06 17:02:53', '2021-03-06 17:02:53'),
(405, 429, 1, 0, '5.1500', 'card', NULL, NULL, '2952', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 18:28:39', 30, 1, NULL, NULL, NULL, 'SP2021/0405', NULL, '2021-03-06 17:28:39', '2021-03-06 17:28:39'),
(406, 430, 1, 0, '0.5000', 'card', NULL, NULL, '3272', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-06 18:32:05', 30, 1, NULL, NULL, NULL, 'SP2021/0406', NULL, '2021-03-06 17:32:05', '2021-03-06 17:32:05'),
(407, 431, 1, 0, '2.1500', 'card', NULL, NULL, '2186', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-07 10:59:00', 30, 1, NULL, NULL, NULL, 'SP2021/0407', NULL, '2021-03-07 09:59:00', '2021-03-07 09:59:00'),
(408, 432, 1, 0, '1.5000', 'card', NULL, NULL, '9151', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-07 13:14:59', 30, 1, NULL, NULL, NULL, 'SP2021/0408', NULL, '2021-03-07 12:14:59', '2021-03-07 12:14:59'),
(409, 433, 1, 0, '8.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-07 14:08:01', 30, 1, NULL, NULL, NULL, 'SP2021/0409', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(410, 434, 1, 0, '5.2500', 'card', NULL, NULL, '7667', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-07 14:15:51', 30, 1, NULL, NULL, NULL, 'SP2021/0410', NULL, '2021-03-07 13:15:51', '2021-03-07 13:15:51'),
(411, 435, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-07 15:25:44', 30, 1, NULL, NULL, NULL, 'SP2021/0411', NULL, '2021-03-07 14:25:44', '2021-03-07 14:25:44'),
(412, 436, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-08 10:12:51', 30, 1, NULL, NULL, NULL, 'SP2021/0412', NULL, '2021-03-08 09:12:51', '2021-03-08 09:12:51'),
(413, 437, 1, 0, '7.0000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-08 11:48:26', 30, 1, NULL, NULL, NULL, 'SP2021/0413', NULL, '2021-03-08 10:48:26', '2021-03-08 10:48:26'),
(414, 438, 1, 0, '1.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-08 12:44:23', 30, 1, NULL, NULL, NULL, 'SP2021/0414', NULL, '2021-03-08 11:44:23', '2021-03-08 11:44:23'),
(415, 439, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-08 14:03:26', 30, 1, NULL, NULL, NULL, 'SP2021/0415', NULL, '2021-03-08 13:03:26', '2021-03-08 13:03:26'),
(416, 440, 1, 0, '2.7000', 'card', NULL, '1317', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-09 07:54:14', 30, 1, NULL, NULL, NULL, 'SP2021/0416', NULL, '2021-03-09 06:54:14', '2021-03-09 06:54:14'),
(417, 441, 1, 0, '3.7000', 'card', NULL, '1965', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-09 13:31:32', 30, 1, NULL, NULL, NULL, 'SP2021/0417', NULL, '2021-03-09 12:31:32', '2021-03-09 12:31:32'),
(418, 442, 1, 0, '10.2500', 'card', NULL, '9330', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-09 13:50:54', 30, 1, NULL, NULL, NULL, 'SP2021/0418', NULL, '2021-03-09 12:50:54', '2021-03-09 12:50:54'),
(419, 443, 1, 0, '4.4000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-09 14:14:18', 30, 1, NULL, NULL, NULL, 'SP2021/0419', NULL, '2021-03-09 13:14:18', '2021-03-09 13:14:18'),
(420, 444, 1, 0, '11.1500', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-10 14:22:26', 30, 1, NULL, NULL, NULL, 'SP2021/0420', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(421, 445, 1, 0, '4.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-11 14:51:01', 30, 1, NULL, NULL, NULL, 'SP2021/0421', NULL, '2021-03-11 13:51:01', '2021-03-11 13:51:01'),
(422, 446, 1, 0, '3.1500', 'card', NULL, '7845', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 11:39:58', 30, 1, NULL, NULL, NULL, 'SP2021/0422', NULL, '2021-03-13 10:39:58', '2021-03-13 10:39:58'),
(423, 447, 1, 0, '6.5000', 'card', NULL, '4607', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 13:03:30', 30, 1, NULL, NULL, NULL, 'SP2021/0423', NULL, '2021-03-13 12:03:30', '2021-03-13 12:03:30'),
(424, 448, 1, 0, '4.9500', 'card', NULL, '6684', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-13 14:27:19', 30, 1, NULL, NULL, NULL, 'SP2021/0424', NULL, '2021-03-13 13:27:19', '2021-03-13 13:27:19'),
(425, 449, 1, 0, '0.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-14 09:46:15', 30, 1, NULL, NULL, NULL, 'SP2021/0425', NULL, '2021-03-14 08:46:15', '2021-03-14 08:46:15'),
(426, 450, 1, 0, '2.7000', 'card', NULL, '3305', '33', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15 13:04:08', 30, 1, NULL, NULL, NULL, 'SP2021/0426', NULL, '2021-03-15 12:04:08', '2021-03-15 12:04:08'),
(427, 451, 1, 0, '9.0500', 'card', NULL, '8461', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15 13:48:01', 30, 1, NULL, NULL, NULL, 'SP2021/0427', NULL, '2021-03-15 12:48:01', '2021-03-15 12:48:01'),
(428, 452, 1, 0, '22.3500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15 14:02:48', 30, 1, NULL, NULL, NULL, 'SP2021/0428', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(429, 453, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-15 14:18:07', 30, 1, NULL, NULL, NULL, 'SP2021/0429', NULL, '2021-03-15 13:18:07', '2021-03-15 13:18:07'),
(430, 454, 1, 0, '1.5000', 'card', NULL, '2793', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 07:43:29', 30, 1, NULL, NULL, NULL, 'SP2021/0430', NULL, '2021-03-16 06:43:29', '2021-03-16 06:43:29'),
(431, 455, 1, 0, '1.5000', 'card', NULL, '7645', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 09:04:44', 30, 1, NULL, NULL, NULL, 'SP2021/0431', NULL, '2021-03-16 08:04:44', '2021-03-16 08:04:44'),
(432, 456, 1, 0, '2.5000', 'card', NULL, '2186', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 10:13:21', 30, 1, NULL, NULL, NULL, 'SP2021/0432', NULL, '2021-03-16 09:13:21', '2021-03-16 09:13:21'),
(433, 457, 1, 0, '2.0000', 'card', NULL, '2186', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 10:14:07', 30, 1, NULL, NULL, NULL, 'SP2021/0433', NULL, '2021-03-16 09:14:07', '2021-03-16 09:14:07'),
(434, 458, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 12:24:06', 30, 1, NULL, NULL, NULL, 'SP2021/0434', NULL, '2021-03-16 11:24:06', '2021-03-16 11:24:06'),
(435, 459, 1, 0, '2.0000', 'card', NULL, '1798', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 13:41:34', 30, 1, NULL, NULL, NULL, 'SP2021/0435', NULL, '2021-03-16 12:41:34', '2021-03-16 12:41:34'),
(436, 460, 1, 0, '9.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-16 14:54:11', 30, 1, NULL, NULL, NULL, 'SP2021/0436', NULL, '2021-03-16 13:54:11', '2021-03-16 13:54:11'),
(437, 461, 1, 0, '0.9000', 'card', NULL, '6645', NULL, 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 11:03:37', 30, 1, NULL, NULL, NULL, 'SP2021/0437', NULL, '2021-03-17 10:03:37', '2021-03-17 10:03:37'),
(438, 462, 1, 0, '2.5000', 'card', NULL, '9717', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 12:04:50', 30, 1, NULL, NULL, NULL, 'SP2021/0438', NULL, '2021-03-17 11:04:50', '2021-03-17 11:04:50'),
(439, 463, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 12:51:12', 30, 1, NULL, NULL, NULL, 'SP2021/0439', NULL, '2021-03-17 11:51:12', '2021-03-17 11:51:12'),
(440, 464, 1, 0, '6.3000', 'card', NULL, '1295', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 13:29:30', 30, 1, NULL, NULL, NULL, 'SP2021/0440', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(441, 465, 1, 0, '3.9500', 'card', NULL, '4154', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-17 14:35:09', 30, 1, NULL, NULL, NULL, 'SP2021/0441', NULL, '2021-03-17 13:35:09', '2021-03-17 13:35:09'),
(442, 466, 1, 0, '1.5000', 'card', NULL, '9717', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-18 09:23:43', 30, 1, NULL, NULL, NULL, 'SP2021/0442', NULL, '2021-03-18 08:23:43', '2021-03-18 08:23:43'),
(443, 467, 1, 0, '5.4000', 'card', NULL, '6231', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-20 14:50:54', 30, 1, NULL, NULL, NULL, 'SP2021/0443', NULL, '2021-03-20 13:50:54', '2021-03-20 13:50:54'),
(444, 468, 1, 0, '7.0000', 'card', NULL, '7246', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 07:47:34', 30, 1, NULL, NULL, NULL, 'SP2021/0444', NULL, '2021-03-21 06:47:34', '2021-03-21 06:47:34'),
(445, 469, 1, 0, '2.1000', 'card', NULL, '5303', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:21:30', 30, 1, NULL, NULL, NULL, 'SP2021/0445', NULL, '2021-03-21 07:21:30', '2021-03-21 07:21:30'),
(446, 470, 1, 0, '2.7000', 'card', NULL, '5127', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 13:03:16', 30, 1, NULL, NULL, NULL, 'SP2021/0446', NULL, '2021-03-21 12:03:16', '2021-03-21 12:03:16'),
(447, 471, 1, 0, '5.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 15:13:35', 30, 1, NULL, NULL, NULL, 'SP2021/0447', NULL, '2021-03-21 14:13:35', '2021-03-21 14:13:35'),
(448, 472, 1, 0, '1.5000', 'card', NULL, '9029', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 08:10:57', 30, 1, NULL, NULL, NULL, 'SP2021/0448', NULL, '2021-03-22 07:10:57', '2021-03-22 07:10:57'),
(449, 473, 1, 0, '2.5500', 'card', NULL, '9615', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 11:09:35', 30, 1, NULL, NULL, NULL, 'SP2021/0449', NULL, '2021-03-22 10:09:35', '2021-03-22 10:09:35'),
(450, 474, 1, 0, '2.7500', 'card', NULL, '1426', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 12:49:56', 30, 1, NULL, NULL, NULL, 'SP2021/0450', NULL, '2021-03-22 11:49:56', '2021-03-22 11:49:56'),
(451, 475, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 12:50:53', 30, 1, NULL, NULL, NULL, 'SP2021/0451', NULL, '2021-03-22 11:50:53', '2021-03-22 11:50:53'),
(452, 476, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 12:56:04', 30, 1, NULL, NULL, NULL, 'SP2021/0452', NULL, '2021-03-22 11:56:04', '2021-03-22 11:56:04'),
(453, 477, 1, 0, '3.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-22 14:13:51', 30, 1, NULL, NULL, NULL, 'SP2021/0453', NULL, '2021-03-22 13:13:51', '2021-03-22 13:13:51'),
(454, 478, 1, 0, '0.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 11:17:21', 30, 1, NULL, NULL, NULL, 'SP2021/0454', NULL, '2021-03-24 10:17:21', '2021-03-24 10:17:21'),
(455, 479, 1, 0, '3.7500', 'card', NULL, '1426', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 11:38:18', 30, 1, NULL, NULL, NULL, 'SP2021/0455', NULL, '2021-03-24 10:38:18', '2021-03-24 10:38:18'),
(456, 480, 1, 0, '4.7500', 'card', NULL, '6711', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 12:16:19', 30, 1, NULL, NULL, NULL, 'SP2021/0456', NULL, '2021-03-24 11:16:19', '2021-03-24 11:16:19'),
(457, 481, 1, 0, '2.4000', 'card', NULL, '0889', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 12:22:16', 30, 1, NULL, NULL, NULL, 'SP2021/0457', NULL, '2021-03-24 11:22:16', '2021-03-24 11:22:16'),
(458, 482, 1, 0, '3.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 12:56:08', 30, 1, NULL, NULL, NULL, 'SP2021/0458', NULL, '2021-03-24 11:56:08', '2021-03-24 11:56:08'),
(459, 483, 1, 0, '5.5000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 15:28:14', 30, 1, NULL, NULL, NULL, 'SP2021/0459', NULL, '2021-03-24 14:28:14', '2021-03-24 14:28:14'),
(460, 484, 1, 0, '6.0500', 'card', NULL, '8865', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 15:53:14', 30, 1, NULL, NULL, NULL, 'SP2021/0460', NULL, '2021-03-24 14:53:14', '2021-03-24 14:53:14'),
(461, 485, 1, 0, '4.5000', 'card', NULL, '9357', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 15:53:48', 30, 1, NULL, NULL, NULL, 'SP2021/0461', NULL, '2021-03-24 14:53:48', '2021-03-24 14:53:48'),
(462, 486, 1, 0, '2.9000', 'card', NULL, '8865', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 15:57:49', 30, 1, NULL, NULL, NULL, 'SP2021/0462', NULL, '2021-03-24 14:57:49', '2021-03-24 14:57:49'),
(463, 487, 1, 0, '0.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-24 20:52:40', 1, 1, NULL, NULL, NULL, 'SP2021/0463', NULL, '2021-03-24 19:52:40', '2021-03-24 19:52:40'),
(464, 488, 1, 0, '1.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 07:24:35', 30, 1, NULL, NULL, NULL, 'SP2021/0464', NULL, '2021-03-25 06:24:35', '2021-03-25 06:24:35'),
(465, 489, 1, 0, '2.5000', 'card', NULL, '9159', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 09:24:04', 30, 1, NULL, NULL, NULL, 'SP2021/0465', NULL, '2021-03-25 08:24:04', '2021-03-25 08:24:04'),
(466, 490, 1, 0, '4.2000', 'card', NULL, '3911', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 10:39:51', 30, 1, NULL, NULL, NULL, 'SP2021/0466', NULL, '2021-03-25 09:39:51', '2021-03-25 09:39:51'),
(467, 491, 1, 0, '6.1500', 'card', NULL, '6711', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-25 12:24:35', 30, 1, NULL, NULL, NULL, 'SP2021/0467', NULL, '2021-03-25 11:24:35', '2021-03-25 11:24:35'),
(468, 492, 1, 0, '4.1500', 'card', NULL, '6093', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-27 12:38:52', 30, 1, NULL, NULL, NULL, 'SP2021/0468', NULL, '2021-03-27 11:38:52', '2021-03-27 11:38:52');
INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(469, 493, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-27 12:50:49', 30, 1, NULL, NULL, NULL, 'SP2021/0469', NULL, '2021-03-27 11:50:49', '2021-03-27 11:50:49'),
(470, 494, 1, 0, '6.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-27 13:10:46', 30, 1, NULL, NULL, NULL, 'SP2021/0470', NULL, '2021-03-27 12:10:46', '2021-03-27 12:10:46'),
(471, 495, 1, 0, '5.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-28 15:08:05', 30, 1, NULL, NULL, NULL, 'SP2021/0471', NULL, '2021-03-28 13:08:05', '2021-03-28 13:08:05'),
(472, 496, 1, 0, '5.5000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-28 15:37:36', 30, 1, NULL, NULL, NULL, 'SP2021/0472', NULL, '2021-03-28 13:37:36', '2021-03-28 13:37:36'),
(473, 497, 1, 0, '1.5000', 'card', NULL, '6604', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 08:23:31', 30, 1, NULL, NULL, NULL, 'SP2021/0473', NULL, '2021-03-29 06:23:31', '2021-03-29 06:23:31'),
(474, 498, 1, 0, '4.5000', 'card', NULL, '2186', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 11:12:05', 30, 1, NULL, NULL, NULL, 'SP2021/0474', NULL, '2021-03-29 09:12:05', '2021-03-29 09:12:05'),
(475, 499, 1, 0, '1.5000', 'card', NULL, '4471', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 11:18:30', 30, 1, NULL, NULL, NULL, 'SP2021/0475', NULL, '2021-03-29 09:18:30', '2021-03-29 09:18:30'),
(476, 500, 1, 0, '11.6500', 'card', NULL, '8956', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 11:54:45', 30, 1, NULL, NULL, NULL, 'SP2021/0476', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(477, 501, 1, 0, '6.5000', 'card', NULL, '6260', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 15:02:26', 30, 1, NULL, NULL, NULL, 'SP2021/0477', NULL, '2021-03-29 13:02:26', '2021-03-29 13:02:26'),
(478, 502, 1, 0, '4.7500', 'card', NULL, '5951', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-29 15:29:47', 30, 1, NULL, NULL, NULL, 'SP2021/0478', NULL, '2021-03-29 13:29:47', '2021-03-29 13:29:47'),
(482, 506, 1, 0, '4.6500', 'card', NULL, '1552', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-30 09:14:01', 30, 1, NULL, NULL, NULL, 'SP2021/0482', NULL, '2021-03-30 07:14:01', '2021-03-30 07:14:01'),
(483, 507, 1, 0, '2.2000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-30 12:39:31', 30, 1, NULL, NULL, NULL, 'SP2021/0483', NULL, '2021-03-30 10:39:31', '2021-03-30 10:39:31'),
(484, 508, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 08:22:01', 30, 1, NULL, NULL, NULL, 'SP2021/0484', NULL, '2021-04-01 06:22:01', '2021-04-01 06:22:01'),
(485, 509, 1, 0, '4.8500', 'card', NULL, '9169', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 09:47:14', 30, 1, NULL, NULL, NULL, 'SP2021/0485', NULL, '2021-04-01 07:47:14', '2021-04-01 07:47:14'),
(486, 510, 1, 0, '3.1500', 'card', NULL, '0552', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 11:18:35', 30, 1, NULL, NULL, NULL, 'SP2021/0486', NULL, '2021-04-01 09:18:35', '2021-04-01 09:18:35'),
(487, 511, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 13:09:39', 30, 1, NULL, NULL, NULL, 'SP2021/0487', NULL, '2021-04-01 11:09:39', '2021-04-01 11:09:39'),
(488, 512, 1, 0, '12.3500', 'card', NULL, '4115', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 13:39:39', 30, 1, NULL, NULL, NULL, 'SP2021/0488', NULL, '2021-04-01 11:39:39', '2021-04-01 11:39:39'),
(489, 513, 1, 0, '2.7500', 'card', NULL, '9256', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 13:40:14', 30, 1, NULL, NULL, NULL, 'SP2021/0489', NULL, '2021-04-01 11:40:14', '2021-04-01 11:40:14'),
(490, 514, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 15:25:54', 30, 1, NULL, NULL, NULL, 'SP2021/0490', NULL, '2021-04-01 13:25:54', '2021-04-01 13:25:54'),
(491, 515, 1, 0, '3.8000', 'card', NULL, '5951', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01 15:52:52', 30, 1, NULL, NULL, NULL, 'SP2021/0491', NULL, '2021-04-01 13:52:52', '2021-04-01 13:52:52'),
(492, 517, 1, 0, '2.6500', 'card', NULL, '3970', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-03 09:43:26', 30, 1, NULL, NULL, NULL, 'SP2021/0492', NULL, '2021-04-03 07:43:26', '2021-04-03 07:43:26'),
(493, 518, 1, 0, '7.1500', 'card', NULL, '6093', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-03 12:42:25', 30, 1, NULL, NULL, NULL, 'SP2021/0493', NULL, '2021-04-03 10:42:25', '2021-04-03 10:42:25'),
(494, 519, 1, 0, '4.8500', 'card', NULL, '9159', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-04 10:03:29', 30, 1, NULL, NULL, NULL, 'SP2021/0494', NULL, '2021-04-04 08:03:29', '2021-04-04 08:03:29'),
(495, 520, 1, 0, '1.6500', 'card', NULL, '0552', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-04 10:40:41', 30, 1, NULL, NULL, NULL, 'SP2021/0495', NULL, '2021-04-04 08:40:41', '2021-04-04 08:40:41'),
(496, 521, 1, 0, '4.1000', 'card', NULL, '4471', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-04 11:33:01', 30, 1, NULL, NULL, NULL, 'SP2021/0496', NULL, '2021-04-04 09:33:01', '2021-04-04 09:33:01'),
(497, 522, 1, 0, '1.5000', 'card', NULL, '1426', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-05 11:12:33', 30, 1, NULL, NULL, NULL, 'SP2021/0497', NULL, '2021-04-05 09:12:33', '2021-04-05 09:12:33'),
(498, 523, 1, 0, '4.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-05 11:59:42', 30, 1, NULL, NULL, NULL, 'SP2021/0498', NULL, '2021-04-05 09:59:42', '2021-04-05 09:59:42'),
(499, 524, 1, 0, '6.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-05 13:33:13', 30, 1, NULL, NULL, NULL, 'SP2021/0499', NULL, '2021-04-05 11:33:13', '2021-04-05 11:33:13'),
(500, 525, 1, 0, '3.7500', 'card', NULL, '5951', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-05 14:32:57', 30, 1, NULL, NULL, NULL, 'SP2021/0500', NULL, '2021-04-05 12:32:57', '2021-04-05 12:32:57'),
(501, 526, 1, 0, '2.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 10:55:34', 30, 1, NULL, NULL, NULL, 'SP2021/0501', NULL, '2021-04-06 08:55:34', '2021-04-06 08:55:34'),
(502, 527, 1, 0, '7.9000', 'card', NULL, '6093', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 11:21:57', 30, 1, NULL, NULL, NULL, 'SP2021/0502', NULL, '2021-04-06 09:21:57', '2021-04-06 09:21:57'),
(503, 528, 1, 0, '7.2000', 'card', NULL, '0552', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 11:57:49', 30, 1, NULL, NULL, NULL, 'SP2021/0503', NULL, '2021-04-06 09:57:49', '2021-04-06 09:57:49'),
(504, 529, 1, 0, '3.4000', 'card', NULL, '4134', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 12:01:26', 30, 1, NULL, NULL, NULL, 'SP2021/0504', NULL, '2021-04-06 10:01:26', '2021-04-06 10:01:26'),
(505, 530, 1, 0, '2.7000', 'card', NULL, '1965', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 12:40:23', 30, 1, NULL, NULL, NULL, 'SP2021/0505', NULL, '2021-04-06 10:40:23', '2021-04-06 10:40:23'),
(506, 531, 1, 0, '1.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 14:23:17', 30, 1, NULL, NULL, NULL, 'SP2021/0506', NULL, '2021-04-06 12:23:17', '2021-04-06 12:23:17'),
(507, 532, 1, 0, '12.0000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-06 15:36:51', 30, 1, NULL, NULL, NULL, 'SP2021/0507', NULL, '2021-04-06 13:36:51', '2021-04-06 13:36:51'),
(508, 533, 1, 0, '2.1000', 'card', NULL, '2359', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 07:13:17', 30, 1, NULL, NULL, NULL, 'SP2021/0508', NULL, '2021-04-07 05:13:17', '2021-04-07 05:13:17'),
(509, 534, 1, 0, '6.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 09:00:55', 30, 1, NULL, NULL, NULL, 'SP2021/0509', NULL, '2021-04-07 07:00:55', '2021-04-07 07:00:55'),
(510, 535, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 09:37:47', 30, 1, NULL, NULL, NULL, 'SP2021/0510', NULL, '2021-04-07 07:37:47', '2021-04-07 07:37:47'),
(511, 536, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 10:53:22', 30, 1, NULL, NULL, NULL, 'SP2021/0511', NULL, '2021-04-07 08:53:22', '2021-04-07 08:53:22'),
(512, 537, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 12:41:16', 30, 1, NULL, NULL, NULL, 'SP2021/0512', NULL, '2021-04-07 10:41:16', '2021-04-07 10:41:16'),
(513, 538, 1, 0, '10.1000', 'card', NULL, '4115', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 13:16:27', 30, 1, NULL, NULL, NULL, 'SP2021/0513', NULL, '2021-04-07 11:16:27', '2021-04-07 11:16:27'),
(514, 539, 1, 0, '1.3500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-07 13:46:03', 30, 1, NULL, NULL, NULL, 'SP2021/0514', NULL, '2021-04-07 11:46:03', '2021-04-07 11:46:03'),
(515, 540, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-08 11:48:35', 30, 1, NULL, NULL, NULL, 'SP2021/0515', NULL, '2021-04-08 09:48:35', '2021-04-08 09:48:35'),
(516, 541, 1, 0, '3.8000', 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-08 13:13:17', 30, 1, NULL, NULL, NULL, 'SP2021/0516', NULL, '2021-04-08 11:13:17', '2021-04-08 11:13:17'),
(517, 542, 1, 0, '17.6000', 'card', NULL, '4115', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-08 13:45:34', 30, 1, NULL, NULL, NULL, 'SP2021/0517', NULL, '2021-04-08 11:45:34', '2021-04-08 11:45:34'),
(518, 543, 1, 0, '4.0000', 'card', NULL, '6684', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-08 15:14:34', 30, 1, NULL, NULL, NULL, 'SP2021/0518', NULL, '2021-04-08 13:14:34', '2021-04-08 13:14:34'),
(519, 544, 1, 0, '3.7500', 'card', NULL, '5951', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-08 15:33:34', 30, 1, NULL, NULL, NULL, 'SP2021/0519', NULL, '2021-04-08 13:33:34', '2021-04-08 13:33:34'),
(520, 545, 1, 0, '8.0000', 'card', NULL, '3885', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-10 12:52:05', 30, 1, NULL, NULL, NULL, 'SP2021/0520', NULL, '2021-04-10 10:52:05', '2021-04-10 10:52:05'),
(521, 546, 1, 0, '1.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-10 14:23:20', 30, 1, NULL, NULL, NULL, 'SP2021/0521', NULL, '2021-04-10 12:23:20', '2021-04-10 12:23:20'),
(522, 547, 1, 0, '7.5000', 'card', NULL, '4210', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-10 14:28:22', 30, 1, NULL, NULL, NULL, 'SP2021/0522', NULL, '2021-04-10 12:28:22', '2021-04-10 12:28:22'),
(523, 548, 1, 0, '3.4000', 'card', NULL, '4134', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-11 11:22:11', 30, 1, NULL, NULL, NULL, 'SP2021/0523', NULL, '2021-04-11 09:22:11', '2021-04-11 09:22:11'),
(524, 549, 1, 0, '1.5000', 'card', NULL, '6056', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-11 11:36:42', 30, 1, NULL, NULL, NULL, 'SP2021/0524', NULL, '2021-04-11 09:36:42', '2021-04-11 09:36:42'),
(525, 550, 1, 0, '3.4000', 'card', NULL, '4134', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-12 12:06:36', 30, 1, NULL, NULL, NULL, 'SP2021/0525', NULL, '2021-04-12 10:06:36', '2021-04-12 10:06:36'),
(526, 551, 1, 0, '1.6500', 'card', NULL, '9045', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-12 13:34:25', 30, 1, NULL, NULL, NULL, 'SP2021/0526', NULL, '2021-04-12 11:34:25', '2021-04-12 11:34:25'),
(527, 552, 1, 0, '2.7000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-12 13:51:38', 30, 1, NULL, NULL, NULL, 'SP2021/0527', NULL, '2021-04-12 11:51:38', '2021-04-12 11:51:38'),
(528, 553, 1, 0, '4.5000', 'card', NULL, '9357', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-12 15:42:48', 30, 1, NULL, NULL, NULL, 'SP2021/0528', NULL, '2021-04-12 13:42:48', '2021-04-12 13:42:48'),
(529, 554, 1, 0, '2.7000', 'card', NULL, '5951', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-12 15:43:28', 30, 1, NULL, NULL, NULL, 'SP2021/0529', NULL, '2021-04-12 13:43:28', '2021-04-12 13:43:28'),
(537, 562, 1, 0, '15.5000', 'card', NULL, '7667', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-13 18:05:03', 30, 1, NULL, NULL, NULL, 'SP2021/0537', NULL, '2021-04-13 16:05:03', '2021-04-13 16:05:03'),
(538, 563, 1, 0, '9.9500', 'card', NULL, '4542', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-16 00:16:49', 30, 1, NULL, NULL, NULL, 'SP2021/0538', NULL, '2021-04-15 22:16:49', '2021-04-15 22:16:49'),
(539, 564, 1, 0, '7.1500', 'card', NULL, '7561', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 16:45:13', 30, 1, NULL, NULL, NULL, 'SP2021/0539', NULL, '2021-04-17 14:45:13', '2021-04-17 14:45:13'),
(541, 566, 1, 0, '6.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18 16:45:03', 30, 1, NULL, NULL, NULL, 'SP2021/0541', NULL, '2021-04-18 14:45:03', '2021-04-18 14:45:03'),
(545, 572, 1, 0, '8.5000', 'card', NULL, '4542', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 01:05:41', 30, 1, NULL, NULL, NULL, 'SP2021/0545', NULL, '2021-04-18 23:05:41', '2021-04-18 23:05:41'),
(546, 574, 1, 0, '5.9000', 'card', NULL, NULL, '1732', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:24:49', 15, 1, NULL, NULL, NULL, 'SP2021/0546', NULL, '2021-04-19 13:24:49', '2021-04-19 13:24:49'),
(547, 575, 1, 0, '2.9800', 'card', NULL, NULL, '4439', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:45:00', 15, 47, NULL, NULL, NULL, 'SP2021/0547', NULL, '2021-04-19 13:45:00', '2021-04-19 13:45:00'),
(548, 576, 1, 0, '3.1500', 'card', NULL, NULL, '3648', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:49:08', 15, 1, NULL, NULL, NULL, 'SP2021/0548', NULL, '2021-04-19 13:49:08', '2021-04-19 13:49:08'),
(549, 577, 1, 0, '12.8000', 'card', NULL, NULL, '9110', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:51:52', 15, 1, NULL, NULL, NULL, 'SP2021/0549', NULL, '2021-04-19 13:51:52', '2021-04-19 13:51:52'),
(550, 578, 1, 0, '2.0000', 'card', NULL, NULL, '8647', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:53:26', 15, 1, NULL, NULL, NULL, 'SP2021/0550', NULL, '2021-04-19 13:53:26', '2021-04-19 13:53:26'),
(551, 579, 1, 0, '3.1000', 'card', NULL, NULL, '3019', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 15:54:28', 15, 1, NULL, NULL, NULL, 'SP2021/0551', NULL, '2021-04-19 13:54:28', '2021-04-19 13:54:28'),
(552, 580, 1, 0, '5.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:03:35', 15, 1, NULL, NULL, NULL, 'SP2021/0552', NULL, '2021-04-19 14:03:35', '2021-04-19 14:03:35'),
(553, 581, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:17:43', 15, 1, NULL, NULL, NULL, 'SP2021/0553', NULL, '2021-04-19 14:17:43', '2021-04-19 14:17:43'),
(554, 582, 1, 0, '7.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:29:47', 15, 1, NULL, NULL, NULL, 'SP2021/0554', NULL, '2021-04-19 14:29:47', '2021-04-19 14:29:47'),
(555, 583, 1, 0, '4.5000', 'card', NULL, NULL, '3983', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:30:46', 15, 1, NULL, NULL, NULL, 'SP2021/0555', NULL, '2021-04-19 14:30:46', '2021-04-19 14:30:46'),
(556, 573, 1, 0, '5.9000', 'card', NULL, NULL, '9655', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:41:30', 15, 1, NULL, NULL, NULL, 'SP2021/0556', NULL, '2021-04-19 14:41:30', '2021-04-19 14:41:30'),
(557, 585, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:47:53', 15, 1, NULL, NULL, NULL, 'SP2021/0557', NULL, '2021-04-19 14:47:53', '2021-04-19 14:47:53'),
(558, 586, 1, 0, '3.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 16:50:43', 15, 1, NULL, NULL, NULL, 'SP2021/0558', NULL, '2021-04-19 14:50:43', '2021-04-19 14:50:43'),
(560, 589, 1, 0, '5.5500', 'card', NULL, NULL, '6265', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 17:21:47', 15, 1, NULL, NULL, NULL, 'SP2021/0560', NULL, '2021-04-19 15:21:47', '2021-04-19 15:21:47'),
(561, 590, 1, 0, '7.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 17:29:37', 15, 1, NULL, NULL, NULL, 'SP2021/0561', NULL, '2021-04-19 15:29:37', '2021-04-19 15:29:37'),
(562, 591, 1, 0, '5.5000', 'card', NULL, NULL, '9597', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 17:39:34', 15, 1, NULL, NULL, NULL, 'SP2021/0562', NULL, '2021-04-19 15:39:34', '2021-04-19 15:39:34'),
(563, 592, 1, 0, '9.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 17:47:55', 15, 1, NULL, NULL, NULL, 'SP2021/0563', NULL, '2021-04-19 15:47:55', '2021-04-19 15:47:55'),
(564, 593, 1, 0, '7.1500', 'card', NULL, '7561', NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:02:20', 30, 1, NULL, NULL, NULL, 'SP2021/0564', NULL, '2021-04-19 16:02:20', '2021-04-19 16:02:20'),
(565, 594, 1, 0, '11.9500', 'card', NULL, NULL, '9888', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:08:23', 15, 1, NULL, NULL, NULL, 'SP2021/0565', NULL, '2021-04-19 16:08:23', '2021-04-19 16:08:23'),
(566, 595, 1, 0, '4.6400', 'card', NULL, NULL, '9178', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:12:38', 15, 49, NULL, NULL, NULL, 'SP2021/0566', NULL, '2021-04-19 16:12:38', '2021-04-19 16:12:38'),
(567, 596, 1, 0, '9.5500', 'card', NULL, NULL, '4420', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:13:37', 15, 1, NULL, NULL, NULL, 'SP2021/0567', NULL, '2021-04-19 16:13:37', '2021-04-19 16:13:37'),
(568, 597, 1, 0, '6.3000', 'card', NULL, NULL, '1066', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:14:29', 15, 1, NULL, NULL, NULL, 'SP2021/0568', NULL, '2021-04-19 16:14:29', '2021-04-19 16:14:29'),
(569, 602, 1, 0, '6.2800', 'card', NULL, NULL, '5322', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-19 18:57:13', 15, 50, NULL, NULL, NULL, 'SP2021/0569', NULL, '2021-04-19 16:57:13', '2021-04-19 16:57:13'),
(570, 605, 1, 0, '4.0000', 'card', NULL, NULL, '5536', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:01:22', 15, 1, NULL, NULL, NULL, 'SP2021/0570', NULL, '2021-04-20 13:01:22', '2021-04-20 13:01:22'),
(571, 606, 1, 0, '7.1000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:23:39', 15, 1, NULL, NULL, NULL, 'SP2021/0571', NULL, '2021-04-20 13:23:39', '2021-04-20 13:23:39'),
(572, 607, 1, 0, '5.7500', 'card', NULL, NULL, '9046', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:25:18', 15, 1, NULL, NULL, NULL, 'SP2021/0572', NULL, '2021-04-20 13:25:18', '2021-04-20 13:25:18'),
(573, 609, 1, 0, '3.7500', 'card', NULL, NULL, '1732', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:37:11', 15, 1, NULL, NULL, NULL, 'SP2021/0573', NULL, '2021-04-20 13:37:11', '2021-04-20 13:37:11'),
(574, 608, 1, 0, '5.9000', 'card', NULL, NULL, '3764', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:38:13', 15, 1, NULL, NULL, NULL, 'SP2021/0574', NULL, '2021-04-20 13:38:13', '2021-04-20 13:38:13'),
(575, 610, 1, 0, '5.9000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 15:39:20', 15, 1, NULL, NULL, NULL, 'SP2021/0575', NULL, '2021-04-20 13:39:20', '2021-04-20 13:39:20'),
(576, 611, 1, 0, '3.7500', 'card', NULL, NULL, '5217', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 16:32:54', 15, 1, NULL, NULL, NULL, 'SP2021/0576', NULL, '2021-04-20 14:32:54', '2021-04-20 14:32:54'),
(577, 612, 1, 0, '2.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 16:38:01', 15, 1, NULL, NULL, NULL, 'SP2021/0577', NULL, '2021-04-20 14:38:01', '2021-04-20 14:38:01'),
(578, 613, 1, 0, '9.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 16:40:02', 15, 1, NULL, NULL, NULL, 'SP2021/0578', NULL, '2021-04-20 14:40:02', '2021-04-20 14:40:02'),
(579, 615, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:03:37', 15, 1, NULL, NULL, NULL, 'SP2021/0579', NULL, '2021-04-20 15:03:37', '2021-04-20 15:03:37'),
(580, 614, 1, 0, '6.0500', 'card', NULL, NULL, '6670', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:05:46', 15, 1, NULL, NULL, NULL, 'SP2021/0580', NULL, '2021-04-20 15:05:46', '2021-04-20 15:11:03'),
(581, 616, 1, 0, '1.0000', 'card', NULL, NULL, '7176', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:12:41', 15, 1, NULL, NULL, NULL, 'SP2021/0581', NULL, '2021-04-20 15:12:41', '2021-04-20 15:12:41'),
(582, 619, 1, 0, '7.6500', 'card', NULL, NULL, '7073', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:18:56', 15, 1, NULL, NULL, NULL, 'SP2021/0582', NULL, '2021-04-20 15:18:56', '2021-04-20 15:18:56'),
(583, 618, 1, 0, '7.5500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:24:20', 15, 1, NULL, NULL, NULL, 'SP2021/0583', NULL, '2021-04-20 15:24:20', '2021-04-20 15:24:20'),
(584, 623, 1, 0, '5.1200', 'card', NULL, NULL, '8607', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:40:35', 15, 52, NULL, NULL, NULL, 'SP2021/0584', NULL, '2021-04-20 15:40:35', '2021-04-20 15:40:35'),
(585, 624, 1, 0, '3.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:51:53', 15, 1, NULL, NULL, NULL, 'SP2021/0585', NULL, '2021-04-20 15:51:53', '2021-04-20 15:51:53'),
(586, 617, 1, 0, '8.6500', 'card', NULL, NULL, '0808', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:52:48', 15, 1, NULL, NULL, NULL, 'SP2021/0586', NULL, '2021-04-20 15:52:48', '2021-04-20 15:52:48'),
(587, 628, 1, 0, '2.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 17:58:28', 15, 1, NULL, NULL, NULL, 'SP2021/0587', NULL, '2021-04-20 15:58:28', '2021-04-20 15:58:28'),
(588, 621, 1, 0, '10.4300', 'card', NULL, NULL, '4034', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:00:40', 15, 51, NULL, NULL, NULL, 'SP2021/0588', NULL, '2021-04-20 16:00:40', '2021-04-20 16:00:40'),
(589, 629, 1, 0, '14.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:02:17', 15, 1, NULL, NULL, NULL, 'SP2021/0589', NULL, '2021-04-20 16:02:17', '2021-04-20 16:02:17'),
(590, 622, 1, 0, '4.8000', 'card', NULL, NULL, '3578', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:03:06', 15, 1, NULL, NULL, NULL, 'SP2021/0590', NULL, '2021-04-20 16:03:06', '2021-04-20 16:03:06'),
(591, 625, 1, 0, '7.8800', 'card', NULL, NULL, '0887', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:04:19', 15, 53, NULL, NULL, NULL, 'SP2021/0591', NULL, '2021-04-20 16:04:19', '2021-04-20 16:04:19'),
(592, 630, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:04:39', 15, 1, NULL, NULL, NULL, 'SP2021/0592', NULL, '2021-04-20 16:04:39', '2021-04-20 16:04:39'),
(593, 627, 1, 0, '8.7000', 'card', NULL, NULL, '1066', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:09:45', 15, 1, NULL, NULL, NULL, 'SP2021/0593', NULL, '2021-04-20 16:09:45', '2021-04-20 16:09:45'),
(594, 626, 1, 0, '9.5500', 'card', NULL, NULL, '4420', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:10:27', 15, 1, NULL, NULL, NULL, 'SP2021/0594', NULL, '2021-04-20 16:10:27', '2021-04-20 16:10:27'),
(595, 620, 1, 0, '19.3000', 'card', NULL, NULL, '3398', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:13:46', 15, 1, NULL, NULL, NULL, 'SP2021/0595', NULL, '2021-04-20 16:13:46', '2021-04-20 16:13:46'),
(596, 631, 1, 0, '4.6000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:21:43', 15, 1, NULL, NULL, NULL, 'SP2021/0596', NULL, '2021-04-20 16:21:43', '2021-04-20 16:21:43'),
(597, 632, 1, 0, '4.7500', 'card', NULL, NULL, '9887', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:24:30', 15, 1, NULL, NULL, NULL, 'SP2021/0597', NULL, '2021-04-20 16:24:30', '2021-04-20 16:24:30'),
(598, 633, 1, 0, '8.8500', 'card', NULL, NULL, '1000', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 18:26:46', 15, 1, NULL, NULL, NULL, 'SP2021/0598', NULL, '2021-04-20 16:26:46', '2021-04-20 16:26:46'),
(599, 634, 1, 0, '4.4100', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 19:20:59', 15, 55, NULL, NULL, NULL, 'SP2021/0599', NULL, '2021-04-20 17:20:59', '2021-04-20 17:20:59'),
(600, 635, 1, 0, '16.4600', 'card', NULL, NULL, '4542', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 19:27:54', 15, 56, NULL, NULL, NULL, 'SP2021/0600', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(601, 636, 1, 0, '3.5000', 'card', NULL, NULL, '6705', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-20 19:29:56', 15, 1, NULL, NULL, NULL, 'SP2021/0601', NULL, '2021-04-20 17:29:56', '2021-04-20 17:29:56'),
(602, 637, 1, 0, '5.2300', 'card', NULL, NULL, '2821', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:04:52', 15, 57, NULL, NULL, NULL, 'SP2021/0602', NULL, '2021-04-21 13:04:52', '2021-04-21 13:04:52'),
(603, 638, 1, 0, '3.7400', 'card', NULL, NULL, '1273', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:07:11', 15, 56, NULL, NULL, NULL, 'SP2021/0603', NULL, '2021-04-21 13:07:11', '2021-04-21 13:07:11'),
(604, 639, 1, 0, '18.7100', 'card', NULL, NULL, '2821', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:09:07', 15, 57, NULL, NULL, NULL, 'SP2021/0604', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(605, 640, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:10:04', 15, 1, NULL, NULL, NULL, 'SP2021/0605', NULL, '2021-04-21 13:10:04', '2021-04-21 13:10:04'),
(606, 641, 1, 0, '5.9000', 'card', NULL, NULL, '1732', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:50:15', 15, 1, NULL, NULL, NULL, 'SP2021/0606', NULL, '2021-04-21 13:50:15', '2021-04-21 13:50:15'),
(607, 642, 1, 0, '2.7500', 'card', NULL, NULL, '8592', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:50:49', 15, 1, NULL, NULL, NULL, 'SP2021/0607', NULL, '2021-04-21 13:50:49', '2021-04-21 13:50:49'),
(608, 643, 1, 0, '1.0000', 'card', NULL, NULL, '3094', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:51:49', 15, 1, NULL, NULL, NULL, 'SP2021/0608', NULL, '2021-04-21 13:51:49', '2021-04-21 13:51:49'),
(609, 644, 1, 0, '17.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:54:19', 15, 1, NULL, NULL, NULL, 'SP2021/0609', NULL, '2021-04-21 13:54:19', '2021-04-21 13:54:19'),
(610, 645, 1, 0, '9.1800', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:56:35', 15, 57, NULL, NULL, NULL, 'SP2021/0610', NULL, '2021-04-21 13:56:35', '2021-04-21 13:56:35'),
(611, 646, 1, 0, '4.2500', 'card', NULL, NULL, '0293', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 15:57:04', 15, 1, NULL, NULL, NULL, 'SP2021/0611', NULL, '2021-04-21 13:57:04', '2021-04-21 13:57:04'),
(612, 647, 1, 0, '3.6000', 'card', NULL, NULL, '8531', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 16:49:45', 15, 1, NULL, NULL, NULL, 'SP2021/0612', NULL, '2021-04-21 14:49:45', '2021-04-21 14:49:45'),
(613, 648, 1, 0, '6.3000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:01:05', 15, 1, NULL, NULL, NULL, 'SP2021/0613', NULL, '2021-04-21 15:01:05', '2021-04-21 15:01:05'),
(614, 649, 1, 0, '2.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:16:49', 15, 1, NULL, NULL, NULL, 'SP2021/0614', NULL, '2021-04-21 15:16:49', '2021-04-21 15:16:49'),
(615, 650, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:20:44', 15, 1, NULL, NULL, NULL, 'SP2021/0615', NULL, '2021-04-21 15:20:44', '2021-04-21 15:20:44'),
(616, 652, 1, 0, '5.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:36:34', 15, 1, NULL, NULL, NULL, 'SP2021/0616', NULL, '2021-04-21 15:36:34', '2021-04-21 15:36:34'),
(617, 653, 1, 0, '6.5000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:37:01', 15, 1, NULL, NULL, NULL, 'SP2021/0617', NULL, '2021-04-21 15:37:01', '2021-04-21 15:37:01'),
(618, 654, 1, 0, '10.4000', 'card', NULL, NULL, '0493', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:40:54', 15, 1, NULL, NULL, NULL, 'SP2021/0618', NULL, '2021-04-21 15:40:54', '2021-04-21 15:40:54'),
(619, 655, 1, 0, '7.5000', 'card', NULL, NULL, '1735', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:47:04', 15, 1, NULL, NULL, NULL, 'SP2021/0619', NULL, '2021-04-21 15:47:04', '2021-04-21 15:47:04'),
(620, 656, 1, 0, '2.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:52:52', 15, 59, NULL, NULL, NULL, 'SP2021/0620', NULL, '2021-04-21 15:52:52', '2021-04-21 15:52:52'),
(621, 657, 1, 0, '3.5000', 'card', NULL, NULL, '6705', 'master', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 17:58:33', 15, 1, NULL, NULL, NULL, 'SP2021/0621', NULL, '2021-04-21 15:58:33', '2021-04-21 15:58:33'),
(622, 658, 1, 0, '9.5500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:03:29', 15, 1, NULL, NULL, NULL, 'SP2021/0622', NULL, '2021-04-21 16:03:29', '2021-04-21 16:03:29'),
(623, 659, 1, 0, '18.1500', 'card', NULL, NULL, '2613', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:07:30', 15, 1, NULL, NULL, NULL, 'SP2021/0623', NULL, '2021-04-21 16:07:30', '2021-04-21 16:07:30'),
(624, 660, 1, 0, '8.6600', 'card', NULL, NULL, '3170', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:08:33', 15, 60, NULL, NULL, NULL, 'SP2021/0624', NULL, '2021-04-21 16:08:33', '2021-04-21 16:08:33'),
(625, 661, 1, 0, '21.4500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:19:41', 15, 1, NULL, NULL, NULL, 'SP2021/0625', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(626, 662, 1, 0, '4.1500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:20:25', 15, 1, NULL, NULL, NULL, 'SP2021/0626', NULL, '2021-04-21 16:20:25', '2021-04-21 16:20:25'),
(627, 663, 1, 0, '7.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:23:17', 15, 1, NULL, NULL, NULL, 'SP2021/0627', NULL, '2021-04-21 16:23:17', '2021-04-21 16:23:17'),
(628, 664, 1, 0, '10.8000', 'card', NULL, NULL, '5650', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:33:12', 15, 1, NULL, NULL, NULL, 'SP2021/0628', NULL, '2021-04-21 16:33:12', '2021-04-21 16:33:12'),
(629, 665, 1, 0, '2.8000', 'card', NULL, NULL, '8173', 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 18:37:12', 15, 1, NULL, NULL, NULL, 'SP2021/0629', NULL, '2021-04-21 16:37:12', '2021-04-21 16:37:12'),
(630, 666, 1, 0, '13.8500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-22 00:30:53', 30, 1, NULL, NULL, NULL, 'SP2021/0630', NULL, '2021-04-21 22:30:53', '2021-04-21 22:30:53'),
(631, 667, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-03 13:09:43', 1, 1, NULL, NULL, NULL, 'SP2021/0631', NULL, '2021-05-03 10:09:43', '2021-05-03 10:09:43'),
(632, 668, 1, 0, '4.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-03 13:10:04', 1, 1, NULL, NULL, NULL, 'SP2021/0632', NULL, '2021-05-03 10:10:04', '2021-05-03 10:10:04'),
(633, 670, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 11:03:14', 1, 45, NULL, NULL, NULL, 'SP2021/0633', NULL, '2021-05-12 08:03:14', '2021-05-12 08:03:14'),
(634, 673, 1, 0, '1.6500', 'card', NULL, NULL, NULL, 'visa', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-13 18:24:42', 1, 1, NULL, NULL, NULL, 'SP2021/0634', NULL, '2021-05-13 15:24:42', '2021-05-13 15:24:42'),
(635, 674, 1, 0, '5.7500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-13 18:37:35', 1, 1, NULL, NULL, NULL, 'SP2021/0635', NULL, '2021-05-13 15:37:35', '2021-05-13 15:37:35'),
(636, 675, 1, 0, '1.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 17:22:03', 1, 1, NULL, NULL, NULL, 'SP2021/0636', NULL, '2021-05-20 14:22:03', '2021-05-20 14:22:03'),
(637, 676, 1, 0, '0.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 17:40:23', 1, 1, NULL, NULL, NULL, 'SP2021/0637', NULL, '2021-05-20 14:40:23', '2021-05-20 14:40:23'),
(638, 677, 1, 0, '0.2500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 20:46:56', 1, 1, NULL, NULL, NULL, 'SP2021/0638', NULL, '2021-05-20 17:46:56', '2021-05-20 17:46:56'),
(639, 678, 1, 0, '4.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 20:48:22', 1, 1, NULL, NULL, NULL, 'SP2021/0639', NULL, '2021-05-20 17:48:22', '2021-05-20 17:48:22'),
(640, 679, 1, 0, '0.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-20 20:49:38', 1, 1, NULL, NULL, NULL, 'SP2021/0640', NULL, '2021-05-20 17:49:38', '2021-05-20 17:49:38'),
(641, 680, 1, 0, '2.8000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-21 20:30:14', 1, 1, NULL, NULL, NULL, 'SP2021/0641', NULL, '2021-05-21 17:30:14', '2021-05-21 17:30:14'),
(642, 682, 1, 0, '4.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-24 18:26:10', 1, 1, NULL, NULL, NULL, 'SP2021/0642', NULL, '2021-05-24 15:26:10', '2021-05-24 15:26:10'),
(643, 683, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-24 21:08:22', 1, 1, NULL, NULL, NULL, 'SP2021/0643', NULL, '2021-05-24 18:08:22', '2021-05-24 18:08:22'),
(644, 684, 1, 0, '1.6500', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 17:19:35', 1, 1, NULL, NULL, NULL, 'SP2021/0644', NULL, '2021-05-27 14:19:35', '2021-05-27 14:19:35'),
(645, 685, 1, 0, '0.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 17:22:43', 1, 1, NULL, NULL, NULL, 'SP2021/0645', NULL, '2021-05-27 14:22:43', '2021-05-27 14:22:43'),
(646, 686, 1, 0, '0.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 17:24:26', 1, 1, NULL, NULL, NULL, 'SP2021/0646', NULL, '2021-05-27 14:24:26', '2021-05-27 14:24:26'),
(647, 687, 1, 0, '4.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 17:33:36', 1, 1, NULL, NULL, NULL, 'SP2021/0647', NULL, '2021-05-27 14:33:36', '2021-05-27 14:33:36'),
(648, 688, 1, 0, '4.4000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 17:36:41', 1, 1, NULL, NULL, NULL, 'SP2021/0648', NULL, '2021-05-27 14:36:41', '2021-05-27 14:36:41'),
(649, 692, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 18:36:53', 1, 1, NULL, NULL, NULL, 'SP2021/0001', NULL, '2021-05-28 15:36:53', '2021-05-28 15:36:53'),
(650, 693, 1, 0, '4.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 18:38:17', 1, 1, NULL, NULL, NULL, 'SP2021/0002', NULL, '2021-05-28 15:38:17', '2021-05-28 15:38:17'),
(651, 694, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 18:38:43', 1, 1, NULL, NULL, NULL, 'SP2021/0003', NULL, '2021-05-28 15:38:43', '2021-05-28 15:38:43'),
(652, 695, 1, 0, '4.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 18:51:23', 1, 1, NULL, NULL, NULL, 'SP2021/0004', NULL, '2021-05-28 15:51:23', '2021-05-28 15:51:23'),
(653, 696, 1, 0, '4.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:02:24', 1, 1, NULL, NULL, NULL, 'SP2021/0005', NULL, '2021-05-28 16:02:24', '2021-05-28 16:02:24'),
(654, 697, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:03:29', 1, 1, NULL, NULL, NULL, 'SP2021/0006', NULL, '2021-05-28 16:03:29', '2021-05-28 16:03:29'),
(655, 698, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:05:26', 1, 1, NULL, NULL, NULL, 'SP2021/0007', NULL, '2021-05-28 16:05:26', '2021-05-28 16:05:26'),
(656, 699, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:06:11', 1, 1, NULL, NULL, NULL, 'SP2021/0008', NULL, '2021-05-28 16:06:11', '2021-05-28 16:06:11'),
(657, 700, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:07:22', 1, 1, NULL, NULL, NULL, 'SP2021/0009', NULL, '2021-05-28 16:07:22', '2021-05-28 16:07:22'),
(658, 701, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:08:57', 1, 1, NULL, NULL, NULL, 'SP2021/0010', NULL, '2021-05-28 16:08:57', '2021-05-28 16:08:57'),
(659, 702, 1, 0, '6.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:11:04', 1, 1, NULL, NULL, NULL, 'SP2021/0011', NULL, '2021-05-28 16:11:04', '2021-05-28 16:11:04'),
(660, 703, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-28 19:13:32', 1, 1, NULL, NULL, NULL, 'SP2021/0012', NULL, '2021-05-28 16:13:32', '2021-05-28 16:13:32'),
(661, 705, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-31 21:06:22', 1, 1, NULL, NULL, NULL, 'SP2021/0013', NULL, '2021-05-31 18:06:22', '2021-05-31 18:06:22'),
(662, 709, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-03 19:39:08', 1, 1, NULL, NULL, NULL, 'SP2021/0014', NULL, '2021-06-03 16:39:08', '2021-06-03 16:39:08'),
(663, 710, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-03 19:55:55', 1, 1, NULL, NULL, NULL, 'SP2021/0015', NULL, '2021-06-03 16:55:55', '2021-06-03 16:55:55'),
(664, 711, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 19:27:25', 1, 1, NULL, NULL, NULL, 'SP2021/0016', NULL, '2021-06-04 16:27:25', '2021-06-04 16:27:25'),
(665, 712, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 19:36:46', 1, 1, NULL, NULL, NULL, 'SP2021/0017', NULL, '2021-06-04 16:36:46', '2021-06-04 16:36:46'),
(666, 713, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 20:34:02', 1, 1, NULL, NULL, NULL, 'SP2021/0018', NULL, '2021-06-04 17:34:02', '2021-06-04 17:34:02'),
(667, 714, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 20:35:34', 1, 1, NULL, NULL, NULL, 'SP2021/0019', NULL, '2021-06-04 17:35:34', '2021-06-04 17:35:34'),
(668, 715, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 20:56:17', 1, 1, NULL, NULL, NULL, 'SP2021/0020', NULL, '2021-06-04 17:56:17', '2021-06-04 17:56:17'),
(669, 716, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-04 20:56:45', 1, 1, NULL, NULL, NULL, 'SP2021/0021', NULL, '2021-06-04 17:56:45', '2021-06-04 17:56:45'),
(670, 717, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:05:09', 1, 1, NULL, NULL, NULL, 'SP2021/0022', NULL, '2021-06-05 07:05:09', '2021-06-05 07:05:09'),
(671, 718, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:08:23', 1, 1, NULL, NULL, NULL, 'SP2021/0023', NULL, '2021-06-05 07:08:23', '2021-06-05 07:08:23'),
(672, 719, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:09:06', 1, 1, NULL, NULL, NULL, 'SP2021/0024', NULL, '2021-06-05 07:09:06', '2021-06-05 07:09:06'),
(673, 720, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:13:27', 1, 1, NULL, NULL, NULL, 'SP2021/0025', NULL, '2021-06-05 07:13:27', '2021-06-05 07:13:27'),
(674, 721, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:14:51', 1, 1, NULL, NULL, NULL, 'SP2021/0026', NULL, '2021-06-05 07:14:51', '2021-06-05 07:14:51'),
(675, 722, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:19:04', 1, 1, NULL, NULL, NULL, 'SP2021/0027', NULL, '2021-06-05 07:19:04', '2021-06-05 07:19:04'),
(676, 723, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:30:34', 1, 1, NULL, NULL, NULL, 'SP2021/0028', NULL, '2021-06-05 07:30:34', '2021-06-05 07:30:34'),
(677, 724, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:35:52', 1, 1, NULL, NULL, NULL, 'SP2021/0029', NULL, '2021-06-05 07:35:52', '2021-06-05 07:35:52'),
(678, 725, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:37:45', 1, 1, NULL, NULL, NULL, 'SP2021/0030', NULL, '2021-06-05 07:37:45', '2021-06-05 07:37:45'),
(679, 726, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:40:13', 1, 1, NULL, NULL, NULL, 'SP2021/0031', NULL, '2021-06-05 07:40:13', '2021-06-05 07:40:13'),
(680, 727, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:46:07', 1, 1, NULL, NULL, NULL, 'SP2021/0032', NULL, '2021-06-05 07:46:07', '2021-06-05 07:46:07'),
(681, 728, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:46:47', 1, 1, NULL, NULL, NULL, 'SP2021/0033', NULL, '2021-06-05 07:46:47', '2021-06-05 07:46:47'),
(682, 729, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:50:48', 1, 1, NULL, NULL, NULL, 'SP2021/0034', NULL, '2021-06-05 07:50:48', '2021-06-05 07:50:48'),
(683, 730, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:57:54', 1, 1, NULL, NULL, NULL, 'SP2021/0035', NULL, '2021-06-05 07:57:54', '2021-06-05 07:57:54'),
(684, 731, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 10:59:15', 1, 1, NULL, NULL, NULL, 'SP2021/0036', NULL, '2021-06-05 07:59:15', '2021-06-05 07:59:15'),
(685, 732, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 11:58:41', 1, 1, NULL, NULL, NULL, 'SP2021/0037', NULL, '2021-06-05 08:58:41', '2021-06-05 08:58:41'),
(686, 733, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 12:00:09', 1, 1, NULL, NULL, NULL, 'SP2021/0038', NULL, '2021-06-05 09:00:09', '2021-06-05 09:00:09'),
(687, 734, 1, 0, '4.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 12:16:51', 1, 1, NULL, NULL, NULL, 'SP2021/0039', NULL, '2021-06-05 09:16:51', '2021-06-05 09:16:51'),
(688, 735, 1, 0, '6.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 12:31:51', 1, 1, NULL, NULL, NULL, 'SP2021/0040', NULL, '2021-06-05 09:31:51', '2021-06-05 09:31:51'),
(689, 736, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 17:46:14', 1, 1, NULL, NULL, NULL, 'SP2021/0041', NULL, '2021-06-05 14:46:14', '2021-06-05 14:46:14'),
(690, 737, 1, 0, '2.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 17:47:09', 1, 1, NULL, NULL, NULL, 'SP2021/0042', NULL, '2021-06-05 14:47:09', '2021-06-05 14:47:09'),
(691, 738, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:12:01', 1, 1, NULL, NULL, NULL, 'SP2021/0043', NULL, '2021-06-05 15:12:01', '2021-06-05 15:12:01'),
(692, 739, 1, 0, '10.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:15:18', 1, 1, NULL, NULL, NULL, 'SP2021/0044', NULL, '2021-06-05 15:15:18', '2021-06-05 15:15:18'),
(693, 740, 1, 0, '14.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:19:04', 1, 1, NULL, NULL, NULL, 'SP2021/0045', NULL, '2021-06-05 15:19:04', '2021-06-05 15:19:04'),
(694, 741, 1, 0, '8.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:22:36', 1, 1, NULL, NULL, NULL, 'SP2021/0046', NULL, '2021-06-05 15:22:36', '2021-06-05 15:22:36'),
(695, 742, 1, 0, '2.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:35:05', 1, 1, NULL, NULL, NULL, 'SP2021/0047', NULL, '2021-06-05 15:35:05', '2021-06-05 15:35:05'),
(696, 743, 1, 0, '16.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:37:18', 1, 1, NULL, NULL, NULL, 'SP2021/0048', NULL, '2021-06-05 15:37:18', '2021-06-05 15:37:18'),
(697, 744, 1, 0, '24.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:45:50', 1, 1, NULL, NULL, NULL, 'SP2021/0049', NULL, '2021-06-05 15:45:50', '2021-06-06 19:02:36'),
(698, 745, 1, 0, '2.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 18:47:41', 1, 1, NULL, NULL, NULL, 'SP2021/0050', NULL, '2021-06-05 15:47:42', '2021-06-05 15:47:42'),
(699, 746, 1, 0, '4.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-05 20:28:04', 1, 1, NULL, NULL, NULL, 'SP2021/0051', NULL, '2021-06-05 17:28:04', '2021-06-05 17:28:04'),
(700, 747, 1, 0, '6.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-06 20:30:11', 1, 1, NULL, NULL, NULL, 'SP2021/0052', NULL, '2021-06-06 17:30:11', '2021-06-06 19:54:00'),
(701, 748, 1, 0, '6.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-06 20:36:38', 1, 1, NULL, NULL, NULL, 'SP2021/0053', NULL, '2021-06-06 17:36:38', '2021-06-06 17:36:38'),
(702, 749, 1, 0, '2.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-06 21:49:31', 1, 1, NULL, NULL, NULL, 'SP2021/0054', NULL, '2021-06-06 18:49:31', '2021-06-06 18:49:31'),
(703, 750, 1, 0, '8.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-06 22:08:51', 1, 1, NULL, NULL, NULL, 'SP2021/0055', NULL, '2021-06-06 19:08:51', '2021-06-06 19:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(8, 11, 61, 1946, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 10:34:44', '2020-12-14 10:34:44'),
(9, 12, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 10:36:47', '2020-12-14 10:36:47'),
(10, 13, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 11:17:20', '2020-12-14 11:17:20'),
(11, 14, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 11:19:25', '2020-12-14 11:19:25'),
(12, 15, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 12:41:59', '2020-12-14 12:41:59'),
(13, 16, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 13:17:13', '2020-12-14 13:17:13'),
(14, 17, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 13:24:17', '2020-12-14 13:24:17'),
(15, 18, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 13:38:41', '2020-12-14 13:38:41'),
(16, 19, 130, 130, '1.0000', '0.0000', '2.4700', '2.4700', NULL, '0.0000', '2.4700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 16:12:15', '2020-12-14 16:12:15'),
(17, 20, 130, 130, '1.0000', '0.0000', '2.4700', '2.4700', NULL, '0.0000', '2.4700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-14 16:16:46', '2020-12-14 16:16:46'),
(20, 22, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 11:09:49', '2020-12-15 11:09:49'),
(21, 23, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 11:34:06', '2020-12-15 11:34:06'),
(22, 23, 47, 1932, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 11:34:06', '2020-12-15 11:34:06'),
(23, 23, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 11:34:06', '2020-12-15 11:34:06'),
(24, 24, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 13:55:41', '2020-12-15 13:55:41'),
(25, 25, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-15 15:59:59', '2020-12-15 15:59:59'),
(26, 26, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 11:32:28', '2020-12-16 11:32:28'),
(27, 26, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 11:32:28', '2020-12-16 11:32:28'),
(28, 27, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 12:26:52', '2020-12-16 12:26:52'),
(29, 27, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 12:26:52', '2020-12-16 12:26:52'),
(30, 28, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 13:46:33', '2020-12-16 13:46:33'),
(31, 29, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 15:25:08', '2020-12-16 15:25:08'),
(32, 30, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 15:47:16', '2020-12-16 15:47:16'),
(33, 31, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 17:04:38', '2020-12-16 17:04:38'),
(34, 31, 32, 1917, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 17:04:38', '2020-12-16 17:04:38'),
(35, 31, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-16 17:04:38', '2020-12-16 17:04:38'),
(38, 34, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 09:48:35', '2020-12-17 09:48:35'),
(39, 35, 164, 2049, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 10:43:11', '2020-12-17 10:43:11'),
(40, 35, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 10:43:11', '2020-12-17 10:43:11'),
(41, 36, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 12:57:28', '2020-12-17 12:57:28'),
(42, 37, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 13:00:38', '2020-12-17 13:00:38'),
(43, 38, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 13:59:16', '2020-12-17 13:59:16'),
(44, 39, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 14:39:35', '2020-12-17 14:39:35'),
(45, 39, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-17 14:39:35', '2020-12-17 14:39:35'),
(46, 40, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-18 17:00:20', '2020-12-18 17:00:20'),
(47, 40, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-18 17:00:20', '2020-12-18 17:00:20'),
(48, 41, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-18 19:18:51', '2020-12-18 19:18:51'),
(49, 41, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-18 19:18:51', '2020-12-18 19:18:51'),
(50, 42, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 11:48:19', '2020-12-19 11:48:19'),
(51, 42, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 11:48:19', '2020-12-19 11:48:19'),
(52, 42, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 11:48:19', '2020-12-19 11:48:19'),
(53, 43, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 16:17:21', '2020-12-19 16:23:36'),
(54, 43, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 16:17:21', '2020-12-19 16:23:36'),
(55, 43, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 16:17:21', '2020-12-19 16:23:36'),
(56, 43, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-19 16:17:21', '2020-12-19 16:23:36'),
(57, 44, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 12:43:38', '2020-12-20 12:43:38'),
(58, 44, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 12:43:38', '2020-12-20 12:43:38'),
(59, 45, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 13:07:33', '2020-12-20 13:07:33'),
(60, 46, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 15:18:24', '2020-12-20 15:18:24'),
(61, 47, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 16:16:02', '2020-12-20 16:16:02'),
(62, 47, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 16:16:02', '2020-12-20 16:16:02'),
(63, 47, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 16:16:02', '2020-12-20 16:16:02'),
(64, 48, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 16:17:04', '2020-12-20 16:17:04'),
(65, 49, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 18:10:30', '2020-12-20 18:10:30'),
(66, 49, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 18:10:30', '2020-12-20 18:10:30'),
(67, 50, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 18:18:04', '2020-12-20 18:18:04'),
(68, 51, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-20 18:19:49', '2020-12-20 18:19:49'),
(71, 53, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 09:15:16', '2020-12-21 09:15:16'),
(72, 53, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 09:15:16', '2020-12-21 09:15:16'),
(73, 54, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 09:41:18', '2020-12-21 09:41:18'),
(74, 54, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 09:41:18', '2020-12-21 09:41:18'),
(75, 55, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 10:39:43', '2020-12-21 10:39:43'),
(76, 55, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 10:39:43', '2020-12-21 10:39:43'),
(77, 55, 173, 2058, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 10:39:43', '2020-12-21 10:39:43'),
(78, 56, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 10:41:36', '2020-12-21 10:41:36'),
(79, 60, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 12:02:32', '2020-12-21 12:02:32'),
(80, 60, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 12:02:32', '2020-12-21 12:02:32'),
(81, 61, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 12:10:42', '2020-12-21 12:10:42'),
(82, 61, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 12:10:42', '2020-12-21 12:10:42'),
(83, 62, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 12:33:59', '2020-12-21 12:33:59'),
(84, 63, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 15:30:24', '2020-12-21 15:30:24'),
(85, 63, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 15:30:24', '2020-12-21 15:30:24'),
(86, 63, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 15:30:24', '2020-12-21 15:30:24'),
(87, 64, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 19:41:31', '2020-12-21 19:41:31'),
(88, 65, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 20:47:17', '2020-12-21 20:47:17'),
(89, 65, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 20:47:17', '2020-12-21 20:47:17'),
(90, 66, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-21 20:47:59', '2020-12-21 20:47:59'),
(91, 67, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 10:21:45', '2020-12-22 10:21:45'),
(92, 68, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:19:19', '2020-12-22 11:19:19'),
(93, 68, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:19:19', '2020-12-22 11:19:19'),
(94, 69, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:42:07', '2020-12-22 11:42:07'),
(95, 70, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:56:02', '2020-12-22 11:56:02'),
(96, 70, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:56:02', '2020-12-22 11:56:02'),
(97, 70, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 11:56:02', '2020-12-22 11:56:02'),
(98, 71, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 12:24:17', '2020-12-22 12:24:17'),
(99, 71, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 12:24:17', '2020-12-22 12:24:17'),
(100, 72, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 13:41:55', '2020-12-22 13:41:55'),
(101, 73, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 14:20:57', '2020-12-22 14:20:57'),
(102, 73, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 14:20:57', '2020-12-22 14:20:57'),
(103, 74, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 17:23:55', '2020-12-22 17:23:55'),
(104, 75, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 18:19:48', '2020-12-22 18:19:48'),
(105, 75, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 18:19:48', '2020-12-22 18:19:48'),
(106, 75, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 18:19:48', '2020-12-22 18:19:48'),
(107, 76, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-22 19:11:19', '2020-12-22 19:11:19'),
(108, 77, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 12:38:51', '2020-12-23 12:38:51'),
(109, 79, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 13:26:56', '2020-12-23 13:26:56'),
(110, 80, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 13:31:07', '2020-12-23 13:31:07'),
(111, 81, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 13:41:10', '2020-12-23 13:41:10'),
(112, 82, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 14:22:56', '2020-12-23 14:22:56'),
(113, 83, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 14:35:07', '2020-12-23 14:35:07'),
(114, 84, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 15:15:10', '2020-12-23 15:15:10'),
(115, 84, 47, 1932, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 15:15:10', '2020-12-23 15:15:10'),
(116, 85, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 17:37:21', '2020-12-23 17:37:21'),
(117, 86, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:00:04', '2020-12-23 19:00:04'),
(118, 87, 47, 1932, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(119, 87, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(120, 87, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(121, 87, 160, 2045, '1.0000', '0.0000', '4.6000', '4.6000', 'fixed', '0.0000', '4.6000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(122, 87, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(123, 87, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(124, 87, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 19:45:53', '2020-12-23 19:45:53'),
(125, 88, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-23 20:30:30', '2020-12-23 20:30:30'),
(126, 89, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 10:36:23', '2020-12-24 10:36:23'),
(127, 90, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 13:08:46', '2020-12-24 13:08:46'),
(128, 91, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 13:26:06', '2020-12-24 13:26:06'),
(129, 91, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 13:26:06', '2020-12-24 13:26:06'),
(130, 91, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 13:26:06', '2020-12-24 13:26:06'),
(131, 91, 43, 1928, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 13:26:06', '2020-12-24 13:26:06'),
(132, 92, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 15:36:42', '2020-12-24 15:36:42'),
(133, 93, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 18:16:40', '2020-12-24 18:16:40'),
(134, 93, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 18:16:40', '2020-12-24 18:16:40'),
(135, 94, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 18:17:40', '2020-12-24 18:17:40'),
(136, 94, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 18:17:40', '2020-12-24 18:17:40'),
(137, 95, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 21:12:30', '2020-12-24 21:12:30'),
(138, 95, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-24 21:12:30', '2020-12-24 21:12:30'),
(139, 96, 130, 130, '1.0000', '0.0000', '2.4700', '2.4700', NULL, '0.0000', '2.4700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-26 15:29:50', '2020-12-26 15:29:50'),
(140, 98, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-26 19:29:38', '2020-12-26 19:29:38'),
(141, 98, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-26 19:29:38', '2020-12-26 19:29:38'),
(142, 98, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-26 19:29:38', '2020-12-26 19:29:38'),
(143, 99, 130, 130, '3.0000', '0.0000', '2.4700', '2.4700', NULL, '0.0000', '2.4700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 11:32:46', '2020-12-27 11:32:46'),
(144, 100, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 11:47:34', '2020-12-27 11:47:34'),
(145, 100, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 11:47:34', '2020-12-27 11:47:34'),
(146, 101, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 11:49:45', '2020-12-27 11:49:45'),
(147, 102, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 12:48:09', '2020-12-27 12:48:09'),
(148, 103, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 12:49:39', '2020-12-27 12:49:39'),
(149, 103, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 12:49:39', '2020-12-27 12:49:39'),
(150, 103, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 12:49:39', '2020-12-27 12:49:39'),
(151, 104, 136, 2021, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 13:25:16', '2020-12-27 13:25:16'),
(152, 104, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 13:25:16', '2020-12-27 13:25:16'),
(153, 104, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 13:25:16', '2020-12-27 13:25:16'),
(154, 105, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 13:28:36', '2020-12-27 13:28:36'),
(155, 106, 2, 1887, '4.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 14:26:47', '2020-12-27 14:26:47'),
(156, 106, 6, 1891, '2.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 14:26:47', '2020-12-27 14:26:47'),
(157, 106, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-27 14:26:47', '2020-12-27 14:26:47'),
(158, 107, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 07:47:41', '2020-12-28 07:47:41'),
(159, 107, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 07:47:41', '2020-12-28 07:47:41'),
(160, 108, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 10:19:03', '2020-12-28 10:19:03'),
(161, 109, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 11:28:22', '2020-12-28 11:28:22'),
(162, 110, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 11:42:59', '2020-12-28 11:42:59'),
(163, 110, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 11:42:59', '2020-12-28 11:42:59'),
(164, 111, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 12:35:28', '2020-12-28 12:35:28'),
(165, 112, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 12:36:32', '2020-12-28 12:36:32'),
(166, 113, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 12:52:19', '2020-12-28 12:52:19'),
(167, 114, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 13:32:27', '2020-12-28 13:32:27'),
(168, 115, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 13:42:54', '2020-12-28 13:42:54'),
(169, 115, 97, 1982, '1.0000', '0.0000', '3.3000', '3.3000', 'fixed', '0.0000', '3.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 13:42:54', '2020-12-28 13:42:54'),
(170, 116, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 17:46:05', '2020-12-28 17:46:05'),
(171, 116, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 17:46:05', '2020-12-28 17:46:05'),
(172, 117, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 19:30:02', '2020-12-28 19:30:02'),
(173, 117, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 19:30:02', '2020-12-28 19:30:02'),
(174, 118, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 19:47:02', '2020-12-28 19:47:02'),
(175, 118, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 19:47:02', '2020-12-28 19:47:02'),
(176, 119, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 20:05:48', '2020-12-28 20:05:48'),
(177, 119, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 20:05:48', '2020-12-28 20:05:48'),
(178, 119, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-28 20:05:48', '2020-12-28 20:05:48'),
(179, 120, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 10:11:23', '2020-12-29 10:11:23'),
(180, 120, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 10:11:23', '2020-12-29 10:11:23'),
(181, 120, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 10:11:23', '2020-12-29 10:11:23'),
(182, 121, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 12:09:25', '2020-12-29 12:09:25'),
(183, 122, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 15:20:02', '2020-12-29 15:20:02'),
(184, 122, 36, 1921, '1.0000', '0.0000', '0.9500', '0.9500', 'fixed', '0.0000', '0.9500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 15:20:02', '2020-12-29 15:20:02'),
(185, 122, 49, 1934, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 15:20:02', '2020-12-29 15:20:02'),
(186, 123, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 15:21:00', '2020-12-29 15:21:00'),
(187, 124, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 15:57:35', '2020-12-29 15:57:35'),
(188, 125, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 18:13:34', '2020-12-29 18:13:34'),
(189, 126, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-29 19:25:49', '2020-12-29 19:25:49'),
(190, 127, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 07:26:27', '2020-12-30 07:26:27'),
(191, 128, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 10:58:41', '2020-12-30 10:58:41'),
(192, 129, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(193, 129, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(194, 129, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(195, 129, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(196, 129, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 11:56:38', '2020-12-30 11:56:38'),
(197, 130, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 12:00:51', '2020-12-30 12:00:51'),
(198, 131, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 12:27:49', '2020-12-30 12:27:49'),
(199, 131, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 12:27:49', '2020-12-30 12:27:49'),
(200, 131, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 12:27:49', '2020-12-30 12:27:49'),
(201, 132, 17, 1902, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 12:28:37', '2020-12-30 12:28:37'),
(202, 133, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 13:16:13', '2020-12-30 13:16:13'),
(203, 133, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 13:16:13', '2020-12-30 13:16:13'),
(204, 134, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 13:17:00', '2020-12-30 13:17:00'),
(205, 135, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 13:18:11', '2020-12-30 13:18:11'),
(206, 135, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 13:18:11', '2020-12-30 13:18:11'),
(207, 136, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 15:52:32', '2020-12-30 15:52:32'),
(208, 136, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 15:52:32', '2020-12-30 15:52:32'),
(209, 137, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 16:51:08', '2020-12-30 16:51:08'),
(210, 138, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 17:22:14', '2020-12-30 17:22:14'),
(211, 138, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 17:22:14', '2020-12-30 17:22:14'),
(212, 138, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 17:22:14', '2020-12-30 17:22:14'),
(213, 139, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 17:37:54', '2020-12-30 17:37:54'),
(214, 139, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 17:37:54', '2020-12-30 17:37:54'),
(215, 140, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-30 19:50:02', '2020-12-30 19:50:02'),
(216, 141, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 10:29:03', '2020-12-31 10:29:03'),
(217, 142, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 10:58:06', '2020-12-31 10:58:06'),
(218, 143, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 12:25:01', '2020-12-31 12:25:01'),
(219, 143, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 12:25:01', '2020-12-31 12:25:01'),
(220, 143, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 12:25:01', '2020-12-31 12:25:01'),
(221, 144, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 12:25:47', '2020-12-31 12:25:47'),
(222, 145, 20, 1905, '3.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 16:41:48', '2020-12-31 16:41:48'),
(223, 145, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-12-31 16:41:48', '2020-12-31 16:41:48'),
(228, 148, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-02 19:03:34', '2021-01-02 19:03:34'),
(229, 148, 40, 1925, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-02 19:03:34', '2021-01-02 19:03:34'),
(230, 148, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-02 19:03:34', '2021-01-02 19:03:34'),
(231, 148, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-02 19:03:34', '2021-01-02 19:03:34'),
(232, 149, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 12:37:05', '2021-01-03 12:37:05'),
(233, 149, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 12:37:05', '2021-01-03 12:37:05'),
(234, 150, 130, 130, '1.0000', '0.0000', '2.4700', '2.4700', NULL, '0.0000', '2.4700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 15:59:33', '2021-01-03 15:59:33'),
(235, 150, 1, 1886, '1.0000', '0.0000', '2.7500', '2.7500', NULL, '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 15:59:33', '2021-01-03 15:59:33'),
(236, 150, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', NULL, '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 15:59:33', '2021-01-03 15:59:33'),
(237, 150, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', NULL, '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 15:59:33', '2021-01-03 15:59:33'),
(238, 151, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 16:22:30', '2021-01-03 16:22:30'),
(239, 151, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 16:22:30', '2021-01-03 16:22:30'),
(240, 152, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 21:16:07', '2021-01-03 21:16:07'),
(241, 153, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-03 21:34:29', '2021-01-03 21:34:29'),
(242, 154, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 10:09:22', '2021-01-04 10:09:22'),
(243, 155, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 11:47:11', '2021-01-04 11:47:11'),
(244, 156, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 15:03:58', '2021-01-04 15:03:58'),
(245, 156, 46, 1931, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 15:03:58', '2021-01-04 15:03:58'),
(246, 156, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 15:03:58', '2021-01-04 15:03:58'),
(247, 157, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 15:44:48', '2021-01-04 15:44:48'),
(248, 158, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 16:06:58', '2021-01-04 16:06:58'),
(249, 159, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 17:06:57', '2021-01-04 17:06:57'),
(250, 160, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 20:48:09', '2021-01-04 20:48:09'),
(251, 160, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-04 20:48:09', '2021-01-04 20:48:09'),
(252, 161, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 09:14:45', '2021-01-05 09:14:45'),
(253, 162, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 09:51:46', '2021-01-05 09:51:46'),
(254, 163, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 11:49:43', '2021-01-05 11:49:43'),
(255, 164, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', NULL, '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 15:07:15', '2021-01-05 15:07:15'),
(256, 165, 85, 1970, '2.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 13:37:28', '2021-01-05 13:37:28'),
(257, 166, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 14:09:10', '2021-01-05 14:09:10'),
(258, 167, 126, 2011, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 16:12:56', '2021-01-05 16:12:56'),
(259, 168, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 16:46:04', '2021-01-05 16:46:04'),
(260, 168, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 16:46:04', '2021-01-05 16:46:04'),
(261, 169, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 18:50:20', '2021-01-05 18:50:20'),
(262, 170, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 19:01:57', '2021-01-05 19:01:57'),
(263, 170, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-05 19:01:57', '2021-01-05 19:01:57'),
(264, 171, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 07:43:46', '2021-01-06 07:43:46'),
(265, 171, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 07:43:46', '2021-01-06 07:43:46'),
(266, 172, 62, 1947, '4.0000', '0.0000', '1.8500', '1.8500', 'fixed', '0.0000', '1.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 11:12:50', '2021-01-06 11:12:50'),
(267, 172, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 11:12:50', '2021-01-06 11:12:50'),
(268, 173, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 11:31:31', '2021-01-06 11:31:31'),
(269, 174, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 12:19:12', '2021-01-06 12:19:12'),
(270, 175, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 13:44:21', '2021-01-06 13:44:21'),
(271, 175, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 13:44:21', '2021-01-06 13:44:21'),
(272, 175, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 13:44:21', '2021-01-06 13:44:21');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(273, 176, 2, 1887, '4.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 15:21:08', '2021-01-06 15:21:08'),
(274, 176, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 15:21:08', '2021-01-06 15:21:08'),
(275, 176, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 15:21:08', '2021-01-06 15:21:08'),
(276, 176, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 15:21:08', '2021-01-06 15:21:08'),
(277, 177, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 18:50:30', '2021-01-06 18:50:30'),
(278, 178, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 20:36:10', '2021-01-06 20:36:10'),
(279, 178, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 20:36:10', '2021-01-06 20:36:10'),
(280, 178, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 20:36:10', '2021-01-06 20:36:10'),
(281, 179, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 21:29:48', '2021-01-06 21:29:48'),
(282, 179, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 21:29:48', '2021-01-06 21:29:48'),
(283, 180, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-06 21:30:50', '2021-01-06 21:30:50'),
(284, 181, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 08:00:26', '2021-01-07 08:00:26'),
(285, 181, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 08:00:26', '2021-01-07 08:00:26'),
(286, 182, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 08:35:04', '2021-01-07 08:35:04'),
(287, 183, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 08:35:59', '2021-01-07 08:35:59'),
(288, 183, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 08:35:59', '2021-01-07 08:35:59'),
(289, 184, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 09:04:24', '2021-01-07 09:04:24'),
(290, 184, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 09:04:24', '2021-01-07 09:04:24'),
(291, 184, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 09:04:24', '2021-01-07 09:04:24'),
(292, 185, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 10:29:36', '2021-01-07 10:29:36'),
(294, 187, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 12:28:39', '2021-01-07 12:28:39'),
(295, 188, 32, 1917, '1.0000', '0.0000', '1.0000', '1.0000', NULL, '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 15:03:45', '2021-01-07 15:03:45'),
(296, 189, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 13:05:51', '2021-01-07 13:05:51'),
(297, 190, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 13:47:46', '2021-01-07 13:47:46'),
(298, 190, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 13:47:46', '2021-01-07 13:47:46'),
(299, 190, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 13:47:46', '2021-01-07 13:47:46'),
(300, 191, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 16:23:08', '2021-01-07 16:23:08'),
(301, 191, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-07 16:23:08', '2021-01-07 16:23:08'),
(302, 192, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 14:22:14', '2021-01-09 14:22:14'),
(303, 192, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 14:22:14', '2021-01-09 14:22:14'),
(304, 193, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 14:27:04', '2021-01-09 14:27:04'),
(305, 193, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 14:27:04', '2021-01-09 14:27:04'),
(306, 194, 36, 1921, '1.0000', '0.0000', '0.9500', '0.9500', 'fixed', '0.0000', '0.9500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 14:40:27', '2021-01-09 14:40:27'),
(307, 195, 141, 2026, '3.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 15:28:59', '2021-01-09 15:28:59'),
(308, 196, 130, 2015, '2.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 18:04:18', '2021-01-09 18:04:18'),
(309, 196, 29, 1914, '2.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 18:04:18', '2021-01-09 18:04:18'),
(310, 196, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 18:04:18', '2021-01-09 18:04:18'),
(311, 196, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-09 18:04:18', '2021-01-09 18:04:18'),
(312, 197, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 11:15:16', '2021-01-10 11:15:16'),
(313, 198, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 12:39:31', '2021-01-10 12:39:31'),
(314, 198, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 12:39:31', '2021-01-10 12:39:31'),
(315, 198, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 12:39:31', '2021-01-10 12:39:31'),
(316, 199, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 13:02:53', '2021-01-10 13:02:53'),
(317, 200, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 13:26:50', '2021-01-10 13:26:50'),
(318, 201, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(319, 201, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(320, 201, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(321, 201, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(322, 201, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(323, 201, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 15:50:09', '2021-01-10 15:50:09'),
(324, 202, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 16:03:14', '2021-01-10 16:03:14'),
(325, 203, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 17:01:41', '2021-01-10 17:01:41'),
(326, 203, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 17:01:41', '2021-01-10 17:01:41'),
(327, 203, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 17:01:41', '2021-01-10 17:01:41'),
(328, 203, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 17:01:41', '2021-01-10 17:01:41'),
(329, 204, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 18:29:22', '2021-01-10 18:29:22'),
(330, 205, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 20:08:58', '2021-01-10 20:08:58'),
(331, 205, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-10 20:08:58', '2021-01-10 20:08:58'),
(332, 206, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 13:57:37', '2021-01-11 13:57:37'),
(333, 206, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 13:57:37', '2021-01-11 13:57:37'),
(334, 207, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 15:42:59', '2021-01-11 15:42:59'),
(335, 208, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 16:49:23', '2021-01-11 16:49:23'),
(336, 208, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 16:49:23', '2021-01-11 16:49:23'),
(337, 209, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 19:18:38', '2021-01-11 19:18:38'),
(338, 209, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 19:18:38', '2021-01-11 19:18:38'),
(339, 210, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-11 19:19:21', '2021-01-11 19:19:21'),
(340, 211, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 07:53:08', '2021-01-12 07:53:08'),
(341, 211, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 07:53:08', '2021-01-12 07:53:08'),
(342, 212, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 08:08:49', '2021-01-12 08:08:49'),
(343, 212, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 08:08:49', '2021-01-12 08:08:49'),
(344, 213, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 08:19:39', '2021-01-12 08:19:39'),
(345, 214, 96, 1981, '1.0000', '0.0000', '3.2000', '3.2000', 'fixed', '0.0000', '3.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 11:55:33', '2021-01-12 11:55:33'),
(346, 215, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 11:59:05', '2021-01-12 11:59:05'),
(347, 216, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 15:12:35', '2021-01-12 15:12:35'),
(348, 217, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 19:48:30', '2021-01-12 19:48:30'),
(349, 218, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-12 20:42:33', '2021-01-12 20:42:33'),
(350, 219, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 08:24:52', '2021-01-13 08:24:52'),
(351, 220, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 12:14:11', '2021-01-13 12:14:11'),
(352, 220, 36, 1921, '1.0000', '0.0000', '0.9500', '0.9500', 'fixed', '0.0000', '0.9500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 12:14:11', '2021-01-13 12:14:11'),
(353, 221, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 12:15:08', '2021-01-13 12:15:08'),
(354, 222, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 12:24:46', '2021-01-13 12:24:46'),
(355, 223, 92, 1977, '2.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 14:32:27', '2021-01-13 14:32:27'),
(356, 224, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 16:55:21', '2021-01-13 16:55:21'),
(357, 224, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 16:55:21', '2021-01-13 16:55:21'),
(358, 224, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 16:55:21', '2021-01-13 16:55:21'),
(359, 224, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 16:55:21', '2021-01-13 16:55:21'),
(360, 225, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 17:56:21', '2021-01-13 17:56:21'),
(361, 226, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 20:05:54', '2021-01-13 20:05:54'),
(362, 226, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 20:05:54', '2021-01-13 20:05:54'),
(363, 227, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-13 20:16:18', '2021-01-13 20:16:18'),
(364, 228, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 10:32:18', '2021-01-14 10:32:18'),
(365, 229, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 12:30:53', '2021-01-14 12:30:53'),
(366, 230, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 15:47:59', '2021-01-14 15:47:59'),
(367, 230, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 15:47:59', '2021-01-14 15:47:59'),
(368, 231, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 18:27:50', '2021-01-14 18:27:50'),
(369, 231, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 18:27:50', '2021-01-14 18:27:50'),
(370, 232, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 18:48:01', '2021-01-14 18:48:01'),
(371, 233, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 20:20:15', '2021-01-14 20:20:15'),
(372, 234, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-14 20:55:01', '2021-01-14 20:55:01'),
(373, 235, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 13:50:21', '2021-01-16 13:50:21'),
(374, 235, 48, 1933, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 13:50:21', '2021-01-16 13:50:21'),
(375, 235, 42, 1927, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 13:50:21', '2021-01-16 13:50:21'),
(376, 235, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 13:50:21', '2021-01-16 13:50:21'),
(377, 236, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 15:07:18', '2021-01-16 15:07:18'),
(378, 236, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 15:07:18', '2021-01-16 15:07:18'),
(379, 237, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 16:55:51', '2021-01-16 16:55:51'),
(380, 238, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-16 19:24:05', '2021-01-16 19:24:05'),
(381, 239, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 08:57:02', '2021-01-17 08:57:02'),
(382, 240, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 11:55:25', '2021-01-17 11:55:25'),
(383, 241, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 12:18:06', '2021-01-17 12:18:06'),
(384, 242, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 12:32:39', '2021-01-17 12:32:39'),
(385, 243, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 12:52:51', '2021-01-17 12:52:51'),
(386, 244, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 15:03:10', '2021-01-17 15:03:10'),
(387, 245, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 17:22:44', '2021-01-17 17:22:44'),
(388, 246, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 17:48:58', '2021-01-17 17:48:58'),
(389, 246, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-17 17:48:58', '2021-01-17 17:48:58'),
(390, 247, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 13:44:09', '2021-01-18 13:44:09'),
(391, 247, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 13:44:09', '2021-01-18 13:44:09'),
(392, 248, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 15:36:27', '2021-01-18 15:36:27'),
(393, 248, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 15:36:27', '2021-01-18 15:36:27'),
(394, 249, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 19:05:37', '2021-01-18 19:05:37'),
(395, 250, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 19:10:51', '2021-01-18 19:10:51'),
(396, 251, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-18 20:45:30', '2021-01-18 20:45:30'),
(397, 252, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 09:09:41', '2021-01-19 09:09:41'),
(398, 253, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 13:21:03', '2021-01-19 13:21:03'),
(399, 254, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 14:19:45', '2021-01-19 14:19:45'),
(400, 255, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 14:46:33', '2021-01-19 14:46:33'),
(401, 256, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 15:31:32', '2021-01-19 15:31:32'),
(402, 256, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 15:31:32', '2021-01-19 15:31:32'),
(403, 257, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 18:24:42', '2021-01-19 18:24:42'),
(404, 258, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 19:22:10', '2021-01-19 19:22:10'),
(405, 259, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 19:23:21', '2021-01-19 19:23:21'),
(406, 259, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-19 19:23:21', '2021-01-19 19:23:21'),
(407, 260, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 08:46:06', '2021-01-20 08:46:06'),
(408, 260, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 08:46:06', '2021-01-20 08:46:06'),
(409, 261, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 11:41:04', '2021-01-20 11:41:04'),
(410, 262, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 13:00:19', '2021-01-20 13:00:19'),
(411, 262, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 13:00:19', '2021-01-20 13:00:19'),
(412, 263, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 15:01:54', '2021-01-20 15:01:54'),
(413, 263, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 15:01:54', '2021-01-20 15:01:54'),
(414, 264, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 15:36:19', '2021-01-20 15:36:19'),
(415, 264, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 15:36:19', '2021-01-20 15:36:19'),
(416, 265, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 17:07:29', '2021-01-20 17:07:29'),
(417, 266, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 20:19:45', '2021-01-20 20:19:45'),
(418, 266, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 20:19:45', '2021-01-20 20:19:45'),
(419, 266, 42, 1927, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-20 20:19:45', '2021-01-20 20:19:45'),
(420, 267, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 07:51:02', '2021-01-21 07:51:02'),
(421, 267, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 07:51:02', '2021-01-21 07:51:02'),
(422, 267, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 07:51:02', '2021-01-21 07:51:02'),
(423, 268, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 13:09:50', '2021-01-21 13:09:50'),
(424, 268, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 13:09:50', '2021-01-21 13:09:50'),
(425, 269, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 13:17:21', '2021-01-21 13:17:21'),
(426, 269, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 13:17:21', '2021-01-21 13:17:21'),
(427, 270, 103, 1988, '1.0000', '0.0000', '5.0000', '5.0000', 'fixed', '0.0000', '5.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 15:19:59', '2021-01-21 15:19:59'),
(428, 270, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 15:19:59', '2021-01-21 15:19:59'),
(429, 271, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 15:36:48', '2021-01-21 15:36:48'),
(430, 271, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 15:36:48', '2021-01-21 15:36:48'),
(431, 272, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 16:40:59', '2021-01-21 16:40:59'),
(432, 273, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 16:42:08', '2021-01-21 16:42:08'),
(433, 274, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-21 16:44:15', '2021-01-21 16:44:15'),
(434, 275, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-23 15:57:02', '2021-01-23 15:57:02'),
(435, 275, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-23 15:57:02', '2021-01-23 15:57:02'),
(436, 276, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-23 18:17:08', '2021-01-23 18:17:08'),
(437, 277, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 07:51:05', '2021-01-24 07:51:05'),
(438, 277, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 07:51:05', '2021-01-24 07:51:05'),
(439, 278, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 08:58:09', '2021-01-24 08:58:09'),
(440, 279, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 13:38:49', '2021-01-24 13:38:49'),
(441, 280, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 15:33:34', '2021-01-24 15:33:34'),
(442, 280, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 15:33:34', '2021-01-24 15:33:34'),
(443, 280, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 15:33:34', '2021-01-24 15:33:34'),
(444, 281, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 21:22:24', '2021-01-24 21:22:24'),
(445, 281, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 21:22:24', '2021-01-24 21:22:24'),
(446, 281, 48, 1933, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-24 21:22:24', '2021-01-24 21:22:24'),
(447, 282, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 11:26:37', '2021-01-25 11:26:37'),
(448, 283, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 12:03:06', '2021-01-25 12:03:06'),
(449, 284, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 12:03:49', '2021-01-25 12:03:49'),
(450, 284, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 12:03:49', '2021-01-25 12:03:49'),
(451, 285, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 13:11:27', '2021-01-25 13:11:27'),
(452, 285, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 13:11:27', '2021-01-25 13:11:27'),
(453, 286, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 13:12:09', '2021-01-25 13:12:09'),
(454, 287, 134, 2019, '1.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 14:18:21', '2021-01-25 14:18:21'),
(455, 288, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 16:22:57', '2021-01-25 16:22:57'),
(456, 289, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 17:10:51', '2021-01-25 17:10:51'),
(457, 290, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 20:25:45', '2021-01-25 20:25:45'),
(458, 290, 134, 2019, '1.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 20:25:45', '2021-01-25 20:25:45'),
(459, 290, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 20:25:45', '2021-01-25 20:25:45'),
(460, 291, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-25 21:27:21', '2021-01-25 21:27:21'),
(461, 292, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-26 12:13:07', '2021-01-26 12:13:07'),
(462, 293, 97, 1982, '1.0000', '0.0000', '3.3000', '3.3000', 'fixed', '0.0000', '3.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-26 14:05:21', '2021-01-26 14:05:21'),
(463, 294, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-26 14:47:47', '2021-01-26 14:47:47'),
(464, 295, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-26 21:31:48', '2021-01-26 21:31:48'),
(465, 296, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 08:59:12', '2021-01-27 08:59:12'),
(466, 297, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 10:37:09', '2021-01-27 10:37:09'),
(467, 297, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 10:37:09', '2021-01-27 10:37:09'),
(468, 298, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 11:08:12', '2021-01-27 11:08:12'),
(469, 299, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 12:08:20', '2021-01-27 12:08:20'),
(470, 300, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 12:10:22', '2021-01-27 12:10:22'),
(471, 300, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 12:10:22', '2021-01-27 12:10:22'),
(472, 301, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 13:33:18', '2021-01-27 13:33:18'),
(473, 301, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 13:33:18', '2021-01-27 13:33:18'),
(474, 302, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 20:17:40', '2021-01-27 20:17:40'),
(475, 302, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 20:17:40', '2021-01-27 20:17:40'),
(476, 302, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-27 20:17:40', '2021-01-27 20:17:40'),
(477, 303, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 12:53:21', '2021-01-28 12:53:21'),
(478, 304, 19, 1904, '5.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 16:57:04', '2021-01-28 16:57:04'),
(479, 304, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 16:57:04', '2021-01-28 16:57:04'),
(480, 305, 149, 2034, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 17:42:19', '2021-01-28 17:42:19'),
(481, 305, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 17:42:19', '2021-01-28 17:42:19'),
(482, 306, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 19:07:32', '2021-01-28 19:07:32'),
(483, 306, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 19:07:32', '2021-01-28 19:07:32'),
(484, 306, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 19:07:32', '2021-01-28 19:07:32'),
(485, 306, 91, 1976, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-28 19:07:32', '2021-01-28 19:07:32'),
(486, 307, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-30 18:58:51', '2021-01-30 18:58:51'),
(487, 307, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-30 18:58:51', '2021-01-30 18:58:51'),
(488, 308, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-31 12:06:21', '2021-01-31 12:06:21'),
(489, 308, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-31 12:06:21', '2021-01-31 12:06:21'),
(490, 309, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-31 12:41:12', '2021-01-31 12:41:12'),
(491, 310, 19, 1904, '4.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-01-31 17:37:32', '2021-01-31 17:37:32'),
(492, 311, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 07:34:54', '2021-02-01 07:34:54'),
(493, 311, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 07:34:54', '2021-02-01 07:34:54'),
(494, 311, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 07:34:54', '2021-02-01 07:34:54'),
(495, 312, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 09:01:49', '2021-02-01 09:01:49'),
(496, 313, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 09:54:15', '2021-02-01 09:54:15'),
(497, 313, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 09:54:15', '2021-02-01 09:54:15'),
(498, 314, 61, 1946, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 10:45:25', '2021-02-01 10:45:25'),
(499, 314, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 10:45:25', '2021-02-01 10:45:25'),
(500, 315, 64, 1949, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 11:27:57', '2021-02-01 11:27:57'),
(501, 315, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 11:27:57', '2021-02-01 11:27:57'),
(502, 315, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 11:27:57', '2021-02-01 11:27:57'),
(503, 316, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 12:49:36', '2021-02-01 12:49:36'),
(504, 316, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 12:49:36', '2021-02-01 12:49:36'),
(505, 317, 29, 1914, '2.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 17:59:59', '2021-02-01 17:59:59'),
(506, 317, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 17:59:59', '2021-02-01 17:59:59'),
(507, 317, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-01 17:59:59', '2021-02-01 17:59:59'),
(508, 318, 64, 1949, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 09:29:26', '2021-02-02 09:29:26'),
(509, 318, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 09:29:26', '2021-02-02 09:29:26'),
(510, 318, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 09:29:26', '2021-02-02 09:29:26'),
(511, 318, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 09:29:26', '2021-02-02 09:29:26'),
(512, 319, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 11:24:18', '2021-02-02 11:24:18'),
(513, 320, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 12:37:14', '2021-02-02 12:37:14'),
(514, 321, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-02 20:49:32', '2021-02-02 20:49:32'),
(515, 322, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 06:49:40', '2021-02-03 06:49:40'),
(516, 322, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 06:49:40', '2021-02-03 06:49:40'),
(517, 322, 39, 1924, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 06:49:40', '2021-02-03 06:49:40'),
(518, 323, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 10:03:32', '2021-02-03 10:03:32'),
(519, 324, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(520, 324, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(521, 324, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(522, 324, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(523, 324, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(524, 324, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 12:11:14', '2021-02-03 12:11:14'),
(525, 325, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 13:25:26', '2021-02-03 13:25:26'),
(526, 326, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 13:47:36', '2021-02-03 13:47:36');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(527, 327, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 15:32:05', '2021-02-03 15:32:05'),
(528, 328, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 15:57:21', '2021-02-03 15:57:21'),
(529, 328, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 15:57:21', '2021-02-03 15:57:21'),
(530, 328, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 15:57:21', '2021-02-03 15:57:21'),
(531, 329, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 16:45:24', '2021-02-03 16:45:24'),
(532, 329, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 16:45:24', '2021-02-03 16:45:24'),
(533, 330, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 21:38:57', '2021-02-03 21:38:57'),
(534, 330, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-03 21:38:57', '2021-02-03 21:38:57'),
(535, 331, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 14:32:04', '2021-02-04 14:32:04'),
(536, 332, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 16:12:58', '2021-02-04 16:12:58'),
(537, 332, 48, 1933, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 16:12:58', '2021-02-04 16:12:58'),
(538, 333, 88, 1973, '1.0000', '0.0000', '4.0000', '4.0000', 'fixed', '0.0000', '4.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(539, 333, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(540, 333, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(541, 333, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(542, 333, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(543, 333, 38, 1923, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 18:37:48', '2021-02-04 18:37:48'),
(544, 334, 7, 1892, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 19:15:27', '2021-02-04 19:15:27'),
(545, 334, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 19:15:27', '2021-02-04 19:15:27'),
(546, 335, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 21:17:14', '2021-02-04 21:17:14'),
(547, 335, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-04 21:17:14', '2021-02-04 21:17:14'),
(548, 336, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-06 15:01:55', '2021-02-06 15:01:55'),
(549, 337, 89, 1974, '1.0000', '0.0000', '3.1000', '3.1000', 'fixed', '0.0000', '3.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-06 18:51:17', '2021-02-06 18:51:17'),
(550, 337, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-06 18:51:17', '2021-02-06 18:51:17'),
(551, 338, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-07 11:22:47', '2021-02-07 11:22:47'),
(552, 339, 105, 1990, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-07 12:06:12', '2021-02-07 12:06:12'),
(553, 340, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-07 15:22:27', '2021-02-07 15:22:27'),
(554, 341, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-07 18:09:31', '2021-02-07 18:09:31'),
(555, 341, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-07 18:09:31', '2021-02-07 18:09:31'),
(556, 342, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-08 14:58:37', '2021-02-08 14:58:37'),
(557, 343, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 11:04:23', '2021-02-09 11:04:23'),
(558, 343, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 11:04:23', '2021-02-09 11:04:23'),
(559, 344, 9, 1894, '2.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 12:03:06', '2021-02-09 12:03:06'),
(560, 344, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 12:03:06', '2021-02-09 12:03:06'),
(561, 345, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 13:15:46', '2021-02-09 13:15:46'),
(562, 346, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 13:16:27', '2021-02-09 13:16:27'),
(563, 347, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 14:02:46', '2021-02-09 14:02:46'),
(564, 347, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 14:02:46', '2021-02-09 14:02:46'),
(565, 347, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 14:02:46', '2021-02-09 14:02:46'),
(566, 348, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 14:29:09', '2021-02-09 14:29:09'),
(567, 349, 102, 1987, '1.0000', '0.0000', '5.9000', '5.9000', 'fixed', '0.0000', '5.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 17:50:30', '2021-02-09 17:50:30'),
(568, 349, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 17:50:30', '2021-02-09 17:50:30'),
(569, 349, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 17:50:30', '2021-02-09 17:50:30'),
(570, 350, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 17:59:34', '2021-02-09 17:59:34'),
(571, 350, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 17:59:34', '2021-02-09 17:59:34'),
(572, 351, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 19:59:56', '2021-02-09 19:59:56'),
(573, 351, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-09 19:59:56', '2021-02-09 19:59:56'),
(574, 352, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 09:51:10', '2021-02-10 09:51:10'),
(575, 353, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 15:49:15', '2021-02-10 15:49:15'),
(576, 353, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 15:49:15', '2021-02-10 15:49:15'),
(577, 353, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 15:49:15', '2021-02-10 15:49:15'),
(578, 354, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 17:07:33', '2021-02-10 17:07:33'),
(579, 355, 137, 2022, '2.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 17:18:37', '2021-02-10 17:18:37'),
(580, 356, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 18:58:00', '2021-02-10 18:58:00'),
(581, 357, 99, 1984, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 19:18:31', '2021-02-10 19:18:31'),
(582, 357, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 19:18:31', '2021-02-10 19:18:31'),
(583, 357, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-10 19:18:31', '2021-02-10 19:18:31'),
(584, 358, 36, 1921, '1.0000', '0.0000', '0.9500', '0.9500', 'fixed', '0.0000', '0.9500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 10:56:20', '2021-02-11 10:56:20'),
(585, 359, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 11:17:25', '2021-02-11 11:17:25'),
(586, 359, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 11:17:25', '2021-02-11 11:17:25'),
(587, 359, 39, 1924, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 11:17:25', '2021-02-11 11:17:25'),
(588, 360, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 12:36:23', '2021-02-11 12:36:23'),
(589, 361, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 14:02:05', '2021-02-11 14:02:05'),
(590, 362, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 15:03:05', '2021-02-11 15:03:05'),
(591, 362, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 15:03:05', '2021-02-11 15:03:05'),
(592, 363, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-11 20:35:20', '2021-02-11 20:35:20'),
(593, 364, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-13 14:06:50', '2021-02-13 14:06:50'),
(594, 364, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-13 14:06:50', '2021-02-13 14:06:50'),
(595, 365, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-13 16:36:59', '2021-02-13 16:36:59'),
(596, 366, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-13 16:55:42', '2021-02-13 16:55:42'),
(597, 366, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-13 16:55:42', '2021-02-13 16:55:42'),
(598, 367, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 15:53:46', '2021-02-14 15:53:46'),
(599, 367, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 15:53:46', '2021-02-14 15:53:46'),
(600, 368, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 17:28:21', '2021-02-14 17:28:21'),
(601, 368, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 17:28:21', '2021-02-14 17:28:21'),
(602, 368, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 17:28:21', '2021-02-14 17:28:21'),
(603, 369, 47, 1932, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-14 18:45:50', '2021-02-14 18:45:50'),
(604, 370, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 09:43:01', '2021-02-15 09:43:01'),
(605, 371, 2, 1887, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 16:35:09', '2021-02-15 16:35:09'),
(606, 371, 15, 1900, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 16:35:09', '2021-02-15 16:35:09'),
(607, 371, 39, 1924, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 16:35:09', '2021-02-15 16:35:09'),
(608, 372, 141, 2026, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 17:33:16', '2021-02-15 17:33:16'),
(609, 373, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-15 18:33:29', '2021-02-15 18:33:29'),
(610, 374, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 12:04:14', '2021-02-16 12:04:14'),
(611, 375, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(612, 375, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(613, 375, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(614, 375, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(615, 375, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(616, 375, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 13:41:43', '2021-02-16 13:41:43'),
(617, 376, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 19:23:36', '2021-02-16 19:23:36'),
(618, 376, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 19:23:36', '2021-02-16 19:23:36'),
(619, 377, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 21:38:24', '2021-02-16 21:38:24'),
(620, 377, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-16 21:38:24', '2021-02-16 21:38:24'),
(621, 378, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-17 15:45:18', '2021-02-17 15:45:18'),
(622, 379, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 12:51:20', '2021-02-18 12:51:20'),
(623, 380, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 12:52:17', '2021-02-18 12:52:17'),
(624, 381, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 13:55:21', '2021-02-18 13:55:21'),
(625, 382, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 14:09:27', '2021-02-18 14:09:27'),
(626, 382, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 14:09:27', '2021-02-18 14:09:27'),
(627, 383, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 14:48:21', '2021-02-18 14:48:21'),
(628, 384, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-18 16:21:12', '2021-02-18 16:21:12'),
(629, 385, 91, 1976, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-20 16:46:43', '2021-02-20 16:46:43'),
(630, 386, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-20 17:17:06', '2021-02-20 17:17:06'),
(631, 386, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-20 17:17:06', '2021-02-20 17:17:06'),
(632, 387, 97, 1982, '1.0000', '0.0000', '3.3000', '3.3000', 'fixed', '0.0000', '3.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-20 17:27:23', '2021-02-20 17:27:23'),
(633, 387, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-20 17:27:23', '2021-02-20 17:27:23'),
(634, 388, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-21 09:17:14', '2021-02-21 09:17:14'),
(635, 389, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-21 12:41:15', '2021-02-21 12:41:15'),
(636, 390, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-21 15:16:12', '2021-02-21 15:16:12'),
(637, 391, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-21 15:59:21', '2021-02-21 15:59:21'),
(638, 391, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-21 15:59:21', '2021-02-21 15:59:21'),
(639, 392, 64, 1949, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 13:42:55', '2021-02-22 13:42:55'),
(640, 392, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 13:42:55', '2021-02-22 13:42:55'),
(641, 392, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 13:42:55', '2021-02-22 13:42:55'),
(642, 393, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 14:58:20', '2021-02-22 14:58:20'),
(643, 394, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 17:40:26', '2021-02-22 17:40:26'),
(644, 394, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-22 17:40:26', '2021-02-22 17:40:26'),
(645, 395, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-23 15:30:21', '2021-02-23 15:30:21'),
(646, 395, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-23 15:30:21', '2021-02-23 15:30:21'),
(647, 396, 125, 2010, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 16:21:22', '2021-02-24 16:21:22'),
(648, 396, 2, 1887, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 16:21:22', '2021-02-24 16:21:22'),
(649, 396, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 16:21:22', '2021-02-24 16:21:22'),
(650, 396, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 16:21:22', '2021-02-24 16:21:22'),
(651, 397, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 18:13:15', '2021-02-24 18:13:15'),
(652, 397, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 18:13:15', '2021-02-24 18:13:15'),
(653, 398, 20, 1905, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 18:30:21', '2021-02-24 18:30:21'),
(654, 398, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 18:30:21', '2021-02-24 18:30:21'),
(655, 398, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-24 18:30:21', '2021-02-24 18:30:21'),
(656, 399, 132, 2017, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-25 20:26:08', '2021-02-25 20:26:08'),
(657, 399, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-25 20:26:08', '2021-02-25 20:26:08'),
(658, 399, 91, 1976, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-25 20:26:08', '2021-02-25 20:26:08'),
(659, 399, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-25 20:26:08', '2021-02-25 20:26:08'),
(660, 400, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-27 18:38:37', '2021-02-27 18:38:37'),
(661, 400, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-27 18:38:37', '2021-02-27 18:38:37'),
(662, 400, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-27 18:38:37', '2021-02-27 18:38:37'),
(663, 400, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-27 18:38:37', '2021-02-27 18:38:37'),
(664, 401, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-02-28 19:18:16', '2021-02-28 19:18:16'),
(665, 402, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 11:25:23', '2021-03-01 11:25:23'),
(666, 402, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 11:25:23', '2021-03-01 11:25:23'),
(667, 402, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 11:25:23', '2021-03-01 11:25:23'),
(668, 402, 12, 1897, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 11:25:23', '2021-03-01 11:25:23'),
(669, 403, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 13:59:42', '2021-03-01 13:59:42'),
(670, 404, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 15:22:33', '2021-03-01 15:22:33'),
(671, 404, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 15:22:33', '2021-03-01 15:22:33'),
(672, 405, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 15:24:01', '2021-03-01 15:24:01'),
(673, 406, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 15:33:51', '2021-03-01 15:33:51'),
(674, 407, 85, 1970, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 16:26:54', '2021-03-01 16:26:54'),
(675, 408, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(676, 408, 149, 2034, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(677, 408, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(678, 408, 141, 2026, '4.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(679, 408, 42, 1927, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:47:11', '2021-03-01 17:47:11'),
(680, 409, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:53:00', '2021-03-01 17:53:00'),
(681, 409, 36, 1921, '1.0000', '0.0000', '0.9500', '0.9500', 'fixed', '0.0000', '0.9500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:53:00', '2021-03-01 17:53:00'),
(682, 409, 99, 1984, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:53:00', '2021-03-01 17:53:00'),
(683, 409, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 17:53:00', '2021-03-01 17:53:00'),
(684, 410, 99, 1984, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 18:39:12', '2021-03-01 18:39:12'),
(685, 410, 148, 2033, '2.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 18:39:12', '2021-03-01 18:39:12'),
(686, 411, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 20:50:14', '2021-03-01 20:50:14'),
(687, 411, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 20:50:14', '2021-03-01 20:50:14'),
(688, 411, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-01 20:50:14', '2021-03-01 20:50:14'),
(689, 412, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 10:11:34', '2021-03-02 10:11:34'),
(690, 413, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 11:03:22', '2021-03-02 11:03:22'),
(691, 413, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 11:03:22', '2021-03-02 11:03:22'),
(692, 414, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 12:33:46', '2021-03-02 12:33:46'),
(693, 415, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:05:25', '2021-03-02 14:05:25'),
(694, 415, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:05:25', '2021-03-02 14:05:25'),
(695, 415, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:05:25', '2021-03-02 14:05:25'),
(696, 415, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:05:25', '2021-03-02 14:05:25'),
(697, 416, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:06:24', '2021-03-02 14:06:24'),
(698, 417, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:23:29', '2021-03-02 14:23:29'),
(699, 418, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 14:38:41', '2021-03-02 14:38:41'),
(700, 419, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-02 16:45:54', '2021-03-02 16:45:54'),
(701, 420, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-03 12:04:49', '2021-03-03 12:04:49'),
(702, 420, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-03 12:04:49', '2021-03-03 12:04:49'),
(703, 420, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-03 12:04:49', '2021-03-03 12:04:49'),
(704, 421, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-03 14:31:24', '2021-03-03 14:31:24'),
(705, 422, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-03 17:08:54', '2021-03-03 17:08:54'),
(706, 423, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-04 11:13:45', '2021-03-04 11:13:45'),
(707, 424, 86, 1971, '1.0000', '0.0000', '4.0000', '4.0000', 'fixed', '0.0000', '4.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-04 15:35:30', '2021-03-04 15:35:30'),
(708, 425, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-04 15:52:26', '2021-03-04 15:52:26'),
(709, 426, 46, 1931, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-04 16:37:18', '2021-03-04 16:37:18'),
(710, 427, 62, 1947, '1.0000', '0.0000', '1.8500', '1.8500', 'fixed', '0.0000', '1.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 12:04:13', '2021-03-06 12:04:13'),
(711, 428, 91, 1976, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 17:02:53', '2021-03-06 17:02:53'),
(712, 429, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 17:28:39', '2021-03-06 17:28:39'),
(713, 429, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 17:28:39', '2021-03-06 17:28:39'),
(714, 429, 127, 2012, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 17:28:39', '2021-03-06 17:28:39'),
(715, 430, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-06 17:32:05', '2021-03-06 17:32:05'),
(716, 431, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 09:59:00', '2021-03-07 09:59:00'),
(717, 432, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 12:14:59', '2021-03-07 12:14:59'),
(718, 433, 134, 2019, '1.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(719, 433, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(720, 433, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(721, 433, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(722, 433, 32, 1917, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:08:01', '2021-03-07 13:08:01'),
(723, 434, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:15:51', '2021-03-07 13:15:51'),
(724, 434, 15, 1900, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 13:15:51', '2021-03-07 13:15:51'),
(725, 435, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-07 14:25:44', '2021-03-07 14:25:44'),
(726, 436, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 09:12:51', '2021-03-08 09:12:51'),
(727, 437, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 10:48:26', '2021-03-08 10:48:26'),
(728, 437, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 10:48:26', '2021-03-08 10:48:26'),
(729, 437, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 10:48:26', '2021-03-08 10:48:26'),
(730, 438, 62, 1947, '1.0000', '0.0000', '1.8500', '1.8500', 'fixed', '0.0000', '1.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 11:44:23', '2021-03-08 11:44:23'),
(731, 439, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-08 13:03:26', '2021-03-08 13:03:26'),
(732, 440, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 06:54:14', '2021-03-09 06:54:14'),
(733, 441, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 12:31:32', '2021-03-09 12:31:32'),
(734, 441, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 12:31:32', '2021-03-09 12:31:32'),
(735, 442, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 12:50:54', '2021-03-09 12:50:54'),
(736, 442, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 12:50:54', '2021-03-09 12:50:54'),
(737, 442, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 12:50:54', '2021-03-09 12:50:54'),
(738, 443, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 13:14:18', '2021-03-09 13:14:18'),
(739, 443, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-09 13:14:18', '2021-03-09 13:14:18'),
(740, 444, 168, 2053, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(741, 444, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(742, 444, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(743, 444, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(744, 444, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-10 13:22:26', '2021-03-10 13:22:26'),
(745, 445, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-11 13:51:01', '2021-03-11 13:51:01'),
(746, 445, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-11 13:51:01', '2021-03-11 13:51:01'),
(747, 446, 11, 1896, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 10:39:58', '2021-03-13 10:39:58'),
(748, 447, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 12:03:30', '2021-03-13 12:03:30'),
(749, 447, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 12:03:30', '2021-03-13 12:03:30'),
(750, 447, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 12:03:30', '2021-03-13 12:03:30'),
(751, 448, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 13:27:19', '2021-03-13 13:27:19'),
(752, 448, 141, 2026, '2.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-13 13:27:19', '2021-03-13 13:27:19'),
(753, 449, 42, 1927, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-14 08:46:15', '2021-03-14 08:46:15'),
(754, 450, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 12:04:08', '2021-03-15 12:04:08'),
(755, 451, 93, 1978, '2.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 12:48:01', '2021-03-15 12:48:01'),
(756, 451, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 12:48:01', '2021-03-15 12:48:01'),
(757, 451, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 12:48:01', '2021-03-15 12:48:01'),
(758, 451, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 12:48:01', '2021-03-15 12:48:01'),
(759, 452, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(760, 452, 134, 2019, '2.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(761, 452, 96, 1981, '1.0000', '0.0000', '3.2000', '3.2000', 'fixed', '0.0000', '3.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(762, 452, 94, 1979, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(763, 452, 149, 2034, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(764, 452, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(765, 452, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(766, 452, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:02:48', '2021-03-15 13:02:48'),
(767, 453, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-15 13:18:07', '2021-03-15 13:18:07'),
(768, 454, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 06:43:29', '2021-03-16 06:43:29'),
(769, 455, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 08:04:44', '2021-03-16 08:04:44'),
(770, 456, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 09:13:21', '2021-03-16 09:13:21'),
(771, 456, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 09:13:21', '2021-03-16 09:13:21'),
(772, 457, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 09:14:07', '2021-03-16 09:14:07'),
(773, 458, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 11:24:06', '2021-03-16 11:24:06'),
(774, 459, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 12:41:34', '2021-03-16 12:41:34'),
(775, 460, 168, 2053, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 13:54:11', '2021-03-16 13:54:11'),
(776, 460, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 13:54:11', '2021-03-16 13:54:11'),
(777, 460, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-16 13:54:11', '2021-03-16 13:54:11'),
(778, 461, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 10:03:37', '2021-03-17 10:03:37'),
(779, 461, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 10:03:37', '2021-03-17 10:03:37');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(780, 462, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 11:04:50', '2021-03-17 11:04:50'),
(781, 462, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 11:04:50', '2021-03-17 11:04:50'),
(782, 463, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 11:51:12', '2021-03-17 11:51:12'),
(783, 464, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(784, 464, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(785, 464, 52, 1937, '1.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(786, 464, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(787, 464, 33, 1918, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 12:29:30', '2021-03-17 12:29:30'),
(788, 465, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 13:35:09', '2021-03-17 13:35:09'),
(789, 465, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 13:35:09', '2021-03-17 13:35:09'),
(790, 465, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-17 13:35:09', '2021-03-17 13:35:09'),
(791, 466, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-18 08:23:43', '2021-03-18 08:23:43'),
(792, 467, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-20 13:50:54', '2021-03-20 13:50:54'),
(793, 467, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-20 13:50:54', '2021-03-20 13:50:54'),
(794, 468, 93, 1978, '2.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-21 06:47:34', '2021-03-21 06:47:34'),
(795, 469, 164, 2049, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-21 07:21:30', '2021-03-21 07:21:30'),
(796, 470, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-21 12:03:16', '2021-03-21 12:03:16'),
(797, 471, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-21 14:13:35', '2021-03-21 14:13:35'),
(798, 471, 173, 2058, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-21 14:13:35', '2021-03-21 14:13:35'),
(799, 472, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 07:10:57', '2021-03-22 07:10:57'),
(800, 473, 64, 1949, '1.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 10:09:35', '2021-03-22 10:09:35'),
(801, 473, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 10:09:35', '2021-03-22 10:09:35'),
(802, 473, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 10:09:35', '2021-03-22 10:09:35'),
(803, 474, 173, 2058, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 11:49:56', '2021-03-22 11:49:56'),
(804, 475, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 11:50:53', '2021-03-22 11:50:53'),
(805, 476, 128, 2013, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 11:56:04', '2021-03-22 11:56:04'),
(806, 477, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 13:13:51', '2021-03-22 13:13:51'),
(807, 477, 14, 1899, '1.0000', '0.0000', '1.6000', '1.6000', 'fixed', '0.0000', '1.6000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-22 13:13:51', '2021-03-22 13:13:51'),
(808, 478, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 10:17:21', '2021-03-24 10:17:21'),
(809, 479, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 10:38:18', '2021-03-24 10:38:18'),
(810, 479, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 10:38:18', '2021-03-24 10:38:18'),
(811, 480, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 11:16:19', '2021-03-24 11:16:19'),
(812, 480, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 11:16:19', '2021-03-24 11:16:19'),
(813, 481, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 11:22:16', '2021-03-24 11:22:16'),
(814, 482, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 11:56:08', '2021-03-24 11:56:08'),
(815, 483, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:28:14', '2021-03-24 14:28:14'),
(816, 483, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:28:14', '2021-03-24 14:28:14'),
(817, 484, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:53:14', '2021-03-24 14:53:14'),
(818, 484, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:53:14', '2021-03-24 14:53:14'),
(819, 485, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:53:48', '2021-03-24 14:53:48'),
(820, 486, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 14:57:49', '2021-03-24 14:57:49'),
(821, 487, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-24 19:52:40', '2021-03-24 19:52:40'),
(822, 488, 14, 1899, '1.0000', '0.0000', '1.6000', '1.6000', 'fixed', '0.0000', '1.6000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 06:24:35', '2021-03-25 06:24:35'),
(823, 489, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 08:24:04', '2021-03-25 08:24:04'),
(824, 489, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 08:24:04', '2021-03-25 08:24:04'),
(825, 490, 56, 1941, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 09:39:51', '2021-03-25 09:39:51'),
(826, 490, 63, 1948, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 09:39:51', '2021-03-25 09:39:51'),
(827, 490, 54, 1939, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 09:39:51', '2021-03-25 09:39:51'),
(828, 491, 168, 2053, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 11:24:35', '2021-03-25 11:24:35'),
(829, 491, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-25 11:24:35', '2021-03-25 11:24:35'),
(830, 492, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 11:38:52', '2021-03-27 11:38:52'),
(831, 492, 116, 2001, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 11:38:52', '2021-03-27 11:38:52'),
(832, 493, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 11:50:49', '2021-03-27 11:50:49'),
(833, 494, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 12:10:46', '2021-03-27 12:10:46'),
(834, 494, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 12:10:46', '2021-03-27 12:10:46'),
(835, 494, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-27 12:10:46', '2021-03-27 12:10:46'),
(836, 495, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-28 13:08:05', '2021-03-28 13:08:05'),
(837, 495, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-28 13:08:05', '2021-03-28 13:08:05'),
(838, 496, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-28 13:37:36', '2021-03-28 13:37:36'),
(839, 496, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-28 13:37:36', '2021-03-28 13:37:36'),
(840, 497, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 06:23:31', '2021-03-29 06:23:31'),
(841, 498, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:12:05', '2021-03-29 09:12:05'),
(842, 498, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:12:05', '2021-03-29 09:12:05'),
(843, 498, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:12:05', '2021-03-29 09:12:05'),
(844, 499, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:18:30', '2021-03-29 09:18:30'),
(845, 500, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(846, 500, 116, 2001, '2.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(847, 500, 105, 1990, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(848, 500, 113, 1998, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(849, 500, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 09:54:45', '2021-03-29 09:54:45'),
(850, 501, 108, 1993, '2.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 13:02:26', '2021-03-29 13:02:26'),
(851, 502, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 13:29:47', '2021-03-29 13:29:47'),
(852, 502, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-29 13:29:47', '2021-03-29 13:29:47'),
(859, 506, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-30 07:14:01', '2021-03-30 07:14:01'),
(860, 506, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-30 07:14:01', '2021-03-30 07:14:01'),
(861, 506, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-30 07:14:01', '2021-03-30 07:14:01'),
(862, 507, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-30 10:39:31', '2021-03-30 10:39:31'),
(863, 507, 40, 1925, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-03-30 10:39:31', '2021-03-30 10:39:31'),
(864, 508, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 06:22:01', '2021-04-01 06:22:01'),
(865, 509, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 07:47:14', '2021-04-01 07:47:14'),
(866, 509, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 07:47:14', '2021-04-01 07:47:14'),
(867, 509, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 07:47:14', '2021-04-01 07:47:14'),
(868, 510, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 09:18:35', '2021-04-01 09:18:35'),
(869, 510, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 09:18:35', '2021-04-01 09:18:35'),
(870, 511, 128, 2013, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 11:09:39', '2021-04-01 11:09:39'),
(871, 512, 92, 1977, '3.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 11:39:39', '2021-04-01 11:39:39'),
(872, 512, 113, 1998, '3.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 11:39:39', '2021-04-01 11:39:39'),
(873, 512, 45, 1930, '2.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 11:39:39', '2021-04-01 11:39:39'),
(874, 513, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 11:40:14', '2021-04-01 11:40:14'),
(875, 514, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 13:25:54', '2021-04-01 13:25:54'),
(876, 515, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 13:52:52', '2021-04-01 13:52:52'),
(877, 515, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-01 13:52:52', '2021-04-01 13:52:52'),
(878, 516, 1, 1886, '1.0000', '0.0000', '2.7500', '2.7500', NULL, '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-02 13:47:41', '2021-04-02 13:47:41'),
(879, 517, 61, 1946, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-03 07:43:26', '2021-04-03 07:43:26'),
(880, 517, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-03 07:43:26', '2021-04-03 07:43:26'),
(881, 518, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-03 10:42:25', '2021-04-03 10:42:25'),
(882, 518, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-03 10:42:25', '2021-04-03 10:42:25'),
(883, 519, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 08:03:29', '2021-04-04 08:03:29'),
(884, 519, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 08:03:29', '2021-04-04 08:03:29'),
(885, 519, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 08:03:29', '2021-04-04 08:03:29'),
(886, 520, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 08:40:41', '2021-04-04 08:40:41'),
(887, 521, 164, 2049, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 09:33:01', '2021-04-04 09:33:01'),
(888, 521, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 09:33:01', '2021-04-04 09:33:01'),
(889, 521, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-04 09:33:01', '2021-04-04 09:33:01'),
(890, 522, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 09:12:33', '2021-04-05 09:12:33'),
(891, 523, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 09:59:42', '2021-04-05 09:59:42'),
(892, 523, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 09:59:42', '2021-04-05 09:59:42'),
(893, 523, 149, 2034, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 09:59:42', '2021-04-05 09:59:42'),
(894, 524, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 11:33:13', '2021-04-05 11:33:13'),
(895, 524, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 11:33:13', '2021-04-05 11:33:13'),
(896, 525, 174, 2059, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 12:32:57', '2021-04-05 12:32:57'),
(897, 525, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-05 12:32:57', '2021-04-05 12:32:57'),
(898, 526, 164, 2049, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 08:55:34', '2021-04-06 08:55:34'),
(899, 527, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 09:21:57', '2021-04-06 09:21:57'),
(900, 527, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 09:21:57', '2021-04-06 09:21:57'),
(901, 528, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 09:57:49', '2021-04-06 09:57:49'),
(902, 528, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 09:57:49', '2021-04-06 09:57:49'),
(903, 528, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 09:57:49', '2021-04-06 09:57:49'),
(904, 529, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 10:01:26', '2021-04-06 10:01:26'),
(905, 529, 118, 2003, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 10:01:26', '2021-04-06 10:01:26'),
(906, 530, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 10:40:23', '2021-04-06 10:40:23'),
(907, 531, 14, 1899, '1.0000', '0.0000', '1.6000', '1.6000', 'fixed', '0.0000', '1.6000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 12:23:17', '2021-04-06 12:23:17'),
(908, 532, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 13:36:51', '2021-04-06 13:36:51'),
(909, 532, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 13:36:51', '2021-04-06 13:36:51'),
(910, 532, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 13:36:51', '2021-04-06 13:36:51'),
(911, 532, 168, 2053, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-06 13:36:51', '2021-04-06 13:36:51'),
(912, 533, 130, 2015, '1.0000', '0.0000', '2.1000', '2.1000', 'fixed', '0.0000', '2.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 05:13:17', '2021-04-07 05:13:17'),
(913, 534, 53, 1938, '2.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 07:00:55', '2021-04-07 07:00:55'),
(914, 534, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 07:00:55', '2021-04-07 07:00:55'),
(915, 534, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 07:00:55', '2021-04-07 07:00:55'),
(916, 535, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 07:37:47', '2021-04-07 07:37:47'),
(917, 536, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 08:53:22', '2021-04-07 08:53:22'),
(918, 537, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 10:41:16', '2021-04-07 10:41:16'),
(919, 538, 92, 1977, '3.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 11:16:27', '2021-04-07 11:16:27'),
(920, 538, 45, 1930, '2.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 11:16:27', '2021-04-07 11:16:27'),
(921, 539, 128, 2013, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 11:46:03', '2021-04-07 11:46:03'),
(922, 539, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-07 11:46:03', '2021-04-07 11:46:03'),
(923, 540, 138, 2023, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 09:48:35', '2021-04-08 09:48:35'),
(924, 541, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 11:13:17', '2021-04-08 11:13:17'),
(925, 541, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 11:13:17', '2021-04-08 11:13:17'),
(926, 542, 92, 1977, '4.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 11:45:34', '2021-04-08 11:45:34'),
(927, 542, 113, 1998, '4.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 11:45:34', '2021-04-08 11:45:34'),
(928, 542, 116, 2001, '4.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 11:45:34', '2021-04-08 11:45:34'),
(929, 543, 149, 2034, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 13:14:34', '2021-04-08 13:14:34'),
(930, 544, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-08 13:33:34', '2021-04-08 13:33:34'),
(931, 545, 19, 1904, '8.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 10:52:05', '2021-04-10 10:52:05'),
(932, 546, 139, 2024, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 12:23:20', '2021-04-10 12:23:20'),
(933, 547, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 12:28:22', '2021-04-10 12:28:22'),
(934, 547, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 12:28:22', '2021-04-10 12:28:22'),
(935, 547, 43, 1928, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 12:28:22', '2021-04-10 12:28:22'),
(936, 547, 52, 1937, '2.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-10 12:28:22', '2021-04-10 12:28:22'),
(937, 548, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-11 09:22:11', '2021-04-11 09:22:11'),
(938, 548, 118, 2003, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-11 09:22:11', '2021-04-11 09:22:11'),
(939, 549, 17, 1902, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-11 09:36:42', '2021-04-11 09:36:42'),
(940, 550, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 10:06:36', '2021-04-12 10:06:36'),
(941, 550, 118, 2003, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 10:06:36', '2021-04-12 10:06:36'),
(942, 551, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 11:34:25', '2021-04-12 11:34:25'),
(943, 552, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 11:51:38', '2021-04-12 11:51:38'),
(944, 553, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 13:42:48', '2021-04-12 13:42:48'),
(945, 554, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 13:43:28', '2021-04-12 13:43:28'),
(946, 554, 45, 1930, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-12 13:43:28', '2021-04-12 13:43:28'),
(972, 562, 2, 1887, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-13 16:05:03', '2021-04-13 16:05:03'),
(973, 562, 4, 1889, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-13 16:05:03', '2021-04-13 16:05:03'),
(974, 562, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-13 16:05:03', '2021-04-13 16:05:03'),
(975, 562, 21, 1906, '2.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-13 16:05:03', '2021-04-13 16:05:03'),
(976, 563, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-15 22:16:49', '2021-04-15 22:16:49'),
(977, 563, 157, 2042, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-15 22:16:49', '2021-04-15 22:16:49'),
(978, 563, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-15 22:16:49', '2021-04-15 22:16:49'),
(979, 563, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-15 22:16:49', '2021-04-15 22:16:49'),
(980, 564, 168, 2053, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-17 14:45:13', '2021-04-17 14:45:13'),
(981, 564, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-17 14:45:13', '2021-04-17 14:45:13'),
(982, 564, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-17 14:45:13', '2021-04-17 14:45:13'),
(985, 566, 2, 1887, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 14:45:03', '2021-04-18 14:45:03'),
(986, 566, 3, 1888, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 14:45:03', '2021-04-18 14:45:03'),
(987, 566, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 14:45:03', '2021-04-18 14:45:03'),
(993, 571, 104, 1989, '1.0000', '0.0000', '4.1000', '4.1000', NULL, '0.0000', '4.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 22:52:15', '2021-04-18 22:52:15'),
(994, 571, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', NULL, '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 22:52:15', '2021-04-18 22:52:15'),
(995, 571, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', NULL, '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 22:52:15', '2021-04-18 22:52:15'),
(996, 572, 157, 2042, '2.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 23:05:41', '2021-04-18 23:05:41'),
(997, 572, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 23:05:41', '2021-04-18 23:05:41'),
(998, 572, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-18 23:05:41', '2021-04-18 23:05:41'),
(999, 573, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:05:47', '2021-04-19 14:41:30'),
(1000, 573, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:05:47', '2021-04-19 14:41:30'),
(1001, 574, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:08:34', '2021-04-19 13:24:49'),
(1002, 574, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:08:34', '2021-04-19 13:24:49'),
(1004, 575, 93, 1978, '1.0000', '0.0000', '2.9800', '2.9800', 'fixed', '0.0000', '2.9800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:45:00', '2021-04-19 13:45:00'),
(1005, 576, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:49:08', '2021-04-19 13:49:08'),
(1006, 577, 92, 1977, '2.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:51:52', '2021-04-19 13:51:52'),
(1007, 577, 93, 1978, '2.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:51:52', '2021-04-19 13:51:52'),
(1008, 578, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:53:26', '2021-04-19 13:53:26'),
(1009, 579, 89, 1974, '1.0000', '0.0000', '3.1000', '3.1000', 'fixed', '0.0000', '3.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 13:54:28', '2021-04-19 13:54:28'),
(1010, 580, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:03:35', '2021-04-19 14:03:35'),
(1011, 580, 113, 1998, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:03:35', '2021-04-19 14:03:35'),
(1012, 580, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:03:35', '2021-04-19 14:03:35'),
(1013, 581, 1, 1886, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:17:43', '2021-04-19 14:17:43'),
(1014, 582, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:29:47', '2021-04-19 14:29:47'),
(1015, 582, 1, 1886, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:29:47', '2021-04-19 14:29:47'),
(1016, 582, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:29:47', '2021-04-19 14:29:47'),
(1017, 583, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:30:46', '2021-04-19 14:30:46'),
(1020, 585, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:47:53', '2021-04-19 14:47:53'),
(1021, 586, 89, 1974, '1.0000', '0.0000', '3.1000', '3.1000', 'fixed', '0.0000', '3.1000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 14:50:43', '2021-04-19 14:50:43'),
(1026, 589, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:21:47', '2021-04-19 15:21:47'),
(1027, 589, 137, 2022, '1.0000', '0.0000', '1.8000', '1.8000', 'fixed', '0.0000', '1.8000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:21:47', '2021-04-19 15:21:47'),
(1028, 589, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:21:47', '2021-04-19 15:21:47'),
(1029, 590, 160, 2045, '1.0000', '0.0000', '4.6000', '4.6000', 'fixed', '0.0000', '4.6000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:29:37', '2021-04-19 15:29:37'),
(1030, 590, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:29:37', '2021-04-19 15:29:37'),
(1031, 591, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:39:34', '2021-04-19 15:39:34'),
(1032, 592, 93, 1978, '2.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:47:18', '2021-04-19 15:47:55'),
(1033, 592, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 15:47:18', '2021-04-19 15:47:55'),
(1034, 593, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:02:20', '2021-04-19 16:02:20'),
(1035, 593, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:02:20', '2021-04-19 16:02:20'),
(1036, 593, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:02:20', '2021-04-19 16:02:20'),
(1037, 594, 94, 1979, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:08:23', '2021-04-19 16:08:23'),
(1038, 594, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:08:23', '2021-04-19 16:08:23'),
(1039, 594, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:08:23', '2021-04-19 16:08:23'),
(1040, 595, 92, 1977, '1.0000', '0.0000', '2.6100', '2.6100', 'fixed', '0.0000', '2.6100', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:12:38', '2021-04-19 16:12:38'),
(1041, 595, 21, 1906, '1.0000', '0.0000', '2.0300', '2.0300', 'fixed', '0.0000', '2.0300', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:12:38', '2021-04-19 16:12:38'),
(1042, 596, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:13:37', '2021-04-19 16:13:37'),
(1043, 596, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:13:37', '2021-04-19 16:13:37'),
(1044, 597, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:14:29', '2021-04-19 16:14:29'),
(1057, 602, 99, 1984, '1.0000', '0.0000', '2.3800', '2.3800', 'fixed', '0.0000', '2.3800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:45:27', '2021-04-19 16:57:13'),
(1058, 602, 89, 1974, '1.0000', '0.0000', '2.1700', '2.1700', 'fixed', '0.0000', '2.1700', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:45:27', '2021-04-19 16:57:13'),
(1059, 602, 130, 130, '1.0000', '0.0000', '1.7300', '1.7300', 'fixed', '0.0000', '1.7300', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-19 16:45:27', '2021-04-19 16:57:13'),
(1066, 605, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:01:22', '2021-04-20 13:01:22'),
(1067, 605, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:01:22', '2021-04-20 13:01:22'),
(1068, 605, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:01:22', '2021-04-20 13:01:22'),
(1069, 606, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:23:39', '2021-04-20 13:23:39'),
(1070, 606, 40, 1925, '2.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:23:39', '2021-04-20 13:23:39'),
(1071, 607, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:25:18', '2021-04-20 13:25:18'),
(1072, 607, 20, 1905, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:25:18', '2021-04-20 13:25:18'),
(1073, 608, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:34:39', '2021-04-20 13:38:13'),
(1074, 608, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:34:39', '2021-04-20 13:38:13'),
(1075, 608, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:34:39', '2021-04-20 13:38:13'),
(1076, 608, 39, 1924, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:34:39', '2021-04-20 13:38:13'),
(1077, 609, 107, 1992, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:37:11', '2021-04-20 13:37:11'),
(1078, 610, 102, 1987, '1.0000', '0.0000', '5.9000', '5.9000', 'fixed', '0.0000', '5.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 13:39:20', '2021-04-20 13:39:20'),
(1079, 611, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:32:54', '2021-04-20 14:32:54'),
(1080, 612, 53, 1938, '1.0000', '0.0000', '2.1500', '2.1500', 'fixed', '0.0000', '2.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:35:37', '2021-04-20 14:38:01'),
(1081, 612, 119, 2004, '2.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:35:37', '2021-04-20 14:38:01'),
(1082, 613, 33, 1918, '2.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:40:02', '2021-04-20 14:40:02'),
(1083, 613, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:40:02', '2021-04-20 14:40:02'),
(1084, 613, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:40:02', '2021-04-20 14:40:02'),
(1085, 614, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:55:45', '2021-04-20 15:11:03'),
(1086, 614, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 14:55:45', '2021-04-20 15:11:03'),
(1087, 615, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:03:37', '2021-04-20 15:03:37'),
(1088, 616, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:12:41', '2021-04-20 15:12:41'),
(1089, 617, 92, 1977, '1.0000', '0.0000', '2.9000', '2.9000', 'fixed', '0.0000', '2.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:14:32', '2021-04-20 15:52:48'),
(1090, 617, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:14:32', '2021-04-20 15:52:48'),
(1091, 617, 118, 2003, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:14:32', '2021-04-20 15:52:48'),
(1092, 618, 106, 1991, '1.0000', '0.0000', '4.2500', '4.2500', 'fixed', '0.0000', '4.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:15:43', '2021-04-20 15:24:20'),
(1093, 618, 97, 1982, '1.0000', '0.0000', '3.3000', '3.3000', 'fixed', '0.0000', '3.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:15:43', '2021-04-20 15:24:20'),
(1094, 619, 102, 1987, '1.0000', '0.0000', '5.9000', '5.9000', 'fixed', '0.0000', '5.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:16:33', '2021-04-20 15:18:56'),
(1095, 619, 116, 2001, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:16:33', '2021-04-20 15:18:56');
INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1096, 619, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:18:56', '2021-04-20 15:18:56'),
(1097, 620, 31, 1916, '2.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:25:46', '2021-04-20 16:13:46'),
(1098, 620, 108, 1993, '2.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:25:46', '2021-04-20 16:13:46'),
(1099, 620, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:25:46', '2021-04-20 16:13:46'),
(1100, 620, 98, 1983, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:25:46', '2021-04-20 16:13:46'),
(1101, 621, 98, 1983, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:31:16', '2021-04-20 16:00:40'),
(1102, 621, 102, 1987, '1.0000', '0.0000', '4.1300', '4.1300', 'fixed', '0.0000', '4.1300', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:31:16', '2021-04-20 16:00:40'),
(1103, 621, 105, 1990, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:31:16', '2021-04-20 16:00:40'),
(1104, 622, 9, 1894, '2.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:33:17', '2021-04-20 16:03:06'),
(1105, 623, 147, 2032, '4.0000', '0.0000', '1.2800', '1.2800', 'fixed', '0.0000', '1.2800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:35:06', '2021-04-20 15:40:35'),
(1106, 624, 95, 1980, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:38:33', '2021-04-20 15:51:53'),
(1107, 625, 106, 1991, '1.0000', '0.0000', '2.9800', '2.9800', 'fixed', '0.0000', '2.9800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:50:37', '2021-04-20 16:04:19'),
(1108, 625, 15, 1900, '1.0000', '0.0000', '1.0500', '1.0500', 'fixed', '0.0000', '1.0500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:50:37', '2021-04-20 16:04:19'),
(1109, 625, 32, 1917, '1.0000', '0.0000', '0.7000', '0.7000', 'fixed', '0.0000', '0.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:50:37', '2021-04-20 16:04:19'),
(1110, 625, 105, 1990, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:50:37', '2021-04-20 16:04:19'),
(1111, 626, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:53:58', '2021-04-20 16:10:27'),
(1112, 626, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:53:58', '2021-04-20 16:10:27'),
(1113, 627, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:55:08', '2021-04-20 16:09:45'),
(1114, 627, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:55:08', '2021-04-20 16:09:45'),
(1115, 628, 1, 1886, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:58:28', '2021-04-20 15:58:28'),
(1116, 627, 163, 2048, '1.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 15:59:12', '2021-04-20 16:09:45'),
(1117, 629, 173, 2058, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:02:17', '2021-04-20 16:02:17'),
(1118, 629, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:02:17', '2021-04-20 16:02:17'),
(1119, 629, 52, 1937, '10.0000', '0.0000', '0.6500', '0.6500', 'fixed', '0.0000', '0.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:02:17', '2021-04-20 16:02:17'),
(1120, 630, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:04:39', '2021-04-20 16:04:39'),
(1121, 631, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:17:45', '2021-04-20 16:21:43'),
(1122, 631, 133, 2018, '1.0000', '0.0000', '2.2000', '2.2000', 'fixed', '0.0000', '2.2000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:17:45', '2021-04-20 16:21:43'),
(1123, 632, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:24:30', '2021-04-20 16:24:30'),
(1124, 632, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:24:30', '2021-04-20 16:24:30'),
(1125, 632, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:24:30', '2021-04-20 16:24:30'),
(1126, 633, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:25:11', '2021-04-20 16:26:46'),
(1127, 633, 9, 1894, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:25:11', '2021-04-20 16:26:46'),
(1128, 633, 24, 1909, '1.0000', '0.0000', '2.7000', '2.7000', 'fixed', '0.0000', '2.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 16:25:11', '2021-04-20 16:26:46'),
(1129, 634, 31, 1916, '1.0000', '0.0000', '2.1600', '2.1600', 'fixed', '0.0000', '2.1600', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:20:59', '2021-04-20 17:20:59'),
(1130, 634, 148, 2033, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:20:59', '2021-04-20 17:20:59'),
(1131, 634, 20, 1905, '1.0000', '0.0000', '0.9000', '0.9000', 'fixed', '0.0000', '0.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:20:59', '2021-04-20 17:20:59'),
(1132, 635, 157, 2042, '2.0000', '0.0000', '2.8900', '2.8900', 'fixed', '0.0000', '2.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(1133, 635, 108, 1993, '1.0000', '0.0000', '2.7600', '2.7600', 'fixed', '0.0000', '2.7600', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(1134, 635, 90, 1975, '1.0000', '0.0000', '2.9800', '2.9800', 'fixed', '0.0000', '2.9800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(1135, 635, 89, 1974, '1.0000', '0.0000', '2.6400', '2.6400', 'fixed', '0.0000', '2.6400', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(1136, 635, 24, 1909, '1.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:27:54', '2021-04-20 17:27:54'),
(1137, 636, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-20 17:29:56', '2021-04-20 17:29:56'),
(1138, 637, 157, 2042, '1.0000', '0.0000', '2.8900', '2.8900', 'fixed', '0.0000', '2.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:04:52', '2021-04-21 13:04:52'),
(1139, 637, 31, 1916, '1.0000', '0.0000', '2.0400', '2.0400', 'fixed', '0.0000', '2.0400', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:04:52', '2021-04-21 13:04:52'),
(1140, 637, 119, 2004, '1.0000', '0.0000', '0.3000', '0.3000', 'fixed', '0.0000', '0.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:04:52', '2021-04-21 13:04:52'),
(1141, 638, 157, 2042, '1.0000', '0.0000', '2.8900', '2.8900', 'fixed', '0.0000', '2.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:07:11', '2021-04-21 13:07:11'),
(1142, 638, 19, 1904, '1.0000', '0.0000', '0.8500', '0.8500', 'fixed', '0.0000', '0.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:07:11', '2021-04-21 13:07:11'),
(1143, 639, 89, 1974, '1.0000', '0.0000', '2.6400', '2.6400', 'fixed', '0.0000', '2.6400', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1144, 639, 87, 1972, '1.0000', '0.0000', '3.6100', '3.6100', 'fixed', '0.0000', '3.6100', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1145, 639, 21, 1906, '1.0000', '0.0000', '1.9100', '1.9100', 'fixed', '0.0000', '1.9100', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1146, 639, 149, 2034, '1.0000', '0.0000', '1.7000', '1.7000', 'fixed', '0.0000', '1.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1147, 639, 148, 2033, '1.0000', '0.0000', '1.2800', '1.2800', 'fixed', '0.0000', '1.2800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1148, 639, 98, 1983, '1.0000', '0.0000', '3.8300', '3.8300', 'fixed', '0.0000', '3.8300', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1149, 639, 157, 2042, '1.0000', '0.0000', '2.8900', '2.8900', 'fixed', '0.0000', '2.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1150, 639, 19, 1904, '1.0000', '0.0000', '0.8500', '0.8500', 'fixed', '0.0000', '0.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:09:07', '2021-04-21 13:09:07'),
(1151, 640, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:10:04', '2021-04-21 13:10:04'),
(1152, 641, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:50:15', '2021-04-21 13:50:15'),
(1153, 641, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:50:15', '2021-04-21 13:50:15'),
(1154, 642, 12, 1897, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:50:49', '2021-04-21 13:50:49'),
(1155, 643, 65, 1950, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:51:49', '2021-04-21 13:51:49'),
(1156, 644, 106, 1991, '2.0000', '0.0000', '4.2500', '4.2500', 'fixed', '0.0000', '4.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:54:19', '2021-04-21 13:54:19'),
(1157, 644, 65, 1950, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:54:19', '2021-04-21 13:54:19'),
(1158, 644, 33, 1918, '3.0000', '0.0000', '1.7500', '1.7500', 'fixed', '0.0000', '1.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:54:19', '2021-04-21 13:54:19'),
(1159, 644, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:54:19', '2021-04-21 13:54:19'),
(1160, 645, 157, 2042, '1.0000', '0.0000', '2.8900', '2.8900', 'fixed', '0.0000', '2.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:56:35', '2021-04-21 13:56:35'),
(1161, 645, 95, 1980, '1.0000', '0.0000', '2.7600', '2.7600', 'fixed', '0.0000', '2.7600', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:56:35', '2021-04-21 13:56:35'),
(1162, 645, 100, 1985, '1.0000', '0.0000', '2.6800', '2.6800', 'fixed', '0.0000', '2.6800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:56:35', '2021-04-21 13:56:35'),
(1163, 645, 19, 1904, '1.0000', '0.0000', '0.8500', '0.8500', 'fixed', '0.0000', '0.8500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:56:35', '2021-04-21 13:56:35'),
(1164, 646, 106, 1991, '1.0000', '0.0000', '4.2500', '4.2500', 'fixed', '0.0000', '4.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 13:57:04', '2021-04-21 13:57:04'),
(1165, 647, 59, 1944, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 14:49:45', '2021-04-21 14:49:45'),
(1166, 647, 111, 1996, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 14:49:45', '2021-04-21 14:49:45'),
(1167, 647, 119, 2004, '1.0000', '0.0000', '0.3500', '0.3500', 'fixed', '0.0000', '0.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 14:49:45', '2021-04-21 14:49:45'),
(1168, 647, 20, 1905, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 14:49:45', '2021-04-21 14:49:45'),
(1169, 648, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:01:05', '2021-04-21 15:01:05'),
(1170, 649, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:16:49', '2021-04-21 15:16:49'),
(1171, 649, 147, 2032, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:16:49', '2021-04-21 15:16:49'),
(1172, 650, 19, 1904, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:20:44', '2021-04-21 15:20:44'),
(1173, 651, 100, 1985, '2.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:07', '2021-04-21 15:36:07'),
(1174, 651, 157, 2042, '1.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:07', '2021-04-21 15:36:07'),
(1175, 651, 102, 1987, '1.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:07', '2021-04-21 15:36:07'),
(1176, 651, 20, 1905, '1.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:07', '2021-04-21 15:36:07'),
(1177, 651, 19, 1904, '1.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:07', '2021-04-21 15:36:07'),
(1178, 652, 19, 1904, '5.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:36:33', '2021-04-21 15:36:33'),
(1179, 653, 173, 2058, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:37:01', '2021-04-21 15:37:01'),
(1180, 653, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:37:01', '2021-04-21 15:37:01'),
(1181, 654, 131, 2016, '1.0000', '0.0000', '2.5000', '2.5000', 'fixed', '0.0000', '2.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:40:54', '2021-04-21 15:40:54'),
(1182, 654, 132, 2017, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:40:54', '2021-04-21 15:40:54'),
(1183, 654, 109, 1994, '1.0000', '0.0000', '5.5000', '5.5000', 'fixed', '0.0000', '5.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:40:54', '2021-04-21 15:40:54'),
(1184, 655, 6, 1891, '2.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:47:04', '2021-04-21 15:47:04'),
(1185, 656, 148, 2033, '1.0000', '0.0000', '1.3500', '1.3500', 'fixed', '0.0000', '1.3500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:52:52', '2021-04-21 15:52:52'),
(1186, 656, 20, 1905, '1.0000', '0.0000', '0.9000', '0.9000', 'fixed', '0.0000', '0.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:52:52', '2021-04-21 15:52:52'),
(1187, 657, 93, 1978, '1.0000', '0.0000', '3.5000', '3.5000', 'fixed', '0.0000', '3.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 15:58:33', '2021-04-21 15:58:33'),
(1188, 658, 100, 1985, '2.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:03:29', '2021-04-21 16:03:29'),
(1189, 658, 108, 1993, '1.0000', '0.0000', '3.2500', '3.2500', 'fixed', '0.0000', '3.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:03:29', '2021-04-21 16:03:29'),
(1190, 659, 106, 1991, '2.0000', '0.0000', '4.2500', '4.2500', 'fixed', '0.0000', '4.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:07:30', '2021-04-21 16:07:30'),
(1191, 659, 110, 1995, '1.0000', '0.0000', '5.9000', '5.9000', 'fixed', '0.0000', '5.9000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:07:30', '2021-04-21 16:07:30'),
(1192, 659, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:07:30', '2021-04-21 16:07:30'),
(1193, 659, 148, 2033, '1.0000', '0.0000', '1.5000', '1.5000', 'fixed', '0.0000', '1.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:07:30', '2021-04-21 16:07:30'),
(1194, 660, 100, 1985, '1.0000', '0.0000', '2.2100', '2.2100', 'fixed', '0.0000', '2.2100', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:08:33', '2021-04-21 16:08:33'),
(1195, 660, 108, 1993, '2.0000', '0.0000', '2.2800', '2.2800', 'fixed', '0.0000', '2.2800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:08:33', '2021-04-21 16:08:33'),
(1196, 660, 24, 1909, '1.0000', '0.0000', '1.8900', '1.8900', 'fixed', '0.0000', '1.8900', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:08:33', '2021-04-21 16:08:33'),
(1197, 661, 10, 1895, '3.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(1198, 661, 12, 1897, '2.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(1199, 661, 171, 2056, '1.0000', '0.0000', '2.7500', '2.7500', 'fixed', '0.0000', '2.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(1200, 661, 6, 1891, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(1201, 661, 21, 1906, '1.0000', '0.0000', '2.2500', '2.2500', 'fixed', '0.0000', '2.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:19:41', '2021-04-21 16:19:41'),
(1202, 662, 101, 1986, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:20:25', '2021-04-21 16:20:25'),
(1203, 662, 113, 1998, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:20:25', '2021-04-21 16:20:25'),
(1204, 663, 163, 2048, '2.0000', '0.0000', '2.3000', '2.3000', 'fixed', '0.0000', '2.3000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:23:17', '2021-04-21 16:23:17'),
(1205, 663, 100, 1985, '1.0000', '0.0000', '3.1500', '3.1500', 'fixed', '0.0000', '3.1500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:23:17', '2021-04-21 16:23:17'),
(1206, 664, 105, 1990, '1.0000', '0.0000', '4.5000', '4.5000', 'fixed', '0.0000', '4.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:33:12', '2021-04-21 16:33:12'),
(1207, 664, 31, 1916, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:33:12', '2021-04-21 16:33:12'),
(1208, 664, 94, 1979, '1.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:33:12', '2021-04-21 16:33:12'),
(1209, 664, 29, 1914, '1.0000', '0.0000', '0.5000', '0.5000', 'fixed', '0.0000', '0.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:33:12', '2021-04-21 16:33:12'),
(1210, 665, 10, 1895, '1.0000', '0.0000', '2.4000', '2.4000', 'fixed', '0.0000', '2.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:37:12', '2021-04-21 16:37:12'),
(1211, 665, 38, 1923, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 16:37:12', '2021-04-21 16:37:12'),
(1212, 666, 19, 1904, '2.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 22:30:53', '2021-04-21 22:30:53'),
(1213, 666, 157, 2042, '3.0000', '0.0000', '3.4000', '3.4000', 'fixed', '0.0000', '3.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 22:30:53', '2021-04-21 22:30:53'),
(1214, 666, 84, 1969, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-04-21 22:30:53', '2021-04-21 22:30:53'),
(1215, 667, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-03 10:09:43', '2021-05-03 10:09:43'),
(1216, 668, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-03 10:10:04', '2021-05-03 10:10:04'),
(1217, 669, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-03 10:10:18', '2021-05-03 10:10:18'),
(1218, 670, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-12 08:03:14', '2021-05-12 08:03:14'),
(1219, 671, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-13 15:11:34', '2021-05-13 15:11:34'),
(1220, 672, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-13 15:11:46', '2021-05-13 15:11:46'),
(1221, 673, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-13 15:24:42', '2021-05-13 15:24:42'),
(1222, 674, 8, 1893, '1.0000', '0.0000', '3.7500', '3.7500', 'fixed', '0.0000', '3.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-13 15:37:35', '2021-05-13 15:37:35'),
(1223, 674, 136, 2021, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-13 15:37:35', '2021-05-13 15:37:35'),
(1224, 675, 124, 2009, '1.0000', '0.0000', '1.0000', '1.0000', 'fixed', '0.0000', '1.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-20 14:22:03', '2021-05-20 14:22:03'),
(1225, 676, 111, 1996, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-20 14:40:23', '2021-05-20 14:40:23'),
(1226, 677, 111, 1996, '1.0000', '0.0000', '0.2500', '0.2500', 'fixed', '0.0000', '0.2500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-20 17:46:56', '2021-05-20 17:46:56'),
(1227, 678, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-20 17:48:22', '2021-05-20 17:48:22'),
(1228, 679, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-20 17:49:38', '2021-05-20 17:49:38'),
(1229, 680, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-21 17:30:14', '2021-05-21 17:30:14'),
(1230, 680, 113, 1998, '1.0000', '0.0000', '0.7500', '0.7500', 'fixed', '0.0000', '0.7500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-21 17:30:14', '2021-05-21 17:30:14'),
(1231, 680, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-21 17:30:14', '2021-05-21 17:30:14'),
(1232, 681, 159, 2044, '1.0000', '0.0000', '4.7000', '4.7000', 'fixed', '0.0000', '4.7000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-23 18:31:05', '2021-05-23 18:31:05'),
(1233, 682, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-24 15:26:10', '2021-05-24 15:26:10'),
(1234, 683, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-24 18:04:01', '2021-05-24 18:08:22'),
(1235, 684, 135, 2020, '1.0000', '0.0000', '1.6500', '1.6500', 'fixed', '0.0000', '1.6500', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 14:19:35', '2021-05-27 14:19:35'),
(1236, 685, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 14:22:43', '2021-05-27 14:22:43'),
(1237, 686, 112, 1997, '1.0000', '0.0000', '0.4000', '0.4000', 'fixed', '0.0000', '0.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 14:24:26', '2021-05-27 14:24:26'),
(1238, 687, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 14:33:36', '2021-05-27 14:33:36'),
(1239, 688, 158, 2043, '1.0000', '0.0000', '4.4000', '4.4000', 'fixed', '0.0000', '4.4000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 14:36:41', '2021-05-27 14:36:41'),
(1240, 691, 182, 2067, '1.0000', '0.0000', '0.0000', '0.0000', 'fixed', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 15:35:39', '2021-05-28 15:35:39'),
(1241, 692, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 15:36:53', '2021-05-28 15:36:53'),
(1242, 693, 182, 2067, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 15:38:17', '2021-05-28 15:38:17'),
(1243, 694, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 15:38:43', '2021-05-28 15:38:43'),
(1244, 695, 182, 2067, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 15:51:23', '2021-05-28 15:51:23'),
(1245, 696, 182, 2067, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:02:23', '2021-05-28 16:02:23'),
(1246, 697, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:03:29', '2021-05-28 16:03:29'),
(1247, 698, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:05:26', '2021-05-28 16:05:26'),
(1248, 699, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:06:11', '2021-05-28 16:06:11'),
(1249, 700, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:07:22', '2021-05-28 16:07:22'),
(1250, 701, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:08:57', '2021-05-28 16:08:57'),
(1251, 702, 182, 2067, '3.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:11:04', '2021-05-28 16:11:04'),
(1252, 703, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-28 16:13:32', '2021-05-28 16:13:32'),
(1253, 705, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-31 18:06:05', '2021-05-31 18:06:22'),
(1254, 709, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-03 16:39:08', '2021-06-03 16:39:08'),
(1255, 710, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-03 16:55:55', '2021-06-03 16:55:55'),
(1256, 711, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 16:27:25', '2021-06-04 16:27:25'),
(1257, 712, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 16:36:46', '2021-06-04 16:36:46'),
(1258, 713, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 17:34:02', '2021-06-04 17:34:02'),
(1259, 714, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 17:35:34', '2021-06-04 17:35:34'),
(1260, 715, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 17:56:16', '2021-06-04 17:56:16'),
(1261, 716, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-04 17:56:45', '2021-06-04 17:56:45'),
(1262, 717, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:05:09', '2021-06-05 07:05:09'),
(1263, 718, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:08:23', '2021-06-05 07:08:23'),
(1264, 719, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:09:06', '2021-06-05 07:09:06'),
(1265, 720, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:13:27', '2021-06-05 07:13:27'),
(1266, 721, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:14:51', '2021-06-05 07:14:51'),
(1267, 722, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:19:04', '2021-06-05 07:19:04'),
(1268, 723, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:30:34', '2021-06-05 07:30:34'),
(1269, 724, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:35:52', '2021-06-05 07:35:52'),
(1270, 725, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:37:45', '2021-06-05 07:37:45'),
(1271, 726, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:40:13', '2021-06-05 07:40:13'),
(1272, 727, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:46:07', '2021-06-05 07:46:07'),
(1273, 728, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:46:47', '2021-06-05 07:46:47'),
(1274, 729, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:50:48', '2021-06-05 07:50:48'),
(1275, 730, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:57:54', '2021-06-05 07:57:54'),
(1276, 731, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 07:59:15', '2021-06-05 07:59:15'),
(1277, 732, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 08:58:41', '2021-06-05 08:58:41'),
(1278, 733, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 09:00:09', '2021-06-05 09:00:09'),
(1279, 734, 182, 2067, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 09:16:51', '2021-06-05 09:16:51'),
(1280, 735, 182, 2067, '3.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 09:31:51', '2021-06-05 09:31:51'),
(1281, 736, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 14:46:14', '2021-06-05 14:46:14'),
(1282, 737, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 14:47:09', '2021-06-05 14:47:09'),
(1283, 738, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:12:01', '2021-06-05 15:12:01'),
(1284, 739, 182, 2067, '5.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:15:18', '2021-06-05 15:15:18'),
(1285, 740, 182, 2067, '7.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:19:04', '2021-06-05 15:19:04'),
(1286, 741, 182, 2067, '4.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:22:36', '2021-06-05 15:22:36'),
(1287, 742, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:35:05', '2021-06-05 15:35:05'),
(1288, 743, 182, 2067, '8.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:37:18', '2021-06-05 15:37:18'),
(1289, 744, 182, 2067, '12.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:45:50', '2021-06-06 19:02:36'),
(1290, 745, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 15:47:41', '2021-06-05 15:47:41'),
(1291, 746, 182, 2067, '2.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-05 17:28:04', '2021-06-05 17:28:04'),
(1292, 747, 182, 2067, '3.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-06 17:30:11', '2021-06-06 19:54:00'),
(1293, 748, 182, 2067, '3.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-06 17:36:38', '2021-06-06 17:36:38'),
(1294, 749, 182, 2067, '1.0000', '0.0000', '2.0000', '2.0000', 'fixed', '0.0000', '2.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-06 18:49:31', '2021-06-06 18:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1240, NULL, 2, '1.0000', '0.0000', '2021-05-28 15:35:39', '2021-05-28 15:35:39'),
(2, 1241, NULL, 2, '1.0000', '0.0000', '2021-05-28 15:36:53', '2021-05-28 15:36:53'),
(3, 1242, NULL, 2, '2.0000', '0.0000', '2021-05-28 15:38:17', '2021-05-28 15:38:17'),
(4, 1243, NULL, 2, '1.0000', '0.0000', '2021-05-28 15:38:43', '2021-05-28 15:38:43'),
(5, 1244, NULL, 2, '2.0000', '0.0000', '2021-05-28 15:51:23', '2021-05-28 15:51:23'),
(6, 1245, NULL, 2, '2.0000', '0.0000', '2021-05-28 16:02:24', '2021-05-28 16:02:24'),
(7, 1246, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:03:29', '2021-05-28 16:03:29'),
(8, 1247, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:05:26', '2021-05-28 16:05:26'),
(9, 1248, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:06:11', '2021-05-28 16:06:11'),
(10, 1249, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:07:22', '2021-05-28 16:07:22'),
(11, 1250, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:08:57', '2021-05-28 16:08:57'),
(12, 1251, NULL, 2, '3.0000', '0.0000', '2021-05-28 16:11:04', '2021-05-28 16:11:04'),
(13, 1252, NULL, 2, '1.0000', '0.0000', '2021-05-28 16:13:32', '2021-05-28 16:13:32'),
(14, 1253, NULL, 2, '1.0000', '0.0000', '2021-05-31 18:06:05', '2021-05-31 18:06:05'),
(15, 1254, NULL, 2, '1.0000', '0.0000', '2021-06-03 16:39:08', '2021-06-03 16:39:08'),
(16, 1255, NULL, 2, '1.0000', '0.0000', '2021-06-03 16:55:55', '2021-06-03 16:55:55'),
(17, 1256, NULL, 2, '1.0000', '0.0000', '2021-06-04 16:27:25', '2021-06-04 16:27:25'),
(18, 1257, NULL, 2, '1.0000', '0.0000', '2021-06-04 16:36:46', '2021-06-04 16:36:46'),
(19, 1258, NULL, 2, '1.0000', '0.0000', '2021-06-04 17:34:02', '2021-06-04 17:34:02'),
(20, 1259, NULL, 2, '1.0000', '0.0000', '2021-06-04 17:35:34', '2021-06-04 17:35:34'),
(21, 1260, NULL, 2, '1.0000', '0.0000', '2021-06-04 17:56:17', '2021-06-04 17:56:17'),
(22, 1261, NULL, 2, '1.0000', '0.0000', '2021-06-04 17:56:45', '2021-06-04 17:56:45'),
(23, 1262, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:05:09', '2021-06-05 07:05:09'),
(24, 1263, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:08:23', '2021-06-05 07:08:23'),
(25, 1264, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:09:06', '2021-06-05 07:09:06'),
(26, 1265, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:13:27', '2021-06-05 07:13:27'),
(27, 1266, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:14:51', '2021-06-05 07:14:51'),
(28, 1267, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:19:04', '2021-06-05 07:19:04'),
(29, 1268, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:30:34', '2021-06-05 07:30:34'),
(30, 1269, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:35:52', '2021-06-05 07:35:52'),
(31, 1270, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:37:45', '2021-06-05 07:37:45'),
(32, 1271, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:40:13', '2021-06-05 07:40:13'),
(33, 1272, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:46:07', '2021-06-05 07:46:07'),
(34, 1273, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:46:47', '2021-06-05 07:46:47'),
(35, 1274, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:50:48', '2021-06-05 07:50:48'),
(36, 1275, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:57:54', '2021-06-05 07:57:54'),
(37, 1276, NULL, 2, '1.0000', '0.0000', '2021-06-05 07:59:15', '2021-06-05 07:59:15'),
(38, 1277, NULL, 2, '1.0000', '0.0000', '2021-06-05 08:58:41', '2021-06-05 08:58:41'),
(39, 1278, NULL, 2, '1.0000', '0.0000', '2021-06-05 09:00:09', '2021-06-05 09:00:09'),
(40, 1279, NULL, 2, '2.0000', '0.0000', '2021-06-05 09:16:51', '2021-06-05 09:16:51'),
(41, 1280, NULL, 2, '3.0000', '0.0000', '2021-06-05 09:31:51', '2021-06-05 09:31:51'),
(42, 1281, NULL, 2, '1.0000', '0.0000', '2021-06-05 14:46:14', '2021-06-05 14:46:14'),
(43, 1282, NULL, 2, '1.0000', '0.0000', '2021-06-05 14:47:09', '2021-06-05 14:47:09'),
(44, 1283, NULL, 2, '1.0000', '0.0000', '2021-06-05 15:12:01', '2021-06-05 15:12:01'),
(45, 1284, NULL, 2, '5.0000', '0.0000', '2021-06-05 15:15:18', '2021-06-05 15:15:18'),
(46, 1285, NULL, 2, '7.0000', '0.0000', '2021-06-05 15:19:04', '2021-06-05 15:19:04'),
(47, 1286, NULL, 2, '4.0000', '0.0000', '2021-06-05 15:22:36', '2021-06-05 15:22:36'),
(48, 1287, NULL, 2, '1.0000', '0.0000', '2021-06-05 15:35:05', '2021-06-05 15:35:05'),
(49, 1288, NULL, 2, '8.0000', '0.0000', '2021-06-05 15:37:18', '2021-06-05 15:37:18'),
(50, 1289, NULL, 2, '10.0000', '0.0000', '2021-06-05 15:45:50', '2021-06-05 15:45:50'),
(51, 1290, NULL, 2, '1.0000', '0.0000', '2021-06-05 15:47:42', '2021-06-05 15:47:42'),
(52, 1291, NULL, 2, '2.0000', '0.0000', '2021-06-05 17:28:05', '2021-06-05 17:28:05'),
(53, 1292, NULL, 2, '1.0000', '0.0000', '2021-06-06 17:30:11', '2021-06-06 17:30:11'),
(54, 1293, NULL, 2, '3.0000', '0.0000', '2021-06-06 17:36:38', '2021-06-06 17:36:38'),
(55, 1294, NULL, 2, '1.0000', '0.0000', '2021-06-06 18:49:31', '2021-06-06 18:49:31'),
(56, 1289, NULL, 2, '2.0000', '0.0000', '2021-06-06 19:02:36', '2021-06-06 19:02:36'),
(58, 1292, NULL, 2, '2.0000', '0.0000', '2021-06-06 19:54:01', '2021-06-06 19:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'RESTAURANT', NULL, 1, '{\"1\":\"0\",\"2\":\"0\"}', '0.0000', 'fixed', 0, '2020-11-03 14:53:56', '2020-12-14 11:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, 4, '0.0300', 1, NULL, '2019-12-17 14:06:00', '2020-11-10 17:44:43'),
(2, 1, 'Kilogram', 'K.G', 1, NULL, NULL, 1, NULL, '2019-12-21 07:47:04', '2019-12-21 07:47:04'),
(3, 1, 'Packet', 'PKT', 0, NULL, NULL, 1, NULL, '2019-12-21 07:48:23', '2019-12-21 07:48:23'),
(4, 1, 'CTR', 'CTR', 1, NULL, NULL, 1, NULL, '2019-12-21 07:48:47', '2020-12-03 10:11:54'),
(5, 1, 'Bag', 'Bag', 0, NULL, NULL, 1, '2020-12-03 10:11:37', '2019-12-21 07:49:07', '2020-12-03 10:11:37'),
(6, 1, 'Bottle', 'BTL', 0, NULL, NULL, 1, '2020-12-03 10:11:41', '2019-12-21 07:49:24', '2020-12-03 10:11:41'),
(7, 1, 'Litre', 'LTR', 1, NULL, NULL, 1, NULL, '2019-12-21 07:50:01', '2019-12-21 07:50:01'),
(8, 1, 'Meal', 'Meal', 0, NULL, NULL, 1, NULL, '2019-12-21 11:18:51', '2019-12-21 11:18:51'),
(9, 1, 'tray', 'TR', 0, NULL, NULL, 1, NULL, '2020-07-29 09:22:31', '2020-07-29 09:22:31'),
(10, 1, 'gram', 'gm', 1, 2, '1000.0000', 1, NULL, '2020-11-03 14:37:25', '2020-11-05 14:51:07'),
(11, 1, 'PC(S)', 'PC(S)', 0, NULL, NULL, 15, NULL, '2020-12-03 10:13:29', '2020-12-03 10:13:29'),
(12, 1, 'PC(S)', 'PC(S)', 0, NULL, NULL, 15, NULL, '2020-12-03 10:14:16', '2020-12-03 10:14:16'),
(13, 1, 'PC(S)', 'PC(S)', 0, NULL, NULL, 15, NULL, '2020-12-03 10:17:35', '2020-12-03 10:17:35'),
(14, 1, 'kg', 'lg', 0, NULL, NULL, 15, NULL, '2020-12-03 10:31:46', '2020-12-03 10:31:46'),
(15, 1, 'erfewr', 'ewrwe', 0, NULL, NULL, 15, NULL, '2020-12-03 10:32:44', '2020-12-03 10:32:44'),
(16, 1, 're', 'ret', 0, NULL, NULL, 15, NULL, '2020-12-03 10:33:02', '2020-12-03 10:33:02'),
(17, 1, 'e', 'e', 0, NULL, NULL, 1, NULL, '2020-12-03 13:19:04', '2020-12-03 13:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `OEX_DateAssignment` date NOT NULL,
  `OEX_DateStartResident` date NOT NULL,
  `OEX_DateEndResident` date NOT NULL,
  `OEX_SHOW_HRM` tinyint(1) NOT NULL,
  `OEX_SHOW_POSTAB` tinyint(1) NOT NULL,
  `OEX_STOCK_TRANSFER_APPROVAL` tinyint(1) NOT NULL,
  `OEX_STORE_MANAGER` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`, `OEX_DateAssignment`, `OEX_DateStartResident`, `OEX_DateEndResident`, `OEX_SHOW_HRM`, `OEX_SHOW_POSTAB`, `OEX_STOCK_TRANSFER_APPROVAL`, `OEX_STORE_MANAGER`) VALUES
(1, 'Mr', 'healthstudio', 'ADMIN', 'admin', 'admin@healthstudiokuwait.com', '$2y$10$w.47cLDg8.sNmA6zi7uUB.F3VNmii5aOdHwQZp0wivWN9krgqC/5y', 'en', NULL, NULL, 'idhf3sbrgLNOnlXCgRCoRzBZwskd0V4NcipJTzEC7mYTyvFfDIDuoZWD9ueb', 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2020-01-21 12:26:10', '2021-06-02 10:29:36', '0000-00-00', '0000-00-00', '0000-00-00', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(130, 'DUMMY', 130, '0130', 130, NULL, '2.4700', '2.4700', '0.0000', '2.4700', '2.4700', '2019-12-21 11:21:56', '2020-12-07 11:01:23', NULL, '[]'),
(510, 'DUMMY', 510, 'SW-ED-00012', 510, NULL, '12.6600', '12.6600', '0.0000', '12.6600', '12.6600', '2019-12-21 11:21:57', '2020-11-15 16:13:18', NULL, '[]'),
(854, 'Chicken katsu Curry i cab', 855, '0855-1', 854, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-08-31 13:17:13', '2020-08-31 13:17:49', NULL, NULL),
(881, 'DUMMY', 882, '0882', 881, NULL, '2.4700', '2.4700', '0.0000', '2.4700', '2.4700', '2020-09-26 08:15:43', '2020-11-03 16:01:48', NULL, '[]'),
(1886, 'DUMMY', 1, '0001', 1, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:20:39', '2020-12-21 10:32:34', NULL, '[]'),
(1887, 'DUMMY', 2, '0002', 2, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:26:52', '2020-12-07 11:14:10', NULL, '[]'),
(1888, 'DUMMY', 3, '0003', 3, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:27:44', '2020-12-07 11:06:39', NULL, '[]'),
(1889, 'DUMMY', 4, '0004', 4, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:28:22', '2020-12-07 11:12:08', NULL, '[]'),
(1890, 'DUMMY', 5, '0005', 5, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:29:01', '2020-12-03 10:29:01', NULL, '[]'),
(1891, 'DUMMY', 6, '0006', 6, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-03 10:31:54', '2020-12-07 10:16:21', NULL, '[]'),
(1892, 'DUMMY', 7, '0007', 7, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-03 10:33:28', '2020-12-07 09:13:23', NULL, '[]'),
(1893, 'DUMMY', 8, '0008', 8, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-03 10:34:02', '2020-12-07 10:10:56', NULL, '[]'),
(1894, 'DUMMY', 9, '0009', 9, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-03 10:35:56', '2020-12-07 13:03:11', NULL, '[]'),
(1895, 'DUMMY', 10, '0010', 10, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-03 10:36:27', '2020-12-07 13:04:10', NULL, '[]'),
(1896, 'DUMMY', 11, '0011', 11, NULL, '3.1500', '3.1500', '0.0000', '3.1500', '3.1500', '2020-12-03 10:37:03', '2020-12-07 14:40:30', NULL, '[]'),
(1897, 'DUMMY', 12, '0012', 12, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-03 10:37:36', '2020-12-07 11:09:41', NULL, '[]'),
(1899, 'DUMMY', 14, '0014', 14, NULL, '1.6000', '1.6000', '0.0000', '1.6000', '1.6000', '2020-12-03 10:39:35', '2020-12-07 13:40:15', NULL, '[]'),
(1900, 'DUMMY', 15, '0015', 15, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-03 10:40:37', '2020-12-07 13:42:39', NULL, '[]'),
(1901, 'DUMMY', 16, '0016', 16, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-03 10:42:04', '2020-12-03 10:42:04', NULL, '[]'),
(1902, 'DUMMY', 17, '0017', 17, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-03 10:42:37', '2020-12-07 15:14:45', NULL, '[]'),
(1903, 'DUMMY', 18, '0018', 18, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-03 10:43:50', '2020-12-03 10:43:50', NULL, '[]'),
(1904, 'DUMMY', 19, '0019', 19, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-03 10:44:19', '2020-12-07 11:31:39', NULL, '[]'),
(1905, 'DUMMY', 20, '0020', 20, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-03 10:44:52', '2020-12-07 10:25:57', NULL, '[]'),
(1906, 'DUMMY', 21, '0021', 21, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-03 10:45:24', '2020-12-07 14:05:36', NULL, '[]'),
(1907, 'DUMMY', 22, '0022', 22, NULL, '7.0000', '7.0000', '0.0000', '7.0000', '7.0000', '2020-12-03 10:46:14', '2020-12-15 09:54:22', NULL, '[]'),
(1908, 'DUMMY', 23, '0023', 23, NULL, '5.0000', '5.0000', '0.0000', '5.0000', '5.0000', '2020-12-03 10:48:25', '2020-12-03 10:48:25', NULL, '[]'),
(1909, 'DUMMY', 24, '0024', 24, NULL, '2.7000', '2.7000', '0.0000', '2.7000', '2.7000', '2020-12-03 10:49:49', '2020-12-07 10:34:45', NULL, '[]'),
(1910, 'DUMMY', 25, '0025', 25, NULL, '2.1000', '2.1000', '0.0000', '2.1000', '2.1000', '2020-12-03 10:50:24', '2020-12-03 10:50:24', NULL, '[]'),
(1911, 'DUMMY', 26, '0026', 26, NULL, '2.2000', '2.2000', '0.0000', '2.2000', '2.2000', '2020-12-03 10:51:06', '2020-12-03 10:51:06', NULL, '[]'),
(1912, 'DUMMY', 27, '0027', 27, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-03 10:52:12', '2020-12-03 10:52:12', NULL, '[]'),
(1913, 'DUMMY', 28, '0028', 28, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-03 10:52:52', '2020-12-03 10:52:52', NULL, '[]'),
(1914, 'DUMMY', 29, '0029', 29, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-03 10:54:11', '2020-12-07 15:29:56', NULL, '[]'),
(1915, 'DUMMY', 30, '0030', 30, NULL, '1.2500', '1.2500', '0.0000', '1.2500', '1.2500', '2020-12-03 10:54:51', '2020-12-07 15:29:23', NULL, '[]'),
(1916, 'DUMMY', 31, '0031', 31, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-05 12:23:11', '2020-12-07 14:10:00', NULL, '[]'),
(1917, 'DUMMY', 32, '0032', 32, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 12:24:37', '2020-12-07 11:29:42', NULL, '[]'),
(1918, 'DUMMY', 33, '0033', 33, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 12:32:20', '2020-12-07 11:28:52', NULL, '[]'),
(1919, 'DUMMY', 34, '0034', 34, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 12:33:41', '2020-12-07 13:56:25', NULL, '[]'),
(1920, 'DUMMY', 35, '0035', 35, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 12:35:12', '2020-12-07 14:03:49', NULL, '[]'),
(1921, 'DUMMY', 36, '0036', 36, NULL, '0.9500', '0.9500', '0.0000', '0.9500', '0.9500', '2020-12-05 12:36:17', '2020-12-07 15:11:46', NULL, '[]'),
(1922, 'DUMMY', 37, '0037', 37, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 12:36:55', '2020-12-07 15:13:11', NULL, '[]'),
(1923, 'DUMMY', 38, '0038', 38, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-05 12:39:00', '2020-12-07 11:22:24', NULL, '[]'),
(1924, 'DUMMY', 39, '0039', 39, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-05 12:40:00', '2020-12-07 11:23:24', NULL, '[]'),
(1925, 'DUMMY', 40, '0040', 40, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-05 12:40:40', '2020-12-15 09:50:24', NULL, '[]'),
(1926, 'DUMMY', 41, '0041', 41, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:41:25', '2020-12-07 11:32:36', NULL, '[]'),
(1927, 'DUMMY', 42, '0042', 42, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:42:23', '2020-12-07 11:33:29', NULL, '[]'),
(1928, 'DUMMY', 43, '0043', 43, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:43:12', '2020-12-07 11:34:18', NULL, '[]'),
(1929, 'DUMMY', 44, '0044', 44, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:44:02', '2020-12-07 11:35:24', NULL, '[]'),
(1930, 'DUMMY', 45, '0045', 45, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:44:46', '2020-12-07 11:36:16', NULL, '[]'),
(1931, 'DUMMY', 46, '0046', 46, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:45:31', '2020-12-07 11:37:06', NULL, '[]'),
(1932, 'DUMMY', 47, '0047', 47, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:46:07', '2020-12-07 11:38:02', NULL, '[]'),
(1933, 'DUMMY', 48, '0048', 48, NULL, '0.7000', '0.7000', '0.0000', '0.7000', '0.7000', '2020-12-05 12:46:37', '2020-12-07 11:38:45', NULL, '[]'),
(1934, 'DUMMY', 49, '0049', 49, NULL, '0.6500', '0.6500', '0.0000', '0.6500', '0.6500', '2020-12-05 13:32:44', '2020-12-07 15:33:32', NULL, '[]'),
(1935, 'DUMMY', 50, '0050', 50, NULL, '1.2500', '1.2500', '0.0000', '1.2500', '1.2500', '2020-12-05 13:43:35', '2020-12-05 13:43:35', NULL, '[]'),
(1936, 'DUMMY', 51, '0051', 51, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 13:44:39', '2020-12-05 13:44:39', NULL, '[]'),
(1937, 'DUMMY', 52, '0052', 52, NULL, '0.6500', '0.6500', '0.0000', '0.6500', '0.6500', '2020-12-05 13:46:24', '2020-12-07 13:06:20', NULL, '[]'),
(1938, 'DUMMY', 53, '0053', 53, NULL, '2.1500', '2.1500', '0.0000', '2.1500', '2.1500', '2020-12-05 13:47:25', '2020-12-07 10:31:09', NULL, '[]'),
(1939, 'DUMMY', 54, '0054', 54, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 13:48:14', '2020-12-07 11:25:25', NULL, '[]'),
(1940, 'DUMMY', 55, '0055', 55, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-05 13:48:51', '2020-12-07 11:30:46', NULL, '[]'),
(1941, 'DUMMY', 56, '0056', 56, NULL, '0.3500', '0.3500', '0.0000', '0.3500', '0.3500', '2020-12-05 13:50:36', '2020-12-15 09:52:21', NULL, '[]'),
(1942, 'DUMMY', 57, '0057', 57, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-05 13:51:24', '2020-12-07 13:44:08', NULL, '[]'),
(1943, 'DUMMY', 58, '0058', 58, NULL, '1.2500', '1.2500', '0.0000', '1.2500', '1.2500', '2020-12-05 14:01:35', '2020-12-07 13:50:39', NULL, '[]'),
(1944, 'DUMMY', 59, '0059', 59, NULL, '2.0000', '2.0000', '0.0000', '2.0000', '2.0000', '2020-12-05 14:02:07', '2020-12-07 13:53:49', NULL, '[]'),
(1945, 'DUMMY', 60, '0060', 60, NULL, '2.0000', '2.0000', '0.0000', '2.0000', '2.0000', '2020-12-05 14:02:55', '2020-12-07 13:57:20', NULL, '[]'),
(1946, 'DUMMY', 61, '0061', 61, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 14:03:34', '2020-12-07 15:16:18', NULL, '[]'),
(1947, 'DUMMY', 62, '0062', 62, NULL, '1.8500', '1.8500', '0.0000', '1.8500', '1.8500', '2020-12-05 14:04:08', '2020-12-07 15:28:07', NULL, '[]'),
(1948, 'DUMMY', 63, '0063', 63, NULL, '2.0000', '2.0000', '0.0000', '2.0000', '2.0000', '2020-12-05 14:05:13', '2020-12-07 15:28:48', NULL, '[]'),
(1949, 'DUMMY', 64, '0064', 64, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 14:05:57', '2020-12-07 15:30:50', NULL, '[]'),
(1950, 'DUMMY', 65, '0065', 65, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 14:06:38', '2020-12-07 08:54:00', NULL, '[]'),
(1951, 'DUMMY', 66, '0066', 66, NULL, '1.6500', '1.6500', '0.0000', '1.6500', '1.6500', '2020-12-05 14:07:32', '2020-12-05 14:07:32', NULL, '[]'),
(1952, 'DUMMY', 67, '0067', 67, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 14:08:46', '2020-12-05 14:08:46', NULL, '[]'),
(1953, 'DUMMY', 68, '0068', 68, NULL, '1.2500', '1.2500', '0.0000', '1.2500', '1.2500', '2020-12-05 14:09:21', '2020-12-05 14:09:21', NULL, '[]'),
(1954, 'DUMMY', 69, '0069', 69, NULL, '0.9000', '0.9000', '0.0000', '0.9000', '0.9000', '2020-12-05 14:12:19', '2020-12-05 14:12:19', NULL, '[]'),
(1955, 'DUMMY', 70, '0070', 70, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 14:12:58', '2020-12-05 14:12:58', NULL, '[]'),
(1956, 'DUMMY', 71, '0071', 71, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 14:14:09', '2020-12-05 14:14:09', NULL, '[]'),
(1957, 'DUMMY', 72, '0072', 72, NULL, '0.7500', '0.7500', '0.0000', '0.7500', '0.7500', '2020-12-05 14:15:00', '2020-12-07 13:07:22', NULL, '[]'),
(1958, 'DUMMY', 73, '0073', 73, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 14:15:34', '2020-12-05 14:15:34', NULL, '[]'),
(1959, 'DUMMY', 74, '0074', 74, NULL, '1.6500', '1.6500', '0.0000', '1.6500', '1.6500', '2020-12-05 14:16:24', '2020-12-05 14:16:24', NULL, '[]'),
(1960, 'DUMMY', 75, '0075', 75, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 14:17:03', '2020-12-05 14:17:03', NULL, '[]'),
(1961, 'DUMMY', 76, '0076', 76, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 14:17:42', '2020-12-05 14:17:42', NULL, '[]'),
(1962, 'DUMMY', 77, '0077', 77, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 14:18:56', '2020-12-05 14:18:56', NULL, '[]'),
(1963, 'DUMMY', 78, '0078', 78, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 14:19:41', '2020-12-05 14:19:41', NULL, '[]'),
(1964, 'DUMMY', 79, '0079', 79, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 14:20:11', '2020-12-07 15:10:55', NULL, '[]'),
(1965, 'DUMMY', 80, '0080', 80, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 14:20:44', '2020-12-07 15:15:35', NULL, '[]'),
(1966, 'DUMMY', 81, '0081', 81, NULL, '1.8500', '1.8500', '0.0000', '1.8500', '1.8500', '2020-12-05 14:21:49', '2020-12-05 14:21:49', NULL, '[]'),
(1967, 'DUMMY', 82, '0082', 82, NULL, '1.9500', '1.9500', '0.0000', '1.9500', '1.9500', '2020-12-05 14:22:31', '2020-12-05 14:22:31', NULL, '[]'),
(1968, 'DUMMY', 83, '0083', 83, NULL, '1.7500', '1.7500', '0.0000', '1.7500', '1.7500', '2020-12-05 14:23:07', '2020-12-07 13:49:47', NULL, '[]'),
(1969, 'DUMMY', 84, '0084', 84, NULL, '1.6500', '1.6500', '0.0000', '1.6500', '1.6500', '2020-12-05 14:23:37', '2020-12-07 13:55:14', NULL, '[]'),
(1970, 'DUMMY', 85, '0085', 85, NULL, '3.2500', '3.2500', '0.0000', '3.2500', '3.2500', '2020-12-05 14:24:44', '2020-12-07 09:12:41', NULL, '[]'),
(1971, 'DUMMY', 86, '0086', 86, NULL, '4.0000', '4.0000', '0.0000', '4.0000', '4.0000', '2020-12-05 14:25:29', '2020-12-07 10:15:17', NULL, '[]'),
(1972, 'DUMMY', 87, '0087', 87, NULL, '4.2500', '4.2500', '0.0000', '4.2500', '4.2500', '2020-12-05 14:27:16', '2020-12-07 10:20:34', NULL, '[]'),
(1973, 'DUMMY', 88, '0088', 88, NULL, '4.0000', '4.0000', '0.0000', '4.0000', '4.0000', '2020-12-05 14:27:55', '2020-12-07 10:21:53', NULL, '[]'),
(1974, 'DUMMY', 89, '0089', 89, NULL, '3.1000', '3.1000', '0.0000', '3.1000', '3.1000', '2020-12-05 14:28:43', '2020-12-07 10:23:55', NULL, '[]'),
(1975, 'DUMMY', 90, '0090', 90, NULL, '3.5000', '3.5000', '0.0000', '3.5000', '3.5000', '2020-12-05 14:29:21', '2020-12-07 10:24:46', NULL, '[]'),
(1976, 'DUMMY', 91, '0091', 91, NULL, '2.9000', '2.9000', '0.0000', '2.9000', '2.9000', '2020-12-05 14:30:01', '2020-12-07 10:39:37', NULL, '[]'),
(1977, 'DUMMY', 92, '0092', 92, NULL, '2.9000', '2.9000', '0.0000', '2.9000', '2.9000', '2020-12-05 14:30:38', '2020-12-07 11:03:03', NULL, '[]'),
(1978, 'DUMMY', 93, '0093', 93, NULL, '3.5000', '3.5000', '0.0000', '3.5000', '3.5000', '2020-12-05 14:31:10', '2020-12-07 11:11:21', NULL, '[]'),
(1979, 'DUMMY', 94, '0094', 94, NULL, '3.4000', '3.4000', '0.0000', '3.4000', '3.4000', '2020-12-05 14:32:15', '2020-12-07 11:13:06', NULL, '[]'),
(1980, 'DUMMY', 95, '0095', 95, NULL, '3.2500', '3.2500', '0.0000', '3.2500', '3.2500', '2020-12-05 14:33:23', '2020-12-07 11:20:04', NULL, '[]'),
(1981, 'DUMMY', 96, '0096', 96, NULL, '3.2000', '3.2000', '0.0000', '3.2000', '3.2000', '2020-12-05 14:34:16', '2020-12-07 11:48:47', NULL, '[]'),
(1982, 'DUMMY', 97, '0097', 97, NULL, '3.3000', '3.3000', '0.0000', '3.3000', '3.3000', '2020-12-05 14:34:50', '2020-12-07 13:05:08', NULL, '[]'),
(1983, 'DUMMY', 98, '0098', 98, NULL, '4.5000', '4.5000', '0.0000', '4.5000', '4.5000', '2020-12-05 14:35:52', '2020-12-07 13:13:41', NULL, '[]'),
(1984, 'DUMMY', 99, '0099', 99, NULL, '3.4000', '3.4000', '0.0000', '3.4000', '3.4000', '2020-12-05 14:36:35', '2020-12-07 13:14:51', NULL, '[]'),
(1985, 'DUMMY', 100, '0100', 100, NULL, '3.1500', '3.1500', '0.0000', '3.1500', '3.1500', '2020-12-05 14:37:17', '2020-12-07 13:41:12', NULL, '[]'),
(1986, 'DUMMY', 101, '0101', 101, NULL, '3.4000', '3.4000', '0.0000', '3.4000', '3.4000', '2020-12-05 14:38:09', '2020-12-07 13:43:23', NULL, '[]'),
(1987, 'DUMMY', 102, '0102', 102, NULL, '5.9000', '5.9000', '0.0000', '5.9000', '5.9000', '2020-12-05 14:39:02', '2020-12-07 13:44:46', NULL, '[]'),
(1988, 'DUMMY', 103, '0103', 103, NULL, '5.0000', '5.0000', '0.0000', '5.0000', '5.0000', '2020-12-05 14:39:38', '2020-12-07 13:45:28', NULL, '[]'),
(1989, 'DUMMY', 104, '0104', 104, NULL, '4.1000', '4.1000', '0.0000', '4.1000', '4.1000', '2020-12-05 14:40:29', '2020-12-07 13:48:46', NULL, '[]'),
(1990, 'DUMMY', 105, '0105', 105, NULL, '4.5000', '4.5000', '0.0000', '4.5000', '4.5000', '2020-12-05 14:42:08', '2020-12-07 13:52:15', NULL, '[]'),
(1991, 'DUMMY', 106, '0106', 106, NULL, '4.2500', '4.2500', '0.0000', '4.2500', '4.2500', '2020-12-05 14:42:49', '2020-12-07 13:53:04', NULL, '[]'),
(1992, 'DUMMY', 107, '0107', 107, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-05 14:43:42', '2020-12-07 13:54:33', NULL, '[]'),
(1993, 'DUMMY', 108, '0108', 108, NULL, '3.2500', '3.2500', '0.0000', '3.2500', '3.2500', '2020-12-05 14:44:19', '2020-12-07 14:04:44', NULL, '[]'),
(1994, 'DUMMY', 109, '0109', 109, NULL, '5.5000', '5.5000', '0.0000', '5.5000', '5.5000', '2020-12-05 14:45:04', '2020-12-07 15:12:32', NULL, '[]'),
(1995, 'DUMMY', 110, '0110', 110, NULL, '5.9000', '5.9000', '0.0000', '5.9000', '5.9000', '2020-12-05 14:45:36', '2020-12-07 15:13:50', NULL, '[]'),
(1996, 'DUMMY', 111, '0111', 111, NULL, '0.2500', '0.2500', '0.0000', '0.2500', '0.2500', '2020-12-05 14:46:32', '2020-12-07 10:28:19', NULL, '[]'),
(1997, 'DUMMY', 112, '0112', 112, NULL, '0.4000', '0.4000', '0.0000', '0.4000', '0.4000', '2020-12-05 14:47:19', '2020-12-06 12:04:16', NULL, '[]'),
(1998, 'DUMMY', 113, '0113', 113, NULL, '0.7500', '0.7500', '0.0000', '0.7500', '0.7500', '2020-12-05 14:48:52', '2020-12-07 10:29:24', NULL, '[]'),
(1999, 'DUMMY', 114, '0114', 114, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 14:49:31', '2020-12-05 14:49:31', NULL, '[]'),
(2000, 'DUMMY', 115, '0115', 115, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 14:51:26', '2020-12-05 14:51:26', NULL, '[]'),
(2001, 'DUMMY', 116, '0116', 116, NULL, '0.7500', '0.7500', '0.0000', '0.7500', '0.7500', '2020-12-05 14:52:09', '2020-12-07 11:39:51', NULL, '[]'),
(2002, 'DUMMY', 117, '0117', 117, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 14:53:23', '2020-12-07 11:43:26', NULL, '[]'),
(2003, 'DUMMY', 118, '0118', 118, NULL, '0.2500', '0.2500', '0.0000', '0.2500', '0.2500', '2020-12-05 14:53:57', '2020-12-07 11:45:26', NULL, '[]'),
(2004, 'DUMMY', 119, '0119', 119, NULL, '0.3500', '0.3500', '0.0000', '0.3500', '0.3500', '2020-12-05 14:54:50', '2020-12-07 11:47:02', NULL, '[]'),
(2005, 'DUMMY', 120, '0120', 120, NULL, '0.7500', '0.7500', '0.0000', '0.7500', '0.7500', '2020-12-05 14:55:46', '2020-12-07 11:47:49', NULL, '[]'),
(2006, 'DUMMY', 121, '0121', 121, NULL, '0.7500', '0.7500', '0.0000', '0.7500', '0.7500', '2020-12-05 14:57:21', '2020-12-05 14:57:21', NULL, '[]'),
(2007, 'DUMMY', 122, '0122', 122, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 14:58:32', '2020-12-05 14:58:32', NULL, '[]'),
(2008, 'DUMMY', 123, '0123', 123, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 14:59:50', '2020-12-07 10:17:35', NULL, '[]'),
(2009, 'DUMMY', 124, '0124', 124, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:00:20', '2020-12-07 10:13:43', NULL, '[]'),
(2010, 'DUMMY', 125, '0125', 125, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:01:15', '2020-12-07 11:04:34', NULL, '[]'),
(2011, 'DUMMY', 126, '0126', 126, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:01:54', '2020-12-07 11:18:53', NULL, '[]'),
(2012, 'DUMMY', 127, '0127', 127, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:03:15', '2020-12-07 13:47:11', NULL, '[]'),
(2013, 'DUMMY', 128, '0128', 128, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:03:51', '2020-12-07 13:48:04', NULL, '[]'),
(2014, 'DUMMY', 129, '0129', 129, NULL, '2.7000', '2.7000', '0.0000', '2.7000', '2.7000', '2020-12-05 15:04:55', '2020-12-05 15:04:55', NULL, '[]'),
(2015, 'DUMMY', 130, '0130', 130, NULL, '2.1000', '2.1000', '0.0000', '2.1000', '2.1000', '2020-12-05 15:09:04', '2020-12-05 15:09:04', NULL, '[]'),
(2016, 'DUMMY', 131, '0131', 131, NULL, '2.5000', '2.5000', '0.0000', '2.5000', '2.5000', '2020-12-05 15:10:11', '2020-12-07 11:26:11', NULL, '[]'),
(2017, 'DUMMY', 132, '0132', 132, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-05 15:11:12', '2020-12-07 13:46:17', NULL, '[]'),
(2018, 'DUMMY', 133, '0133', 133, NULL, '2.2000', '2.2000', '0.0000', '2.2000', '2.2000', '2020-12-05 15:11:42', '2020-12-07 15:19:37', NULL, '[]'),
(2019, 'DUMMY', 134, '0134', 134, NULL, '2.3000', '2.3000', '0.0000', '2.3000', '2.3000', '2020-12-05 15:12:18', '2020-12-07 15:31:24', NULL, '[]'),
(2020, 'DUMMY', 135, '0135', 135, NULL, '1.6500', '1.6500', '0.0000', '1.6500', '1.6500', '2020-12-05 15:13:29', '2020-12-07 09:11:57', NULL, '[]'),
(2021, 'DUMMY', 136, '0136', 136, NULL, '2.0000', '2.0000', '0.0000', '2.0000', '2.0000', '2020-12-05 15:14:04', '2020-12-07 10:12:55', NULL, '[]'),
(2022, 'DUMMY', 137, '0137', 137, NULL, '1.8000', '1.8000', '0.0000', '1.8000', '1.8000', '2020-12-05 15:14:40', '2020-12-07 11:18:09', NULL, '[]'),
(2023, 'DUMMY', 138, '0138', 138, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:15:21', '2020-12-07 13:09:00', NULL, '[]'),
(2024, 'DUMMY', 139, '0139', 139, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:16:03', '2020-12-07 13:41:52', NULL, '[]'),
(2025, 'DUMMY', 140, '0140', 140, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:16:51', '2020-12-05 15:16:51', NULL, '[]'),
(2026, 'DUMMY', 141, '0141', 141, NULL, '1.3500', '1.3500', '0.0000', '1.3500', '1.3500', '2020-12-05 15:23:25', '2020-12-15 09:47:14', NULL, '[]'),
(2027, 'DUMMY', 142, '0142', 142, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 15:24:54', '2020-12-05 15:24:54', NULL, '[]'),
(2028, 'DUMMY', 143, '0143', 143, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:26:39', '2020-12-05 15:26:39', NULL, '[]'),
(2029, 'DUMMY', 144, '0144', 144, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:27:30', '2020-12-05 15:27:30', NULL, '[]'),
(2030, 'DUMMY', 145, '0145', 145, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:28:21', '2020-12-05 15:28:21', NULL, '[]'),
(2031, 'DUMMY', 146, '0146', 146, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:29:15', '2020-12-05 15:29:15', NULL, '[]'),
(2032, 'DUMMY', 147, '0147', 147, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:29:45', '2020-12-07 10:32:29', NULL, '[]'),
(2033, 'DUMMY', 148, '0148', 148, NULL, '1.5000', '1.5000', '0.0000', '1.5000', '1.5000', '2020-12-05 15:30:19', '2020-12-07 11:24:16', NULL, '[]'),
(2034, 'DUMMY', 149, '0149', 149, NULL, '2.0000', '2.0000', '0.0000', '2.0000', '2.0000', '2020-12-05 15:33:54', '2020-12-07 11:26:55', NULL, '[]'),
(2035, 'DUMMY', 150, '0150', 150, NULL, '1.0000', '1.0000', '0.0000', '1.0000', '1.0000', '2020-12-05 15:34:29', '2020-12-05 15:34:29', NULL, '[]'),
(2036, 'DUMMY', 151, '0151', 151, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 15:35:17', '2020-12-05 15:35:17', NULL, '[]'),
(2037, 'DUMMY', 152, '0152', 152, NULL, '7.0000', '7.0000', '0.0000', '7.0000', '7.0000', '2020-12-05 15:36:07', '2020-12-05 15:36:07', NULL, '[]'),
(2038, 'DUMMY', 153, '0153', 153, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 15:39:11', '2020-12-05 15:39:11', NULL, '[]'),
(2039, 'DUMMY', 154, '0154', 154, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 15:39:57', '2020-12-05 15:39:57', NULL, '[]'),
(2040, 'DUMMY', 155, '0155', 155, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 15:40:40', '2020-12-05 15:40:40', NULL, '[]'),
(2041, 'DUMMY', 156, '0156', 156, NULL, '2.2500', '2.2500', '0.0000', '2.2500', '2.2500', '2020-12-05 15:41:28', '2020-12-05 15:41:28', NULL, '[]'),
(2042, 'DUMMY', 157, '0157', 157, NULL, '3.4000', '3.4000', '0.0000', '3.4000', '3.4000', '2020-12-05 16:02:23', '2020-12-07 11:17:18', NULL, '[]'),
(2043, 'DUMMY', 158, '0158', 158, NULL, '4.4000', '4.4000', '0.0000', '4.4000', '4.4000', '2020-12-05 16:04:20', '2020-12-07 10:12:08', NULL, '[]'),
(2044, 'DUMMY', 159, '0159', 159, NULL, '4.7000', '4.7000', '0.0000', '4.7000', '4.7000', '2020-12-05 16:05:48', '2020-12-07 10:09:51', NULL, '[]'),
(2045, 'DUMMY', 160, '0160', 160, NULL, '4.6000', '4.6000', '0.0000', '4.6000', '4.6000', '2020-12-05 16:06:47', '2020-12-07 14:09:11', NULL, '[]'),
(2046, 'DUMMY', 161, '0161', 161, NULL, '4.0000', '4.0000', '0.0000', '4.0000', '4.0000', '2020-12-05 16:07:31', '2020-12-07 14:39:20', NULL, '[]'),
(2047, 'DUMMY', 162, '0162', 162, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 16:09:06', '2020-12-07 11:44:31', NULL, '[]'),
(2048, 'DUMMY', 163, '0163', 163, NULL, '2.3000', '2.3000', '0.0000', '2.3000', '2.3000', '2020-12-05 16:32:01', '2020-12-07 14:31:19', NULL, '[]'),
(2049, 'DUMMY', 164, '0164', 164, NULL, '2.1000', '2.1000', '0.0000', '2.1000', '2.1000', '2020-12-05 16:33:41', '2020-12-07 11:21:41', NULL, '[]'),
(2050, 'DUMMY', 165, '0165', 165, NULL, '4.5000', '4.5000', '0.0000', '4.5000', '4.5000', '2020-12-05 16:38:13', '2020-12-07 13:51:29', NULL, '[]'),
(2051, 'DUMMY', 166, '0166', 166, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-05 16:46:57', '2020-12-05 16:46:57', NULL, '[]'),
(2052, 'DUMMY', 167, '0167', 167, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-05 16:48:14', '2020-12-05 16:48:14', NULL, '[]'),
(2053, 'DUMMY', 168, '0168', 168, NULL, '3.7500', '3.7500', '0.0000', '3.7500', '3.7500', '2020-12-05 16:48:53', '2020-12-07 09:13:58', NULL, '[]'),
(2054, 'DUMMY', 169, '0169', 169, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:49:28', '2020-12-05 16:49:28', NULL, '[]'),
(2055, 'DUMMY', 170, '0170', 170, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:50:15', '2020-12-05 16:50:15', NULL, '[]'),
(2056, 'DUMMY', 171, '0171', 171, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:50:50', '2020-12-23 14:39:33', NULL, '[]'),
(2057, 'DUMMY', 172, '0172', 172, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:51:52', '2020-12-05 16:51:52', NULL, '[]'),
(2058, 'DUMMY', 173, '0173', 173, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:52:25', '2020-12-07 10:35:55', NULL, '[]'),
(2059, 'DUMMY', 174, '0174', 174, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:53:03', '2020-12-07 10:37:27', NULL, '[]'),
(2060, 'DUMMY', 175, '0175', 175, NULL, '2.7500', '2.7500', '0.0000', '2.7500', '2.7500', '2020-12-05 16:53:30', '2020-12-05 16:53:30', NULL, '[]'),
(2061, 'DUMMY', 176, '0176', 176, NULL, '2.4000', '2.4000', '0.0000', '2.4000', '2.4000', '2020-12-05 16:54:11', '2020-12-05 16:54:11', NULL, '[]'),
(2062, 'DUMMY', 177, '0177', 177, NULL, '3.1500', '3.1500', '0.0000', '3.1500', '3.1500', '2020-12-05 16:55:20', '2020-12-05 16:55:20', NULL, '[]'),
(2063, 'DUMMY', 178, '0178', 178, NULL, '1.1000', '1.1000', '0.0000', '1.1000', '1.1000', '2020-12-05 17:01:36', '2020-12-05 17:01:36', NULL, '[]'),
(2064, 'DUMMY', 179, '0179', 179, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 17:15:02', '2020-12-07 11:42:29', NULL, '[]'),
(2065, 'DUMMY', 180, '0180', 180, NULL, '0.5000', '0.5000', '0.0000', '0.5000', '0.5000', '2020-12-05 17:16:54', '2020-12-07 15:32:38', NULL, '[]'),
(2066, 'DUMMY', 181, '0181', 181, NULL, '10.0000', '10.0000', '0.0000', '10.0000', '10.0000', '2020-12-14 09:27:53', '2020-12-14 09:27:53', NULL, '[]'),
(2067, 'DUMMY', 182, '1234567', 182, NULL, '0.0000', '0.0000', '0.0000', '2.0000', '2.0000', '2021-05-28 15:28:59', '2021-05-28 16:05:01', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 168, 168, 2053, 1, '4.0000', '2020-12-07 08:56:07', '2020-12-07 08:56:07'),
(2, 182, 182, 2067, 1, '9999999911.0000', '2021-05-28 15:29:19', '2021-06-06 19:54:00'),
(3, 182, 182, 2067, 2, '10.0000', '2021-05-28 15:29:19', '2021-05-28 15:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `AREAS`
--
ALTER TABLE `AREAS`
  ADD PRIMARY KEY (`AREA_ID`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `customer_subscriptions`
--
ALTER TABLE `customer_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_attendances_user_id_index` (`user_id`),
  ADD KEY `essentials_attendances_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_holidays_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  ADD KEY `essentials_leaves_business_id_index` (`business_id`),
  ADD KEY `essentials_leaves_user_id_index` (`user_id`);

--
-- Indexes for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_leave_types_business_id_index` (`business_id`);

--
-- Indexes for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_todo_comments_task_id_index` (`task_id`),
  ADD KEY `essentials_todo_comments_comment_by_index` (`comment_by`);

--
-- Indexes for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `essentials_to_dos_status_index` (`status`),
  ADD KEY `essentials_to_dos_priority_index` (`priority`),
  ADD KEY `essentials_to_dos_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `KW_AREA`
--
ALTER TABLE `KW_AREA`
  ADD PRIMARY KEY (`AREA_ID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `PROVINCE`
--
ALTER TABLE `PROVINCE`
  ADD PRIMARY KEY (`PROVINCE_ID`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`(191));

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_registers`
--
ALTER TABLE `subscription_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `tbl_drivers`
--
ALTER TABLE `tbl_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_outside_customers`
--
ALTER TABLE `tbl_outside_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_outside_orders`
--
ALTER TABLE `tbl_outside_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`(191)),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`(191));

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1445;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customer_subscriptions`
--
ALTER TABLE `customer_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `essentials_allowances_and_deductions`
--
ALTER TABLE `essentials_allowances_and_deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_attendances`
--
ALTER TABLE `essentials_attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_documents`
--
ALTER TABLE `essentials_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_document_shares`
--
ALTER TABLE `essentials_document_shares`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_holidays`
--
ALTER TABLE `essentials_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leaves`
--
ALTER TABLE `essentials_leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_leave_types`
--
ALTER TABLE `essentials_leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_messages`
--
ALTER TABLE `essentials_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_reminders`
--
ALTER TABLE `essentials_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_todo_comments`
--
ALTER TABLE `essentials_todo_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `essentials_to_dos`
--
ALTER TABLE `essentials_to_dos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `KW_AREA`
--
ALTER TABLE `KW_AREA`
  MODIFY `AREA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `PROVINCE`
--
ALTER TABLE `PROVINCE`
  MODIFY `PROVINCE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subscription_registers`
--
ALTER TABLE `subscription_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_drivers`
--
ALTER TABLE `tbl_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_outside_customers`
--
ALTER TABLE `tbl_outside_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_outside_orders`
--
ALTER TABLE `tbl_outside_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=751;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=704;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1296;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2068;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
