USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.SalesOrder', 'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrder
    (
        SalesOrderID      BIGINT IDENTITY(1,1) NOT NULL,
        SalesOrderNumber  NVARCHAR(30) NOT NULL,
        CustomerID        BIGINT NOT NULL,
        OrderDate         DATE NOT NULL,
        OrderStatus       NVARCHAR(20) NOT NULL,
        CurrencyCode      CHAR(3) NOT NULL CONSTRAINT DF_SalesOrder_CurrencyCode DEFAULT ('CHF'),
        NetAmount         DECIMAL(18,2) NOT NULL CONSTRAINT DF_SalesOrder_NetAmount DEFAULT (0),
        TaxAmount         DECIMAL(18,2) NOT NULL CONSTRAINT DF_SalesOrder_TaxAmount DEFAULT (0),
        GrossAmount       AS (NetAmount + TaxAmount) PERSISTED,
        SourceSystem      NVARCHAR(40) NOT NULL,
        SourceRecordID    NVARCHAR(80) NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_SalesOrder_CreatedAt DEFAULT SYSUTCDATETIME(),
        ModifiedAt        DATETIME2(3) NULL,
        CONSTRAINT PK_SalesOrder PRIMARY KEY CLUSTERED (SalesOrderID),
        CONSTRAINT UQ_SalesOrder_Number UNIQUE (SalesOrderNumber),
        CONSTRAINT CK_SalesOrder_Status CHECK (OrderStatus IN ('Open','Released','Shipped','Invoiced','Cancelled')),
        CONSTRAINT CK_SalesOrder_Amounts CHECK (NetAmount >= 0 AND TaxAmount >= 0),
        CONSTRAINT FK_SalesOrder_Customer FOREIGN KEY (CustomerID) REFERENCES core.Customer(CustomerID)
    );
END;
GO
