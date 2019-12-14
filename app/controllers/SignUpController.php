<?php

require_once '../models/Insert_User.php';


$name = $_POST['name'];
$email = $_POST['email'];

$password = $_POST['password'];

$newRegister = new SingUp($name, $email, $password);

$newRegister->register();

class SingUp
{
    private $nome;
    private $email;
    private $password;

    public function __construct($nome, $email, $password)
    {
        $this->nome = $nome;
        $this->email = $email;
        $this->password = $password;
       
    }
    public function register()
    {
        
        
            $newUser = new User();
            $newUser->inserir($this->nome, $this->email, $this->password, 'user');
        
}}

?>
