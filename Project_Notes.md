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



# Lesson 3 – Country Analysis

## Business Requirement

Identify the countries generating the highest website traffic and revenue.

---

## SQL Concepts Learned

- COUNT(DISTINCT)
- GROUP BY
- ORDER BY
- LIMIT
- SUM()
- ROUND()
- FORMAT()

---

## Results

### Total Countries

215

### Top Traffic Countries

1. United States
2. Canada
3. India
4. United Kingdom
5. Japan

### Top Revenue Countries

1. United States
2. Venezuela
3. Canada
4. Indonesia
5. Japan

---

## Business Insights

- Visitors originate from 215 countries.
- The United States is the dominant market in both traffic and revenue.
- Canada and India generate significant website traffic.
- Some countries generate high revenue despite comparatively lower traffic, suggesting stronger purchase behavior.
- Regional marketing strategies can be optimized based on traffic and revenue performance.

---

## Interview Questions

### Why use COUNT(DISTINCT)?

To count unique values without duplicates.

### Why use SUM()?

To calculate total revenue.

### Why use LIMIT?

To return only the required number of rows.

### Why use FORMAT()?

To display large numeric values in a readable format.


# Lesson 4 – Product Analysis

## Business Requirement

Analyze product performance based on views, quantity sold, and revenue.

---

## SQL Concepts Learned

- SUM()
- IFNULL()
- COUNT()
- GROUP BY
- ORDER BY
- LIMIT

---

## Business Questions

1. Which products receive the most views?
2. Which products generate the highest revenue?
3. Which products sell the highest quantity?
4. Which product categories perform best?

---

## Business Value

- Improve inventory management
- Identify top-selling products
- Promote high-performing products
- Optimize product marketing


# Lesson 5 – Revenue Analysis

## Business Requirement

Analyze revenue performance across the ecommerce store.

---

## SQL Concepts Learned

- SUM()
- AVG()
- ROUND()
- IFNULL()
- GROUP BY
- ORDER BY
- LIMIT

---

## Business Questions

1. What is the total revenue?
2. Which marketing channels generate the most revenue?
3. Which countries generate the highest revenue?
4. What is the average revenue per transaction?
5. Which products contribute the highest revenue?

---

## Business Value

- Identify profitable marketing channels
- Understand regional revenue distribution
- Improve pricing and sales strategies
- Prioritize high-value products



# Lesson 6 – Customer Analysis

## Business Requirement

Analyze customer behavior to understand visitor distribution, purchasing patterns, and customer engagement across countries and marketing channels.

---

## SQL Concepts Learned

- COUNT(DISTINCT)
- CASE WHEN
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- ROUND()

---

## Business Questions

1. How many unique visitors does the website have?
2. Which countries have the highest number of unique visitors?
3. Which marketing channels attract the most visitors?
4. How many visitors completed a purchase?
5. Which countries have the highest customer purchase rate?

---

## Business Value

- Measure customer reach
- Evaluate customer acquisition channels
- Understand purchasing behavior
- Compare customer conversion across countries
- Support business growth strategies