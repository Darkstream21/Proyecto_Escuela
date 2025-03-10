<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="base1.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximun-scale=1.0. user-scalable=no">
    <title>Pase de entrada </title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet"><!-- Con esto el usuario no puede hacer zoom en el celular-->
    <link rel="stylesheet" href="../estilos/base1.css">
    </head>
<!-- Dentro del body deben poner los siguientes apartados  -->
    <body>
        <!-- LOGO  -->
        <div class="container">
            <img src="https://lh3.googleusercontent.com/3Kh8yi_6rA8bEWMHZpGTyMreuSipv0m-KiZo7HoaOkIpVQc2ucyqQBups3Ye7VOTQlPjH7THp3E60B6ejnFYdnYzaLHysv_k=s580" alt="Logo" style="width: 240px; height: auto; margin-bottom: 9px;">
          <!-- RELOJ  -->
        
             <p class="greeting">¡Bienvenido/a!</p>
            <p>Por favor, completa la información para continuar.</p>
            <!--<p class="greeting">ID de usuario</p>--> 
            <input type="text"required value="ID de usuario" >
            <div class="select-container">
                <small class="text-muted">Seleccione la actividad</small>
                <select class="select-box">
                  <option value="">Actividad en clase</option>
                  <option value="">Tarea</option>
                  <option value="">Otro</option>
                </select>
                <div class="time-group" >
                    <div class="form-group">
                        <label for="startTime">Hora de entrada</label>
                        <input type="time" id="startTime" placeholder="HHMM" maxlength="5" oninput="formatTime(this)">
                    </div>
                
                    <div class="form-group">
                        <label for="endTime">Hora de salida</label>
                        <input type="text" id="endTime" placeholder="HHMM" maxlength="5" oninput="formatTime(this)">
                    </div>
            </div>
           
            <button>Iniciar actividad</button>
    <?php
    
    ?>
        </body>
        <!-- RELOJJ  -->
        <script>
            
            function showClock() {
                document.getElementById("clock").style.display = "block";
                updateClock();
                setInterval(updateClock, 1000);
            }
    
            function updateClock() {
                const now = new Date();
                const hours = String(now.getHours()).padStart(2, '0');
                const minutes = String(now.getMinutes()).padStart(2, '0');
                const seconds = String(now.getSeconds()).padStart(2, '0');
                document.getElementById("clock").textContent = `${hours}:${minutes}:${seconds}`;
            }
            showGreeting();

document.getElementById('activity').addEventListener('change', function() {
    var startTimeInput = document.getElementById('startTime');
    var endTimeInput = document.getElementById('endTime');

    if (this.value == '2') {
        // Hora actual para iniciar y finalizar hora y media despues
        var now = new Date();
        var startHour = now.getHours().toString().padStart(2, '0') + ':' + now.getMinutes().toString().padStart(2, '0');
        var endTime = new Date(now.getTime() + 90 * 60000); 
        var endHour = endTime.getHours().toString().padStart(2, '0') + ':' + endTime.getMinutes().toString().padStart(2, '0');
        startTimeInput.value = startHour;
        endTimeInput.value = endHour;
    } else {
        startTimeInput.value = '';
        endTimeInput.value = '';
    }
});
        </script>
</html>
