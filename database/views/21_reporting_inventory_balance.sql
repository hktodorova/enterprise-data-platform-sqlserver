CREATE OR ALTER VIEW reporting.vwInventoryBalance
AS
SELECT
    p.ProductNumber,
    p.ProductName,
    w.WarehouseCode,
    SUM(sm.Quantity) AS QuantityOnHand,
    MAX(sm.MovementDate) AS LastMovementAt
FROM core.StockMovement sm
JOIN core.Product p ON p.ProductId = sm.ProductId
JOIN core.Warehouse w ON w.WarehouseId = sm.WarehouseId
GROUP BY p.ProductNumber, p.ProductName, w.WarehouseCode;
GO
