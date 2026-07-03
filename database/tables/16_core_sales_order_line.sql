USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.SalesOrderLine', 'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrderLine
    (
        SalesOrderLineID  BIGINT IDENTITY(1,1) NOT NULL,
        SalesOrderID      BIGINT NOT NULL,
        LineNumber        INT NOT NULL,
        ProductID         BIGINT NOT NULL,
        Quantity          DECIMAL(18,4) NOT NULL,
        UnitPrice         DECIMAL(18,4) NOT NULL,
        DiscountAmount    DECIMAL(18,2) NOT NULL CONSTRAINT DF_SalesOrderLine_Discount DEFAULT (0),
        LineAmount        AS ((Quantity * UnitPrice) - DiscountAmount) PERSISTED,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_SalesOrderLine_CreatedAt DEFAULT SYSUTCDATETIME(),
        CONSTRAINT PK_SalesOrderLine PRIMARY KEY CLUSTERED (SalesOrderLineID),
        CONSTRAINT UQ_SalesOrderLine UNIQUE (SalesOrderID, LineNumber),
        CONSTRAINT CK_SalesOrderLine_Qty CHECK (Quantity > 0),
        CONSTRAINT CK_SalesOrderLine_Price CHECK (UnitPrice >= 0 AND DiscountAmount >= 0),
        CONSTRAINT FK_SalesOrderLine_Order FOREIGN KEY (SalesOrderID) REFERENCES core.SalesOrder(SalesOrderID),
        CONSTRAINT FK_SalesOrderLine_Product FOREIGN KEY (ProductID) REFERENCES core.Product(ProductID)
    );
END;
GO
