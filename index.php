<?php

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
require_once("lib/detail_pagina_info.php");
require_once("lib/gerecht.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());
$us = new user($db->getConnection());
$kt = new keuken_type($db->getConnection());
$ing = new ingredient($db->getConnection());
$det = new detail_pagina_info($db->getConnection());
$ger = new gerecht($db->getConnection());


/// VERWERK 
//$data = $art->selecteerArtikel(5);
//$data = $us->selecteerUser(4);
//$data = $kt->selecteerKeuken_Type(3);
//$data = $ing->selecteerIngredient(2);
//$data = $det->addFavoriet(1);
//$data - $det->removeFavoriet(2);
//$data = $det->selecteerDetail_Pagina_Info(1);
//$data = $ger->selecteerUser(1);
//$data = $ger->selecteerIngredient(1);
//$data = $ger->berekenCalorieen(1);
//$data = $ger->berekenPrijs(1);
//$data = $ger->selecteerWaardering(1);
$data = $ger->selecteerBereidingswijze(1);
//$data = $ger->selecteerOpmerkingen(1);
//$data = $ger->selecteerGerecht(3);

/// RETURN

echo "<pre>";
var_dump($data);