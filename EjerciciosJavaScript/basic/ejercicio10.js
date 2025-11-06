const numbers = [12, 21, 38, 5, 45, 37, 6]

const result = average(numbers)

console.log(result)

function average(numberList) {
  let sum = 0
  for (const number of numberList) {
    sum += number
  }
  if (numberList.length === 0) {
    return 0
  }
  const avg = sum / numberList.length
  return avg
}
