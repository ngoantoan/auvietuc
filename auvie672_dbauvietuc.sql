-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th3 03, 2020 lúc 10:41 PM
-- Phiên bản máy phục vụ: 5.5.59-cll-lve
-- Phiên bản PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `auvie672_dbauvietuc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `about_us`
--

CREATE TABLE `about_us` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `status` int(10) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `detail`, `status`, `created`) VALUES
(1, 'TẦM NHÌN SỨ MỆNH EVAS', '<p>Biết được tầm quan trọng của Anh ngữ l&agrave; <strong>&quot;chiếc ch&igrave;a kh&oacute;a v&agrave;ng dẫn đến tương lai&quot;</strong> l&agrave; c&ocirc;ng cụ hữu hiệu để c&aacute;c bạn trẻ hội nhập v&agrave;o &quot;thế giới phẳng&quot; nơi m&agrave; cuộc C&aacute;ch Mạng C&ocirc;ng Nghiệp lần thứ 4 đang diễn ra. Trung T&acirc;m Ngoại Ngữ Quốc Tế &Acirc;u Việt &Uacute;c ra đời với <strong>&quot;sứ mệnh v&agrave; niềm tin tuyệt đối&quot;</strong> mang đến chất lượng giảng dạy tốt nhất, hiệu quả nhất gi&uacute;p cho từng học vi&ecirc;n đạt được một nền tảng Anh ngữ vững chắc để thỏa m&atilde;ng niềm kh&aacute;t khao, đam m&ecirc; chinh phục những tầm cao mới, mạnh dạng thay đổi bản th&acirc;n tốt hơn g&oacute;p phần v&agrave;o sự ph&aacute;t triển chung của đất nước.</p>\r\n\r\n<p>Hiện nay, <strong>Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tại An Giang</strong> đ&atilde; l&agrave; ng&ocirc;i trường th&acirc;n thiết của hơn 5000 học vi&ecirc;n. Qu&aacute; tr&igrave;nh nh&acirc;n rộng v&agrave; sự t&iacute;n nhiệm từ học vi&ecirc;n trong thời gian vừa qua đ&atilde; khẳng định vị thế của Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c về <strong>&ldquo;chất lượng đ&agrave;o tạo như một cam kết kh&ocirc;ng thể thay đổi&rdquo;</strong>. Với xu hướng hội nhập v&agrave; ph&aacute;t triển, nền gi&aacute;o dục v&agrave; đ&agrave;o tạo Việt Nam đang đổi mới từng ng&agrave;y với c&aacute;c nhu cầu đa dạng về chương tr&igrave;nh cũng như y&ecirc;u cầu chất lượng ng&agrave;y c&agrave;ng khắt khe hơn, v&igrave; thế Trung t&acirc;m kh&ocirc;ng ngừng đổi mới về phương ph&aacute;p giảng dạy m&agrave; đồng thời tạo ra m&ocirc;i trường học lu&ocirc;n được cam kết về chất lượng.</p>\r\n', 1, '2020-02-18 17:55:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advisory`
--

CREATE TABLE `advisory` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `advisory`
--

INSERT INTO `advisory` (`id`, `title`, `image`, `description`, `status`, `created_at`) VALUES
(1, 'Du Học Singapore', 'du-hoc/dh-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, '2020-02-18 17:21:24'),
(2, 'Du Học Indonesia', 'du-hoc/dh-2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, '2020-02-18 17:28:32'),
(3, 'Du Học Australia', 'du-hoc/dh-3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, '2020-02-18 17:28:43'),
(4, 'Du Học Pháp', 'du-hoc/dh-4.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 1, '2020-02-18 17:28:55'),
(5, 'Du Học Canada', 'du-hoc/dh-5.jpg', 'Managing your business workflow from sales to human resources and customer service is your daily focus.', 1, '2020-02-18 17:29:11'),
(6, 'Du Học Anh Quốc', 'du-hoc/dh-6.jpg', 'Ensure that your platform is secured, updated and performing at', 1, '2020-02-18 17:30:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advisory_text`
--

CREATE TABLE `advisory_text` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `advisory_text`
--

INSERT INTO `advisory_text` (`id`, `title`, `detail`, `status`, `created`) VALUES
(1, 'TRIẾT LÝ GIÁO DỤC', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam quia veniam quo dignissimos voluptas atque saepe odit doloremque dolore ex voluptatem voluptatibus impedit rem sit porro, tenetur libero tempora eius?</p>\r\n', 1, '2020-02-19 07:40:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) UNSIGNED NOT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `title` varchar(750) DEFAULT NULL,
  `link` varchar(750) DEFAULT NULL,
  `image` varchar(750) DEFAULT NULL,
  `description` varchar(4500) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lang` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `categories_id`, `title`, `link`, `image`, `description`, `order`, `status`, `lang`) VALUES
(1, 1, '#', '#', 'banner/neolock_banner.jpg', '#', 1, 1, 1),
(2, 1, '#', '#', 'banner/neolock_hotel.png', '#', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner_categories`
--

CREATE TABLE `banner_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `lang` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `banner_categories`
--

INSERT INTO `banner_categories` (`id`, `title`, `status`, `order`, `lang`) VALUES
(1, 'banner', 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments_blog`
--

CREATE TABLE `comments_blog` (
  `id` int(10) NOT NULL,
  `id_customer` int(10) DEFAULT NULL,
  `contents` text COLLATE utf8_unicode_ci,
  `id_blog` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments_blog`
--

INSERT INTO `comments_blog` (`id`, `id_customer`, `contents`, `id_blog`, `status`, `created_at`) VALUES
(2, 1, 'rất tốt', 67, 1, '2020-03-02 16:38:29'),
(3, 1, 'abc', 67, 1, '2020-03-02 16:38:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments_education`
--

CREATE TABLE `comments_education` (
  `id` int(10) NOT NULL,
  `id_customer` int(10) DEFAULT NULL,
  `contents` text COLLATE utf8_unicode_ci,
  `id_education` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments_education`
--

INSERT INTO `comments_education` (`id`, `id_customer`, `contents`, `id_education`, `status`, `created_at`) VALUES
(1, 1, 'abc', 2, 1, '2020-02-29 16:21:32'),
(2, 5, 'abc', 2, 1, '2020-02-29 16:22:13'),
(6, 5, 'khoa hoc nay rat tot', 5, 1, '2020-02-29 16:41:20'),
(7, 5, 'Khoa hoc nay rat ok', 5, 1, '2020-02-29 16:43:44'),
(8, 5, 'Toi rat thich', 5, 1, '2020-02-29 16:44:07'),
(9, 5, 'toi se ru ban toi hoc cung', 5, 1, '2020-02-29 16:44:26'),
(10, 5, 'asdasdasd', 5, 1, '2020-02-29 16:45:54'),
(11, 5, 'asdasdasdasd', 5, 1, '2020-02-29 16:46:43'),
(12, 5, 'asdasmaksjkajfajf', 5, 1, '2020-02-29 16:46:53'),
(13, 5, 'abc', 3, 1, '2020-03-01 08:34:19'),
(14, 5, 'asasfhasf', 3, 1, '2020-03-01 08:34:28'),
(15, 1, 'abc', 2, 1, '2020-03-01 10:30:19'),
(16, 1, 'abc', 6, 1, '2020-03-01 10:31:39'),
(17, 1, 'asdfasfasfzdgasdgafafasf', 5, 1, '2020-03-01 10:32:23'),
(18, 1, 'aaaaaaaaaaaaaaa', 5, 0, '2020-03-02 09:44:33'),
(19, 1, 'vvvvvvvvvv', 5, 1, '2020-03-01 10:58:59'),
(20, 6, 'test', 6, 1, '2020-03-02 05:55:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `communicate_confidently`
--

CREATE TABLE `communicate_confidently` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `communicate_confidently`
--

INSERT INTO `communicate_confidently` (`id`, `title`, `image`, `video`, `status`, `created_at`) VALUES
(3, 'Name video', 'avata-video/video1.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(4, 'Name video', 'avata-video/video2.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(5, 'Name video', 'avata-video/video3.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(6, 'Name video', 'avata-video/video4.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(7, 'Name video', 'avata-video/video5.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(8, 'Name video', 'avata-video/video1.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(9, 'Name video', 'avata-video/video2.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(10, 'Name video', 'avata-video/video3.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(11, 'Name video', 'avata-video/video4.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(12, 'Name video', 'avata-video/video5.jpg', 'SRH2FS7YcBU', 1, '2020-02-19 16:15:33'),
(13, 'Name video 3', 'avata-video/video1.jpg', 'RqNzP5nRK1U', 1, '2020-03-02 05:14:57'),
(14, 'Name video 1', 'avata-video/video2.jpg', 'tJBSsw06EQ4', 1, '2020-02-19 16:40:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `education_program` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `name`, `birthday`, `address`, `email`, `phone`, `education_program`, `body`, `created_at`) VALUES
(38, 'Ngo An Toan', '09/09/1995', 'An Giang', 'ngoantoancntt@gmail.com', 962055425, 'Cambridge Stars (Starters, Movers, Flyers)', 'abc', '2020-02-24 16:22:10'),
(39, 'Lê Thành Lực', '30/10/1995', 'Châu Thành, An Giang', 'thanhluc2011@gmail.com', 968910169, 'Anh Văn Giao Tiếp', 'Muốn học tiếng anh giao tiếp để đi làm. Thời gian không cố định cần tìm gia sư. Liên hệ qua email không tiện nhận cuộc gọi. Cảm ơn.', '2020-03-02 02:06:16'),
(40, 'Trần Quốc Huy', '06/01/1996', 'an giang', 'huytqcntt@gmail.com', 362665922, 'Anh Văn Mẫu Giáo', 'test', '2020-03-02 05:21:25'),
(41, 'Trần Quốc Huy', '06/01/1996', 'an giang', 'huytqcntt@gmail.com', 362665922, 'Cambridge Stars (Starters, Movers, Flyers)', 'testadasdas', '2020-03-02 05:29:31'),
(42, 'Ngo An Toan', '09/09/1995', 'An Giang', 'ngoantoancntt@gmail.com', 962055425, 'Ôn Luyện IELTS', 'dang ky tu van', '2020-03-02 05:40:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `country`
--

INSERT INTO `country` (`id`, `title`, `status`, `created_at`) VALUES
(3, 'Hà Lan', 1, '2020-02-21 04:51:50'),
(4, 'Pháp', 1, '2020-02-21 04:52:04'),
(5, 'Thụy Sĩ', 1, '2020-02-21 04:52:11'),
(6, 'Hà Lan', 1, '2020-02-21 04:52:19'),
(7, 'Thái Lan', 1, '2020-02-21 04:52:26'),
(8, 'Mexico', 1, '2020-02-21 04:52:31'),
(9, 'Canada', 1, '2020-02-21 04:52:55'),
(10, 'New Zealand', 1, '2020-02-21 04:52:59'),
(11, 'Tây Ban Nha', 1, '2020-02-21 04:53:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `password`, `address`, `phone`, `created_at`) VALUES
(1, 'Toan', 'ngoantoancntt@gmail.com', '123456', 'An Giang', '09090099', '2020-02-28 04:11:52'),
(5, 'Ngo An Toan', 'ntcnet@gmail.com', '123456', 'TP.HCM', '0962055425', '2020-02-28 05:11:39'),
(6, 'Trần Quốc Huy', 'huytqcntt@gmail.com', 'cmcyndeo', '47/25 Trần Quốc Toản', '0362665922', '2020-03-01 08:31:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `education_program`
--

CREATE TABLE `education_program` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `detail` longtext COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `education_program`
--

INSERT INTO `education_program` (`id`, `title`, `title1`, `code`, `image`, `description`, `detail`, `status`, `created_at`) VALUES
(2, 'Anh Văn Mẫu Giáo', 'DÀNH CHO CÁC BÉ TỪ 4 ĐẾN 6 TUỔI', 'anh-van-mau-giao', 'chuong-trinh-dao-tao/daikin-air-conditioning.png', 'Đây là chương trình đặc biệt do trung tâm biên soạn cho các bé trong độ tuổi này. Chương trình được thiết kế với các chủ đề xung quanh hằng ngày của các bé nên...', '<div class=\"noidung\">\r\n<p><strong>CHƯƠNG TR&Igrave;NH GIẢNG DẠY</strong></p>\r\n\r\n<p>Đ&acirc;y l&agrave; chương tr&igrave;nh đặc biệt do trung t&acirc;m bi&ecirc;n soạn cho c&aacute;c b&eacute; trong độ tuổi n&agrave;y. Chương tr&igrave;nh được thiết kế với c&aacute;c chủ đề xung quanh hằng ng&agrave;y của c&aacute;c b&eacute; n&ecirc;n gi&uacute;p c&aacute;c b&eacute; tiếp nhận tiếng Anh một c&aacute;ch dễ d&agrave;ng. Nhận thấy sự phản xạ v&agrave; kỹ năng nghe n&oacute;i, ph&aacute;t &acirc;m rất quan trong đối với c&aacute;c b&eacute; độ tuổi n&agrave;y. N&ecirc;n Gi&aacute;o vi&ecirc;n giảng dạy sử dụng 100% tiếng Anh mong muốn đem lại hiệu quả tối ưu từng buổi học cho c&aacute;c b&eacute; v&agrave; khơi dậy niềm đam m&ecirc; tiếng Anh ở trẻ.&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"color:#FF0000\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"background-color:white\">Ưu điểm:</span></strong></span></span></span><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"background-color:white\">&nbsp;</span></strong><span style=\"background-color:white\">Chương tr&igrave;nh được thiết kế đ&agrave;o tạo Gi&aacute;o vi&ecirc;n Việt Nam v&agrave; Gi&aacute;o vi&ecirc;n nước ngo&agrave;i, 100% tiếng Anh được sử dụng tr&ecirc;n lớp. Đảm bảo kiến thức buổi học, kỹ năng nghe n&oacute;i lưu lo&aacute;t, chinh phục bằng Cambridge với kết quả cao. Kỹ năng thuyết tr&igrave;nh th&ocirc;ng qua sự thể hiện v&agrave; chuẩn bị cho buổi thuyết tr&igrave;nh như poster, powerpoint, reality, đồng thời thực hiện c&aacute;c dự &aacute;n thể hiện sự tự tin, s&aacute;ng tạo, qua đ&oacute; đ&aacute;nh gi&aacute; sự lưu lo&aacute;t tiếng Anh của c&aacute;c em. Để hỗ trợ c&aacute;c em vững v&agrave;ng hơn về Grammar trong chương tr&igrave;nh phổ th&ocirc;ng, EVAS đ&atilde; n&acirc;ng giờ dạy Grammar v&agrave; t&agrave;i liệu được EVAS tổng hợp đồng bộ điểm ngữ ph&aacute;p trong chương tr&igrave;nh phổ th&ocirc;ng của c&aacute;c em.</span></span></span></span></p>\r\n\r\n<p><strong>LỊCH HỌC V&Agrave; THỜI GIAN HỌC</strong></p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:626px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:22px; width:165px\">\r\n			<p style=\"text-align:center\"><strong>LỊCH HỌC</strong></p>\r\n			</td>\r\n			<td style=\"height:22px; width:237px\">\r\n			<p style=\"text-align:center\"><strong>Thứ hai &ndash; tư - s&aacute;u</strong></p>\r\n			</td>\r\n			<td style=\"height:22px; width:224px\">\r\n			<p style=\"text-align:center\"><strong>Thứ ba &ndash; năm &ndash; bảy</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:38px; width:165px\">\r\n			<p style=\"text-align:center\"><strong>TỐI</strong></p>\r\n			</td>\r\n			<td style=\"height:38px; width:237px\">\r\n			<p style=\"text-align:center\">18&nbsp;&ndash; 19:30</p>\r\n			</td>\r\n			<td style=\"height:38px; width:224px\">\r\n			<p style=\"text-align:center\">18&ndash; 19:30</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:36px; width:165px\">\r\n			<p style=\"text-align:center\"><strong>T7&amp;CN</strong></p>\r\n			</td>\r\n			<td colspan=\"2\" style=\"height:36px; width:461px\">\r\n			<p style=\"text-align:center\">8:00 am &ndash; 10:00 am</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div style=\"clear:both\">&nbsp;</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>CẤP ĐỘ v&agrave; GI&Aacute;O TR&Igrave;NH</strong></p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:37px; width:215px\">\r\n			<p style=\"text-align:center\"><strong>CẤP ĐỘ</strong></p>\r\n			</td>\r\n			<td style=\"height:37px; width:222px\">\r\n			<p style=\"text-align:center\"><strong>GI&Aacute;O TR&Igrave;NH</strong></p>\r\n			</td>\r\n			<td style=\"height:37px; width:183px\">\r\n			<p style=\"text-align:center\"><strong>THỜI GIAN KH&Oacute;A HỌC</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:34px; width:215px\">\r\n			<p style=\"text-align:center\"><strong>TWINKLE STARS</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:222px\">\r\n			<p style=\"text-align:center\"><strong>MY FIRST</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:183px\">\r\n			<p style=\"text-align:center\">36 tuần</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:34px; width:215px\">\r\n			<p style=\"text-align:center\"><strong>BRIGHT STARS</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:222px\">\r\n			<p style=\"text-align:center\"><strong>ABOUT ME</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:183px\">\r\n			<p style=\"text-align:center\">36 tuần</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:34px; width:215px\">\r\n			<p style=\"text-align:center\"><strong>SUPER STARS</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:222px\">\r\n			<p style=\"text-align:center\"><strong>ALL ABOUT ME</strong></p>\r\n			</td>\r\n			<td style=\"height:34px; width:183px\">\r\n			<p style=\"text-align:center\">36 tuần</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div style=\"clear:both\">&nbsp;</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>V&igrave; sao phụ&nbsp;huynh n&ecirc;n chọn kh&oacute;a học Anh Văn Mẫu Gi&aacute;o cho c&aacute;c b&eacute;&nbsp;tại Trung t&acirc;m Ngoại ngữ&nbsp;Quốc tế</strong>&nbsp;<strong>&Acirc;u Việt&nbsp;&Uacute;c:</strong></p>\r\n\r\n<ul>\r\n	<li>Tương t&aacute;c chặt chẻ giữa phụ huynh v&agrave; Trung t&acirc;m để theo d&otilde;i tiến độ học tập của c&aacute;c b&eacute;; Th&ocirc;ng qua h&agrave;ng ng&agrave;y ph&aacute;t bảng điểm th&ocirc;ng b&aacute;o kết quả học tập của b&eacute; tr&ecirc;n lớp để phụ huynh kịp thời nắm bắt tiến tr&igrave;nh học tập của b&eacute; tại Trung t&acirc;m.</li>\r\n	<li>Trung t&acirc;m sẽ hướng dẫn phụ huynh hỗ trợ c&aacute;c b&eacute; luyện tập tiếng Anh tại nh&agrave;;</li>\r\n	<li><strong>MIỄN PH&Iacute;</strong>&nbsp; phụ đạo cho c&aacute;c b&eacute; yếu, hoặc phụ huynh kh&ocirc;ng c&oacute; thời gian hỗ trợ c&aacute;c b&eacute; tại nh&agrave;;</li>\r\n	<li>Những buổi vắng học c&oacute; ph&eacute;p, Gi&aacute;o vi&ecirc;n hoặc trợ giảng sẽ &ocirc;n b&agrave;i c&aacute;c b&eacute; buổi tiếp sau;</li>\r\n	<li><strong>MIỄN PH&Iacute;</strong>&nbsp;học lại nếu kết quả học tập kh&ocirc;ng đạt y&ecirc;u cầu Trung t&acirc;m;</li>\r\n	<li>Tham gia CLUB tiếng Anh h&agrave;ng tuần, c&aacute;c buổi d&atilde; ngoại, xem phim tiếng Anh thiếu nhi, v&agrave; tham gia c&aacute;c hoạt động tư duy ng&ocirc;n ngữ;</li>\r\n	<li><strong>GIẢM HỌC PH&Iacute;</strong>&nbsp;nếu đ&oacute;ng học ph&iacute; trọn kh&oacute;a học, v&agrave; hỗ trợ học ph&iacute; cho học vi&ecirc;n đang theo học tại Trung t&acirc;m;</li>\r\n	<li><strong>BẢO LƯU</strong>&nbsp;học ph&iacute; nếu thời gian nghỉ học qu&aacute; 2 tuần trở l&ecirc;n;</li>\r\n	<li>Được nhận thưởng v&agrave; giấy khen kết th&uacute;c kh&oacute;a học đối với c&aacute;c bạn th&agrave;nh t&iacute;ch cao trong suốt kh&oacute;a học;</li>\r\n</ul>\r\n\r\n<p><strong>ĐỘI NGŨ&nbsp;GI&Aacute;O VI&Ecirc;N</strong></p>\r\n\r\n<p>Gi&aacute;o vi&ecirc;n t&acirc;m huyết, nhiệt t&igrave;nh, năng động c&oacute; kinh nghiệm dạy tiếng Anh cho trẻ em c&oacute; thể gi&uacute;p c&aacute;c em tiếp thu ng&ocirc;n ngữ dễ d&agrave;ng v&agrave; tự tin trong giao tiếp.</p>\r\n</div>\r\n', 1, '2020-03-01 16:17:30'),
(3, 'Cambridge Stars (Starters, Movers, Flyers)', 'ANH VĂN THIẾU NHI', 'cambridge-stars-starters-movers-flyers', 'chuong-trinh-dao-tao/pocari-sweat-website.png', 'Chương trình tiếng Anh thiếu nhi được thiết kế phù hợp cho các em từ 7-12 tuổi. Ở độ tuổi khi các em mới bắt đầu làm quen với tiếng Anh nên rất cần một chương trình hoàn thiện để giúp các em phát triển tối ưu...', '<div class=\"noidung\">\r\n<p><span style=\"color:#B22222\"><strong>ĐỐI TƯỢNG HỌC VI&Ecirc;N</strong></span></p>\r\n\r\n<p>Chương tr&igrave;nh tiếng Anh thiếu nhi được thiết kế ph&ugrave; hợp cho c&aacute;c em từ 7-12 tuổi. Ở độ tuổi khi c&aacute;c em mới bắt đầu l&agrave;m quen với tiếng Anh n&ecirc;n rất cần một chương tr&igrave;nh ho&agrave;n thiện để gi&uacute;p c&aacute;c em ph&aacute;t triển tối ưu. T&ugrave;y theo từng độ tuổi v&agrave; tr&igrave;nh độ đầu v&agrave;o của c&aacute;c em, ch&uacute;ng t&ocirc;i sẽ hướng dẫn cụ thể để phụ huynh chọn lựa chương tr&igrave;nh ph&ugrave; hợp v&agrave; hiệu quả nhất, từng bước gi&uacute;p c&aacute;c em tiếp cận v&agrave; ho&agrave;n to&agrave;n tự tin tham gia c&aacute;c k&igrave; thi lấy bằng cấp quốc tế Cambridge. Đặc biệt, tham gia k&igrave; thi tiếng Anh của Cambridge l&agrave; c&aacute;ch tốt nhất để qu&yacute; phụ huynh v&agrave; ch&iacute;nh con em m&igrave;nh nhận biết được sự tiến bộ m&agrave; c&aacute;c em đ&atilde; đạt được. Đ&acirc;y ch&iacute;nh l&agrave; một động lực để khuyến kh&iacute;ch c&aacute;c em y&ecirc;u th&iacute;ch v&agrave; học tốt tiếng Anh hơn.</p>\r\n\r\n<p><span style=\"color:#B22222\"><strong>CẤP ĐỘ Đ&Agrave;O TẠO</strong></span></p>\r\n\r\n<p>Kiểm tra tr&igrave;nh độ: trước khi tham gia kh&oacute;a học, c&aacute;c b&eacute; sẽ được gi&aacute;o vi&ecirc;n phỏng vấn nhằm đ&aacute;nh gi&aacute; đ&uacute;ng tr&igrave;nh độ v&agrave; để chọn kh&oacute;a học ph&ugrave; hơp cho b&eacute;.</p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:42px; width:124px\">\r\n			<p style=\"text-align:center\"><strong>CẤP ĐỘ</strong></p>\r\n			</td>\r\n			<td style=\"height:42px; width:172px\">\r\n			<p style=\"text-align:center\"><strong>THỜI GIAN </strong></p>\r\n\r\n			<p style=\"text-align:center\"><strong>KH&Oacute;A HỌC</strong></p>\r\n			</td>\r\n			<td style=\"height:42px; width:157px\">\r\n			<p style=\"text-align:center\"><strong>LỊCH HỌC</strong></p>\r\n			</td>\r\n			<td style=\"height:42px; width:162px\">\r\n			<p style=\"text-align:center\"><strong>HỌC PH&Iacute;</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:20px; width:124px\">\r\n			<p style=\"text-align:center\">STARTERS</p>\r\n			</td>\r\n			<td style=\"height:20px; width:172px\">\r\n			<p style=\"text-align:center\">&nbsp;48 tuần</p>\r\n			</td>\r\n			<td rowspan=\"3\" style=\"height:20px; width:157px\">\r\n			<p style=\"text-align:center\">246(6:00-7:30pm)</p>\r\n\r\n			<p style=\"text-align:center\">357(6:00-7:30pm)</p>\r\n\r\n			<p style=\"text-align:center\">T7&amp;CN (8-10am)</p>\r\n\r\n			<p style=\"text-align:center\">T7&amp;CN(5:00-7:00pm)</p>\r\n			</td>\r\n			<td style=\"height:20px; width:162px\">\r\n			<p style=\"text-align:center\">Li&ecirc;n hệ</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:21px; width:124px\">\r\n			<p style=\"text-align:center\">MOVERS</p>\r\n			</td>\r\n			<td style=\"height:21px; width:172px\">\r\n			<p style=\"text-align:center\">48 tuần</p>\r\n			</td>\r\n			<td style=\"height:21px; width:162px\">\r\n			<p style=\"text-align:center\">Li&ecirc;n hệ</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:21px; width:124px\">\r\n			<p style=\"text-align:center\">FLYERS</p>\r\n			</td>\r\n			<td style=\"height:21px; width:172px\">\r\n			<p style=\"text-align:center\">48 tuần</p>\r\n			</td>\r\n			<td style=\"height:21px; width:162px\">\r\n			<p style=\"text-align:center\">Li&ecirc;n hệ</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div style=\"clear:both\">&nbsp;</div>\r\n\r\n<p>&nbsp;<span style=\"color:#B22222\"><strong>MỤC TI&Ecirc;U&nbsp;Đ&Agrave;O TẠO:</strong></span></p>\r\n\r\n<ul>\r\n	<li>&nbsp; C&aacute;c b&eacute; ph&aacute;t triển 4 kỹ năng nghe, n&oacute;i, đọc v&agrave; viết;</li>\r\n	<li>&nbsp; Giảng dạy tr&ecirc;n phần mền ứng dụng. Nhằm thỏa tr&iacute; t&ograve; m&ograve; của c&aacute;c em v&agrave; tạo buổi học hiệu quả th&ocirc;ng qua h&igrave;nh ảnh, online practice, itools, b&agrave;i h&aacute;t v&agrave; c&aacute;c hoạt động trong lớp;</li>\r\n	<li>&nbsp; Đem lại b&agrave;i học gi&aacute; trị cuộc sống cho c&aacute;c b&eacute; th&ocirc;ng qua mỗi c&acirc;u chuyện trong mỗi đơn vị b&agrave;i học,</li>\r\n	<li>&nbsp; Tự tin m&ocirc; tả sự vật, h&igrave;nh ảnh diễn đạt bằng tiếng Anh (Starters);</li>\r\n	<li>&nbsp; Tự tin diễn đạt bằng tiếng Anh so s&aacute;nh một sự vật, h&igrave;nh ảnh v&agrave; tạo ra một c&acirc;u chuy&ecirc;n th&ocirc;ng qua h&igrave;nh ảnh (Movers-Flyers);</li>\r\n	<li>&nbsp; Tự tin vấn đ&aacute;p ngữ cảnh thực tế;</li>\r\n	<li>&nbsp; Sử dụng tiếng Anh trong nhiều ngữ cảnh bằng những c&acirc;u hội thoại ngắn v&agrave; kể những mẫu chuyện ngắn Thiếu nhi bằng tiếng Anh;</li>\r\n	<li>&nbsp; Kiến thức b&agrave;i học được tổng hợp v&agrave; n&acirc;ng cao kết th&uacute;c mỗi đơn vị b&agrave;i học;</li>\r\n	<li>&nbsp; C&aacute;c mẫu c&acirc;u giao tiếp thực tế v&agrave; s&aacute;t với đề thi Speaking Cambridge Anh Quốc.</li>\r\n	<li>&nbsp; Home- School Link l&agrave; sự phối hợp chặt chẽ Gi&aacute;o vi&ecirc;n v&agrave; Phụ huynh nhằm mang đến hiệu quả tối ưu cho c&aacute;c b&eacute;. (project)</li>\r\n</ul>\r\n\r\n<p style=\"margin-left:7.1pt\"><span style=\"color:#FF0000\"><strong>Tối Ưu</strong></span><span style=\"color:#696969\"><strong> &ndash;</strong> Gi&aacute;o vi&ecirc;n Việt Nam v&agrave; Gi&aacute;o vi&ecirc;n nước ngo&agrave;i đảm nhiệm buổi học, 100% tiếng Anh được sử dụng tr&ecirc;n lớp. Đảm bảo kiến thức buổi học, kỹ năng nghe n&oacute;i lưu lo&aacute;t, chinh phục bằng Cambridge với kết quả cao. Chương tr&igrave;nh <em><u>Home-school link</u></em> l&agrave; sự li&ecirc;n kết chặt chẽ giữa Trung t&acirc;m v&agrave; phụ huynh.</span></p>\r\n\r\n<p><strong>V&igrave; sao phụ huynh n&ecirc;n chọn kh&oacute;a học Anh Văn Thiếu Nhi cho c&aacute;c b&eacute; tại Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c:</strong></p>\r\n\r\n<ul>\r\n	<li>Tương t&aacute;c chặt chẻ giữa phụ huynh v&agrave; Trung t&acirc;m để theo d&otilde;i tiến độ học tập của c&aacute;c b&eacute;; Th&ocirc;ng qua h&agrave;ng ng&agrave;y ph&aacute;t bảng điểm th&ocirc;ng b&aacute;o kết quả học tập của b&eacute; tr&ecirc;n lớp để phụ huynh kịp thời nắm bắt tiến tr&igrave;nh học tập của b&eacute; tại Trung t&acirc;m.</li>\r\n	<li>Trung t&acirc;m sẽ hướng dẫn phụ huynh hỗ trợ c&aacute;c b&eacute; luyện tập tiếng Anh tại nh&agrave;;</li>\r\n	<li>Miễn Ph&iacute; phụ đạo cho c&aacute;c b&eacute; yếu, hoặc phụ huynh kh&ocirc;ng c&oacute; thời gian hỗ trợ c&aacute;c b&eacute; tại nh&agrave;;</li>\r\n	<li>Những buổi vắng học c&oacute; ph&eacute;p, Gi&aacute;o vi&ecirc;n hoặc trợ giảng sẽ &ocirc;n b&agrave;i c&aacute;c b&eacute; buổi tiếp sau;</li>\r\n	<li><strong>MIỄN PH&Iacute;</strong>&nbsp;học lại nếu kết quả học tập kh&ocirc;ng đạt y&ecirc;u cầu Trung t&acirc;m;</li>\r\n	<li>Tham gia CLUB tiếng Anh h&agrave;ng tuần, c&aacute;c buổi d&atilde; ngoại, xem phim tiếng Anh thiếu nhi, v&agrave; tham gia c&aacute;c hoạt động tư duy ng&ocirc;n ngữ;</li>\r\n	<li><strong>GIẢM HỌC PH&Iacute;</strong>&nbsp;nếu đ&oacute;ng học ph&iacute; trọn kh&oacute;a học, v&agrave; hỗ trợ học ph&iacute; cho học vi&ecirc;n đang theo học tại Trung t&acirc;m;</li>\r\n	<li><strong>BẢO LƯU</strong>&nbsp;học ph&iacute; nếu thời gian nghỉ học qu&aacute; 2 tuần trở l&ecirc;n;</li>\r\n	<li>Được nhận thưởng v&agrave; giấy khen kết th&uacute;c kh&oacute;a học đối với c&aacute;c bạn th&agrave;nh t&iacute;ch cao trong suốt kh&oacute;a học</li>\r\n	<li>Kết th&uacute;c mỗi kh&oacute;a học Trung t&acirc;m sẽ &ocirc;n củng cố kiến thức để đảm bảo nền tảng vững chắc c&aacute;c em thi kỳ thi Cambridge.</li>\r\n</ul>\r\n\r\n<p><span style=\"color:#B22222\"><strong>Chứng chỉ v&agrave; bằng cấp</strong></span></p>\r\n\r\n<p>Sau khi ho&agrave;n tất mỗi chương tr&igrave;nh học, Trung t&acirc;m mời Hội đồng thi Cambridge tổ chức thi tại Trung t&acirc;m do&nbsp;<strong>Hội đồng Khảo th&iacute; Đại học Cambridge (Cambridge ESOL)</strong>&nbsp;tổ chức&nbsp;<strong>YLE - Cambridge Young Learners English Tests</strong>&nbsp;gồm 3 cấp độ:&nbsp;<strong>Starters</strong>,&nbsp;<strong>Movers</strong>&nbsp;v&agrave;&nbsp;<strong>Flyers</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n', 1, '2020-03-01 16:26:06'),
(4, 'ANH Văn Thiếu Niên (KET,PET)', 'KET & PET', 'anh-van-thieu-nien-ketpet', 'chuong-trinh-dao-tao/the-sip-app.png', 'Chứng chỉ KET, PET, FCE được Đại học Cambridge xem là thước đo kiến thức chuẩn sử dụng tiếng Anh trên tất cả nước trên thế giới đối với bậc Trung học Cơ Sở và Trung học Phổ Thông...', '<div class=\"noidung\">\r\n<p><span style=\"color:#B22222\"><strong>1. ĐỐI TƯỢNG HỌC VI&Ecirc;N</strong></span></p>\r\n\r\n<p><strong>&nbsp; &nbsp;L&agrave; chương tr&igrave;nh được thiết kế theo đối tượng học vi&ecirc;n l&agrave; c&aacute;c bạn học sinh trong độ tuổi học THCS v&agrave; THPT.</strong></p>\r\n\r\n<p><span style=\"color:#B22222\"><strong>2. GIỚI THIỆU VỀ&nbsp;CHƯƠNG TR&Igrave;NH</strong></span></p>\r\n\r\n<p>Cambridge English: bao gồm c&aacute;c b&agrave;i kiểm tra tiếng Anh th&uacute; vị v&agrave; sinh động d&agrave;nh cho c&aacute;c em nhằm gi&uacute;p phụ huynh v&agrave; trẻ định hướng được con đường ph&aacute;t triển tiếng Anh của m&igrave;nh. C&aacute;c b&agrave;i kiểm tra được thiết kế bởi tổ chức Cambridge English Language Assessment thuộc đại học Cambridge, vương quốc Anh.</p>\r\n\r\n<p>Chứng chỉ KET, PET, FCE được Đại học Cambridge xem l&agrave; thước đo kiến thức chuẩn sử dụng tiếng Anh tr&ecirc;n tất cả nước tr&ecirc;n thế giới đối với bậc Trung học Cơ Sở v&agrave; Trung học Phổ Th&ocirc;ng.</p>\r\n\r\n<p><em><strong><u>Th&ocirc;ng tin chi tiết kh&oacute;a KET, PET, FCE</u></strong></em></p>\r\n\r\n<p><strong>Key</strong>, c&ograve;n được gọi l&agrave; Key English Test (KET), l&agrave; văn bằng chứng chỉ cấp độ cơ bản cho biết bạn c&oacute; thể sử dụng tiếng Anh để giao tiếp trong c&aacute;c t&igrave;nh huống đơn giản. N&oacute; chứng tỏ bạn đ&atilde; c&oacute; một khởi đầu tốt trong việc học tiếng Anh. Cấp độ n&agrave;y được xếp ở Tr&igrave;nh độ A2 của Khung tham chiếu tr&igrave;nh độ ng&ocirc;n ngữ chung của Việt Nam (VSTEP)</p>\r\n\r\n<ul>\r\n	<li>Chứng tỏ bạn c&oacute; thể giao tiếp bằng tiếng Anh ở tr&igrave;nh độ cơ bản</li>\r\n	<li>Tham dự một kỳ thi chất lượng cao c&ocirc;ng bằng với mọi người</li>\r\n	<li>Lựa chọn địa điểm, thời gian v&agrave; c&aacute;ch thức dự thi cho bạn</li>\r\n	<li>Tự h&agrave;o về chứng chỉ được c&ocirc;ng nhận tr&ecirc;n to&agrave;n cầu</li>\r\n	<li>Nhận được nhiều hỗ trợ gi&uacute;p bạn gặt h&aacute;i th&agrave;nh c&ocirc;ng</li>\r\n</ul>\r\n\r\n<p><strong>Preliminary</strong>, c&ograve;n được gọi l&agrave; Preliminary English Test (PET), l&agrave; văn bằng chứng chỉ tr&igrave;nh độ trung cấp. N&oacute; chứng tỏ bạn c&oacute; khả năng sử dụng c&aacute;c kỹ năng tiếng Anh trong c&ocirc;ng việc, học tập v&agrave; du lịch. Cấp độ n&agrave;yđược xếp ở Tr&igrave;nh độ B1 của Khung tham chiếu tr&igrave;nh độ ng&ocirc;n ngữ chung của Việt Nam (VSTEP)</p>\r\n\r\n<ul>\r\n	<li>Chứng minh bạn nắm vững tiếng Anh thực h&agrave;nh để sử dụng h&agrave;ng ng&agrave;y</li>\r\n	<li>Đạt được c&aacute;c kỹ năng ng&ocirc;n ngữ thực tiễn</li>\r\n	<li>Tham dự một kỳ thi chất lượng cao c&ocirc;ng bằng với mọi người</li>\r\n	<li>Lựa chọn địa điểm, thời gian v&agrave; c&aacute;ch thức dự thi cho bạn</li>\r\n	<li>Tự h&agrave;o về chứng chỉ được c&ocirc;ng nhận tr&ecirc;n to&agrave;n cầu</li>\r\n	<li>Nhận được nhiều hỗ trợ gi&uacute;p bạn gặt h&aacute;i th&agrave;nh c&ocirc;ng</li>\r\n</ul>\r\n\r\n<p><strong>First,</strong>&nbsp;c&ograve;n được gọi l&agrave; First Certificate in English (FCE), l&agrave; văn bằng chứng chỉ tr&igrave;nh độ tr&ecirc;n trung cấp. N&oacute; chứng tỏ bạn c&oacute; thể sử dụng tiếng Anh n&oacute;i v&agrave; viết h&agrave;ng ng&agrave;y trong c&ocirc;ng việc hoặc học tập. Cấp độ n&agrave;yđược xếp ở Tr&igrave;nh độ B2 của Khung tham chiếu tr&igrave;nh độ ng&ocirc;n ngữ chung của Việt Nam (VSTEP)</p>\r\n\r\n<ul>\r\n	<li>Chứng tỏ bạn đ&atilde; sẵn s&agrave;ng cho những th&agrave;nh c&ocirc;ng trong học tập, c&ocirc;ng việc v&agrave; đời sống</li>\r\n	<li>Đạt được c&aacute;c kỹ năng tiếng Anh đời sống phục vụ cho c&ocirc;ng việc v&agrave; học tập</li>\r\n	<li>Tham dự một kỳ thi chất lượng cao c&ocirc;ng bằng với mọi người</li>\r\n	<li>Lựa chọn địa điểm, thời gian v&agrave; c&aacute;ch thức dự thi cho bạn</li>\r\n	<li>Tự h&agrave;o về chứng chỉ được c&ocirc;ng nhận tr&ecirc;n to&agrave;n cầu</li>\r\n	<li>Nhận được nhiều hỗ trợ gi&uacute;p bạn gặt h&aacute;i th&agrave;nh c&ocirc;ng</li>\r\n</ul>\r\n\r\n<p><span style=\"color:#B22222\"><strong>3. THỜI GIAN HỌC</strong></span></p>\r\n\r\n<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:65px; width:205px\">\r\n			<p style=\"text-align:center\"><strong>LỊCH HỌC</strong></p>\r\n			</td>\r\n			<td style=\"height:65px; width:295px\">\r\n			<p style=\"text-align:center\"><strong>Mon- Wed- Fri (2-4-6)</strong></p>\r\n			</td>\r\n			<td style=\"height:65px; width:227px\">\r\n			<p style=\"text-align:center\"><strong>Tue- Thu- Sat (3-5-7)</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:36px; width:205px\">\r\n			<p style=\"text-align:center\"><strong>TỐI</strong></p>\r\n			</td>\r\n			<td style=\"height:36px; width:295px\">\r\n			<p style=\"text-align:center\">18&ndash; 19:30</p>\r\n			</td>\r\n			<td style=\"height:36px; width:227px\">\r\n			<p style=\"text-align:center\">18&ndash; 19:30</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:53px; width:205px\">\r\n			<p style=\"text-align:center\"><strong>T7&amp;CN</strong></p>\r\n			</td>\r\n			<td colspan=\"2\" style=\"height:53px; width:523px\">\r\n			<p style=\"text-align:center\">8:00 am &ndash; 10:00 am</p>\r\n\r\n			<p style=\"text-align:center\">14:00-16:00</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div style=\"clear:both\">&nbsp;</div>\r\n\r\n<p><span style=\"color:#B22222\"><strong>4. MỤC TI&Ecirc;U&nbsp;Đ&Agrave;O TẠO:</strong></span></p>\r\n\r\n<ul>\r\n	<li>H&igrave;nh th&agrave;nh v&agrave; r&egrave;n luyện c&aacute;c kỹ năng học tập v&agrave; tư duy Anh ngữ 1 c&aacute;ch logic.</li>\r\n	<li>N&acirc;ng cao kỹ năng nghe &ndash; n&oacute;i, đồng thời cung cấp vốn từ vựng cần thiết, ph&ugrave; hợp với chương tr&igrave;nh phổ th&ocirc;ng.</li>\r\n	<li>Kỹ năng đọc &ndash; viết được ph&aacute;t triển tốt hơn v&agrave; th&agrave;nh thạo hơn trong c&aacute;c c&aacute;ch viết một đoạn văn hay 1 b&agrave;i tiểu luận nhỏ.</li>\r\n	<li>Nắm vững grammar cơ bản trong chương tr&igrave;nh phổ th&ocirc;ng;</li>\r\n	<li>Gi&uacute;p học vi&ecirc;n l&agrave;m quen v&agrave; hiểu được cấu tr&uacute;c b&agrave;i thi;</li>\r\n	<li>X&acirc;y dựng sự tự tin cho trẻ trong c&aacute;c kỳ thi quốc tế;</li>\r\n	<li>Gi&uacute;p trẻ tự tin giao tiếp sử dụng ng&ocirc;n ngữ tiếng Anh trong mọi t&igrave;nh huống th&ocirc;ng qua c&aacute;c b&agrave;i thuyết tr&igrave;nh trước lớp v&agrave; được sự đ&aacute;nh gi&aacute; từ Gi&aacute;o vi&ecirc;n Nước ngo&agrave;i;</li>\r\n	<li>Kỹ năng thuyết tr&igrave;nh, tự tin giao tiếp, diễn giải bằng tiếng Anh trước c&ocirc;ng ch&uacute;ng.</li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#FF0000\">Ưu điểm</span><span style=\"color:#696969\">&nbsp;&ndash;</span></span></span></strong><span style=\"color:#696969\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">&nbsp;Chương tr&igrave;nh được thiết kế đ&agrave;o tạo Gi&aacute;o vi&ecirc;n Việt Nam v&agrave; Gi&aacute;o vi&ecirc;n nước ngo&agrave;i, 100% tiếng Anh được sử dụng tr&ecirc;n lớp. Đảm bảo kiến thức buổi học, kỹ năng nghe n&oacute;i lưu lo&aacute;t, chinh phục bằng Cambridge với kết quả cao. Kỹ năng thuyết tr&igrave;nh th&ocirc;ng qua sự thể hiện v&agrave; chuẩn bị cho buổi thuyết tr&igrave;nh như poster, powerpoint, reality, đồng thời thực hiện c&aacute;c dự &aacute;n thể hiện sự tự tin, s&aacute;ng tạo, qua đ&oacute; đ&aacute;nh gi&aacute; sự lưu lo&aacute;t tiếng Anh của c&aacute;c em. Để hỗ trợ c&aacute;c em vững v&agrave;ng hơn về Grammar trong chương tr&igrave;nh phổ th&ocirc;ng, EVAS đ&atilde; n&acirc;ng giờ dạy Grammar v&agrave; t&agrave;i liệu được EVAS tổng hợp đồng bộ điểm ngữ ph&aacute;p trong chương tr&igrave;nh phổ th&ocirc;ng của c&aacute;c em.</span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p><strong>V&igrave; sao c&aacute;c em n&ecirc;n học tại Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c:</strong></p>\r\n\r\n<ul>\r\n	<li>Tương t&aacute;c chặt chẻ giữa phụ huynh v&agrave; Trung t&acirc;m để theo d&otilde;i tiến độ học tập của c&aacute;c em; Th&ocirc;ng qua những b&agrave;i kiểm tra kết b&agrave;i v&agrave; bảng điểm th&ocirc;ng b&aacute;o kết quả học tập của em tr&ecirc;n lớp để phụ huynh kịp thời nắm bắt tiến tr&igrave;nh học tập của em tại Trung t&acirc;m.</li>\r\n	<li><strong>MIỄN PH&Iacute;</strong>&nbsp; phụ đạo cho c&aacute;c b&eacute; yếu, hoặc phụ huynh kh&ocirc;ng c&oacute; thời gian hỗ trợ c&aacute;c b&eacute; tại nh&agrave;;</li>\r\n	<li>Những buổi vắng học c&oacute; ph&eacute;p, Gi&aacute;o vi&ecirc;n hoặc trợ giảng sẽ &ocirc;n b&agrave;i c&aacute;c b&eacute; buổi tiếp sau;</li>\r\n	<li><strong>MIỄN PH&Iacute;</strong>&nbsp;học lại nếu kết quả học tập kh&ocirc;ng đạt y&ecirc;u cầu Trung t&acirc;m;</li>\r\n	<li>Tham gia CLUB tiếng Anh h&agrave;ng tuần, c&aacute;c buổi d&atilde; ngoại v&agrave; tham gia c&aacute;c hoạt động tư duy ng&ocirc;n ngữ;</li>\r\n	<li><strong>GIẢM HỌC PH&Iacute;</strong>&nbsp;nếu đ&oacute;ng học ph&iacute; trọn kh&oacute;a học, v&agrave; hỗ trợ học ph&iacute; cho học vi&ecirc;n đang theo học tại Trung t&acirc;m;</li>\r\n	<li><strong>BẢO LƯU</strong>&nbsp;học ph&iacute; nếu thời gian nghỉ học qu&aacute; 2 tuần trở l&ecirc;n;</li>\r\n	<li>Được nhận thưởng v&agrave; giấy khen kết th&uacute;c kh&oacute;a học đối với c&aacute;c bạn th&agrave;nh t&iacute;ch cao trong suốt kh&oacute;a học</li>\r\n	<li>Kết th&uacute;c mỗi kh&oacute;a học Trung t&acirc;m sẽ &ocirc;n củng cố kiến thức để đảm bảo nền tảng vững chắc c&aacute;c em thi kỳ thi Cambridge.</li>\r\n</ul>\r\n\r\n<p><strong>Chứng chỉ v&agrave; bằng cấp</strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c em sẽ được cấp giấy chứng nhận (<em>Acheivement Certificate</em>) của Trung t&acirc;m ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c sau khi ho&agrave;n th&agrave;nh kh&oacute;a học.</li>\r\n	<li>Sau khi ho&agrave;n tất mỗi chương tr&igrave;nh học, Trung t&acirc;m tiến h&agrave;nh thực hiện thủ tục dự thi cho c&aacute;c em, v&agrave; đưa c&aacute;c em đến<strong>&nbsp;Hội đồng Khảo th&iacute; Đại học Cambridge (Cambridge ESOL)</strong>&nbsp;dự thi v&agrave; đ&aacute;nh gi&aacute; n&acirc;ng lực mỗi cấp độ.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n', 1, '2020-03-01 16:30:39');
INSERT INTO `education_program` (`id`, `title`, `title1`, `code`, `image`, `description`, `detail`, `status`, `created_at`) VALUES
(5, 'Anh Văn Giao Tiếp', 'PHÙ HỢP VỚI SINH VIÊN & NGƯỜI ĐI LÀM', 'anh-van-giao-tiep', 'chuong-trinh-dao-tao/dalat-hasfarm.png', 'Giúp học viên tự tin giao tiếp, phản xạ, luyện phát âm và mở rộng vốn từ vựng thông qua phương pháp dạy trực quan sinh động phần mền MEE hoạt động đơn và hoạt động nhóm...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">BASIC:</span></span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: MEE Software, Wordlists.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 16 tuần &ndash; 72h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o vi&ecirc;n Việt Nam v&agrave; Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n cũng cố kiến thức căn bản.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">ELEMENTARY:</span></span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: MEE Software, Wordlists.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 16 tuần &ndash; 72h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o vi&ecirc;n Việt Nam v&agrave; Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n thực h&agrave;nh kỹ năng giao tiếp.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:red\">&nbsp;</span><span style=\"color:#B22222\"><u>PRE-INTERMEDIATE:</u></span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: MEE Software, Wordlists.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 16 tuần &ndash; 72h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">100% Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n n&acirc;ng cao kỹ năng giao tiếp.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">INTERMEDIATE:</span></span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: Trung t&acirc;m tổng hợp</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 16 tuần &ndash; 72h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">100% Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;Đối tượng: Học vi&ecirc;n n&acirc;ng cao kỹ năng giao tiếp.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:red\">UPPER-INTERMEDIATE:</span></span></span></span></u></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: Trung t&acirc;m tổng hợp</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 16 tuần &ndash; 72h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">100% Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n n&acirc;ng cao kỹ năng giao tiếp.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">ADVANCED 1:</span></span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: COMMUNICATION STRATEGIES 1 </span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 12 tuần &ndash; 54h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">100% Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n n&acirc;ng cao giao tiếp, thuyết tr&igrave;nh tiếng Anh.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Ph&ugrave; hợp sinh vi&ecirc;n chuy&ecirc;n ng&agrave;nh tiếng Anh, học vi&ecirc;n mục ti&ecirc;u IELTS 5.5</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;<strong><u><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\">ADVANCED 2:</span></span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Gi&aacute;o tr&igrave;nh: COMMUICATION STRATEGIES 2 </span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thời lượng: 12 tuần &ndash; 54h</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">100% Gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Đối tượng: Học vi&ecirc;n n&acirc;ng cao giao tiếp, thuyết tr&igrave;nh tiếng Anh.</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Ph&ugrave; hợp sinh vi&ecirc;n chuy&ecirc;n ng&agrave;nh tiếng Anh, học vi&ecirc;n mục ti&ecirc;u IELTS 5.5</span></span></span></span></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\">Mục ti&ecirc;u đ&agrave;o tạo:</span></strong></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">70% số tiết tr&ecirc;n lớp thực h&agrave;nh nghe n&oacute;i, 30% luyện c&aacute;c kỹ năng kh&aacute;c;</span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Gi&uacute;p học vi&ecirc;n tự tin giao tiếp, phản xạ, luyện ph&aacute;t &acirc;m v&agrave; mở rộng vốn từ vựng th&ocirc;ng qua phương ph&aacute;p dạy trực quan sinh động phần mền MEE hoạt động đơn v&agrave; hoạt động nh&oacute;m;</span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Tham gia buổi d&atilde; ngoại c&ugrave;ng Gi&aacute;o vi&ecirc;n nước ngo&agrave;i, ESC, kỹ năng thực tế ph&aacute;t &acirc;m, kỹ năng viết...&nbsp;<em>(2 tuần tổ chức một lần, học vi&ecirc;n sẽ được th&ocirc;ng b&aacute;o trước một tuần để sắp xếp thời gian).</em></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Mỗi học vi&ecirc;n được hướng dẫn bởi một người phụ tr&aacute;ch trong suốt qu&aacute; tr&igrave;nh học.</span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Cung cấp một bước đệm ho&agrave;n hảo cho học vi&ecirc;n mong muốn theo học tiếng Anh chuy&ecirc;n ng&agrave;nh hoặc muốn theo đuổi c&aacute;c chứng chỉ quốc tế.</span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Kỹ năng thuyết tr&igrave;nh v&agrave; tự tin giao tiếp người nước ngo&agrave;i bằng vốn từ vựng của m&igrave;nh;</span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\">Tối ưu Chương tr&igrave;nh:</span></strong></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Dạy tr&ecirc;n phần mền c&ocirc;ng nghệ MEE;</span></span></span></span></span></li>\r\n	<li><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Kết th&uacute;c mỗi b&agrave;i học c&oacute; t&agrave;i liệu cũng cố kiến thức, mẫu c&acirc;u thực h&agrave;nh thực tế;</span></span></span></span></span></li>\r\n	<li><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Sau mỗi 3 b&agrave;i được gi&aacute;o vi&ecirc;n cũng cố kiến thức, chuẩn bị kiến thức v&agrave; sự tin để thuyết tr&igrave;nh GVNN;</span></span></span></span></span></li>\r\n	<li><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Gi&aacute;o vi&ecirc;n đảm bảo 100% tiếng Anh tr&ecirc;n lớp;</span></span></span></span></span></li>\r\n	<li><span style=\"color:#696969\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\">Phụ đạo kh&ocirc;ng theo kịp chương tr&igrave;nh;</span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:#212529\">Đội ngủ gi&aacute;o vi&ecirc;n</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"color:#212529\">: Gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, năng động c&oacute; kinh nghiệm dạy tiếng Anh gi&uacute;p học vi&ecirc;n thoải m&aacute;i v&agrave; tiếp thu ng&ocirc;n ngữ dễ d&agrave;ng v&agrave; tự tin trong giao tiếp.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"color:#212529\">Chứng chỉ v&agrave; bằng cấp</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"color:#212529\">: Học vi&ecirc;n sẽ được cấp giấy chứng nhận (Acheivement Certificate) của Trung t&acirc;m ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c sau khi ho&agrave;n th&agrave;nh kh&oacute;a học nếu c&oacute; nhu cầu.</span></span></span></span></span></p>\r\n</div>\r\n', 1, '2020-03-01 16:32:51'),
(6, 'Ôn Luyện IELTS', 'HỌC THEO LỘ TRÌNH BÀI BẢN', 'on-luyen-ielts', 'chuong-trinh-dao-tao/hoa-sen-group.png', 'Hệ Thống Trắc Nghiệm Anh Ngữ Quốc Tế (International English Language Testing System) là kỳ thi tiếng Anh dành cho các đối tượng muốn học tập và sinh sống tại các quốc gia sử dụng tiếng Anh là ngôn ngữ chính...', '<div class=\"noidung\">\r\n<p><strong><span style=\"color:#B22222\"><em><u>Th&ocirc;ng tin cần biết về IELTS</u></em></span></strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hệ Thống Trắc Nghiệm <a href=\"http://www.elcvn.com/\">Anh Ngữ Quốc Tế</a> (International English Language Testing System) l&agrave; kỳ thi tiếng Anh d&agrave;nh cho c&aacute;c đối tượng muốn học tập v&agrave; sinh sống tại c&aacute;c quốc gia sử dụng tiếng Anh l&agrave; ng&ocirc;n ngữ ch&iacute;nh.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kỳ thi n&agrave;y được đồng sỡ hữu v&agrave; điều h&agrave;nh bởi 3 tổ chức: University of Cambridge ESOL, British Council v&agrave; tổ chức gi&aacute;o dục IDP của &Uacute;c.<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"http://www.elcvn.com/\">IELTS</a> đ&aacute;nh gi&aacute; khả năng giao tiếp bằng tiếng Anh của th&iacute; sinh th&ocirc;ng qua việc kiểm tra cả 4 kỹ năng Nghe, N&oacute;i, Đọc, Viết.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chứng chỉ IELTS c&oacute; gi&aacute; trị trong 2 năm.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <em><u>B&agrave;i thi IELTS c&oacute; hai h&igrave;nh thức:</u></em></p>\r\n\r\n<ul>\r\n	<li>H&igrave;nh thức Academic- d&agrave;nh cho c&aacute;c th&iacute; sinh dự định học đại học v&agrave; thạc sỹ</li>\r\n	<li>H&igrave;nh thức General Training - D&agrave;nh cho c&aacute;c th&iacute; sinh dự định học Trung học, Cao đẳng hoặc tham dự c&aacute;c kh&oacute;a đ&agrave;o tạo kh&ocirc;ng ở bậc đại học, hoặc v&igrave; mục đ&iacute;ch định cư.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>B&agrave;i thi Nghe 40 ph&uacute;t</li>\r\n	<li>B&agrave;i thi đọc 60 ph&uacute;t</li>\r\n	<li>B&agrave;i thi Viết 60 ph&uacute;t</li>\r\n	<li>Phỏng vấn n&oacute;i 15 ph&uacute;t</li>\r\n</ul>\r\n\r\n<p style=\"margin-left:.25in\"><strong><span style=\"color:#ff0000\">PRE IELTS 1</span>:</strong> cam kết đầu ra&nbsp; 4.0</p>\r\n\r\n<p>Thời lượng: 6 th&aacute;ng <strong>(24 tuần)</strong></p>\r\n\r\n<p>Gi&aacute;o tr&igrave;nh: <strong>Trung t&acirc;m bi&ecirc;n soạn</strong></p>\r\n\r\n<p>Thời lượng GVNN: 30% GVNN &amp; 70% GVVN</p>\r\n\r\n<p>Đối tượng: Học vi&ecirc;n nguyện vọng đạt 4.0, học tiếp nối chương tr&igrave;nh EVAS, kế hoạch du học v&agrave; định cư nước ngo&agrave;i.</p>\r\n\r\n<p style=\"margin-left:.25in\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"color:#ff0000\"><strong>PRE IELTS </strong><strong>2</strong><strong>:</strong></span> cam kết đầu ra&nbsp; 4.5</p>\r\n\r\n<p>Gi&aacute;o tr&igrave;nh: <strong>Get Insight into IELTS skills</strong>, Word lists.</p>\r\n\r\n<p>Thời lượng: 6 th&aacute;ng <strong>(24 tuần)</strong></p>\r\n\r\n<p>Thời lượng GVNN: 30% GVNN &amp; 70% GVVN</p>\r\n\r\n<p>Đối tượng: Học vi&ecirc;n nguyện vọng đạt 4.5, học tiếp nối chương tr&igrave;nh EVAS, kế hoạch du học v&agrave; định cư nước ngo&agrave;i.</p>\r\n\r\n<p style=\"margin-left:.25in\"><strong>&nbsp; &nbsp; <span style=\"color:#ff0000\">&nbsp;IELTS 1:</span></strong><span style=\"color:#ff0000\"> </span>cam kết đầu ra&nbsp; 5.0</p>\r\n\r\n<p>Gi&aacute;o tr&igrave;nh: <strong>Trung t&acirc;m tổng hợp</strong></p>\r\n\r\n<p>Thời lượng: 6 th&aacute;ng <strong>(24 tuần)</strong></p>\r\n\r\n<p>Thời lượng GVNN: 30% GVNN &amp; 70% GVVN</p>\r\n\r\n<p>Đối tượng: Học vi&ecirc;n nguyện vọng đạt 5.0, học tiếp nối chương tr&igrave;nh EVAS, kế hoạch du học v&agrave; định cư nước ngo&agrave;i.</p>\r\n\r\n<p style=\"margin-left:.25in\"><strong>&nbsp; &nbsp; &nbsp;<span style=\"color:#ff0000\">IELTS 2:</span></strong> cam kết đầu ra&nbsp; 5.5</p>\r\n\r\n<p>&nbsp;Gi&aacute;o tr&igrave;nh: <strong>Trung t&acirc;m tổng hợp</strong></p>\r\n\r\n<p>Thời lượng: 6 th&aacute;ng <strong>(24 tuần)</strong></p>\r\n\r\n<p>Thời lượng GVNN: 30% GVNN &amp; 70% GVVN</p>\r\n\r\n<p>Đối tượng: Học vi&ecirc;n nguyện vọng đạt 5.0, học tiếp nối chương tr&igrave;nh EVAS, kế hoạch du học v&agrave; định cư nước ngo&agrave;i.</p>\r\n\r\n<p style=\"margin-left:.25in\"><strong>&nbsp; &nbsp; &nbsp; <span style=\"color:#ff0000\">IELTS 3:</span></strong> cam kết đầu ra&nbsp; 6.0</p>\r\n\r\n<p>Gi&aacute;o tr&igrave;nh: <strong>IELTS EXAM PREPARATION</strong> (Vocab Consoliation - Speaking Feedback)</p>\r\n\r\n<p>Thời lượng: 6 th&aacute;ng <strong>(24 tuần)</strong></p>\r\n\r\n<p>Thời lượng GVNN: 30% GVNN &amp; 70% GVVN</p>\r\n\r\n<p>Đối tượng: Học vi&ecirc;n nguyện vọng đạt 6.0, học tiếp nối chương tr&igrave;nh EVAS, ho&agrave;n th&agrave;nh thủ tục du học nước ngo&agrave;i.</p>\r\n\r\n<p><span style=\"color:#B22222\"><strong>Mục ti&ecirc;u đ&agrave;o tạo:</strong></span></p>\r\n\r\n<ul>\r\n	<li>Nắm vững cấu tr&uacute;c đề thi;</li>\r\n	<li>L&agrave;m quen với tất cả c&aacute;c dạng c&acirc;u hỏi;</li>\r\n	<li>Ph&aacute;t triển chiến thuật l&agrave;m b&agrave;i thi;</li>\r\n	<li>Ho&agrave;n th&agrave;nh c&aacute;c b&agrave;i thi mẫu;</li>\r\n	<li>Tập trung r&egrave;n luyện to&agrave;n diện bốn kỹ năng Nghe - N&oacute;i - Đọc- Viết;</li>\r\n	<li>Mở rộng vốn từ vựng, n&acirc;ng cao kỹ năng viết;</li>\r\n	<li>Lập chiến lược l&agrave;m b&agrave;i hợp l&yacute; đối với c&aacute;c dạng c&acirc;u hỏi kh&aacute;c nhau của b&agrave;i thi Nghe v&agrave; Đọc.</li>\r\n	<li>Ph&aacute;t triển khả năng suy nghĩ độc lập, đưa ra nhiều &yacute; kiến trong b&agrave;i thi N&oacute;i v&agrave; Viết.</li>\r\n</ul>\r\n\r\n<p><span style=\"color:#B22222\"><strong>Tối ưu chương tr&igrave;nh:</strong></span></p>\r\n\r\n<ul>\r\n	<li>Gi&aacute;o vi&ecirc;n nhiều năm kinh nghiệm luyện thi IELTS, cam kết đạt 100% kết kh&oacute;a;</li>\r\n	<li>Đạt số điểm cao, ho&agrave;n th&agrave;nh mục đ&iacute;ch ch&iacute;nh du học;</li>\r\n	<li>Phụ đạo c&aacute;c kỹ năng Writing v&agrave; Speaking cho học vi&ecirc;n suốt lộ tr&igrave;nh &ocirc;n luyện Ielts tại Trung t&acirc;m;</li>\r\n	<li>Học vi&ecirc;n học 3 kh&oacute;a li&ecirc;n tục Trung t&acirc;m đạt kết quả cao được ho&agrave;n lại 50% kh&oacute;a học cuối c&ugrave;ng;</li>\r\n	<li>T&agrave;i liệu lu&ocirc;n được bi&ecirc;n soạn cập nhật thường xuy&ecirc;n với đề thi hiện h&agrave;nh;</li>\r\n	<li>Nh&acirc;n vi&ecirc;n quản l&yacute; lớp hỗ trợ nhiệt t&igrave;nh suốt kh&oacute;a học, tương t&aacute;c phụ huynh v&agrave; học vi&ecirc;n về kết quả v&agrave; tiến độ học tập;</li>\r\n</ul>\r\n\r\n<p><span style=\"color:#B22222\"><strong>Chứng chỉ v&agrave; bằng cấp</strong></span></p>\r\n\r\n<p style=\"margin-left:.5in\">Sau khi ho&agrave;n tất mỗi chương tr&igrave;nh học, Trung t&acirc;m tiến h&agrave;nh thực hiện thủ tục dự thi cho c&aacute;c em tại <strong>Hội đồng Anh(BC)</strong> hoặc <strong>Hội đồng &Uacute;c(IDP)</strong> t&ugrave;y v&agrave;o mục đ&iacute;ch y&ecirc;u cầu của học vi&ecirc;n.</p>\r\n</div>\r\n', 1, '2020-03-01 16:40:23');
INSERT INTO `education_program` (`id`, `title`, `title1`, `code`, `image`, `description`, `detail`, `status`, `created_at`) VALUES
(7, 'Ôn Luyện TOEIC', 'HỌC THEO LỘ TRÌNH BÀI BẢN', 'on-luyen-toeic', 'chuong-trinh-dao-tao/TOEIC.jpg', 'TOEIC được viết tắt của Test of English for International Communication là chương trình kiểm tra, đánh giá khả năng sử dụng Anh ngữ trong môi trường giao tiếp và làm việc quốc tế...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><strong><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><em><u><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Th&ocirc;ng tin chi tiết&nbsp;TOEIC</span></span></u></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">TOEIC được viết tắt của Test of English for International Communication l&agrave; chương tr&igrave;nh kiểm tra, đ&aacute;nh gi&aacute; khả năng sử dụng Anh ngữ trong m&ocirc;i trường giao tiếp v&agrave; l&agrave;m việc quốc tế. Tại Việt Nam, c&aacute;c c&ocirc;ng ty nước ngo&agrave;i, c&ocirc;ng ty li&ecirc;n doanh v&agrave; cả c&aacute;c doanh nghiệp trong nước cũng đang lấy TOEIC l&agrave;m một ti&ecirc;u chuẩn bắt buộc trong kh&acirc;u tuyển dụng nh&acirc;n sự &ndash; nhất l&agrave; đối với c&aacute;c chức danh quan trọng. Với c&aacute;c c&ocirc;ng ty đa quốc gia v&agrave; c&aacute;c tập đo&agrave;n lớn TOEIC l&agrave; chuẩn để họ đ&aacute;nh gi&aacute; tr&igrave;nh độ tiếng anh của nh&acirc;n vi&ecirc;n. Nếu bạn c&oacute; một chứng chỉ TOEIC với điểm số cao c&ugrave;ng khả năng giao tiếp ho&agrave;n hảo th&igrave; cơ hội được l&agrave;m việc trong những tập đo&agrave;n đa quốc gia, c&aacute;c c&ocirc;ng ty h&agrave;ng đầu kh&ocirc;ng c&ograve;n l&agrave; chuyện xa vời.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Chương tr&igrave;nh TOEIC do Viện Khảo Th&iacute; Gi&aacute;o Dục Hoa Kỳ - ETS thiết kế năm 1979 theo đơn đặt h&agrave;ng của Bộ C&ocirc;ng Nghiệp v&agrave; Ngoại Thương Nhật Bản.</span></span></span></span></span></span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><strong><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><em><u><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Đối tượng cần TOEIC:</span></span></u></em></span></span></span></strong></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">-&nbsp;</span></span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Những người sử dụng tiếng Anh trong c&ocirc;ng việc h&agrave;ng ng&agrave;y thuộc c&aacute;c lĩnh vực như: kinh doanh, kh&aacute;ch sạn, bệnh viện, nh&agrave; h&agrave;ng, hội nghị quốc tế v&agrave; sự kiện thể thao.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">- Học sinh, sinh vi&ecirc;n c&oacute; nhu cầu thi lấy bằng để ra trường hoặc xin việc. D&agrave;nh cho người đi l&agrave;m c&oacute; nhu cầu thi lấy bằng để ra thăng chức hoặc phuc vụ cho c&ocirc;ng việc kinh doanh.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">- Du học c&aacute;c nước y&ecirc;u cầu TOEIC l&agrave; điều kiện nhập học như Đ&agrave;i Loan, Trung Quốc.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><em><u><span style=\"font-size:10.5pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Thi TOEIC định kỳ</span></span></span></u></em></strong><span style=\"font-size:10.5pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;IIG V</span></span></span><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">iệt Nam tổ chức thi TOEIC định kỳ cho c&aacute;c c&aacute; nh&acirc;n v&agrave;o c&aacute;c ng&agrave;y từ thứ hai đến s&aacute;ng thứ bảy h&agrave;ng tuần, trong giờ h&agrave;nh ch&iacute;nh tại c&aacute;c văn ph&ograve;ng của TOEIC Việt Nam ở H&agrave; Nội, Đ&agrave; Nẵng, Hồ Ch&iacute; Minh v&agrave; C&acirc;n Thơ.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><em><u><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Hồ Sơ dự thi cần c&oacute;:</span></span></span></u></em></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">03 ảnh thẻ 3x4 chụp kh&ocirc;ng qu&aacute; 03 th&aacute;ng, chụp ảnh kh&ocirc;ng đeo k&iacute;nh.</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Chứng minh nh&acirc;n d&acirc;n/Hộ chiếu gốc v&agrave; bản ph&ocirc;-t&ocirc; Chứng minh nh&acirc;n d&acirc;n/Hộ chiếu hoặc c&aacute;c loại giấy chứng nhận nh&acirc;n th&acirc;n bổ sung kh&aacute;c (nếu được y&ecirc;u cầu). Thủ tục đăng k&yacute; dự thi kh&ocirc;ng được chấp nhận qua điện thoại, fax hoặc e-mail.</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Lệ ph&iacute; thi li&ecirc;n hệ bộ phận quản l&yacute;.</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Phiếu điểm TOEIC c&oacute; gi&aacute; trị trong thời han 02 năm</span></span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">. Trong trường hợp y&ecirc;u cầu cung cấp th&ecirc;m phiếu điểm để nộp&nbsp;<strong>hồ sơ tuyển dụng</strong>&nbsp;v&agrave;o c&aacute;c cơ quan/tổ chức kh&aacute;c nhau, th&iacute; sinh phải đạt đ<strong>iểm TOEIC từ 200 trở l&ecirc;n</strong>. Th&iacute; sinh cần phải xuất tr&igrave;nh CMND/Hộ chiếu gốc, bản ph&ocirc;-t&ocirc; phiếu điểm TOEIC, 01 ảnh 3x4 (giống với ảnh tr&ecirc;n phiếu điểm gốc) cho mỗi phiếu l&agrave;m th&ecirc;m, th&ocirc;ng tin nơi nhận phiếu điểm (bao gồm t&ecirc;n của c&aacute;n bộ nh&acirc;n sự v&agrave; địa chỉ doanh nghiệp) v&agrave; l&agrave;m thủ tục đăng k&yacute; trực tiếp tại văn ph&ograve;ng IIG Việt Nam. IIG Việt Nam sẽ chuyển Phiếu điểm đ&oacute; về địa chỉ C&ocirc;ng ty m&agrave; th&iacute; sinh nộp hồ sơ tuyển dụng sau 05 ng&agrave;y l&agrave;m việc. Lệ ph&iacute; cho mỗi phiếu điểm in li&ecirc;n hệ bộ phận quản l&yacute;.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Nếu muốn y&ecirc;u cầu cung cấp th&ecirc;m phiếu điểm để nộp&nbsp;<strong>hồ sơ du học</strong>, th&iacute; sinh phải đạt&nbsp;<strong>điểm TOEIC từ 500 trở l&ecirc;n</strong>. Th&iacute; sinh cần phải xuất tr&igrave;nh bản ph&ocirc;-t&ocirc; nội dung văn bản y&ecirc;u cầu c&oacute; phiếu điểm TOEIC trong hồ sơ nộp v&agrave;o Trung t&acirc;m (VD: email, tờ rơi, th&ocirc;ng tin quảng c&aacute;o tr&ecirc;n b&aacute;o ch&iacute;...), CMND/Hộ chiếu gốc, bản ph&ocirc;-t&ocirc; phiếu điểm TOEIC, 01 ảnh 3x4 (giống với ảnh tr&ecirc;n phiếu điểm gốc) cho mỗi phiếu l&agrave;m th&ecirc;m v&agrave; l&agrave;m thủ tục đăng k&yacute; trực tiếp tại văn ph&ograve;ng TOEIC Việt Nam. Th&iacute; sinh sẽ phải điền th&ocirc;ng tin v&agrave; k&yacute; nhận v&agrave;o &ldquo;Đơn đề nghị cấp bản sao phiếu điểm TOEIC&rdquo;. Trong đơn, th&iacute; sinh phải ghi mục đ&iacute;ch l&agrave; ho&agrave;n thiện hồ sơ du học, cung cấp đầy đủ th&ocirc;ng tin về Trung t&acirc;m sẽ nộp hồ sơ (t&ecirc;n Trung t&acirc;m, địa chỉ chi tiết) v&agrave; cam đoan sử dụng phiếu điểm đ&uacute;ng mục đ&iacute;ch. Lệ ph&iacute; cho mỗi phiếu điểm in li&ecirc;n hệ bộ phận quản l&yacute;.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">Th&iacute; sinh c&oacute; thể y&ecirc;u cầu cung cấp&nbsp;<strong>bằng chứng nhận (Certificate of Achievement)</strong>. Th&iacute; sinh chỉ c&oacute; thể l&agrave;m được 01 bằng chứng nhận cho mỗi lần thi.v&agrave; sẽ nhận bằng sau 10 ng&agrave;y l&agrave;m việc kể từ ng&agrave;y y&ecirc;u cầu. Lệ ph&iacute; nhận bằng chứng nhận li&ecirc;n hệ bộ phận quản l&yacute;.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><u><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">TOEIC 1&nbsp; - 350-450</span></span></u></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gi&aacute;o tr&igrave;nh:&nbsp;Format TOEIC 2019<strong> + EVAS GRAMMAR.</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thời lượng: 4 th&aacute;ng&nbsp;<strong>(16 tuần)</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đối tượng: Học vi&ecirc;n nguyện vọng đạt 350-400</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#B22222\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><u>TOEIC 2&nbsp; - 450-550</u></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gi&aacute;o tr&igrave;nh:&nbsp;Format TOEIC 2019<strong> + EVAS GRAMMAR.</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thời lượng: 4 th&aacute;ng&nbsp;<strong>(16 tuần)</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đối tượng: Học vi&ecirc;n nguyện vọng đạt 450-600</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><u>TOEIC 3&nbsp; -&nbsp;550&nbsp;-990</u></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gi&aacute;o tr&igrave;nh:&nbsp;<strong>TOEIC EXAM PREPARATION</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thời lượng: 4 th&aacute;ng&nbsp;<strong>(16 tuần)</strong></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\"><span style=\"color:#212529\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Đối tượng: Học vi&ecirc;n nguyện vọng đạt 600-990</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:18.0pt\">Mục ti&ecirc;u đ&agrave;o tạo chung:</span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Nắm vững cấu tr&uacute;c đề thi theo h&igrave;nh thức thi đổi mới 6/2019;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">L&agrave;m quen với tất cả c&aacute;c dạng c&acirc;u hỏi;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Ph&aacute;t triển chiến thuật l&agrave;m b&agrave;i thi;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Ho&agrave;n th&agrave;nh c&aacute;c b&agrave;i thi mẫu;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Tập trung luyện 2 kỹ năng nghe v&agrave; đọc;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">R&egrave;n luyện chiến thuật l&agrave;m b&agrave;i v&agrave; tạo cơ hội trải nghiệm m&ocirc;i trường thi thật kỳ thi giữa v&agrave; cuối kh&oacute;a học.</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Trang bị kiến thức, tư duy ng&ocirc;n ngữ v&agrave; kỹ năng ph&aacute;n đo&aacute;n cần thiết để học vi&ecirc;n tự tin đạt điểm cao;</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"color:#B22222\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:18.0pt\">Tối ưu chương tr&igrave;nh:</span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Trang bị kiến thức vững chắc kỳ thi TOEIC;</span></span></span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"color:#212529\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:12.0pt\"><span style=\"font-family:segoe ui,sans-serif\">Th&iacute; sinh đăng thi v&agrave; nhận kết quả thi tại EVAS, hướng dẫn v&agrave; hỗ trợ&nbsp;hồ sơ đăng k&yacute; dự thi chi tiết nhất;</span></span></span></span></span></span></li>\r\n</ul>\r\n\r\n<h2>&nbsp;</h2>\r\n\r\n<h2>&nbsp;</h2>\r\n</div>\r\n', 1, '2020-03-01 16:43:35'),
(8, 'TIẾNG ANH THEO YÊU CẦU', 'HỌC THEO THỜI GIAN RÃNH CỦA BẠN', 'tieng-anh-theo-yeu-cau', 'chuong-trinh-dao-tao/av-yeu-cau.jpg', 'Chương trình được thiết kế phù hợp cho từng học viên hoặc nhóm học. Lớp Anh văn theo yêu cầu với phương pháp dạy và học hoàn toàn mới cho phép người học hoàn toàn chủ động trong việc học...', '<div class=\"noidung\">\r\n<p><span style=\"font-size:16px\"><span style=\"color:#B22222\"><strong>M&Ocirc; TẢ CHƯƠNG TR&Igrave;NH HỌC</strong></span></span></p>\r\n\r\n<p>Chương tr&igrave;nh được thiết kế ph&ugrave; hợp cho từng học vi&ecirc;n hoặc nh&oacute;m học. Lớp Anh văn theo y&ecirc;u cầu với phương ph&aacute;p dạy v&agrave; học ho&agrave;n to&agrave;n mới cho ph&eacute;p người học ho&agrave;n to&agrave;n chủ động trong việc học. Đ&acirc;y l&agrave; một trong những yếu tố g&oacute;p phần quan trọng quyết định cho hiệu quả học tập của mỗi học vi&ecirc;n, tạo t&acirc;m l&yacute; thoải m&aacute;i v&agrave; h&agrave;o hứng, tr&aacute;nh mệt mỏi mỗi khi đến lớp. Phương ph&aacute;p n&agrave;y cho ph&eacute;p học vi&ecirc;n c&oacute; thể đến lớp học bất kỳ l&uacute;c n&agrave;o trong ng&agrave;y, trong tuần v&agrave; ho&agrave;n to&agrave;n chủ động về thời gian v&agrave; kế hoạch học tập, l&agrave;m việc của ri&ecirc;ng m&igrave;nh.</p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"color:#B22222\"><strong>Tối ưu của kh&oacute;a học:</strong></span></span></p>\r\n\r\n<p>- Được học chương tr&igrave;nh thiết kế đ&uacute;ng y&ecirc;u cầu người học;</p>\r\n\r\n<p>- Đ&uacute;ng khả năng người học;</p>\r\n\r\n<p>- Được gi&aacute;o vi&ecirc;n v&agrave; nh&acirc;n vi&ecirc;n hỗ trợ thực h&agrave;nh v&agrave; phụ đạo ngo&agrave;i giờ học;</p>\r\n\r\n<p>- Kh&oacute;a học được thiết kế với mục đ&iacute;ch gi&uacute;p học vi&ecirc;n đạt mục ti&ecirc;u trong thời gian ngắn nhất, đ&aacute;p ứng c&aacute;c y&ecirc;u cầu đặc biệt của từng học vi&ecirc;n;</p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"color:#B22222\"><strong>Thời gian học:</strong></span></span></p>\r\n\r\n<p>Theo y&ecirc;u cầu học vi&ecirc;n;</p>\r\n\r\n<p><strong>Đội ngủ gi&aacute;o vi&ecirc;n</strong>: Gi&aacute;o vi&ecirc;n nhiệt t&igrave;nh, năng động c&oacute; kinh nghiệm dạy tiếng Anh gi&uacute;p học vi&ecirc;n thoải m&aacute;i v&agrave; tiếp thu ng&ocirc;n ngữ dễ d&agrave;ng v&agrave; tự tin trong giao tiếp. Gi&aacute;o vi&ecirc;n đảm bảo 100% tiếng Anh tr&ecirc;n lớp;</p>\r\n\r\n<p><strong>Chứng chỉ v&agrave; bằng cấp</strong>: Học vi&ecirc;n sẽ được cấp giấy chứng nhận (Acheivement Certificate) của Trung t&acirc;m ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c sau khi ho&agrave;n th&agrave;nh kh&oacute;a học nếu c&oacute; nhu cầu.</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n', 1, '2020-03-01 17:01:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(10) NOT NULL,
  `product_id` int(10) DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_id`, `title`, `type`, `sort`, `status`, `path`) VALUES
(178, 54, NULL, 0, 0, 1, 'product/horizontal-feeder-feeder.png'),
(177, 53, NULL, 0, 0, 1, 'product/tube-feeder-1.jpg'),
(176, 53, NULL, 0, 0, 1, 'product/tube-feeder.png'),
(175, 52, NULL, 0, 0, 1, 'product/1-cycle-tray-tray-feeder.png'),
(174, 51, NULL, 0, 0, 1, 'product/generation-tray-tray-feeder-1.jpg'),
(173, 51, NULL, 0, 0, 1, 'product/generation-tray-tray-feeder.png'),
(172, 50, NULL, 0, 0, 1, 'product/leopard-i-plug-in-machine.png'),
(171, 49, NULL, 0, 0, 1, 'product/tiger-i-plug-in-machine-1.png'),
(170, 49, NULL, 0, 0, 1, 'product/tiger-i-plug-in-machine.png'),
(169, 48, NULL, 0, 0, 1, 'product/universal-flexible-assembly-line-1.png'),
(168, 48, NULL, 0, 0, 1, 'product/universal-flexible-assembly-line.jpg'),
(167, 47, NULL, 0, 0, 1, 'product/hanjiang-high-speed-high-precision-universal-manufacturing-unit-1.png'),
(166, 47, NULL, 0, 0, 1, 'product/hanjiang-high-speed-high-precision-universal-manufacturing-unit.jpg'),
(179, 54, NULL, 0, 0, 1, 'product/horizontal-feeder-feeder-1.jpg'),
(180, 54, NULL, 0, 0, 1, 'product/horizontal-feeder-feeder-2.jpg'),
(181, 55, NULL, 0, 0, 1, 'product/bulk-feeder.png'),
(182, 55, NULL, 0, 0, 1, 'product/bulk-feeder-1.jpg'),
(183, 56, NULL, 0, 0, 1, 'product/suction-plastic-tray-feeder.jpg'),
(184, 57, NULL, 0, 0, 1, 'product/pipette-tip-automatic-production-line.png'),
(185, 57, NULL, 0, 0, 1, 'product/pipette-tip-automatic-production-line.png-1.jpg'),
(186, 58, NULL, 0, 0, 1, 'product/medical-equipment-insulin-syringe-assembly-machine.png'),
(187, 59, NULL, 0, 0, 1, 'product/mini-screw-automatic-locking-device.jpg'),
(188, 60, NULL, 0, 0, 1, 'product/high-precision-multi-station-assembly-workstation.png'),
(189, 61, NULL, 0, 0, 1, 'product/led-bulb-light-assembly-line.png'),
(190, 62, NULL, 0, 0, 1, 'product/ballast-assembly-&-test-line.png'),
(191, 63, NULL, 0, 0, 1, 'product/iwatch-washer-assembly-machine.png'),
(192, 64, NULL, 0, 0, 1, 'product/fpc-fully-automatic-testing-machine.png'),
(193, 64, NULL, 0, 0, 1, 'product/fpc-fully-automatic-testing-machine-1.png'),
(194, 65, NULL, 0, 0, 1, 'product/multifunctional-test-lead-gpt20.png'),
(195, 66, NULL, 0, 0, 1, 'product/automatic-ic-burner.png'),
(196, 67, NULL, 0, 0, 1, 'product/chip-optical-detection-system.png'),
(197, 68, NULL, 0, 0, 1, 'product/multifunctional-test-lead-gpt10.png'),
(198, 70, NULL, 0, 0, 1, 'product/mobile-phone-packaging-line-labeling-and-accessories.jpg'),
(199, 71, NULL, 0, 0, 1, 'product/cigs-flexible-solar-chip-laminated-composite-wire.png'),
(200, 71, NULL, 0, 0, 1, 'product/cigs-flexible-solar-chip-laminated-composite-wire-1.png'),
(201, 71, NULL, 0, 0, 1, 'product/cigs-flexible-solar-chip-laminated-composite-wire-2.png'),
(202, 71, NULL, 0, 0, 1, 'product/cigs-flexible-solar-chip-laminated-composite-wire-3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info_setting`
--

CREATE TABLE `info_setting` (
  `id` int(10) NOT NULL,
  `code` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(222) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `info_setting`
--

INSERT INTO `info_setting` (`id`, `code`, `title`, `status`) VALUES
(1, 'MAIL_FORM', '', 1),
(2, 'MAIL_FROM_NAME', '', 1),
(3, 'MAIL_SMTP_USER', '', 1),
(4, 'MAIL_SMTP_PASSWORD', '#', 1),
(5, 'MAIL_SMTP_HOST', '#', 1),
(6, 'MAIL_CONTACT', '', 1),
(7, 'ADDRESS', '', 1),
(8, 'TELEPHONE', '', 1),
(9, 'FAX', '', 1),
(10, 'EMAIL', '', 1),
(11, 'LINK_IFRAME_VITUAL', '#', 1),
(12, 'FACEBOOK_PAGE', '', 1),
(13, 'GOOGLE_PLUS_PAGE', '', 1),
(14, 'TWITER_PAGE', '', 0),
(15, 'TRIPADVISOR', '', 1),
(16, 'HOTLINE', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job`
--

CREATE TABLE `job` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` longtext COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `job`
--

INSERT INTO `job` (`id`, `title`, `detail`, `created_at`) VALUES
(1, 'Tuyển dụng', '<div class=\"container\">\r\n<h4><strong>| Vietnamese English Teachers</strong></h4>\r\n</div>\r\n\r\n<div class=\"container text-justify\">\r\n<h6>Job description:</h6>\r\n\r\n<p>- Covers all classes assigned in the monthly schedule and works cooperatively with the staffs, faculty and administration of the center;<br />\r\n- Teaching schedule: weekday evening and weekend availability</p>\r\n\r\n<h6>Benefits:</h6>\r\n\r\n<p>- Competitive salary;<br />\r\n- Friendly and supportive work environment;</p>\r\n\r\n<h6>Requirements:</h6>\r\n\r\n<p>- University degree in English foreign language;<br />\r\n- University degree with IELTS 6.5;</p>\r\n</div>\r\n\r\n<div class=\"container\">\r\n<h4><strong>| Foreign Teachers</strong></h4>\r\n</div>\r\n\r\n<div class=\"container text-justify\">\r\n<h6>Job description:</h6>\r\n\r\n<p>- Covers all classes assigned in the monthly schedule and works cooperatively with the staffs, faculty and administration of the center;<br />\r\n- Teaching schedule: weekday evening classes (6:00-9:00pm) &ndash; weekend morning classes (8:00-11:00am);</p>\r\n\r\n<h6>Benefits:</h6>\r\n\r\n<p>- Competitive salary including house allowance and transportation allowance;<br />\r\n- Paid and sponsored working visa, work permit and health care check;<br />\r\n- Offered Lesson plans and instructional materials;<br />\r\n- Friendly and supportive work environment;</p>\r\n\r\n<h6>Requirements:</h6>\r\n\r\n<p>- Eligible qualifications for work permit application<br />\r\n- University degree, teaching certificates, Criminal Background Check and standard health check, passport and valid visa.</p>\r\n</div>\r\n\r\n<div class=\"container\">\r\n<h4><strong>| Teaching Assistants</strong></h4>\r\n</div>\r\n\r\n<div class=\"container text-justify\">\r\n<h6>Job description:</h6>\r\n\r\n<p>- Assist English Vietnamese teachers and Foreign Teachers;<br />\r\n- Teaching schedule: weekday evening and weekend availability</p>\r\n\r\n<h6>Benefits:</h6>\r\n\r\n<p>- Educational and practical work environment;</p>\r\n\r\n<h6>Requirements:</h6>\r\n\r\n<p>- Students majoring English;<br />\r\n- Students with good English communication;</p>\r\n</div>\r\n\r\n<div class=\"container\">\r\n<h4><strong>| Training Staffs</strong></h4>\r\n</div>\r\n\r\n<div class=\"container text-justify\">\r\n<h6>Job description:</h6>\r\n\r\n<p>- ACovers classes with EVAS programs;<br />\r\n- Consult the appropriate classes to students and students&rsquo; parents;<br />\r\n- Prepare educational materials for teachers;<br />\r\n- Gather feedback from trainees and trainers after each class;<br />\r\n- Working schedule: 48hours per week</p>\r\n\r\n<h6>Benefits:</h6>\r\n\r\n<p>- Competitive salary;<br />\r\n- Vietnam labor policy;<br />\r\n- Annual outbound tour;<br />\r\n- Friendly and supportive work environment;</p>\r\n\r\n<h6>Requirements:</h6>\r\n\r\n<p>- College or University degree in English foreign language;<br />\r\n- University degree with IELTS 6.0;<br />\r\n&nbsp;</p>\r\n</div>\r\n', 2020);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_items`
--

CREATE TABLE `news_items` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `detail` longtext COLLATE utf8_unicode_ci,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `news_items`
--

INSERT INTO `news_items` (`id`, `title`, `code`, `description`, `detail`, `image`, `status`, `created_at`, `updated`) VALUES
(49, 'BUỔI GIAO LƯU SINH VIÊN ĐH. AN GIANG!!!', 'buoi-giao-luu-sinh-vien-dhan-giang!!!', 'Sáng ngày 14/4/2018 Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc đã có buổi giao lưu các bạn sinh viên ĐH. An Giang.', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">S&aacute;ng ng&agrave;y 14/4/2018 Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c đ&atilde; c&oacute; buổi giao lưu c&aacute;c bạn sinh vi&ecirc;n ĐH. </span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">An Giang.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new111.png\" style=\"height:296px; width:527px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">Trong buổi giao luu, với sự hướng dẫn nhiệt t&igrave;nh, th&acirc;n thiện của c&ocirc; April Golenflo, c&aacute;c bạn sinh vi&ecirc;n tự tin n&oacute;i tiếng Anh trước nh&oacute;m đ&ocirc;ng;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new112.png\" style=\"height:351px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">Kh&ocirc;ng chỉ Trung t&acirc;m tổ chức những hoạt động khuyến kh&iacute;ch c&aacute;c bạn mạnh dạng giao tiếp tiếng Anh, buổi giao lưu n&agrave;y gi&uacute;p c&aacute;c bạn quen nhiều bạn mới hơn th&ocirc;ng qua hoạt động Challenge Your English v&agrave; My new Friend;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new113.png\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">QUAN TRỌNG HƠN CẢ - Trung t&acirc;m đ&atilde; mang đến cơ hội ứng tuyển việc l&agrave;m cho c&aacute;c bạn sinh vi&ecirc;n. Những t&agrave;i năng trẻ mong muốn g&oacute;p kiến thức v&agrave;o c&ocirc;ng t&aacute;c gi&aacute;o dục</span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new114.png\" style=\"height:350px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n</div>\r\n', 'tin-tuc/new111.png', 1, '2020-02-18 16:33:06', '2020-02-18 15:33:06'),
(50, 'LỄ PHÁT BẰNG CAMBRIDGE 2017', 'le-phat-bang-cambridge-2017', 'Ngày 8/10/2017 vừa qua, EVAS đã long trọng tổ chức lễ phát bằng Cambridge cho 150 học viên xuất sắc đợt I&II.2017...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#1d2129\">Ngày 8/10/2017 vừa qua, EVAS đã long trọng t&ocirc;̉ chức l&ecirc;̃ ph&aacute;t bằng Cambridge cho 150 học vi&ecirc;n xuất sắc đợt I&amp;II.2017.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn//upload/images/tin-tuc/new101.png\" style=\"height:468px; width:624px\" /></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:9.0pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#666666\">Th&ocirc;ng qua bu&ocirc;̉i l&ecirc;̃, c&aacute;c em kh&ocirc;ng chỉ thể hiện sự tự tin khi tự d&acirc;̃n chương trình và trình di&ecirc;̃n các ti&ecirc;́t mục hoàn toàn bằng ti&ecirc;́ng anh, mà còn được c&ocirc;ng nhận m&ocirc;̣t quá trình luy&ecirc;̣n t&acirc;̣p chăm chỉ vừa qua của các con qua sự hướng d&acirc;̃n t&acirc;̣n tình của đ&ocirc;̣i ngũ EVAS.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:9.0pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#666666\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new102.png\" style=\"height:450px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#666666\">C&aacute;c </span></span></span></span><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#666666\">con khi khoác l&ecirc;n mình chi&ecirc;́c áo tốt nghiệp đ&ecirc;̉ nh&acirc;̣n bằng STARTERS, MOVERS, FLYERS, KET, PET với s&ocirc;́ khi&ecirc;ng r&acirc;́t cao đã khẳng định được ch&acirc;́t lượng của Evas, cũng như sự đ&ocirc;̀ng hành, h&ocirc;̃ trợ từ các quý phụ huynh.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12.0pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica,sans-serif\"><span style=\"color:#666666\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new103.png\" style=\"height:415px; width:624px\" /></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n</div>\r\n', 'tin-tuc/blog5.jpg', 1, '2020-02-19 00:00:00', '2020-02-18 15:33:06'),
(51, ' ĐÊM HỘI HALLOWEEN 2017!', 'dem-hoi-halloween-2017!', 'Lại một mùa Halloween nữa đã qua, các em học viên Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc cùng bạn...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">Lại một m&ugrave;a Halloween nữa đ&atilde; qua, c&aacute;c em học vi&ecirc;n Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c c&ugrave;ng bạn v&agrave; thầy c&ocirc; đ&atilde; lưu giữ lại những kỹ niệm đẹp th&ocirc;ng qua những bức h&igrave;nh h&oacute;a trang.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new91.png\" style=\"height:468px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc//new92.png\" style=\"height:451px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\">V&agrave; thầy c&ocirc; cũng t&iacute;ch cực tham gia buổi lễ hội n&agrave;y đấy.</span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new93.png\" style=\"height:558px; width:624px\" /></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n</div>\r\n', 'tin-tuc/blog3.jpg', 1, '2020-02-20 16:33:06', '2020-02-18 15:33:06'),
(52, 'HỘI TRẠI HÈ 2017!!', 'hoi-trai-he-2017!!', 'Sáng ngày 10/8/2018 Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc đã chức buổi cấm trại...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">S&aacute;ng ng&agrave;y </span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">10/8/2018</span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"> Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c đ&atilde; chức buổi cấm trại cho c&aacute;c em học vi&ecirc;n của Trung t&acirc;m. </span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">Buổi trại được tổ chức khu&ocirc;n vi&ecirc;n trường Đại học An Giang, với sự tham gia của 60 b&eacute; đến từ c&aacute;c cấp độ Twinkle Stars &ndash; Bright Stars &ndash; Super Stars &ndash; Starters &ndash; Movers &ndash; Flyers v&agrave; to&agrave;n thể thầy c&ocirc; Trung t&acirc;m.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new81.png\" style=\"height:391px; width:521px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">C&aacute;c em tự tin giao tiếp c&ugrave;ng bạn b&egrave; v&agrave; thầy c&ocirc; c&ugrave;ng với những hoạt động s&aacute;ng tạo vui nhộn, giao tiếp bằng tiếng Anh suốt buổi sinh hoạt.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new82.png\" style=\"height:291px; width:388px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">Kh&ocirc;ng chỉ Trung t&acirc;m tổ chức những hoạt động khuyến kh&iacute;ch c&aacute;c bạn mạnh dạng giao tiếp tiếng Anh, buổi </span></span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">cấm trại n&agrave;y c&aacute;c em c&ograve;n được tham gia c&aacute;c tr&ograve; chơi vận động vui nhộn c&ugrave;ng thầy c&ocirc;.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn//upload/images/tin-tuc/new83.png\" style=\"height:468px; width:624px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"color:#1d2129\">C&ugrave;ng với điệu nhảy nh&iacute; nhỏm của ch&uacute; bee, c&aacute;c em c&oacute; một ng&agrave;y sinh hoạt hoạt kh&oacute;a thật vui, thật hữu dụng.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n</div>\r\n', 'tin-tuc/blog2.jpg', 1, '2020-02-21 16:33:06', '2020-02-18 15:33:06'),
(53, 'Macmillan Training Day', 'macmillan-training-day', 'Vào lúc 8:30, ngày 7 tháng 9 năm 2017 tại Khách sạn Hòa Bình I. Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">V&agrave;o l&uacute;c 8:30, ng&agrave;y 7 th&aacute;ng 9 năm 2017 tại Kh&aacute;ch sạn H&ograve;a B&igrave;nh I. Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c phối hợp c&ugrave;ng nh&agrave; xuất bản Macmillan đến từ Anh tổ chức buổi workshop. C&ugrave;ng với sự tham dự&nbsp;&nbsp;</span></span></span></span><span style=\"font-size:10.5pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><span style=\"background-color:white\">Đại diện Nh&agrave; xuất bản Macmillan&nbsp;</span><br />\r\n<span style=\"background-color:white\">- &Ocirc;ng David Kaye&nbsp;<br />\r\nĐại diện Trung t&acirc;m&nbsp;<br />\r\n- Gi&aacute;m đốc Trung t&acirc;m &ndash; B&agrave; La Ngoc Huong&nbsp;<br />\r\n- Gi&aacute;o vi&ecirc;n Trung t&acirc;m &ndash; &Ocirc;ng Grant Robert Hunter&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\"><span style=\"background-color:white\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new71.png\" style=\"height:338px; width:602px\" /></span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">Buổi hội thảo diễn ra rất th&agrave;nh c&ocirc;ng mang lại cho </span></span></span></span><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">gi&aacute;o vi&ecirc;n bộ m&ocirc;n Tiếng anh sử dụng gi&aacute;o tr&igrave;nh v&agrave; c&aacute;c phần mềm hỗ trợ giảng dạy bằng c&ocirc;ng nghệ hiện đại.&nbsp;</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new72.png\" style=\"height:338px; width:602px\" /></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:#1d2129\">Kết th&uacute;c buổi tập huấn của &Ocirc;ng. </span></span></span><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:times,serif\"><span style=\"color:#1d2129\">David Kaye</span></span></span></span><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:#1d2129\">, thầy c&ocirc; Trung t&acirc;m Ngoại ngữ quốc tế &Acirc;u Việt &Uacute;c đ&atilde; t&iacute;ch lũy kiến thức chuy&ecirc;n m&ocirc;n, hứa hẹn sẽ mang lại phương ph&aacute;p giảng dạy mới lạ v&agrave; chất lượng tối ưu cho người học.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"color:#1d2129\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new73.png\" style=\"height:338px; width:602px\" /></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n</div>\r\n', 'tin-tuc/blog1.jpg', 1, '2020-02-18 16:33:06', '2020-02-18 15:33:06'),
(54, 'NGOẠI KHÓA HOMESTAY CÙNG GIÁO VIÊN BẢN XỨ', 'ngoai-khoa-homestay-cung-giao-vien-ban-xu', 'Nằm trong chuỗi hoạt động ngoại khóa, Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc đã tổ chức cho...', '<div class=\"noidung\">\r\n<p><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Nằm trong chuỗi hoạt động ngoại kh&oacute;a</span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">, </span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Trung t&acirc;m </span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c </span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">đ&atilde; tổ chức cho c&aacute;c b&eacute; học vi&ecirc;n</span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\"> tham <strong>gia một ng&agrave;y trải nghiệm sống v&agrave; học tập c&ugrave;ng gi&aacute;o vi&ecirc;n Nước Ngo&agrave;i</strong>.</span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new61.png\" /></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Nhằm tạo ra m&ocirc;i trường học tiếng Anh hiệu quả Evas kh&ocirc;ng ngừng s&aacute;ng tạo c&aacute;c m&ocirc; h&igrave;nh học tập s&ocirc;i động, thực tế v&agrave; khơi dậy đam m&ecirc; ng&ocirc;n ngữ c&aacute;c em nhỏ, gi&uacute;p c&aacute;c em tự tin v&agrave; giao tiếp lưu lo&aacute;t với người bản xứ.</span></span></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new62.png\" /></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">C&aacute;c em c&oacute; một ng&agrave;y thật đặc biệt</span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\"> v&agrave; </span></span><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">tuyệt vời sống v&agrave; trải nghiệm c&ugrave;ng thầy Grant Hunter.</span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new63.png\" /></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Mỗi nh&oacute;m được chia 4-5 b&eacute;, c&aacute;c b&eacute; c&ugrave;ng thầy chuẩn bị bữa ăn, qu&eacute;t s&agrave;n rửa ch&eacute;n&hellip;. c&ugrave;ng thầy đ&agrave;m thoại chủ đề thường ng&agrave;y v&agrave; thực h&agrave;nh c&aacute;c b&agrave;i tập nh&oacute;m n&acirc;ng cao kỹ n&acirc;ng tiếng Anh.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Điểm chung của c&aacute;c b&eacute; l&agrave; rất phấn khởi, vui vẻ tham gia từng hoạt động. Sự dạn dĩ giao tiếp c&ugrave;ng bạn b&egrave;, GVNN cũng ng&agrave;y c&agrave;ng n&acirc;ng cao.</span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/blog.jpg', 1, '2020-02-18 16:33:06', '2020-02-18 15:33:06'),
(55, 'CÂU LẠC BỘ TIẾNG ANH EVAS', 'cau-lac-bo-tieng-anh-evas', 'Câu Lạc Bộ tiếng Anh EVAS được Trung Tâm Ngoại ngữ Quốc tế Âu Việt Úc tổ chức thường xuyên...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">C&acirc;u Lạc Bộ tiếng Anh EVAS được Trung T&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tổ chức thường xuy&ecirc;n v&agrave;o ng&agrave;y cuối tuần. Thấu hiểu được tầm quan trọng của m&ocirc;i trường luyện giao tiếp tiếng Anh, Evas tổ chức Club với sự tham gia Gi&aacute;o vi&ecirc;n Nước ngo&agrave;i nhằm gi&uacute;p học vi&ecirc;n trong v&agrave; ngo&agrave;i Trung t&acirc;m tự tin giao tiếp, x&oacute;a bỏ khoảng c&aacute;ch sợ sợt giao tiếp tiếng Anh đặc biệt với Gi&aacute;o vi&ecirc;n nước ngo&agrave;i.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new51.png\" style=\"height:369px; width:553px\" />\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">C&aacute;c chủ đề h&agrave;ng tuần được thảo luận gắn liền với c&ocirc;ng việc thực tế, c&aacute;c vấn đề x&atilde; hội, văn h&oacute;a, đang được mọi người quan t&acirc;m, mang t&iacute;nh thiết thực cao. C&ugrave;ng với sự tổ chức chuy&ecirc;n nghiệp với sự hỗ trợ v&agrave; gi&uacute;p đỡ&nbsp; nhiệt t&igrave;nh c&aacute;c th&agrave;nh vi&ecirc;n Club, th&agrave;nh vi&ecirc;n mới hoặc c&aacute;c bạn mới tham gia lần đầu sẽ kh&ocirc;ng phải bở ngỡ.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new52.png\" style=\"height:373px; width:576px\" />\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Để tạo kh&ocirc;ng kh&iacute; s&ocirc;i động Club được thiết kế với c&aacute;c tr&ograve; chơi tuy duy tiếng Anh, kỹ năng giải quyết vấn đề v&agrave; giao tiếp trước đ&aacute;m đ&ocirc;ng. Qua đ&acirc;y học vi&ecirc;n kh&ocirc;ng chỉ cải thiện kỹ năng mền m&agrave; c&ograve;n n&acirc;ng cao cốn từ vựng tiếng Anh, cải thiện ngữ ph&aacute;p, thực h&agrave;nh c&aacute;c t&igrave;nh huống giao tiếp tiếng Anh h&agrave;ng ng&agrave;y v&ocirc; c&ugrave;ng thực tế.</span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new53.png\" style=\"height:382px; width:576px\" />\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Nếu c&oacute; cơ hội, c&aacute;c bạn h&atilde;y c&ugrave;ng tham gia Evas CLUB để được giao lưu, học tập từ c&aacute;c giảng vi&ecirc;n nước ngo&agrave;i, chuy&ecirc;n gia đ&agrave;o tạo Việt Nam. Đ&oacute; l&agrave; điều kiện v&ocirc; c&ugrave;ng thuận lợi để n&acirc;ng cao kỹ năng nghe n&oacute;i của m&igrave;nh.</span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/new51.png', 1, '2020-03-02 02:33:52', '2020-03-02 02:33:52'),
(56, 'Hỗ trợ Sinh Viên Ngày Hội Việc Làm Trường Đại Học An Giang', 'ho-tro-sinh-vien-ngay-hoi-viec-lam-truong-dai-hoc-an-giang', 'Hàng năm Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc tham gia ngày Ngày hội việc làm...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"color:black\">H&agrave;ng năm Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tham gia ng&agrave;y Ng&agrave;y hội việc l&agrave;m do trường Trường Đại học An Giang đ&atilde; tổ chức. Với mong muốn tạo điều kiện c&aacute;c bạn sinh vi&ecirc;n tiếp cận đến hệ thống đ&agrave;o tạo của Trung t&acirc;m, theo đuổi chuy&ecirc;n s&acirc;u chuy&ecirc;n ng&agrave;nh được đ&agrave;o tạo, khi ra trường đủ điều kiện ứng tuyển v&agrave;o Trung t&acirc;m l&agrave;m việc. Trung t&acirc;m cũng tạo s&acirc;n chơi bổ &iacute;ch gi&uacute;p c&aacute;c em c&oacute; cơ hội giao tiếp người nước ngo&agrave;i v&agrave; khơi dậy đam m&ecirc; tiếng Anh c&aacute;c bạn trẻ.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new41.png\" style=\"height:347px; width:501px\" />\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Đồng nh&agrave; t&agrave;i trợ ch&iacute;nh của chương tr&igrave;nh, đại diện Trường Đại học An Giang trao hoa v&agrave; qu&agrave; lưu niệm cho Trung t&acirc;m.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new42.png\" style=\"height:334px; width:501px\" />\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Buổi phỏng vấn trao học bổng thầy Grant Hunter với sinh vi&ecirc;n Trường Đại học An Giang</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new43.png\" style=\"height:338px; width:602px\" />\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">C&aacute;c bạn sinh vi&ecirc;n đang được c&aacute;n bộ nh&acirc;n vi&ecirc;n Trung t&acirc;m tư vấn v&agrave; hướng dẫn lộ tr&igrave;nh học tiếng Anh hiệu quả</span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/new41.png', 1, '2020-03-02 02:40:06', '2020-03-02 02:40:06'),
(57, 'HỌC VIÊN EVAS ĐÓN GIÁNG SINH ẤM ÁP CÙNG THẦY CÔ', 'hoc-vien-evas-don-giang-sinh-am-ap-cung-thay-co', 'Tối ngày 19 tháng 12 năm 2016, tại Tiny World, Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc...', '<div class=\"noidung\">\r\n<p style=\"text-align:justify\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Tối ng&agrave;y 19 th&aacute;ng 12 năm 2016, tại Tiny World, Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tổ chức Đ&ecirc;m lễ Gi&aacute;ng sinh nhằm đ&oacute;n một m&ugrave;a Gi&aacute;ng sinh an l&agrave;nh v&agrave; ch&agrave;o mừng năm mới 2017 c&ugrave;ng với sự tham dự nhiệt t&igrave;nh v&agrave; cổ vũ s&ocirc;i nổi của đ&ocirc;ng đảo c&aacute;c em học vi&ecirc;n v&agrave; c&aacute;n bộ nh&acirc;n vi&ecirc;n Evas. </span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new31.png\" style=\"height:339px; width:602px\" />\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Trung t&acirc;m Ngoại ngữ&nbsp; Quốc tế &Acirc;u Việt &Uacute;c l&agrave; một trung t&acirc;m Anh ngữ kh&ocirc;ng chỉ đi đầu về chất lượng đ&agrave;o tạo m&agrave; c&ograve;n l&agrave; đơn vị c&oacute; nhiều đ&oacute;n g&oacute;p t&iacute;ch cực cho cộng đồng, lu&ocirc;n lu&ocirc;n song h&agrave;nh với chương tr&igrave;nh nhằm mang đến c&aacute;c em thiếu nhi giao lưu, r&egrave;n luyện kỹ năng giao tiếp, sử dụng Anh văn đồng thời l&agrave; dịp để mọi người x&iacute;ch lại gần nhau, hiểu nhau hơn .</span></span></span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new32.png\" style=\"height:351px; width:603px\" />\r\n<p style=\"text-align:justify\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">C&ugrave;ng với c&aacute;c hoạt động vui tươi tại c&aacute;c gian h&agrave;ng tr&ograve; chơi, c&aacute;c gian h&agrave;ng nghệ thuật cũng kh&ocirc;ng k&eacute;m phần thu h&uacute;t.</span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new33.png\" style=\"height:339px; width:602px\" />\r\n<p style=\"text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:times new roman,serif\">Kết th&uacute;c trong kh&ocirc;ng kh&iacute; rộn r&atilde;, ấm &aacute;p tiếng cười v&agrave; ngập tr&agrave;n niềm vui, c&aacute;c em ch&agrave;o tạm biệt thầy c&ocirc; trong sự tiếc nuối v&agrave; muốn thời gian quay lại để được tận hưởng kh&ocirc;ng kh&iacute; vui nhộn của Lễ Hội Gi&aacute;ng Sinh th&ecirc;m một lần nữa. Evas xin hẹn gặp lại c&aacute;c b&eacute; v&agrave; Qu&iacute; Phụ huynh v&agrave;o Lễ Hội Gi&aacute;ng Sinh năm sau nh&eacute;</span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/new31.png', 1, '2020-03-02 02:42:06', '2020-03-02 02:42:06'),
(58, 'TRUNG TÂM EVAS KHAI TRƯƠNG CHI NHÁNH 2', 'trung-tam-evas-khai-truong-chi-nhanh-2', 'Tại buổi khai trương, Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc đã vinh dự được tiếp đón quý vị đại biểu...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"color:#060606\">Tại buổi khai trương, Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c đ&atilde; vinh dự được tiếp đ&oacute;n qu&yacute; vị đại biểu l&agrave; đại diện Sở, Ban, Ng&agrave;nh tỉnh An Giang c&ugrave;ng hơn 100 kh&aacute;ch mời l&agrave; gi&aacute;o vi&ecirc;n, phụ huynh, học sinh tr&ecirc;n địa b&agrave;n th&agrave;nh phố đến tham dự chương tr&igrave;nh khai trương ng&agrave;y.</span></span></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new21.png\"/>\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"color:#060606\">Ph&aacute;t biểu trong buổi lễ khai trương, b&agrave; La Ngọc Hương Gi&aacute;m đốc Trung t&acirc;m Ngoại Ngữ Quốc tế &Acirc;u Việt &Uacute;c cho biết: &ldquo;Nhằm mục đ&iacute;ch thực hiện sứ mệnh của Trung t&acirc;m đ&agrave;o tạo nhiều học vi&ecirc;n chuẩn h&oacute;a tiếng Anh, Ch&uacute;ng t&ocirc;i x&uacute;c tiến th&agrave;nh lập Chi nh&aacute;nh tr&ecirc;n c&ugrave;ng địa b&agrave;n th&agrave;nh phố Long Xuy&ecirc;n địa điểm 79 Trần Hưng Đạo, ch&uacute;ng t&ocirc;i rất tự h&agrave;o l&agrave; một trong những Trung t&acirc;m đ&agrave;o tạo tiếng Anh đầu ti&ecirc;n đạt chuẩn về chương tr&igrave;nh đ&agrave;o tạo lẫn cơ sở vật chất v&agrave; đội ngũ giảng dạy tại tỉnh An Giang. Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c được hợp t&aacute;c v&agrave; hỗ trợ bởi những người c&oacute; chuy&ecirc;n m&ocirc;n cao, kinh nghiệm l&acirc;u năm trong lĩnh vực giảng dạy v&agrave; nghi&ecirc;n cứu. Đặc biệt họ lu&ocirc;n ấp ủ mong muốn được đ&oacute;ng g&oacute;p sức lực v&agrave; chuy&ecirc;n m&ocirc;n của m&igrave;nh cho việc ph&aacute;t triển gi&aacute;o dục n&oacute;i chung v&agrave; n&acirc;ng cao chất lượng dạy-học lĩnh vực ngoại ngữ, đặc biệt l&agrave; tiếng Anh n&oacute;i ri&ecirc;ng cho qu&ecirc; hương An Giang. Ch&uacute;ng t&ocirc;i cam kết, sẽ đem đến những chương tr&igrave;nh học tiếng Anh chất lượng từ đội ngũ nh&acirc;n vi&ecirc;n đầy nhiệt huyết v&agrave; gi&aacute;o vi&ecirc;n bản xứ gi&agrave;u kinh nghiệm từ đ&oacute; g&oacute;p phần n&acirc;ng cao khả năng sử dụng tiếng Anh cho những người d&acirc;n nơi đ&acirc;y.</span></span></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new22.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:times new roman,serif\"><span style=\"font-size:14.0pt\"><span style=\"color:#060606\">Lễ cắt băng khai trương đ&atilde; được diễn ra ngay sau đ&oacute; trước sự chứng kiến của tất cả c&aacute;c qu&iacute; vị quan kh&aacute;ch v&agrave; đ&ocirc;ng đảo học vi&ecirc;n, phụ huynh. Cũng trong buổi s&aacute;ng ng&agrave;y khai trương, tất cả nh&acirc;n vi&ecirc;n v&agrave; gi&aacute;o vi&ecirc;n EVAS đ&atilde; tiếp h&agrave;ng trăm lượt phụ huynh c&ugrave;ng học sinh đến t&igrave;m hiểu về chương tr&igrave;nh học, tham quan cơ sở vật chất của EVAS cũng như tham gia thi xếp lớp với c&aacute;c gi&aacute;o vi&ecirc;n nước ngo&agrave;i.</span></span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/new22.png', 1, '2020-03-02 02:48:20', '2020-03-02 02:48:20'),
(59, ' LỄ PHÁT BẰNG CAMBRIDGE ĐỢT III NĂM 2016', 'le-phat-bang-cambridge-dot-iii-nam-2016', 'Ngày 19 tháng 7 năm 2016, Trung tâm Ngoại ngữ quốc tế Âu Việt Úc long trọng tổ chức lễ vinh danh...', '<div class=\"noidung\">\r\n<p><span style=\"font-size:14.0pt\"><span style=\"color:#333333\">Ng&agrave;y 19 th&aacute;ng 7 năm 2016, Trung t&acirc;m Ngoại ngữ quốc tế &Acirc;u Việt &Uacute;c long trọng tổ chức lễ vinh danh v&agrave; trao bằng Quốc tế Cambrigde hơn 100 học vi&ecirc;n thiếu nhi, bao gồm c&aacute;c cấp độ STARTERS, MOVERS v&agrave; FLYERS, do đơn vị Khảo th&iacute; Cambridge ESOL của Đại học Cambrigde (Anh) cấp. Đ&acirc;y l&agrave; đợt trao chứng chỉ thứ ba trong năm 2017.</span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new11.png\" />\r\n<p><span style=\"font-size:14.0pt\"><span style=\"color:#1a1a1a\">Tại buổi lễ, Đại diện của Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c &ndash; Gi&aacute;m đốc Trung t&acirc;m b&agrave; La Ngọc Hương v&agrave; c&ugrave;ng c&aacute;c thầy c&ocirc; chuy&ecirc;n gia nước ngo&agrave;i đ&atilde; trao chứng chỉ cho 45 học vi&ecirc;n Starters, 35 học vi&ecirc;n Movers v&agrave; 45 học vi&ecirc;n Flyers. </span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new12.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><strong><span style=\"font-size:14.0pt\"><span style=\"color:#333333\">Diễn ra c&ugrave;ng với lễ ph&aacute;t bằng c&ograve;n kết hợp ca nhạc, thời trang, m&uacute;a, kịch, nhảy hiện đại, do c&aacute;c học vi&ecirc;n của trung t&acirc;m biểu diễn v&agrave; sử dụng 100% tiếng Anh, Qua đ&oacute;, gi&uacute;p c&aacute;c b&eacute; r&egrave;n luyện, trau dồi khả năng tiếng Anh, r&egrave;n luyện sự tự tin v&agrave; khả năng tr&igrave;nh diễn, n&oacute;i trước đ&aacute;m đ&ocirc;ng.&nbsp;</span></span></strong></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new13.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"color:#333333\">Để tham dự kỳ thi lấy chứng chỉ Cambridge Starters, Movers v&agrave; Flyers, học vi&ecirc;n Evas chỉ cần ho&agrave;n th&agrave;nh c&aacute;c cấp độ của chương tr&igrave;nh Anh ngữ Thiếu nhi SuperKids. Được thiết kế cho học sinh tiểu học từ 7-12 tuổi với mục ti&ecirc;u x&acirc;y dựng nền tảng Anh ngữ vững chắc, mang đến cho học vi&ecirc;n cơ hội ph&aacute;t triển đều 4 kỹ năng nghe, n&oacute;i, đọc, viết, ph&aacute;t &acirc;m chuẩn cũng như r&egrave;n luyện sự tự tin. Kết quả c&aacute;c kỳ thi chứng chỉ Cambridge n&agrave;y đ&atilde; trở th&agrave;nh nền m&oacute;ng quan trọng đối với học sinh tiểu học tại Việt Nam trong h&agrave;nh tr&igrave;nh chinh phục tri thức thế giới, h&ograve;a nhập cộng đồng quốc tế.</span></span> </span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"background-color:white\"><span style=\"font-family:calibri,sans-serif\">&nbsp;</span></span></span></p>\r\n</div>\r\n', 'tin-tuc/new12.png', 1, '2020-03-02 02:52:14', '2020-03-02 02:52:14');
INSERT INTO `news_items` (`id`, `title`, `code`, `description`, `detail`, `image`, `status`, `created_at`, `updated`) VALUES
(60, 'THI VĂN NGHỆ BE A STAR – THE VOICE OF EVAS', 'thi-van-nghe-be-a-star-–-the-voice-of-evas', 'Vừa qua ngày 3/6/2018, EVAS đã tổ chức thành công Trung tâm tổ chức cuộc thi BE A STAR...', '<div class=\"noidung\">\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new12_1.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Vừa qua ng&agrave;y 3/6/2018, EVAS đ&atilde; tổ chức th&agrave;nh c&ocirc;ng Trung t&acirc;m tổ chức cuộc thi BE A STAR, c&aacute;c con rất giỏi, tự tin buổi diễn tr&ecirc;n s&acirc;n khấu. Qua chương tr&igrave;nh n&agrave;y EVAS rất tự h&agrave;o về c&aacute;c con. D&ugrave; thắng hay kh&ocirc;ng th&igrave; quan trọng nhất l&agrave;: </span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">❤️</span><span style=\"color:black\"> C</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">c con c</span><span style=\"color:black\">&oacute;</span><span style=\"color:black\"> bu</span><span style=\"color:black\">ổ</span><span style=\"color:black\">i t</span><span style=\"color:black\">ố</span><span style=\"color:black\">i th</span><span style=\"color:black\">ưở</span><span style=\"color:black\">ng th</span><span style=\"color:black\">ứ</span><span style=\"color:black\">c c</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">c ti</span><span style=\"color:black\">ế</span><span style=\"color:black\">t m</span><span style=\"color:black\">ụ</span><span style=\"color:black\">c bu</span><span style=\"color:black\">ổ</span><span style=\"color:black\">i bi</span><span style=\"color:black\">ể</span><span style=\"color:black\">u di</span><span style=\"color:black\">ễ</span><span style=\"color:black\">n 100% ti</span><span style=\"color:black\">ế</span><span style=\"color:black\">ng Anh;</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">❤️</span><span style=\"color:black\">Con t</span><span style=\"color:black\">ự</span><span style=\"color:black\"> tin bu</span><span style=\"color:black\">ổ</span><span style=\"color:black\">i di</span><span style=\"color:black\">ễ</span><span style=\"color:black\">n tr</span><span style=\"color:black\">&ecirc;</span><span style=\"color:black\">n s</span><span style=\"color:black\">&acirc;</span><span style=\"color:black\">n kh</span><span style=\"color:black\">ấ</span><span style=\"color:black\">u;</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">❤️</span><span style=\"color:black\"> H</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">t nh</span><span style=\"color:black\">ữ</span><span style=\"color:black\">ng b</span><span style=\"color:black\">&agrave;</span><span style=\"color:black\">i h</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">t ti</span><span style=\"color:black\">ế</span><span style=\"color:black\">ng Anh thuyết phục kh&aacute;n giả;</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">❤️</span><span style=\"color:black\">L</span><span style=\"color:black\">&agrave;</span><span style=\"color:black\"> n</span><span style=\"color:black\">ơ</span><span style=\"color:black\">i c</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">c con giao l</span><span style=\"color:black\">ư</span><span style=\"color:black\">u c</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">c anh ch</span><span style=\"color:black\">ị</span><span style=\"color:black\"> t</span><span style=\"color:black\">ự</span><span style=\"color:black\"> tin </span><span style=\"color:black\">đứ</span><span style=\"color:black\">ng s</span><span style=\"color:black\">&acirc;</span><span style=\"color:black\">n kh</span><span style=\"color:black\">ấ</span><span style=\"color:black\">u tr</span><span style=\"color:black\">ả</span><span style=\"color:black\"> l</span><span style=\"color:black\">ờ</span><span style=\"color:black\">i v</span><span style=\"color:black\">ấ</span><span style=\"color:black\">n </span><span style=\"color:black\">đ&aacute;</span><span style=\"color:black\">p gi</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">m kh</span><span style=\"color:black\">ả</span><span style=\"color:black\">o v</span><span style=\"color:black\">&agrave;</span><span style=\"color:black\"> c</span><span style=\"color:black\">&aacute;</span><span style=\"color:black\">c b</span><span style=\"color:black\">ạ</span><span style=\"color:black\">n t</span><span style=\"color:black\">ự</span><span style=\"color:black\"> tin k</span><span style=\"color:black\">ể</span><span style=\"color:black\"> chuy</span><span style=\"color:black\">ệ</span><span style=\"color:black\">n, di</span><span style=\"color:black\">ễ</span><span style=\"color:black\">n xu</span><span style=\"color:black\">ấ</span><span style=\"color:black\">t v</span><span style=\"color:black\">&agrave;</span><span style=\"color:black\"> l</span><span style=\"color:black\">&agrave;</span><span style=\"color:black\">m MC.</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">❤️</span><span style=\"color:black\">V&agrave; đặc việt c&aacute;c con c&oacute; những buổi tập với những kỷ niệm đẹp với c&aacute;c bạn c&ugrave;ng lớp v&agrave; với thầy c&ocirc; EVAS.</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new12_2.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Kết hợp với chương tr&igrave;nh BE A STAR l&agrave; buổi thi vấn đ&aacute;p 5 bạn v&agrave;o v&ograve;ng chung kết The Voice of EVAS. </span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">V&agrave; giải nhất thuộc về em: Phan Ngọc Nhật H&agrave; &ndash; Linda (IELTS)</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Giải nh&igrave; thuộc về em: Trần &Aacute;nh Ngọc &ndash; Kelly (FLYERS)</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Đồng giải nh&igrave; thuộc về em: Trần Khải Qu&acirc;n &ndash; Will (IELTS)</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/storage/app/images/new12_3.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Tổng kết chương tr&igrave;nh BE A STAR</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Giải nhất thuộc về em: Brian Movers23</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:12pt\"><span style=\"color:black\">Đồng Giải nh&igrave; thuộc về em: Justin Starters25 v&agrave; Annie Flyers9&amp;10</span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11.0pt\"><span style=\"color:black\">Đồng Giải ba thuộc về em: Anna Starters22 &ndash; Cherry Movers16 </span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:center\">&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/new12_4.png\" /></div>\r\n', 'tin-tuc/new12_1.png', 1, '2020-03-02 03:01:50', '2020-03-02 03:01:50'),
(61, 'TỔNG KẾT SUMMER CAMP 29.7.2018', 'tong-ket-summer-camp-29-7-2018', 'Gần 400 học viên nhóm tuổi 4-12 tham gia ngày 28&29/7 cùng thầy cô EVAS.', '<div class=\"noidung\">\r\n<p>TỔNG KẾT SUMMER CAMP 29.7.2018<br />\r\nGần 400 học vi&ecirc;n nh&oacute;m tuổi 4-12 tham gia ng&agrave;y 28&amp;29/7 c&ugrave;ng thầy c&ocirc; EVAS.&nbsp;C&aacute;c em chắc chắn sẽ c&oacute; kỷ niệm rất đẹp v&agrave; trải nghiệm ấn tượng kh&ocirc;ng qu&ecirc;n trong m&ugrave;a h&egrave; năm nay c&ugrave;ng thầy c&ocirc; EVAS.&nbsp;Niềm vui nối tiếp niềm vui, cả ng&agrave;y bận rộn c&aacute;c hoạt động gi&aacute;o dục giải tr&iacute;.&nbsp;Mỗi hoạt động rất th&uacute; vị mang đến sự h&agrave;o hứng cho từng bạn nhỏ:<br />\r\nC&ugrave;ng s&aacute;ng tạo &yacute; tưởng trang tr&iacute; trại của m&igrave;nh!<br />\r\nTh&aacute;ch thức v&agrave; kh&aacute;m ph&aacute; những bước nhảy đầu ti&ecirc;n!<br />\r\nKh&aacute;m ph&aacute; những h&igrave;nh ảnh được l&agrave;m từ bong b&oacute;ng!<br />\r\nC&ugrave;ng nhảy v&agrave; h&aacute;t ch&uacute; bee dễ thương chưa k&igrave;a!<br />\r\nC&ugrave;ng t&igrave;m trả lời cho 30 c&acirc;u hỏi th&aacute;ch thức của c&ocirc; April!<br />\r\nChơi vận động c&ugrave;ng thầy c&ocirc; EVAS th&ocirc;i n&agrave;o!<br />\r\n<Thầy c&ocirc; EVAS mang t&acirc;m huyết v&agrave;o chương tr&igrave;nh n&agrave;y để mong c&aacute;c con sẽ c&oacute; kỹ niệm thật đẹp c&ugrave;ng ng&ocirc;i nh&agrave; mang t&ecirc;n EVAS v&agrave; cũng mong đ&acirc;y l&agrave; một trong những trải nghiệm đẹp đ&aacute;ng nhớ nhất thời tuổi thơ của c&aacute;c em!<br />\r\n==============================<br /></p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC00619.jpg\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC00640.jpg\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC00656.jpg\" style=\"height:375px; width:500px\" /></p>\r\n</div>\r\n', 'tin-tuc/DSC00656.jpg', 1, '2020-03-02 03:09:26', '2020-03-02 03:09:26'),
(62, 'LONGXUYEN TOUR 2018 Nhóm Flyers-KET!!!', 'longxuyen-tour-2018-nhom-flyers-ket!!!', 'Chuyến tham quan Long Xuyên cùng cô April đã đem lại cho các bạn teen có một ngày hè đáng nhớ phải không nào???', '\r\n<div class=\"noidung\">\r\n<p>LONGXUYEN TOUR 2018 Nh&oacute;m Flyers-KET!!!<br />\r\nChuyến tham quan Long Xuy&ecirc;n c&ugrave;ng c&ocirc; April đ&atilde; đem lại cho c&aacute;c bạn teen c&oacute; một ng&agrave;y h&egrave; đ&aacute;ng nhớ phải kh&ocirc;ng n&agrave;o??? Nhớ c&acirc;u n&oacute;i &quot; C&ocirc; ơi, biết đi như vầy con kh&ocirc;ng đi đ&acirc;u c&ocirc;. Phải thuyết tr&igrave;nh, phi&ecirc;n dịch, v&agrave; tập l&agrave;m hướng dẫn vi&ecirc;n du lịch nữa.&quot; N&oacute;i vậy đ&oacute;, nhưng cuối ng&agrave;y, vẫn nụ cười rạng rỡ đ&oacute; th&ocirc;i.&nbsp;<br />\r\nC&aacute;c em sau khi được c&ocirc; April th&ocirc;ng tin về c&aacute; sấu th&igrave; tự tin đứng trước nh&oacute;m bạn hướng dẫn về tour Trại c&aacute; sấu;<br />\r\nC&aacute;c gi&uacute;p c&ocirc; thuyết tr&igrave;nh&nbsp;vi&ecirc;n lịch sử về B&aacute;c T&ocirc;n phi&ecirc;n dịch cho c&ocirc; April hiểu phần n&agrave;o về lịch sử Việt Nam;<br />\r\nC&aacute;c em đ&atilde; thuyết tr&igrave;nh văn h&oacute;a &Oacute;c Eo, th&agrave;nh tựu, chiến tranh v&agrave; phong tục sống An Giang tại Viện Bảo T&agrave;ng;<br />\r\nQuan trọng nhất l&agrave;: chỉ một ng&agrave;y th&ocirc;i, nhưng c&aacute;c em học được rất nhiều phải kh&ocirc;ng n&egrave;, kh&ocirc;ng chỉ l&agrave; kỹ năng tiếng Anh, m&agrave; kiến thức lịch sử, th&agrave;nh tựu của qu&ecirc; hương v&agrave; một ng&agrave;y trải nghiệm c&ugrave;ng c&aacute;c bạn!!!<br />\r\n&nbsp;C&ugrave;ng ngắm nh&igrave;n những gi&acirc;y ph&uacute;t học hỏi thật bổ &iacute;ch của em nh&eacute;!</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC01108.jpg\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC00903.jpg\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/DSC00847.jpg\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n</div>\r\n\r\n', 'tin-tuc/DSC01108.jpg', 1, '2020-03-02 03:16:35', '2020-03-02 03:16:35'),
(63, 'QUÀ TRI ÂN CHO HỌC VIÊN CÓ KẾT QUẢ TỐT', 'qua-tri-an-cho-hoc-vien-co-ket-qua-tot', 'Với kết quả vượt trội của các em học viên trong năm qua khi tham gia các kỳ thi lấy chứng chỉ Quốc tế...', '<div class=\"noidung\">\r\n<p><img alt=\"\" src=\"/upload/images/tin-tuc/Zalo_ScreenShot_4_12_2018_1544807.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Với kết quả vượt trội của c&aacute;c em học vi&ecirc;n trong năm qua khi tham gia c&aacute;c kỳ thi lấy chứng chỉ Quốc tế Cambridge, IELTS, TOEIC,... v&agrave; để đ&aacute;p lại niềm tin m&agrave; Qu&yacute; phụ huynh, học vi&ecirc;n đang theo học tại Trung T&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tr&ecirc;n 3 kh&oacute;a li&ecirc;n tục. Hằng năm trung t&acirc;m sẽ c&oacute; phần qu&agrave; đến với từng học vi&ecirc;n nhằm thay cho lời cảm ơn s&acirc;u sắc, ch&acirc;n th&agrave;nh nhất!</p>\r\n\r\n<p>EVAS lu&ocirc;n tạo điều kiện tốt nhất để c&aacute;c bạn c&oacute; thể bay xa</p>\r\n\r\n<p>Để biết th&ecirc;m c&aacute;c chương tr&igrave;nh đ&agrave;o tạo của Trung t&acirc;m li&ecirc;n hệ:<br />\r\nTrụ Sở ch&iacute;nh: Số 815 - 816 H&agrave; Ho&agrave;ng Hổ, TP Long Xuy&ecirc;n, An Giang<br />\r\n- Điện thoại: 02963.941.780 - 941.790<br />\r\nCơ sở 2: 79 Trần Hưng Đạo, P Long Xuy&ecirc;n, An Giang<br />\r\n- Điện thoại: 02963.666.888 - 666.989</p>\r\n</div>\r\n', 'tin-tuc/Zalo_ScreenShot_4_12_2018_1544807.png', 1, '2020-03-02 03:20:19', '2020-03-02 03:20:19'),
(64, 'THÔNG BÁO NGHỈ TẾT DƯƠNG LỊCH 2019', 'thong-bao-nghi-tet-duong-lich-2019', 'Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc trân trọng thông báo: Toàn thể Giáo viên, Nhân viên và Học viên...', '<div class=\"noidung\">\r\n<p><em>Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tr&acirc;n trọng th&ocirc;ng b&aacute;o:</em></p>\r\n\r\n<p><em>To&agrave;n thể Gi&aacute;o vi&ecirc;n, Nh&acirc;n vi&ecirc;n v&agrave; Học vi&ecirc;n đang c&ocirc;ng t&aacute;c v&agrave; học tập tại Trung t&acirc;m&nbsp;sẽ nghỉ lễ Tết Dương Lịch 01 ng&agrave;y: v&agrave;o&nbsp;ng&agrave;y&nbsp;<strong>Thứ Ba : 01/01/2019.</strong></em></p>\r\n\r\n<p><em>Bắt đầu từ ng&agrave;y&nbsp;<strong>Thứ Tư 02/01/2019,</strong>&nbsp;Trung t&acirc;m trở lại hoạt động b&igrave;nh thường.</em></p>\r\n\r\n<p><em>Trong thời gian nghỉ lễ, qu&yacute; kh&aacute;ch h&agrave;ng v&agrave; học vi&ecirc;n c&oacute; bất kỳ y&ecirc;u cầu hoặc cần hỗ trợ, vui l&ograve;ng truy cập website:&nbsp;<a href=\"http://www.gln.edu.vn/\" target=\"_blank\">www.</a><a href=\"http://auvietuc.edu.vn/\" target=\"_blank\">auvietuc.edu.vn</a>&nbsp;hoặc Facebook Trung T&acirc;m Ngoại Ngữ Quốc Tế &Acirc;u Việt &Uacute;c v&agrave; để lại lời nhắn, ch&uacute;ng t&ocirc;i sẽ li&ecirc;n lạc lại với bạn.&nbsp;</em></p>\r\n\r\n<p><em>Xin ch&acirc;n th&agrave;nh cảm ơn v&agrave; ch&uacute;c qu&yacute; kh&aacute;ch h&agrave;ng cũng như c&aacute;c bạn học vi&ecirc;n một kỳ nghỉ ấm &aacute;p v&agrave; năm mới hạnh ph&uacute;c!</em></p>\r\n\r\n<img alt=\"\" src=\"/upload/images/tin-tuc/5JX2P7_Zalo_ScreenShot_4_12_2018_1558373.png\" />\r\n</div>\r\n', 'tin-tuc/5JX2P7_Zalo_ScreenShot_4_12_2018_1558373.png', 1, '2020-03-02 03:27:38', '2020-03-02 03:27:38'),
(65, 'Lễ Phát Bằng Cambridge 2019', 'le-phat-bang-cambridge-2019', 'Hàng năm chúng tôi liên kết với Hội đồng khảo thí Cambridge thuộc Đại Học Cambridge,...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in; text-align:justify\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">H&agrave;ng năm ch&uacute;ng t&ocirc;i li&ecirc;n kết với Hội đồng khảo th&iacute; Cambridge thuộc Đại Học Cambridge, tổ chức thi chứng chỉ cho học vi&ecirc;n theo học tại Trung t&acirc;m ngoại ngữ quốc tế &Acirc;u Việt &Uacute;c. Ch&uacute;ng t&ocirc;i cũng tự tin tự h&agrave;o rằng, đ&acirc;y l&agrave; nh&acirc;n tố g&oacute;p phần th&agrave;nh c&ocirc;ng trong c&ocirc;ng t&aacute;c đ&agrave;o tạo tiếng Anh, khẳng định gi&aacute; trị của Trung t&acirc;m ngoại ngữ quốc tế &Acirc;u Việt &Uacute;c. H&agrave;ng năm ch&uacute;ng t&ocirc;i tổ chức thi cho khoảng ba trăm học vi&ecirc;n, đ&aacute;nh gi&aacute; ch&iacute;nh x&aacute;c khả năng sử dụng ng&ocirc;n ngữ quốc tế của c&aacute;c em, v&agrave; khẳng định chất lượng đ&agrave;o tạo qua tấm bằng quốc tế c&aacute;c em nhận với kết quả gần như tuyệt đối. </span></span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Chứng chỉ Cambridge Starters - Movers - Flyers - KET (A2) - PET (B1). Kh&ocirc;ng chỉ l&agrave; một tấm bảng c&oacute; gi&aacute; trị quốc tế do Hội đồng khảo th&iacute; quốc tế thuộc Đại học Cambridge Vương Quốc Anh cấp. Gi&uacute;p cho phụ huynh thấy r&otilde; sự tiến bộ của con/em m&igrave;nh so với mặt bằng chung của thế giới.</span></span></span></span><span style=\"font-size:10.5pt\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\"> <span style=\"background-color:white\">Tăng sự&nbsp;hứng th&uacute; trong việc học tiếng Anh cho c&aacute;c em. Từ đ&oacute; Trung t&acirc;m sẽ định hướng ch&iacute;nh x&aacute;c trong việc đ&agrave;o tạo v&agrave; r&egrave;n luyện tiếng Anh,trang bị h&agrave;nh trang cho c&aacute;c em trong tương lai khi thi đầu v&agrave;o v&agrave;o c&aacute;c trường chuy&ecirc;n v&agrave; t&igrave;m kiếm học bổng cho c&aacute;c kh&oacute;a học ngắn/d&agrave;i hạn ở nước ngo&agrave;i.</span></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture4.png\" />\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Buổi lễ ph&aacute;t bằng Cambridge năm 2018. Gần ba trăm th&iacute; sinh, trong đ&oacute; đạt kết quả tuyệt đối cho phần thi N&oacute;i. </span></span></span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture5.png\" /><span style=\"font-size:11pt\"> </span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Buổi lễ ph&aacute;t bằng Cambridge năm 2017. </span></span></span></span></span></span></p>\r\n\r\n<p><img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture6.png\" style=\"height:532px; width:800px\" /><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Buổi lễ ph&aacute;t bằng Cambridge năm 2016. </span></span></span></span></span></span></p>\r\n</div>\r\n', 'tin-tuc/Picture4.png', 1, '2020-03-02 03:43:38', '2020-03-02 03:43:38'),
(66, 'Open Day 5/9/2019', 'open-day-592019', 'Ngày 5/9/2019 Trung tâm Ngoại ngữ Quốc tế Âu Việt Úc tổ chức ngay tại Trung tâm ngày Open Day...', '<div class=\"noidung\">\r\n<p><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1d2129\">Ng&agrave;y 5/9/2019 Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c tổ chức ngay tại Trung t&acirc;m ng&agrave;y Open Day để tạo điều kiện cho c&aacute;c em học vi&ecirc;n v&agrave; phụ huynh đăng k&yacute; dễ d&agrave;ng cho c&aacute;c kh&oacute;a học, Khởi động m&ugrave;a tựu trường với lớp học tiếng Anh hiệu quả tại Trung t&acirc;m, c&ugrave;ng thầy c&ocirc; Gi&aacute;o vi&ecirc;n nước ngo&agrave;i th&acirc;n thiện, tận t&igrave;nh, động vi&ecirc;n c&aacute;c bạn giao tiếp, c&ugrave;ng thầy c&ocirc; Việt Nam lu&ocirc;n theo s&aacute;t phụ đạo khi c&aacute;c bạn hỗ trợ.</span></span></span></span><br />\r\n<span style=\"font-size:10.5pt\"><span style=\"font-family:helvetica\"><span style=\"color:#1d2129\"><span style=\"background-color:white\">- Kiểm tra khả năng tiếng Anh với gi&aacute;o vi&ecirc;n nước ngo&agrave;i;</span><br />\r\n<span style=\"background-color:white\">- Tư vấn cải thiện từng kỹ năng tiếng Anh từ gi&aacute;o vi&ecirc;n nước ngo&agrave;i;</span><br />\r\n<span style=\"background-color:white\">- Tham quan lớp học v&agrave; tham khảo gi&aacute;o tr&igrave;nh;</span><br />\r\n<span style=\"background-color:white\">- Kh&aacute;m ph&aacute; c&aacute;c chương tr&igrave;nh ưu đ&atilde;i v&agrave; học ph&iacute; hỗ trợ hấp dẫn cho kh&oacute;a khai giảng th&aacute;ng 9;</span><br />\r\n<span style=\"background-color:white\">- Nhận ngay qu&agrave; tặng từ EVAS;</span><br />\r\n<span style=\"background-color:white\">- C&aacute;c em học vi&ecirc;n trao đổi tiếng Anh v&agrave; thưởng thức snacks v&agrave; drinks c&ugrave;ng thầy Junaid.</span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture7.png\" />\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"font-family:helvetica\">C&aacute;c em học vi&ecirc;n Trung t&acirc;m thảo luận cũng <span style=\"background-color:white\"><span style=\"color:#1d2129\">thầy </span></span>Junaid</span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture8.png\" /> \r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture9.png\" /></div>\r\n', 'tin-tuc/Picture7.png', 1, '2020-03-02 03:47:14', '2020-03-02 03:47:14'),
(67, 'Hội Thảo Quốc Tế Thường Niên 2019', 'hoi-thao-quoc-te-thuong-nien-2019', 'Chúng tôi rất tự hào đã ba năm liên tục chúng tôi thực hiện thành công, hợp tác với các Nhà xuất bản...', '<div class=\"noidung\">\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Ch&uacute;ng t&ocirc;i rất tự h&agrave;o đ&atilde; ba năm li&ecirc;n tục ch&uacute;ng t&ocirc;i thực hiện th&agrave;nh c&ocirc;ng, hợp t&aacute;c với c&aacute;c Nh&agrave; xuất bản h&agrave;ng đầu thế giới về đ&agrave;o tạo kiến thức đổi mới cho nh&acirc;n vi&ecirc;n v&agrave; gi&aacute;o vi&ecirc;n Trung t&acirc;m &Acirc;u Việt &Uacute;c. Đ&acirc;y cũng ch&iacute;nh l&agrave; nh&acirc;n tố quan trọng gi&uacute;p Trung t&acirc;m &Acirc;u Việt &Uacute;c khẳng định chất lượng đ&agrave;o tạo trong những năm qua. Những chuỗi sự kiện ch&uacute;ng t&ocirc;i li&ecirc;n kết với Cambridge, Oxford, Macmillan.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Năm 2017, ch&uacute;ng t&ocirc;i tổ chức th&agrave;nh c&ocirc;ng tại kh&aacute;ch sạn H&ograve;a B&igrave;nh buổi workshop &quot;Macmillan Training Day&quot; do Nh&agrave; xuất bản Macmillan đến từ Anh quốc. Hướng dẫn gi&aacute;o vi&ecirc;n bộ m&ocirc;n Tiếng anh sử dụng gi&aacute;o tr&igrave;nh v&agrave; c&aacute;c phần mềm hỗ trợ giảng dạy bằng c&ocirc;ng nghệ hiện đại. C&aacute;c th&agrave;nh phần tham dự:</span></span></span></span><br />\r\n<span style=\"font-size:10.5pt\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\"><span style=\"background-color:white\">Đại diện Nh&agrave; xuất bản Macmillan</span><br />\r\n<span style=\"background-color:white\">Chuy&ecirc;n gia:</span><br />\r\n<span style=\"background-color:white\">- &Ocirc;ng David Kaye<br />\r\n- B&agrave; Nguyen Bich Phuong<br />\r\nĐại diện Trung t&acirc;m<br />\r\n- Gi&aacute;m đốc Trung t&acirc;m &ndash; B&agrave; La Ngoc Huong<br />\r\n- Giảng vi&ecirc;n Trung t&acirc;m &ndash; &Ocirc;ng Grant Robert Hunter</span></span></span></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture1.png\" />\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">&Ocirc;ng David Kaye đang thực hiện buổi training</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Năm 2018, ch&uacute;ng t&ocirc;i tổ chức th&agrave;nh c&ocirc;ng buổi hội thảo &quot;Oxford Training Day&quot; do Nh&agrave; xuất bản từ Đại học Oxford đến từ Anh. D&agrave;o tạo gi&aacute;o vi&ecirc;n Trung t&acirc;m &Acirc;u Việt &Uacute;c đa dạng h&oacute;a phương ph&aacute;p giảng dạy, t&iacute;ch hợp kỹ thuật c&ocirc;ng nghệ v&agrave;o lớp học v&agrave; mang đến b&agrave;i dạy hiệu quả cho học sinh Trung t&acirc;m, gi&uacute;p thầy c&ocirc; n&acirc;ng cao kỹ năng giảng dạy cam kết chất lương cho học sinh th&acirc;n y&ecirc;u ch&uacute;ng t&ocirc;i.</span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-left:0in; margin-right:0in\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">C&aacute;c th&agrave;nh phần tham dự:</span></span></span></span><br />\r\n<span style=\"font-size:10.5pt\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\"><span style=\"background-color:white\">Đại diện Nh&agrave; xuất bản Oxford</span><br />\r\n<span style=\"background-color:white\">Chuy&ecirc;n gia:</span><br />\r\n<span style=\"background-color:white\">- &Ocirc;ng. Joon Lee<br />\r\nĐại diện Trung t&acirc;m<br />\r\n- Gi&aacute;m đốc Trung t&acirc;m &ndash; B&agrave; La Ngoc Huong<br />\r\n- Giảng vi&ecirc;n Trung t&acirc;m &ndash; </span></span></span></span><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:red\">&Ocirc;ng Neil </span></span></span></span></p>\r\n<img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture2.png\" /><span style=\"font-size:11pt\"><span style=\"font-family:calibri,sans-serif\"><span style=\"font-size:10.5pt\"><span style=\"background-color:white\"><span style=\"font-family:helvetica\"><span style=\"color:#1c1e21\">Năm 2019, ch&uacute;ng t&ocirc;i tiếp tục li&ecirc;n tổ chức th&agrave;nh c&ocirc;ng buổi hội thảo &quot; Macmillan ELT Upgrade Day Advancing Learning in 2019&quot; do Nh&agrave; xuất bản Macmillan đến từ Anh quốc. Thầy c&ocirc; tham dự ng&agrave;y đ&agrave;o tạo gi&aacute;o dục Macmillan. Ngo&agrave;i việc t&iacute;ch lũy c&aacute;c phương ph&aacute;p giảng dạy, gi&aacute;o vi&ecirc;n ch&uacute;ng t&ocirc;i đ&atilde; được đ&agrave;o tạo c&aacute;ch tạo động lực cho học vi&ecirc;n v&agrave; gi&uacute;p học vi&ecirc;n duy tr&igrave; động lực trong c&aacute;c kh&oacute;a học. Với c&aacute;c chiến lược kh&aacute;c nhau được chia sẻ từ buổi đ&agrave;o tạo, những th&aacute;ch thức m&agrave; ch&uacute;ng t&ocirc;i thể gặp phải để th&uacute;c đẩy người học sẽ bị loại bỏ v&agrave; chắc chắn sẵn s&agrave;ng mang đến những b&agrave;i học sinh động để thu h&uacute;t học vi&ecirc;n v&agrave; sự n&acirc;ng cao tr&igrave;nh độ tiếng Anh cho học vi&ecirc;n. Đ&agrave;o tạo bằng t&acirc;m, ch&uacute;ng t&ocirc;i cố gắng mang lại kết quả học tập tốt cho người học để xứng đ&aacute;ng với những g&igrave; phụ huynh v&agrave; học vi&ecirc;n tin tưởng v&agrave;o Trung t&acirc;m.</span></span></span></span></span></span> <img alt=\"\" src=\"http://auvietuc.edu.vn/upload/images/tin-tuc/Picture3.png\" /></div>\r\n', 'tin-tuc/Picture2.png', 1, '2020-03-02 03:52:50', '2020-03-02 03:52:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_categories`
--

CREATE TABLE `npt_categories` (
  `id` int(12) NOT NULL,
  `nameCate` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(12) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `npt_categories`
--

INSERT INTO `npt_categories` (`id`, `nameCate`, `parent_id`, `updated_date`) VALUES
(3, 'Phone', 0, '2016-05-16 21:02:13'),
(4, 'computer', 0, '2016-05-16 21:48:15'),
(5, 'camera', 0, '2016-05-16 21:56:57'),
(6, 'laptop', 0, '2016-05-16 22:00:45'),
(8, 'laptop mới', 6, '2016-05-16 22:37:12'),
(19, 'laptop cũ', 6, '2016-05-17 01:36:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_languages`
--

CREATE TABLE `npt_languages` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL DEFAULT '',
  `description` text,
  `long_date_format` varchar(30) NOT NULL DEFAULT '',
  `short_date_format` varchar(30) NOT NULL DEFAULT '',
  `time_format` varchar(30) NOT NULL DEFAULT '',
  `digital_grouping` varchar(10) NOT NULL DEFAULT '',
  `decimal_symbol` varchar(10) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_languages`
--

INSERT INTO `npt_languages` (`id`, `code`, `description`, `long_date_format`, `short_date_format`, `time_format`, `digital_grouping`, `decimal_symbol`, `icon`, `status`) VALUES
(1, 'vn', 'Tiếng Viêt', 'j F, Y', 'm/d/Y', 'g:i a', ',', '.', 'vn_vi.png', 1),
(2, 'en', 'English', 'j F, Y', 'd/m/Y', 'g:i a', '.', ',', 'en.png', 1),
(3, 'fr', 'French', 'j F, Y', 'd/m/Y', 'g:i a', '.', ',', 'fr.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_layouts`
--

CREATE TABLE `npt_layouts` (
  `id` int(11) NOT NULL,
  `positions_id` int(11) NOT NULL DEFAULT '0',
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `modules_id` int(11) NOT NULL DEFAULT '0',
  `modules_order` int(11) NOT NULL DEFAULT '0',
  `modules_configuration` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_layouts`
--

INSERT INTO `npt_layouts` (`id`, `positions_id`, `pages_id`, `modules_id`, `modules_order`, `modules_configuration`) VALUES
(968, 1, 48, 1, 0, NULL),
(1291, 2, 48, 4, 0, NULL),
(1501, 1, 92, 161, 1, NULL),
(1318, 1, 91, 1, 0, NULL),
(1349, 1, 91, 26, 1, NULL),
(1319, 2, 91, 4, 0, NULL),
(1320, 1, 90, 1, 0, NULL),
(1322, 1, 90, 19, 2, NULL),
(1323, 2, 90, 4, 0, NULL),
(1351, 1, 90, 39, 1, NULL),
(1331, 1, 48, 19, 1, NULL),
(1500, 1, 92, 29, 0, NULL),
(1334, 2, 92, 4, 0, NULL),
(1339, 1, 95, 1, 0, NULL),
(1340, 2, 95, 4, 0, NULL),
(1342, 1, 95, 21, 1, NULL),
(1367, 2, 1, 4, 0, NULL),
(1392, 2, 101, 4, 0, NULL),
(1393, 1, 101, 1, 0, NULL),
(1395, 1, 103, 1, 0, NULL),
(1396, 2, 103, 4, 0, NULL),
(1406, 1, 104, 1, 0, NULL),
(1407, 2, 104, 4, 0, NULL),
(1408, 1, 105, 1, 0, NULL),
(1409, 9, 105, 19, 0, NULL),
(1410, 2, 105, 4, 0, NULL),
(1693, 12, 140, 182, 0, NULL),
(1691, 2, 140, 4, 0, NULL),
(1689, 9, 140, 29, 0, NULL),
(1688, 1, 140, 1, 0, NULL),
(1687, 12, 139, 29, 4, NULL),
(1686, 2, 139, 4, 0, NULL),
(1685, 12, 139, 176, 3, NULL),
(1684, 12, 139, 19, 2, NULL),
(1683, 12, 139, 182, 1, NULL),
(1682, 12, 139, 19, 0, NULL),
(1681, 9, 139, 183, 1, NULL),
(1680, 9, 139, 29, 0, NULL),
(1679, 1, 139, 1, 0, NULL),
(1444, 1, 117, 1, 0, NULL),
(1446, 2, 117, 4, 0, NULL),
(1447, 1, 118, 1, 0, NULL),
(1449, 2, 118, 4, 0, NULL),
(1450, 1, 119, 1, 0, NULL),
(1451, 10, 119, 19, 0, NULL),
(1452, 2, 119, 4, 0, NULL),
(1453, 1, 120, 1, 0, NULL),
(1539, 9, 104, 169, 0, NULL),
(1455, 2, 120, 4, 0, NULL),
(1456, 1, 121, 1, 0, NULL),
(1457, 10, 121, 19, 0, NULL),
(1458, 2, 121, 4, 0, NULL),
(1559, 2, 127, 4, 0, NULL),
(1466, 1, 122, 1, 0, NULL),
(1469, 9, 122, 21, 0, NULL),
(1468, 2, 122, 4, 0, NULL),
(1472, 1, 123, 1, 0, NULL),
(1473, 10, 123, 161, 0, NULL),
(1474, 11, 123, 159, 0, NULL),
(1475, 2, 123, 4, 0, NULL),
(1502, 1, 92, 159, 2, NULL),
(1503, 9, 92, 39, 0, NULL),
(1504, 9, 92, 42, 1, NULL),
(1505, 9, 92, 19, 2, NULL),
(1506, 10, 92, 29, 0, NULL),
(1507, 10, 92, 29, 1, NULL),
(1508, 10, 92, 42, 2, NULL),
(1509, 10, 92, 42, 3, NULL),
(1510, 11, 92, 29, 0, NULL),
(1511, 11, 92, 29, 1, NULL),
(1538, 9, 120, 29, 0, NULL),
(1537, 9, 103, 29, 0, NULL),
(1536, 9, 103, 169, 1, NULL),
(1540, 9, 101, 154, 0, NULL),
(1568, 1, 127, 1, 0, NULL),
(1724, 2, 124, 4, 0, NULL),
(1723, 12, 124, 19, 0, NULL),
(1572, 12, 127, 19, 0, NULL),
(1722, 1, 124, 1, 0, NULL),
(1576, 1, 125, 1, 0, NULL),
(1577, 2, 125, 4, 0, NULL),
(1590, 9, 128, 39, 2, NULL),
(1579, 9, 125, 29, 0, NULL),
(1589, 9, 128, 172, 1, NULL),
(1587, 1, 128, 1, 0, NULL),
(1584, 12, 125, 42, 0, NULL),
(1588, 9, 128, 171, 0, NULL),
(1595, 1, 129, 1, 0, NULL),
(1592, 2, 128, 4, 0, NULL),
(1593, 9, 128, 173, 3, NULL),
(1602, 1, 130, 1, 0, NULL),
(1612, 12, 129, 19, 0, NULL),
(1598, 2, 129, 4, 0, NULL),
(1603, 2, 130, 4, 0, NULL),
(1604, 9, 130, 29, 0, NULL),
(1606, 9, 130, 42, 5, NULL),
(1608, 9, 130, 29, 7, NULL),
(1609, 9, 130, 42, 8, NULL),
(1610, 9, 130, 19, 9, NULL),
(1611, 9, 130, 42, 6, NULL),
(1677, 9, 138, 182, 3, NULL),
(1676, 9, 138, 19, 2, NULL),
(1674, 9, 138, 183, 1, NULL),
(1623, 1, 132, 1, 0, NULL),
(1625, 2, 132, 4, 0, NULL),
(1672, 9, 138, 19, 4, NULL),
(1637, 1, 134, 1, 0, NULL),
(1716, 1, 142, 1, 0, NULL),
(1640, 12, 134, 158, 0, NULL),
(1641, 2, 134, 4, 0, NULL),
(1642, 1, 135, 1, 0, NULL),
(1726, 2, 137, 4, 0, NULL),
(1725, 1, 137, 1, 0, NULL),
(1646, 2, 135, 4, 0, NULL),
(1647, 9, 135, 29, 0, NULL),
(1648, 12, 135, 178, 0, NULL),
(1651, 1, 136, 1, 0, NULL),
(1652, 12, 136, 158, 0, NULL),
(1653, 2, 136, 4, 0, NULL),
(1662, 12, 120, 29, 4, NULL),
(1656, 9, 136, 179, 0, NULL),
(1661, 12, 120, 182, 1, NULL),
(1665, 12, 120, 19, 2, NULL),
(1710, 12, 120, 176, 3, NULL),
(1666, 1, 138, 1, 0, NULL),
(1667, 9, 138, 29, 0, NULL),
(1678, 12, 120, 183, 0, NULL),
(1669, 9, 138, 176, 6, NULL),
(1670, 2, 138, 4, 0, NULL),
(1671, 12, 138, 29, 0, NULL),
(1694, 1, 141, 1, 0, NULL),
(1695, 9, 141, 182, 0, NULL),
(1696, 2, 141, 4, 0, NULL),
(1699, 12, 137, 21, 0, NULL),
(1701, 9, 130, 29, 4, NULL),
(1703, 9, 130, 19, 2, NULL),
(1705, 9, 130, 184, 1, NULL),
(1706, 9, 132, 177, 0, NULL),
(1708, 9, 130, 175, 3, NULL),
(1712, 9, 138, 176, 5, NULL),
(1717, 12, 142, 173, 0, NULL),
(1718, 2, 142, 4, 0, NULL),
(1719, 12, 118, 15, 0, NULL),
(1921, 9, 175, 211, 0, NULL),
(1721, 12, 117, 19, 0, NULL),
(1917, 1, 174, 1, 0, NULL),
(1778, 1, 151, 1, 0, NULL),
(1729, 1, 143, 1, 0, NULL),
(1730, 9, 143, 154, 0, NULL),
(1731, 10, 143, 179, 0, NULL),
(1732, 2, 143, 4, 0, NULL),
(1733, 1, 144, 1, 0, NULL),
(1734, 9, 144, 154, 0, NULL),
(1735, 10, 144, 179, 0, NULL),
(1736, 2, 144, 4, 0, NULL),
(1737, 1, 145, 1, 0, NULL),
(1738, 9, 145, 154, 0, NULL),
(1739, 10, 145, 179, 0, NULL),
(1740, 2, 145, 4, 0, NULL),
(1741, 1, 146, 1, 0, NULL),
(1742, 9, 146, 154, 0, NULL),
(1743, 10, 146, 179, 0, NULL),
(1744, 2, 146, 4, 0, NULL),
(1745, 1, 147, 1, 0, NULL),
(1746, 11, 147, 154, 0, NULL),
(1747, 10, 147, 179, 0, NULL),
(1748, 2, 147, 4, 0, NULL),
(1749, 1, 148, 1, 0, NULL),
(1768, 1, 1, 1, 0, NULL),
(1823, 1, 156, 1, 0, NULL),
(1752, 2, 148, 4, 0, NULL),
(1754, 12, 148, 186, 0, NULL),
(1756, 1, 149, 1, 0, NULL),
(1757, 2, 149, 4, 0, NULL),
(1758, 10, 149, 179, 0, NULL),
(1759, 11, 149, 15, 0, NULL),
(1772, 1, 150, 1, 0, NULL),
(1769, 9, 1, 39, 0, NULL),
(1916, 12, 173, 4, 0, NULL),
(1854, 1, 164, 1, 0, NULL),
(1852, 9, 151, 39, 0, NULL),
(1776, 2, 150, 4, 0, NULL),
(1874, 9, 151, 203, 1, NULL),
(1825, 2, 156, 4, 0, NULL),
(1873, 9, 150, 201, 1, NULL),
(1781, 2, 151, 4, 0, NULL),
(1783, 1, 152, 1, 0, NULL),
(1785, 12, 152, 179, 0, NULL),
(1786, 2, 152, 4, 0, NULL),
(1804, 9, 148, 29, 0, NULL),
(1788, 1, 153, 1, 0, NULL),
(1824, 9, 156, 19, 0, NULL),
(1811, 9, 153, 188, 0, NULL),
(1791, 12, 153, 179, 0, NULL),
(1792, 2, 153, 4, 0, NULL),
(1793, 1, 154, 1, 0, NULL),
(1814, 9, 154, 188, 0, NULL),
(1797, 2, 154, 4, 0, NULL),
(1798, 1, 155, 1, 0, NULL),
(1802, 2, 155, 4, 0, NULL),
(1810, 9, 152, 188, 0, NULL),
(1805, 12, 148, 179, 1, NULL),
(1818, 12, 154, 179, 0, NULL),
(1826, 12, 155, 189, 0, NULL),
(1829, 9, 157, 190, 0, NULL),
(1831, 1, 159, 1, 0, NULL),
(1832, 9, 159, 154, 0, NULL),
(1833, 2, 159, 4, 0, NULL),
(1834, 1, 158, 1, 0, NULL),
(1835, 9, 158, 154, 1, NULL),
(1836, 2, 158, 4, 0, NULL),
(1838, 9, 118, 39, 0, NULL),
(1839, 1, 160, 1, 0, NULL),
(1840, 12, 160, 191, 0, NULL),
(1841, 2, 160, 4, 0, NULL),
(1842, 1, 161, 1, 0, NULL),
(1843, 2, 161, 4, 0, NULL),
(1844, 12, 161, 192, 0, NULL),
(1845, 9, 160, 39, 0, NULL),
(1875, 12, 118, 29, 1, NULL),
(1848, 9, 155, 39, 0, NULL),
(1849, 1, 162, 1, 0, NULL),
(1850, 12, 162, 190, 0, NULL),
(1851, 2, 162, 4, 0, NULL),
(1855, 9, 164, 197, 0, NULL),
(1856, 2, 164, 4, 0, NULL),
(1915, 9, 173, 209, 0, NULL),
(1912, 1, 173, 1, 0, NULL),
(1911, 12, 172, 4, 0, NULL),
(1910, 9, 172, 15, 1, NULL),
(1909, 1, 172, 1, 0, NULL),
(1920, 1, 175, 1, 0, NULL),
(1959, 12, 179, 4, 0, NULL),
(1879, 1, 169, 1, 0, NULL),
(1919, 12, 174, 4, 0, NULL),
(1876, 9, 151, 29, 2, NULL),
(1918, 9, 174, 210, 0, NULL),
(1880, 2, 169, 4, 0, NULL),
(1923, 9, 169, 207, 0, NULL),
(1929, 12, 165, 4, 0, NULL),
(1883, 9, 165, 206, 0, NULL),
(1928, 1, 165, 1, 0, NULL),
(1885, 1, 167, 1, 0, NULL),
(1886, 9, 167, 204, 0, NULL),
(1887, 2, 167, 4, 0, NULL),
(1888, 1, 166, 1, 0, NULL),
(1889, 9, 166, 205, 0, NULL),
(1890, 2, 166, 4, 0, NULL),
(1891, 1, 168, 1, 0, NULL),
(1892, 9, 168, 19, 0, NULL),
(1893, 2, 168, 4, 0, NULL),
(1896, 9, 171, 208, 0, NULL),
(1922, 12, 175, 4, 0, NULL),
(1969, 9, 1, 220, 1, NULL),
(1931, 1, 177, 1, 0, NULL),
(1932, 9, 177, 212, 0, NULL),
(1933, 12, 177, 4, 0, NULL),
(1945, 1, 178, 1, 0, NULL),
(1957, 9, 158, 29, 0, NULL),
(1946, 12, 178, 4, 0, NULL),
(1947, 9, 178, 214, 0, NULL),
(1960, 9, 179, 217, 0, NULL),
(1970, 9, 1, 222, 2, NULL),
(1951, 9, 172, 29, 0, NULL),
(1952, 9, 150, 29, 0, NULL),
(1958, 1, 179, 1, 0, NULL),
(1974, 9, 178, 224, 2, NULL),
(1955, 9, 165, 19, 1, NULL),
(1961, 1, 180, 1, 0, NULL),
(1962, 9, 180, 218, 0, NULL),
(1963, 12, 180, 4, 0, NULL),
(1964, 1, 181, 1, 0, NULL),
(1965, 12, 181, 4, 0, NULL),
(1966, 9, 181, 219, 0, NULL),
(1971, 9, 1, 223, 3, NULL),
(1972, 9, 1, 224, 5, NULL),
(1998, 9, 1, 225, 4, NULL),
(1975, 9, 178, 226, 1, NULL),
(1976, 1, 182, 1, 0, NULL),
(1977, 9, 182, 227, 0, NULL),
(1978, 9, 182, 228, 1, NULL),
(1979, 9, 182, 229, 3, NULL),
(1980, 12, 182, 4, 0, NULL),
(1981, 1, 183, 1, 0, NULL),
(1982, 9, 183, 221, 0, NULL),
(1983, 9, 183, 226, 1, NULL),
(1984, 12, 183, 4, 0, NULL),
(1985, 1, 184, 1, 0, NULL),
(1986, 9, 184, 230, 0, NULL),
(1987, 9, 184, 226, 1, NULL),
(1988, 12, 184, 4, 0, NULL),
(1989, 1, 185, 1, 0, NULL),
(1990, 12, 185, 4, 0, NULL),
(1991, 9, 185, 231, 0, NULL),
(1992, 9, 185, 224, 1, NULL),
(1993, 1, 186, 1, 0, NULL),
(1994, 9, 186, 232, 0, NULL),
(1995, 9, 186, 224, 1, NULL),
(1996, 12, 186, 4, 0, NULL),
(1999, 1, 187, 1, 0, NULL),
(2000, 9, 187, 233, 0, NULL),
(2001, 9, 187, 226, 1, NULL),
(2002, 12, 187, 4, 0, NULL),
(2003, 1, 188, 1, 0, NULL),
(2004, 9, 188, 154, 0, NULL),
(2005, 12, 188, 4, 0, NULL),
(2006, 9, 188, 229, 1, NULL),
(2007, 1, 189, 1, 0, NULL),
(2008, 9, 189, 234, 0, NULL),
(2009, 9, 189, 228, 1, NULL),
(2010, 12, 189, 4, 0, NULL),
(2011, 9, 182, 235, 2, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_layouts_setting`
--

CREATE TABLE `npt_layouts_setting` (
  `id` int(11) NOT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `setting_key` varchar(50) DEFAULT NULL,
  `setting_value` varchar(500) DEFAULT NULL,
  `setting_type` varchar(20) DEFAULT 'TEXT',
  `setting_data` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_layouts_setting`
--

INSERT INTO `npt_layouts_setting` (`id`, `layout_id`, `setting_key`, `setting_value`, `setting_type`, `setting_data`) VALUES
(2121, 1749, 'BANNER_TOP', '', 'FILE', ''),
(2270, 1848, 'LIMIT', '', 'TEXT', ''),
(2269, 1848, 'LIMIT_BANNER', '', 'TEXT', ''),
(2267, 1845, 'CATEGORY', '12', 'BANNER', ''),
(2266, 1845, 'LIMIT', '', 'TEXT', ''),
(2126, 1769, 'LIMIT_BANNER', '', 'TEXT', ''),
(2127, 1769, 'LIMIT', '', 'TEXT', ''),
(2128, 1769, 'CATEGORY', '', 'BANNER', ''),
(2129, 1769, 'TYPE', '1', 'TEXT', ''),
(2239, 1814, 'TYPE', '2', 'TEXT', ''),
(2146, 1785, 'TYPE', '2', 'TEXT', ''),
(2147, 1785, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2148, 1785, 'TYPE', '2', 'TEXT', ''),
(2149, 1785, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2182, 1804, 'BUTTON_TEXT', '', 'TEXT', ''),
(2181, 1804, 'LINK', '', 'TEXT', ''),
(2180, 1804, 'CATEGORY', '', 'BANNER', ''),
(2204, 1810, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2202, 1810, 'TYPE_CATE', '1', 'TEXT', ''),
(2203, 1810, 'TYPE', '1', 'TEXT', ''),
(2158, 1791, 'TYPE', '2', 'TEXT', ''),
(2159, 1791, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2220, 1811, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2219, 1811, 'TYPE', '1', 'TEXT', ''),
(2218, 1811, 'TYPE_CATE', '1', 'TEXT', ''),
(2241, 1818, 'TYPE', '2', 'TEXT', ''),
(2242, 1818, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2201, 1810, 'BANNER_DEFAULT', 'banner/banner-home-01.png', 'FILE', ''),
(2238, 1814, 'TYPE_CATE', '2', 'TEXT', ''),
(2183, 1804, 'TITLE_FOOTER', '', 'TEXT', ''),
(2184, 1804, 'TITLE_SUB', '', 'TEXT', ''),
(2185, 1804, 'TITLE_HEADER', '', 'TEXT', ''),
(2186, 1804, 'BANNER', 'DLFamily3.jpg', 'FILE', ''),
(2187, 1804, 'TYPE', '', 'TEXT', ''),
(2188, 1805, 'TYPE', '2', 'TEXT', ''),
(2189, 1805, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2192, 1754, 'EMBED_VIDEO', 'https://www.youtube.com/embed/RvZ2IQ9Dwsg', 'TEXT', ''),
(2193, 1754, 'CATEGORY', '15', 'BANNER', ''),
(2237, 1814, 'BANNER_DEFAULT', 'khuyen-mai-1.jpg', 'FILE', ''),
(2264, 1826, 'TYPE', '', 'TEXT', ''),
(2263, 1826, 'TYPE_CATE', '', 'TEXT', ''),
(2306, 1838, 'TYPE', '1', 'TEXT', ''),
(2305, 1838, 'CATEGORY', '', 'BANNER', ''),
(2303, 1838, 'LIMIT_BANNER', '', 'TEXT', ''),
(2304, 1838, 'LIMIT', '', 'TEXT', ''),
(2217, 1811, 'BANNER_DEFAULT', 'seahorse-Sent-15.jpg', 'FILE', ''),
(2240, 1814, 'HOW_TO_USE_PAGE_CODE', '', 'TEXT', ''),
(2262, 1826, 'BANNER_DEFAULT', '92469623.jpg', 'FILE', ''),
(2265, 1845, 'LIMIT_BANNER', '', 'TEXT', ''),
(2268, 1845, 'TYPE', '', 'TEXT', ''),
(2271, 1848, 'CATEGORY', '14', 'BANNER', ''),
(2272, 1848, 'TYPE', '', 'TEXT', ''),
(2292, 1852, 'TYPE', '', 'TEXT', ''),
(2291, 1852, 'CATEGORY', '1', 'BANNER', ''),
(2290, 1852, 'LIMIT', '', 'TEXT', ''),
(2289, 1852, 'LIMIT_BANNER', '', 'TEXT', ''),
(2307, 1875, 'ANDROID_LINK', '', 'TEXT', ''),
(2308, 1875, 'IOS_LINK', '', 'TEXT', ''),
(2309, 1875, 'TYPE', '2', 'TEXT', ''),
(2310, 1875, 'BANNER', '', 'FILE', ''),
(2311, 1876, 'ANDROID_LINK', '', 'TEXT', ''),
(2312, 1876, 'IOS_LINK', '', 'TEXT', ''),
(2313, 1876, 'TYPE', '2', 'TEXT', ''),
(2314, 1876, 'BANNER', '', 'FILE', ''),
(2334, 1951, 'ANDROID_LINK', '', 'TEXT', ''),
(2335, 1951, 'IOS_LINK', '', 'TEXT', ''),
(2336, 1951, 'TICKET', '', 'TEXT', ''),
(2337, 1951, 'CUP', '', 'TEXT', ''),
(2338, 1951, 'AWARDS', '', 'TEXT', ''),
(2339, 1951, 'HAPPY', '', 'TEXT', ''),
(2340, 1951, 'TYPE', '', 'TEXT', ''),
(2341, 1951, 'BANNER', 'banner/neolock_hotel.png', 'FILE', ''),
(2342, 1952, 'LINK', '', 'TEXT', ''),
(2343, 1952, 'BANNER', 'banner/neolock_banner.jpg', 'FILE', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_layouts_static_content`
--

CREATE TABLE `npt_layouts_static_content` (
  `id` int(11) NOT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `content` mediumtext,
  `language_id` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_layouts_static_content`
--

INSERT INTO `npt_layouts_static_content` (`id`, `layout_id`, `title`, `image`, `content`, `language_id`) VALUES
(63, 1824, '', '', '<p>Dữ liệu đang cập nhật ...</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_modules`
--

CREATE TABLE `npt_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `default_configuration` text,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_modules`
--

INSERT INTO `npt_modules` (`id`, `name`, `description`, `default_configuration`, `active`) VALUES
(1, 'header', 'Show header module', '', 1),
(4, 'footer', 'Show footer module', '', 1),
(15, 'contact', NULL, '', 1),
(39, 'banner_slider', 'banner_slider', 'banner_slider', 1),
(60, 'home', 'home', '', 1),
(154, 'blog', NULL, NULL, 1),
(179, 'category', NULL, NULL, 1),
(220, 'education_home', NULL, NULL, 1),
(201, 'product', NULL, NULL, 1),
(209, 'sign_in', NULL, NULL, 1),
(214, 'about_us', NULL, NULL, 1),
(218, 'join_us', '', NULL, 1),
(221, 'education', NULL, NULL, 1),
(222, 'philosophy_home', NULL, NULL, 1),
(223, 'blog_home', NULL, NULL, 1),
(224, 'form_register', NULL, NULL, 1),
(225, 'advisory_home', NULL, NULL, 1),
(226, 'philosophy_form', NULL, NULL, 1),
(227, 'base_system', NULL, NULL, 1),
(228, 'team', NULL, NULL, 1),
(229, 'infrastructure', NULL, NULL, 1),
(230, 'study_space', NULL, NULL, 1),
(231, 'communicate_confidently', NULL, NULL, 1),
(232, 'student', NULL, NULL, 1),
(233, 'advisory', NULL, NULL, 1),
(234, 'job', NULL, NULL, 1),
(235, 'team1', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_pages`
--

CREATE TABLE `npt_pages` (
  `id` int(11) NOT NULL,
  `code` char(100) NOT NULL DEFAULT '',
  `html_file` char(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=FIXED;

--
-- Đang đổ dữ liệu cho bảng `npt_pages`
--

INSERT INTO `npt_pages` (`id`, `code`, `html_file`) VALUES
(1, 'home', 'default.tpl'),
(180, 'join-us', 'default.tpl'),
(150, 'products', 'default.tpl'),
(179, 'marketing-service', 'default.tpl'),
(172, 'contact-us', 'default.tpl'),
(178, 'about-us', 'default.tpl'),
(182, 'base-system', 'default.tpl'),
(183, 'education-program', 'default.tpl'),
(184, 'study-space', 'default.tpl'),
(185, 'communicate-confidently', 'default.tpl'),
(186, 'student', 'default.tpl'),
(187, 'study-abroad', 'default.tpl'),
(188, 'blog', 'default.tpl'),
(189, 'job', 'default.tpl');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_pages_attributes`
--

CREATE TABLE `npt_pages_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pages_title` varchar(255) NOT NULL DEFAULT '',
  `pages_description` text,
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_keyword` varchar(350) DEFAULT NULL,
  `seo_description` varchar(350) DEFAULT NULL,
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_pages_attributes`
--

INSERT INTO `npt_pages_attributes` (`id`, `pages_title`, `pages_description`, `seo_title`, `seo_keyword`, `seo_description`, `pages_id`, `languages_id`) VALUES
(198, 'trang-chu', '', '', '', '', 1, 1),
(199, 'home', '', '', '', '', 1, 2),
(273, 'products', '', '', '', '', 150, 1),
(274, 'products', '', '', '', '', 150, 2),
(368, 'marketing-service', '', '', '', '', 179, 1),
(369, 'marketing-service', '', '', '', '', 179, 2),
(371, 'join-us', '', '', '', '', 180, 1),
(372, 'join-us', '', '', '', '', 180, 2),
(347, 'contact', '', '', '', '', 172, 2),
(346, 'contact-us', '', '', '', '', 172, 1),
(365, 'gioi-thieu-evas', 'giới thiệu evas', '', '', '', 178, 1),
(366, 'about-us', '', '', '', '', 178, 2),
(377, 'he-thong-co-so', 'hệ thống cơ sở', '', '', '', 182, 1),
(378, 'base-system', '', '', '', '', 182, 2),
(380, 'chuong-trinh-dao-tao', 'chương trình đào tạo', '', '', '', 183, 1),
(381, 'education-program', '', '', '', '', 183, 2),
(383, 'goc-hoc-tap', 'góc học tập', '', '', '', 184, 1),
(384, 'study-space', '', '', '', '', 184, 2),
(386, 'tu-tin-giao-tiep', 'tự tin giao tiếp', '', '', '', 185, 1),
(387, 'communicate-confidently', '', '', '', '', 185, 2),
(389, 'goc-hoc-vien', 'góc học viên', '', '', '', 186, 1),
(390, 'student', '', '', '', '', 186, 2),
(392, 'tu-van-du-hoc', 'tư vấn du học', '', '', '', 187, 1),
(393, 'study-abroad', '', '', '', '', 187, 2),
(395, 'tin-tuc', 'tin tức', '', '', '', 188, 1),
(396, 'blog', '', '', '', '', 188, 2),
(398, 'tuyen-dung', 'tuyển dụng', '', '', '', 189, 1),
(399, 'job', '', '', '', '', 189, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_positions`
--

CREATE TABLE `npt_positions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `html_file` varchar(255) DEFAULT '',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_positions`
--

INSERT INTO `npt_positions` (`id`, `name`, `description`, `html_file`, `active`) VALUES
(1, 'HEADER', NULL, 'default.tpl', 1),
(2, 'FOOTER', NULL, 'default.tpl', 1),
(9, 'TOP', NULL, 'default.tpl', 1),
(10, 'LEFT', NULL, 'default.tpl', 1),
(11, 'RIGHT', NULL, 'default.tpl', 1),
(12, 'BOTTOM', NULL, 'default.tpl', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_roles`
--

CREATE TABLE `npt_roles` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_roles`
--

INSERT INTO `npt_roles` (`id`, `code`, `description`, `status`) VALUES
(1, 'ROLE_PAGE', 'Quản lý trang', 1),
(2, 'ROLE_USER', 'Quản lý tài khoản và phân quyền', 1),
(3, 'ROLE_SETTING', 'Quản lý cấu hình', 1),
(16, 'ROLE_NEWS_ITEMS', 'Quản lý blog, tin khuyến mãi', 1),
(17, 'ROLE_SERVICE_RESORT_CATEGORIES', 'Danh mục dịch vụ', 1),
(18, 'ROLE_SERVICE_RESORT', 'Dịch vụ chi tiết', 1),
(19, 'ROLE_SERVICE_PROMOTIONS', 'Khuyến mãi dịch vụ', 1),
(20, 'ROLE_SERVICE', 'Dịch vụ', 1),
(21, 'ROLE_PROMOTIONS', 'Khuyến mãi', 1),
(22, 'ROLE_POLICY', 'Policy', 1),
(23, 'ROLE_NEWS_CATEGORIES', 'Danh mục blog, tin khuyến mãi', 1),
(24, 'ROLE_MEMBER', 'Members', 1),
(25, 'ROLE_HOTEL', 'Phòng khách sạn', 1),
(26, 'ROLE_CUSTOMER', 'Khách hàng', 1),
(27, 'ROLE_CONTACT', 'Liên hệ', 1),
(28, 'ROLE_COMMENT', 'Comments', 1),
(29, 'ROLE_BOOKING_CANCEL', 'cancel booking', 1),
(30, 'ROLE_BOOKING_AMEND', 'Amend booking', 1),
(31, 'ROLE_BOOKING', 'Booking', 1),
(32, 'ROLE_BANNER', 'Banner hình ảnh', 1),
(33, 'ROLE_ALLOTMENT', 'Allotments', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_users`
--

CREATE TABLE `npt_users` (
  `id` int(11) NOT NULL,
  `login_name` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(765) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(300) CHARACTER SET latin1 DEFAULT NULL,
  `is_active` int(1) DEFAULT '0',
  `supper_admin` int(1) DEFAULT '0',
  `phone` varchar(105) CHARACTER SET latin1 DEFAULT NULL,
  `fullname` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `position` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `npt_users`
--

INSERT INTO `npt_users` (`id`, `login_name`, `password`, `email`, `is_active`, `supper_admin`, `phone`, `fullname`, `avatar`, `position`) VALUES
(2, 'superadmin', '5612f06a8dcba64c944d125d4d9af002', 'admin@bantayso.com', 1, 1, '656546546', 'admin', 'avatar-big.png', 'CEO &amp; Founder tại Blueky'),
(9, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'ntcnet@gmail.com', 1, 0, '123456789', 'Cong Nguyen', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `npt_website_config`
--

CREATE TABLE `npt_website_config` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(1000) NOT NULL DEFAULT '',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `npt_website_config`
--

INSERT INTO `npt_website_config` (`id`, `key`, `value`, `languages_id`, `code`) VALUES
(1, 'website_name', 'Âu Việt Úc', 1, 'vn'),
(2, 'default_language', 'vn', 1, ''),
(3, 'default_template', 'default', 1, ''),
(4, 'site_keywords', '', 1, 'vn'),
(5, 'admin_default_language', 'vn_vi', 1, 'vn'),
(6, 'admin_default_template', 'default', 2, 'us'),
(7, 'website_name', 'Âu Việt Úc', 2, 'us'),
(8, 'site_email_from_name', 'Âu Việt Úc', 1, 'vn'),
(9, 'site_email_from_name', '', 2, 'us'),
(10, 'site_home_page', 'home', 1, 'vn'),
(11, 'site_logo', 'upload/website/your-picture.gif', 1, 'vn'),
(12, 'site_description', '', 1, 'vn'),
(13, 'site_description', '', 2, 'us'),
(20, 'site_keywords', '', 2, 'us'),
(21, 'mailer', '0', 1, ''),
(22, 'site_email_from', 'myportalvi@myportal.com', 1, 'vn'),
(23, 'site_email_from', 'a', 2, 'us'),
(24, 'send_mail_path', '/usr/sbin/sendmail', 1, ''),
(25, 'smtp_auth', '0', 1, ''),
(26, 'smtp_user', '', 1, ''),
(27, 'smtp_pass', '', 1, ''),
(28, 'smtp_host', 'localhost', 1, ''),
(29, 'default_page_code', 'home', 1, ''),
(30, 'site_footer', '', 1, 'vn'),
(31, 'site_footer', '', 2, 'en');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `opinion`
--

CREATE TABLE `opinion` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `opinion`
--

INSERT INTO `opinion` (`id`, `title`, `name`, `image`, `description`, `status`, `created_at`) VALUES
(4, 'Uy tín', 'Anh NGUYỄN VĂN A (phụ huynh)', 'y-kien/22.jpg', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas error soluta reiciendis quam quasi fugit vero laborum, aut impedit mollitia vitae nesciunt optio sunt in quos ab distinctio perferendis ex.\"', 1, '2020-02-19 07:27:33'),
(5, 'Chất lượng', 'Anh NGUYỄN VĂN B (phụ huynh)', 'y-kien/22.jpg', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas error soluta reiciendis quam quasi fugit vero laborum, aut impedit mollitia vitae nesciunt optio sunt in quos ab distinctio perferendis ex.\"', 1, '2020-02-19 07:27:19'),
(6, 'Tâm huyết', 'Anh NGUYỄN VĂN C (phụ huynh)', 'y-kien/22.jpg', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas error soluta reiciendis quam quasi fugit vero laborum, aut impedit mollitia vitae nesciunt optio sunt in quos ab distinctio perferendis ex.\"', 1, '2020-02-19 07:27:04'),
(7, 'Năng động', 'Anh NGUYỄN VĂN C (phụ huynh)', 'y-kien/22.jpg', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas error soluta reiciendis quam quasi fugit vero laborum, aut impedit mollitia vitae nesciunt optio sunt in quos ab distinctio perferendis ex.\"', 1, '2020-02-19 07:26:49'),
(8, 'Sáng tạo', 'Anh NGUYỄN VĂN D (phụ huynh)', 'y-kien/22.jpg', '\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas error soluta reiciendis quam quasi fugit vero laborum, aut impedit mollitia vitae nesciunt optio sunt in quos ab distinctio perferendis ex.\"', 1, '2020-02-19 07:26:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `philosophy`
--

CREATE TABLE `philosophy` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `philosophy`
--

INSERT INTO `philosophy` (`id`, `title`, `description`, `status`, `created_at`) VALUES
(3, 'Đảm bảo chất lượng đầu ra', 'Our client partners and consultant partners always get the best quality of service and production from 3FORCOM, with the most advanced financial policies.', 1, '2020-02-17 01:26:51'),
(4, '100% môi trường tiếng anh', 'Tạo ra cơ hội tiếp cận, dc dạy và học bằng ngôn ngữ Anh hoàn toàn 100%.', 1, '2020-02-17 01:27:14'),
(5, 'Toàn diện', 'Giúp các bé phát triển kỹ năng về ngôn ngữ cơ bản đến nâng cao và cả kỹ năng mềm trong cuộc sống', 1, '2020-02-17 01:27:29'),
(6, 'IP Protection', 'With dedicated cyber security manpower and partners, your data and applications are in good hand. Our procedure ensures the highest security levels for your concepts, your codes and your databases.', 1, '2020-02-17 01:34:33'),
(7, 'Optimizing', 'In contrary to software corporates, we can bootstrap together with our clients, rather than asking them for too much too early. Our way is to build something fast and big enough, then grow it together with clients and prove the concept.', 1, '2020-02-17 01:35:00'),
(8, 'Real consulting', 'ou ask, we provide several answers, till you decide which one is the most suitable for your capability, time and money. Our experience in programming and managing projects will help you a lot.', 1, '2020-03-02 06:56:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(200) COLLATE utf8_unicode_ci DEFAULT '#',
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `title`, `image`, `description`, `link`, `status`, `created_at`) VALUES
(4, 'Phương Pháp Học Hiểu Quả', 'slider/Slide3.jpg', 'thường xuyên tổ chức các chương trình ngoại khóa ngoài trời giúp các bé thoải mái tiếp thu học hỏi một cách tự nhiên, tạo môi trường tốt nhất để các bé mạnh dạng giao tiếp nhiều hơn...', 'http://auvietuc.edu.vn/tin-tuc', 1, '2020-03-01 16:57:22'),
(5, 'Lễ Tốt Nghiệp Khi Vượt Cấp Độ', 'slider/Slide2.jpg', 'thường xuyên tổ chức các chương trình ngoại khóa ngoài trời giúp các bé thoải mái tiếp thu học hỏi một cách tự nhiên, tạo môi trường tốt nhất để các bé mạnh dạng giao tiếp nhiều hơn...', 'http://auvietuc.edu.vn/tin-tuc', 1, '2020-03-01 16:57:46'),
(6, 'Chương Trình Ngoại Khóa Thường Xuyên', 'slider/Slide1.jpg', 'thường xuyên tổ chức các chương trình ngoại khóa ngoài trời giúp các bé thoải mái tiếp thu học hỏi một cách tự nhiên, tạo môi trường tốt nhất để các bé mạnh dạng giao tiếp nhiều hơn...', 'http://auvietuc.edu.vn/chuong-trinh-dao-tao', 1, '2020-03-01 16:57:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `study_space`
--

CREATE TABLE `study_space` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `detail` longtext COLLATE utf8_unicode_ci,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `study_space`
--

INSERT INTO `study_space` (`id`, `title`, `code`, `description`, `detail`, `image`, `status`, `created_at`) VALUES
(1, 'GRAMMAR', 'grammar', 'Tất cả các điểm ngữ pháp từ cơ bản đến nâng cao đã được tổng hợp. Tài liệu ngữ pháp này sẽ là những tiền đề quý báu để người mất gốc có thể vực dậy vốn tiếng Anh của mình trước khi luyện tập trập trung hơn cho Toeic.\r\n                        ', '<div class=\"container text-justify\">\r\n<h3>1.Parts of Speech</h3>\r\n\r\n<table align=\"center\" border=\"3\" style=\"margin-bottom:30px; margin-top:30px; width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/noun\">NOUN</a></td>\r\n			<td>\r\n			<p>Names word</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Pronouns\">PRONOUN</a></td>\r\n			<td>\r\n			<p>Replaces a noun</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Adjectives\">ADJECTIVE</a></td>\r\n			<td>\r\n			<p>Describes something</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Verbs\">VERB</a></td>\r\n			<td>\r\n			<p>Is an action or state</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/AdVERBS\">ADVERB</a></td>\r\n			<td>\r\n			<p>Describes a verb</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Prepositions\">PREPOSITION</a></td>\r\n			<td>\r\n			<p>Shows relationship</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Conjunctions\">CONJUNCTION</a></td>\r\n			<td>\r\n			<p>Joins words or clauses</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><a class=\"theA\" href=\"gochoctap/grammar/Interjections\">INTERJECTION</a></td>\r\n			<td>\r\n			<p>Express emotions</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>2.Tenses</h3>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT1.png\" /></div>\r\n&nbsp;\r\n\r\n<div style=\"margin-left: 220px; margin-bottom: 30px; font-size: 20pt;\"><a href=\"gochoctap/grammar/TheSimplePresentTense\">The Simple Present Tense</a><br />\r\n<a href=\"gochoctap/grammar/TheSimplePresentContinuousTense\">The Simple Present Continuous Tense</a><br />\r\n<a href=\"gochoctap/grammar/ThePerfectPresentTense\">The Perfect Present Tense</a><br />\r\n<a href=\"gochoctap/grammar/TheSimplePastTense\">The Simple Past Tense</a><br />\r\n<a href=\"gochoctap/grammar/TheSimplePastContinuousTense\">The Simple Past Continuous Tense</a><br />\r\n<a href=\"gochoctap/grammar/ThePerfectPastTense\">The Perfect Past Tense</a><br />\r\n<a href=\"gochoctap/grammar/TheFutureTense\">The Future Tense</a></div>\r\n\r\n<h3>3.The PASSIVE VOICE</h3>\r\n\r\n<table border=\"1\" style=\"margin-bottom:30px; margin-top:30px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<h5>Functions:</h5>\r\n\r\n			<h6>1.It is used when the person/thing performing the action is unimportant or unknown.</h6>\r\n\r\n			<p>e.g. Our car was stolen last night.</p>\r\n\r\n			<h6>2. It is used when it is obvious who/what is performing the action.</h6>\r\n\r\n			<p>e.g. Cameron was sacked last week.</p>\r\n\r\n			<h6>3. It is used to describe factual information, especially when describing a process.</h6>\r\n\r\n			<p>e.g. The lasagna is baked in an oven for 35 minutes at 250 degrees Celsius.</p>\r\n\r\n			<h6>4. It is used in news reports and to give instructions.</h6>\r\n\r\n			<p>e.g. Five people were arrested at a nightclub last night.</p>\r\n\r\n			<p>While it is possible to use this structure in a large variety of tenses in English, it is rare to use the passive in Future Continuous, Present Perfect Continuous, Past Perfect Continuous or Future Perfect Continuous tenses.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h5>Structures:</h5>\r\n			<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT2.png\" />\r\n			<p>I <u>sent Christmas cards</u> to all my friends. (Active)<br />\r\n			<u>Christmas cards</u> were sent to all my friends. (Passive)<br />\r\n			<u>The earthquake destroyed the town</u> last night. (Active)<br />\r\n			<u>The town was destroyed</u> last night. (Passive)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT3.png\" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<h5>Usage of the Passive:<br />\r\n			Only transitive verbs can be changed to passive form.</h5>\r\n\r\n			<ul>\r\n				<li>English is spoken here.</li>\r\n				<li>The accident was happened.</li>\r\n			</ul>\r\n\r\n			<h5>Causative verbs like make, tell and ask are followed by a to-infinitive in passive sentences.</h5>\r\n\r\n			<ul>\r\n				<li>The secretaries were made to work very hard.</li>\r\n				<li>The employees were asked to stop making private phone calls</li>\r\n			</ul>\r\n\r\n			<h5>Perceptual verbs like see, observe, and hear are followed by either a to-infinitive or repeated or habitual actions or an &ndash;ing form for an action in progress in passive sentences.</h5>\r\n\r\n			<ul>\r\n				<li>The intern was observed to tidy his desk every morning (habitual)</li>\r\n				<li>The intern was observed tidying his desk (action in progress)</li>\r\n			</ul>\r\n\r\n			<h5>Phrasal and Prepositional verbs that consist of verb + adverb/preposition are treated as one unit when changed into passive.</h5>\r\n\r\n			<p>No one has marked down prices.<br />\r\n			-&gt; The prices have not been maked down (by anybody).</p>\r\n\r\n			<h5>The officer has taken care of the problem</h5>\r\n\r\n			<p>-&gt; The problem has been taken care of (by the office).</p>\r\n\r\n			<h5>Besides by, the preposition at, with, and in may also be used in passive sentences.</h5>\r\n\r\n			<p><strong>At:</strong> be alarmed at, be surprised at<br />\r\n			<strong>With:</strong> be pleased with, be satisfied with, be covered with, be (pre)occupied with.<br />\r\n			<strong>At or With:</strong> be delighted at/with, be disgusted at/with<br />\r\n			<strong>In:</strong> be interested in, be involved in, be covered in, be engaged in</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>4. Subject Verb Agreement</h3>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT4.png\" /></div>\r\n\r\n<p>The person and number of the subject of the clause determine the person and number of the verb of the clause. This is called subject&ndash;verb agreement or concord:<br />\r\n<u>He hates</u> being in hospital. (third person singular subject + hates)<br />\r\n<s>Not: He hate being</s> &hellip;<br />\r\n<br />\r\nThey don&rsquo;t do enough art at school.<br />\r\n<s>Not: They doesn&rsquo;t do</s> &hellip;</p>\r\n\r\n<h6>Some nouns, describing groups of people, can take a singular or plural verb:</h6>\r\n\r\n<p><u>The audience was</u> silent, waiting. (or <u>The audience were</u> silent &hellip;)<br />\r\n<br />\r\n<u>The government does not</u> encourage investment in industry. (or <u>The government do</u> not encourage &hellip;)</p>\r\n\r\n<h3>5. Infinitive and Gerund</h3>\r\n\r\n<h4><u>What are Gerunds?</u></h4>\r\n\r\n<p>A gerund is a verb in its ing (present participle) form that functions as a noun that names an activity rather than a person or thing. Any action verb can be made into a gerund.</p>\r\n\r\n<h6>Spelling Tip</h6>\r\n\r\n<p>Verbing (Present Participle)</p>\r\n\r\n<ul>\r\n	<li>Add ing to most verbs. Eg. play &gt; playing, cry &gt; crying, bark &gt; barking</li>\r\n	<li>For verbs that end in e, remove the e and add ing. Eg: slide &gt; sliding, ride &gt; riding</li>\r\n	<li>For verbs that end in ie, change the ie to y and add ing. Eg: die &gt; dying, tie &gt; tying</li>\r\n	<li>For a verb whose last syllable is written with a consonant-vowel-consonant and is stressed, double the last letter before adding ing. Eg: beg &gt; begging, begin &gt; beginning. However: enter &gt; entering (last syllable is not stressed)</li>\r\n</ul>\r\n\r\n<h6>Examples</h6>\r\n\r\n<ul>\r\n	<li>Gerunds can appear at <strong>the beginning of a sentence</strong> when used as a subject:<br />\r\n	<u>E.g:</u> Jogging is a hobby of mine.</li>\r\n	<li>Gerunds can act as <strong>an object following the verb</strong>:<br />\r\n	<u>E.g:</u> Daniel quit <u>smoking</u> a year ago.</li>\r\n	<li><strong>Gerunds can serve as an object after a preposition:</strong><br />\r\n	<u>E.g:</u> <strong>I look forward to helping you paint the house.</strong></li>\r\n	<li>Some verbs and verb phrases are directly followed a gerund:<br />\r\n	<u>E.g:</u> Paul avoids using chemicals on the vegetables he grows.</li>\r\n	<li>Some verbs can be followed by a gerund or an infinitive without causing a change in meaning:<br />\r\n	<u>E.g:</u> Some people prefer <u>getting</u> up early in the morning.<br />\r\n	Some people prefer <u>to get</u> up early in the morning</li>\r\n	<li>Some verbs can be followed by a gerund or infinitive but with a change in meaning:<br />\r\n	<u>E.g:</u> <strong>He remembered sending the fax.</strong><br />\r\n	(He remembered the act of send the fax)<br />\r\n	<u>E.g:</u> <strong>He remembered to send the fax. </strong><br />\r\n	(He remembered the fax and sent it.)</li>\r\n</ul>\r\n\r\n<h4><u>What are Infinitives?</u></h4>\r\n\r\n<p>An infinitive is a verb form that acts as other parts of speech in a sentence. It is formed with to + base form of the verb. E.g: to buy, to work.</p>\r\n\r\n<h6>Examples</h6>\r\n\r\n<ul>\r\n	<li>Infinitives can be used as <strong>an object following the verb:</strong><br />\r\n	<u>E.g:</u> Jim always forgets <u>to eat</u></li>\r\n	<li>Infinitives can be used as <strong>a subject at the beginning of a sentence:</strong><br />\r\n	<u>E.g:</u> <u>To travel</u> around the world requires a lot of time and money.</li>\r\n	<li>Infinitives can be used as <strong>an adverb modifying a verb:</strong><br />\r\n	<u>E.g:</u>You promised <u>to buy</u> me a diamond ring.</li>\r\n	<li>Infinitives can be used as <strong>an adjective modifying a noun:</strong><br />\r\n	<u>E.g:</u> Tara has the ability <strong>to succeed.</strong></li>\r\n	<li>Some verbs are directly followed by an infinitive:<br />\r\n	<u>E.g:</u> Do you <u>want to call</u> your family now?</li>\r\n	<li>Some verbs are directly followed by a noun or pronoun and then by an infinitive<br />\r\n	<u>E.g:</u>I convinced Catherine <u>to become</u> vegetarian<br />\r\n	He advised me <u>to sell</u> all my shares of stock.</li>\r\n	<li>Some verbs can be followed by an infinitive or a gerund <strong>without causing a change</strong> in meaning:<br />\r\n	<u>E.g:</u>Will you continue <u>working after</u> you give birth?<br />\r\n	<u>E.g:</u>Will you continue <u>to work after</u> you give birth?</li>\r\n	<li>Some verbs can be followed by an infinitive or a gerund but with a change in meaning:<br />\r\n	<u>E.g:</u>He <u>stopped</u> drinking coffee. (He never drank coffee again.)<br />\r\n	<u>E.g:</u>He <u>stopped</u> to drink coffee. (He stopped what he was doing and drank some coffee.)</li>\r\n</ul>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT5.png\" /></div>\r\n\r\n<div style=\"margin-top: 50px; margin-bottom: 50px;\"><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT6.png\" /></div>\r\n\r\n<h3>6. Relative Clauses</h3>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT7.png\" /></div>\r\n\r\n<div style=\"margin-top: 50px; margin-bottom: 20px;\"><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT8.png\" /></div>\r\n\r\n<p><strong>Relative pronouns: who</strong> refer to people, and sometimes to pet animals. We use it to introduce defining and non-defining relative clauses:<br />\r\nI think there&rsquo;d be a lot of <u>children</u> <strong>who&rsquo;d</strong> love to have a climbing wall in school. (defining)<br />\r\nThat&rsquo;s <u>the dog</u><strong> who</strong> doesn&rsquo;t like me. (defining; referring to a pet animal)<br />\r\nThere&rsquo;s <u>this guy at work</u>, <strong>who&rsquo;s</strong> one of my friends, well he&rsquo;s never been on a train. (non-defining)<br />\r\n<strong>Who can act as the subject or the object of the relative clause:</strong><br />\r\nShe&rsquo;s going out with <u>a bloke</u> <strong>who&rsquo;s</strong> in the army. (who refers to a bloke and is the subject of is in the relative clause; bloke is an informal word for a man)<br />\r\n<u>The woman</u> <strong>who</strong> I saw yesterday was Sheila. (who refers to the woman and is the object of saw in the relative clause)<br />\r\n<strong>We can use who as the complement of a preposition:</strong><br />\r\nIt was <u>Cath</u> <strong>who</strong> Ian gave the keys to. It wasn&rsquo;t me. (who refers to Cath and is the complement of the preposition to)<br />\r\n<strong>We put the preposition at the end of the relative clause, and not immediately before who:</strong><br />\r\nOf all my friends, she&rsquo;s <u>the one</u> <strong>who</strong> I know I can rely on.<br />\r\nNot: &hellip; <s>the one on who I know I can rely.</s><br />\r\nWe often use who with collective human nouns<br />\r\n(e.g. committee, government, group, panel, police, team):<br />\r\nNicola phoned <u>the fire brigade</u>, <strong>who</strong> then alerted the police and social workers.<br />\r\nWe do not use who for things:<br />\r\nThere are <u>some very good art books</u> <strong>which</strong> you can get ideas from.<br />\r\nNot: <s>There are some very good art books who you can get ideas from.</s><br />\r\n<br />\r\n<strong>Relative pronouns: whom</strong> use whom in formal styles or in writing to refer to people when the person is the object of the verb. It is much more common in writing than in speaking:<br />\r\nThe response of those <u>managers</u> <strong>whom</strong> I have consulted has been very positive and we are looking forward to meeting together.<br />\r\nThe first book was a terrible historical novel for children which was turned down by <u>every publisher</u> <strong> to whom</strong> it was sent. (whom refers to every publisher and is the complement of the preposition to)<br />\r\nDrama in schools is particularly good for <u>pupils</u> <strong>for whom</strong> English is a second language.<br />\r\n<strong>We put the preposition before whom.</strong><br />\r\n<br />\r\n<strong>Relative pronoun: whose</strong> as a relative pronoun to indicate possession by people and animals. In more formal styles we can also use it for things.<br />\r\nWe use whose <strong>before nouns instead of a possessive expression </strong>(my, your, his, her, its, our, their, x&rsquo;s) in defining and non-defining clauses:<br />\r\nHe&rsquo;s marrying <u>a girl</u> <strong>whose</strong> family don&rsquo;t seem to like him. (The family of the girl he&rsquo;s marrying don&rsquo;t seem to like him.)<br />\r\nThere was me and there was <u>Kate</u>,<strong> whose</strong> party it was, and then there were two other people. (It was Kate&rsquo;s party.)<br />\r\nIt is a rambling Tudor <u>house</u>, <strong>whose</strong> sitting room looks out over a wonderful walled garden. (The sitting room of the house looks out over &hellip;)<br />\r\nWe can use whose + noun as the complement of a preposition:<br />\r\n<u>Kate</u>, <strong>whose</strong> sister I used to shared a house with, has gone to work in Australia. (whose sister refers to Kate and is the complement of with)<br />\r\nWe can put the preposition immediately before the relative pronoun (more formal written styles) or at the end of the relative clause (more informal).<br />\r\n<strong>Relative pronouns: which</strong> refer to animals and to things. We use it to introduce defining and non-defining relative clauses. We always use which to introduce relative clauses when they refer to a whole sentence or clause:<br />\r\n- You need to tick <u>the box</u> <strong>which</strong> says yes. (defining)<br />\r\n- He won&rsquo;t have much time to prepare for <u>the meeting</u>, <strong>which</strong> is this afternoon. (non-defining)<br />\r\n- <u>She had to get up and walk all the way to the other side of the room</u>, <strong>which</strong> isn&rsquo;t easy with a bad back. (which refers to the whole sentence before it)<br />\r\n<strong>We use which or that, not what:</strong><br />\r\n- Another <u>activity</u> <strong>which/that</strong> I have chosen is photography.<br />\r\nNot: <s>Another activity what I have chosen is photography.</s><br />\r\n<strong>Which can act as the subject or the object of the relative clause:</strong><br />\r\n- <u>The new sports complex</u>, <strong>which</strong> will be built on the site of the old power station, will provide facilities for cricket, soccer, bowls and badminton. (which refers to the new sports complex and is the subject of will be built in the relative clause)<br />\r\n- It was <u>the same picture</u> <strong>which</strong> I saw at the National Gallery. (which refers to the same picture and is the object of saw in the relative clause)<br />\r\n<strong>We can use which as the complement of a preposition:</strong><br />\r\n- Early in the Autumn Term there is <u>a reception</u> <strong>at which</strong> you can meet current staff and students.(which refers to a reception and is the complement of at)<br />\r\n- Close by, in the churchyard, is <u>the famous Rudston stone</u>, <strong>from which</strong> the village takes its name.(which refers to the famous Rudston stone and is the complement of from)<br />\r\n<strong>We can put the preposition immediately before the relative pronoun (more formal) or at the end of the relative clause (more informal).</strong><br />\r\nRelative clauses referring to a whole sentence are always introduced by which:<br />\r\n- <u>There&rsquo;s going to be a new headteacher in September</u>, <strong>which</strong> is good. It&rsquo;s time for a change.<br />\r\n<br />\r\n<strong>Relative pronouns: that</strong> use that instead of who, whom or which in relative clauses to refer to people, animals and things. We use it to introduce defining clauses only. That is more informal than who, whom or which:<br />\r\n- We met <u>somebody</u> last night <strong>that</strong> did the speech therapy course two years after you. (refers to a person)<br />\r\n- The 8.30 is <u>the train</u> <strong>that</strong> you need to get. (refers to a thing)<br />\r\n- She blamed herself for <u>everything</u> <strong>that</strong> had happened.<br />\r\nThat can act as the subject or the object of the relative clause:<br />\r\n- He finally remembers one lesson <strong>that</strong> his mum had taught him early &ndash; Don&rsquo;t take <u>money</u> <strong>that</strong> doesn&rsquo;t belong to you. (that refers to money and is the subject of belong in the relative clause)<br />\r\n- It&rsquo;s <u>the same cooker</u> <strong>that</strong> my mother has. (that refers to the same cooker and is the object of has in the relative clause)<br />\r\nWe often use that after superlatives:<br />\r\n- The Wimbledon men&rsquo;s final was <u>the best game of tennis</u> <strong>that</strong> I&rsquo;ve ever seen. That can refer to the complement of a preposition:<br />\r\n- We&rsquo;ve got <u>some tennis balls</u> <strong>that</strong> you can play <strong>with</strong>. (that refers to some tennis balls and is the complement of the preposition with)<br />\r\n<strong>Notice:</strong><br />\r\nUnlike which, whom and whose, we can&rsquo;t use that with the preposition immediately before it:<br />\r\nNot: <s>We&rsquo;ve got some tennis balls with that you can play.</s><br />\r\n<br />\r\n<strong>Relative pronouns: when, where and why</strong> use where, when or why to introduce defining relative clauses instead of at which, on which or for which.</p>\r\n&nbsp;\r\n\r\n<table align=\"center\" border=\"1\" style=\"margin-bottom:30px; margin-top:30px; width:75%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>where</td>\r\n			<td>places</td>\r\n			<td>I know a restaurant where the food is excellent.<br />\r\n			(&hellip; a restaurant at which the food is excellent)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>when</td>\r\n			<td>times</td>\r\n			<td>There isn&rsquo;t a day when I don&rsquo;t feel rushed off my feet.<br />\r\n			(&hellip; a day on which I don&rsquo;t feel rushed &hellip;)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>why</td>\r\n			<td>reasons</td>\r\n			<td>Do you know the reason why the shop is closed today?<br />\r\n			(&hellip; the reason for which the shop is closed &hellip;)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<strong>Relative pronouns: typical errors</strong> &bull; We can&rsquo;t use that instead of who, whom or which in non-defining relative clauses:<br />\r\n- It gives me a good chance to improve my Italian,<strong> which</strong> has become a little bit rusty.<br />\r\nNot: <s>It gives me a good chance to improve my Italian, that has become a little bit rusty.</s><br />\r\n&bull; We don&rsquo;t use what as a relative pronoun:<br />\r\n- So, he can make himself easily understood in the two languages,<strong> which</strong> helps a lot.<br />\r\nNot: <s>So, he can make himself easily understood in the two languages, what helps a lot.</s><br />\r\n&bull; We don&rsquo;t use who for things:<br />\r\n- She&rsquo;s written some great cookery books<strong> which</strong> have got pictures of delicious-looking recipes.<br />\r\nNot: <s>She&rsquo;s written some great cookery books who have got pictures of delicious-looking recipes.</s><br />\r\n&bull; Take care to spell which correctly: not &lsquo;wich&rsquo;.\r\n<h3>7. Comparatives and Superlatives</h3>\r\n\r\n<div style=\"margin: 20px;\"><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT9.png\" /></div>\r\n\r\n<h4>Comparative and superlative adjectives</h4>\r\n\r\n<h6>Comparative adjectives</h6>\r\n\r\n<p>Comparative adjectives compare one person or thing with another and enable us to say whether a person or thing has more or less of a particular quality:<br />\r\n- Josh is <strong>taller than</strong> his sister.<br />\r\n- I&rsquo;m <strong>more interested</strong> in music <strong>than</strong> sport.<br />\r\n- Big cars that use a lot of petrol are <strong>less popular</strong> now <strong>than</strong> twenty years ago.</p>\r\n\r\n<h6>Superlative adjectives</h6>\r\n\r\n<p>Superlative adjectives describe one person or thing as having more of a quality than all other people or things in a group:<br />\r\n- The &lsquo;Silver Arrow&rsquo; will be <strong>the fastest train</strong> in the world when it is built.<br />\r\n- <strong>The most frightening film</strong> I&rsquo;ve ever seen was Alfred Hitchcock&rsquo;s &lsquo;Psycho&rsquo;.<br />\r\n- What is <strong>the least expensive way</strong> of travelling in Japan?</p>\r\n\r\n<h6>Comparative or superlative?</h6>\r\n\r\n<p>A comparative compares a person or thing with another person or thing. A superlative compares a person or thing with the whole group of which that person or thing is a member:<br />\r\nJoe&rsquo;s <strong>older</strong> than Mike. (comparing one person with another)<br />\r\nSheila is <strong>the youngest</strong> girl in the family. (comparing one person with the whole group she belongs to)</p>\r\n\r\n<h4>Comparative and superlative adjectives: form</h4>\r\n\r\n<h6>One-syllable adjectives (big, cold, hot, long, nice, old, tall)</h6>\r\n\r\n<p>To form the comparative, we <strong>use the -er suffix</strong> with adjectives of <strong>one syllable:</strong><br />\r\n- It&rsquo;s <strong>colder</strong> today than yesterday.<br />\r\n- It was a <strong>longer</strong> holiday than the one we had last year.<br />\r\nTo form the superlative, we <strong>use the -est suffix</strong> with adjectives of <strong>one syllable</strong>. We normally use thebefore a superlative adjective:<br />\r\n- I think that&rsquo;s the <strong>biggest</strong> apple I&rsquo;ve ever seen!<br />\r\n- They have three boys. Richard is the <strong>oldest</strong> and Simon is <strong>the youngest</strong>.</p>\r\n\r\n<h4>One-syllable adjectives which are irregular</h4>\r\n\r\n<p>Some one-syllable adjectives have irregular comparative and superlative forms:<br />\r\n1. bad, worse, worst far, farther/further, farthest/furthest<br />\r\n2. good, better, best old, older/elder, oldest/eldest<br />\r\n- The morning flight is <strong>better</strong> than the afternoon one.<br />\r\n- His <strong>elder</strong> sister works for the government.<br />\r\n- Olivia is Denise&rsquo;s <strong>best</strong> friend.<br />\r\n- I think that was the <strong>worst</strong> film I&rsquo;ve ever seen!<br />\r\n- Pluto is <strong>the furthest</strong> planet from the sun in our solar system.</p>\r\n\r\n<h6>Two-syllable adjectives</h6>\r\n\r\n<p>Two-syllable adjectives ending in -y change y to i and take the -er and -est endings:</p>\r\n\r\n<table align=\"center\" border=\"3\" style=\"margin-bottom:30px; margin-top:30px; width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>bus<strong>y</strong>, bus<strong>ier</strong>, bus<strong>iest</strong></p>\r\n			</td>\r\n			<td>\r\n			<p>happ<strong>y</strong>, happ<strong>ier</strong>, happ<strong>iest</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>eas<strong>y</strong>, eas<strong>ier</strong>, eas<strong>iest</strong></p>\r\n			</td>\r\n			<td>\r\n			<p>funn<strong>y</strong>, funn<strong>ier</strong>, funn<strong>iest</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>We were <strong>busie</strong>r last week than this week.<br />\r\nAre you <strong>happier</strong> now that you&rsquo;ve changed your job?<br />\r\nThat was <strong>the easiest</strong> exam I&rsquo;ve ever taken.<br />\r\nSome other two-syllable adjectives (especially those ending in an unstressed vowel sound) can also take the -er and -est endings:</p>\r\n\r\n<table align=\"center\" border=\"3\" style=\"margin-bottom:30px; margin-top:30px; width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>clever, clever<strong>er</strong>, clever<strong>est</strong></p>\r\n			</td>\r\n			<td>\r\n			<p>quiet, quiet<strong>er</strong>, quiet<strong>est</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>narrow, narrow<strong>er</strong>, narrow<strong>est</strong></p>\r\n			</td>\r\n			<td>\r\n			<p>simple, simpl<strong>er</strong>, simpl<strong>est</strong></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>I&rsquo;ve always thought that Donald was <strong>cleverer</strong> than his brother.<br />\r\nThis new bed is <strong>narrower</strong> than the old one.<br />\r\nThe guest bedroom is <strong>the quietest</strong> room in the house because it overlooks the garden.<br />\r\nWe don&rsquo;t normally use the -er and -est endings with two-syllable adjectives ending in -ful. Instead, we use more and most/least:<br />\r\nThis dictionary is <strong>more useful</strong> than the one we had before.<br />\r\nNot: <s>This dictionary is usefuller</s> &hellip;<br />\r\nYou&rsquo;ll have to try to be <strong>more careful</strong> in future.<br />\r\n<strong>The most useful</strong> tool in the kitchen is a good sharp knife.<br />\r\nNot: <s>The usefulest tool in the kitchen</s> &hellip;<br />\r\nThis is <strong>the least harmful</strong> chemical in terms of the environment.</p>\r\n\r\n<h6>Longer adjectives</h6>\r\nAdjectives of three or more syllables form the comparative with more/less and the superlative with most/least:\r\n\r\n<p>The second lecture was <strong>more interesting</strong> than the first.<br />\r\nNot: <s>The second lecture was interestinger</s> &hellip;<br />\r\nThat way of calculating the figures seems <strong>less complicated</strong> to me.<br />\r\nLondon is <strong>the most popular</strong> tourist destination in England.<br />\r\nNot: <s>London is the popularest</s> &hellip;<br />\r\nIf you are going as a group, <strong>the least expensive</strong> option is to rent an apartment or villa.</p>\r\n\r\n<h4>Comparative adjectives: using much, a lot, far, etc.</h4>\r\n\r\n<p>We can strengthen or emphasise a comparative adjective using words such as much, a lot, far, even or rather, or by using than ever after the adjective:<br />\r\nThis food is <strong>much bette</strong>r than the food we had yesterday.<br />\r\nThe town is <strong>a lot more crowded</strong> these days because of the new shopping centre.<br />\r\nAlex is <strong>far less intelligent</strong> than the other kids in the class.<br />\r\nWe&rsquo;ve been <strong>busier than ever</strong> at work this last month or so.<br />\r\nWe can soften a comparative adjective using a little or a bit. A bit is less formal:<br />\r\nShe feels <strong>a little more confident</strong> now that she&rsquo;s given her first public performance.<br />\r\nor She feels <strong>a bit more confident</strong> &hellip; (less formal)</p>\r\n\r\n<h4>Comparative adjectives: using than</h4>\r\n\r\n<p>We use than when we mention the second person or thing in the comparison. If the second person mentioned takes the form of a personal pronoun, we normally use the object form of the pronoun (me, you, him, her, us, them):<br />\r\nCould you carry this? You&rsquo;re stronger <strong>than me</strong>.<br />\r\nNot: <s>You&rsquo;re stronger than I</s>.<br />\r\nWhy did you choose Robert? Marie is more experienced <strong>than him</strong>.<br />\r\nIn more formal situations, instead of than + object pronoun, we can use than + subject pronoun + be:<br />\r\nYou managed to answer the ten questions correctly? Well, you&rsquo;re definitely cleverer <strong>than I am!</strong><br />\r\nI preferred Henrietta to Dennis. She was always more sociable <strong>than he was</strong>.</p>\r\n\r\n<h4>Comparative adjectives: -er and -er, more and more</h4>\r\n\r\n<p>To talk about how a person or thing is changing and gaining more of a particular quality, we can use two -er form adjectives connected by and, or we can use more and more before an adjective. We don&rsquo;t follow such comparisons with than:<br />\r\nThe weather is getting <strong>hotter and hotter</strong>.<br />\r\nI&rsquo;m getting <strong>more and more interested</strong> in conservation these days.</p>\r\n\r\n<h4>Comparative adjectives: the -er, the -er and the more &hellip;, the more &hellip;</h4>\r\n\r\n<p>If a person or things gains more of a particular quality and this causes a parallel increase of another quality, we can repeat the + a comparative adjective:<br />\r\n<strong>The colder</strong> it is, <strong>the hungrier</strong> I get. (as the weather gets colder, I get hungrier)<br />\r\n<strong>The more generous</strong> you are towards others, <strong>the more generous</strong> they are likely to be towards you.</p>\r\n\r\n<h4>Reduced forms after comparatives</h4>\r\n\r\n<p>After than, we often don&rsquo;t repeat subject pronouns with impersonal subjects, or auxiliary verbs with passive voice verbs:<br />\r\nThe exam results were <strong>better than predicted</strong>. (preferred to &hellip; better than people predicted.)<br />\r\nTemperatures that summer were <strong>higher than previously recorded</strong>. (preferred to &hellip; than were previously recorded.)</p>\r\n\r\n<h4>Less and not as/not so with comparatives</h4>\r\n\r\n<p>We use less with longer adjectives (interesting, beautiful, complicated), but we don&rsquo;t normally use lesswith short adjectives of one syllable (big, good, high, small). Instead we use not as &hellip; as &hellip;, or not so &hellip; as &hellip; Not as is more common than not so:<br />\r\nThe second method was <strong>less complicated than</strong> the first one.<br />\r\nThis new laptop is <strong>not as fast as</strong> my old one. I&rsquo;m sorry I bought it now. (preferred to is less fast than my old one.)</p>\r\n\r\n<h4>Prepositions after superlative adjectives</h4>\r\n\r\n<p>We don&rsquo;t normally use of before a singular name of a place or group after a superlative adjective:<br />\r\nThe castle is <strong>the oldest</strong> building in the city.<br />\r\nNot: <s>The castle is the oldest building of the city</s> &hellip;<br />\r\nShe&rsquo;s the <strong>youngest</strong> musician in the orchestra.<br />\r\nHowever, we can use of with a plural word referring to a group:<br />\r\nAll the sisters are pretty, but Sarah&rsquo;s <strong>the prettiest</strong> of them all.</p>\r\n\r\n<h4>The with superlative adjectives</h4>\r\n\r\n<p>When a superlative adjective is followed by a noun, we normally use the:<br />\r\nThis is <strong>the best meal</strong> I&rsquo;ve had for a long time.<br />\r\nNot: <s>This is best meal</s> &hellip;<br />\r\nIn informal situations, we can often omit the after a linking verb (be, seem) or a verb of the senses (look, taste) if there is no noun:<br />\r\n[talking about sweaters in a shop]<br />\r\nThey&rsquo;ve got them in red, green or grey. Which looks <strong>best</strong>?<br />\r\nIf you want to get a message to Peter, email is <strong>quickest</strong>. He never answers the phone.</p>\r\n\r\n<h4>Other determiners with superlative adjectives</h4>\r\n\r\n<p>Before a superlative adjective, we can use a possessive determiner (my, his, their), or the + a number (two, three, first, second), or a possessive determiner + a number:<br />\r\n<strong>My worst</strong> score ever in an exam was zero. I just couldn&rsquo;t answer any of the questions.<br />\r\nBirmingham is the <strong>second biggest</strong> city in England.<br />\r\n<strong>His two best</strong> friends organised a surprise party for him on his fortieth birthday.</p>\r\n\r\n<h4>Emphasising superlative adjectives</h4>\r\n\r\n<p>We can make a superlative adjective stronger with by far, easily or of all:<br />\r\nThe Beatles were <strong>by far the most successful</strong> rock band of the 1960s.<br />\r\nThis method is <strong>by far the least complicated</strong>.<br />\r\nShe&rsquo;s <strong>easily the best</strong> dancer in the group. No one is as elegant as her.<br />\r\nThere were a number of excellent poems entered for the competition, but <strong>the best</strong> poem <strong>of all</strong> was written by a ten-year-old boy.<br />\r\nIn more formal situations, we can use quite:<br />\r\nThis is <strong>quite the most irresponsible</strong> behaviour I have ever seen.</p>\r\n\r\n<h4>To-infinitives after superlative adjectives</h4>\r\n\r\n<p>We can use a to-infinitive after a superlative adjective, with a meaning similar to a relative clause with who, which or that:<br />\r\nWho was <strong>the oldest</strong> person <strong>to compete</strong> in the London Marathon of 2008? (Who was the oldest person who competed &hellip;?)<br />\r\nThe Golden Swan was <strong>the largest</strong> sailing-ship ever <strong>to be used</strong> in battle.<br />\r\n<strong>See also:</strong><br />\r\n&bull; Relative clauses</p>\r\n\r\n<h4>Comparative adjectives: typical errors</h4>\r\n\r\n<p>&bull; A comparative adjective is followed by than, not that or as:<br />\r\nThe next hotel we tried was <strong>more expensive than</strong> the first one.<br />\r\nNot: &hellip; <s>more expensive that the first one</s> &hellip; or &hellip;<s>more expensive as the first one</s> &hellip;<br />\r\n&bull; After a superlative adjective, we don&rsquo;t normally use of before a singular name of a place or group:<br />\r\nShe was <strong>the tallest</strong> girl in the team.<br />\r\nNot: <s>She was the tallest girl of the team</s>.<br />\r\n&bull; We use the superlative, not the comparative, when we compare more than two people or things:<br />\r\nWhich is the city&rsquo;s <strong>biggest</strong> hotel?<br />\r\nNot: &hellip; <s>bigger hotel</s></p>\r\n\r\n<h4>Adverbs: comparative and superlative forms</h4>\r\n\r\n<p>Adverbs do not normally change in form, but a few have comparative and superlative forms. These are usually short adverbs and so they normally have comparative and superlative forms with -er and -est.<br />\r\nSome of the most common comparative and superlative adverbs are:</p>\r\n\r\n<table align=\"center\" border=\"3\" style=\"margin-bottom:30px; margin-top:30px; width:700px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>soon sooner soonest</p>\r\n			</td>\r\n			<td>\r\n			<p>fast faster fastest</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>hard harder hardest</p>\r\n			</td>\r\n			<td>\r\n			<p>near nearer nearest</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>early earlier earliest</p>\r\n			</td>\r\n			<td>\r\n			<p>far farther/further farthest/furthest</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>late later latest</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Teachers always say that students must work <strong>harder</strong>.<br />\r\nThe kids were playing in the garden, seeing who could jump <strong>highest</strong>.<br />\r\n<strong>Warning</strong>:<br />\r\nWe don&rsquo;t use more or most together with an -er or -est ending:<br />\r\nChildren learn things <strong>faster</strong> than adults.<br />\r\nNot: &hellip; <s>more faster than adults</s>.<br />\r\nWho ran <strong>slowest</strong> in the race?<br />\r\nNot: <s>Who ran most slowest</s></p>\r\n\r\n<h4>Adverbs with more and most</h4>\r\n\r\n<p>Adverbs with two or more syllables form the comparative and superlative with more and most:<br />\r\nWe need to treat the environment <strong>more carefully</strong>.<br />\r\nIt was <strong>the most beautifully</strong> designed chair.</p>\r\n\r\n<h4>Comparative adverbs: using than</h4>\r\n\r\n<p>When we mention the second person or thing in the comparison, we use than. We do not use that or as. If the second person mentioned takes the form of a personal pronoun, we normally use the object form of the pronoun (me, you, him, her, us, them):<br />\r\nI can&rsquo;t keep up with him &ndash; he runs much faster<strong> than me</strong>.<br />\r\nNot: <s>faster that me</s> or <s>faster as me</s><br />\r\nIn more formal situations, instead of than + object pronoun, we can use than + subject pronoun + be, do or a modal verb:<br />\r\nMy wife drives more carefully <strong>than I do</strong>.<br />\r\nShe can read music much more quickly <strong>than I can</strong>.</p>\r\n\r\n<h4>Well and badly</h4>\r\n\r\n<p>The adverb well has the same comparative and superlative forms as the adjective good (better, best). The adverb badly has the comparative and superlative forms worse, worst:<br />\r\n[talking about playing tennis]<br />\r\nI played <strong>better</strong> yesterday but I need to improve my serve.<br />\r\nA lot of people behaved badly at the party, but she behaved <strong>worst</strong> of all.</p>\r\n\r\n<h3>7. Comparatives and Superlatives</h3>\r\n\r\n<h5> Equal comparisions</h5>\r\n\r\n<p>Equal comparisions have this formation &ldquo;as + positive adjective/adverb + as&rdquo;. The use of an adjective or an adverb depends on the kind verb which is used in the sentence. In other words, be requires an adjective and an ordinary verb normally requires an adverb.<br />\r\n<strong>A. Be + as + adjective + as</strong><br />\r\nThe reviewers agreed that the data presented in the report <strong>was as reliable as</strong> other data they tested.<br />\r\n<strong>B. Ordinary verb + as + adverb + as</strong><br />\r\nThe existing treatment facility enables us to <strong>process</strong> waste water <strong>as efficiently as</strong> possible.<br />\r\n<strong>C. Almost/nearly/just modify a positive adjective or adverb.</strong><br />\r\nJohn is <strong>just as qualified as</strong> the other candidates for that position.</p>\r\n\r\n<h5> Comparatives</h5>\r\n\r\n<p>Comparatives are used to compare two things.<br />\r\n<strong>A. Adjective/adverb + -er + than</strong><br />\r\nGiven the high price of gasoline lately, renting a car is not <strong>cheaper than</strong> taking the train.<br />\r\n<strong>B. More + adjective/adverb + than</strong><br />\r\nEver since the office switched from carpeted floors to linoleum floors, the janitors have been able to clean the office <strong>more easily than</strong> before.</p>\r\n\r\n<h5> Superlatives</h5>\r\n\r\n<p><strong>A. The + adjective/adverb + -est</strong> To cease smoking is the easiest thing I ever did. <strong>B. The + most + adjective/adverb</strong> That was the most boring movie I&rsquo;ve ever seen.</p>\r\n\r\n<h5> Comparatives with &ldquo;the&rdquo;</h5>\r\n\r\n<p>Generally, <strong>the</strong> is not used with comparatives, but two cases exist in which <strong>the</strong> must be used.<br />\r\n<strong>A. The + comparative, the + comparative</strong><br />\r\n<strong>The closer</strong> you live to a city, <strong>the more expensive</strong> your home insurance premiyms will be.<br />\r\n<strong>B. Of the two + noun, subject + verb + the + comparative</strong><br />\r\n<strong>One the two</strong> candidates, John is <strong>the better</strong> qualified for that job.</p>\r\n\r\n<h5> Comparatives of words with Latin roots</h5>\r\n\r\n<p>To is used instead of <strong>than</strong> with then adjectives.</p>\r\n\r\n<table align=\"center\" style=\"margin-bottom:30px; margin-top:30px; width:600px\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Inferior to</th>\r\n			<th>junior to</th>\r\n			<th>posterior to</th>\r\n			<th>prefer to</th>\r\n		</tr>\r\n		<tr>\r\n			<th>Prior to</th>\r\n			<th>senior to</th>\r\n			<th>superior to</th>\r\n			<th>&nbsp;</th>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>He pointed out that the former was <strong>inferior to</strong> the latter in some respects. You should arrive at least one hour <strong>prior to</strong> boarding. Our new line of products is far <strong>superior to</strong> existing lines.</p>\r\n\r\n<h6> Adverbs used to emphasize comparatives and</h6>\r\n\r\n<p>superlatives<br />\r\nBelow are some adverbs used before comparatives and superlatives for emphasis.<br />\r\n<strong>much/by far/a lot/even/far/still/ a little</strong><br />\r\nThis year&rsquo;s college football game was <strong>far</strong> more exciting to watch than last year&rsquo;s.<br />\r\nAttendance figures of the new employees at the staff meeting are <strong>much</strong> higher than expected.</p>\r\n\r\n<h6> Idiomatic comparative expressions</h6>\r\n\r\n<p>The following comparative expressions are commonly used and may be a bit confusing. Study them carefully.</p>\r\n\r\n<table align=\"center\" style=\"margin-bottom:30px; margin-top:30px; width:400px\">\r\n	<tbody>\r\n		<tr>\r\n			<th>no longer than</th>\r\n			<th>no sooner &ndash; than</th>\r\n		</tr>\r\n		<tr>\r\n			<th>no more than</th>\r\n			<th>rather than</th>\r\n		</tr>\r\n		<tr>\r\n			<th>no later than</th>\r\n			<th>would rather &ndash; than</th>\r\n		</tr>\r\n		<tr>\r\n			<th>other than</th>\r\n			<th>at the latest</th>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>As announced at this morning&rsquo;s meeting, this year&rsquo;s appraisal forms have to be filled out and retured to the personal departure <strong>no later than</strong> June 30.</p>\r\n\r\n<h6> Irregular comparisions</h6>\r\n\r\n<p>Get used to following irregular comparisions:</p>\r\n\r\n<table align=\"center\" border=\"1\" style=\"margin-bottom:30px; margin-top:30px; width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Positive</th>\r\n			<th>Comparative</th>\r\n			<th>Superlative</th>\r\n		</tr>\r\n		<tr>\r\n			<td>good<br />\r\n			well</td>\r\n			<td>better</td>\r\n			<td>best</td>\r\n		</tr>\r\n		<tr>\r\n			<td>bad<br />\r\n			ill</td>\r\n			<td>worse</td>\r\n			<td>worst</td>\r\n		</tr>\r\n		<tr>\r\n			<td>many<br />\r\n			much</td>\r\n			<td>more</td>\r\n			<td>most</td>\r\n		</tr>\r\n		<tr>\r\n			<td>little</td>\r\n			<td>less</td>\r\n			<td>least</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>I like your interpretation <strong>better</strong> than mine</p>\r\n\r\n<h3>8. Conditionals - IF Clauses</h3>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT10.png\" /></div>\r\n\r\n<h5><u>Zero Conditional</u></h5>\r\n\r\n<p><strong>If + Present Simple, Present Simple </strong><br />\r\n<strong>Present Simple + If + Present Simple</strong><br />\r\n&bull; If you put water in the freezer, it becomes ice.<br />\r\n&bull; You get wet if you stand in the rain.<br />\r\n&bull; If you heat ice, it melts.</p>\r\n\r\n<h5><u>First Conditional</u></h5>\r\n\r\n<p><strong>Present Simple + If + Present Simple</strong><br />\r\n&bull; Ice melts if you heat it.<br />\r\n&bull; I can&#39;t sleep if I drink coffee at night.<br />\r\n<strong>If + Present verb, future verb</strong><br />\r\n&bull; If you touch that wire, you will get an electric shock. (Warning)<br />\r\n&bull; If you eat my chocolate that is in the fridge, you&#39;ll sleep outside with the dog.(Threat)<br />\r\n<strong>Future Verb + If + Present Simple</strong><br />\r\n&bull; I will be annoyed if they don&#39;t arrive on time.<br />\r\n&bull; You will get a better job if you can speak English.<br />\r\n<strong>Modal Verbs in First Conditional</strong><br />\r\nNormally WILL is used in the main clause of first conditional sentences. However you can also use the modal verbs MAY, MIGHT and COULD when something is a possible consequence (and not a certain one) in the future.<br />\r\n&bull; If you are nice to me, I <strong>may</strong> buy you a gift when I&#39;m in Peru.<br />\r\n&bull; If they train a little harder, they <strong>might</strong> win the match.<br />\r\n&bull; If he doesn&#39;t do his work, he <strong>could</strong> get fired.</p>\r\n\r\n<h5><u>Second Conditional</u></h5>\r\n\r\n<p>We use a past verb though are imagining the present or the future to be different.<br />\r\nThe second clause of subject + would + verb (conditional verb) is conditional to the first clause happening (or will only happen if the first part/clause happens).<br />\r\nExample: If I <strong>won</strong> the lottery, I <strong>would travel</strong> around the world.<br />\r\n= It is <strong>unlikely</strong> that I will win the lottery, but I&#39;m going to hypothetically imagine that I did win. In that situation I would travel around the world. So in order for me to travel around the world, I would need the first clause (the condition or situation) to happen, that is, for me to win the lottery first.<br />\r\n&bull; If I knew his name, I would tell you.<br />\r\n&bull; If I didn&#39;t have a headache, I would go to the party.<br />\r\n&bull; If I became President, I would reduce the salaries of all politicians. (Though it is unlikely I will become President)<br />\r\n<strong>Conditional verb (would + verb) + If + Past Simple</strong><br />\r\n&bull; I would be happy if I had more free time.<br />\r\n&bull; There would be fewer accidents if everyone drove more carefully.<br />\r\n<strong>If I were</strong> ...<br />\r\nNote that with the verb <strong>To Be</strong> we use IF + I / HE / SHE / IT + <strong>WERE</strong><br />\r\n&bull; If he were taller, he&#39;d be accepted into the team.<br />\r\n&bull; She would be still be correcting my grammar if she were still alive.<br />\r\n<strong>Could in Second Conditional sentences</strong><br />\r\nCOULD can be used instead of WOULD to make the hypothetical present or future more likely.<br />\r\n&bull; If he trained every day, he could represent his country<br />\r\n&bull; If I had a little more money, I could buy a car.</p>\r\n\r\n<h5><u>Third Conditional</u></h5>\r\n\r\n<p>When we are talking about <strong>something in the past which cannot be altered now</strong>, we use:<br />\r\n<strong>If + Past Perfect, would have + past participle</strong><br />\r\nEXAMPLE: If you <strong>had studied</strong> all of these grammar pages, you <strong>would have passed</strong> the exam.<br />\r\nYou can not alter or change the past. You didn&#39;t study in the past (something you cannot change now) so you didn&#39;t pass the exam. It is an imaginary situation that didn&#39;t happen.<br />\r\n&bull; If you had been more careful, you wouldn&#39;t have had an accident.<br />\r\n&bull; If I had seen you, I would have said hello.<br />\r\nNotice how this tense can be used to say that you regret doing something or when you are telling someone off (reproaching someone). This type of conditional can also be used when making excuses.<br />\r\nWe can also change the word order of the sentence...<br />\r\n<strong>Would have + If + past perfect</strong><br />\r\nEXAMPLE: You <strong>would have passed</strong> the exam if <strong>you had studied</strong> all of these grammar pages.<br />\r\n&bull; I wouldn&#39;t have left my job if I had known how difficult it is to find another one.<br />\r\n&bull; I would have taken a photo if I had brought my camera with me.<br />\r\n&bull; He would have died if the ambulance hadn&#39;t arrived quickly.<br />\r\n&bull; She would have gone to your birthday party if she hadn&#39;t been sick.<br />\r\n&bull; He wouldn&#39;t have become lost if he had taken the map with him.<br />\r\n&bull; The team would have won if the referee hadn&#39;t taken the bribe.<br />\r\n&bull; You wouldn&#39;t haved needed fillings if you had brushed your teeth more frequently.<br />\r\n<strong>If I were you</strong> ... is used when giving <strong>ADVICE</strong> about what you would do in the same situation as the other person. You imagine yourself in their position or situation and what you would do or how you would react.<br />\r\n&bull; If I were you, I would study more.<br />\r\n&bull; If I were you, I would stop doing that.<br />\r\n&bull; If I were you, I would go to the doctor.<br />\r\n&bull; if I were you, I would subscribe to the Woodward English YouTube channel right now. :)<br />\r\n&bull; If I were you, I wouldn&#39;t play with those wires.<br />\r\nThough in informal (and grammatically incorrect) English, you may hear some people say If I was... This usage doesn&#39;t sound good, so avoid it.<br />\r\nYou can also change the order of the sentence<br />\r\n&bull; I would study more if I were you.<br />\r\n&bull; I would be more careful if I were you.<br />\r\n&bull; I wouldn&#39;t do that if I were you.<br />\r\nNotice how the comma is not necessary with this word order.</p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT11.png\" /></div>\r\n\r\n<h5>Quick Explanation</h5>\r\n\r\n<h6>The difference between All, Every, and Each</h6>\r\n\r\n<p><strong>All </strong>means the total number of people or things considered as a group.<br />\r\n<strong>Every </strong>means all members of a group considered individually.<br />\r\n<strong>Each</strong> means all members of a group considered individually though we think of them more one by one</p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT12.png\" /></div>\r\n\r\n<h5><u>-- EVERY --</u></h5>\r\n\r\n<p><strong>Every</strong> refers to all members of a group though considered individually. It can be used to talk about three or more people/things.</p>\r\n\r\n<h6>Every + singular noun</h6>\r\n\r\n<p>The noun that comes after <strong>Every</strong> is in <strong>singular</strong> form.<br />\r\n&bull; I have visited <strong>every country</strong> in South America (we do NOT say: every countries)<br />\r\n&bull; I can understand <strong>every word</strong> our teacher says. (we do NOT say: every words)<br />\r\nNote, when you use <strong>every + noun</strong> as a subject, it uses a <strong>singular verb</strong> (verb + s)<br />\r\n&bull; <strong>Every</strong> day <strong>is</strong> a chance to learn something new.<br />\r\n&bull; <strong>Every</strong> child <strong>needs</strong> love and care.<br />\r\n&bull; <strong>Every</strong> house on the street <strong>looks</strong> the same.</p>\r\n\r\n<h6>Every + number + plural noun</h6>\r\n\r\n<p><strong>Every</strong> can be followed by a <strong>plural noun</strong> when there is a number before that noun. This is common with periods of time or things at regular intervals.<br />\r\n&bull; He gets his head shaved <strong>every three weeks</strong>.<br />\r\n&bull; You need to take a break <strong>every two hours</strong>.<br />\r\nWe can also use <strong>every</strong> without a number and a <strong>singular noun</strong> to refer to regular intervals:<br />\r\n&bull; He plays football <strong>every Saturday</strong>.<br />\r\n&bull; She goes to the gym <strong>every day</strong>.</p>\r\n\r\n<h5>-- EACH --</h5>\r\n\r\n<p><strong>Each</strong> refers to all members of a group though we think of them more one by one (individually). <strong>Each</strong> can be used to talk about two or more people/things.</p>\r\n\r\n<h6>Each + singular countable noun</h6>\r\n\r\n<p>You use a singular (countable) noun after the word <strong>Each</strong>.<br />\r\n&bull; Make sure you enjoy <strong>each moment</strong> in your life.<br />\r\n&bull; They play the national anthem of <strong>each country</strong> before the game begins.<br />\r\n&bull; Live <strong>each day</strong> as if it were your last.</p>\r\n\r\n<h6>Each + one</h6>\r\n\r\n<p><strong>One</strong> can be used to replace the singular countable noun if it has already been mentioned.<br />\r\n&bull; A: What do I have to do with these antique vases? B: You need to take <strong>each one</strong> out of the box very carefully. (each one = each vase)</p>\r\n\r\n<h6>Each of + determiner + plural noun</h6>\r\n\r\n<p>Each can be followed by a determiner (my, his, the, etc.) and a plural noun.<br />\r\n&bull; I kiss <strong>each of my children</strong> before they go to bed at night.<br />\r\n&bull; The teacher had a little kid holding on to <strong>each of her hands</strong>.<br />\r\n&bull; <strong>Each of the guides</strong> has a different group to show around the museum.<br />\r\nNotice how after <strong>each of</strong> the verb usually in singular form is though when speaking informally, you will sometimes hear a plural verb used.<br />\r\n&bull; Each of my students <strong>has</strong> a different assignment to complete. (correct use)<br />\r\n&bull; Each of my students <strong>have</strong> a different assignment to complete. (informal use)</p>\r\n\r\n<h6>Each of + pronoun (you/us/them)</h6>\r\n\r\n<p>We can only use the pronouns you/us/them after <strong>each of</strong>.<br />\r\n&bull; He gave <strong>each of us</strong> a small gift at the end of the course.<br />\r\n&bull; You need to wash <strong>each of them</strong> before use.<br />\r\n&bull; <strong>Each of you</strong> needs to complete the assignment individually.<br />\r\nAgain the verb following <strong>each of + pronoun </strong>should be in the singular form.</p>\r\n\r\n<h6>Each as a pronoun</h6>\r\n\r\n<p><strong>Each</strong> can be used by itself (without a noun) as a pronoun. &bull; When the students finished to course, <strong>each</strong> was given a certificate. (Each = each of the students) Though it is more common to use <strong>each one</strong> instead of <strong>each</strong> by itself. &bull; &hellip;<strong>each one</strong> was given a certificate</p>\r\n\r\n<h6>Noun/Pronoun + each</h6>\r\n\r\n<p><strong>Each</strong> can be used after the noun (or pronoun) it describes.<br />\r\n&bull; The parents gave their children some pocket money. To avoid problems, they <strong>each</strong> received the same amount.</p>\r\n\r\n<h6>Auxiliary Verb/To Be + each</h6>\r\n\r\n<p><strong>Each</strong> can be used after an <strong>auxiliary verb</strong> or the verbs <strong>Are</strong> and <strong>Were</strong>.<br />\r\n&bull; I have four books to sell and they <strong>are each</strong> worth around five dollars.<br />\r\n&bull; They <strong>have each</strong> been told their responsibilities.</p>\r\n\r\n<h6>Object + each</h6>\r\n\r\n<p>Instead of going before/after the subject, <strong>each</strong> can appear after the object.<br />\r\nThis is common when the noun object refers to an amount, how many of something there is or when giving a price.<br />\r\n&bull; My paintings are worth $100<strong> each</strong> (= Each of my paintings are worth $100)<br />\r\n&bull; I gave my children <strong>each</strong> an ice cream.</p>\r\n\r\n<h5>-- ALL --</h5>\r\n\r\n<p><strong>All</strong> refers to the <strong>total</strong> number of people or things of a group. They are considered as a group and not individually. There are minimum three things in the group.</p>\r\n\r\n<h6>All + noun</h6>\r\n\r\n<p>We can use <strong>All</strong> with a plural noun to make a generalization about an entire group of something.<br />\r\n&bull; <strong>All </strong>sharks are dangerous.<br />\r\n&bull; <strong>All</strong> elephants are slow.</p>\r\n\r\n<h6>All + of + determiner + noun</h6>\r\n\r\n<p>The noun can be singular, plural or an uncountable noun. These nouns can also be replaced by pronouns.<br />\r\n&bull; You need to read <strong>all of the book</strong>.<br />\r\n&bull; <strong>All of the pages</strong> are yellow and old.<br />\r\n&bull; <strong>All of the fish</strong> in the pond have died.<br />\r\n&bull; You need to remove <strong>all of them</strong> before they start to smell bad.<br />\r\nNote that<strong> All of + singular noun</strong> is not common and<strong> Whole</strong> or <strong>Entire</strong> used instead of<strong> all of</strong>.<br />\r\n&bull; You need to read the<strong> whole</strong> book (= all of the book)<br />\r\nWe can also remove <strong>OF</strong> before the determiner + noun (but we must use<strong> OF</strong> before a pronoun)<br />\r\n&bull; You need to read <strong>all the book</strong>.<br />\r\n&bull; <strong>All the pages</strong> are yellow and old.</p>\r\n\r\n<h6>Pronoun + all</h6>\r\n\r\n<p>Sometimes you can place <strong>All</strong> after a <strong>pronoun</strong> to emphasize that every single one of that group is included.<br />\r\n&bull; <strong>We all</strong> hope you get better soon.<br />\r\n&bull; I hope <strong>you all</strong> have a great time.<br />\r\n&bull; I have made <strong>us all</strong> some sandwiches.</p>\r\n\r\n<h6>The difference between Another vs. Other vs. Others</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT13.png\" /></div>\r\n\r\n<h5>-- ANOTHER--</h5>\r\n\r\n<p><strong>Another</strong> means:<br />\r\n&bull; one more, an additional, an extra<br />\r\n&bull; a different one; an alternative one<br />\r\n<strong>Another</strong> is a determiner (and a qualifier) that goes before a singular countable noun or a pronoun.</p>\r\n\r\n<h6>Another + Singular Countable noun</h6>\r\n\r\n<p><strong>Another</strong> can be followed by a singular countable noun.<br />\r\n&bull; He has bought <strong>another</strong> motorbike.<br />\r\n&bull; Would you like <strong>another</strong> cup of coffee?<br />\r\n&bull; Don&rsquo;t worry about the rain. We can go <strong>another</strong> day.<br />\r\n&bull; I think you should paint it <strong>anothe</strong>r color.<br />\r\n&bull; We are having <strong>another</strong> baby.</p>\r\n\r\n<h6>Another + One</h6>\r\n\r\n<p><strong>Another</strong> can be placed before &ldquo;one&rdquo; when the meaning is clear from the text before it.<br />\r\n&bull; I have already eaten two sandwiches though now I want <strong>another</strong> one. (= an additional sandwich)<br />\r\n&bull; A: You can borrow more of these books if you like. B: Ok, I&rsquo;ll take<strong> another</strong> one. (= another book, one more book)</p>\r\n\r\n<h6>Another as a pronoun</h6>\r\n\r\n<p>Sometimes <strong>another</strong> is used as a pronoun.<br />\r\n&bull; That piece of cake was tasty. I think I&rsquo;ll have <strong>another</strong>. (another = one more piece of cake)<br />\r\n&bull; I don&rsquo;t like this room. Let&rsquo;s ask for <strong>another</strong>. (another = another room)<br />\r\nNote: you can also say: &ldquo;I think I&rsquo;ll have another one.&rdquo; and &ldquo;Let&rsquo;s ask for another one.&rdquo;</p>\r\n\r\n<h6>Another + number + plural noun</h6>\r\n\r\n<p><strong>Another</strong> can be used before a plural noun when there is a number before that noun or before phrases such as a couple of, a few etc.<br />\r\n&bull; In <strong>another</strong> 20 years my laptop is going to be obsolete.<br />\r\n&bull; I like this city so much that I&rsquo;m going to spend <strong>another</strong> three days here.<br />\r\n&bull; We need <strong>another</strong> three teachers before classes begin.<br />\r\n&bull; He was given <strong>another</strong> couple of months to finish the sculpture.<br />\r\nRemember <strong>another</strong> is ONE word not two words (an other is incorrect)</p>\r\n\r\n<h5>-- OTHER--</h5>\r\n\r\n<p><strong>Other</strong> is a determiner that goes before plural countable nouns, uncountable nouns or a pronoun.</p>\r\n\r\n<h6>Other + Plural Countable Noun</h6>\r\n\r\n<p><strong>Other</strong> can be followed by a plural countable noun.<br />\r\n&bull; We have <strong>other</strong> styles if you are interested.<br />\r\n&bull; Have you got any <strong>other</strong> dresses, or are these the only ones?<br />\r\n&bull; Some days are sunny though <strong>other</strong> days can be very rainy.<br />\r\n&bull; I have invited some <strong>other</strong> people.<br />\r\n&bull; I can&rsquo;t help you because I&rsquo;m busy with <strong>other</strong> things.</p>\r\n\r\n<h6>Other + Ones</h6>\r\n\r\n<p><strong>Other</strong> can be placed before the pronoun &ldquo;ones&rdquo; when the meaning is clear from the text before it.<br />\r\n&bull; We don&rsquo;t need those books, we need <strong>other ones</strong>. (= different books)<br />\r\n&bull; A: You can borrow my books if you like. B: Thanks, but I need other ones. (= other books)<br />\r\nNote: you can say <strong>other</strong> one when it refers to wanting the alternative.<br />\r\n&bull; I don&#39;t want this one, I want the <strong>other</strong> one.</p>\r\n\r\n<h5>-- OTHERS--</h5>\r\n\r\n<h6>Others as a pronoun</h6>\r\n\r\n<p><strong>Others </strong>replaces &ldquo;other ones&rdquo; or &quot;other + plural noun&quot;.<br />\r\nOnly <strong>others</strong> can be used as a pronoun and not other.<br />\r\n&bull; I don&rsquo;t like these postcards. Let&rsquo;s ask for <strong>others</strong>. (others = other postcards)<br />\r\n&bull; Some of the presidents arrived on Monday. <strong>Others</strong> arrived the following day.<br />\r\n<strong>Others - the others</strong><br />\r\nOften &ldquo;(the) others&rdquo; refers to &ldquo;(the) other people&rdquo;.<br />\r\n&bull; He has no interest in helping others. (= in helping other people)<br />\r\n&bull; What are the others doing tonight?</p>\r\n\r\n<h6>The difference between The Indefinite Article &ndash; A / AN</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT14.png\" /></div>\r\n\r\n<p>We use A/AN with:<br />\r\n1. Singular nouns and the first time we refer to a person, animal or thing.<br />\r\n&bull; a child<br />\r\n&bull; an elephant<br />\r\n&bull; a television<br />\r\n2. We don&#39;t use A/AN with possessive pronouns, demonstratives or cardinal numbers.<br />\r\n&bull; My shirt is dirty.<br />\r\n&bull; This car is expensive.<br />\r\n&bull; One person is in the reception.<br />\r\n3. We use ONE (or more) instead of A/AN when the number is important.<br />\r\n&bull; There is only one exit from the airport.</p>\r\n\r\n<h5>A or AN?</h5>\r\n\r\n<p><strong>A</strong> is used when the next word begins with a consonant sound (b, c, d, f, g, h, j, k etc).<br />\r\n&bull; a book<br />\r\n&bull; a table<br />\r\n&bull; a clock<br />\r\n&bull; a university (because the beginning of university sounds like YOU-niversity)<br />\r\n<strong>AN</strong> is used when the next word begins with a vowel sound (a, e, i, o, u).<br />\r\n&bull; an apple<br />\r\n&bull; an elephant<br />\r\n&bull; an umbrella<br />\r\n&bull; an hour (because the H is silent)</p>\r\n\r\n<h5>The Definite Article &ndash; THE</h5>\r\n\r\n<p>We use THE with:<br />\r\n1. A singular or plural noun when it is clear/obvious which person or thing we are talking about.<br />\r\n&bull; There is a lamp in my bedroom. (we mention the lamp for the first time)<br />\r\n&bull; The lamp is next to the desk.<br />\r\n2. Anything which we identify immediately.<br />\r\n&bull; We watched the new Brad Pitt movie last night.<br />\r\n3. Musical instruments (the violin, the guitar, the drums, the flute, the piccolo).<br />\r\n&bull; She plays the piano.<br />\r\n4. Something that is unique or there is only one.<br />\r\n&bull; the sun<br />\r\n&bull; the moon<br />\r\n&bull; the internet.<br />\r\n5. Names of rivers, seas, oceans, mountain ranges and deserts (always in capitals).<br />\r\n&bull; The Mississippi River<br />\r\n&bull; The Black Sea<br />\r\n&bull; The Andes<br />\r\n&bull; The Sahara Desert<br />\r\n6. Directions (cardinal points).<br />\r\n&bull; the west<br />\r\n&bull; the south-east<br />\r\n&bull; the north-west.</p>\r\n\r\n<h5>No Article</h5>\r\n\r\n<p>We use no article with:<br />\r\n1. When we refer to general ideas, plurals or uncountable nouns we do not use THE.<br />\r\n&bull; Religion is an important issue. (NOT The religion is an important issue)<br />\r\n&bull; Mexican food is spicy. (NOT The Mexican food is spicy).<br />\r\n2. Names of people, books and plays (unless it is part of the title).<br />\r\n&bull; I have read Romeo and Juliet.<br />\r\n3. Towns, cities, states and countries.<br />\r\n&bull; Cape Town<br />\r\n&bull; Montana<br />\r\n&bull; Vietnam<br />\r\n(Exceptions &ndash; The USA, The UK, The Netherlands, The Czech Republic, The Philippines).<br />\r\n4. Lakes, single islands, continents or mountains.<br />\r\n&bull; Lake Victoria<br />\r\n&bull; Jamaica<br />\r\n&bull; Asia<br />\r\n&bull; Mt Fuji<br />\r\n5. Planets<br />\r\n&bull; Mars<br />\r\n&bull; Jupiter<br />\r\n&bull; Saturn<br />\r\n6. Sports or games<br />\r\n&bull; soccer<br />\r\n&bull; tennis<br />\r\n&bull; skiing<br />\r\n&bull; monopoly<br />\r\n7. Meals<br />\r\n&bull; breakfast<br />\r\n&bull; lunch<br />\r\n&bull; dinner<br />\r\n&bull; supper</p>\r\n\r\n<h6>The difference between Both &ndash; Either &ndash; Neither</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT15.png\" /></div>\r\n\r\n<p>We use <strong>both, either</strong> and <strong>neither</strong> to refer to two people or things.</p>\r\n\r\n<h5>--BOTH--</h5>\r\n\r\n<p>Both = the two; that one AND the other one; this one AND that one<br />\r\n<strong>Both</strong> can be used as a pronoun to refer to two things that we have already mentioned.<br />\r\n&bull; A: Do you want the blue shirt or the red one?<br />\r\nB: I&rsquo;ll buy <strong>both</strong> (= the blue shirt AND the red shirt = both shirts)</p>\r\n\r\n<h5>Both X and Y</h5>\r\n\r\n<p>= not only X but also Y<br />\r\n<strong>Both + Adjective + and + Adjective</strong><br />\r\n&bull; He&rsquo;s <strong>both</strong> tall <strong>and</strong> handsome.<br />\r\n&bull; I&rsquo;m <strong>both</strong> happy<strong> and</strong> confused at the same time!<br />\r\n&bull; I have had a long, hard day and I&rsquo;m <strong>both</strong> tired <strong>and</strong> hungry.<br />\r\n<strong>Both + Noun + and + Noun</strong><br />\r\n<strong>Both</strong> can be used with a singular noun + and + singular noun<br />\r\n&bull; She speaks both English and Arabic.<br />\r\n&bull; They have both a cat and a dog.<br />\r\n&bull; He is both an actor and a director.<br />\r\nWe can also use <strong>Both + plural noun</strong> (see more below)<br />\r\n&bull; She speaks <strong>both languages</strong>.</p>\r\n\r\n<h5>Both or Both of?</h5>\r\n\r\n<p><strong>Both</strong> or <strong>Both of</strong> can be used without a difference in meaning though <strong>Both of</strong> is more common in the United States</p>\r\n\r\n<h6>Both (of) + determiner + plural noun</h6>\r\n\r\n<p>You can use <strong>Both</strong> or <strong>Both of</strong> before a determiner (my, his, these, the etc.) and a plural noun.<br />\r\n&bull; Both (of) my friends arrived late to class.<br />\r\n&bull; Both of the wheels wobble too much.<br />\r\n&bull; A prize was given to both of the players.<br />\r\nWhen we use <strong>Both</strong> (without<strong> of</strong>), we drop the article <strong>the</strong>.<br />\r\n&bull; Both of <strong>the</strong> parents were nervous.<br />\r\n&bull; Both parents were nervous.</p>\r\n\r\n<h6>Both of + Object Pronoun</h6>\r\n\r\n<p>When using<strong> Both</strong> with an object pronoun (me, you, him, her, it, us them), we need the preposition <strong>OF</strong> before that pronoun.<br />\r\n&bull; He has invited both us. (incorrect)<br />\r\n&bull; He has invited both <strong>of</strong> us. (correct)<br />\r\n&bull; I&rsquo;ll take both <strong>of</strong> them. (correct)<br />\r\n&bull; I need to speak to both <strong>of</strong> you. (correct)</p>\r\n\r\n<h6>Verb + Object pronoun + both</h6>\r\n\r\n<p>We can use <strong>both</strong> after an object pronoun<br />\r\n&bull; I hope they invite <strong>us both</strong> (= I hope they invite <strong>both of us</strong>)<br />\r\n&bull; Do you need <strong>them both</strong>? (= Do you need <strong>both of them</strong>)<br />\r\n&bull; The teacher sent <strong>them both</strong> to the principal&rsquo;s office.</p>\r\n\r\n<h6>To be + both</h6>\r\n\r\n<p><strong>Both </strong>comes after <strong>To Be</strong> (or an auxiliary such as have or modal verbs).<br />\r\n&bull; <strong>He is</strong> both intelligent and agile.<br />\r\n&bull; My sister and I <strong>are both</strong> ready for the trip.<br />\r\n&bull; We <strong>were both</strong> happy with our exam results.</p>\r\n\r\n<h6>Modal verb + both + verb</h6>\r\n\r\n<p>&bull; My parents <strong>can both</strong> speak French. &bull; They <strong>should both</strong> try harder. &bull; My brothers <strong>would both</strong> be shocked if they knew the truth.</p>\r\n\r\n<h6>Both + other verbs</h6>\r\n\r\n<p><strong>Both</strong> goes before the other verbs. If there is an accompanying auxiliary verb, then it goes in the middle of the two verbs (i.e. auxiliary + both + verb)<br />\r\n&bull; We <strong>both wanted</strong> to stay in bed and not go to work.<br />\r\n&bull; They <strong>both liked</strong> the surprise.<br />\r\n&bull; My parents <strong>both work</strong> in the same building.<br />\r\n&bull; They<strong> have both studied</strong> a lot.</p>\r\n\r\n<h6>Both - Negative</h6>\r\n\r\n<p>We don&rsquo;t use <strong>both</strong> in negative structures. Instead, we normally use <strong>Neither</strong>.<br />\r\n&bull; We don&rsquo;t say: Both of them are not ready (incorrect)<br />\r\n&bull; We say: <strong>Neither</strong> of them are ready (correct)</p>\r\n\r\n<h5>--NEITHER--</h5>\r\n\r\n<p>Neither = not one and not the other<br />\r\n<strong>Neither</strong> is a negative word and is accompanied by an affirmative singular verb.</p>\r\n\r\n<h6>Neither X nor Y</h6>\r\n\r\n<p><strong>Neither &hellip; nor &hellip;</strong> is used as a conjunction. It is the opposite of &ldquo;Both &hellip; and &hellip;&rdquo; If a verb comes after this phrase, that verb is in the singular form (Sometimes you will hear it used in the plural form though it is not grammatically correct)<br />\r\n&bull; <strong>Neither</strong> John <strong>nor</strong> Fred likes doing the dishes. (= &ldquo;Both John and Fred don&rsquo;t like doing the dishes&rdquo;)<br />\r\n&bull; I want<strong> neither</strong> the red shirt <strong>nor</strong> the blue shirt.<br />\r\n&bull; I <strong>neither</strong> smoke <strong>nor</strong> drink.</p>\r\n\r\n<h6>Neither + singular noun</h6>\r\n\r\n<p><strong>Neither</strong> is used as a determiner before a single noun.<br />\r\n&bull; Neither team wanted to lose.<br />\r\n&bull; That tennis game was very close. Neither player had a clear advantage.<br />\r\n&bull; Neither parent knew about the accident.</p>\r\n\r\n<h6>Neither of + determiner + plural noun</h6>\r\n\r\n<p>You can use <strong>Neither of</strong> before a determiner (my, his, these, the etc.) and a plural noun.<br />\r\n&bull; Neither of my friends came to class today.<br />\r\n&bull; Neither of the parents understood what the baby was trying to say.<br />\r\n&bull; Neither of our cars has enough petrol so we have to take the bus.</p>\r\n\r\n<h6>Neither of + Pronoun</h6>\r\n\r\n<p>When using <strong>Neither</strong> + of + pronoun (you, us, them), we need the preposition <strong>OF </strong>before that pronoun. (If a verb comes after this phrase then it is in singular form) &bull; The present is for neither <strong>of</strong> us. &bull; Neither <strong>of</strong> them is married. &bull; Neither<strong> of</strong> us expected to be fired.</p>\r\n\r\n<h6>Neither in short responses</h6>\r\n\r\n<p><strong>Neither</strong> is frequently used as part of a short response when someone says something negative and you agree with them.<br />\r\n&bull; A: I have never been to Switzerland<br />\r\n&bull; B: Neither have I.<br />\r\n&bull; A: I don&rsquo;t want to go.<br />\r\n&bull; B: Neither do I.<br />\r\n<strong>Neither</strong> can also be used alone.<br />\r\n&bull; A: Would you like a blue tie or a green tie?<br />\r\n&bull; B: Neither. (= Neither tie)</p>\r\n\r\n<h6>Neither vs. Either</h6>\r\n\r\n<p>You can use <strong>Either</strong> with a negative verb to replace<strong> Neither</strong> with a positive verb<br />\r\n&bull; I <strong>have neither</strong> time nor money<br />\r\n&bull; I <strong>don&rsquo;t</strong> have <strong>either</strong> time or money.</p>\r\n\r\n<h5>--EITHER--</h5>\r\n\r\n<p>Either = any one of the two = this one or the other one<br />\r\n<strong>Either</strong> is accompanied by an affirmative singular verb and is mostly used in questions or negative sentences</p>\r\n\r\n<h6>Either X or Y</h6>\r\n\r\n<p><strong>Either &hellip; or &hellip;</strong> is used as a conjunction. It is used to express alternatives and or a choice between two (and sometimes more) things. It is used a verb in singular form (Sometimes you will hear it used in the plural form though it is not grammatically correct).<br />\r\n&bull; <strong>Either</strong> you <strong>or</strong> John has to finish the report before 5pm.<br />\r\n&bull; You can have <strong>either</strong> the red shirt <strong>or</strong> the blue shirt. (= but not both)<br />\r\n&bull; <strong>Either</strong> you leave the building now <strong>or</strong> I call the security guards.</p>\r\n\r\n<h6>Either + singular noun</h6>\r\n\r\n<p><strong>Either</strong> is used as a determiner before a single noun.<br />\r\n&bull; There are only two options and I&rsquo;m not interested in <strong>either</strong> film.<br />\r\n&bull; A: Do you want it ready for Thursday or Friday? B: <strong>Either</strong> day is fine for me.</p>\r\n\r\n<h6>Either of + determiner + plural noun</h6>\r\n\r\n<p>You can use <strong>Either of</strong> before a determiner (my, his, these, the etc.) and a plural noun.<br />\r\n&bull; We&rsquo;ve been dating for 6 months and I haven&rsquo;t met <strong>either</strong> of her parents.<br />\r\n&bull; I haven&rsquo;t read <strong>either</strong> of these books.<br />\r\n&bull; I don&rsquo;t want <strong>either</strong> of those apples. Do you have one that is not rotten?</p>\r\n\r\n<h6>Either + of + Pronoun</h6>\r\n\r\n<p>When using <strong>Either</strong> + of + object pronoun (you, us, them), we need the preposition <strong>OF</strong> before that pronoun.<br />\r\n&bull; I don&rsquo;t think he is going to invite either <strong>of</strong> us.<br />\r\n&bull; A: Which photo do you prefer? B: I don&rsquo;t like either <strong>of</strong> them<br />\r\n&bull; I think I left my keys and wallet at the office. I don&rsquo;t want to lose either <strong>of</strong> them.<br />\r\n<strong>Either</strong> can also be used alone. It means it doesn&rsquo;t matter which alternative. Sometimes it is accompanied by the pronoun &ldquo;one&rdquo;.<br />\r\n&bull; A: Would you like a coffee or a tea?<br />\r\n&bull; B: Either (one). (= I don&rsquo;t mind if it&rsquo;s coffee or tea, both alternatives are fine)</p>\r\n\r\n<h6>Either in short responses</h6>\r\n\r\n<p>Either can be used at the end of a negative sentence when you agree with something negative someone else has said. It is similar to meaning TOO and ALSO (which are used in affirmative sentences).<br />\r\n&bull; A: I wasn&rsquo;t thirsty. B: I wasn&rsquo;t either. (You cannot say &ldquo;I wasn&rsquo;t too&rdquo;)<br />\r\n&bull; A: I&rsquo;ve never been to Portugal. B: I haven&rsquo;t either.<br />\r\n&bull; A: I didn&rsquo;t go to class yesterday. B: I didn&rsquo;t either</p>\r\n\r\n<h6>Pronunciation of Either and Neither</h6>\r\n\r\n<p>You will hear the word <strong>Either</strong> pronounced two different ways:<br />\r\n&bull; /ˈaɪ&eth;ər/ (eye-ther &ndash; with a long I sound at the beginning) &ndash; British English<br />\r\n&bull; /ˈiː&eth;ər/ (ee- ther &ndash; with a long E sound at the beginning) &ndash; American English<br />\r\nBoth forms of pronunciation are correct and supposedly one is British English and the other American English. However within each country you may hear both forms used.<br />\r\nThe same happens with the pronunciation of the word <strong>Neither</strong>:<br />\r\n&bull; /ˈnaɪ&eth;ər/ &ndash; British English<br />\r\n&bull; /ˈniː&eth;ər/ &ndash; American English</p>\r\n\r\n<h6>The difference between Everyday and Every day.</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT16.png\" /></div>\r\n\r\n<p>A common mistake in English is the correct use of the words <strong>everyday</strong> and <strong>every day</strong>. Don&#39;t worry, this is also a mistake commonly made by native speakers too.<br />\r\nThe word <strong>everyday</strong> (one word) and phrase <strong>every day</strong> (two words) are not interchangeable.<br />\r\n<strong>Everyday</strong> is an adjective so it goes before the noun it describes.<br />\r\n<strong>Everyday</strong> = ordinary, regular, normal or commonplace. It can refer to something done or used daily or routinely.<br />\r\n&bull; You should wear an elegant dress for the wedding, not just an <strong>everyday</strong> one.<br />\r\n&bull; Even though he has won some money, it hasn&#39;t changed his <strong>everyday</strong> life.<br />\r\n&bull; Some everyday activities damage the environment.<br />\r\n&bull; Why do you always use those big words that are not common in <strong>everyday</strong> language?<br />\r\n<strong>Every day</strong> is a phrase that usually acts as an adverb.<br />\r\n<strong>Every day </strong>= all of the days or each day over a period of time. It can also mean very regularly.<br />\r\n&bull; You&#39;ve been wearing that same shirt <strong>every day</strong> this week. You need to change it!<br />\r\n&bull; You should take a shower <strong>every day</strong>.<br />\r\n&bull; Low prices, <strong>every day</strong>! (A sign in a shop)<br />\r\n&bull; Woodward English publishes new material on Twitter <strong>every day</strong>.</p>\r\n\r\n<h6>How to know when to use every day or everyday.</h6>\r\n\r\n<p>To know which of the words to use in your sentence, replace the word(s) with <strong>each day</strong>.<br />\r\nIf it sounds correct, then write <strong>every day</strong> (two words).<br />\r\nIf it doesn&#39;t sound correct (usually because it is before a noun) then use <strong>everyday</strong>(one word).<br />\r\n<u>For example</u>:<br />\r\n&bull; I do exercises <strong>every day</strong>. (correct)<br />\r\n&bull; I do exercises each day - This sound correct so we use <strong>every day</strong> (two words)<br />\r\n&bull; It&#39;s not an <strong>every day</strong> event. (incorrect)<br />\r\n&bull; It&#39;s not an each day event. - This doesn&#39;t sound correct so we use <strong>everyday</strong> (one word)<br />\r\nAnother way of doing this is by replacing the word(s) with <strong>ordinary</strong>.<br />\r\nIf it sounds correct, then write <strong>everyday </strong>(one word).<br />\r\nIf it doesn&#39;t sound correct then use <strong>every day</strong> (two words).<br />\r\n<u>For example</u>:<br />\r\n&bull; I do exercises <strong>everyday</strong>. (incorrect)<br />\r\n&bull; I do exercises ordinary - This does not sound correct so we use <strong>every day</strong> (two words)<br />\r\n&bull; It&#39;s not an <strong>everyday</strong> event. (correct)<br />\r\n&bull; It&#39;s not an ordinary event. - This sounds correct so we use <strong>everyday </strong>(one word)<br />\r\nAnother tip is that the word <strong>everyday</strong> is followed by a noun and is not used by itself at the end of a sentence.</p>\r\n\r\n<h6>Pronunciation of Every day and Everyday.</h6>\r\n\r\n<p>The main difference in pronunciation between every day and everyday is where the accent (or word stress) is placed.<br />\r\n<strong>Everyday</strong>: the stress is on the first syllable &hellip; <strong>EV</strong>eryday.<br />\r\n<strong>Every day</strong>: the stress is on the word day &hellip; every <strong>DAY</strong>.</p>\r\n\r\n<h6>The difference between Much - Many</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT17.png\" /></div>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT18.png\" /></div>\r\n\r\n<h6>A lot of vs. Lots of</h6>\r\n\r\n<p><strong>A lot of</strong> and <strong>lots of</strong> are used to express that there is a large quantity of something.<br />\r\nWe use<strong> a lot of</strong> in positive sentences, negative sentences and questions. This expression can be used with <u>countable or uncountable nouns</u>.<br />\r\n&bull; There are <strong>a lot of</strong> dogs in the street. (Countable noun)<br />\r\n&bull; I have <strong>a lot of</strong> time to answer your questions. (Uncountable noun)<br />\r\n&bull; I saw <strong>a lot of</strong> people waiting in the queue. (Countable)<br />\r\n&bull; We did have a lot of fun, didn&#39;t we? (Uncountable)<br />\r\nWe use <strong>lots of</strong> in positive and negative sentences, however it is more informal. It can be used with countable or uncountable nouns, and occasionally in questions.<br />\r\n&bull; We have <strong>lots of </strong>time to catch the plane, let&#39;s relax. (Uncountable noun)<br />\r\n&bull; There are <strong>lots of </strong>people in the queue today. (Countable)<br />\r\n&bull; Oh my, you have spent <strong>lots of</strong> money on clothes! (Uncountable)<br />\r\n&bull; I have <strong>lots of </strong>questions. (Countable)<br />\r\nShe has <strong>a lot of </strong>money = She has <strong>lots of</strong> money</p>\r\n\r\n<h6>Much vs. Many</h6>\r\n\r\n<p><strong>Much</strong> and <strong>Many</strong> are used to express that there is a large quantity of something.<br />\r\n<strong>Much</strong> and <strong>Many</strong> are used in negative sentences and questions.<br />\r\n<strong>Many</strong> is used with countable nouns<br />\r\n<strong>Much</strong> is used with uncountable nouns.<br />\r\n&bull; I don&#39;t have <strong>many</strong> CDs in my collection. (Countable noun)<br />\r\n&bull; They don&#39;t have <strong>much</strong> money to buy a present. (Uncountable noun)<br />\r\n&bull; How <strong>many</strong> brothers do you have? (Countable noun)<br />\r\n&bull; Is there <strong>much</strong> milk in the fridge? (Uncountable noun)<br />\r\nNote: we almost never use <strong>Much</strong> and<strong> Many </strong>in positive sentences, we almost always use <strong>a lot of </strong>or <strong>lots of</strong>.<br />\r\nI have <strong><s>much</s></strong> money. (Incorrect because the sentence is positive / affirmative)<br />\r\nI have <strong>a lot of</strong> money. (Correct)<br />\r\nWith the word <strong>&quot;times&quot;</strong> we use <strong>many times</strong> more than <strong>a lot of times / lots of times</strong>. It sometimes means frequently or often.<br />\r\n&bull; That is my favourite book. I&#39;ve read it <strong>many times</strong>.<br />\r\n&bull; Don&#39;t worry, I&#39;ve done this <strong>many times</strong>.<br />\r\n&bull; We have stayed at this hotel <strong>many times</strong> over the years.</p>\r\n\r\n<h6>Few vs. Little</h6>\r\n\r\n<p>We use <strong>a few</strong> and <strong>a little</strong> to suggest a small quantity or not much of something.<br />\r\n<strong>A few</strong> is used with countable nouns (= some; not many)<br />\r\n<strong>A little</strong> is used with uncountable nouns (= some; not much)<br />\r\n&bull; There are only <strong>a few</strong> days left until Christmas. (Countable noun)<br />\r\n&bull; I have <strong>a few</strong> crazy friends. (Countable noun)<br />\r\n&bull; I would like <strong>a little</strong> milk for my coffee. (Uncountable noun)<br />\r\n&bull; There is <strong>little</strong> hope of finding your wallet. (Uncountable noun)<br />\r\nWhile <strong>Few</strong> and<strong> Little</strong> usually have negative meanings, especially when used with <strong>very</strong>.<br />\r\n&bull; He is sad because he has <strong>few</strong> friends. (Countable noun)<br />\r\n&bull; There are <strong>few </strong>honest politicians. (Countable noun)<br />\r\n&bull; There is <strong>little </strong>hope of finding your wallet. (Uncountable noun)<br />\r\n&bull; They have very <strong>little</strong> knowledge about politics. (Uncountable noun)</p>\r\n\r\n<h6>So &hellip; that, Such &hellip; that</h6>\r\n\r\n<p><strong>a) to show a fact (usually with a result or consequence)</strong><br />\r\n&bull; Pamela Ander&#39;s feet are big.<br />\r\n(Expresses a fact).<br />\r\n&bull; Pamela Ander&#39;s feet are <strong>so big that</strong> she can&#39;t find shoes her size.<br />\r\n(Emphasizes that you feel strongly about the size of her feet).<br />\r\n<strong>b) to show extreme feelings or an opinion about something</strong><br />\r\n&bull; George Bushoff is an idiot.<br />\r\n(Merely a statement of fact/opinion).<br />\r\n&bull; George Bushoff is <strong>such an idiot that</strong> he doesn&#39;t even know the capital of his own country.<br />\r\n(Emphasizes the speaker&#39;s opinion of the intensity of George Bushoff&#39;s idiocy).<br />\r\n<strong>SO with adjectives and adverbs</strong><br />\r\n<strong>so + adjective/adverb + that + result</strong><br />\r\n&bull; The teacher speaks so clearly that everyone can understand her.<br />\r\n&bull; The sun was so strong that they got burned within 15 minutes.<br />\r\n<strong>SUCH + Nouns</strong><br />\r\n<strong>such + a + (adjective) + singular noun + that + result</strong><br />\r\n(It is common to put an adjective before the noun)<br />\r\n&bull; He is <strong>such a tight person that</strong> he even reuses his servillettes.<br />\r\n&bull; Christopher is <strong>such a handsome man that</strong> all the ladies want him.<br />\r\n&bull; She had <strong>such a long speech that</strong> everyone stopped paying attention to her.<br />\r\n<strong>such + plural/uncountable noun + that + result</strong><br />\r\n&bull; She has <strong>such big feet that</strong> she has to buy special shoes.<br />\r\n&bull; Woodward Restaurant has <strong>such good food that</strong> it&#39;s always full of people.<br />\r\n<strong>SO / SUCH in exclamations</strong><br />\r\nIn exclamations we drop the word &#39;that&#39; and use:<br />\r\ni) such + noun (singular/plural)<br />\r\nii) so + adjective<br />\r\n&bull; You are <strong>such</strong> an idiot! (noun)<br />\r\n&bull; Celebrities have <strong>such</strong> weird tastes! (noun)<br />\r\n&bull; You are <strong>so</strong> stupid! (adjective)<br />\r\n&bull; It&#39;s <strong>so</strong> sunny outside! (adjective)<br />\r\n<strong>Such-and-such</strong><br />\r\nThis is used to talk about a particular type of person or thing that doesn&#39;t need to be specified. It is an unstated generic placeholder.<br />\r\n&bull; People from <strong>such-and-such</strong> areas tend to be wealthy.<br />\r\n&bull; If you do <strong>such-and-such</strong> a job, you will become famous.</p>\r\n\r\n<h6>Very and Too + adjective</h6>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT19.png\" /></div>\r\n\r\n<p>1. The exam is <strong>very</strong> difficult, but Jim can complete it.<br />\r\n2. The exam is <strong>too</strong> difficult. Jim can&#39;t complete it.<br />\r\n<strong>Very</strong> difficult = it is difficult but possible for Jim to complete the exam.<br />\r\n<strong>Too</strong> difficult = It is impossible for Jim to complete the exam.<br />\r\nRemember that <strong>Too</strong> implies a negative result.<br />\r\n<br />\r\n<strong>Too + adjective + infinitive</strong><br />\r\n&bull; Alex couldn&#39;t play basketball because he was <strong>too</strong> short.<br />\r\n&bull; Alex was<strong> too </strong>short to play basketball.<br />\r\n&bull; We are <strong>too</strong> tired to go to the gym.<br />\r\n&bull; Mary was <strong>too</strong> ill to finish her food.<br />\r\n<strong>Too + adjective + for (someone) + infinitive</strong><br />\r\n&bull; I can&#39;t walk to Valparaiso because it is <strong>too</strong> far.<br />\r\n&bull; Valparaiso is <strong>too</strong> far for me to walk.<br />\r\n&bull; It is <strong>too</strong> late for me to go out.<br />\r\n&bull; The soup is <strong>too</strong> cold for Tim to eat.<br />\r\n&bull; The price of the ticket is <strong>too</strong> expensive for Mike to fly to Europe.<br />\r\n<strong>Enough + noun</strong><br />\r\nEnough (pronounced &quot;enuff&quot;)<br />\r\nEnough = sufficient<br />\r\n&bull; There was<strong> enough</strong> food for everybody at the party.<br />\r\n&bull; I had <strong>enough</strong> money to pay for dinner with my girlfriend.<br />\r\n&bull; Is there <strong>enough</strong> time to finish the test?<br />\r\n<strong>Adjective + Enough</strong><br />\r\n&bull; She is pretty <strong>enough</strong> for everybody to notice her. (Everybody notices her because she is very pretty.)<br />\r\n&bull; My friend lives close <strong>enough</strong> to my house to walk.<br />\r\n&bull; Last summer it was hot <strong>enough</strong> to go swimming every day.<br />\r\n<strong>Enough + infinitive</strong><br />\r\n&bull; When she lost her dog, it was <strong>enough</strong> to make her cry.<br />\r\n&bull; He was sick <strong>enough</strong> to stay home from work today.<br />\r\n&bull; I arrived at the airport early <strong>enough</strong> to make my flight to New York.<br />\r\n<br />\r\n<strong>SO</strong> is used to show agreement with positive statements.<br />\r\n<strong>SO + Auxiliary/Be + Subject (pronoun)</strong><br />\r\nThe Auxiliary (or To Be/Have) needs to agree with the verb tense in the original statement.<br />\r\nIt is similar to using <strong>TOO</strong> at the end of a sentence.</p>\r\n\r\n<table align=\"center\" border=\"1\" style=\"margin-bottom:30px; margin-top:30px; width:700px\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Person A</th>\r\n			<th colspan=\"2\">Person B</th>\r\n		</tr>\r\n		<tr>\r\n			<td>I am happy.</td>\r\n			<td>So am I.</td>\r\n			<td>= I am happy too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I&#39;m going to Brazil in the summer.</td>\r\n			<td>So am I.</td>\r\n			<td>= I am going to Brazil too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>You look nice today.</td>\r\n			<td>So do you.</td>\r\n			<td>= You look nice too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Stephanie has a new boyfriend.</td>\r\n			<td>So does Mary.</td>\r\n			<td>= Mary has a new one too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>We went to the concert last night.</td>\r\n			<td>So did I.</td>\r\n			<td>= I went to the concert too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I would love a coffee right now.</td>\r\n			<td>So would I.</td>\r\n			<td>= I would love a coffee too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>He will win a prize.</td>\r\n			<td>So will I.</td>\r\n			<td>= I will win one too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>They have finished their homework.</td>\r\n			<td>So have I.</td>\r\n			<td>= I have finished too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I can speak two languages.</td>\r\n			<td>So can I.</td>\r\n			<td>= I can speak two too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>He should study more.</td>\r\n			<td>So should I.</td>\r\n			<td>= I should study more too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>We could see the mountains.</td>\r\n			<td>So could we.</td>\r\n			<td>= We could see them too.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>My brother had eaten too much.</td>\r\n			<td>So had I.</td>\r\n			<td>= I had eaten too much too.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Sometimes you can use <strong>So + Auxiliary + Subject</strong> as a continuation of the first part of the sentence.<br />\r\n&bull; John can sing well and so can his brother.<br />\r\n(= John can sing will and his brother can sing well too)</p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT20.png\" /></div>\r\n\r\n<h6>NEITHER</h6>\r\n\r\n<p><strong>Neither</strong> is used to show agreement with negative statements.<br />\r\n<strong>Neither + Auxiliary + Subject (pronoun)</strong><br />\r\nThe Auxiliary needs to agree with the verb tense in the original statement.<br />\r\nIt is similar to using <strong>either</strong> at the end of a sentence, although <strong>Neither</strong> is more commonly used, especially in spoken English.<br />\r\nA: I don&#39;t understand Spanish.<br />\r\nB: Neither do I. (= I don&#39;t understand Spanish either.)<br />\r\nA: I cannot swim.<br />\r\nB: Neither can I. (= I can&#39;t swim either.)<br />\r\nSometimes people respond <strong>Me Neither</strong> instead of Neither + Auxiliary + Subject though this is very informal spoken English.</p>\r\n\r\n<table align=\"center\" border=\"1\" style=\"margin-bottom:30px; margin-top:30px; width:700px\">\r\n	<tbody>\r\n		<tr>\r\n			<th>Person A</th>\r\n			<th colspan=\"2\">Person B</th>\r\n		</tr>\r\n		<tr>\r\n			<td>I am not hungry.</td>\r\n			<td>Neither am I.</td>\r\n			<td>= I&#39;m not hungry either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I&#39;m not going to quit.</td>\r\n			<td>Neither am I.</td>\r\n			<td>= I&#39;m not going to quit either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>They don&#39;t speak French.</td>\r\n			<td>Neither do I.</td>\r\n			<td>= I don&#39;t speak French either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Stephanie doesn&#39;t eat meat.</td>\r\n			<td>Neither does Mary.</td>\r\n			<td>= Mary doesn&#39;t eat meat either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Mary didn&#39;t go to the party.</td>\r\n			<td>Neither did I.</td>\r\n			<td>= I didn&#39;t go either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I wouldn&#39;t like to do his job.</td>\r\n			<td>Neither would I.</td>\r\n			<td>= I wouldn&#39;t like to do it either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>He won&#39;t stop talking.</td>\r\n			<td>Neither will you.</td>\r\n			<td>= You won&#39;t stop either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>You haven&#39;t finished your meal.</td>\r\n			<td>Neither have you.</td>\r\n			<td>= You haven&#39;t finished either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I can&#39;t reach the top shelf.</td>\r\n			<td>Neither can I.</td>\r\n			<td>= I can&#39;t reach it either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>You shouldn&#39;t talk in the movie.</td>\r\n			<td>Neither should you.</td>\r\n			<td>= You shouldn&#39;t talk either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>We couldn&#39;t hear him.</td>\r\n			<td>Neither could we.</td>\r\n			<td>= We couldn&#39;t hear him either.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>I hadn&#39;t seen her before.</td>\r\n			<td>Neither had I.</td>\r\n			<td>= I hadn&#39;t seen her before either.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT21.png\" /></div>\r\n\r\n<p><strong>LIKE</strong><br />\r\n<strong>LIKE</strong> = similar to; the same as.<br />\r\nThe structure of the sentence is usually: VERB + LIKE + NOUN / PRONOUN.<br />\r\n&bull; He speaks <strong>like</strong> a native speaker. (= He speaks similar to a native speaker)<br />\r\n&bull; She looks <strong>like</strong> a supermodel.<br />\r\n&bull; You look <strong>like</strong> him.<br />\r\n&bull; Stop behaving <strong>like</strong> animals!<br />\r\n<strong>LIKE</strong> is mainly used as a comparison.<br />\r\n<strong>AS</strong><br />\r\n<strong>AS</strong> = the way; in the same way; in the same condition<br />\r\nThe structure of the sentence is usually: AS + SUBJECT + VERB.<br />\r\n&bull; Nobody sings <strong>as</strong> she does. (= Nobody sings in the same way she does)<br />\r\n&bull; They went to the party <strong>as</strong> they were.<br />\r\n&bull; Please don&#39;t use my plate <strong>as</strong> an ashtray.<br />\r\n&bull; <strong>As</strong> I said before, we have to get ready.<br />\r\nNotice how you could replace <strong>AS</strong> with <strong>&#39;the way&#39;</strong> or <strong>&#39;in the same way&#39;</strong> and maintain the same meaning.<br />\r\nIt is common in American English to use LIKE instead of AS. However, it is generally considered informal to use it in this way.<br />\r\n&bull; We play football <strong>like</strong> champions do.<br />\r\nAnother use of AS is to say what the <strong>role/position/function of a person/thing</strong> is.<br />\r\n&bull; He started work<strong> as</strong> a carpenter.<br />\r\n&bull; She used the tapestry<strong> as</strong> decoration in her living room.<br />\r\n&bull; I worked <strong>as </strong>an English teacher at the school.<br />\r\n<strong>LIKE vs. AS</strong><br />\r\nBe careful, in similar sentences that use LIKE and AS, the meanings of each sentence are very different. For example:<br />\r\n&bull; <strong>As</strong> your boss, I must warn you to be careful. (I am your boss - I am in the role of boss - REALITY.)<br />\r\n&bull; <strong>Like</strong> your boss, I must warn you to be careful. (I am not your boss, but he/she and I have a similar opinion. - COMPARISON)<br />\r\nAnother example with different meanings:<br />\r\n&bull; This curry is hot, <strong>like</strong> all good curries. (Like + Noun Phrase)<br />\r\n= Similar to all good curries<br />\r\n&bull; This curry is hot, <strong>as</strong> it should be. (As + Clause)<br />\r\n= Comparing to the way a curry should be. Notice how after AS there is a Subject + Verb (= a clause)<br />\r\n<strong>AS IF</strong><br />\r\nIn English we also use <strong>as if</strong> to make comparisons. However it has a few distinct characteristics to its use:<br />\r\n1. The verb after AS IF is always in the past subjunctive, no matter what tense the sentence is.<br />\r\n2. If the verb BE directly follows AS IF, we use <strong>were</strong> for all personal pronouns.<br />\r\n&bull; He looks<strong> as if</strong> he knew the answer... but he doesn&#39;t.<br />\r\n(The verbs LOOKS indicates this sentence is in the present &ndash; but the verb after AS IF &ndash; knew - is in the past subjuntive).<br />\r\n&bull; She walks <strong>as if</strong> she were a supermodel.<br />\r\n(The verb after AS IF &ndash; be &ndash; has been changed to<strong> were</strong> and not <strong>was</strong>).<br />\r\n&bull; He boarded the airplane <strong>as if</strong> he were a seasoned traveller.<br />\r\n&bull; He spends money <strong>as if</strong> he owned a bank.<br />\r\n<strong>Using AS + Adjective + AS</strong><br />\r\nWe use this structure to talk about people, animals or things which are equal in some way. This is a form of comparison.<br />\r\n&bull; Chris is <strong>as tall as</strong> his brother.</p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/GHT22.png\" /></div>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n', 'goc-hoc-tap/grammar.jpg', 1, '2020-03-02 04:26:34');
INSERT INTO `study_space` (`id`, `title`, `code`, `description`, `detail`, `image`, `status`, `created_at`) VALUES
(2, 'STARTERS-MOVERS-FLYERS', 'starters-movers-flyers', 'Kho tài liệu ôn tập giúp các em dễ dàng trong quen hình thức đề thi, thực hành đề để chuẩn bị các kỳ thi chuẩn quốc tế Starters-Movers-Flyers.', '<div class=\"container text-justify\">\r\n            <h4 class=\"text-primary\"><strong>Starters</strong></h4>\r\n            <p>Cambridge English: Starters (YLE Starters) là bài thi đầu tiên trong bộ ba bài thi của chương trình \'Cambridge English: Young Learners (YLE)\' dành cho trẻ em. Các bài kiểm tra \'Cambridge English: Young Learners\' giới thiệu đến các em những bài nói và viết tiếng Anh hàng ngày và là một cách tuyệt vời để các em tự tin và cải thiện khả năng tiếng Anh của mình.<br><br>\r\n\r\n			Các bài kiểm tra được viết xung quanh những chủ đề quen thuộc và tập trung vào các kỹ năng cần thiết để giao tiếp hiệu quả bằng tiếng Anh thông qua nghe, nói, đọc và viết.</p>\r\n\r\n			<a href=\"http://www.cambridgeenglish.org/vn/exams-and-tests/starters/\" target=\"true\">http://www.cambridgeenglish.org/vn/exams-and-tests/starters/</a>\r\n			<h5><u>I. Starters CD -Book – Answer booklet:</u></h5>\r\n			<p>1. Starters 1 (2017): Book: <a href=\"http://ouo.io/zde09Y\" target=\"true\">Tải về</a>;  CD: <a href=\"http://ouo.io/T3QfY\" target=\"true\">Tải về</a>  Answer booklet: <a href=\"https://ouo.press/OWBBjE\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    2. Starters 2 (2017): Book: <a href=\"http://ouo.io/pJRt24\" target=\"true\">Tải về</a>; CD: <a href=\"https://ouo.press/3kd2g8k\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/MDYcc3\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    3. Starters 3 (2017): Book: <a href=\"http://ouo.io/F2rMBr\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/kiW2Vq\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/lA7Ksuj\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    4. Starters 4 (2017): Book: <a href=\"http://ouo.io/uFgAQ8\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/Yvn5w\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/qv2pAI\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    5. Starters 5 (2017): Book: <a href=\"https://ouo.press/THQQAq\" target=\"true\">Tải về</a>; CD: <a href=\"https://ouo.press/AofN9X\" target=\"true\">Tải về</a>;Answer booklet: <a href=\"http://ouo.io/x59ZMV\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    6. Starters 6 (2017): Book: <a href=\"http://ouo.io/Z63HLS\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/G3cEyS\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/KfzsEax\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    7. Starters 7 (2017): Book: <a href=\"http://ouo.io/sHdNEY\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/PLy7S9\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    8. Starters 8 (2017): Book: <a href=\"http://ouo.io/HlVYRG\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/Pkigry\" target=\"true\">Tải về</a><br><br>\r\n\r\n			9. Đề thi mẫu từ Cambridge (2017)<br><br>\r\n\r\n			<a href=\"http://ouo.io/pgmaWA\" target=\"true\">Listening Sample CD</a><br>\r\n			<a href=\"http://ouo.io/YFj3t\" target=\"true\">Listening Sample Paper</a><br>\r\n			<a href=\"http://ouo.io/2Alk1Ub\" target=\"true\">Listening Sample Pape Key</a><br>\r\n			<a href=\"http://ouo.io/jlvQeb\" target=\"true\">Reading Writing Sample Paper</a><br>\r\n			<a href=\"http://ouo.io/YHxvae\" target=\"true\">Reading Writing Sample Paper Key</a></p>\r\n\r\n			<h4 class=\"text-primary\"><strong>Movers</strong></h4>\r\n			<p>\'Cambridge English: Movers\' (YLE Movers) là bài thi thứ hai trong bộ ba bài thi của chương trình \'Cambridge English: Young Learners\' (YLE) dành cho trẻ em. Các bài kiểm tra \'Cambridge English: Young Learners\' giới thiệu đến các em những bài nói và viết tiếng Anh hàng ngày và là một cách tuyệt vời để các em tự tin và cải thiện khả năng tiếng Anh của mình. <br><br>\r\n\r\n			Các bài kiểm tra được viết xung quanh những chủ đề quen thuộc và tập trung vào các kỹ năng cần thiết để giao tiếp hiệu quả bằng tiếng Anh thông qua nghe, nói, đọc và viết.</p>\r\n			<a href=\"http://www.cambridgeenglish.org/vn/exams-and-tests/movers/\">http://www.cambridgeenglish.org/vn/exams-and-tests/movers/</a>\r\n			<h5><u>II. Movers CD -Book – Answer booklet:</u></h5>\r\n			<p>   1. Movers 1 (2017): Book: <a href=\"http://ouo.io/XIc91G\" target=\"true\">Tải về</a>;  CD: <a href=\"http://ouo.io/9by4A\" target=\"true\">Tải về</a>  Answer booklet: <a href=\"https://ouo.press/UiWj93L\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    2. Movers 2 (2017): Book: <a href=\"http://ouo.io/Mj2bEf\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/yb8kx8\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/x1OQ1\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    3. Movers 3 (2017): Book: <a href=\"http://ouo.io/v6i2h\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/ZgE4A\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/22iWIi\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    4. Movers 4 (2017): Book: <a href=\"http://ouo.io/d1nNFm\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/32EWfZ\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/UUSdeq\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    5. Movers 5 (2017): Book: <a href=\"http://ouo.io/abjfNJ\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/UCiV4v\" target=\"true\">Tải về</a>;Answer booklet: <a href=\"http://ouo.io/YFnTV0\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    6. Movers 6 (2017): Book: <a href=\"http://ouo.io/eFMvnC\" target=\"true\">Tải về</a>; CD: <a href=\"https://ouo.press/w6ecP\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/3CKcXf\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    7. Movers 7 (2017): Book: <a href=\"http://ouo.io/cN5cp\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/9UaKp8\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/k8FBFh\" target=\"true\">Tải về</a><br><br>\r\n\r\n		    8. Movers 8 (2017): Book: <a href=\"http://ouo.io/iw3y7F\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/N4cG2\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/Yvsn1r\" target=\"true\">Tải về</a><br><br>\r\n\r\n			9. Movers pearson:<br><br>\r\n\r\n			CD: <a href=\"http://ouo.io/uY33JB\" target=\"true\">Tải về</a><br>\r\n			Practice Tests Plus MoversTeacher’s Book: <a href=\"http://ouo.io/H9YWkT\" target=\"true\">Tải về</a><br>\r\n			Movers Practice Tests Plus Student’s Book:<a href=\"http://ouo.io/kRzGzD\" target=\"true\"> Tải về</a><br>\r\n			10. Movers word list: <a href=\"https://ouo.press/WB0L7\" target=\"true\">Tải về</a></p>\r\n\r\n			<h4 class=\"text-primary\"><strong>Flyers</strong></h4>\r\n			<p>\'Cambridge English: Flyers\' (YLE Flyers) là phần thứ ba trong bộ ba các bài kiểm tra của chương trình \'Cambridge English: Young Learners\' (YLE) dành cho trẻ em. Các bài kiểm tra \'Cambridge English: Young Learners\' giới thiệu đến các em những bài nói và viết tiếng Anh hàng ngày và là một cách tuyệt vời để các em tự tin và cải thiện khả năng tiếng Anh của mình. <br><br>\r\n\r\n			Các bài kiểm tra được viết xung quanh những chủ đề quen thuộc và tập trung vào các kỹ năng cần thiết để giao tiếp hiệu quả bằng tiếng Anh thông qua nghe, nói, đọc và viết.</p>\r\n			<a href=\"http://www.cambridgeenglish.org/vn/exams-and-tests/flyers/\">http://www.cambridgeenglish.org/vn/exams-and-tests/flyers/</a>\r\n			<h5><u>III. Flyers CD -Book – Answer booklet:</u></h5>\r\n			<p>  1. Flyers 1 (2017): Book: <a href=\"https://ouo.press/CnYK0Z\" target=\"true\">Tải về</a>;  CD: <a href=\"http://ouo.io/3UxnS8\" target=\"true\">Tải về</a>  Answer booklet: <a href=\"http://ouo.io/zt8tzb\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  2. Flyers 2 (2017): Book: <a href=\"http://ouo.io/tutkSd\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/eCqj1H\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/xcm0XS\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  3. Flyers 3 (2017): Book: <a href=\"http://ouo.io/dMzGg2\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/bUVpUB\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/40ybk\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  4. Flyers 4 (2017): Book: <a href=\"http://ouo.io/DFejrT\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/h4BvGX\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/g07Z4\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  5. Flyers 5 (2017): Book: <a href=\"http://ouo.io/RScSiK\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/jsYGgT\" target=\"true\">Tải về</a>;Answer booklet: <a href=\"http://ouo.io/6vUkaNj\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  6. Flyers 6 (2017): Book: <a href=\"http://ouo.io/y5HsJv\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/pr5N2i\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/SUsEy5\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  7. Flyers 7 (2017): Book: <a href=\"https://ouo.press/8697Zk\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/5BzqRv\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/mp8YPk\" target=\"true\">Tải về</a><br><br>\r\n\r\n			  8. Flyers 8 (2017): Book: <a href=\"http://ouo.io/yAg5dI\" target=\"true\">Tải về</a>; CD: <a href=\"http://ouo.io/woN5lf\" target=\"true\">Tải về</a>; Answer booklet: <a href=\"http://ouo.io/32dYa\" target=\"true\">Tải về</a><br><br>\r\n\r\n			9. Flyers word list: <a href=\"http://ouo.io/i19I2\" target=\"true\">Tải về</a></p><br><br>\r\n\r\n			<p>Cambridge] YLE Official Preparation Materials<br>\r\n			● YLE Sample Papers Volume 1 and 2<br>\r\n			● Word List Picture Book for Starters, Movers, Flyers<br>\r\n			Download for free =&gt;<a href=\"https://cloud.mail.ru/public/2jmR/ASdBx9HGC\" target=\"true\">cloud.mail.ru/public/2jmR/ASdBx9HGC</a>\r\n			</p>\r\n			<div align=\"center\"><img width=\"700\" src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/cam/_f7fVRTbrJM.jpg\"></div><br><br>\r\n			\r\n\r\n			<p>[Cambridge] TESTS for Starters 1-9 | Book + Key + ', 'goc-hoc-tap/ket-pet2.jpg', 1, '2020-03-02 04:36:35'),
(3, 'KET (A2) - PET(B1)', 'ket-a2-petb1', 'Kho tài liệu hỗ trợ các em chuẩn bị kỳ thi KET-PET và cũng là tài liệu tham khảo thực hành cho các anh chị ôn tập thi A2 và B1.', '<div class=\"container text-justify\">\r\n<h4><strong>Cambridge English: Key (KET) for Schools</strong></h4>\r\n\r\n<p>Chứng chỉ &#39;Cambridge English: Key (KET) for Schools&#39; cho thấy rằng một học sinh c&oacute; thể sử dụng tiếng Anh để giao tiếp trong những t&igrave;nh huống đơn giản. Đ&oacute; l&agrave; chương tr&igrave;nh học tiếp nối sau &#39;Cambridge English: Young Learners (YLE)&#39; v&agrave; cũng l&agrave; điểm khởi đầu tốt để những trẻ lớn hơn bắt đầu học tiếng Anh.<br />\r\n<br />\r\nB&agrave;i kiểm tra n&agrave;y gi&uacute;p học sinh tự tin để tiếp tục học cho c&aacute;c kỳ thi tiếng Anh ở cấp độ cao hơn, như &#39;Cambridge English: Preliminary (PET) for Schools&#39;.<br />\r\n<br />\r\n&#39;Cambridge English: Key for Schools&#39; được định hướng ở c&ugrave;ng cấp độ CEFR với &#39;Cambridge English: Key (KET)&#39; nhưng được x&acirc;y dựng với nội dung d&agrave;nh cho người học ở lứa tuổi học sinh hơn l&agrave; người lớn.</p>\r\n<a href=\"http://www.cambridgeenglish.org/vn/exams-and-tests/key-for-schools/\">http://www.cambridgeenglish.org/vn/exams-and-tests/key-for-schools/</a>\r\n\r\n<h5>1/ Cambrige KET 1:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET1.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/9dxsssn27eky7p6/Cambridge+KET+1+Audio.rar\" target=\"true\">- Cambrige KET 1 Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/73re8n8s6fmfn6t/Cambridge+KET+1+Book.pdf\" target=\"true\">- Cambrige KET 1 Book</a>\r\n\r\n<h5>2/ Cambrige KET 2:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET2.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/borc6zy5db1wbjj/Cambridge+KET+2+Audio.rar\" target=\"true\">- Cambrige KET 2 Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/rodl6a5fqt7jufe/Cambridge+KET+2+Book.pdf\" target=\"true\">- Cambrige KET 2 Book</a>\r\n\r\n<h5>3/ Cambrige KET 3:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET3.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/tbubd9qsdbqzvx2/Cambridge+KET+3+Audio.rar\" target=\"true\">- Cambrige KET 3 Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/1eixtnid2m7hkvm/Cambridge+KET+3+Book.pdf\" target=\"true\">- Cambrige KET 3 Book</a>\r\n\r\n<h5>4/ Cambrige KET 4:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET4.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/vzgro2asansu32l/Cambridge+KET+4+Audio.rar\" target=\"true\">- Cambrige KET 4 Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/umfkq4q74f75sx7/Cambridge+KET+4+Book.pdf\" target=\"true\">- Cambrige KET 4 Book</a>\r\n\r\n<h5>5/ Cambrige KET 5:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET5.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0BzKeXMrBlOL9YlFiVDgwdzV1RU0/view\" target=\"true\">- Cambrige KET 5 Audio (Test 1+2)</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0BzKeXMrBlOL9NkFaZUNRSnd3ZkU/view\" target=\"true\">- Cambrige KET 5 Audio (Test 3+4)</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcNzV0VDZ2NEU1UDg/view\" target=\"true\">- Cambrige KET 5 Book</a>\r\n\r\n<h5>6/ Cambrige KET 6:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET6.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNccjE3OFV1QWdfcVk/view\" target=\"true\">- Cambrige KET 6 Audio</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcSEhQV2x4dl9XdVU/view\" target=\"true\">- Cambrige KET 6 Book</a>\r\n\r\n<h5>7/ Cambrige KET 7:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET7.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcQzBqcy1XN2d5SjQ/view\" target=\"true\">- Cambrige KET 7 Audio</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcVVdpSGZQQzkxdzQ/view\" target=\"true\">- Cambrige KET 7 Book</a>\r\n\r\n<h5>8/ Cambrige KET Extra:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET8.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/2s7wio6695e07b7/Cambridge+KET+Extra+Audio.rar\" target=\"true\">- Cambrige KET Extra Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/g37s4wc6jxgpr5i/Cambridge+KET+Extra+Book.pdf\" target=\"true\">- Cambrige KET Extra Book</a>\r\n\r\n<h5>9/ KET Objective:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET9.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/bl8ed6vvxj3ji1p/KET+Objective+Audio.rar\" target=\"true\">- KET Objective Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/0fsv1wg2xljwcvu/KET+Objective+Book.rar\" target=\"true\">- KET Objective Book</a>\r\n\r\n<h5>10/ Target KET for school:</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/96-KET10.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/wk12ekcugflj5gq/Target+KET+for+Schools+Audio.rar\" target=\"true\">- Target KET for school Audio</a><br />\r\n<a class=\"theP\" href=\"http://www.mediafire.com/file/7gdo7jieu5lf1dw/Target+KET+for+Schools+Book.rar\" target=\"true\">- Target KET for school Book</a><br />\r\n<br />\r\n&nbsp;\r\n<h4><strong>Cambridge English: Preliminary for Schools</strong></h4>\r\n\r\n<p>Chứng chỉ &#39;Cambridge English: Preliminary (PET) for Schools&#39; cho thấy rằng một học sinh đ&atilde; nắm vững c&aacute;c kiến ​​thức cơ bản về tiếng Anh v&agrave; c&oacute; những kỹ năng ng&ocirc;n ngữ thực tế để sử dụng h&agrave;ng ng&agrave;y.<br />\r\n<br />\r\nKỳ thi n&agrave;y l&agrave; một bước tiến hợp l&yacute; trong h&agrave;nh tr&igrave;nh học ng&ocirc;n ngữ của học sinh chuyển tiếp từ &#39;Cambridge English: Key (KET) for Schools&#39; sang &#39;Cambridge English: First (FCE) for Schools&#39;.<br />\r\n<br />\r\n&#39;Cambridge English: Preliminary (PET) for Schools&#39; được định hướng ở c&ugrave;ng cấp độ CEFR với &#39;Cambridge English: Preliminary (PET)&#39; nhưng được x&acirc;y dựng với nội dung d&agrave;nh cho người học ở lứa tuổi học sinh hơn l&agrave; người lớn.</p>\r\n<a href=\"http://www.cambridgeenglish.org/vn/exams-and-tests/preliminary-for-schools/\">http://www.cambridgeenglish.org/vn/exams-and-tests/preliminary-for-schools/</a>\r\n\r\n<h5>1/ Cambrige Preliminary English Test 1</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/1.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcaU9JOHFuNFNKYjA/view\" target=\"true\">-Cambrige Preliminary English Test 1 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNceENsVWVqbkJvazg/view\" target=\"true\">-Cambrige Preliminary English Test 1 Audio</a>\r\n\r\n<h5>2/ Cambrige Preliminary English Test 2</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/2.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcbGtzYlp5aEpHTXM/view\" target=\"true\">-Cambrige Preliminary English Test 2 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcc0Q1VWM2dGlyeWc/view\" target=\"true\">-Cambrige Preliminary English Test 2 Audio</a>\r\n\r\n<h5>3/ Cambrige Preliminary English Test 3</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/3.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcWUMxYmdZVE5MeUU/view\" target=\"true\">-Cambrige Preliminary English Test 3 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNccWNuRklIbVplVU0/view\" target=\"true\">-Cambrige Preliminary English Test 3 Audio</a>\r\n\r\n<h5>4/ Cambrige Preliminary English Test 4</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/4.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNca3RfWW1FbVRELVk/view\" target=\"true\">-Cambrige Preliminary English Test 4 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcdFMzNGJ1cVRMVTg/view\" target=\"true\">-Cambrige Preliminary English Test 4 Audio</a>\r\n\r\n<h5>5/ Cambrige Preliminary English Test 5</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/5.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNceHl2ZHF6a2hucHc/view\" target=\"true\">-Cambrige Preliminary English Test 5 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcQlQ4MUhXb1c5d28/view\" target=\"true\">-Cambrige Preliminary English Test 5 Audio</a>\r\n\r\n<h5>6/ Cambrige Preliminary English Test 6</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/6.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcbWR2cklEM1UwUDg/view\" target=\"true\">-Cambrige Preliminary English Test 6 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcUlhDZmV4NnJGMW8/view\" target=\"true\">-Cambrige Preliminary English Test 6 Audio</a>\r\n\r\n<h5>7/ Cambrige Preliminary English Test 7</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/7.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcV1BfSXprNDZMdFE/view\" target=\"true\">-Cambrige Preliminary English Test 7 Book</a><br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcTEQxXy1mcnZURzQ/view\" target=\"true\">-Cambrige Preliminary English Test 7 Audio</a>\r\n\r\n<h5>8/ Cambrige Preliminary English Test 8</h5>\r\n&nbsp;\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/8.jpg\" /></div>\r\n<br />\r\n<a class=\"theP\" href=\"https://drive.google.com/file/d/0B31GOEeG-bNcUTZHVER3TWpkenM/view\" target=\"true\">-Cambrige Preliminary English Test 8 Book</a><br />\r\n<br />\r\n&nbsp;\r\n<p>[Cambridge] Trainer<br />\r\nBooks and Audio files can be found here:<br />\r\nKET Trainer =&gt;<a href=\"https://cloud.mail.ru/public/6wva/y1eWx7iNp\" target=\"true\"> cloud.mail.ru/public/6wva/y1eWx7iNp</a><br />\r\nPET Trainer =&gt;<a href=\"https://cloud.mail.ru/public/6V7t/q3sz6jF44\" target=\"true\"> cloud.mail.ru/public/6V7t/q3sz6jF44</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/CzuTeYR010I.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Official Exam Papers Extra<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/GDyf/y81TgtYPq\" target=\"true\"> cloud.mail.ru/public/GDyf/y81TgtYPq</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/l3p2AebEbVU.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>Cambridge Official Exam Papers from KET<br />\r\nBooks and Audio files for all volumes can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/3F71/HeTJhk3xy\" target=\"true\"> cloud.mail.ru/public/3F71/HeTJhk3xy</a></p>\r\n\r\n<p>Cambridge Official Exam Papers from PET<br />\r\nBooks and Audio files for all volumes can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/BwkD/88x6YE7rr\" target=\"true\"> cloud.mail.ru/public/BwkD/88x6YE7rr</a></p>\r\n\r\n<p>Cambridge Official Exam Papers from FCE<br />\r\nBooks and Audio files for all volumes can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/B6yp/UHdchREgs\" target=\"true\"> cloud.mail.ru/public/B6yp/UHdchREgs</a></p>\r\n\r\n<p>[Cambridge] Grammar and Vocabulary<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/DcKa/ArC8GkiiM\" target=\"true\"> cloud.mail.ru/public/DcKa/ArC8GkiiM</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/qHxiZpUnYdY.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Direct<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/JmTF/9gksyGP6e\" target=\"true\"> cloud.mail.ru/public/JmTF/9gksyGP6e</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/HBh0ql5z8uo.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Compact<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/D8fU/zwkYa8idu\" target=\"true\"> cloud.mail.ru/public/D8fU/zwkYa8idu</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/pyGPlM-aLEc.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Complete<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/2VmZ/ALhdw9Bbm\" target=\"true\"> cloud.mail.ru/public/2VmZ/ALhdw9Bbm</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/l-RozcPkQfw.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Objective<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/65jo/juTPbEUAC\" target=\"true\"> cloud.mail.ru/public/65jo/juTPbEUAC</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/VtTtucG5rHc.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<p>[Cambridge] Prepare!<br />\r\nBooks and Audio files for both levels can be found here:<br />\r\n=&gt;<a href=\"https://cloud.mail.ru/public/KLh5/vch3CuFfF\" target=\"true\"> cloud.mail.ru/public/KLh5/vch3CuFfF</a></p>\r\n\r\n<div><img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/teen/them/lBBO2pY33VM.jpg\" style=\"width:700px\" /></div>\r\n&nbsp;\r\n\r\n<h4>Ch&uacute;c c&aacute;c bạn vui vẻ v&agrave; th&agrave;nh c&ocirc;ng!!!</h4>\r\n</div>\r\n', 'goc-hoc-tap/YLE-1-ArtsyCraftsyMom.jpg', 1, '2020-03-02 04:15:17'),
(4, 'LISTENING', 'listening', 'Listening là kĩ năng rất cần sự kiên trì luyện tập, và chắc chắn là nên đi từ dễ tới khó. Nếu bạn đang \\\"chật vật\\\" với phần Listening của bộ sách luyện thi Cambridge,...', '<div class=\"container text-justify\">\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/listening/1212.jpg\" />\r\n&nbsp;\r\n\r\n<p>Listening l&agrave; kĩ năng rất cần sự ki&ecirc;n tr&igrave; luyện tập, v&agrave; chắc chắn l&agrave; n&ecirc;n đi từ dễ tới kh&oacute;. Nếu bạn đang &quot;chật vật&quot; với phần Listening của bộ s&aacute;ch luyện thi Cambridge, vậy th&igrave; H&Atilde;Y DỪNG LẠI v&agrave; thử bộ s&aacute;ch n&agrave;y trước nh&eacute;!<br />\r\n<br />\r\nBasic Listening Tactics<br />\r\nDeveloping listening tactics<br />\r\nExpanding listening tactics<br />\r\nBộ s&aacute;ch gồm HƠN 400 FILES NGHE về c&aacute;c t&igrave;nh huống th&ocirc;ng dụng h&agrave;ng ng&agrave;y v&agrave; giọng chuẩn Anh - Anh rất giống c&aacute;c b&agrave;i thi thật của IELTS. Do đ&oacute;, bạn c&oacute; thể vừa l&agrave;m quen với &quot;giọng n&oacute;i&quot; kh&oacute; nghe trong c&aacute;c b&agrave;i thi IELTS vừa học được từ vựng c&aacute;c chủ đề th&ocirc;ng dụng cho Speaking Part 1, 2, 3.<br />\r\n<br />\r\nLINK DOWNLOAD<a href=\"https://drive.google.com/drive/folders/0B8r4m0vMWlZFRm0zSWFrZWpobXM\" target=\"true\"> tại đ&acirc;y.</a></p>\r\n\r\n<p>Theo Luyện Ielts Writing &amp; Speaking theo từng mục ti&ecirc;u Facebook Page</p>\r\n&nbsp;\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/listening/1213.jpg\" />\r\n&nbsp;\r\n\r\n<p>LINK DOWNLOAD S&Aacute;CH: <a href=\"http://bit.ly/2JCf8U9\" target=\"true\">http://bit.ly/2JCf8U9</a></p>\r\n\r\n<h4>Ch&uacute;c c&aacute;c bạn vui vẻ v&agrave; th&agrave;nh c&ocirc;ng!!!</h4>\r\n</div>\r\n', 'goc-hoc-tap/Social-Listening.jpg', 1, '2020-03-02 04:45:49'),
(5, 'IELTS', 'ielts', 'Cambridge IELTS là bộ tài liệu do đại học Cambridge tổng hợp dựa trên đề thi thực tế các năm. Thông thường mỗi năm NXB sẽ phát hành 1 cuốn, kể từ khi ra đời đến hiện tại – 2017, bộ sách này đã bao gồm 12 cuốn.', '<div class=\"container text-justify\">\r\n<p>Cambridge IELTS l&agrave; bộ t&agrave;i liệu do đại học Cambridge tổng hợp dựa tr&ecirc;n đề thi thực tế c&aacute;c năm. Th&ocirc;ng thường mỗi năm NXB sẽ ph&aacute;t h&agrave;nh 1 cuốn, kể từ khi ra đời đến hiện tại &ndash; 2017, bộ s&aacute;ch n&agrave;y đ&atilde; bao gồm 12 cuốn.<br />\r\n<br />\r\nXuy&ecirc;n suốt bộ s&aacute;ch học vi&ecirc;n c&oacute; thể thấy qu&aacute; tr&igrave;nh thay đổi của đề thi IELTS về độ kh&oacute; cũng như một số cấu tr&uacute;c trong đề thi. Theo ph&acirc;n t&iacute;ch của c&aacute;c chuy&ecirc;n gia luyện thi IELTS tại Trung t&acirc;m Ngoại ngữ Quốc tế &Acirc;u Việt &Uacute;c, đề thi IELTS đang kh&oacute; dần l&ecirc;n theo thời gian, đề th&igrave; thường xuất hiện những chủ đề mới v&agrave; kh&oacute;, hướng đến đ&aacute;nh gi&aacute; khả năng tư duy học thuật của người thi.<br />\r\n<br />\r\nDưới đ&acirc;y EVAS cung cấp đầy đủ cho học vi&ecirc;n trọn bộ IELTS Cambridge từ 1-12, tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i khuy&ecirc;n c&aacute;c học vi&ecirc;n chỉ n&ecirc;n luyện đề từ Cam 6 trở đi. C&aacute;c cuốn từ 1-5 chỉ để tham khảo v&igrave; kh&ocirc;ng c&ograve;n ph&ugrave; hợp với đề thi thực tế.</p>\r\n\r\n<p>Cam 1:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyITXNLam5oSUtyNXc/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 2:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIUkhBTWZ0ak9iS1U/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 3:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIdjZheXlHTE5Hems/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 4:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIVE1WTmlEY0ticGs/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 5:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIQ0ZOWFBQdC02OFU/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 6:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIeTYtVGladzlFSlk/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 7:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIdWdncm1pVWN1YVk/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 8:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIZlVIXzJRdlRzU1E/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 9:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIX3l0QkhULWZpNk0/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 10:<a href=\"http://filecloud.io/no4rtvuhf\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 11:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIOXBTUHBWYUJmQk0/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>Cam 12:<a href=\"https://drive.google.com/file/d/0B25ZkaDLMyyIZElaWFFhTkhKN1E/view\" target=\"true\"> Download</a></p>\r\n<br />\r\n<br />\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/listening/ielts-cam-13.png\" />\r\n<p>Cam 13:<a href=\"https://secufiles.com/dWhl/Cam_13_B%E1%BA%A3n_%C4%90%E1%BA%B9p_Anh_ng%E1%BB%AF_ZIM.rar\" target=\"true\"> Download</a></p>\r\n&nbsp;\r\n\r\n<h4>Trọn bộ t&agrave;i liệu IELTS Reading Recent Actual Test Vol 1, 2, 3, 4, 5 {PDF + Audio}</h4>\r\n&nbsp;\r\n\r\n<p>IELTS Reading Recent Actual Test Vol 1:<a href=\"https://drive.google.com/file/d/1g5UYw-LhUoK7nZbwNDnI4BLNI9CKyft8/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Reading Recent Actual Test Vol 2:<a href=\"https://drive.google.com/file/d/1WNyVqrO1un0WvBt1Wpo1R8GbWdgbuVrt/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Reading Recent Actual Test Vol 3:<a href=\"https://drive.google.com/file/d/1U063HaZdNSKcE5PqwNkK7CbDz7ocPeZx/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Reading Recent Actual Test Vol 4:<a href=\"https://drive.google.com/file/d/1NdQj_W0_Bs0wY-EUWI47XDfP1B55SSQz/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Reading Recent Actual Test Vol 5:<a href=\"https://drive.google.com/file/d/1I2dHTYBCLk2nwNRAY3Yywj4QHmr2B2Ef/view\" target=\"true\"> Download</a></p>\r\n&nbsp;\r\n\r\n<h4>Trọn bộ t&agrave;i liệu IELTS Listening Recent Actual Test Vol 1, 2, 3, 4 {PDF + Audio}</h4>\r\n&nbsp;\r\n\r\n<p>IELTS Listening Recent Actual Test 1:<a href=\"https://drive.google.com/file/d/1FkOsuEzSIJnomlLmyuhwrliORA1OhZJb/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Listening Recent Actual Test 2:<a href=\"https://drive.google.com/file/d/1FP5MWlvSE82kiXdwR4BV18zYC6Q7jgjq/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Listening Recent Actual Test 3:<a href=\"https://drive.google.com/file/d/1jIY72iVOEJNvkF9mTmuUISFxjXackk0K/view\" target=\"true\"> Download</a></p>\r\n\r\n<p>IELTS Listening Recent Actual Test 4:<a href=\"https://drive.google.com/drive/folders/1RaThwCBHGhzSw-5NdgDkLI8TBSKdLrxu\" target=\"true\"> Download</a></p>\r\n&nbsp;\r\n\r\n<h4>IELTS WRITING TASK 2: <a href=\"https://saidnazulfiqar.files.wordpress.com/2008/04/essay-writing.pdf\" target=\"true\"> Download</a></h4>\r\n\r\n<h4>Ch&uacute;c c&aacute;c bạn vui vẻ v&agrave; th&agrave;nh c&ocirc;ng!!!</h4>\r\n</div>\r\n', 'goc-hoc-tap/ielts.jpg', 1, '2020-03-02 04:48:32'),
(6, 'TOEIC', 'toeic', 'Kho tài liệu hỗ trợ các em về chứng chỉ TOEIC', '<div class=\"container text-justify\">\r\n<h4><strong>1. Stater TOEIC</strong></h4>\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/toeic/dsfsdf.jpg\" />\r\n&nbsp;\r\n\r\n<p>Stater TOEIC Second Edition l&agrave; s&aacute;ch luyện thi TOEICd&agrave;nh cho cho người đầu luyện thi Toeic ở tr&igrave;nh độ sơ cấp. Cuốn s&aacute;ch l&agrave; t&agrave;i liệu luyện thi toeic được giới thiệu bởi kh&aacute; nhiều gi&aacute;o vi&ecirc;n ở c&aacute;c trung t&acirc;m anh ngữ với c&aacute;c tr&igrave;nh độ sơ cấp v&agrave; trung cấp.<br />\r\n<br />\r\nT&agrave;i liệu luyện thi TOEIC n&agrave;y hỗ trợ bạn th&ocirc;ng qua những b&agrave;i tập thực h&agrave;nh nhấn v&agrave;o trọng t&acirc;m; c&ugrave;ng l&uacute;c cung cấp những kiến thức nền tảng v&agrave; những mẹo gi&uacute;p bạn học tốt, x&acirc;y dựng được những kỹ năng cần thiết, l&agrave;m quen dần với h&igrave;nh thức thi TOEIC Luyện xong gi&aacute;o tr&igrave;nh n&agrave;y c&aacute;c bạn c&oacute; thể đạt số điểm khoảng từ 250 &ndash; 400 t&ugrave;y mức độ ngấm của cuốn T&agrave;i liệu n&agrave;y v&agrave;o trong đầu bạn!<br />\r\n<br />\r\nT&agrave;i liệu luyện thi TOEIC n&agrave;y bao gồm 12 b&agrave;i học, một b&agrave;i thi mẫu v&agrave; phần hỗ trợ, gồm c&oacute; lời đọc v&agrave; đ&aacute;p &aacute;n cho c&aacute;c b&agrave;i tập. Mỗi b&agrave;i tập trong s&aacute;ch gồm một phần từ vựng, một phần hướng dẫn ngữ ph&aacute;p r&otilde; r&agrave;ng v&agrave; cụ thể, c&aacute;c b&agrave;i tập ngữ ph&aacute;p, v&agrave; một b&agrave;i kiểm tra nhỏ (Mini Test). S&aacute;ch Stater TOEIC sẽ l&agrave; một cuốn s&aacute;ch ph&ugrave; hợp v&agrave; hữu &iacute;ch đối với c&aacute;c bạn học vi&ecirc;n bắt đầu với tr&igrave;nh độ Toeic từ 200 trở xuống.<br />\r\n<br />\r\nC&aacute;c bạn n&ecirc;n học ngữ ph&aacute;p từ vựng trước, rồi l&agrave;m b&agrave;i tập đọc để cải thiện th&ecirc;m từ vựng trước khi học nghe. Khi nghe c&aacute;c bạn r&aacute;ng nghe trước v&agrave;i lần trước khi mở xem transcript. V&agrave; 1 điều quan trọng nữa, sau khi nghe được c&aacute;c bạn cần nghe li&ecirc;n tục hơn nữa, c&oacute; thời giản rảnh l&agrave; để để c&oacute; thể hiểu v&agrave; h&igrave;nh th&agrave;nh phản phản xạ nghe trong đầu 1 c&aacute;ch nhanh ch&oacute;ng<br />\r\n<br />\r\nDownload<a href=\"https://drive.google.com/drive/folders/0B3MJJmCdMp0zOHhWOWxuUDFVaWM\" target=\"true\"> tại đ&acirc;y</a></p>\r\n&nbsp;\r\n\r\n<h4><strong>2. Developing Skills for The TOEIC Test</strong></h4>\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/toeic/661c28a0-733f-11e7-9c94-56c566ee3692.jpg\" />\r\n&nbsp;\r\n\r\n<p>Developing Skills for the TOEIC Test l&agrave; gi&aacute;o tr&igrave;nh TOEIC được bi&ecirc;n sọan nhằm gi&uacute;p c&aacute;c th&iacute; sinh chuẩn bị cho kỳ thi TOEIC bằng c&aacute;ch thực h&agrave;nh với c&aacute;c dạng c&acirc;u hỏi, từ vựng,ngữ ph&aacute;p v&agrave; cấu tr&uacute;c c&acirc;u thường gặp trong b&agrave;i thi TOEIC. Developing Skill for the TOEIC Test gi&uacute;p th&iacute; sinh thực h&agrave;nh lặp đi lặp lại với c&aacute;c c&acirc;u hỏi mẫu tương tự như trong b&agrave;i thi thật. S&aacute;ch cũng cung cấp một b&agrave;i thi thực h&agrave;nh nhằm gi&uacute;p th&iacute; sinh hiểu r&otilde; hơn m&igrave;nh cần chuẩn bị những g&igrave; cho kỳ thi thật<br />\r\n<br />\r\nC&aacute;c bạn c&oacute; thể học theo c&aacute;c chủ đề, l&agrave;m b&agrave;i tập trong s&aacute;ch. Tổng hợp 600 từ vựng ra 1 quyển tập để xem lại hằng ng&agrave;y, điều n&agrave;y sẽ gi&uacute;p c&aacute;c bạn nhớ l&acirc;u từ vựng hơn.<br />\r\n<br />\r\npdf bản đẹp second edition toeic ebook transcript free download miễn ph&iacute; file,The TOEIC Test answer key gi&aacute; bao nhi&ecirc;u luyen nghe very easy mua sach o da nghe second edition file mp3 t&agrave;i liệu gi&aacute;o tr&igrave;nh Developing Skills for The TOEIC Test<br />\r\n<br />\r\nDownload<a href=\"https://drive.google.com/drive/folders/0B3MJJmCdMp0zVzMtNnN0bVhocDg\" target=\"true\"> tại đ&acirc;y</a></p>\r\n\r\n<h4><strong>3. TOEIC Analyst</strong></h4>\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/toeic/1b939712-7341-11e7-a740-cac091044fd5.jpg\" />\r\n&nbsp;\r\n\r\n<p>TOEIC Analyst Second Edition l&agrave; quyển thứ 2 trong bộ 4 quyển Compass TOEIC của Anne Taylor, bao gồm: Starter Toeic, Developing Skills for the Toeic Test v&agrave; Target TOEIC TOEIC Analyst được bi&ecirc;n soạn nhằm gi&uacute;p bạn chuẩn bị cho kỳ thi TOEIC th&ocirc;ng qua những b&agrave;i tập ph&acirc;n t&iacute;ch c&aacute;c dạng c&acirc;u hỏi thường gặp trong b&agrave;i thi, gi&uacute;p bạn x&acirc;y dựng c&aacute;c chiến thuật tiếp cận với từng loại c&acirc;u hỏi với tr&igrave;nh độ Intermediate mục ti&ecirc;u TOEIC l&agrave; 500-750 điểm.<br />\r\n<br />\r\nGi&aacute;o tr&igrave;nh Analyst b&aacute;m s&aacute;t cấu tr&uacute;c đề thi TOEIC hơn với 7 chương tương ứng với 7 dạng c&acirc;u hỏi trong đề thi TOEIC. Mỗi chương đều c&oacute; hướng dẫn l&agrave;m b&agrave;i, những mẹo để l&agrave;m b&agrave;i TOEIC tốt hơn v&agrave; c&aacute;c b&agrave;i tập nhỏ để thực h&agrave;nh. Ngo&agrave;i ra, s&aacute;ch c&ograve;n cung cấp th&ecirc;m 02 b&agrave;i thi mẫu, m&ocirc; phỏng kỳ thi thật sự.<br />\r\n<br />\r\nNội dung TOEIC Analyst gồm 4 phần:<br />\r\n<br />\r\n1. The TOEIC Listening Section<br />\r\n<br />\r\nPhần nghe được chia l&agrave;m 4 Part Picture Description, Questions and Responses, Short Conversations, Short Talks<br />\r\n<br />\r\n2. The TOEIC Reading Section<br />\r\n<br />\r\nPhần đọc chia l&agrave;m 3 phần: Incomplete Sentences, Incomplete Texts, Reading Comprehension.<br />\r\n<br />\r\n3. Practice Test<br />\r\n<br />\r\nHai b&agrave;i kiểm tra gi&uacute;p bạn hệ thống lại to&agrave;n bộ những g&igrave; đ&atilde; học ở c&aacute;c phần tr&ecirc;n v&agrave; l&agrave;m quen với đề thi TOEIC<br />\r\n<br />\r\n4. Transcripts and Answer Key<br />\r\n<br />\r\nĐ&acirc;y l&agrave; phần hỗ trợ gồm c&aacute;c đoạn hội thoại c&oacute; trong CD dạng Text v&agrave; đ&aacute;p &aacute;n c&aacute;c b&agrave;i kiểm tra.<br />\r\n<br />\r\nDownload<a href=\"https://drive.google.com/drive/folders/0B3MJJmCdMp0zYzJsNEVOd0g3UEk\" target=\"true\"> tại đ&acirc;y</a></p>\r\n\r\n<h4><strong>4. Target TOEIC</strong></h4>\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/toeic/ee43dd7c-733f-11e7-9eef-2e995a9a3302.jpg\" />\r\n&nbsp;\r\n\r\n<p>S&aacute;ch Target TOEIC n&agrave;y bao gồm 12 b&agrave;i học, một b&agrave;i thi mẫu v&agrave; phần hỗ trợ, gồm c&oacute; lời đọc v&agrave; đ&aacute;p &aacute;n cho c&aacute;c b&agrave;i tập. Mỗi b&agrave;i tập trong s&aacute;ch gồm một phần từ vựng, một phần hướng dẫn ngữ ph&aacute;p r&otilde; r&agrave;ng v&agrave; cụ thể, c&aacute;c b&agrave;i tập ngữ ph&aacute;p, v&agrave; một b&agrave;i kiểm tra nhỏ (Mini Test). Target TOEIC sẽ l&agrave; một cuốn s&aacute;ch ph&ugrave; hợp v&agrave; hữu &iacute;ch đối với c&aacute;c bạn học vi&ecirc;n bắt đầu với tr&igrave;nh độ Toeic từ 500 trở l&ecirc;n.<br />\r\n<br />\r\nDownload<a href=\"https://drive.google.com/drive/folders/0B3MJJmCdMp0zRGV5eGo5U2VuNnc\" target=\"true\"> tại đ&acirc;y</a></p>\r\n\r\n<h4><strong>5. Big Step TOEIC</strong></h4>\r\n\r\n<img src=\"http://auvietuc.edu.vn/upload/images/goc-hoc-tap/toeic/ee43dd7c-733f-11e7-9eef-2e995a9a3302.jpg\" />\r\n&nbsp;\r\n\r\n<p>Big Step TOEIC do 2 t&aacute;c giả người H&agrave;n Quốc l&agrave; Kim Soyeong v&agrave; Park Won bi&ecirc;n soạn nhằm gi&uacute;p người học n&acirc;ng cao cải thiện điểm số TOEIC của họ trong thời gian ngắn nhất. S&aacute;ch viết đơn giản, dễ hiểu, c&oacute; mục ti&ecirc;u r&otilde; r&agrave;ng v&agrave; hệ thống đề thi rất gần gũi với đề thi thực. Chuy&ecirc;n mục Download t&agrave;i liệu của Langmaster đ&atilde; cập nhật cả bộ s&aacute;ch với đầy đủ bản pdf v&agrave; audio cho c&aacute;c bạn.. Ngo&agrave;i ra, gi&aacute;o tr&igrave;nh Big Step Toeic c&ograve;n đưa ra c&aacute;c dạng c&acirc;u hỏi tương ứng với c&acirc;u hỏi TOEIC thực tế, đ&aacute;p ứng được nhu cầu v&agrave; tr&igrave;nh độ của người học. Đặc điểm nổi bật nhất của t&agrave;i liệu n&agrave;y l&agrave; phần LC v&agrave; RC được cấu th&agrave;nh một t&agrave;i liệu duy nhất để giải th&iacute;ch nội dung giống nhau, gi&uacute;p người mới học c&oacute; thể dễ d&agrave;ng tiếp cận Luyện thi TOEIC.<br />\r\n<br />\r\nBộ gi&aacute;o tr&igrave;nh Big Step TOEIC gồm c&oacute; 3 quyển ch&iacute;nh chia ra 3 cấp độ ri&ecirc;ng biệt:<br />\r\n<br />\r\nBIG STEP TOEIC 1: Sơ c&acirc;́p (TOEIC 400 &ndash; 550)<br />\r\nGi&aacute;o tr&igrave;nh n&agrave;y gi&uacute;p c&aacute;c bạn khi mới học TOEIC c&oacute; thể nắm được c&aacute;c vấn đề cốt l&otilde;i của từng phần. Mục ti&ecirc;u học tập được thể hiện qua thứ tự đặt c&acirc;u hỏi để người mời bắt đầu c&oacute; thể nắm được những phần quan trọng trong 1 b&agrave;i thi TOEIC. .<br />\r\n<br />\r\nBIG STEP TOEIC 2: Sơ c&acirc;́p (TOEIC 500 &ndash; 750)<br />\r\nGi&aacute;o tr&igrave;nh BIG STEP TOEIC 2 gi&uacute;p người học tăng cường vống từ vựng v&agrave; khả năng đọc hiểu. Gi&aacute;o tr&igrave;nh n&agrave;y tương đương với số điểm từ 630 -&gt; 700. C&aacute;c c&acirc;u hỏi kh&aacute; đa dạng sẽ gi&uacute;p học vi&ecirc;n th&iacute;ch ứng dễ d&agrave;ng với c&aacute;c c&acirc;u hỏi trong đề thi TOEIC thật.<br />\r\n<br />\r\nBIG STEP TOEIC 3: N&acirc;ng cao (TOEIC 700 &ndash; 900+)<br />\r\nBig Step TOEIC 3 l&agrave; tổng hợp tất cả nội dung chủ của 2 phần Listening Comprehension v&agrave; Reading Comprehension, phần n&agrave;y sẽ gi&uacute;p bạn kiểm tra những kiến thức đ&atilde; học xong trong 2 quyển Big Step 1 v&agrave; 2. Big Step 3 gồm c&aacute;c b&agrave;i thi m&ocirc; phỏng thực tế ( Actual Tests) sẽ gi&uacute;p c&aacute;c bạn quen dần với format của 1 b&agrave;i thi TOEIC.<br />\r\n<br />\r\nDownload<a href=\"https://drive.google.com/drive/folders/0B3MJJmCdMp0zbDZRNUUxNUt4UG8\" target=\"true\"> tại đ&acirc;y</a></p>\r\n\r\n<p>Theo efc.edu.vn</p>\r\n\r\n<h4>Ch&uacute;c c&aacute;c bạn vui vẻ v&agrave; th&agrave;nh c&ocirc;ng!!!</h4>\r\n</div>\r\n', 'goc-hoc-tap/ghep5.jpg', 1, '2020-03-02 04:51:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag_blog`
--

CREATE TABLE `tag_blog` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tag_blog`
--

INSERT INTO `tag_blog` (`id`, `title`, `status`, `created_at`) VALUES
(1, 'học tiếng anh giao tiêp', 1, '2020-02-25 17:34:21'),
(2, 'ôn luyện thi', 1, '2020-02-25 17:34:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag_education`
--

CREATE TABLE `tag_education` (
  `id` int(10) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tag_education`
--

INSERT INTO `tag_education` (`id`, `title`, `status`, `created_at`) VALUES
(1, 'học tiếng anh giao tiếp', 1, '2020-02-25 17:28:26'),
(2, 'ôn luyện thi', 1, '2020-02-25 17:28:15'),
(3, 'thi lấy bằng', 1, '2020-02-25 17:28:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `role_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
(406, 4, 33),
(405, 4, 32),
(404, 4, 31),
(16, 2, 1),
(17, 2, 2),
(18, 2, 3),
(19, 2, 4),
(20, 2, 5),
(21, 2, 6),
(22, 2, 7),
(23, 2, 8),
(24, 2, 9),
(25, 2, 10),
(26, 2, 11),
(27, 2, 12),
(28, 2, 13),
(29, 2, 14),
(30, 2, 15),
(364, 8, 33),
(363, 8, 32),
(362, 8, 31),
(361, 8, 30),
(360, 8, 29),
(359, 8, 28),
(358, 8, 27),
(357, 8, 26),
(356, 8, 25),
(355, 8, 24),
(354, 8, 23),
(353, 8, 22),
(352, 8, 21),
(403, 4, 30),
(402, 4, 29),
(401, 4, 28),
(400, 4, 27),
(399, 4, 26),
(398, 4, 25),
(397, 4, 24),
(396, 4, 23),
(395, 4, 22),
(394, 4, 21),
(393, 4, 20),
(392, 4, 19),
(391, 4, 18),
(390, 4, 17),
(389, 4, 16),
(388, 4, 3),
(387, 4, 2),
(386, 4, 1),
(351, 8, 20),
(350, 8, 19),
(349, 8, 18),
(348, 8, 17),
(347, 8, 16),
(346, 8, 3),
(345, 8, 2),
(344, 8, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `advisory`
--
ALTER TABLE `advisory`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `advisory_text`
--
ALTER TABLE `advisory_text`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `banner_categories`
--
ALTER TABLE `banner_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments_blog`
--
ALTER TABLE `comments_blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments_education`
--
ALTER TABLE `comments_education`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `communicate_confidently`
--
ALTER TABLE `communicate_confidently`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `education_program`
--
ALTER TABLE `education_program`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `info_setting`
--
ALTER TABLE `info_setting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news_items`
--
ALTER TABLE `news_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_categories`
--
ALTER TABLE `npt_categories`
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `npt_languages`
--
ALTER TABLE `npt_languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_layouts`
--
ALTER TABLE `npt_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_layouts_setting`
--
ALTER TABLE `npt_layouts_setting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_layouts_static_content`
--
ALTER TABLE `npt_layouts_static_content`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_modules`
--
ALTER TABLE `npt_modules`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_pages`
--
ALTER TABLE `npt_pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_pages_attributes`
--
ALTER TABLE `npt_pages_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_positions`
--
ALTER TABLE `npt_positions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_roles`
--
ALTER TABLE `npt_roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_users`
--
ALTER TABLE `npt_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `npt_website_config`
--
ALTER TABLE `npt_website_config`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `opinion`
--
ALTER TABLE `opinion`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `philosophy`
--
ALTER TABLE `philosophy`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `study_space`
--
ALTER TABLE `study_space`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag_blog`
--
ALTER TABLE `tag_blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag_education`
--
ALTER TABLE `tag_education`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `advisory`
--
ALTER TABLE `advisory`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `advisory_text`
--
ALTER TABLE `advisory_text`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `banner_categories`
--
ALTER TABLE `banner_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `comments_blog`
--
ALTER TABLE `comments_blog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comments_education`
--
ALTER TABLE `comments_education`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `communicate_confidently`
--
ALTER TABLE `communicate_confidently`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `education_program`
--
ALTER TABLE `education_program`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT cho bảng `info_setting`
--
ALTER TABLE `info_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `job`
--
ALTER TABLE `job`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `news_items`
--
ALTER TABLE `news_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `npt_categories`
--
ALTER TABLE `npt_categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `npt_languages`
--
ALTER TABLE `npt_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `npt_layouts`
--
ALTER TABLE `npt_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2012;

--
-- AUTO_INCREMENT cho bảng `npt_layouts_setting`
--
ALTER TABLE `npt_layouts_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2346;

--
-- AUTO_INCREMENT cho bảng `npt_layouts_static_content`
--
ALTER TABLE `npt_layouts_static_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `npt_modules`
--
ALTER TABLE `npt_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT cho bảng `npt_pages`
--
ALTER TABLE `npt_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT cho bảng `npt_pages_attributes`
--
ALTER TABLE `npt_pages_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT cho bảng `npt_positions`
--
ALTER TABLE `npt_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `npt_roles`
--
ALTER TABLE `npt_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `npt_users`
--
ALTER TABLE `npt_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `npt_website_config`
--
ALTER TABLE `npt_website_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `opinion`
--
ALTER TABLE `opinion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `philosophy`
--
ALTER TABLE `philosophy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `study_space`
--
ALTER TABLE `study_space`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tag_blog`
--
ALTER TABLE `tag_blog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tag_education`
--
ALTER TABLE `tag_education`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
