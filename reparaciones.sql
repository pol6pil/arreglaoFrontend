-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2023 a las 13:16:22
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reparaciones`
--
CREATE DATABASE IF NOT EXISTS `reparaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `reparaciones`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `imagen`) VALUES
(1, 'Pantallas', NULL),
(2, 'Carcasas', NULL),
(3, 'Baterias', NULL),
(5, 'Disco duros', NULL),
(6, 'Lectores de discos', NULL),
(7, 'Puertos', NULL),
(8, 'Placas de circuito', NULL),
(9, 'Ventiladores', NULL),
(10, 'Joysticks', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electrodomestico`
--

DROP TABLE IF EXISTS `electrodomestico`;
CREATE TABLE `electrodomestico` (
  `id_electrodomestico` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `electrodomestico`
--

INSERT INTO `electrodomestico` (`id_electrodomestico`, `nombre`, `imagen`) VALUES
(1, 'Nintendo DS', 'files3866983-1681904888050.jpg'),
(2, 'Nintendo Switch', 'files162189-1681904030320.png'),
(3, 'PlayStation 4', 'files4072583-1681904920805.jpg'),
(4, 'Mando Xbox', 'files1283312-1681905454168.webp'),
(8, 'Mac Mini', 'files3258806-1684845823601.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias`
--

DROP TABLE IF EXISTS `guias`;
CREATE TABLE `guias` (
  `id_guia` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `introduccion` mediumtext NOT NULL,
  `id_pieza` int(11) NOT NULL,
  `id_electrodomestico` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `duracion` int(11) NOT NULL,
  `dificultad` int(11) NOT NULL,
  `aceptada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guias`
--

INSERT INTO `guias` (`id_guia`, `imagen`, `nombre`, `introduccion`, `id_pieza`, `id_electrodomestico`, `email`, `duracion`, `dificultad`, `aceptada`) VALUES
(9, 'files1152159-1684430021392.PNG', 'Reemplazo de Joystick de Nintendo Switch', 'El interruptor de Nintendo viene con dos mandos Joy-Con. Esta guía muestra cómo reemplazar el joystick del Joy-Con izquierdo. El procedimiento para reparar el Joy-Con derecho es diferente, así que asegúrese de seguir el conjunto correcto de instrucciones para su mando.', 1, 2, 'pol6pil@gmail.com', 30, 1, 0),
(15, 'files2910354-1684943076025.PNG', 'Reemplazo de ventilador de Nintendo Switch', 'Con esta guía aprenderemos a reemplazar el ventilador de la Nintendo Swtich', 2, 2, 'pol6pil@gmail.com', 75, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrucciones`
--

DROP TABLE IF EXISTS `instrucciones`;
CREATE TABLE `instrucciones` (
  `id_instruccion` int(11) NOT NULL,
  `instruccion` varchar(255) NOT NULL,
  `tipo` int(11) NOT NULL,
  `id_paso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instrucciones`
--

INSERT INTO `instrucciones` (`id_instruccion`, `instruccion`, `tipo`, `id_paso`) VALUES
(2, 'Quita los 4 tornillos tri-wing de la parte trasera del Joy-Con', 0, 9),
(3, 'Es buena idea tener los tornillos organizados para después saber que tornillos utilizar.', 1, 9),
(9, 'Presiona el botón trasero que tienen los Joy Cons', 0, 14),
(10, 'Mientras tienes el botón presionado, desliza el Joy Con hacia arriba hasta que salga', 0, 14),
(11, 'Quitas los tornillos con un destornillador Tri-Wing', 0, 15),
(12, 'Es aconsejable que tengas organizados los tornillos', 1, 15),
(18, 'Inserta una púa de apertura en la costura en el borde inferior del controlador (frente a los botones L y ZL).', 0, 16),
(19, 'Desliza lentamente el borde plano de tu abertura y levanta el costado del Joy-Con.', 0, 16),
(20, '\nTenga cuidado de no deslizar la púa de apertura demasiado adentro del Joy-Con. Esto puede dañar los componentes internos. El panel posterior se afloja con bastante facilidad, por lo que no se necesita mucha presión.', 1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_piezas`
--

DROP TABLE IF EXISTS `opciones_piezas`;
CREATE TABLE `opciones_piezas` (
  `id_opcion` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `id_pieza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opciones_piezas`
--

INSERT INTO `opciones_piezas` (`id_opcion`, `nombre`, `imagen`, `precio`, `id_pieza`) VALUES
(1, 'Solo joystick', 'files3445866-1681637712742.webp', 11.49, 1),
(4, 'Joystick + herramientas', 'files3509195-1681637712743.webp', 15.99, 1),
(5, 'Solo pieza', 'files4593565-1681637854791.webp', 20.99, 2),
(6, 'Solo lector', 'files6070039-1681638055077.webp', 15.99, 3),
(7, 'Lector y herramientas', 'files445063-1681638055077.webp', 21.99, 3),
(8, 'Pantalla usada', 'files517509-1681638149692.webp', 35.99, 4),
(9, 'Solo pieza', 'files2303349-1681638185956.webp', 5.99, 5),
(10, 'Solo bateria', 'files2700870-1681638428152.webp', 30.99, 6),
(11, 'Bateria y herramientas', 'files2301399-1681638428152.webp', 35.99, 6),
(12, 'Solo pieza', 'files1321986-1681638629094.webp', 5.99, 7),
(13, 'Solo pieza', 'files1773357-1681638833421.webp', 4.99, 8),
(14, 'Solo bateria', 'files7822959-1681639717866.webp', 20.99, 11),
(23, 'Solo pieza', 'files9367694-1684838926625.webp', 15.99, 23),
(24, 'Solo carcasa', 'files1189056-1684839166318.webp', 10.99, 24),
(25, '1 joystick', 'files1426108-1684840058061.webp', 6.99, 25),
(26, '2 joysticks', 'files971550-1684840058061.webp', 9.99, 25),
(27, 'Solo pieza', 'files1196890-1684840608449.webp', 49.99, 26),
(28, 'Solo pieza', 'files4213176-1684841313105.webp', 79.99, 27),
(29, 'Disco + herramientas', 'files9311114-1684841313106.webp', 99.99, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos`
--

DROP TABLE IF EXISTS `pasos`;
CREATE TABLE `pasos` (
  `id_paso` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_guia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`id_paso`, `nombre`, `imagen`, `id_guia`) VALUES
(9, 'Quitar tornillos', 'files4647600-1684430021397.PNG', 9),
(14, 'Quitar los Joy Cons', 'files4462939-1684943076030.PNG', 15),
(15, 'Quita los tornillos de la carcasa', 'files4129051-1684943076039.PNG', 15),
(16, '', 'files91350-1685875547382.PNG', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `fecha`, `email`) VALUES
(4, '2023-05-22', 'pol6pil@gmail.com'),
(8, '2023-05-25', 'Thug@Maginicent'),
(9, '2023-05-29', 'Thug@Maginicent'),
(10, '2023-06-03', 'pol6pil@gmail.com'),
(11, '2023-06-03', 'pol6pil@gmail.com'),
(12, '2023-06-03', 'pol6pil@gmail.com'),
(13, '2023-06-03', 'pol6pil@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_pieza`
--

DROP TABLE IF EXISTS `pedido_pieza`;
CREATE TABLE `pedido_pieza` (
  `id_pedido` int(11) NOT NULL,
  `id_pieza` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_pieza`
--

INSERT INTO `pedido_pieza` (`id_pedido`, `id_pieza`, `id_opcion`, `cantidad`, `precio`) VALUES
(4, 1, 1, 5, 11.49),
(4, 1, 4, 3, 15.99),
(8, 1, 1, 1, 11.49),
(9, 1, 1, 2, 11.49),
(9, 6, 10, 1, 30.99),
(10, 25, 25, 2, 6.99),
(10, 23, 23, 1, 15.99),
(11, 4, 8, 4, 35.99),
(11, 3, 7, 2, 21.99),
(12, 8, 13, 1, 4.99),
(13, 7, 12, 3, 5.99),
(13, 5, 9, 1, 5.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas`
--

DROP TABLE IF EXISTS `piezas`;
CREATE TABLE `piezas` (
  `id_pieza` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `garantia` int(11) DEFAULT NULL,
  `advertencia` text DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_electrodomestico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `piezas`
--

INSERT INTO `piezas` (`id_pieza`, `nombre`, `descripcion`, `garantia`, `advertencia`, `nota`, `id_categoria`, `id_electrodomestico`) VALUES
(1, 'Nintendo Switch Joystick', 'La nintendo switch siempre ha tenido un problema con los joycons, registrando movimiento cuando no deberia, en vez de comprar 2 mandos nuevos por 1 pieza defectuosa, arreglala con nuestras guias para principiantes', 0, '', 'El joystick derecho y el izquiero son el mismo por lo que necesitaras 2 joysticks para reparar ambos', 10, 2),
(2, 'Ventilador Nintendo Switch', 'Reemplaza un ventilador defectuoso que puede llegar a provocar un sobrecalentamiento en su Nintendo Switch y dañar la consola', 0, '', '', 9, 2),
(3, 'Lector de tarjetas Nintendo Switch', 'Reemplaza un lector de tarjetas defectuoso para que la consola pueda leer las tarjetas', 2, '', '', 6, 2),
(4, 'Pantalla LCD Nintendo Switch', 'Reemplaza una pantalla dañada para Nintendo Switch', 0, '', 'Esta pieza solo incluye la pantalla LCD, el marco y el cristal externo no estan incluidos', 1, 2),
(5, 'Placa protectora Nintendo Switch', 'Reemplaza una placa protectora dañada para una mayor proteccion de los componentes en su Nintendo Swtich', 0, '', '', 2, 2),
(6, 'Bateria Nintendo Switch', 'Reemplaza una bateria defectuosa o desgastada de Nintendo Switch', 1, 'Las baterias de litio pueden suponer un peligro de incendio en caso de hacer un mal uso', 'Se recomienda encarecidamente utilizar alcohol isopropilico a la hora de reemplazar la bateria', 3, 2),
(7, 'Puerto USB-C Nintendo Swtich', 'Reemplaza un puerto USB-C dañado o defectuoso de Nintendo Switch', 0, '', 'Para reemplazar esta pieza necesitaras de un equipo de micro soldadura y conocimientos', 7, 2),
(8, 'Placa botones SR/SL Nintendo Switch', 'Reemplaza los interruptores de los botones SR y SL de los Joycons de Nintendo Switch', 0, '', 'Los botones externos de plastico no estan incluidos', 8, 2),
(11, 'Bateria Nintendo DS', 'Una batería nueva para la Nintendo DS puede potencialmente revivir la consola aumentando la capacidad de la batería', 1, 'Las baterias de litio pueden suponer un riesgo de incendio si son manipuladas de manera incorrecta', 'Para un rendimiento óptimo, calibre su batería recién instalada: cárguela al 100 % y siga cargándola durante al menos 2 horas más. Luego use su dispositivo hasta que se apague debido a la batería baja. Finalmente, cárguelo ininterrumpidamente al 100%.', 3, 1),
(23, 'Pantalla LCD Nintendo DS', 'Pantalla superior TFT LCD de repuesto para Nintendo DSi.', 0, 'Debido a la fragilidad del cable plano de la pantalla, hay que tener precaución a la hora de instalar la pantalla.', '', 1, 1),
(24, 'Carcasa Nintendo DSi', 'Carcasa completa para Nintendo DSi de color blanco. Incluye todos los botones.', 0, '', '', 2, 1),
(25, 'Joystick Mando Xbox', 'Joystick analógico ORIGINAL XBOX ONE y XBOX Series S/X MARCA APLS para reparar todos los modelos de mandos de XBOBX, cambiando esta pieza vuelve a funcionar perfectamente el Joystick Analógico del mando', 3, '', '', 10, 4),
(26, 'Ventilador Mac Mini', 'Un ventilador antiguo puede volverse ruidoso o simplemente dejar de funcionar, dejando el procesador expuesto a sobrecalentamiento.', 0, '', '', 9, 8),
(27, '250 GB SDD', 'Disco duro solido para aumentar la velocidad del Mac Mini', 0, '', '', 5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id_review` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `puntuacion` double NOT NULL,
  `fecha` date NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_pieza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id_review`, `titulo`, `puntuacion`, `fecha`, `subtitulo`, `email`, `id_pieza`) VALUES
(1, 'Como nuevo', 4, '2023-05-25', 'He reemplazado el ventilador y por ahora funciona bien', 'pol6pil@gmail.com', 2),
(2, 'Ha arreglado el drift', 4, '2023-05-25', 'El Joy Con ahora funciona a la perfección gracias al Joystick nuevo', 'pol6pil@gmail.com', 1),
(3, 'Como nuevo', 5, '2023-05-29', 'El mando esta como nuevo después de reemplazar el JoyStick.', 'Thug@Maginicent', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `email` varchar(255) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `saldo` double NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) NOT NULL,
  `esAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `saldo`, `foto`, `apellido1`, `apellido2`, `esAdmin`, `pass`) VALUES
('admin@admin', 'admin', 300, NULL, 'administrador', '', 1, '$2b$10$b7xLtBalfyzNwyP0goyWduXz08qG8NJyAVGfm7R/YnpJnueCLZYSC'),
('pol6pil@gmail.com', 'pol', 3527.2000000000003, 'files6774689-1684936804995.jfif', 'bosch', 'arcas', 0, '$2b$10$xxIy/p93.BaV6pj/pIbq5.AwhAh0xNbXm3KFO5eoVjtwoP/XmAgxu'),
('Thug@Maginicent', 'Thugnificent', 888.51, 'files3345739-1685015181094.png', 'Jenkins', '', 0, '$2b$10$TCG5dgrvIuSj2rOMMIUZRukUCsnkUcreXlRSfWMou6dq4EvnFs9n.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `electrodomestico`
--
ALTER TABLE `electrodomestico`
  ADD PRIMARY KEY (`id_electrodomestico`);

--
-- Indices de la tabla `guias`
--
ALTER TABLE `guias`
  ADD PRIMARY KEY (`id_guia`),
  ADD KEY `fk_guiaPieza` (`id_pieza`),
  ADD KEY `fk_guiaElectrodomestico` (`id_electrodomestico`),
  ADD KEY `fk_guiaUsuario` (`email`);

--
-- Indices de la tabla `instrucciones`
--
ALTER TABLE `instrucciones`
  ADD PRIMARY KEY (`id_instruccion`),
  ADD KEY `fk_instruccionpaso` (`id_paso`);

--
-- Indices de la tabla `opciones_piezas`
--
ALTER TABLE `opciones_piezas`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `fk_opciones` (`id_pieza`);

--
-- Indices de la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD PRIMARY KEY (`id_paso`),
  ADD KEY `fk_guiapaso` (`id_guia`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedidoUsuario` (`email`);

--
-- Indices de la tabla `pedido_pieza`
--
ALTER TABLE `pedido_pieza`
  ADD KEY `fk_pedido_pieza` (`id_pieza`),
  ADD KEY `fk_pedidoOpcion` (`id_opcion`),
  ADD KEY `fk_pedido` (`id_pedido`);

--
-- Indices de la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD PRIMARY KEY (`id_pieza`),
  ADD KEY `fk_piezaCategoria` (`id_categoria`),
  ADD KEY `fk_piezaElectrodomestico` (`id_electrodomestico`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `fk_usuario_review` (`email`),
  ADD KEY `fk_review_pieza` (`id_pieza`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `electrodomestico`
--
ALTER TABLE `electrodomestico`
  MODIFY `id_electrodomestico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `guias`
--
ALTER TABLE `guias`
  MODIFY `id_guia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `instrucciones`
--
ALTER TABLE `instrucciones`
  MODIFY `id_instruccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `opciones_piezas`
--
ALTER TABLE `opciones_piezas`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pasos`
--
ALTER TABLE `pasos`
  MODIFY `id_paso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `piezas`
--
ALTER TABLE `piezas`
  MODIFY `id_pieza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `fk_guiaElectrodomestico` FOREIGN KEY (`id_electrodomestico`) REFERENCES `electrodomestico` (`id_electrodomestico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guiaPieza` FOREIGN KEY (`id_pieza`) REFERENCES `piezas` (`id_pieza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guiaUsuario` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `instrucciones`
--
ALTER TABLE `instrucciones`
  ADD CONSTRAINT `fk_instruccionpaso` FOREIGN KEY (`id_paso`) REFERENCES `pasos` (`id_paso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opciones_piezas`
--
ALTER TABLE `opciones_piezas`
  ADD CONSTRAINT `fk_opciones` FOREIGN KEY (`id_pieza`) REFERENCES `piezas` (`id_pieza`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD CONSTRAINT `fk_guiapaso` FOREIGN KEY (`id_guia`) REFERENCES `guias` (`id_guia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidoUsuario` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido_pieza`
--
ALTER TABLE `pedido_pieza`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedidoOpcion` FOREIGN KEY (`id_opcion`) REFERENCES `opciones_piezas` (`id_opcion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_pieza` FOREIGN KEY (`id_pieza`) REFERENCES `piezas` (`id_pieza`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD CONSTRAINT `fk_piezaCategoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_piezaElectrodomestico` FOREIGN KEY (`id_electrodomestico`) REFERENCES `electrodomestico` (`id_electrodomestico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_pieza` FOREIGN KEY (`id_pieza`) REFERENCES `piezas` (`id_pieza`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_review` FOREIGN KEY (`email`) REFERENCES `usuarios` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
