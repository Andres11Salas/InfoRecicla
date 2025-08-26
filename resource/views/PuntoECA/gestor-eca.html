<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>InfoRecicla — Gestor ECA (Unificado)</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f6faf7
    }

    .card-hover {
      transition: transform .2s ease, box-shadow .2s ease
    }

    .card-hover:hover {
      transform: translateY(-2px);
      box-shadow: 0 .75rem 1rem rgba(0, 0, 0, .08)
    }

    .badge-soft {
      background: #19875414;
      border: 1px solid #19875433;
      color: #198754
    }

    .material-thumb {
      width: 64px;
      height: 64px;
      object-fit: cover;
      border-radius: .5rem
    }

    .table-sm td,
    .table-sm th {
      vertical-align: middle
    }

    .calendar .grid {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 4px
    }

    .calendar .day {
      min-height: 90px;
      background: #fff;
      border: 1px solid #e9ecef;
      border-radius: .5rem;
      padding: .5rem
    }

    .calendar .event {
      display: block;
      font-size: .75rem;
      background: #e7f7ee;
      border: 1px solid #cceedd;
      border-radius: .25rem;
      padding: .1rem .25rem;
      margin: .15rem 0;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis
    }

    .calendar .day.today {
      outline: 2px solid #198754
    }

    .sidebar-threads {
      max-height: 60vh;
      overflow: auto
    }

    .chat-window {
      height: 50vh;
      overflow: auto;
      background: #fff;
      border: 1px solid #e9ecef;
      border-radius: .5rem;
      padding: 1rem
    }

    .message {
      max-width: 80%;
      padding: .5rem .75rem;
      border-radius: .5rem;
      margin-bottom: .5rem
    }

    .message.user {
      background: #e9f7ef;
      align-self: flex-start
    }

    .message.eca {
      background: #e7f1ff;
      align-self: flex-end;
      margin-left: auto
    }

    .progress.compact {
      height: .6rem
    }

    /* Tabs verdes con texto blanco */
    .nav-tabs .nav-link {
      background-color: #198754;
      /* verde Bootstrap */
      color: #fff;
      /* letras blancas */
      border: 1px solid #198754;
      margin-right: 4px;
    }

    .nav-tabs .nav-link:hover {
      background-color: #157347;
      /* un verde más oscuro al pasar el mouse */
      color: #fff;
    }

    .nav-tabs .nav-link.active {
      background-color: #145c32;
      /* verde más fuerte para la activa */
      color: #fff;
      border-color: #145c32;
    }

    /* Estado normal (no activo): texto verde, fondo claro */
.nav-pills .nav-link {
  color: #198754;        /* verde Bootstrap */
  background-color: transparent;
  border: 1px solid transparent;
}

/* Hover: fondo verde muy suave */
.nav-pills .nav-link:hover {
  background-color: #d1e7dd;  /* verde claro Bootstrap */
  color: #198754;
}

/* Estado activo: fondo verde, texto blanco */
.nav-pills .nav-link.active {
  color: #fff;
  background-color: #198754;  /* verde Bootstrap */
  border-color: #198754;
}

  </style>
</head>

<body>

  <!-- NAVBAR -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center gap-2" href="/">
        <img src="/imagenes/logo.png" alt="Logo InfoRecicla" width="90" height="90" class="rounded">
        <span class="fs-1 fw-semibold">InfoRecicla</span>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav" aria-controls="nav"
        aria-expanded="false" aria-label="Alternar navegación">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div id="nav" class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto align-items-lg-center gap-2">
          <li class="nav-item"><a class="nav-link" href="/publicaciones">Publicaciones</a></li>
          <li class="nav-item"><a class="nav-link" href="/mapa">Mapa ECA</a></li>
          <li class="nav-item"><a class="btn btn-light text-success fw-semibold" href="/">Salir</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <main class="container my-4">
    <!-- TABS PRINCIPALES -->
    <ul class="nav nav-pills" id="mainTabs" role="tablist">
      <li class="nav-item" role="presentation"><button class="nav-link active" data-bs-toggle="tab"
          data-bs-target="#tab-panel" type="button">Resumen</button></li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-perfil" type="button">
          Perfil
        </button>
      </li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-materiales" type="button">Materiales</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-historial" type="button">Historial</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-calendario" type="button">Calendario</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-proveedores" type="button">Centros/Proveedores</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-conversaciones" type="button">Conversaciones</button></li>
      <li class="nav-item" role="presentation"><button class="nav-link" data-bs-toggle="tab"
          data-bs-target="#tab-config" type="button">Configuración</button></li>
    </ul>

    <div class="tab-content pt-3">

      <!-- RESUMEN -->
      <section class="tab-pane fade show active" id="tab-panel">
        <div class="row g-3">
          <div class="col-md-3">
            <div class="card card-hover">
              <div class="card-body">
                <div class="text-muted small">Inventario total (kg)</div>
                <div class="h4 mb-0" id="kpiInventario">—</div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-hover">
              <div class="card-body">
                <div class="text-muted small">Entradas mes (kg)</div>
                <div class="h4 mb-0" id="kpiEntradasMes">—</div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-hover">
              <div class="card-body">
                <div class="text-muted small">Salidas mes (kg)</div>
                <div class="h4 mb-0" id="kpiSalidasMes">—</div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card card-hover">
              <div class="card-body">
                <div class="text-muted small">Próximo despacho</div>
                <div class="h6 mb-0" id="kpiProximoDespacho">—</div>
              </div>
            </div>
          </div>
        </div>
        <div class="card card-hover mt-3">
          <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <strong>Alertas de capacidad / umbrales</strong>
            <span class="badge badge-soft" id="alertCount">0</span>
          </div>
          <div class="card-body">
            <div id="alertList" class="vstack gap-2 small text-muted">Sin alertas.</div>
          </div>
        </div>
      </section>

      <section class="tab-pane fade" id="tab-perfil">
        <div class="row g-4">
          <!-- ===== SUBMÓDULO: Datos del Encargado ===== -->
          <div class="col-lg-6">
            <div class="card card-hover">
              <div class="card-body">
                <h5 class="mb-3">Encargado</h5>

                <!-- Foto del encargado (opcional) -->
                <div class="d-flex align-items-center gap-3 mb-3">
                  <img id="previewPerfil" src="../images/perfil_default.png" alt="Foto encargado"
                    class="rounded-circle img-thumbnail" style="width:96px;height:96px;object-fit:cover;">
                  <div class="flex-grow-1">
                    <div class="small text-muted">Foto (opcional)</div>
                    <input class="form-control form-control-sm" type="file" id="fotoPerfil" accept="image/*">
                  </div>
                </div>

                <!-- Form datos del encargado -->
                <form id="formEncargado" class="row g-3">
                  <div class="col-12 col-md-6">
                    <label class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="mgrNombre" placeholder="—">
                  </div>
                  <div class="col-12 col-md-6">
                    <label class="form-label">Teléfono</label>
                    <input type="tel" class="form-control" id="mgrTelefono" placeholder="—">
                  </div>
                  <div class="col-12">
                    <label class="form-label">Correo</label>
                    <input type="email" class="form-control" id="mgrEmail" placeholder="—">
                  </div>
                </form>
              </div>
            </div>
          </div>

          <!-- ===== SUBMÓDULO: Datos del Punto ECA ===== -->
          <div class="col-lg-6">
            <div class="card card-hover">
              <div class="card-body">
                <h5 class="mb-3">Punto ECA</h5>

                <!-- Foto del punto (opcional) -->
                <div class="d-flex align-items-center gap-3 mb-3">
                  <img id="previewPunto" src="../images/eca-default.png" alt="Foto punto" class="img-thumbnail rounded"
                    style="width:140px;height:100px;object-fit:cover;">
                  <div class="flex-grow-1">
                    <div class="small text-muted">Foto (opcional)</div>
                    <input class="form-control form-control-sm" type="file" id="fotoPunto" accept="image/*">
                  </div>
                </div>

                <!-- Form datos del punto -->
                <form id="formPunto" class="row g-3">
                  <div class="col-12">
                    <label class="form-label">Nombre del Punto</label>
                    <input type="text" class="form-control" id="puntoNombre" placeholder="—">
                  </div>
                  <div class="col-12">
                    <label class="form-label">Dirección</label>
                    <input type="text" class="form-control" id="puntoDireccion" placeholder="—">
                  </div>
                  <div class="col-6">
                    <label class="form-label">Ciudad</label>
                    <input type="text" class="form-control" id="puntoCiudad" placeholder="—">
                  </div>
                  <div class="col-6">
                    <label class="form-label">Localidad</label>
                    <input type="text" class="form-control" id="puntoLocalidad" placeholder="—">
                  </div>
                  <div class="col-12">
                    <label class="form-label">Coordenadas</label>
                    <div class="input-group">
                      <input type="text" class="form-control" id="puntoLatLng" placeholder="Latitud, Longitud" readonly>
                      <button class="btn btn-outline-secondary" type="button" id="btnUbicacion">Obtener
                        ubicación</button>
                    </div>
                    <div class="form-text">Usa tu ubicación del navegador para rellenar automáticamente.</div>
                  </div>
                  <div class="col-12">
                    <label class="form-label">Horario</label>
                    <input type="text" class="form-control" id="puntoHorario" placeholder="Lun–Vie 8:00–17:00">
                  </div>
                </form>

                <div class="text-end mt-3">
                  <button class="btn btn-success" id="btnGuardarPerfil">Guardar cambios</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- MATERIALES (UNIFICA INVENTARIO + REGISTRO) -->
      <section class="tab-pane fade" id="tab-materiales">
        <!-- FILTROS + CTA REGISTRO -->
        <div class="row g-2 align-items-end">
          <div class="col-md-3">
            <label class="form-label">Tipo</label>
            <select id="fTipo" class="form-select">
              <option value="">Todos</option>
              <option>Plástico</option>
              <option>Papel y cartón</option>
              <option>Vidrio</option>
              <option>Metales</option>
              <option>Orgánicos</option>
              <option>RAEE</option>
            </select>
          </div>
          <div class="col-md-3">
            <label class="form-label">Categoría</label>
            <select id="fCategoria" class="form-select">
              <option value="">Todas</option>
              <option>PET</option>
              <option>PEAD</option>
              <option>Chatarra</option>
              <option>Aluminio</option>
              <option>Botella verde</option>
              <option>Mixto</option>
            </select>
          </div>
          <div class="col-md-4">
            <label class="form-label">Buscar</label>
            <input id="fTexto" type="search" placeholder="Nombre o descripción…" class="form-control">
          </div>
          <div class="col-md-2 d-grid">
            <button id="btnNuevoMat" class="btn btn-success" data-bs-toggle="modal"
              data-bs-target="#modalRegistrarMaterial">Registrar material</button>
          </div>
        </div>

        <!-- GRID DE CARDS -->
        <div id="gridMateriales" class="row g-3 mt-1"></div>

        <!-- MODAL: REGISTRO DE MATERIAL (único método de alta) -->
        <div class="modal fade" id="modalRegistrarMaterial" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <form class="modal-content" id="formMaterial">
              <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Registrar material</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
              </div>
              <div class="modal-body">
                <div class="row g-3">
                  <div class="col-md-6"><label class="form-label">Nombre</label><input id="matNombre"
                      class="form-control" required></div>
                  <div class="col-md-3">
                    <label class="form-label">Tipo</label>
                    <select id="matTipo" class="form-select" required>
                      <option>Plástico</option>
                      <option>Papel y cartón</option>
                      <option>Vidrio</option>
                      <option>Metales</option>
                      <option>Orgánicos</option>
                      <option>RAEE</option>
                    </select>
                  </div>
                  <div class="col-md-3"><label class="form-label">Categoría</label><input id="matCategoria"
                      class="form-control" placeholder="p.ej. PET"></div>
                  <div class="col-12"><label class="form-label">Descripción</label><textarea id="matDesc"
                      class="form-control" rows="2" placeholder="Notas del material"></textarea></div>
                  <div class="col-md-4"><label class="form-label">URL de imagen (opcional)</label><input id="matImg"
                      class="form-control" placeholder="https://…"></div>
                  <div class="col-md-4"><label class="form-label">Capacidad Máx. (kg)</label><input id="matCapMax"
                      type="number" min="1" step="0.01" class="form-control" required></div>
                  <div class="col-md-4"><label class="form-label">Stock inicial (kg)</label><input id="matStock"
                      type="number" min="0" step="0.01" class="form-control" value="0"></div>

                  <!-- VISIBILIDAD de capacidad + umbrales dentro del registro -->
                  <div class="col-12">
                    <div class="p-3 border rounded">
                      <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="small text-muted">Ocupación estimada</span>
                        <span id="matOcupacionPct" class="small fw-semibold">0%</span>
                      </div>
                      <div class="progress compact">
                        <div id="matOcupacionBar" class="progress-bar" style="width:0%"></div>
                      </div>
                      <div class="row g-2 mt-2">
                        <div class="col-md-6"><label class="form-label">Umbral alerta (kg)</label><input
                            id="matUmbralKg" type="number" min="0" step="0.01" class="form-control"
                            placeholder="p.ej. 1000"></div>
                        <div class="col-md-6"><label class="form-label">Umbral crítico (kg)</label><input
                            id="matUmbralCrit" type="number" min="0" step="0.01" class="form-control"
                            placeholder="p.ej. 1200"></div>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-6"><label class="form-label">Precio compra ($/kg)</label><input
                      id="matPrecioCompra" type="number" min="0" step="0.01" class="form-control" value="0"></div>
                  <div class="col-md-6"><label class="form-label">Precio venta ($/kg)</label><input id="matPrecioVenta"
                      type="number" min="0" step="0.01" class="form-control" value="0"></div>
                </div>

                <hr class="my-3">

                <!-- DESPACHO OPCIONAL -->
                <h6 class="mb-2">Despacho (opcional)</h6>
                <div class="row g-3 align-items-end">
                  <div class="col-md-4">
                    <label class="form-label">Frecuencia</label>
                    <select id="matFreq" class="form-select">
                      <option value="manual">Manual (según necesidad)</option>
                      <option value="semanal">Semanal</option>
                      <option value="quincenal">Cada 15 días</option>
                      <option value="mensual">Mensual</option>
                    </select>
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Día (1-31 o 1-7)</label>
                    <input id="matDia" type="number" min="1" max="31" class="form-control" placeholder="p.ej. 5">
                    <div class="form-text">(1=Lunes … 7=Domingo para semanal)</div>
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Hora</label>
                    <input id="matHora" type="time" class="form-control" value="10:00">
                  </div>
                  <div class="col-md-8">
                    <label class="form-label">Centro de acopio</label>
                    <select id="matCentro" class="form-select"></select>
                  </div>
                  <div class="col-md-4 d-grid">
                    <button class="btn btn-outline-success" id="matPlanificarBtn" type="button">Plan preliminar</button>
                  </div>
                </div>
                <div class="form-text mt-2">Si defines frecuencia y centro, se crearán eventos futuros en el calendario
                  del material.</div>
              </div>
              <div class="modal-footer">
                <button class="btn btn-outline-secondary" data-bs-dismiss="modal" type="button">Cancelar</button>
                <button class="btn btn-success" type="submit">Guardar material</button>
              </div>
            </form>
          </div>
        </div>

        <!-- MODAL: Detalle del material (visualización/ampliación) -->
        <div class="modal fade" id="modalMaterial" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header bg-success text-white">
                <h5 class="modal-title"><span id="mmNombre">Material</span> <span class="badge badge-soft ms-2"
                    id="mmTipo">—</span> <span class="badge badge-soft ms-1" id="mmCategoria">—</span></h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
              </div>
              <div class="modal-body">
                <div class="row g-4">
                  <div class="col-lg-4">
                    <img id="mmImg" class="img-fluid rounded border" src="" alt="Imagen material">
                    <div class="small text-muted mt-2">Almacenamiento: <span id="mmAlmacen"></span></div>
                    <div class="small text-muted">Capacidad (kg): <span id="mmCap"></span></div>
                    <div class="small text-muted">Umbral alerta (kg): <span id="mmUmbral"></span></div>
                    <div class="small text-muted">Umbral crítico (kg): <span id="mmUmbralCrit"></span></div>
                  </div>
                  <div class="col-lg-8">
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab"
                          data-bs-target="#mm-info" type="button">Información</button></li>
                      <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#mm-despacho"
                          type="button">Despacho / Frecuencia</button></li>
                      <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#mm-historial"
                          type="button">Historial</button></li>
                    </ul>
                    <div class="tab-content border border-top-0 rounded-bottom p-3">
                      <div class="tab-pane fade show active" id="mm-info">
                        <p id="mmDesc" class="mb-2">—</p>
                        <div class="row g-3">
                          <div class="col-md-6"><label class="form-label">Precio compra (x kg)</label><input
                              id="mmPrecioCompra" type="number" class="form-control" min="0" step="0.01"></div>
                          <div class="col-md-6"><label class="form-label">Precio venta (x kg)</label><input
                              id="mmPrecioVenta" type="number" class="form-control" min="0" step="0.01"></div>
                          <div class="col-12 text-end"><button class="btn btn-success btn-sm" id="mmGuardarInfo">Guardar
                              cambios</button></div>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="mm-despacho">
                        <div class="row g-3 align-items-end">
                          <div class="col-md-6"><label class="form-label">Frecuencia de despacho</label>
                            <select id="mmFreq" class="form-select">
                              <option value="manual">Manual (según necesidad)</option>
                              <option value="semanal">Semanal</option>
                              <option value="quincenal">Cada 15 días</option>
                              <option value="mensual">Mensual</option>
                            </select>
                          </div>
                          <div class="col-md-3"><label class="form-label">Día de la semana / mes</label><input
                              id="mmDia" class="form-control" type="number" min="1" max="31" placeholder="1-31 o 1-7">
                            <div class="form-text">(1=Lunes … 7=Domingo para semanal)</div>
                          </div>
                          <div class="col-md-3 d-grid"><button id="mmPlanificar"
                              class="btn btn-outline-success">Planificar</button></div>
                        </div>
                        <hr>
                        <div class="calendar">
                          <div class="d-flex justify-content-between align-items-center mb-2">
                            <div class="h6 mb-0" id="mmCalTitulo">—</div>
                            <div><button class="btn btn-sm btn-outline-secondary" id="mmPrev">◀</button><button
                                class="btn btn-sm btn-outline-secondary" id="mmNext">▶</button></div>
                          </div>
                          <div class="grid text-center small text-muted mb-1">
                            <div>Lun</div>
                            <div>Mar</div>
                            <div>Mié</div>
                            <div>Jue</div>
                            <div>Vie</div>
                            <div>Sáb</div>
                            <div>Dom</div>
                          </div>
                          <div class="grid" id="mmCalGrid"></div>
                        </div>
                      </div>
                      <div class="tab-pane fade" id="mm-historial">
                        <div class="row g-3">
                          <div class="col-md-6">
                            <h6>Entradas (compras)</h6>
                            <table class="table table-sm">
                              <thead>
                                <tr>
                                  <th>Fecha</th>
                                  <th>Kg</th>
                                  <th>Proveedor</th>
                                  <th>$</th>
                                </tr>
                              </thead>
                              <tbody id="mmEntradas"></tbody>
                            </table>
                          </div>
                          <div class="col-md-6">
                            <h6>Salidas (despachos)</h6>
                            <table class="table table-sm">
                              <thead>
                                <tr>
                                  <th>Fecha</th>
                                  <th>Kg</th>
                                  <th>Centro</th>
                                  <th>$</th>
                                </tr>
                              </thead>
                              <tbody id="mmSalidas"></tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button></div>
            </div>
          </div>
        </div>
      </section>

      <!-- HISTORIAL GLOBAL -->
      <section class="tab-pane fade" id="tab-historial">
        <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#hist-compras"
              type="button">Compras (Entradas)</button></li>
          <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#hist-salidas"
              type="button">Salidas (Centros)</button></li>
        </ul>
        <div class="tab-content border border-top-0 rounded-bottom p-3">
          <div class="tab-pane fade show active" id="hist-compras">
            <div class="row g-2 mb-2">
              <div class="col-md-3"><input id="hcDesde" type="date" class="form-control"></div>
              <div class="col-md-3"><input id="hcHasta" type="date" class="form-control"></div>
              <div class="col-md-3"><select id="hcMaterial" class="form-select">
                  <option value="">Todos los materiales</option>
                </select></div>
              <div class="col-md-3 d-grid"><button id="hcFiltrar" class="btn btn-outline-success">Filtrar</button></div>
            </div>
            <div class="table-responsive">
              <table class="table table-sm table-striped align-middle">
                <thead class="table-light">
                  <tr>
                    <th>Fecha</th>
                    <th>Material</th>
                    <th>Kg</th>
                    <th>Proveedor</th>
                    <th>Precio/Kg</th>
                    <th>Total</th>
                  </tr>
                </thead>
                <tbody id="hcTabla"></tbody>
              </table>
            </div>
          </div>
          <div class="tab-pane fade" id="hist-salidas">
            <div class="row g-2 mb-2">
              <div class="col-md-3"><input id="hsDesde" type="date" class="form-control"></div>
              <div class="col-md-3"><input id="hsHasta" type="date" class="form-control"></div>
              <div class="col-md-3"><select id="hsMaterial" class="form-select">
                  <option value="">Todos los materiales</option>
                </select></div>
              <div class="col-md-3 d-grid"><button id="hsFiltrar" class="btn btn-outline-success">Filtrar</button></div>
            </div>
            <div class="table-responsive">
              <table class="table table-sm table-striped align-middle">
                <thead class="table-light">
                  <tr>
                    <th>Fecha</th>
                    <th>Material</th>
                    <th>Kg</th>
                    <th>Centro de acopio</th>
                    <th>Precio/Kg</th>
                    <th>Total</th>
                  </tr>
                </thead>
                <tbody id="hsTabla"></tbody>
              </table>
            </div>
          </div>
        </div>
      </section>

      <!-- CALENDARIO GLOBAL -->
      <section class="tab-pane fade" id="tab-calendario">
        <div class="row g-3">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <div class="calendar">
                  <div class="d-flex justify-content-between align-items-center mb-2">
                    <div class="h5 mb-0" id="calTitulo">—</div>
                    <div><button class="btn btn-sm btn-outline-secondary" id="calPrev">◀</button> <button
                        class="btn btn-sm btn-outline-secondary" id="calNext">▶</button></div>
                  </div>
                  <div class="grid text-center small text-muted mb-1">
                    <div>Lun</div>
                    <div>Mar</div>
                    <div>Mié</div>
                    <div>Jue</div>
                    <div>Vie</div>
                    <div>Sáb</div>
                    <div>Dom</div>
                  </div>
                  <div class="grid" id="calGrid"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card h-100">
              <div class="card-body">
                <h6>Programar nuevo despacho</h6>
                <div class="mb-2"><label class="form-label">Material</label><select id="calMat"
                    class="form-select"></select></div>
                <div class="mb-2"><label class="form-label">Frecuencia</label>
                  <select id="calFreq" class="form-select">
                    <option value="unico">Único</option>
                    <option value="semanal">Semanal</option>
                    <option value="quincenal">Cada 15 días</option>
                    <option value="mensual">Mensual</option>
                  </select>
                </div>
                <div class="mb-2"><label class="form-label">Fecha inicial</label><input id="calFecha" type="date"
                    class="form-control"></div>
                <div class="mb-2"><label class="form-label">Hora</label><input id="calHora" type="time"
                    class="form-control" value="10:00"></div>
                <div class="mb-2"><label class="form-label">Centro de acopio</label><select id="calCentro"
                    class="form-select"></select></div>
                <button id="calGuardar" class="btn btn-success w-100">Guardar</button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- CENTROS / PROVEEDORES -->
      <section class="tab-pane fade" id="tab-proveedores">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <h5 class="mb-0">Centros de acopio & Proveedores</h5>
          <button id="btnNuevoProveedor" class="btn btn-success btn-sm" data-bs-toggle="modal"
            data-bs-target="#modalProveedor">Añadir</button>
        </div>
        <div class="table-responsive">
          <table class="table table-sm table-striped align-middle">
            <thead class="table-light">
              <tr>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Contacto</th>
                <th>Teléfono</th>
                <th>Correo</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="provTabla"></tbody>
          </table>
        </div>
      </section>

      <!-- CONVERSACIONES -->
      <section class="tab-pane fade" id="tab-conversaciones">
        <div class="row g-3">
          <div class="col-lg-4">
            <div class="card p-3">
              <h6 class="mb-3">Conversaciones</h6>
              <div class="list-group sidebar-threads" id="threadList"></div>
            </div>
          </div>
          <div class="col-lg-8 d-flex flex-column">
            <div class="chat-window d-flex flex-column mb-3" id="chatWindow"></div>
            <div class="input-group">
              <input type="text" class="form-control" id="chatInput" placeholder="Escribe un mensaje…">
              <button class="btn btn-success" id="chatSend">Enviar</button>
            </div>
          </div>
        </div>
      </section>

      <!-- CONFIG -->
      <section class="tab-pane fade" id="tab-config">
        <div class="card">
          <div class="card-body">
            <h6 class="mb-3">Preferencias del punto ECA</h6>
            <div class="row g-3">
              <div class="col-md-6">
                <label class="form-label">Mostrar en mapa público</label>
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" id="cfgMapa">
                  <label class="form-check-label" for="cfgMapa">Visible cuando esté aprobado</label>
                </div>
              </div>
              <div class="col-md-6">
                <label class="form-label">Recibir notificaciones</label>
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" id="cfgNoti">
                  <label class="form-check-label" for="cfgNoti">Aprobaciones, mensajes, comentarios</label>
                </div>
              </div>
            </div>
            <div class="text-end mt-3"><button class="btn btn-success btn-sm" id="cfgGuardar">Guardar</button></div>
          </div>
        </div>
      </section>

    </div>
  </main>

  <!-- MODAL: Alta de proveedor/centro -->
  <div class="modal fade" id="modalProveedor" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
      <form class="modal-content" id="formProveedor">
        <div class="modal-header">
          <h5 class="modal-title">Nuevo centro/proveedor</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body row g-3">
          <div class="col-12"><label class="form-label">Nombre</label><input type="text" class="form-control"
              id="provNombre" required></div>
          <div class="col-md-6"><label class="form-label">Tipo</label><select class="form-select" id="provTipo">
              <option>Centro de acopio</option>
              <option>Proveedor</option>
            </select></div>
          <div class="col-md-6"><label class="form-label">Contacto</label><input type="text" class="form-control"
              id="provContacto" required></div>
          <div class="col-md-6"><label class="form-label">Teléfono</label><input type="tel" class="form-control"
              id="provTelefono" required></div>
          <div class="col-md-6"><label class="form-label">Email</label><input type="email" class="form-control"
              id="provEmail" required></div>
          <div class="col-12"><label class="form-label">Dirección</label><input type="text" class="form-control"
              id="provDireccion" required></div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-outline-secondary" data-bs-dismiss="modal" type="button">Cancelar</button>
          <button class="btn btn-success" type="submit">Guardar</button>
        </div>
      </form>
    </div>
  </div>

  <!-- TOAST -->
  <div class="position-fixed bottom-0 end-0 p-3" style="z-index:1080">
    <div id="toastOK" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive"
      aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body" id="toastText">Acción realizada.</div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // =================== TOAST ===================
    const toast = new bootstrap.Toast(document.getElementById('toastOK'), { delay: 1600 });
    const showToast = (msg) => { document.getElementById('toastText').textContent = msg; toast.show(); };

    // =================== DATOS DEMO ===================
    const PROV = [
      { nombre: 'ReciclaBog', tipo: 'Proveedor', contacto: 'Ana T.', tel: '3101234567', mail: 'ana@reciclabo.g', dir: 'Calle 10' },
      { nombre: 'Centro Norte', tipo: 'Centro de acopio', contacto: 'Juan P.', tel: '3207654321', mail: 'cn@centro.co', dir: 'Av 19 #20' },
      { nombre: 'Vidrios Andinos', tipo: 'Centro de acopio', contacto: 'J. Pérez', tel: '3207654322', mail: 'comercial@vidrios.co', dir: 'Cra 15 #3' }
    ];
    const MATERIALES = [
      { id: 1, nombre: 'Plástico PET', tipo: 'Plástico', categoria: 'PET', desc: 'Botellas PET transparentes', almacenamiento: 'Sacos en área cubierta', capacidad: 1200, umbral: 1000, umbralCrit: 1150, stock: 950, img: 'https://picsum.photos/seed/pet/200/200', precioCompra: 800, precioVenta: 1200, freq: 'semanal' },
      { id: 2, nombre: 'Cartón', tipo: 'Papel y cartón', categoria: 'Mixto', desc: 'Cartón corrugado limpio', almacenamiento: 'Apilado en estibas', capacidad: 2000, umbral: 1500, umbralCrit: 1800, stock: 640, img: 'https://picsum.photos/seed/card/200/200', precioCompra: 300, precioVenta: 600, freq: 'mensual' },
      { id: 3, nombre: 'Vidrio verde', tipo: 'Vidrio', categoria: 'Botella verde', desc: 'Botella de vidrio verde', almacenamiento: 'Tolva a la intemperie', capacidad: 5000, umbral: 4200, umbralCrit: 4800, stock: 4200, img: 'https://picsum.photos/seed/glass/200/200', precioCompra: 50, precioVenta: 180, freq: 'manual' }
    ];
    const HIST_COMPRAS = [
      { fecha: '2025-08-01', material: 1, kg: 120, proveedor: 'ReciclaBog', punit: 750 },
      { fecha: '2025-08-14', material: 2, kg: 320, proveedor: 'CartoCol', punit: 320 },
      { fecha: '2025-08-20', material: 3, kg: 600, proveedor: 'Vidrios Andinos', punit: 70 }
    ];
    const HIST_SALIDAS = [
      { fecha: '2025-08-05', material: 1, kg: 200, centro: 'Centro Norte', punit: 1150 },
      { fecha: '2025-08-18', material: 3, kg: 1500, centro: 'Vidrios Andinos', punit: 170 },
      { fecha: '2025-08-22', material: 2, kg: 600, centro: 'Cartón Sur', punit: 580 }
    ];
    let DESPACHOS = [
      { fecha: '2025-08-28', hora: '10:00', material: 1, centro: 'Centro Norte' },
      { fecha: '2025-09-03', hora: '09:30', material: 2, centro: 'Cartón Sur' }
    ];

    // =================== HELPERS ===================
    function pad2(n) { return n.toString().padStart(2, '0') }
    function fmtDate(d) { return d.getFullYear() + '-' + pad2(d.getMonth() + 1) + '-' + pad2(d.getDate()) }
    function startOfMonth(d) { return new Date(d.getFullYear(), d.getMonth(), 1) }
    function endOfMonth(d) { return new Date(d.getFullYear(), d.getMonth() + 1, 0) }

    // =================== KPIs + Alertas ===================
    function renderKPIs() {
      const inv = MATERIALES.reduce((a, m) => a + (m.stock || 0), 0);
      const entMes = HIST_COMPRAS.reduce((a, h) => a + h.kg, 0);
      const salMes = HIST_SALIDAS.reduce((a, h) => a + h.kg, 0);
      document.getElementById('kpiInventario').textContent = inv.toLocaleString('es-CO');
      document.getElementById('kpiEntradasMes').textContent = entMes.toLocaleString('es-CO');
      document.getElementById('kpiSalidasMes').textContent = salMes.toLocaleString('es-CO');
      const prox = DESPACHOS.map(d => d.fecha).sort()[0];
      document.getElementById('kpiProximoDespacho').textContent = prox || '—';

      const alertas = MATERIALES.filter(m => (m.stock || 0) >= (m.umbral || Infinity));
      document.getElementById('alertCount').textContent = alertas.length;
      const list = document.getElementById('alertList');
      list.innerHTML = alertas.length ? '' : 'Sin alertas.';
      alertas.forEach(m => {
        const div = document.createElement('div');
        const nivel = (m.stock || 0) >= (m.umbralCrit || Number.MAX_SAFE_INTEGER) ? 'CRÍTICO' : 'ALERTA';
        div.innerHTML = `<span class="badge badge-soft me-2">${m.tipo}</span> <strong>${m.nombre}</strong> ${nivel}: ${m.stock || 0}/${m.capacidad} kg (umbral ${m.umbral || '—'})`;
        list.appendChild(div);
      });
    }

    // =================== MATERIAL GRID ===================
    function renderMateriales() {
      const tipo = document.getElementById('fTipo').value.toLowerCase();
      const cat = document.getElementById('fCategoria').value.toLowerCase();
      const txt = document.getElementById('fTexto').value.toLowerCase();
      const cont = document.getElementById('gridMateriales');
      const items = MATERIALES.filter(m => {
        const okTipo = !tipo || m.tipo.toLowerCase() === tipo;
        const okCat = !cat || m.categoria.toLowerCase() === cat;
        const okTxt = !txt || (m.nombre + m.desc).toLowerCase().includes(txt);
        return okTipo && okCat && okTxt;
      });
      cont.innerHTML = items.map(m => {
        const pct = Math.min(100, Math.round(((m.stock || 0) / (m.capacidad || 1)) * 100));
        let barClass = 'bg-success';
        if ((m.stock || 0) >= (m.umbralCrit || Infinity)) barClass = 'bg-danger';
        else if ((m.stock || 0) >= (m.umbral || Infinity)) barClass = 'bg-warning';
        const freqTxt = m.freq ? m.freq.charAt(0).toUpperCase() + m.freq.slice(1) : 'Manual';
        return `
        <div class="col-12 col-sm-6 col-lg-4">
          <div class="card card-hover h-100" data-mid="${m.id}">
            <div class="card-body d-flex gap-3">
              <img src="${m.img || 'https://picsum.photos/seed/mat' + m.id + '/200/200'}" class="material-thumb" alt="${m.nombre}">
              <div class="flex-grow-1">
                <div class="d-flex justify-content-between align-items-center">
                  <h6 class="mb-1">${m.nombre}</h6>
                  <span class="badge badge-soft">${m.categoria}</span>
                </div>
                <div class="small text-muted">${m.tipo} · <span class="text-success">${freqTxt}</span></div>
                <div class="small mt-1">Capacidad: <strong>${m.capacidad} kg</strong></div>
                <div class="small mt-1">Stock: <strong>${m.stock || 0} kg</strong></div>
                <div class="progress compact mt-1" title="${pct}%">
                  <div class="progress-bar ${barClass}" style="width:${pct}%">${pct}%</div>
                </div>
              </div>
            </div>
            <div class="card-footer d-flex justify-content-end gap-2">
              <button class="btn btn-outline-success btn-sm btn-detalle">Detalle</button>
            </div>
          </div>
        </div>`;
      }).join('');
      cont.querySelectorAll('.btn-detalle').forEach(btn => {
        btn.addEventListener('click', e => {
          const id = +e.target.closest('[data-mid]').dataset.mid;
          abrirMaterial(id);
        })
      });
    }

    // =================== REGISTRO MATERIAL (Modal) ===================
    ['matStock', 'matCapMax'].forEach(id => {
      document.getElementById(id).addEventListener('input', () => {
        const stock = parseFloat(document.getElementById('matStock').value || 0);
        const cap = parseFloat(document.getElementById('matCapMax').value || 1);
        const pct = Math.min(100, Math.round((stock / cap) * 100));
        document.getElementById('matOcupacionPct').textContent = pct + '%';
        const bar = document.getElementById('matOcupacionBar');
        bar.style.width = pct + '%';
        bar.classList.remove('bg-success', 'bg-warning', 'bg-danger');
        if (pct >= 90) bar.classList.add('bg-danger');
        else if (pct >= 75) bar.classList.add('bg-warning');
        else bar.classList.add('bg-success');
      });
    });

    function fillCentrosSelects() {
      const centros = PROV.filter(p => p.tipo.toLowerCase().includes('centro'));
      const opts = centros.map(c => `<option value="${c.nombre}">${c.nombre}</option>`).join('');
      document.getElementById('matCentro').innerHTML = '<option value="">— Seleccione —</option>' + opts;
      document.getElementById('calCentro').innerHTML = opts;
    }

    document.getElementById('formMaterial').addEventListener('submit', (e) => {
      e.preventDefault();
      const id = (MATERIALES.at(-1)?.id || 0) + 1;
      const m = {
        id,
        nombre: document.getElementById('matNombre').value.trim(),
        tipo: document.getElementById('matTipo').value,
        categoria: document.getElementById('matCategoria').value.trim() || '—',
        desc: document.getElementById('matDesc').value.trim(),
        almacenamiento: '—',
        capacidad: parseFloat(document.getElementById('matCapMax').value),
        stock: parseFloat(document.getElementById('matStock').value || 0),
        umbral: parseFloat(document.getElementById('matUmbralKg').value || 0),
        umbralCrit: parseFloat(document.getElementById('matUmbralCrit').value || 0),
        img: document.getElementById('matImg').value.trim(),
        precioCompra: parseFloat(document.getElementById('matPrecioCompra').value || 0),
        precioVenta: parseFloat(document.getElementById('matPrecioVenta').value || 0),
        freq: document.getElementById('matFreq').value
      };
      MATERIALES.push(m);
      renderMateriales(); renderKPIs(); fillMaterialSelects();
      // Despacho opcional
      const centroSel = document.getElementById('matCentro').value;
      const dia = parseInt(document.getElementById('matDia').value || '1', 10);
      const hora = document.getElementById('matHora').value || '10:00';
      if (m.freq !== 'manual' && centroSel) {
        const base = new Date(); base.setDate(dia || 1);
        const push = (d) => DESPACHOS.push({ fecha: fmtDate(d), hora, material: id, centro: centroSel });
        push(base);
        if (m.freq === 'semanal') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setDate(dd.getDate() + 7 * i); push(dd); } }
        if (m.freq === 'quincenal') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setDate(dd.getDate() + 15 * i); push(dd); } }
        if (m.freq === 'mensual') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setMonth(dd.getMonth() + i); push(dd); } }
        renderCalendar();
      }
      showToast('Material registrado');
      bootstrap.Modal.getInstance(document.getElementById('modalRegistrarMaterial')).hide();
      e.target.reset();
      document.getElementById('matOcupacionBar').style.width = '0%';
      document.getElementById('matOcupacionPct').textContent = '0%';
    });

    document.getElementById('matPlanificarBtn').addEventListener('click', () => {
      showToast('Se planificarán eventos al guardar el material.');
    });

    // =================== DETALLE MATERIAL (Modal) ===================
    let modalMaterial; const mmCalState = { date: new Date(), material: null };
    function abrirMaterial(id) {
      const m = MATERIALES.find(x => x.id === id); if (!m) return;
      document.getElementById('mmNombre').textContent = m.nombre;
      document.getElementById('mmTipo').textContent = m.tipo;
      document.getElementById('mmCategoria').textContent = m.categoria;
      document.getElementById('mmImg').src = m.img || 'https://picsum.photos/seed/mat' + m.id + '/200/200';
      document.getElementById('mmAlmacen').textContent = m.almacenamiento || '—';
      document.getElementById('mmCap').textContent = m.capacidad || '—';
      document.getElementById('mmUmbral').textContent = m.umbral || '—';
      document.getElementById('mmUmbralCrit').textContent = m.umbralCrit || '—';
      document.getElementById('mmDesc').textContent = m.desc || '—';
      document.getElementById('mmPrecioCompra').value = m.precioCompra || 0;
      document.getElementById('mmPrecioVenta').value = m.precioVenta || 0;

      const ent = HIST_COMPRAS.filter(h => h.material === id);
      const sal = HIST_SALIDAS.filter(h => h.material === id);
      document.getElementById('mmEntradas').innerHTML = ent.map(h => `<tr><td>${h.fecha}</td><td>${h.kg}</td><td>${h.proveedor}</td><td>${(h.punit * h.kg).toLocaleString('es-CO')}</td></tr>`).join('') || '<tr><td colspan="4" class="text-muted">Sin entradas</td></tr>';
      document.getElementById('mmSalidas').innerHTML = sal.map(h => `<tr><td>${h.fecha}</td><td>${h.kg}</td><td>${h.centro}</td><td>${(h.punit * h.kg).toLocaleString('es-CO')}</td></tr>`).join('') || '<tr><td colspan="4" class="text-muted">Sin salidas</td></tr>';

      mmCalState.date = new Date(); mmCalState.material = id; renderMmCalendar();
      modalMaterial = modalMaterial || new bootstrap.Modal(document.getElementById('modalMaterial'));
      modalMaterial.show();
    }
    document.getElementById('mmGuardarInfo').addEventListener('click', () => { showToast('Información de material guardada'); });
    function renderMmCalendar() {
      const d = mmCalState.date, matId = mmCalState.material;
      document.getElementById('mmCalTitulo').textContent = d.toLocaleDateString('es-CO', { month: 'long', year: 'numeric' });
      const first = startOfMonth(d), last = endOfMonth(d), firstDow = (first.getDay() + 6) % 7, days = last.getDate();
      const grid = document.getElementById('mmCalGrid'); grid.innerHTML = '';
      for (let i = 0; i < firstDow; i++) grid.appendChild(document.createElement('div'));
      for (let day = 1; day <= days; day++) {
        const cell = document.createElement('div'); cell.className = 'day';
        const date = new Date(d.getFullYear(), d.getMonth(), day); const iso = fmtDate(date);
        const label = document.createElement('div'); label.className = 'small text-muted'; label.textContent = day; cell.appendChild(label);
        DESPACHOS.filter(e => e.fecha === iso && e.material === matId).forEach(e => {
          const ev = document.createElement('span'); ev.className = 'event'; ev.textContent = `${e.hora} · ${e.centro}`; cell.appendChild(ev);
        });
        grid.appendChild(cell);
      }
    }
    document.getElementById('mmPrev').addEventListener('click', () => { mmCalState.date.setMonth(mmCalState.date.getMonth() - 1); renderMmCalendar(); });
    document.getElementById('mmNext').addEventListener('click', () => { mmCalState.date.setMonth(mmCalState.date.getMonth() + 1); renderMmCalendar(); });
    document.getElementById('mmPlanificar').addEventListener('click', () => {
      const id = mmCalState.material; if (!id) return;
      const freq = document.getElementById('mmFreq').value; const dia = parseInt(document.getElementById('mmDia').value || '1', 10);
      const base = new Date(mmCalState.date.getFullYear(), mmCalState.date.getMonth(), dia);
      const push = (d) => DESPACHOS.push({ fecha: fmtDate(d), hora: '10:00', material: id, centro: 'Centro definido' });
      push(base);
      if (freq === 'semanal') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setDate(dd.getDate() + 7 * i); push(dd); } }
      if (freq === 'quincenal') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setDate(dd.getDate() + 15 * i); push(dd); } }
      if (freq === 'mensual') { for (let i = 1; i <= 3; i++) { const dd = new Date(base); dd.setMonth(dd.getMonth() + i); push(dd); } }
      renderMmCalendar(); renderCalendar(); showToast('Frecuencia planificada');
    });

    // =================== HISTORIAL GLOBAL ===================
    function fillMaterialSelects() {
      const opts = ['<option value="">Todos los materiales</option>', ...MATERIALES.map(m => `<option value="${m.id}">${m.nombre}</option>`)].join('');
      document.getElementById('hcMaterial').innerHTML = opts;
      document.getElementById('hsMaterial').innerHTML = opts;
      document.getElementById('calMat').innerHTML = MATERIALES.map(m => `<option value="${m.id}">${m.nombre}</option>`).join('');
    }
    function renderHistorial() {
      const f = (list, matSel, desdeId, hastaId, tbodyId) => {
        const material = +document.getElementById(matSel).value || null;
        const desde = document.getElementById(desdeId).value || '0000-01-01';
        const hasta = document.getElementById(hastaId).value || '9999-12-31';
        const rows = list.filter(x => (!material || x.material === material) && x.fecha >= desde && x.fecha <= hasta)
          .map(x => {
            const mat = MATERIALES.find(m => m.id === x.material);
            const total = (x.punit || 0) * (x.kg || 0);
            const tercero = x.proveedor || x.centro || '—';
            return `<tr><td>${x.fecha}</td><td>${mat?.nombre || '—'}</td><td>${x.kg}</td><td>${tercero}</td><td>${(x.punit || 0).toLocaleString('es-CO')}</td><td>${total.toLocaleString('es-CO')}</td></tr>`;
          }).join('');
        document.getElementById(tbodyId).innerHTML = rows || `<tr><td colspan="6" class="text-muted">Sin registros</td></tr>`;
      };
      f(HIST_COMPRAS, 'hcMaterial', 'hcDesde', 'hcHasta', 'hcTabla');
      f(HIST_SALIDAS, 'hsMaterial', 'hsDesde', 'hsHasta', 'hsTabla');
    }
    document.getElementById('hcFiltrar').addEventListener('click', renderHistorial);
    document.getElementById('hsFiltrar').addEventListener('click', renderHistorial);

    // =================== CALENDARIO GLOBAL ===================
    const calState = { date: new Date() };
    function renderCalendar() {
      const d = calState.date; const first = startOfMonth(d); const last = endOfMonth(d); const firstDow = (first.getDay() + 6) % 7; const days = last.getDate();
      document.getElementById('calTitulo').textContent = d.toLocaleDateString('es-CO', { month: 'long', year: 'numeric' });
      const grid = document.getElementById('calGrid'); grid.innerHTML = '';
      for (let i = 0; i < firstDow; i++) { grid.appendChild(document.createElement('div')) }
      for (let day = 1; day <= days; day++) {
        const cell = document.createElement('div'); cell.className = 'day';
        const date = new Date(d.getFullYear(), d.getMonth(), day); const iso = fmtDate(date);
        const label = document.createElement('div'); label.className = 'small text-muted'; label.textContent = day; cell.appendChild(label);
        DESPACHOS.filter(e => e.fecha === iso).forEach(e => {
          const mat = MATERIALES.find(m => m.id === e.material);
          const ev = document.createElement('span'); ev.className = 'event'; ev.textContent = `${e.hora} · ${mat?.nombre || '—'} (${e.centro})`;
          cell.appendChild(ev);
        });
        const hoy = new Date(); if (date.toDateString() === hoy.toDateString()) cell.classList.add('today');
        grid.appendChild(cell);
      }
    }
    document.getElementById('calPrev').addEventListener('click', () => { calState.date.setMonth(calState.date.getMonth() - 1); renderCalendar(); });
    document.getElementById('calNext').addEventListener('click', () => { calState.date.setMonth(calState.date.getMonth() + 1); renderCalendar(); });
    document.getElementById('calGuardar').addEventListener('click', () => {
      const id = +document.getElementById('calMat').value; if (!id) return;
      const fecha = document.getElementById('calFecha').value; if (!fecha) return;
      const hora = document.getElementById('calHora').value || '10:00';
      const centro = document.getElementById('calCentro').value || '—';
      const freq = document.getElementById('calFreq').value;
      DESPACHOS.push({ fecha, hora, material: id, centro });
      const d0 = new Date(fecha + 'T00:00:00');
      const add = (n) => { const dd = new Date(d0); dd.setDate(dd.getDate() + n); DESPACHOS.push({ fecha: fmtDate(dd), hora, material: id, centro }); };
      if (freq === 'semanal') { add(7); add(14); add(21); }
      if (freq === 'quincenal') { add(15); add(30); add(45); }
      if (freq === 'mensual') { for (let i = 1; i <= 3; i++) { const mm = new Date(d0); mm.setMonth(mm.getMonth() + i); DESPACHOS.push({ fecha: fmtDate(mm), hora, material: id, centro }); } }
      renderCalendar(); showToast('Despacho programado');
    });

    // =================== PROVEEDORES/CENTROS ===================
    function renderProveedores() {
      const tbody = document.getElementById('provTabla');
      tbody.innerHTML = PROV.map(p => `<tr><td>${p.nombre}</td><td>${p.tipo}</td><td>${p.contacto}</td><td>${p.tel}</td><td>${p.mail}</td><td class="text-end"><button class="btn btn-sm btn-outline-secondary">Editar</button></td></tr>`).join('');
      fillCentrosSelects();
    }
    document.getElementById('formProveedor').addEventListener('submit', (e) => {
      e.preventDefault();
      const p = {
        nombre: document.getElementById('provNombre').value,
        tipo: document.getElementById('provTipo').value,
        contacto: document.getElementById('provContacto').value,
        tel: document.getElementById('provTelefono').value,
        mail: document.getElementById('provEmail').value,
        dir: document.getElementById('provDireccion').value
      };
      PROV.push(p); renderProveedores(); showToast('Centro/Proveedor creado');
      bootstrap.Modal.getInstance(document.getElementById('modalProveedor')).hide();
      e.target.reset();
    });

    // =================== CONVERSACIONES (demo) ===================
    const THREADS = [
      { id: 1, titulo: 'Ciudadano A', preview: '¿Dónde está el punto…?', msgs: [{ from: 'user', text: '¿Dónde está el punto de reciclaje más cercano?' }, { from: 'eca', text: 'Estamos en la Calle 5 #123. Atendemos 8:00–17:00.' }] },
      { id: 2, titulo: 'Ciudadano B', preview: '¿Aceptan plástico hoy?', msgs: [{ from: 'user', text: '¿Aceptan plástico hoy?' }, { from: 'eca', text: 'Sí, de 8 a 5 pm.' }] }
    ];
    function renderThreads() {
      const list = document.getElementById('threadList');
      list.innerHTML = THREADS.map((t, i) => `
        <button class="list-group-item list-group-item-action ${i === 0 ? 'active' : ''}" data-thread-id="${t.id}">
          <div class="fw-semibold">${t.titulo}</div>
          <small class="text-muted">${t.preview}</small>
        </button>`).join('');
      bindThreadClicks(); loadThread(THREADS[0].id);
    }
    function bindThreadClicks() {
      document.getElementById('threadList').addEventListener('click', (e) => {
        const btn = e.target.closest('[data-thread-id]'); if (!btn) return;
        document.querySelectorAll('#threadList .list-group-item').forEach(b => b.classList.remove('active'));
        btn.classList.add('active'); loadThread(+btn.dataset.threadId);
      }, { once: true });
    }
    function loadThread(id) {
      const t = THREADS.find(x => x.id === id); const win = document.getElementById('chatWindow');
      win.innerHTML = t.msgs.map(m => `<div class="message ${m.from === 'user' ? 'user' : 'eca'}">${m.text}</div>`).join('');
      win.dataset.threadId = id; win.scrollTop = win.scrollHeight;
    }
    document.getElementById('chatSend').addEventListener('click', () => {
      const input = document.getElementById('chatInput'); const text = input.value.trim(); if (!text) return;
      const win = document.getElementById('chatWindow'); const id = +win.dataset.threadId;
      THREADS.find(t => t.id === id).msgs.push({ from: 'eca', text }); // enviar como ECA
      const bubble = document.createElement('div'); bubble.className = 'message eca'; bubble.textContent = text; win.appendChild(bubble);
      win.scrollTop = win.scrollHeight; input.value = '';
      // TODO: POST /api/conversations/{id}/messages
    });

    // =================== INIT ===================
    ['fTipo', 'fCategoria', 'fTexto'].forEach(id => document.getElementById(id).addEventListener('input', renderMateriales));
    function init() {
      renderKPIs(); renderMateriales(); renderHistorial(); renderCalendar(); renderProveedores(); renderThreads(); fillMaterialSelects(); fillCentrosSelects();
    }
    init();
  </script>
</body>

</html>