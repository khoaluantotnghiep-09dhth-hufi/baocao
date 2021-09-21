-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2021 at 08:59 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniqlo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill`
--

CREATE TABLE `tbl_bill` (
  `id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `total` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `id_staff` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill_info`
--

CREATE TABLE `tbl_bill_info` (
  `id` varchar(50) NOT NULL,
  `id_bill` varchar(50) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `into_money` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_sectors` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` varchar(50) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `image` varchar(500) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `id` varchar(50) NOT NULL,
  `date_import` date NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `total_import` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_info`
--

CREATE TABLE `tbl_import_info` (
  `id` varchar(50) NOT NULL,
  `id_import` varchar(50) NOT NULL,
  `id_order_info` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_product_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` mediumtext NOT NULL,
  `id_staff` varchar(50) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_object`
--

CREATE TABLE `tbl_object` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` varchar(50) NOT NULL,
  `date_order` date NOT NULL,
  `name_warehouse` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_info`
--

CREATE TABLE `tbl_order_info` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `retail_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` varchar(50) NOT NULL,
  `name` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `like_product` int(11) NOT NULL,
  `dislike_product` int(11) NOT NULL,
  `id_category` varchar(50) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `id_promotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_exchange`
--

CREATE TABLE `tbl_product_exchange` (
  `id` varchar(50) NOT NULL,
  `id_bill_info` varchar(50) NOT NULL,
  `reason` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_info`
--

CREATE TABLE `tbl_product_info` (
  `id` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  `id_size` varchar(50) NOT NULL,
  `id_color` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `desciption` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating_info`
--

CREATE TABLE `tbl_rating_info` (
  `id` varchar(50) NOT NULL,
  `id_rating` varchar(50) NOT NULL,
  `id_bill_info` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sectors`
--

CREATE TABLE `tbl_sectors` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_object` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `postion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bill`
--
ALTER TABLE `tbl_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `tbl_bill_info`
--
ALTER TABLE `tbl_bill_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_product_info` (`id_product_info`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sectors` (`id_sectors`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_import`
--
ALTER TABLE `tbl_import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `tbl_import_info`
--
ALTER TABLE `tbl_import_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_import` (`id_import`),
  ADD KEY `id_order_info` (`id_order_info`),
  ADD KEY `id_product_info` (`id_product_info`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `tbl_object`
--
ALTER TABLE `tbl_object`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_info`
--
ALTER TABLE `tbl_order_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product_info` (`id_product_info`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_product_info` (`id_product_info`),
  ADD KEY `id_promotion` (`id_promotion`);

--
-- Indexes for table `tbl_product_exchange`
--
ALTER TABLE `tbl_product_exchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill_info` (`id_bill_info`);

--
-- Indexes for table `tbl_product_info`
--
ALTER TABLE `tbl_product_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_color` (`id_color`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_size` (`id_size`);

--
-- Indexes for table `tbl_promotion`
--
ALTER TABLE `tbl_promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rating_info`
--
ALTER TABLE `tbl_rating_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill_info` (`id_bill_info`),
  ADD KEY `id_rating` (`id_rating`);

--
-- Indexes for table `tbl_sectors`
--
ALTER TABLE `tbl_sectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_object` (`id_object`);

--
-- Indexes for table `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bill`
--
ALTER TABLE `tbl_bill`
  ADD CONSTRAINT `tbl_bill_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tbl_customer` (`id`),
  ADD CONSTRAINT `tbl_bill_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `tbl_staff` (`id`);

--
-- Constraints for table `tbl_bill_info`
--
ALTER TABLE `tbl_bill_info`
  ADD CONSTRAINT `tbl_bill_info_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `tbl_bill` (`id`),
  ADD CONSTRAINT `tbl_bill_info_ibfk_2` FOREIGN KEY (`id_product_info`) REFERENCES `tbl_product_info` (`id`);

--
-- Constraints for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD CONSTRAINT `tbl_category_ibfk_1` FOREIGN KEY (`id_sectors`) REFERENCES `tbl_sectors` (`id`);

--
-- Constraints for table `tbl_import`
--
ALTER TABLE `tbl_import`
  ADD CONSTRAINT `tbl_import_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id`);

--
-- Constraints for table `tbl_import_info`
--
ALTER TABLE `tbl_import_info`
  ADD CONSTRAINT `tbl_import_info_ibfk_1` FOREIGN KEY (`id_import`) REFERENCES `tbl_import` (`id`),
  ADD CONSTRAINT `tbl_import_info_ibfk_2` FOREIGN KEY (`id_order_info`) REFERENCES `tbl_order_info` (`id`),
  ADD CONSTRAINT `tbl_import_info_ibfk_3` FOREIGN KEY (`id_product_info`) REFERENCES `tbl_product_info` (`id`);

--
-- Constraints for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD CONSTRAINT `tbl_news_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `tbl_staff` (`id`);

--
-- Constraints for table `tbl_order_info`
--
ALTER TABLE `tbl_order_info`
  ADD CONSTRAINT `tbl_order_info_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id`),
  ADD CONSTRAINT `tbl_order_info_ibfk_2` FOREIGN KEY (`id_product_info`) REFERENCES `tbl_product_info` (`id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`id_product_info`) REFERENCES `tbl_product_info` (`id`),
  ADD CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`id_promotion`) REFERENCES `tbl_promotion` (`id`);

--
-- Constraints for table `tbl_product_exchange`
--
ALTER TABLE `tbl_product_exchange`
  ADD CONSTRAINT `tbl_product_exchange_ibfk_1` FOREIGN KEY (`id_bill_info`) REFERENCES `tbl_bill_info` (`id`);

--
-- Constraints for table `tbl_product_info`
--
ALTER TABLE `tbl_product_info`
  ADD CONSTRAINT `tbl_product_info_ibfk_1` FOREIGN KEY (`id_color`) REFERENCES `tbl_color` (`id`),
  ADD CONSTRAINT `tbl_product_info_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_product` (`id`),
  ADD CONSTRAINT `tbl_product_info_ibfk_3` FOREIGN KEY (`id_size`) REFERENCES `tbl_size` (`id`);

--
-- Constraints for table `tbl_rating_info`
--
ALTER TABLE `tbl_rating_info`
  ADD CONSTRAINT `tbl_rating_info_ibfk_1` FOREIGN KEY (`id_bill_info`) REFERENCES `tbl_bill_info` (`id`),
  ADD CONSTRAINT `tbl_rating_info_ibfk_2` FOREIGN KEY (`id_rating`) REFERENCES `tbl_rating` (`id`);

--
-- Constraints for table `tbl_sectors`
--
ALTER TABLE `tbl_sectors`
  ADD CONSTRAINT `tbl_sectors_ibfk_1` FOREIGN KEY (`id_object`) REFERENCES `tbl_object` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
