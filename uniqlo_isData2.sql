-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2021 at 09:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniqlo`
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
  `email` text DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `name_customer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bill`
--

INSERT INTO `tbl_bill` (`id`, `order_date`, `total`, `status`, `id_customer`, `id_staff`, `delivery_date`, `address`, `phone`, `email`, `total_quantity`, `note`, `name_customer`) VALUES
('bill-1', '2021-09-08', 0, NULL, 'user-1', 'staff-1', NULL, NULL, NULL, NULL, NULL, NULL, ''),
('bill-24', '2020-09-19', 800000, 1, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL, ''),
('bill-424', '2020-09-19', 800000, 1, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL, ''),
('bill-44', '2020-09-19', 300000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '090251425', '', NULL, NULL, ''),
('bill-446', '2020-09-19', 300000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL, ''),
('bill-44644', '2020-09-19', 800000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL, ''),
('bill-customer-ku0r9zod', '2021-09-26', 186750, 0, 'customer-ku0oahls', NULL, NULL, 'ádsad , Tỉnh Bắc Ninh , Thành phố Bắc Ninh , Phường Hạp Lĩnh', '0352393384', 'trungquangta115@gmail.com', 1, 'abc', 'tạ quang trung');

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
('bill-customer-info-ku0r9zoe', 'bill-customer-ku0r9zod', 'product-info-ktwv784e', 186750, 1),
('bill-info-1', 'bill-1', 'product-info-1', 140000, 4),
('bill-info-2', 'bill-1', 'product-info-1', 140000, 1),
('bill-info-3', 'bill-1', 'product-info-1', 140000, 3),
('bill-info-4', 'bill-1', 'product-info-1', 140000, 3),
('bill-info-test', 'bill-24', 'product-info-52', 140000, 1);

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
('category-2', 'Hàng Mới Về', 'selector-1'),
('category-ktwud9cp', 'Áo Khoác', 'selector-3'),
('category-ktwudjna', 'Áo Khoác Kiểu/Áo Khoác Parka', 'selector-3'),
('category-ktwuedk3', 'Áo Thun', 'sector-ktwu86wf'),
('category-ktwuerqr', 'Áo Sơ Mi/Áo Kiểu', 'sector-ktwu86wf'),
('category-ktwuf3pj', 'Quần Leggings', 'sector-ktwu8dhj'),
('category-ktwufcsb', 'Chân Váy', 'sector-ktwu8dhj'),
('category-ktwufinj', 'Quần Short', 'sector-ktwu8dhj'),
('category-ktwufru9', 'Đầm Jumpsuits', 'sector-ktwu8t1s'),
('category-ktwug2lt', 'Áo Lót', 'sector-ktwu91ke'),
('category-ktwug90n', 'Quần Lót', 'sector-ktwu91ke'),
('category-ktwugj7v', 'Áo Quần Mặc Nhà', 'sector-ktwu98fc'),
('category-ktwugrx1', 'Phụ Kiện', 'sector-ktwu9fxa'),
('category-ktwugynn', 'Thời Trang Mặc Nhà', 'sector-ktwu98fc'),
('category-ktwuk228', 'Giá Mới', 'sector-ktwu49it'),
('category-ktwuk8me', 'Hàng Mới Về', 'sector-ktwu49it'),
('category-ktwukm2o', 'Uniqlo +', 'selector-2'),
('category-ktwuks7o', 'Theory', 'selector-2'),
('category-ktwukxjc', 'Uniqlo +', 'sector-ktwu5ezi'),
('category-ktwul1wi', 'Theory', 'sector-ktwu5ezi'),
('category-ktwul8zs', 'Áo Khoác', 'sector-ktwu5m79'),
('category-ktwulst7', 'Áo Thun', 'sector-ktwu5ztn'),
('category-ktwulxxa', 'Áo Sơ Mi Casual', 'sector-ktwu5ztn'),
('category-ktwum3js', 'Áo Khoác Kiểu/Áo Khoác Parka', 'sector-ktwu5m79'),
('category-ktwumc3u', 'Quần Dài', 'sector-ktwu655y'),
('category-ktwumidj', 'Quần Short', 'sector-ktwu655y'),
('category-ktwumoiu', 'Quần Jeans', 'sector-ktwu655y'),
('category-ktwumwbo', 'AIRism', 'sector-ktwu6amc'),
('category-ktwun0iz', 'Quần Lót', 'sector-ktwu6amc'),
('category-ktwunb35', 'Áo Quần Mặc Nhà', 'sector-ktwu6keg'),
('category-ktwunfw2', 'Phụ Kiện', 'sector-ktwu6oz0'),
('category-ktwunw6g', 'Giá Mới', 'sector-ktwu9prg'),
('category-ktwuo4wf', 'Hàng Mới Về', 'sector-ktwu9prg'),
('category-ktwuod5k', 'Uniqlo U', 'sector-ktwu9wsd'),
('category-ktwuom2f', 'Marimekko', 'sector-ktwu9wsd'),
('category-ktwuovag', 'Áo Khoác', 'sector-ktwua6jf'),
('category-ktwupbhs', 'Áo Thun', 'sector-ktwuahfj'),
('category-ktwupkt7', 'Áo Nỉ/Áo Hoodie', 'sector-ktwuahfj'),
('category-ktwupw2p', 'Váy Ngắn', 'sector-ktwuaqc3'),
('category-ktwuq3hs', 'Quần Dài', 'sector-ktwuaqc3'),
('category-ktwuqcsd', 'Đầm Jumpsuits', 'sector-ktwuaxbm'),
('category-ktwuql6q', 'Áo', 'sector-ktwub5dw'),
('category-ktwuqwl1', 'Quần Lót', 'sector-ktwub5dw'),
('category-ktwur4um', 'Thời Trang Mặc Nhà', 'sector-ktwubcnn'),
('category-ktwurbf5', 'Phụ Kiện', 'sector-ktwubpg4'),
('category-ktwurmnj', 'Giá Mới', 'sector-ktwubycx'),
('category-ktwursqi', 'Hàng Mới Về', 'sector-ktwubycx'),
('category-ktwurzs5', 'Marimekko', 'sector-ktwuc4wn'),
('category-ktwusch0', 'Quần Áo Trẻ Sơ Sinh', 'sector-ktwuc9ix'),
('category-ktwusmax', 'Quần Áo Em Bé', 'sector-ktwucgoi'),
('category-ku27adoa', 'Test2', 'sector-ktwu5ztn');

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
('color-4', 'Orange', NULL),
('color-ktrcm807', 'Nguyễn Thanh Huy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `password` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `cmnd_cccc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `phone`, `image`, `password`, `email`, `gender`, `cmnd_cccc`) VALUES
('customer-ku0oahls', 'Tạ Quang Trung', 'tân phú', '0352393384', '', 'admin', 'trungquangta115@gmail.com', NULL, NULL),
('user-1', 'Nguyễn Thanh Huy', '1920,Phường 8,Quận Gò Vấp,Tp.HCM', '0902559431', '', 'thanhhuy456', 'huynguyen2913@gmail.com', NULL, NULL),
('user-2', 'Nguyễn Thị Thanh Toàn', 'HCM', 'admin', '', 'admin', 'thanhtian29123@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `id` varchar(50) NOT NULL,
  `date_import` date DEFAULT NULL,
  `id_order` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_import`
--

INSERT INTO `tbl_import` (`id`, `date_import`, `id_order`, `status`) VALUES
('bill-info-3', '2021-09-26', NULL, 1),
('import-change-ku0v6mpr', '2021-09-26', NULL, 0),
('import-ktxxljxm', '2021-09-24', 'order-ktxxl38f', 0),
('import-ku0qyqo5', '2021-09-26', 'order-ku0qwvsu', 0),
('import-ku0uvh0r', '2021-09-26', 'order-ku0uu4l9', 0);

--
-- Triggers `tbl_import`
--
DELIMITER $$
CREATE TRIGGER `update_status_order` BEFORE INSERT ON `tbl_import` FOR EACH ROW UPDATE tbl_order set status = 1 WHERE id= new.id_order
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import_info`
--

CREATE TABLE `tbl_import_info` (
  `id` varchar(50) NOT NULL,
  `id_import` varchar(50) NOT NULL,
  `id_order_info` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_product_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_import_info`
--

INSERT INTO `tbl_import_info` (`id`, `id_import`, `id_order_info`, `quantity`, `id_product_info`) VALUES
('import-change-ku0v6mps', 'import-change-ku0v6mpr', NULL, 1, 'product-info-ktwv784e'),
('import-info-ktxxlsmj', 'import-ktxxljxm', 'order-info-ktxxld3z', 3, 'product-info-ktwv8kj1'),
('import-info-ktxxm66b', 'import-ktxxljxm', 'order-info-ktxxl83z', 3, 'product-info-ktwv8gf8'),
('import-info-ku0qz5tf', 'import-ku0qyqo5', 'order-info-ku0qyhwv', 1, 'product-info-ku0qy000'),
('import-info-ku0qzddf', 'import-ku0qyqo5', 'order-info-ku0qybl7', 1, 'product-info-ku0qxu86'),
('import-info-ku0uw1yf', 'import-ku0uvh0r', 'order-info-ku0uugxl', 2, 'product-info-ku0qy000'),
('import-info-ku0uw64g', 'import-ku0uvh0r', 'order-info-ku0uuc38', 2, 'product-info-ku0qxu86');

--
-- Triggers `tbl_import_info`
--
DELIMITER $$
CREATE TRIGGER `setStatus` BEFORE INSERT ON `tbl_import_info` FOR EACH ROW UPDATE tbl_order_info set status = 1 WHERE id= new.id_order_info
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_quantity_product_info_import` BEFORE INSERT ON `tbl_import_info` FOR EACH ROW UPDATE tbl_product_info set quantity = quantity + new.quantity WHERE id = new.id_product_info
$$
DELIMITER ;

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
  `image_banner` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `title`, `date`, `description`, `id_staff`, `image`, `image_banner`) VALUES
('news-1', 'SPORT UTILITY WEAR – Ý TƯỞNG THIẾT KẾ THỂ THAO TIỆN ÍCH MỖI NGÀY', '2021-08-12', 'Sport Utility Wear là một khái niệm mới đến từ UNIQLO, nhằm hướng đến sự đa năng và tiện lợi trong cuộc sống thường nhật. Được sản xuất từ chất liệu khô nhanh và co giãn tối ưu, các sản phẩm thể thao này không chỉ có thể mặc khi tập luyện mà còn mặc được trong nhiều dịp hàng ngày với nhiều phong cách linh hoạt. Bạn có thể mặc \"Sports Utility Wear\" trong bất kỳ hoàn cảnh nào, dù đi chơi, nghỉ ngơi tại nhà hay thậm chí là mặc đến văn phòng làm việc.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2021060101/img/thumb_ll.jpg', 'https://www.uniqlo.com/vn/news/topics/2021060101/img/mimg_1_m.jpg'),
('news-2', 'TRANG PHỤC MẶC NHÀ CHO MÙA HÈ THOẢI MÁI', '2021-09-22', 'Hè sang, thời tiết trở nên dần nóng bức, thời gian ở nhà nhiều hơn, UNIQLO mang đến các sản phẩm thoáng mát, thấm hút mồ hôi giúp bạn tận hưởng những giây phút ở nhà trọn vẹn hơn.\nHơn thế, khi những chuyến du lịch bị hạn chế cũng là lúc bạn có thể dành thêm thời gian bên gia đình và bạn bè với những buổi tiệc nướng BBQ tại vườn hoặc trong công viên. Đồ mặc nhà sẽ trở nên cực kỳ hữu ích trong những dịp như vậy đấy.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2021051101/img/thumb_ll.jpg', 'https://www.uniqlo.com/vn/news/topics/2021051101/img/mimg_1_m.jpg'),
('news-3', 'UNIQLO TODAY BỘ SƯU TẬP HANA TAJIMA x UNIQLO: TRANG PHỤC LifeWear - ĐƠN GIẢN VÀ TỰ NHIÊN CHO PHỤ NỮ TRƯỞNG THÀNH', '2021-05-21', 'Bộ sưu tập HANA TAJIMA x UNIQLO Xuân / Hè 2021 là lựa chọn hoàn hảo cho thời điểm biến chuyển trong phong cách sống và sự ưu tiên của xã hội hôm nay. Lấy cảm hứng từ ý tưởng \"thay đổi phong cách sống\", những trang phục trong Bộ sưu tập đều vô cùng tiện lợi và thiết thực nhằm hướng đến việc cho phép người mặc được là chính mình khi khoác lên chúng. Đây là bộ sưu tập thứ 12 tại Nhật Bản kể từ khi ra mắt bộ sưu tập đầu tiên Hana Tajima kết hợp cùng UNIQLO vào năm 2015.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2021050501/img/thumb_ll.jpg', 'https://www.uniqlo.com/vn/news/topics/2021050501/img/mimg_1_m.jpg'),
('news-4', 'Vẻ đẹp Đơn giản mà thời thượng khi áo rộng kết hợp cùng Legging!', '2021-08-23', 'Bạn sẽ không sai lầm khi kết hợp áo thun và quần legging! Kiểu phối đồ đơn giản nhưng lại là sự cân bằng hoàn hảo, mang đến cho bạn vẻ ngoài sành điệu. Hãy cùng UNIQLO điểm qua sáu kiểu quần legging hot nhất mùa này cùng những cách phối mới nhất, thời thượng nhất theo xu hướng thời trang của năm nay.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2021042301/img/thumb_ll.jpg', 'https://www.uniqlo.com/vn/news/topics/2021042301/img/mimg_1_m.jpg'),
('news-5', 'THOẢI MÁI VÀ SANG TRỌNG CÙNG LINEN TỪ UNIQLO', '2021-09-23', 'Thời điểm này trong năm là lúc chúng ta bắt đầu cân nhắc về phong cách thời trang gắn với linen – chất vải mềm mại & gắn liền với tự nhiên. UNIQLO sẻ là điểm đến lý tưởng nơi bạn có thể tìm thấy rất nhiều các sản phẩm linen trong mùa này, đa dạng từ sơ mi cơ bản đến quần short thời trang, kể cả những mẫu thiết kế có thể phối cùng. Bạn chắc chắn sẽ yêu thích sự đa dạng của các loại vải linen UNIQLO từ linen 100% cao cấp đến Linen pha thướt tha.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2021040201/img/thumb_ll.jpg', 'https://www.uniqlo.com/vn/news/topics/2021040201/img/mimg_1_m.jpg'),
('news-6', 'Sống chậm lại, yêu bản thân hơn trong những ngày giao mùa “đặc biệt”', '2020-11-23', 'Những ngày giao mùa đặc biệt hơn cả, đây là khoảng thời gian mà niềm vui không đến từ các hoạt động sôi nổi hay náo nhiệt nữa mà đến từ sự yêu thương, chăm sóc cơ thể, sống chậm lại để cảm nhận nhiều hơn. Những gam màu dịu mắt sẽ giúp bạn tìm thấy sự bình yên ấy trong tâm hồn. Vẫn năng động và thoải mái như những đặc tính vốn có nhưng với những gam màu nhẹ nhàng, trung tính, bạn lại có thể tạo ra những bản phối hoàn toàn khác dành cho những chiếc áo thun, quần short quen thuộc thường nhật.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2020073101/img/thumb_ll.png', 'https://www.uniqlo.com/vn/news/topics/2020073101/img/mimg_1_m.png'),
('news-8', 'TẬN HƯỞNG SỰ THOẢI MÁI TUYỆT VỜI NGAY TẠI NHÀ', '2020-11-24', 'Những ngày chuyển mùa mưa gió, những ngày dịch vẫn chưa lắng xuống hoàn toàn hay đơn giản là những ngày cuối tuần chỉ muốn nghỉ ngơi thật sâu, chúng ta sẽ mong bất cứ khi nào ở nhà đều có thể là khoảng thoải mái nhất để làm những điều mình thích. Nhưng thoải mái chưa đủ, với phái đẹp ở nhà cũng phải đẹp?\n\nUNIQLO mang đến cho bạn những gợi ý thời trang LifeWear để dù làm việc online, nấu ăn tại nhà, bạn cũng thật tự tin và thư giãn. Cùng khám phá đó là những sản phẩm nào và đến ngay các cửa hàng UNIQLO để sở hữu bạn nhé.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2020072401/img/thumb_ll.png', 'https://www.uniqlo.com/vn/news/topics/2020072401/img/mimg_1_m.png'),
('news-ktzhap4l', 'a', '2021-09-25', 'ádsad', 'staff-3', 'ád', 'ád'),
('news-ku253k2t', 'test', '2021-09-27', 'sad', 'staff-3', 'sadsa', 'ádsa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_object`
--

CREATE TABLE `tbl_object` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_object`
--

INSERT INTO `tbl_object` (`id`, `name`) VALUES
('object-1', 'Nam'),
('object-2', 'Nữ'),
('object-3', 'Trẻ Em'),
('object-4', 'Trẻ Sơ Sinh'),
('object-5', 'Tin Tức');

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

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `date_order`, `name_warehouse`, `status`) VALUES
('order-ktxxl38f', '2021-09-24', 'Kho Đà Nẵng', 1),
('order-ku0qwvsu', '2021-09-26', 'Kho Đà Nẵng', 1),
('order-ku0uu4l9', '2021-09-26', 'Kho HN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_info`
--

CREATE TABLE `tbl_order_info` (
  `id` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_product_info` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_info`
--

INSERT INTO `tbl_order_info` (`id`, `id_order`, `id_product_info`, `quantity`, `status`) VALUES
('order-info-ktxxl83z', 'order-ktxxl38f', 'product-info-ktwv8gf8', 3, 1),
('order-info-ktxxld3z', 'order-ktxxl38f', 'product-info-ktwv8kj1', 3, 1),
('order-info-ku0qybl7', 'order-ku0qwvsu', 'product-info-ku0qxu86', 1, 1),
('order-info-ku0qyhwv', 'order-ku0qwvsu', 'product-info-ku0qy000', 1, 1),
('order-info-ku0uuc38', 'order-ku0uu4l9', 'product-info-ku0qxu86', 2, 1),
('order-info-ku0uugxl', 'order-ku0uu4l9', 'product-info-ku0qy000', 2, 1);

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
  `image` blob DEFAULT NULL,
  `id_promotion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id`, `name`, `price`, `description`, `like_product`, `dislike_product`, `id_category`, `image`, `id_promotion`) VALUES
('product-1', 'test', 32423, 'dsad', 0, 1, 'category-1', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f65633334393834302d316136362d346536302d386565632d316231396464663231346464, '0'),
('product-2', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-2', 0x68747470733a2f2f696d2e756e69716c6f2e636f6d2f696d616765732f636f6d6d6f6e2f70632f676f6f64732f3434323134312f6974656d2f31355f3434323134312e6a7067, '0'),
('product-4', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 0x68747470733a2f2f696d2e756e69716c6f2e636f6d2f696d616765732f636f6d6d6f6e2f70632f676f6f64732f3434323133382f6974656d2f30395f3434323133382e6a7067, '0'),
('product-ktwuvdn6', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 249000, 'abc', 0, 0, 'category-1', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f66313465373637322d623639332d343137392d626133622d333763316237323138316538, 'promotion-ktmzkqjx'),
('product-ktwuwb7n', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 249000, 'avc', 0, 0, 'category-2', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f63396634356533622d653030332d346634352d623538352d343331376263383663323439, '0'),
('product-ktwuwxta', 'NỮ LIGHT FLANNEL CHECKED LONG SLEEVE SHIRT', 32423, 'ád', 0, 0, 'category-1', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f63323834633930322d623130312d343536352d393662322d663365336464303866666139, '0'),
('product-ktwuxm91', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 199000, 'ád', 0, 0, 'category-ktwud9cp', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f30323563653462332d356431382d346235392d383065652d386337323331393331613236, '0'),
('product-ktwuxxxe', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwud9cp', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f37653261663563332d663231652d343830662d393764342d346163623838383739333032, 'promotion-ktmzkqjx'),
('product-ktwuy6my', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwudjna', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f30373332343131332d643537392d343063382d626464312d353861613637336163623831, '0'),
('product-ktwuye6t', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwudjna', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f38363135646135652d633037302d343364362d386439342d646433316333623566353238, 'promotion-ktmzkqjx'),
('product-ktwuyoua', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'qưewqeqưeqư', 0, 0, 'category-ktwuedk3', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f38353536376538352d333839332d346364642d386465322d306465653330646131353636, '0'),
('product-ktwuz1wf', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsad', 0, 0, 'category-ktwuedk3', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f63366634393035382d623561652d346463352d623766662d316337363038656163636365, 'promotion-ktmzkqjx'),
('product-ktwuzi4r', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwuerqr', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f32666539333662612d333639372d343765652d626539302d636239653964303036313539, 'promotion-ktmzkqjx'),
('product-ktwuzufd', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuerqr', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f37346434653634322d616464342d343332302d396334632d666661393434323465633833, 'promotion-ktmzkqjx'),
('product-ktwv03t6', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuf3pj', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f34643038633063612d306238632d343630662d393534392d616437343539613532613563, 'promotion-ktmzkqjx'),
('product-ktwv0emj', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuf3pj', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f39663931376563662d383231642d343564662d623132352d643430633235643735613162, 'promotion-ktmzkqjx'),
('product-ktwv1f64', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufcsb', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f30346663353266322d303736612d343933302d623939302d623131353162303964373062, 'promotion-ktmzkqjx'),
('product-ktwv1s81', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufcsb', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f63383661376330302d316163302d346163302d396133332d663634373433643636306533, '0'),
('product-ktwv29l6', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufinj', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f61643335386639622d626365362d343565652d626132362d386434343166343433393135, 'promotion-ktmzkqjx'),
('product-ktwv2j5e', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwufinj', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f32666430646562652d323465652d346137662d386237342d343364373564613434376338, '0'),
('product-ktwv2sys', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufru9', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f37333135373436622d303130612d343666332d396339652d353862386265343566313639, 'promotion-ktmzkqjx'),
('product-ktwv32vb', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufru9', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f38376537626363652d323436372d346635362d383636662d336533383062386634636435, '0'),
('product-ktwv3b2l', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áda', 0, 0, 'category-ktwug2lt', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f65366465393762622d393566622d346235642d626336612d306230363264323933333839, 'promotion-ktmzkqjx'),
('product-ktwv3npt', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsa', 0, 0, 'category-ktwug90n', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f61633766333235632d363037612d343664622d616635332d306662633234623465623863, '0'),
('product-ktwv3xk2', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwug90n', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f35623338376366652d333035392d343238632d626431342d343630646166626531633433, '0'),
('product-ktwv4g1q', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwugj7v', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f39663333366430612d326661342d343765642d623334332d656232373661366265353934, 'promotion-ktmzkqjx'),
('product-ktwv4u2u', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwugj7v', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f39396662336537362d353136302d343736332d623861372d323932623966393837373939, 'promotion-ktmzkqjx'),
('product-ktwv565o', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwugrx1', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f62313661646639312d313636632d346166612d613531652d396561313763336430383632, 'promotion-ktmzkqjx'),
('product-ktwv5gxq', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwugynn', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f66353665306330302d373038352d343564332d616633652d306362333037323233653930, 'promotion-ktmzkqjx'),
('product-ktwv5p50', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsa', 0, 0, 'category-ktwugynn', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f33623263633164662d613835382d343036612d613138632d313064663538343961306364, '0'),
('product-ktwv5xvo', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwuk228', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f31333464383134332d663066622d343962382d383161312d336534623465343262363762, '0'),
('product-ktwv691x', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'sadá', 0, 0, 'category-ktwursqi', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f64303365306261622d666464622d343330352d623236382d396430376534343364656332, '0'),
('product-ku0qxjez', 'test Nhập hàng', 32423, 'sadsa', 0, 0, 'category-1', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f32373663383436302d346239312d343532652d613263622d666330383262363430653761, '0'),
('product-ku25xkfs', 'Test2', 32423, 'ưqe', 0, 0, 'category-2', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f32633533326266392d346666632d343565662d393265642d316363393966626131323764, 'promotion-ktmzkqjx'),
('product-ku2631b8', 'update', 32423, 'sadád', 0, 0, 'category-ktwudjna', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f33636431356561662d323564332d343133332d383230392d326162396638653639346339, 'promotion-ktmzkqjx');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_exchange`
--

CREATE TABLE `tbl_product_exchange` (
  `id` varchar(50) NOT NULL,
  `id_bill_info` varchar(50) NOT NULL,
  `reason` text DEFAULT NULL,
  `id_staff_change` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_exchange`
--

INSERT INTO `tbl_product_exchange` (`id`, `id_bill_info`, `reason`, `id_staff_change`) VALUES
('exchange-1', 'bill-info-1', 'đổi chơi đc k =))', 'staff-1'),
('exchange-ku0okgim', 'bill-info-1', 'đổi chơi', 'staff-3'),
('exchange-ku0v6mpq', 'bill-customer-info-ku0r9zoe', 'đổi chơi nè', 'staff-3');

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
('bill-info-1', 'product-1', 'size-M', 'color-4', 11),
('product-info-1', 'product-1', 'size-S', 'color-1', 1),
('product-info-5', 'product-1', 'size-L', 'color-2', 3),
('product-info-52', 'product-1', 'size-L', 'color-2', 11),
('product-info-81', 'product-1', 'size-S', 'color-2', 1),
('product-info-ktunkest', 'product-2', 'size-S', 'color-2', 10),
('product-info-ktv81ueb', 'product-4', 'size-M', 'color-1', 1),
('product-info-ktwgkrg5', 'product-4', 'size-M', 'color-2', 10),
('product-info-ktwv6ruq', 'product-2', 'size-XL', 'color-2', 5),
('product-info-ktwv6yom', 'product-2', 'size-XXL', 'color-3', 5),
('product-info-ktwv784e', 'product-ktwuvdn6', 'size-L', 'color-1', 5),
('product-info-ktwv7ffw', 'product-ktwuvdn6', 'size-M', 'color-1', 5),
('product-info-ktwv7op8', 'product-ktwuwb7n', 'size-S', 'color-2', 5),
('product-info-ktwv7u1j', 'product-ktwuwb7n', 'size-XL', 'color-3', 3),
('product-info-ktwv7y24', 'product-ktwuwxta', 'size-XL', 'color-2', 4),
('product-info-ktwv83kn', 'product-ktwuwxta', 'size-XL', 'color-2', 3),
('product-info-ktwv87fq', 'product-ktwuxm91', 'size-S', 'color-3', 4),
('product-info-ktwv8gf8', 'product-ktwuxm91', 'size-S', 'color-1', 27),
('product-info-ktwv8kj1', 'product-ktwuxxxe', 'size-M', 'color-1', 5),
('product-info-ktwv8p9x', 'product-ktwuxxxe', 'size-S', 'color-3', 4),
('product-info-ktwv8ula', 'product-ktwv0emj', 'size-S', 'color-2', 4),
('product-info-ktwv90yo', 'product-ktwv0emj', 'size-XXXL', 'color-4', 4),
('product-info-ktwv96i4', 'product-ktwv03t6', 'size-L', 'color-1', 4),
('product-info-ktwv9ey3', 'product-ktwv03t6', 'size-S', 'color-1', 8),
('product-info-ktwv9kjq', 'product-ktwuzufd', 'size-S', 'color-2', 3),
('product-info-ktwv9qqo', 'product-ktwuzufd', 'size-XXL', 'color-3', 4),
('product-info-ktwva0re', 'product-ktwuzi4r', 'size-M', 'color-2', 3),
('product-info-ktwvawbx', 'product-ktwuy6my', 'size-S', 'color-2', 3),
('product-info-ktwvb2cg', 'product-ktwuy6my', 'size-XXL', 'color-3', 4),
('product-info-ktwvb7co', 'product-ktwuye6t', 'size-XL', 'color-2', 3),
('product-info-ktwvbcht', 'product-ktwuye6t', 'size-XL', 'color-3', 4),
('product-info-ktwvbur4', 'product-ktwuzi4r', 'size-S', 'color-1', 3),
('product-info-ktwvc0o9', 'product-ktwuz1wf', 'size-M', 'color-2', 4),
('product-info-ktwvc72m', 'product-ktwuz1wf', 'size-S', 'color-2', 5),
('product-info-ktwvccm8', 'product-ktwuyoua', 'size-S', 'color-3', 3),
('product-info-ktwvchmw', 'product-ktwuyoua', 'size-M', 'color-1', 3),
('product-info-ktwvcnx0', 'product-ktwv2j5e', 'size-S', 'color-2', 3),
('product-info-ktwvcufa', 'product-ktwv2j5e', 'size-S', 'color-3', 4),
('product-info-ktwvcyxa', 'product-ktwv29l6', 'size-S', 'color-2', 4),
('product-info-ktwvd48o', 'product-ktwv29l6', 'size-S', 'color-3', 4),
('product-info-ktwvd9o8', 'product-ktwv1s81', 'size-S', 'color-2', 4),
('product-info-ktwvdez6', 'product-ktwv1s81', 'size-S', 'color-3', 4),
('product-info-ktwvdjiy', 'product-ktwv1f64', 'size-L', 'color-2', 4),
('product-info-ktwvdpn9', 'product-ktwv1f64', 'size-S', 'color-1', 4),
('product-info-ktwve3pj', 'product-ktwv3xk2', 'size-S', 'color-2', 4),
('product-info-ktwveclh', 'product-ktwv3xk2', 'size-S', 'color-2', 4),
('product-info-ktwvejtk', 'product-ktwv3npt', 'size-M', 'color-1', 4),
('product-info-ktwves9t', 'product-ktwv3npt', 'size-S', 'color-4', 4),
('product-info-ktwvezzr', 'product-ktwv3b2l', 'size-M', 'color-3', 4),
('product-info-ktwvf76j', 'product-ktwv32vb', 'size-L', 'color-1', 4),
('product-info-ktwvfdwu', 'product-ktwv32vb', 'size-XL', 'color-3', 4),
('product-info-ktwvfjps', 'product-ktwv2sys', 'size-L', 'color-2', 4),
('product-info-ktwvfq4s', 'product-ktwv5p50', 'size-L', 'color-2', 4),
('product-info-ktwvfwge', 'product-ktwv5p50', 'size-L', 'color-3', 4),
('product-info-ktwvg342', 'product-ktwv5gxq', 'size-S', 'color-2', 4),
('product-info-ktwvg98c', 'product-ktwv4u2u', 'size-M', 'color-2', 4),
('product-info-ktwvgef8', 'product-ktwv4g1q', 'size-L', 'color-3', 4),
('product-info-ktwvgj3y', 'product-ktwv691x', 'size-M', 'color-1', 4),
('product-info-ktwvgnyu', 'product-ktwv5xvo', 'size-M', 'color-2', 4),
('product-info-ku0qxu86', 'product-ku0qxjez', 'size-M', 'color-1', 4),
('product-info-ku0qy000', 'product-ku0qxjez', 'size-M', 'color-2', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotion`
--

CREATE TABLE `tbl_promotion` (
  `id` varchar(50) NOT NULL,
  `name` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_promotion`
--

INSERT INTO `tbl_promotion` (`id`, `name`, `date_start`, `date_end`, `description`, `image`) VALUES
('0', 'Chào Đón Noel An Lành 2', '2021-09-28', '2021-10-27', NULL, 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f34303166353939622d656231372d343465392d396663372d653732623038383065646161),
('promotion-ktmzkqjx', 'Tết Gia Đình Đoàn Viên', '2021-12-27', '2021-12-29', '75', NULL),
('promotion-ku256ua8', 'Tạ Quang Trung', '2021-09-27', '2021-09-29', '12321', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f61623562323438392d373837332d346539382d623837342d646337303939666666356462),
('promotion-ku270qla', 'Tạ Quang Trung', '2021-09-27', '2021-09-27', 'qư', 0x626c6f623a687474703a2f2f6c6f63616c686f73743a333030302f32396131323838332d356333382d346439332d396436372d363133326534666631633538);

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
('sector-ktwu49it', 'Đặc Biệt Nam', 'object-1'),
('sector-ktwu5ezi', 'Bộ Sựu Tập Nam', 'object-1'),
('sector-ktwu5m79', 'Áo Khoác Nam', 'object-1'),
('sector-ktwu5ztn', 'Áo Nam', 'object-1'),
('sector-ktwu655y', 'Quần Nam', 'object-1'),
('sector-ktwu6amc', 'Đồ Lót Nam', 'object-1'),
('sector-ktwu6keg', 'Thời Trang Mặc Nhà Nam', 'object-1'),
('sector-ktwu6oz0', 'Phụ Kiện Nam', 'object-1'),
('sector-ktwu86wf', 'Áo Nữ', 'object-2'),
('sector-ktwu8dhj', 'Chân váy/Quần Nữ', 'object-2'),
('sector-ktwu8t1s', 'Đầm Jumpsuits Nữ', 'object-2'),
('sector-ktwu91ke', 'Đồ Lót Nữ', 'object-2'),
('sector-ktwu98fc', 'Thời Trang Mặc Nhà Nữ', 'object-2'),
('sector-ktwu9fxa', 'Phụ Kiện Nữ', 'object-2'),
('sector-ktwu9prg', 'Đặc Biệt Trẻ Em', 'object-3'),
('sector-ktwu9wsd', 'Bộ Sựu Tập Trẻ Em', 'object-3'),
('sector-ktwua6jf', 'Áo Khoác Trẻ Em', 'object-3'),
('sector-ktwuahfj', 'Áo Trẻ Em', 'object-3'),
('sector-ktwuaqc3', 'Chân váy/Quần Trẻ Em', 'object-3'),
('sector-ktwuaxbm', 'Đầm Jumpsuits Trẻ Em', 'object-3'),
('sector-ktwub5dw', 'Đồ Lót Trẻ Em', 'object-3'),
('sector-ktwubcnn', 'Thời Trang Mặc Nhà Trẻ Em', 'object-3'),
('sector-ktwubpg4', 'Phụ Kiện Trẻ Em', 'object-3'),
('sector-ktwubycx', 'Đặc Biệt Trẻ Sơ Sinh', 'object-4'),
('sector-ktwuc4wn', 'Bộ Sựu Tập Trẻ Sơ Sinh', 'object-4'),
('sector-ktwuc9ix', 'Trẻ Sơ Sinh', 'object-4'),
('sector-ktwucgoi', 'Trẻ Em', 'object-4'),
('selector-1', 'Đặc Biệt Nữ', 'object-2'),
('selector-2', 'Bộ Sựu Tập Nữ', 'object-2'),
('selector-3', 'Áo Khoác Nữ', 'object-2');

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
  `gender` int(11) DEFAULT NULL,
  `place_of_birth` text DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `cmnn_cccc` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  ` education_level` text DEFAULT NULL,
  `certificate` text DEFAULT NULL,
  `working_day` date DEFAULT NULL,
  `password` text DEFAULT NULL,
  `role` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `name_bank` text DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `name`, `gender`, `place_of_birth`, `image`, `cmnn_cccc`, `address`, `email`, `phone`, ` education_level`, `certificate`, `working_day`, `password`, `role`, `note`, `name_bank`, `id_bank`) VALUES
('staff-1', 'Trần Văn Hoàng', NULL, NULL, NULL, NULL, '32/2,Phường 2, Quận Tân Bình,Tp.HCM', 'hoang232@gmail.com', '0902441254', NULL, NULL, NULL, 'admin', 0, NULL, NULL, NULL),
('staff-2', 'Nguyễn Bảo Hân', NULL, NULL, NULL, '9245455', '1322/223/2,Phường 12, Quận Tân Bình,Tp.HCM', 'han@gmail.com', '0929512395', NULL, NULL, NULL, 'admin', 1, NULL, NULL, NULL),
('staff-3', 'Tạ Quang Trung', 1, 'Lâm Đồng', 0x616263, 'xyz', 'xzcxz', 'trungquangta115@gmail.com', '0352393384', '1', 'ád', '2021-09-25', 'admin', 0, NULL, NULL, NULL);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

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
  ADD KEY `id_bill_info` (`id_bill_info`),
  ADD KEY `id_staff_change` (`id_staff_change`);

--
-- Indexes for table `tbl_product_info`
--
ALTER TABLE `tbl_product_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

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
  ADD CONSTRAINT `tbl_product_exchange_ibfk_1` FOREIGN KEY (`id_bill_info`) REFERENCES `tbl_bill_info` (`id`),
  ADD CONSTRAINT `tbl_product_exchange_ibfk_2` FOREIGN KEY (`id_staff_change`) REFERENCES `tbl_staff` (`id`);

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
