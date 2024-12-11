# Gestión de Cooperativa Agropecuaria

## Obligatorio 3. Prog 2. Matutino 2024.

### Introducción

El objetivo de este obligatorio es desarrollar una aplicación web **MVC en C#** para la gestión de una cooperativa agropecuaria, enfocándose en **Agricultores** que se prestan la **Maquinaria** agrícola. El proyecto permitirá a los estudiantes aplicar principios de **Programación Orientada a Objetos (POO)** en un entorno **MVC** y aprender a utilizar **Entity Framework** para gestionar la base de datos.

La aplicación se centrará en la administración de **Agricultores**, **Maquinaria**, y en el registro de la utilización de la maquinaria por parte de los agricultores, lo cual permitirá generar estadísticas basadas en el uso y rendimiento.

### Contexto del Proyecto

En esta cooperativa:

- **Agricultores**: Son las personas responsables del uso y mantenimiento de la maquinaria. De cada agricultor se conoce su nombre, y el tamaño del campo en hectareas.

- **Maquinaria**: Representa los equipos utilizados en la granja (ej: Tractores, Cosechadoras, Arados). De cada máquina se conoce su Nombre, Tipo (ej: Tractor, Cosechadora, Sembradora) y su Costo Por Hora. Cada máquina pertenece a un único agricultor. 

- **Uso de Maquinaria**: Cada agricultor puede usar cualquier maquina, ya sea suya propia, o de otro agricultor.  Al utilizar una maquina, se registra que agricultor la utilizo, por cuanto tiempo, y se calcula el precio total de uso.

### Funcionalidad requerida

- **[Requerida] Gestión de Agricultores y Maquinaria**: Permitir a los usuarios realizar altas, bajas y modificaciones de agricultores y maquinaria.

- **[Requerida] Registro de Uso de Maquinaria**: Permitir registrar el uso (en horas) de una máquina por parte de un agricultor. 

### Estadísticas solicitadas

- **[Requerida] Listado de maquinaria ordenada por horas de uso total**: Sumar las horas de uso de cada máquina y mostrar una lista ordenada de mayor a menor, con el total de horas de uso de cada una.

- **[Opcional] Historial de uso de un agricultor**: Mostrar cuántas horas ha utilizado cada máquina un agricultor específico, a lo largo del tiempo.

- **[Requerida] Listado de agricultores ordenados por horas totales de uso de maquinaria**: Sumar las horas de uso de todas las máquinas para cada agricultor, y mostrar una lista ordenada.

- **[Opcional] Maquinaria más popular**: Mostrar qué máquinas han sido utilizadas por mayor cantidad de agricultores diferentes.

- **[Opcional] Agricultores más versátiles**: Mostrar qué agricultores han utilizado mayor variedad de máquinas.

### Ingeniería del Software

La solución debe estar estructurada aplicando principios de ingeniería de software:

- **POO y UML**: Aplicar los principios de la programación orientada a objetos y representar el diseño mediante UML.
- **Capas (MVC)**: Separar la lógica de negocio (Modelos), la lógica de presentación (Vistas) y el control del flujo (Controladores).
- **Principios POO**: Aplicar herencia, encapsulamiento y polimorfismo si es necesario.
- **Patrones de diseño**: Emplear Modelos, Vistas y Controladores (MVC) de forma coherente.

### Entregas

- **Entrega de letra**: 11/12/2024 Entrega de la consigna y comienzo del proyecto.
- **Control 1**: 22/12/2024 Enviar por mail repositorio de Github con el proyecto en progreso. Con el ABM de Agricultores y Maquinaria funcionando.
- **Control 2**: 15/01/2025 Enviar por mail repositorio de Github con el proyecto en progreso. Con las funcionalidades que permiten de registrar el uso de maquinaria funcionando.
- **Entrega final**: 01/02/2025 Proyecto completo, funcional y documentado.
- **Juego de datos de prueba**: Deberá crearse una clase que cargue datos de prueba al iniciar la aplicación.
- **Medio de entrega**: Repositorio de Github público con el código del proyecto y los archivos de la documentación. No se aceptarán modificaciones luego de la fecha de entrega.

### Contacto

**Profesor**: Matías Verges  
**Consultas**: Whatsapp o mverges@ctc.edu.uy
