-- Analysis queries used for reporting and dashboard preparation

-- 1. Monthly revenue and profit trend
SELECT 
    strftime('%Y-%m', OrderDate) AS Month,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0), 2) AS ProfitMarginPercent
FROM orders
GROUP BY Month
ORDER BY Month;

-- 2. Sales by product category
SELECT
    Category,
    COUNT(*) AS OrderCount,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- 3. Sales by region
SELECT
    Region,
    COUNT(*) AS OrderCount,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- 4. Top 10 customers
SELECT
    Customer,
    COUNT(*) AS OrderCount,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    ROUND(SUM(Profit), 2) AS TotalProfit
FROM orders
GROUP BY Customer
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 5. Data quality checks
SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Revenue < 0 OR Cost < 0 OR Profit < 0 THEN 1 ELSE 0 END) AS NegativeValueRows,
    SUM(CASE WHEN Customer IS NULL OR Region IS NULL OR Category IS NULL THEN 1 ELSE 0 END) AS MissingCategoryRows
FROM orders;
