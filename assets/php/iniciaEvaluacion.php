<?php

$empleado = $_POST['empleadoEvaluado'];
$fechaInicial = $_POST['fechaInicial'];
$fechaFinal = $_POST['fechaFinal'];

$anioInicial = date("Y", strtotime($fechaInicial));//Extraemos el año de la fecha inicial.
$anioFinal = date("Y", strtotime($fechaFinal));//Extraemos el año de la fecha final.
//Comparamos que los años introducidos sean los mismos.
if($anioInicial!=$anioFinal){
    echo "<div class='alert alert-danger' role='alert'>Los periodos de la evaluación deben corresponder al mismo año!</div>";
    //echo '<script language="javascript">alert("Los periodos de la evaluación deben corresponder al mismo año!");</script>';
    return false;
}else{

    include('database.php');

    //Procedemos a obtener la evaluacion correspondiente
    $consulta = "SELECT id FROM datos_generales WHERE periodo = '$anioFinal'";
    $resultado=mysqli_query($conexion,$consulta);
    $row=mysqli_fetch_assoc($resultado);
    $anioEvaluacion = $row['id']; //Obtenemos el id de la evaluación correspondiente al año.

    //Procedemos a obtener los apartados $resultado1 y $row1
    $consulta = "SELECT id, descripcion FROM cat_apartado WHERE id_datosgenerales = '$anioEvaluacion'";
    $resultado1=mysqli_query($conexion,$consulta);
    $no_pregunta=0; //Este es el número que indica el orden de la pregunta por apartado. Ej. AP 1 Preg 1 Preg 2...
    while($row1=mysqli_fetch_assoc($resultado1)) {
        echo "  <div class='row' id='apartado'>
                    <hr>
                    <b>Apartado ".$row1['id'].". ".$row1['descripcion']."</b>
                    <div class='row' id='rowValorApartado'><div class='col-xs-12 col-sm-12 col-md-12 col-lg-2' >Valor del apartado: </div> <div class='col-xs-12 col-sm-12 col-md-12 col-lg-10'><input class='inputRedondo' type='text' placeholder='10%'></div></div> 
                </div>";
        //Procedemos a obtener las preguntas del apartado correspondiente. $resultado2 $row2    
        $idapartado = $row1['id'];
        $consulta = "SELECT * FROM cat_pregunta WHERE id_apartado = '$idapartado'";
        $resultado2=mysqli_query($conexion,$consulta);
        while($row2=mysqli_fetch_assoc($resultado2)){
            $no_pregunta++;//Incrementamos el contador cada vez que se imprima una pregunta.
            echo "  <div class='row' id='pregunta'>
                        <b>".$no_pregunta.". ".$row2['concepto']."</b>
                        <p>".$row2['descripcion'].".</p>  
                    </div>
                    <div class='row' id='respuestas'>
                        <button class='btn col' id='noAplica' value='0'>No Aplica</button>
                        <button class='btn col' id='noSatisfactorio' value='1'>No Satisfactorio</button>
                        <button class='btn col' id='regularmenteSatisfactorio' value='2'>Regularmente <br> Satisfactorio</button>
                        <button class='btn col' id='medianamenteSatisfactorio' value='3'>Medianamente <br> Satisfactorio</button>
                        <button class='btn col' id='satisfactorio' value='4'>Satisfactorio</button>
                        <button class='btn col' id='sobresaliente' value='5'>Sobresaliente</button>
                    </div>";
        };
        $no_pregunta=0;//Reiniciamos el contador para que al imprimir otro apartado la primera pregunta sea la no.1
    };
    
};//Fin else...



?>