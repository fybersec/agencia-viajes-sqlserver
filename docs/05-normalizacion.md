# 05 - Normalización

> **Fase:** 5 (Normalización) **Alcance:** revisión de las 11 tablas de `agencia_viajes` contra la primera, segunda y tercera forma normal, con las dependencias funcionales y transitivas encontradas. **No incluye:** cambios en la estructura, porque el análisis no los requirió. **Estado:** análisis completo; ninguna forma normal produjo tablas nuevas.

## 1. Resultado de esta fase

|Forma normal|Resultado|
|---|---|
|1FN|Se cumple. No hacen falta entidades nuevas|
|2FN|Se cumple. Las dependencias funcionales están identificadas|
|3FN|Se cumple. Las dependencias transitivas posibles ya están separadas en su propia tabla|

La base se diseñó separando desde el principio los datos que se repiten, por eso la revisión no encontró nada que corregir.

## 2. Primera forma normal (1FN)

Una tabla está en 1FN cuando cada celda guarda un solo valor y no hay columnas repetidas.

Se revisaron las 11 tablas: ninguna celda guarda listas y no hay columnas como `telefono1` o `telefono2`. Cada cliente tiene un teléfono y un correo, y cada actividad, pago u opinión es una fila propia.

**Entidades nuevas en esta fase:** ninguna. Las tablas que resuelven información repetida ya existen:

|Tabla|Qué repetido resuelve|
|---|---|
|`Itinerario`|Un paquete tiene varias actividades; en vez de columnas `actividad1`, `actividad2`..., cada una es una fila|
|`DetalleReserva`|Una reserva incluye varios paquetes; cada uno es una fila|
|`PaqueteServicio`|Un paquete incluye varios servicios; cada uno es una fila|
|`Pago`|Una reserva puede pagarse varias veces; cada pago es una fila|
|`Opinion`|Un cliente o un paquete tiene varias opiniones; cada una es una fila|

## 3. Segunda forma normal (2FN)

Una tabla está en 2FN cuando, estando en 1FN, cada columna depende de la llave primaria completa. Solo puede incumplirse en tablas con llave compuesta.

### 3.1 Dependencias funcionales

|Tabla|Llave primaria|Columnas que dependen de ella|
|---|---|---|
|`Destino`|`id_destino`|`nombre`, `descripcion`|
|`Cliente`|`id_cliente`|`nombre`, `apellido`, `correo`, `telefono`, `fecha_registro`|
|`Servicio`|`id_servicio`|`nombre`, `precio`|
|`MetodoPago`|`id_metodo_pago`|`nombre`|
|`Paquete`|`id_paquete`|`id_destino`, `nombre`, `precio`, `duracion_dias`, `disponible`|
|`Itinerario`|`id_itinerario`|`id_paquete`, `dia`, `actividad`, `hora_inicio`, `hora_fin`|
|`Reserva`|`id_reserva`|`id_cliente`, `fecha_reserva`, `estado`|
|`PaqueteServicio`|`id_paquete` + `id_servicio`|Ninguna columna adicional|
|`DetalleReserva`|`id_reserva` + `id_paquete`|`cantidad_personas`, `precio_aplicado`|
|`Pago`|`id_pago`|`id_reserva`, `id_metodo_pago`, `fecha_pago`, `monto`|
|`Opinion`|`id_opinion`|`id_cliente`, `id_paquete`, `fecha`, `valoracion`, `comentario`|

Las tablas con llave de una sola columna cumplen 2FN automáticamente, porque no existe una "parte" de la llave.

Quedan las dos tablas con llave compuesta:
- `PaqueteServicio` no tiene columnas adicionales, así que no hay nada que pueda depender de solo una parte de la llave.
- En `DetalleReserva`, `cantidad_personas` depende de la pareja completa: cuántas personas van en esa reserva en ese paquete. `precio_aplicado` también, porque es el precio al momento de la venta y puede ser distinto del precio actual del paquete. Si fuera siempre igual al de `Paquete`, dependería solo de `id_paquete` y habría que quitarlo.

### 3.2 Dependencias transitivas

Una dependencia transitiva ocurre cuando una columna depende de otra que no es la llave (`A → B → C`). Son las que la 3FN elimina, y aquí se identifican como pide el enunciado:

|Cadena|Dónde se resuelve|
|---|---|
|`Paquete` → `id_destino` → nombre y descripción del destino|Los datos del destino están en `Destino`|
|`Reserva` → `id_cliente` → datos del cliente|Los datos del cliente están en `Cliente`|
|`Pago` → `id_metodo_pago` → nombre del método|El nombre está en `MetodoPago`|
|`Opinion` → `id_paquete` → datos del paquete|Los datos del paquete están en `Paquete`|

En todos los casos la tabla hija guarda solo la llave foránea, y el resto de los datos viven en la tabla padre. Ninguna de las 11 tablas guarda un dato que dependa de otra columna que no sea su llave.

## 4. Tercera forma normal (3FN)

Una tabla está en 3FN cuando, estando en 2FN, ninguna columna depende de otra columna que no sea la llave.

Con las dependencias de la sección 3.2 ya resueltas, las 11 tablas cumplen 3FN.

**Entidades nuevas en esta fase:** ninguna. Dos columnas guardan valores de un conjunto cerrado: `Reserva.estado` (`Confirmada`, `Pendiente`, `Cancelada`) y `Opinion.valoracion` (`Positiva`, `Negativa`). No se separaron en tablas porque no determinan ninguna otra columna, y la 3FN no exige separarlas. Se podrían convertir en tablas de catálogo para evitar errores de escritura, pero aquí no se hizo.

## 5. Estado y alcance de esta fase

|Elemento|Estado|
|---|---|
|1FN revisada|Hecho|
|2FN y dependencias funcionales|Hecho|
|Dependencias transitivas|Hecho|
|3FN revisada|Hecho|
|Tablas nuevas|Ninguna|
