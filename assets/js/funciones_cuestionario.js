function crearEvaluacion(){
	//Funcion para crear una evaluación en la pantalla del administrador. Es llamada por el archivo cuestionario.html
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
				if(response=="Ya existe una evaluacion"){//Ya existe una evaluacion para ese año, por lo que ofreceremos la opción para editarlo.
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html('	<div id="alert"> \
                    							<div id="alert_evaluacion" class="alert alert-warning" role="alert"> \
													<p>Ya existe una evaluación para ese año ¿Deseas editar la evaluacion?</p>\
												</div> \
                    							<button type="button" id="boton_yes" class="btn btn-outline-warning">Si</button> \
                    							<button type="button" id="boton_no" class="btn btn-outline-danger">No</button> \
                  							</div>');
				}else{//En este caso no se encontro ninguna evaluacion, asi que procedemos a imprimir la pantalla de creacion.
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html(response);
					$("#inputAnio").prop('disabled', true);
					$("#divBotones").html('<button id="btn_guardarEvaluacion" class="btn btnCrear" onclick="guardarEvaluacion()">Guardar Evaluación</button>');
				};
			}
        });//Fin ajax...
    };
};//Fin crearEvaluacion

function nuevaPregunta(noPregunta,noApartado){
	document.getElementById("agregarPregunta&"+noPregunta+"&"+noApartado).hidden = true;
	document.getElementById("agregarApartado&"+noPregunta+"&"+noApartado).hidden = true;
	noPregunta++;
	document.getElementById("boton_&"+noApartado).value = noPregunta;
	document.getElementById("evaluacion").innerHTML += '	\
	<div id="pregunta&'+noPregunta+'&'+noApartado+'">	\
		<div  class="row"  id="secciones"> \
			<div class="row" id="pregunta"> \
				<h4>Pregunta '+noPregunta+' </h4> \
				<label> Escriba el título de la pregunta sin numerar la misma. <p class="ejemplo">Ej. Legalidad</p></label> \
				<div class="row"> \
					<div class="form-group"> \
						<textarea id="tituloPreg&'+noPregunta+'&'+noApartado+'" name="tituloPregunta" maxlength="500" class="form-control" rows="1" placeholder="Legalidad"></textarea> \
					</div> \
					<div class="form-group"> \
						<label> Escriba la descripción de la pregunta  <p class="ejemplo">Ej. Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche.</p></label>\
						<textarea id="descPreg&'+noPregunta+'&'+noApartado+'" name="descripcionPregunta" maxlength="500" class="form-control" rows="3" placeholder="Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche. "></textarea>\
					</div>\
					<div class="row rowBotonSecciones">\
						<div class="col"><button id="agregarPregunta&'+noPregunta+'&'+noApartado+'" class="btn btnPreguntaNueva" onclick="nuevaPregunta('+noPregunta+','+noApartado+')">Pregunta nueva</button></div> \
					</div> \
					<div class="row rowBotonSecciones">\
						<div class="col"><button class="btn btnEliminar" onclick="eliminarPregunta('+noPregunta+','+noApartado+')">Eliminar pregunta</button></div> \
					</div> \
					<div class="row rowBotonSecciones">\
						<div class="col" ><button id="agregarApartado&'+noPregunta+'&'+noApartado+'" onclick="agregarApartado('+noApartado+')" class="btn btnNuevoApartado">Nuevo apartado</button></div> \
					</div> \
				</div> \
			</div> \
		</div> \
	</div>';
};//Fin nuevaPregunta...

function eliminarPregunta(noPregunta,noApartado){
	if (noPregunta == 1) {
		alert("No existen preguntas para eliminar");
	}else{
		document.getElementById("pregunta&"+noPregunta+"&"+noApartado).remove();
		var noPreguntaAnterior = noPregunta-1;
		document.getElementById("agregarPregunta&"+noPreguntaAnterior+"&"+noApartado).hidden = false;
		document.getElementById("agregarApartado&"+noPreguntaAnterior+"&"+noApartado).hidden = false;
	};
};//Fin eliminarPregunta...

function agregarApartado(noApartado){
	var noPregunta = 1;
	noApartado++;
 document.getElementById("evaluacion").innerHTML += '\
 <!--APARTADO-->\
 <div class="row" id="secciones" >\
	 <div class="row" id="apartado">\
		 <h4>Apartado '+noApartado+'</h4> \
		 <label>Escriba la descripción del apartado.<p class="ejemplo">Ej. Conocimientos Generales y Específicos</p></label>\
		 <div class="row">\
			 <div class="form-group">\
			   <textarea id="descripcion_apartado&'+noApartado+'" name="descripcionApartado" class="form-control" maxlength="500" rows="3" onchange="" placeholder="Conocimientos Generales y Específicos"></textarea>\
			 </div>\
			 <div class="row rowBotonSecciones">\
			   <div class="col"><button id="boton_&'+noApartado+'" value="" class="btn btnGuardar">Guardar apartado</button></div>\
			 </div>\
			 <div class="row rowBotonSecciones">\
			   <div class="col"><button class="btn btnEliminar">Eliminar apartado</button></div> \
			 </div>\
		 </div> \
	 </div>\
 </div>\
 <!--FIN APARTADO-->    \
 <!--PREGUNTA-->\
 <div id="pregunta&'+noPregunta+'&'+noApartado+'">\
	 <div class="row" name="pregunta'+noPregunta+'" id="secciones">\
		 <div id="pregunta" class="row">\
			 <h4>Pregunta '+noPregunta+'</h4> \
			 <label> Escriba el título de la pregunta sin numerar la misma. <p class="ejemplo">Ej. Legalidad</p></label>\
			 <div class="row">\
				 <div class="form-group">\
					 <textarea id="tituloPreg&'+noPregunta+'&'+noApartado+'" name="tituloPregunta" maxlength="500" class="form-control" rows="1" placeholder="Legalidad"></textarea>\
				 </div>\
				 <div class="form-group">\
					 <label> Escriba la descripción de la pregunta  <p class="ejemplo">Ej. Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche.</p></label>\
					 <textarea id="descPreg&'+noPregunta+'&'+noApartado+'" name="descripcionPregunta" maxlength="500" class="form-control" rows="3" placeholder="Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche. "></textarea>\
				 </div>\
				 <div class="row rowBotonSecciones">\
					 <div class="col"><button id="agregarPregunta&'+noPregunta+'&'+noApartado+'" class="btn btnPreguntaNueva" onclick="nuevaPregunta('+noPregunta+','+noApartado+')">Pregunta nueva</button></div> \
				 </div> \
				 <div class="row rowBotonSecciones">\
					 <div class="col"><button onclick="eliminarPregunta('+noPregunta+','+noApartado+')" class="btn btnEliminar">Eliminar pregunta</button></div> \
				 </div> \
				 <div class="row rowBotonSecciones">\
					 <div class="col" "><button id="agregarApartado&'+noPregunta+'&'+noApartado+'" onclick="agregarApartado('+noApartado+')" class="btn btnNuevoApartado">Nuevo apartado</button></div> \
				 </div> \
			 </div> \
		 </div>\
	 </div>\
 </div>\
 <!--FIN PREGUNTA-->\
 ';
};

function guardarEvaluacion(){
	document.getElementById()
	tituloPreg&'+noPregunta+'&'+noApartado+'
	descPreg&'+noPregunta+'&'+noApartado+'
}

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

function guardar_apartado(id){
	var arreglo = id.split("&");
	var id_apartado = arreglo[1];

	if(window.XMLHttpRequest){//Code for IE7+, Firefox, Chrome, Opera, Safari..
		xmlhttp=new XMLHttpRequest();
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}//Fin del else..
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var valor=xmlhttp.responseText;
			//document.getElementById("formato_admin").innerHTML=xmlhttp.responseText;
		}//Fin del if..
	}//Fin de function..
	xmlhttp.open("POST","php/guardar_apartado.php?id_apartado="+id_apartado+"&num_preguntas="+document.getElementById(id).value+"&descripcion_apartado"+document.getElementById("descripcion_apartado&"+id_apartado),false);
	xmlhttp.send();
}