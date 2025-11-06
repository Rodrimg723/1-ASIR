from os import system

if system("clear") == 0: system("cls")

print("str:")
print(type("Hola soy una cadena de texto"))
print(type('Hola soy una cadena de texto con comillas simples'))

print("int:")
print(type(123))
print(type(1e3+4)) 

print("float:")
print(type(3.14))
print(type(1.0))

print("None:")
print(type(None))

print("complex:")
print(type(1+2j))


print("bool:")
print(type(True))
print(type(1 > 0))


