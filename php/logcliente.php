<?php
//session_start();
include("./config.inc");
include("./cabecera.inc");

$contador=0;
$conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedatos);
mysqli_set_charset($conexion,"utf8");
$peticion = "select * from clientes where usuario='".$_POST["usuario"]."' AND contrasena='".$_POST["contrasena"]."'";
$resultado = mysqli_query($conexion, $peticion);

while($fila=mysqli_fetch_array($resultado)){
	$contador++;
	$_SESSION["usuario"] = $fila["id"];
}
if ($contador>0) {
	$peticion = "insert into pedidos values(NULL,".$_SESSION["usuario"].",'".date('U')."','0')";
	$resultado = mysqli_query($conexion, $peticion);

	$peticion = "select * from pedidos where idcliente='".$_SESSION["usuario"]."' order by fecha desc limit 1";
	$resultado = mysqli_query($conexion, $peticion);

	while($fila=mysqli_fetch_array($resultado)){
	$_SESSION["idpedido"] = $fila["id"];
	}
	echo $_SESSION["idpedido"];

	for($i=0;$i<$_SESSION["contador"];$i++){
		$peticion = "insert into lineaspedido values (NULL,".$_SESSION["idpedido"].",".$_SESSION["producto"][$i].",1)";
		$resultado = mysqli_query($conexion, $peticion);

		$peticion = "select * from productos where id=".$_SESSION["producto"][$i];
		$resultado = mysqli_query($conexion, $peticion);
		while($fila=mysqli_fetch_array($resultado)){
			$existencias = $fila["existencias"];

			$peticion2 = "update productos set existencias=".($existencias-1)." where id=".$_SESSION["producto"][$i];
			$resultado2 = mysqli_query($conexion, $peticion2);
		}	
	}	

	echo "<br>Pedido realizado correctamente. Redirigiendo a pagina principal en 4 segundos...";
	echo '<meta http-equiv="refresh" content="4; url=../index.php">';

}else{
	echo "El usuario no existe. Regresando a la tienda en 4 segundos...";
	echo '<meta http-equiv="refresh" content="4; url=../confirmar.php">';
}
mysqli_close($conexion);

include("./piedepagina.inc");
?>