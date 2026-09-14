# 📊 Retail & Sales Performance Analytics Dashboard

An end-to-end Business Intelligence solution leveraging **MySQL** for backend database architecture and **Power BI** for interactive frontend visualization.

![Dashboard Preview](dashboard_preview.png)

---

## 📌 Project Overview
This project delivers executive-level insights into retail sales, profit margins, regional performance, and real-time low-stock inventory tracking.

- **Domain:** Retail & E-Commerce Sales
- **Database Backend:** MySQL
- **BI Tool:** Power BI Desktop
- **Data Architecture:** 4 Relational Tables + Custom SQL Reporting Views

---

## 🛠️ Data Architecture & SQL Setup
The relational model consists of `Customers`, `Regions`, `Products`, and `Orders` tables integrated via performance-optimized SQL views:

1. **`vw_salesmaster`**: Aggregates customer, product, regional, and transaction data for KPI calculations.
2. **`vw_lowstockalert`**: Filters products with stock quantities below threshold levels for automated inventory monitoring.

---

## 📈 Power BI Measures & DAX Analysis
Key DAX measures designed for real-time reporting:

- **Total Revenue:** `SUM('retailsalesdb vw_salesmaster'[TotalSales])`
- **Total Profit:** `SUM('retailsalesdb vw_salesmaster'[TotalProfit])`
- **Profit Margin %:** `DIVIDE([Total Profit], [Total Revenue], 0)`
- **Total Orders:** `COUNTROWS('retailsalesdb vw_salesmaster')`

---

## 🎨 Dashboard Design & Key Features
- **Executive Theme:** Corporate Navy/Teal color palette with structured grid card layout.
- **KPI Summary Cards:** Quick view of Revenue, Profit, Margin, and Volume.
- **Regional Sales:** Donut chart breaking down revenue across regions.
- **Top Customers:** Bar chart tracking top revenue-generating clients.
- **Category Matrix:** Detailed breakdown of product hierarchy performance.
- **Inventory Alerts:** Conditional highlighting for low-stock items.

---

## 🚀 How to Replicate
1. Run `schema_and_views.sql` in **MySQL Workbench** to set up database and views.
2. Open `Retail_Sales_Dashboard.pbix` in **Power BI Desktop**.
3. Re-link MySQL data source if prompted.
