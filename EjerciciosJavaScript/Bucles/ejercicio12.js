const mutants = [
  { name: 'Wolverine', power: 'regeneration' },
  { name: 'Magneto', power: 'magnetism' },
  { name: 'Professor X', power: 'telepathy' },
  { name: 'Jean Grey', power: 'telekinesis' },
  { name: 'Rogue', power: 'power absorption' },
  { name: 'Storm', power: 'weather manipulation' },
  { name: 'Mystique', power: 'shape-shifting' },
  { name: 'Beast', power: 'superhuman strength' },
  { name: 'Colossus', power: 'steel skin' },
  { name: 'Nightcrawler', power: 'teleportation' }
]

function findMutantByPower(mutantList, powerToFind) {
  const mutantExists = mutantList.some((mutant) => mutant.power === powerToFind)

  if (mutantExists) {
    return `¡Sí! Se ha encontrado al menos un mutante con el poder de ${powerToFind}.`
  } else {
    return `No se encontró ningún mutante con el poder de ${powerToFind}.`
  }
}

const searchResult1 = findMutantByPower(mutants, 'telepathy')
console.log(searchResult1)

const searchResult2 = findMutantByPower(mutants, 'invisibility')
console.log(searchResult2)
