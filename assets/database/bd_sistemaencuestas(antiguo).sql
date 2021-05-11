-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2021 at 02:05 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_sistemaencuestas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarApartado` (IN `descripcion` VARCHAR(500), IN `id_datosgenerales` INT(10), IN `valorasignado` INT(10), IN `idApartado` INT(10))  BEGIN 
	UPDATE cat_apartado SET descripcion=descripcion, id_datosgenerales=id_datosgenerales, valorasignado=valorasignado where id=idApartado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDatos` (IN `id_empleadoevaluado` INT(11), IN `id_usuario` INT(11), IN `fecha_inicio` DATE, IN `fecha_final` DATE, IN `nom_cuestionario` VARCHAR(300), IN `objetivo` VARCHAR(300), IN `periodo` VARCHAR(100), IN `idDatos` INT(11))  BEGIN 
	UPDATE datos_generales SET id_empleadoevaluado=id_empleadoevaluado, id_usuario=id_usuario, fecha_inicio=fecha_inicio, fecha_final=fecha_final, nom_cuestionario=nom_cuestionario, objetivo=objetivo, periodo=periodo  where id=idDatos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDepartamento` (IN `nombreDepto` VARCHAR(100), IN `id_dependencia` INT(3), IN `idDepartamento` INT(5))  BEGIN 
	UPDATE cat_departamento SET nombreDepto=nombreDepto, id_dependencia=id_dependencia where id=idDepartamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDependencia` (IN `nombre` VARCHAR(100), IN `IdDependencia` INT(11))  BEGIN 
	UPDATE cat_dependencia SET nombre=nombre where id=idDependencia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEmpleado` (IN `cod_empleado` VARCHAR(10), IN `id_dependencia` INT(10), IN `nombre` VARCHAR(100), IN `apellidoPat` VARCHAR(100), IN `apellidoMat` VARCHAR(100), IN `idEmpleado` INT(10))  BEGIN 
	UPDATE cat_empleado SET cod_empleado=cod_empleado, id_dependencia=id_dependencia, nombre=nombre, apellidoPat=apellidoPat, apellidoMat=apellidoMat  where id=idEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEvaluacion` (IN `id_pregunta` INT(11), IN `id_respuesta` INT(11), IN `valor` INT(11), IN `idEvaluacion` INT(11))  BEGIN 
	UPDATE registro_evaluacion SET id_pregunta=id_pregunta, id_respuesta=id_respuesta, valor=valor  where id=idEvaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPregunta` (IN `id_apartado` INT(10), IN `tipo_pregunta` VARCHAR(20), IN `descripcion` VARCHAR(600), IN `concepto` VARCHAR(150), IN `idPregunta` INT(10))  BEGIN 
	UPDATE cat_pregunta SET id_apartado=id_apartado, tipo_pregunta=tipo_pregunta, descripcion=descripcion, concepto=concepto  where id=idPregunta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRespuesta` (IN `idRespuesta` VARCHAR(2), IN `respuesta` VARCHAR(300))  BEGIN 
	UPDATE cat_respuesta SET id=id, respuesta=respuesta where id=idRespuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario` (IN `username` VARCHAR(25), IN `password` VARCHAR(100), IN `id_empleado` INT(10), IN `idUsuario` INT(11))  BEGIN 
	UPDATE cat_usuarios SET username=username, password=password, id_empleado=id_empleado  where id=idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarApartado` (IN `descripcion` VARCHAR(500), IN `id_datosgenerales` INT(10), IN `valorasignado` INT(10))  BEGIN 
	INSERT INTO cat_apartado(descripcion,id_datosgenerales,valorasignado) VALUES (descripcion,id_datosgenerales,valorasignado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarDatos` (IN `id_empleadoevaluado` INT(11), IN `id_usuario` INT(11), IN `fecha_inicio` DATE, IN `fecha_final` DATE, IN `nom_cuestionario` VARCHAR(300), IN `objetivo` VARCHAR(300), IN `periodo` VARCHAR(100))  BEGIN 
	INSERT INTO datos_generales(id_empleadoevaluado,id_usuario,fecha_inicio,fecha_final,nom_cuestionario,objetivo,periodo) VALUES (id_empleadoevaluado,id_usuario,fecha_inicio,fecha_final,nom_cuestionario,objetivo,periodo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarDepartamento` (IN `nombreDepto` VARCHAR(100), IN `id_dependencia` INT(3))  BEGIN 
	INSERT INTO cat_departamento(nombreDepto,id_dependencia) VALUES (nombreDepto,id_dependencia);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarDependencia` (IN `nombre` VARCHAR(100))  BEGIN 
	INSERT INTO cat_dependencia(nombre) VALUES (nombre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarEmpleado` (IN `cod_empleado` VARCHAR(10), IN `id_dependencia` INT(10), IN `nombre` VARCHAR(100), IN `apellidoPat` VARCHAR(100), IN `apellidoMat` VARCHAR(100))  BEGIN 
	INSERT INTO cat_empleado(cod_empleado,id_dependencia,nombre,apellidoPat,apellidoMat) VALUES (cod_empleado,id_dependencia,nombre,apellidoPat,apellidoMat);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarEvaluacion` (IN `id_pregunta` INT(11), IN `id_respuesta` INT(11), IN `valor` INT(11))  BEGIN 
	INSERT INTO registro_evaluacion(id_pregunta,id_respuesta,valor) VALUES (id_pregunta,id_respuesta,valor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarPregunta` (IN `id_apartado` INT(10), IN `tipo_pregunta` VARCHAR(20), IN `descripcion` VARCHAR(600), IN `concepto` VARCHAR(150))  BEGIN 
	INSERT INTO cat_pregunta(id_apartado,tipo_pregunta,descripcion,concepto) VALUES (id_apartado,tipo_pregunta,descripcion,concepto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarRespuesta` (IN `id` INT(2), IN `respuesta` VARCHAR(300))  BEGIN 
	INSERT INTO cat_respuesta(id,respuesta) VALUES (id,respuesta);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarUsuario` (IN `username` VARCHAR(25), IN `password` VARCHAR(100), IN `id_empleado` INT(10))  BEGIN 
	INSERT INTO cat_usuarios(username,password,id_empleado) VALUES (username,password,id_empleado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarApartado` (IN `idApartado` INT(10))  BEGIN 
	DELETE FROM cat_apartado Where id = idApartado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDatos` (IN `idDatos` INT(11))  BEGIN 
	DELETE FROM datos_generales Where id = idDatos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDepartamento` (IN `idDepartamento` INT(10))  BEGIN 
	DELETE FROM cat_departamento Where id = idDepartamento;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDependencia` (IN `idDependencia` INT(11))  BEGIN 
	DELETE FROM cat_dependencia Where id = idDependencia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEmpleado` (IN `idEmpleado` INT(10))  BEGIN 
	DELETE FROM cat_empleado Where id = idEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEvaluacion` (IN `idEvaluacion` INT(11))  BEGIN 
	DELETE FROM registro_evaluacion Where id = idEvaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPregunta` (IN `idPregunta` INT(10))  BEGIN 
	DELETE FROM cat_pregunta Where id = idPregunta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarRespuesta` (IN `idRespuesta` INT(2))  BEGIN 
	DELETE FROM cat_respuesta Where id = idRespuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuario` (IN `idUsuario` INT(11))  BEGIN 
	DELETE FROM cat_usuarios Where id = idUsuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cat_apartado`
--

CREATE TABLE `cat_apartado` (
  `id` int(10) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripción del apartado a crear',
  `id_datosgenerales` int(10) NOT NULL,
  `valorasignado` int(10) NOT NULL COMMENT 'Valor que se le asigna al apartado. Este valor lo indica la persona que realiza la evaluación.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_apartado`
--

INSERT INTO `cat_apartado` (`id`, `descripcion`, `id_datosgenerales`, `valorasignado`) VALUES
(1, 'Competencias laborales', 1, 33),
(3, 'Competencias personales ', 1, 33),
(4, 'Competencias intelectuales ', 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `cat_departamento`
--

CREATE TABLE `cat_departamento` (
  `id` int(5) NOT NULL,
  `nombreDepto` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del departamento.',
  `id_dependencia` int(3) NOT NULL COMMENT 'Dependencia a la que pertenece el departamento.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_departamento`
--

INSERT INTO `cat_departamento` (`id`, `nombreDepto`, `id_dependencia`) VALUES
(1, 'Contabilidad', 1),
(4, 'Recursos Humanos', 1),
(5, 'Informatica', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cat_dependencia`
--

CREATE TABLE `cat_dependencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_dependencia`
--

INSERT INTO `cat_dependencia` (`id`, `nombre`) VALUES
(1, 'Poder Judicial'),
(2, 'Consejo de la Judicatura');

-- --------------------------------------------------------

--
-- Table structure for table `cat_empleado`
--

CREATE TABLE `cat_empleado` (
  `id` int(10) NOT NULL COMMENT 'El id del empleado es el número de nómina.',
  `cod_empleado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoPat` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellidoMat` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_empleado`
--

INSERT INTO `cat_empleado` (`id`, `cod_empleado`, `id_dependencia`, `nombre`, `apellidoPat`, `apellidoMat`) VALUES
(1, '17002369', 1, 'Jorge Carlos', 'Navarrete', 'Torres'),
(5, '14896637', 1, 'Cesar Julian', 'Toraya', 'Novelo'),
(6, '14002596', 2, 'Leilani Grisel', 'Marrufo', 'Novelo'),
(9, '17211337', 2, 'Carolina', 'Martinez', 'Maza');

-- --------------------------------------------------------

--
-- Table structure for table `cat_pregunta`
--

CREATE TABLE `cat_pregunta` (
  `id` int(10) NOT NULL,
  `id_apartado` int(10) NOT NULL COMMENT 'id del apartado al que pertenece la pregunta',
  `tipo_pregunta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(600) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripción mas detallada para añadir contexto a la pregunta.',
  `concepto` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_pregunta`
--

INSERT INTO `cat_pregunta` (`id`, `id_apartado`, `tipo_pregunta`, `descripcion`, `concepto`) VALUES
(1, 3, 'C', 'Capacidad para intercambiar puntos de vista, opiniones o cualquier otro tipo de información de manera clara y efectiva', 'Comunicación'),
(2, 3, 'C', 'Capacidad para mantener una conducta efectiva al enfrentar situaciones cambiantes, dificultades o inconvenientes, pese a que las medidas adoptadas por otros sean contrarias a su sentir', 'Tolerancia a la frustración '),
(3, 3, 'C', 'Capacidad para dominar y orientar de manera pertinente y en favor de las necesidades de la Institución, sentimientos y emociones', 'Autocontrol'),
(4, 4, 'C', 'Disposición para adquirir y establecer nuevas pautas de conducta o modificar las existentes a través de la experiencia', 'Orientación al aprendizaje '),
(5, 4, 'C', 'Capacidad para seleccionar y dar preponderancia a información específica, entre un continuo de estimulación, con base en criterios preestablecidos', 'Atención y concentración'),
(6, 4, 'C', 'Capacidad para tomar decisiones partiendo desde lo general hasta lo particular y viceversa, según convenga en situaciones determinadas', 'Análisis y síntesis '),
(7, 1, 'C', 'Capacidad para definir rutas apropiadas de acción en correspondencia con las rutinas y retos enfrentados', 'Planeación'),
(8, 1, 'C', 'Capacidad para estructurar anticipadamente procesos y tareas en general, con base en sus interrelaciones, disponiéndolos de acuerdo con criterios de efectividad', 'Organización '),
(9, 1, 'C', 'Capacidad de dar cumplimiento a las disposiciones operativas definidas por los superiores jerárquicos, con el fin de contribuir al cumplimiento de objetivos institucionales aunque éstos se opongan al punto de vista personal', 'Seguimiento de instrucciones ');

-- --------------------------------------------------------

--
-- Table structure for table `cat_respuesta`
--

CREATE TABLE `cat_respuesta` (
  `id` int(2) NOT NULL,
  `respuesta` varchar(300) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_respuesta`
--

INSERT INTO `cat_respuesta` (`id`, `respuesta`) VALUES
(1, 'No aplica'),
(2, 'No satisfactorio '),
(3, 'Regularmente satisfactorio '),
(4, 'Medianamente satisfactorio '),
(5, 'Satisfactorio '),
(6, 'Sobresaliente ');

-- --------------------------------------------------------

--
-- Table structure for table `cat_usuarios`
--

CREATE TABLE `cat_usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_empleado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cat_usuarios`
--

INSERT INTO `cat_usuarios` (`id`, `username`, `password`, `id_empleado`) VALUES
(1, 'jnavarrete', '1234', 5),
(2, 'Admin', 'admin', 1),
(3, 'Lmarrufo', 'leilati', 6),
(4, 'carouchiha', 'teamoobito', 9);

-- --------------------------------------------------------

--
-- Table structure for table `datos_generales`
--

CREATE TABLE `datos_generales` (
  `id` int(11) NOT NULL,
  `id_empleadoevaluado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `nom_cuestionario` varchar(300) NOT NULL,
  `objetivo` varchar(300) NOT NULL,
  `periodo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datos_generales`
--

INSERT INTO `datos_generales` (`id`, `id_empleadoevaluado`, `id_usuario`, `fecha_inicio`, `fecha_final`, `nom_cuestionario`, `objetivo`, `periodo`) VALUES
(1, 1, 1, '2021-04-01', '2021-04-10', 'Datos Generales de los empleados', 'Obtener los fatos de los empleados correctamente', '2021'),
(2, 1, 2, '2021-01-01', '2021-04-30', 'Evaluación de desempeño laboral ', 'El objetivo consiste en poder evaluar los conocimientos y desempeño que tienen los colaboradores en las areas donde laboran', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `registro_evaluacion`
--

CREATE TABLE `registro_evaluacion` (
  `id` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_respuesta` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_apartado`
--
ALTER TABLE `cat_apartado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apartado` (`id`),
  ADD KEY `id_datosgenerales` (`id_datosgenerales`);

--
-- Indexes for table `cat_departamento`
--
ALTER TABLE `cat_departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id`),
  ADD KEY `id_dependencia` (`id_dependencia`);

--
-- Indexes for table `cat_dependencia`
--
ALTER TABLE `cat_dependencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dependencia` (`id`);

--
-- Indexes for table `cat_empleado`
--
ALTER TABLE `cat_empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id`),
  ADD KEY `id_dependencia` (`id_dependencia`);

--
-- Indexes for table `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pregunta` (`id`),
  ADD KEY `id_apartado` (`id_apartado`);

--
-- Indexes for table `cat_respuesta`
--
ALTER TABLE `cat_respuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_respuesta` (`id`);

--
-- Indexes for table `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indexes for table `datos_generales`
--
ALTER TABLE `datos_generales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleadoevaluado` (`id_empleadoevaluado`),
  ADD KEY `id_datosgenerales` (`id`),
  ADD KEY `id_empleadoevaluador` (`id_usuario`),
  ADD KEY `id_empleadoevaluado_2` (`id_empleadoevaluado`);

--
-- Indexes for table `registro_evaluacion`
--
ALTER TABLE `registro_evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_apartado`
--
ALTER TABLE `cat_apartado`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cat_departamento`
--
ALTER TABLE `cat_departamento`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cat_dependencia`
--
ALTER TABLE `cat_dependencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cat_empleado`
--
ALTER TABLE `cat_empleado`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'El id del empleado es el número de nómina.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cat_respuesta`
--
ALTER TABLE `cat_respuesta`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `datos_generales`
--
ALTER TABLE `datos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registro_evaluacion`
--
ALTER TABLE `registro_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cat_apartado`
--
ALTER TABLE `cat_apartado`
  ADD CONSTRAINT `cat_apartado_ibfk_1` FOREIGN KEY (`id_datosgenerales`) REFERENCES `datos_generales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cat_departamento`
--
ALTER TABLE `cat_departamento`
  ADD CONSTRAINT `cat_departamento_ibfk_1` FOREIGN KEY (`id_dependencia`) REFERENCES `cat_dependencia` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cat_empleado`
--
ALTER TABLE `cat_empleado`
  ADD CONSTRAINT `cat_empleado_ibfk_1` FOREIGN KEY (`id_dependencia`) REFERENCES `cat_dependencia` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  ADD CONSTRAINT `cat_pregunta_ibfk_1` FOREIGN KEY (`id_apartado`) REFERENCES `cat_apartado` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD CONSTRAINT `cat_usuarios_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `cat_empleado` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `datos_generales`
--
ALTER TABLE `datos_generales`
  ADD CONSTRAINT `datos_generales_ibfk_1` FOREIGN KEY (`id_empleadoevaluado`) REFERENCES `cat_empleado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `datos_generales_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `cat_usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
