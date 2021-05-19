<?php

	if(isset($_GET["page"])){

		$pagina=$_GET["page"];

		if($pagina=="login") include "assets/pages/login.html";

		if($pagina=="agenda") include "assets/pages/evaluacion.html";

		if($pagina=="cuestionario") include "assets/pages/cuestionario.html";

	}else{

		$pagina="login";

		include "assets/pages/login.html";

	}//Fin del else...

?>