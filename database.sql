CREATE DATABASE motorcyclesv2;
USE motorcyclesv2;

CREATE TABLE owners(
owner_id INT AUTO_INCREMENT PRIMARY KEY,
Firstname VARCHAR(100) NOT NULL,
Lastname VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Phone_Number VARCHAR(100) UNIQUE,
is_current_owner BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE motorcycles(
motorcycle_id INT AUTO_INCREMENT PRIMARY KEY,
make VARCHAR(255) NOT NULL,
model VARCHAR(255) NOT NULL,
`year` INT NOT NULL CHECK (`year` > 1900),
vin VARCHAR(255) UNIQUE NOT NULL,
engine_cc INT NOT NULL,  -- Engine capacity in cc
is_owned BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE owners_motorcycles (
owner_id INT,
motorcycle_id INT,
ownership_stat ENUM ("owner", "interested") NOT NULL,
PRIMARY KEY (owner_id, motorcycle_id),
FOREIGN KEY (owner_id) REFERENCES owners(owner_id) ON DELETE CASCADE,
FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(motorcycle_id) ON DELETE CASCADE
);

CREATE TABLE service_records (
service_id INT AUTO_INCREMENT PRIMARY KEY,
motorcycle_id INT,
service_date DATE,
description TEXT,
cost DECIMAL(10, 2),
FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(motorcycle_id)
);

CREATE TABLE insurance_records (
insurance_id INT AUTO_INCREMENT PRIMARY KEY,
motorcycle_id INT,
owner_id INT,
insurance_company VARCHAR(255) NOT NULL,
policy_number VARCHAR(255) NOT NULL,
coverage_amount DECIMAL(15, 2) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(motorcycle_id),
FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

-- check insert file for insert statements respectively 

-- queries too show all data from all of my tables
SELECT * FROM owners;
SELECT * FROM motorcycles;
SELECT * FROM owners_motorcycles;
SELECT * FROM service_records;
SELECT * FROM insurance_records;

-- We Are going too update john doe's name too jhonny Doel
UPDATE owners
SET Firstname = 'Jhonny', Lastname = 'Doel'
WHERE owner_id = 1;

-- We can show the owners in order of theyre first name
SELECT * FROM owners ORDER BY Firstname ASC;
-- Here we are showing the bikes in order of engine size. The bigger engine sized bikes appear first.
SELECT * FROM motorcycles ORDER BY engine_cc DESC;

-- Here is a query to correlate the engine size with the price of the insurance. Ive used alliases too make the tables easier too reference
Select
m.make, m.model, m.engine_cc, ir.coverage_amount
FROM motorcycles AS m
INNER JOIN
insurance_records AS ir
ON
m.motorcycle_id = ir.motorcycle_id;


-- Here is a stored procedure that makes it easy too see whether a motorcyle with a given id is insured
DELIMITER //
CREATE PROCEDURE IsMotorcyleInsured(IN motorcycleID INT)
BEGIN
IF EXISTS(SELECT 1 FROM insurance_records WHERE motorcycle_id = motorcycleID)
THEN
SELECT "The Motorcycle Has Insurance" AS RESULT;
ELSE
SELECT "The Motorcycle Is Not Insured" AS RESULT;
END IF;
END//
DELIMITER ;
-- This calls the stored procedure with the motorcycle id 1
CALL IsMotorcyleInsured(10);

-- Here im creating a view too more easily see motorcycles and there owners. It included joins.
CREATE VIEW MotorcyclesAndOwnersView AS
SELECT
m.make AS Motorcycle_Make,
m.model AS Motorcycle_Model,
o.Firstname AS OwnerFname,
o.Lastname AS OwnerLname,
o.is_current_owner AS IsCurrentOwner
FROM motorcycles AS m
INNER JOIN
owners_motorcycles AS om
ON
m.motorcycle_id = om.motorcycle_id
INNER JOIN
owners AS o
ON
om.owner_id = o.owner_id
WHERE
om.ownership_stat = 'owner';

-- This Displays The View
SELECT * FROM MotorcyclesAndOwnersView;

-- A query too show all insurance policys that expire within the next 30 days. It uses date functions.

SELECT * FROM insurance_records 
WHERE insurance_records.end_date BETWEEN CURDATE()
AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);


