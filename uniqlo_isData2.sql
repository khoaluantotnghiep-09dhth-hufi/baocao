-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 07:58 AM
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
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bill`
--

INSERT INTO `tbl_bill` (`id`, `order_date`, `total`, `status`, `id_customer`, `id_staff`, `delivery_date`, `address`, `phone`, `email`, `total_quantity`, `note`) VALUES
('bill-1', '2021-09-08', 0, NULL, 'user-1', 'staff-1', NULL, NULL, NULL, NULL, NULL, NULL),
('bill-24', '2020-09-19', 800000, 1, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL),
('bill-424', '2020-09-19', 800000, 1, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL),
('bill-44', '2020-09-19', 300000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '090251425', '', NULL, NULL),
('bill-446', '2020-09-19', 300000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL),
('bill-44644', '2020-09-19', 800000, 0, 'user-1', 'staff-1', '0000-00-00', '1920/12/1,Phường 10, Quận Gò Vấp,HCM', '', '', NULL, NULL);

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
) ;

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
('category-ktwusmax', 'Quần Áo Em Bé', 'sector-ktwucgoi');

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
  `image` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `phone`, `image`, `password`, `email`) VALUES
('user-1', 'Nguyễn Thanh Huy', '1920,Phường 8,Quận Gò Vấp,Tp.HCM', '0902559431', '', 'thanhhuy456', 'huynguyen2913@gmail.com'),
('user-2', 'Nguyễn Thị Thanh Toàn', 'HCM', 'admin', '', 'admin', 'thanhtian29123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_import`
--

CREATE TABLE `tbl_import` (
  `id` varchar(50) NOT NULL,
  `date_import` date DEFAULT NULL,
  `id_order` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_import`
--

INSERT INTO `tbl_import` (`id`, `date_import`, `id_order`, `status`) VALUES
('import-ktxxljxm', '2021-09-24', 'order-ktxxl38f', 0);

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
  `id_order_info` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_product_info` varchar(50) NOT NULL
) ;

--
-- Dumping data for table `tbl_import_info`
--

INSERT INTO `tbl_import_info` (`id`, `id_import`, `id_order_info`, `quantity`, `id_product_info`) VALUES
('import-info-ktxxlsmj', 'import-ktxxljxm', 'order-info-ktxxld3z', 3, 'product-info-ktwv8kj1'),
('import-info-ktxxm66b', 'import-ktxxljxm', 'order-info-ktxxl83z', 3, 'product-info-ktwv8gf8');

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
('news-8', 'TẬN HƯỞNG SỰ THOẢI MÁI TUYỆT VỜI NGAY TẠI NHÀ', '2020-11-24', 'Những ngày chuyển mùa mưa gió, những ngày dịch vẫn chưa lắng xuống hoàn toàn hay đơn giản là những ngày cuối tuần chỉ muốn nghỉ ngơi thật sâu, chúng ta sẽ mong bất cứ khi nào ở nhà đều có thể là khoảng thoải mái nhất để làm những điều mình thích. Nhưng thoải mái chưa đủ, với phái đẹp ở nhà cũng phải đẹp?\n\nUNIQLO mang đến cho bạn những gợi ý thời trang LifeWear để dù làm việc online, nấu ăn tại nhà, bạn cũng thật tự tin và thư giãn. Cùng khám phá đó là những sản phẩm nào và đến ngay các cửa hàng UNIQLO để sở hữu bạn nhé.', 'staff-1', 'https://www.uniqlo.com/vn/news/topics/2020072401/img/thumb_ll.png', 'https://www.uniqlo.com/vn/news/topics/2020072401/img/mimg_1_m.png');

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
('order-ktxxl38f', '2021-09-24', 'Kho Đà Nẵng', 1);

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
) ;

--
-- Dumping data for table `tbl_order_info`
--

INSERT INTO `tbl_order_info` (`id`, `id_order`, `id_product_info`, `quantity`, `status`) VALUES
('order-info-ktxxl83z', 'order-ktxxl38f', 'product-info-ktwv8gf8', 3, 1),
('order-info-ktxxld3z', 'order-ktxxl38f', 'product-info-ktwv8kj1', 3, 1);

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
('product-1', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 400000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442140/item/09_442140.jpg', 'promotion-ktmzkqjx'),
('product-2', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-2', 'https://im.uniqlo.com/images/common/pc/goods/442141/item/15_442141.jpg', '0'),
('product-4', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/442138/item/09_442138.jpg', '0'),
('product-ktwuvdn6', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 249000, 'abc', 0, 0, 'category-1', 'blob:http://localhost:3000/f14e7672-b693-4179-ba3b-37c1b72181e8', 'promotion-ktmzkqjx'),
('product-ktwuwb7n', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 249000, 'avc', 0, 0, 'category-2', 'blob:http://localhost:3000/c9f45e3b-e003-4f45-b585-4317bc86c249', '0'),
('product-ktwuwxta', 'NỮ LIGHT FLANNEL CHECKED LONG SLEEVE SHIRT', 32423, 'ád', 0, 0, 'category-1', 'blob:http://localhost:3000/c284c902-b101-4565-96b2-f3e3dd08ffa9', '0'),
('product-ktwuxm91', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 199000, 'ád', 0, 0, 'category-ktwud9cp', 'blob:http://localhost:3000/025ce4b3-5d18-4b59-80ee-8c7231931a26', '0'),
('product-ktwuxxxe', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwud9cp', 'blob:http://localhost:3000/7e2af5c3-f21e-480f-97d4-4acb88879302', 'promotion-ktmzkqjx'),
('product-ktwuy6my', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwudjna', 'blob:http://localhost:3000/07324113-d579-40c8-bdd1-58aa673acb81', '0'),
('product-ktwuye6t', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwudjna', 'blob:http://localhost:3000/8615da5e-c070-43d6-8d94-dd31c3b5f528', 'promotion-ktmzkqjx'),
('product-ktwuyoua', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'qưewqeqưeqư', 0, 0, 'category-ktwuedk3', 'blob:http://localhost:3000/85567e85-3893-4cdd-8de2-0dee30da1566', '0'),
('product-ktwuz1wf', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsad', 0, 0, 'category-ktwuedk3', 'blob:http://localhost:3000/c6f49058-b5ae-4dc5-b7ff-1c7608eaccce', 'promotion-ktmzkqjx'),
('product-ktwuzi4r', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwuerqr', 'blob:http://localhost:3000/2fe936ba-3697-47ee-be90-cb9e9d006159', 'promotion-ktmzkqjx'),
('product-ktwuzufd', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuerqr', 'blob:http://localhost:3000/74d4e642-add4-4320-9c4c-ffa94424ec83', 'promotion-ktmzkqjx'),
('product-ktwv03t6', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuf3pj', 'blob:http://localhost:3000/4d08c0ca-0b8c-460f-9549-ad7459a52a5c', 'promotion-ktmzkqjx'),
('product-ktwv0emj', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwuf3pj', 'blob:http://localhost:3000/9f917ecf-821d-45df-b125-d40c25d75a1b', 'promotion-ktmzkqjx'),
('product-ktwv1f64', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufcsb', 'blob:http://localhost:3000/04fc52f2-076a-4930-b990-b1151b09d70b', 'promotion-ktmzkqjx'),
('product-ktwv1s81', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufcsb', 'blob:http://localhost:3000/c86a7c00-1ac0-4ac0-9a33-f64743d660e3', '0'),
('product-ktwv29l6', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufinj', 'blob:http://localhost:3000/ad358f9b-bce6-45ee-ba26-8d441f443915', 'promotion-ktmzkqjx'),
('product-ktwv2j5e', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áđá', 0, 0, 'category-ktwufinj', 'blob:http://localhost:3000/2fd0debe-24ee-4a7f-8b74-43d75da447c8', '0'),
('product-ktwv2sys', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufru9', 'blob:http://localhost:3000/7315746b-010a-46f3-9c9e-58b8be45f169', 'promotion-ktmzkqjx'),
('product-ktwv32vb', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwufru9', 'blob:http://localhost:3000/87e7bcce-2467-4f56-866f-3e380b8f4cd5', '0'),
('product-ktwv3b2l', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'áda', 0, 0, 'category-ktwug2lt', 'blob:http://localhost:3000/e6de97bb-95fb-4b5d-bc6a-0b062d293389', 'promotion-ktmzkqjx'),
('product-ktwv3npt', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsa', 0, 0, 'category-ktwug90n', 'blob:http://localhost:3000/ac7f325c-607a-46db-af53-0fbc24b4eb8c', '0'),
('product-ktwv3xk2', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwug90n', 'blob:http://localhost:3000/5b387cfe-3059-428c-bd14-460dafbe1c43', '0'),
('product-ktwv4g1q', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwugj7v', 'blob:http://localhost:3000/9f336d0a-2fa4-47ed-b343-eb276a6be594', 'promotion-ktmzkqjx'),
('product-ktwv4u2u', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwugj7v', 'blob:http://localhost:3000/99fb3e76-5160-4763-b8a7-292b9f987799', 'promotion-ktmzkqjx'),
('product-ktwv565o', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwugrx1', 'blob:http://localhost:3000/b16adf91-166c-4afa-a51e-9ea17c3d0862', 'promotion-ktmzkqjx'),
('product-ktwv5gxq', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádá', 0, 0, 'category-ktwugynn', 'blob:http://localhost:3000/f56e0c00-7085-45d3-af3e-0cb307223e90', 'promotion-ktmzkqjx'),
('product-ktwv5p50', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ádsa', 0, 0, 'category-ktwugynn', 'blob:http://localhost:3000/3b2cc1df-a858-406a-a18c-10df5849a0cd', '0'),
('product-ktwv5xvo', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'ád', 0, 0, 'category-ktwuk228', 'blob:http://localhost:3000/134d8143-f0fb-49b8-81a1-3e4b4e42b67b', '0'),
('product-ktwv691x', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 32423, 'sadá', 0, 0, 'category-ktwursqi', 'blob:http://localhost:3000/d03e0bab-fddb-4305-b268-9d07e443dec2', '0');

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
) ;

--
-- Dumping data for table `tbl_product_info`
--

INSERT INTO `tbl_product_info` (`id`, `id_product`, `id_size`, `id_color`, `quantity`) VALUES
('bill-info-1', 'product-1', 'size-M', 'color-4', 11),
('product-info-1', 'product-1', 'size-S', 'color-1', 1),
('product-info-5', 'product-1', 'size-L', 'color-2', 3),
('product-info-52', 'product-1', 'size-L', 'color-2', 12),
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
('product-info-ktwvgnyu', 'product-ktwv5xvo', 'size-M', 'color-2', 4);

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
('0', 'Chào Đón Noel An Lành', '2021-09-28', '2021-10-27', '0', NULL),
('promotion-ktmzkqjx', 'Tết Gia Đình Đoàn Viên', '2021-12-27', '2021-12-29', '75', NULL);

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
  `email` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `postion` int(11) DEFAULT NULL,
  `cmnn_cccc` text DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `name`, `email`, `phone`, `address`, `password`, `postion`, `cmnn_cccc`, `image`) VALUES
('staff-1', 'Trần Văn Hoàng', 'hoang232@gmail.com', '0902441254', '32/2,Phường 2, Quận Tân Bình,Tp.HCM', 'admin', 0, NULL, NULL);

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
  ADD KEY `id_bill_info` (`id_bill_info`);

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
