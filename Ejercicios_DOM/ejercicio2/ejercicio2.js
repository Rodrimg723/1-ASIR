// 2.1 Inserta dinamicamente en un html un div vacio con javascript.
const emptyDiv = document.createElement('div')
document.body.appendChild(emptyDiv)

// 2.2 Inserta dinamicamente en un html un div que contenga una p con javascript.
const divWithP = document.createElement('div')
const pInsideDiv = document.createElement('p')
divWithP.appendChild(pInsideDiv)
document.body.appendChild(divWithP)

// 2.3 Inserta dinamicamente en un html un div que contenga 6 p utilizando un loop con javascript.
const divWithMultipleP = document.createElement('div')
for (let i = 0; i < 6; i++) {
  const loopP = document.createElement('p')
  divWithMultipleP.appendChild(loopP)
}
document.body.appendChild(divWithMultipleP)

// 2.4 Inserta dinamicamente con javascript en un html una p con el texto 'Soy dinámico!'.
const dynamicP = document.createElement('p')
dynamicP.textContent = 'Soy dinámico!'
document.body.appendChild(dynamicP)

// 2.5 Inserta en el h2 con la clase .fn-insert-here el texto 'Wubba Lubba dub dub'.
const h2Element = document.querySelector('h2.fn-insert-here')
h2Element.textContent = 'Wubba Lubba dub dub'

// 2.6 Basandote en el siguiente array crea una lista ul > li con los textos del array.
const apps = ['Facebook', 'Netflix', 'Instagram', 'Snapchat', 'Twitter']
const appList = document.createElement('ul')
apps.forEach((app) => {
  const listItem = document.createElement('li')
  listItem.textContent = app
  appList.appendChild(listItem)
})
document.body.appendChild(appList)

// 2.7 Elimina todos los nodos que tengan la clase .fn-remove-me
const elementsToRemove = document.querySelectorAll('.fn-remove-me')
elementsToRemove.forEach((element) => {
  element.remove()
})

// 2.8 Inserta una p con el texto 'Voy en medio!' entre los dos div.
const allDivs = document.querySelectorAll('div')
const pInBetween = document.createElement('p')
pInBetween.textContent = 'Voy en medio!'
document.body.insertBefore(pInBetween, allDivs[1])

// 2.9 Inserta p con el texto 'Voy dentro!', dentro de todos los div con la clase .fn-insert-here
const insertHereDivs = document.querySelectorAll('div.fn-insert-here')
insertHereDivs.forEach((div) => {
  const pInside = document.createElement('p')
  pInside.textContent = 'Voy dentro!'
  div.appendChild(pInside)
})
