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
				//alert(response);
				if(response=="1"){
                    alert('si entro');
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html('<div id="alert" style="display: none;"> \
                    <div id="alert_evaluacion" class="alert alert-warning" role="alert" style="display: none;"> \
                    </div> \
                    <p>¿Deseas editar la evaluacion?</p> \
                    <button type="button" id="boton_yes" class="btn btn-outline-warning">Si</button> \
                    <button type="button" id="boton_no" class="btn btn-outline-danger">No</button> \
                  </div>');
					/*$("#alert").show();
					$("#alert_evaluacion").show();
					$("#alert_evaluacion").html("Ya existe una evaluación para el año "+anio);
					$('#boton_yes').show();
					$('#boton_no').show();*/
				}else{
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html(response);
				}
			}
        });//Fin ajax...
    };
};//Fin crearEvaluacion

function validar_entrada_texto(id){
	var aux=document.getElementById(id).value;
	var cant='';
	for(var i=0;i<aux.length;i++){
		if((aux.charAt(i)==".")||(aux.charAt(i)==",")||(aux.charAt(i)=="$")||(aux.charAt(i)=="")||(aux.charAt(i)=="(")||(aux.charAt(i)==")")||(aux.charAt(i)=="*")||(aux.charAt(i)=='0')||(aux.charAt(i)=='1')||(aux.charAt(i)=='2')||(aux.charAt(i)=='3')||(aux.charAt(i)=='4')||(aux.charAt(i)=='5')||(aux.charAt(i)=='6')||(aux.charAt(i)=='7')||(aux.charAt(i)=='8')||(aux.charAt(i)=='9')){
			alert("Solo se permite ingresar letras");
		}else{
				if(i==0){
					cant=aux.charAt(i);
				}else{
					cant+=aux.charAt(i);
				}//Fin del else..
		}//Fin del else
	}//Fin del for
	document.getElementById(id).value=cant;
}//Fin de validar entrada..

function validar_entrada(id){
	var aux=document.getElementById(id).value;
	var cant='';
	for(var i=0;i<aux.length;i++){
		if((aux.charAt(i)==".")||(aux.charAt(i)==",")||(aux.charAt(i)==" ")||(aux.charAt(i)=="$")||(aux.charAt(i)=="")||(aux.charAt(i)=="(")||(aux.charAt(i)==")")||(aux.charAt(i)=="*")){
			alert("Caracter inválido");
		}else{
			if((aux.charAt(i)=='0')||(aux.charAt(i)=='1')||(aux.charAt(i)=='2')||(aux.charAt(i)=='3')||(aux.charAt(i)=='4')||(aux.charAt(i)=='5')||(aux.charAt(i)=='6')||(aux.charAt(i)=='7')||(aux.charAt(i)=='8')||(aux.charAt(i)=='9')){
				if(i==0){
					cant=aux.charAt(i);
				}else{
					cant+=aux.charAt(i);
				}//Fin del else..
			}else{
				alert("Solo se permite ingresar números")
			}
		}//Fin del else
	}//Fin del for
	document.getElementById(id).value=cant;
}//Fin de validar entrada..