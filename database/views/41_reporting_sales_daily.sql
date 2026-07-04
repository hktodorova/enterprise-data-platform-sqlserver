CREATE OR ALTER VIEW reporting.vwDailySales
AS
SELECT
    so.OrderDate,
    c.CustomerSegment,
    COUNT_BIG(*) AS OrderCount,
    SUM(so.NetAmount) AS NetAmount,
    SUM(so.TaxAmount) AS TaxAmount,
    SUM(so.GrossAmount) AS GrossAmount
FROM core.SalesOrder so
JOIN core.Customer c ON c.CustomerId = so.CustomerId
WHERE so.OrderStatus <> 'Cancelled'
GROUP BY so.OrderDate, c.CustomerSegment;
GO
