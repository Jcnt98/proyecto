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
    $consulta = "SELECT id FROM cuestionario WHERE periodo = '$anioFinal'";
    $resultado=mysqli_query($conexion,$consulta);
    $row=mysqli_fetch_assoc($resultado);
    $anioEvaluacion = $row['id']; //Obtenemos el id de la evaluación correspondiente al año.

    //Procedemos a obtener los apartados $resultado1 y $row1
    $consulta = "SELECT id, descripcion FROM cat_apartado WHERE id_cuestionario = '$anioEvaluacion'";
    $resultado1=mysqli_query($conexion,$consulta);
    while($row1=mysqli_fetch_assoc($resultado1)) {
        echo "  <div class='row' id='apartado'>
                    <h4>Apartado ".$row1['id'].". ".$row1['descripcion']."</h4>
                    <label>Ingresa el valor del apartado.</label>
                    <div class='row' id='rowValorApartado'><div class='col-xs-12 col-sm-12 col-md-12 col-lg-2' >Valor del apartado: </div> <div class='col-xs-12 col-sm-12 col-md-12 col-lg-10'><input class='inputRedondo' type='text' placeholder='0%'></div></div> 
                </div>";
        //Procedemos a obtener las preguntas del apartado correspondiente. $resultado2 $row2    
        $idapartado = $row1['id'];
        $consulta = "SELECT * FROM cat_pregunta WHERE id_apartado = '$idapartado'";
        $resultado2=mysqli_query($conexion,$consulta);
        while($row2=mysqli_fetch_assoc($resultado2)){
            echo "  <div class='row' id='pregunta'>
                        <b>".$row2['id'].". ".$row2['concepto']."</b>
                        <p>".$row2['descripcion'].".</p>  
                    </div>
                    <div class='row' id='respuestas'>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='noAplica' value='0'>No Aplica</button>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='noSatisfactorio' value='1'>No Satisfactorio</button>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='regularmenteSatisfactorio' value='2'>Regularmente <br> Satisfactorio</button>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='medianamenteSatisfactorio' value='3'>Medianamente <br> Satisfactorio</button>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='satisfactorio' value='4'>Satisfactorio</button>
                        <button class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3' id='sobresaliente' value='5'>Sobresaliente</button>
                        <textarea disabled class='btn col-xs-12 col-sm-12 col-md-12 col-lg-3-xs-12 col-sm-12 col-md-12 col-lg-2'>Puntos acumulados ## / ##</textarea>
                    </div>
                    ";
        };
    };
    
};//Fin else...



?>