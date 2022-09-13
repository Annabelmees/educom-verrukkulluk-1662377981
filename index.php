<?php

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingrediënt.php");
//require_once("lib/detail_pagina_info.php");
//require_once("lib/gerecht.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());
$us = new user($db->getConnection());
$kt = new keuken_type($db->getConnection());
$ing = new ingrediënt($db->getConnection());
//$det = new detail_pagina_info($db->getConnection());
//$ger = new gerecht($db->getConnection());


/// VERWERK 
//$data = $art->selecteerArtikel(5);
//$data = $us->selecteerUser(4);
//$data = $kt->selecteerKeuken_Type(3);
$data = $ing->selecteerIngrediënt(2);
//$data = $det->selecteerDetail_Pagina_Info(2);
//$data = $ger->selecteerGerecht(1)

/// RETURN

echo "<pre>";
var_dump($data);

