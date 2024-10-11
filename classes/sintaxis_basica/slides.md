# Programación 2  
## Clase 2: Sintaxis Básica de C#  
### Variables, Tipos, Estructuras de Control, Ciclos y Funciones  

---

## Objetivos de la Clase

- Revisar la sintaxis básica de C# en un proyecto de consola.
- Entender variables, tipos de datos y estructuras de control en C#.
- Aprender a definir y utilizar funciones en C#.
- Comparar funciones en C# con funciones en JavaScript.

---

## Parte 1: Proyecto de Consola en C#  

### Creación del Proyecto de Consola

1. Abrir **Visual Studio 2022**.
2. Seleccionar **Crear un nuevo proyecto**.
3. Elegir **Aplicación de consola (.NET Core)**.
4. Configurar el nombre como `CSharpBasics` y la ubicación del proyecto.
5. Hacer clic en **Crear**.

---

## Introducción a C#: Sintaxis Básica

### Variables y Tipos de Datos

En C#, las variables deben declararse con un tipo específico.

```csharp
int numero = 10;        // Entero
double precio = 19.99;  // Decimal
string nombre = "Juan"; // Cadena de texto
bool esActivo = true;   // Booleano
```

---

### Ejercicio: Declaración de Variables

- Declara una variable de cada tipo de dato mencionado y muestra sus valores usando `Console.WriteLine()`.

```csharp
using System;

class Program
{
    static void Main()
    {
        int numero = 10;
        double precio = 19.99;
        string nombre = "Juan";
        bool esActivo = true;

        Console.WriteLine("Número: " + numero);
        Console.WriteLine("Precio: " + precio);
        Console.WriteLine("Nombre: " + nombre);
        Console.WriteLine("Activo: " + esActivo);
    }
}
```

---

## Estructuras de Control en C#

### Condicionales

Utilizamos `if`, `else if` y `else` para el control de flujo.

```csharp
int edad = 18;
if (edad >= 18)
{
    Console.WriteLine("Eres mayor de edad.");
}
else
{
    Console.WriteLine("Eres menor de edad.");
}
```

---

### Ejercicio: Verificación de Edad

- Escribe un programa que verifique si una persona puede votar basado en su edad.

---

## Instrucciones de Ciclos en C#

### Bucle `for`

Se utiliza cuando se conoce el número de iteraciones.

```csharp
for (int i = 0; i < 5; i++)
{
    Console.WriteLine("Iteración " + i);
}
```

### Bucle `while`

Se utiliza cuando el número de iteraciones no es conocido.

```csharp
int contador = 0;
while (contador < 5)
{
    Console.WriteLine("Contador: " + contador);
    contador++;
}
```

### Ejercicio: Tablas de Multiplicar

- Escribe un programa que imprima la tabla de multiplicar de un número dado usando un bucle `for`.


## Lectura de Entrada del Teclado

### Usando `Console.ReadLine()`

- En C#, podemos leer la entrada del usuario desde la consola utilizando el método `Console.ReadLine()`.
- `Console.ReadLine()` devuelve una cadena (`string`) con el texto que el usuario ingresa.

### Ejemplo: Leer y Mostrar el Nombre del Usuario

```csharp
using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Por favor, introduce tu nombre:");
        
        // Leer entrada del usuario
        string nombre = Console.ReadLine();
        
        // Mostrar el nombre ingresado
        Console.WriteLine("Hola, " + nombre + "!");
    }
}
```

- **Instrucción:** Pide al usuario que ingrese su nombre y luego muestra un saludo con el nombre ingresado.

---

## Ejercicio: Capturar y Utilizar Entrada del Usuario

### Descripción del Ejercicio

- Escribe un programa que solicite al usuario que ingrese su edad y luego determine si es mayor o menor de edad.

### Ejemplo: Determinar Mayoría de Edad

```csharp
using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("Introduce tu edad:");
        
        // Leer la edad ingresada por el usuario
        string inputEdad = Console.ReadLine();
        
        // Convertir la entrada de texto a un número entero
        int edad = Convert.ToInt32(inputEdad);
        
        // Evaluar si el usuario es mayor o menor de edad
        if (edad >= 18)
        {
            Console.WriteLine("Eres mayor de edad.");
        }
        else
        {
            Console.WriteLine("Eres menor de edad.");
        }
    }
}
```

### Explicación del Código

- **`Console.ReadLine()`** captura la entrada del usuario como una cadena.
- **`Convert.ToInt32()`** convierte la cadena a un número entero para poder realizar la comparación.
- El programa evalúa la edad ingresada y muestra un mensaje correspondiente.

### Tarea

- Modifica el programa para manejar entradas no válidas (por ejemplo, si el usuario ingresa un texto en lugar de un número).

---

## Parte 2: Funciones en C#

### ¿Qué es una Función?

- Una función es un bloque de código que realiza una tarea específica.
- Permite reutilizar código y dividir un programa en partes más manejables.

### Sintaxis Básica de una Función en C#

```csharp
<tipo_retorno> NombreFuncion(<tipo_parametro> parametro1, <tipo_parametro> parametro2)
{
    // Cuerpo de la función
    return valor;
}
```

### Ejemplo: Función Suma

```csharp
using System;

class Program
{
    static void Main()
    {
        int resultado = Sumar(5, 3);
        Console.WriteLine("Resultado: " + resultado);
    }

    static int Sumar(int a, int b)
    {
        return a + b;
    }
}
```

### Explicación

- `static`: Modificador que indica que la función pertenece a la clase en sí misma, no a una instancia de la clase.
- `int`: Tipo de retorno de la función.
- `Sumar`: Nombre de la función.
- `(int a, int b)`: Parámetros de entrada.

---

## Funciones en C# vs JavaScript

### Declaración de Funciones

- **C#**: Las funciones deben estar declaradas dentro de una clase. Utilizan un tipo de retorno explícito y pueden tener parámetros con tipos explícitos.

```csharp
static int Multiplicar(int x, int y)
{
    return x * y;
}
```

- **JavaScript**: Las funciones son más flexibles; no requieren estar dentro de una clase y no utilizan un tipo de retorno explícito. Los parámetros no tienen un tipo explícito.

```csharp
function multiplicar(x, y) {
    return x * y;
}
```

### Diferencias Clave

- **Tipado**: C# es un lenguaje fuertemente tipado; JavaScript es débilmente tipado.
- **Ámbito**: Las funciones en C# son miembros de clases, mientras que en JavaScript pueden existir fuera de cualquier clase.
- **Sobrecarga**: C# permite la sobrecarga de funciones (mismo nombre con diferentes parámetros), mientras que JavaScript no soporta sobrecarga de forma nativa.

---

## Ejemplo Avanzado: Sobrecarga de Funciones en C#

### ¿Qué es la Sobrecarga de Funciones?

- Permite crear múltiples funciones con el mismo nombre pero diferentes parámetros.

```csharp
using System;

class Program
{
    static void Main()
    {
        Console.WriteLine(Sumar(5, 3)); // Llama a la función con dos parámetros enteros
        Console.WriteLine(Sumar(5.5, 3.3)); // Llama a la función con dos parámetros double
    }

    static int Sumar(int a, int b)
    {
        return a + b;
    }

    static double Sumar(double a, double b)
    {
        return a + b;
    }
}
```

### Explicación

- Dos funciones `Sumar` diferentes: una acepta `int`, la otra `double`.
- C# determina cuál función llamar basándose en los tipos de los argumentos proporcionados.

---

## Ejercicio: Crear Funciones Personalizadas

1. Crea una función que calcule el área de un rectángulo y otra para el área de un círculo.
2. Añade sobrecarga para manejar diferentes tipos de datos.

```csharp
static double CalcularArea(double radio)
{
    return Math.PI * radio * radio;
}

static double CalcularArea(double largo, double ancho)
{
    return largo * ancho;
}
```

### Ejercicio de Comparación

- Escribe las mismas funciones en JavaScript y discute las diferencias en tipado y sintaxis.

---

## Arrays

Un array es una colección de elementos del mismo tipo, y su tamaño se define cuando se crea.

---

### Declaración e Inicialización

```csharp
using System;

class Program
{
    static void Main()
    {
        // Declarar e inicializar un array de enteros
        int[] numeros = new int[5]; // Un array de 5 enteros

        // Asignar valores a cada elemento del array
        numeros[0] = 1;
        numeros[1] = 2;
        numeros[2] = 3;
        numeros[3] = 4;
        numeros[4] = 5;

        // Mostrar los elementos del array
        foreach (int numero in numeros)
        {
            Console.WriteLine(numero);
        }

        // Declarar e inicializar un array con valores
        string[] frutas = { "Manzana", "Banana", "Cereza" };

        // Mostrar los elementos del array
        foreach (string fruta in frutas)
        {
            Console.WriteLine(fruta);
        }
    }
}
```

---

## Agregar Elementos a una Lista

Para agregar elementos a una lista en C#, puedes usar el método `Add()` para añadir un elemento al final de la lista o `Insert()` para añadir un elemento en una posición específica.

```csharp
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Crear una lista de enteros
        List<int> numeros = new List<int>();

        // Agregar elementos al final de la lista
        numeros.Add(1);
        numeros.Add(2);
        numeros.Add(3);

        // Agregar un elemento en una posición específica
        numeros.Insert(1, 4); // Inserta 4 en el índice 1

        // Mostrar los elementos de la lista
        Console.WriteLine("Elementos en la lista:");
        foreach (int numero in numeros)
        {
            Console.WriteLine(numero);
        }
    }
}
```

---

## Eliminar Elementos de una Lista

Para eliminar elementos de una lista, puedes usar el método `Remove()` para eliminar la primera ocurrencia de un valor específico o `RemoveAt()` para eliminar un elemento en un índice específico.

```csharp
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Crear e inicializar una lista de enteros
        List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };

        // Eliminar la primera ocurrencia del valor 3
        numeros.Remove(3);

        // Eliminar el elemento en el índice 1
        numeros.RemoveAt(1);

        // Mostrar los elementos restantes
        Console.WriteLine("Elementos después de eliminar:");
        foreach (int numero in numeros)
        {
            Console.WriteLine(numero);
        }
    }
}
```

---

## Buscar un Elemento en una Lista

Para buscar un elemento en una lista, puedes usar el método `Contains()` para verificar si un elemento está en la lista o `IndexOf()` para obtener el índice de la primera ocurrencia de un elemento específico.

```csharp
using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        // Crear e inicializar una lista de cadenas
        List<string> frutas = new List<string> { "Manzana", "Banana", "Cereza" };

        // Verificar si la lista contiene el elemento "Banana"
        bool contieneBanana = frutas.Contains("Banana");
        Console.WriteLine($"¿La lista contiene 'Banana'? {contieneBanana}");

        // Obtener el índice del elemento "Cereza"
        int indiceCereza = frutas.IndexOf("Cereza");
        if (indiceCereza >= 0)
        {
            Console.WriteLine($"Índice de 'Cereza': {indiceCereza}");
        }
        else
        {
            Console.WriteLine("'Cereza' no se encuentra en la lista.");
        }
    }
}
```

---

## Resumen

- **Agregar Elementos**:
  - `Add()`: Agrega un elemento al final de la lista.
  - `Insert()`: Agrega un elemento en una posición específica.

- **Eliminar Elementos**:
  - `Remove()`: Elimina la primera ocurrencia de un valor específico.
  - `RemoveAt()`: Elimina un elemento en un índice específico.

- **Buscar Elementos**:
  - `Contains()`: Verifica si un elemento está en la lista.
  - `IndexOf()`: Obtiene el índice de la primera ocurrencia de un elemento específico.

---

## Resumen de la Clase

- Revisamos la sintaxis básica de C# y cómo declarar variables y tipos de datos.
- Exploramos estructuras de control como condicionales y bucles.
- Aprendimos a definir y usar funciones en C# y cómo difieren de JavaScript.
- Practicamos la sobrecarga de funciones y discutimos su uso en C#.

---

## Próxima Clase

### Profundización en Programación Orientada a Objetos

- Introducción a Clases y Objetos.
- Encapsulación y Modificadores de Acceso.
- Propiedades y Métodos.

### ¡Gracias por su atención!
