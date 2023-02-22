-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2023 at 06:58 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_sanctum_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mechanic_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `mechanic_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Volvo', 0.00, NULL, NULL),
(2, 2, 'Toyota', 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', NULL, NULL),
(2, 'Albania', 'AL', NULL, NULL),
(3, 'Algeria', 'DZ', NULL, NULL),
(4, 'American Samoa', 'AS', NULL, NULL),
(5, 'Andorra', 'AD', NULL, NULL),
(6, 'Angola', 'AO', NULL, NULL),
(7, 'Anguilla', 'AI', NULL, NULL),
(8, 'Antarctica', 'AQ', NULL, NULL),
(9, 'Antigua and Barbuda', 'AG', NULL, NULL),
(10, 'Argentina', 'AR', NULL, NULL),
(11, 'Armenia', 'AM', NULL, NULL),
(12, 'Aruba', 'AW', NULL, NULL),
(13, 'Australia', 'AU', NULL, NULL),
(14, 'Austria', 'AT', NULL, NULL),
(15, 'Azerbaijan', 'AZ', NULL, NULL),
(16, 'Bahamas', 'BS', NULL, NULL),
(17, 'Bahrain', 'BH', NULL, NULL),
(18, 'Bangladesh', 'BD', NULL, NULL),
(19, 'Barbados', 'BB', NULL, NULL),
(20, 'Belarus', 'BY', NULL, NULL),
(21, 'Belgium', 'BE', NULL, NULL),
(22, 'Belize', 'BZ', NULL, NULL),
(23, 'Benin', 'BJ', NULL, NULL),
(24, 'Bermuda', 'BM', NULL, NULL),
(25, 'Bhutan', 'BT', NULL, NULL),
(26, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(27, 'Botswana', 'BW', NULL, NULL),
(28, 'Bouvet Island', 'BV', NULL, NULL),
(29, 'Brazil', 'BR', NULL, NULL),
(30, 'British Indian Ocean Territory', 'IO', NULL, NULL),
(31, 'Brunei Darussalam', 'BN', NULL, NULL),
(32, 'Bulgaria', 'BG', NULL, NULL),
(33, 'Burkina Faso', 'BF', NULL, NULL),
(34, 'Burundi', 'BI', NULL, NULL),
(35, 'Cambodia', 'KH', NULL, NULL),
(36, 'Cameroon', 'CM', NULL, NULL),
(37, 'Canada', 'CA', NULL, NULL),
(38, 'Cape Verde', 'CV', NULL, NULL),
(39, 'Cayman Islands', 'KY', NULL, NULL),
(40, 'Central African Republic', 'CF', NULL, NULL),
(41, 'Chad', 'TD', NULL, NULL),
(42, 'Chile', 'CL', NULL, NULL),
(43, 'China', 'CN', NULL, NULL),
(44, 'Christmas Island', 'CX', NULL, NULL),
(45, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(46, 'Colombia', 'CO', NULL, NULL),
(47, 'Comoros', 'KM', NULL, NULL),
(48, 'Congo', 'CG', NULL, NULL),
(49, 'Cook Islands', 'CK', NULL, NULL),
(50, 'Costa Rica', 'CR', NULL, NULL),
(51, 'Croatia', 'HR', NULL, NULL),
(52, 'Cuba', 'CU', NULL, NULL),
(53, 'Cyprus', 'CY', NULL, NULL),
(54, 'Czech Republic', 'CZ', NULL, NULL),
(55, 'Denmark', 'DK', NULL, NULL),
(56, 'Djibouti', 'DJ', NULL, NULL),
(57, 'Dominica', 'DM', NULL, NULL),
(58, 'Dominican Republic', 'DO', NULL, NULL),
(59, 'Ecuador', 'EC', NULL, NULL),
(60, 'Egypt', 'EG', NULL, NULL),
(61, 'El Salvador', 'SV', NULL, NULL),
(62, 'Equatorial Guinea', 'GQ', NULL, NULL),
(63, 'Eritrea', 'ER', NULL, NULL),
(64, 'Estonia', 'EE', NULL, NULL),
(65, 'Ethiopia', 'ET', NULL, NULL),
(66, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(67, 'Faroe Islands', 'FO', NULL, NULL),
(68, 'Fiji', 'FJ', NULL, NULL),
(69, 'Finland', 'FI', NULL, NULL),
(70, 'France', 'FR', NULL, NULL),
(71, 'French Guiana', 'GF', NULL, NULL),
(72, 'French Polynesia', 'PF', NULL, NULL),
(73, 'French Southern Territories', 'TF', NULL, NULL),
(74, 'Gabon', 'GA', NULL, NULL),
(75, 'Gambia', 'GM', NULL, NULL),
(76, 'Georgia', 'GE', NULL, NULL),
(77, 'Germany', 'DE', NULL, NULL),
(78, 'Ghana', 'GH', NULL, NULL),
(79, 'Gibraltar', 'GI', NULL, NULL),
(80, 'Greece', 'GR', NULL, NULL),
(81, 'Greenland', 'GL', NULL, NULL),
(82, 'Grenada', 'GD', NULL, NULL),
(83, 'Guadeloupe', 'GP', NULL, NULL),
(84, 'Guam', 'GU', NULL, NULL),
(85, 'Guatemala', 'GT', NULL, NULL),
(86, 'Guernsey', 'GG', NULL, NULL),
(87, 'Guinea', 'GN', NULL, NULL),
(88, 'Guinea-Bissau', 'GW', NULL, NULL),
(89, 'Guyana', 'GY', NULL, NULL),
(90, 'Haiti', 'HT', NULL, NULL),
(91, 'Heard Island and McDonald Islands', 'HM', NULL, NULL),
(92, 'Holy See (Vatican City State)', 'VA', NULL, NULL),
(93, 'Honduras', 'HN', NULL, NULL),
(94, 'Hong Kong', 'HK', NULL, NULL),
(95, 'Hungary', 'HU', NULL, NULL),
(96, 'Iceland', 'IS', NULL, NULL),
(97, 'India', 'IN', NULL, NULL),
(98, 'Indonesia', 'ID', NULL, NULL),
(99, 'Iraq', 'IQ', NULL, NULL),
(100, 'Ireland', 'IE', NULL, NULL),
(101, 'Isle of Man', 'IM', NULL, NULL),
(102, 'Israel', 'IL', NULL, NULL),
(103, 'Italy', 'IT', NULL, NULL),
(104, 'Jamaica', 'JM', NULL, NULL),
(105, 'Japan', 'JP', NULL, NULL),
(106, 'Jersey', 'JE', NULL, NULL),
(107, 'Jordan', 'JO', NULL, NULL),
(108, 'Kazakhstan', 'KZ', NULL, NULL),
(109, 'Kenya', 'KE', NULL, NULL),
(110, 'Kiribati', 'KI', NULL, NULL),
(111, 'Kuwait', 'KW', NULL, NULL),
(112, 'Kyrgyzstan', 'KG', NULL, NULL),
(113, 'Lao Peoples Democratic Republic', 'LA', NULL, NULL),
(114, 'Latvia', 'LV', NULL, NULL),
(115, 'Lebanon', 'LB', NULL, NULL),
(116, 'Lesotho', 'LS', NULL, NULL),
(117, 'Liberia', 'LR', NULL, NULL),
(118, 'Libya', 'LY', NULL, NULL),
(119, 'Liechtenstein', 'LI', NULL, NULL),
(120, 'Lithuania', 'LT', NULL, NULL),
(121, 'Luxembourg', 'LU', NULL, NULL),
(122, 'Macao', 'MO', NULL, NULL),
(123, 'Madagascar', 'MG', NULL, NULL),
(124, 'Malawi', 'MW', NULL, NULL),
(125, 'Malaysia', 'MY', NULL, NULL),
(126, 'Maldives', 'MV', NULL, NULL),
(127, 'Mali', 'ML', NULL, NULL),
(128, 'Malta', 'MT', NULL, NULL),
(129, 'Marshall Islands', 'MH', NULL, NULL),
(130, 'Martinique', 'MQ', NULL, NULL),
(131, 'Mauritania', 'MR', NULL, NULL),
(132, 'Mauritius', 'MU', NULL, NULL),
(133, 'Mayotte', 'YT', NULL, NULL),
(134, 'Mexico', 'MX', NULL, NULL),
(135, 'Monaco', 'MC', NULL, NULL),
(136, 'Mongolia', 'MN', NULL, NULL),
(137, 'Montenegro', 'ME', NULL, NULL),
(138, 'Montserrat', 'MS', NULL, NULL),
(139, 'Morocco', 'MA', NULL, NULL),
(140, 'Mozambique', 'MZ', NULL, NULL),
(141, 'Myanmar', 'MM', NULL, NULL),
(142, 'Namibia', 'NA', NULL, NULL),
(143, 'Nauru', 'NR', NULL, NULL),
(144, 'Nepal', 'NP', NULL, NULL),
(145, 'Netherlands', 'NL', NULL, NULL),
(146, 'New Caledonia', 'NC', NULL, NULL),
(147, 'New Zealand', 'NZ', NULL, NULL),
(148, 'Nicaragua', 'NI', NULL, NULL),
(149, 'Niger', 'NE', NULL, NULL),
(150, 'Nigeria', 'NG', NULL, NULL),
(151, 'Niue', 'NU', NULL, NULL),
(152, 'Norfolk Island', 'NF', NULL, NULL),
(153, 'Northern Mariana Islands', 'MP', NULL, NULL),
(154, 'Norway', 'NO', NULL, NULL),
(155, 'Oman', 'OM', NULL, NULL),
(156, 'Pakistan', 'PK', NULL, NULL),
(157, 'Palau', 'PW', NULL, NULL),
(158, 'Panama', 'PA', NULL, NULL),
(159, 'Papua New Guinea', 'PG', NULL, NULL),
(160, 'Paraguay', 'PY', NULL, NULL),
(161, 'Peru', 'PE', NULL, NULL),
(162, 'Philippines', 'PH', NULL, NULL),
(163, 'Pitcairn', 'PN', NULL, NULL),
(164, 'Poland', 'PL', NULL, NULL),
(165, 'Portugal', 'PT', NULL, NULL),
(166, 'Puerto Rico', 'PR', NULL, NULL),
(167, 'Qatar', 'QA', NULL, NULL),
(168, 'Romania', 'RO', NULL, NULL),
(169, 'Russian Federation', 'RU', NULL, NULL),
(170, 'Rwanda', 'RW', NULL, NULL),
(171, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(172, 'Saint Lucia', 'LC', NULL, NULL),
(173, 'Saint Martin (French part)', 'MF', NULL, NULL),
(174, 'Saint Pierre and Miquelon', 'PM', NULL, NULL),
(175, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(176, 'Samoa', 'WS', NULL, NULL),
(177, 'San Marino', 'SM', NULL, NULL),
(178, 'Sao Tome and Principe', 'ST', NULL, NULL),
(179, 'Saudi Arabia', 'SA', NULL, NULL),
(180, 'Senegal', 'SN', NULL, NULL),
(181, 'Serbia', 'RS', NULL, NULL),
(182, 'Seychelles', 'SC', NULL, NULL),
(183, 'Sierra Leone', 'SL', NULL, NULL),
(184, 'Singapore', 'SG', NULL, NULL),
(185, 'Sint Maarten (Dutch part)', 'SX', NULL, NULL),
(186, 'Slovakia', 'SK', NULL, NULL),
(187, 'Slovenia', 'SI', NULL, NULL),
(188, 'Solomon Islands', 'SB', NULL, NULL),
(189, 'Somalia', 'SO', NULL, NULL),
(190, 'South Africa', 'ZA', NULL, NULL),
(191, 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL),
(192, 'South Sudan', 'SS', NULL, NULL),
(193, 'Spain', 'ES', NULL, NULL),
(194, 'Sri Lanka', 'LK', NULL, NULL),
(195, 'Sudan', 'SD', NULL, NULL),
(196, 'Suriname', 'SR', NULL, NULL),
(197, 'Svalbard and Jan Mayen', 'SJ', NULL, NULL),
(198, 'Swaziland', 'SZ', NULL, NULL),
(199, 'Sweden', 'SE', NULL, NULL),
(200, 'Switzerland', 'CH', NULL, NULL),
(201, 'Syrian Arab Republic', 'SY', NULL, NULL),
(202, 'Tajikistan', 'TJ', NULL, NULL),
(203, 'Thailand', 'TH', NULL, NULL),
(204, 'Timor-Leste', 'TL', NULL, NULL),
(205, 'Togo', 'TG', NULL, NULL),
(206, 'Tokelau', 'TK', NULL, NULL),
(207, 'Tonga', 'TO', NULL, NULL),
(208, 'Trinidad and Tobago', 'TT', NULL, NULL),
(209, 'Tunisia', 'TN', NULL, NULL),
(210, 'Turkey', 'TR', NULL, NULL),
(211, 'Turkmenistan', 'TM', NULL, NULL),
(212, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(213, 'Tuvalu', 'TV', NULL, NULL),
(214, 'Uganda', 'UG', NULL, NULL),
(215, 'Ukraine', 'UA', NULL, NULL),
(216, 'United Arab Emirates', 'AE', NULL, NULL),
(217, 'United Kingdom', 'GB', NULL, NULL),
(218, 'United States', 'US', NULL, NULL),
(219, 'United States Minor Outlying Islands', 'UM', NULL, NULL),
(220, 'Uruguay', 'UY', NULL, NULL),
(221, 'Uzbekistan', 'UZ', NULL, NULL),
(222, 'Vanuatu', 'VU', NULL, NULL),
(223, 'Viet Nam', 'VN', NULL, NULL),
(224, 'Wallis and Futuna', 'WF', NULL, NULL),
(225, 'Western Sahara', 'EH', NULL, NULL),
(226, 'Yemen', 'YE', NULL, NULL),
(227, 'Zambia', 'ZM', NULL, NULL),
(228, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '8d83f6eb-f5b8-4ef0-b16f-71877ee51c24', 'database', 'default', '{\"uuid\":\"8d83f6eb-f5b8-4ef0-b16f-71877ee51c24\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:15:\\\"anwar@gmail.com\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"8ea4ab77-0444-423f-8711-f25b50ca3993\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'anwar@gmail.com\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'anwar@gmail.com\', \'83055413-5be2-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03'),
(2, '0df6016d-f518-45fe-9eff-17c85b42496f', 'database', 'default', '{\"uuid\":\"0df6016d-f518-45fe-9eff-17c85b42496f\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:19:\\\"rfisher@example.net\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"2e061fc4-4c0b-4f64-a3e5-bddbc870a2fa\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'rfisher@example...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'rfisher@example...\', \'5c0f7d06-a2e9-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03'),
(3, '1fbce23f-4f92-489f-bc87-b886ebde6bb4', 'database', 'default', '{\"uuid\":\"1fbce23f-4f92-489f-bc87-b886ebde6bb4\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:30:\\\"bergstrom.casandra@example.org\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"9547d449-02b7-4bb4-88af-94dae85e641a\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'bergstrom.casan...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'bergstrom.casan...\', \'4067441e-a904-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03'),
(4, '891e253f-fa0d-4f12-99f1-6c59ad0e84fa', 'database', 'default', '{\"uuid\":\"891e253f-fa0d-4f12-99f1-6c59ad0e84fa\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:22:\\\"pwilderman@example.com\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"1d0961c1-e05c-400b-b9f2-01a8658eeddf\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'pwilderman@exam...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'pwilderman@exam...\', \'e8e46df7-0c14-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(5, '727fafe5-80c6-48a6-9051-dbf8849987bc', 'database', 'default', '{\"uuid\":\"727fafe5-80c6-48a6-9051-dbf8849987bc\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:26:\\\"clark.bergnaum@example.net\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"38395dff-36b0-4fae-830a-345b1b34d51f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'clark.bergnaum@...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'clark.bergnaum@...\', \'e66d617c-319b-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03'),
(6, 'c6c99ab4-71fb-4b49-9655-66e928dead67', 'database', 'default', '{\"uuid\":\"c6c99ab4-71fb-4b49-9655-66e928dead67\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:26:\\\"roberts.eldora@example.com\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"227b40ef-198e-4c6e-a2cb-f742fd4c14f4\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'roberts.eldora@...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'roberts.eldora@...\', \'1eae6e35-9e66-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:03'),
(7, '11aea5f8-c46d-460a-8cb9-8571de8741dd', 'database', 'default', '{\"uuid\":\"11aea5f8-c46d-460a-8cb9-8571de8741dd\",\"displayName\":\"App\\\\Notifications\\\\SendEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":16:{s:11:\\\"notifiables\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:23:\\\"lehner.kaia@example.org\\\";}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:12:\\\"notification\\\";O:27:\\\"App\\\\Notifications\\\\SendEmail\\\":11:{s:2:\\\"id\\\";s:36:\\\"22b00786-07e7-4c5f-ba6f-7be72fa6b17c\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Error: Call to a member function routeNotificationFor() on string in C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php:53\nStack trace:\n#0 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send(\'lehner.kaia@exa...\', Object(App\\Notifications\\SendEmail))\n#1 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(\'lehner.kaia@exa...\', \'4872dcca-70ae-4...\', Object(App\\Notifications\\SendEmail), \'mail\')\n#2 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#3 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(109): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#4 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#5 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(104): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Support\\Collection), Object(App\\Notifications\\SendEmail), Array)\n#6 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#7 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#12 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#13 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#14 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#16 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#17 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#18 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#20 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#21 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#22 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#23 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#25 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#26 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#27 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#28 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#29 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#30 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#31 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#32 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#34 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(1024): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\Users\\AC\\Desktop\\example-app\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\Users\\AC\\Desktop\\example-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\Users\\AC\\Desktop\\example-app\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 {main}', '2023-02-18 10:01:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ABC', NULL, NULL),
(2, 'EFG', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_admins_table', 1),
(2, '2014_10_12_000000_create_users_table', 10),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_08_22_161534_create_jobs_table', 1),
(7, '2022_11_10_171721_create_purchases_table', 1),
(9, '2022_11_10_172006_create_products_table', 2),
(11, '2022_11_10_172111_create_product_stocks_table', 3),
(12, '2022_11_10_171811_create_purchase_lines_table', 4),
(13, '2022_11_17_142927_create_profiles_table', 5),
(14, '2022_11_17_151619_create_posts_table', 6),
(17, '2022_11_17_155324_create_mechanics_table', 8),
(18, '2022_11_17_155334_create_cars_table', 8),
(19, '2022_11_17_155346_create_owners_table', 8),
(25, '2022_11_17_170109_create_roles_table', 12),
(26, '2022_11_17_170149_create_role_user_table', 12),
(27, '2023_02_05_153101_create_students_table', 13),
(31, '2022_11_17_151635_create_comments_table', 14),
(32, '2023_02_21_162608_create_permissions_table', 15),
(33, '2023_02_21_162836_create_role_has_permissions_table', 16),
(35, '2022_11_17_164256_create_countries_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `car_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, '34#FFD', '2022-11-17 15:59:48', '2022-11-17 15:59:52'),
(2, 2, '36#GDF$', '2022-11-17 15:59:56', '2022-11-17 15:59:58');

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'product.create', NULL, NULL),
(2, 'product.update', NULL, NULL),
(3, 'product.delete', NULL, NULL),
(4, 'user.create', NULL, NULL),
(5, 'user.update', NULL, NULL),
(6, 'user.delete', NULL, NULL),
(7, 'role.create', NULL, NULL),
(8, 'role.update', NULL, NULL),
(9, 'role.delete', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'Lactogen sadf180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2023-02-19 10:13:06'),
(2, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(4, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(5, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(6, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(7, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(8, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(9, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(10, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(11, 'Lactogen 3 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(15, 'CERL STA1 Rice 400gm', 351.00, 10.00, '2022-11-12 06:34:34', '2023-02-09 10:23:47'),
(16, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(17, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(18, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(19, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(20, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(21, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(22, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(23, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(24, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(25, 'Lactogen 3 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(26, 'CERL STA1 Rice 400gm', 351.00, 10.00, '2022-11-12 06:34:34', '2023-02-09 10:23:47'),
(27, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(28, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(29, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(30, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(31, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(32, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(33, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(34, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(35, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(36, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(37, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(38, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(39, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(40, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(41, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(42, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(43, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(44, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(45, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(46, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(47, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(48, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(49, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(50, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(51, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(52, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(53, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(54, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(55, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(56, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(57, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(58, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(59, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(60, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(61, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(62, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(63, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(64, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(65, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(66, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(67, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(68, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(69, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(70, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(71, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(72, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(73, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(74, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(75, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(76, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(77, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(78, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(79, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(80, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(81, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(82, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(83, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(84, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(85, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(86, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(87, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(88, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(89, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(90, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(91, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(92, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(93, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(94, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(95, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(96, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(97, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(98, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(99, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(100, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(101, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(102, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(103, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(104, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(105, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(106, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(107, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(108, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(109, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(110, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(111, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(112, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(113, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(114, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(115, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(116, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(117, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(118, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(119, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(120, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(121, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(122, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(123, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(124, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(125, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(126, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(127, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(128, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(129, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(130, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(131, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(132, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(133, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(134, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(135, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(136, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(137, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(138, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(139, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(140, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(141, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(142, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(143, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(144, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(145, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(146, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(147, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(148, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(149, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(150, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(151, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(152, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(153, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(154, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(155, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(156, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(157, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(158, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(159, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(160, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(161, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(162, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(163, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(164, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(165, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(166, 'Lactogen 3 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(167, 'CERL STA1 Rice 400gm', 351.00, 10.00, '2022-11-12 06:34:34', '2023-02-09 10:23:47'),
(168, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(169, 'Lactogen 2 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(170, 'Lactogen 4 180gm', 245.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(171, 'Lactogen 1 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(172, 'Lactogen 2 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(173, 'Lactogen 3 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(174, 'Lactogen 4 350gm', 478.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(175, 'Lactogen 1 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(176, 'Lactogen 2 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(177, 'Lactogen 3 Tin 400gm', 600.00, 0.00, '2022-11-11 12:12:26', '2022-11-11 12:12:26'),
(178, 'CERL STA1 Rice 400gm0', 351.00, 12.00, '2022-11-12 06:34:34', '2023-02-20 14:21:33'),
(179, 'Lactogen 1 180gm', 245.00, 0.00, '2022-11-11 12:12:25', '2022-11-11 12:12:25'),
(256, 'Maggi Noodles 496gm', 130.00, NULL, '2023-02-21 10:57:07', '2023-02-21 10:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 245.00, 2, 490.00, '2022-11-11 12:12:25', '2023-02-18 00:44:06'),
(2, 2, 245.00, 13, 3185.00, '2022-11-11 12:12:25', '2023-02-09 11:04:25'),
(4, 4, 245.00, 0, 0.00, '2022-11-11 12:12:26', '2023-02-09 11:04:50'),
(5, 5, 478.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 04:37:58'),
(6, 6, 478.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 03:31:42'),
(7, 7, 478.00, 21, 10038.00, '2022-11-11 12:12:26', '2022-11-12 04:45:30'),
(8, 8, 478.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 03:31:42'),
(9, 9, 600.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 04:20:04'),
(10, 10, 600.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 04:15:58'),
(11, 11, 600.00, 0, 0.00, '2022-11-11 12:12:26', '2022-11-12 04:15:27'),
(15, 15, 351.00, 0, 0.00, '2022-11-12 06:34:34', '2023-02-09 10:23:30'),
(73, 178, 351.00, 0, 0.00, '2023-02-20 14:21:34', '2023-02-20 14:21:34'),
(80, 178, 351.00, 0, 0.00, '2023-02-20 14:24:19', '2023-02-20 14:24:19'),
(84, 256, 130.00, 0, 0.00, '2023-02-21 10:57:08', '2023-02-21 10:57:08'),
(85, 256, 130.00, 0, 0.00, '2023-02-21 10:57:39', '2023-02-21 10:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `shipping_charge` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `status` enum('ordered','pending','completed') COLLATE utf8mb4_unicode_ci DEFAULT 'ordered',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `invoice_no`, `amount`, `shipping_charge`, `discount`, `total`, `status`, `created_at`, `updated_at`) VALUES
(24, 'INV#83460981', 12500.00, 0.00, 0.00, 12500.00, 'ordered', '2022-11-12 04:39:21', '2023-02-09 11:04:25'),
(25, 'INV#66166825', 478.00, 0.00, 0.00, 478.00, 'ordered', '2022-11-12 04:45:30', '2022-11-12 06:20:39'),
(28, 'INV#99791896', 491.00, 0.00, 2.00, 489.00, 'ordered', '2023-02-18 00:44:06', '2023-02-19 09:59:33'),
(29, 'INV#67274296', 246.00, 0.00, 2.00, 244.00, 'ordered', '2023-02-19 10:03:22', '2023-02-19 10:03:22'),
(30, 'INV#40870139', 246.00, 0.00, 2.00, 244.00, 'ordered', '2023-02-19 10:04:24', '2023-02-19 10:04:24'),
(31, 'INV#48196070', 246.00, 0.00, 2.00, 244.00, 'ordered', '2023-02-19 10:04:30', '2023-02-19 10:04:30'),
(32, 'INV#85483762', 4.00, 0.00, 0.00, 0.00, 'ordered', '2023-02-19 10:04:58', '2023-02-19 10:08:21');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `purchase_id`, `product_id`, `price`, `quantity`, `discount`, `total`, `created_at`, `updated_at`) VALUES
(62, 24, 2, 245.00, 12, 0.00, 2940.00, '2022-11-12 04:39:21', '2023-02-09 11:04:25'),
(63, 24, 7, 478.00, 20, 0.00, 9560.00, '2022-11-12 04:39:22', '2022-11-12 04:39:22'),
(65, 25, 7, 478.00, 1, 0.00, 478.00, '2022-11-12 04:45:30', '2022-11-12 04:45:30'),
(71, 28, 1, 245.00, 1, 0.00, 245.00, '2023-02-18 00:44:06', '2023-02-18 00:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dallin Heathcote II', 'laurianne97@example.org', '+1-747-910-4831', '2023-02-05 09:45:52', '2023-02-05 09:45:52', NULL),
(2, 'Aiyana Conroy', 'vjohnson@example.com', '+1-520-392-8003', '2023-02-05 09:45:52', '2023-02-05 09:45:52', NULL),
(3, 'Pearlie Jacobs PhD', 'oanderson@example.com', '585-396-0306', '2023-02-05 09:45:52', '2023-02-05 09:45:52', NULL),
(8, 'Zackery Stoltenberg', 'renee.howell@example.net', '+1-760-571-2564', '2023-02-05 09:45:53', '2023-02-05 09:45:53', NULL),
(9, 'Dominique Christiansen', 'langosh.torrey@example.org', '1-954-401-0402', '2023-02-05 09:45:53', '2023-02-05 09:45:53', NULL),
(10, 'Maxie Auer', 'howell.tyler@example.org', '(628) 862-5490', '2023-02-05 09:45:53', '2023-02-05 09:45:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL
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
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cars_mechanic_id_foreign` (`mechanic_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owners_car_id_foreign` (`car_id`);

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
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

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
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_has_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD UNIQUE KEY `students_phone_unique` (`phone`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `country_id` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `mechanics`
--
ALTER TABLE `mechanics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_mechanic_id_foreign` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `owners`
--
ALTER TABLE `owners`
  ADD CONSTRAINT `owners_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
