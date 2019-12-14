<?php

require_once 'ConnectionDB.php';

class InsertUser
{
    public function __construct($nome, $email, $senha)
    {
        $conns = new Connection();
        $conn = $conns->db();
        if (mysqli_connect_errno()) {
            echo "Connect failed: %s\n" . mysqli_connect_error();
            exit();
        }else{

        
         ($conn->query("INSERT INTO user (nome , email , senha) VALUES ('$nome', '$email', '$senha')"));
            
       }
        $conn->close();
    }
}


public function inserir($nome, $email, $senha){
    
        if ($this->connection->query("INSERT INTO user (nome , email, senha) VALUES ('$nome', '$email', '$senha')")) {
            $id = $this->connection;
        } else {
            echo $this->connection->errno;
        }
        $this->connection->close();
    }


?>