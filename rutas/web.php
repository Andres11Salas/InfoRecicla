<?php
//Aqui se definen las rutas validas para la pagina
require_once '../libreria/Ruta.php';
require_once '../app/Controllers/InicioController.php';
require_once '../app/Controllers/PublicacionController.php';
require_once '../app/Controllers/RegistroController.php';
require_once '../app/Controllers/InicioSesionController.php';
require_once '../app/Controllers/MapaController.php';
require_once '../app/Controllers/CiudadanoController.php';

use Libreria\Ruta;
use App\Controllers\InicioController;
use App\Controllers\PublicacionController;
use App\Controllers\RegistroController;
use App\Controllers\InicioSesionController;
use App\Controllers\MapaController;
use App\Controllers\CiudadanoController;

//Ruta valida - Clase controladora - metodo 
Ruta::getRutas('/', [InicioController::class, 'view_inicio']);

Ruta::getRutas('/registro', [RegistroController::class, 'view_registro']);

Ruta::getRutas('/registro-ciudadano', [RegistroController::class, 'view_registro_ciudadano']);

Ruta::getRutas('/registro-eca', [RegistroController::class, 'view_registro_eca']);

Ruta::getRutas('/login', [InicioSesionController::class, 'view_InicioSesion']);

Ruta::getRutas('/ciudadano', [CiudadanoController::class, 'view_ciudadano']);

Ruta::getRutas('/mapa', [MapaController::class, 'view_mapa']);

Ruta::getRutas('/publicaciones', [PublicacionController::class, 'view_publicaciones']);

// Ruta para ver una publicación específica
// Con los :id indicamos que se ingresera una variable
Ruta::getRutas('/publicaciones/:id', function ($id) {
    // Lógica para la ruta de contacto
    echo "Ruta de publicación específica: $id";
});
Ruta::dispatch();
