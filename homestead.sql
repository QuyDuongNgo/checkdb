-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: mysql
-- Thời gian đã tạo: Th12 20, 2022 lúc 08:17 AM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `homestead`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `employee_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '管理者名',
  `station_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーションID',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'メール',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'パスワード',
  `email_verified_at` datetime DEFAULT NULL COMMENT 'メール認証日時',
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '電話番号',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'トークン',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `allow_two_factor` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2つの要素を許可する',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'トークン',
  `expires_at` datetime DEFAULT NULL,
  `two_factor_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL,
  `count_wrong_pwd` tinyint NOT NULL DEFAULT '0' COMMENT 'パスワード誤り回数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理者';

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `employee_id`, `franchise_id`, `name`, `station_id`, `email`, `password`, `email_verified_at`, `parent_id`, `phone`, `remember_token`, `status`, `allow_two_factor`, `created_at`, `updated_at`, `deleted_at`, `token`, `expires_at`, `two_factor_code`, `two_factor_expires_at`, `count_wrong_pwd`) VALUES
('055f779b-93d2-4d92-a13f-f1f120d259b3', 'A0022B', NULL, 'amlPbll4UlJHT0lwUlIwNjlBdUhMMWRhdXY3TDJWU2tQcnlDcUkzZVFJZmk4Uk1BbDBzdE15ZDlERllVcEZHdA==', NULL, 'ZW5UTG12ZUh4NW1vN0hwSWlwdTQ4aUx1bTJ1OXlBV2s1bFUwOFY1RGc3L2IxSlY2OWZYeHV4dmpSL0dhd1dCSA==', '$2y$10$dmpzx52UmWdYejWgOGP5yezU4aYNRhRAu/LfOo/wUxW/Z.mIzXjxq', '2022-12-19 12:04:25', NULL, NULL, NULL, 1, 1, '2022-12-19 12:04:25', '2022-12-19 12:04:25', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_tokens`
--

CREATE TABLE `admin_tokens` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `token` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_dt` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `agents`
--

CREATE TABLE `agents` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズ名',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住所',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電話番号',
  `company_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企業コード',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `amount_correction_history`
--

CREATE TABLE `amount_correction_history` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_edit` bigint DEFAULT NULL COMMENT '訂正前',
  `after_edit` bigint DEFAULT NULL COMMENT '訂正後',
  `edited_by` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '訂正者',
  `edited_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reservation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cancel_plans`
--

CREATE TABLE `cancel_plans` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `cancel_policy_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_number` tinyint DEFAULT NULL COMMENT '日前',
  `rate` bigint DEFAULT NULL COMMENT '率',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cancel_policies`
--

CREATE TABLE `cancel_policies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `valid_start_date` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '適用開始日',
  `valid_end_date` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '適用終了日',
  `max_amount` bigint DEFAULT NULL COMMENT '上限金額',
  `without_permission` bigint DEFAULT NULL COMMENT '無断',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `display_rank` int DEFAULT '1' COMMENT '表示順',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `check_display_users`
--

CREATE TABLE `check_display_users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `station_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefecture_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'キー',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'バリュー',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='コンフィグ';

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
('45f6b6db-906e-42bc-a036-7e5d73fa46a8', 'work_days', '7', '2022-12-19 12:02:09', '2022-12-19 12:02:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `devices`
--

CREATE TABLE `devices` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UDID',
  `status` tinyint DEFAULT NULL COMMENT 'ステーション名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='デバイス';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `franchises`
--

CREATE TABLE `franchises` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `agent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズ名',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住所',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電話番号',
  `company_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企業コード',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='フランチャイズ';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `franchise_policies`
--

CREATE TABLE `franchise_policies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '1:貸渡約款, 2:特定商取引法',
  `franchise_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `franchise_settings`
--

CREATE TABLE `franchise_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID(DC2Type:guid)',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'キー',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'バリュー',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='フランチャイズ設定';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `holiday_calendars`
--

CREATE TABLE `holiday_calendars` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `date` date DEFAULT NULL COMMENT '祝日',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '祝日名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='休日カレンダー';

--
-- Đang đổ dữ liệu cho bảng `holiday_calendars`
--

INSERT INTO `holiday_calendars` (`id`, `date`, `name`, `created_at`, `updated_at`) VALUES
('13c14cfc-b46c-4f66-ae11-d2b8bbbe170c', '2022-01-01', 'Holiday', '2022-12-19 12:02:09', '2022-12-19 12:02:09'),
('55abf9c5-4fc0-4846-8cb0-47bcb55cdb90', '2022-11-02', 'Holiday', '2022-12-19 12:02:09', '2022-12-19 12:02:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_08_04_091216_create_categories_table', 1),
(2, '2022_08_08_090220_create_users_table', 1),
(3, '2022_08_08_090514_create_franchises_table', 1),
(4, '2022_08_08_091706_create_user_payments_table', 1),
(5, '2022_08_08_092020_create_user_licences_table', 1),
(6, '2022_08_08_092835_create_admins_table', 1),
(7, '2022_08_08_093723_create_areas_table', 1),
(8, '2022_08_08_093933_create_prefectures_table', 1),
(9, '2022_08_08_094510_create_cities_table', 1),
(10, '2022_08_08_094956_create_stations_table', 1),
(11, '2022_08_08_094957_create_vehicles_table', 1),
(12, '2022_08_08_094958_create_reservations_table', 1),
(13, '2022_08_08_094959_create_transactions_table', 1),
(14, '2022_08_08_095221_create_vehicle_details_table', 1),
(15, '2022_08_08_095439_create_notifications_table', 1),
(16, '2022_08_08_095440_create_user_tokens_table', 1),
(17, '2022_08_09_044355_create_reservation_details_table', 1),
(18, '2022_08_09_044623_create_calendars_table', 1),
(19, '2022_08_09_153944_create_phone_tokens_table', 1),
(20, '2022_08_12_073512_create_roles_table', 1),
(21, '2022_08_12_073611_create_permissions_table', 1),
(22, '2022_08_12_073642_create_role_admin_table', 1),
(23, '2022_08_12_073731_create_permission_role_table', 1),
(24, '2022_08_16_072325_create_configs_table', 1),
(25, '2022_08_18_084425_create_operations_table', 1),
(26, '2022_08_23_141321_create_prices_table', 1),
(27, '2022_08_23_145251_create_devices_table', 1),
(28, '2022_08_23_145252_create_vehicle_inssurances_table', 1),
(29, '2022_08_23_145634_create_vehicle_accessories_table', 1),
(30, '2022_08_23_153638_create_admin_tokens_table', 1),
(31, '2022_08_24_013122_add_phone_number_to_admins_table', 1),
(32, '2022_08_26_082114_create_policies_table', 1),
(33, '2022_08_29_023635_add_user_to_id_to_notifications_table', 1),
(34, '2022_08_29_091549_add_two_factor_fields_to_admins_table', 1),
(35, '2022_08_31_023516_create_vehicle_models_table', 1),
(36, '2022_09_05_085445_create_franchise_setting_table', 1),
(37, '2022_09_05_095502_create_vehicle_lock_table', 1),
(38, '2022_09_07_032013_add_station_id_to_admin_table', 1),
(39, '2022_09_08_064834_add_remark_reservations_table', 1),
(40, '2022_09_08_102448_add_remarks_to_users_table', 1),
(41, '2022_09_09_044307_add_allow_two_factor_to_admins_table', 1),
(42, '2022_09_09_094542_update_latitude_longitude_stations_operations_table', 1),
(43, '2022_09_12_083451_add_first_last_name_kana_to_users_table', 1),
(44, '2022_09_13_062727_add_freekey_reservation_id_reservation_table', 1),
(45, '2022_09_13_072654_add_display_rank_to_categories_table', 1),
(46, '2022_09_16_072823_add_field_franchise_id', 1),
(47, '2022_09_16_073125_add_update_by', 1),
(48, '2022_09_16_074915_change_column_vehicles', 1),
(49, '2022_09_16_075345_change_type_column_', 1),
(50, '2022_09_22_024057_update_fuel_type_in_vehicle_models', 1),
(51, '2022_09_24_024827_add_column_freekey_time_to_reservations_table', 1),
(52, '2022_09_24_100719_update_fuel_type_length_vehicle_models_table', 1),
(53, '2022_09_28_043925_change_column_apple_and_google', 1),
(54, '2022_09_28_044437_change_column_overtime', 1),
(55, '2022_09_28_100402_add_name_and_birth_day_and_issue_date_to_user_licences_table', 1),
(56, '2022_09_29_061548_address_to_user_licences_table', 1),
(57, '2022_10_03_082509_update_table_user_license', 1),
(58, '2022_10_05_033022_remove_colume_name_kana_admins_table', 1),
(59, '2022_10_05_050029_update_field_license_type', 1),
(60, '2022_10_05_081422_update_add_cancel_at_in_reservation', 1),
(61, '2022_10_05_103653_update_table_vehicle_insurance', 1),
(62, '2022_10_05_110909_update_table_user_license_change_string', 1),
(63, '2022_10_06_042420_add_column_access_id_access_pass_reservations_table', 1),
(64, '2022_10_06_071013_add_column_order_id_gmo_reservations_table', 1),
(65, '2022_10_11_093609_update_add_chassis_number_vehicle_details', 1),
(66, '2022_10_12_074756_update_table_stations_add_field_oneway', 1),
(67, '2022_10_13_031256_add_column_name_jp_roles_table', 1),
(68, '2022_10_14_034533_add_colum_role_admins_table', 1),
(69, '2022_10_14_044251_add_field_vehicle_model', 1),
(70, '2022_10_14_092034_update_vehicle_details', 1),
(71, '2022_10_17_071045_create_vehicle_locations_table', 1),
(72, '2022_10_17_082600_remove_column_operations', 1),
(73, '2022_10_18_042231_update_table_vehicle_details', 1),
(74, '2022_10_18_042819_update_table_vehicle_models', 1),
(75, '2022_10_18_080044_create_agents_table', 1),
(76, '2022_10_18_080808_add_company_code_franchise_table', 1),
(77, '2022_10_18_081031_add_agent_id_prefecture_id_role_admin_table', 1),
(78, '2022_10_18_081552_update_city_id_prefecture_id_station_table', 1),
(79, '2022_10_18_082629_create_screens', 1),
(80, '2022_10_18_082703_screen_permission_roles', 1),
(81, '2022_10_18_083027_drop_table_permission_roles_and_permissions', 1),
(82, '2022_10_18_083047_permissions', 1),
(83, '2022_10_18_083208_permission_roles', 1),
(84, '2022_10_18_083234_add_foreign_key_in_permission_roles', 1),
(85, '2022_10_18_083355_add_foreign_key_in_screen_permission_roles', 1),
(86, '2022_10_18_093423_add_column_route_name_in_screens', 1),
(87, '2022_10_19_024404_add_column_total_amount_total_amount_actual_reservations', 1),
(88, '2022_10_19_024505_drop_column_route_name_in_permissions', 1),
(89, '2022_10_19_072548_add_franchise_id_category_table', 1),
(90, '2022_10_19_072734_add_franchise_id_prefecture_table', 1),
(91, '2022_10_20_020234_update_company_code_type', 1),
(92, '2022_10_20_062048_reject_unique_email', 1),
(93, '2022_10_20_065203_update_table_vehicle_details', 1),
(94, '2022_10_21_023940_drop_id_timestamps_in_screen_permission_roles', 1),
(95, '2022_10_21_051631_add_column_status_policies', 1),
(96, '2022_10_21_070619_update_table_admin', 1),
(97, '2022_10_24_023247_add_booking_id_to_reservations_table', 1),
(98, '2022_10_24_023422_update_table_user_licences', 1),
(99, '2022_10_24_072548_update_vehicle_locatio', 1),
(100, '2022_10_25_014314_create_sub_drivers_table', 1),
(101, '2022_10_25_082801_add_agent_id_to_franchises_table', 1),
(102, '2022_10_25_091708_add_franchise_id_to_reservations_table', 1),
(103, '2022_10_26_020543_add_biometric_cancel_to_users', 1),
(104, '2022_10_27_022628_add_column_name_jp_in_screens', 1),
(105, '2022_11_01_085411_update_user_payments_table', 1),
(106, '2022_11_14_025758_update_type_encrypt_users_table', 1),
(107, '2022_11_14_092020_update_type_encrypt_user_licences_table', 1),
(108, '2022_11_14_095440_update_maxlength_email_user_tokens_table', 1),
(109, '2022_11_14_114314_update_maxlength_email_sub_drivers_table', 1),
(110, '2022_11_14_153944_update_maxlength_email_phone_tokens_table', 1),
(111, '2022_11_14_192835_update_columns_type_encrypt_admins_table', 1),
(112, '2022_11_15_153638_update_type_encrypt_admin_tokens_table', 1),
(113, '2022_11_18_062852_update_type_column_content_in_policies_table', 1),
(114, '2022_11_29_062450_update_table_reservation_details', 1),
(115, '2022_11_29_094455_update_table_users', 1),
(116, '2022_11_29_100355_update_table_vehicle_insurance', 1),
(117, '2022_11_29_100543_update_table_vehicle_accessories', 1),
(118, '2022_11_29_100654_update_table_stations', 1),
(119, '2022_11_30_043201_update_table_category', 1),
(120, '2022_11_30_043241_update_table_vehicle', 1),
(121, '2022_11_30_043327_update_table_vehicle_models', 1),
(122, '2022_11_30_044057_update_table_reservations', 1),
(123, '2022_11_30_070147_create_cancel_plans_table', 1),
(124, '2022_11_30_070425_update_table_vehicle_accessories', 1),
(125, '2022_11_30_070517_create_cancel_policies_table', 1),
(126, '2022_11_30_070554_update_table_sub_drivers', 1),
(127, '2022_11_30_071544_update_table_vehicle_details', 1),
(128, '2022_11_30_072256_update_table_vehicle_insurances', 1),
(129, '2022_11_30_072401_create_pack_plans_table', 1),
(130, '2022_11_30_072409_create_packs_table', 1),
(131, '2022_11_30_072429_update_franchise_settings_table', 1),
(132, '2022_11_30_073701_update_columns_to_reservations_table', 1),
(133, '2022_11_30_073723_create_personal_access_tokens_table', 1),
(134, '2022_11_30_073928_create_amount_correction_history', 1),
(135, '2022_11_30_074945_update_columns_to_reservation_details_table', 1),
(136, '2022_11_30_075459_update_columns_to_stations_table', 1),
(137, '2022_12_01_025209_update_type_table', 1),
(138, '2022_12_01_094335_update_table_vehicle_accessories', 1),
(139, '2022_12_05_030855_update_table_packs', 1),
(140, '2022_12_05_105623_create_table_user_trackings', 1),
(141, '2022_12_06_072253_update_table_packs', 1),
(142, '2022_12_06_073540_update_table_cancel_policies', 1),
(143, '2022_12_06_073929_update_table_pack_plans', 1),
(144, '2022_12_06_093220_update_table_soft_delete_franchise_prefectures', 1),
(145, '2022_12_07_022702_update_table_packs', 1),
(146, '2022_12_07_024508_update_table_pack_plans', 1),
(147, '2022_12_07_034355_update_table_soft_delete_agent_cancelplan_policy_cancelpolicy', 1),
(148, '2022_12_07_094228_update_table_vehicle_details', 1),
(149, '2022_12_09_025206_update_table_cancel_policies', 1),
(150, '2022_12_09_025441_update_table_cancel_plans', 1),
(151, '2022_12_13_032627_update_table_users', 1),
(152, '2022_12_13_035617_update_table_admins', 1),
(153, '2022_12_13_062643_update_table_stations', 1),
(154, '2022_12_13_063659_create_table_franchise_policies', 1),
(155, '2022_12_13_112151_update_column_vehicle_locks', 1),
(156, '2022_12_14_023903_update_table_vehicle_locks', 1),
(157, '2022_12_15_013157_update_table_franchise_policies', 1),
(158, '2022_12_15_035902_update_table_franchise_policies', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `operations`
--

CREATE TABLE `operations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `reservation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '両車ID',
  `start_time` datetime DEFAULT NULL COMMENT '実際開始日時',
  `end_time` datetime DEFAULT NULL COMMENT '実際終了日時',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='オペレーション';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packs`
--

CREATE TABLE `packs` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' フランチャイズID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `valid_start_date` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '適用開始日',
  `valid_end_date` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '適用終了日',
  `calc_type` tinyint DEFAULT NULL COMMENT '1:日付跨ぎ, 2:24h経過',
  `per_night_price` bigint DEFAULT NULL COMMENT '泊数毎料金',
  `unit_over_time` int DEFAULT NULL COMMENT '超過料金請求単位（分',
  `unit_over_time_price` bigint DEFAULT NULL COMMENT '超過料金請求単位毎金額',
  `round_type` tinyint DEFAULT NULL COMMENT '1:切り上げ, 2:切り捨て',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ver` int DEFAULT NULL COMMENT 'バージョン',
  `id_previous` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_next` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pack_plans`
--

CREATE TABLE `pack_plans` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `pack_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' フランチャイズID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `unit_time` decimal(5,2) DEFAULT NULL COMMENT 'パック時間単位 ',
  `unit_price` bigint DEFAULT NULL COMMENT 'パック料金',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL COMMENT '役割ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '役割名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='役割';

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'create', NULL, NULL),
(2, 'read', NULL, NULL),
(3, 'update', NULL, NULL),
(4, 'delete', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_roles`
--

CREATE TABLE `permission_roles` (
  `permission_id` int UNSIGNED DEFAULT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='権限の役割';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_tokens`
--

CREATE TABLE `phone_tokens` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'メールアドレス',
  `token` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'トークン',
  `valid_dt` datetime DEFAULT NULL COMMENT '有効期限',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='携帯トークン';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `policies`
--

CREATE TABLE `policies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `display_rank` int DEFAULT NULL COMMENT '表示順',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'タイトル',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'コンテンツ',
  `status` tinyint DEFAULT NULL COMMENT '1:有効　0:無効',
  `update_by` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='規約';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prefectures`
--

CREATE TABLE `prefectures` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'エリアID',
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーション名EN',
  `name_jp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーション名JP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='都道府県';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prices`
--

CREATE TABLE `prices` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `vehicle_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL COMMENT '料金',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='料金';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reservations`
--

CREATE TABLE `reservations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `booking_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザーID',
  `user_payment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザー決済ID',
  `vehicle_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '車両ID',
  `station_start_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '出発場所ID',
  `station_end_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '返却場所ID',
  `start_time` datetime NOT NULL COMMENT '出発日時',
  `end_time` datetime NOT NULL COMMENT '返却日時',
  `freekey_start_time` datetime DEFAULT NULL COMMENT '出発日時',
  `freekey_end_time` datetime DEFAULT NULL COMMENT '返却日時',
  `stop_extend_flg` int DEFAULT '0' COMMENT '表示順',
  `overtime` int DEFAULT NULL COMMENT '延長時間',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス 1: 未決済, 2: 決済済, 3: キャンセル',
  `sonpo_daisha` tinyint DEFAULT NULL COMMENT '損保代車対応 1: 有　2:無',
  `unit_price` bigint DEFAULT NULL COMMENT '予約値段',
  `usage_fee` bigint DEFAULT NULL COMMENT 'ご利用予定',
  `insurance_fee` bigint DEFAULT NULL COMMENT '保険',
  `remark` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考',
  `freekey_reservation_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'freekey予約ID',
  `access_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` bigint DEFAULT NULL,
  `order_id_gmo` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount_actual` bigint DEFAULT NULL,
  `cancel_at` datetime DEFAULT NULL,
  `option_fee` bigint DEFAULT NULL,
  `cancel_amount` bigint DEFAULT NULL,
  `pack_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack_price` int DEFAULT NULL,
  `per_night_price` int DEFAULT NULL,
  `count_day` int DEFAULT NULL,
  `calc_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_over_time` int DEFAULT NULL,
  `unit_over_time_price` int DEFAULT NULL,
  `round_type` int DEFAULT NULL,
  `cancel_reason` text COLLATE utf8mb4_unicode_ci,
  `calc_type` tinyint DEFAULT NULL,
  `usage_fee_actual` bigint DEFAULT NULL,
  `count_day_actual` bigint DEFAULT NULL,
  `overtime_fee` int DEFAULT NULL,
  `start_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overnight_fee` bigint DEFAULT NULL,
  `other_fee` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cancel_policy` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='予約';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reservation_details`
--

CREATE TABLE `reservation_details` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `reservation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約ID',
  `vehicle_service_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '車両サービスID',
  `type` tinyint DEFAULT NULL COMMENT 'タイプ 1: insurance, 2:accessory',
  `price` bigint DEFAULT NULL,
  `price_latest` bigint DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` tinyint NOT NULL DEFAULT '1',
  `price_actual` bigint DEFAULT NULL,
  `display_rank` int DEFAULT NULL,
  `total_fee_actual` bigint DEFAULT NULL,
  `calc_type` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `calc_day` int DEFAULT NULL COMMENT '泊数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='予約詳細';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '権限名',
  `name_jp` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='権限';

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `name_jp`, `rank`, `created_at`, `updated_at`) VALUES
('92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 'shop_admin', '店舗管理者', 3, NULL, NULL),
('c575c40e-28b4-4a15-bcd0-222fe370761b', 'agent_admin', '代理店', 2, NULL, NULL),
('c972ec6d-6343-4780-9b68-2d411ff7cf25', 'area_manager', 'エリアマネージャ', 4, NULL, NULL),
('dbb9154d-ee28-4a68-ab99-2012c9f9e808', 'admin', 'システム管理者', 1, NULL, NULL),
('fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 'shop_staff', 'スタッフ', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_admins`
--

CREATE TABLE `role_admins` (
  `admin_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `station_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーションID',
  `agent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '代理店ID',
  `prefecture_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '都道府県ID',
  `admin_agent_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'エージェントID',
  `admin_fc_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理者FC',
  `admin_area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理エリア',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理者ロール';

--
-- Đang đổ dữ liệu cho bảng `role_admins`
--

INSERT INTO `role_admins` (`admin_id`, `role_id`, `franchise_id`, `station_id`, `agent_id`, `prefecture_id`, `admin_agent_id`, `admin_fc_id`, `admin_area_id`, `created_at`, `updated_at`) VALUES
('055f779b-93d2-4d92-a13f-f1f120d259b3', 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `screens`
--

CREATE TABLE `screens` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_jp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `screens`
--

INSERT INTO `screens` (`id`, `name`, `name_jp`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'ダッシュボード', NULL, NULL),
(2, 'reservations', '予約管理', NULL, NULL),
(3, 'vehicles-vehicle', '車両管理', NULL, NULL),
(4, 'vehicles-category', '車両管理-カテゴリー', NULL, NULL),
(5, 'vehicles-model', '車両管理-車種', NULL, NULL),
(6, 'insurances', '保険管理', NULL, NULL),
(7, 'users', '顧客管理', NULL, NULL),
(8, 'policies', '規約管理', NULL, NULL),
(9, 'areas', 'エリア管理', NULL, NULL),
(10, 'stations', '店舗管理', NULL, NULL),
(11, 'employees', '従業員管理', NULL, NULL),
(12, 'profile', 'マイページ', NULL, NULL),
(13, 'franchises', 'テナント管理', NULL, NULL),
(14, 'packs', 'パッケージ管理', NULL, NULL),
(15, 'cancelPolicies', 'キャンセルポリシー', NULL, NULL),
(16, 'agent', '代理店管理', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `screen_permission_roles`
--

CREATE TABLE `screen_permission_roles` (
  `screen_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `screen_permission_roles`
--

INSERT INTO `screen_permission_roles` (`screen_id`, `permission_id`, `role_id`, `active`) VALUES
(1, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 0),
(1, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 0),
(1, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 0),
(1, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 0),
(1, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 0),
(2, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(2, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(2, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(2, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(2, 1, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(2, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(2, 3, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(2, 4, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(2, 1, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(2, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(2, 3, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(2, 4, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(3, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(3, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(3, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(3, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(3, 1, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(3, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(3, 3, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(3, 4, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(3, 1, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(3, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(3, 3, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(3, 4, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(4, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(4, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(4, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(4, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(4, 1, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(4, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(4, 3, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(4, 4, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(4, 1, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(4, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(4, 3, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(4, 4, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(5, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(5, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(5, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(5, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(5, 1, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(5, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(5, 3, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(5, 4, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(5, 1, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(5, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(5, 3, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(5, 4, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(6, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(6, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(6, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(6, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(6, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(6, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(7, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(7, 3, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(7, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(7, 3, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(7, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(7, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(7, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(7, 3, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(7, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(7, 3, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(8, 1, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(8, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(8, 3, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(8, 4, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(9, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(9, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(9, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(9, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(9, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(9, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(9, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(9, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(10, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(10, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(10, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(10, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(10, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(10, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(10, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(10, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(11, 1, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(11, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(11, 3, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(11, 4, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(11, 1, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(11, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(11, 3, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(11, 4, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(11, 1, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(11, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(11, 3, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(11, 4, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(11, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(11, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(12, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(12, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(12, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(12, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(12, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1),
(13, 1, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(13, 2, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(13, 3, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(13, 4, 'dbb9154d-ee28-4a68-ab99-2012c9f9e808', 1),
(13, 1, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(13, 2, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(13, 3, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(13, 4, 'c575c40e-28b4-4a15-bcd0-222fe370761b', 1),
(13, 2, '92ec2b6a-99b7-43c9-a0f5-f24893e7e1f0', 1),
(13, 2, 'c972ec6d-6343-4780-9b68-2d411ff7cf25', 1),
(13, 2, 'fa8ac449-3c1b-4bc7-8891-8e58f5bfae49', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stations`
--

CREATE TABLE `stations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `mail_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'メールアドレス',
  `prefecture_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '都市',
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーション名EN',
  `name_jp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーション名JP',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '住所',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '電話番号',
  `latitude` decimal(20,14) DEFAULT NULL COMMENT '緯度',
  `longitude` decimal(20,14) DEFAULT NULL COMMENT '経度',
  `status` tinyint DEFAULT '1' COMMENT 'ステータス',
  `display_rank` int DEFAULT '1' COMMENT '表示順',
  `remarks` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考',
  `oneway` tinyint DEFAULT NULL COMMENT '1: 可能, 2: 不可',
  `start_business_time` time DEFAULT NULL COMMENT '営業時間（開始）',
  `end_business_time` time DEFAULT NULL COMMENT '営業時間（終了）',
  `start_code_type` tinyint DEFAULT NULL COMMENT '1:ランダム, 2:車両ナンバー, 3:固定値',
  `end_code_type` tinyint DEFAULT NULL COMMENT '1:ランダム, 2:車両ナンバー, 3:固定値',
  `start_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '利用開始コード',
  `end_code` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '利用終了コード',
  `maintenance_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約前後のメンテナンス時間',
  `min_lend_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約最短時間',
  `max_lend_day` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約最長日数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `always_open` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ステーション';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sub_drivers`
--

CREATE TABLE `sub_drivers` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(UUID())' COMMENT '(DC2Type:guid)',
  `reservation_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約ID(DC2Type:guid)',
  `sub_driver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '同乗者ＩＤ(DC2Type:guid)',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '同乗者メール',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `main_driver_freekey_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person_no` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='同乗者';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザーID',
  `user_payment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザー決済ID',
  `reservation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約ID',
  `price` bigint DEFAULT NULL COMMENT '料金',
  `tax` bigint DEFAULT NULL COMMENT '税金',
  `total_price` bigint DEFAULT NULL COMMENT '料金トータル',
  `request_body` text COLLATE utf8mb4_unicode_ci COMMENT 'リクエスト',
  `response_body` text COLLATE utf8mb4_unicode_ci COMMENT 'レスポンス',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='トランザクション';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `first_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '性',
  `first_name_kana` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '性かな',
  `last_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '名',
  `last_name_kana` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '名かな',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'メール',
  `email_verified_at` datetime DEFAULT NULL COMMENT 'メール確認済み日時',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'パスワード',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'トークン',
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '電話番号',
  `birthday` text COLLATE utf8mb4_unicode_ci COMMENT '生年月日',
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '住所1',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス 1:[有効中/open]  9:[退会済/Deleted]',
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'グーグルメール',
  `apple_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'アップルメール',
  `ekyc_status` tinyint DEFAULT '0' COMMENT '本人確認ステータス（EKYC）1:[認証済/verified]  0:[未認証/not verified]',
  `biometric_cancel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '生体認証キャンセルチェック',
  `reg_step` int DEFAULT '0' COMMENT '登録ステップ',
  `freekey_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'FreekeyユーザーID',
  `last_login` datetime DEFAULT NULL COMMENT '最後ログイン日時',
  `remarks` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` tinyint DEFAULT NULL,
  `count_wrong_pwd` tinyint NOT NULL DEFAULT '0' COMMENT 'パスワード誤り回数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='顧客情報';

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `first_name`, `first_name_kana`, `last_name`, `last_name_kana`, `email`, `email_verified_at`, `password`, `remember_token`, `phone`, `birthday`, `address1`, `status`, `google_id`, `apple_id`, `ekyc_status`, `biometric_cancel`, `reg_step`, `freekey_user_id`, `last_login`, `remarks`, `created_at`, `updated_at`, `gender`, `count_wrong_pwd`) VALUES
('01ab8540-e53a-4f34-849e-cd8ab8751487', 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'SlZOS0dYb2NQNjJDdS9OOUw0d1BkazlUNTJ2QkJMMG8yd2NFcHozSTQxTT0=', NULL, '$2y$10$c9h3YZ85mb34Td88.me0QuEEl4hbHW9CUfx86Z5Er.PvhXz3EnjbW', NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2022-12-19 12:02:09', '2022-12-19 12:02:09', NULL, 0),
('490c0ca7-50f9-4757-96f2-9c1b511881fa', 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'cytXN1YwMEJoNkUxVmRmSTVteTVHd3dTQ2RBeEtYcXQxVGVNc0FxNUpqVT0=', NULL, '$2y$10$GZ85Drsry3Jfe8n.ON9wQOXJtWQWCEOn7x2Nt0J7cxu.qWTPJWYMi', NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2022-12-19 12:02:09', '2022-12-19 12:02:09', NULL, 0),
('707fa9ce-a4b7-4130-aee6-e3a6c0cc1dd3', 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'MGNlcGVVdHdYb1dvZ1VzUlBDa1RLdz09', NULL, 'cytXN1YwMEJoNkUxVmRmSTVteTVHd3dTQ2RBeEtYcXQxVGVNc0FxNUpqVT0=', NULL, '$2y$10$OkNNWBP28vtUndvkyVF0Iu3o130SlyLMR9Fh/lkIQtAmRRLN/H5jG', NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, '2022-12-19 12:02:09', '2022-12-19 12:02:09', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_licences`
--

CREATE TABLE `user_licences` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザーID',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `issuing_organization` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `issue_date1` text COLLATE utf8mb4_unicode_ci,
  `issue_date2` text COLLATE utf8mb4_unicode_ci,
  `issue_date3` text COLLATE utf8mb4_unicode_ci,
  `good_driver` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarks` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `birthday` text COLLATE utf8mb4_unicode_ci,
  `issue_date` text COLLATE utf8mb4_unicode_ci,
  `ekyc_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'EKYC　ID',
  `licence_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '免許ID',
  `valid_date` datetime DEFAULT NULL COMMENT '有効期限',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sub_no` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '連番'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='顧客運転免許情報';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_payments`
--

CREATE TABLE `user_payments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ユーザーID',
  `card_seq` int NOT NULL DEFAULT '0' COMMENT 'カードSEQ',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='顧客決済情報';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'メール',
  `token` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'トークン',
  `valid_dt` datetime DEFAULT NULL COMMENT '有効期限',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ユーザートークン';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicles`
--

CREATE TABLE `vehicles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `station_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ステーションID',
  `owner_station_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'ステータス 1: 使用可, 2:予約済, 3: 使用不可',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車両';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_accessories`
--

CREATE TABLE `vehicle_accessories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `vehicle_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'タイトル',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '説明',
  `price` bigint DEFAULT NULL COMMENT '値段',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `display_rank` int DEFAULT NULL COMMENT '表示順',
  `calc_type` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車両アクセサリー';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `vehicle_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '車種ID',
  `vehicle_model_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '車種ID',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '画像１',
  `img2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '画像２',
  `img3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '画像３',
  `img4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '画像４',
  `car_navi` tinyint DEFAULT NULL COMMENT 'カーナビ',
  `etc` tinyint DEFAULT NULL COMMENT '1: 有り, 2: 無し',
  `wheel_drive_type` tinyint DEFAULT NULL COMMENT '4: 4WD, 2: 2WD',
  `color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '備考',
  `display_rank` int DEFAULT NULL COMMENT '表示順',
  `wa_license_reg_date` date DEFAULT NULL COMMENT '-------',
  `wa_license_cancel_date` date DEFAULT NULL COMMENT '--------',
  `vehicle_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '--------',
  `chassis_number` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digit_key_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'デジタルキー搭載場所',
  `cancel_policy_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stop_booking_start` datetime DEFAULT NULL,
  `stop_booking_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車両詳細';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_insurances`
--

CREATE TABLE `vehicle_insurances` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '氏名',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '説明',
  `price` bigint DEFAULT NULL COMMENT '値段',
  `franchise_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'フランチャイズID',
  `display_rank` int DEFAULT NULL COMMENT '表示順',
  `calc_type` tinyint DEFAULT NULL,
  `required` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車両保険';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_locations`
--

CREATE TABLE `vehicle_locations` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `reservation_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '予約ID',
  `latitude` decimal(20,14) DEFAULT NULL COMMENT '緯度',
  `longitude` decimal(20,14) DEFAULT NULL COMMENT '経度',
  `record_time` datetime DEFAULT NULL,
  `division` tinyint DEFAULT NULL COMMENT ' 1:アプリ起動, 2:ログイン, 3:利用開始, 4:開錠, 5:施錠, 6:返却',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_locks`
--

CREATE TABLE `vehicle_locks` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `franchise_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '車両ID',
  `freekey_lock_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Freekey開閉ID',
  `title` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dkb_serial_no` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `freekey_created_at` timestamp NULL DEFAULT NULL,
  `freekey_updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車両開閉';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vehicle_models`
--

CREATE TABLE `vehicle_models` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()) COMMENT 'ID',
  `category_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ID',
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ブランド',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '氏名',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'イメージ',
  `capacity` int DEFAULT NULL COMMENT '定員数',
  `displacement` decimal(10,2) DEFAULT NULL COMMENT '排気量',
  `length` decimal(10,2) DEFAULT NULL COMMENT '長さ',
  `width` decimal(10,2) DEFAULT NULL COMMENT '広さ',
  `height` decimal(10,2) DEFAULT NULL COMMENT '高さ',
  `max_load_capacity` int DEFAULT NULL COMMENT '最大積載量',
  `vehicle_total_weight` int DEFAULT NULL COMMENT '車両総重量',
  `auto_manual` tinyint DEFAULT NULL COMMENT '1:AT,2:MT',
  `fuel_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ガソリンタイプ 1:ガソリン, 2:ハイオク, 3:軽油',
  `remarks` text COLLATE utf8mb4_unicode_ci COMMENT 'ID',
  `display_rank` int DEFAULT NULL COMMENT 'ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fuel` decimal(10,2) DEFAULT NULL COMMENT '燃費(注)',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='車種';

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_tokens`
--
ALTER TABLE `admin_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `amount_correction_history`
--
ALTER TABLE `amount_correction_history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cancel_plans`
--
ALTER TABLE `cancel_plans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cancel_policies`
--
ALTER TABLE `cancel_policies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `check_display_users`
--
ALTER TABLE `check_display_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `configs_key_unique` (`key`);

--
-- Chỉ mục cho bảng `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `franchises`
--
ALTER TABLE `franchises`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `franchise_policies`
--
ALTER TABLE `franchise_policies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `franchise_settings`
--
ALTER TABLE `franchise_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `holiday_calendars`
--
ALTER TABLE `holiday_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `packs`
--
ALTER TABLE `packs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pack_plans`
--
ALTER TABLE `pack_plans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD KEY `permission_roles_role_id_foreign` (`role_id`),
  ADD KEY `permission_roles_permission_id_foreign` (`permission_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phone_tokens`
--
ALTER TABLE `phone_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `prefectures`
--
ALTER TABLE `prefectures`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prices_vehicle_id_foreign` (`vehicle_id`);

--
-- Chỉ mục cho bảng `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reservation_details`
--
ALTER TABLE `reservation_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_admins`
--
ALTER TABLE `role_admins`
  ADD KEY `role_admins_admin_id_foreign` (`admin_id`),
  ADD KEY `role_admins_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `screen_permission_roles`
--
ALTER TABLE `screen_permission_roles`
  ADD KEY `screen_permission_roles_screen_id_foreign` (`screen_id`),
  ADD KEY `screen_permission_roles_role_id_foreign` (`role_id`),
  ADD KEY `screen_permission_roles_permission_id_foreign` (`permission_id`);

--
-- Chỉ mục cho bảng `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sub_drivers`
--
ALTER TABLE `sub_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_licences`
--
ALTER TABLE `user_licences`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vehicle_accessories`
--
ALTER TABLE `vehicle_accessories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_accessories_vehicle_id_foreign` (`vehicle_id`);

--
-- Chỉ mục cho bảng `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vehicle_insurances`
--
ALTER TABLE `vehicle_insurances`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vehicle_locations`
--
ALTER TABLE `vehicle_locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vehicle_locks`
--
ALTER TABLE `vehicle_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicle_locks_vehicle_id_unique` (`vehicle_id`);

--
-- Chỉ mục cho bảng `vehicle_models`
--
ALTER TABLE `vehicle_models`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '役割ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `screens`
--
ALTER TABLE `screens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD CONSTRAINT `permission_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_admins`
--
ALTER TABLE `role_admins`
  ADD CONSTRAINT `role_admins_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_admins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `screen_permission_roles`
--
ALTER TABLE `screen_permission_roles`
  ADD CONSTRAINT `screen_permission_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `screen_permission_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `screen_permission_roles_screen_id_foreign` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vehicle_accessories`
--
ALTER TABLE `vehicle_accessories`
  ADD CONSTRAINT `vehicle_accessories_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;