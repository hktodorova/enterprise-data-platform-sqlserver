IF OBJECT_ID('core.StockMovement', 'U') IS NULL
BEGIN
    CREATE TABLE core.StockMovement
    (
        StockMovementId BIGINT IDENTITY(1,1) NOT NULL,
        ProductId       BIGINT NOT NULL,
        WarehouseId     INT NOT NULL,
        MovementDate    DATETIME2(3) NOT NULL,
        MovementType    NVARCHAR(20) NOT NULL,
        Quantity        DECIMAL(18,4) NOT NULL,
        ReferenceNo     NVARCHAR(60) NULL,
        SourceSystem    NVARCHAR(40) NOT NULL,
        SourceKey       NVARCHAR(80) NOT NULL,
        CreatedAt       DATETIME2(3) NOT NULL CONSTRAINT DF_StockMovement_CreatedAt DEFAULT SYSUTCDATETIME(),
        CONSTRAINT PK_StockMovement PRIMARY KEY CLUSTERED (StockMovementId),
        CONSTRAINT UQ_StockMovement_Source UNIQUE (SourceSystem, SourceKey),
        CONSTRAINT FK_StockMovement_Product FOREIGN KEY (ProductId) REFERENCES core.Product(ProductId),
        CONSTRAINT FK_StockMovement_Warehouse FOREIGN KEY (WarehouseId) REFERENCES core.Warehouse(WarehouseId),
        CONSTRAINT CK_StockMovement_Type CHECK (MovementType IN ('Receipt','Shipment','Adjustment','Transfer')),
        CONSTRAINT CK_StockMovement_Qty CHECK (Quantity <> 0)
    );
END;
