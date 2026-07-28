/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 08 Sales Performance Analysis
==========================================================
*/

-- ==========================================
-- Query 1 – Revenue by Marketing Channel
-- ==========================================

SELECT
    channelGrouping,
    ROUND(SUM(productRevenue) / 1000000, 2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY channelGrouping
ORDER BY revenue_usd DESC;

-- ==========================================
-- Query 2 – Revenue by Country
-- ==========================================
SELECT
    country,
    ROUND(SUM(productRevenue) / 1000000, 2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY country
ORDER BY revenue_usd DESC
LIMIT 10;

-- ==========================================
-- Query 3 – Top Revenue Products
-- ==========================================
SELECT
    v2ProductName,
    ROUND(SUM(productRevenue) / 1000000, 2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY v2ProductName
ORDER BY revenue_usd DESC
LIMIT 10;

-- ==========================================
-- Query 4 – Revenue by Product Category
-- ==========================================
SELECT
    v2ProductCategory,
    ROUND(SUM(productRevenue) / 1000000, 2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY v2ProductCategory
ORDER BY revenue_usd DESC;

-- ==========================================
-- Query 5 – Top Revenue Dates
-- ==========================================
SELECT
    PARSE_DATE('%Y%m%d', date) AS order_date,
    ROUND(SUM(productRevenue) / 1000000, 2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY order_date
ORDER BY revenue_usd DESC
LIMIT 10;