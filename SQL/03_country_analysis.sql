/*
===============================================================
Project     : Google Merchandise Store Analysis
Lesson      : 03 - Country Analysis
Author      : Shrutika

Business Requirement:
Find the number of unique countries in the dataset.
===============================================================
*/

SELECT
    COUNT(DISTINCT country) AS total_countries
FROM `data-to-insights.ecommerce.all_sessions`;

/*
===============================================================
Query 2 : Visitors by Country
===============================================================
*/

SELECT
    country,
    COUNT(*) AS total_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
ORDER BY total_visitors DESC;

/*
===============================================================
Query 3 : Top 10 Countries
===============================================================
*/

SELECT
    country,
    COUNT(*) AS total_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
ORDER BY total_visitors DESC
LIMIT 10;

/*
===============================================================
Query 4 : Revenue by Country
===============================================================
*/

SELECT
    country,
    ROUND(SUM(totalTransactionRevenue)/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE totalTransactionRevenue IS NOT NULL
GROUP BY country
ORDER BY revenue_usd DESC;


SELECT
    country,
    ROUND(SUM(totalTransactionRevenue)/1000000,2) AS revenue_usd
FROM `data-to-insights.ecommerce.all_sessions`
WHERE totalTransactionRevenue IS NOT NULL
GROUP BY country
ORDER BY revenue_usd DESC
LIMIT 10;