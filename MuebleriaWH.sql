-- Crear la base de datos dimensional (destino)
CREATE DATABASE DBDimensional;
GO

USE DBDimensional;
GO

-- Crear tablas dimensionales
CREATE TABLE DimProducto (
    ProductoID INT PRIMARY KEY,
    NombreProducto NVARCHAR(100),
    Categoria NVARCHAR(50),
    PrecioUnitario DECIMAL(18, 2)
);
GO

CREATE TABLE DimCliente (
    ClienteID INT PRIMARY KEY,
    NombreCliente NVARCHAR(100),
    Ubicacion NVARCHAR(100),
    Telefono NVARCHAR(20)
);
GO

CREATE TABLE DimEmpleado (
    EmpleadoID INT PRIMARY KEY,
    NombreEmpleado NVARCHAR(100),
    Cargo NVARCHAR(50),
    SucursalID INT
);
GO

CREATE TABLE DimSucursal (
    SucursalID INT PRIMARY KEY,
    NombreSucursal NVARCHAR(100),
    Ubicacion NVARCHAR(100)
);
GO

CREATE TABLE DimTiempo (
    TiempoID INT PRIMARY KEY,
    Fecha DATE,
    Semana INT,
    Mes INT,
    Trimestre INT,
    Año INT
);
GO

CREATE TABLE HechoVenta (
    VentaID INT PRIMARY KEY,
    ProductoID INT FOREIGN KEY REFERENCES DimProducto(ProductoID),
    ClienteID INT FOREIGN KEY REFERENCES DimCliente(ClienteID),
    EmpleadoID INT FOREIGN KEY REFERENCES DimEmpleado(EmpleadoID),
    SucursalID INT FOREIGN KEY REFERENCES DimSucursal(SucursalID),
    TiempoID INT FOREIGN KEY REFERENCES DimTiempo(TiempoID),
    MontoVenta DECIMAL(18, 2),
    CantidadVendida INT
);
GO
