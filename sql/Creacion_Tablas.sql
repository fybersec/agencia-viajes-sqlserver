USE agencia_viajes;

CREATE TABLE Destino(
id_destino INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE Cliente(
id_cliente INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL, 
correo VARCHAR(30) NOT NULL,
telefono VARCHAR(15) NOT NULL,
fecha_registro DATE NOT NULL
);

CREATE TABLE Servicio(
id_servicio INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(30) NOT NULL,
precio NUMERIC(10,2) NOT NULL
);

CREATE TABLE MetodoPago(
id_metodo_pago INT PRIMARY KEY IDENTITY (1,1),
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE Paquete(
id_paquete INT PRIMARY KEY IDENTITY (1,1),
id_destino INT NOT NULL,
CONSTRAINT fk_paquete_destino FOREIGN KEY(id_destino) REFERENCES Destino(id_destino),
nombre VARCHAR(30) NOT NULL,
precio NUMERIC(10,2) NOT NULL, 
duracion_dias INT NOT NULL,
disponible BIT NOT NULL DEFAULT 1
);

CREATE TABLE Itinerario(
id_itinerario INT PRIMARY KEY IDENTITY (1,1),
id_paquete INT NOT NULL,
CONSTRAINT fk_itinerario_paquete FOREIGN KEY (id_paquete) REFERENCES Paquete(id_paquete),
dia INT NOT NULL,
actividad VARCHAR(30) NOT NULL,
hora_inicio TIME NOT NULL,
hora_fin TIME NOT NULL
);

CREATE TABLE Reserva(
id_reserva INT PRIMARY KEY IDENTITY (1,1),
id_cliente INT NOT NULL,
CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
fecha_reserva DATE NOT NULL,
estado VARCHAR(30) NOT NULL
);

CREATE TABLE PaqueteServicio(
id_paquete INT NOT NULL,
id_servicio INT NOT NULL,
CONSTRAINT pk_paqueteservicio PRIMARY KEY (id_paquete, id_servicio),
CONSTRAINT fk_paqueteserviciopaquete FOREIGN KEY (id_paquete) REFERENCES Paquete(id_paquete),
CONSTRAINT fk_paqueteservicio_servicio FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

CREATE TABLE DetalleReserva(
id_reserva INT NOT NULL,
id_paquete INT NOT NULL,
cantidad_personas INT NOT NULL,
precio_aplicado NUMERIC(10,2) NOT NULL,
CONSTRAINT pk_detallereserva PRIMARY KEY (id_reserva, id_paquete),
CONSTRAINT fk_detallereserva_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
CONSTRAINT fk_detallereserva_paquete FOREIGN KEY (id_paquete) REFERENCES Paquete(id_paquete)
);

CREATE TABLE Pago(
id_pago INT PRIMARY KEY IDENTITY (1,1),
id_reserva INT NOT NULL,
id_metodo_pago INT NOT NULL,
fecha_pago DATE NOT NULL,
monto NUMERIC(10,2) NOT NULL,
CONSTRAINT fk_pago_reserva FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
CONSTRAINT fk_metodopago FOREIGN KEY (id_metodo_pago) REFERENCES MetodoPago(id_metodo_pago)
);

CREATE TABLE Opinion(
id_opinion INT PRIMARY KEY IDENTITY (1,1),
id_cliente INT NOT NULL,
id_paquete INT NOT NULL,
fecha DATE NOT NULL,
valoracion VARCHAR(200) NOT NULL,
comentario VARCHAR(200) NOT NULL,
CONSTRAINT fk_opinion_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
CONSTRAINT fk_opinion_paquete FOREIGN KEY (id_paquete) REFERENCES Paquete(id_paquete)
);