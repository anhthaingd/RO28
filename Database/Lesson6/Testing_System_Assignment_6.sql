USE Testing_System_Assignment_2;

-- Question 1

DROP PROCEDURE IF EXISTS get_account_of_department;

DELIMITER $$
CREATE PROCEDURE get_account_of_department (IN DepartmentName VARCHAR(50))
BEGIN
	SELECT 
    A.Fullname
FROM
    `account` A
        JOIN
    `department` D ON A.DepartmentID = D.DepartmentID
WHERE
    D.DepartmentName = DepartmentName;
END $$
DELIMITER ;

Call get_account_of_department('Sale');

-- Question 2

DROP FUNCTION IF EXISTS number_account_in_group;
DELIMITER $$
CREATE FUNCTION number_account_in_group (MaGroup TINYINT UNSIGNED) RETURNS TINYINT 
DETERMINISTIC
BEGIN
	DECLARE Nv TINYINT ;
	SELECT 
    COUNT(GroupID)
INTO Nv FROM
    `groupaccount`
WHERE
    GroupID = MaGroup
GROUP BY (MaGroup);
    RETURN Nv;
END $$
DELIMITER ;
SELECT NUMBER_ACCOUNT_IN_GROUP(1);

-- Question 3

DROP PROCEDURE IF EXISTS number_question;

DELIMITER $$
CREATE PROCEDURE number_question ()
BEGIN
	SELECT 
    T.TypeID,T.TypeName, COUNT(Q.TypeID) AS Number_question
FROM
    `Question` Q
        JOIN
    `typequestion` T ON T.TypeID = Q.TypeID
WHERE
    MONTH(Q.CreateDate) = MONTH(NOW())
        AND YEAR(Q.CreateDate) = YEAR(NOW())
GROUP BY Q.TypeID;
END $$;

DELIMITER ;
CALL number_question();

-- Question 4

DROP PROCEDURE IF EXISTS max_typequestion;

DELIMITER $$
CREATE PROCEDURE max_typequestion(OUT ID TINYINT)
BEGIN
	SELECT 
    TypeID INTO ID
FROM
    `question`
GROUP BY TypeID
HAVING COUNT(TypeID) >= ALL (SELECT 
        COUNT(TypeID)
    FROM
        `question`
    GROUP BY TypeID
    HAVING COUNT(TypeID));
END $$;
DELIMITER ;
SET @ID=0;
CALL max_typequestion(@ID);

-- Question 5

SELECT 
    TypeName
FROM
    `TypeQuestion`
WHERE
    TypeID = @ID;
    
-- Question 6

DROP PROCEDURE IF EXISTS q6;
DELIMITER $$
CREATE PROCEDURE q6 (IN stringName VARCHAR(20)) 
BEGIN 
SELECT 
    G.GroupName
FROM
    `group` G
WHERE
    G.GroupName LIKE CONCAT('%', stringName, '%') 
UNION SELECT 
    A.Fullname
FROM
    `account` A
WHERE
    A.Username LIKE CONCAT('%', stringName, '%');
END $$;
DELIMITER ;

CALL q6('sername1');

-- Question 7

DROP PROCEDURE IF EXISTS q7;
DELIMITER $$
CREATE PROCEDURE q7 (IN fullName VARCHAR(100),IN email VARCHAR(100))
BEGIN
DECLARE Username VARCHAR(100) DEFAULT substring_index(email,'@',1);
DECLARE DepartmentID TINYINT UNSIGNED DEFAULT 11;
DECLARE PositionID TINYINT UNSIGNED DEFAULT 1;
INSERT INTO `account` (Email,Username,Fullname,DepartmentID,PositionID) 
VALUES 
(email,Username,fullName,DepartmentID,PositionID);
END $$;
DELIMITER ;

SET @str1 = 'Rambo Khoa';
SET @str2 = 'rambokhoa@gmail.com';
CALL q7(@str1,@str2);

-- Question 8
-- C1
DROP PROCEDURE IF EXISTS q8;
DELIMITER $$
CREATE PROCEDURE q8 (IN name_typequestion VARCHAR(100))
BEGIN
	
  SELECT 
    Q.Content
FROM
    `question` Q
        JOIN
    `typequestion` T ON Q.TypeID = T.TypeID
WHERE
    T.TypeName = name_typequestion
        AND LENGTH(Q.Content) >= ALL (SELECT 
            LENGTH(Q.Content)
        FROM
            `question` Q
                JOIN
            `typequestion` T ON Q.TypeID = T.TypeID
        WHERE
            T.TypeName = name_typequestion);
END $$;
DELIMITER ;

SET @str = 'Multiple-Choice';
CALL q8(@str);

-- C2

DROP PROCEDURE IF EXISTS q8;
DELIMITER $$
CREATE PROCEDURE q8 (IN name_typequestion VARCHAR(100))
BEGIN
	WITH cte_q8 AS (SELECT length(Q.Content) AS leng FROM `question` Q 
    JOIN `typequestion` T ON Q.TypeID = T.TypeID WHERE T.TypeName = name_typequestion)
  SELECT 
    Q.Content
FROM
    `question` Q
        
WHERE
        LENGTH(Q.Content) = (SELECT MAX(leng) FROM `cte_q8`); 
END $$;
DELIMITER ;

SET @str = 'Multiple-Choice';
CALL q8(@str);

-- Question 9

DROP PROCEDURE IF EXISTS q9 ;

DELIMITER $$
CREATE PROCEDURE q9 (IN in_ExamID TINYINT UNSIGNED)
BEGIN
	DELETE FROM `exam` WHERE ExamID = in_ExamID;		
    DELETE FROM `examquestion` WHERE ExamID = in_ExamID;
END $$;
DELIMITER ;

CALL q9(7);

-- Question 10

DROP PROCEDURE IF EXISTS q10;
DELIMITER $$
CREATE PROCEDURE q10 ()
BEGIN
DECLARE v_ExamID TINYINT UNSIGNED;
DECLARE v_CountExam TINYINT UNSIGNED DEFAULT 0;
DECLARE v_CountExamquestion TINYINT UNSIGNED DEFAULT 0;
DECLARE v_print_Del_info_Exam VARCHAR(50) ;
DECLARE i TINYINT DEFAULT 1;
DROP TABLE IF EXISTS `Exam_3yearsbefore`;
CREATE TABLE `Exam_3yearsbefore` (
    ID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ExamID TINYINT UNSIGNED
);
INSERT INTO `Exam_3yearsbefore` (ExamID) 
SELECT E.ExamID FROM `exam` E WHERE YEAR(now())-year(E.CreateDate) > 2;
SELECT 
    COUNT(ID)
INTO v_CountExam FROM
    `Exam_3yearsbefore`;
SELECT 
    COUNT(1)
INTO v_CountExamquestion FROM
    `examquestion` EQ
        JOIN
    `Exam_3yearsbefore` E ON EQ.ExamID = E.ExamID;
WHILE (i <= v_CountExam) DO 
	SELECT ExamID INTO v_ExamID FROM `Exam_3yearsbefore` WHERE ID = i;
    CALL q9(v_ExamID);
    SET i = i+1;
END WHILE; 
SELECT 
    CONCAT('DELETE ',
            v_CountExam,
            ' IN Exam AND ',
            v_CountExamquestion,
            ' IN
            ExamQuestion')
INTO v_print_Del_info_Exam;
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = v_print_Del_info_Exam ;
DROP TABLE IF EXISTS ExamIDBefore3Year_Temp;
END $$;
DELIMITER ;

call q10();

-- Question 11

DROP PROCEDURE IF EXISTS q11;
DELIMITER $$
CREATE PROCEDURE q11 (IN var_Name VARCHAR(100))
BEGIN 
	DECLARE in_DpID TINYINT UNSIGNED;
SELECT 
    DepartmentID
INTO in_DpID FROM
    `department`
WHERE
    DepartmentName = var_Name;
UPDATE `account` 
SET 
    DepartmentID = 11
WHERE
    DepartmentID = in_DpID;
DELETE FROM `department` 
WHERE
    DepartmentName = var_name;
END $$;
DELIMITER ;

call q11('Sale');

-- Question 12

DROP PROCEDURE IF EXISTS q12;
DELIMITER $$
CREATE PROCEDURE q12()
BEGIN 
WITH CTE_12Months AS (
SELECT 1 AS MONTH
UNION SELECT 2 AS MONTH
UNION SELECT 3 AS MONTH
UNION SELECT 4 AS MONTH
UNION SELECT 5 AS MONTH
UNION SELECT 6 AS MONTH
UNION SELECT 7 AS MONTH
UNION SELECT 8 AS MONTH
UNION SELECT 9 AS MONTH
UNION SELECT 10 AS MONTH
UNION SELECT 11 AS MONTH
UNION SELECT 12 AS MONTH
)
SELECT 
    M.MONTH, COUNT(MONTH(Q.CreateDate))
FROM
    `CTE_12Months` M
        LEFT JOIN
    (SELECT 
        *
    FROM
        `question` Q1
    WHERE
        YEAR(Q1.CreateDate) = YEAR(NOW())) Q ON M.MONTH = MONTH(Q.CreateDate)
GROUP BY M.MONTH;
END $$;
DELIMITER ;

CALL q12();

-- Question 13

DROP PROCEDURE IF EXISTS q13;
DELIMITER $$
CREATE PROCEDURE q13 ()
BEGIN 
WITH cte_q13 AS (
SELECT MONTH(date_sub(NOW(),INTERVAL 5 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 5 MONTH)) AS `YEAR`
UNION
SELECT MONTH(date_sub(NOW(),INTERVAL 4 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 4 MONTH)) AS `YEAR`
UNION
SELECT MONTH(date_sub(NOW(),INTERVAL 3 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 3 MONTH)) AS `YEAR`
UNION
SELECT MONTH(date_sub(NOW(),INTERVAL 2 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 2 MONTH)) AS `YEAR`
UNION
SELECT MONTH(date_sub(NOW(),INTERVAL 1 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 1 MONTH)) AS `YEAR`
UNION
SELECT MONTH(date_sub(NOW(),INTERVAL 0 MONTH)) AS `MONTH`, YEAR(date_sub(NOW(),INTERVAL 0 MONTH)) AS `YEAR`
)

SELECT 
    C.`MONTH`,
    C.`YEAR`,
    CASE
        WHEN COUNT(QuestionID) = 0 THEN 'No Question'
        ELSE COUNT(QuestionID)
    END AS SL
FROM
    `cte_q13` C
        LEFT JOIN
    (SELECT 
        *
    FROM
        `question`
    WHERE
        CreateDate >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
            AND CreateDate <= NOW()) AS Sub_Question ON C.MONTH = MONTH(CreateDate)
GROUP BY C.MONTH
ORDER BY C.MONTH ASC;
END $$;
DELIMITER ;

CALL q13();