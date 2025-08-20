<?php

namespace App\Controllers;

require_once 'Controller.php';

class PuntoEcaController extends Controller
{
    public function view_punto_eca()
    {
        // Lógica para la vista de registro
        return $this->view('/PuntoECA/', 'Historial');
    }
}
