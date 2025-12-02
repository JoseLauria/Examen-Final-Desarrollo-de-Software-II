-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2025 a las 00:54:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `producto`, `precio`, `stock`, `createdAt`, `updatedAt`) VALUES
(1, 'libros', 4, 4, '2025-11-29 20:55:14', '2025-12-02 22:56:44'),
(2, 'monitor', 8, 4, '2025-12-02 21:48:03', '2025-12-02 22:56:45'),
(3, 'teclado', 35, 11, '2025-12-02 22:45:01', '2025-12-02 22:56:47'),
(4, 'Servidor', 200, 17, '2025-12-02 23:01:00', '2025-12-02 23:01:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `horario` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `profesorId` int(11) DEFAULT NULL,
  `curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `horario`, `createdAt`, `updatedAt`, `profesorId`, `curso`) VALUES
(18, 'desarrollo de software ', '12', '2025-12-02 22:23:09', '2025-12-02 22:23:09', NULL, '1ro B'),
(19, 'Matematica', '12', '2025-12-02 22:31:43', '2025-12-02 22:31:43', NULL, '2do A'),
(20, 'Desarrollo de Software', '12', '2025-12-02 22:39:00', '2025-12-02 22:39:00', NULL, '1ro A'),
(21, 'Desarrollo de Software II', '18:00', '2025-12-02 22:46:44', '2025-12-02 22:46:44', 19, '6to B'),
(22, 'Practicas Profesionalizantes V', '19:00', '2025-12-02 22:47:45', '2025-12-02 22:47:45', 19, '5to B'),
(23, 'Programación ', '12', '2025-12-02 22:56:38', '2025-12-02 22:56:38', 20, '4to A'),
(24, 'Geofìsica', 'Mar 10', '2025-12-02 22:59:42', '2025-12-02 22:59:42', 21, '4to A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesors`
--

CREATE TABLE `profesors` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `especialidad` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `dni` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesors`
--

INSERT INTO `profesors` (`id`, `nombre`, `especialidad`, `createdAt`, `updatedAt`, `dni`) VALUES
(19, 'Emir Zatta', 'Programación ', '2025-12-02 22:46:18', '2025-12-02 22:46:18', '34054589'),
(20, 'Jose Lauria', 'Matemática ', '2025-12-02 22:56:31', '2025-12-02 22:56:31', '34054588'),
(21, 'Emir', 'Fisica', '2025-12-02 22:59:16', '2025-12-02 22:59:16', '45213399');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profesorId` (`profesorId`);

--
-- Indices de la tabla `profesors`
--
ALTER TABLE `profesors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `dni_2` (`dni`),
  ADD UNIQUE KEY `dni_3` (`dni`),
  ADD UNIQUE KEY `dni_4` (`dni`),
  ADD UNIQUE KEY `dni_5` (`dni`),
  ADD UNIQUE KEY `dni_6` (`dni`),
  ADD UNIQUE KEY `dni_7` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `profesors`
--
ALTER TABLE `profesors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`profesorId`) REFERENCES `profesors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`profesorId`) REFERENCES `profesors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_3` FOREIGN KEY (`profesorId`) REFERENCES `profesors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_4` FOREIGN KEY (`profesorId`) REFERENCES `profesors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
