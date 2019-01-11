$(document).ready(inicio)
function inicio(){
$(".botoncompra").click(anade);
}
function anade(){
//$("#carrito").append($(this).val());
$("#carrito").load("./php/poncarrito.php?p="+$(this).val());
}