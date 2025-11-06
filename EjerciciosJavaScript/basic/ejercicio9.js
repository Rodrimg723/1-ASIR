const numbers = [1, 2, 3, 5, 45, 37, 58]

const resultado = sumNumbers(numbers)

console.log(resultado)

function sumNumbers(numberList) {
  let total = 0
  for (const number of numberList) {
    total += number
  }
  return total
}
