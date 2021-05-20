-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 04 2021 г., 21:02
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinotower`
--

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_categories`
--

CREATE TABLE `murzalin_categories` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_categories`
--

INSERT INTO `murzalin_categories` (`id`, `name`, `parent_id`, `deleted_at`) VALUES
(1, 'Ужасы', NULL, NULL),
(2, 'Комедия', NULL, NULL),
(3, 'Триллер', NULL, NULL),
(4, 'Детектив', NULL, NULL),
(5, 'Фантастика', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_categories_films`
--

CREATE TABLE `murzalin_categories_films` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `film_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_categories_films`
--

INSERT INTO `murzalin_categories_films` (`id`, `category_id`, `film_id`) VALUES
(1, 5, 3),
(2, 5, 4),
(3, 1, 5),
(4, 2, 6),
(5, 1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_countries`
--

CREATE TABLE `murzalin_countries` (
  `id` smallint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_countries`
--

INSERT INTO `murzalin_countries` (`id`, `name`) VALUES
(1, 'Казахстан'),
(2, 'Россия'),
(3, 'США'),
(4, 'Великобритания'),
(5, 'Украина');

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_films`
--

CREATE TABLE `murzalin_films` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `country_id` smallint NOT NULL,
  `duration` smallint UNSIGNED NOT NULL,
  `year_of_issue` year NOT NULL,
  `age` tinyint UNSIGNED NOT NULL,
  `link_img` varchar(255) DEFAULT NULL,
  `link_kinopoisk` varchar(255) DEFAULT NULL,
  `link_video` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_films`
--

INSERT INTO `murzalin_films` (`id`, `name`, `country_id`, `duration`, `year_of_issue`, `age`, `link_img`, `link_kinopoisk`, `link_video`, `created_at`, `deleted_at`) VALUES
(3, 'Игра Эндера', 3, 114, 2013, 8, 'https://upload.wikimedia.org/wikipedia/ru/thumb/b/bf/Ender%27s_Game.jpg/211px-Ender%27s_Game.jpg', 'https://www.kinopoisk.ru/film/568687/', 'https://www.kinopoisk.ru/film/568687/video/', '2021-05-01 23:59:32', NULL),
(4, 'Грань будущего', 3, 113, 2014, 7, 'https://avatars.mds.yandex.net/get-ott/224348/2a00000167f9d9905e6a787582c6b9ccf31c/678x380', 'https://www.kinopoisk.ru/film/505851/', 'https://www.kinopoisk.ru/film/505851/video/', '2021-05-01 00:04:32', NULL),
(5, 'Мгла', 3, 126, 2007, 14, 'https://upload.wikimedia.org/wikipedia/ru/a/a1/The_Mist_poster.jpg', 'https://www.kinopoisk.ru/film/273302/', 'https://www.kinopoisk.ru/film/273302/video/', '2021-05-01 00:11:30', NULL),
(6, '1+1', 3, 113, 2011, 10, 'https://upload.wikimedia.org/wikipedia/ru/b/b9/Intouchables.jpg', 'https://www.kinopoisk.ru/film/535341/', 'https://www.kinopoisk.ru/film/535341/video/', '2021-05-01 00:55:30', NULL),
(7, 'Синистер', 3, 110, 2012, 9, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSvOuz8gXrlrDlB-0wJdER72DfnJUSDzf0YZWsHb9xGbJpRs16f', 'https://www.kinopoisk.ru/film/590022/', 'https://www.kinopoisk.ru/film/590022/video/', '2021-05-01 00:44:30', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_genders`
--

CREATE TABLE `murzalin_genders` (
  `id` tinyint NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_genders`
--

INSERT INTO `murzalin_genders` (`id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_ratings`
--

CREATE TABLE `murzalin_ratings` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `user_id` int NOT NULL,
  `ball` tinyint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_reviews`
--

CREATE TABLE `murzalin_reviews` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `is_approved` tinyint NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `murzalin_users`
--

CREATE TABLE `murzalin_users` (
  `id` int NOT NULL,
  `fio` varchar(150) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender_id` tinyint NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `murzalin_users`
--

INSERT INTO `murzalin_users` (`id`, `fio`, `birthday`, `gender_id`, `email`, `password`, `created_at`, `deleted_at`) VALUES
(1, 'Емельянов Марк', '1981-12-07', 1, 'Емельянов.Марк@почта.ру', '12345678', '2004-05-21 19:29:29', NULL),
(2, 'Журавлёв Ипполит', '1998-10-18', 1, 'Журавлёв.Ипполит@почта.ру', '12345678', '2004-05-21 19:29:29', NULL),
(3, 'Горбунов Аркадий', '1996-08-21', 1, 'Горбунов.Аркадий@почта.ру', '12345678', '2004-05-21 19:29:29', NULL),
(4, 'Новиков Адриан', '1982-11-17', 1, 'Новиков.Адриан@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(5, 'Константинов Евсей', '1990-06-04', 1, 'Константинов.Евсей@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(6, 'Архипов Аполлинарий', '1995-08-21', 1, 'Архипов.Аполлинарий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(7, 'Федотов Леонтий', '1978-04-11', 1, 'Федотов.Леонтий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(8, 'Шарапов Геннадий', '1984-03-27', 1, 'Шарапов.Геннадий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(9, 'Никонов Тихон', '1986-09-05', 1, 'Никонов.Тихон@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(10, 'Брагин Ватслав', '1990-08-09', 1, 'Брагин.Ватслав@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(11, 'Марков Азарий', '1992-08-19', 1, 'Марков.Азарий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(12, 'Бирюков Лукьян', '1972-08-14', 1, 'Бирюков.Лукьян@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(13, 'Королёв Максимильян', '1998-12-09', 1, 'Королёв.Максимильян@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(14, 'Савельев Артемий', '1990-04-23', 1, 'Савельев.Артемий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(15, 'Трофимов Федот', '1995-05-04', 1, 'Трофимов.Федот@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(16, 'Фролов Феликс', '1982-08-26', 1, 'Фролов.Феликс@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(17, 'Чернов Власий', '1991-11-27', 1, 'Чернов.Власий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(18, 'Самойлов Валентин', '1998-09-19', 1, 'Самойлов.Валентин@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(19, 'Некрасов Алексей', '1989-08-15', 1, 'Некрасов.Алексей@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(20, 'Харитонов Даниил', '1991-12-10', 1, 'Харитонов.Даниил@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(21, 'Шубин Геннадий', '1998-04-16', 1, 'Шубин.Геннадий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(22, 'Попов Григорий', '1998-02-10', 1, 'Попов.Григорий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(23, 'Хохлов Валентин', '1973-04-06', 1, 'Хохлов.Валентин@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(24, 'Воронов Рудольф', '1995-05-15', 1, 'Воронов.Рудольф@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(25, 'Родионов Альберт', '1999-11-21', 1, 'Родионов.Альберт@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(26, 'Зуев Остап', '1978-03-07', 1, 'Зуев.Остап@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(27, 'Тарасов Леонард', '1999-11-13', 1, 'Тарасов.Леонард@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(28, 'Громов Федот', '1998-02-01', 1, 'Громов.Федот@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(29, 'Лыткин Геннадий', '1982-10-17', 1, 'Лыткин.Геннадий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(30, 'Кононов Олег', '1975-10-19', 1, 'Кононов.Олег@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(31, 'Волков Даниил', '1977-09-24', 1, 'Волков.Даниил@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(32, 'Лебедев Маркел', '1982-05-11', 1, 'Лебедев.Маркел@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(33, 'Дмитриев Корнелий', '1980-08-18', 1, 'Дмитриев.Корнелий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(34, 'Калашников Осип', '1980-11-02', 1, 'Калашников.Осип@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(35, 'Филиппов Эдуард', '1974-02-11', 1, 'Филиппов.Эдуард@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(36, 'Терентьев Остап', '1997-05-27', 1, 'Терентьев.Остап@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(37, 'Горбачёв Варфоломей', '1995-08-04', 1, 'Горбачёв.Варфоломей@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(38, 'Алексеев Макарий', '1980-05-04', 1, 'Алексеев.Макарий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(39, 'Наумов Светозар', '1971-01-11', 1, 'Наумов.Светозар@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(40, 'Романов Дорофей', '1977-02-26', 1, 'Романов.Дорофей@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(41, 'Лукин Ким', '1973-07-28', 1, 'Лукин.Ким@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(42, 'Кудряшов Аполлинарий', '1990-06-14', 1, 'Кудряшов.Аполлинарий@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(43, 'Николаев Гектор', '1992-03-03', 1, 'Николаев.Гектор@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(44, 'Елисеев Кирилл', '1992-11-08', 1, 'Елисеев.Кирилл@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(45, 'Сазонов Камиль', '1980-03-22', 1, 'Сазонов.Камиль@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(46, 'Марков Никифор', '1981-04-07', 1, 'Марков.Никифор@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(47, 'Дмитриев Ефрем', '1979-09-09', 1, 'Дмитриев.Ефрем@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(48, 'Лазарев Ренат', '1982-08-23', 1, 'Лазарев.Ренат@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(49, 'Агафонов Борислав', '1998-04-07', 1, 'Агафонов.Борислав@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(50, 'Туров Ефим', '1998-08-12', 1, 'Туров.Ефим@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(51, 'Лебедев Юст', '1974-03-10', 1, 'Лебедев.Юст@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(52, 'Рогов Артем', '1996-11-23', 1, 'Рогов.Артем@почта.ру', '12345678', '2004-05-21 19:29:30', NULL),
(53, 'Хохлов Лукьян', '1970-10-09', 1, 'Хохлов.Лукьян@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(54, 'Орехов Эмилий', '1982-06-09', 1, 'Орехов.Эмилий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(55, 'Сазонов Александр', '1982-04-11', 1, 'Сазонов.Александр@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(56, 'Емельянов Марк', '1991-11-10', 1, 'Емельянов.Марк@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(57, 'Трофимов Артемий', '1981-08-28', 1, 'Трофимов.Артемий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(58, 'Кузнецов Демьян', '1978-10-11', 1, 'Кузнецов.Демьян@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(59, 'Поляков Елисей', '1973-08-23', 1, 'Поляков.Елисей@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(60, 'Тетерин Елизар', '1980-08-27', 1, 'Тетерин.Елизар@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(61, 'Рыбаков Вилен', '1972-10-01', 1, 'Рыбаков.Вилен@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(62, 'Евдокимов Валентин', '1974-02-25', 1, 'Евдокимов.Валентин@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(63, 'Большаков Альберт', '1992-10-31', 1, 'Большаков.Альберт@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(64, 'Журавлёв Горислав', '1987-06-13', 1, 'Журавлёв.Горислав@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(65, 'Фокин Ульян', '1993-03-13', 1, 'Фокин.Ульян@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(66, 'Кудряшов Борислав', '1977-04-21', 1, 'Кудряшов.Борислав@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(67, 'Соколов Аристарх', '1991-06-11', 1, 'Соколов.Аристарх@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(68, 'Лобанов Яромир', '1985-07-14', 1, 'Лобанов.Яромир@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(69, 'Блохин Болеслав', '1974-11-14', 1, 'Блохин.Болеслав@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(70, 'Титов Филарет', '1978-12-30', 1, 'Титов.Филарет@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(71, 'Шашков Аркадий', '1981-09-10', 1, 'Шашков.Аркадий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(72, 'Панфилов Эраст', '1987-08-05', 1, 'Панфилов.Эраст@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(73, 'Тимофеев Архип', '1992-08-25', 1, 'Тимофеев.Архип@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(74, 'Новиков Вадим', '1992-06-07', 1, 'Новиков.Вадим@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(75, 'Симонов Борис', '1980-01-02', 1, 'Симонов.Борис@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(76, 'Шарапов Ростислав', '1973-09-29', 1, 'Шарапов.Ростислав@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(77, 'Петров Аким', '1980-12-08', 1, 'Петров.Аким@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(78, 'Виноградов Евграф', '1971-03-25', 1, 'Виноградов.Евграф@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(79, 'Соловьёв \r\n  Харитон', '1979-12-02', 1, 'Соловьёв.\r\n  Харитон@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(80, 'Филиппов Осип', '1994-08-17', 1, 'Филиппов.Осип@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(81, 'Артемьев Петр', '1975-07-26', 1, 'Артемьев.Петр@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(82, 'Гордеев Даниил', '1978-08-29', 1, 'Гордеев.Даниил@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(83, 'Поляков Евстафий', '1998-07-03', 1, 'Поляков.Евстафий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(84, 'Богданов Стефан', '1975-03-04', 1, 'Богданов.Стефан@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(85, 'Баранов Виталий', '1975-10-31', 1, 'Баранов.Виталий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(86, 'Лукин Иван', '1979-05-04', 1, 'Лукин.Иван@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(87, 'Терентьев Вальдемар', '1993-01-31', 1, 'Терентьев.Вальдемар@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(88, 'Лапин Владлен', '1979-03-10', 1, 'Лапин.Владлен@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(89, 'Беляков Герасим', '1980-07-14', 1, 'Беляков.Герасим@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(90, 'Сазонов Валентин', '1997-01-07', 1, 'Сазонов.Валентин@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(91, 'Медведев Маркел', '1977-11-09', 1, 'Медведев.Маркел@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(92, 'Овчинников Модест', '1981-04-20', 1, 'Овчинников.Модест@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(93, 'Попов Виталий', '1980-12-20', 1, 'Попов.Виталий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(94, 'Буров Данислав', '1999-04-28', 1, 'Буров.Данислав@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(95, 'Панфилов Любомир', '1975-07-18', 1, 'Панфилов.Любомир@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(96, 'Рогов Василий', '1983-01-09', 1, 'Рогов.Василий@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(97, ',Евсеев Федор', '1978-08-23', 1, ',Евсеев.Федор@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(98, 'Мишин Аристарх', '1991-06-29', 1, 'Мишин.Аристарх@почта.ру', '12345678', '2004-05-21 19:29:31', NULL),
(99, 'Кузьмин Добрыня', '1980-08-07', 1, 'Кузьмин.Добрыня@почта.ру', '12345678', '2004-05-21 19:29:32', NULL),
(100, 'Беляев Власий', '1974-06-05', 1, 'Беляев.Власий@почта.ру', '12345678', '2004-05-21 19:29:32', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `murzalin_categories`
--
ALTER TABLE `murzalin_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `murzalin_categories_films`
--
ALTER TABLE `murzalin_categories_films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Индексы таблицы `murzalin_countries`
--
ALTER TABLE `murzalin_countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `murzalin_films`
--
ALTER TABLE `murzalin_films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `murzalin_genders`
--
ALTER TABLE `murzalin_genders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `murzalin_ratings`
--
ALTER TABLE `murzalin_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `murzalin_reviews`
--
ALTER TABLE `murzalin_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `murzalin_users`
--
ALTER TABLE `murzalin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `murzalin_categories`
--
ALTER TABLE `murzalin_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `murzalin_categories_films`
--
ALTER TABLE `murzalin_categories_films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `murzalin_countries`
--
ALTER TABLE `murzalin_countries`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `murzalin_films`
--
ALTER TABLE `murzalin_films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `murzalin_genders`
--
ALTER TABLE `murzalin_genders`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `murzalin_ratings`
--
ALTER TABLE `murzalin_ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `murzalin_reviews`
--
ALTER TABLE `murzalin_reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `murzalin_users`
--
ALTER TABLE `murzalin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `murzalin_categories`
--
ALTER TABLE `murzalin_categories`
  ADD CONSTRAINT `murzalin_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `murzalin_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `murzalin_categories_films`
--
ALTER TABLE `murzalin_categories_films`
  ADD CONSTRAINT `murzalin_categories_films_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `murzalin_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `murzalin_categories_films_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `murzalin_films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `murzalin_films`
--
ALTER TABLE `murzalin_films`
  ADD CONSTRAINT `murzalin_films_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `murzalin_countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `murzalin_ratings`
--
ALTER TABLE `murzalin_ratings`
  ADD CONSTRAINT `murzalin_ratings_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `murzalin_films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `murzalin_ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `murzalin_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `murzalin_reviews`
--
ALTER TABLE `murzalin_reviews`
  ADD CONSTRAINT `murzalin_reviews_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `murzalin_films` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `murzalin_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `murzalin_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `murzalin_users`
--
ALTER TABLE `murzalin_users`
  ADD CONSTRAINT `murzalin_users_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `murzalin_genders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
