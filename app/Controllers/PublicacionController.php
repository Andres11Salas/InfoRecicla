<?php

namespace App\Controllers;

require_once 'Controller.php';

class PublicacionController extends Controller
{
    // Lógica para la gestión de publicaciones
    public function view_publicaciones()
    {
        return $this->view('/Publicaciones/', 'publicaciones');
    }
}
