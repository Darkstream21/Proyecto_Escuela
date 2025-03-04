<?php
include("conexion.php");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
</head>
<body>
    <h2>Ingreso de valores</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        Nombre:<br>
        <input type="text" name="NOMBRE_USUARIO" required><br>
        ID:<br>
        <input type="number" name="ID_USUARIO" required><br>
        Tipo de usuario:<br>
        <input type="text" name="TIPO_USUARIO" required><br>
        <input type="submit" name="registrar" value="Registrar">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $usuario = filter_input(INPUT_POST, "NOMBRE_USUARIO", FILTER_SANITIZE_SPECIAL_CHARS);
        $id = filter_input(INPUT_POST, "ID_USUARIO", FILTER_SANITIZE_NUMBER_INT);
        $tipo = filter_input(INPUT_POST, "TIPO_USUARIO", FILTER_SANITIZE_SPECIAL_CHARS);

        if (empty($usuario) || empty($id) || empty($tipo)) {
            echo "<p style='color:red;'>Todos los campos son obligatorios.</p>";
        } else {
            // Verificar si el usuario ya existe
            $check_sql = "SELECT * FROM usuario WHERE ID_Usuario = ?";
            if ($stmt = mysqli_prepare($conecta, $check_sql)) {
                mysqli_stmt_bind_param($stmt, "i", $id);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_store_result($stmt);

                if (mysqli_stmt_num_rows($stmt) > 0) {
                    echo "<p style='color:red;'>El ID de usuario ya está registrado.</p>";
                } else {
                    // Insertar nuevo usuario
                    $sql = "INSERT INTO usuario (ID_Usuario, Tipo_Usuario, Nombre_Usuario) VALUES (?, ?, ?)";
                    if ($stmt = mysqli_prepare($conecta, $sql)) {
                        mysqli_stmt_bind_param($stmt, "iss", $id, $tipo, $usuario);
                        if (mysqli_stmt_execute($stmt)) {
                            echo "<p style='color:green;'>Usuario registrado exitosamente.</p>";
                        } else {
                            echo "<p style='color:red;'>Error al registrar usuario.</p>";
                        }
                        mysqli_stmt_close($stmt);
                    }
                }
            }
        }
        mysqli_close($conecta);
    }
    ?>
</body>
</html>
