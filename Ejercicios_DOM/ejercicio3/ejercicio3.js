// --- 3.1: Crear una lista ul > li dinámicamente en el html ---
const countriesList = ['Japón', 'Nicaragua', 'Suiza', 'Australia', 'Venezuela']
const ulPaises = document.createElement('ul')

for (const country of countriesList) {
  const li = document.createElement('li')
  li.textContent = country
  ulPaises.appendChild(li)
}

document.body.appendChild(ulPaises)

// --- 3.2: Eliminar el elemento que tenga la clase .fn-remove-me ---
const pToRemove = document.querySelector('.fn-remove-me')
if (pToRemove) {
  pToRemove.remove()
}

// --- 3.3: Crear dinámicamente una lista ul > li en el div específico ---
const cars = ['Mazda 6', 'Ford fiesta', 'Audi A4', 'Toyota corola']
const divPrintHere = document.querySelector('[data-function="printHere"]')
const ulCars = document.createElement('ul')

for (const car of cars) {
  const li = document.createElement('li')
  li.textContent = car
  ulCars.appendChild(li)
}

divPrintHere.appendChild(ulCars)

// --- 3.4: Crear dinámicamente divs con h4 e img ---
const countriesData = [
  { title: 'Random title', imgUrl: 'https://picsum.photos/300/200?random=1' },
  { title: 'Random title', imgUrl: 'https://picsum.photos/300/200?random=2' },
  { title: 'Random title', imgUrl: 'https://picsum.photos/300/200?random=3' },
  { title: 'Random title', imgUrl: 'https://picsum.photos/300/200?random=4' },
  { title: 'Random title', imgUrl: 'https://picsum.photos/300/200?random=5' }
]

for (const country of countriesData) {
  const countryDiv = document.createElement('div')
  countryDiv.classList.add('country-card')

  const titleH4 = document.createElement('h4')
  titleH4.textContent = country.title

  const image = document.createElement('img')
  image.src = country.imgUrl
  image.alt = country.title

  countryDiv.appendChild(titleH4)
  countryDiv.appendChild(image)
  document.body.appendChild(countryDiv)
}

// --- 3.5: Crear un botón que elimine el último elemento de la serie de divs ---
const deleteLastButton = document.createElement('button')
deleteLastButton.textContent = 'Eliminar el último'

deleteLastButton.addEventListener('click', () => {
  const allCountryCards = document.querySelectorAll('.country-card')
  if (allCountryCards.length > 0) {
    const lastCard = allCountryCards[allCountryCards.length - 1]
    lastCard.remove()
  }
})

document.body.appendChild(deleteLastButton)

// --- 3.6: Crear un botón para cada uno de los divs que elimine ese mismo elemento ---
const allCountryCards = document.querySelectorAll('.country-card')

allCountryCards.forEach((card) => {
  const deleteThisButton = document.createElement('button')
  deleteThisButton.textContent = 'Eliminar este'

  deleteThisButton.addEventListener('click', () => {
    card.remove()
  })
  card.appendChild(deleteThisButton)
})
