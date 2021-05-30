<?php
include_once './database2.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$apartado_descripcion = (isset($_POST['apartado_descripcion'])) ? $_POST['apartado_descripcion'] : '';
$id_cuestionario = (isset($_POST['id_cuestionario'])) ? $_POST['id_cuestionario'] : '';
$id_apartado = (isset($_POST['id_apartado'])) ? $_POST['id_apartado'] : '';
$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';



switch($opcion){
    case 1:
        $consulta = "INSERT INTO cat_apartado (id_cuestionario, descripcion) VALUES('$id_cuestionario', '$apartado_descripcion') ";			
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 
        
        $consulta = "SELECT * FROM cat_apartado WHERE id_cuestionario='$id_cuestionario'";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);       
        break;    
    case 2:        
        $consulta = "UPDATE usuarios SET username='$username', first_name='$first_name', last_name='$last_name', gender='$gender', password='$password', status='$status' WHERE user_id='$user_id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        
        $consulta = "SELECT * FROM usuarios WHERE user_id='$user_id' ";       
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 3:        
        $consulta = "DELETE FROM usuarios WHERE user_id='$user_id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;
    case 4:    
        $consulta = "SELECT * FROM cat_pregunta WHERE id_apartado='$id_apartado'";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);//envio el array final el formato json a AJAX
$conexion=null;