-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2021 a las 17:53:01
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` tinyint(4) NOT NULL,
  `nombre_estado` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `nombre_estado`) VALUES
(1, 'Infección'),
(2, 'Desorientación'),
(3, 'Violencia'),
(4, 'Desmayo'),
(5, 'Transformación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie`
--

CREATE TABLE `zombie` (
  `id_zombie` tinyint(4) NOT NULL,
  `nombre_zombie` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `zombie`
--

INSERT INTO `zombie` (`id_zombie`, `nombre_zombie`) VALUES
(1, 'Alejandro Rivero'),
(2, 'Eduardo Juarez'),
(3, 'Ricardo Cortes'),
(4, 'Fer Polo'),
(5, 'Maria Rivero'),
(6, 'Daniel Perez'),
(7, 'Laura Gi'),
(8, 'Julio Aleman'),
(9, 'David Polo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zombie_estado`
--

CREATE TABLE `zombie_estado` (
  `id` tinyint(4) NOT NULL,
  `id_zombie` tinyint(4) NOT NULL,
  `id_estado` tinyint(4) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `zombie_estado`
--

INSERT INTO `zombie_estado` (`id`, `id_zombie`, `id_estado`, `fecha_registro`) VALUES
(1, 1, 5, '2021-10-20 13:57:56'),
(2, 5, 2, '2021-10-20 13:57:56'),
(3, 1, 1, '2021-10-20 13:57:56'),
(4, 5, 3, '2021-10-20 13:57:56'),
(5, 6, 5, '2021-10-20 13:57:56'),
(6, 9, 3, '2021-10-20 13:57:56'),
(7, 5, 2, '2021-10-20 13:57:56'),
(8, 5, 5, '2021-10-20 14:00:49'),
(9, 9, 2, '2021-10-20 14:00:49'),
(10, 4, 1, '2021-10-20 14:00:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `zombie`
--
ALTER TABLE `zombie`
  ADD PRIMARY KEY (`id_zombie`);

--
-- Indices de la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zombie` (`id_zombie`,`id_estado`),
  ADD KEY `id_estado` (`id_estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `zombie`
--
ALTER TABLE `zombie`
  MODIFY `id_zombie` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `zombie_estado`
--
ALTER TABLE `zombie_estado`
  ADD CONSTRAINT `zombie_estado_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `zombie_estado_ibfk_2` FOREIGN KEY (`id_zombie`) REFERENCES `zombie` (`id_zombie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
