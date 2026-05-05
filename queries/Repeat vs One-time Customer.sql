SELECT 
    CASE 
        WHEN COUNT(DISTINCT InvoiceNo) = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(DISTINCT CustomerID) AS total_customers
FROM `customer-revenue-analysis.retail_data.online_retail`
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID;