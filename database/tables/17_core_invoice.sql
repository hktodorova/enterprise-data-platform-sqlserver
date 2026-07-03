USE EnterpriseDataPlatform;
GO

IF OBJECT_ID('core.Invoice', 'U') IS NULL
BEGIN
    CREATE TABLE core.Invoice
    (
        InvoiceID         BIGINT IDENTITY(1,1) NOT NULL,
        InvoiceNumber     NVARCHAR(30) NOT NULL,
        SalesOrderID      BIGINT NULL,
        CustomerID        BIGINT NOT NULL,
        InvoiceDate       DATE NOT NULL,
        DueDate           DATE NOT NULL,
        InvoiceStatus     NVARCHAR(20) NOT NULL,
        CurrencyCode      CHAR(3) NOT NULL CONSTRAINT DF_Invoice_Currency DEFAULT ('CHF'),
        NetAmount         DECIMAL(18,2) NOT NULL,
        TaxAmount         DECIMAL(18,2) NOT NULL,
        GrossAmount       AS (NetAmount + TaxAmount) PERSISTED,
        SourceSystem      NVARCHAR(40) NOT NULL,
        CreatedAt         DATETIME2(3) NOT NULL CONSTRAINT DF_Invoice_CreatedAt DEFAULT SYSUTCDATETIME(),
        ModifiedAt        DATETIME2(3) NULL,
        CONSTRAINT PK_Invoice PRIMARY KEY CLUSTERED (InvoiceID),
        CONSTRAINT UQ_Invoice_Number UNIQUE (InvoiceNumber),
        CONSTRAINT CK_Invoice_Status CHECK (InvoiceStatus IN ('Open','Paid','Overdue','Cancelled')),
        CONSTRAINT CK_Invoice_Dates CHECK (DueDate >= InvoiceDate),
        CONSTRAINT CK_Invoice_Amounts CHECK (NetAmount >= 0 AND TaxAmount >= 0),
        CONSTRAINT FK_Invoice_SalesOrder FOREIGN KEY (SalesOrderID) REFERENCES core.SalesOrder(SalesOrderID),
        CONSTRAINT FK_Invoice_Customer FOREIGN KEY (CustomerID) REFERENCES core.Customer(CustomerID)
    );
END;
GO
