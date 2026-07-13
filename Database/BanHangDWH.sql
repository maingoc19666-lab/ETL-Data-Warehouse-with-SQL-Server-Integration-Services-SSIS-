CREATE DATABASE BanHangDWH;
GO
USE BanHangDWH;
GO
-- DimCustomer
CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID NVARCHAR(50),
    FullName NVARCHAR(100),
    Gender NVARCHAR(10),
    BirthDate DATE,
    City NVARCHAR(100),
    Phone NVARCHAR(20)
);

-- DimProduct
CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID NVARCHAR(50),
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Brand NVARCHAR(50),
    StandardCost FLOAT,
    SalePrice FLOAT
);

-- DimDate
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Day INT,
    Month INT,
    Year INT
);

-- FactSales
CREATE TABLE FactSales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT,
    CustomerKey INT,
    ProductKey INT,
    OrderID NVARCHAR(50),
    Quantity INT,
    UnitPrice FLOAT,
    DiscountRate FLOAT,
    RevenueAfterDiscount FLOAT
);
--Đếm số dòng các bảng
SELECT COUNT(*) AS TotalRows FROM DimCustomer;

SELECT COUNT(*) AS TotalRows FROM DimProduct;

SELECT COUNT(*) AS TotalRows FROM DimDate;

SELECT COUNT(*) AS TotalRows FROM FactSales;
--Kiểm tra Key bị thiếu
SELECT *
FROM FactSales
WHERE CustomerKey IS NULL
   OR ProductKey IS NULL
   OR DateKey IS NULL;
--Kiểm tra RevenueAfterDiscount
SELECT *
FROM FactSales
WHERE RevenueAfterDiscount IS NULL
   OR RevenueAfterDiscount < 0;