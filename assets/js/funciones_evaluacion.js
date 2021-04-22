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