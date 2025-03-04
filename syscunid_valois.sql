-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-03-2025 a las 17:08:28
-- Versión del servidor: 8.0.41-32
-- Versión de PHP: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `syscunid_valois`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CTC`
--

CREATE TABLE `CTC` (
  `Folio` int NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Ubicación` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Equipos`
--

CREATE TABLE `Equipos` (
  `Núm_Serie` int NOT NULL,
  `Marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descripción` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Registros`
--

CREATE TABLE `Registros` (
  `ID_Registro` int NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID_User` int NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Area` varchar(30) NOT NULL,
  `Rol` varchar(30) NOT NULL,
  `Cuatrimestre` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CTC`
--
ALTER TABLE `CTC`
  ADD PRIMARY KEY (`Folio`);

--
-- Indices de la tabla `Equipos`
--
ALTER TABLE `Equipos`
  ADD PRIMARY KEY (`Núm_Serie`);

--
-- Indices de la tabla `Registros`
--
ALTER TABLE `Registros`
  ADD PRIMARY KEY (`ID_Registro`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID_User`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CTC`
--
ALTER TABLE `CTC`
  MODIFY `Folio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID_User` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CTC`
--
ALTER TABLE `CTC`
  ADD CONSTRAINT `CTC_ibfk_1` FOREIGN KEY (`Folio`) REFERENCES `Equipos` (`Núm_Serie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Registros`
--
ALTER TABLE `Registros`
  ADD CONSTRAINT `Registros_ibfk_1` FOREIGN KEY (`ID_Registro`) REFERENCES `CTC` (`Folio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Registros_ibfk_2` FOREIGN KEY (`ID_Registro`) REFERENCES `Usuarios` (`ID_User`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
