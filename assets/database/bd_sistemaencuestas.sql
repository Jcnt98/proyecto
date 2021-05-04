-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-05-2021 a las 19:42:50
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sistemaencuestass`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_pregunta`
--

CREATE TABLE `calificacion_pregunta` (
  `id` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_respuesta` int(11) NOT NULL,
  `id_confApartado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_apartado`
--

CREATE TABLE `cat_apartado` (
  `id` int(11) NOT NULL,
  `id_cuestionario` int(11) NOT NULL,
  `descripcion` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_apartado`
--

INSERT INTO `cat_apartado` (`id`, `id_cuestionario`, `descripcion`) VALUES
(1, 1, 'Competencias laborales'),
(2, 1, 'Competencias personales '),
(3, 1, 'Competencias intelectuales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_departamento`
--

CREATE TABLE `cat_departamento` (
  `id` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `nombreDepto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_departamento`
--

INSERT INTO `cat_departamento` (`id`, `id_dependencia`, `nombreDepto`) VALUES
(1, 1, 'Contabilidad'),
(2, 1, 'Recursos Humanos'),
(3, 1, 'Informatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_dependencia`
--

CREATE TABLE `cat_dependencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_dependencia`
--

INSERT INTO `cat_dependencia` (`id`, `nombre`) VALUES
(1, 'Poder Judicial'),
(2, 'Consejo de la Judicatura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_empleado`
--

CREATE TABLE `cat_empleado` (
  `id` int(11) NOT NULL,
  `cod_empleado` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoMat` varchar(50) NOT NULL,
  `apellidoPat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_empleado`
--

INSERT INTO `cat_empleado` (`id`, `cod_empleado`, `id_dependencia`, `nombre`, `apellidoMat`, `apellidoPat`) VALUES
(1, 17002369, 1, 'Jorge Carlos', 'Navarrete', 'Torres'),
(2, 14896637, 1, 'Cesar Julian', 'Toraya', 'Novelo '),
(3, 14002596, 2, 'Leilani Grisel', 'Marrufo', 'Novelo'),
(4, 17211337, 2, 'Carolina', 'Martinez', 'Maza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_pregunta`
--

CREATE TABLE `cat_pregunta` (
  `id` int(11) NOT NULL,
  `id_apartado` int(11) NOT NULL,
  `descripcion` varchar(350) NOT NULL,
  `concepto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_pregunta`
--

INSERT INTO `cat_pregunta` (`id`, `id_apartado`, `descripcion`, `concepto`) VALUES
(1, 1, 'Capacidad para definir rutas apropiadas de acción en correspondencia con las rutinas y retos enfrentados', 'Planeación'),
(2, 1, 'Capacidad para estructurar anticipadamente procesos y tareas en general, con base en sus interrelaciones, disponiéndolos de acuerdo con criterios de efectividad', 'Organización '),
(3, 1, 'Capacidad de dar cumplimiento a las disposiciones operativas definidas por los superiores jerárquicos, con el fin de contribuir al cumplimiento de objetivos institucionales aunque éstos se opongan al punto de vista personal', 'Seguimiento de instrucciones '),
(4, 2, 'Capacidad para intercambiar puntos de vista, opiniones o cualquier otro tipo de información de manera clara y efectiva', 'Comunicación'),
(5, 2, 'Capacidad para mantener una conducta efectiva al enfrentar situaciones cambiantes, dificultades o inconvenientes, pese a que las medidas adoptadas por otros sean contrarias a su sentir', 'Tolerancia a la frustración '),
(6, 2, 'Capacidad para dominar y orientar de manera pertinente y en favor de las necesidades de la Institución, sentimientos y emociones', 'Autocontrol'),
(7, 3, 'Disposición para adquirir y establecer nuevas pautas de conducta o modificar las existentes a través de la experiencia', 'Orientación al aprendizaje '),
(8, 3, 'Capacidad para seleccionar y dar preponderancia a información específica, entre un continuo de estimulación, con base en criterios preestablecidos', 'Atención y concentración'),
(9, 3, 'Capacidad para tomar decisiones partiendo desde lo general hasta lo particular y viceversa, según convenga en situaciones determinadas', 'Análisis y síntesis ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_respuesta`
--

CREATE TABLE `cat_respuesta` (
  `id` int(11) NOT NULL,
  `respuesta` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_respuesta`
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
-- Estructura de tabla para la tabla `cat_usuarios`
--

CREATE TABLE `cat_usuarios` (
  `id` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cat_usuarios`
--

INSERT INTO `cat_usuarios` (`id`, `id_empleado`, `username`, `password`) VALUES
(1, 1, 'admin', 'admin'),
(2, 2, 'Ctoraya', '1234'),
(3, 3, 'Lmarrufo', 'leilati'),
(4, 4, 'carouchiha', 'teamoobito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_apartado`
--

CREATE TABLE `conf_apartado` (
  `id` int(11) NOT NULL,
  `id_apartado` int(11) NOT NULL,
  `valorAsignado` float NOT NULL,
  `id_evaluacionEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conf_apartado`
--

INSERT INTO `conf_apartado` (`id`, `id_apartado`, `valorAsignado`, `id_evaluacionEmpleado`) VALUES
(1, 1, 33, 1),
(2, 2, 33, 1),
(3, 3, 34, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

CREATE TABLE `cuestionario` (
  `id` int(11) NOT NULL,
  `nom_cuestionario` varchar(100) NOT NULL,
  `objetivo` varchar(300) NOT NULL,
  `periodo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuestionario`
--

INSERT INTO `cuestionario` (`id`, `nom_cuestionario`, `objetivo`, `periodo`) VALUES
(1, 'Evaluación de desempeño laboral ', 'El objetivo consiste en poder evaluar los conocimientos y desempeño que tienen los colaboradores en las areas donde laboran', '2021'),
(2, '\r\nDatos Generales de los empleados', 'Obtener los datos de los empleados correctamente', '2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacionempleado`
--

CREATE TABLE `evaluacionempleado` (
  `id` int(11) NOT NULL,
  `id_empleadoevaluado` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `id_cuestionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evaluacionempleado`
--

INSERT INTO `evaluacionempleado` (`id`, `id_empleadoevaluado`, `id_usuario`, `fecha_inicio`, `fecha_final`, `id_cuestionario`) VALUES
(1, 1, 1, '2021-04-01', '2021-05-10', 1),
(2, 1, 2, '2021-01-01', '2021-04-30', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_finales`
--

CREATE TABLE `resultados_finales` (
  `id` int(11) NOT NULL,
  `total` float NOT NULL,
  `puntosExtra` int(11) NOT NULL,
  `resultado` float NOT NULL,
  `comentarios` varchar(350) NOT NULL,
  `calificacionFinal` varchar(100) NOT NULL,
  `id_evaluacionEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion_pregunta`
--
ALTER TABLE `calificacion_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `id_respuesta` (`id_respuesta`),
  ADD KEY `id_confApartado` (`id_confApartado`);

--
-- Indices de la tabla `cat_apartado`
--
ALTER TABLE `cat_apartado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cuestionario` (`id_cuestionario`);

--
-- Indices de la tabla `cat_departamento`
--
ALTER TABLE `cat_departamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dependencia` (`id_dependencia`);

--
-- Indices de la tabla `cat_dependencia`
--
ALTER TABLE `cat_dependencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_empleado`
--
ALTER TABLE `cat_empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleado_dependencia` (`id_dependencia`);

--
-- Indices de la tabla `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apartado` (`id_apartado`);

--
-- Indices de la tabla `cat_respuesta`
--
ALTER TABLE `cat_respuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `conf_apartado`
--
ALTER TABLE `conf_apartado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_apartado` (`id_apartado`),
  ADD KEY `id_evaluacionEmpleado` (`id_evaluacionEmpleado`);

--
-- Indices de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacionempleado`
--
ALTER TABLE `evaluacionempleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empleadoevaluado` (`id_empleadoevaluado`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cuestionario` (`id_cuestionario`);

--
-- Indices de la tabla `resultados_finales`
--
ALTER TABLE `resultados_finales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacionEmpleado` (`id_evaluacionEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cat_apartado`
--
ALTER TABLE `cat_apartado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_departamento`
--
ALTER TABLE `cat_departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_dependencia`
--
ALTER TABLE `cat_dependencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cat_empleado`
--
ALTER TABLE `cat_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cat_respuesta`
--
ALTER TABLE `cat_respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `conf_apartado`
--
ALTER TABLE `conf_apartado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `evaluacionempleado`
--
ALTER TABLE `evaluacionempleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resultados_finales`
--
ALTER TABLE `resultados_finales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion_pregunta`
--
ALTER TABLE `calificacion_pregunta`
  ADD CONSTRAINT `calificacion_pregunta_ibfk_1` FOREIGN KEY (`id_respuesta`) REFERENCES `cat_respuesta` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificacion_pregunta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `cat_pregunta` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificacion_pregunta_ibfk_3` FOREIGN KEY (`id_confApartado`) REFERENCES `conf_apartado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cat_apartado`
--
ALTER TABLE `cat_apartado`
  ADD CONSTRAINT `cat_apartado_ibfk_1` FOREIGN KEY (`id_cuestionario`) REFERENCES `cuestionario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cat_departamento`
--
ALTER TABLE `cat_departamento`
  ADD CONSTRAINT `cat_depto_cat_dependencia` FOREIGN KEY (`id_dependencia`) REFERENCES `cat_dependencia` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cat_empleado`
--
ALTER TABLE `cat_empleado`
  ADD CONSTRAINT `empleado_dependencia` FOREIGN KEY (`id_dependencia`) REFERENCES `cat_dependencia` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cat_pregunta`
--
ALTER TABLE `cat_pregunta`
  ADD CONSTRAINT `cat_pregunta_ibfk_1` FOREIGN KEY (`id_apartado`) REFERENCES `cat_apartado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cat_usuarios`
--
ALTER TABLE `cat_usuarios`
  ADD CONSTRAINT `usuario_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `cat_empleado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `conf_apartado`
--
ALTER TABLE `conf_apartado`
  ADD CONSTRAINT `conf_apartado_ibfk_1` FOREIGN KEY (`id_apartado`) REFERENCES `cat_apartado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conf_apartado_ibfk_2` FOREIGN KEY (`id_evaluacionEmpleado`) REFERENCES `evaluacionempleado` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `evaluacionempleado`
--
ALTER TABLE `evaluacionempleado`
  ADD CONSTRAINT `evaluacionempleado_ibfk_1` FOREIGN KEY (`id_empleadoevaluado`) REFERENCES `cat_empleado` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluacionempleado_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `cat_usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `evaluacionempleado_ibfk_3` FOREIGN KEY (`id_cuestionario`) REFERENCES `cuestionario` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resultados_finales`
--
ALTER TABLE `resultados_finales`
  ADD CONSTRAINT `resultados_finales_ibfk_1` FOREIGN KEY (`id_evaluacionEmpleado`) REFERENCES `evaluacionempleado` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
