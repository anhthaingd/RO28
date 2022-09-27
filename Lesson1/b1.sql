-- Tao database
CREATE DATABASE Testing_System_Assignment_1;
use Testing_System_Assignment_1;
-- Tao bang
CREATE TABLE `Department` (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(20) NOT NULL UNIQUE KEY
);
CREATE TABLE `Position` (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionName VARCHAR(20)
);
CREATE TABLE `Account` (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE KEY,
    Username VARCHAR(50),
    Fullname VARCHAR(50),
    DepartmentID INT,
    PositionID INT,
    CreateDate DATE
);
CREATE TABLE `Group` (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(20),
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE `GroupAccount` (
    GroupID INT PRIMARY KEY,
    AccountID INT,
    JoinDate DATE
);
CREATE TABLE `TypeQuestion` (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(20)
);
CREATE TABLE `CategoryQuestion` (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20)
);
CREATE TABLE `Question` (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT,
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE `Answer` (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT,
    QuestionID INT,
    isCorrect BOOLEAN
);
CREATE TABLE `Exam` (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(10),
    Title VARCHAR(50),
    CategoryID INT,
    Duration TIME,
    CreatorID INT,
    CreateDate DATE
);
CREATE TABLE `ExamQuestion` (
    ExamID INT PRIMARY KEY,
    QuestionID INT
);

-- Question1
-- Question2
