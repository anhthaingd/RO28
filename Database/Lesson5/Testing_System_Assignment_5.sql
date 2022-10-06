USE Testing_System_Assignment_2;

-- Question1

CREATE OR REPLACE VIEW v_q1 AS
    SELECT 
        A.*, D.DepartmentName
    FROM
        `account` A
            JOIN
        `department` D ON A.DepartmentID = D.DepartmentID
    WHERE
        D.DepartmentName = 'Sale';

SELECT 
    *
FROM
    v_q1;
    
-- Question 2

CREATE OR REPLACE VIEW `v_q2` AS
    SELECT 
        A.*, COUNT(GA.AccountID) AS Number_Group_Join
    FROM
        `account` A
            JOIN
        `groupaccount` GA ON A.AccountID = GA.AccountID
    GROUP BY GA.AccountID
    HAVING COUNT(GA.AccountID) >= ALL (SELECT 
            COUNT(AccountID)
        FROM
            `groupaccount`
        GROUP BY AccountID);

SELECT 
    *
FROM
    `v_q2`;
    
-- Question 3

CREATE OR REPLACE VIEW `v_q3` AS
    (SELECT 
        *
    FROM
        `question`
    WHERE
        LENGTH(Content) >= 300);
        
DELETE FROM `v_q3`;

-- Question 4

CREATE OR REPLACE VIEW `v_q4` AS
    SELECT 
        D.*, COUNT(A.DepartmentID) AS nv
    FROM
        `account` A
            JOIN
        `department` D ON A.DepartmentID = D.DepartmentID
    GROUP BY A.DepartmentID
    HAVING COUNT(A.DepartmentID) >= ALL (SELECT 
            COUNT(DepartmentID)
        FROM
            `account`
        GROUP BY DepartmentID);
        
SELECT 
    *
FROM
    `v_q4`;
    
-- Question 5

CREATE OR REPLACE VIEW `v_q5` AS
    SELECT 
        Q.*, A.Fullname
    FROM
        `question` Q
            JOIN
        `account` A ON Q.CreatorID = A.AccountID
    WHERE
        A.Fullname LIKE 'Nguyễn%';
        
SELECT 
    *
FROM
    `v_q5`
ORDER BY QuestionID;