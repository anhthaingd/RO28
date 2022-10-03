USE Testing_System_Assignment_2;
    
-- Question 1
-- Question 2

SELECT 
    *
FROM
    department
ORDER BY DepartmentID;

-- Question 3

SELECT 
    DepartmentID
FROM
    department
WHERE
    DepartmentName = 'Sale';
    
    
-- Question 4
    
SELECT 
    *
FROM
    `account`
WHERE
    LENGTH(Fullname) >= ALL (SELECT 
            LENGTH(Fullname)
        FROM
            `account`);
-- Question 5

SELECT 
    *
FROM
    `account`
WHERE
    DepartmentID = 3
        AND LENGTH(Fullname) >= ALL (SELECT 
            LENGTH(Fullname)
        FROM
            `account`
        WHERE
            DepartmentID = 3);

-- Question 6

SELECT GroupName FROM `group` WHERE CreateDate <='2020-12-20';

-- Question 7

SELECT 
    (QuestionID)
FROM
    `answer`
GROUP BY QuestionID
HAVING COUNT(QuestionID) >= 4
;

-- Question 8

SELECT 
    `Code`
FROM
    `exam`
WHERE
    Duration >= 60
        AND CreateDate <= '2019-12-20';

-- Question 9

SELECT 
    *
FROM
    `group`
WHERE
    CreateDate <= NOW()
ORDER BY CreateDate DESC
LIMIT 5;

-- Question 10

SELECT 
    COUNT(DepartmentID) AS number_of_staff
FROM
    `account`
WHERE
    DepartmentID = 2;
    
-- Question 11

INSERT INTO `Account` VALUES 
	(17,'user17@gmail.com','username17','Doctor Buffalo','1','3','2022-09-01');
    
SELECT 
    *
FROM
    `account`
WHERE
    Fullname LIKE 'D%o';
    
-- Question 12

DELETE FROM `Exam` 
WHERE
    CreateDate <= '2019-12-20';

-- Question 13

DELETE FROM `question` 
WHERE
    Content LIKE 'Câu hỏi%';

-- Question 14

UPDATE `account` 
SET 
    Fullname = 'Nguyễn Bá Lộc',
    Email = 'loc.nguyenba@vti.com.vn'
WHERE
    AccountID = 5
;
    
-- Question 15

UPDATE `account` 
SET 
    DepartmentID = 4
WHERE
    AccountID = 5;