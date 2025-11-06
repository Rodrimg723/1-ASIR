const words = [
  'code',
  'repeat',
  'eat',
  'sleep',
  'code',
  'enjoy',
  'sleep',
  'code',
  'enjoy',
  'sleep',
  'code'
]

const result = repeatCounter(words)
console.log(result)

function repeatCounter(list) {
  const wordCounts = {}
  for (const word of list) {
    if (wordCounts[word]) {
      wordCounts[word]++
    } else {
      wordCounts[word] = 1
    }
  }
  return wordCounts
}
