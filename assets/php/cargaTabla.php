<?php

    include('database.php');

    $anio = $_POST['inputAnio'];
    //Identificamos el id del cuestionario para poder obtener sus apartados
    $consulta = "SELECT id FROM cuestionario WHERE periodo = '$anio'";
    $resultado=mysqli_query($conexion,$consulta);
    $row=mysqli_fetch_assoc($resultado);
    //Procedemos a consultar los apartados del cuestionario
    $consulta = "SELECT * FROM cat_apartado WHERE id_cuestionario = '$row'";
    $resultado=mysqli_query($conexion,$consulta);
    $i=0;
    while($row=mysqli_fetch_assoc($resultado) {
        $i++;
        echo '
            <tr>
                <th scope="row">'.$i.'</th>
                <td >'.$row['descripcion'].'</td>
                <td class="">
                <div class="btn-group">
                    <button class="btn btn-outline-dark"><svg width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#pencil-square"/></svg></button>
                    <button class="btn btn-outline-dark"><svg  width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#x-circle-fill"/></svg></button>
                </div>
                </td>
            </tr>
        ';//Fin del echo
    };//Fin while
?>