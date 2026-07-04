-- Suggested supporting index:
-- CREATE INDEX IX_SalesOrder_OrderDate_Customer ON core.SalesOrder(OrderDate, CustomerId) INCLUDE (GrossAmount, OrderStatus);

SELECT
    c.CustomerSegment,
    SUM(so.GrossAmount) AS GrossAmount
FROM core.SalesOrder so
JOIN core.Customer c ON c.CustomerId = so.CustomerId
WHERE so.OrderDate >= DATEADD(YEAR, -2, CAST(GETDATE() AS date))
  AND so.OrderStatus <> 'Cancelled'
GROUP BY c.CustomerSegment;
