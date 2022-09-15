<?php

class gerecht {

    private $connection;
    private $kt;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->kt = new keuken_type($connection);
    }

    private function selecteerKeuken_Type($keuken_type_id) {
        $keuken_type = $this->kt->selecteerKeuken_Type($keuken_type_id);
        return($keuken_type); 
    }

    private function selecteerUser($user_id) {
        $user = $this->us->selecteerUser($user_id);
        return($user);
    }

    private function selecteerIngredient($ingredient_id) {
        $ingredient = $this->ing->selecteerIngredient($ingredient_id);
        return($ingredient);
    }

    private function berekenCalorieen($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);

        //$return = 

        //return $return;
    }

    private function berekenPrijs($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);

        //$return = 

        //return $return;
    }

    private function selecteerWaardering($detail_pagina_info) {

    }

    private function selecteerBereidingswijze($detail_pagina_info) {

    }

    private function selecteerOpmerkingen($detail_pagina_info) {
        
    }

    public function selecteerGerecht($user_id) {
        
        $sql = "select * from gerecht where user_id = $user_id";

        $result = mysqli_query($this->connection, $sql);
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $keuken_type_id = $row['keuken_type_id'];	
            $keuken_type = $this->selecteerKeuken_Type($keuken_type_id);

            $return[] = [
                "user_id" => $row["user_id"],
                "gerecht_id" => $row["gerecht_id"],
                "gerecht_titel" => $row["gerecht_titel"],
                "gerecht_foto" => $row["gerecht_foto"],
                "gerecht_datum" => $row["gerecht_datum"],
                "gerecht_omschrijving_kort" => $row["gerecht_omschrijving_kort"],
                "gerecht_omschrijving_lang" => $row["gerecht_omschrijving_lang"], 
                "keuken_type_id" => $row["keuken_type_id"],
                "keuken" => $keuken_type["keuken"],
                "type" => $keuken_type["type"],
            ];

        }

        return $return; 

    }

}

//probleem = hetzelfde als bij detail_pagina_info class: hoe selecteer ik alle instanties van user_id = $user_id zonder mysqli_fetch_all?