CREATE TABLE `Colegio` (
  `ID` int PRIMARY KEY,
  `Nombre` varchar(255),
  `Direccion` varchar(255),
  `Telefono` varchar(255),
  `Director` varchar(255),
  `CorreoElectronico` varchar(255)
);

CREATE TABLE `Estudiante` (
  `ID` int PRIMARY KEY,
  `Nombre` varchar(255),
  `Apellido` varchar(255),
  `FechaNacimiento` date,
  `Direccion` varchar(255),
  `CorreoElectronico` varchar(255),
  `Telefono` varchar(255),
  `Grado` int,
  `ColegioID` int
);

CREATE TABLE `Profesor` (
  `ID` int PRIMARY KEY,
  `Nombre` varchar(255),
  `Apellido` varchar(255),
  `CorreoElectronico` varchar(255),
  `Telefono` varchar(255),
  `Materias` varchar(255),
  `ColegioID` int
);

CREATE TABLE `Curso` (
  `ID` int PRIMARY KEY,
  `Nombre` varchar(255),
  `Descripcion` text,
  `ProfesorID` int,
  `ColegioID` int
);

CREATE TABLE `Calificaciones` (
  `ID` int PRIMARY KEY,
  `EstudianteID` int,
  `CursoID` int,
  `Calificacion` decimal,
  `ColegioID` int
);

CREATE TABLE `Horario` (
  `ID` int PRIMARY KEY,
  `DiaSemana` varchar(255),
  `HoraInicio` time,
  `HoraFinalizacion` time,
  `CursoID` int,
  `ColegioID` int
);

CREATE TABLE `Asistencia` (
  `ID` int PRIMARY KEY,
  `Fecha` date,
  `Tipo` varchar(255),
  `PersonaID` int,
  `ColegioID` int
);

ALTER TABLE `Estudiante` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);

ALTER TABLE `Profesor` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);

ALTER TABLE `Curso` ADD FOREIGN KEY (`ProfesorID`) REFERENCES `Profesor` (`ID`);

ALTER TABLE `Curso` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);

ALTER TABLE `Calificaciones` ADD FOREIGN KEY (`EstudianteID`) REFERENCES `Estudiante` (`ID`);

ALTER TABLE `Calificaciones` ADD FOREIGN KEY (`CursoID`) REFERENCES `Curso` (`ID`);

ALTER TABLE `Calificaciones` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);

ALTER TABLE `Horario` ADD FOREIGN KEY (`CursoID`) REFERENCES `Curso` (`ID`);

ALTER TABLE `Horario` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);

ALTER TABLE `Asistencia` ADD FOREIGN KEY (`PersonaID`) REFERENCES `Estudiante` (`ID`);

ALTER TABLE `Asistencia` ADD FOREIGN KEY (`PersonaID`) REFERENCES `Profesor` (`ID`);

ALTER TABLE `Asistencia` ADD FOREIGN KEY (`ColegioID`) REFERENCES `Colegio` (`ID`);
