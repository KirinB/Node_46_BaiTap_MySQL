CREATE DATABASE db_baitap_app_food
CREATE TABLE `user` (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
)
INSERT INTO `user`(full_name,email,password) VALUES
("Ly van A","a@gmail.com","1234"),
("Ly van B","b@gmail.com","1234"),
("Ly van C","c@gmail.com","1234"),
("Ly van D","d@gmail.com","1234"),
("Ly van E","e@gmail.com","1234"),
("Ly van F","f@gmail.com","1234"),
("Ly van G","g@gmail.com","1234"),
("Ly van H","h@gmail.com","1234"),
("Ly van I","i@gmail.com","1234"),
("Ly van J","j@gmail.com","1234"),
("Ly van K","k@gmail.com","1234"),
("Ly van L","l@gmail.com","1234"),
("Ly van M","m@gmail.com","1234"),
("Ly van N","n@gmail.com","1234")


CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)
INSERT INTO food_type (type_name) VALUES
('Đồ ăn nhanh'),
('Hải sản'),
('Đồ chay'),
('Tráng miệng'),
('Đồ uống'),
('Đồ ăn đường phố'),
('Đồ nướng'),
('Salad'),
('Súp'),
('Ăn vặt')

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
)
INSERT INTO food (food_name,image,price,description,type_id) VALUES
('Pizza',"image.jpg", 150000 , "desc",1),
('Hamburger',"image.jpg", 60000 , "desc",1),
('Tôm hùm',"image.jpg", 500000,"desc",2),
('Cua hấp',"image.jpg", 350000,"desc", 2),
('Cơm chay',"image.jpg", 40000,"desc", 3),
('Gỏi cuốn chay',"image.jpg", 35000,"desc", 3),
('Bánh flan',"image.jpg", 20000,"desc", 4),
('Chè thập cẩm',"image.jpg", 30000,"desc", 4),
('Cà phê sữa đá',"image.jpg", 25000,"desc", 5),
('Trà đào',"image.jpg", 30000,"desc", 5),
('Bánh tráng nướng',"image.jpg", 20000,"desc", 6),
('Phá lấu',"image.jpg", 35000,"desc", 6),
('Thịt nướng xiên',"image.jpg", 15000,"desc", 7),
('Sườn nướng BBQ',"image.jpg", 250000,"desc", 7),
('Salad Nga',"image.jpg", 70000,"desc", 8),
('Gỏi gà xé phay',"image.jpg", 80000,"desc", 8),
('Súp cua',"image.jpg", 60000,"desc", 9),
('Súp bò viên',"image.jpg", 50000,"desc", 9),
('Khoai tây chiên',"image.jpg", 30000,"desc", 10),
('Bánh tráng trộn',"image.jpg", 25000,"desc", 10)


CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id)
)
INSERT INTO sub_food(sub_name,sub_price,food_id) VALUES
('Phô mai thêm', 20000, 1),
('Xúc xích thêm', 15000, 1),
('Khoai tây chiên thêm', 25000, 2),
('Sốt đặc biệt', 10000, 2),
('Rau xào', 30000, 3),
('Nước chấm đặc biệt', 10000, 4),
('Chả giò chay', 20000, 5),
('Đậu hũ chiên giòn', 15000, 6),
('Bánh mì thêm', 5000, 7),
('Rau sống', 10000, 9)

CREATE TABLE `order` (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	FOREIGN KEY(food_id) REFERENCES food(food_id)
)
INSERT INTO `order`(user_id,food_id,amount,code,arr_sub_id) VALUES (1, 1, 2, 'ORD12345', '1,2'),
(2, 3, 1, 'ORD12346', '3'),
(3, 5, 4, 'ORD12347', '5'),
(4, 2, 3, 'ORD12348', '2,4'),
(5, 7, 1, 'ORD12349', '6'),
(6, 4, 2, 'ORD12350', '1,3,6'),
(7, 8, 1, 'ORD12351', NULL),
(8, 9, 2, 'ORD12352', '5,6'),
(9, 6, 1, 'ORD12353', '2'),
(1, 10, 3, 'ORD12354', '4,5')

CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
)
INSERT INTO restaurant(res_name,image,description) VALUES
("Kirin","image.jpg","description"),
("JASHIN","image.jpg","description"),
("BEE","image.jpg","description"),
("PU","image.jpg","description")



CREATE TABLE like_res (
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	date_like TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id)FOREIGN KEY(user_id) REFERENCES user(user_id),
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id)
)
INSERT INTO like_res(user_id,res_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(1, 1),
(2, 1),
(1, 1)

CREATE TABLE rate_res (
	rate_res INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	amount INT,
	date_rate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id)
)
INSERT INTO rate_res(user_id,res_id,amount) VALUES
(1, 1, 5),
(2, 1, 4),
(3, 1, 3),
(4, 1, 5),
(5, 1, 2),
(6, 1, 4),
(7, 1, 5),
(8, 1, 3),
(9, 1, 4),
(1, 1, 5)

-- Tìm 5 người đã like nhà hàng nhiều nhất

SELECT 
Count(like_res.user_id) AS "Số lần người dùng like",user.user_id,user.full_name,user.email,user.`password`
FROM like_res
JOIN user ON like_res.user_id = user.user_id
GROUP BY user.user_id
ORDER BY Count(like_res.user_id) DESC
LIMIT 5

-- Tìm 2 nhà hàng có lượt like nhiều nhất

SELECT COUNT(like_res.res_id) AS "Số lần nhà hàng được like",
restaurant.res_id,restaurant.res_name,restaurant.image,restaurant.description
FROM like_res
JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP BY restaurant.res_id
ORDER BY COUNT(like_res.res_id) DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất
SELECT COUNT(order.user_id) AS "Số đơn order",user.user_id,user.full_name,user.email,user.`password`
FROM `order`
JOIN user ON order.user_id = user.user_id
GROUP BY user.user_id
ORDER BY COUNT(order.user_id) DESC
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)

SELECT user.user_id,user.full_name,user.email,user.`password`
FROM `user`
LEFT JOIN `order` ON user.user_id = order.user_id
LEFT JOIN like_res ON user.user_id = like_res.user_id
LEFT JOIN rate_res ON user.user_id = rate_res.user_id
WHERE order.user_id IS NULL AND like_res.user_id IS NULL AND rate_res.user_id IS NULL
