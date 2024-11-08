<!-- Crear un ABM desde cero en C# MVC -->
# Crear un ABM desde cero en C# MVC

---

## Objetivo

- Crear una aplicación MVC en C# para realizar un ABM (Alta, Baja, Modificación) de un modelo.
- Usaremos **Entity Framework** para gestionar la base de datos.
- Pasos: Crear el modelo, la controladora, los métodos de la controladora, y las vistas.

---

## Paso 1: Crear el Proyecto MVC en Visual Studio

1. Abre **Visual Studio 2022** y selecciona **Crear un nuevo proyecto**.
2. Selecciona **Aplicación Web ASP.NET Core** y haz clic en **Siguiente**.
3. Asigna un nombre al proyecto y selecciona una ubicación en tu sistema.
4. Selecciona **Modelo-Vista-Controlador (MVC)** como plantilla.
5. Asegúrate de que **.NET 6 o superior** esté seleccionado y haz clic en **Crear**.

---

## Paso 2: Instalar Entity Framework Core

1. Abre la **Consola del Administrador de Paquetes** en Visual Studio:
   - Ve a **Herramientas > Administrador de Paquetes NuGet > Consola del Administrador de Paquetes**.
2. Ejecuta los siguientes comandos para instalar **Entity Framework Core** y **SQL Server**:

   ~~~bash
   Install-Package Microsoft.EntityFrameworkCore
   Install-Package Microsoft.EntityFrameworkCore.SqlServer
   Install-Package Microsoft.EntityFrameworkCore.Tools
   ~~~

---

## Paso 3: Crear el Modelo

Para este ejemplo, crearemos un modelo básico de **Producto**.

~~~csharp
public class Producto
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
    public int Stock { get; set; }
}
~~~

- **Id**: Clave primaria.
- **Nombre**: Nombre del producto.
- **Precio**: Precio del producto.
- **Stock**: Cantidad disponible.

---

## Paso 4: Crear el DbContext

1. Crea una carpeta llamada **Data** en el proyecto.
2. Dentro de la carpeta **Data**, crea una clase llamada `AppDbContext`.

~~~csharp
using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext
{
    public DbSet<Producto> Productos { get; set; }

    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
}
~~~

3. Agrega el `DbContext` en el archivo `Program.cs`:

   ~~~csharp
   builder.Services.AddDbContext<AppDbContext>(options =>
       options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
   ~~~

4. En el archivo `appsettings.json`, agrega la cadena de conexión:

   ~~~json
   "ConnectionStrings": {
       "DefaultConnection": "Server=localhost;Database=MiBaseDeDatos;Trusted_Connection=True;TrustServerCertificate=True;"
   }
   ~~~

---

## Paso 5: Crear la Base de Datos y Migración Inicial

1. Abre la **Consola del Administrador de Paquetes**.
2. Ejecuta los comandos para crear la migración inicial y la base de datos:

   ~~~bash
   Add-Migration InitialCreate
   Update-Database
   ~~~

Esto creará la tabla `Productos` en la base de datos.

---

## Paso 6: Crear la Controladora de Producto

1. Haz clic derecho en la carpeta **Controllers** y selecciona **Agregar > Controlador**.
2. Selecciona **Controlador MVC con vistas, usando Entity Framework**.
3. Selecciona el modelo `Producto` y el contexto `AppDbContext`.
4. Visual Studio generará una controladora llamada `ProductosController` y las vistas correspondientes.

---

## Paso 7: Métodos de la Controladora

- La controladora generada incluirá los métodos necesarios para el ABM:

1. **Index**: Muestra la lista de productos.
2. **Details**: Muestra los detalles de un producto específico.
3. **Create**: Permite crear un nuevo producto.
4. **Edit**: Permite editar un producto existente.
5. **Delete**: Permite eliminar un producto existente.

---

## Paso 8: Método Index - Listar Productos

~~~csharp
public IActionResult Index()
{
    var productos = _context.Productos.ToList();
    return View(productos);
}
~~~

- **Descripción**: Muestra todos los productos.
- **Vista**: Muestra la lista completa de productos.

---

### Vista de Index - Listar Productos

~~~html
@model IEnumerable<Producto>

<h2>Lista de Productos</h2>
<table class="table">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach (var item in Model)
        {
            <tr>
                <td>@item.Nombre</td>
                <td>@item.Precio</td>
                <td>@item.Stock</td>
                <td>
                    <a href="@Url.Action("Edit", new { id = item.Id })" class="btn btn-warning">Editar</a>
                    <a href="@Url.Action("Delete", new { id = item.Id })" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        }
    </tbody>
</table>
<a href="@Url.Action("Create")" class="btn btn-primary">Agregar Producto</a>
~~~

---

## Paso 9: Método Create - Alta de Producto

1. **Get** - Muestra el formulario para crear un producto.

   ~~~csharp
   public IActionResult Create()
   {
       return View();
   }
   ~~~

2. **Post** - Procesa el formulario de creación.

   ~~~csharp
   [HttpPost]
   [ValidateAntiForgeryToken]
   public IActionResult Create(Producto producto)
   {
       if (ModelState.IsValid)
       {
           _context.Productos.Add(producto);
           _context.SaveChanges();
           return RedirectToAction("Index");
       }
       return View(producto);
   }
   ~~~

---

### Vista de Create - Alta de Producto

~~~html
@model Producto

<h2>Crear Producto</h2>

<form asp-action="Create">
    <div class="form-group">
        @Html.LabelFor(model => model.Nombre)
        @Html.TextBoxFor(model => model.Nombre, new { @class = "form-control" })
    </div>
    <div class="form-group">
        @Html.LabelFor(model => model.Precio)
        @Html.TextBoxFor(model => model.Precio, new { @class = "form-control" })
    </div>
    <div class="form-group">
        @Html.LabelFor(model => model.Stock)
        @Html.TextBoxFor(model => model.Stock, new { @class = "form-control" })
    </div>
    <button type="submit" class="btn btn-primary">Guardar</button>
</form>
<a asp-action="Index" class="btn btn-secondary">Volver</a>
~~~

---

## Paso 10: Método Edit - Modificación de Producto

1. **Get** - Muestra el formulario para editar un producto.

   ~~~csharp
   public IActionResult Edit(int id)
   {
       var producto = _context.Productos.Find(id);
       if (producto == null) return NotFound();

       return View(producto);
   }
   ~~~

2. **Post** - Procesa el formulario de edición.

   ~~~csharp
   [HttpPost]
   [ValidateAntiForgeryToken]
   public IActionResult Edit(int id, Producto producto)
   {
       if (id != producto.Id) return NotFound();

       if (ModelState.IsValid)
       {
           _context.Productos.Update(producto);
           _context.SaveChanges();
           return RedirectToAction("Index");
       }
       return View(producto);
   }
   ~~~

---

### Vista de Edit - Modificación de Producto

~~~html
@model Producto

<h2>Editar Producto</h2>

<form asp-action="Edit">
    <input type="hidden" asp-for="Id" />
    <div class="form-group">
        @Html.LabelFor(model => model.Nombre)
        @Html.TextBoxFor(model => model.Nombre, new { @class = "form-control" })
    </div>
    <div class="form-group">
        @Html.LabelFor(model => model.Precio)
        @Html.TextBoxFor(model => model.Precio, new { @class = "form-control" })
    </div>
    <div class="form-group">
        @Html.LabelFor(model => model.Stock)
        @Html.TextBoxFor(model => model.Stock, new { @class = "form-control" })
    </div>
    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
</form>
<a asp-action="Index" class="btn btn-secondary">Volver</a>
~~~

---

## Paso 11: Método Delete - Eliminación de Producto

1. **Get** - Muestra la vista de confirmación para eliminar el producto.

   ~~~csharp
   public IActionResult Delete(int id)
   {
       var producto = _context.Productos.Find(id);
       if (producto == null) return NotFound();

       return View(producto);
   }
   ~~~

2. **Post** - Confirma y elimina el producto.

   ~~~csharp
   [HttpPost, ActionName("Delete")]
   [ValidateAntiForgeryToken]
   public IActionResult DeleteConfirmed(int id)
   {
       var producto = _context.Productos.Find(id);
       _context.Productos.Remove(producto);
       _context.SaveChanges();
       return RedirectToAction("Index");
   }
   ~~~

---

### Vista de Delete - Eliminación de Producto

~~~html
@model Producto

<h2>Eliminar Producto</h2>

<div>
    <h3>¿Está seguro de que quiere eliminar este producto?</h3>
    <div>
        <h4>@Model.Nombre</h4>
        <dl class="dl-horizontal">
            <dt>Precio</dt>
            <dd>@Model.Precio</dd>
            <dt>Stock</dt>
            <dd>@Model.Stock</dd>
        </dl>
    </div>
    <form asp-action="DeleteConfirmed" method="post">
        <input type="hidden" asp-for="Id" />
        <button type="submit" class="btn btn-danger">Eliminar</button>
        <a asp-action="Index" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
~~~

---

## Resumen del ABM en C# MVC

1. **Creación del Proyecto** en Visual Studio.
2. **Instalación de Entity Framework** y configuración del DbContext.
3. **Creación del Modelo** `Producto`.
4. **Generación de la Controladora y Vistas**.
5. **Métodos de la Controladora** para `Index`, `Create`, `Edit`, y `Delete`.
6. **Personalización de las Vistas**.

---

## Próximos Pasos

1. Practicar con otros modelos y agregar relaciones.
2. Implementar validaciones en el modelo `Producto`.
3. Añadir mensajes de confirmación y mejora en las vistas.

