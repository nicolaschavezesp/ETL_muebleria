-- Crear la base de datos relacional (origen)
CREATE DATABASE DBRelacional;
GO

USE DBRelacional;
GO

-- Crear tablas relacionales
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    NombreProducto NVARCHAR(100),
    Categoria NVARCHAR(50),
    PrecioUnitario DECIMAL(18, 2)
);
GO

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    NombreCliente NVARCHAR(100),
    Ubicacion NVARCHAR(100),
    Telefono NVARCHAR(20)
);
GO

CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY,
    NombreEmpleado NVARCHAR(100),
    Cargo NVARCHAR(50),
    SucursalID INT
);
GO

CREATE TABLE Sucursal (
    SucursalID INT PRIMARY KEY,
    NombreSucursal NVARCHAR(100),
    Ubicacion NVARCHAR(100)
);
GO

CREATE TABLE Venta (
    VentaID INT PRIMARY KEY,
    ProductoID INT FOREIGN KEY REFERENCES Producto(ProductoID),
    ClienteID INT FOREIGN KEY REFERENCES Cliente(ClienteID),
    EmpleadoID INT FOREIGN KEY REFERENCES Empleado(EmpleadoID),
    SucursalID INT FOREIGN KEY REFERENCES Sucursal(SucursalID),
    FechaVenta DATE,
    MontoVenta DECIMAL(18, 2),
    CantidadVendida INT
);
GO
