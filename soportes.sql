CREATE TABLE `CTC_Inventario` (
    `Folio_Inv` INT NOT NULL,
    `Año` DATE NULL,
    `Status` VARCHAR(50) NULL,
    `Ubicación` VARCHAR(50) NULL,
    PRIMARY KEY (`Folio_Inv`)
);

CREATE TABLE `Equipo` (
    `Núm_Serie` INT NOT NULL,
    `Marca` VARCHAR(50) NULL,
    `Modelo` VARCHAR(50) NULL,
    `Descripción` VARCHAR(50) NULL,
    PRIMARY KEY (`Núm_Serie`)
);

CREATE TABLE `Registro` (
    `ID_Registro` INT NOT NULL,
    `Fecha_Uso_Equipo` DATE NULL,
    `Hora` TIME NULL,
    PRIMARY KEY (`ID_Registro`)
);

CREATE TABLE `Usuario` (
    `ID_Usuario` INT NOT NULL,
    `Tipo_Usuario` VARCHAR(20) NULL,
    `Nombre_Usuario` VARCHAR(50) NULL,
    PRIMARY KEY (`ID_Usuario`)
);

ALTER TABLE `Equipo` ADD CONSTRAINT `FK_Equipo_CTC_Inventario`
FOREIGN KEY (`Núm_Serie`) REFERENCES `CTC_Inventario` (`Folio_Inv`);

ALTER TABLE `Equipo` ADD CONSTRAINT `FK_Equipo_Usuario`
FOREIGN KEY (`Núm_Serie`) REFERENCES `Usuario` (`ID_Usuario`);

ALTER TABLE `Registro` ADD CONSTRAINT `FK_Registro_Equipo`
FOREIGN KEY (`ID_Registro`) REFERENCES `Equipo` (`Núm_Serie`);

ALTER TABLE `Registro` ADD CONSTRAINT `FK_Registro_Usuario`
FOREIGN KEY (`ID_Registro`) REFERENCES `Usuario` (`ID_Usuario`);
