<?php include("./config.inc"); ?>
<?php 
session_start();
$suma = 0;
if(isset($_GET["p"])){
	$_SESSION["producto"][$_SESSION["contador"]] = $_GET["p"];
	$_SESSION["contador"]++;
}

$conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedatos);
mysqli_set_charset($conexion,"utf8");

print "<table>";
for($i=0;$i<$_SESSION["contador"];$i++){
	//echo "Producto: ".$_SESSION["producto"][$i]."<br>";
	$peticion = "select * from productos where id=".$_SESSION["producto"][$i];
	$resultado = mysqli_query($conexion, $peticion);

	while($fila=mysqli_fetch_array($resultado)){
		echo "<tr><td>".$fila["nombre_producto"]."</td><td>".$fila["precio"]."</td></tr>";
		$suma+=$fila["precio"];
	}
}
echo "<tr><td>Subtotal</td><td>".number_format($suma,2)."</td></tr>";
print "</table>";

mysqli_close($conexion);

?>