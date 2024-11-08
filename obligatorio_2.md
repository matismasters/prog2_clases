# Fórmula 1

## Obligatorio 2. Prog 2. Matutino 2024.

### Introducción

El objetivo de este obligatorio es desarrollar una aplicación web **MVC en C#** para la gestión de una competencia de **Fórmula 1**. El proyecto permitirá a los estudiantes aplicar los principios de la **Programación Orientada a Objetos (POO)** en un entorno **MVC** y aprender a utilizar **Entity Framework** para gestionar la base de datos.

La aplicación se basará en la administración de pilotos, escuderías, y carreras, permitiendo generar una tabla de resultados y estadísticas a partir de los datos de cada carrera de la temporada.

### Contexto del Proyecto

En esta competencia de Fórmula 1:

- **Escuderías**: De las escuderías sabemos su Nombre, Sponsor Oficial, País de Origen, y pilotos. No puede haber más de dos pilotos por escudería.
- **Pilotos**: De los pilotos sabemos su Nombre, Fecha de Nacimiento, País de Origen y Escudería a la que pertenecen. No puede haber mas de 20 pilotos.
- **Carreras**: De las carreras sabemos el Nombre, la Ciudad en la que está ubicada la pista, la Fecha, en que posición comienza cada piloto, y en que posición terminó cada piloto. Todas las carreras tienen exactamente 20 pilotos.
- **Puntaje**: Los puntos se calculan para cada carrera de acuerdo a la posición del piloto:

  - 1° lugar: 25 puntos
  - 2° lugar: 18 puntos
  - 3° lugar: 15 puntos
  - 4° lugar: 12 puntos
  - 5° lugar: 10 puntos
  - 6° lugar: 8 puntos
  - 7° lugar: 6 puntos
  - 8° lugar: 4 puntos
  - 9° lugar: 2 puntos
  - 10° lugar: 1 punto
  - 11° a 20° lugar: 0 puntos

No se considera la noción de temporadas; todas las carreras se consideran dentro de la misma temporada.

### Funcionalidad requerida

La aplicación debe ofrecer las siguientes funcionalidades:

- **[Requerida] Gestión de pilotos y escuderías**: Permitir a los usuarios realizar altas, bajas y modificaciones de pilotos y escuderías.
- **[Requerida] Registro de carreras y resultados**: Permitir registrar una carrera con la posición de los pilotos al comenzar y al finalizar la misma.

### Estadísticas solicitadas

Implementar las siguientes estadísticas:

- **[Requerida] Tabla de posiciones de pilotos**: Mostrar la lista de pilotos ordenados por puntos acumulados en todas las carreras.
- **[Opcional] Historial de carreras de un piloto**: Mostrar la posición y puntaje de un piloto específico en todas las carreras en las que ha participado.
- **[Requerida] Tabla de posiciones de escuderías**: Mostrar la lista de escuderías con el total de puntos sumando los puntos de ambos pilotos.
- **[Opcional] Historial de carreras de una escudería**: Mostrar la posición y puntaje de cada piloto de una escudería específica en todas las carreras en las que han participado.
- **[Opcional] Carreras ganadas**: Mostrar los pilotos con mayor cantidad de primeros lugares en las carreras.

### Restricciones

- **Máximo de pilotos por escudería**: Cada escudería puede tener un máximo de dos pilotos.
- **Registro de posiciones**: Cada piloto debe tener una posición única en cada carrera (no pueden haber empates).
- **Validez de las posiciones**: Los puntos se otorgan según la tabla antes mencionada.

### Ingeniería del Software

La solución debe estar estructurada aplicando principios de ingeniería de software:

- **POO y UML**: Aplicar los principios de la programación orientada a objetos y utilizar UML para representar el diseño.
- **Capas**: El proyecto debe seguir el patron MVC, separando la lógica de negocio de la interfaz de usuario.
- **Principios POO**: Aplicar herencia, encapsulamiento, y polimorfismo si es necesario.
- **Patrones de diseño**: Implementar Modelos, Vistas y Controladores para estructurar la aplicación.

### Documentación requerida

El proyecto debe entregarse acompañado de la siguiente documentación:

- Carátula y tabla de contenido.
- Declaración de autoría.
- Abstract del proyecto.
- Cronograma de trabajo.
- Pseudocódigo de los algoritmos clave.
- Diagrama de la capa de dominio(modelos y controladoras con detalle de propiedades y métodos).
- Diagrama de las tres capas (modelos, controladoras, y vistas, sin detalle).
- Resultados de las pruebas realizadas (testing).

### Entregas

- **Lectura**: 08/11/2024 Entrega de la consigna y comienzo del proyecto.
- **Control 1**: 15/11/2024 Diagrama de Dominio con modelos, sus atributos y relaciones.
- **Control 2**: 22/11/2024 ABM (Altas, Bajas y Modificaciones) de Pilotos y Escuderías.
- **Control 3**: 29/11/2024 ABM (Altas, Bajas y Modificaciones) de Carreras.
- **Entrega final**: 05/12/2024 Proyecto completo, funcional y documentado.
- **Juego de datos de prueba**: Deberá crearse una clase que cargue datos de prueba al comenzar la aplicación.
- **Medio de entrega**: Repositorio de Github público con el código del proyecto y los archivos de la documentación. No se aceptarán modificaciones luego de la fecha de entrega.

### Contacto

**Profesor**: Matías Verges  
**Consultas**: Whatsapp o mverges@ctc.edu.uy
