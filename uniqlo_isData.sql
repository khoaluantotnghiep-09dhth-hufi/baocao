-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2021 at 01:46 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill`
--

CREATE TABLE `tbl_bill` (
  `id` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
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
  `into_money` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `id_sectors` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `name`, `id_sectors`) VALUES
('category-1', 'Giá Mới', 'selector-1'),
('category-2', 'Hàng Mới Về', 'selector-1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_color`
--

INSERT INTO `tbl_color` (`id`, `name`) VALUES
('color-1', 'Red'),
('color-2', 'Blue'),
('color-3', 'Pink'),
('color-4', 'Orange');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `phone`, `image`, `password`, `email`) VALUES
('user-1', 'Nguyễn Thanh Huy', '1920,Phường 8,Quận Gò Vấp,Tp.HCM', '0902559431', '', 'admin', 'huynguyen2913@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `id` varchar(50) NOT NULL,
  `date_import` date DEFAULT NULL,
  `id_order` varchar(50) NOT NULL,
  `total_import` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_info`
--

CREATE TABLE `tbl_import_info` (
  `id` varchar(50) NOT NULL,
  `id_import` varchar(50) NOT NULL,
  `id_order_info` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_product_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_staff` varchar(50) NOT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_object`
--

CREATE TABLE `tbl_object` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_object`
--

INSERT INTO `tbl_object` (`id`, `name`) VALUES
('object-1', 'Nam'),
('object-2', 'Nữ'),
('object-3', 'Trẻ Em'),
('object-4', 'Trẻ Sơ Sinh');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` varchar(50) NOT NULL,
  `date_order` date DEFAULT NULL,
  `name_warehouse` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_info`
--

CREATE TABLE `tbl_order_info` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `retail_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `like_product` int(1) DEFAULT 1,
  `dislike_product` int(1) DEFAULT 0,
  `id_category` varchar(50) NOT NULL,
  `image` text DEFAULT NULL,
  `id_promotion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `price`, `description`, `like_product`, `dislike_product`, `id_category`, `image`, `id_promotion`) VALUES
('product-1', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442140/item/09_442140.jpg', 0),
('product-2', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442141/item/15_442141.jpg', 0),
('product-3', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442139/item/00_442139.jpg', 0),
('product-4', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442138/item/09_442138.jpg', 0),
('product-5', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/438724/item/09_438724.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_exchange`
--

CREATE TABLE `tbl_product_exchange` (
  `id` varchar(50) NOT NULL,
  `id_bill_info` varchar(50) NOT NULL,
  `reason` text DEFAULT NULL
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
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_info`
--

INSERT INTO `tbl_product_info` (`id`, `id_product`, `id_size`, `id_color`, `quantity`) VALUES
('product-info-1', 'product-1', 'size-S', 'color-1', 1),
('product-info-2', 'product-1', 'size-M', 'color-2', 1),
('product-info-3', 'product-2', 'size-M', 'color-2', 3),
('product-info-4', 'product-4', 'size-XL', 'color-2', 3),
('product-info-5', 'product-1', 'size-M', 'color-2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `desciption` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_promotion`
--

INSERT INTO `tbl_promotion` (`id`, `name`, `date_start`, `date_end`, `desciption`) VALUES
(0, 'Khuyến Mãi Đặc Biệt', '0000-00-00', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating_info`
--

CREATE TABLE `tbl_rating_info` (
  `id` varchar(50) NOT NULL,
  `id_rating` varchar(50) DEFAULT NULL,
  `id_bill_info` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sectors`
--

CREATE TABLE `tbl_sectors` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `id_object` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_sectors`
--

INSERT INTO `tbl_sectors` (`id`, `name`, `id_object`) VALUES
('selector-1', 'Đặc Biệt', 'object-2'),
('selector-2', 'Bộ Sưu Tập', 'object-2'),
('selector-3', 'Áo Khoác', 'object-2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_size`
--

INSERT INTO `tbl_size` (`id`, `name`) VALUES
('size-L', 'L'),
('size-M', 'M'),
('size-S', 'S'),
('size-XL', 'XL'),
('size-XXL', 'XXL'),
('size-XXXL', 'XXXL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `postion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `name`, `email`, `phone`, `address`, `password`, `postion`) VALUES
('staff-1', 'Trần Văn Hoàng', 'hoang232@gmail.com', '0902441254', '32/2,Phường 2, Quận Tân Bình,Tp.HCM', 'admin', 'Nhân Viên Bán Hàng');

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
