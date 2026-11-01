1. SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    CASE
        WHEN SUM(sales) >= 100000 THEN 'High Sales'
        WHEN SUM(sales) >= 50000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_performance
FROM public.superstore_sales_records
GROUP BY category
ORDER BY total_sales DESC;

2. SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM public.superstore_sales_records
GROUP BY region
HAVING SUM(sales) > 500000
ORDER BY total_sales DESC;

3. SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM public.superstore_sales_records
GROUP BY category
HAVING SUM(sales) > (
    SELECT AVG(category_sales)
    FROM (
        SELECT SUM(sales) AS category_sales
        FROM public.superstore_sales_records
        GROUP BY category
    ) AS category_summary
)
ORDER BY total_sales DESC;

4. SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM public.superstore_sales_records
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 5;