USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.SalesOrderLine', 'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrderLine
    (
        SalesOrderLineId  BIGINT IDENTITY(1,1) NOT NULL,
        SalesOrderId      BIGINT               NOT NULL,
        LineNumber        INT                  NOT NULL,
        ProductId         INT                  NOT NULL,
        Quantity          DECIMAL(18,4)        NOT NULL,
        UnitPrice         DECIMAL(18,4)        NOT NULL,
        DiscountAmount    DECIMAL(18,4)        NOT NULL CONSTRAINT DF_SalesOrderLine_Discount DEFAULT (0),
        LineAmount        AS CONVERT(DECIMAL(18,4), (Quantity * UnitPrice) - DiscountAmount) PERSISTED,
        SourceSystem      NVARCHAR(40)         NOT NULL,
        CreatedAtUtc      DATETIME2(3)         NOT NULL CONSTRAINT DF_SalesOrderLine_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)         NULL,
        CONSTRAINT PK_SalesOrderLine PRIMARY KEY CLUSTERED (SalesOrderLineId),
        CONSTRAINT UQ_SalesOrderLine_Order_Line UNIQUE (SalesOrderId, LineNumber),
        CONSTRAINT CK_SalesOrderLine_Quantity CHECK (Quantity > 0),
        CONSTRAINT CK_SalesOrderLine_UnitPrice CHECK (UnitPrice >= 0),
        CONSTRAINT CK_SalesOrderLine_Discount CHECK (DiscountAmount >= 0)
    );
END;
GO
