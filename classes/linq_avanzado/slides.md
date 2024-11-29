<!-- Uso de LINQ con Entity Framework en MVC -->
# Uso de LINQ con Entity Framework en MVC

---

## ¿Qué es LINQ?

- **LINQ (Language Integrated Query)** es una funcionalidad de C# que permite realizar consultas a colecciones de datos de forma declarativa.
- Permite interactuar con:
  - **Colecciones en memoria** (List, Arrays).
  - **Bases de datos** a través de **Entity Framework**.
  - **XML**, **JSON**, y más.

### Ventajas de LINQ
- Sintaxis clara y legible.
- Fuertemente tipado: Ayuda a evitar errores en tiempo de compilación.
- Optimizado para trabajar con datos relacionados (joins, filtros, etc.).

---

## Configuración del Modelo: Ejemplo

Para esta clase, utilizaremos un modelo `Robot`.

```csharp
public class Robot
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public string Tipo { get; set; } // Industrial, Doméstico, etc.
    public int AnoFabricacion { get; set; }
    public bool Activo { get; set; }
    public decimal Costo { get; set; }
}
```

Y un contexto de base de datos con **Entity Framework**:

```csharp
public class AppDbContext : DbContext
{
    public DbSet<Robot> Robots { get; set; }

    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
}
```

---

## Operadores Básicos de LINQ

1. **`Where`**: Filtrar datos.
2. **`Select`**: Proyección de datos.
3. **`OrderBy` y `OrderByDescending`**: Ordenar datos.
4. **`First`, `FirstOrDefault`**: Obtener el primer elemento.
5. **`Single`, `SingleOrDefault`**: Obtener un único elemento.
6. **`ToList`**: Convertir el resultado en una lista.

---

## Ejemplo: `Where` y `Select`

---

### `Where`: Filtrar datos

```csharp
var robotsActivos = _context.Robots
    .Where(r => r.Activo)
    .ToList();
```

- Filtra robots que estén activos.

---

### `Select`: Proyectar datos

```csharp
var nombresRobots = _context.Robots
    .Select(r => r.Nombre)
    .ToList();
```

- Obtiene solo los nombres de los robots.

---

## Ordenar Datos: `OrderBy` y `OrderByDescending`

---

### `OrderBy`: Ordenar ascendentemente

```csharp
var robotsPorCosto = _context.Robots
    .OrderBy(r => r.Costo)
    .ToList();
```

- Ordena los robots por costo de forma ascendente.

---

### `OrderByDescending`: Ordenar descendentemente

```csharp
var robotsMasCaros = _context.Robots
    .OrderByDescending(r => r.Costo)
    .ToList();
```

- Ordena los robots por costo de forma descendente.

---

## Obtener Elementos: `First`, `Single`

---

### `First`: Obtener el primer elemento

```csharp
var primerRobot = _context.Robots.First();
```

- Obtiene el primer robot de la tabla.

---

### `Single`: Obtener un único elemento

```csharp
var robotUnico = _context.Robots.Single(r => r.Id == 1);
```

- Busca un único robot con ID 1. Lanza una excepción si hay más de uno.

---

## Funciones de Agregación: `Sum`, `Average`, `Min`, `Max`

---

### `Sum`: Sumar valores

```csharp
var costoTotal = _context.Robots.Sum(r => r.Costo);
```

- Calcula la suma total del costo de los robots.

---

### `Average`: Promedio de valores

```csharp
var costoPromedio = _context.Robots.Average(r => r.Costo);
```

- Calcula el costo promedio de los robots.

---

## Funciones de Agregación: `Min` y `Max`

---

### `Min`: Mínimo valor

```csharp
var costoMinimo = _context.Robots.Min(r => r.Costo);
```

- Obtiene el costo más bajo entre los robots.

---

### `Max`: Máximo valor

```csharp
var costoMaximo = _context.Robots.Max(r => r.Costo);
```

- Obtiene el costo más alto entre los robots.

---

## Búsquedas Avanzadas

---

### `Contains`: Buscar palabras clave

```csharp
var robotsDomesticos = _context.Robots
    .Where(r => r.Tipo.Contains("Doméstico"))
    .ToList();
```

- Busca robots cuyo tipo contenga la palabra "Doméstico".

---

### `Equals`: Comparación exacta

```csharp
var robotExacto = _context.Robots
    .FirstOrDefault(r => r.Nombre.Equals("RoboCleaner"));
```

- Busca un robot con el nombre exacto "RoboCleaner".

---

## Comparaciones: `>`, `<`, `>=`, `<=`

---

### Buscar robots fabricados antes del año 2000

```csharp
var robotsAntiguos = _context.Robots
    .Where(r => r.AnoFabricacion < 2000)
    .ToList();
```

---

### Buscar robots con costo mayor o igual a 50,000

```csharp
var robotsCaros = _context.Robots
    .Where(r => r.Costo >= 50000)
    .ToList();
```

---

## Funciones Avanzadas: `GroupBy`

---

### Agrupar robots por tipo

```csharp
var robotsPorTipo = _context.Robots
    .GroupBy(r => r.Tipo)
    .Select(g => new
    {
        Tipo = g.Key,
        TotalRobots = g.Count()
    })
    .ToList();
```

- Agrupa robots por tipo y cuenta cuántos hay de cada tipo.

---

## Funciones Avanzadas: `Join`

---

### Realizar un join entre robots y fabricantes

Supongamos que hay un modelo `Fabricante` relacionado con `Robot`.

```csharp
var robotsConFabricantes = _context.Robots
    .Join(_context.Fabricantes,
          robot => robot.FabricanteId,
          fabricante => fabricante.Id,
          (robot, fabricante) => new
          {
              robot.Nombre,
              Fabricante = fabricante.Nombre
          })
    .ToList();
```

- Combina robots con sus fabricantes y devuelve el nombre del robot y del fabricante.

---

## Ejemplo Completo

---

### Consultar estadísticas

```csharp
var estadisticas = new
{
    TotalRobots = _context.Robots.Count(),
    CostoPromedio = _context.Robots.Average(r => r.Costo),
    CostoMaximo = _context.Robots.Max(r => r.Costo),
    CostoMinimo = _context.Robots.Min(r => r.Costo),
    RobotsActivos = _context.Robots.Count(r => r.Activo)
};
```

- Genera estadísticas generales sobre los robots.

---

## Resumen

1. **Operadores básicos de LINQ**:
   - `Where`, `Select`, `OrderBy`.
2. **Funciones de agregación**:
   - `Sum`, `Average`, `Min`, `Max`.
3. **Búsquedas avanzadas**:
   - `Contains`, `Equals`, `GroupBy`, `Join`.
4. **LINQ es esencial** para interactuar con Entity Framework y realizar consultas complejas de manera simple.

---

## Próximos Pasos

1. Experimentar con otros operadores de LINQ como `Skip`, `Take`, y `Any`.
2. Crear vistas y controladoras que usen estas consultas para mostrar datos en una aplicación MVC.
3. Optimizar consultas en bases de datos grandes para evitar problemas de rendimiento.
