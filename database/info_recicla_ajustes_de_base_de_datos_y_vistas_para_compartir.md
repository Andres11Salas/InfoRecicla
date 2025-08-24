# InfoRecicla — Propuesta integral de ajustes (BD + Vistas)

**Objetivo:** Alinear el modelo de datos y las vistas nuevas (registro ciudadano/ECA, publicaciones, mapa, chats, panel de gestión) para soportar las funcionalidades actuales y futuras.

---

## 1) Cuentas y perfiles

**Cambios clave**
- `usuarios`
  - `recibir_notificaciones TINYINT(1) DEFAULT 1`
  - `email_verificado_at DATETIME NULL`
  - `ultimo_acceso_at DATETIME NULL`
  - `estado ENUM('activo','suspendido','pendiente') DEFAULT 'activo'`
  - Índice único: `UNIQUE (correo)`
- `perfiles_ciudadano`
  - Normalizar ubicación: `ciudad_id INT NULL`, `localidad_id INT NULL` (FK a `ciudades`/`localidades`)

**SQL guía**
```sql
ALTER TABLE usuarios
  ADD UNIQUE KEY uq_usuarios_correo (correo),
  ADD COLUMN recibir_notificaciones TINYINT(1) NOT NULL DEFAULT 1 AFTER apellido,
  ADD COLUMN email_verificado_at DATETIME NULL AFTER creado,
  ADD COLUMN ultimo_acceso_at DATETIME NULL AFTER email_verificado_at,
  ADD COLUMN estado ENUM('activo','suspendido','pendiente') NOT NULL DEFAULT 'activo' AFTER ultimo_acceso_at;

ALTER TABLE perfiles_ciudadano
  ADD COLUMN ciudad_id INT NULL,
  ADD COLUMN localidad_id INT NULL,
  ADD CONSTRAINT fk_pc_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
  ADD CONSTRAINT fk_pc_localidad FOREIGN KEY (localidad_id) REFERENCES localidades(id);
```

**Endpoints sugeridos**
- `GET /api/citizens/me` (perfil + preferencias)
- `PATCH /api/citizens/profile` (nombre, email, localidad, avatar)
- `PATCH /api/citizens/preferences` (notificaciones)

---

## 2) Registro y gestión de Puntos ECA

**Cambios clave**
- `puntos_eca`
  - `estado_aprobacion ENUM('pendiente','aprobado','rechazado') DEFAULT 'pendiente'`
  - `mostrar_en_mapa TINYINT(1) DEFAULT 1`
  - `horario_atencion VARCHAR(255) NULL`
  - `web_url VARCHAR(255) NULL`, `logo_url VARCHAR(255) NULL`, `nit VARCHAR(20) NULL`
  - `correo_contacto VARCHAR(100) NULL`, `telefono_contacto VARCHAR(20) NULL`
  - Índices: `(ciudad_id, localidad_id)` y `(latitud, longitud)`

**SQL guía**
```sql
ALTER TABLE puntos_eca
  ADD COLUMN estado_aprobacion ENUM('pendiente','aprobado','rechazado') NOT NULL DEFAULT 'pendiente' AFTER telefono,
  ADD COLUMN mostrar_en_mapa TINYINT(1) NOT NULL DEFAULT 1 AFTER estado_aprobacion,
  ADD COLUMN horario_atencion VARCHAR(255) NULL AFTER mostrar_en_mapa,
  ADD COLUMN web_url VARCHAR(255) NULL AFTER horario_atencion,
  ADD COLUMN logo_url VARCHAR(255) NULL AFTER web_url,
  ADD COLUMN nit VARCHAR(20) NULL AFTER logo_url,
  ADD COLUMN correo_contacto VARCHAR(100) NULL AFTER nit,
  ADD COLUMN telefono_contacto VARCHAR(20) NULL AFTER correo_contacto,
  ADD KEY idx_peca_ciudad_localidad (ciudad_id, localidad_id),
  ADD KEY idx_peca_lat_lng (latitud, longitud);
```

**Endpoints sugeridos**
- `GET /api/eca/points?city=Bogota&localidad=...` (lista para la vista + mapa)
- `GET /api/eca/{id}` (detalle para modal)
- `PATCH /api/eca/{id}` (perfil ECA)
- `GET /api/eca/{id}/capacity` y `GET /api/eca/{id}/inventory`

**Futuro (opcional)**
- `horarios_eca (punto_eca_id, dia_semana, abre, cierra, observacion)` si se requiere “abierto ahora”.

---

## 3) Publicaciones (medios mixtos, likes/dislikes, comentarios)

**Nuevas tablas/campos**
- `reacciones_publicacion`
  - (publicacion_id, usuario_id, valor {-1,1}), `UNIQUE (publicacion_id, usuario_id)`
- `publicacion_medios`
  - Soporta `imagen`, `documento`, `video`, `enlace` con `orden`
- `publicaciones`
  - `likes_count INT DEFAULT 0`, `dislikes_count INT DEFAULT 0`, `slug VARCHAR(180) UNIQUE`

**SQL guía**
```sql
CREATE TABLE reacciones_publicacion (
  id INT AUTO_INCREMENT PRIMARY KEY,
  publicacion_id INT NOT NULL,
  usuario_id INT NOT NULL,
  valor TINYINT NOT NULL, -- -1 dislike, 1 like
  creado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_pub_user (publicacion_id, usuario_id),
  CONSTRAINT fk_rp_pub FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id),
  CONSTRAINT fk_rp_usr FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

ALTER TABLE publicaciones
  ADD COLUMN likes_count INT NOT NULL DEFAULT 0,
  ADD COLUMN dislikes_count INT NOT NULL DEFAULT 0,
  ADD COLUMN slug VARCHAR(180) NULL UNIQUE;

CREATE TABLE publicacion_medios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  publicacion_id INT NOT NULL,
  tipo ENUM('imagen','documento','video','enlace') NOT NULL,
  url VARCHAR(255) NOT NULL,
  titulo VARCHAR(150) NULL,
  orden SMALLINT NOT NULL DEFAULT 0,
  CONSTRAINT fk_pm_pub FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id)
);
```

**Endpoints sugeridos**
- `GET /api/news/featured` (carrusel)
- `GET /api/news?category=...` (listados por categoría)
- `GET /api/posts/{id}` (incluye `medios` y conteos)
- `GET /api/posts/{id}/comments`
- `POST /api/posts/{id}/comments`
- `POST /api/posts/{id}/vote {value: 1|-1}` (actualiza `reacciones_publicacion` + triggers para conteos)

**Triggers (opcional)**
- `AFTER INSERT/UPDATE/DELETE` en `reacciones_publicacion` para recalcular `likes_count` y `dislikes_count` en `publicaciones`.

---

## 4) Mensajería (chats ciudadano–ECA)

**Ajustes**
- `conversaciones`
  - `ultimo_mensaje_at DATETIME NULL`
  - `cerrada TINYINT(1) DEFAULT 0`
  - `tema VARCHAR(150) NULL`
  - Índices: `(usuario_eca_id, ultimo_mensaje_at)` y `(usuario_ciudadano_id, ultimo_mensaje_at)`
- `mensajes_adjuntos` (si se permitirán imágenes/documentos)

**SQL guía**
```sql
ALTER TABLE conversaciones
  ADD COLUMN ultimo_mensaje_at DATETIME NULL,
  ADD COLUMN cerrada TINYINT(1) NOT NULL DEFAULT 0,
  ADD COLUMN tema VARCHAR(150) NULL,
  ADD KEY idx_conv_eca (usuario_eca_id, ultimo_mensaje_at),
  ADD KEY idx_conv_ciud (usuario_ciudadano_id, ultimo_mensaje_at);

CREATE TABLE mensajes_adjuntos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mensaje_id INT NOT NULL,
  tipo ENUM('imagen','documento') NOT NULL,
  url VARCHAR(255) NOT NULL,
  peso_bytes INT NULL,
  CONSTRAINT fk_ma_msg FOREIGN KEY (mensaje_id) REFERENCES mensajes(id)
);
```

**Endpoints sugeridos**
- `GET /api/conversations?role=citizen|eca`
- `GET /api/conversations/{id}`
- `GET /api/conversations/{id}/messages`
- `POST /api/conversations/{id}/messages`
- `PATCH /api/messages/{id}/read`

---

## 5) Notificaciones

**Granularidad por tipo**
- `preferencias_notificacion (usuario_id, tipo_id, enabled)`

**SQL guía**
```sql
CREATE TABLE preferencias_notificacion (
  usuario_id INT NOT NULL,
  tipo_id INT NOT NULL,
  enabled TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (usuario_id, tipo_id),
  CONSTRAINT fk_pn_usr FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  CONSTRAINT fk_pn_tipo FOREIGN KEY (tipo_id) REFERENCES tipos_notificacion(id)
);
```

**Eventos generadores (ejemplos)**
- Nueva publicación en categoría seguida.
- Nuevo mensaje en conversación.
- `puntos_eca.estado_aprobacion` cambia a `aprobado`.

---

## 6) Mapa y operación

**Actual**: catálogos `ciudades`, `localidades`, `materiales`, `tipos_material`, `capacidad_material_punto_eca`, `inventario`, `programacion_recoleccion`.

**Sugerencias**
- (Futuro) `horarios_eca` normalizado si se requiere cálculo de “abierto ahora”.
- Índices ya propuestos para mapa/filtrado.

---

## 7) Vistas y funcionalidades pendientes o por afinar

- **Gestión ECA** (pestañas unificadas): perfil del punto, inventario/capacidades, mensajería, publicaciones del punto.
- **Mapa**: endpoint de listado/filtrado; mostrar badge de `pendiente/aprobado`.
- **Publicaciones**: UI para adjuntar `publicacion_medios` (imagen/doc/video/enlace) al crear/editar.
- **Ciudadano**: preferencias de notificación (global + por tipo).
- **Backoffice**: moderación de comentarios; aprobación de puntos ECA; gestión de categorías.
- **Accesibilidad**: textos alternativos y foco en modales.

---

## 8) Matriz rápida de endpoints por rol

**Ciudadano**
- Ver/editar perfil; ver guardados; comentar y votar publicaciones; conversar con ECA; gestionar preferencias.

**Gestor ECA**
- Editar punto; gestionar inventario/capacidades; responder mensajes; publicar contenidos del punto.

**Administrador**
- Aprobar/rechazar puntos; gestionar categorías/tipos; ver reportes; moderar contenidos/comentarios.

---

## 9) Roadmap sugerido (orden de implementación)
1. ALTERs de `usuarios` y `puntos_eca` + endpoints de lectura (impactan mapa y registro).
2. Reacciones y medios en publicaciones (+ endpoints y triggers).
3. Mensajería: `ultimo_mensaje_at`, índices y adjuntos.
4. Preferencias de notificación por tipo.
5. Horarios normalizados (si se requiere lógica de apertura).

---

### Notas finales
- Mantener **contraseñas en hash** y tokens fuera de BD.
- Añadir **índices** donde haya filtros/joins frecuentes.
- Validar **FKs** en los `INSERT/DELETE` actuales.
- Registrar **migraciones** en un changelog para despliegues.


