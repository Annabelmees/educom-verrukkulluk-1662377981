<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    private function selecteerArtikel($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }

    public function selecteerIngredient($gerecht_id) {

        $sql = "select * from ingredient where gerecht_id = $gerecht_id";
        
        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $artikel_id = $row['artikel_id'];
            $artikel = $this->selecteerArtikel($artikel_id);
        
            $return[] = [
                "gerecht_id" => $row["gerecht_id"],
                "ingredient_id" => $row["ingredient_id"],
                "ingredient_hoeveelheid" => $row["ingredient_hoeveelheid"],
                "artikel_id" => $row["artikel_id"],
                "artikel_naam" => $artikel["artikel_naam"],
                "artikel_omschrijving" => $artikel["artikel_omschrijving"],
                "artikel_foto" => $artikel["artikel_foto"],
                "artikel_prijs" => $artikel["artikel_prijs"],
                "artikel_eenheid" => $artikel["artikel_eenheid"],   
                "artikel_verpakking" => $artikel["artikel_verpakking"],
                "artikel_calorieen" => $artikel["artikel_calorieen"], 
            ];
        }

        return $return; 

    }

}