DROP DATABASE IF EXISTS Sell_Car;
CREATE DATABASE Sell_Car;
USE Sell_Car;

-- Tao bang

CREATE TABLE `Customer` (
	CustomerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE KEY,
    Address VARCHAR(255) NOT NULL,
    Note VARCHAR(1000)
);

CREATE TABLE `Car` (
	CarID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Maker ENUM('HONDA','TOYOTA','NISSAN') NOT NULL,
	`Year` DATETIME DEFAULT NOW(),
    Color VARCHAR(50),
    Note VARCHAR(100)
);

CREATE TABLE `Order` (
	OrderID INT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT UNSIGNED NOT NULL,
    CarID INT UNSIGNED NOT NULL,
    Amount INT DEFAULT 1,
    SalePrice INT,
    FOREIGN KEY (CustomerID) REFERENCES `Customer`(CustomerID),
    FOREIGN KEY (CarID) REFERENCES `Car`(CarID)
);

-- insert Customer

insert into Customer (Name, Phone, Email, Address, Note) values ('Giffie Spillett', '4124417023', 'gspillett0@bravesites.com', '22858 Barnett Court', 'Home');
insert into Customer (Name, Phone, Email, Address, Note) values ('Debi Baulcombe', '6294767416', 'dbaulcombe1@aboutads.info', '1 Green Ridge Plaza', 'Industrial');
insert into Customer (Name, Phone, Email, Address, Note) values ('Vere Sanford', '1838873284', 'vsanford2@patch.com', '13653 Lien Avenue', 'Health');
insert into Customer (Name, Phone, Email, Address, Note) values ('Valene Atkins', '3199157098', 'vatkins3@salon.com', '15 Messerschmidt Drive', 'Kids');
insert into Customer (Name, Phone, Email, Address, Note) values ('Yancy Winckles', '2326915343', 'ywinckles4@economist.com', '45 Roxbury Terrace', 'Jewelry');
insert into Customer (Name, Phone, Email, Address, Note) values ('D''arcy Alfwy', '2312293816', 'dalfwy5@qq.com', '41 Golf Course Point', 'Health');
insert into Customer (Name, Phone, Email, Address, Note) values ('Stefan Upton', '5488453361', 'supton6@reuters.com', '25 Armistice Park', 'Jewelry');
insert into Customer (Name, Phone, Email, Address, Note) values ('Mohammed Leimster', '2138831886', 'mleimster7@wisc.edu', '29 Debra Road', 'Jewelry');
insert into Customer (Name, Phone, Email, Address, Note) values ('Marchelle Winter', '1463344244', 'mwinter8@unblog.fr', '1 Roth Way', 'Computers');
insert into Customer (Name, Phone, Email, Address, Note) values ('Aharon Huggens', '2346492226', 'ahuggens9@over-blog.com', '55 Melby Center', 'Garden');

-- insert Car

insert into Car (Maker, Year, Color, Note) values ('TOYOTA', '2022-08-29', 'Fuscia', 'Music');
insert into Car (Maker, Year, Color, Note) values ('TOYOTA', '2021-07-02', 'Aquamarine', 'Kids');
insert into Car (Maker, Year, Color, Note) values ('NISSAN', '2022-08-02', 'Purple', 'Beauty');
insert into Car (Maker, Year, Color, Note) values ('TOYOTA', '2020-02-09', 'Yellow', 'Industrial');
insert into Car (Maker, Year, Color, Note) values ('NISSAN', '2020-08-19', 'Puce', 'Games');
insert into Car (Maker, Year, Color, Note) values ('NISSAN', '2021-01-14', 'Goldenrod', 'Grocery');
insert into Car (Maker, Year, Color, Note) values ('TOYOTA', '2022-05-09', 'Khaki', 'Shoes');
insert into Car (Maker, Year, Color, Note) values ('TOYOTA', '2021-08-23', 'Blue', 'Electronics');
insert into Car (Maker, Year, Color, Note) values ('HONDA', '2021-04-17', 'Red', 'Grocery');
insert into Car (Maker, Year, Color, Note) values ('HONDA', '2021-11-16', 'Turquoise', 'Baby');

-- insert Order

insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (2, 3, 4, 11838);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (10, 8, 2, 19068);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (7, 1, 3, 15552);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (5, 10, 3, 10239);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (8, 2, 4, 11618);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (1, 10, 4, 11450);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (8, 3, 2, 10974);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (1, 3, 2, 14732);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (6, 6, 3, 17146);
insert into `Order` (CustomerID, CarID, Amount, SalePrice) values (8, 1, 5, 17056);

-- Question 1:
-- Question 2: Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua 

SELECT 
    C.`Name`, coalesce(SUM(O.Amount), 0) AS SL
FROM
    `Customer` C
        LEFT JOIN
    `Order` O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID
ORDER BY SUM(O.Amount);

-- Question 3: 	Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.