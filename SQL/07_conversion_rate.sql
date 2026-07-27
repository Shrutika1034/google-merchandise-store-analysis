/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 07 Conversion Rate Analysis

Business Requirement:
Calculate overall conversion rate.
==========================================================
*/

-- ================================================
-- Query 1 – Overall Conversion Rate
-- ================================================

SELECT
COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END) AS purchasing_visitors,
COUNT(DISTINCT fullVisitorId) AS total_visitors,
ROUND(
100 * COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END)
/
COUNT(DISTINCT fullVisitorId),
2
) AS conversion_rate_percentage
FROM `data-to-insights.ecommerce.all_sessions`;

-- ================================================
-- Query 2 – Conversion Rate by Marketing Channel
-- ================================================
SELECT
channelGrouping,
COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END) AS purchasing_visitors,
COUNT(DISTINCT fullVisitorId) AS total_visitors,
ROUND(
100 * COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END)
/
COUNT(DISTINCT fullVisitorId),
2
) AS conversion_rate
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY conversion_rate DESC;

-- ================================================
-- Query 3 – Conversion Rate by Country
-- ================================================
SELECT
country,
COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END) AS purchasing_visitors,
COUNT(DISTINCT fullVisitorId) AS total_visitors,
ROUND(
100 * COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END)
/
COUNT(DISTINCT fullVisitorId),
2
) AS conversion_rate
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
HAVING COUNT(DISTINCT fullVisitorId) > 100
ORDER BY conversion_rate DESC
LIMIT 10;

-- =======================================
-- Query 4 – Top Purchased Products
-- =======================================
SELECT
v2ProductName,
COUNT(DISTINCT transactionId) AS total_purchases
FROM `data-to-insights.ecommerce.all_sessions`
WHERE transactionId IS NOT NULL
GROUP BY v2ProductName
ORDER BY total_purchases DESC
LIMIT 10;

-- =========================================
-- Query 5 – Conversion by Product Category
-- =========================================
SELECT
v2ProductCategory,
COUNT(DISTINCT transactionId) AS total_purchases
FROM `data-to-insights.ecommerce.all_sessions`
WHERE transactionId IS NOT NULL
GROUP BY v2ProductCategory
ORDER BY total_purchases DESC;