/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_res`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pizza', 'image.jpg', 150000, 'desc', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Hamburger', 'image.jpg', 60000, 'desc', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Tôm hùm', 'image.jpg', 500000, 'desc', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Cua hấp', 'image.jpg', 350000, 'desc', 2),
(5, 'Cơm chay', 'image.jpg', 40000, 'desc', 3),
(6, 'Gỏi cuốn chay', 'image.jpg', 35000, 'desc', 3),
(7, 'Bánh flan', 'image.jpg', 20000, 'desc', 4),
(8, 'Chè thập cẩm', 'image.jpg', 30000, 'desc', 4),
(9, 'Cà phê sữa đá', 'image.jpg', 25000, 'desc', 5),
(10, 'Trà đào', 'image.jpg', 30000, 'desc', 5),
(11, 'Bánh tráng nướng', 'image.jpg', 20000, 'desc', 6),
(12, 'Phá lấu', 'image.jpg', 35000, 'desc', 6),
(13, 'Thịt nướng xiên', 'image.jpg', 15000, 'desc', 7),
(14, 'Sườn nướng BBQ', 'image.jpg', 250000, 'desc', 7),
(15, 'Salad Nga', 'image.jpg', 70000, 'desc', 8),
(16, 'Gỏi gà xé phay', 'image.jpg', 80000, 'desc', 8),
(17, 'Súp cua', 'image.jpg', 60000, 'desc', 9),
(18, 'Súp bò viên', 'image.jpg', 50000, 'desc', 9),
(19, 'Khoai tây chiên', 'image.jpg', 30000, 'desc', 10),
(20, 'Bánh tráng trộn', 'image.jpg', 25000, 'desc', 10);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Đồ ăn nhanh');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Hải sản');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Đồ chay');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Tráng miệng'),
(5, 'Đồ uống'),
(6, 'Đồ ăn đường phố'),
(7, 'Đồ nướng'),
(8, 'Salad'),
(9, 'Súp'),
(10, 'Ăn vặt');

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 1, 1, '2024-12-04 09:59:19');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 2, 1, '2024-12-04 09:59:19');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 3, 1, '2024-12-04 09:59:19');
INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(5, 4, 1, '2024-12-04 09:59:19'),
(6, 5, 1, '2024-12-04 09:59:19'),
(7, 6, 1, '2024-12-04 09:59:19'),
(8, 7, 1, '2024-12-04 09:59:19'),
(9, 8, 1, '2024-12-04 09:59:19'),
(10, 9, 1, '2024-12-04 09:59:19'),
(11, 1, 1, '2024-12-04 09:59:19'),
(12, 2, 1, '2024-12-04 09:59:19'),
(13, 3, 1, '2024-12-04 09:59:19'),
(14, 4, 1, '2024-12-04 09:59:19'),
(15, 5, 1, '2024-12-04 09:59:19'),
(16, 6, 1, '2024-12-04 09:59:19'),
(17, 7, 1, '2024-12-04 09:59:19'),
(18, 8, 1, '2024-12-04 09:59:19'),
(19, 9, 1, '2024-12-04 09:59:19'),
(20, 1, 1, '2024-12-04 09:59:19'),
(21, 2, 1, '2024-12-04 09:59:19'),
(22, 1, 1, '2024-12-04 10:10:35'),
(50, 1, 5, '2024-12-04 10:16:54'),
(51, 2, 5, '2024-12-04 10:17:01'),
(52, 10, 3, '2024-12-04 10:21:17');

INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORD12345', '1,2');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 3, 1, 'ORD12346', '3');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 5, 4, 'ORD12347', '5');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 2, 3, 'ORD12348', '2,4'),
(5, 5, 7, 1, 'ORD12349', '6'),
(6, 6, 4, 2, 'ORD12350', '1,3,6'),
(7, 7, 8, 1, 'ORD12351', NULL),
(8, 8, 9, 2, 'ORD12352', '5,6'),
(9, 9, 6, 1, 'ORD12353', '2'),
(10, 1, 10, 3, 'ORD12354', '4,5'),
(11, 2, 1, 2, 'ORD12354', '4,5'),
(12, 2, 4, 2, 'ORD12354', '5,6');

INSERT INTO `rate_res` (`rate_res`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2024-12-04 10:01:10');
INSERT INTO `rate_res` (`rate_res`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 1, 4, '2024-12-04 10:01:10');
INSERT INTO `rate_res` (`rate_res`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 1, 3, '2024-12-04 10:01:10');
INSERT INTO `rate_res` (`rate_res`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 1, 5, '2024-12-04 10:01:10'),
(5, 5, 1, 2, '2024-12-04 10:01:10'),
(6, 6, 1, 4, '2024-12-04 10:01:10'),
(7, 7, 1, 5, '2024-12-04 10:01:10'),
(8, 8, 1, 3, '2024-12-04 10:01:10'),
(9, 9, 1, 4, '2024-12-04 10:01:10'),
(10, 1, 1, 5, '2024-12-04 10:01:10');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Kirin', 'image.jpg', 'description');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'JASHIN', 'image.jpg', 'description');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'BEE', 'image.jpg', 'description');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(5, 'PU', 'image.jpg', 'description');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Phô mai thêm', 20000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Xúc xích thêm', 15000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Khoai tây chiên thêm', 25000, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Sốt đặc biệt', 10000, 2),
(5, 'Rau xào', 30000, 3),
(6, 'Nước chấm đặc biệt', 10000, 4),
(7, 'Chả giò chay', 20000, 5),
(8, 'Đậu hũ chiên giòn', 15000, 6),
(9, 'Bánh mì thêm', 5000, 7),
(10, 'Rau sống', 10000, 9);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Ly van A', 'a@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Ly van B', 'b@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Ly van C', 'c@gmail.com', '1234');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Ly van D', 'd@gmail.com', '1234'),
(5, 'Ly van E', 'e@gmail.com', '1234'),
(6, 'Ly van F', 'f@gmail.com', '1234'),
(7, 'Ly van G', 'g@gmail.com', '1234'),
(8, 'Ly van H', 'h@gmail.com', '1234'),
(9, 'Ly van I', 'i@gmail.com', '1234'),
(10, 'Ly van J', 'j@gmail.com', '1234'),
(11, 'Ly van K', 'k@gmail.com', '1234'),
(12, 'Ly van L', 'l@gmail.com', '1234'),
(13, 'Ly van M', 'm@gmail.com', '1234'),
(14, 'Ly van N', 'n@gmail.com', '1234');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;