USE Testing_System_Assignment_2;

-- Exercise 1
-- Question1 
SELECT 
    A.*, D.DepartmentName
FROM
    `account` A
        JOIN
    `department` D
WHERE
    A.DepartmentID = D.DepartmentID;
    
-- Question 2

SELECT 
    *
FROM
    `account`
WHERE
    CreateDate >= '2010-12-20';
    
-- Question 3

SELECT 
    A.*, P.PositionName
FROM
    `account` A
        JOIN
    `position` P
WHERE
    A.PositionID = P.PositionID
        AND P.PositionName = 'Dev';
        
-- Question 4

SELECT 
    D.DepartmentName,COUNT(D.DepartmentName) AS `Member`
FROM
    `department` D
        JOIN
    `account` A
WHERE
    A.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(D.DepartmentName) > 3;

-- Question 5
-- C1
SELECT 
    EQ.QuestionID
FROM
    `question` Q
        JOIN
    `examquestion` EQ
WHERE
    Q.QuestionID = EQ.QuestionID
GROUP BY EQ.QuestionID
HAVING COUNT(EQ.QuestionID) >= ALL (SELECT 
        COUNT(QuestionID)
    FROM
        `examquestion`
    GROUP BY QuestionID);
-- C2

with `cte_q5` as (SELECT Q.QuestionID,Q.Content,count(Q.QuestionID) as SL
 FROM `question` Q join `examquestion`  
 EQ on Q.QuestionID = EQ.QuestionID GROUP BY QuestionID ) 
SELECT * from `cte_q5` where SL >= (SELECT max(SL) FROM `cte_q5`);

-- Question 6

SELECT 
    C.CategoryName, COUNT(Q.CategoryID) AS Number_in_question
FROM
    `question` Q
        JOIN
    `categoryquestion` C
WHERE
    Q.CategoryID = C.CategoryID
GROUP BY Q.CategoryID;

-- Question 7

SELECT 
    Q.QuestionID, Q.Content, COUNT(EQ.ExamID) AS Number_Exam
FROM
    `examquestion` EQ
        JOIN
    `question` Q
        JOIN
    `exam` E
WHERE
    EQ.QuestionID = Q.QuestionID
        AND EQ.ExamID = E.ExamID
GROUP BY EQ.QuestionID
ORDER BY Q.QuestionID;

-- Question 8

with `cte_q8` as (select Q.QuestionID,Q.Content,count(A.QuestionID) as Number_Answer from `question` Q join `answer` A on Q.QuestionID=A.QuestionID 
 GROUP BY A.QuestionID)
 select * from `cte_q8` where Number_Answer >= (SELECT max(Number_Answer) from `cte_q8`);
 
 -- Question 9
 
SELECT 
    GA.groupID, G.GroupName, COUNT(GA.GroupID) AS Number_account
FROM
    `groupaccount` GA
        JOIN
    `group` G ON G.GroupID = GA.GroupID
GROUP BY GA.GroupID;

-- Question 10

WITH `cte_q10` AS ( SELECT P.PositionName,count(A.PositionID) AS Number_member 
FROM `position` P 
JOIN `account` A 
ON P.PositionID = A.PositionID 
GROUP BY A.PositionID)
SELECT * FROM `cte_q10` WHERE Number_member = (SELECT MIN(Number_member) FROM `cte_q10`);

-- Question 11 

SELECT 
    D.DepartmentName,count(A.DepartmentID) AS Number_Position
FROM
    `department` D
        JOIN
    `account` A
        JOIN
    `position` P ON A.DepartmentID = D.DepartmentID
        AND A.PositionID = P.PositionID
GROUP BY A.DepartmentID;

-- Question 12

SELECT 
    Q.QuestionID, Q.Content, A.Fullname, TP.TypeName, AW.Content
FROM
    `question` Q
        JOIN
    `account` A
        JOIN
    `answer` AW
        JOIN
    `typequestion` TP ON Q.CreatorID = A.AccountID
        AND Q.TypeID = TP.TypeID
        AND AW.QuestionID = Q.QuestionID
ORDER BY Q.QuestionID;

-- Question 13

SELECT 
    T.TypeName, COUNT(Q.TypeID) AS number_question
FROM
    `typequestion` T
        JOIN
    `question` Q ON T.TypeID = Q.TypeID
GROUP BY Q.TypeID;

-- Question 14

SELECT 
    *
FROM
    `group`
WHERE
    GroupID NOT IN (SELECT 
            GroupID
        FROM
            `groupaccount`);
            
-- Question 15

SELECT 
    *
FROM
    `question`
WHERE
    QuestionID NOT IN (SELECT 
            QuestionID
        FROM
            `answer`);

-- Exercise 2
-- Question 17
-- a)

select A.* from `account` A join `groupaccount` GA on A.AccountID = GA.AccountID where GA.GroupID = 1;

-- b)

select A.* from `account` A join `groupaccount` GA on A.AccountID = GA.AccountID where GA.GroupID = 2 order by A.AccountID;

-- c) 
SELECT 
    A.*
FROM
    `account` A
        JOIN
    `groupaccount` GA ON A.AccountID = GA.AccountID
WHERE
    GA.GroupID = 1 
UNION SELECT 
    A.*
FROM
    `account` A
        JOIN
    `groupaccount` GA ON A.AccountID = GA.AccountID
WHERE
    GA.GroupID = 2
;

-- Question 18
-- a)

SELECT 
    GroupID
FROM
    `groupaccount`
GROUP BY GroupID
HAVING COUNT(GroupID) > 5;

-- b)

SELECT 
    GroupID
FROM
    `groupaccount`
GROUP BY GroupID
HAVING COUNT(GroupID) < 7;

-- c) 
SELECT 
    GroupID
FROM
    `groupaccount`
GROUP BY GroupID
HAVING COUNT(GroupID) > 5 
UNION SELECT 
    GroupID
FROM
    `groupaccount`
GROUP BY GroupID
HAVING COUNT(GroupID) < 7;

