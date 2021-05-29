window.onload = cargaSelect;

function cargaSelect(){
	
	document.getElementById("inputAnio").innerHTML += '\
						<option value="0" id="opcion">Elige un año</option>\
					   <option value="2020">2020</option>\
					   <option value="2021">2021</option>\
					   <option value="2022">2022</option>\
					   <option value="2023">2023</option>\
					   <option value="2024">2024</option>';
}//Fin cargaSelect...

function crearEvaluacion(){
	if(document.getElementById("inputAnio").value==0){
		$(document).ready(function(){
		$('#mensaje').modal('toggle');
		$('#aviso').text("¡Debes seleccionar un periodo!");
	});
}else{
	//Funcion para crear una evaluación en la pantalla del administrador. Es llamada por el archivo cuestionario.html
        var anio = $("#inputAnio").val();
        $.ajax({
            type:'post',
            url: '../php/crearEvaluacion.php',
            data: {anio:anio},
            success:function(response){
				//alert(response);
				if(response=="Ya existe una evaluacion"){//Ya existe una evaluacion para ese año, por lo que ofreceremos la opción para editarlo.
                    $(document).ready(function(){
						$('#mensaje').modal('toggle');
						$('#aviso').text("¡Ya existe una evaluación para este periodo!");
					});
					$("#seccion_apartado").show('slow');
					$("#inputAnio").prop('disabled', true);
					$("#btn_cancelarEvaluacion").css('display','block');
				}else{//En este caso no se encontro ninguna evaluacion, asi que procedemos a imprimir la pantalla de creacion.
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html(response);
					$("#seccion_apartado").show('slow');
					$("#inputAnio").prop('disabled', true);
					$("#btn_cancelarEvaluacion").css('display','block');
				}
				cargaTablaApartados();
			}
        });//Fin ajax...
    };
};//Fin crearEvaluacion

function presentaPregunta(contador){
	var vistaPregunta = '<div id="pregunta">	\
							<div  class="row"  id="secciones"> \
								<div class="row" id="pregunta"> \
									<h4>Pregunta '+contador+' </h4> \
									<label> Escriba el título de la pregunta sin numerar la misma. <p class="ejemplo">Ej. Legalidad</p></label> \
									<div class="row"> \
										<div class="form-group"> \
											<textarea id="tituloPreg" name="tituloPregunta" maxlength="500" class="form-control" rows="1" placeholder="Legalidad"></textarea> \
										</div> \
										<div class="form-group"> \
											<label> Escriba la descripción de la pregunta  <p class="ejemplo">Ej. Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche.</p></label>\
											<textarea id="descPreg" name="descripcionPregunta" maxlength="500" class="form-control" rows="3" placeholder="Conoce, cumple y demuestra dominio sobre el conocimiento de la normatividad que regula su actividad, de tal forma que no sea objeto de reproche. "></textarea>\
										</div>\
										<div class="row rowBotonSecciones">\
											<div class="col"><button id="agregarPregunta" class="btn btnPreguntaNueva" onclick="nuevaPregunta('+noPregunta+','+noApartado+')">Pregunta nueva</button></div> \
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
						return vistaPregunta;
};//Fin presenta pregunta

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
 

function guardar_apartado(){
	//AJAX
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
	xmlhttp.open("POST","php/guardar_apartado.php?descripcionApartado="+document.getElementById("descApartado").value,false);
	//Agregar el apartado del select para saber el año de la evaluacion...
	xmlhttp.send();
	cargaTabla();
};//Fin guardar_apartado...

function cargaTablaApartados(){
	//Agregar código para cargar la tabla.
	$(document).ready(function(){
		//Defino las variables
		var periodo=$('#inputAnio').val();
		//alert(apartado);
		//Función de Ajax
		$.ajax({
		url:"../php/cargarTablaApartados.php",
		dataType:"json",//Formato en como se manda la información
		type:"get",
		data:{//Información a enviar o cadena a enviar
			periodo:periodo
		},
		success:function(respuesta){
			if(respuesta.valor=="ok"){
				$('#form_tabla_apartados').html(respuesta.tabla);//En donde quiero mostrar la información
				$('#form_tabla_apartados').show('slow');
			}//Fin del if  
		},
			error:function(respuesta){//Si surge un error
			alert(respuesta.valor);
			console.log(respuesta);
		  }
		});
	  });

};