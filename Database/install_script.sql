-- Create the Employee Management System database
CREATE DATABASE EmployeeManagement;

-- Use the created database
USE EmployeeManagement;

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber NVARCHAR(15),
    HireDate DATE NOT NULL,
    JobTitle NVARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100)
);

-- Create a Foreign Key Relationship
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);

-- Insert sample data into Departments table
INSERT INTO Departments (DepartmentName, Location) VALUES
('Human Resources', 'New York'),
('Engineering', 'San Francisco'),
('Finance', 'Chicago');

-- Insert sample data into Employees table
INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Salary, DepartmentID) VALUES
('Imran', 'Sawaneh', 'imransawaneh@company.com', '123-456-7890', '2023-01-15', 'HR Manager', 75000, 1),
('Mykell', 'Tynes', 'mykelltynes@company.com', '234-567-8901', '2022-03-22', 'Software Engineer', 95000, 2),
('Mike', 'Johnson', 'mikejohnson@company.com', '345-678-9012', '2021-07-10', 'Accountant', 65000, 3);

-- Verify the inserted data
SELECT * FROM Employees;
SELECT * FROM Departments;
