-- Example query for tuning exercise: intentionally scans a broad range.
SELECT
    c.CustomerSegment,
    SUM(so.GrossAmount) AS GrossAmount
FROM core.SalesOrder so
JOIN core.Customer c ON c.CustomerId = so.CustomerId
WHERE so.OrderDate >= DATEADD(YEAR, -2, CAST(GETDATE() AS date))
GROUP BY c.CustomerSegment;
