<?php
include('database.php');

if(empty($_POST['id_apartado'])){
	$id_apartado="0";
}else{
    $id_apartado=$_POST['id_apartado'];
}//Fin del if

if(empty($_POST['num_preguntas'])){
	$num_preguntas="0";
}else{
    $num_preguntas=$_POST['num_preguntas'];
}//Fin del if

if(empty($_POST['descripcion_apartado'])){
	$descripcion_apartado="0";
}else{
    $descripcion_apartado=$_POST['descripcion_apartado'];
}//Fin del if


if(($id_apartado!=0)&&($descripcion_apartado!=0)){
    //Se busca el id del ultimo cuestionario insertado
    $sql="select MAX(id) from cuestionario";
    $result=mysqli_query(conectar(),$sql);
    desconectar();
    $num=mysqli_num_rows($result);
    if ($num>0){
        $col_cuestionario=mysqli_fetch_array($result);
        $sql="insert into cat_apartado (id_cuestionario, descripcion) values ('".$col_cuestionario[0]."','".$descripcion_apartado."')";
        $result=mysqli_query(conectar(),$sql);
        desconectar();
        $sql="select MAX(id) from cat_apartado";
        $result=mysqli_query(conectar(),$sql);
        desconectar();
        $num=mysqli_num_rows($result);
        if ($num>0){
            $col_apartado=mysqli_fetch_array($result);
            $i=0;
            for($i = $num_preguntas; ; $i++){
                $descripcion_variable = 
            }//Fin del for
        }//Fin del if
    }//Fin del if
    
}