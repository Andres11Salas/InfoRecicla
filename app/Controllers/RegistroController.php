<?php

namespace App\Controllers;

require_once 'Controller.php';

class RegistroController extends Controller
{
    public function view_registro()
    {
        // Lógica para la vista de registro
        return $this->view('/Registro/', 'registro');
    }
}
