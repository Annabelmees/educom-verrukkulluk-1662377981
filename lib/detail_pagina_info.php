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

    private function addFavoriet($gerecht_id) {
        $sql = "insert into detail_pagina_info (gerecht_id, record_type, user_id)
        values ($gerecht_id, 'F', '$user_id')";
    }

    private function removeFavoriet($gerecht_id) {
        $sql = "delete from detail_pagina_info where gerecht_id = $gerecht_id and record_type = 'F' and user_id = $user_id)"; 
    }

    public function selecteerDetail_Pagina_Info($gerecht_id) {

        $sql = "select * from detail_pagina_info where gerecht_id = $gerecht_id";

        $result = mysqli_query($this->connection, $sql);
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return $row;

    }

}

//probleem = hoe selecteer ik alle instanties van gerecht_id = $gerecht_id? 
//met mysqli_fetch_all herkent ie $user(_id) niet en kan ik niet 1 column ($row["record_type"]) aanhalen