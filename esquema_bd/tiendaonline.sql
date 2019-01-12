-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-01-2019 a las 18:20:09
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendaonline`
--
CREATE DATABASE IF NOT EXISTS `tiendaonline` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tiendaonline`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(100) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `telefono` int(12) DEFAULT NULL,
  `movil` int(12) DEFAULT NULL,
  `fax` int(12) DEFAULT NULL,
  `direccioncalle` varchar(255) DEFAULT NULL,
  `codigopostal` varchar(255) DEFAULT NULL,
  `poblacion` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `dninif` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellidos`, `email`, `usuario`, `contrasena`, `telefono`, `movil`, `fax`, `direccioncalle`, `codigopostal`, `poblacion`, `pais`, `dninif`) VALUES
(1, 'Jesus', 'Ferrer', 'info@mail.com', 'admin', 'x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(2, 'Otro', 'Otro', 'otro@mail.com', 'otro', 'x', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesproductos`
--

DROP TABLE IF EXISTS `imagenesproductos`;
CREATE TABLE `imagenesproductos` (
  `id` int(100) NOT NULL,
  `idproducto` int(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `imagenesproductos`
--

INSERT INTO `imagenesproductos` (`id`, `idproducto`, `imagen`, `titulo`, `descripcion`) VALUES
(1, 1, 'lampara1a.png', 'Titulo 1', 'Texto descripcion'),
(2, 1, 'lampara1b.png', 'Titulo 2', 'Texto descripcion'),
(3, 2, 'lampara2a.png', 'Titulo 1', 'Texto descripcion'),
(4, 2, 'lampara2b.png', 'Titulo 2', 'Texto descripcion'),
(5, 3, 'lampara3a.png', 'Titulo 1', 'Texto descripcion'),
(6, 3, 'lampara3b.png', 'Titulo 2', 'Texto descripcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineaspedido`
--

DROP TABLE IF EXISTS `lineaspedido`;
CREATE TABLE `lineaspedido` (
  `id` int(100) NOT NULL,
  `idpedido` int(255) DEFAULT NULL,
  `idproducto` int(255) DEFAULT NULL,
  `unidades` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lineaspedido`
--

INSERT INTO `lineaspedido` (`id`, `idpedido`, `idproducto`, `unidades`) VALUES
(1, 3, 1, 1),
(2, 3, 2, 1),
(3, 3, 3, 1),
(4, 4, 1, 1),
(5, 4, 2, 1),
(6, 4, 3, 1),
(7, 5, 1, 1),
(8, 5, 2, 1),
(9, 5, 3, 1),
(10, 6, 1, 1),
(11, 6, 2, 1),
(12, 6, 3, 1),
(13, 7, 1, 1),
(14, 8, 1, 1),
(15, 9, 1, 1),
(16, 9, 2, 1),
(17, 9, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id` int(100) NOT NULL,
  `idcliente` int(100) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `idcliente`, `fecha`, `estado`) VALUES
(1, 1, '1547245843', '1'),
(2, 2, '1547247271', '1'),
(3, 1, '1547248388', '0'),
(4, 2, '1547249014', '1'),
(5, 2, '1547249300', '0'),
(6, 1, '1547249343', '2'),
(7, 1, '1547250641', '2'),
(8, 1, '1547250697', '0'),
(9, 1, '1547250769', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(100) NOT NULL,
  `nombre_producto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(30,2) DEFAULT NULL,
  `peso` int(255) DEFAULT NULL,
  `longitud` int(255) DEFAULT NULL,
  `anchura` int(255) DEFAULT NULL,
  `altura` int(255) DEFAULT NULL,
  `existencias` int(255) DEFAULT NULL,
  `activado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre_producto`, `descripcion`, `precio`, `peso`, `longitud`, `anchura`, `altura`, `existencias`, `activado`) VALUES
(1, 'Lampara icosaedro', 'Texto descripción', '20.00', 1, 20, 20, 20, 8, 1),
(2, 'Lampara cubo', 'Texto descripción cubo', '25.00', 1, 25, 25, 25, 19, 1),
(3, 'Lampara estrella', 'Texto descripción de la lampara estrella', '18.00', 1, 20, 20, 20, 14, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagenesproductos`
--
ALTER TABLE `imagenesproductos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `imagenesproductos`
--
ALTER TABLE `imagenesproductos`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `lineaspedido`
--
ALTER TABLE `lineaspedido`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
