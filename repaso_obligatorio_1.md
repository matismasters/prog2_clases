# Repaso Obligatorio 1

En este repaso en clase el profesor codificará una aplicación de consola en C# para la gestión de una liga de Formula 1. La aplicación permitirá registrar pilotos, escuderías, y carreras, y mostrar estadísticas relacionadas con los pilotos y las carreras.

## Objetivo

El objetivo de este repaso es aplicar los conceptos de programación orientada a objetos (POO) en C#, y practicar la implementación de clases, métodos, propiedades, y colecciones.

## Funcionalidad requerida

La aplicación debe ofrecer las siguientes funcionalidades:

### Etapa 1

- **Registro de pilotos**: Permitir registrar nuevos pilotos con su nombre, apellido, y país de origen.
- **Registro de escuderías**: Permitir registrar nuevas escuderías con su nombre y pais donde se encuentra su sede.
- **Asignar pilotos a escuderías**: Permitir asignar pilotos a escuderías.

### Etapa 2

- **Registro de carreras**: Permitir registrar nuevas carreras con la fecha, país, y circuito.
- **Asignar pilotos a carreras**: Permitir asignar pilotos a carreras.
  - Los pilotos no pueden estar duplicados en una misma carrera.
  - Cada carrera puede tener un máximo de 20 pilotos.
- **Listar carreras**: Mostrar un listado de las carreras registradas.
- **Listar carreras por fecha**: Mostrar un listado de carreras entre 2 fechas.

### Etapa 3

- **Registro de posición inicial de los pilotos**: Permitir registrar la posición inicial de los pilotos en una carrera.
- **Registro de resultados**: Permitir registrar los resultados de una carrera, asignando puntos a los pilotos según su posición.

### Etapa 4

- **Listar puntajes de los pilotos**: Mostrar un listado de los pilotos con sus respectivos puntos actuales.
- **Listar puntajes de las escuderías**: Mostrar un listado de las escuderías con sus respectivos puntos actuales.

## Asignacion de puntos

La siguiente es la forma en que se asignan los puntos a los pilotos en una carrera:

- 1er lugar: 25 puntos
- 2do lugar: 18 puntos
- 3er lugar: 15 puntos
- 4to lugar: 12 puntos
- 5to lugar: 10 puntos
- 6to lugar: 8 puntos
- 7mo lugar: 6 puntos
- 8vo lugar: 4 puntos
- 9no lugar: 2 puntos
- 10mo lugar: 1 punto
- 11mo lugar en adelante: 0 puntos
