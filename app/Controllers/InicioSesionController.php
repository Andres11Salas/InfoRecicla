<?php

namespace App\Controllers;

require_once 'Controller.php';

class InicioSesionController extends Controller
{
    public function view_InicioSesion()
    {
        // Lógica para la vista de inicio de sesión
        return $this->view('/Registro/', 'inicioSesion');
    }
}
