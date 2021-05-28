<?php
session_start();
include "conexion.php";
include "funciones.php";

if(empty($_GET["periodo"])){
	$periodo="0";
}else{
	$periodo=$_GET["periodo"];
}//Fin del else

$respuesta=array();

if($apartado!=0){
    $sql="select id from cuestionario where periodo like '".$periodo."' ";
    $result=mysqli_query(conectar(),$sql);
    desconectar();
    $col_cuestionario=mysqli_fetch_array($result);
    $sql="select * from cat_apartado where id_cuestionario like '".$col_cuestionario[0]."'";//Consultar id de la variable
    $result=mysqli_query(conectar(),$sql);
	desconectar();
	$num=mysqli_num_rows($result);
	if($result){
        $respuesta_variables['valor']="ok";
        $respuesta_variables['tabla']=mostrar_tabla_apartado($periodo);
    }else{
        $respuesta_variables['valor']="¡No se encontró ninguna variable!";
    }//Fin del else
}//Fin del if
echo json_encode($respuesta_variables);
?>