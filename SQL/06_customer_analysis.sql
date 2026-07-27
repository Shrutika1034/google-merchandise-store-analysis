/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 06 Customer Analysis

Business Requirement:
Calculate total unique visitors.
==========================================================
*/

-- =========================================
-- Query 1 – Total Unique Visitors
-- =========================================

SELECT
COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`;

-- =========================================
-- Query 2 – Top Countries by Unique Visitors
-- =========================================

SELECT
country,
COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
ORDER BY unique_visitors DESC
LIMIT 10;

-- =========================================
-- Query 3 – Customers by Marketing Channel
-- =========================================
SELECT
channelGrouping,
COUNT(DISTINCT fullVisitorId) AS unique_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY unique_visitors DESC;

-- =========================================
-- Query 4 – Visitors with Transactions
-- =========================================

SELECT
CASE
    WHEN transactionId IS NOT NULL THEN 'Purchased'
    ELSE 'No Purchase'
END AS customer_type,
COUNT(DISTINCT fullVisitorId) AS visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY customer_type;


-- =========================================
-- Query 5 – Purchase Rate by Country
-- =========================================

SELECT
    country,
    COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END) AS purchasing_customers,
    COUNT(DISTINCT fullVisitorId) AS total_customers,
    ROUND(
        100 * COUNT(DISTINCT CASE WHEN transactionId IS NOT NULL THEN fullVisitorId END)
        / COUNT(DISTINCT fullVisitorId),
        2
    ) AS purchase_rate
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY country
HAVING COUNT(DISTINCT fullVisitorId) > 100
ORDER BY purchase_rate DESC
LIMIT 10;