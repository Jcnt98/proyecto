<?php
/*
21 de Marzo 2020
Este archivo valida las credenciales que vienen del index.html
Es llamado por la funcion validacion_login al inicio del archivo index.html
*/

//Incluimos el código de la conexion a la bd
include('database.php');


if(isset($_POST['validacion_login'])){
    $usuario=$_POST['usuario'];
    $password=$_POST['password'];
    //Realizamos la consulta
    $consulta="SELECT * FROM cat_usuarios WHERE username='$usuario' AND password='$password'";
    $resultado=mysqli_query($conexion,$consulta);
    if($filas=mysqli_fetch_array($resultado)){
        $_SESSION['usuario']=$usuario;
        echo "success";
    }else{
        echo "fail";
    }//Fin else   
}//Fin if
mysqli_free_result($resultado);         //Liberamos el resultado
mysqli_close($conexion);                //Cerramos la conexion a la db
?>