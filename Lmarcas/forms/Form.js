// PARA QUE FUNCIONE AÑADÍ EN LA LINEA 98 DEL HTML "onclick="mostrar();">"       --> <input class="Button" type="submit" value="Enviar" onclick="mostrar();">

// COMO NO SE PODÍA RETOCAR EL HTML EN EL SEGUNDO DIA DE PRUEBA TE LO PONGO POR AQUÍ 

function mostrar(){

    var uno = document.getElementById("nombre").value;

    var dos = document.getElementById("fechaAnalisis").value;

    var tres = document.getElementById("email").value;

    var cuatro = document.getElementById("Nivel_Riesgo").value;

    alert("Verifique que su envio es correcto: "+uno+"-----"+dos+"-----"+tres+"-----"+cuatro);

}