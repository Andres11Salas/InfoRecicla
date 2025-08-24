-- Usuarios

-- 1.Usuario Ciudadano (solo puede ver publicaciones y gestionar sus propios favoritos y comentarios)
CREATE USER 'usuario_ciudadano'@'localhost' IDENTIFIED BY 'ciudadano123';
GRANT SELECT ON InfoRecicla.tipos_publicacion TO 'usuario_ciudadano'@'localhost';
GRANT SELECT ON InfoRecicla.publicaciones TO 'usuario_ciudadano'@'localhost';
GRANT SELECT, INSERT ON InfoRecicla.favoritos TO 'usuario_ciudadano'@'localhost';
GRANT SELECT, INSERT ON InfoRecicla.comentarios TO 'usuario_ciudadano'@'localhost';
GRANT SELECT ON InfoRecicla.notificaciones TO 'usuario_ciudadano'@'localhost';

-- 2.Usuario Gestor ECA (gestiona puntos, inventario y conversaciones)
CREATE USER 'usuario_gestor'@'localhost' IDENTIFIED BY 'gestor123';
GRANT SELECT, INSERT, UPDATE ON InfoRecicla.puntos_eca TO 'usuario_gestor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON InfoRecicla.perfiles_punto_eca TO 'usuario_gestor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON InfoRecicla.capacidad_material_punto_eca TO 'usuario_gestor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON InfoRecicla.inventario TO 'usuario_gestor'@'localhost';
GRANT SELECT, INSERT ON InfoRecicla.conversaciones TO 'usuario_gestor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON InfoRecicla.mensajes TO 'usuario_gestor'@'localhost';
GRANT SELECT ON InfoRecicla.favoritos TO 'usuario_gestor'@'localhost';
GRANT SELECT ON InfoRecicla.comentarios TO 'usuario_gestor'@'localhost';

-- 3.Usuario Administrador (todos los privilegios en todas las tablas)
CREATE USER 'usuario_admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON InfoRecicla.* TO 'usuario_admin'@'localhost';

FLUSH PRIVILEGES;