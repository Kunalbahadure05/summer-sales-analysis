-- Total rows in summer_data
SELECT COUNT(*) AS TotalRows FROM summer_data;

-- Total columns in summer_data
SELECT COUNT(*) AS ColumnCount
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'summer_data';

-- Identify potential duplicates by Product_ID and Product_Name
SELECT Product_ID, Product_Name, COUNT(*) AS Count
FROM summer_data
GROUP BY Product_ID, Product_Name
HAVING COUNT(*) > 1
ORDER BY Count DESC;

-- Category distribution analysis
SELECT Category, COUNT(*) AS CategoryCount,
    (SELECT COUNT(DISTINCT Category) FROM summer) AS TotalDistinctCategoryCount
FROM summer
GROUP BY Category
ORDER BY CategoryCount DESC;

-- Sub-Category distribution analysis
SELECT SUB_Category, COUNT(*) AS SubCategoryCount,
    (SELECT COUNT(DISTINCT SUB_Category) FROM summer) AS TotalDistinctSubCategoryCount
FROM summer
GROUP BY SUB_Category
ORDER BY SubCategoryCount DESC;

-- Brand_Name distribution analysis
SELECT Brand_Name, COUNT(*) AS BrandCount,
    (SELECT COUNT(DISTINCT Brand_Name) FROM summer) AS TotalDistinctBrandCount
FROM summer
GROUP BY Brand_Name
ORDER BY BrandCount DESC;

-- Product distribution analysis
SELECT Product, COUNT(*) AS ProductCount,
    (SELECT COUNT(DISTINCT Product) FROM summer) AS TotalDistinctProductCount
FROM summer
GROUP BY Product
ORDER BY ProductCount DESC;

-- Total sales and revenue
SELECT SUM(Quantity) AS Total_Units_Sold,
       SUM(Revenue) AS Total_Revenue
FROM summer_data;

-- Top-performing products by revenue and quantity
SELECT Product_Name, SUM(Quantity) AS Total_Quantity, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Product_Name
ORDER BY Total_Revenue DESC;

-- Top categories by quantity
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM summer_data
GROUP BY Category
ORDER BY Total_Quantity DESC;

-- Top brands by revenue and unique products
SELECT Brand_Name, SUM(Revenue) AS Total_Revenue, 
       COUNT(DISTINCT Product_ID) AS Unique_Products
FROM summer_data
GROUP BY Brand_Name
ORDER BY Total_Revenue DESC;

-- Average revenue per transaction by category
SELECT Category, AVG(Revenue) AS Avg_Revenue
FROM summer_data
GROUP BY Category
ORDER BY Avg_Revenue DESC;

-- Average quantity sold per transaction by product
SELECT Product_Name, AVG(Quantity) AS Avg_Quantity
FROM summer_data
GROUP BY Product_Name
ORDER BY Avg_Quantity DESC;

-- Top repeated purchase items
SELECT Product_Name, COUNT(*) AS Purchase_Frequency
FROM summer_data
GROUP BY Product_Name
ORDER BY Purchase_Frequency DESC;

-- Sales by hour and shift
SELECT Hour, Shift, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Hour, Shift
ORDER BY Hour;

-- Weekday vs weekend comparison
SELECT Weekend_or_Weekdays, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Weekend_or_Weekdays;

-- Daily sales trends
SELECT Day, SUM(Revenue) AS Total_Revenue, SUM(Quantity) AS Total_Units
FROM summer_data
GROUP BY Day
ORDER BY Total_Revenue DESC;

-- Revenue by shift
SELECT Shift, SUM(Revenue) AS Shift_Revenue
FROM summer_data
GROUP BY Shift
ORDER BY Shift_Revenue DESC;

-- Time-based peak sales (weekends morning/evening)
SELECT Shift, Weekend_or_Weekdays, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Shift, Weekend_or_Weekdays
ORDER BY Total_Revenue DESC;

-- Shift-wise brand performance
SELECT Shift, Brand_Name, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Shift, Brand_Name
ORDER BY Total_Revenue DESC;

-- Revenue by month
SELECT FORMAT(Date, 'yyyy-MM') AS Month,
       SUM(Revenue) AS Total_Revenue, 
       SUM(Quantity) AS Total_Units
FROM summer_data
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Month;

-- Combined time-based analysis
SELECT Day, Shift, Hour,
       SUM(Revenue) AS Total_Revenue,
       SUM(Quantity) AS Total_Quantity,
       COUNT(*) AS Transaction_Count
FROM summer_data
GROUP BY Day, Shift, Hour
ORDER BY Total_Revenue DESC;

-- Sales by price category
SELECT Price_Category,
       SUM(Revenue) AS Total_Revenue,
       SUM(Quantity) AS Total_Units_Sold,
       COUNT(*) AS Transactions
FROM summer_data
GROUP BY Price_Category
ORDER BY Total_Revenue DESC;

-- Top products by price category
SELECT Price_Category, Product_Name,
       SUM(Revenue) AS Total_Revenue,
       SUM(Quantity) AS Total_Units_Sold
FROM summer_data
GROUP BY Price_Category, Product_Name
ORDER BY Price_Category, Total_Revenue DESC;

-- Quantity distribution
SELECT Quantity, COUNT(*) AS Transaction_Count, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Quantity
ORDER BY Quantity;