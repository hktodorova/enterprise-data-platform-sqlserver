USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.InventoryBalance', 'U') IS NULL
BEGIN
    CREATE TABLE core.InventoryBalance
    (
        InventoryBalanceId BIGINT IDENTITY(1,1) NOT NULL,
        ProductId          INT                  NOT NULL,
        LocationId         INT                  NOT NULL,
        BalanceDate        DATE                 NOT NULL,
        QuantityOnHand     DECIMAL(18,4)        NOT NULL,
        QuantityReserved   DECIMAL(18,4)        NOT NULL CONSTRAINT DF_InventoryBalance_Reserved DEFAULT (0),
        SourceSystem       NVARCHAR(40)         NOT NULL,
        CreatedAtUtc       DATETIME2(3)         NOT NULL CONSTRAINT DF_InventoryBalance_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc      DATETIME2(3)         NULL,
        CONSTRAINT PK_InventoryBalance PRIMARY KEY CLUSTERED (InventoryBalanceId),
        CONSTRAINT UQ_InventoryBalance_Product_Location_Date UNIQUE (ProductId, LocationId, BalanceDate),
        CONSTRAINT CK_InventoryBalance_Quantity CHECK (QuantityOnHand >= 0 AND QuantityReserved >= 0)
    );
END;
GO
