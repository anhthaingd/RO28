USE Extra_Assignment_1_2_VN;

-- Lay thuc tap sinh co ten dai nhat

SELECT 
    *, YEAR(CURRENT_TIME()) - YEAR(Birth_Date) AS Age
FROM
    trainee
WHERE
    LENGTH(Full_name) >= ALL (SELECT 
            LENGTH(Full_name)
        FROM
            trainee); 
            
-- ET-passed trainees

SELECT 
    Full_name,
    ET_IQ,
    ET_Gmath,
    ET_English,
    ET_IQ + ET_Gmath + ET_English AS Total
FROM
    trainee
WHERE
    ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8
        AND ET_Gmath >= 8
        AND ET_English >= 18
ORDER BY Total DESC;

-- Delete information of trainee who has TraineeID =3 

DELETE FROM Trainee 
WHERE
    TraineeID = 3;
    
-- TraineID = 5 move class 2

UPDATE trainee 
SET 
    Training_Class = 2
WHERE
    TraineeID = 5;