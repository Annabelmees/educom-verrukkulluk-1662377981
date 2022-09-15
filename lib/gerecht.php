<?php

class gerecht {

    private $connection;
    private $kt;
    private $art;
    private $us;
    private $ing;
    private $det;
    

    public function __construct($connection) {
        $this->connection = $connection;
        $this->kt = new keuken_type($connection);
        $this->art = new artikel($connection);
        $this->us = new user($connection); 
        $this->ing = new ingredient($connection);
        $this->det = new detail_pagina_info($connection);
    }

    private function selecteerKeuken_Type($keuken_type_id) {
        $keuken_type = $this->kt->selecteerKeuken_Type($keuken_type_id);
        return($keuken_type); 
    }

    private function selecteerArtikel($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }

    private function selecteerDetail_Pagina_Info($gerecht_id) {
        $detail_pagina_info = $this->det->selecteerDetail_Pagina_Info($gerecht_id);
        return($detail_pagina_info);    
    }

    public function selecteerUser($user_id) {
        $user = $this->us->selecteerUser($user_id);
        return($user);
    }

    public function selecteerIngredient($gerecht_id) {
        $ingredient = $this->ing->selecteerIngredient($gerecht_id);
        return($ingredient);
    }

    public function berekenCalorieen($gerecht_id) {
        //calorieen in artikel zijn calorieen per 100 gram
        
        //aanhalen gegevens:
        $sql = "select ingredient_hoeveelheid, artikel_id from ingredient where gerecht_id = $gerecht_id";
        
        $result = mysqli_query($this->connection, $sql);
        $artCal = [];
        $hoeveelheid = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $artikel_id = $row['artikel_id'];
            $artikel = $this->selecteerArtikel($artikel_id);

            $artCal[] = [
                "artikel_calorieen" => $artikel["artikel_calorieen"]
            ];
            $hoeveelheid[] = [
                "ingredient_hoeveelheid" => $row["ingredient_hoeveelheid"]
            ];

            //berekening:
            //$cal = ((int)$hoeveelheid / 100) * (int)$cal;
        }

        return $cal;
    }

    public function berekenPrijs($gerecht_id) {
        //aanhalen gegevens:
        $sql = "select ingredient_hoeveelheid, artikel_id from ingredient where gerecht_id = $gerecht_id";
        
        $result = mysqli_query($this->connection, $sql);
        $artPrijs = [];
        $artHoeveelheid = [];
        $ingHoeveelheid = [];
        
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $artikel_id = $row['artikel_id'];
            $artikel = $this->selecteerArtikel($artikel_id);

            $artPrijs[] = [
                "artikel_prijs" => $artikel["artikel_prijs"],
            ];
            $artHoeveelheid[] = [
                "artikel_verpakking" => $artikel["artikel_verpakking"],
            ];
            $ingHoeveelheid[] = [
                "ingredient_hoeveelheid" => $ingredient["ingredient_hoeveelheid"],
            ];


            //berekening:
            //$prijs =
        }

        return $prijs;

    }

    public function selecteerWaardering($gerecht_id) {
        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id";
        
        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = [
                    "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "nummer" => $row["nummer"],
            ];
        //op dezelfde manier $row["record_type"] == "W" filteren als "F" en "O" in detail_pagina_info class
        }

        return $return;

    }

    public function selecteerBereidingswijze($gerecht_id) {
        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id";

        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = [
                    "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "text_inhoud" => $row["text_inhoud"],
                    "nummer" => $row["nummer"],
            ];
        //op dezelfde manier $row["record_type"] == "B" filteren als "F" en "O" in detail_pagina_info class
        }

        return $return;
    }

    public function selecteerOpmerkingen($gerecht_id) {
        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id";

        $result = mysqli_query($this->connection, $sql);

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = [
                    "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "text_inhoud" => $row["text_inhoud"],
                    "nummer" => $row["nummer"],
                    "user_id" => $row["user_id"],
            ];
        //op dezelfde manier $row["record_type"] == "O" filteren als "F" en "O" in detail_pagina_info class
        }

        return $return;
    }

    public function selecteerGerecht($user_id) {
        
        $sql = "select * from gerecht where user_id = $user_id";

        $result = mysqli_query($this->connection, $sql);
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