# Summer Sales Analysis SQL Queries

## 1. Database Setup and Preparation
### Select the Summer SALES database and query the summer table
```sql
USE Summer_SALES;
SELECT * FROM summer;
```

### Create a copy of the summer table to preserve original data
```sql
SELECT * INTO summer_data FROM summer;
SELECT * FROM summer_data;
```

## 2. Data Type Verification
### Examine the structure of the summer_data table
```sql
EXEC sp_help 'summer_data';
```

## 3. Distinct Analysis
### Identify potential duplicates by Product_ID and Product_Name
```sql
SELECT Product_ID, Product_Name, COUNT(*) AS Count
FROM summer_data
GROUP BY Product_ID, Product_Name
HAVING COUNT(*) > 1
ORDER BY Count DESC;
```

## 4. Brand Count Analysis
### Count distinct brands and total brand occurrences
```sql
SELECT Brand_Name, COUNT(*) AS BrandCount
FROM summer_data
GROUP BY Brand_Name
ORDER BY BrandCount DESC;
```

### Count distinct Brand_Name values
```sql
SELECT COUNT(DISTINCT Brand_Name) AS TotalDistinctBrandCount
FROM summer_data;
```

## 5. Sales Performance and Trends
### Calculate total units sold and total revenue
```sql
SELECT SUM(Quantity) AS Total_Units_Sold, SUM(Revenue) AS Total_Revenue
FROM summer_data;
```

## 6. Top-Performing Products
### Rank products by total revenue and quantity sold
```sql
SELECT Product_Name, SUM(Quantity) AS Total_Quantity, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Product_Name
ORDER BY Total_Revenue DESC;
```

## 7. Top Repeated Purchase Items
### Identify frequently purchased items
```sql
SELECT Product_Name, COUNT(*) AS Purchase_Frequency
FROM summer_data
GROUP BY Product_Name
ORDER BY Purchase_Frequency DESC;
```

## 8. Top-Performing Brands
### Rank brands by revenue and count of unique products
```sql
SELECT Brand_Name, SUM(Revenue) AS Total_Revenue, COUNT(DISTINCT Product_ID) AS Unique_Products
FROM summer_data
GROUP BY Brand_Name
ORDER BY Total_Revenue DESC;
```

## 9. Average Revenue per Transaction by Category
### Calculate average revenue per transaction by category
```sql
SELECT Category, AVG(Revenue) AS Avg_Revenue
FROM summer_data
GROUP BY Category
ORDER BY Avg_Revenue DESC;
```

## 10. Time-Based Insights
### Sales by hour and shift
```sql
SELECT Hour, Shift, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Hour, Shift
ORDER BY Hour, Shift;
```

### Daily sales trends
```sql
SELECT Day, SUM(Revenue) AS Total_Revenue, SUM(Quantity) AS Total_Units
FROM summer_data
GROUP BY Day
ORDER BY Total_Revenue DESC;
```

### Time-based peak sales (weekends vs. weekdays)
```sql
SELECT Shift, Weekend_or_Weekdays, SUM(Revenue) AS Total_Revenue
FROM summer_data
GROUP BY Shift, Weekend_or_Weekdays
ORDER BY Total_Revenue DESC;
```

### Revenue by month
```sql
SELECT FORMATDATE(yyyy-MM) AS Month, SUM(Revenue) AS Total_Revenue, SUM(Quantity) AS Total_Units
FROM summer_data
GROUP BY FORMATDATE(yyyy-MM)
ORDER BY Month;
```

## 11. Sales by Price Category
### Analyze sales by price category, including total revenue and units sold
```sql
SELECT Price_Category, SUM(Revenue) AS Total_Revenue, SUM(Quantity) AS Total_Units
FROM summer_data
GROUP BY Price_Category
ORDER BY Total_Revenue DESC;
```