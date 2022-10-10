DROP DATABASE Extra_Assigment_4;
CREATE DATABASE Extra_Assigment_4;
USE Extra_Assigment_4;

-- Question 1

CREATE TABLE `Department` (
	Department_Number INT UNSIGNED PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);

CREATE TABLE `Employee_Table` (
	Employee_Number INT UNSIGNED PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Department_Number INT UNSIGNED,
    FOREIGN KEY (Department_Number) REFERENCES `department`(Department_Number)
);

CREATE TABLE `Employee_Skill_Table` (
	Employee_Number INT UNSIGNED,
    Skill_Code VARCHAR(50),
    Date_Registered DATETIME DEFAULT NOW(),
    FOREIGN KEY (Employee_Number) REFERENCES `Employee_Table`(Employee_Number)
);

-- Question 2

INSERT INTO `department` VALUES 
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
    
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (1, 'Eda Gonet', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (2, 'Griswold Fritz', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (3, 'Thomasina Sparrowe', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (4, 'Eran Noraway', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (5, 'Dorthy Rein', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (6, 'Annamaria Chominski', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (7, 'Obadiah Moscon', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (8, 'Tally Rosso', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (9, 'Dyna Allardyce', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (10, 'Winnifred Mougin', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (11, 'Adah Lievesley', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (12, 'Cherianne Thulborn', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (13, 'Carlo Lissemore', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (14, 'Chariot Skipworth', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (15, 'Engracia Crossdale', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (16, 'Jacquette Stonhouse', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (17, 'Ulrick Loddon', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (18, 'Amos Begwell', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (19, 'Ailey Bissell', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (20, 'Auguste Dobbing', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (21, 'Dacy Antushev', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (22, 'Saul Derycot', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (23, 'Burk Djokovic', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (24, 'Raine Camilli', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (25, 'Farra Domican', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (26, 'Roman Wrathall', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (27, 'Sandro Minto', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (28, 'Zandra Trenbey', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (29, 'Rose Trainer', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (30, 'Free Rudolfer', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (31, 'Cilka Ridgwell', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (32, 'Alane Fraser', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (33, 'Viva Gwilym', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (34, 'Loy Meredyth', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (35, 'Robinett Fielder', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (36, 'Roshelle Gimbart', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (37, 'Sheba Scaysbrook', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (38, 'Felipa Prandin', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (39, 'Helenka Palfree', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (40, 'Peggie Guiot', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (41, 'Davina Phillot', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (42, 'Cliff Medwell', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (43, 'Wally Whicher', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (44, 'Trudi Pawels', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (45, 'Percy Catterell', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (46, 'Dorothy Salan', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (47, 'Clevie Morando', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (48, 'Chuck Stellman', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (49, 'Ailyn Reignould', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (50, 'Cathi Ebi', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (51, 'Melina Happs', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (52, 'Dotty Thibodeaux', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (53, 'Raimondo Summerly', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (54, 'Paolo Benoit', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (55, 'Winifield Krier', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (56, 'Agathe Yushkin', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (57, 'Darlleen Petrushanko', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (58, 'Hayward Crosham', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (59, 'Barnett Lotze', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (60, 'Oralla Goodwin', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (61, 'Florenza Ferdinand', 5);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (62, 'Candida Hallard', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (63, 'Percy Pawsey', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (64, 'Philipa Loines', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (65, 'Tedd Garahan', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (66, 'Claybourne Henriksson', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (67, 'Kathie Wheelhouse', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (68, 'Starlene Vanyutin', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (69, 'Georg Cunnane', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (70, 'Garrick Pfaffel', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (71, 'Gaile Richardson', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (72, 'Rainer Whitnall', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (73, 'Gilemette Yoselevitch', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (74, 'Constantine Worland', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (75, 'Marv Cessford', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (76, 'Norean Berndt', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (77, 'Hurleigh Sowersby', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (78, 'Pooh Spivey', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (79, 'Tricia Bernocchi', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (80, 'Josefa Keeling', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (81, 'Rebecca Torritti', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (82, 'Maribelle Rushforth', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (83, 'Leroy Large', 6);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (84, 'Dore Marriot', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (85, 'Elise Copperwaite', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (86, 'Pyotr Ekkel', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (87, 'Devan Harrison', 3);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (88, 'Hermine Linkleter', 4);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (89, 'Vito Larner', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (90, 'Madelaine Pobjay', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (91, 'Cara Rosenvasser', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (92, 'Mace Radwell', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (93, 'Sofie Battison', 7);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (94, 'Doralin Djakovic', 2);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (95, 'Tuesday Mendoza', 9);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (96, 'Elvera Priddie', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (97, 'Nomi Lakeman', 10);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (98, 'Hirsch Tasseler', 8);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (99, 'Jessey Sabbatier', 1);
insert into employee_table (Employee_Number, Employee_Name, Department_Number) values (100, 'Vick Prichet', 5);

INSERT INTO `employee_skill_table` VALUES 
	(1,'Java','2021-12-01'),
    (1,'Python','2020-12-01'),
    (2,'Java','2019-12-01'),
    (3,'C++','2018-12-01'),
    (3,'Ruby','2017-12-01'),
    (4,'React','2021-12-01'),
    (4,'Java','2021-12-01'),
    (4,'Python','2021-12-01'),
    (4,'C','2021-12-01'),
    (5,'Laravel','2016-12-01'),
    (6,'Nextjs','2011-12-01'),
    (10,'Laravel','2013-12-01'),
    (11,'Java','2021-12-01'),
    (12,'Java','2021-12-01'),
    (12,'C#','2021-12-01'),
	(13,'.NET','2021-12-01');

-- Question 3

SELECT 
    E.Employee_Name
FROM
    `employee_table` E
        JOIN
    `employee_skill_table` ES ON E.Employee_Number = ES.Employee_Number
WHERE
    ES.Skill_Code = 'Java';
    
-- Question 4

SELECT 
    D.Department_Name, COUNT(E.Department_Number) AS NV
FROM
    `department` D
        JOIN
    `employee_table` E ON D.Department_Number = E.Department_Number
GROUP BY E.Department_Number
HAVING COUNT(E.Department_Number) > 10;

-- Question 5

SELECT 
    D.Department_Name, COUNT(E.Department_Number) AS NV
FROM
    `department` D
        JOIN
    `employee_table` E ON D.Department_Number = E.Department_Number
GROUP BY E.Department_Number;

-- Question 6

SELECT 
    E.Employee_Name, COUNT(ES.Employee_Number) AS Number_Skill
FROM
    `employee_table` E
        JOIN
    `employee_skill_table` ES ON E.Employee_Number = ES.Employee_Number
GROUP BY ES.Employee_Number
HAVING COUNT(ES.Employee_Number) > 1; 