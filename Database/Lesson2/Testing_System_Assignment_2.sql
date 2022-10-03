DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- Tao bang
CREATE TABLE `Department` (
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(20) NOT NULL UNIQUE KEY
);

CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);
-- ENUM dùng để chọn với số ít các dữ liệu
DROP TABLE IF EXISTS account;
CREATE TABLE `Account` (
    AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    Username VARCHAR(50) NOT NULL UNIQUE KEY,
    Fullname VARCHAR(50) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreateDate DATETIME DEFAULT NOW()
);

CREATE TABLE `Group` (
    GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(20) NOT NULL UNIQUE KEY,
    CreatorID TINYINT NOT NULL,
    CreateDate DATETIME DEFAULT NOW()
);

CREATE TABLE `GroupAccount` (
    GroupID TINYINT NOT NULL,
    AccountID TINYINT NOT NULL,
    JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE `TypeQuestion` (
    TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

CREATE TABLE `CategoryQuestion` (
    CategoryID TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20) NOT NULL UNIQUE KEY
);

CREATE TABLE `Question` (
    QuestionID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    CategoryID TINYINT NOT NULL,
    TypeID TINYINT NOT NULL,
    CreatorID TINYINT NOT NULL,
    CreateDate DATETIME DEFAULT NOW()
);
CREATE TABLE `Answer` (
    AnswerID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionID TINYINT NOT NULL,
    isCorrect BOOLEAN 
);

CREATE TABLE `Exam` (
    ExamID TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(10) NOT NULL,
    Title VARCHAR(50) NOT NULL,
    CategoryID TINYINT NOT NULL,
    Duration TIME NOT NULL,
    CreatorID TINYINT NOT NULL,
    CreateDate DATETIME DEFAULT NOW()
);

CREATE TABLE `ExamQuestion` (
    ExamID TINYINT NOT NULL,
    QuestionID TINYINT NOT NULL
);

-- Them khoa phu
ALTER TABLE `account` ADD FOREIGN KEY (PositionID) REFERENCES `position`(PositionID);
ALTER TABLE `account` ADD FOREIGN KEY (DepartmentID) REFERENCES `department`(DepartmentID);
ALTER TABLE `groupaccount` ADD FOREIGN KEY (AccountID) REFERENCES `account`(AccountID);
ALTER TABLE `Question` ADD FOREIGN KEY (CategoryID) REFERENCES `categoryquestion`(CategoryID);
ALTER TABLE `Question` ADD FOREIGN KEY (TypeID) REFERENCES `typequestion`(TypeID);
ALTER TABLE `Answer` ADD FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID);
ALTER TABLE `Exam` ADD FOREIGN KEY (CategoryID) REFERENCES `categoryquestion` (CategoryID);
ALTER TABLE `ExamQuestion` ADD FOREIGN KEY(ExamID) REFERENCES `Exam`(ExamID);
ALTER TABLE `ExamQuestion` ADD FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID);

-- Them du lieu vao bang
INSERT INTO `Department` VALUES 
	(1,'Marketing'),
    (2,'Sale'),
	(3,'Team Leader'),
    (4,'Secretary'),
    (5,'Director'),
    (6,'Deputy'),
    (7,'Trainee'),
    (8,'Supervios'),
    (9,'Officer'),
    (10,'Expert');
    
INSERT INTO `Position` (PositionName) VALUES
	('Dev'), 
    ('Test'),
    ('Scrum Master'),
    ('PM');
    
INSERT INTO `Account` VALUES 
	(1,'user1@gmail.com','username1','fullname1','1','3','2022-09-01'),
    (2,'user2@gmail.com','username2','fullname2','1','2','2022-08-10'),
    (3,'user3@gmail.com','username3','fullname3','2','1','2022-07-10'),
    (4,'user4@gmail.com','username4','fullname4','4','4','2022-08-10'),
    (5,'user5@gmail.com','username5','fullname5','3','3','2022-08-10'),
    (6,'user6@gmail.com','username6','fullname6','5','2','2022-08-10'),
    (7,'user7@gmail.com','username7','fullname7','6','1','2022-08-10'),
    (8,'user8@gmail.com','username8','fullname8','7','4','2022-08-10'),
    (9,'user9@gmail.com','username9','fullname9','6','1','2022-08-10'),
    (10,'user10@gmail.com','username10','fullname10','8','3','2022-08-10'),
    (11,'user11@gmail.com','username11','fullname11','9','1','2022-08-10'),
    (12,'user12@gmail.com','username12','fullname12','10','2','2022-08-10'),
    (13,'user13@gmail.com','username13','fullname13','7','1','2022-08-10');
    
INSERT INTO `Group` VALUES 
	(1,'GroupName1',1,'2022-09-01'),
    (2,'GroupName2',2,'2022-09-01'),
    (3,'GroupName3',4,'2022-09-01'),
    (4,'GroupName4',2,'2022-09-01'),
    (5,'GroupName5',3,'2022-09-01'),
    (6,'GroupName6',2,'2022-09-01'),
    (7,'GroupName7',7,'2022-09-01'),
    (8,'GroupName8',6,'2022-09-01'),
    (9,'GroupName9',4,'2022-09-01'),
    (10,'GroupName10',3,'2022-09-01');

INSERT INTO `GroupAccount` VALUES
	(1,'1','2022-09-03'),
    (1,'2','2022-09-03'),
    (1,'5','2022-09-03'),
    (2,'4','2022-09-03'),
    (2,'3','2022-09-03'),
    (3,'6','2022-09-03'),
    (4,'7','2022-09-03'),
    (5,'8','2022-09-03'),
    (6,'3','2022-09-03'),
    (7,'10','2022-09-03'),
    (8,'11','2022-09-03'),
    (9,'12','2022-09-03'),
    (10,'13','2022-09-03');
    
INSERT INTO `TypeQuestion` VALUES 
	(1,'Essay'),
    (2,'Multiple-Choice');
    
INSERT INTO `categoryquestion` VALUES
	(1,'Java'),
    (2,'.NET'),
    (3,'SQL'),
    (4,'Postman'),
    (5,'Ruby'),
    (6,'React'),
    (7,'Laravel'),
    (8,'Golang'),
    (9,'Vue'),
    (10,'PHP');
   
INSERT INTO `Question` VALUES 
	(1,'content1',1,1,2,'2022-10-01'),
    (2,'content2',2,2,1,'2022-10-01'),
    (3,'content3',1,2,3,'2022-10-01'),
    (4,'content4',3,1,4,'2022-10-01'),
    (5,'content5',5,1,5,'2022-10-01'),
    (6,'content6',6,2,6,'2022-10-01'),
    (7,'content7',4,2,7,'2022-10-01'),
    (8,'content8',7,1,1,'2022-10-01'),
    (9,'content9',8,1,10,'2022-10-01'),
    (10,'content10',5,1,12,'2022-10-01');
    
INSERT INTO `Answer` VALUES 
	(1,'content1',1,True),
    (2,'content2',2,True),
    (3,'content3',3,True),
    (4,'content4',4,True),
    (5,'content5',5,FALSE),
    (6,'content6',6,True),
    (7,'content7',7,True),
    (8,'content8',8,FALSE),
    (9,'content9',9,True),
    (10,'content10',10,True);
    
INSERT INTO `Exam` VALUES
	(1,'code1','title1',1,'01:00:00',1,'2022-11-01'),
    (2,'code2','title2',2,'01:00:00',5,'2022-11-01'),
    (3,'code3','title3',3,'01:00:00',3,'2022-11-01'),
    (4,'code4','title4',1,'01:00:00',2,'2022-11-01'),
    (5,'code5','title5',2,'01:00:00',1,'2022-11-01'),
    (6,'code6','title6',5,'01:00:00',5,'2022-11-01'),
    (7,'code7','title7',6,'01:00:00',6,'2022-11-01'),
    (8,'code8','title8',8,'01:00:00',7,'2022-11-01'),
    (9,'code9','title9',9,'01:00:00',9,'2022-11-01'),
    (10,'code10','title10',4,'01:00:00',4,'2022-11-01');
    
INSERT INTO `ExamQuestion` VALUES
	(1,2),
    (1,5),
    (1,6),
    (2,3),
    (2,4),
    (2,6),
    (3,1),
    (3,4),
    (3,8),
    (4,2),
    (5,5),
    (6,9),
    (7,10),
    (7,7);
    


