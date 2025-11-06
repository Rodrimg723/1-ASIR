const users = [
  { name: 'Tony', years: 43 },
  { name: 'Peter', years: 18 },
  { name: 'Natasha', years: 14 },
  { name: 'Bruce', years: 32 },
  { name: 'Khamala', years: 16 }
]

const majorUsers = []
const minorUsers = []

for (const user of users) {
  if (user.years < 18) {
    minorUsers.push(user.name)
  } else {
    majorUsers.push(user.name)
  }
}

console.log('Usuarios menores de edad:')
for (const user of minorUsers) {
  console.log(user)
}

console.log('Usuarios mayores de edad:')
for (const user of majorUsers) {
  console.log(user)
}
