<?php

namespace App\Controllers;

use Core\Controller\Action;

class IndexController extends Action {


    public function index() {

        
        $this->render('index');
    }

    public function login(){


       
        $this->render('login');
    }

    public function criar(){

        $this->render('criar');

  }

  public function logar(){

    $this->render('login');

}

public function home(){

    $this->render('home');

}

public function saneamento(){

    $this->render('saneamento');

}

public function desigualdade(){

    $this->render('desigualdade');

}

public function form(){

    $this->render('form');

}

public function logout(){

    $this->render('index');

}
 



}
?>