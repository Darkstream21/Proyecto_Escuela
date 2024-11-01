use escuela;
CREATE TABLE `Usuarios`(
 `Id_Usuarios` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Nombre` VARCHAR(100) NOT NULL,
    `Area` VARCHAR(50) NOT NULL,  -- 
    `Rol` ENUM('Estudiante', 'Profesor', 'Administrador') NOT NULL,  -- 
    `Actividad` VARCHAR(255) NOT NULL,  -- 
    `Cuatrimestre` TINYINT UNSIGNED NULL  
); 