-- ==========================================
-- Project : Google Merchandise Store Analysis
-- File    : 01_data_exploration.sql
-- Author  : Shrutika
-- ==========================================

-- Query 1 : View sample data

SELECT *
FROM `data-to-insights.ecommerce.all_sessions`
LIMIT 10;

------------------------------------------------

-- Query 2 : Count total records

SELECT
    COUNT(*) AS total_records
FROM `data-to-insights.ecommerce.all_sessions`;

------------------------------------------------

-- Query 3 : Unique Marketing Channels

SELECT DISTINCT channelGrouping
FROM `data-to-insights.ecommerce.all_sessions`
ORDER BY channelGrouping;

------------------------------------------------

-- Query 4 : Total Countries

SELECT COUNT(DISTINCT country) AS total_countries
FROM `data-to-insights.ecommerce.all_sessions`;