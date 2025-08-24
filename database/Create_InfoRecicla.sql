-- 1. Crear base de datos y usarla
CREATE DATABASE IF NOT EXISTS InfoRecicla;
USE InfoRecicla;

-- 2. Tabla usuarios
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  correo VARCHAR(100) NOT NULL,
  contraseña VARCHAR(255) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  rol ENUM('Ciudadano','GestorECA','Administrador') NOT NULL,
  creado DATETIME NOT NULL
);

-- 3. Tabla perfiles_ciudadano
CREATE TABLE perfiles_ciudadano (
  usuario_id INT PRIMARY KEY,
  edad INT,
  genero ENUM('Masculino','Femenino','Otro'),
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
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

-- 6. Tabla localidades
CREATE TABLE localidades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ciudad_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL
);

-- 7. Tabla puntos_eca
CREATE TABLE puntos_eca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  gestor_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  direccion VARCHAR(150) NOT NULL,
  ciudad_id INT NOT NULL,
  localidad_id INT,
  latitud DECIMAL(9,6),
  longitud DECIMAL(9,6),
  correo VARCHAR(100),
  telefono VARCHAR(20)
);

-- 8. Tabla materiales
CREATE TABLE materiales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT
);

-- 9. Tabla capacidad_material_punto_eca
CREATE TABLE capacidad_material_punto_eca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  tipo_id INT NOT NULL,
  material_id INT NOT NULL,
  capacidad_maxima_kg DECIMAL(10,2) NOT NULL,
  umbral_alerta DECIMAL(5,2) NOT NULL
);

-- 10. Tabla inventario
CREATE TABLE inventario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  material_id INT NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  fecha_registro TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 11. Tabla tipos_publicacion
CREATE TABLE tipos_publicacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion TEXT
);

-- 12. Tabla publicaciones
CREATE TABLE publicaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

-- 13. Tabla favoritos
CREATE TABLE favoritos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  publicacion_id INT NOT NULL,
  creado TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 14. Tabla comentarios
CREATE TABLE comentarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  publicacion_id INT NOT NULL,
  punto_eca_id INT,
  contenido TEXT NOT NULL,
  creado TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 15. Tabla notificaciones
CREATE TABLE notificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  tipo_id INT NOT NULL,
  referencia_id INT NOT NULL,
  enviado TIMESTAMP NOT NULL DEFAULT NOW(),
  leido TIMESTAMP NULL
);

-- 16. Tabla tipos_notificacion
CREATE TABLE tipos_notificacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(50) NOT NULL UNIQUE,
  descripcion TEXT
);

-- 17. Tabla conversaciones
CREATE TABLE conversaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_eca_id INT NOT NULL,
  usuario_ciudadano_id INT NOT NULL,
  iniciado DATETIME NOT NULL
);

-- 18. Tabla mensajes
CREATE TABLE mensajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  conversacion_id INT NOT NULL,
  remitente_id INT NOT NULL,
  contenido TEXT NOT NULL,
  enviado DATETIME NOT NULL,
  leido DATETIME
);

-- 19. Tabla tipos_material
CREATE TABLE tipos_material (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 20. Tabla programacion_recoleccion
CREATE TABLE programacion_recoleccion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  punto_eca_id INT NOT NULL,
  material_id INT NOT NULL,
  planta_reciclaje_id INT,  
  dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  frecuencia_semanas INT NOT NULL
);

-- 21. Tabla plantas_reciclaje 
CREATE TABLE plantas_reciclaje (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

