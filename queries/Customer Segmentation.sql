WITH revenue AS (
    SELECT 
        CustomerID,
        SUM(Quantity * UnitPrice) AS total_spent
    FROM `customer-revenue-analysis.retail_data.online_retail`
    WHERE CustomerID IS NOT NULL
      AND Quantity > 0
      AND UnitPrice > 0
    GROUP BY CustomerID
)
SELECT *,
    CASE 
        WHEN total_spent > 1000 THEN 'High Value'
        WHEN total_spent > 500 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS segment
FROM revenue;