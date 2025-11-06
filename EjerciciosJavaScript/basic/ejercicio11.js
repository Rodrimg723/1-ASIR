const mixedElements = [
  6,
  1,
  'Marvel',
  1,
  'hamburguesa',
  '10',
  'Prometeo',
  8,
  'Hola mundo'
]

const result = averageWord(mixedElements)

console.log(result)

function averageWord(list) {
  let totalSum = 0
  for (const element of list) {
    if (typeof element === 'number') {
      totalSum += element
    } else if (typeof element === 'string') {
      totalSum += element.length
    }
  }
  return totalSum
}
