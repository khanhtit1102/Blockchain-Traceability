-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 09, 2025 lúc 04:06 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `agridential`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Test log từ Tinker', NULL, NULL, NULL, NULL, NULL, '[]', NULL, '2025-08-06 20:14:34', '2025-08-06 20:14:34'),
(2, 'default', 'Xóa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"id\": \"2\", \"table\": \"testhistories\", \"data_old\": {\"id\": 2, \"name\": \"Chè\", \"price\": 100000, \"product\": \"Chè Thái Nguyên\", \"created_at\": \"2025-08-07 02:43:55\", \"updated_at\": \"2025-08-07 02:43:55\", \"description\": \"Chè xuất xứ tại thái nguyên\"}}', NULL, '2025-08-06 20:20:05', '2025-08-06 20:20:05'),
(3, 'Admin', 'Xóa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"id\": \"3\", \"table\": \"testhistories\", \"data_old\": {\"id\": 3, \"name\": \"abc\", \"price\": 1, \"product\": \"Chè tân cương\", \"created_at\": \"2025-08-07 02:57:01\", \"updated_at\": \"2025-08-07 02:57:01\", \"description\": \"abc\"}}', NULL, '2025-08-06 20:26:23', '2025-08-06 20:26:23'),
(4, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/16\", \"data\": {\"id\": \"16\", \"icon\": \"voyager-list-add\", \"name\": \"testhistories\", \"slug\": \"testhistories\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"field_name\": \"name\", \"model_name\": \"App\\\\Testhistory\", \"description\": null, \"field_price\": \"price\", \"policy_name\": null, \"order_column\": null, \"field_product\": \"product\", \"field_add_name\": \"on\", \"field_order_id\": \"1\", \"field_add_price\": \"on\", \"field_edit_name\": \"on\", \"field_read_name\": \"on\", \"order_direction\": \"asc\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_edit_price\": \"on\", \"field_order_name\": \"2\", \"field_read_price\": \"on\", \"field_updated_at\": \"updated_at\", \"field_add_product\": \"on\", \"field_browse_name\": \"on\", \"field_delete_name\": \"on\", \"field_description\": \"description\", \"field_order_price\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_browse_price\": \"on\", \"field_delete_price\": \"on\", \"field_details_name\": \"{}\", \"field_edit_product\": \"on\", \"field_read_product\": \"on\", \"display_name_plural\": \"Test\", \"field_details_price\": \"{}\", \"field_input_type_id\": \"text\", \"field_order_product\": \"4\", \"field_required_name\": \"0\", \"field_browse_product\": \"on\", \"field_delete_product\": \"on\", \"field_required_price\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Test\", \"field_add_description\": \"on\", \"field_details_product\": \"{}\", \"field_display_name_id\": \"Id\", \"field_edit_created_at\": \"on\", \"field_input_type_name\": \"text\", \"field_read_created_at\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_price\": \"text\", \"field_order_created_at\": \"6\", \"field_order_updated_at\": \"7\", \"field_read_description\": \"on\", \"field_required_product\": \"0\", \"field_browse_created_at\": \"on\", \"field_delete_created_at\": \"on\", \"field_display_name_name\": \"Name\", \"field_order_description\": \"3\", \"field_browse_description\": \"on\", \"field_delete_description\": \"on\", \"field_details_created_at\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_price\": \"Price\", \"field_input_type_product\": \"text\", \"field_details_description\": \"{}\", \"field_required_created_at\": \"0\", \"field_required_updated_at\": \"0\", \"field_display_name_product\": \"Product\", \"field_required_description\": \"0\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_updated_at\": \"timestamp\", \"field_input_type_description\": \"text\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_updated_at\": \"Updated At\", \"field_display_name_description\": \"Description\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:24:44', '2025-08-07 19:24:44'),
(5, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/16\", \"data\": {\"id\": \"16\", \"icon\": \"voyager-list-add\", \"name\": \"testhistories\", \"slug\": \"testhistories\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"field_name\": \"name\", \"model_name\": \"App\\\\Testhistory\", \"description\": null, \"field_price\": \"price\", \"policy_name\": null, \"order_column\": null, \"field_product\": \"product\", \"field_add_name\": \"on\", \"field_order_id\": \"1\", \"field_add_price\": \"on\", \"field_edit_name\": \"on\", \"field_read_name\": \"on\", \"order_direction\": \"asc\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_edit_price\": \"on\", \"field_order_name\": \"2\", \"field_read_price\": \"on\", \"field_updated_at\": \"updated_at\", \"field_add_product\": \"on\", \"field_browse_name\": \"on\", \"field_delete_name\": \"on\", \"field_description\": \"description\", \"field_order_price\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_browse_price\": \"on\", \"field_delete_price\": \"on\", \"field_details_name\": \"{}\", \"field_edit_product\": \"on\", \"field_read_product\": \"on\", \"display_name_plural\": \"Test\", \"field_details_price\": \"{}\", \"field_input_type_id\": \"text\", \"field_order_product\": \"4\", \"field_required_name\": \"0\", \"field_browse_product\": \"on\", \"field_delete_product\": \"on\", \"field_required_price\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Test\", \"field_add_description\": \"on\", \"field_details_product\": \"{}\", \"field_display_name_id\": \"Id\", \"field_edit_created_at\": \"on\", \"field_input_type_name\": \"text\", \"field_read_created_at\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_price\": \"text\", \"field_order_created_at\": \"6\", \"field_order_updated_at\": \"7\", \"field_read_description\": \"on\", \"field_required_product\": \"0\", \"field_browse_created_at\": \"on\", \"field_delete_created_at\": \"on\", \"field_display_name_name\": \"Name\", \"field_order_description\": \"3\", \"field_browse_description\": \"on\", \"field_delete_description\": \"on\", \"field_details_created_at\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_price\": \"Price\", \"field_input_type_product\": \"text\", \"field_details_description\": \"{}\", \"field_required_created_at\": \"0\", \"field_required_updated_at\": \"0\", \"field_display_name_product\": \"Product\", \"field_required_description\": \"0\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_updated_at\": \"timestamp\", \"field_input_type_description\": \"text\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_updated_at\": \"Updated At\", \"field_display_name_description\": \"Description\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:24:44', '2025-08-07 19:24:44'),
(6, 'Admin', 'Thêm bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/testhistories\", \"data\": {\"name\": \"sadasdas\", \"price\": \"234234\", \"product\": \"ádasdasd\", \"description\": \"ádasdasd\"}, \"route\": \"voyager.testhistories.store\"}', NULL, '2025-08-07 19:25:28', '2025-08-07 19:25:28'),
(7, 'Admin', 'Thêm bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/testhistories\", \"data\": {\"name\": \"sadasdas\", \"price\": \"234234\", \"product\": \"ádasdasd\", \"description\": \"ádasdasd\"}, \"route\": \"voyager.testhistories.store\"}', NULL, '2025-08-07 19:25:28', '2025-08-07 19:25:28'),
(8, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/15\", \"data\": {\"id\": \"15\", \"icon\": \"voyager-gift\", \"name\": \"activity_log\", \"slug\": \"activity-log\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"model_name\": \"App\\\\Models\\\\ActivityLog\", \"description\": null, \"field_event\": \"event\", \"policy_name\": null, \"order_column\": null, \"field_log_name\": \"log_name\", \"field_order_id\": \"1\", \"field_causer_id\": \"causer_id\", \"order_direction\": \"asc\", \"field_batch_uuid\": \"batch_uuid\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_properties\": \"properties\", \"field_subject_id\": \"subject_id\", \"field_updated_at\": \"updated_at\", \"field_causer_type\": \"causer_type\", \"field_description\": \"description\", \"field_order_event\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_add_log_name\": \"on\", \"field_subject_type\": \"subject_type\", \"display_name_plural\": \"Lịch sử thao tác\", \"field_add_causer_id\": \"on\", \"field_details_event\": \"{}\", \"field_edit_log_name\": \"on\", \"field_input_type_id\": \"text\", \"field_read_log_name\": \"on\", \"field_add_batch_uuid\": \"on\", \"field_add_properties\": \"on\", \"field_add_subject_id\": \"on\", \"field_edit_causer_id\": \"on\", \"field_order_log_name\": \"2\", \"field_read_causer_id\": \"on\", \"field_required_event\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Lịch sử thao tác\", \"field_add_causer_type\": \"on\", \"field_add_description\": \"on\", \"field_browse_log_name\": \"on\", \"field_delete_log_name\": \"on\", \"field_display_name_id\": \"Id\", \"field_edit_batch_uuid\": \"on\", \"field_edit_created_at\": \"on\", \"field_edit_properties\": \"on\", \"field_edit_subject_id\": \"on\", \"field_order_causer_id\": \"8\", \"field_read_batch_uuid\": \"on\", \"field_read_created_at\": \"on\", \"field_read_properties\": \"on\", \"field_read_subject_id\": \"on\", \"field_browse_causer_id\": \"on\", \"field_delete_causer_id\": \"on\", \"field_details_log_name\": \"{}\", \"field_edit_causer_type\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_event\": \"text\", \"field_order_batch_uuid\": \"10\", \"field_order_created_at\": \"11\", \"field_order_properties\": \"9\", \"field_order_subject_id\": \"6\", \"field_order_updated_at\": \"12\", \"field_read_causer_type\": \"on\", \"field_read_description\": \"on\", \"field_browse_batch_uuid\": \"on\", \"field_browse_created_at\": \"on\", \"field_browse_properties\": \"on\", \"field_browse_subject_id\": \"on\", \"field_delete_batch_uuid\": \"on\", \"field_delete_created_at\": \"on\", \"field_delete_properties\": \"on\", \"field_delete_subject_id\": \"on\", \"field_details_causer_id\": \"{}\", \"field_order_causer_type\": \"7\", \"field_order_description\": \"3\", \"field_required_log_name\": \"0\", \"field_browse_causer_type\": \"on\", \"field_browse_description\": \"on\", \"field_delete_causer_type\": \"on\", \"field_delete_description\": \"on\", \"field_details_batch_uuid\": \"{}\", \"field_details_created_at\": \"{}\", \"field_details_properties\": \"{}\", \"field_details_subject_id\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_event\": \"Event\", \"field_order_subject_type\": \"4\", \"field_required_causer_id\": \"0\", \"field_details_causer_type\": \"{}\", \"field_details_description\": \"{}\", \"field_input_type_log_name\": \"text\", \"field_required_batch_uuid\": \"0\", \"field_required_created_at\": \"0\", \"field_required_properties\": \"0\", \"field_required_subject_id\": \"0\", \"field_required_updated_at\": \"0\", \"field_details_subject_type\": \"{}\", \"field_input_type_causer_id\": \"text\", \"field_required_causer_type\": \"0\", \"field_required_description\": \"1\", \"field_display_name_log_name\": \"Log Name\", \"field_input_type_batch_uuid\": \"text\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_properties\": \"text_area\", \"field_input_type_subject_id\": \"text\", \"field_input_type_updated_at\": \"timestamp\", \"field_required_subject_type\": \"0\", \"field_display_name_causer_id\": \"Causer Id\", \"field_input_type_causer_type\": \"text\", \"field_input_type_description\": \"text\", \"field_display_name_batch_uuid\": \"Batch Uuid\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_properties\": \"Properties\", \"field_display_name_subject_id\": \"Subject Id\", \"field_display_name_updated_at\": \"Updated At\", \"field_input_type_subject_type\": \"text\", \"field_display_name_causer_type\": \"Causer Type\", \"field_display_name_description\": \"Description\", \"field_display_name_subject_type\": \"Subject Type\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:26:24', '2025-08-07 19:26:24'),
(9, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/15\", \"data\": {\"id\": \"15\", \"icon\": \"voyager-gift\", \"name\": \"activity_log\", \"slug\": \"activity-log\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"model_name\": \"App\\\\Models\\\\ActivityLog\", \"description\": null, \"field_event\": \"event\", \"policy_name\": null, \"order_column\": null, \"field_log_name\": \"log_name\", \"field_order_id\": \"1\", \"field_causer_id\": \"causer_id\", \"order_direction\": \"asc\", \"field_batch_uuid\": \"batch_uuid\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_properties\": \"properties\", \"field_subject_id\": \"subject_id\", \"field_updated_at\": \"updated_at\", \"field_causer_type\": \"causer_type\", \"field_description\": \"description\", \"field_order_event\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_add_log_name\": \"on\", \"field_subject_type\": \"subject_type\", \"display_name_plural\": \"Lịch sử thao tác\", \"field_add_causer_id\": \"on\", \"field_details_event\": \"{}\", \"field_edit_log_name\": \"on\", \"field_input_type_id\": \"text\", \"field_read_log_name\": \"on\", \"field_add_batch_uuid\": \"on\", \"field_add_properties\": \"on\", \"field_add_subject_id\": \"on\", \"field_edit_causer_id\": \"on\", \"field_order_log_name\": \"2\", \"field_read_causer_id\": \"on\", \"field_required_event\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Lịch sử thao tác\", \"field_add_causer_type\": \"on\", \"field_add_description\": \"on\", \"field_browse_log_name\": \"on\", \"field_delete_log_name\": \"on\", \"field_display_name_id\": \"Id\", \"field_edit_batch_uuid\": \"on\", \"field_edit_created_at\": \"on\", \"field_edit_properties\": \"on\", \"field_edit_subject_id\": \"on\", \"field_order_causer_id\": \"8\", \"field_read_batch_uuid\": \"on\", \"field_read_created_at\": \"on\", \"field_read_properties\": \"on\", \"field_read_subject_id\": \"on\", \"field_browse_causer_id\": \"on\", \"field_delete_causer_id\": \"on\", \"field_details_log_name\": \"{}\", \"field_edit_causer_type\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_event\": \"text\", \"field_order_batch_uuid\": \"10\", \"field_order_created_at\": \"11\", \"field_order_properties\": \"9\", \"field_order_subject_id\": \"6\", \"field_order_updated_at\": \"12\", \"field_read_causer_type\": \"on\", \"field_read_description\": \"on\", \"field_browse_batch_uuid\": \"on\", \"field_browse_created_at\": \"on\", \"field_browse_properties\": \"on\", \"field_browse_subject_id\": \"on\", \"field_delete_batch_uuid\": \"on\", \"field_delete_created_at\": \"on\", \"field_delete_properties\": \"on\", \"field_delete_subject_id\": \"on\", \"field_details_causer_id\": \"{}\", \"field_order_causer_type\": \"7\", \"field_order_description\": \"3\", \"field_required_log_name\": \"0\", \"field_browse_causer_type\": \"on\", \"field_browse_description\": \"on\", \"field_delete_causer_type\": \"on\", \"field_delete_description\": \"on\", \"field_details_batch_uuid\": \"{}\", \"field_details_created_at\": \"{}\", \"field_details_properties\": \"{}\", \"field_details_subject_id\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_event\": \"Event\", \"field_order_subject_type\": \"4\", \"field_required_causer_id\": \"0\", \"field_details_causer_type\": \"{}\", \"field_details_description\": \"{}\", \"field_input_type_log_name\": \"text\", \"field_required_batch_uuid\": \"0\", \"field_required_created_at\": \"0\", \"field_required_properties\": \"0\", \"field_required_subject_id\": \"0\", \"field_required_updated_at\": \"0\", \"field_details_subject_type\": \"{}\", \"field_input_type_causer_id\": \"text\", \"field_required_causer_type\": \"0\", \"field_required_description\": \"1\", \"field_display_name_log_name\": \"Log Name\", \"field_input_type_batch_uuid\": \"text\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_properties\": \"text_area\", \"field_input_type_subject_id\": \"text\", \"field_input_type_updated_at\": \"timestamp\", \"field_required_subject_type\": \"0\", \"field_display_name_causer_id\": \"Causer Id\", \"field_input_type_causer_type\": \"text\", \"field_input_type_description\": \"text\", \"field_display_name_batch_uuid\": \"Batch Uuid\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_properties\": \"Properties\", \"field_display_name_subject_id\": \"Subject Id\", \"field_display_name_updated_at\": \"Updated At\", \"field_input_type_subject_type\": \"text\", \"field_display_name_causer_type\": \"Causer Type\", \"field_display_name_description\": \"Description\", \"field_display_name_subject_type\": \"Subject Type\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:26:24', '2025-08-07 19:26:24'),
(10, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/15\", \"data\": {\"id\": \"15\", \"icon\": \"voyager-gift\", \"name\": \"activity_log\", \"slug\": \"activity-log\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"model_name\": \"App\\\\Models\\\\ActivityLog\", \"description\": null, \"field_event\": \"event\", \"policy_name\": null, \"order_column\": null, \"field_log_name\": \"log_name\", \"field_order_id\": \"1\", \"field_causer_id\": \"causer_id\", \"order_direction\": \"asc\", \"field_batch_uuid\": \"batch_uuid\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_properties\": \"properties\", \"field_subject_id\": \"subject_id\", \"field_updated_at\": \"updated_at\", \"field_causer_type\": \"causer_type\", \"field_description\": \"description\", \"field_order_event\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_add_log_name\": \"on\", \"field_subject_type\": \"subject_type\", \"display_name_plural\": \"Lịch sử thao tác\", \"field_add_causer_id\": \"on\", \"field_details_event\": \"{}\", \"field_edit_log_name\": \"on\", \"field_input_type_id\": \"text\", \"field_read_log_name\": \"on\", \"field_add_batch_uuid\": \"on\", \"field_add_properties\": \"on\", \"field_edit_causer_id\": \"on\", \"field_order_log_name\": \"2\", \"field_read_causer_id\": \"on\", \"field_required_event\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Lịch sử thao tác\", \"field_add_causer_type\": \"on\", \"field_add_description\": \"on\", \"field_browse_log_name\": \"on\", \"field_delete_log_name\": \"on\", \"field_display_name_id\": \"Id\", \"field_edit_batch_uuid\": \"on\", \"field_edit_created_at\": \"on\", \"field_edit_properties\": \"on\", \"field_order_causer_id\": \"8\", \"field_read_batch_uuid\": \"on\", \"field_read_created_at\": \"on\", \"field_read_properties\": \"on\", \"field_browse_causer_id\": \"on\", \"field_delete_causer_id\": \"on\", \"field_details_log_name\": \"{}\", \"field_edit_causer_type\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_event\": \"text\", \"field_order_batch_uuid\": \"10\", \"field_order_created_at\": \"11\", \"field_order_properties\": \"9\", \"field_order_subject_id\": \"6\", \"field_order_updated_at\": \"12\", \"field_read_causer_type\": \"on\", \"field_read_description\": \"on\", \"field_browse_batch_uuid\": \"on\", \"field_browse_created_at\": \"on\", \"field_browse_properties\": \"on\", \"field_delete_batch_uuid\": \"on\", \"field_delete_created_at\": \"on\", \"field_delete_properties\": \"on\", \"field_details_causer_id\": \"{}\", \"field_order_causer_type\": \"7\", \"field_order_description\": \"3\", \"field_required_log_name\": \"0\", \"field_browse_causer_type\": \"on\", \"field_browse_description\": \"on\", \"field_delete_causer_type\": \"on\", \"field_delete_description\": \"on\", \"field_details_batch_uuid\": \"{}\", \"field_details_created_at\": \"{}\", \"field_details_properties\": \"{}\", \"field_details_subject_id\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_event\": \"Event\", \"field_order_subject_type\": \"4\", \"field_required_causer_id\": \"0\", \"field_details_causer_type\": \"{}\", \"field_details_description\": \"{}\", \"field_input_type_log_name\": \"text\", \"field_required_batch_uuid\": \"0\", \"field_required_created_at\": \"0\", \"field_required_properties\": \"0\", \"field_required_subject_id\": \"0\", \"field_required_updated_at\": \"0\", \"field_details_subject_type\": \"{}\", \"field_input_type_causer_id\": \"text\", \"field_required_causer_type\": \"0\", \"field_required_description\": \"1\", \"field_display_name_log_name\": \"Log Name\", \"field_input_type_batch_uuid\": \"text\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_properties\": \"text_area\", \"field_input_type_subject_id\": \"text\", \"field_input_type_updated_at\": \"timestamp\", \"field_required_subject_type\": \"0\", \"field_display_name_causer_id\": \"Causer Id\", \"field_input_type_causer_type\": \"text\", \"field_input_type_description\": \"text\", \"field_display_name_batch_uuid\": \"Batch Uuid\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_properties\": \"Properties\", \"field_display_name_subject_id\": \"Subject Id\", \"field_display_name_updated_at\": \"Updated At\", \"field_input_type_subject_type\": \"text\", \"field_display_name_causer_type\": \"Causer Type\", \"field_display_name_description\": \"Description\", \"field_display_name_subject_type\": \"Subject Type\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:26:43', '2025-08-07 19:26:43'),
(11, 'Admin', 'Sửa bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/bread/15\", \"data\": {\"id\": \"15\", \"icon\": \"voyager-gift\", \"name\": \"activity_log\", \"slug\": \"activity-log\", \"scope\": null, \"field_id\": \"id\", \"controller\": null, \"model_name\": \"App\\\\Models\\\\ActivityLog\", \"description\": null, \"field_event\": \"event\", \"policy_name\": null, \"order_column\": null, \"field_log_name\": \"log_name\", \"field_order_id\": \"1\", \"field_causer_id\": \"causer_id\", \"order_direction\": \"asc\", \"field_batch_uuid\": \"batch_uuid\", \"field_created_at\": \"created_at\", \"field_details_id\": \"{}\", \"field_properties\": \"properties\", \"field_subject_id\": \"subject_id\", \"field_updated_at\": \"updated_at\", \"field_causer_type\": \"causer_type\", \"field_description\": \"description\", \"field_order_event\": \"5\", \"field_required_id\": \"1\", \"default_search_key\": null, \"field_add_log_name\": \"on\", \"field_subject_type\": \"subject_type\", \"display_name_plural\": \"Lịch sử thao tác\", \"field_add_causer_id\": \"on\", \"field_details_event\": \"{}\", \"field_edit_log_name\": \"on\", \"field_input_type_id\": \"text\", \"field_read_log_name\": \"on\", \"field_add_batch_uuid\": \"on\", \"field_add_properties\": \"on\", \"field_edit_causer_id\": \"on\", \"field_order_log_name\": \"2\", \"field_read_causer_id\": \"on\", \"field_required_event\": \"0\", \"generate_permissions\": \"on\", \"order_display_column\": null, \"display_name_singular\": \"Lịch sử thao tác\", \"field_add_causer_type\": \"on\", \"field_add_description\": \"on\", \"field_browse_log_name\": \"on\", \"field_delete_log_name\": \"on\", \"field_display_name_id\": \"Id\", \"field_edit_batch_uuid\": \"on\", \"field_edit_created_at\": \"on\", \"field_edit_properties\": \"on\", \"field_order_causer_id\": \"8\", \"field_read_batch_uuid\": \"on\", \"field_read_created_at\": \"on\", \"field_read_properties\": \"on\", \"field_browse_causer_id\": \"on\", \"field_delete_causer_id\": \"on\", \"field_details_log_name\": \"{}\", \"field_edit_causer_type\": \"on\", \"field_edit_description\": \"on\", \"field_input_type_event\": \"text\", \"field_order_batch_uuid\": \"10\", \"field_order_created_at\": \"11\", \"field_order_properties\": \"9\", \"field_order_subject_id\": \"6\", \"field_order_updated_at\": \"12\", \"field_read_causer_type\": \"on\", \"field_read_description\": \"on\", \"field_browse_batch_uuid\": \"on\", \"field_browse_created_at\": \"on\", \"field_browse_properties\": \"on\", \"field_delete_batch_uuid\": \"on\", \"field_delete_created_at\": \"on\", \"field_delete_properties\": \"on\", \"field_details_causer_id\": \"{}\", \"field_order_causer_type\": \"7\", \"field_order_description\": \"3\", \"field_required_log_name\": \"0\", \"field_browse_causer_type\": \"on\", \"field_browse_description\": \"on\", \"field_delete_causer_type\": \"on\", \"field_delete_description\": \"on\", \"field_details_batch_uuid\": \"{}\", \"field_details_created_at\": \"{}\", \"field_details_properties\": \"{}\", \"field_details_subject_id\": \"{}\", \"field_details_updated_at\": \"{}\", \"field_display_name_event\": \"Event\", \"field_order_subject_type\": \"4\", \"field_required_causer_id\": \"0\", \"field_details_causer_type\": \"{}\", \"field_details_description\": \"{}\", \"field_input_type_log_name\": \"text\", \"field_required_batch_uuid\": \"0\", \"field_required_created_at\": \"0\", \"field_required_properties\": \"0\", \"field_required_subject_id\": \"0\", \"field_required_updated_at\": \"0\", \"field_details_subject_type\": \"{}\", \"field_input_type_causer_id\": \"text\", \"field_required_causer_type\": \"0\", \"field_required_description\": \"1\", \"field_display_name_log_name\": \"Log Name\", \"field_input_type_batch_uuid\": \"text\", \"field_input_type_created_at\": \"timestamp\", \"field_input_type_properties\": \"text_area\", \"field_input_type_subject_id\": \"text\", \"field_input_type_updated_at\": \"timestamp\", \"field_required_subject_type\": \"0\", \"field_display_name_causer_id\": \"Causer Id\", \"field_input_type_causer_type\": \"text\", \"field_input_type_description\": \"text\", \"field_display_name_batch_uuid\": \"Batch Uuid\", \"field_display_name_created_at\": \"Created At\", \"field_display_name_properties\": \"Properties\", \"field_display_name_subject_id\": \"Subject Id\", \"field_display_name_updated_at\": \"Updated At\", \"field_input_type_subject_type\": \"text\", \"field_display_name_causer_type\": \"Causer Type\", \"field_display_name_description\": \"Description\", \"field_display_name_subject_type\": \"Subject Type\"}, \"route\": \"voyager.bread.update\"}', NULL, '2025-08-07 19:26:44', '2025-08-07 19:26:44'),
(12, 'Admin', 'Thêm bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/posts\", \"data\": {\"body\": \"<p>&aacute;dasd</p>\", \"slug\": \"adasd\", \"image\": {}, \"title\": \"ádasd\", \"status\": \"PUBLISHED\", \"excerpt\": \"ádasdas\", \"seo_title\": null, \"category_id\": \"1\", \"meta_keywords\": null, \"meta_description\": null}, \"route\": \"voyager.posts.store\"}', NULL, '2025-08-07 19:27:02', '2025-08-07 19:27:02'),
(13, 'Admin', 'Thêm bản ghi', NULL, NULL, NULL, 'App\\Models\\User', 1, '{\"url\": \"http://blockchain-traceability-main.test/admin/posts\", \"data\": {\"body\": \"<p>&aacute;dasd</p>\", \"slug\": \"adasd\", \"image\": {}, \"title\": \"ádasd\", \"status\": \"PUBLISHED\", \"excerpt\": \"ádasdas\", \"seo_title\": null, \"category_id\": \"1\", \"meta_keywords\": null, \"meta_description\": null}, \"route\": \"voyager.posts.store\"}', NULL, '2025-08-07 19:27:02', '2025-08-07 19:27:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
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
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(2, NULL, 1, 'Category 2', 'category-2', '2025-06-07 00:40:38', '2025-06-07 00:40:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_rows`
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
-- Đang đổ dữ liệu cho bảng `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 5),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 10),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 11),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 14),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 17),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 18),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 15),
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
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'trace_code', 'text', 'Trace Code', 1, 1, 1, 0, 1, 1, '{\"validation\":{\"rule\":\"unique:products,trace_code\"}}', 2),
(58, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 8, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(61, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 10),
(62, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(63, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 12),
(64, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 9, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(67, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(68, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(71, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 10, 'trace_code', 'text', 'Trace Code', 1, 1, 1, 1, 1, 1, '{}', 3),
(73, 10, 'stage_id', 'text', 'Stage Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(74, 10, 'data', 'text_area', 'Data', 1, 1, 1, 1, 1, 1, '{}', 7),
(75, 10, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, '{}', 8),
(76, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(77, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(78, 10, 'product_history_belongsto_product_relationship', 'relationship', 'Product', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"trace_code\",\"key\":\"trace_code\",\"label\":\"trace_code\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(79, 10, 'product_history_belongsto_stage_relationship', 'relationship', 'Stage', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Stage\",\"table\":\"stages\",\"type\":\"belongsTo\",\"column\":\"stage_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(80, 8, 'created_by', 'text', 'Created By', 0, 1, 1, 0, 0, 1, '{}', 13),
(81, 8, 'product_belongsto_user_relationship', 'relationship', 'Users', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(82, 8, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(83, 8, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '{}', 9),
(84, 10, 'product_history_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"created_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(85, 10, 'created_by', 'text', 'Created By', 0, 1, 1, 1, 1, 1, '{}', 9),
(86, 8, 'short_description', 'rich_text_box', 'Short Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 8, 'excerpt', 'rich_text_box', 'Excerpt', 0, 1, 1, 1, 1, 1, '{}', 5),
(88, 8, 'certification_content', 'rich_text_box', 'Certification Content', 0, 1, 1, 1, 1, 1, '{}', 7),
(89, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 12),
(90, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(91, 1, 'website', 'text', 'Website', 0, 1, 1, 1, 1, 1, '{}', 7),
(92, 1, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 8),
(93, 1, 'company_name', 'text', 'Company Name', 0, 1, 1, 1, 1, 1, '{}', 6),
(94, 1, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 9),
(95, 10, 'tx_hash', 'text', 'Tx Hash', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(97, 15, 'log_name', 'text', 'Log Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(98, 15, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(99, 15, 'subject_type', 'text', 'Subject Type', 0, 0, 0, 0, 0, 0, '{}', 4),
(100, 15, 'event', 'text', 'Event', 0, 0, 0, 0, 0, 0, '{}', 5),
(101, 15, 'subject_id', 'text', 'Subject Id', 0, 0, 0, 0, 0, 0, '{}', 6),
(102, 15, 'causer_type', 'text', 'Causer Type', 0, 1, 1, 1, 1, 1, '{}', 7),
(103, 15, 'causer_id', 'text', 'Causer Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(104, 15, 'properties', 'text_area', 'Properties', 0, 1, 1, 1, 1, 1, '{}', 9),
(105, 15, 'batch_uuid', 'text', 'Batch Uuid', 0, 1, 1, 1, 1, 1, '{}', 10),
(106, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 11),
(107, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(108, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(109, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(110, 16, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(111, 16, 'product', 'text', 'Product', 0, 1, 1, 1, 1, 1, '{}', 4),
(112, 16, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 5),
(113, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(114, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_types`
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
-- Đang đổ dữ liệu cho bảng `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2025-06-07 00:40:38', '2025-06-11 00:20:31'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(8, 'products', 'products', 'Product', 'Products', 'voyager-window-list', 'App\\Models\\Product', NULL, 'App\\Http\\Controllers\\Admin\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-06-07 02:06:32', '2025-06-18 19:19:40'),
(9, 'stages', 'stages', 'Stage', 'Stages', 'voyager-bag', 'App\\Models\\Stage', NULL, 'App\\Http\\Controllers\\Admin\\StageController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-06-07 22:39:53', '2025-06-18 19:30:32'),
(10, 'product_histories', 'product-histories', 'Product History', 'Product Histories', 'voyager-certificate', 'App\\Models\\ProductHistory', NULL, 'App\\Http\\Controllers\\Admin\\ProductHistoryController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-06-07 22:55:02', '2025-06-18 19:30:58'),
(15, 'activity_log', 'activity-log', 'Lịch sử thao tác', 'Lịch sử thao tác', 'voyager-gift', 'App\\Models\\ActivityLog', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-08-06 19:25:08', '2025-08-07 19:26:43'),
(16, 'testhistories', 'testhistories', 'Test', 'Test', 'voyager-list-add', 'App\\Testhistory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2025-08-06 19:31:54', '2025-08-07 19:24:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(2, 'front.header', '2025-06-19 00:18:53', '2025-06-19 00:18:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
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
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2025-06-07 00:40:38', '2025-07-15 08:24:24', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 17, 1, '2025-06-07 00:40:38', '2025-07-15 08:26:31', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2025-06-07 00:40:38', '2025-06-07 00:40:38', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2025-06-07 00:40:38', '2025-07-15 08:24:24', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2025-06-07 00:40:38', '2025-07-15 08:26:41', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2025-06-07 00:40:38', '2025-07-15 08:26:54', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2025-06-07 00:40:38', '2025-07-15 08:26:54', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2025-06-07 00:40:38', '2025-07-15 08:26:54', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2025-06-07 00:40:38', '2025-07-15 08:26:54', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2025-06-07 00:40:38', '2025-07-15 08:26:41', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 17, 2, '2025-06-07 00:40:38', '2025-07-15 08:26:37', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 17, 3, '2025-06-07 00:40:38', '2025-07-15 08:26:37', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 17, 4, '2025-06-07 00:40:38', '2025-07-15 08:26:41', 'voyager.pages.index', NULL),
(14, 1, 'Products', '', '_self', 'voyager-window-list', NULL, 18, 2, '2025-06-07 02:06:32', '2025-07-15 08:26:58', 'voyager.products.index', NULL),
(15, 1, 'Stages', '', '_self', 'voyager-bag', '#000000', 18, 1, '2025-06-07 22:39:53', '2025-07-15 08:26:58', 'voyager.stages.index', 'null'),
(16, 1, 'Product Histories', '', '_self', 'voyager-certificate', '#000000', 18, 3, '2025-06-07 22:55:02', '2025-07-15 08:27:01', 'voyager.product-histories.index', 'null'),
(17, 1, 'Pages & Posts', '#', '_self', 'voyager-list', '#000000', NULL, 4, '2025-06-18 19:20:44', '2025-07-15 08:26:31', NULL, ''),
(18, 1, 'Products', '#', '_self', 'voyager-list', '#000000', NULL, 5, '2025-06-18 19:21:20', '2025-07-15 08:26:31', NULL, ''),
(19, 2, 'Trang chủ', '', '_self', NULL, '#000000', NULL, 1, '2025-06-19 00:19:21', '2025-06-19 00:33:13', 'home', NULL),
(20, 2, 'Tin tức', '', '_self', NULL, '#000000', NULL, 3, '2025-06-19 00:32:48', '2025-06-19 00:33:13', 'posts.index', NULL),
(21, 2, 'Giới thiệu', '#', '_self', NULL, '#000000', NULL, 2, '2025-06-19 00:33:11', '2025-06-19 00:33:13', NULL, ''),
(22, 2, 'Sản phẩm', '#', '_self', NULL, '#000000', NULL, 8, '2025-06-19 00:34:06', '2025-06-19 00:34:06', NULL, ''),
(23, 2, 'Hợp tác', '', '_self', NULL, '#000000', NULL, 9, '2025-06-19 00:34:18', '2025-06-19 01:21:19', 'cooperate', 'null'),
(24, 2, 'Liên hệ', '#', '_self', NULL, '#000000', NULL, 10, '2025-06-19 00:34:34', '2025-06-19 00:34:34', NULL, ''),
(25, 1, 'Lịch sử thao tác', '', '_self', 'voyager-gift', NULL, NULL, 11, '2025-08-06 19:25:09', '2025-08-06 19:25:09', 'voyager.activity-log.index', NULL),
(26, 1, 'Test', '', '_self', 'voyager-list-add', NULL, NULL, 12, '2025-08-06 19:31:54', '2025-08-06 19:31:54', 'voyager.testhistories.index', NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
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
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2025_06_08_060541_add_created_by_to_products_table', 3),
(30, '2025_08_07_020719_create_activity_log_table', 4),
(31, '2025_08_07_020720_add_event_column_to_activity_log_table', 4),
(32, '2025_08_07_020721_add_batch_uuid_column_to_activity_log_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
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
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2025-06-07 00:40:38', '2025-06-07 00:40:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(2, 'browse_bread', NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(3, 'browse_database', NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(4, 'browse_media', NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(5, 'browse_compass', NULL, '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(6, 'browse_menus', 'menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(7, 'read_menus', 'menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(8, 'edit_menus', 'menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(9, 'add_menus', 'menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(10, 'delete_menus', 'menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(11, 'browse_roles', 'roles', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(12, 'read_roles', 'roles', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(13, 'edit_roles', 'roles', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(14, 'add_roles', 'roles', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(15, 'delete_roles', 'roles', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(16, 'browse_users', 'users', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(17, 'read_users', 'users', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(18, 'edit_users', 'users', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(19, 'add_users', 'users', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(20, 'delete_users', 'users', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(21, 'browse_settings', 'settings', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(22, 'read_settings', 'settings', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(23, 'edit_settings', 'settings', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(24, 'add_settings', 'settings', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(25, 'delete_settings', 'settings', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(26, 'browse_categories', 'categories', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(27, 'read_categories', 'categories', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(28, 'edit_categories', 'categories', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(29, 'add_categories', 'categories', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(30, 'delete_categories', 'categories', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(31, 'browse_posts', 'posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(32, 'read_posts', 'posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(33, 'edit_posts', 'posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(34, 'add_posts', 'posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(35, 'delete_posts', 'posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(36, 'browse_pages', 'pages', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(37, 'read_pages', 'pages', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(38, 'edit_pages', 'pages', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(39, 'add_pages', 'pages', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(40, 'delete_pages', 'pages', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(41, 'browse_products', 'products', '2025-06-07 02:06:32', '2025-06-07 02:06:32'),
(42, 'read_products', 'products', '2025-06-07 02:06:32', '2025-06-07 02:06:32'),
(43, 'edit_products', 'products', '2025-06-07 02:06:32', '2025-06-07 02:06:32'),
(44, 'add_products', 'products', '2025-06-07 02:06:32', '2025-06-07 02:06:32'),
(45, 'delete_products', 'products', '2025-06-07 02:06:32', '2025-06-07 02:06:32'),
(46, 'browse_stages', 'stages', '2025-06-07 22:39:53', '2025-06-07 22:39:53'),
(47, 'read_stages', 'stages', '2025-06-07 22:39:53', '2025-06-07 22:39:53'),
(48, 'edit_stages', 'stages', '2025-06-07 22:39:53', '2025-06-07 22:39:53'),
(49, 'add_stages', 'stages', '2025-06-07 22:39:53', '2025-06-07 22:39:53'),
(50, 'delete_stages', 'stages', '2025-06-07 22:39:53', '2025-06-07 22:39:53'),
(51, 'browse_product_histories', 'product_histories', '2025-06-07 22:55:02', '2025-06-07 22:55:02'),
(52, 'read_product_histories', 'product_histories', '2025-06-07 22:55:02', '2025-06-07 22:55:02'),
(53, 'edit_product_histories', 'product_histories', '2025-06-07 22:55:02', '2025-06-07 22:55:02'),
(54, 'add_product_histories', 'product_histories', '2025-06-07 22:55:02', '2025-06-07 22:55:02'),
(55, 'delete_product_histories', 'product_histories', '2025-06-07 22:55:02', '2025-06-07 22:55:02'),
(56, 'browse_activity_log', 'activity_log', '2025-08-06 19:25:08', '2025-08-06 19:25:08'),
(57, 'read_activity_log', 'activity_log', '2025-08-06 19:25:08', '2025-08-06 19:25:08'),
(58, 'edit_activity_log', 'activity_log', '2025-08-06 19:25:08', '2025-08-06 19:25:08'),
(59, 'add_activity_log', 'activity_log', '2025-08-06 19:25:08', '2025-08-06 19:25:08'),
(60, 'delete_activity_log', 'activity_log', '2025-08-06 19:25:08', '2025-08-06 19:25:08'),
(61, 'browse_testhistories', 'testhistories', '2025-08-06 19:31:54', '2025-08-06 19:31:54'),
(62, 'read_testhistories', 'testhistories', '2025-08-06 19:31:54', '2025-08-06 19:31:54'),
(63, 'edit_testhistories', 'testhistories', '2025-08-06 19:31:54', '2025-08-06 19:31:54'),
(64, 'add_testhistories', 'testhistories', '2025-08-06 19:31:54', '2025-08-06 19:31:54'),
(65, 'delete_testhistories', 'testhistories', '2025-08-06 19:31:54', '2025-08-06 19:31:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
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
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1);

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
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:31'),
(2, 1, 2, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:37'),
(3, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:41'),
(4, 1, 2, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:47'),
(9, 1, 1, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post1', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:31'),
(10, 1, 2, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post2', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:37'),
(11, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post3', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:41'),
(12, 1, 2, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post4', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:47'),
(13, 1, 1, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post4', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:31'),
(14, 1, 2, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post5', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:37'),
(15, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post6', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:41'),
(16, 1, 2, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post7', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:47'),
(17, 1, 1, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post18', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:31'),
(18, 1, 2, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post29', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:37'),
(19, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post31', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:41'),
(20, 1, 2, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post41', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2025-06-07 00:40:38', '2025-06-18 20:11:47'),
(24, 1, 1, 'ádasd', NULL, 'ádasdas', '<p>&aacute;dasd</p>', 'posts\\August2025\\JZK40vHVQz9MOwG1yYuy.jpg', 'adasd', NULL, NULL, 'PUBLISHED', 0, '2025-08-07 19:27:01', '2025-08-07 19:27:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `trace_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `certification_content` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `created_by`, `trace_code`, `name`, `description`, `avatar`, `created_at`, `updated_at`, `deleted_at`, `images`, `short_description`, `excerpt`, `certification_content`) VALUES
(8, 1, 'SP000005', 'Chè Thái Nguyên', '<main class=\"container\">\r\n<section class=\"tabs-container aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div id=\"myTabContent\" class=\"tab-content\">\r\n<div id=\"product-tab-pane\" class=\"tab-pane fade p-3 active show\" role=\"tabpanel\" aria-labelledby=\"product-tab\">\r\n<p><strong>Net volume :&nbsp;</strong>250ml / can</p>\r\n<p><strong>Expiry date :&nbsp;</strong>9 months with manufacture date and expiry date shown on the bottom of the can. Do not use expired product</p>\r\n<p><strong>Directions :&nbsp;</strong>Drink cold directly after opening can or drink with ice</p>\r\n<p><strong>Instructions for storage :&nbsp;</strong>Store cold at 2-8 &deg;C</p>\r\n<p><strong>Packaging :&nbsp;</strong>1 can x 250ml , box 24 can of 250ml</p>\r\n<p><strong>Certified organic by Ecocert SA:</strong></p>\r\n</div>\r\n</div>\r\n</section>\r\n</main>', 'products\\June2025\\7QMShlCqynNEiBEo3qvH.jpg', '2025-06-11 09:20:14', '2025-06-11 09:20:14', NULL, '[\"products\\\\June2025\\\\2OV671HasPXsG0GGa973.png\",\"products\\\\June2025\\\\VrhTcfNRlL464NBXq9qp.png\",\"products\\\\June2025\\\\DCOPta5N4lEvIIMEWg2g.png\",\"products\\\\June2025\\\\VNxW5Y6V5CR4u1OIu09g.png\"]', '<p>Sản phẩm của HTX Ch&egrave; Xanh Th&aacute;i Nguy&ecirc;n</p>', '<section class=\"product-header aos-init aos-animate\" data-aos=\"fade-up\">\r\n<div class=\"row align-items-center\">\r\n<div class=\"col-lg-7 product-info\">\r\n<p>Ch&egrave; T&acirc;n Cương được mệnh danh l&agrave; \"Đệ nhất danh tr&agrave;\" của Việt Nam, nổi tiếng với hương thơm cốm non dịu nhẹ, vị ch&aacute;t thanh m&agrave; ngọt hậu, v&agrave; m&agrave;u nước xanh trong &aacute;nh v&agrave;ng quyến rũ.</p>\r\n</div>\r\n</div>\r\n</section>', '<main class=\"container\">\r\n<section class=\"tabs-container aos-init aos-animate\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n<div id=\"myTabContent\" class=\"tab-content\">\r\n<div id=\"certification-tab-pane\" class=\"tab-pane fade p-3 active show\" role=\"tabpanel\" aria-labelledby=\"certification-tab\">\r\n<p><strong>Fair Trade certified according to Fair for Life:&nbsp;</strong>27.6% of total volume of ingredients. Origin: Vietnam. Access details at: www.Fairforlife.org</p>\r\n<p><strong>Product self-declaration registration file :&nbsp;</strong>TCB number: 01 / DRINKIZZ / 2020</p>\r\n<p><strong>Factory certification standards :&nbsp;</strong>GMP, FDA, FSSC 22000, VSATTP</p>\r\n<p><strong>Nutriton Facts:</strong></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"https://res.cloudinary.com/agridential/image/upload/v1600100221/Production/M000124/nutifact_vbltv9.png\" alt=\"undefined\"></p>\r\n</div>\r\n</div>\r\n</section>\r\n</main>'),
(9, 1, 'SP001', 'Ezra Bailey', NULL, NULL, '2025-06-12 19:01:45', '2025-06-12 19:01:45', NULL, NULL, NULL, NULL, NULL),
(10, 1, 'SP002', 'Kelsi Harvey', NULL, NULL, '2025-06-12 20:13:00', '2025-06-12 20:13:00', NULL, NULL, NULL, NULL, NULL),
(11, 1, 'SP003', 'Sincere Pfeffer', '<p>Quaerat dicta quod vitae. Doloremque iste reprehenderit necessitatibus distinctio officiis sed. Placeat ipsum libero natus corrupti.<br>Beatae voluptatibus repellendus cumque officia omnis quidem cupiditate. Expedita minima praesentium totam optio tempore sapiente consequatur delectus. Nam voluptatibus quae quas quia nemo illum assumenda.<br>Ratione dicta aspernatur qui. Officiis quo debitis voluptas fugiat ex nam minus omnis. Optio dolorum corporis tempore numquam.</p>', 'products/June2025/vBsqzFm0dorXSECI0LYg.jpg', '2025-06-14 10:52:16', '2025-06-14 10:52:16', NULL, '[\"products\\/June2025\\/Bd1lipz7pkijZiHxzI3Y.png\",\"products\\/June2025\\/5MEM577Wybg6IMcCqPaI.png\",\"products\\/June2025\\/LeMwJsCCvH9LwmIWfBgM.png\"]', '<p>Quaerat dicta quod vitae. Doloremque iste reprehenderit necessitatibus distinctio officiis sed. Placeat ipsum libero natus corrupti.<br>Beatae voluptatibus repellendus cumque officia omnis quidem cupiditate. Expedita minima praesentium totam optio tempore sapiente consequatur delectus. Nam voluptatibus quae quas quia nemo illum assumenda.<br>Ratione dicta aspernatur qui. Officiis quo debitis voluptas fugiat ex nam minus omnis. Optio dolorum corporis tempore numquam.</p>', '<p>Quaerat dicta quod vitae. Doloremque iste reprehenderit necessitatibus distinctio officiis sed. Placeat ipsum libero natus corrupti.<br>Beatae voluptatibus repellendus cumque officia omnis quidem cupiditate. Expedita minima praesentium totam optio tempore sapiente consequatur delectus. Nam voluptatibus quae quas quia nemo illum assumenda.<br>Ratione dicta aspernatur qui. Officiis quo debitis voluptas fugiat ex nam minus omnis. Optio dolorum corporis tempore numquam.</p>', '<p>Quaerat dicta quod vitae. Doloremque iste reprehenderit necessitatibus distinctio officiis sed. Placeat ipsum libero natus corrupti.<br>Beatae voluptatibus repellendus cumque officia omnis quidem cupiditate. Expedita minima praesentium totam optio tempore sapiente consequatur delectus. Nam voluptatibus quae quas quia nemo illum assumenda.<br>Ratione dicta aspernatur qui. Officiis quo debitis voluptas fugiat ex nam minus omnis. Optio dolorum corporis tempore numquam.</p>'),
(12, 1, 'SP004', 'Chè Thái Nguyên', '<p><span dir=\"ltr\">C&acirc;y&nbsp;<strong dir=\"ltr\">ch&egrave; Th&aacute;i Nguy&ecirc;n</strong>&nbsp;kh&ocirc;ng tự n&oacute; sinh ra m&agrave; do con người khai ph&aacute; v&agrave; canh t&aacute;c từ c&aacute;ch đ&acirc;y h&agrave;ng trăm năm. Mặc d&ugrave; t&ocirc;i chưa t&igrave;m thấy một nghi&ecirc;n cứu khoa học n&agrave;o l&yacute; giải được s&acirc;u sắc c&aacute;c yếu tố tự nhi&ecirc;n t&aacute;c động l&ecirc;n c&acirc;y ch&egrave; nơi đ&acirc;y nhưng trải qua nhiều năm kinh nghiệm t&ocirc;i cảm thấy&nbsp;<strong dir=\"ltr\">c&acirc;y ch&egrave; Th&aacute;i Nguy&ecirc;n</strong>&nbsp;m&agrave; nổi bật l&agrave; c&acirc;y ch&egrave; T&acirc;n Cương như một linh vật hội tụ đủ hương trời, vị đất v&agrave; sức lao động s&aacute;ng tạo của con người T&acirc;n Cương, Th&aacute;i Nguy&ecirc;n.</span></p>\r\n<p><img src=\"https://vietcotra.vn/media/images/doi-che-thai-nguyen.jpg\" alt=\"Đồi ch&egrave; Th&aacute;i Nguy&ecirc;n\" width=\"764\" height=\"429\"></p>\r\n<p>H&aacute;i ch&egrave; T&acirc;n Cương Th&aacute;i Nguy&ecirc;n&nbsp;</p>\r\n<p>Hương cốm non thuần khiết tựa như kh&iacute; trời quanh năm m&aacute;t mẻ của một v&ugrave;ng đồi n&uacute;i thấp nằm ngay cạnh s&ocirc;ng C&ocirc;ng thơ mộng. Đặc biệt những nương ch&egrave; T&acirc;n Cương c&ograve;n được hưởng chọn &aacute;nh nắng b&igrave;nh minh (ph&iacute;a Đ&ocirc;ng) trong khi được dẫy n&uacute;i Tam Đảo bao bọc v&agrave; bảo vệ trước những bức xạ khắc nghiệt của mặt trời v&agrave;o buổi chiều (ph&iacute;a T&acirc;y).</p>', 'products/June2025/lDdFC9xw04GFOmE9O1VY.jpg', '2025-06-15 18:09:43', '2025-06-15 18:09:43', NULL, '[\"products\\/June2025\\/i48ZJjvH6y8gbzNCRS2l.jpg\",\"products\\/June2025\\/11NSS3P95wNnCXvjTpEA.jpg\",\"products\\/June2025\\/YrRHUThqFO5NwFGadJju.jpg\"]', '<p>Một đặc sản của Th&aacute;i Nguy&ecirc;n</p>', '<p><span dir=\"ltr\">Ch&egrave; Th&aacute;i Nguy&ecirc;n l&agrave; một trong những đặc sản nổi tiếng v&agrave; rất đỗi th&acirc;n quen với mỗi người d&acirc;n Việt Nam. Trong v&ugrave;ng&nbsp;ch&egrave; Th&aacute;i Nguy&ecirc;n&nbsp;rộng lớn, v&ugrave;ng ch&egrave; T&acirc;n Cương được coi l&agrave; v&ugrave;ng l&otilde;i bởi đ&acirc;y l&agrave; nơi hội tụ c&aacute;c sản vật ch&egrave; đặc biệt thơm ngon v&agrave; nổi tiếng bao đời nay như: Ch&egrave; M&oacute;c C&acirc;u, ch&egrave; N&otilde;n T&ocirc;m v&agrave; đặc biệt l&agrave; ch&egrave; Đinh Ngọc. Đ&acirc;y cũng l&agrave; l&yacute; do khiến thương hiệu ch&egrave; T&acirc;n Cương Th&aacute;i Nguy&ecirc;n được bảo hộ chỉ dẫn địa l&yacute; sớm nhất (năm 2007) trong c&aacute;c v&ugrave;ng ch&egrave; tr&ecirc;n cả nước.</span></p>', '<p><strong>Ti&ecirc;u chuẩn ISO 22000: Về an to&agrave;n thực phẩm.</strong></p>\r\n<ul>\r\n<li>Chứng nhận HACCP: Hệ thống ph&acirc;n t&iacute;ch mối nguy v&agrave; kiểm so&aacute;t điểm tới hạn trong qu&aacute; tr&igrave;nh sản xuất.</li>\r\n<li>Chứng nhận Rainforest Alliance: Đảm bảo ch&egrave; được sản xuất bền vững, bảo vệ m&ocirc;i trường v&agrave; quyền lợi người lao động.</li>\r\n<li>Chứng nhận Fair Trade: Chứng minh sản phẩm đạt ti&ecirc;u chuẩn thương mại c&ocirc;ng bằng.</li>\r\n</ul>\r\n<p>Việc đạt được c&aacute;c chứng nhận n&agrave;y kh&ocirc;ng chỉ gi&uacute;p ch&egrave; Th&aacute;i Nguy&ecirc;n dễ d&agrave;ng tiếp cận với c&aacute;c thị trường kh&oacute; t&iacute;nh m&agrave; c&ograve;n n&acirc;ng cao uy t&iacute;n v&agrave; gi&aacute; trị thương hiệu.<br><img src=\"https://bizweb.dktcdn.net/100/201/525/files/che-thai-nguyen-xuat-khau-4.jpg?v=1734405774703\" data-thumb=\"original\"><img src=\"https://bizweb.dktcdn.net/100/201/525/files/che-thai-nguyen-xuat-khau-5.jpg?v=1734405775807\" data-thumb=\"original\"><img src=\"https://bizweb.dktcdn.net/100/201/525/files/che-thai-nguyen-xuat-khau-6.jpg?v=1734405776864\" data-thumb=\"original\"><img src=\"https://bizweb.dktcdn.net/100/201/525/files/che-thai-nguyen-xuat-khau-7.jpg?v=1734405778117\" data-thumb=\"original\"></p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_histories`
--

CREATE TABLE `product_histories` (
  `id` int UNSIGNED NOT NULL,
  `trace_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stage_id` int NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `tx_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_histories`
--

INSERT INTO `product_histories` (`id`, `trace_code`, `stage_id`, `data`, `images`, `created_at`, `updated_at`, `created_by`, `tx_hash`) VALUES
(1, 'SP000005', 1, '{\"Tên vườn chè\":\"1\",\"Người phụ trách\":\"1\",\"Số điện thoại liên lạc\":\"1\",\"Địa chỉ\":\"1\",\"Mã số vùng trồng\":\"1\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"1\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"1\",\"Nhà sản xuất phân bón\":\"1\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/nfcyVKfGBa3YQeVM5MoxykhohvEWHDu97bQejJe3.png\",\"product_histories\\/OvUjZiZTYwpbDaRIZDFH605UfJJApRRoyMI7ZiBP.png\"]', '2025-06-09 11:41:38', '2025-06-11 11:41:38', 1, '4'),
(2, 'SP000005', 1, '{\"Tên vườn chè\":\"2\",\"Người phụ trách\":\"2\",\"Số điện thoại liên lạc\":\"2\",\"Địa chỉ\":\"2\",\"Mã số vùng trồng\":\"2\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"2\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"2\",\"Nhà sản xuất phân bón\":\"2\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/nfcyVKfGBa3YQeVM5MoxykhohvEWHDu97bQejJe3.png\",\"product_histories\\/OvUjZiZTYwpbDaRIZDFH605UfJJApRRoyMI7ZiBP.png\",\"product_histories\\/HJC2YAdYOAHLPY2oGwoJoTfJwKuqZcI8oXf4DQWu.png\"]', '2025-06-11 11:41:38', '2025-06-11 11:41:38', 1, '3'),
(8, 'SP002', 1, '{\"Tên vườn chè\":\"1\",\"Người phụ trách\":\"\",\"Số điện thoại liên lạc\":\"\",\"Địa chỉ\":\"\",\"Mã số vùng trồng\":\"\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"\",\"Nhà sản xuất phân bón\":\"\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[]', '2025-06-12 20:17:55', '2025-06-12 20:17:55', 1, '2'),
(9, 'SP002', 2, '{\"Tên cơ sở\":\"1\",\"Người đại diện theo pháp luật\":\"1\",\"Số điện thoại liên lạc\":\"1\",\"Địa điểm sản xuất\":\"1\",\"Địa chỉ hoặc mã số cơ sở\":\"1\",\"Tên sản phẩm\":\"1\",\"Ngày sản xuất\":\"\",\"Số lô\":\"\",\"mã số định danh đơn nhất của sản phẩm và tem nhãn\":\"1\",\"Thời gian bắt đầu chế biến\":\"\",\"Thời gian kết thúc chế biến\":\"\",\"Tên sản phẩm chế biến\":\"\",\"Người phụ trách chế biến\":\"\",\"Tên loại bán thành phẩm dùng cho việc pha trộn\":\"\",\"Người phụ trách pha trộn\":\"\",\"Thời gian xuất nhập kho\":\"\",\"Hướng lưu chuyển\":\"\",\"Số lô sản phẩm\":\"\",\"Mã hiệu báo cáo kiểm tra\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/oCSS5NKvE037aotjbwKrTFQp9rSXLHA5EwrfpYTg.png\",\"product_histories\\/e0G6oxEtYaaRHesyxa4RGBAJczG2DQ9ylKSWewmc.png\"]', '2025-06-12 21:29:04', '2025-06-12 21:29:04', 1, '1'),
(10, 'SP002', 2, '{\"Tên cơ sở\":\"1\",\"Người đại diện theo pháp luật\":\"1\",\"Số điện thoại liên lạc\":\"1\",\"Địa điểm sản xuất\":\"1\",\"Địa chỉ hoặc mã số cơ sở\":\"\",\"Tên sản phẩm\":\"\",\"Ngày sản xuất\":\"\",\"Số lô\":\"\",\"Mã số định danh đơn nhất của sản phẩm và tem nhãn\":\"1\",\"Thời gian bắt đầu chế biến\":\"\",\"Thời gian kết thúc chế biến\":\"\",\"Tên sản phẩm chế biến\":\"\",\"Người phụ trách chế biến\":\"\",\"Tên loại bán thành phẩm dùng cho việc pha trộn\":\"\",\"Người phụ trách pha trộn\":\"\",\"Thời gian xuất nhập kho\":\"\",\"Hướng lưu chuyển\":\"\",\"Số lô sản phẩm\":\"\",\"Mã hiệu báo cáo kiểm tra\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[]', '2025-06-13 02:20:09', '2025-06-13 02:20:09', 1, '0x44ac859f7970387e3abe93e61a3bfd1004800f9895eeff4fb747ed1f39d41d1c'),
(11, 'SP003', 1, '{\"Tên vườn chè\":\"1\",\"Người phụ trách\":\"1\",\"Số điện thoại liên lạc\":\"1\",\"Địa chỉ\":\"1\",\"Mã số vùng trồng\":\"1\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"1\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"1\",\"Nhà sản xuất phân bón\":\"1\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/8bYnR7kIbj899O1sTsiFIbrSEl4Gn7aWgD3ZWtmb.jpg\"]', '2025-06-14 10:53:56', '2025-06-14 10:53:56', 1, '0xb12761476d42c385c3172cc3bb77d99b722879508622240a45d6f7af5d4ac9ab'),
(12, 'SP004', 1, '{\"Tên vườn chè\":\"HTX Chè Hùng Anh\",\"Người phụ trách\":\"Nguyễn Ngọc Hùng Anh\",\"Số điện thoại liên lạc\":\"0952116542\",\"Địa chỉ\":\"Tổ 2, xã Tân Cương, TP Thái Nguyên\",\"Mã số vùng trồng\":\"\",\"Ngày tháng tưới nước và bón phân\":\"2025-06-09\",\"Người thực hiện\":\"Hoàng Ngọc Lan\",\"Thời gian\":\"08:15\",\"Chủng loại phân bón\":\"\",\"Nhà sản xuất phân bón\":\"\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/6P6y48dkF6svRnmhAXCzt9Sfx4UTdkHzlA7S9atY.jpg\"]', '2025-06-15 18:17:04', '2025-06-15 18:17:04', 1, '0xfb8bfc05e15653fec3481c670b5872acd111522761603288afd77bdbf1e89ad9'),
(13, 'SP004', 1, '{\"Tên vườn chè\":\"\",\"Người phụ trách\":\"\",\"Số điện thoại liên lạc\":\"\",\"Địa chỉ\":\"\",\"Mã số vùng trồng\":\"\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"\",\"Nhà sản xuất phân bón\":\"\",\"Ngày sử dụng\":\"2025-06-10\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"Thuốc Origiande\",\"Tên nhà sản xuất thuốc thực vật\":\"AAA Organization\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/brZgjlGOEUHiDmy8eH6t8foQPn8LO6H0Ubd4Ssn9.jpg\"]', '2025-06-15 18:22:03', '2025-06-15 18:22:03', 1, '0x99a817266ccf754688095969270231594cfd8a2cb497aef362b2c00a7d373df5'),
(14, 'SP004', 1, '{\"Tên vườn chè\":\"\",\"Người phụ trách\":\"\",\"Số điện thoại liên lạc\":\"\",\"Địa chỉ\":\"\",\"Mã số vùng trồng\":\"\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"\",\"Nhà sản xuất phân bón\":\"\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"2025-06-13\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/e20pPFiHydEPrlfWlsCXY3Qu2RToOWU7hfaqNK2a.jpg\"]', '2025-06-15 18:25:01', '2025-06-15 18:25:01', 1, '0xbe35be5f2eb6fd74455ef0776130e11f41b2b710254e6014b78520f22c98757b'),
(15, 'SP004', 2, '{\"Tên cơ sở\":\"HTX Chè Hùng Anh\",\"Người đại diện theo pháp luật\":\"Nguyễn Ngọc Hùng Anh\",\"Số điện thoại liên lạc\":\"0952116542\",\"Địa điểm sản xuất\":\"Tổ 2, xã Tân Cương, TP Thái Nguyên\",\"Địa chỉ hoặc mã số cơ sở\":\"4600100252\",\"Tên sản phẩm\":\"Chè Tôm nõn\",\"Ngày sản xuất\":\"\",\"Số lô\":\"\",\"Mã số định danh đơn nhất của sản phẩm và tem nhãn\":\"\",\"Thời gian bắt đầu chế biến\":\"2025-06-16T08:00\",\"Thời gian kết thúc chế biến\":\"2025-06-16T11:30\",\"Tên sản phẩm chế biến\":\"Chè Tôm nõn\",\"Người phụ trách chế biến\":\"Nguyễn Văn Ba\",\"Tên loại bán thành phẩm dùng cho việc pha trộn\":\"\",\"Người phụ trách pha trộn\":\"\",\"Thời gian xuất nhập kho\":\"\",\"Hướng lưu chuyển\":\"\",\"Số lô sản phẩm\":\"\",\"Mã hiệu báo cáo kiểm tra\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[\"product_histories\\/RRkdxfa3io3NmzmgrFkNH8h38c4xtKTplhg9qYIs.jpg\"]', '2025-06-15 18:27:38', '2025-06-15 18:27:38', 1, '0x54b8b670b0db3b8694b02eaec956781a1c4ec716e92608fb6ba2749443fbd5de'),
(16, 'SP003', 1, '{\"Tên vườn chè\":\"1\",\"Người phụ trách\":\"1\",\"Số điện thoại liên lạc\":\"\",\"Địa chỉ\":\"\",\"Mã số vùng trồng\":\"\",\"Ngày tháng tưới nước và bón phân\":\"\",\"Người thực hiện\":\"\",\"Thời gian\":\"\",\"Chủng loại phân bón\":\"\",\"Nhà sản xuất phân bón\":\"\",\"Ngày sử dụng\":\"\",\"Tên loại thuốc bảo vệ thực vật sử dụng\":\"\",\"Tên nhà sản xuất thuốc thực vật\":\"\",\"Số giấy phép sản xuất thuốc bảo vệ thực vật\":\"\",\"Số lô thuốc bảo vệ thực vật\":\"\",\"Thời gian hái lá\":\"\",\"Thông tin bắt đầu và kết thúc vận chuyển\":\"\",\"Địa điểm bắt đầu và kết thúc vận chuyển\":\"\"}', '[]', '2025-07-20 11:01:45', '2025-07-20 11:01:45', 1, '0x636647b3d3b50897840746d3a30e405606b9db92fe0a82a02e70cfe376cd9321');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(2, 'user', 'Normal User', '2025-06-07 00:40:38', '2025-06-07 00:40:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\June2025\\w6KGNoKYu5zpEXeFIhTt.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', 'G-6P1H047GPJ', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/June2025/8bKsqtfUPgIj6X3blRTt.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Chè Thái Nguyên', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/June2025/LQZpW8rr9qXM2HFsHqh4.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '739767274494-s0ssm4j77q7601cv06kdl04tp6q622vl.apps.googleusercontent.com', '', 'text', 1, 'Admin'),
(11, 'site.paginate', 'Paginate', '4', NULL, 'text', 7, 'Site'),
(12, 'front.logo', 'Logo', '', NULL, 'image', 6, 'Front');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stages`
--

CREATE TABLE `stages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `stages`
--

INSERT INTO `stages` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Quản lý vườn chè và sản xuất chè', NULL, '2025-06-07 22:42:05', '2025-06-07 22:42:05'),
(2, 'Chế biến chè', NULL, '2025-06-08 01:09:53', '2025-06-08 01:09:53'),
(3, 'Lưu thông chè', NULL, '2025-06-08 01:10:01', '2025-06-08 01:10:01'),
(4, 'Tiêu thụ chè', NULL, '2025-06-08 01:10:09', '2025-06-08 01:10:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `testhistories`
--

CREATE TABLE `testhistories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `testhistories`
--

INSERT INTO `testhistories` (`id`, `name`, `description`, `product`, `price`, `created_at`, `updated_at`) VALUES
(4, 'sadas', 'ádasd', 'ádasd', 11111, '2025-08-06 20:13:25', '2025-08-06 20:13:25'),
(5, 'ádasd', 'ádasdasd', 'ádasdasd', 111111, '2025-08-06 20:17:12', '2025-08-06 20:17:12'),
(6, 'sadasdas', 'ádasdasd', 'ádasdasd', 234234, '2025-08-07 19:25:28', '2025-08-07 19:25:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translations`
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
-- Đang đổ dữ liệu cho bảng `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2025-06-07 00:40:38', '2025-06-07 00:40:38'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2025-06-07 00:40:38', '2025-06-07 00:40:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `website`, `address`, `company_name`, `description`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/June2025/Doz4JsjKkcN6pXOH0HBX.png', NULL, '$2a$12$gX10pTEhvW/Ux4RpqPFsSuqyc0Doiah0PtNUItrc82BUlpdj22eSm', 'ZQsGP1eyKJFsgAOJoKMQIZB9qH0h7ZIqh9FFOgzPEZxbDMzU5VQ7bBLKY7wQ', '{\"locale\":\"vi\"}', '2025-06-07 00:40:38', '2025-06-15 18:13:46', '0964680232', 'https://www.MayerLLC.com', '4470 Spencer Glen', 'Mayer LLC', '<div>\r\n<div>HTX Ch&egrave; Xanh Th&aacute;i Nguy&ecirc;n l&agrave; một trong những đơn vị ti&ecirc;n phong trong việc &aacute;p dụng c&ocirc;ng nghệ cao v&agrave; quy tr&igrave;nh sản xuất sạch v&agrave;o trồng trọt v&agrave; chế biến ch&egrave; tại Th&aacute;i Nguy&ecirc;n. Với&nbsp; sứ mệnh mang đến cho người ti&ecirc;u d&ugrave;ng những sản phẩm ch&egrave; kh&ocirc;ng chỉ thơm ngon, tinh khiết m&agrave; c&ograve;n tuyệt đối an to&agrave;n, ch&uacute;ng t&ocirc;i cam kết mọi c&ocirc;ng đoạn đều được kiểm so&aacute;t chặt chẽ, minh bạch th&ocirc;ng tin, xứng danh \"Đệ nhất danh tr&agrave;\".</div>\r\n</div>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Chỉ mục cho bảng `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_trace_code_unique` (`trace_code`);

--
-- Chỉ mục cho bảng `product_histories`
--
ALTER TABLE `product_histories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `testhistories`
--
ALTER TABLE `testhistories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT cho bảng `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `product_histories`
--
ALTER TABLE `product_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `stages`
--
ALTER TABLE `stages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `testhistories`
--
ALTER TABLE `testhistories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
