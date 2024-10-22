<!-- Herencia y Polimorfismo en C# -->

# Herencia y Polimorfismo en C#

---

## ¿Qué es la Herencia?

- La **herencia** es un mecanismo de la programación orientada a objetos que permite que una clase derive de otra.
- Permite que una clase hija herede propiedades y métodos de una clase padre.

---

## Sintaxis de Herencia en C#

- La herencia se implementa usando el símbolo `:` en C#.
- La clase hija hereda todos los miembros de la clase base, excepto los constructores.

```csharp
// Clase base
class Animal {
    public string Nombre { get; set; }

    public void Comer() {
        Console.WriteLine($"{Nombre} está comiendo.");
    }
}

// Clase derivada
class Perro : Animal {
    public void Ladrar() {
        Console.WriteLine($"{Nombre} está ladrando.");
    }
}
```

---

## Ejemplo de Herencia en C#

```csharp
class Program {
    static void Main(string[] args) {
        Perro miPerro = new Perro();
        miPerro.Nombre = "Rex";
        miPerro.Comer(); // Heredado de la clase Animal
        miPerro.Ladrar(); // Método propio de Perro
    }
}
```

---

## Conceptos clave de la Herencia

- **Clase Base**: La clase de la que otras clases heredan.
- **Clase Derivada**: La clase que hereda de otra clase.
- La clase derivada puede agregar nuevos miembros o sobrescribir los miembros heredados.

---

## ¿Qué es el Polimorfismo?

- El polimorfismo permite tratar objetos de clases derivadas como si fueran instancias de su clase base.
- Existen dos tipos principales: **Polimorfismo en tiempo de compilación** (sobrecarga) y **Polimorfismo en tiempo de ejecución** (sobreescritura).

---

## Sobrecarga de Métodos (Polimorfismo en Tiempo de Compilación)

- Un método puede tener varias firmas dentro de la misma clase, permitiendo diferentes números o tipos de parámetros.

```csharp
class Calculadora {
    public int Sumar(int a, int b) {
        return a + b;
    }

    public double Sumar(double a, double b) {
        return a + b;
    }
}
```

```csharp
// Ejemplo de sobrecarga
class Program {
    static void Main(string[] args) {
        Calculadora calc = new Calculadora();
        Console.WriteLine(calc.Sumar(2, 3)); // Llama al método con enteros
        Console.WriteLine(calc.Sumar(2.5, 3.5)); // Llama al método con doubles
    }
}
```

---

## Sobreescritura de Métodos (Polimorfismo en Tiempo de Ejecución)

- Las clases derivadas pueden **sobrescribir** métodos de la clase base utilizando la palabra clave `override`.

```csharp
// Clase base
class Animal {
    public virtual void HacerSonido() {
        Console.WriteLine("El animal hace un sonido.");
    }
}

// Clase derivada
class Perro : Animal {
    public override void HacerSonido() {
        Console.WriteLine("El perro ladra.");
    }
}
```

---

## Ejemplo de Polimorfismo en Tiempo de Ejecución

```csharp
class Program {
    static void Main(string[] args) {
        Animal miAnimal = new Animal();
        Perro miPerro = new Perro();

        miAnimal.HacerSonido(); // Salida: El animal hace un sonido.
        miPerro.HacerSonido();  // Salida: El perro ladra.

        // Polimorfismo
        Animal otroPerro = new Perro();
        otroPerro.HacerSonido(); // Salida: El perro ladra.
    }
}
```

---

## Clases Abstractas y Polimorfismo

- Una **clase abstracta** es una clase que no puede instanciarse directamente y está destinada a ser una clase base.
- Puede contener métodos abstractos, que deben ser implementados por las clases derivadas.

```csharp
// Clase abstracta
abstract class Figura {
    public abstract double CalcularArea();
}

// Clase derivada
class Circulo : Figura {
    public double Radio { get; set; }

    public override double CalcularArea() {
        return Math.PI * Radio * Radio;
    }
}
```

---

## Ejemplo de Clases Abstractas y Polimorfismo

```csharp
class Program {
    static void Main(string[] args) {
        Figura miCirculo = new Circulo { Radio = 5 };
        Console.WriteLine($"Área del círculo: {miCirculo.CalcularArea()}");
    }
}
```

---

<!-- Uso de la palabra clave "base" en C# -->

# Uso de la palabra clave `base` en C#

---

## ¿Qué es `base` en C#?

- En C#, la palabra clave **`base`** se utiliza para referirse a la clase base (padre) desde una clase derivada (hija).
- Nos permite invocar métodos o constructores de la clase base.
- Es útil cuando se necesita extender o modificar el comportamiento de la clase base.

---

## Sintaxis de `base` en C#

- Para invocar un método de la clase base desde una clase derivada:

```csharp
base.MetodoDeLaClaseBase();
```

- Para invocar un constructor de la clase base:

```csharp
public ClaseDerivada() : base(argumentos) {
    // Código del constructor de la clase derivada
}
```

---

## Ejemplo: Llamar a un método de la clase base

```csharp
// Clase base
class Animal {
    public virtual void HacerSonido() {
        Console.WriteLine("El animal hace un sonido.");
    }
}

// Clase derivada
class Perro : Animal {
    public override void HacerSonido() {
        // Llamada al método de la clase base
        base.HacerSonido();
        // Comportamiento adicional en la clase derivada
        Console.WriteLine("El perro ladra.");
    }
}
```

---

## Ejemplo en un programa

```csharp
class Program {
    static void Main(string[] args) {
        Perro miPerro = new Perro();
        miPerro.HacerSonido();
        // Salida:
        // El animal hace un sonido.
        // El perro ladra.
    }
}
```

- En este ejemplo, el método `HacerSonido` de la clase base **Animal** es invocado usando `base.HacerSonido()`, y luego la clase derivada **Perro** agrega comportamiento adicional.

---

## Uso de `base` en Constructores

- También podemos usar `base` para invocar el constructor de la clase base.
- Esto es útil cuando queremos asegurarnos de que el constructor de la clase base inicialice propiedades o realice acciones antes de ejecutar el constructor de la clase derivada.

```csharp
// Clase base
class Animal {
    public string Nombre { get; set; }

    public Animal(string nombre) {
        Nombre = nombre;
    }
}

// Clase derivada
class Perro : Animal {
    public Perro(string nombre) : base(nombre) {
        Console.WriteLine($"El perro {Nombre} ha sido creado.");
    }
}
```

---

## Ejemplo en un programa

```csharp
class Program {
    static void Main(string[] args) {
        Perro miPerro = new Perro("Rex");
        // Salida:
        // El perro Rex ha sido creado.
    }
}
```

---

## Conclusión

- **Herencia** permite reutilizar código y extender funcionalidades.
- **Polimorfismo** nos permite usar clases derivadas como si fueran instancias de la clase base.
- Las clases abstractas y la sobreescritura de métodos son herramientas poderosas en POO.
- `base` es una palabra clave en C# utilizada para invocar miembros o constructores de la clase base.
- Nos permite reutilizar y extender el comportamiento de una clase padre sin duplicar código.
- Es esencial cuando trabajamos con **herencia** y **polimorfismo**.
