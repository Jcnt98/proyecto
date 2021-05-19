function crearEvaluacion(){
    if ($("#inputAnio").val() == "") {
        alert("Es necesario introducir un año para crear una evaluación");
    }else{
        var anio = $("#inputAnio").val();
        $.ajax({
            type:'post',
            url: '../php/crearEvaluacion.php',
            data: {anio:anio},
            success:function(response){
                $("#evaluacion").css('display','block');
                $("#evaluacion").html(response);
                
            }
        });//Fin ajax...
    };
};//Fin crearEvaluacion