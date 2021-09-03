-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2021 at 03:55 PM
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
-- Database: `uniqlo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblbill`
--

CREATE TABLE `tblbill` (
  `id_bill` varchar(50) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `id_staff` varchar(50) NOT NULL,
  `datesubmit_bill` date NOT NULL,
  `total_bill` double NOT NULL,
  `status_bill` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblbillinfo`
--

CREATE TABLE `tblbillinfo` (
  `id_billinfo` varchar(50) NOT NULL,
  `id_bill` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  `intomoney_billinfo` float NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id_Category` varchar(50) NOT NULL,
  `name_Category` varchar(200) NOT NULL,
  `id_Sectors` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcolor`
--

CREATE TABLE `tblcolor` (
  `id_color` varchar(50) NOT NULL,
  `name_color` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `id_customer` varchar(50) NOT NULL,
  `name_customer` varchar(200) NOT NULL,
  `phone_customer` varchar(50) NOT NULL,
  `email_customer` varchar(50) NOT NULL,
  `password_customer` varchar(200) NOT NULL,
  `address_customer` varchar(200) NOT NULL,
  `img_customer` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblimportproduct`
--

CREATE TABLE `tblimportproduct` (
  `id_importproduct` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `dateimport_importproduct` date NOT NULL,
  `total_importproduct` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblimportproductinfo`
--

CREATE TABLE `tblimportproductinfo` (
  `id_importproductinfo` varchar(50) NOT NULL,
  `id_importproduct` varchar(50) NOT NULL,
  `id_orderinfo` varchar(50) NOT NULL,
  `quantity_importproductinfo` int(11) NOT NULL,
  `importprice_importproductinfo` float NOT NULL,
  `intomoney_importproductinfo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblnew`
--

CREATE TABLE `tblnew` (
  `id_new` varchar(50) NOT NULL,
  `name_new` varchar(200) NOT NULL,
  `id_photo` varchar(50) NOT NULL,
  `description_new` mediumtext NOT NULL,
  `datesubmit` date NOT NULL,
  `id_staff` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblobject`
--

CREATE TABLE `tblobject` (
  `id_Object` varchar(50) NOT NULL,
  `name_Object` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `id_order` varchar(50) NOT NULL,
  `dateorder_order` date NOT NULL,
  `total_order` double NOT NULL,
  `status_order` tinyint(1) NOT NULL,
  `id_supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderinfo`
--

CREATE TABLE `tblorderinfo` (
  `id_orderinfo` varchar(50) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  `quantity_orderinfo` int(11) NOT NULL,
  `priceorder_orderinfo` double NOT NULL,
  `intomoney_orderinfo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblphoto`
--

CREATE TABLE `tblphoto` (
  `id_photo` varchar(50) NOT NULL,
  `name_photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE `tblproduct` (
  `id_product` varchar(50) NOT NULL,
  `name_product` varchar(200) NOT NULL,
  `description_product` varchar(500) NOT NULL,
  `id_Category` varchar(50) NOT NULL,
  `id_promotion` varchar(50) NOT NULL,
  `price_product` float NOT NULL,
  `pricediscount_product` float NOT NULL,
  `like_product` varchar(50) NOT NULL,
  `status_product` tinyint(1) NOT NULL,
  `quantity_product` varchar(200) NOT NULL,
  `id_color` varchar(50) NOT NULL,
  `id_size` varchar(50) NOT NULL,
  `id_photo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpromotion`
--

CREATE TABLE `tblpromotion` (
  `id_promotion` varchar(50) NOT NULL,
  `name_promotion` varchar(200) NOT NULL,
  `expiry_promotion` date NOT NULL,
  `content_promotion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblrating`
--

CREATE TABLE `tblrating` (
  `id_rating` varchar(50) NOT NULL,
  `name_rating` varchar(200) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsectors`
--

CREATE TABLE `tblsectors` (
  `id_Sectors` varchar(50) NOT NULL,
  `name_Sectors` varchar(200) NOT NULL,
  `id_Object` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsize`
--

CREATE TABLE `tblsize` (
  `id_size` varchar(50) NOT NULL,
  `name_size` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblstaff`
--

CREATE TABLE `tblstaff` (
  `id_staff` varchar(50) NOT NULL,
  `name_staff` varchar(200) NOT NULL,
  `phone_staff` varchar(20) NOT NULL,
  `email_staff` varchar(200) NOT NULL,
  `address_staff` varchar(200) NOT NULL,
  `password_staff` varchar(200) NOT NULL,
  `postion_staff` varchar(200) NOT NULL,
  `basicsalary_staff` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id_supplier` varchar(50) NOT NULL,
  `name_supplier` varchar(200) NOT NULL,
  `address_supplier` varchar(2000) NOT NULL,
  `phone_supplier` varchar(200) NOT NULL,
  `email_supplier` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbill`
--
ALTER TABLE `tblbill`
  ADD PRIMARY KEY (`id_bill`);

--
-- Indexes for table `tblbillinfo`
--
ALTER TABLE `tblbillinfo`
  ADD PRIMARY KEY (`id_billinfo`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id_Category`),
  ADD KEY `id_Sectors` (`id_Sectors`);

--
-- Indexes for table `tblcolor`
--
ALTER TABLE `tblcolor`
  ADD PRIMARY KEY (`id_color`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `tblimportproduct`
--
ALTER TABLE `tblimportproduct`
  ADD PRIMARY KEY (`id_importproduct`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `tblimportproductinfo`
--
ALTER TABLE `tblimportproductinfo`
  ADD PRIMARY KEY (`id_importproductinfo`),
  ADD KEY `id_orderinfo` (`id_orderinfo`),
  ADD KEY `id_importproduct` (`id_importproduct`);

--
-- Indexes for table `tblnew`
--
ALTER TABLE `tblnew`
  ADD PRIMARY KEY (`id_new`),
  ADD KEY `id_photo` (`id_photo`);

--
-- Indexes for table `tblobject`
--
ALTER TABLE `tblobject`
  ADD PRIMARY KEY (`id_Object`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `tblorderinfo`
--
ALTER TABLE `tblorderinfo`
  ADD PRIMARY KEY (`id_orderinfo`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `tblphoto`
--
ALTER TABLE `tblphoto`
  ADD PRIMARY KEY (`id_photo`);

--
-- Indexes for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_Category` (`id_Category`),
  ADD KEY `id_promotion` (`id_promotion`),
  ADD KEY `id_color` (`id_color`),
  ADD KEY `id_photo` (`id_photo`),
  ADD KEY `id_size` (`id_size`);

--
-- Indexes for table `tblpromotion`
--
ALTER TABLE `tblpromotion`
  ADD PRIMARY KEY (`id_promotion`);

--
-- Indexes for table `tblrating`
--
ALTER TABLE `tblrating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `tblsectors`
--
ALTER TABLE `tblsectors`
  ADD PRIMARY KEY (`id_Sectors`),
  ADD KEY `id_Object` (`id_Object`);

--
-- Indexes for table `tblsize`
--
ALTER TABLE `tblsize`
  ADD PRIMARY KEY (`id_size`);

--
-- Indexes for table `tblstaff`
--
ALTER TABLE `tblstaff`
  ADD PRIMARY KEY (`id_staff`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD CONSTRAINT `tblcategory_ibfk_1` FOREIGN KEY (`id_Sectors`) REFERENCES `tblsectors` (`id_Sectors`);

--
-- Constraints for table `tblimportproduct`
--
ALTER TABLE `tblimportproduct`
  ADD CONSTRAINT `tblimportproduct_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tblorder` (`id_order`);

--
-- Constraints for table `tblimportproductinfo`
--
ALTER TABLE `tblimportproductinfo`
  ADD CONSTRAINT `tblimportproductinfo_ibfk_1` FOREIGN KEY (`id_orderinfo`) REFERENCES `tblorderinfo` (`id_orderinfo`),
  ADD CONSTRAINT `tblimportproductinfo_ibfk_2` FOREIGN KEY (`id_importproduct`) REFERENCES `tblimportproduct` (`id_importproduct`);

--
-- Constraints for table `tblnew`
--
ALTER TABLE `tblnew`
  ADD CONSTRAINT `tblnew_ibfk_1` FOREIGN KEY (`id_photo`) REFERENCES `tblphoto` (`id_photo`),
  ADD CONSTRAINT `tblnew_ibfk_2` FOREIGN KEY (`id_photo`) REFERENCES `tblstaff` (`id_staff`);

--
-- Constraints for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD CONSTRAINT `tblorder_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `tblsupplier` (`id_supplier`);

--
-- Constraints for table `tblorderinfo`
--
ALTER TABLE `tblorderinfo`
  ADD CONSTRAINT `tblorderinfo_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tblorder` (`id_order`),
  ADD CONSTRAINT `tblorderinfo_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tblproduct` (`id_product`);

--
-- Constraints for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD CONSTRAINT `tblproduct_ibfk_1` FOREIGN KEY (`id_Category`) REFERENCES `tblcategory` (`id_Category`),
  ADD CONSTRAINT `tblproduct_ibfk_2` FOREIGN KEY (`id_promotion`) REFERENCES `tblpromotion` (`id_promotion`),
  ADD CONSTRAINT `tblproduct_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `tblcolor` (`id_color`),
  ADD CONSTRAINT `tblproduct_ibfk_4` FOREIGN KEY (`id_photo`) REFERENCES `tblphoto` (`id_photo`),
  ADD CONSTRAINT `tblproduct_ibfk_5` FOREIGN KEY (`id_size`) REFERENCES `tblsize` (`id_size`);

--
-- Constraints for table `tblrating`
--
ALTER TABLE `tblrating`
  ADD CONSTRAINT `tblrating_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tblcustomer` (`id_customer`),
  ADD CONSTRAINT `tblrating_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tblproduct` (`id_product`);

--
-- Constraints for table `tblsectors`
--
ALTER TABLE `tblsectors`
  ADD CONSTRAINT `tblsectors_ibfk_1` FOREIGN KEY (`id_Object`) REFERENCES `tblobject` (`id_Object`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
