const capitals = {
  Spain: 'Madrid',
  France: 'Paris',
  Italy: 'Rome',
  Germany: 'Berlin',
  Portugal: 'Lisbon',
  Poland: 'Warsaw',
  Greece: 'Athens',
  Austria: 'Vienna',
  Hungary: 'Budapest',
  Ireland: 'Dublin'
}

function getCapital(country) {
  if (capitals[country]) {
    return capitals[country]
  } else {
    return `La capital de ${country} no se encuentra en nuestra lista.`
  }
}

const capitalOfSpain = getCapital('Spain')
console.log(capitalOfSpain)

const capitalOfItaly = getCapital('Italy')
console.log(capitalOfItaly)
