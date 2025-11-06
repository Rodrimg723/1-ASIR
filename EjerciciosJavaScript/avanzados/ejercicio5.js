function rollDice(sides) {
  return Math.floor(Math.random() * sides) + 1
}

const rollD6 = rollDice(6)
console.log(`Resultado de un dado de 6 caras: ${rollD6}`)

const rollD10 = rollDice(10)
console.log(`Resultado de un dado de 10 caras: ${rollD10}`)

const rollD20 = rollDice(20)
console.log(`Resultado de un dado de 20 caras: ${rollD20}`)
