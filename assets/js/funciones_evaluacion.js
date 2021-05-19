function buscaEmpleado(){
  var empleado = $('#inputEmpleado').val();
  $.ajax({
    type:'post',
    url:'../php/busca_empleado.php',
    data:{
      empleado:empleado
    },
    success:function(response) {
      $('#tbodyPersona').html(response);
      $('#divPersona').css('display','block');
    }
  });
};//Fin buscaEmpleado()

function seleccionarPersona(nombre){
       $('#inputEmpleado').val(nombre);
       $('#divPersona').css('display','none');
 };//Fin seleccionarPersona

 function iniciarEvaluacion(){
  //INICIAMOS LAS VALIDACIONES DE LOS CAMPOS...
   //Validamos que los campos no estén vacíos
   if ($('#fechaInicial').val() == undefined ||  $('#fechaFinal').val() == undefined || $('#inputEmpleado').val() == " " || $('#inputEmpleado').val() == "") {
    alert("Datos iniciales incompletos!!");
   }else{
     if ($('#fechaInicial').val()>= $('#fechaFinal').val()) {             //Validamos que la fecha final sea mayor que la inicial
        alert("La fecha inicial no puede ser mayor a la fecha final!!");
        return false;                                                     //Si la fecha inicial es mayor que la inicial, lo sacamos de la función.
     }//Fin if...
  //FIN DE LAS VALIDACIONES DE LOS CAMPOS...
      var fechaInicial = $('#fechaInicial').val(); 
      var fechaFinal = $('#fechaFinal').val();
      var empleadoEvaluado =  $('#inputEmpleado').val();
      
      $.ajax({
        type:'post',
        url:'../php/iniciaEvaluacion.php',
        data:{
          fechaInicial:fechaInicial,
          fechaFinal:fechaFinal,
          empleadoEvaluado:empleadoEvaluado
        },
        success:function(response) {
          $('#evaluacion').html(response);
          $('#evaluacion').css('display','block');  
        }
      });//Fin ajax...      
   };
  
 };//Fin iniciarEvaluacion()


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