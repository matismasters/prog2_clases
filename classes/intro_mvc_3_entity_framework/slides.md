<!-- Introducción a Entity Framework en ASP.NET Core -->

# Introducción a Entity Framework en ASP.NET Core

---

## ¿Qué es Entity Framework?

- **Entity Framework (EF)** es un **ORM** (Object-Relational Mapper) que permite a los desarrolladores interactuar con bases de datos utilizando **objetos C#**.
- Con EF, puedes realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) en una base de datos sin escribir consultas SQL directamente.

---

## Beneficios de usar Entity Framework

- **Abstracción de base de datos**: No necesitas escribir SQL manualmente.
- **Productividad**: Acelera el desarrollo al mapear automáticamente clases a tablas de bases de datos.
- **Facilita el mantenimiento**: El código es más fácil de leer y mantener.

---

## Conceptos clave de Entity Framework

1. **DbContext**: Clase que gestiona la conexión a la base de datos y realiza operaciones sobre los datos.
2. **DbSet**: Representa una tabla en la base de datos. Se utiliza para realizar operaciones CRUD sobre la tabla.
3. **Migraciones**: Proceso para crear o actualizar la estructura de la base de datos a partir de los modelos definidos en C#.

---

## Instalando Entity Framework en ASP.NET Core

1. **Agregar paquetes NuGet** para Entity Framework:
   - **Microsoft.EntityFrameworkCore.SqlServer** (para trabajar con SQL Server)
   - **Microsoft.EntityFrameworkCore.Tools** (para trabajar con migraciones)

```bash
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

---

## Crear el Modelo

- En Entity Framework, las clases **modelo** representan tablas en la base de datos.
- Cada propiedad de la clase representa una columna en la tabla.

```csharp
// Models/Producto.cs
public class Producto {
    public int Id { get; set; }

    [Required]
    public string Nombre { get; set; }

    public decimal Precio { get; set; }
}
```

---

## Crear la clase DbContext

- La clase **DbContext** es la encargada de gestionar la conexión a la base de datos y realizar operaciones CRUD.

```csharp
// Data/AppDbContext.cs
using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Producto> Productos { get; set; }
}
```

- **DbSet<Producto> Productos**: Representa la tabla **Productos** en la base de datos.

---

## Configurar Entity Framework en Startup.cs

- En **ASP.NET Core**, se debe configurar **DbContext** en el archivo `Startup.cs` para que EF sepa cómo conectarse a la base de datos.

```csharp
// Startup.cs
public void ConfigureServices(IServiceCollection services) {
    services.AddDbContext<AppDbContext>(options =>
        options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

    services.AddControllersWithViews();
}
```

---

## Configurar la cadena de conexión

- En **appsettings.json**, se debe definir la cadena de conexión a la base de datos.

```json
// appsettings.json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=MiBaseDeDatos;Trusted_Connection=True;"
  }
}
```

---

## Crear la base de datos con migraciones

1. **Crear la primera migración**:

```bash
dotnet ef migrations add Inicial
```

2. **Actualizar la base de datos**:

```bash
dotnet ef database update
```

---

## Controlador con Entity Framework

- El controlador utiliza **AppDbContext** para interactuar con la base de datos.

```csharp
// Controllers/ProductoController.cs
public class ProductoController : Controller {
    private readonly AppDbContext _context;

    public ProductoController(AppDbContext context) {
        _context = context;
    }

    public IActionResult Index() {
        var productos = _context.Productos.ToList();
        return View(productos);
    }

    [HttpPost]
    public IActionResult Crear(Producto producto) {
        if (ModelState.IsValid) {
            _context.Productos.Add(producto);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        return View(producto);
    }
}
```

---

## Crear la Vista para listar los productos

- En **ASP.NET Core MVC**, creamos vistas para mostrar los datos obtenidos desde la base de datos.

```html
<!-- Views/Producto/Index.cshtml -->
<h2>Lista de Productos</h2>
<table>
  <tr>
    <th>Nombre</th>
    <th>Precio</th>
  </tr>
  @foreach (var producto in Model) {
  <tr>
    <td>@producto.Nombre</td>
    <td>@producto.Precio</td>
  </tr>
  }
</table>
<a href="/Producto/Crear">Crear nuevo producto</a>
```

---

## Crear la Vista para crear un producto

```html
<!-- Views/Producto/Crear.cshtml -->
<h2>Crear Producto</h2>

<form method="post">
  <div>
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" asp-for="Nombre" />
    <span asp-validation-for="Nombre" class="text-danger"></span>
  </div>

  <div>
    <label for="precio">Precio:</label>
    <input type="number" name="precio" id="precio" asp-for="Precio" />
    <span asp-validation-for="Precio" class="text-danger"></span>
  </div>

  <button type="submit">Crear</button>
</form>
```

---

## Validaciones automáticas con Entity Framework

- Las anotaciones de datos como `[Required]` y `[Range]` también funcionan con Entity Framework.
- EF generará las validaciones automáticamente al crear formularios en vistas.

```csharp
public class Producto {
    public int Id { get; set; }

    [Required(ErrorMessage = "El nombre es obligatorio.")]
    public string Nombre { get; set; }

    [Range(1, 1000, ErrorMessage = "El precio debe estar entre 1 y 1000.")]
    public decimal Precio { get; set; }
}
```

---

## Ejemplo completo

1. **Modelo**:

```csharp
public class Producto {
    public int Id { get; set; }
    [Required]
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
}
```

2. **DbContext**:

```csharp
public class AppDbContext : DbContext {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Producto> Productos { get; set; }
}
```

3. **Controlador**:

```csharp
public class ProductoController : Controller {
    private readonly AppDbContext _context;

    public ProductoController(AppDbContext context) {
        _context = context;
    }

    public IActionResult Index() {
        var productos = _context.Productos.ToList();
        return View(productos);
    }

    [HttpPost]
    public IActionResult Crear(Producto producto) {
        if (ModelState.IsValid) {
            _context.Productos.Add(producto);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        return View(producto);
    }
}
```

4. **Vistas**:
   - **Index.cshtml**: Muestra la lista de productos.
   - **Crear.cshtml**: Permite crear nuevos productos con validaciones.

---

## Próximos pasos con Entity Framework

1. Implementar **actualización** y **eliminación** de datos en los controladores.
2. Explorar el uso de **consultas más complejas** con LINQ.
3. Aprender a manejar **relaciones** entre entidades (uno a muchos, muchos a muchos).
4. Conectar Entity Framework con una **base de datos en producción**.
