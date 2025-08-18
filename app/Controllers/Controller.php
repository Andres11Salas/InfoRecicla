<?php


namespace app\Controllers;

class Controller
{
    public function view($ruta, $vista)
    {
        $vista = trim($vista, '/'); // Eliminar barras al inicio y al final

        // Verificar si la vista existe
        // Asumiendo que las vistas están en un directorio específico
        // Aquí se puede ajustar la ruta según la estructura del proyecto

        if (file_exists("../resource/views/{$ruta}/{$vista}.html")) {

            // Capturar la salida
            ob_start();
            include "../resource/views/{$ruta}/{$vista}.html";
            // Guardar el contenido
            $contenido = ob_get_clean();
            return $contenido;
        } else {
            return "No existe la vista";
        }
    }
}
