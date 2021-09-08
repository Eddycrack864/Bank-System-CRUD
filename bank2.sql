-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2021 a las 18:11:20
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bank2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account`
--

CREATE TABLE `account` (
  `Account_no` int(10) NOT NULL,
  `Account_type` varchar(10) NOT NULL,
  `Balance` int(20) NOT NULL,
  `Aadhar_no` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `account`
--

INSERT INTO `account` (`Account_no`, `Account_type`, `Balance`, `Aadhar_no`) VALUES
(10009, 'Ahorros', 45000, '111122223333'),
(10010, 'Ahorros', 30000, '222233334444'),
(10011, 'Ahorros', 40000, '333344445555'),
(10012, 'Ahorros', 60000, '444455556666'),
(10013, 'Ahorros', 45000, '555566667777');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone_no` varchar(10) NOT NULL,
  `Aadhar_no` varchar(12) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`FName`, `LName`, `Address`, `Email`, `Phone_no`, `Aadhar_no`, `DOB`, `Gender`, `Username`) VALUES
('Eddyson', 'De La Torre', 'Guayaquil', 'eddycrack864@gmail.com', '0987654321', '111122223333', '2001-05-10', 'Masculino', 'Eddy'),
('Deyanira', 'Jimenez', 'Long Island', 'deyanira.ji@gmail.com', '0912345678', '222233334444', '2000-10-05', 'Femenino', 'Deya'),
('Joel', 'Astudillo', 'Guayaquil', 'joel.astu@gmail.com', '0999999999', '333344445555', '1999-01-23', 'Masculino', 'ivanhoe'),
('Pamela', 'Pesantez', 'Quito', 'pamela.pe@gmail.com', '0988888888', '444455556666', '2000-12-05', 'Femenino', 'NoName'),
('Carlos', 'Ligua', 'Guayaquil', 'carlos.li@gmail.com', '0966666666', '555566667777', '1999-10-04', 'Masculino', 'XBurner');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `Sr` int(10) NOT NULL,
  `Account_no` int(10) NOT NULL,
  `BenificiaryAccount_no` int(10) NOT NULL,
  `Amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`Sr`, `Account_no`, `BenificiaryAccount_no`, `Amount`) VALUES
(7, 10009, 10010, 5000),
(8, 10012, 10013, 15000),
(9, 10013, 10011, 10000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`Username`, `Password`) VALUES
('Deya', 'zzzzzz'),
('Eddy', 'abcdef'),
('ivanhoe', 'aaaaaa'),
('NoName', 'xxxxxx'),
('XBurner', 'qqqqqq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_no`),
  ADD KEY `Aadhar_no` (`Aadhar_no`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Aadhar_no`),
  ADD KEY `Username` (`Username`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`Sr`),
  ADD KEY `Account_no` (`Account_no`),
  ADD KEY `BenificiaryAccount_no` (`BenificiaryAccount_no`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account`
--
ALTER TABLE `account`
  MODIFY `Account_no` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10014;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `Sr` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`Aadhar_no`) REFERENCES `customer` (`Aadhar_no`);

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`);

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`Account_no`) REFERENCES `account` (`Account_no`),
  ADD CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`BenificiaryAccount_no`) REFERENCES `account` (`Account_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
