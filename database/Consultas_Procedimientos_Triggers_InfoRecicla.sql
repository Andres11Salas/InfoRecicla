-- Vistas

-- 1. Materiales que superaron el umbral de alerta
CREATE VIEW vista_alertas_umbral_bajo AS
SELECT 
 pe.nombre AS nombre_punto_eca,
 m.nombre AS nombre_material,
 cmpe.umbral_pct AS porcentaje_umbrales,
 cmpe.capacidad_nueva AS cantidad_actual_kg,
 cmpe.capacidad_max_kg AS capacidad_maxima_kg
FROM capacidad_material_punto_eca AS cmpe
JOIN puntos_eca   AS pe ON pe.id = cmpe.punto_eca_id
JOIN materiales    AS m ON m.id = cmpe.material_id
WHERE cmpe.capacidad_nueva > cmpe.capacidad_max_kg * cmpe.umbral_pct / 100;

-- 2. Entradas de material por punto eca
CREATE VIEW vista_entradas_materiales AS
SELECT 
 pe.nombre AS nombre_punto_eca,
 m.nombre AS nombre_material,
 SUM(CASE WHEN i.operacion = 'IN' THEN i.peso_kg ELSE 0 END) AS total_entradas_kg
FROM inventario AS i
JOIN puntos_eca AS pe ON pe.id = i.punto_eca_id
JOIN materiales AS m ON m.id = i.material_id
GROUP BY pe.nombre, m.nombre;

-- 3. Salidas de material por punto eca
CREATE VIEW vista_salidas_materiales AS
SELECT 
 pe.nombre AS nombre_punto_eca,
 m.nombre AS nombre_material,
 SUM(CASE WHEN i.operacion = 'OUT' THEN i.peso_kg ELSE 0 END) AS total_salidas_kg
FROM inventario AS i
JOIN puntos_eca AS pe ON pe.id = i.punto_eca_id
JOIN materiales AS m ON m.id = i.material_id
GROUP BY pe.nombre, m.nombre;

-- 4. Stock disponible
	CREATE VIEW vista_stock_material AS
	SELECT 
	 e.nombre_punto_eca AS punto_eca,
	 e.nombre_material AS material,
	 e.total_entradas_kg AS total_entradas_kg,
	 s.total_salidas_kg AS total_salidas_kg,
	 e.total_entradas_kg - s.total_salidas_kg AS stock_actual_kg
	FROM vista_entradas_materiales AS e
	JOIN vista_salidas_materiales AS s
	 ON s.nombre_punto_eca = e.nombre_punto_eca
	 AND s.nombre_material = e.nombre_material;

-- 5. Muestra las publicaciones guardadas en favoritos por usuario
CREATE VIEW vista_favoritos_publicaciones AS
SELECT 
 CONCAT(u.nombre,' ',u.apellido) AS nombre_usuario,
 p.titulo      AS titulo_publicacion
FROM favoritos AS f
JOIN usuarios  AS u ON u.id = f.usuario_id
JOIN publicaciones AS p ON p.id = f.publicacion_id
WHERE u.rol = 'Ciudadano';

-- 6. Muestra los comentarios con la información del autor
CREATE VIEW vista_comentarios_autor AS
SELECT 
 CONCAT(u.nombre,' ',u.apellido) AS nombre_autor,
 p.titulo    AS titulo_publicacion,
 c.contenido AS texto_comentario,
 c.creado    AS fecha_comentario
FROM comentarios AS c
JOIN usuarios  AS u ON u.id = c.usuario_id
JOIN publicaciones AS p ON p.id = c.publicacion_id;

-- 7. Lista de puntos eca con sus datos ordenados por localidad y ciudad
CREATE VIEW vista_puntos_eca_por_ubicacion AS
SELECT 
 c.nombre AS nombre_ciudad,
 l.nombre AS nombre_localidad,
 pe.nombre AS nombre_punto_eca,
 pe.direccion AS direccion_estacion
FROM puntos_eca AS pe
JOIN localidades AS l ON l.id = pe.localidad_id
JOIN ciudades  AS c ON c.id = pe.ciudad_id
ORDER BY c.nombre, l.nombre;

-- 8. Listar todos los gestores eca con su punto eca y datos de contacto
CREATE VIEW vista_gestores_eca_con_punto AS
SELECT 
 CONCAT(u.nombre,' ',u.apellido) AS nombre_gestor,
 pe.nombre      AS nombre_punto_eca,
 pe.direccion   AS direccion_estacion,
 pe.telefono    AS telefono_estacion
FROM usuarios  AS u
JOIN puntos_eca AS pe ON pe.gestor_id = u.id
WHERE u.rol = 'GestorECA';

-- 9. Listar los puntos eca ordenados por materiales que recicla
CREATE VIEW vista_puntos_eca_materiales AS
SELECT 
 pe.nombre AS nombre_punto_eca,
 m.nombre AS nombre_material
FROM puntos_eca    AS pe
JOIN capacidad_material_punto_eca  AS cmpe ON cmpe.punto_eca_id = pe.id
JOIN materiales     AS m ON m.id = cmpe.material_id
GROUP BY pe.nombre, m.nombre;


CREATE VIEW view_gestor_punto_detalle AS
SELECT
pe.nombreAS nombre_punto,
pe.direcciónAS dirección,
ci.nombre AS ciudad,
lo.nombre AS localidad,
m.nombreAS nombre_material,
cm.stock_actual_kgAS stock_actual_kg,
cm.capacidad_máxima_kgAS capacidad_máxima_kg,
cm.umbral_pct AS umbral_pct,
ROUND(cm.stock_actual_kg/NULLIF(cm.capacidad_máxima_kg,0)*100,2) AS porcentaje_uso,
cm.precio_kgAS precio_kg,

(SELECT inv.operación
 FROM inventario AS inv
WHERE inv.id_punto_eca = pe.id
AND inv.id_material= cm.id_material
ORDER BY inv.fecha_registro DESC
LIMIT 1)AS última_operación,

(SELECT inv.peso_kg
 FROM inventario AS inv
WHERE inv.id_punto_eca = pe.id
AND inv.id_material= cm.id_material
ORDER BY inv.fecha_registro DESC
LIMIT 1)AS peso_última_operación_kg,
(SELECT inv.fecha_registro
 FROM inventario AS inv
WHERE inv.id_punto_eca = pe.id
AND inv.id_material= cm.id_material
ORDER BY inv.fecha_registro DESC
LIMIT 1)AS fecha_última_operación
FROM puntos_eca AS pe
JOIN capacidad_material_eca AS cmON cm.id_punto_eca = pe.id
JOIN materiales AS m ON m.id = cm.id_material
JOIN ciudades AS ciON ci.id= pe.id_ciudad
JOIN localidadesAS loON lo.id= pe.id_localidad;

CREATE VIEW view_gestor_movimientos_recientes AS
SELECT
CONCAT(u.nombre, ' ', u.apellido) AS nombre_gestor,
p.nombre AS nombre_punto,
m.nombre AS nombre_material,
i.operación AS operación,
i.peso_kg AS peso_kg,
i.fecha_registroAS fecha_registro,
pr.nombre AS proveedor
FROM inventarioAS i
JOIN puntos_ecaAS pON i.id_punto_eca= p.id
JOIN perfiles_ecaAS pe ON pe.id_punto_eca = p.id
JOIN usuariosAS uON u.id = pe.id_usuario
JOIN materialesAS mON m.id = i.id_material
LEFT JOIN proveedores AS pr ON pr.id= i.id_proveedor;

CREATE VIEW view_ciudadano_puntos_por_localidad AS
SELECT
pe.nombre AS nombre_punto,
pe.dirección AS dirección,
ci.nombre AS ciudad,
lo.nombre AS localidad,
m.nombre AS nombre_material,
cm.stock_actual_kg AS stock_actual_kg,
cm.capacidad_máxima_kg AS capacidad_máxima_kg,
(cm.capacidad_máxima_kg - cm.stock_actual_kg)AS espacio_disponible_kg,
ROUND(cm.stock_actual_kg/NULLIF(cm.capacidad_máxima_kg,0)*100,2)
 AS porcentaje_uso,
cm.precio_kg AS precio_kg
FROM puntos_ecaAS pe
JOIN ciudadesAS ciON ci.id= pe.id_ciudad
JOIN localidades AS loON lo.id= pe.id_localidad
JOIN capacidad_material_eca AS cm ON cm.id_punto_eca= pe.id
JOIN materialesAS m ON m.id = cm.id_material
WHERE cm.stock_actual_kg < cm.capacidad_máxima_kg
;



-- TRIGGERS


-- actualiza la capacidad del inventario

-- 1. Suma las entradas de inventario
CREATE TRIGGER trg_entrada_inventario 
AFTER INSERT ON inventario
FOR EACH ROW
BEGIN
	if new.operacion = 'IN' then
 UPDATE capacidad_material_punto_eca
 SET capacidad_nueva = capacidad_nueva + NEW.peso_kg , actualizado = NEW.leido
	WHERE material_id = NEW.material_id
	AND punto_eca_id = NEW.punto_eca_id;
	END IF;
END;

-- 2. Resta las salidas de inventario
DELIMITER //
CREATE TRIGGER trg_salida_inventory
AFTER INSERT ON inventario
FOR EACH ROW
BEGIN
 IF NEW.operacion = 'out' THEN
 UPDATE capacidad_material_punto_eca
 SET 
  capacidad_nueva = capacidad_nueva - NEW.peso_kg,
  actualizado = NEW.leido
 WHERE 
  material_id = NEW.material_id
  AND punto_eca_id = NEW.punto_eca_id;
 END IF;
END
DELIMITER 

-- 3. Guarda la fecha de registro
DELIMITER //
CREATE TRIGGER fechaRegistroUsuario AFTER INSERT ON usuarios FOR EACH ROW
BEGIN
	UPDATE usuarios 
	set creado = now();
END //
DELIMITER

-- 4. Enlaza id usuario con id ciudadano
DELIMITER //
CREATE TRIGGER trg_después_insertar_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN
 IF NEW.rol = 'Ciudadano' THEN
 INSERT INTO perfiles_ciudadano (usuario_id, recibir_carta_noticias)
 VALUES (NEW.id, FALSE);
 END IF;
END
DELIMITER


-- 5. Cuando se actualize una publicacion esta inserte la fecha de actualizacion
DELIMITER //
CREATE TRIGGER trg_actualiza_fecha
BEFORE UPDATE ON publicaciones
FOR EACH ROW
BEGIN
 SET NEW.creado = NOW();
END ;
DELIMITER 

-- 6. al borrar una publicacion borra los registros de comentarios y favoritos
DELIMITER //
CREATE TRIGGER trg_despues_eliminar_publicacion AFTER DELETE ON publicaciones FOR EACH ROW
BEGIN 
	DELETE FROM favoritos
	where publicacion_id = old.id; 
	
	DELETE FROM comentarios 
	where publicacion_id = old.id;
END ;
DELIMITER ;


-- Procedimientos

-- 1. Registrar una entrada o salida en inventario

DELIMITER $$
CREATE PROCEDURE sp_registrar_inventario(
  IN p_eca_point_id  INT,
  IN p_material_id   INT,
  IN p_weight_kg     DECIMAL(10,2),
  IN p_operation     ENUM('IN','OUT'),
  IN p_read_at       DATETIME
)
BEGIN
  INSERT INTO inventory
    (eca_point_id, material_id, weight_kg, operation, read_at, recorded_at)
  VALUES
    (p_eca_point_id, p_material_id, p_weight_kg, p_operation, p_read_at, NOW());
END$$
DELIMITER ;	

-- 2. Consultar stock actual por material en un punto ECA
DELIMITER $$
CREATE PROCEDURE sp_consultar_stock(
 IN p_eca_point_id INT
)
BEGIN
 SELECT
 m.name  AS nombre_material,
 emc.capacity_now AS stock_actual_kg
 FROM eca_material_capacity AS emc
 JOIN materials    AS m
 ON m.id = emc.material_id
 WHERE emc.eca_point_id = p_eca_point_id;
END $$
DELIMITER ;

-- 4. Registrar una nueva publicación

DELIMITER $$
CREATE PROCEDURE sp_agregar_publicacion(
 IN p_user_id INT,
 IN p_tipo_publicacion_id INT,
 IN p_titulo VARCHAR(255),
 IN p_contenido TEXT,
 IN p_fecha_creacion DATETIME,
 IN p_fecha_actualizacion DATETIME
)
BEGIN
 INSERT INTO publications
 (author_id, type_id, title, body, created_at, update_at)
 VALUES
 (p_user_id, p_tipo_publicacion_id, p_titulo, p_contenido, p_fecha_creacion, p_fecha_actualizacion);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_filtrar_puntos_por_localidad_material(
  IN p_id_localidad INT,
  IN p_id_material  INT
)
BEGIN
  SELECT
    p.nombre                                         AS nombre_punto,
    p.dirección                                       AS dirección,
    m.nombre                                          AS nombre_material,
    cm.stock_actual_kg                                AS stock_actual_kg,
    cm.capacidad_máxima_kg                            AS capacidad_máxima_kg,
    (cm.capacidad_máxima_kg - cm.stock_actual_kg)     AS espacio_disponible_kg,
    ROUND(cm.stock_actual_kg/NULLIF(cm.capacidad_máxima_kg,0)*100,2) AS porcentaje_uso,
    cm.precio_kg                                      AS precio_kg
  FROM puntos_eca         AS p
  JOIN capacidad_material_eca AS cm
    ON cm.id_punto_eca = p.id
   AND cm.id_material  = p_id_material
  JOIN materiales           AS m
    ON m.id            = cm.id_material
  WHERE p.id_localidad      = p_id_localidad
    AND cm.stock_actual_kg < cm.capacidad_máxima_kg
  ORDER BY espacio_disponible_kg DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_crear_publicacion_notificar(
  IN p_autor_id           INT,
  IN p_tipo_publicacion   INT,
  IN p_titulo             VARCHAR(150),
  IN p_resumen            TEXT,
  IN p_cuerpo             TEXT,
  IN p_url_media          VARCHAR(255)
)
BEGIN
  DECLARE v_id_publicacion INT;
  INSERT INTO publicaciones (
    id_autor,
    id_tipo,
    titulo,
    resumen,
    cuerpo,
    url_media,
    fecha_publicacion
  ) VALUES (
    p_autor_id,
    p_tipo_publicacion,
    p_titulo,
    p_resumen,
    p_cuerpo,
    p_url_media,
    NOW()
  );
  SET v_id_publicacion = LAST_INSERT_ID();
  INSERT INTO notificaciones (
    id_usuario,
    tipo,
    id_referencia
  )
  SELECT
    pc.id_usuario,
    'NEW_PUBLICATION',
    v_id_publicacion
  FROM perfiles_ciudadano AS pc
  WHERE pc.recibe_notificaciones = TRUE;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_reporte_material_acumulado(
  IN p_punto_ecologico INT,
  IN p_fecha_inicio   DATETIME,
  IN p_fecha_fin      DATETIME
)
BEGIN

  SELECT
    m.nombre                                                           AS nombre_material,
    COALESCE(SUM(CASE WHEN i.operación = 'IN'  THEN i.peso_kg END), 0)  AS total_entrada_kg,
    COALESCE(SUM(CASE WHEN i.operación = 'OUT' THEN i.peso_kg END), 0)  AS total_salida_kg,
    COALESCE(SUM(
      CASE
        WHEN i.operación = 'IN'  THEN i.peso_kg
        WHEN i.operación = 'OUT' THEN -i.peso_kg
      END
    ), 0)                                                               AS neto_kg
  FROM inventario AS i
  JOIN materiales AS m
    ON m.id = i.id_material
  WHERE i.id_punto_ecologico = p_punto_ecologico
    AND i.fecha_registro BETWEEN p_fecha_inicio AND p_fecha_fin
  GROUP BY m.nombre
  ORDER BY m.nombre;
END$$
DELIMITER ;







