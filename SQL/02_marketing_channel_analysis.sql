/*
===============================================================
Project     : Google Merchandise Store Analysis
Lesson      : 02 - Marketing Channel Analysis
Dataset     : data-to-insights.ecommerce.all_sessions
Author      : Shrutika

Business Requirement:
Identify which marketing channel brings the highest number
of visitors and analyze visitor engagement.
===============================================================
*/

-- Total visitors by marketing channel

SELECT
    channelGrouping,
    COUNT(*) AS total_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY total_visitors DESC;

------------------------------------------------

-- Average page views by channel

SELECT
    channelGrouping,
    AVG(CAST(pageviews AS INT64)) AS avg_pageviews
FROM `data-to-insights.ecommerce.all_sessions`
WHERE pageviews IS NOT NULL
GROUP BY channelGrouping
ORDER BY avg_pageviews DESC;