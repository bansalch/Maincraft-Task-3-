CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE orders (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Order_Priority VARCHAR(20),
    Quantity INT,
    Sales DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Ship_Mode VARCHAR(50),
    Profit DECIMAL(10,2),
    Unit_Price DECIMAL(10,2),
    Shipping_Cost DECIMAL(10,2),
    Customer_Name VARCHAR(100),
    City VARCHAR(100),
    Zip_Code VARCHAR(20),
    State VARCHAR(100),
    Region VARCHAR(50),
    Customer_Segment VARCHAR(50),
    Product_Category VARCHAR(50),
    Product_Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Product_Container VARCHAR(50),
    Product_Base_Margin DECIMAL(5,2),
    Ship_Date DATE
);

CREATE TABLE returns (
    Order_ID VARCHAR(30),
    Returned VARCHAR(10)
);

CREATE TABLE users (
    Region VARCHAR(50),
    Manager VARCHAR(100)
);

USE superstore_db;
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
        SUM(Sales) AS Current_Month_Sales
    FROM orders
    GROUP BY Month
)
SELECT 
    Month,
    Current_Month_Sales,
    LAG(Current_Month_Sales) OVER (ORDER BY Month) AS Previous_Month_Sales,
    (Current_Month_Sales - LAG(Current_Month_Sales) OVER (ORDER BY Month)) AS Sales_Variance,
    ((Current_Month_Sales - LAG(Current_Month_Sales) OVER (ORDER BY Month)) / 
      NULLIF(LAG(Current_Month_Sales) OVER (ORDER BY Month), 0)) * 100 AS Growth_Percentage
FROM MonthlySales;

SELECT 
    o.Region,
    COUNT(o.Order_ID) AS Total_Orders,
    COUNT(r.Order_ID) AS Returned_Orders,
    ROUND((CAST(COUNT(r.Order_ID) AS DECIMAL) / COUNT(o.Order_ID)) * 100, 2) AS Return_Rate_Percent
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.Region
ORDER BY Return_Rate_Percent DESC;

SELECT 
    o.Region,
    COUNT(o.Order_ID) AS Total_Orders,
    COUNT(r.Order_ID) AS Returned_Orders,
    ROUND((CAST(COUNT(r.Order_ID) AS DECIMAL) / COUNT(o.Order_ID)) * 100, 2) AS Return_Rate_Percent
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.Region
ORDER BY Return_Rate_Percent DESC;

SELECT 
    Product_Category,
    AVG(DATEDIFF(Ship_Date, Order_Date)) AS Avg_Shipping_Days,
    (SELECT AVG(DATEDIFF(Ship_Date, Order_Date)) FROM orders) AS Global_Avg_Shipping_Days,
    AVG(DATEDIFF(Ship_Date, Order_Date)) - (SELECT AVG(DATEDIFF(Ship_Date, Order_Date)) FROM orders) AS Variance_From_Average
FROM orders
GROUP BY Product_Category;

