<!-- Relaciones y Métodos de Controlador en Entity Framework con Temática de ARK: Survival Evolved -->
# Relaciones y Métodos de Controlador en Entity Framework con Temática de ARK: Survival Evolved

---

## Introducción a los Datos Relacionados en ARK: Survival Evolved

- En **ARK**, los jugadores pueden tener **tribus**.
- Las tribus tienen **miembros** y **dinosaurios**.
- Los dinosaurios pueden tener **habilidades** específicas y pertenecer a **biomas**.

---

## Ejemplo de Relaciones

1. **Tribu - Miembros**: Relación uno a muchos (1:N).
2. **Tribu - Dinosaurios**: Relación uno a muchos (1:N).
3. **Dinosaurio - Habilidades**: Relación muchos a muchos (M:N).

---

## Usando `Include` para Cargar Datos Relacionados

- **`Include`** permite cargar datos de relaciones de una tabla relacionada directamente.
- Ejemplo: Cargar la **tribu** junto con sus **miembros** y **dinosaurios**.

### Ejemplo de Código para `Include`

~~~csharp
var tribu = _context.Tribus
    .Include(t => t.Miembros)
    .Include(t => t.Dinosaurios)
    .FirstOrDefault(t => t.Nombre == "Los Exploradores");
~~~

- `Include(t => t.Miembros)` carga todos los miembros de la tribu.
- `Include(t => t.Dinosaurios)` carga todos los dinosaurios de la tribu.

---

## Ejemplo de Modelo para Tribus y Miembros

~~~csharp
public class Tribu
{
    public int TribuId { get; set; }
    public string Nombre { get; set; }
    public List<Miembro> Miembros { get; set; }
    public List<Dinosaurio> Dinosaurios { get; set; }
}

public class Miembro
{
    public int MiembroId { get; set; }
    public string Nombre { get; set; }
    public int TribuId { get; set; } // Clave foránea
    public Tribu Tribu { get; set; }
}
~~~

- La **Tribu** tiene colecciones de `Miembros` y `Dinosaurios`.
- `Miembro` contiene la clave foránea `TribuId`.

---

## Cargando Datos Relacionados Anidados con `ThenInclude`

- **`ThenInclude`** permite profundizar en las relaciones.
- Ejemplo: Cargar los **dinosaurios** de una tribu y sus **habilidades**.

### Ejemplo de Código para `ThenInclude`

~~~csharp
var tribu = _context.Tribus
    .Include(t => t.Dinosaurios)
        .ThenInclude(d => d.Habilidades)
    .FirstOrDefault(t => t.Nombre == "Los Exploradores");
~~~

- **`ThenInclude(d => d.Habilidades)`** carga todas las habilidades de los dinosaurios en la tribu.
- Esto permite acceder a los datos relacionados de forma anidada.

---

## Ejemplo de Modelo para Dinosaurios y Habilidades

~~~csharp
public class Dinosaurio
{
    public int DinosaurioId { get; set; }
    public string Especie { get; set; }
    public List<Habilidad> Habilidades { get; set; }
}

public class Habilidad
{
    public int HabilidadId { get; set; }
    public string Nombre { get; set; }
    public List<Dinosaurio> Dinosaurios { get; set; }
}
~~~

- **Dinosaurio** y **Habilidad** tienen una relación muchos a muchos (M:N).
- Cada **Dinosaurio** puede tener múltiples habilidades, y cada **Habilidad** puede estar en varios dinosaurios.

---

## Crear Métodos en Controladores para Trabajar con Relaciones

1. **Controladores** nos permiten manejar los datos relacionados.
2. Métodos en **controladores** para:
   - Listar tribus con dinosaurios y miembros.
   - Agregar o actualizar habilidades en dinosaurios.
   - Ver detalles de un dinosaurio junto a su tribu y habilidades.

---

## Ejemplo de Método en Controlador para Listar Tribus

~~~csharp
public class TribusController : Controller
{
    private readonly AppDbContext _context;

    public TribusController(AppDbContext context)
    {
        _context = context;
    }

    public IActionResult Index()
    {
        var tribus = _context.Tribus
            .Include(t => t.Miembros)
            .Include(t => t.Dinosaurios)
                .ThenInclude(d => d.Habilidades)
            .ToList();

        return View(tribus);
    }
}
~~~

- Este método `Index` carga todas las **tribus** con sus **miembros** y **dinosaurios**.
- Usa **`ThenInclude`** para cargar las habilidades de los dinosaurios.

---

## Ejemplo de Método en Controlador para Detalles de un Dinosaurio

~~~csharp
public IActionResult Detalles(int id)
{
    var dinosaurio = _context.Dinosaurios
        .Include(d => d.Habilidades)
        .Include(d => d.Tribu)
        .FirstOrDefault(d => d.DinosaurioId == id);

    if (dinosaurio == null)
    {
        return NotFound();
    }

    return View(dinosaurio);
}
~~~

- Este método carga un **dinosaurio** específico junto con sus **habilidades** y **tribu**.
- Si no encuentra el dinosaurio, devuelve un error `NotFound`.

---

## Método para Agregar Habilidades a un Dinosaurio

~~~csharp
[HttpPost]
public IActionResult AgregarHabilidad(int dinosaurioId, int habilidadId)
{
    var dinosaurio = _context.Dinosaurios
        .Include(d => d.Habilidades)
        .FirstOrDefault(d => d.DinosaurioId == dinosaurioId);

    var habilidad = _context.Habilidades.Find(habilidadId);

    if (dinosaurio == null || habilidad == null)
    {
        return NotFound();
    }

    dinosaurio.Habilidades.Add(habilidad);
    _context.SaveChanges();

    return RedirectToAction("Detalles", new { id = dinosaurioId });
}
~~~

- Este método agrega una **habilidad** a un **dinosaurio** específico.
- Utiliza `SaveChanges` para guardar la relación en la base de datos.

---

## Consultas Avanzadas Usando `Include` y `ThenInclude`

- Usa `Include` y `ThenInclude` para cargar varias capas de datos relacionados.
- Ejemplo de consulta avanzada en ARK:
  - Cargar una **tribu** con **dinosaurios**, **habilidades** de los dinosaurios, y **miembros** de la tribu.

### Código Ejemplo

~~~csharp
var tribu = _context.Tribus
    .Include(t => t.Dinosaurios)
        .ThenInclude(d => d.Habilidades)
    .Include(t => t.Miembros)
    .FirstOrDefault(t => t.Nombre == "Los Exploradores");
~~~

---

## Resumen de `Include` y `ThenInclude`

| Método           | Uso                          | Ejemplo                                         |
|------------------|------------------------------|-------------------------------------------------|
| **`Include`**    | Cargar una relación directa  | `Include(t => t.Dinosaurios)`                   |
| **`ThenInclude`**| Cargar una relación anidada  | `ThenInclude(d => d.Habilidades)`               |

---

## Próximos Pasos

1. Crear vistas para interactuar con los métodos del controlador.
2. Probar consultas complejas usando `Include` y `ThenInclude`.
3. Crear controladores adicionales para trabajar con datos de tribus, dinosaurios y habilidades.

