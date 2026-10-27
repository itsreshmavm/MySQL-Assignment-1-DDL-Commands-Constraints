-- DDL COMMANDS--
-- (1) CREATE--
-- Create the database employee --
create database if not exists employee;
use employee;
show databases;

create table if not exists departments
(
department_id int primary key,
department_name varchar(100)
);

create table if not exists Location
(
    location_id int primary key,
    location_name varchar(30)
);

-- Delete old tables first
drop table if exists departments;
drop table if exists location;

-- Creating the table Departments--

CREATE TABLE IF NOT EXISTS Departments
(
Department_id int primary key,
Department_name varchar(100)
);

SELECT *FROM Departments;

-- Create Location table--

CREATE TABLE IF NOT EXISTS Location
(
Location_id int primary key,
Location_name varchar(30)
);

SELECT *FROM Location;

-- Create Employees table--

CREATE TABLE IF NOT EXISTS Employees
(
Employee_ID INT PRIMARY KEY,
Employee_name VARCHAR(50) NOT NULL,
Age INT,
Gender ENUM('M','F'),
Hire_date DATE,
Designation VARCHAR(100),
Department_ID INT,
Location_ID INT,
Salary DECIMAL(10,2)
);
SELECT *FROM Employees;

-- (2) Table Alteration (ALTER)--

-- Add a new column named "email" to the Employees table to store employee email addresses--

ALTER TABLE Employees
ADD email VARCHAR(30);

-- Modify the data type of the "designation" column in the Employees table to support a wider range of values--
ALTER TABLE Employees
MODIFY Designation VARCHAR(200);

-- Rename the “hire_date” column to “date_of_joining”--
ALTER TABLE Employees
RENAME COLUMN Hire_date TO Date_of_joining ;

-- Drop the “age” column from the Employees table--
ALTER TABLE Employees
DROP COLUMN Age;

-- (3) Table Renaming (RENAME)--
-- Rename the "Departments" table to "Departments_Info"--
RENAME TABLE Departments TO Department_Info;

-- Rename the "Location" table to "Locations"--
RENAME TABLE Location TO Locations;

-- (4) Table Truncation (TRUNCATE)--
TRUNCATE TABLE Employees;

-- (5) Database & Table Dropping (DROP)--
DROP TABLE Employees;
DROP DATABASE employee;

-- Constraints --
-- Database Recreation-- 
DROP DATABASE IF EXISTS employee;

CREATE DATABASE IF NOT EXISTS employee;

USE employee;

SHOW DATABASES;

-- Departments Table--
CREATE TABLE Departments 
(
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(100) NOT NULL UNIQUE
);

SELECT *FROM Departments;

INSERT INTO Departments VALUES
(20000,'HR'),(2001,'Finance'),(2002,'Sales & Marketing'),(2003,'IT Department'),(2004,'Operation Department');

-- Location Table--
CREATE TABLE Location
(
 Location_id INT AUTO_INCREMENT PRIMARY KEY,
 Location_name VARCHAR(30) NOT NULL UNIQUE
);

SELECT *FROM Location;
INSERT INTO Location VALUES
(101,'Kottayam'),(102,'Palakkad'),(202,'Malappuram'),(203,'Alappuzha'),(204,'Ernamkulam'),(103,'Trivandrum'),(205,'Kannur');

DELETE FROM Location;
TRUNCATE Location;


-- Requirements: Unique employee ID, mandatory employee name, gender restricted to M or F, age at least 18, current date as the default hire date, and foreign keys for department and location--
CREATE TABLE Employees 
(
    employee_id INT PRIMARY KEY,   
    employee_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    designation VARCHAR(100),
    hire_date DATE DEFAULT (CURRENT_DATE),
    department_id INT,
    location_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);

ALTER TABLE Employees
ADD salary DECIMAL(10,2);

SELECT *FROM Employees;














