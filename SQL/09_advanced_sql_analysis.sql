/*
==========================================================
Project : Google Merchandise Store Analysis
Lesson  : 09 Advanced SQL Analysis
==========================================================
*/

-- ==========================================
-- Query 1 – Top 10 Revenue Products (ROW_NUMBER)
-- ==========================================

WITH ProductRevenue AS (
SELECT
v2ProductName,
ROUND(SUM(productRevenue)/1000000,2) AS revenue
FROM `data-to-insights.ecommerce.all_sessions`
WHERE productRevenue IS NOT NULL
GROUP BY v2ProductName
)

SELECT
ROW_NUMBER() OVER(ORDER BY revenue DESC) AS Rank,
v2ProductName,
revenue
FROM ProductRevenue
LIMIT 10;

-- ==========================================
-- Query 2 – Country Revenue Ranking (RANK)
-- ==========================================
WITH CountryRevenue AS (

SELECT
country,
ROUND(SUM(productRevenue)/1000000,2) AS revenue

FROM `data-to-insights.ecommerce.all_sessions`

WHERE productRevenue IS NOT NULL

GROUP BY country

)

SELECT

RANK() OVER(ORDER BY revenue DESC) AS Country_Rank,

country,

revenue

FROM CountryRevenue;

-- ==========================================
-- Query 3 – Marketing Channel Ranking
-- ==========================================

WITH ChannelRevenue AS (

SELECT

channelGrouping,

ROUND(SUM(productRevenue)/1000000,2) AS revenue

FROM `data-to-insights.ecommerce.all_sessions`

WHERE productRevenue IS NOT NULL

GROUP BY channelGrouping

)

SELECT

DENSE_RANK() OVER(ORDER BY revenue DESC) AS Channel_Rank,

channelGrouping,

revenue

FROM ChannelRevenue;

-- ======================================================
-- Query 4 – Highest Revenue Product in Each Category
-- ======================================================

WITH CategoryRevenue AS (

SELECT

v2ProductCategory,

v2ProductName,

ROUND(SUM(productRevenue)/1000000,2) AS revenue,

ROW_NUMBER() OVER(

PARTITION BY v2ProductCategory

ORDER BY SUM(productRevenue) DESC

) AS rn

FROM `data-to-insights.ecommerce.all_sessions`

WHERE productRevenue IS NOT NULL

GROUP BY

v2ProductCategory,

v2ProductName

)

SELECT

v2ProductCategory,

v2ProductName,

revenue

FROM CategoryRevenue

WHERE rn=1

ORDER BY revenue DESC;


-- ======================================================
-- Query 5 – Revenue Contribution (%)
-- ======================================================
WITH ProductRevenue AS (

SELECT

v2ProductName,

SUM(productRevenue) AS revenue

FROM `data-to-insights.ecommerce.all_sessions`

WHERE productRevenue IS NOT NULL

GROUP BY v2ProductName

)

SELECT

v2ProductName,

ROUND(revenue/1000000,2) AS revenue,

ROUND(

100*revenue/

SUM(revenue) OVER(),

2

) AS revenue_percentage

FROM ProductRevenue

ORDER BY revenue DESC

LIMIT 10;