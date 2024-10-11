# Repaso Parcial 1

## C# un lenguaje compilado

### C# es un lenguaje compilado

Esto significa que el código fuente escrito en C# debe ser compilado antes de que pueda ser ejecutado.

La compilación de un programa C# se realiza en dos pasos:

1. **Compilación**: El compilador de C# traduce el código fuente en un archivo de código intermedio llamado **MSIL** (Microsoft Intermediate Language).
2. **Ejecución**: El **CLR** (Common Language Runtime) de .NET se encarga de traducir el código intermedio en código máquina que puede ser ejecutado por la computadora.

### C# es un lenguaje fuertemente tipado

Las variables deben ser declaradas con un tipo específico antes de ser utilizadas.

```csharp
int numero = 42;
string texto = "Hola, mundo!";
MiClase objeto = new MiClase();
```

### C# es un lenguaje orientado a objetos

C# es un lenguaje de programación orientado a objetos, lo que significa que todo en C# es un objeto. Los objetos son instancias de clases, que son plantillas para crear objetos.

Al interactuar con objetos, se utilizan propiedades, métodos y eventos. Un objeto que utilizamos frecuentemente es la consola, que tiene métodos como `WriteLine` y `ReadLine`.

```csharp
class MiClase {
    // Propiedades
    public int Numero { get; set; }
    public string Texto { get; set; }

    // Constructor
    public MiClase(int numero, string texto) {
        Numero = numero;
        Texto = texto;
    }

    // Método
    public void MostrarDatos() {
        Console.WriteLine($"Número: {Numero}, Texto: {Texto}");
    }

    // Método estático
    public static void MetodoEstatico() {
        Console.WriteLine("Método estático");
    }

    // Visibilidad privada solo para instancias de la clase
    private void MetodoPrivado() {
        Console.WriteLine("Método privado");
    }
}
```

### Tipos de datos en C#

C# tiene varios tipos de datos predefinidos, como `int`, `string`, `float`, `double`, `bool`, etc.

```csharp
int numero = 42;
string texto = "Hola, mundo!";
float flotante = 3.14f;
double doble = 3.14159;
bool booleano = true;
```

Cuando creamos nuestras propias clases, las instancias de esas clases también son tipos de datos.

```csharp
MiClase objeto = new MiClase();
```

## Estructuras de control: if, else, switch

### `if`

La instrucción `if` permite ejecutar un bloque de código si una condición es verdadera.

```csharp
if (condicion) {
    // Bloque de código
}
```

### `else`

La instrucción `else` permite ejecutar un bloque de código si la condición de un `if` es falsa.

```csharp
if (condicion) {
    // Bloque de código
} else {
    // Bloque de código
}
```

### `else if`

La instrucción `else if` permite evaluar múltiples condiciones.

```csharp

if (condicion1) {
    // Bloque de código
} else if (condicion2) {
    // Bloque de código
} else {
    // Bloque de código
}
```

### `switch`

La instrucción `switch` permite evaluar una expresión y ejecutar diferentes bloques de código según el valor de la expresión.

```csharp
switch (expresion) {
    case valor1:
        // Bloque de código
        break;
    case valor2:
        // Bloque de código
        break;
    default:
        // Bloque de código
        break;
}
```

### Operadores logicos

Los operadores lógicos se utilizan para combinar expresiones booleanas.

```csharp
bool a = true;
bool b = false;

// AND

if (a && b) {
    // Se ejecuta SOLO SI `a` Y `b` son verdaderos
}

// OR

if (a || b) {
    // Se ejecuta SI `a` O `b` son verdaderos
}

// NOT

if (!a) {
    // Invirtiendo el valor de `a`. Solo se ejecuta si `a` es falso
}
```

## Estructuras de control: while, do-while, for

### `while`

La instrucción `while` ejecuta un bloque de código mientras una condición sea verdadera.

```csharp
while (condicion) {
    // Se ejecuta mientras la condición sea verdadera
}
```

### `do-while`

La instrucción `do-while` ejecuta un bloque de código al menos una vez, y luego repite el bloque mientras una condición sea verdadera.

```csharp
do {
    // Se ejecuta al menos una vez
} while (condicion);
```

### `for`

La instrucción `for` ejecuta un bloque de código un número específico de veces.

```csharp
for (inicialización; condición; iteración) {
    // inicialización: se ejecuta una vez al inicio
    // condición: se evalúa antes de cada iteración
    // iteración: se ejecuta al final de cada iteración

    // Se ejecuta mientras la condición sea verdadera
}
```

## Estructuras de control: foreach

La instrucción `foreach` se utiliza para recorrer colecciones de elementos, como arrays o listas.

```csharp
foreach (tipo elemento in coleccion) {
  // Se ejecuta una vez por cada elemento en la colección
  // `elemento` es una variable que contiene el valor del elemento actual
}
```

## Array y Listas

### Array

Un array es una colección de elementos del mismo tipo, que se almacenan en posiciones contiguas de memoria. Los arrays tienen un tamaño fijo que se especifica al crearlos.

```csharp
int[] numeros = new int[5];
// int[] es el tipo de datos. int es el tipo de elementos y [] indica que es un array
string[] nombres = { "Alice", "Bob", "Charlie" };
// Inicialización de un array con valores iniciales en vez de tamaño
bool[] booleanos = new bool[3] { true, false, true };
// Inicialización de un array con tamaño y valores iniciales
```

Los métodos de arrays incluyen `Sort`, `BinarySearch`, `Find`, `FindAll`, `Exists`, `Contains`, entre otros.

### Listas

Las listas son colecciones dinámicas de elementos del mismo tipo que pueden cambiar de tamaño. Las listas son más flexibles que los arrays, ya que no tienen un tamaño fijo.

```csharp
List<int> numeros = new List<int>();
// List define que sera una lista. <int> indica que tipo de elementos tendra
// para inicializar se usa el tipo y `()`, en este caso `new List<int>()`
```

Los métodos de listas incluyen `Add`, `Remove`, `Clear`, `Sort`, `Find`, `FindAll`, `Exists`, `Contains`, entre otros.

## Métodos

La programación orientada a objetos se basa en la creación de clases y objetos. Los métodos son funciones que se definen dentro de una clase y se utilizan para realizar operaciones con los objetos de esa clase.

La firma de un método incluye su visibilidad, el tipo de dato de retorno, el nombre del método y los parámetros que recibe.

```csharp
public int Sumar(int a, int b) {
    return a + b;
}
// public: visibilidad del método
// int: tipo de dato de retorno
// Sumar: nombre del método
// (int a, int b): parámetros que recibe
//     int: tipo de dato del parámetro
//     a: nombre del parámetro
```

### Visibilidad

Los métodos pueden tener diferentes niveles de visibilidad:

- `public`: Puede ser accedido desde cualquier parte del programa.
- `private`: Solo puede ser accedido desde dentro de la clase.
- `protected`: Puede ser accedido desde la clase y sus subclases.
- `internal`: Puede ser accedido desde el mismo ensamblado.
- `protected internal`: Puede ser accedido desde la clase, sus subclases y el mismo ensamblado.

```csharp
class MiClase {
    public void MetodoPublico() {
        // Código
    }

    private void MetodoPrivado() {
        // Código
    }

    protected void MetodoProtegido() {
        // Código
    }

    internal void MetodoInterno() {
        // Código
    }

    protected internal void MetodoProtegidoInterno() {
        // Código
    }
}
```

### Tipo de retorno

Los métodos pueden devolver un valor de un tipo específico, o pueden ser de tipo `void` si no devuelven ningún valor. Clases creadas por el desarrollador también pueden ser tipos de retorno.

```csharp
public int Sumar(int a, int b) {
    return a + b;
}

public void MostrarMensaje() {
    Console.WriteLine("Hola, mundo!");
}
```

### Parámetros

Los métodos pueden recibir cero o más parámetros. Los parámetros se definen con un tipo de dato y un nombre. Los parámetros pueden ser opcionales si se les asigna un valor por defecto.

```csharp
public void Saludar(string nombre) {
    Console.WriteLine($"¡Hola, {nombre}!");
}

public void Saludar(string nombre = "mundo") {
    Console.WriteLine($"¡Hola, {nombre}!");
}
```

## Relaciones entre clases

### Agregación

La agregación es una relación entre dos clases donde una clase es parte de otra clase. La clase que contiene a la otra clase se llama clase contenedora, y la clase contenida se llama clase contenida.

```csharp
class Dado {
  private static int UltimoId = 0;
  public int IdDado { get; set; }
  public int Caras { get; set; }

  public Dado(int caras) {
      this.IdDado = Dado.NuevoId();
      this.Caras = caras;
  }

  public int Lanzar() {
      Random rnd = new Random();
      return rnd.Next(1, Caras + 1);
  }

  private static int NuevoId() {
      return UltimoId++;
  }
}

class LanzadorDeDados {
    public List<Dado> Dados { get; set; }

    public LanzadorDeDados() {
        this.Dados = new List<Dado>();
    }

    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }
}
```

#### Aspectos clave de la agregación

1. La clase contenida puede existir por sí sola. En el ejemplo, la clase `Dado` puede existir sin la clase `LanzadorDeDados`. Esto es evidente debido a que la clase LanzadorDeDados no crea instancias de Dado, las recibe como parámetro.
2. La clase contenida puede ser parte de más de una clase contenedora. En el ejemplo, un Dado puede ser parte de varios LanzadorDeDados.
3. Otro indicio, aunque opcional, es que la clase contenida, `Dado`, tiene un `IdDado` que es único para cada instancia de `Dado`.

### Composición

La composición es una relación más fuerte que la agregación. En la composición, la clase contenida es parte de la clase contenedora y no puede existir sin ella.

```csharp
class Dado {
    public int Caras { get; set; }

    public Dado(int caras) {
        Caras = caras;
    }

    public int Lanzar() {
        Random rnd = new Random();
        return rnd.Next(1, Caras + 1);
    }
}

class LanzadorDeDados {
    private List<Dado> Dados;

    public LanzadorDeDados() {
        this.Dados = new List<Dado>();
    }

    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }

    public void AgregarDado(int caras) {
        Dados.Add(new Dado(caras));
    }
}
```

#### Aspectos clave de la composición

1. La clase contenida no puede existir sin la clase contenedora. En el ejemplo, un Dado no tiene sentido sin un LanzadorDeDados. Esto es evidente porque la clase LanzadorDeDados controla la creación, búsqueda y eliminación de Dados.
2. La clase contenida solo puede ser parte de una clase contenedora. En el ejemplo, un Dado solo puede ser parte de un LanzadorDeDados, ya que el LanzadorDeDados es responsable, o controla la vida de los Dados.
3. Otro indicio es que la clase LanzadorDeDados tiene un método `AgregarDado` que crea instancias de Dado, en vez de recibirla como parámetro. `this.Dados.Add(new Dado(caras))`.

## Menú de opciones en consola

Es común que los programas de consola tengan un menú de opciones que permita al usuario elegir entre diferentes funcionalidades. Esto se puede implementar con un bucle `while` y un `switch` o una serie de `if-else`.

```csharp
class Program {
    static void Main(string[] args) {
        int opcion = 0;
        while (opcion != 4) {
            Console.WriteLine("Menú de opciones");
            Console.WriteLine("1. Opción 1");
            Console.WriteLine("2. Opción 2");
            Console.WriteLine("3. Opción 3");
            Console.WriteLine("4. Salir");
            Console.Write("Seleccione una opción: ");
            opcion = int.Parse(Console.ReadLine());

            switch (opcion) {
                case 1:
                    Console.WriteLine("Ha seleccionado la opción 1");
                    break;
                case 2:
                    Console.WriteLine("Ha seleccionado la opción 2");
                    break;
                case 3:
                    Console.WriteLine("Ha seleccionado la opción 3");
                    break;
                case 4:
                    Console.WriteLine("Saliendo...");
                    break;
                default:
                    Console.WriteLine("Opción inválida");
                    break;
            }
        }
    }
}
```

## Preguntas de ensayo del parcial

1. ¿Qué es la compilación en C#?
  a. Traduce el código fuente en un archivo de código intermedio.
  b. Traduce el código intermedio en código máquina.
  c. Traduce el código fuente en código máquina.
  d. Todas las anteriores.

2. ¿C# es un lenguaje debilmente tipado?
  a. Si, porque las variables no tienen un tipo específico.
  b. Si, porque las instancias de clases no tienen un tipo específico.
  c. No, porque las variables deben ser declaradas con un tipo específico.
  d. No, porque el metodo Main no tiene un tipo de retorno.

3. ¿Qué implica que un método sea privado?
  a. Puede ser accedido desde cualquier parte del programa.
  b. Solo puede ser accedido desde dentro de la clase.
  c. Puede ser accedido desde la clase y sus subclases.
  d. Puede ser accedido desde el mismo ensamblado.

4. Dado el siguiente codigo, ¿cuál es el valor de `resultado`?
  a. 5
  b. 10
  c. 15
  d. 20

```csharp
int resultado = 0;
for (int i = 0; i < 5; i++) {
    resultado += i;
}
```

5. ¿Qué es la agregación en C#?
  a. Una relación más fuerte que la composición.
  b. Una relación entre dos clases donde una clase es parte de otra clase.
  c. Una relación entre dos clases donde una clase no puede existir sin la otra.
  d. Una relación entre dos clases donde una clase puede ser parte de más de una clase contenedora.
  e. Todas las anteriores.
