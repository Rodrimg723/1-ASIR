const fantasticFour = [
  'La antorcha humana',
  'Mr. Fantástico',
  'La mujer invisible',
  'La cosa'
]

function swap(array, index1, index2) {
  const primerElemento = array[index1]
  const segundoElemento = array[index2]

  array[index1] = segundoElemento
  array[index2] = primerElemento

  return array
}

// Ejemplo 1
const swappedFirstAndLast = swap([...fantasticFour], 0, 3)
console.log('Intercambiando el primero y el último:', swappedFirstAndLast)

// Ejemplo 2
const swappedMiddle = swap([...fantasticFour], 1, 2)
console.log('Intercambiando los del medio:', swappedMiddle)
