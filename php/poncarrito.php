<?php 
session_start();
$_SESSION["producto"][$_SESSION["contador"]] = $_GET["p"];
$_SESSION["contador"]++;
	for($i=0;$i<count($_SESSION["contador"]);$i++){
		echo "Producto: ".$_SESSION["producto"][$i]."<br>";
	}
?>