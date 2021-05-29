<?php
session_start();
include "database.php";
include "mostrar_tabla_apartado.php";

if(empty($_GET["periodo"])){
	$periodo="0";
}else{
	$periodo=$_GET["periodo"];
}//Fin del else

$respuesta=array();

if($periodo!=0){
    $sql="select id from cuestionario where periodo like '".$periodo."' ";
    $result=mysqli_query($conexion,$sql);
    $col_cuestionario=mysqli_fetch_assoc($result);
    $sql="select * from cat_apartado where id_cuestionario like '".$col_cuestionario[0]."'";//Consultar id de la variable
    echo $sql;
    $result=mysqli_query($conexion,$sql);
	$num=mysqli_num_rows($result);
	if($result){
        $respuesta['valor']="ok";
        $respuesta['tabla']=mostrar_tabla_apartado($col_cuestionario[0]);
    }else{
        $respuesta['valor']="¡No se encontró ninguna variable!";
    }//Fin del else
}//Fin del if
echo json_encode($respuesta);


?>