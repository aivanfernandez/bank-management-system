-- Create the database
CREATE DATABASE db_batch5_bms;

-- Use the created database
USE db_batch5_bms;

-- Create users table

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200)
);
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users(full_name,email,password,)
VALUES ('aivan','gmail@aivan','123456789');

-- Create Account table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    AccountType VARCHAR(50),
    Balance DECIMAL(15, 2) DEFAULT 0.00,
    DateOpened DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);

-- Create Transaction table
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(15, 2),
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Description VARCHAR(255),
    CONSTRAINT fk_Account
        FOREIGN KEY (AccountID)
        REFERENCES Account(AccountID)
);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Create Loan table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),
    CONSTRAINT fk_LoanCustomer
        FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
);

-- Create Branch table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(200),
    Phone VARCHAR(20)
);

-- Create Account_Branch junction table for many-to-many relationship between Account and Branch
CREATE TABLE Account_Branch (
    AccountID INT,
    BranchID INT,
    PRIMARY KEY (AccountID, BranchID),
    CONSTRAINT fk_AB_Account
        FOREIGN KEY (AccountID)
        REFERENCES Account(AccountID),
    CONSTRAINT fk_AB_Branch
        FOREIGN KEY (BranchID)
        REFERENCES Branch(BranchID)
);