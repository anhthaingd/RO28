-- Create database
DROP DATABASE IF EXISTS Extra_Assignment_1_2_VN;
CREATE database Extra_Assignment_1_2_VN;
use Extra_Assignment_1_2_VN;

-- Exercise 1: Design a table
-- Question 1
CREATE TABLE Trainee (
    TraineeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_name VARCHAR(30),
    Birth_Date DATE,
    Gender ENUM('male', 'female', 'unknown') NOT NULL,
    ET_IQ TINYINT,
    ET_Gmath TINYINT,
    ET_English TINYINT,
    Training_Class VARCHAR(20),
    Evaluation_Notes TEXT,
    CHECK (ET_IQ >= 0 AND ET_IQ <= 20),
    CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
    CHECK (ET_English >= 0 AND ET_English <= 50)
);

-- Question 2
ALTER TABLE `Trainee` ADD VTI_Account VARCHAR(30) NOT NULL UNIQUE;

-- Exercise 2
CREATE TABLE `Table2` (
    ID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100),
    `Code` VARCHAR(5),
    ModifiedDate TIMESTAMP
);

-- Exercise 3
CREATE TABLE `Table3` (
    ID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100),
    BirthDate DATE,
    Gender ENUM('0', '1', 'NULL'),
    isDeletedFlag BOOLEAN
);
