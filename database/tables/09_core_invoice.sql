USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Invoice', 'U') IS NULL
BEGIN
    CREATE TABLE core.Invoice
    (
        InvoiceId         BIGINT IDENTITY(1,1) NOT NULL,
        InvoiceNumber     NVARCHAR(40)         NOT NULL,
        SalesOrderId      BIGINT               NULL,
        CustomerId        INT                  NOT NULL,
        InvoiceDate       DATE                 NOT NULL,
        DueDate           DATE                 NULL,
        InvoiceStatus     NVARCHAR(30)         NOT NULL,
        CurrencyCode      CHAR(3)              NOT NULL,
        NetAmount         DECIMAL(18,4)        NOT NULL,
        TaxAmount         DECIMAL(18,4)        NOT NULL CONSTRAINT DF_Invoice_TaxAmount DEFAULT (0),
        GrossAmount       AS CONVERT(DECIMAL(18,4), NetAmount + TaxAmount) PERSISTED,
        SourceSystem      NVARCHAR(40)         NOT NULL,
        CreatedAtUtc      DATETIME2(3)         NOT NULL CONSTRAINT DF_Invoice_CreatedAtUtc DEFAULT (SYSUTCDATETIME()),
        ModifiedAtUtc     DATETIME2(3)         NULL,
        CONSTRAINT PK_Invoice PRIMARY KEY CLUSTERED (InvoiceId),
        CONSTRAINT UQ_Invoice_Number UNIQUE (InvoiceNumber),
        CONSTRAINT CK_Invoice_Status CHECK (InvoiceStatus IN ('Open','Paid','PartiallyPaid','Cancelled','Overdue')),
        CONSTRAINT CK_Invoice_Amounts CHECK (NetAmount >= 0 AND TaxAmount >= 0),
        CONSTRAINT CK_Invoice_Currency CHECK (CurrencyCode LIKE '[A-Z][A-Z][A-Z]')
    );
END;
GO
