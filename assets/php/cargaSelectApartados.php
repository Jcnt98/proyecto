<?php
include 'database.php';

$id_cuestionario = (isset($_POST['id_cuestionario'])) ? $_POST['id_cuestionario'] : '';

$consulta = "SELECT * FROM cat_apartado WHERE id_cuestionario = '$id_cuestionario'";
$resultado=mysqli_query($conexion,$consulta);
$i=0;
echo '<option value="0">Selecciona un apartado</option>';
while($row=mysqli_fetch_assoc($resultado)){
    $i++;
    echo '<option value="'.$row['id'].'">'.$i.'.'.$row['descripcion'].'</option>';
};




?>