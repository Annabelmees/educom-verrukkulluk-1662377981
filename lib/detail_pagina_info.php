<?php

class detail_pagina_info {

    private $connection;
    private $us;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->us = new user($connection);
    }
    
    private function selecteerUser($user_id) {
        $user = $this->us->selecteerUser($user_id);
        return($user);
    }
    
    public function selecteerDetail_Pagina_Info($gerecht_id, $record_type) {
        
        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id and record_type = '$record_type'";

        $result = mysqli_query($this->connection, $sql);
        $return = [];
        
        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            if($record_type == "F" || $record_type == "O") {
                $user = $this->selecteerUser($row["user_id"]);
                $return[] = [
                    "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "text_inhoud" => $row["text_inhoud"],
                    "nummer" => $row["nummer"],
                    "user_id" => $row["user_id"],
                    "user_naam" => $user["user_naam"],
                    "user_foto" => $user["user_foto"],
                    "user_email" => $user["user_email"],
                    "user_wachtwoord" => $user["user_wachtwoord"],
                ];
            } elseif($record_type == "W" || $record_type == "B") {
                $return[] = [
                    "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "text_inhoud" => $row["text_inhoud"],
                    "nummer" => $row["nummer"],
                ];
            }

        }

        return $return;

    }

    public function addFavoriet($gerecht_id, $user_id) {
        $sql = "insert into detail_pagina_info (gerecht_id, record_type, user_id)
        values ($gerecht_id, 'F', $user_id)";
    }

    public function removeFavoriet($gerecht_id, $user_id) {
        $sql = "delete from detail_pagina_info where gerecht_id = $gerecht_id and record_type = 'F' and user_id = $user_id)"; 
    }

}