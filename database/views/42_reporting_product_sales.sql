CREATE OR ALTER VIEW reporting.vwProductSales
AS
SELECT
    p.ProductNumber,
    p.ProductName,
    p.ProductGroup,
    SUM(sol.Quantity) AS QuantitySold,
    SUM(sol.LineAmount) AS SalesAmount
FROM core.SalesOrderLine sol
JOIN core.Product p ON p.ProductId = sol.ProductId
JOIN core.SalesOrder so ON so.SalesOrderId = sol.SalesOrderId
WHERE so.OrderStatus <> 'Cancelled'
GROUP BY p.ProductNumber, p.ProductName, p.ProductGroup;
GO
