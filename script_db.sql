CREATE DATABASE Wallet;
USE Wallet;
 
CREATE TABLE Currency(c_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, CurrencyName VARCHAR(50));
INSERT INTO Currency(CurrencyName) VALUES
    ('GBP'),
    ('EUR'),
    ('USD');
 
CREATE TABLE Banks(b_id  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
BankName VARCHAR(50), c_id INT);
ALTER TABLE Banks	ADD CONSTRAINT
FOREIGN KEY (c_id)				
REFERENCES Currency(c_id);	

INSERT INTO Banks(BankName, c_id) VALUES ('Mono', 1),('MTB', 3),('Pumb',2);
 
CREATE TABLE PayTypes(pt_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,PayName VARCHAR(30));
INSERT INTO PayTypes(PayName) 	VALUES('Income'),('Outcome');
   
CREATE TABLE Reasons(r_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, ReasonName VARCHAR(30));

DELIMITER //
CREATE TRIGGER ReasonName_bi
BEFORE INSERT on Reasons				 
FOR EACH ROW
BEGIN
	SET NEW.ReasonName = CONCAT(UPPER(SUBSTRING(NEW.ReasonName,1,1)),
						LOWER(SUBSTRING(NEW.ReasonName FROM 2)));
END//
DELIMITER ;

INSERT INTO Reasons VALUES 
	(1, 'Groceries'),
	(2, 'transportation'),
	(3, 'Housing'),
	(4, 'Entertainment'),
	(5, 'education'),
	(6, 'Health'),
	(7, 'utilities'),
	(8, 'ShopPing'),
	(9, 'TraVel'),
	(10, 'Other');

 
CREATE TABLE Subcategory(sh_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, subcategory VARCHAR(30), r_id INT);
ALTER TABLE Subcategory	ADD CONSTRAINT
FOREIGN KEY (r_id)				
REFERENCES Reasons(r_id);	


DELIMITER //
CREATE TRIGGER subcategory_bi
BEFORE INSERT on Subcategory				 
FOR EACH ROW
BEGIN
	SET NEW.subcategory = CONCAT(UPPER(SUBSTRING(NEW.subcategory,1,1)),
						LOWER(SUBSTRING(NEW.subcategory FROM 2)));
END//
DELIMITER ;

INSERT INTO Subcategory VALUES
	(1, 'lidl', 1),
	(2, 'MorrIson', 1),
	(3, 'Iceland', 1),
	(4, 'OthEr', 1),
	(5, 'Rent/Mortgage', 3),
	(6, 'home maintenance', 3),
	(7, 'Movies', 4),
	(8, 'Concerts', 4),
	(9, 'Tuition fees', 5),
	(10, 'Books', 5),
	(11, 'Doctor visits', 6),
	(12, 'Gas', 7),
	(13, 'Electricity', 7),
	(14, 'Water', 7),
	(15, 'Clothing', 8),
	(16, 'Electronics', 8),
	(17, 'Vacation', 9),
	(18, 'Business travel', 9),
	(19, 'Other cashback', 10),
	(20, 'Other income', 10),
    (21, 'Other outcome', 10),
    (22, 'Bus', 2);

 
CREATE TABLE Payments (p_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
PayDate DATETIME  NOT NULL, b_id INT NOT NULL, 
PaySum DECIMAL(8,2), r_id INT NOT NULL, sh_id INT NOT NULL, pt_id INT, 
CreateDate DATETIME DEFAULT current_timestamp());
ALTER TABLE Payments 	ADD CONSTRAINT
FOREIGN KEY (r_id)				
REFERENCES Reasons(r_id);	
ALTER TABLE Payments 	ADD CONSTRAINT
FOREIGN KEY (b_id)				
REFERENCES banks(b_id);	
ALTER TABLE Payments 	ADD CONSTRAINT
FOREIGN KEY (sh_id)				
REFERENCES Subcategory(sh_id);	
ALTER TABLE Payments	ADD CONSTRAINT
FOREIGN KEY (pt_id)				
REFERENCES PayTypes(pt_id);
 


CREATE VIEW VW_Payments
AS
SELECT PayDate, b_id, 
PaySum, r_id, sh_id, pt_id FROM Payments;

 
CREATE TABLE Saldo(s_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
b_id INT, Period VARCHAR(10), SaldoBegin DECIMAL(8,2), Debet DECIMAL(8,2),
Kredit DECIMAL(8,2), SaldoEnd DECIMAL(8,2));
ALTER TABLE Saldo	ADD CONSTRAINT 
FOREIGN KEY (b_id)				
REFERENCES banks(b_id);

INSERT INTO Saldo(b_id , Period, SaldoBegin, Debet, Kredit, SaldoEnd) VALUES
 (1, '2023-10-01', 0,0,0,0),
 (2, '2023-10-01', 0,0,0,0),
 (3, '2023-10-01', 0,0,0,0);
 INSERT INTO Saldo(b_id , Period, SaldoBegin, Debet, Kredit, SaldoEnd) VALUES
 (1, '2023-11-01', 0,0,0,0),
 (2, '2023-11-01', 0,0,0,0),
 (3, '2023-11-01', 0,0,0,0);
  INSERT INTO Saldo(b_id , Period, SaldoBegin, Debet, Kredit, SaldoEnd) VALUES
 (1, '2023-12-01', 0,0,0,0),
 (2, '2023-12-01', 0,0,0,0),
 (3, '2023-12-01', 0,0,0,0);
INSERT INTO Saldo(b_id , Period, SaldoBegin, Debet, Kredit, SaldoEnd) VALUES
 (1, '2024-01-01', 0,0,0,0),
 (2, '2024-01-01', 0,0,0,0),
 (3, '2024-01-01', 0,0,0,0);
 INSERT INTO Saldo(b_id , Period, SaldoBegin, Debet, Kredit, SaldoEnd) VALUES
 (1, '2024-02-01', 0,0,0,0),
 (2, '2024-02-01', 0,0,0,0),
 (3, '2024-02-01', 0,0,0,0);

 
DELIMITER $$
CREATE PROCEDURE calcSaldo(IN lastMonth datetime, bank_id tinyint )
BEGIN 
	DECLARE vDebet DECIMAL(8,2);
    DECLARE vKredit DECIMAL(8,2);
    DECLARE vSaldoEnd DECIMAL(8,2);
    DECLARE vSaldoBegin DECIMAL(8,2);
	SELECT sum(CASE WHEN pt_id=1 THEN PaySum ELSE 0 END), sum(CASE WHEN pt_id=2 THEN PaySum ELSE 0 END), sum(PaySum) INTO vDebet, vKredit,  vSaldoEnd
	FROM Payments  
	WHERE PayDate between lastMonth AND LAST_DAY(lastMonth)  AND b_id=bank_id
    GROUP BY b_id, lastMonth;
    UPDATE Saldo SET Debet=vDebet, Kredit=vKredit, SaldoEnd=SaldoBegin+vSaldoEnd
    WHERE b_id= bank_id AND Period = lastMonth;
	SELECT SaldoEnd INTO vSaldoBegin FROM Saldo WHERE b_id= bank_id AND Period = lastMonth;
	UPDATE Saldo SET SaldoBegin=vSaldoBegin
    WHERE b_id= bank_id AND Period = DATE_ADD(LAST_DAY(lastMonth), INTERVAL 1 DAY);
END $$
DELIMITER ;

CALL calcSaldo('2023-10-01',1);
CALL calcSaldo('2023-10-01',2);
CALL calcSaldo('2023-10-01',3);
 CALL calcSaldo('2023-11-01',1);
CALL calcSaldo('2023-11-01',2);
CALL calcSaldo('2023-11-01',3);
 CALL calcSaldo('2023-12-01',1);
CALL calcSaldo('2023-12-01',2);
CALL calcSaldo('2023-12-01',3);

 
CREATE VIEW VW_Transactions
AS
SELECT b.BankName, PayDate,  PaySum, r.ReasonName, s.subcategory, c.CurrencyName  
FROM Payments p
INNER JOIN Subcategory s ON p.sh_id=s.sh_id
INNER JOIN  Banks b ON p.b_id=b.b_id INNER JOIN  Currency c on b.c_id=c.c_id
INNER JOIN  Reasons r ON p.r_id=r.r_id;

-- event

SET GLOBAL event_scheduler = ON; 

DELIMITER $$
CREATE EVENT `saldo_event`
  ON SCHEDULE EVERY 1 DAY STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 1 DAY + INTERVAL 1 HOUR)
  ON COMPLETION NOT PRESERVE
  ENABLE
  COMMENT ''  DO	BEGIN
		DECLARE nowmonth VARCHAR(10);
        DECLARE countBanks tinyint;
        DECLARE counter tinyint default 1;
        SELECT MAX(b_id) INTO countBanks FROM Banks;
		SET nowmonth=DATE_FORMAT(NOW() ,'%Y-%m-01');
        WHILE countBanks>=counter DO
			CALL calcSaldo(nowmonth,counter);        
			SET counter =counter + 1;
		END WHILE;
END $$
DELIMITER ;