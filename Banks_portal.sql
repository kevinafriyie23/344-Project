CREATE database banks_portal;
Use Banks_portal;
CREATE TABLE accounts (
AccountID Int Not Null Unique Auto_increment primary key,
OwnerName Varchar(45) Not Null,
Owner_Ssn INT Not Null,
Balance decimal (10,2) default 0.00,
Account_status Varchar (45)  );

CREATE TABLE transactions (
TransactionID Int Not Null Unique Auto_increment primary key,
AccountID INT NOT NULL,
Transaction_type Varchar (45) Not Null,
Transaction_Amount Decimal (10,2) Not Null );

INSERT into accounts
Values
 ("Maria",  "Jozef", 123456789, 10000.00, "active"),
("Linda", "Jones", 987654321, 2600.00, "inactive"),
("John", "McGrail", 222222222, 100.50, "active"), 
("Patty", "Luna", 111111111, 509.75, "inactive")
;



INSERT into transactions
Values (1, deposit, 650.98), (3, withdraw, 899.97), (3, deposit, 350.00);

Delimiter 9
CREATE Procedure deposit (IN AccountID INT, IN amount Decimal (10,2))
BEGIN
INSERT INTO transactions (accountID, transaction_type, transaction_amount)
Values (AccountID, "deposit", amount);

Update accounts set balance = balance + amount Where accountID=accountID;
END;

CREATE PROCEDURE withdraw (IN accountID INT, IN amount Decimal (10,2))
BEGIN
INSERT INTO transactions (accountID, transaction_type, transaction_amount)
VALUES (accountID, "withdraw", amount) ;
UPDATE accounts SET balance = balance - amount WHERE accountID = accountID;
END;

delimter;