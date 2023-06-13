-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2023 a las 21:51:44
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
CREATE TABLE IF NOT EXISTS `electrodomestico` (
  `id_electrodomestico` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_electrodomestico`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
CREATE TABLE IF NOT EXISTS `guias` (
  `id_guia` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `introduccion` mediumtext NOT NULL,
  `id_pieza` int(11) NOT NULL,
  `id_electrodomestico` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `duracion` int(11) NOT NULL,
  `dificultad` int(11) NOT NULL,
  `aceptada` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_guia`),
  KEY `fk_guiaPieza` (`id_pieza`),
  KEY `fk_guiaElectrodomestico` (`id_electrodomestico`),
  KEY `fk_guiaUsuario` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guias`
--

INSERT INTO `guias` (`id_guia`, `imagen`, `nombre`, `introduccion`, `id_pieza`, `id_electrodomestico`, `email`, `duracion`, `dificultad`, `aceptada`) VALUES
(15, 'files2910354-1684943076025.PNG', 'Reemplazo de ventilador de Nintendo Switch', 'Con esta guía aprenderemos a reemplazar el ventilador de la Nintendo Swtich', 2, 2, 'pol6pil@gmail.com', 75, 1, 0),
(16, 'files8643992-1686499062980.PNG', 'Reemplazo del joystick Joy-Con', 'La Nintendo Switch viene con dos mandos Joy-Con. Esta guía muestra cómo reemplazar el joystick del Joy-Con izquierdo . El procedimiento para reparar el Joy-Con derecho es diferente, así que asegúrese de seguir el conjunto correcto de instrucciones para su controlador.\r\n\r\n', 1, 2, 'pol6pil@gmail.com', 30, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrucciones`
--

DROP TABLE IF EXISTS `instrucciones`;
CREATE TABLE IF NOT EXISTS `instrucciones` (
  `id_instruccion` int(11) NOT NULL AUTO_INCREMENT,
  `instruccion` varchar(255) NOT NULL,
  `tipo` int(11) NOT NULL,
  `id_paso` int(11) NOT NULL,
  PRIMARY KEY (`id_instruccion`),
  KEY `fk_instruccionpaso` (`id_paso`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instrucciones`
--

INSERT INTO `instrucciones` (`id_instruccion`, `instruccion`, `tipo`, `id_paso`) VALUES
(9, 'Presiona el botón trasero que tienen los Joy Cons', 0, 14),
(10, 'Mientras tienes el botón presionado, desliza el Joy Con hacia arriba hasta que salga', 0, 14),
(11, 'Quitas los tornillos con un destornillador Tri-Wing', 0, 15),
(12, 'Es aconsejable que tengas organizados los tornillos', 1, 15),
(27, 'Retire los cuatro tornillos Tri-Point Y00 del panel posterior del Joy-Con', 0, 20),
(28, 'Cada uno de estos tornillos tiene una longitud de 6,2 mm, ¡pero sigue siendo una buena idea mantenerlos organizados y asegurarse de que vuelvan a colocarse en sus lugares correctos', 1, 20),
(29, 'Inserta una púa de apertura en la costura en el borde inferior del controlador (frente a los botones L y ZL).', 0, 21),
(30, 'Desliza lentamente el borde plano de tu abertura y levanta el costado del Joy-Con', 0, 21),
(31, 'Tenga cuidado de no deslizar la púa de apertura demasiado adentro del Joy-Con. Esto puede dañar los componentes internos. El panel posterior se afloja con bastante facilidad, por lo que no se necesita mucha presión', 1, 21),
(32, 'Con el riel de carga de espaldas a ti, abre el Joy-Con como un libro', 0, 22),
(33, 'No intente quitar completamente el panel posterior todavía. Todavía hay dos cables que conectan el riel de carga a la placa base', 2, 22),
(34, 'Usa un spudger para levantar suavemente el conector de la batería de su zócalo en la placa base. Esto evitará que el Joy-Con se encienda durante la reparación.', 0, 23),
(35, 'Ten mucho cuidado al levantar el conector; si no sale con el spudger, intenta tirar suavemente de los cables hacia arriba desde la placa para desconectarlo', 2, 23),
(36, 'Retire los dos tornillos Phillips #00 de 3,5 mm del joystick', 0, 24),
(37, 'Retire con cuidado el joystick de su alojamiento', 0, 25),
(38, 'Hay una junta negra delgada alrededor del orificio donde el joystick atraviesa el Joy-Con. ¡Haga todo lo posible por no tocar esta junta mientras retira el joystick', 0, 25),
(39, 'Una vez que el Joy-Con esté completamente reensamblado, conéctalo a tu Nintendo Switch y calibra el nuevo joystick . Además, es posible que deba reiniciar su Switch manteniendo presionado el botón de encendido durante 10 a 15 segundos hasta que se apague ', 1, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_piezas`
--

DROP TABLE IF EXISTS `opciones_piezas`;
CREATE TABLE IF NOT EXISTS `opciones_piezas` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `id_pieza` int(11) NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `fk_opciones` (`id_pieza`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
CREATE TABLE IF NOT EXISTS `pasos` (
  `id_paso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_guia` int(11) NOT NULL,
  PRIMARY KEY (`id_paso`),
  KEY `fk_guiapaso` (`id_guia`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`id_paso`, `nombre`, `imagen`, `id_guia`) VALUES
(14, 'Quitar los Joy Cons', 'files4462939-1684943076030.PNG', 15),
(15, 'Quita los tornillos de la carcasa', 'files4129051-1684943076039.PNG', 15),
(20, 'Joystick izquierdo', 'files3025642-1686499062984.PNG', 16),
(21, '', 'files8087100-1686499149158.PNG', 16),
(22, '', 'files4487016-1686499149170.PNG', 16),
(23, '', 'files5748856-1686499233039.PNG', 16),
(24, '', 'files8236582-1686499233057.PNG', 16),
(25, '', 'files6608684-1686499233063.PNG', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedidoUsuario` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13, '2023-06-03', 'pol6pil@gmail.com'),
(14, '2023-06-05', 'pol6pil@gmail.com'),
(15, '2023-06-13', 'pol6pil@gmail.com'),
(16, '2023-06-13', 'pol6pil@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_pieza`
--

DROP TABLE IF EXISTS `pedido_pieza`;
CREATE TABLE IF NOT EXISTS `pedido_pieza` (
  `id_pedido` int(11) NOT NULL,
  `id_pieza` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  KEY `fk_pedido_pieza` (`id_pieza`),
  KEY `fk_pedidoOpcion` (`id_opcion`),
  KEY `fk_pedido` (`id_pedido`)
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
(13, 5, 9, 1, 5.99),
(14, 3, 6, 1, 15.99),
(15, 1, 1, 3, 11.49),
(16, 1, 1, 1, 11.49),
(16, 1, 4, 1, 15.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas`
--

DROP TABLE IF EXISTS `piezas`;
CREATE TABLE IF NOT EXISTS `piezas` (
  `id_pieza` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `garantia` int(11) DEFAULT NULL,
  `advertencia` text DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_electrodomestico` int(11) NOT NULL,
  PRIMARY KEY (`id_pieza`),
  KEY `fk_piezaCategoria` (`id_categoria`),
  KEY `fk_piezaElectrodomestico` (`id_electrodomestico`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
CREATE TABLE IF NOT EXISTS `reviews` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `puntuacion` double NOT NULL,
  `fecha` date NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_pieza` int(11) NOT NULL,
  PRIMARY KEY (`id_review`),
  KEY `fk_usuario_review` (`email`),
  KEY `fk_review_pieza` (`id_pieza`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id_review`, `titulo`, `puntuacion`, `fecha`, `subtitulo`, `email`, `id_pieza`) VALUES
(2, 'Ha arreglado el drift', 4, '2023-05-25', 'El Joy Con ahora funciona a la perfección gracias al Joystick nuevo', 'pol6pil@gmail.com', 1),
(4, 'De inutilizable a como nueva', 4, '2023-06-05', 'Antes mi Nintendo Swtich no podía leer juegos por culpa de que tenia roto el lector de tarjetas, ahora que esta reemplazado ya puedo utilizar la consola de nuevo.', 'pol6pil@gmail.com', 3),
(6, 'Funciona a la perfeccion', 4, '2023-06-09', 'Ahora la consola puede durar encendida el doble de lo que lo hacia antes', 'Thug@Maginicent', 6),
(9, 'Funcionan a la perfección', 5, '2023-06-10', 'Ahora puedo utilizar la consola', 'Thug@Maginicent', 1),
(11, 'rfgrfgh', 1, '2023-06-13', 'fddfgdf', 'pol6pil@gmail.com', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `email` varchar(255) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `saldo` double NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) NOT NULL,
  `esAdmin` tinyint(1) NOT NULL DEFAULT 0,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `nombre`, `saldo`, `foto`, `apellido1`, `apellido2`, `esAdmin`, `pass`) VALUES
('admin@admin', 'admin', 300, NULL, 'administrador', '', 1, '$2b$10$b7xLtBalfyzNwyP0goyWduXz08qG8NJyAVGfm7R/YnpJnueCLZYSC'),
('correo@gmail.com', 'usuario', 0, NULL, 'apellido', '', 0, '$2b$10$Agud2YYF1m5GEsw54FlKXu/BCQYuUckptgOdBAP.uJAT78fTPCREm'),
('pol6pil@gmail.com', 'pol', 4049.263, 'files7177893-1686662399508.png', 'bosch', 'arcas', 0, '$2b$10$xxIy/p93.BaV6pj/pIbq5.AwhAh0xNbXm3KFO5eoVjtwoP/XmAgxu'),
('Thug@Maginicent', 'Thugnificent', 888.51, 'files3345739-1685015181094.png', 'Jenkins', '', 0, '$2b$10$TCG5dgrvIuSj2rOMMIUZRukUCsnkUcreXlRSfWMou6dq4EvnFs9n.'),
('usuario@gmai.com', 'usuario', 0, NULL, 'apellido', '', 0, '$2b$10$H7BS/Y5Gb9oK8i929l88meZ.52pM.PhpQwLXkx/TxwiMx1SVlyjCC');

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
