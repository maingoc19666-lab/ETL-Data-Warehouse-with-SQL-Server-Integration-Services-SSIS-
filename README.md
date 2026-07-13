# ETL Data Warehouse with SQL Server Integration Services (SSIS)

## Overview

This project implements an **ETL (Extract - Transform - Load)** process using **SQL Server Integration Services (SSIS)** to build a Sales Data Warehouse (**BanHangDWH**) from multiple data sources.

The project was developed as part of a Data Warehouse / Big Data Management assignment.

---

## Project Objectives

- Extract data from multiple heterogeneous data sources.
- Clean and transform data.
- Build dimension tables.
- Load fact table.
- Validate the loaded data using SQL queries.

---

## Data Sources

### Source 1 – SQL Server Database

Tables:

- Customers
- Orders

### Source 2 – CSV File

```
products.csv
```

Contains:

- ProductID
- ProductName
- Category
- Brand
- StandardCost
- SalePrice

### Source 3 – Excel File

```
promotion.xlsx
```

Sheet:

```
Promotions
```

Contains:

- ProductID
- PromoMonth
- DiscountRate

---

## Data Warehouse Schema

The ETL process loads data into four tables:

- **DimCustomer**
- **DimProduct**
- **DimDate**
- **FactSales**

### Star Schema

```
                DimCustomer
                     |
                     |
DimDate ------- FactSales ------- DimProduct
```

---

## ETL Workflow

### 1. Load DimCustomer

- Read data from Customers
- Replace missing phone numbers with `"Unknown"`
- Remove duplicate CustomerID
- Load into DimCustomer

---

### 2. Load DimProduct

- Read data from CSV file
- Load into DimProduct

---

### 3. Load DimDate

- Extract OrderDate
- Generate:
  - DateKey
  - Day
  - Month
  - Year
- Remove duplicate dates
- Load into DimDate

---

### 4. Load FactSales

Transformations include:

- Keep only:
  - Quantity > 0
  - UnitPrice > 0
- Join promotion data using:
  - ProductID
  - Order Month
- Replace missing DiscountRate with 0
- Lookup surrogate keys:
  - CustomerKey
  - ProductKey
  - DateKey
- Calculate:

```
RevenueAfterDiscount =
Quantity × UnitPrice × (1 − DiscountRate)
```

- Load into FactSales

---

## Data Validation

After loading, SQL queries are executed to verify:

- Number of records in each table
- Missing foreign keys
- Invalid revenue values
- NULL values

---

## Project Structure

```
├── Database/
│   ├── CreateTables.sql
│   └── ValidationQueries.sql
│
├── SSIS/
│   ├── BanHangETL.dtsx
│   └── SSIS_Project.sln
│
├── Data/
│   ├── products.csv
│   └── promotion.xlsx
│
├── Images/
│   ├── Package.png
│   ├── ControlFlow.png
│   └── DataFlow.png
│
└── README.md
```

---

## Technologies Used

- SQL Server
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Microsoft Excel
- CSV Files

---

## ETL Components Used

- OLE DB Source
- Flat File Source
- Excel Source
- Derived Column
- Data Conversion
- Sort
- Aggregate
- Merge Join
- Lookup
- Conditional Split
- OLE DB Destination

---

## Results

The ETL package successfully:

- Extracts data from multiple sources
- Cleans and transforms data
- Loads all dimension tables
- Loads the FactSales table
- Calculates discounted revenue
- Produces a complete Sales Data Warehouse

---

## Screenshots

Add screenshots of:

- Control Flow
- Data Flow
- Package Execution
- SSMS query results

Example:

```
Images/
    ControlFlow.png
    DataFlow.png
    PackageExecution.png
```

---

## Author

**Vũ Mai**

Data Warehouse & ETL Project using SQL Server Integration Services (SSIS)
