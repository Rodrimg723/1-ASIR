const xMen = [
  { name: 'Wolverine', year: 1974 },
  { name: 'Cyclops', year: 1963 },
  { name: 'Storm', year: 1975 },
  { name: 'Phoenix', year: 1963 },
  { name: 'Beast', year: 1963 },
  { name: 'Gambit', year: 1990 },
  { name: 'Nightcrawler', year: 1975 },
  { name: 'Magneto', year: 1963 },
  { name: 'Professor X', year: 1963 },
  { name: 'Mystique', year: 1978 }
]

function findOldestXMen(characterList) {
  if (characterList.length === 0) {
    return null
  }

  let oldestMember = characterList[0]

  for (const member of characterList) {
    if (member.year < oldestMember.year) {
      oldestMember = member
    }
  }

  return oldestMember
}

const oldestXMenMember = findOldestXMen(xMen)

console.log(oldestXMenMember)
