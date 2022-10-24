USE Testing_System_Assignment_2;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước

DROP TRIGGER IF EXISTS trigger_q1;
DELIMITER $$
CREATE TRIGGER trigger_q1 
BEFORE INSERT ON `group`
FOR EACH ROW 
BEGIN
DECLARE time_1yearago DATETIME;
SET time_1yearago = DATE_SUB(NOW(),INTERVAL 1 YEAR);
IF NEW.`CreateDate` <= time_1yearago THEN 
	SIGNAL SQLSTATE '12345'
    SET MESSAGE_TEXT = 'Khong the them du lieu';
END IF;
END $$
DELIMITER :

INSERT INTO `group` (GroupName,CreatorID,CreateDate) VALUES 
		('C1K371',1,'2022-01-01');

-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"

DROP TRIGGER IF EXISTS trigger_q2;
DELIMITER $$
CREATE TRIGGER trigger_q2 
BEFORE INSERT ON `account` 
FOR EACH ROW 
BEGIN
DECLARE in_DepartmentID TINYINT UNSIGNED;
SELECT 
    A.DepartmentID
INTO in_DepartmentID FROM
    `account` A
        JOIN
    `department` D ON A.DepartmentID = D.DepartmentID
WHERE
    D.DepartmentName = 'Sale';
IF NEW.`DepartmentID` = in_DepartmentID THEN
	SIGNAL SQLSTATE '11233'
    SET MESSAGE_TEXT = 'Cannot add more user';
END IF;
END $$
DELIMITER ;

INSERT INTO `account` (Email,Username,Fullname,DepartmentID,PositionID) VALUES
('abc@gmail.com','hello','hello world','2','3');

-- Question 3 : Cấu hình 1 group có nhiều nhất là 5 user

DROP TRIGGER IF EXISTS trigger_q3;
DELIMITER $$
CREATE TRIGGER trigger_q3
BEFORE INSERT ON `groupaccount` 
FOR EACH ROW 
BEGIN
	DECLARE in_countAccount TINYINT UNSIGNED;
SELECT 
    COUNT(GA.GroupID)
INTO in_countAccount FROM
    `groupaccount` GA
WHERE
    GA.GroupID = NEW.GroupID;
    IF (in_countAccount>5) THEN
		SIGNAL SQLSTATE '33333'
        SET MESSAGE_TEXT = 'Group Full';
    END IF;
END $$
DELIMITER ;

INSERT INTO `groupaccount` (GroupID,AccountID) VALUES
		(1,3);
        
-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question

DROP TRIGGER IF EXISTS trigger_q4;
DELIMITER $$
CREATE TRIGGER trigger_q4 
BEFORE INSERT ON `examquestion` 
FOR EACH ROW
BEGIN
	DECLARE in_countQuestion TINYINT UNSIGNED;
 SELECT 
    COUNT(E.ExamID) INTO in_countQuestion
FROM
    `examquestion` E
WHERE
    E.ExamID = NEW.ExamID;
    IF (in_countQuestion > 3) THEN
		SIGNAL SQLSTATE '23323'
        SET MESSAGE_TEXT = 'Full Question';
    END IF;
END $$
DELIMITER ;

INSERT INTO `examquestion` VALUES
			(1,3);

-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com

DROP TRIGGER IF EXISTS trigger_q5;
DELIMITER $$
CREATE TRIGGER trigger_q5 
BEFORE DELETE ON `account` 
FOR EACH ROW
BEGIN 
	IF (OLD.`Email` = 'admin@gmail.com') THEN
		SIGNAL SQLSTATE '12332'
        SET MESSAGE_TEXT = 'Cannot delete this email';
    END IF;
END $$
DELIMITER ;

DELETE FROM `account` WHERE Email = 'admin@gmail.com';

-- Question 6: 

DROP TRIGGER IF EXISTS trigger_q6;
DELIMITER $$
CREATE TRIGGER trigger_q6
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	DECLARE in_DepartmentID TINYINT UNSIGNED;
    SELECT 
    DepartmentID
INTO in_DepartmentID FROM
    `department`
WHERE
    DepartmentName = 'Waiting Department';
    IF (NEW.`DepartmentID` IS NULL) THEN
		SET NEW.`DepartmentID` = in_DepartmentID;
    END IF;
END $$
DELIMITER ;

INSERT INTO `account` (Email,Username,Fullname,PositionID) VALUES
('abc@gmail.com','hello','hello world','3');

-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question, trong đó có tối đa 2 đáp án đúng.

DROP TRIGGER IF EXISTS trigger_q7;
DELIMITER $$
CREATE TRIGGER trigger_q7 
BEFORE INSERT ON `answer`
FOR EACH ROW
BEGIN
	DECLARE in_countAnswer TINYINT UNSIGNED;
    DECLARE in_countTrueAnswer TINYINT UNSIGNED;
    SELECT 
    COUNT(A.AnswerID)
INTO in_countAnswer FROM
    `answer` A
WHERE
    A.QuestionID = NEW.QuestionID;
    
    SELECT 
    COUNT(A.AnswerID)
INTO in_countTrueAnswer FROM
    `answer` A
WHERE
    A.QuestionID = NEW.QuestionID AND A.isCorrect = NEW.isCorrect;
    IF(in_countAnswer >= 4 OR in_countTrueAnswer >= 2) THEN
		SIGNAL SQLSTATE '43424'
        SET MESSAGE_TEXT = 'Cannot add answer';
    END IF;
END $$
DELIMITER ;

INSERT INTO `answer` (Content,QuestionID,isCorrect) VALUES
		('loi giai 2','10',False);
        
-- Question 8: Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database

DROP TRIGGER IF EXISTS trigger_q8;
DELIMITER $$
CREATE TRIGGER trigger_q8
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
	IF NEW.gender = 'NAM' THEN
    SET NEW.gender = 'M';
    ELSEIF NEW.gender = 'NU' THEN 
    SET NEW.gender = 'F';
    ELSEIF NEW.gender = 'Chua xac dinh' THEN
    SET NEW.gender = 'U';
    END IF;
END $$
DELIMITER ;

-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày

DROP TRIGGER IF EXISTS trigger_q9;
DELIMITER $$
CREATE TRIGGER trigger_q9
BEFORE DELETE ON `exam`
FOR EACH ROW 
BEGIN
	DECLARE dt_time DATETIME ;
    SET dt_time = DATE_SUB(NOW(),INTERVAL 2 DAY);
    IF (OLD.`CreateDate` >= dt_time) THEN
		SIGNAL SQLSTATE '43564'
        SET MESSAGE_TEXT = 'Cannot delete this exam';
	END IF;
END $$
DELIMITER ; 

DELETE FROM `exam` where CreateDate = '2022-10-10';

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong exam nào

DROP TRIGGER IF EXISTS trigger_q10;
DELIMITER $$
CREATE TRIGGER trigger_q10
BEFORE UPDATE ON `question`
FOR EACH ROW
BEGIN 
	DECLARE in_countQuestionID TINYINT UNSIGNED;
    SELECT 
    COUNT(1)
INTO in_countQuestionID FROM
    `examquestion` E
WHERE
    E.QuestionID = NEW.QuestionID;
    IF (in_countQuestionID != 0) THEN
		SIGNAL SQLSTATE '12333'
        SET MESSAGE_TEXT = 'Cannot update';
	END IF;
END $$

DELIMITER ;

UPDATE `question` SET content = 'new update' WHERE QuestionID = 3;

-- Question 12

SELECT e.ExamID,e.`Code`,e.Title,CASE 
	WHEN e.Duration <= 30 THEN 'Short time' 
    WHEN e.Duration <= 60 THEN 'Medium time'
    ELSE 'long time' END AS Duration,e.CreateDate,e.Duration FROM `exam` e;
    
-- Question 13

SELECT 
    GA.GroupID,
    COUNT(GA.GroupID),
    CASE
        WHEN COUNT(GA.GroupID) <= 5 THEN 'few'
        WHEN COUNT(GA.GroupID) <= 20 THEN 'normal'
        ELSE 'higher'
    END AS the_number_user_amount
FROM
    `groupaccount` GA
GROUP BY GA.GroupID;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào không có user thì sẽ thay đổi giá trị 0 thành "Không có User"

SELECT 
    D.DepartmentID,
    CASE
        WHEN COUNT(A.DepartmentID) = 0 THEN 'Khong co user'
        ELSE COUNT(A.DepartmentID)
    END AS SL
FROM
    `department` D
        LEFT JOIN
    `account` A ON A.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentID;


SELECT DepartmentName,Email from `department` D ,`account` A  where D.DepartmentID = A.DepartmentID;

create view v_11 (d,y)  as select DepartmentID,Email from `account`;