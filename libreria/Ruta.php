<?php

namespace Libreria;

//Clase para definir las rutas de la pagina


class Ruta
{

    //Dentro de esta variable almacenaremos todas las urls validas dentro de la pagina
    private static $rutas = [];



    //Este metodo se encarga de agregar rutas tipo get al array de rutas
    //El metodo es estatico para no tener la necesidad de instanciar para llamarlo
    public static function getRutas($uri, $callback)
    {
        $uri = trim($uri, '/'); // Eliminar barras al inicio y al final 
        self::$rutas['GET'][$uri] = $callback;
        return self::$rutas['GET'];
    }

    //Este metodo se encarga de agregar rutas tipo post al array de rutas
    public static function postRutas($uri, $callback)
    {
        $uri = trim($uri, '/'); // Eliminar barras al inicio y al final 
        self::$rutas['POST'][$uri] = $callback;
    }


    //Este metodo se encarga de tomar la uri que ingrese el usuario
    public static function dispatch()
    {
        //Obtenemos la uri ingresada
        $uri = $_SERVER['REQUEST_URI'];
        $uri = trim($uri, '/'); // Eliminar barras al inicio y al final


        $method = $_SERVER['REQUEST_METHOD']; //Verificamos el metodo de la peticion get o post

        //Verificamos si la ruta existe en el array de rutas

        foreach (self::$rutas[$method] as $ruta => $callback) {

            //Si la ruta contiene un id, lo convertimos en una expresion regular
            if (strpos($ruta, ':') !== false) {
                //Encontrar un patron espefico dentro de la ruta cuando tiene :
                $ruta = preg_replace("#:[a-zA-Z]+#", "([a-zA-Z]+)", $ruta);
            }

            //Vamos a hacer una comparacion de la uri y en $matches guardamos la coincidencia
            if (preg_match("#^$ruta$#", $uri, $matches)) {
                //guardamos la o las coincidencias dentro de un array
                $params = array_slice($matches, 1);
                //Desglosamos el array en varia variables
                $callback(...$params);

                return;
            }
        }
    }
}
