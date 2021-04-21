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
  $('#evaluacion').css('display','block');
 };