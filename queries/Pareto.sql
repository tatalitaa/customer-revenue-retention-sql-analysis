WITH customer_revenue AS (
    SELECT 
        CustomerID,
        SUM(Quantity * UnitPrice) AS revenue
    FROM `customer-revenue-analysis.retail_data.online_retail`
    WHERE CustomerID IS NOT NULL
      AND Quantity > 0
      AND UnitPrice > 0
    GROUP BY CustomerID
),
ranked AS (
    SELECT *,
           NTILE(5) OVER (ORDER BY revenue DESC) AS bucket
    FROM customer_revenue
)
SELECT *
FROM ranked
WHERE bucket = 1;