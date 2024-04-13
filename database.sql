-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `footcapproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(2, 'Running Sneaker Shoes', 'Men / Women', '178', 'images/product-1.jpg'),
(3, 'Air Jordan 7 Retro', 'Men / Sports', '315', 'images/product-4.jpg'),
(4, 'Simple Fabric Shoe', 'Men / Women', '249', 'images/product-3.jpg'),
(5, 'Nike Basketball Shoes', 'Men / Sports\r\n', '160', 'images/product-7.jpg'),
(6, 'Nike Air MAX 207 SE', 'Men / Women', '412', 'images/product-5.jpg'),
(8, ' Simple Fabric Shoe', 'Men / Women ', '120.0', 'images/product-8.jpg'),
(10, ' Adidas Sneakers Shoes', 'Men / Women', '249.0', 'images/product-6.jpg'),
(32, 'nike', 'men', '126.0', 'images/collection-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usertables`
--

CREATE TABLE `usertables` (
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ConPassword` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 0,
  `token_creation_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token_activation_time` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usertables`
--

INSERT INTO `usertables` (`uid`, `username`, `email`, `phone`, `address`, `password`, `ConPassword`, `token`, `active`, `token_creation_time`, `token_activation_time`, `ip_address`) VALUES
(1, 'admin', 'admin@admin.com', '0689712209', 'taroudant', 'admin', '1234', '4af98bd2-c6da-4b8e-854a-59bc1c480f38', 1, '2024-04-13 15:58:59', NULL, ''),
(2, 'abdelkrim rekbi', 'ajiitfhem@gmail.com', '0689712209', 'taroudant', '1234', '1234', '33813acb-269d-4a7b-95cd-51e16a4cfa22', 1, '2024-03-29 01:44:44', NULL, ''),
(3, 'abdelkrim rekbi', 'ajiitfhem@gmail.com', '0689712209', 'taroudant', 'jc123456', 'jc123456', 'f982aef4-b4c3-413d-b1b7-9d7ef69c1457', 1, '2024-03-29 01:43:06', '2024-03-29 01:43:06', '0:0:0:0:0:0:0:1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertables`
--
ALTER TABLE `usertables`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `usertables`
--
ALTER TABLE `usertables`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
