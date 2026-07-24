/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 04 Product Analysis

Business Requirement:
Find the most viewed products.
==========================================================
*/

SELECT
    v2ProductName,
    COUNT(*) AS total_views
FROM `data-to-insights.ecommerce.all_sessions`
WHERE v2ProductName IS NOT NULL
GROUP BY v2ProductName
ORDER BY total_views DESC
LIMIT 10;

/* 
-- Query 2 — Products Generating Highest Revenue
*/

SELECT
    v2ProductName,
    ROUND(SUM(IFNULL(productRevenue,0))/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY v2ProductName
ORDER BY revenue_usd DESC
LIMIT 10;

/*
-- Query 3 — Products Sold
*/
SELECT
    v2ProductName,
    SUM(IFNULL(productQuantity,0)) AS quantity_sold
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY v2ProductName
ORDER BY quantity_sold DESC
LIMIT 10;


/*
-- Query 4 — Product Categories
*/
SELECT
    v2ProductCategory,
    COUNT(*) AS total_products
FROM `data-to-insights.ecommerce.all_sessions`
WHERE v2ProductCategory IS NOT NULL
GROUP BY v2ProductCategory
ORDER BY total_products DESC;

/*
Query 5 — Top Revenue Categories
*/
SELECT
    v2ProductCategory,
    ROUND(SUM(IFNULL(productRevenue,0))/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY v2ProductCategory
ORDER BY revenue_usd DESC;