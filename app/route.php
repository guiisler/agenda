<?php

namespace app;

use Core\Init\Bootstrap;

class Route extends Bootstrap{
    

    protected function initRoutes() {

        

        $routes['index'] = array(

            'route'=> '/',
            'controller' => 'indexcontroller',
            'action' => 'index'
        );

        $routes['signin'] = array(

            'route'=> '/login',
            'controller' => 'indexcontroller',
            'action' => 'login'
        );

        $routes['signup'] = array(

            'route'=> '/criar',
            'controller' => 'indexcontroller',
            'action' => 'criar'
        );

        $routes['home'] = array(

            'route'=> '/home',
            'controller' => 'indexcontroller',
            'action' => 'home'
        );

        $routes['saneamento'] = array(

            'route'=> '/saneamento',
            'controller' => 'indexcontroller',
            'action' => 'saneamento'
        );

        $routes['desigualdade'] = array(

            'route'=> '/desigualdade',
            'controller' => 'indexcontroller',
            'action' => 'desigualdade'
        );

        $routes['form'] = array(

            'route'=> '/form',
            'controller' => 'indexcontroller',
            'action' => 'form'
        );

        $routes['logout'] = array(

            'route'=> '/logout',
            'controller' => 'indexcontroller',
            'action' => 'logout'
        );


        $this->setRoutes($routes);
    }

}

?>