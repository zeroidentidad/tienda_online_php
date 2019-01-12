<?php
session_start();
if(!isset($_SESSION["contador"])){ $_SESSION["contador"]=0;}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Tienda online</title>
	<link rel="stylesheet" type="text/css" href="./css/movil.css" media="screen and (min-width:1px) and (max-width:800px)">
	<link rel="stylesheet" type="text/css" href="./css/pcmac.css" media="screen and (min-width:801px) and (max-width:4000px)">
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
	<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="./js/codigo.js?v=<?php echo(rand()); ?>"></script>
</head>
<body>
	<div id="contenedor">
		<header>
			<a href="./index.php"><h1>Tienda online</h1></a>
			<h2>Un negocio XXX</h2>
		</header>
		<section>
			<div id="contienecarrito">
			<div id="carrito" style="background:rgb(200,200,200); color:black">
				Carrito
			</div>
			<a href="./php/destruir.php"><button>Limpiar</button></a>
			<a href="./confirmar.php"><button>Confirmar compra</button></a>
			</div>
			<br>