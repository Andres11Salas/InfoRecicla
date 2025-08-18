<?php
//Aqui se definen las rutas validas para la pagina
require_once '../libreria/Ruta.php';

use Libreria\Ruta;

Ruta::getRutas('/', function () {
    // Lógica para la ruta de inicio
});

Ruta::getRutas('/registro', function () {
    // Lógica para la ruta de registro
});
Ruta::getRutas('/login', function () {
    // Lógica para la ruta de login
});
Ruta::getRutas('/logout', function () {
    // Lógica para la ruta de logout
});
Ruta::getRutas('/mapa', function () {
    // Lógica para la ruta de mapa
});

Ruta::getRutas('/publicaciones', function () {
    // Lógica para la ruta de contacto
    echo "Ruta de publicaciones";
});

// Ruta para ver una publicación específica
// Con los :id indicamos que se ingresera una variable
Ruta::getRutas('/publicaciones/:id', function ($id) {
    // Lógica para la ruta de contacto
    echo "Ruta de publicación específica: $id";
});
Ruta::dispatch();
