-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2026 at 09:23 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Figure Anime'),
(2, 'Gundam (Gunpla)'),
(3, 'Merchandise');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `items` json DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` varchar(50) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `customerName`, `phone`, `address`, `items`, `total`, `status`, `createdAt`, `created_at`, `customer_name`, `user_id`) VALUES
(10, NULL, NULL, '0901234567', '123 Đường ABC, Quận 1, TP.HCM', '[{\"id\": 29, \"hot\": null, \"name\": \"Figure Son Goku Ultra Instinct\", \"sold\": 734, \"image\": \"Figure Son Goku Ultra Instinct.jpg\", \"price\": 750000, \"stock\": 13, \"rating\": 4.8, \"quantity\": 1, \"variants\": [], \"categoryId\": 1, \"description\": \"Dòng Blood of Saiyans chất lượng cao.\"}]', 750000, 'completed', NULL, '1/4/2026', 'admin', 1),
(11, NULL, NULL, '0901234567', '123 Đường ABC, Quận 1, TP.HCM', '[{\"id\": 30, \"hot\": null, \"name\": \"HG Moon Gundam\", \"sold\": 573, \"image\": \"HG Moon Gundam.jpg\", \"price\": 700000, \"stock\": 7, \"rating\": 4.9, \"quantity\": 1, \"variants\": [], \"categoryId\": 2, \"description\": \"Mẫu HG có độ chi tiết ngang ngửa RG.\"}]', 700000, 'cancelled', NULL, '1/4/2026', 'admin', 1),
(12, NULL, NULL, '0901234567', '123 Đường ABC, Quận 1, TP.HCM', '[{\"id\": \"4-Titanium Finish\", \"hot\": null, \"name\": \"MG Gundam Barbatos (Titanium Finish)\", \"sold\": 774, \"image\": \"MG Gundam Barbatos.jpg\", \"price\": 1890000, \"stock\": 3, \"rating\": 5, \"discount\": 10, \"quantity\": 1, \"variants\": [{\"id\": 3, \"name\": \"No Coating\", \"stock\": 5, \"extraPrice\": 0}, {\"id\": 4, \"name\": \"Titanium Finish\", \"stock\": 3, \"extraPrice\": 900000}], \"categoryId\": 2, \"description\": \"Master Grade với khung xương linh hoạt.\"}]', 1890000, 'cancelled', NULL, '2/4/2026', 'admin', 1),
(13, NULL, NULL, '1', 'aa', '[{\"id\": 31, \"hot\": null, \"name\": \"Figure Bronya Silver-Wing\", \"sold\": 0, \"image\": \"sg-11134201-7rbka-ln6qmdak80s733.jpg\", \"price\": 2250000, \"stock\": 5, \"rating\": 5, \"discount\": 10, \"quantity\": 1, \"variants\": [], \"categoryId\": 1, \"description\": \"\"}]', 2250000, 'cancelled', NULL, '2/4/2026', 'dinhky', NULL),
(14, NULL, NULL, '0910990990', 'a', '[{\"id\": \"4-No Coating\", \"hot\": null, \"name\": \"MG Gundam Barbatos (No Coating)\", \"sold\": 774, \"image\": \"MG Gundam Barbatos.jpg\", \"price\": 990000, \"stock\": 8, \"rating\": 5, \"discount\": 10, \"quantity\": 1, \"variants\": [{\"id\": 3, \"name\": \"No Coating\", \"stock\": 5, \"extraPrice\": 0}, {\"id\": 4, \"name\": \"Titanium Finish\", \"stock\": 3, \"extraPrice\": 900000}], \"categoryId\": 2, \"description\": \"Master Grade với khung xương linh hoạt.\"}]', 990000, 'cancelled', NULL, '2/4/2026', 'a', 6),
(15, NULL, NULL, '0901234567', '123 Đường ABC, Quận 1, TP.HCM', '[{\"id\": \"2-Standard Ver\", \"hot\": null, \"name\": \"Nendoroid Hatsune Miku (Standard Ver)\", \"sold\": 129, \"image\": \"Nendoroid Hatsune Miku.jpg\", \"price\": 1200000, \"stock\": 3, \"rating\": 4.5, \"discount\": null, \"quantity\": 1, \"variants\": [{\"id\": 1, \"name\": \"Standard Ver\", \"stock\": 3, \"extraPrice\": 0}, {\"id\": 2, \"name\": \"Anniversary Edition\", \"stock\": 2, \"extraPrice\": 350000}], \"categoryId\": 1, \"description\": \"Phiên bản 2.0 với nhiều biểu cảm khuôn mặt.\", \"activeDiscount\": 0, \"discountEndDate\": null, \"discountedPrice\": 1200000, \"discountStartDate\": null}]', 1200000, 'cancelled', NULL, '16/4/2026', 'admin', 1),
(16, NULL, NULL, '0901234567', '123 Đường ABC, Quận 1, TP.HCM', '[{\"id\": 34, \"hot\": null, \"name\": \"Gunpla repaint Anime coating Comic color effect Figure model\", \"sold\": 0, \"image\": \"gunpla-repaint-anime-coating-comic-color-effect-figure-model-880761.jpg\", \"price\": 2340000, \"stock\": 15, \"rating\": null, \"discount\": 10, \"quantity\": 1, \"variants\": [], \"categoryId\": 2, \"description\": \"Mô hình Gundam 2D màu sắc theo phong cách truyện tranh này được sơn lại dựa trên mô hình gốc. Sản phẩm được tùy chỉnh, mỗi sản phẩm đều độc đáo.\", \"activeDiscount\": 0, \"discountEndDate\": \"2026-04-16T10:33\", \"discountedPrice\": 2600000, \"discountStartDate\": \"2026-04-16T10:27\"}]', 2340000, 'completed', NULL, '17/4/2026', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `stock` int DEFAULT '0',
  `rating` float DEFAULT '0',
  `isHot` tinyint(1) DEFAULT '0',
  `sold` int DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `is_hot` bit(1) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `discount_end_date` datetime(6) DEFAULT NULL,
  `discount_start_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categoryId`, `name`, `price`, `image`, `description`, `stock`, `rating`, `isHot`, `sold`, `category_id`, `is_hot`, `discount`, `discount_end_date`, `discount_start_date`) VALUES
(1, 2, 'HG Gundam Aerial Rebuild', 450000, 'HG Gundam Aerial Rebuild.jpg', 'Mô hình chính hãng Bandai từ series Witch from Mercury.', 15, 5, 1, 669, 2, NULL, NULL, NULL, NULL),
(2, 1, 'Nendoroid Hatsune Miku', 1200000, 'Nendoroid Hatsune Miku.jpg', 'Phiên bản 2.0 với nhiều biểu cảm khuôn mặt.', 5, 4.5, 1, 129, 1, NULL, NULL, NULL, NULL),
(3, 3, 'Móc khóa One Piece - Luffy', 85000, 'Móc khóa One Piece - Luffy.jpg', 'Chất liệu mica cao cấp, bền màu.', 0, 4, 0, 40, 3, NULL, NULL, NULL, NULL),
(4, 2, 'MG Gundam Barbatos', 1100000, 'MG Gundam Barbatos.jpg', 'Master Grade với khung xương linh hoạt.', 8, 5, 1, 774, 2, NULL, 10, NULL, NULL),
(5, 1, 'Pop Up Parade Power', 950000, 'Pop Up Parade Power.jpg', 'Nhân vật Power trong Chainsaw Man.', 12, 4.8, 1, 296, 1, NULL, NULL, NULL, NULL),
(6, 2, 'RG Hi-Nu Gundam', 1350000, 'RG Hi-Nu Gundam.jpg', 'Chi tiết siêu nhỏ gọn, độ tách màu cực tốt.', 3, 5, 1, 265, 2, NULL, NULL, NULL, NULL),
(7, 3, 'Poster Spy x Family', 150000, 'Poster Spy x Family.jpg', 'Poster khổ A2 trang trí phòng cực đẹp.', 50, 4.2, 0, 243, 3, NULL, NULL, NULL, NULL),
(8, 1, 'Scale Rem 1/7 Crystal Dress', 8500000, 'Scale Rem 1.7 Crystal Dress.jpg', 'Figure cao cấp dành cho người sưu tầm.', 2, 5, 1, 157, 1, NULL, NULL, NULL, NULL),
(9, 3, 'Bình nước Jujutsu Kaisen', 250000, 'Bình nước Jujutsu Kaisen.jpg', 'Dung tích 500ml, giữ nhiệt tốt.', 20, 4.5, 0, 769, 3, NULL, NULL, NULL, NULL),
(10, 2, 'Entry Grade RX-78-2', 180000, 'Entry Grade RX-78-2.jpg', 'Dễ lắp ráp, không cần kìm chuyên dụng.', 30, 4.7, 0, 119, 2, NULL, NULL, NULL, NULL),
(11, 1, 'Figma Tanjiro Kamado', 1850000, 'Figma Tanjiro Kamado.jpg', 'Figure có khớp cử động linh hoạt.', 7, 4.9, 1, 707, 1, NULL, NULL, NULL, NULL),
(12, 2, 'PG Unleashed RX-78-2', 6500000, 'PG Unleashed RX-78-2.jpg', 'Đỉnh cao của dòng Gunpla, tỷ lệ 1/60.', 1, 5, 1, 773, 2, NULL, NULL, NULL, NULL),
(13, 3, 'Áo khoác Akatsuki', 450000, 'Áo khoác Akatsuki.jpg', 'Áo khoác thêu mây đỏ tỉ mỉ.', 15, 4.6, 1, 573, 3, NULL, NULL, NULL, NULL),
(14, 1, 'Nendoroid Denji', 1300000, 'Nendoroid Denji.jpg', 'Đi kèm hiệu ứng cưa máy và Pochita.', 0, 4.8, 0, 104, 1, NULL, NULL, NULL, NULL),
(15, 2, 'MGSD Freedom Gundam', 1150000, 'MGSD Freedom Gundam.jpg', 'Dòng SD cao cấp với chi tiết như MG.', 6, 4.9, 1, 619, 2, NULL, NULL, NULL, NULL),
(16, 3, 'Bộ bài Tarot Genshin Impact', 320000, 'Bộ bài Tarot Genshin Impact.jpg', '78 lá bài in hình nhân vật Genshin.', 25, 4.3, 0, 447, 3, NULL, NULL, NULL, NULL),
(17, 1, 'Figure Zoro Asura 1/6', 4200000, 'Figure Zoro Asura 1.6.jpg', 'Mô hình Zoro trạng thái tam kiếm phái.', 4, 5, 1, 47, 1, NULL, NULL, NULL, NULL),
(18, 2, 'HG Calibarn Gundam', 520000, 'HG Calibarn Gundam.jpg', 'Mẫu gundam trắng tinh khôi cực hot.', 10, 4.8, 1, 45, 2, NULL, NULL, NULL, NULL),
(19, 3, 'Gối ôm Totoro', 280000, 'Gối ôm Totoro.jpg', 'Gối bông mềm mại, kích thước 40cm.', 18, 4.4, 0, 110, 3, NULL, NULL, NULL, NULL),
(20, 1, 'Pop Up Parade Gojo Satoru', 950000, 'Pop Up Parade Gojo Satoru.jpg', 'Thầy Gojo trong tư thế thi triển Vô Hạn.', 9, 4.9, 1, 238, 1, NULL, NULL, NULL, NULL),
(21, 2, 'SD Gundam EX-Standard Nu', 180000, 'SD Gundam EX-Standard Nu.jpg', 'Mô hình nhỏ gọn, phù hợp trang trí bàn làm việc.', 40, 4.1, 0, 253, 2, NULL, NULL, NULL, NULL),
(22, 3, 'Túi Tote Attack on Titan', 120000, 'Túi Tote Attack on Titan.jpg', 'Túi vải canvas in logo Trinh Sát Đoàn.', 35, 4.5, 0, 532, 3, NULL, NULL, NULL, NULL),
(23, 1, 'Scale Nezuko 1/8', 3500000, 'Scale Nezuko 1.8.jpg', 'Nezuko phiên bản chiến đấu cực đẹp.', 3, 4.9, 1, 631, 1, NULL, NULL, NULL, NULL),
(24, 2, 'RG Sazabi', 1250000, 'RG Sazabi.jpg', 'Mẫu RG đồ sộ nhất, độ chi tiết kinh ngạc.', 5, 5, 1, 42, 2, NULL, NULL, NULL, NULL),
(25, 3, 'Lót chuột XXL Solo Leveling', 220000, 'Lót chuột XXL Solo Leveling.jpg', 'Bề mặt speed, kích thước 900x400mm.', 12, 4.7, 1, 589, 3, NULL, NULL, NULL, NULL),
(26, 1, 'Nendoroid Anya Forger', 1450000, 'Nendoroid Anya Forger.jpg', 'Có khuôn mặt \'Heh\' kinh điển.', 0, 4.9, 0, 218, 1, NULL, NULL, NULL, NULL),
(27, 2, 'MG Eclipse Gundam', 1200000, 'MG Eclipse Gundam.jpg', 'Khả năng biến hình phi thuyền độc đáo.', 4, 4.6, 0, 748, 2, NULL, NULL, NULL, NULL),
(28, 3, 'Ví cầm tay Demon Slayer', 190000, 'Ví cầm tay Demon Slayer.jpg', 'Họa tiết Haori của các trụ cột.', 22, 4.2, 0, 680, 3, NULL, NULL, NULL, NULL),
(29, 1, 'Figure Son Goku Ultra Instinct', 750000, 'Figure Son Goku Ultra Instinct.jpg', 'Dòng Blood of Saiyans chất lượng cao.', 12, 4.8, 1, 735, 1, NULL, NULL, NULL, NULL),
(30, 2, 'HG Moon Gundam', 700000, 'HG Moon Gundam.jpg', 'Mẫu HG có độ chi tiết ngang ngửa RG.', 7, 4.9, 0, 573, 2, NULL, NULL, NULL, NULL),
(31, NULL, 'Figure Bronya Silver-Wing', 2500000, 'sg-11134201-7rbka-ln6qmdak80s733.jpg', '', 5, 5, 0, 0, 1, NULL, 10, NULL, NULL),
(32, NULL, 'Figure Kiana Evening Invite Honkai Impact 3 Scale 1/7', 4200000, 'honkai-impact-3rd-kiana-evening-invite-829437.13.webp', '', 2, 5, 0, 0, 1, NULL, 0, NULL, NULL),
(34, NULL, 'Gunpla repaint Anime coating Comic color effect Figure model', 2600000, 'gunpla-repaint-anime-coating-comic-color-effect-figure-model-880761.jpg', 'Mô hình Gundam 2D màu sắc theo phong cách truyện tranh này được sơn lại dựa trên mô hình gốc. Sản phẩm được tùy chỉnh, mỗi sản phẩm đều độc đáo.', 14, NULL, 0, 1, 2, NULL, 10, '2026-04-16 03:33:00.000000', '2026-04-16 03:27:00.000000'),
(39, NULL, '\nS.H.MonsterArts Stardust Dragon - Yu-Gi-Oh! 5Ds', 3900000, 'rts_stardust_dragon_-_yu-gi-oh__5ds_shf_monster_gia_tot_chat_luong_cao_8964395dd82a4592832f869311bcd0b7_master.jpg', 'Từ series huyền thoại Yu-Gi-Oh! 5D\'s, quái thú biểu tượng của Yusei Fudo đã chính thức gia nhập dòng S.H.MonsterArts. S.H.MonsterArts Stardust Dragon - Yu-Gi-Oh! 5Ds đang bán tại nShop là siêu phẩm mô hình động tái hiện hoàn hảo vẻ đẹp thanh thoát và quyền năng của Stardust Dragon với độ chi tiết kinh ngạc. Mô hình được làm tỉ mỉ bám sát với nguyên tác, đảm bảo mọi chi tiết từ lớp vảy đến sừng đều trung thành tuyệt đối với hình ảnh trong anime.', 18, NULL, 0, 0, 1, NULL, 0, NULL, NULL),
(40, NULL, 'Sousai Shojo Teien Ao Gennai Dreaming Style Happy Monochrome - Kotobukiya JK005', 1650000, 'huong__chinh_hang_gia_uu_dai_mua_tang_ban_be_gia_dinh_fan_nguoi_ham_mo_ff25e66a40604c3fa60bd2c100424c78_master.jpg', 'Nhân vật nữ chính của anime Frame Arms Girl, Ao Gennai, đã xuất hiện dưới dạng mô hình nữ sinh trong bộ đồng phục dịu dàng của dòng Dreaming Style! Sousai Shojo Teien Ao Gennai Dreaming Style Happy Monochrome - Mô hình chính hãng Kotobukiya JK005 đang bán tại nShop cũng là bộ mô hình dễ lắp ráp dành cho người chơi mới.', 4, NULL, 0, 0, 2, NULL, 10, '2026-04-16 06:27:00.000000', '2026-04-15 18:26:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `stock` int DEFAULT '0',
  `extra_price` double DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `label`, `stock`, `extra_price`, `product_id`) VALUES
(1, 'Standard Ver', 3, 0, 2),
(2, 'Anniversary Edition', 2, 350000, 2),
(3, 'No Coating', 5, 0, 4),
(4, 'Titanium Finish', 3, 900000, 4),
(5, 'Kèm Decal nước', 3, 60000, 6),
(6, 'Giấy lụa', 30, 0, 7),
(7, 'Tráng gương', 20, 100000, 7),
(8, 'Standard', 5, 0, 11),
(9, 'DX Edition', 2, 550000, 11),
(10, 'Size M', 10, 0, 13),
(11, 'Size L', 5, 0, 13),
(12, 'Size XL', 0, 20000, 13),
(13, '40cm', 10, 0, 19),
(14, '60cm', 8, 150000, 19),
(15, 'Kèm Raijin Pack', 1, 800000, 27),
(16, 'Bản gốc', 3, 0, 27),
(17, 'Tanjiro', 10, 0, 28),
(18, 'Zenitsu', 5, 0, 28),
(19, 'Nezuko', 7, 0, 28);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text,
  `role` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `username`, `password`, `phone`, `address`, `role`, `full_name`) VALUES
(1, 'Quản Trị Viên', 'admin', '123456', '0901234567', '123 Đường ABC, Quận 1, TP.HCM', 'admin', 'admin'),
(2, 'Nguyễn Văn A', 'customer1', '123456', '0987654321', '456 Đường XYZ, Quận 2, TP.HCM', 'customer', 'khách hàng'),
(3, 'Dinh Ky', 'dinhky', '123456', '222222222222222', '653 Đường ABC, Quận 1, TP.HCM', 'customer', 'Dinh Ky'),
(6, NULL, 'customer2', '123456', '0910990990', NULL, 'customer', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_variant_product` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_variant_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKosqitn4s405cynmhb87lkvuau` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
