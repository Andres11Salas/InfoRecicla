<?php

namespace App\Controllers;

require_once 'Controller.php';

class CiudadanoController extends Controller
{
    public function view_ciudadano()
    {
        // Lógica para la vista de registro
        return $this->view('/Ciudadano/', 'ciudadano');
    }
}
