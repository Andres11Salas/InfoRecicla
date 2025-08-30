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

    //Funcion para conectar a la base de datos
    public function conectar()
    {
        $conexion = null;
        try {
            $conexion = new PDO("mysql:host=" . $this->host . ";port=" . $this->port . ";dbname=" . $this->db . ";charset=" . $this->charset, $this->user, $this->pass);
            // Establecer el modo de error de PDO
            // PDO::ATTR_ERRMODE sirve para establecer el modo de error de PDO
            // PDO::ERRMODE_EXCEPTION sirve para lanzar excepciones cuando ocurre un error en la base de datos
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Conexión exitosa a la base de datos.";
            return $conexion;
        } catch (PDOException $e) {
            // Manejar el error de conexión
            die("Error de conexión a la base de datos: " . $e->getMessage());
        }
    }

    //Funcion para ejecutar consultas SQL
    protected function ejecutarConsulta($consulta)
    {
        try {
            $conexion = $this->conectar();
            $sql = $conexion->prepare($consulta);
            $sql->execute();
            return $sql;
        } catch (PDOException $e) {
            // Manejar el error de ejecución de la consulta
            die("Error al ejecutar la consulta: " . $e->getMessage());
        } finally {
            // Cerrar la conexión
            $conexion = null;
        }
    }

    //Funcion para evitar inyecciones SQL impidiendo la ejecución de código malicioso desde formularios
    public function limpiarCadena($cadena)
    {

        $palabras = ["<script>", "</script>", "<script src", "<script type=", "SELECT * FROM", "SELECT ", " SELECT ", "DELETE FROM", "INSERT INTO", "DROP TABLE", "DROP DATABASE", "TRUNCATE TABLE", "SHOW TABLES", "SHOW DATABASES", "<?php", "?>", "--", "^", "<", ">", "==", "=", ";", "::"];

        $cadena = trim($cadena); // Eliminar espacios en blanco al inicio y al final
        $cadena = stripslashes($cadena); // Eliminar barras invertidas \
        //Recorremos el array de palabras prohibidas para eliminarlas de la cadena 
        foreach ($palabras as $palabra) {
            $cadena = str_ireplace($palabra, "", $cadena); // Eliminar palabras prohibidas
        }

        $cadena = trim($cadena);
        $cadena = stripslashes($cadena);

        return $cadena;
    }
    //Funcion para verificar datos ingresados en el formulario con un filtro
    protected function verificarDatos($filtro, $cadena)
    {
        // Verificar si la cadena cumple con el filtro comparado con una expresión regular
        if (preg_match("/^" . $filtro . "$/", $cadena)) {
            return false;
        } else {
            return true;
        }
    }
    protected function guardarDatos($tabla, $datos)
    {
        $query = "INSERT INTO $tabla";
    }
}
