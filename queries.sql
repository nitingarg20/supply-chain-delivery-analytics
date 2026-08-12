
-- Query 1: On-time delivery rate by region
SELECT "Order Region", COUNT(*) as total_orders, SUM(Late_delivery_risk) as late_orders,
ROUND(100.0 * (1 - AVG(Late_delivery_risk)), 2) as on_time_pct
FROM orders GROUP BY "Order Region" ORDER BY on_time_pct ASC;

-- Query 2: Top categories by sales, ranked within each region
SELECT "Order Region", "Category Name", ROUND(SUM(Sales), 2) as total_sales,
RANK() OVER (PARTITION BY "Order Region" ORDER BY SUM(Sales) DESC) as sales_rank
FROM orders GROUP BY "Order Region", "Category Name" ORDER BY "Order Region", sales_rank;

-- Query 3: Regions with high sales but poor on-time delivery (CTE)
WITH delivery_stats AS (
  SELECT "Order Region", ROUND(100.0 * (1 - AVG(Late_delivery_risk)), 2) as on_time_pct,
  ROUND(SUM(Sales), 2) as total_sales FROM orders GROUP BY "Order Region"
)
SELECT * FROM delivery_stats ORDER BY total_sales DESC LIMIT 10;
