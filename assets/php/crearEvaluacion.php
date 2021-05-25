<?php
    include('database.php');

    $anio = $_POST['anio'];
    $nombreCuestionario = "Evaluación de desempeño del $anio";//Esta variable es estatica, ya que no se considero en los inputs de la pantalla
    $descripcionCuestionario = "Descripción genérica para el cuestionario del año $anio";//Esta variable es estatica, ya que no se considero en los inputs de la pantalla
    //Validamos si ya existe una evaluación para el año introducido
    $consulta = "SELECT periodo FROM cuestionario WHERE periodo LIKE '$anio'";
    $resultado=mysqli_query($conexion,$consulta);
    $resultado=mysqli_fetch_assoc($resultado);
    if ($resultado != null) {
        //Si ya existe una evaluación, imprimimos una alerta y lo sacamos de la función
        //echo "Ya existe una evaluación para el año $anio";
        echo "Ya existe una evaluacion";
        return false;
    }else {
    /* CODIGO PARA INSERTAR APARTADO 1 Y PREGUNTA 1
        //Iniciamos la creacion del cuestionario 
        //Insertamos los datos iniciales del cuestionario (nombre, descripcion y anio)
        $datosCuestionario = "INSERT INTO cuestionario (nom_cuestionario,objetivo,periodo) VALUES ('$nombreCuestionario','$descripcionCuestionario','$anio') ";
        mysqli_query($conexion, $datosCuestionario);
        //Insertamos el apartado 1 y la pregunta 1 en la base de datos
        //Insertamos el apartado...
        $consulta = "SELECT id FROM cuestionario WHERE periodo LIKE '$anio'";
        $resultado=mysqli_query($conexion,$consulta);
        $resultado=mysqli_fetch_assoc($resultado); 
        $consulta = "INSERT INTO cat_apartado (id_cuestionario) VALUES ('".$resultado['id']."')";
        $resultado=mysqli_query($conexion,$consulta); 
        //Insertamos la pregunta...
        $idApartado = mysqli_insert_id($conexion); //Obtenemos el id del apartado recien insertado 
        $consulta = "INSERT INTO cat_pregunta (id_apartado) VALUES ('$idApartado')";
        $resultado=mysqli_query($conexion,$consulta);
        //Iniciamos los contadores de apartados y preguntas.
        */
        $apartados = 1;
        $preguntas = 1;
        
        echo '
            <!--APARTADO-->
            <div class="row" id="secciones" >
                <div class="row" id="apartado" >
                    <h4>Apartado '.$apartados.'</h4>
                    <label>Escriba la descripción del apartado.<p class="ejemplo">Ej. Conocimientos Generales y Específicos</p></label>
                    <div class="row">
                        <div class="form-group">
                          <textarea name="descripcionApartado" class="form-control" maxlength="500" rows="3" onchange="" placeholder="Conocimientos Generales y Específicos"></textarea>
                        </div>
                        <div class="row rowBotonSecciones">
                          <div class="col"><button class="btn btnGuardar">Guardar apartado</button></div> 
                        </div>
                        <div class="row rowBotonSecciones">
                          <div class="col"><button class="btn btnEliminar">Eliminar apartado</button></div> 
                        </div>
                    </div> 
                </div>
            </div>
            <!--FIN APARTADO--> 
            <!--PREGUNTA-->
            <div id="pregunta&'.$preguntas.'&'.$apartados.'">
                <div class="row" name="pregunta'.$preguntas.'" id="secciones">
                    <div id="pregunta" class="row">
                        <h4>Pregunta '.$preguntas.'</h4> 
                        <label> Escriba el título de la pregunta sin numerar la misma. <p class="ejemplo">Ej. Legalidad</p></label>
                        <div class="row">
                            <div class="form-group">
                                <textarea id="tituloPreg&'.$preguntas.'&'.$apartados.'" name="tituloPregunta" maxlength="500" class="form-control" rows="1" placeholder="Legalidad"></textarea>
                            </div>
                            <div class="form-group">
                                <label> Escriba la descripción de la pregunta  <p class="ejemplo">Ej. Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche.</p></label>
                                <textarea id="descPreg&'.$preguntas.'&'.$apartados.'" name="descripcionPregunta" maxlength="500" class="form-control" rows="3" placeholder="Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche. "></textarea>
                            </div>
                            <div class="row rowBotonSecciones">
                                <div class="col"><button id="agregarPregunta&'.$preguntas.'&'.$apartados.'" class="btn btnPreguntaNueva" onclick="nuevaPregunta('.$preguntas.','.$apartados.')">Pregunta nueva</button></div> 
                            </div> 
                            <div class="row rowBotonSecciones">
                                <div class="col"><button onclick="eliminarPregunta('.$preguntas.')" class="btn btnEliminar">Eliminar pregunta</button></div> 
                            </div> 
                            <div class="row rowBotonSecciones">
                                <div class="col" "><button id="agregarApartado&'.$preguntas.'&'.$apartados.'" onclick="agregarApartado('.$apartados.')" class="btn btnNuevoApartado">Nuevo apartado</button></div> 
                            </div> 
                        </div> 
                    </div>
                </div>
            </div>
            <!--FIN PREGUNTA-->
        ';
        
        
    };//Fin else...
    



?>