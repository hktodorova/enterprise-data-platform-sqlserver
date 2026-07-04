IF OBJECT_ID('core.Warehouse', 'U') IS NULL
BEGIN
    CREATE TABLE core.Warehouse
    (
        WarehouseId     INT IDENTITY(1,1) NOT NULL,
        WarehouseCode   NVARCHAR(20) NOT NULL,
        WarehouseName   NVARCHAR(120) NOT NULL,
        LocationId      INT NULL,
        IsActive        BIT NOT NULL CONSTRAINT DF_Warehouse_IsActive DEFAULT (1),
        CreatedAt       DATETIME2(3) NOT NULL CONSTRAINT DF_Warehouse_CreatedAt DEFAULT SYSUTCDATETIME(),
        CONSTRAINT PK_Warehouse PRIMARY KEY CLUSTERED (WarehouseId),
        CONSTRAINT UQ_Warehouse_Code UNIQUE (WarehouseCode),
        CONSTRAINT FK_Warehouse_Location FOREIGN KEY (LocationId) REFERENCES core.Location(LocationId)
    );
END;
