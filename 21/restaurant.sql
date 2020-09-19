-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Сен 19 2020 г., 12:11
-- Версия сервера: 10.3.22-MariaDB-1ubuntu1
-- Версия PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurant`
--

-- --------------------------------------------------------

--
-- Структура таблицы `discount`
--

CREATE TABLE `discount` (
  `id` int(11) UNSIGNED NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discount`
--

INSERT INTO `discount` (`id`, `percent`) VALUES
(1, 5),
(2, 10),
(3, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `dishes_names`
--

CREATE TABLE `dishes_names` (
  `id` int(11) UNSIGNED NOT NULL,
  `type_of_dish` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `grams` int(11) NOT NULL,
  `price_in_usd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dishes_names`
--

INSERT INTO `dishes_names` (`id`, `type_of_dish`, `name`, `grams`, `price_in_usd`) VALUES
(1, 1, 'cesar', 250, 10),
(2, 2, 'steak', 300, 20),
(3, 3, 'dorada', 200, 18),
(4, 4, 'gaspacho', 400, 8),
(5, 5, 'ice-cream', 100, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `drinks`
--

CREATE TABLE `drinks` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `drinks`
--

INSERT INTO `drinks` (`id`, `name`) VALUES
(1, 'tea'),
(2, 'coffee'),
(3, 'juice'),
(4, 'water');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `dish_id` int(11) UNSIGNED NOT NULL,
  `number_of_dishes` int(11) NOT NULL,
  `drink_id` int(11) UNSIGNED NOT NULL,
  `number_of_drinks` int(11) NOT NULL,
  `waiter_id` int(11) UNSIGNED NOT NULL,
  `delivery_id` int(1) UNSIGNED NOT NULL,
  `discount_id` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `dish_id`, `number_of_dishes`, `drink_id`, `number_of_drinks`, `waiter_id`, `delivery_id`, `discount_id`) VALUES
(1, 1, 2, 2, 2, 3, 1, 2),
(2, 3, 1, 3, 3, 1, 2, 3),
(3, 4, 4, 1, 3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_info`
--

CREATE TABLE `restaurant_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `phone` int(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `site` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `restaurant_info`
--

INSERT INTO `restaurant_info` (`id`, `phone`, `address`, `site`, `email`, `facebook`) VALUES
(1, 969998877, 'Dnepr, Yavornitskogo street, 18', 'pepperoni.ua', 'pepperoni@mail.com', 'facebook.com/pepperoni-ua');

-- --------------------------------------------------------

--
-- Структура таблицы `type_of_delivery`
--

CREATE TABLE `type_of_delivery` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_of_delivery`
--

INSERT INTO `type_of_delivery` (`id`, `type`) VALUES
(1, 'restaurant'),
(2, 'home');

-- --------------------------------------------------------

--
-- Структура таблицы `type_of_dishes`
--

CREATE TABLE `type_of_dishes` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `type_of_dishes`
--

INSERT INTO `type_of_dishes` (`id`, `type`) VALUES
(1, 'salad'),
(2, 'meat'),
(3, 'fish'),
(4, 'soup'),
(5, 'dessert');

-- --------------------------------------------------------

--
-- Структура таблицы `waiters`
--

CREATE TABLE `waiters` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `waiters`
--

INSERT INTO `waiters` (`id`, `name`) VALUES
(1, 'Oleg'),
(2, 'Petro'),
(3, 'Anton');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `dishes_names`
--
ALTER TABLE `dishes_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_of_dish` (`type_of_dish`);

--
-- Индексы таблицы `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `drink_id` (`drink_id`),
  ADD KEY `waiter_id` (`waiter_id`);

--
-- Индексы таблицы `restaurant_info`
--
ALTER TABLE `restaurant_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type_of_delivery`
--
ALTER TABLE `type_of_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type_of_dishes`
--
ALTER TABLE `type_of_dishes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `waiters`
--
ALTER TABLE `waiters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `dishes_names`
--
ALTER TABLE `dishes_names`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `drinks`
--
ALTER TABLE `drinks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `restaurant_info`
--
ALTER TABLE `restaurant_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `type_of_delivery`
--
ALTER TABLE `type_of_delivery`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_of_dishes`
--
ALTER TABLE `type_of_dishes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `waiters`
--
ALTER TABLE `waiters`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dishes_names`
--
ALTER TABLE `dishes_names`
  ADD CONSTRAINT `dishes_names_ibfk_1` FOREIGN KEY (`type_of_dish`) REFERENCES `type_of_dishes` (`id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `type_of_delivery` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`dish_id`) REFERENCES `dishes_names` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`drink_id`) REFERENCES `drinks` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`waiter_id`) REFERENCES `waiters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
