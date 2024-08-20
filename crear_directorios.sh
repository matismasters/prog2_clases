#! /bin/bash

# Creamos un diccionario de posibles nombres de directorios
declare -a directorios=("documentos" "imagenes" "videos" "musica" "descargas" "programas" "juegos" "trabajo" "personal" "fotos" "videos" "trabajo" "proyectos")

# Creamos un segundo diccionario de posibles nombres de directorios para combinarlos luego
declare -a directorios2=("abogados" "arquitectura" "arte" "biologia" "ciencia" "comunicacion" "contabilidad" "derecho" "diseño" "economia" "educacion" "enfermeria" "filosofia" "fisica" "geografia" "historia" "informatica" "ingenieria" "literatura" "matematicas" "medicina" "musica" "periodismo" "psicologia" "quimica" "sociologia" "teologia" "turismo")

# Creamos una funcion para crear un numero X de archivos en un directorio
# El contenido de estos archivos sera lorem ipsum

# Creamos una buqule que genera nombres de directorios aleatorios mezclando los dos diccionarios
# genera tantos nombres como el parametro que le pasemos en -n

# guardamos el parametro que le pasamos en -n o 10 si no se le pasa ninguno
n=${1:-10}

for i in $(seq 1 $n); do
  # Elegimos un nombre de directorio aleatorio del primer diccionario
  directorio=${directorios[$RANDOM % ${#directorios[@]}]}

  # Decidimos si va a tener subdirectorios usando un numero aleatorio
  if [ $((RANDOM % 2)) -eq 0 ]; then
    # Elegimos un nombre de directorio aleatorio del segundo diccionario
    directorio2=${directorios2[$RANDOM % ${#directorios2[@]}]}
    # Creamos el directorio con el nombre del primer diccionario y dentro de el otro con el nombre del segundo diccionario
    mkdir -p "$directorio/$directorio2"

    # Decidimos si va a tener subdirectorios usando un numero aleatorio
    if [ $((RANDOM % 2)) -eq 0 ]; then
      # Elegimos un nombre de directorio aleatorio del primer diccionario
      directorio3=${directorios[$RANDOM % ${#directorios[@]}]}
      # Creamos el directorio con el nombre del primer diccionario y dentro de el otro con el nombre del segundo diccionario
      mkdir -p "$directorio/$directorio2/$directorio3"
    fi
  else
    # Creamos el directorio con el nombre del primer diccionario
    mkdir -p "$directorio"

    if [ $((RANDOM % 2)) -eq 0 ]; then
      # Elegimos un nombre de directorio aleatorio del segundo diccionario
      directorio2=${directorios2[$RANDOM % ${#directorios2[@]}]}
      # Creamos el directorio con el nombre del primer diccionario y dentro de el otro con el nombre del segundo diccionario
      mkdir -p "$directorio/$directorio2"
    fi
  fi
done
