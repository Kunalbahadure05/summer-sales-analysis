
# Summer Sales Analysis - Detailed Documentation

## 1. Introduction  
The Summer Sales Analysis project is designed to analyze sales data stored in the `Summer_SALES` database to identify key trends, top-performing products, pricing impacts, and time-based sales patterns. Using SQL Server Management Studio (SSMS) for data exploration and Power BI for visualization, the project provides actionable insights to improve inventory management, optimize staffing, and enhance pricing strategies.

---

## 2. Dataset Description  
The dataset consists of transactional sales data from the summer season, containing the following key attributes:

- **Product_ID, Product_Name:** Unique identifiers and names of products.
- **Category, SUB_Category, Brand_Name:** Product categorization for segmentation analysis.
- **Quantity:** Number of units sold per transaction.
- **Price, Revenue:** Pricing details and corresponding revenue generated.
- **DateTime:** Timestamp of the transaction (converted to `Date` and `Time`).
- **Shift, Hour, Day, Weekend_or_Weekdays:** Temporal dimensions for time-series analysis.
- **Price_Category:** Price segmentation for pricing strategy evaluation.

---

## 3. Data Preparation  
To preserve original data integrity, the following steps were performed:

1. **Data Duplication:**  
   A new table `summer_data` was created as a copy of the original `summer` table:
   ```sql
   SELECT * INTO summer_data FROM summer;
   ```
2. **Data Type Alignment:**  
   Adjusted columns for accuracy and SQL compatibility:
   - `Price` and `Revenue` columns modified to `DECIMAL(10, 2)` for precise financial calculations.
   - `Time` column changed to `TIME(0)` datatype.
   - `DateTime` column converted to `DATE` type and renamed to `Date` for clarity.
3. **Verification:**  
   Confirmed row count and column structure post modifications using:
   ```sql
   SELECT COUNT(*) AS TotalRows FROM summer_data;
   EXEC sp_help 'summer_data';
   ```
---

## 4. Exploratory Data Analysis (EDA)  
The EDA phase focused on understanding the dataset structure, checking for duplicates, and analyzing distribution patterns:

- **Duplicate Check:**  
  Identified duplicate records by `Product_ID` and `Product_Name` to ensure data quality.
- **Category Distribution:**  
  Counted occurrences per product category and sub-category.
- **Brand and Product Counts:**  
  Analyzed frequency distribution for `Brand_Name` and individual products.
- **Data Summary:**  
  Total units sold and revenue generated were aggregated to understand overall sales volume.

---

## 5. Sales Performance Analysis  
In-depth analysis of sales performance across products, categories, and brands:

- **Top-Performing Products:**  
  Ranked products by total revenue and quantity sold.
- **Category and Brand Analysis:**  
  Summarized sales volume by category and revenue by brand, including the count of unique products per brand.
- **Average Metrics:**  
  Computed average revenue per transaction for each category and average quantity sold per product.
- **Purchase Frequency:**  
  Identified products with the highest repeat purchase counts.

---

## 6. Time-Based Sales Analysis  
Understanding temporal patterns is key for operational planning:

- **Hourly and Shift Sales:**  
  Analyzed revenue by hour and shift to pinpoint peak sales periods.
- **Weekday vs Weekend:**  
  Compared sales to detect differences between weekends and weekdays.
- **Daily Trends:**  
  Aggregated daily revenue and units sold to track performance over time.
- **Shift and Weekend Interaction:**  
  Combined shift-wise sales with weekday/weekend classification to refine peak time insights.
- **Brand Performance by Shift:**  
  Assessed how different brands perform during various shifts.
- **Monthly Sales:**  
  Summarized revenue and quantity sold on a monthly basis.
- **Combined Time Analysis:**  
  Grouped sales data by day, shift, and hour to provide granular insights on transaction counts and revenue.

---

## 7. Pricing Strategy Evaluation  
Analyzed how pricing affects sales and revenue:

- **Revenue by Price Category:**  
  Grouped total revenue and units sold by price segments.
- **Top Products per Price Category:**  
  Identified highest revenue generators within each price category.
- **Quantity Distribution:**  
  Studied how sales quantity per transaction is distributed and its relationship with revenue.

---

## 8. Key Insights  
- High-revenue products and categories contribute disproportionately to overall sales, highlighting the importance of focusing on these areas for inventory optimization.
- Peak sales occur primarily during specific hours and shifts, often on weekends, suggesting targeted staffing and promotional efforts.
- Pricing categories reveal that mid to high price segments generate significant revenue, indicating pricing as a strong lever for maximizing profitability.

---

## 9. Recommendations  
- **Inventory Management:**  
  Prioritize stocking of top-performing products and categories to maximize sales potential.
- **Staffing Optimization:**  
  Allocate additional staff during peak hours and shifts, particularly on weekends, to improve customer service and throughput.
- **Pricing Strategy:**  
  Focus on optimizing price categories with high revenue impact, possibly experimenting with pricing models for underperforming segments.
- **Product Improvement:**  
  Investigate low-performing or infrequently purchased products for quality or marketing improvements.

---

## 10. SQL Query Files Overview  
The project SQL scripts are organized into three distinct files:

| File Name               | Description                                              |
|-------------------------|----------------------------------------------------------|
| `setup.sql`             | Initial database setup and creating base tables          |
| `modification.sql`      | Data type modifications and structural adjustments       |
| `main_queries.sql`      | Core analytical queries including sales, time, and pricing analysis |


---

## 11. Power BI Dashboard  
The project includes a Power BI dashboard (`powerbi/summer_sales_dashboard.pbix`) that visualizes the key insights interactively:

- Provides filters for categories, brands, time periods, and price ranges.
- Enables drill-down analysis on sales performance and trends.



