
<?php  
date_default_timezone_set('America/Mexico_City');
$conecta =  mysqli_connect('localhost','root','','computo');
if (!mysqli_set_charset($conecta,'utf8')){
die('No pudo conectarse: ' . mysqli_connect_error());
}
?>