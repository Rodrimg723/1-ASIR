/* JavaScript (2 puntos)

Seleccionar elementos del DOM:

 - Campos obligatorios (nombre, fecha de llegada, fecha de salida, número de personas).
 - Botón "Verificar Disponibilidad".
 
Añadir funcionalidad al botón de verificación (onclick en el script, no en HTML):
	mostrar por consola los valores de los elementos del formulario seleccionados antes.
	let habitacionesDisponibles = Math.floor(Math.random() * 11);

	Comprobar si el numero de personas introducidas en el formulario es menor o igual que las habitaciones disponibles (variable con un valor aleatorio del 0 al 10 declarada arriba)

*/

let nombreHuesped = document.getElementById('nombreHuesped')
console.log('nombreHuesped')

let apellidoHuesped = document.getElementById('apellidoHuesped')
console.log('apellidoHuesped')

let fechaLLegada = document.getElementById('fechaLLegada')
console.log('fechaLLegada')

let fechaSalida = document.getElementById('fechaSalida')
console.log('fechaSalida')

let numeroPersonas = document.getElementById('numeroHuespedes')
console.log('numeroHuespedes')

let buttonVerificar = document.getElementById('Verificar')
console.log('Verificar')

buttonVerificar.onclick = Verificar;

function Verificar(){
	console.log('nombreHuesped :',nombreHuesped.value)
	console.log('apellidoHuesped :',apellidoHuesped.value)
	console.log('fechaLLegada :',fechaLLegada.value)
	console.log('fechaSalida :',fechaSalida.value)
	console.log('numeroHuespedes :',numeroHuespedes.value)
}



