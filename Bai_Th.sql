use bai5;

create table Customer(
    CustomerID int primary key,
    CustomerName varchar(50),
    CustomerLastName varchar(20),
    CustomerFirstName varchar(20),
    CustomerPhone varchar(20),
    CustomerAddress varchar(50)
);
   Explain select * from customer where customerName="the" ;
   
   Alter table customer add index idx_CustomerName(CustomerName);
   
   alter table customer drop index idx_CustomerName;
   
   ALTER TABLE Customer ADD INDEX idx_full_name(CustomerFirstName, CustomerLastName);
   
   EXPLAIN SELECT * FROM Customer WHERE CustomerFirstName = 'pham' or CustomerFirstName = 'vu';

   Delimiter //
   Create procedure findAllCustomers()
   BEGIN
      SELECT * FROM Customer;
      END //
      Delimiter //;
      
	CALL findAllCustomers();
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN
SELECT * FROM customer where CustomerID = 173;
END //
Delimiter //;

--  Thuc hanh truyen tham so :

DELIMITER //
CREATE PROCEDURE getCusById
(IN cusNum INT(11))
BEGIN
  SELECT * FROM Customer WHERE CustomerID = cusNum;
END //
DELIMITER ;
call getCusById(102);

DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity(
    IN  in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(CustomerID)
    INTO total
    FROM Customer
    WHERE CustomerAddress = in_city;
END//
DELIMITER ;
CALL GetCustomersCountByCity('nam dinh',@total);
SELECT @total;

DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;
-- Thao tac view; 
CREATE OR REPLACE VIEW customer_views AS
SELECT CustomerID, CustomerName, CustomerLastName, CustomerFirstName, CustomerPhone
FROM Customer
WHERE CustomerAddress = 'thai binh';
