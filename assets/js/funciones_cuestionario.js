$(document).ready(function() {
//Cargando el select de los anios de la evaluacion.
	document.getElementById("inputAnio").innerHTML += '\
					<option value="0" id="opcion">Elige un año</option>\
					   <option value="2020">2020</option>\
					   <option value="2021">2021</option>\
					   <option value="2022">2022</option>\
					   <option value="2023">2023</option>\
					   <option value="2023">2024</option>\
					   <option value="2023">2025</option>\
					   <option value="2023">2026</option>\
					   <option value="2023">2027</option>\
					   <option value="2023">2028</option>\
					   <option value="2023">2029</option>\
					   <option value="2023">2030</option>\
					   <option value="2023">2031</option>\
					   <option value="2023">2032</option>\
					   <option value="2023">2033</option>\
					   <option value="2023">2034</option>\
					   <option value="2024">2035</option>';


}); 


function crearEvaluacion(){
	//Funcion para crear una evaluación en la pantalla del administrador. Es llamada por el archivo cuestionario.html
    if ($("#inputAnio").val() == "0") {
        alert("Es necesario seleccionar un año para crear una evaluación");
    }else{
        var anio = $("#inputAnio").val();
        $.ajax({
            type:'post',
            url: '../php/crearEvaluacion.php',
            data: {anio:anio},
            success:function(response){
				//alert(response);
				if(response=="1"){//Ya existe una evaluacion para ese año, por lo que ofreceremos la opción para editarlo.
                    $("#evaluacion").css('display','block');
                    $("#evaluacion").html('	<div id="alert"> \
                    							<div id="alert_evaluacion" class="alert alert-warning" role="alert"> \
													<p>Ya existe una evaluación para ese año ¿Deseas editar la evaluacion?</p>\
												</div> \
                    							<button type="button" id="boton_yes" onclick="cargaTabla()" class="btn btn-outline-warning">Si</button> \
                    							<button type="button" id="boton_no" class="btn btn-outline-danger">No</button> \
                  							</div>');
											  
				}else{//En este caso no se encontro ninguna evaluacion, asi que procedemos a imprimir la pantalla de creacion.
					id_cuestionario=response;//Recibimos el id del cuestionario.
					var opcion=4;

					tablaApartados = $('#tablaApartados').DataTable({  
					"ajax":{            
						"url": "../php/crud.php", 
						"method": 'POST', //usamos el metodo POST
						"data":{opcion:opcion, id_cuestionario:id_cuestionario}, //enviamos opcion 4 para que haga un SELECT
						"dataSrc":""
					},
					"columns":[
						{"data": "id"},
						{"data": "descripcion"},
						{"defaultContent": '<div class="btn-group"><button class="btn btn-outline-dark"><svg width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#pencil-square"/></svg></button><button class="btn btn-outline-dark"><svg  width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#x-circle-fill"/></svg></button></div>'}
					]
				});
				$("#evaluacion").css("display", "block");		
                 
				var fila; //captura la fila, para editar o eliminar
				var id_cuestionario;
				//submit para el Alta y Actualización
				$('#form_apartado').submit(function(e){                         
					e.preventDefault(); //evita el comportambiento normal del submit, es decir, recarga total de la página
					apartado_descripcion = $.trim($('#input_descripcionApartado').val());                      
						$.ajax({
							url: "../php/crud.php",
							type: "POST",
							datatype:"json",    
							data:  {apartado_descripcion:apartado_descripcion, id_cuestionario:id_cuestionario,opcion:opcion},    
							success: function(data) {
							tablaApartados.ajax.reload(null, false);
							cargaSelectApartados(id_cuestionario);
							}
						});        
					$('#modalCRUD').modal('hide');											     			
				});

				$("#btn_agrega_apartado").click(function(){
					opcion = 1; //alta           
					user_id=null;
					$("#formUsuarios").trigger("reset");
					$(".modal-header").css( "background-color", "#939598");
					$(".modal-header").css( "color", "white" );
					$(".modal-title").text("Apartado Nuevo");
					$('#modalCRUD').modal('show');	 	    
				});
				
				};
				
					
				$("#select_apartados").change(function(){
					id_apartado = $('#select_apartados').val();
					alert ($('#select_apartados').val());
					opcion = 4; //alta
					tablaPreguntas = $('#tablaPreguntas').DataTable({  
						"ajax":{            
							"url": "../php/crud2.php", 
							"method": 'POST', //usamos el metodo POST
							"data":{opcion:opcion, id_apartado:id_apartado}, //enviamos opcion 4 para que haga un SELECT de las preguntas
							"dataSrc":""
						},
						"columns":[
							{"data": "id"},
							{"data": "descripcion"},
							{"data": "concepto"},
							{"defaultContent": '<div class="btn-group"><button class="btn btn-outline-dark"><svg width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#pencil-square"/></svg></button><button class="btn btn-outline-dark"><svg  width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#x-circle-fill"/></svg></button></div>'}
						]
					});
					
					    
				});

				
			}
        });//Fin ajax...
		
    };
};//Fin crearEvaluacion

function cargaSelectApartados(id_cuestionario){
	$.ajax({
		url: "../php/cargaSelectApartados.php",
		type: "POST",    
		data:  {id_cuestionario:id_cuestionario},    
		success:function(response) {
		$("#select_apartados").html(response);
		
		}
	});
};

/*function agrega_apartado(){
		opcion = 1; //alta           
		user_id=null;
		$("#formUsuarios").trigger("reset");
		$(".modal-header").css( "background-color", "#939598");
		$(".modal-header").css( "color", "white" );
		$(".modal-title").text("Apartado Nuevo");
		$('#modalCRUD').modal('show');	    
};//Fin agrega_apartado*/


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
	tablaApartados;
};//Fin guardar_apartado...

function cargaTabla(){
	/*var opcion = 4;
	id_cuestionario = document.getElementById("inputAnio").value;
	
	tablaCuestionario = $('#tablaCuestionario').DataTable({  
		"ajax":{            
			"url": "../php/crud.php", 
			"method": 'POST', //usamos el metodo POST
			"data":{opcion:opcion, id_cuestionario:id_cuestionario}, //enviamos opcion 4 para que haga un SELECT
			"dataSrc":""
		},
		"columns":[
			{"data": "id"},
			{"data": "descripcion"},
			{"defaultContent": '<div class="btn-group"><button class="btn btn-outline-dark"><svg width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#pencil-square"/></svg></button><button class="btn btn-outline-dark"><svg  width="20" height="20" focus="true"><use xlink:href="../bootstrap/icons/bootstrap-icons.svg#x-circle-fill"/></svg></button></div>'}
		]
	});
	$("#evaluacion").css("display", "block");
	//AJAX
	if(window.XMLHttpRequest){//Code for IE7+, Firefox, Chrome, Opera, Safari..
		xmlhttp=new XMLHttpRequest();
	}else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}//Fin del else..
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var valor=xmlhttp.responseText;
			document.getElementById("tableBody").innerHTML=xmlhttp.responseText;
		}//Fin del if..
	}//Fin de function..
	xmlhttp.open("POST","../php/cargaTabla.php?inputAnio="+document.getElementById("inputAnio").value,false);
	//Agregar el apartado del select para saber el año de la evaluacion...
	xmlhttp.send();
	*/
};