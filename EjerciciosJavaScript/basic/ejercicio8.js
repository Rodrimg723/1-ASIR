const avengers = [
  'Hulk',
  'Thor',
  'Iron Man',
  'Captain A.',
  'Spiderman',
  'Captain M.'
]

function findLongestWord(stringList) {
  let longestWord = stringList[0]
  for (let i = 1; i < stringList.length; i++) {
    const currentWord = stringList[i]
    if (currentWord.length > longestWord.length) {
      longestWord = currentWord
    }
  }
  return longestWord
}
const longest = findLongestWord(avengers)
console.log(longest)
