# Definir el número final
numero_final = 100

# Crear y abrir el archivo con el nombre especificado
with open("TM dadas.txt", "w") as file:
    # Escribir los números en el formato "MT-X" en el archivo
    for x in range(1, numero_final + 1):
        file.write(f"MT-{x} = \n")  # Escribir cada "MT-X" en una nueva línea

print("El archivo 'MT DADAS.mtx' ha sido creado correctamente.")
