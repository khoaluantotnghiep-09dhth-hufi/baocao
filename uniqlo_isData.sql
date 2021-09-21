-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 08:21 AM
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
('product-5', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 399000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 1, 'category-1', 'https://im.uniqlo.com/images/common/pc/goods/438724/item/09_438724.jpg', '0'),
('product-ktt6yf0q', 'Test2', 32423, 'abc', 0, 0, 'category-2', '6ae7a40b156df15b12a3d019945592e20c38db80.jpg', '0'),
('product-ktt74m3f', 'update', 32423, 'ádsad', 0, 0, 'category-1', NULL, '0'),
('product-ktt75wxr', 'Test', 32432, 'ádsad', 0, 0, 'category-1', 'blob:http://localhost:3000/bb84d89b-1429-43a9-9daf-56f063312dd7', '0'),
('product-ktt7rm9z', 'Tạ Quang Trung', 32432, 'ưqeqưeqư', 0, 0, 'category-1', 'blob:http://localhost:3000/42d9e387-4e14-4588-976a-810673858421', '0'),
('product-kttnsuhk', 'NỮ UT Roy Lichtenstein Áo Thun Ngắn Tay', 249000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 0, 'category-kttni6nn', 'blob:http://localhost:3000/59699813-836b-4866-89bd-4afbcacbf204', '0'),
('product-kttnuhcd', 'NỮ ĐẦM RÚT DÂY TAY LỬNG 3/4', 999000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 0, 'category-kttmr8ih', 'blob:http://localhost:3000/efebe336-87ac-4411-befc-047927dddc71', '0'),
('product-kttnws5z', 'NỮ Quần Jean Bầu Ultra Stretch', 999000, '\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"', 0, 0, 'category-kttmt5m1', 'blob:http://localhost:3000/75409406-5245-4e43-9891-ab4d607f8834', '0'),
('product-kttnyms6', 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 249000, 'NỮ UT PEANUTS Vintage Áo Thun Ngắn Tay', 0, 0, 'category-kttn3hv1', '', '0'),
('product-ktto00d1', 'NỮ NỮ ÁO SƠ MI VẢI RAYON IN HỌA TIẾT CỔ MỞ NGẮN TAY', 249000, 'NỮ NỮ ÁO SƠ MI VẢI RAYON IN HỌA TIẾT CỔ MỞ NGẮN TAY', 0, 0, 'category-kttn3n9l', 'blob:http://localhost:3000/a835d8a3-fb91-47d4-82db-93b961615f63', '0'),
('product-ktto1m0f', 'NỮ Mame Korogouchi AIRism Cotton Oversized Sleeveless T-Shirt', 499000, 'NỮ Mame Korogouchi AIRism Cotton Oversized Sleeveless T-Shirt', 0, 0, 'category-kttmhhni', 'blob:http://localhost:3000/85f43d12-080c-40f0-b03e-4f14c67016ad', '0'),
('product-ktto2a7q', 'NỮ Hana Tajima Áo Sơ Mi Dáng Dài Tay Lỡ', 499000, 'NỮ Hana Tajima Áo Sơ Mi Dáng Dài Tay Lỡ', 0, 0, 'category-kttmip64', 'blob:http://localhost:3000/1f5bbf87-c4f4-4040-a186-3384c976dc2d', '0'),
('product-ktto42bg', 'NỮ Hana Tajima Áo Sơ Mi Vải Sheer Tay Lửng 3/4', 490000, 'NỮ Hana Tajima Áo Sơ Mi Vải Sheer Tay Lửng 3/4', 0, 0, 'category-kttmip64', 'blob:http://localhost:3000/58609ce9-9e22-4a89-8b68-255cd88ccc67', '0'),
('product-ktto4qne', 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 499000, 'NỮ AIRism A LINE SHORT SLEEVE POLO SHIRT', 0, 0, 'category-kttmiy12', 'blob:http://localhost:3000/3d6eeabc-a39b-483a-970b-49a0fb8b7133', '0'),
('product-ktto583w', 'NỮ AIRism ACTIVE UV PROTECTION SOFT LEGGINGS', 499000, 'NỮ AIRism ACTIVE UV PROTECTION SOFT LEGGINGS', 0, 0, 'category-kttmiy12', 'blob:http://localhost:3000/9021f29f-2148-4b59-b0ca-c90532c9ee0c', '0'),
('product-kttou24p', 'NỮ Nữ +J Áo Khoác Sơ Mi SUPIMA COTTON Kẻ Sọc Dài Tay', 499000, 'NỮ Nữ +J Áo Khoác Sơ Mi SUPIMA COTTON Kẻ Sọc Dài Tay', 0, 0, 'category-kttmj7io', 'blob:http://localhost:3000/d715fe1c-d7c8-4e0d-a6c6-c38a0396d166', '0'),
('product-kttouhnx', 'NỮ Nữ +J Áo Khoác Sơ Mi SUPIMA COTTON Kẻ Sọc Dài Tay', 399000, 'NỮ Nữ +J Áo Khoác Sơ Mi SUPIMA COTTON Kẻ Sọc Dài Tay', 0, 0, 'category-kttmj7io', 'blob:http://localhost:3000/5962919a-8ed2-4898-a229-460a02eb5eb0', '0'),
('product-kttov8am', 'NỮ áo thun DRY-EX cổ tròn ngắn tay', 399000, 'NỮ áo thun DRY-EX cổ tròn ngắn tay', 0, 0, 'category-kttml7zo', 'blob:http://localhost:3000/510733d7-b137-4dc5-b516-9c7094c96069', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_promotion` (`id_promotion`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `tbl_category` (`id`),
  ADD CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`id_promotion`) REFERENCES `tbl_promotion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
