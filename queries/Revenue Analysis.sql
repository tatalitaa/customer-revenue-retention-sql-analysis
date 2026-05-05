SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM `customer-revenue-analysis.retail_data.online_retail`
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
  AND UnitPrice > 0
GROUP BY CustomerID
ORDER BY total_revenue DESC;