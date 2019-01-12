<?php include("../php/config.inc"); ?>
<table border="1">
<?php
$conexion = mysqli_connect($servidor, $usuario, $contrasena, $basedatos);
mysqli_set_charset($conexion,"utf8");
$peticion = "select pedidos.id as idpedido, pedidos.*, clientes.* from pedidos left join clientes on pedidos.idcliente=clientes.id order by estado, fecha asc";
$resultado = mysqli_query($conexion, $peticion);

while($fila=mysqli_fetch_array($resultado)){
	$estado=$fila["estado"];
	//if ($estado==0) { $diestado="sin entregar"; }else{ $diestado="entregado"; }
	switch ($estado) {
		case 0: $diestado="sin entregar"; break;
		case 1: $diestado="entregado"; break;
		case 2: $diestado="cancelado"; break;			
	}
	echo '<tr';	
	//if ($estado==0) { echo ' style="background:rgb(255,200,200);"'; }else{ echo ' style="background:rgb(200,255,200);"'; }
		switch ($estado) {
		case 0: echo ' style="background:rgb(255,200,200);"'; break;
		case 1: echo ' style="background:rgb(200,255,200);"'; break;
		case 2: echo ' style="background:rgb(255,255,200);"'; break;			
		}
	echo '><td>'.$fila["nombre"]." ".$fila["apellidos"].'</td><td>'.date("M d Y H:i:s",$fila["fecha"]).'</td><td>'.$diestado.'</td><td><a href="./controlpedidos.php?id='.$fila["idpedido"].'"><button>Control</button></a></td><td><a href="../php/pedidoservido.php?id='.$fila["idpedido"].'"><button>Pedido servido</button></a></td><td><a href="../php/cancelarpedido.php?id='.$fila["idpedido"].'"><button>Anular pedido</button></a></td></tr>';
}
mysqli_close($conexion);

?>
</table>