<!-- Diapositiva 1 -->

# Métodos más utilizados de Arrays y Lists

## Programación Orientada a Objetos en C#

---

<!-- Diapositiva 2 -->

## Introducción a Arrays y Lists

- **Arrays** son estructuras de datos de tamaño fijo que almacenan elementos del mismo tipo.
- **Listas** (`List<T>`) son colecciones dinámicas que pueden cambiar de tamaño.
- Ambas estructuras ofrecen métodos para ordenar, filtrar, y manipular sus elementos.

---

<!-- Diapositiva 3 -->

## Métodos de Arrays

### `Array.Sort()`

- Ordena los elementos de un array en orden ascendente.
- Sobrecargas permiten ordenar según criterios personalizados.

```csharp
int[] numbers = { 5, 1, 4, 2, 3 };
Array.Sort(numbers); // { 1, 2, 3, 4, 5 }
```

### `Array.BinarySearch()`

- Realiza una búsqueda binaria en un array ordenado y devuelve el índice del elemento.

```csharp
int index = Array.BinarySearch(numbers, 4); // Índice de 4
```

---

<!-- Diapositiva 4 -->

## Métodos de Arrays (cont.)

### `Array.Find()`

- Encuentra el primer elemento que cumple con una condición.

```csharp
int result = Array.Find(numbers, x => x > 3); // 5
```

### `Array.FindAll()`

- Encuentra todos los elementos que cumplen con una condición.

```csharp
int[] results = Array.FindAll(numbers, x => x > 2); // { 5, 4, 3 }
```

### `Array.Exists()`

- Verifica si algún elemento en el array cumple una condición.

```csharp
bool exists = Array.Exists(numbers, x => x == 4); // true
```

---

<!-- Diapositiva 5 -->

## Métodos de Arrays (cont.)

### `Array.Reverse()`

- Invierte el orden de los elementos.

```csharp
Array.Reverse(numbers); // { 3, 2, 4, 1, 5 }
```

### `Array.Clear()`

- Limpia los valores en el array, estableciéndolos en el valor predeterminado.

```csharp
Array.Clear(numbers, 0, numbers.Length); // Todos los valores en 0
```

---

<!-- Diapositiva 6 -->

## Métodos de List<T>

### `List<T>.Add()`

- Agrega un elemento al final de la lista.

```csharp
List<int> numbers = new List<int> { 1, 2, 3 };
numbers.Add(4); // { 1, 2, 3, 4 }
```

### `List<T>.Insert()`

- Inserta un elemento en la posición especificada.

```csharp
numbers.Insert(2, 6); // { 1, 2, 6, 3, 4 }
```

---

<!-- Diapositiva 7 -->

## Métodos de List<T> (cont.)

### `List<T>.Remove()`

- Elimina la primera ocurrencia de un elemento en la lista.

```csharp
numbers.Remove(2); // { 1, 6, 3, 4 }
```

### `List<T>.RemoveAt()`

- Elimina el elemento en una posición específica.

```csharp
numbers.RemoveAt(1); // { 1, 3, 4 }
```

---

<!-- Diapositiva 8 -->

## Más métodos de List<T>

### `List<T>.Find()`

- Encuentra el primer elemento que cumple con una condición.

```csharp
int found = numbers.Find(x => x > 2); // 3
```

### `List<T>.FindAll()`

- Encuentra todos los elementos que cumplen con una condición.

```csharp
List<int> results = numbers.FindAll(x => x > 2); // { 3, 4 }
```

---

<!-- Diapositiva 9 -->

## Métodos de List<T> (cont.)

### `List<T>.Sort()`

- Ordena los elementos de la lista en orden ascendente.

```csharp
numbers.Sort(); // { 1, 3, 4 }
```

### `List<T>.Contains()`

- Verifica si un elemento existe en la lista.

```csharp
bool contains = numbers.Contains(3); // true
```

---

<!-- Diapositiva 10 -->

## LINQ con Arrays y Listas

### `Where()`

- Filtra elementos basados en una condición.

```csharp
var result = numbers.Where(x => x > 2); // { 3, 4, 5 }
```

### `Select()`

- Proyecta cada elemento en una nueva forma.

```csharp
var squares = numbers.Select(x => x * x); // { 1, 9, 16 }
```

---

<!-- Diapositiva 11 -->

## LINQ con Arrays y Listas (cont.)

### `OrderBy()`

- Ordena los elementos de la colección según una clave.

```csharp
var sortedNumbers = numbers.OrderBy(x => x); // { 1, 3, 4, 5 }
```

### `First()` y `FirstOrDefault()`

- Devuelve el primer elemento de una colección o el valor predeterminado si no se encuentra ninguno.

```csharp
int first = numbers.First(); // 1
int defaultFirst = numbers.FirstOrDefault(x => x > 10); // 0
```

---

<!-- Diapositiva 12 -->

## Más métodos LINQ

### `Any()`

- Verifica si algún elemento en la colección cumple una condición.

```csharp
bool hasLargeNumber = numbers.Any(x => x > 4); // true
```

### `All()`

- Verifica si todos los elementos cumplen una condición.

```csharp
bool allPositive = numbers.All(x => x > 0); // true
```

### `Count()`

- Cuenta el número de elementos que cumplen una condición.

```csharp
int count = numbers.Count(x => x > 2); // 2
```

---

<!-- Diapositiva 13 -->

## Resumen

- **Arrays** y **Listas** proporcionan varios métodos útiles para manipular colecciones como `Sort()`, `Find()`, `Add()`, `Remove()`.
- **LINQ** ofrece potentes capacidades para realizar consultas como `Where()`, `Select()`, `OrderBy()`, y más.
- La combinación de LINQ y estructuras de colecciones hace que el manejo de datos en C# sea flexible y eficiente.

---
