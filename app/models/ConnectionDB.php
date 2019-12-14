<?php


class Connection
{
    private $conn;
    public function __construct()
    {
        $this->conn = mysqli_connect("localhost", "root", " ", "db_web2");
    }

    public function db()
    {
        return $this->conn;
    }
}





?>