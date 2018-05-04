CREATE TABLE PAIS (
idPais number not null primary key,
nombrePais varchar(405) null
);

create table Departamento (
idDepartamento number not null primary key,
nombreDepartamento varchar (405) null,
pais_idPais number not null,
foreign key (pais_idPais)
references pais (idPais) on delete cascade
);

create table ciudad (
idCiudad number not null primary key,
nombreCiudad varchar (405) null,
departamento_idDepartamento number not null,
foreign key (departamento_idDepartamento)
references Departamento (idDepartamento)
on delete cascade
);

create table Datos_Contacto (
idDatos_Contacto number not null primary key,
Telefono varchar (405) null,
Direccion varchar (405) null,
ciudad_idCiudad number not null,
foreign key (ciudad_idCiudad)
references ciudad (idCiudad)
on delete cascade
);


Create table Proveedor (
idProveedor number not null primary key,
nombre_Proveedor varchar(405) null,
datos_Contacto_idContacto number not null,
foreign key (datos_Contacto_idContacto)
references Datos_Contacto (idDatos_Contacto)
on delete cascade
);


create table Productos (
idProductos number not null primary key,
NombreProductos varchar (405) null,
Proveedor_idProveedor number not null,
foreign key (Proveedor_idProveedor)
references Proveedor (idProveedor)
on delete cascade
);

create table Tienda (
idtienda number not null primary key,
nombreTienda varchar (405) null,
datos_Contacto_idContacto number not null,
foreign key (datos_Contacto_idContacto)
references Datos_Contacto (idDatos_Contacto)
on delete cascade
);

create table Inventario (
idInventario number not null primary key,
Cantidad number not null,
Valor_unitario number not null,
Productos_idProductos number not null,
foreign key (Productos_idProductos)
references Productos (idProductos) on delete cascade,
Tienda_idTienda number not null,
foreign key (Tienda_idTienda)
references Tienda (idTienda)
on delete cascade
);

create table Cliente (
idCliente number not null primary key,
nombreCliente varchar (405) null,
datos_Contacto_idContacto number not null,
foreign key (datos_Contacto_idContacto)
references Datos_Contacto (idDatos_Contacto)
on delete cascade
);

create table Venta (
idVenta number not null primary key,
Cantidad number not null,
Tienda_idTienda number not null,
foreign key (Tienda_idTienda)
references Tienda (idTienda) on delete cascade,
Inventario_idInventario number not null,
foreign key (Inventario_idInventario)
references Inventario (idInventario) on delete cascade,
Cliente_idCliente number not null,
foreign key (Cliente_idCliente)
references Cliente (idCliente) on delete cascade
);

create table OrdenCompra (
idOrdenCompra number not null primary key,
valor number not null,
Venta_idVenta number not null,
foreign key (Venta_idVenta)
references Venta (idVenta)
on delete cascade
);

create table Factura (
idFactura number not null primary key,
valor number not null,
ordenCompra_idOrden number not null,
foreign key (ordenCompra_idOrden)
references ordencompra (idOrdenCompra)
on delete cascade
);
















