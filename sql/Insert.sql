USE agencia_viajes;

INSERT INTO Destino (nombre, descripcion) VALUES
('Playa Azul', 'Playa de arena blanca y aguas tranquilas, ideal para descansar y practicar deportes acuaticos.'),
('Montana Verde', 'Zona de montana con senderos, cascadas y clima fresco para caminatas y actividades al aire libre.'),
('Valle Escondido', 'Valle rodeado de naturaleza con pueblos pequenos, rutas ecologicas y miradores.'),
('Isla Coral', 'Isla con arrecifes de coral y aguas claras, pensada para buceo y snorkel.'),
('Ciudad Historica', 'Centro urbano con edificios antiguos, museos y plazas, ideal para recorridos culturales.');

INSERT INTO Cliente (nombre, apellido, correo, telefono, fecha_registro) VALUES
('Mario', 'Perez', 'mario.perez@basededatos.com', '8098369461', '2025-12-10'),
('Maria', 'Lopez', 'maria.lopez@basededatos.com', '8297350798', '2026-01-05'),
('Pedro', 'Gomez', 'pedro.gomez@basededatos.com', '8493320978', '2024-12-11'),
('Juan', 'Diaz', 'juan.diaz@basededatos.com', '8098748980', '2021-02-01'),
('Ana', 'Torres', 'ana.torres@basededatos.com', '8298830927', '2022-06-09'),
('Luis', 'Ramirez', 'luis.ramirez@basededatos.com', '8098571534', '2026-01-01'),
('Carmen', 'Ruiz', 'carmen.ruiz@basededatos.com', '8498236998', '2024-02-06'),
('Jose', 'Herrera', 'jose.herrera@basededatos.com', '8099987653', '2023-02-01'),
('Laura', 'Santos', 'laura.santos@basededatos.com', '8290909883', '2020-09-09'),
('Carlos', 'Mejia', 'carlos.mejia@basededatos.com', '8098787635', '2022-06-10');

INSERT INTO Servicio (nombre, precio) VALUES
('Alojamiento', 150.00),
('Transporte', 60.00),
('Guia turistico', 40.00),
('Desayuno', 15.00),
('Excursion', 55.00),
('Seguro de viaje', 25.00);

INSERT INTO MetodoPago (nombre) VALUES
('Efectivo'),
('Tarjeta de credito'),
('Transferencia'),
('Tarjeta de debito');

INSERT INTO Paquete (id_destino, nombre, precio, duracion_dias, disponible) VALUES
('1', 'Playa Azul Express', 450.00, '3', '1'),
('1', 'Playa Azul Familiar', 780.00, '5', '1'),
('2', 'Montana Aventura', 600.00, '4', '1'),
('2', 'Montana Relax', 420.00, '3', '1'),
('3', 'Valle Ecologico', 550.00, '4', '1'),
('3', 'Valle Cultural', 300.00, '2', '0'),
('4', 'Isla Coral Buceo', 950.00, '5', '1'),
('4', 'Isla Coral Completo', 1400.00, '7', '0'),
('5', 'Ruta Historica', 380.00, '3', '1');

INSERT INTO Itinerario (id_paquete, dia, actividad, hora_inicio, hora_fin) VALUES 
('1', '1', 'Llegada y registro', '14:00', '16:00'),
('1', '2', 'Paseo en bote', '09:00', '12:00'),
('1', '3', 'Dia libre en la playa', '10:00', '15:00'),
('3', '1', 'Caminata guiada', '08:00', '11:00'),
('3', '2', 'Visita a cascada', '09:00', '13:00'),
('3', '3', 'Paseo a caballo', '10:00', '12:30'),
('3', '4', 'Fogata y cena', '18:00', '21:00'),
('7', '1', 'Traslado a la isla', '08:00', '10:00'),
('7', '2', 'Clase de buceo', '09:00', '12:00'),
('7', '3', 'Buceo en arrecife', '09:00', '13:00'),
('7', '4', 'Snorkel libre', '10:00', '14:00');

INSERT INTO Reserva (id_cliente, fecha_reserva, estado) VALUES
('1', '2026-01-15', 'Confirmada'),
('2', '2026-01-28', 'Confirmada'),
('3', '2026-02-10', 'Confirmada'),
('1', '2026-02-20', 'Confirmada'),
('4', '2026-03-05', 'Cancelada'),
('5', '2026-03-18', 'Confirmada'),
('6', '2026-04-02', 'Confirmada'),
('2', '2026-04-22', 'Confirmada'),
('7', '2026-05-09', 'Confirmada'),
('8', '2026-05-25', 'Pendiente'),
('3', '2026-06-12', 'Confirmada'),
('9', '2026-06-30', 'Confirmada'),
('5', '2026-07-14', 'Confirmada'),
('1', '2026-08-03', 'Confirmada'),
('6', '2026-08-19', 'Pendiente'),
('4', '2026-09-07', 'Confirmada');

INSERT INTO PaqueteServicio (id_paquete, id_servicio) VALUES
('1', '1'),
('1', '2'),
('1', '4'),
('2', '1'),
('2', '2'),
('3', '1'),
('3', '3'),
('3', '5'),
('4', '1'),
('4', '4'),
('5', '3'),
('5', '5'),
('6', '2'),
('6', '3'),
('7', '1'),
('7', '5'),
('8', '1'),
('8', '6'),
('9', '2'),
('9', '3');

INSERT INTO DetalleReserva (id_reserva, id_paquete, cantidad_personas, precio_aplicado) VALUES
('1', '1', '2', 450.00),
('2', '3', '4', 600.00),
('3', '2', '3', 780.00),
('3', '9', '3', 380.00),
('4', '7', '2', 950.00),
('5', '4', '2', 420.00),
('6', '5', '2', 550.00),
('7', '9', '4', 380.00),
('8', '1', '2', 450.00),
('8', '4', '2', 420.00),
('9', '3', '3', 600.00),
('10', '7', '2', 950.00),
('11', '2', '4', 780.00),
('12', '9', '2', 380.00),
('12', '1', '2', 450.00),
('13', '5', '3', 550.00),
('14', '7', '2', 950.00),
('14', '3', '2', 600.00),
('15', '4', '2', 420.00),
('16', '1', '1', 450.00);

INSERT INTO Pago (id_reserva, id_metodo_pago, fecha_pago, monto) VALUES
('1', '2', '2026-01-15', 900.00),
('2', '3', '2026-01-28', 1200.00),
('2', '3', '2026-02-25', 1200.00),
('3', '2', '2026-02-10', 1740.00),
('3', '2', '2026-03-10', 1740.00),
('4', '1', '2026-02-20', 1900.00),
('6', '4', '2026-03-18', 1100.00),
('7', '3', '2026-04-02', 1520.00),
('8', '2', '2026-04-22', 870.00),
('8', '1', '2026-05-20', 870.00),
('9', '3', '2026-05-09', 1800.00),
('10', '1', '2026-05-25', 500.00),
('11', '2', '2026-06-12', 1560.00),
('11', '2', '2026-07-10', 1560.00),
('12', '4', '2026-06-30', 1660.00),
('13', '3', '2026-07-14', 1650.00),
('14', '2', '2026-08-03', 1550.00),
('14', '3', '2026-09-01', 1550.00),
('15', '1', '2026-08-19', 400.00),
('16', '4', '2026-09-07', 450.00);

INSERT INTO Opinion (id_cliente, id_paquete, fecha, valoracion, comentario) VALUES
('1', '1', '2026-02-10', 'Positiva', 'Todo muy bien organizado y el guia fue amable'),
('2', '3', '2026-02-20', 'Positiva', 'Las caminatas fueron un reto divertido'),
('3', '2', '2026-03-15', 'Positiva', 'Ideal para ir en familia, muy comodo'),
('1', '7', '2026-03-25', 'Positiva', 'El buceo fue una experiencia increible'),
('5', '5', '2026-04-10', 'Negativa', 'El transporte llego tarde el primer dia'),
('6', '9', '2026-04-20', 'Positiva', 'Recorrido interesante con buena explicacion'),
('2', '1', '2026-05-10', 'Negativa', 'La playa estaba muy llena y hubo ruido'),
('7', '3', '2026-05-30', 'Positiva', 'Buen paquete por el precio que tiene'),
('3', '9', '2026-07-05', 'Negativa', 'El recorrido fue corto para tanto caminar'),
('9', '9', '2026-07-20', 'Positiva', 'Excelente guia y buen horario'),
('9', '1', '2026-08-15', 'Positiva', 'Buen servicio y hotel limpio'),
('1', '3', '2026-09-12', 'Negativa', 'La reserva tardo en confirmarse'),
('4', '1', '2026-10-01', 'Positiva', 'Primer viaje con la agencia, muy buena experiencia');