<?php

namespace App\Controllers;

use Core\BaseController;

class HomeController extends BaseController{

    public function index(){
        $this->view->nome = "Murillo Godoi";
        $this->renderView('home/index', 'layout');

    }
}

?>