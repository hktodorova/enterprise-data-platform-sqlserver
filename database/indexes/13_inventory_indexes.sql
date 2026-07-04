IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_StockMovement_ProductWarehouseDate' AND object_id = OBJECT_ID('core.StockMovement'))
    CREATE INDEX IX_StockMovement_ProductWarehouseDate ON core.StockMovement(ProductId, WarehouseId, MovementDate) INCLUDE (Quantity, MovementType);
