// 1.1 Usa querySelector para mostrar por consola el botón con la clase .showme
const button = document.querySelector('.showme')
console.log('1.1 Botón con clase .showme:', button)

// 1.2 Usa querySelector para mostrar por consola el h1 con el id #pillado
const h1Pillado = document.querySelector('#pillado')
console.log('1.2 H1 con id #pillado:', h1Pillado)

// 1.3 Usa querySelectorAll para mostrar por consola todos los p
const allParagraphs = document.querySelectorAll('p')
console.log('1.3 Todos los párrafos (p):', allParagraphs)

// 1.4 Usa querySelectorAll para mostrar por consola todos los elementos con la clase .pokemon
const allPokemon = document.querySelectorAll('.pokemon')
console.log('1.4 Todos los elementos con clase .pokemon:', allPokemon)

// 1.5 Usa querySelectorAll para mostrar por consola todos los elementos con el atributo data-function="testMe"
const allTestMe = document.querySelectorAll('[data-function="testMe"]')
console.log("1.5 Todos los elementos con data-function='testMe':", allTestMe)

// 1.6 Usa querySelector para mostrar por consola el 3er personaje con el atributo data-function="testMe".
const thirdCharacter = document.querySelectorAll('[data-function="testMe"]')[2]
console.log("1.6 Tercer personaje con data-function='testMe':", thirdCharacter)
