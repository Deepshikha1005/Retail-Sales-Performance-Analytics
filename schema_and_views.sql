CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;
-- 1. Regions Table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY AUTO_INCREMENT,
    RegionName VARCHAR(50),
    Country VARCHAR(50)
);
-- 2. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);
-- 3. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    UnitCost DECIMAL(10,2),
    StockQuantity INT
);
-- 4. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Sample Data Insert
INSERT INTO Regions (RegionName, Country) VALUES 
('North', 'India'), ('South', 'India'), ('East', 'India'), ('West', 'India');
INSERT INTO Customers (CustomerName, Segment, RegionID) VALUES 
('Rahul Sharma', 'Consumer', 1), ('Priya Patel', 'Corporate', 2),
('Amit Kumar', 'Home Office', 3), ('Neha Singh', 'Consumer', 4),
('Vikas Verma', 'Corporate', 1);
INSERT INTO Products (ProductName, Category, UnitPrice, UnitCost, StockQuantity) VALUES 
('Laptop Stand', 'Electronics', 1500.00, 900.00, 45),
('Wireless Mouse', 'Electronics', 800.00, 400.00, 8), -- Low Stock
('Ergonomic Chair', 'Furniture', 12000.00, 7500.00, 12),
('Notebook Pack', 'Office Supplies', 250.00, 100.00, 5), -- Low Stock
('USB-C Hub', 'Electronics', 2200.00, 1200.00, 30);
INSERT INTO Orders (OrderDate, CustomerID, ProductID, Quantity) VALUES 
('2025-01-15', 1, 1, 2),
('2025-01-20', 2, 3, 1),
('2025-02-10', 3, 2, 5),
('2025-02-14', 4, 4, 10),
('2025-03-01', 5, 5, 3),
('2025-03-05', 1, 3, 1),
('2025-03-12', 2, 1, 1);

-- View 1: Complete Sales Master View (Power BI ke main Model ke liye)
CREATE VIEW vw_SalesMaster AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.CustomerName,
    c.Segment,
    r.RegionName,
    r.Country,
    p.ProductID,
    p.ProductName,
    p.Category,
    o.Quantity,
    p.UnitPrice,
    p.UnitCost,
    (o.Quantity * p.UnitPrice) AS TotalSales,
    (o.Quantity * (p.UnitPrice - p.UnitCost)) AS TotalProfit
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Regions r ON c.RegionID = r.RegionID
JOIN Products p ON o.ProductID = p.ProductID;

-- View 2: Low Stock Alert View (Inventory Management ke liye)
CREATE VIEW vw_LowStockAlert AS
SELECT 
    ProductID,
    ProductName,
    Category,
    StockQuantity
FROM Products
WHERE StockQuantity < 10;