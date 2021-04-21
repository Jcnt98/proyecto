<?php
include('database.php');

$empleadoBuscado = $_POST['empleado'];
if ($empleadoBuscado==" "||$empleadoBuscado=="") {
    return false;
} else {
    $consulta = "SELECT nombre,apellidoPat,apellidoMat,cod_empleado FROM cat_empleado WHERE nombre LIKE '%$empleadoBuscado%'";
    $resultado=mysqli_query($conexion,$consulta);
    while($row=mysqli_fetch_assoc($resultado)) {
        $nombre = "'".$row['nombre'].' '.$row['apellidoPat'].' '.$row['apellidoMat']."'";
        echo '<tr id="trEmpleadoBuscado"  onclick="seleccionarPersona('.$nombre.')">';
        echo '<td id="tdEmpleadoBuscado">'.($row['nombre'].' '.$row['apellidoPat'].' '.$row['apellidoMat'].' - '.$row['cod_empleado']).'</td>';
        echo '</tr>';
    };
mysqli_free_result($resultado);         //Liberamos el resultado
mysqli_close($conexion);                //Cerramos la conexion a la db

};


?>