<?php

namespace App\Controllers;

require_once 'Controller.php';

class MapaController extends Controller
{
    public function view_mapa()
    {
        // Lógica para la vista del mapa
        return $this->view('/Mapa/', 'mapa');
    }
}
