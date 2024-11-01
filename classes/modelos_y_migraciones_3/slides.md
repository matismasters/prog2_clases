<!-- Métodos básicos de los Modelos en Entity Framework -->

# Métodos básicos de los Modelos en Entity Framework

---

## Métodos principales de los Modelos en EF Core

- **Entity Framework Core** ofrece una variedad de métodos para manipular datos en la base de datos.
- Los métodos más comunes incluyen:
  - **Búsqueda**: `Find`, `First`, `FirstOrDefault`
  - **Filtrado**: `Where`
  - **Actualización**: `Update`
  - **Eliminación**: `Remove`
  - **Otros**: `ToList`, `Add`

---

## Conectar el modelo en `DbContext`

- Para poder usar estos métodos, tu modelo debe estar registrado en el `DbContext`.

```csharp
public class AppDbContext : DbContext {
    public DbSet<Producto> Productos { get; set; }
}
```

---

## `Add` - Agregar un nuevo registro

- El método **`Add`** se usa para insertar un nuevo registro en la base de datos.
- Pasos:
  1. Crear una nueva instancia del modelo.
  2. Usar `Add` para agregarla al contexto.
  3. Usar `SaveChanges` para confirmar.

```csharp
Producto nuevoProducto = new Producto { Nombre = "Manzana", Precio = 1.50m };
context.Productos.Add(nuevoProducto);
context.SaveChanges();
```

---

## `AddRange` - Agregar múltiples registros

- **`AddRange`** permite agregar varios registros al mismo tiempo.
- Es útil para ahorrar tiempo y llamadas a `SaveChanges`.

```csharp
List<Producto> productos = new List<Producto> {
    new Producto { Nombre = "Banana", Precio = 1.20m },
    new Producto { Nombre = "Naranja", Precio = 1.30m }
};
context.Productos.AddRange(productos);
context.SaveChanges();
```

---

## `Find` - Buscar por clave primaria

- **`Find`** permite buscar un registro por su clave primaria.
- Devuelve el registro encontrado o `null` si no existe.

```csharp
Producto producto = context.Productos.Find(1);
if (producto != null) {
    Console.WriteLine(producto.Nombre);
}
```

- `Find` es eficiente porque busca primero en el contexto antes de consultar la base de datos.

---

## `First` y `FirstOrDefault`

- **`First`** devuelve el primer registro que coincide con el criterio.
- **`FirstOrDefault`** devuelve el primer registro o `null` si no se encuentra ninguno.

```csharp
Producto producto = context.Productos.First(p => p.Precio > 1.00m);
Producto productoOpcion = context.Productos.FirstOrDefault(p => p.Nombre == "Manzana");
```

---

## `Where` - Filtrar registros

- **`Where`** devuelve una lista de registros que cumplen con una condición.
- Este método se utiliza junto con `ToList`, `First`, o `FirstOrDefault` para ejecutar la consulta.

```csharp
List<Producto> productosBaratos = context.Productos.Where(p => p.Precio < 2.00m).ToList();
foreach (Producto producto in productosBaratos) {
    Console.WriteLine(producto.Nombre);
}
```

- Puedes combinar condiciones usando `&&`, `||`, y otras expresiones lógicas.

---

## `ToList` - Convertir a lista

- **`ToList`** ejecuta la consulta y devuelve una lista de resultados.
- Es necesario para convertir los resultados de una consulta `IQueryable` en una lista.

```csharp
List<Producto> todosLosProductos = context.Productos.ToList();
```

- **Nota**: `ToList` ejecuta la consulta en la base de datos y debe usarse cuando necesites todos los datos.

---

## `OrderBy` y `OrderByDescending`

- **`OrderBy`** ordena los resultados de forma ascendente.
- **`OrderByDescending`** ordena de forma descendente.

```csharp
List<Producto> productosOrdenados = context.Productos.OrderBy(p => p.Precio).ToList();
List<Producto> productosDescendentes = context.Productos.OrderByDescending(p => p.Nombre).ToList();
```

- Estos métodos pueden combinarse con `Where`, `First`, y otros métodos de consulta.

---

## `Any` - Verificar si existen registros

- **`Any`** devuelve `true` si hay al menos un registro que cumple con una condición.
- Es útil para verificar la existencia de datos.

```csharp
bool existeProducto = context.Productos.Any(p => p.Nombre == "Manzana");
Console.WriteLine(existeProducto); // true o false
```

---

## `Count` - Contar registros

- **`Count`** devuelve el número de registros que cumplen con una condición.

```csharp
int cantidadProductos = context.Productos.Count();
int productosBaratos = context.Productos.Count(p => p.Precio < 2.00m);
```

- `Count` se usa sin parámetros para contar todos los registros.

---

## `Update` - Actualizar un registro

1. Busca el registro.
2. Modifica las propiedades.
3. Usa `Update` y `SaveChanges`.

```csharp
Producto producto = context.Productos.Find(1);
if (producto != null) {
    producto.Precio = 2.00m;
    context.Productos.Update(producto);
    context.SaveChanges();
}
```

---

## `Attach` y `Update`

- **`Attach`** se usa para conectar una entidad que ya existe en la base de datos.
- **`Update`** se usa para marcarla como modificada.

```csharp
Producto producto = new Producto { Id = 1, Precio = 2.00m };
context.Productos.Attach(producto);
context.Entry(producto).Property(p => p.Precio).IsModified = true;
context.SaveChanges();
```

---

## `Remove` - Eliminar un registro

1. Busca el registro.
2. Usa `Remove` y `SaveChanges` para eliminarlo.

```csharp
Producto producto = context.Productos.Find(1);
if (producto != null) {
    context.Productos.Remove(producto);
    context.SaveChanges();
}
```

- `Remove` elimina el registro de la base de datos.

---

## `RemoveRange` - Eliminar múltiples registros

- **`RemoveRange`** elimina múltiples registros a la vez.

```csharp
List<Producto> productos = context.Productos.Where(p => p.Precio < 1.00m).ToList();
context.Productos.RemoveRange(productos);
context.SaveChanges();
```

- Elimina todos los registros que cumplen la condición especificada.

---

## `Include` - Cargar relaciones

- **`Include`** carga relaciones entre entidades.
- Usado en consultas para obtener datos de tablas relacionadas.

```csharp
List<Producto> productos = context.Productos.Include(p => p.Categoria).ToList();
foreach (Producto producto in productos) {
    Console.WriteLine(producto.Categoria.Nombre);
}
```

- `Include` es esencial para evitar problemas de carga diferida.

---

## `SaveChanges` - Guardar cambios en la base de datos

- **`SaveChanges`** es necesario para aplicar todas las operaciones de inserción, actualización y eliminación.

```csharp
context.SaveChanges();
```

- Sin `SaveChanges`, los cambios no se reflejarán en la base de datos.

---

## Métodos resumidos

- **Búsqueda**:
  - `Find`, `First`, `FirstOrDefault`
- **Filtrado**:
  - `Where`, `OrderBy`, `OrderByDescending`
- **Existencia**:
  - `Any`, `Count`
- **CRUD**:
  - `Add`, `AddRange`, `Update`, `Remove`, `RemoveRange`
- **Relaciones**:
  - `Include`

---

## Ejemplo final

```csharp
// Ejemplo completo usando varios métodos
Producto producto = new Producto { Nombre = "Mango", Precio = 2.50m };
context.Productos.Add(producto);
context.SaveChanges();

List<Producto> productos = context.Productos
    .Where(p => p.Precio > 1.00m)
    .OrderBy(p => p.Nombre)
    .Include(p => p.Categoria)
    .ToList();

foreach (Producto p in productos) {
    Console.WriteLine($"{p.Nombre} - {p.Categoria.Nombre}");
}
```

---

## Resumen y próximos pasos

- Practicar usando estos métodos en diferentes escenarios.
- Explorar consultas avanzadas y LINQ en EF Core.
- Utilizar `AsNoTracking` para optimizar consultas de solo lectura.
