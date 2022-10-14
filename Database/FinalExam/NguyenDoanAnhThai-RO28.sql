DROP DATABASE IF EXISTS Final_Exam;
CREATE DATABASE Final_Exam;
USE Final_Exam;

-- Question 1:
-- Tao bang

CREATE TABLE `GiangVien` (
	magv INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(255) NOT NULL,
    luong INT NOT NULL
);

CREATE TABLE `SinhVien` (
	masv INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(255) NOT NULL,
    namsinh DATETIME NOT NULL,
    quequan VARCHAR(255) NOT NULL
);

CREATE TABLE `DeTai` (
	madt INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tendt VARCHAR(255) UNIQUE KEY NOT NULL,
    kinhphi INT NOT NULL,
    NoiThucTap VARCHAR(255) NOT NULL
);

CREATE TABLE `HuongDan` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    masv INT UNSIGNED NOT NULL,
    madt INT UNSIGNED NOT NULL,
    magv INT UNSIGNED NOT NULL,
    ketqua TINYINT UNSIGNED NOT NULL
);

-- Insert du lieu

INSERT INTO `GiangVien` (hoten,luong) VALUES 
		('Pham Bich Phuong',50000),
        ('Nguyen Phuong Lien','40000'),
        ('Nguyen Thi Thuy','45000');
        
INSERT INTO `SinhVien` (hoten,namsinh,quequan) VALUES 
		('Nguyen Doan Anh Thai','2002-07-01','Nghe An'),
        ('Nghiem Dinh Minh','2002-04-28','Ha Noi'),
        ('Mai Van Tuong','2000-03-03','Ha Noi'),
        ('Pham Tuan Anh','2002-07-09','Ha Noi');
        
INSERT INTO `DeTai` (tendt,kinhphi,NoiThucTap) VALUES
		('De Tai 1',200000,'HUST'),
        ('CONG NGHE SINH HOC','300000','HUCE'),
        ('De Tai 3','34433','NEU');
        
INSERT INTO `HuongDan` (masv,madt,magv,ketqua) VALUES 
		(1,1,2,8),
        (2,2,3,9),
        (1,3,1,7),
        (3,2,3,10);
        
-- Question 2: 
-- a)

SELECT 
    Sv.*
FROM
    `SinhVien` Sv
WHERE
    Sv.masv NOT IN (SELECT 
            masv
        FROM
            `HuongDan`
        GROUP BY masv);

-- b) 

SELECT 
    count(HD.masv) AS so_sinh_vien
FROM
    `SinhVien` Sv
        JOIN
    `HuongDan` HD ON Sv.masv = HD.masv
        JOIN
    `DeTai` DT ON DT.madt = HD.madt
WHERE
    DT.tendt = 'CONG NGHE SINH HOC';

-- Question 3

CREATE OR REPLACE VIEW SinhVienInfo AS
    SELECT 
        Sv.masv,
        Sv.hoten,
        CASE
            WHEN
                Sv.masv NOT IN (SELECT 
                        masv
                    FROM
                        `HuongDan`
                    GROUP BY masv)
            THEN
                'Chua co'
            ELSE DT.tendt
        END AS Detai
    FROM
        `SinhVien` Sv
            LEFT JOIN
        `HuongDan` HD ON Sv.masv = HD.masv
            LEFT JOIN
        `DeTai` DT ON DT.madt = HD.madt
    ORDER BY SV.masv;
    
SELECT 
    *
FROM
    SinhVienInfo;
    
-- Question 4: 

DROP TRIGGER IF EXISTS trigger_q4;
DELIMITER $$
	CREATE TRIGGER trigger_q4 
	BEFORE INSERT ON `SinhVien`
	FOR EACH ROW
	BEGIN
    DECLARE NS INT;
    SET NS = YEAR(NEW.namsinh);
	IF (NS <= 1900) THEN
		SIGNAL SQLSTATE '12334'
        SET MESSAGE_TEXT = 'Nam sinh phai > 1900';
	END IF;
	END $$
DELIMITER ;

INSERT INTO `SinhVien` (hoten,namsinh,quequan) VALUES 
		('Nguyen Van A','1900-07-01','Nghe An');
        
-- Question 5: 

DROP TRIGGER IF EXISTS trigger_q5;
DELIMITER $$
	CREATE TRIGGER trigger_q5 
	AFTER DELETE ON `SinhVien`
	FOR EACH ROW 
    BEGIN
    DECLARE SinhVienID INT UNSIGNED;
    SET SinhVienID = OLD.`masv`;
    DELETE FROM `HuongDan` Hd WHERE Hd.masv = SinhVienID;
    END $$
DELIMITER ;

DELETE FROM `SinhVien` 
WHERE
    masv = 1;

SELECT 
    *
FROM
    `HuongDan`;