USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.SalesOrder', 'U') IS NULL
BEGIN
    CREATE TABLE core.SalesOrder
    (
        SalesOrderId      BIGINT IDENTITY(1,1) NOT NULL,
        SalesOrderNumber  NVARCHAR(40)         NOT NULL,
        CustomerId        INT                  NOT NULL,
        OrderDate         DATE                 NOT NULL,
        RequestedDate     DATE                 NULL,
        OrderStatus       NVARCHAR(30)         NOT NULL,
        CurrencyCode      CHAR(3)              NOT NULL,
        SourceSystem      NVARCHAR(40)         NOT NULL,
        CreatedAtUtc      DATETIME2(3)         NOT NULL CONSTRAINT DF_SalesOrder_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)         NULL,
        CONSTRAINT PK_SalesOrder PRIMARY KEY CLUSTERED (SalesOrderId),
        CONSTRAINT UQ_SalesOrder_Number UNIQUE (SalesOrderNumber),
        CONSTRAINT CK_SalesOrder_Status CHECK (OrderStatus IN ('Open','Released','Shipped','Invoiced','Cancelled')),
        CONSTRAINT CK_SalesOrder_Currency CHECK (CurrencyCode LIKE '[A-Z][A-Z][A-Z]')
    );
END;
GO
