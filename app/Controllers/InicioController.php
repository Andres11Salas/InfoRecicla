<?php

namespace App\Controllers;

require_once 'Controller.php';

class InicioController extends Controller
{
    //Traer la pagina principal
    public function view_inicio()
    {
        // Lógica para la página de inicio
        return $this->view('/Inicio/', 'inicio');
    }
}
