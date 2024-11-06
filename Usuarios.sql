use escuela;
CREATE TABLE `Usuarios`(
 `Id_Usuarios` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre` VARCHAR(100) NOT NULL,
    `Area` VARCHAR(50) NOT NULL,  -- 
    `Rol` ENUM('Estudiante', 'Profesor', 'Administrador') NOT NULL,  -- 
    `Actividad` VARCHAR(255) NOT NULL,  -- 
    `Cuatrimestre` TINYINT UNSIGNED NULL  
); 
CREATE TABLE `Registro`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Id_Computadora` INT NOT NULL,
    `Id_Usuarios` INT NOT NULL,
    `Tiempo` TIMESTAMP NOT NULL
);
CREATE TABLE `Equipo`(
    `id_Computadora` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `modelo` VARCHAR(255) NOT NULL,
    `Características` LONGTEXT NOT NULL
);
ALTER TABLE
    `Registro` ADD CONSTRAINT `registro_id_computadora_foreign` FOREIGN KEY(`Id_Computadora`) REFERENCES `Equipo`(`id_Computadora`);
ALTER TABLE
    `Registro` ADD CONSTRAINT `registro_id_usuarios_foreign` FOREIGN KEY(`Id_Usuarios`) REFERENCES `Usuarios`(`Id_Usuarios`);