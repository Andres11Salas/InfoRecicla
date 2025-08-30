
-----NOTA GLOBAL-----
--Se le quita a todas las tablas con id auto_increment
--y se les pone id INT PRIMARY KEY



-- 1. Crear base de datos y usarla
CREATE DATABASE IF NOT EXISTS InfoRecicla;
USE InfoRecicla;

-- 2. Tabla usuarios
CREATE TABLE usuarios (
  id INT PRIMARY KEY,
  numero_de_documento int(20) NOT NULL UNIQUE, -- añadido 
  tipo_documentio ENUM('Cédula de Ciudadanía','Cédula de Extranjería','Pasaporte','Tarjeta de Identidad') NOT NULL, --añadido
  avatar_url VARCHAR(255), -- añadido
  telefono VARCHAR(20), -- añadido
  recibe_notificaciones BOOLEAN NOT NULL DEFAULT TRUE,  -- añadido
  nombre_usuario VARCHAR(50) NOT NULL UNIQUE, -- añadido
  correo VARCHAR(100) NOT NULL,
  contraseña VARCHAR(255) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  direccion VARCHAR(150),
  fecha_nacimiento DATE, 
  localidad VARCHAR(50),  -- añadido
  genero ENUM('Masculino','Femenino','Otro'),-- añadido
  rol ENUM('Ciudadano','GestorECA','Administrador') NOT NULL,
  creado DATETIME NOT NULL
);

-- 3. Tabla perfiles_ciudadano
CREATE TABLE perfiles_ciudadano (
  usuario_id INT PRIMARY KEY,
  edad INT,
  --- se retira genero
  ubicacion VARCHAR(100)
);

-- 4. Tabla perfiles_punto_eca
CREATE TABLE perfiles_punto_eca (
  usuario_id INT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  imagen_perfil_url VARCHAR(255),
  telefono VARCHAR(20)
);

-- 5. Tabla ciudades
CREATE TABLE ciudades (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);


-- 6. Tabla localidades
CREATE TABLE localidades (
  id INT PRIMARY KEY,
  ciudad_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL
);

-- 7. Tabla puntos_eca
CREATE TABLE puntos_eca (
  id INT PRIMARY KEY,
  gestor_id INT NOT NULL,
  nit VARCHAR(20) NOT NULL UNIQUE,  -- añadido
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  direccion VARCHAR(150) NOT NULL,
  horario_atencion VARCHAR(100), -- añadido
  sitio_web VARCHAR(100), -- añadido
  logo_url VARCHAR(255), -- añadido
  foto_url VARCHAR(255),  -- añadido
  mostrar_mapa BOOLEAN NOT NULL DEFAULT TRUE, -- añadido
  ciudad_id INT NOT NULL,
  localidad_id INT,
  latitud DECIMAL(9,6),
  longitud DECIMAL(9,6),
  correo VARCHAR(100),
  telefono VARCHAR(20)
);

-- 8. Tabla materiales
CREATE TABLE materiales (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT
  tipo VARCHAR(20), -- añadido
  categoria VARCHAR(20),-- añadido
  imagen_url VARCHAR(255),-- añadido
  precio_compra DECIMAL(7,2),-- añadido
  precio_venta DECIMAL(7,2)-- añadido
);

-- 9. Tabla capacidad_material_punto_eca
CREATE TABLE capacidad_material_punto_eca (
  id INT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  tipo_id INT NOT NULL,
  material_id INT NOT NULL,
  capacidad_maxima_kg DECIMAL(10,2) NOT NULL,
  umbral_alerta DECIMAL(5,2) NOT NULL
);

-- 10. Tabla inventario
CREATE TABLE inventario (
  id INT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  material_id INT NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  fecha_registro TIMESTAMP NOT NULL DEFAULT NOW()
  stock_actual decimal (10,2), -- añadido
  umbral_alerta decimal (10,2), -- añadido
  umbral_critico decimal (10,2) -- añadido
);

-- 11. Tabla tipos_publicacion
CREATE TABLE tipos_publicacion (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT
);

-- 12. Tabla publicaciones
CREATE TABLE publicaciones (
  id INT PRIMARY KEY,
  autor_id INT NOT NULL,
  tipo_id INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  resumen VARCHAR(255) NOT NULL,
  cuerpo TEXT NOT NULL,
  enlace_url VARCHAR(255),
  publicado TIMESTAMP,
  creado TIMESTAMP NOT NULL DEFAULT NOW(),
  actualizado TIMESTAMP NOT NULL DEFAULT NOW()
);
--------------------------------------
--Se agrega tabla Categorias 
--13. Tabla categorias_publicaciones
create table categorias_publicaciones(
  id INT PRIMARY KEY,
  publicacion_id INT NOT NULL,
  tipo ENUM('imagen','video','documento','enlace') NOT NULL,
  url VARCHAR(255) NOT NULL,
  titulo VARCHAR(50),
  descripcion TEXT
);
-------------------------------------
-------------------------------------
--Se agrega tabla Etiquetas
--14. Tabla votos
create table votos(
  tipo ENUM('pulicacion','punto eca')
  referencia_id INT NOT NULL,
  usuario_id INT NOT NULL,
  valor ENUM('like','dislike'),
  creado TIMESTAMP NOT NULL DEFAULT NOW()
);
-------------------------------------
-------------------------------------
-- 13. Tabla favoritos
CREATE TABLE favoritos (
  id INT  PRIMARY KEY,
  usuario_id INT NOT NULL,
  publicacion_id INT NOT NULL,
  creado TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 14. Tabla comentarios
CREATE TABLE comentarios (
  id INT PRIMARY KEY,
  usuario_id INT NOT NULL,
  publicacion_id INT NOT NULL,
  punto_eca_id INT,
  contenido TEXT NOT NULL,
  texto TEXT,
  creado TIMESTAMP NOT NULL DEFAULT NOW(),
  tipo ENUM('publicacion','punto eca'),
  referencia_id INT NOT NULL
);

-- 15. Tabla notificaciones
CREATE TABLE notificaciones (
  id INT  PRIMARY KEY,
  usuario_id INT NOT NULL,
  tipo_id INT NOT NULL,
  referencia_id INT NOT NULL,
  enviado TIMESTAMP NOT NULL DEFAULT NOW(),
  leido TIMESTAMP NULL
);

-- 16. Tabla tipos_notificacion
CREATE TABLE tipos_notificacion (
  id INT PRIMARY KEY,
  codigo VARCHAR(50) NOT NULL UNIQUE,
  descripcion TEXT
);

-- 17. Tabla conversaciones
CREATE TABLE conversaciones (
  id INT  PRIMARY KEY,
  usuario_eca_id INT NOT NULL,
  usuario_ciudadano_id INT NOT NULL,
  iniciado DATETIME NOT NULL
);

-- 18. Tabla mensajes
CREATE TABLE mensajes (
  id INT PRIMARY KEY,
  conversacion_id INT NOT NULL,
  remitente_id INT NOT NULL,
  contenido TEXT NOT NULL,
  enviado DATETIME NOT NULL,
  leido DATETIME
);

-- 19. Tabla tipos_material
CREATE TABLE tipos_material (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
  categoria ENUM('Plástico','Papel y Cartón','Vidrio','Metal','Orgánico','Electrónico','Otro') NOT NULL
);

-- 20. Tabla programacion_recoleccion
CREATE TABLE programacion_recoleccion (
  id INT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  material_id INT NOT NULL,
  planta_reciclaje_id INT,  
  dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  frecuencia_semanas INT NOT NULL
);

-- 21. Tabla plantas_reciclaje 
CREATE TABLE plantas_reciclaje (
  id INT PRIMARY KEY,
  nombre_entidad VARCHAR(100) NOT NULL,
  nombre_encargado VARCHAR(100),
  telefono VARCHAR(20),
  correo_electronico VARCHAR(100),
  frecuencia_recoleccion VARCHAR(100),
  direccion VARCHAR(255)
);

-- 22. Tabla materiales_plantas_reciclaje 
CREATE TABLE materiales_plantas_reciclaje (
  planta_id INT NOT NULL,
  material_id INT NOT NULL,
  PRIMARY KEY (planta_id, material_id)
);

---------------------------------------
--Se agrega tabla Compras
--23. Tabla compras
create table compras(
  id INT PRIMARY KEY,,
  inventario_id INT NOT NULL,
  fecha TIMESTAMP NOT NULL DEFAULT NOW(),
  kg decimal (6,2),
  precio_unitario decimal (7,2),
)
---------------------------------------
--------------------------------------
--Se agrega tabla Salidas 
--24. Tabla salidas
create table salidas(
  id INT PRIMARY KEY
  inventario_id INT NOT NULL,
  centros_de_acopio_id INT NOT NULL,
  fecha TIMESTAMP NOT NULL DEFAULT NOW(),
  kg decimal (6,2)
);
--------------------------------------
-------------------------------------
--Se agrega tabla Despachos
--25. Tabla despachos
create table despachos(
  id INT PRIMARY KEY,
  inventario_id INT NOT NULL,
  centros_de_acopio_id INT NOT NULL,
  fecha date NOT NULL DEFAULT NOW(),
  hora time NOT NULL DEFAULT NOW(),
  - frecuencia enum('manual', 'semanal', 'quincenal', 'mensual', 'unico') default manual
);
-------------------------------------
---------------------------------------------------------
--Se agrega tabla centros_de_acopio
--26. Tabla centros_de_acopio
create table centros_de_acopio(
  id INT PRIMARY KEY,
  nombre varchar(150) NOT NULL,
  tipo ENUM('Centro de Acopio','Proveedor') not null, 
  nit varchar(20) UNIQUE,
  alcance ENUM('Global','ECA'),
  contacto varchar(20),
  telefono varchar(20),
  correo varchar(20),
  direccion varchar(255),
  localidad_id INT not null,
  ciudad_id INT not null,
  latitud DECIMAL(9,6),
  longitud DECIMAL(9,6),  
  estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  creado TIMESTAMP NOT NULL DEFAULT NOW(),
  actualizado TIMESTAMP NOT NULL DEFAULT NOW(),
);
------------------------------------------------------------------
-- 23. Claves foráneas al final
ALTER TABLE perfiles_ciudadano
  ADD CONSTRAINT fk_perfiles_ciudadano_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id);

ALTER TABLE perfiles_punto_eca
  ADD CONSTRAINT fk_perfiles_punto_eca_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_perfiles_punto_eca_punto_eca_id FOREIGN KEY (punto_eca_id) REFERENCES puntos_eca(id);

ALTER TABLE localidades
  ADD CONSTRAINT fk_localidades_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES ciudades(id);

ALTER TABLE puntos_eca
  ADD CONSTRAINT fk_puntos_eca_gestor_id FOREIGN KEY (gestor_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_puntos_eca_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  ADD CONSTRAINT fk_puntos_eca_localidad_id FOREIGN KEY (localidad_id) REFERENCES localidades(id);

ALTER TABLE capacidad_material_punto_eca
  ADD CONSTRAINT fk_capacidad_material_punto_eca_punto_eca_id FOREIGN KEY (punto_eca_id) REFERENCES puntos_eca(id),
  ADD CONSTRAINT fk_capacidad_material_punto_eca_material_id FOREIGN KEY (material_id) REFERENCES materiales(id),
    ADD CONSTRAINT fk_capacidad_material_punto_eca_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipos_material(id);

ALTER TABLE inventario
  ADD CONSTRAINT fk_inventario_punto_eca_id FOREIGN KEY (punto_eca_id) REFERENCES puntos_eca(id),
  ADD CONSTRAINT fk_inventario_material_id FOREIGN KEY (material_id) REFERENCES materiales(id);

ALTER TABLE publicaciones
  ADD CONSTRAINT fk_publicaciones_autor_id FOREIGN KEY (autor_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_publicaciones_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipos_publicacion(id);

ALTER TABLE favoritos
  ADD CONSTRAINT fk_favoritos_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_favoritos_publicacion_id FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id);

ALTER TABLE comentarios
  ADD CONSTRAINT fk_comentarios_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_comentarios_publicacion_id FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id),
  ADD CONSTRAINT fk_comentarios_punto_eca_id FOREIGN KEY (punto_eca_id) REFERENCES puntos_eca(id);

ALTER TABLE notificaciones
  ADD CONSTRAINT fk_notificaciones_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_notificaciones_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipos_notificacion(id);

ALTER TABLE conversaciones
  ADD CONSTRAINT fk_conversaciones_usuario_eca_id FOREIGN KEY (usuario_eca_id) REFERENCES usuarios(id),
  ADD CONSTRAINT fk_conversaciones_usuario_ciudadano_id FOREIGN KEY (usuario_ciudadano_id) REFERENCES usuarios(id);

ALTER TABLE mensajes
  ADD CONSTRAINT fk_mensajes_conversacion_id FOREIGN KEY (conversacion_id) REFERENCES conversaciones(id),
  ADD CONSTRAINT fk_mensajes_remitente_id FOREIGN KEY (remitente_id) REFERENCES usuarios(id);

ALTER TABLE programacion_recoleccion
  ADD CONSTRAINT fk_programacion_recoleccion_punto_eca_id FOREIGN KEY (punto_eca_id) REFERENCES puntos_eca(id),
  ADD CONSTRAINT fk_programacion_recoleccion_material_id FOREIGN KEY (material_id) REFERENCES materiales(id),
  ADD CONSTRAINT fk_programacion_recoleccion_plantas_reciclaje_id FOREIGN KEY (planta_reciclaje_id) REFERENCES plantas_reciclaje(id);

ALTER TABLE materiales_plantas_reciclaje
  ADD CONSTRAINT fk_materiales_plantas_reciclaje_planta_id FOREIGN KEY (planta_id) REFERENCES plantas_reciclaje(id),
  ADD CONSTRAINT fk_materiales_plantas_reciclaje_material_id FOREIGN KEY (material_id) REFERENCES materiales(id);

ALTER TABLE categorias_publicaciones
  ADD CONSTRAINT fk_categorias_publicaciones_publicacion_id FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id);

ALTER TABLE votos 
  ADD CONSTRAINT fk_votos_usurios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id);

ALTER TABLE comentarios
  ADD CONSTRAINT fk_comentarios_usurios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id);

ALTER TABLE compras
  ADD CONSTRAINT fk_comentarios_inventario_id FOREIGN KEY (inventario_id) REFERENCES inventario(id);

ALTER TABLE entradas
  ADD CONSTRAINT fk_entradas_inventario_id FOREIGN KEY (inventario_id) REFERENCES inventario(id);

ALTER TABLE salidas
  ADD CONSTRAINT fk_salidas_inventario_id FOREIGN KEY (inventario_id) REFERENCES inventario(id);
  ADD CONSTRAINT fk_salidas_centro_de_acopio_id FOREIGN KEY (centros_de_acopio_id) REFERENCES centros_de_acopio(id);

ALTER TABLE despachos
  ADD CONSTRAINT fk_despacho_inventario_id FOREIGN KEY (inventario_id) REFERENCES inventario(id);
  ADD CONSTRAINT fk_despacho_centro_de_acopio_id FOREIGN KEY (centros_de_acopio_id) REFERENCES centros_de_acopio(id);