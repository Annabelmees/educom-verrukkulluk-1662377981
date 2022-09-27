<?php

class boodschappenlijst {

    private $connection;
    private $art;
    private $us;
    private $ing;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
        $this->us = new user($connection);
        $this->ing = new ingredient($connection);
    }

    private function selecteerArtikel($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }

    private function selecteerIngredient($gerecht_id) {
        $ingredient = $this->ing->selecteerIngredient($gerecht_id);
        return($ingredient);
    }

    public function artikelDubbel($artikel_id, $user_id) {

        $sql = "select * from boodschappenlijst where user_id = $user_id";
        
        $result = mysqli_query($this->connection, $sql);
        $boodschap = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $artikel = $this->selecteerArtikel($artikel_id);
            
            $boodschap[] = [
                "boodschap_id" => $row["boodschap_id"],
                "user_id" => $row["user_id"],
                "artikel_id" => $row["artikel_id"],
                "artikel_naam" => $artikel["artikel_naam"],
                "artikel_omschrijving" => $artikel["artikel_omschrijving"],
                "artikel_foto" => $artikel["artikel_foto"],
                "artikel_prijs" => $artikel["artikel_prijs"],
                "artikel_eenheid" => $artikel["artikel_eenheid"],   
                "artikel_verpakking" => $artikel["artikel_verpakking"],
                "artikel_calorieen" => $artikel["artikel_calorieen"], 
                "aantal" => $row["aantal"], 
            ]; 
            
            if($row["artikel_id"] == $artikel_id) {
                return $boodschap;
            } 

        }

        return false; 

    }

   public function boodschappenToevoegen($gerecht_id, $user_id) {
        $ingredienten = $this->selecteerIngredient($gerecht_id);

        $aantal = 0;

        foreach($ingredienten as $ingredient) {
            $ingredient_id = $ingredient["ingredient_id"];
            $artikel_id = $ingredient["artikel_id"];
            
            $ingHoev = $ingredient["ingredient_hoeveelheid"];
            $artHoev = $ingredient["artikel_verpakking"];
    
            $aantal += ceil($ingHoev / $artHoev);

            if($this->artikelDubbel($ingredient["artikel_id"], $user_id) !== false) {
                $sql = "update boodschappenlijst set aantal = aantal + $aantal where artikel_id = $artikel_id";
            } else {
                $sql = "insert into boodschappenlijst (user_id, artikel_id, aantal)
                values ($user_id, $artikel_id, $aantal)";
            }

        }

   }

}