# Google Merchandise Store Analysis

---

# Lesson 1 – Dataset Exploration

## Business Requirement

Understand the dataset before starting analysis.

---

## Query 1

```sql
SELECT *
FROM `data-to-insights.ecommerce.all_sessions`
LIMIT 10;
```

### Purpose

View sample data.

---

## Query 2

```sql
SELECT COUNT(*) AS total_records
FROM `data-to-insights.ecommerce.all_sessions`;
```

### Result

21,493,109 records

---

## SQL Concepts Learned

- SELECT
- FROM
- LIMIT
- COUNT()
- AS

---

## Observations

- Large ecommerce dataset
- Customer-level data
- Marketing information
- Transaction information
- Product information

---

## Business Insight

The dataset is large enough to perform real-world business analytics.

---

# Lesson 2 – Marketing Channel Analysis

## Business Requirement

Identify which marketing channel brings the highest number of visitors.

---

## Query 1

```sql
SELECT
    channelGrouping,
    COUNT(*) AS total_visitors
FROM `data-to-insights.ecommerce.all_sessions`
GROUP BY channelGrouping
ORDER BY total_visitors DESC;
```

### Result

| Channel | Visitors |
|---------|----------:|
| Organic Search | 10,213,431 |
| Referral | 5,008,277 |
| Direct | 3,951,056 |
| Social | 1,014,863 |
| Paid Search | 840,487 |
| Affiliates | 258,976 |
| Display | 203,327 |
| Other | 2,692 |

---

## Query 2

```sql
SELECT
    channelGrouping,
    AVG(CAST(pageviews AS INT64)) AS avg_pageviews
FROM `data-to-insights.ecommerce.all_sessions`
WHERE pageviews IS NOT NULL
GROUP BY channelGrouping
ORDER BY avg_pageviews DESC;
```

---

## SQL Concepts Learned

- GROUP BY
- ORDER BY
- AVG()
- CAST()
- WHERE

---

## Business Insights

- Organic Search generates the highest traffic.
- Referral visitors browse the most pages.
- SEO is the strongest acquisition channel.
- Referral users show strong engagement.

---

## Interview Questions

### Why use GROUP BY?

To group records before applying aggregate functions.

### Why use AVG()?

To calculate the average value of a numeric column.

### Why CAST()?

Because `pageviews` is stored as text and must be converted to an integer for mathematical calculations.