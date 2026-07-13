# Sales Data Warehouse ETL with SQL Server Integration Services (SSIS)

## Overview

This project demonstrates an **ETL (Extract, Transform, Load)** process using **SQL Server Integration Services (SSIS)** to build a Sales Data Warehouse (**BanHangDWH**) from multiple heterogeneous data sources.

The project focuses on extracting data, cleaning and transforming it, loading dimension and fact tables, and validating the final warehouse.

---

## Project Objectives

- Extract data from multiple data sources.
- Clean and transform raw data.
- Build dimension tables.
- Load the fact table.
- Validate the loaded data.

---

## Data Sources

### 1. SQL Server Database (Online)

Tables:

- Customers
- Orders

> **Note:** The SQL Server database was provided for the assignment and is accessed through an online server.

### 2. CSV File

`products.csv`

Contains:

- ProductID
- ProductName
- Category
- Brand
- StandardCost
- SalePrice

### 3. Excel File

`promotion.xlsx`

Sheet:

`Promotions`

Contains:

- ProductID
- PromoMonth
- DiscountRate

---

## Data Warehouse Schema

The warehouse consists of four tables:

- **DimCustomer**
- **DimProduct**
- **DimDate**
- **FactSales**

```
                DimCustomer
                     |
                     |
DimDate ------- FactSales ------- DimProduct
```

---

## ETL Process

### Load DimCustomer

- Read customer data from SQL Server
- Replace missing phone numbers with **"Unknown"**
- Remove duplicate CustomerID
- Load into **DimCustomer**

### Load DimProduct

- Read data from **products.csv**
- Load into **DimProduct**

### Load DimDate

- Extract OrderDate
- Generate:
  - DateKey
  - Day
  - Month
  - Year
- Remove duplicate dates
- Load into **DimDate**

### Load FactSales

- Filter invalid orders
  - Quantity > 0
  - UnitPrice > 0
- Merge promotion data using ProductID and Order Month
- Replace missing DiscountRate with 0
- Lookup:
  - CustomerKey
  - ProductKey
  - DateKey
- Calculate:

```
RevenueAfterDiscount = Quantity × UnitPrice × (1 − DiscountRate)
```

- Load into **FactSales**

---

## Technologies Used

- SQL Server
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Microsoft Excel
- CSV

---

## Project Structure

```
BanHangDWH-SSIS-ETL
│
├── Database/
│   ├── CreateTables.sql
│   └── ValidationQueries.sql
│
├── SSIS/
│   ├── BanHangETL.sln
│   ├── BanHangETL.dtproj
│   └── *.dtsx
│
├── Data/
│   ├── products.csv
│   └── promotion.xlsx
│
├── Images/
│   ├── ControlFlow.png
│   ├── LoadDimCustomer.png
│   ├── LoadDimProduct.png
│   ├── LoadDimDate.png
│   ├── LoadFactSales.png
│   └── PackageExecution.png
│
├── Docs/
│   └── Assignment.pdf
│
├── README.md
└── .gitignore
```

---

## Validation

The following SQL queries are used to validate the ETL result:

- Count records in each table
- Check for missing foreign keys
- Verify RevenueAfterDiscount is not NULL or negative

---

## Screenshots

The repository includes screenshots of:

- Control Flow
- Data Flow for each package
- Package execution
- ETL results

---

## Author

**Vũ Mai**

Course Project – Data Warehouse & ETL using SQL Server Integration Services (SSIS)
