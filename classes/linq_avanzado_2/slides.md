<!-- Operadores Avanzados de LINQ -->
# Operadores Avanzados de LINQ

---

## Introducción a Operadores Avanzados

- Hasta ahora hemos visto operadores básicos de LINQ como:
  - `Where`, `Select`, `OrderBy`.
  - Funciones de agregación como `Sum`, `Average`, `Max`, y `Min`.

- Ahora exploraremos operadores avanzados y combinaciones complejas:
  - **`Skip` y `Take`**: Para paginación.
  - **`Any`**: Para verificar condiciones.
  - **Joins y Group By**: Consultas más avanzadas.
  - **Having**: Filtros adicionales en agregaciones.

---

## Clase Robot

```csharp
public class Robot
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public int FabricanteId { get; set; } // Clave foránea
    public Fabricante Fabricante { get; set; } // Relación de navegación
}
```

---

## Clase Fabricante

```csharp
public class Fabricante
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public List<Robot> Robots { get; set; } // Relación de navegación
}
```

---

## Relación Uno a Muchos

```csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Robot>()
        .HasOne(robot => robot.Fabricante)
        .WithMany(fabricante => fabricante.Robots)
        .HasForeignKey(robot => robot.FabricanteId);
}
```

---

## Operador `Skip`

- **`Skip`**: Omite un número específico de elementos al inicio de la consulta.

~~~csharp
var robotsOmitidos = _context.Robots
    .OrderBy(robot => robot.Nombre)
    .Skip(5)
    .ToList();
~~~

- Este ejemplo devuelve todos los robots excepto los primeros cinco, ordenados por nombre.

---

## Operador `Take`

- **`Take`**: Toma un número específico de elementos al inicio de la consulta.

~~~csharp
var primerosTresRobots = _context.Robots
    .OrderBy(robot => robot.Nombre)
    .Take(3)
    .ToList();
~~~

- Este ejemplo devuelve los primeros tres robots, ordenados por nombre.

---

## Combinación de `Skip` y `Take`

- Se pueden usar juntos para implementar paginación.

~~~csharp
int cantidadPorPagina = 5;
int numeroDePagina = 2;

var robotsPaginados = _context.Robots
    .OrderBy(robot => robot.Nombre)
    .Skip(cantidadPorPagina * (numeroDePagina - 1))
    .Take(cantidadPorPagina)
    .ToList();
~~~

- Este ejemplo devuelve la segunda página de resultados con cinco robots por página.

---

## Operador `Any`

- **`Any`**: Verifica si existe al menos un elemento que cumpla con una condición.

~~~csharp
bool existenRobotsActivos = _context.Robots.Any(robot => robot.Activo);
~~~

- Este ejemplo devuelve `true` si existe al menos un robot activo.

---

## Join entre Robots y Fabricantes

- Combinar datos relacionados de dos tablas.

~~~csharp
var robotsConFabricantes = _context.Robots
    .Join(_context.Fabricantes,
          robot => robot.FabricanteId,
          fabricante => fabricante.Id,
          (robot, fabricante) => new
          {
              NombreRobot = robot.Nombre,
              NombreFabricante = fabricante.Nombre
          })
    .ToList();
~~~

- Este ejemplo devuelve una lista de robots con el nombre de sus fabricantes.

---

## Group By

- Agrupa elementos por una clave y calcula agregados.

~~~csharp
var robotsAgrupadosPorTipo = _context.Robots
    .GroupBy(robot => robot.Tipo)
    .Select(grupo => new
    {
        Tipo = grupo.Key,
        TotalRobots = grupo.Count(),
        PromedioCosto = grupo.Average(robot => robot.Costo)
    })
    .ToList();
~~~

- Este ejemplo agrupa robots por tipo y calcula el total y el costo promedio para cada tipo.

---

## Group By y Having

- Usar `GroupBy` con un filtro adicional.

~~~csharp
var tiposCostosos = _context.Robots
    .GroupBy(robot => robot.Tipo)
    .Where(grupo => grupo.Average(robot => robot.Costo) > 50000)
    .Select(grupo => new
    {
        Tipo = grupo.Key,
        PromedioCosto = grupo.Average(robot => robot.Costo)
    })
    .ToList();
~~~

- Este ejemplo devuelve tipos de robots cuyo costo promedio es mayor a 50,000.

---

## Group By en un Join

- Agrupar elementos combinados de dos tablas.

~~~csharp
var robotsAgrupadosPorFabricante = _context.Robots
    .Join(_context.Fabricantes,
          robot => robot.FabricanteId,
          fabricante => fabricante.Id,
          (robot, fabricante) => new { robot, NombreFabricante = fabricante.Nombre })
    .GroupBy(relacion => relacion.NombreFabricante)
    .Select(grupo => new
    {
        Fabricante = grupo.Key,
        TotalRobots = grupo.Count(),
        CostoTotal = grupo.Sum(relacion => relacion.robot.Costo)
    })
    .ToList();
~~~

- Este ejemplo agrupa robots por fabricante y calcula el total de robots y el costo total por fabricante.

---

## Combinaciones Complejas: Where + Join + Group By

~~~csharp
var robotsActivosPorFabricante = _context.Robots
    .Where(robot => robot.Activo)
    .Join(_context.Fabricantes,
          robot => robot.FabricanteId,
          fabricante => fabricante.Id,
          (robot, fabricante) => new { robot, NombreFabricante = fabricante.Nombre })
    .GroupBy(relacion => relacion.NombreFabricante)
    .Select(grupo => new
    {
        Fabricante = grupo.Key,
        RobotsActivos = grupo.Count()
    })
    .ToList();
~~~

- Este ejemplo devuelve fabricantes con la cantidad de robots activos.

---

## Resumen

1. **`Skip` y `Take`**:
   - Implementar paginación.
2. **`Any`**:
   - Verificar si existen elementos que cumplen una condición.
3. **Joins**:
   - Combinar datos relacionados entre tablas.
4. **Group By y Having**:
   - Agrupar datos y aplicar filtros adicionales.
5. **Combinaciones complejas**:
   - Usar múltiples operadores en una consulta.

---

## Próximos Pasos

1. Experimentar con otros operadores avanzados como `All`, `Count`, `Distinct`.
2. Aplicar estas consultas en métodos de controladoras para mostrar datos en vistas.
3. Optimizar consultas en bases de datos grandes usando índices y particiones.
