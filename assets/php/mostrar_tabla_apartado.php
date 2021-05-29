<?php
include "database.php";

function mostrar_tabla_apartado($id_cuestionario){
    $html="";
    /*if($apartado=="0"){*/
        $aux=" where id_cuestionario like '".$id_cuestionario."'";
    /*}else{
        $variable=" where id like '".$id_apartado."' and periodo like '".$id_cuestionario."' order by orden";
    }*/
    $sql="select id, descripcion from cat_apartado ".$aux."";
    $result_apartados=mysqli_query($conexion,$sql);
    $num=mysqli_num_rows($result_apartados);
    if ($num>0){
        $i=1;
        $html="<div class='form-group col-sm-12'>";
        $html.="<p>Listado de apartados registrados para la evaluación.</p>";
        $html.="<table class='table table-striped table-hover'>";
        $html.="<thead class='table-secondary'>";
            $html.="<tr>";
                $html.="<th scope='col'>#</th>";
                $html.="<th scope='col'>Descripción del apartado</th>";
                $html.="<th scope='col'>Acciones</th>";
            $html.="</tr>";
        $html.="</thead>";    
        while($col_apartados=mysqli_fetch_assoc($result_apartados)){
            $html.="<tbody>";
                $html.="<tr>";
                    $html.="<td scope='row' style='text-align:center'>".$i."</td>";
                    $html.="<td><input disabled='disabled' id='input_apartado&".$id_cuestionario."&".$col_apartados['id']."' value='".$col_apartados['descripcion']."'></input></td>";
                    $html.="<td class=''>";
                        $html.="<div class='btn-group'>";
                            $html.="<button id='input_apartado&".$id_cuestionario."&".$col_apartados['id']."' class='btn btn-outline-dark'><svg width='20' height='20' focus='true'><use xlink:href='../bootstrap/icons/bootstrap-icons.svg#pencil-square'/></svg></button>";
                            $html.="<button id='input_apartado&".$id_cuestionario."&".$col_apartados['id']."' class='btn btn-outline-dark'><svg width='20' height='20' focus='true'><use xlink:href='../bootstrap/icons/bootstrap-icons.svg#x-circle-fill'/></svg></button>";
                        $html.="</div>";
                    $html.="</td>";
                $html.="</tr>";
            $html.="</tbody>";
            $i+=1;
        }//Fin del while
        $html.="</table>";
        $html.="</div>";
    }else{
        $html="";
    }
    return $html;
}
?>