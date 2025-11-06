// --- 4.1: Añadir evento 'click' a un botón ---
const boton = document.getElementById('btnToClick')

boton.addEventListener('click', (event) => {
  console.log('¡Botón pulsado!')
  console.log(event)
})

// --- 4.2: Añadir evento 'focus' a un input ---
const inputFocus = document.querySelector('.focus')

inputFocus.addEventListener('focus', (event) => {
  console.log(
    'El input .focus ha recibido el foco. Su valor es:',
    event.target.value
  )
})

// --- 4.3: Añadir evento 'input' a un input ---
const inputValue = document.querySelector('.value')

inputValue.addEventListener('input', (event) => {
  console.log('El valor del input .value ha cambiado a:', event.target.value)
})

// --- 4.4: crea una lista ul > li dinámicamente en el html que imprima cada uno de los albums ---

const albums = [
  'De Mysteriis Dom Sathanas',
  'Reign of Blood',
  'Ride the Lightning',
  'Painkiller',
  'Iron Fist'
]

const listaAlbums = document.createElement('ul')

for (const album of albums) {
  const li = document.createElement('li')
  li.textContent = album
  listaAlbums.appendChild(li)
}

document.body.appendChild(listaAlbums)
