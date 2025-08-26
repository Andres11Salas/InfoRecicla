### AJUSTES BASE DE DATOS

# 1.REGISTROS

- # TABLA USUARIOS

  # Agregar los campos: 

      - tipo de documento
      - numero de documento
      - telefono
      - recibe notificaciones boolean NOT NULL default true
      - fecha de nacimiento
      - direccion
      - avatar url
      - nombre de usuario
      - genero 
      - localidad


  # Crear tablas para normalizar:

      - tabla guardados: para los puntos y las publicaciones marcadas
                          - id
                          - usuario
                          - tipo enum (publicacion, punto eca)
                          - referencia id (id de la publicacion o punto eca)
                          - creado fecha

# TABLA PUNTOS_ECA

  # Agregar los campos: 

      - nit (20)
      - horario atencion
      - sitio web
      - logo url
      - foto url
      - mostrar mapa BOOLEAN NOT NULL DEFAULT TRUE

# TABLA PUBLICACIONES

  # Crear tablas para normalizar:

      - categorias publicaciones

      - publicaciones multimedia : donde se guardaran videos imagenes para las publicaciones

                                  - id 
                                  - publicacion id
                                  - tipo enum (imagen, video, documento, enlace)
                                  - url
                                  - titulo
                                  - descripcion

      - tabla para etiquetas 

      - crear la tabla votos con : 
                                  - tipo enum(publicacion, punto eca)
                                  - referencia id
                                  - usuario
                                  - valor enum('like','dislike')
                                  - creado - fecha
      - crear la tabla comentarios :
                                  - tipo enum(publicacion, punto eca)
                                  - referencia id
                                  - usuario
                                  - texto
                                  - creado
# TABLA MATERIALES
  # Agregar los campos: 
                        - tipo
                        - categoria
                        - imagen url
                        - precio compra
                        - precio venta
  # Crear tablas para normalizar:
                        - tipo / tipo de material
                        - categoria / del material ej: pet - plastico - etc

# TABLA INVENTARIO
  # Agregar los campos: 
                        - stokc actual
                        - umbral alerta 
                        - umbral critico
  # Crear tablas para normalizar:
                        - tabla compras : - id
                                          - inventario id
                                          - fecha
                                          - kg
                                          - precio unit
                        
                        - tabla salidas : - id
                                          - inventario id
                                          - fecha
                                          - kg
                                          - centro-acopio id
                        - tabla despachos (donde se guardara los dias de despacho de material) :
                                          - id 
                                          - inventario id
                                          - centro-acopio id
                                          - fecha
                                          - hora
                                          - frecuencia enum(manual, semanal, quincenal, mensual, unico,) default manual
                                        
# TABLA PROVEEDORES

- Catálogo global precargado (visible para todos).

- Registros privados creados por cada Punto ECA (solo visibles para ese punto).

- Datos de contacto y ubicación.

- Auditoría (creado/actualizado).

CREATE TABLE proveedores (
  id                INT AUTO_INCREMENT PRIMARY KEY,

  -- Identidad y clasificación
 
  nombre            VARCHAR(150)   NOT NULL,
  tipo              ENUM('Centro de acopio','Proveedor') NOT NULL,
  nit               VARCHAR(20)    NULL,          -- si aplica

  -- Visibilidad / alcance
  alcance           ENUM('global','eca') NOT NULL DEFAULT 'global',
  owner_punto_eca_id INT NULL,  -- cuando alcance='eca', es el ID del punto ECA dueño/creador

  -- Contacto
  contacto          VARCHAR(100)  NULL,
  telefono          VARCHAR(20)   NULL,
  email             VARCHAR(120)  NULL,
  direccion         VARCHAR(200)  NULL,

  -- Ubicación (si la manejas)
  ciudad_id         INT NULL,
  localidad_id      INT NULL,
  latitud           DECIMAL(10,6) NULL,
  longitud          DECIMAL(10,6) NULL,

  -- Operación
  estado            ENUM('activo','inactivo','bloqueado') NOT NULL DEFAULT 'activo',
  notas             VARCHAR(300)  NULL,

  -- Auditoría
  creado            DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Reglas de integridad
  CONSTRAINT fk_prov_owner_eca
    FOREIGN KEY (owner_punto_eca_id) REFERENCES puntos_eca(id),

  -- Índices
  INDEX idx_prov_tipo (tipo),
  INDEX idx_prov_estado (estado),
  INDEX idx_prov_ciudad (ciudad_id),
  INDEX idx_prov_localidad (localidad_id),

  -- Evitar duplicados dentro del mismo alcance
  UNIQUE KEY uq_proveedor_scoped (nombre, tipo, alcance, owner_punto_eca_id)
);


Cómo funciona el “alcance”

alcance='global' + owner_punto_eca_id=NULL → precargados por el admin; los ve todo el mundo.

alcance='eca' + owner_punto_eca_id={id} → creados por un Punto ECA; solo los ve ese Punto ECA.

- Consulta típica para listar lo que ve un Punto ECA (ej. :ecaId):
  
  SELECT *
FROM proveedores
WHERE estado='activo' AND (
  alcance='global'
  OR (alcance='eca' AND owner_punto_eca_id = :ecaId)
)
ORDER BY nombre;

# Relacionar materiales aceptados

- Si quieres mostrar/filtrar proveedores por material: