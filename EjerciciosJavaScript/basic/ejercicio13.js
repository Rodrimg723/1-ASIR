const names = [
  'Peter',
  'Steve',
  'Tony',
  'Natasha',
  'Clint',
  'Logan',
  'Xabier',
  'Bruce',
  'Peggy',
  'Jessica',
  'Marc'
]
const result1 = nameFinder(names, 'Tony')
console.log(result1)

const result2 = nameFinder(names, 'Pepe')
console.log(result2)

function nameFinder(nameList, nameToFind) {
  const index = nameList.indexOf(nameToFind)
  if (index !== -1) {
    return { found: true, position: index }
  } else {
    return false
  }
}
