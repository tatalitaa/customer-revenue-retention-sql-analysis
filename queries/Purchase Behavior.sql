WITH transactions AS (
    SELECT 
        CAST(CustomerID AS STRING) AS CustomerID,
        InvoiceNo,
        MIN(InvoiceDate) AS InvoiceDate
    FROM `customer-revenue-analysis.retail_data.online_retail`
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID, InvoiceNo
)

SELECT 
    CustomerID,
    InvoiceDate,
    LAG(InvoiceDate) OVER (
        PARTITION BY CustomerID
        ORDER BY InvoiceDate
    ) AS prev_purchase,
    DATE_DIFF(
        InvoiceDate,
        LAG(InvoiceDate) OVER (
            PARTITION BY CustomerID
            ORDER BY InvoiceDate
        ),
        DAY
    ) AS days_between_orders
FROM transactions;