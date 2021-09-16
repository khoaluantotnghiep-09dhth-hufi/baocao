-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2021 at 02:54 PM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill`
--

CREATE TABLE `tbl_bill` (
  `id` varchar(50) NOT NULL,
  `order_date` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `id_customer` varchar(50) DEFAULT NULL,
  `id_staff` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bill`
--

INSERT INTO `tbl_bill` (`id`, `order_date`, `total`, `status`, `id_customer`, `id_staff`, `delivery_date`, `address`, `phone`, `email`) VALUES
('bill-1', '2021-09-08', 0, NULL, 'user-1', 'staff-1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bill_info`
--

CREATE TABLE `tbl_bill_info` (
  `id` varchar(50) NOT NULL,
  `id_bill` varchar(50) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `into_money` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bill_info`
--

INSERT INTO `tbl_bill_info` (`id`, `id_bill`, `id_product_info`, `into_money`, `quantity`) VALUES
('bill-info-1', 'bill-1', 'product-info-1', 140000, 4),
('bill-info-2', 'bill-1', 'product-info-1', 140000, 1),
('bill-info-3', 'bill-1', 'product-info-1', 140000, 3),
('bill-info-4', 'bill-1', 'product-info-1', 140000, 3);

--
-- Triggers `tbl_bill_info`
--
DELIMITER $$
CREATE TRIGGER `repair_bill_info_product` BEFORE UPDATE ON `tbl_bill_info` FOR EACH ROW UPDATE tbl_product_info set quantity = quantity + old.quantity - new.quantity WHERE id = old.id_product_info
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_quantity_product_info` AFTER INSERT ON `tbl_bill_info` FOR EACH ROW update tbl_product_info set quantity = quantity - new.quantity where id = new.id_product_info
$$
DELIMITER ;

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
  `name` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_color`
--

INSERT INTO `tbl_color` (`id`, `name`, `image`) VALUES
('color-1', 'Red', NULL),
('color-2', 'Blue', NULL),
('color-3', 'Pink', NULL),
('color-4', 'Orange', NULL);

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
  `title` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_staff` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `sub_titile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `title`, `date`, `description`, `id_staff`, `image`, `sub_titile`) VALUES
('news-1', 'UNIQLO ĐỒNG HÀNH CÙNG CỘNG ĐỒNG, CHUNG SỨC ĐẨY LÙI ĐẠI DỊCH COVID-19', '0000-00-00', 'Với cam kết mang đến những đóng góp tích cực, lâu dài cho con người và xã hội Việt Nam,\nngày Té/7 vừa qua, tập đoàn Fast Retailing, thông qua công ty UNIQLO Việt Nam và công ty\nFast Retailing Việt Nam, đã đóng góp 11 tỷ đồng vào Quỹ vắc xin phòng, chống COVID-19 tại\nViệt Nam. Thông qua sự phổi hợp cùng Bộ Tài chính, cơ quan chịu trách nhiệm quản tý hoạt\nđộng của quỹ, phẩn đóng góp này sẽ được sử dụng để hỗ trợ trong quá trình mua, nhập khẩu\nvắc xin cũng như các hoạt động nghiên cứu, phát triển và sản xuất vắc xin trong nước. Bên\ncạnh đó, tập đoàn Fast Retaiing cũng đang triển khai hoạt động đóng góp 30.000 sản phẩm\nAlRism và DRY-EX từ UNIQLO. Với sự phối hợp của Mặt trận Tổ quốc Việt Nam, những sản\nphẩm này sẽ được gửi tặng đội ngũ nhân viên y tế, tình nguyện viên tại các cơ sở y tế tuyến\nđầu hoặc các vùng, khu vực trọng điểm cẩn hỗ trợ cao.\n\n   \n\nBỘ TÀI CHÍNH\nBAN QUAN LÝ 0UY VÄC-XIN PHONG, CHŨNG C0VID-19\n\nLỄ T IẬN\nÈ QUY VÃC-XIN ¬ế, cho\n\nl EudjA (4\n\n \n\nThông qua công ty UNIQLO Việt Nam và công ty Fast Retailng Việt Nam,\nđã đóng góp 11 tỷ đổng vào Quỹ vắc xin phòng, chống COVID-19 tại Việt Nam.\n\n \n\nVề đóng góp ý nghĩa này, ông Osamu lkezoe, Tổng Giám đốc UNIQLO Việt Nam, chia sẻ: ”UNIQLO cùng tập đoàn\nFast Retailing luôn cam kết mang đến những đóng góp tích cực lâu dài cho con người và xã hội Việt Nam. Chúng\ntôi cảm thấy vô cùng ý nghĩa khi có thể trở thành một phần trong nỗ lực chung của tất cả mọi người dân tại Việt\nNam để cùng vượt qua đại dịch COVID-19 và hy vọng rằng phần đóng góp của chúng tôi cho Quỹ vắc xin phòng,\nchống COVID-19 sẽ mang đến sự rợ cần thiết cho những nỗ lực này. Chúng tôi tin tưởng rằng bằng sự chung\nsức của mỗi cá nhân, doanh nghiệp, tổ chức trên cả nước, chúng †a sẽ cùng nhau vượt qua và chiến thắng đại\ndịch COVID-19”.\n\n \n\nBên cạnh việc ủng hộ 11 tỷ đồng vào Quỹ vắc xin phòng, chống COVID-19, UNIQLO đã và đang phối hợp cùng Mặt\ntrận Tổ quốc Việt Nam và Quỹ Hy Vọng trao tặng hơn 30.000 sản phẩm AlRism và DRY-EX với tổng giá trị lên\nđến 11 tỷ đồng đến các nhân viên y tế, tình nguyện viên tuyển đầu đang điều trị và hỗ trợ bệnh nhân COVID-]9.\nCác sản phẩm AlRism và DRY-EX từ UNIQLO với công nghệ độc quyển mang đến sự khô thoáng, thẩm hút mồ\nhôi tốt sẽ hỗ trợ nhân viên y tế và tình nguyện viên cảm thấy thoải mái hơn khi phải mặc trang phục bảo hộ nhiều.\nlớp trong quá trình làm nhiệm vụ.\n\n \n\nUNIQLO đã và đang phổi hợp cùng Mặt trận Tổ quốc Việt Nam và Quỹ Hy Vọng để trao tặng hơn\n30.000 sản phẩm AlRism và DRYEX đến các nhân viên y tế, tình nguyện viên tuyến đầu\nđang điều trị và hỗ trợ bệnh nhân C0VID—]9.\n\nDưới sự chỉ đạo của Chính phủ, Quỹ vắc xin phòng, chống COVID-19 đã được triển khai như một giải pháp mang\ntính tiên quyết, lâu dài và chiến lược để cả nước cùng vượt qua đại dịch COVID-19 với mục tiêu 70% người dân tại\nViệt Nam sẽ được tiêm chủng vắc xin trong năm nay. Ngay từ khi được triển khai, Quỹ đã tiếp nhận sự hỗ trợ từ\nvô số cá nhân, doanh nghiệp và tổ chức. Hoạt động được Fast Retailing tiến hành lần này là một phần trong cam\nkết của tập đoàn hướng đến việc mang đến những đóng góp lâu dài và tích cực cho cộng đồng.', 'staff-1', 'https://www.uniqlo.com/vn/top/img/topic/20210722_1826_gl6781.jpg', '');

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
  `status` tinyint(1) DEFAULT 0
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
  `retail_price` double DEFAULT NULL
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
  `id_promotion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `price`, `description`, `like_product`, `dislike_product`, `id_category`, `image`, `id_promotion`) VALUES
('product-1', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442140/item/09_442140.jpg', '0'),
('product-2', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442141/item/15_442141.jpg', '0'),
('product-3', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442139/item/00_442139.jpg', '0'),
('product-4', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442138/item/09_442138.jpg', '0'),
('product-5', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/438724/item/09_438724.jpg', '0');

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
('product-info-1', 'product-1', 'size-S', 'color-1', 3),
('product-info-2', 'product-1', 'size-M', 'color-2', 10),
('product-info-3', 'product-2', 'size-M', 'color-2', 10),
('product-info-4', 'product-4', 'size-XL', 'color-2', 2),
('product-info-5', 'product-1', 'size-M', 'color-2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `desciption` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_promotion`
--

INSERT INTO `tbl_promotion` (`id`, `name`, `date_start`, `date_end`, `desciption`, `image`) VALUES
('0', 'Khuyến Mãi Đặc Biệt', '0000-00-00', '0000-00-00', '', NULL);

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
  `postion` text DEFAULT NULL,
  `cmnn_cccc` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `name`, `email`, `phone`, `address`, `password`, `postion`, `cmnn_cccc`, `image`) VALUES
('staff-1', 'Trần Văn Hoàng', 'hoang232@gmail.com', '0902441254', '32/2,Phường 2, Quận Tân Bình,Tp.HCM', 'admin', 'Nhân Viên Bán Hàng', NULL, NULL);

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
  ADD CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`id_promotion`) REFERENCES `tbl_promotion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
