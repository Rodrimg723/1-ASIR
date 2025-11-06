from os import system

if system("clear") != 0: system("cls")

nombre = input("¿Cuál es tu nombre?\n")
print(nombre)
print(type(nombre))

edad = input("¿Cuál es tu edad?\n")
print(int(edad +5))