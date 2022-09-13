<?php

class ingrediënt {

   private $connection;
   private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    private function selectArtikel($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }

    public function selecteerIngrediënt($gerecht_id) {

        $sql = "select * from ingrediënt where gerecht_id = $gerecht_id";
        
        $result = mysqli_query($this->connection, $sql);
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $artikel_id = $row['artikel_id'];
            $artikel = $this->selectArtikel($artikel_id);
        
            $return[] = [
                "ingrediënt_id" => $row["ingrediënt_id"],
                "gerecht_id" => $row["gerecht_id"],
                "artikel_id" => $row["artikel_id"],
                "ingrediënt_hoeveelheid" => $row["ingrediënt_hoeveelheid"],
                "artikel_naam" => $artikel["artikel_naam"]
            ];
        }

        return $return; 

    }

}