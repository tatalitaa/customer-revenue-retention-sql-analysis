SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM `customer-revenue-analysis.retail_data.online_retail`
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_orders DESC;