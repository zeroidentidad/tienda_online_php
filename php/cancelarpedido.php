<?php include("./config.inc"); ?>
<?php
$conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedatos);
mysqli_set_charset($conexion,"utf8");
$peticion = "update pedidos set estado=2 where id=".$_GET["id"];
$resultado = mysqli_query($conexion, $peticion);

mysqli_close($conexion);

?>
<script type="text/javascript">
	window.location="../admin/pedidos.php";
</script>