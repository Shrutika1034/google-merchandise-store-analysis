/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 05 Revenue Analysis

Business Requirement:
Calculate total revenue generated.
==========================================================
*/

-- =========================================
-- Query 1 : Total Revenue
-- =========================================

SELECT
ROUND(SUM(IFNULL(totalTransactionRevenue,0))/1000000,2) AS total_revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`;


-- =========================================
-- Query 2 : Revenue by Marketing Channel
-- =========================================
SELECT
channelGrouping,
ROUND(SUM(IFNULL(totalTransactionRevenue,0))/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY revenue_usd DESC;

-- =========================================
-- Query 3 – Revenue by Country
-- =========================================

SELECT
country,
ROUND(SUM(IFNULL(totalTransactionRevenue,0))/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
ORDER BY revenue_usd DESC
LIMIT 10;


-- =========================================
-- Query 4 – Average Revenue Per Transaction
-- =========================================
SELECT
ROUND(
AVG(IFNULL(totalTransactionRevenue,0))/1000000,
2
) AS avg_transaction_revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE totalTransactionRevenue IS NOT NULL;

-- =========================================
-- Query 5 – Top Revenue Products
-- =========================================
SELECT
v2ProductName,
ROUND(SUM(IFNULL(productRevenue,0))/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE v2ProductName IS NOT NULL
GROUP BY v2ProductName
ORDER BY revenue_usd DESC
LIMIT 10;