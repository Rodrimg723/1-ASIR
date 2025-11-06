// 1)
const mainCharacters = [
  'Luke',
  'Leia',
  'Han Solo',
  'Chewbacca',
  'Rey',
  'Anakin',
  'Obi-Wan'
]

// Ejemplo 1
const leiaPosition = findArrayIndex(mainCharacters, 'Leia')
console.log('Posición de Leia:', leiaPosition)

// Ejemplo 2
const lukePosition = findArrayIndex(mainCharacters, 'Luke')
console.log('Posición de Luke:', lukePosition)

// Ejemplo 3
const yodaPosition = findArrayIndex(mainCharacters, 'Yoda')
console.log('Posición de Yoda:', yodaPosition)

function findArrayIndex(array, text) {
  return array.indexOf(text)
}

// 2)

function findArrayIndex(array, text) {
  return array.indexOf(text)
}

function removeItem(array, text) {
  const index = findArrayIndex(array, text)

  if (index !== -1) {
    array.splice(index, 1)
  }

  return array
}
// Ejemplo 1
const charactersAfterRemovingChewie = removeItem(
  [...mainCharacters],
  'Chewbacca'
)
console.log(
  'Array después de eliminar a Chewbacca:',
  charactersAfterRemovingChewie
)

// Ejemplo 2
const charactersAfterRemovingLuke = removeItem([...mainCharacters], 'Luke')
console.log('Array después de eliminar a Luke:', charactersAfterRemovingLuke)

// Ejemplo 3
const charactersAfterTryingToRemoveYoda = removeItem(
  [...mainCharacters],
  'Yoda'
)
console.log(
  'Array después de intentar eliminar a Yoda:',
  charactersAfterTryingToRemoveYoda
)
