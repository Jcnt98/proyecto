<?php

	if(isset($_GET["page"])){

		$pagina=$_GET["page"];

		if($pagina=="login") include "pages/login.html";

		if($pagina=="agenda") include "pages/evaluacion.html";

		if($pagina=="cuestionario") include "pages/cuestionario.html";

	}else{

		$pagina="login";

		include "php/login.html";

	}//Fin del else...

?>