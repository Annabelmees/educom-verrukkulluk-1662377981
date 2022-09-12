<?php 

define("USER", "root");
define("PASSWORD", "PearlJam01.");
define("DATABASE", "verrukkulluk");
define("HOST", "127.0.0.1");

class database {

    private $connection;

    public function __construct() {
       $this->connection = mysqli_connect(HOST,                                          
                                         USER, 
                                         PASSWORD,
                                         DATABASE );
    }

    public function getConnection() {
        return($this->connection);
    }

}
