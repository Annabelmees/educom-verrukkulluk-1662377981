<?php

class detail_pagina_info {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function addFavoriet($gerecht_id) {
        $sql = "insert into detail_pagina_info (gerecht_id, record_type, user_id)
        values ($gerecht_id, 'F', '$user_id')";
    }

    public function removeFavoriet($gerecht_id) {
        $sql = "delete from detail_pagina_info where gerecht_id = $gerecht_id and record_type = 'F' and user_id = $user_id)"; 
    }

    public function selecteerDetail_Pagina_Info($gerecht_id) {

        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id";

        $result = mysqli_query($this->connection, $sql);
        $return = [];

        while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {    
            $return[] = [
                "gerecht_id" => $row["gerecht_id"],
                "detail_pagina_info_id" => $row["detail_pagina_info_id"],
                "record_type" => $row["record_type"],
                "text_inhoud" => $row["text_inhoud"],
                "nummer" => $row["nummer"],
            ];
        
        //voor $row["record_type"] == "F" || "O", foreign key afdwingen in code

        }   
        
        return $return;

    }

}