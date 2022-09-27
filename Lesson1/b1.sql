-- Xoa database
DROP DATABASE IF EXISTS Testing_System_Assignment_1;

-- Tao database
CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1;
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

CREATE TABLE `Account` (
    AccountID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE KEY,
    Username VARCHAR(50),
    Fullname VARCHAR(50),
    DepartmentID TINYINT UNSIGNED,
    PositionID TINYINT UNSIGNED,
    CreateDate DATE
);

CREATE TABLE `Group` (
    GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(20),
    CreatorID TINYINT,
    CreateDate DATE
);

CREATE TABLE `GroupAccount` (
    GroupID TINYINT PRIMARY KEY,
    AccountID TINYINT,
    JoinDate DATE
);

CREATE TABLE `TypeQuestion` (
    TypeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay','Multiple-Choice') NOT NULL 
);

CREATE TABLE `CategoryQuestion` (
    CategoryID TINYINT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20)
);

CREATE TABLE `Question` (
    QuestionID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT,
    CategoryID TINYINT,
    TypeID TINYINT,
    CreatorID TINYINT,
    CreateDate DATE
);
CREATE TABLE `Answer` (
    AnswerID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT,
    QuestionID TINYINT,
    isCorrect BOOLEAN
);

CREATE TABLE `Exam` (
    ExamID TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(10),
    Title VARCHAR(50),
    CategoryID TINYINT,
    Duration TIME,
    CreatorID TINYINT,
    CreateDate DATE
);

CREATE TABLE `ExamQuestion` (
    ExamID TINYINT PRIMARY KEY,
    QuestionID TINYINT
);
-- Xoa bang neu ton tai

Drop TABLE if EXISTS department;

-- Them khoa phu
ALTER TABLE `account` ADD FOREIGN KEY (PositionID) REFERENCES `position`(PositionID);
ALTER TABLE `account` ADD FOREIGN KEY (DepartmentID) REFERENCES `department`(DepartmentID);

