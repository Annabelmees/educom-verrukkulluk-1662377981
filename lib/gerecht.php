<?php

class gerecht {

    private $connection;
    private $kt;
    private $ing;
    private $det;
    private $us;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->kt = new keuken_type($connection);
        $this->ing = new ingredient($connection);
        $this->det = new detail_pagina_info($connection);
        $this->us = new user($connection);
    }

    private function selecteerKeuken_Type($keuken_type_id) {
        $keuken_type = $this->kt->selecteerKeuken_Type($keuken_type_id);
        return($keuken_type); 
    }

    public function selecteerIngredient($gerecht_id) {
        $ingredient = $this->ing->selecteerIngredient($gerecht_id);
        return($ingredient);
    }

    private function selecteerDetail_Pagina_Info($gerecht_id) {
        $detail_pagina_info = $this->det->selecteerDetail_Pagina_Info($gerecht_id);
        return($detail_pagina_info);
    }

    public function selecteerUser($user_id) {
        $user = $this->us->selecteerUser($user_id);
        return($user);
    }

    public function selecteerGerecht($user_id) {
        
        $sql = "select * from gerecht where user_id = $user_id";

        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $keuken_type_id = $row['keuken_type_id'];	
            $keuken_type = $this->selecteerKeuken_Type($keuken_type_id); 
            
            $gerecht_id = $row["gerecht_id"];
          
            $ingredienten = $this->selecteerIngredient($gerecht_id);
            $detail_pagina_info_lijst = $this->selecteerDetail_Pagina_Info($gerecht_id);
            
            $prijs = $this->berekenPrijs($ingredienten);

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
                "ingredient" => $ingredienten, 
                "detail_pagina_info_lijst" => $detail_pagina_info_lijst,
            ];
        }

        return $return; 

    }
    
    public function berekenCalorieen($gerecht_id) {
       // calorieen in artikel zijn calorieen per 100 gram
       $cal = 0; 
       
       foreach($ingredienten as $ingredient) {
           $artCal = $ingredient["artikel_calorieen"];
           $hoeveelheid = $ingredient["ingredient_hoeveelheid"];

            $cal = ((int)$hoeveelheid / 100) * (int)$artCal;
        }

        return $cal;
    }

    public function berekenPrijs($ingredienten) {
        $prijs = 0;

        foreach($ingredienten as $ingredient) {
            $artAantal = $ingredient["ingredient_hoeveelheid"];
            $artPrijs = $ingredient["artikel_prijs"];

            $prijs += $artAantal * $artPrijs;
        }

        return $prijs;
    }

    public function selecteerWaardering($gerecht_id) {
        if($detail_pagina_info["record_type"] == "W") {
            $return[] = [
                "detail_pagina_info_id" => $detail_pagina_info["detail_pagina_info_id"],
                "gerecht_id" => $detail_pagina_info["gerecht_id"],
                "record_type" => $detail_pagina_info["record_type"],
                "nummer" => $detail_pagina_info["nummer"],
            ];
        }
    
        return $return;
    }
    
    public function selecteerBereidingswijze($gerecht_id) {
        if($detail_pagina_info["record_type"] == "B") {
            $return[] = [
                "detail_pagina_info_id" => $detail_pagina_info["detail_pagina_info_id"],
                "gerecht_id" => $detail_pagina_info["gerecht_id"],
                "record_type" => $detail_pagina_info["record_type"],
                "text_inhoud" => $detail_pagina_info["text_inhoud"],
                "nummer" => $detail_pagina_info["nummer"],
            ];
        }
    
        return $return;
    }

    public function selecteerOpmerkingen($gerecht_id) {
        if($detail_pagina_info["record_type"] == "O") {
            $return[] = [
                "detail_pagina_info_id" => $detail_pagina_info["detail_pagina_info_id"],
                "gerecht_id" => $detail_pagina_info["gerecht_id"],
                "record_type" => $detail_pagina_info["record_type"],
                "text_inhoud" => $detail_pagina_info["text_inhoud"],
                "nummer" => $detail_pagina_info["nummer"],
                "user_id" => $detail_pagina_info["user_id"],
            ];
        }
    
        return $return;
    }

}