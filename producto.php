<?php include("./php/cabecera.inc"); ?>
<?php include("./php/config.inc"); ?>

<?php
$conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedatos);
mysqli_set_charset($conexion,"utf8");
$peticion = "select * from productos where id=".$_GET["id"]." LIMIT 1";
$resultado = mysqli_query($conexion, $peticion);

while($fila=mysqli_fetch_array($resultado)){
	echo "<article>";
	echo "<a href='producto.php?id=".$fila["id"]."'><h3>".$fila["nombre_producto"]."</h3></a>";
	echo "<p>".$fila["descripcion"]."<p>";
	echo "<p> Precio: $ ".$fila["precio"]."<p>";

	$peticion2 = "select * from imagenesproductos where idproducto=".$fila["id"]."";
	$resultado2 = mysqli_query($conexion, $peticion2);
	while($fila2=mysqli_fetch_array($resultado2)){
		echo "<img src='./fotos/".$fila2["imagen"]."' width='100px' />";
	}
	print '<br>';
	echo "<a href='producto.php?id=".$fila["id"]."'><button>Más información</button></a>";
	echo "<button class='botoncompra' value=".$fila["id"].">Comprar ahora</button>";
	echo "</article>";
}
mysqli_close($conexion);

?>

<?php include("./php/piedepagina.inc") ?>