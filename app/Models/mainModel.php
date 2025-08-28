<?php

namespace app\Models;

require_once '../../config/server.php';


use PDO;
use PDOException;


class mainModel
{
    private $host = DB_HOST;
    private $port = DB_PORT;
    private $user = DB_USER;
    private $db = DB_NAME;
    private $pass = DB_PASS;
    private $charset = DB_CHARSET;

    public function connect()
    {
        $conexion = null;
        try {
            $conexion = new PDO("mysql:host=" . $this->host . ";port=" . $this->port . ";dbname=" . $this->db . ";charset=" . $this->charset, $this->user, $this->pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Conexión exitosa a la base de datos.";
            return $conexion;
        } catch (PDOException $e) {
            // Manejar el error de conexión
            die("Error de conexión a la base de datos: " . $e->getMessage());
        }
    }
}
$conexion = new mainModel();
$conexion->connect();
