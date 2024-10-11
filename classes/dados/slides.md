<!-- Breve historia de los juegos de azar -->

# Breve Historia de los Juegos de Azar

---

## Origen de los Juegos de Azar

- Los primeros juegos de azar datan de las antiguas civilizaciones.
- Los antiguos egipcios y chinos utilizaban elementos como huesos y piedras.
- Los romanos y griegos tenían juegos similares al moderno "cara o cruz".

---

## Evolución a lo largo del tiempo

- Durante la Edad Media, el azar se integró en varios juegos de mesa.
- En el siglo XVII, los casinos empezaron a surgir en Europa.
- En el siglo XX, las apuestas deportivas y juegos de casino online ganaron popularidad.

---

## Fun Facts

- El primer casino oficial fue el Casino de Venecia en 1638.
- La palabra "casino" proviene del italiano que significa "pequeña casa".
- En muchos lugares, los juegos de azar fueron prohibidos y considerados ilegales.

---

<!-- Breve historia del uso de los dados en los juegos de azar -->

# Historia del Uso de los Dados en los Juegos de Azar

---

## Origen de los Dados

- Los dados más antiguos fueron encontrados en Mesopotamia (3000 a.C.).
- Se utilizaban como herramientas de predicción y decisiones.
- En la antigua Roma, los soldados jugaban con dados en sus tiempos libres.

---

## Dados en la Edad Media y Renacimiento

- Los dados se popularizaron en Europa durante la Edad Media.
- Eran utilizados tanto en juegos de azar como en juegos de estrategia.
- El juego "Hazard" fue un precursor del moderno Craps.

---

## Fun Facts

- Los dados han sido encontrados en tumbas de faraones egipcios.
- En la cultura china, los dados simbolizan buena fortuna.
- El mayor valor que puede tener un dado en el moderno Craps es el número 7.

---

<!-- Ejercicio: Programa de un dado de 6 caras -->

# Ejercicio: Emulación de un Dado de 6 Caras

---

## Instrucciones

- Crear un programa en C# que emule un dado de 6 caras.
- Qué es lo mas importante a emular?

```csharp
Random rnd = new Random();
int dado = rnd.Next(1, 7);
Console.WriteLine("Resultado del dado: " + dado);
```

---

<!-- Ejercicio: Clase de un dado de X caras -->

# Ejercicio: Crear una Clase Dado de X Caras

---

## Instrucciones

- Crear una clase `Dado` que permita definir un dado de X caras.

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
```

---

<!-- Ejercicio: Lanzar X dados de X caras -->

# Ejercicio: Crear una Clase para Lanzar Múltiples Dados

---

---

<!-- Reglas del juego Ludo -->

# Reglas del Juego Ludo

---

## Objetivo del Juego

- Los jugadores avanzan sus fichas alrededor del tablero hasta llegar a la casilla final.
- El primer jugador en llevar todas sus fichas a la meta gana.

---

## Mecánica Básica

- Cada jugador tira un dado para mover su ficha.
- Los jugadores pueden enviar fichas de otros de vuelta al inicio si caen en la misma casilla.

---

<!-- Estrategias para programar Ludo -->

# Estrategias para Programar Ludo

---

## ¿Por dónde empezar?

1. **Definir las fichas y el tablero**.
2. **Implementar el dado y el movimiento de fichas**.
3. **Definir las reglas de captura y movimiento al inicio**.
4. **Incluir condiciones de victoria y fin del juego**.

---

## Siguientes pasos

- Agregar múltiples jugadores.
- Implementar reglas especiales como saltos y barreras.
- Crear una interfaz gráfica para visualizar el tablero y fichas.

---

<!-- Ejercicio: Crear el juego Ludo para varios jugadores -->

# Ejercicio: Crear el Juego Ludo para Varios Jugadores

---

## Instrucciones

- Crear una aplicación que permita a varios jugadores competir en el juego de Ludo.
- Debe permitir el lanzamiento de dados, mover fichas, y determinar el ganador.

---

```csharp
// Estructura básica
class Jugador {
    public string Nombre { get; set; }
    public Ficha[] Fichas { get; set; }
    public bool HaGanado() { /* Lógica */ }
}

// Lógica del tablero, turnos y movimientos.
```

---

<!-- Ejercicio: Crear versión con IA -->

# Ejercicio: Ludo Contra la IA

---

## Desafío

- Crear una clase `LanzadorDeDados` que permita lanzar X dados de X caras.
- El método debe devolver un array con los resultados de cada dado lanzado.

## Instrucciones

- Crear una clase `LanzadorDeDados` que permita lanzar X cantidad de dados con diferentes cantidades de caras a partir de una cadena en el formato `"2d10 6d6 XdY"`.
- El método debe devolver una lista con los resultados de cada dado lanzado, y cada resultado debe indicar el tipo de dado y su valor.

---

```csharp
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class LanzadorDeDados {
    // Método que lanza los dados según la cadena de entrada en formato "XdY"
    public List<List<string>> LanzarDados(string input) {
        List<List<string>> resultados = new List<List<string>>();
        Random rnd = new Random();

        // Usamos una expresión regular para extraer los valores de X y Y en "XdY"
        Regex regex = new Regex(@"(\d+)d(\d+)");
        MatchCollection matches = regex.Matches(input);

        foreach (Match match in matches) {
            int cantidad = int.Parse(match.Groups[1].Value);  // X: cantidad de dados
            int caras = int.Parse(match.Groups[2].Value);     // Y: caras del dado

            // Lanzar 'cantidad' de dados con 'caras' caras
            for (int i = 0; i < cantidad; i++) {
                int resultado = rnd.Next(1, caras + 1);  // Generar el resultado del dado
                resultados.Add(new List<string> { $"d{caras}-{i+1}", resultado.ToString() });
            }
        }

        return resultados;
    }
}
```

---

## Ejemplo de Uso

```csharp
class Program {
    static void Main(string[] args) {
        LanzadorDeDados lanzador = new LanzadorDeDados();

        // Definimos la cadena que especifica los dados a lanzar: 2 dados de 10 caras y 6 dados de 6 caras
        string dados = "2d10 6d6";

        // Lanzamos los dados y obtenemos los resultados
        List<List<string>> resultados = lanzador.LanzarDados(dados);

        // Imprimir los resultados
        foreach (var resultado in resultados) {
            Console.WriteLine($"{resultado[0]}: {resultado[1]}");
        }
    }
}
```

---

### Explicación del Código

1. **Clase `LanzadorDeDados`**:

   - El método `LanzarDados` recibe una cadena como `"2d10 6d6"`.
   - Usamos una expresión regular (`Regex`) para extraer las cantidades de dados (`X`) y el número de caras (`Y`) en cada lanzamiento especificado por la cadena.
   - Luego, generamos un número aleatorio para cada dado lanzado, y almacenamos el resultado en una lista de listas. Cada sublista contiene el identificador del dado (como `"d10-1"`, `"d6-3"`) y el resultado correspondiente.

2. **Uso**:
   - En el ejemplo de uso, se especifica que se deben lanzar 2 dados de 10 caras y 6 dados de 6 caras.
   - Los resultados se imprimen en el formato `dX-Y: Z`, donde `dX` es el tipo de dado, `Y` es el número del dado dentro de su grupo (por ejemplo, el primer dado de 10 caras sería `d10-1`), y `Z` es el resultado del lanzamiento.

---

## Ejemplo de Uso

```csharp
LanzadorDeDados lanzador = new LanzadorDeDados(6);
int[] resultados = lanzador.LanzarVariosDados(3);
foreach (var resultado in resultados) {
    Console.WriteLine("Resultado del dado: " + resultado);
}
```
