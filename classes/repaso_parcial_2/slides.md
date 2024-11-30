<!-- Repaso para el Segundo Parcial de Programación en C# MVC -->
# Repaso Segundo Parcial
## Programación en C# MVC

---

## Temas a Repasar

1. **Modelos**:
   - Métodos públicos, privados y estáticos.
   - Uso de migraciones: `add-migration` y `update-database`.
   - ¿Qué son las migraciones?

2. **ModelBuilder**:
   - Relaciones uno a uno y uno a muchos.
   - Implementación de relaciones en modelos y `ModelBuilder`.

3. **Controladores**:
   - Implementación de acciones (métodos públicos que devuelven `IActionResult`).
   - Recepción de parámetros desde las vistas.

4. **Vistas**:
   - Uso de `ViewBag` y `ViewData`.
   - Ejemplos de código C# en las vistas: `@if`, `@foreach`, `@{ }`.

5. **Patrón MVC**:
   - Responsabilidades de los modelos, controladores y vistas.

6. **HTTP Básico**:
   - Verbos HTTP: GET, POST, PUT, DELETE.
   - Parámetros en URL y en cuerpo de la solicitud.

---

## Modelos en C#

### Métodos Públicos, Privados y Estáticos

- **Públicos (`public`)**:
  - Accesibles desde cualquier parte del código.
  - Ejemplo:

    ```csharp
    public class Persona
    {
        public string Nombre { get; set; }
        public void Saludar()
        {
            Console.WriteLine($"Hola, soy {Nombre}");
        }
    }
    ```

- **Privados (`private`)**:
  - Solo accesibles dentro de la clase donde se definen.
  - Ejemplo:

    ```csharp
    public class CuentaBancaria
    {
        private decimal saldo;

        private void ActualizarSaldo(decimal cantidad)
        {
            saldo += cantidad;
        }
    }
    ```

- **Estáticos (`static`)**:
  - Pertenecen a la clase, no a una instancia.
  - Ejemplo:

    ```csharp
    public class Calculadora
    {
        public static int Sumar(int a, int b)
        {
            return a + b;
        }
    }
    ```

---

## Migraciones en Entity Framework

### ¿Qué son las Migraciones?

- Las migraciones permiten sincronizar el modelo de datos en C# con la base de datos.
- Gestionan los cambios en el esquema de la base de datos a lo largo del tiempo.
- Facilitan la evolución de la base de datos sin perder datos existentes.

### Comandos Principales

- **Agregar una migración**:

  ```bash
  Add-Migration NombreDeLaMigracion
  ```

  - Registra cambios en el modelo y crea un archivo de migración.

- **Actualizar la base de datos**:

  ```bash
  Update-Database
  ```

  - Aplica las migraciones pendientes a la base de datos.

---

## Ejemplo de Uso de Migraciones

1. **Modificar el Modelo**:
   - Agregamos una nueva propiedad a la clase `Producto`.

     ```csharp
     public class Producto
     {
         public int Id { get; set; }
         public string Nombre { get; set; }
         public decimal Precio { get; set; }
         public int Stock { get; set; }
         public string Descripcion { get; set; } // Nueva propiedad
     }
     ```

2. **Crear una Nueva Migración**:

   ```bash
   Add-Migration AgregarDescripcionAProducto
   ```

3. **Aplicar la Migración a la Base de Datos**:

   ```bash
   Update-Database
   ```

- La base de datos ahora incluye la nueva columna `Descripcion` en la tabla `Productos`.

---

## ModelBuilder y Relaciones

### Relaciones Uno a Uno

- **Definición**: Cada entidad de una tabla se relaciona con una única entidad de otra tabla.

### Implementación en los Modelos

- **Clase `Persona`**:

  ```csharp
  public class Persona
  {
      public int Id { get; set; }
      public string Nombre { get; set; }
      public DocumentoIdentidad DocumentoIdentidad { get; set; }
  }
  ```

- **Clase `DocumentoIdentidad`**:

  ```csharp
  public class DocumentoIdentidad
  {
      public int Id { get; set; }
      public string Numero { get; set; }
      public int PersonaId { get; set; }
      public Persona Persona { get; set; }
  }
  ```

### Configuración en `ModelBuilder`

- En el método `OnModelCreating`:

  ```csharp
  modelBuilder.Entity<Persona>()
      .HasOne(p => p.DocumentoIdentidad)
      .WithOne(d => d.Persona)
      .HasForeignKey<DocumentoIdentidad>(d => d.PersonaId);
  ```

---

## Relaciones Uno a Muchos

- **Definición**: Una entidad de una tabla se relaciona con muchas entidades de otra tabla.

### Implementación en los Modelos

- **Clase `Categoria`**:

  ```csharp
  public class Categoria
  {
      public int Id { get; set; }
      public string Nombre { get; set; }
      public List<Producto> Productos { get; set; }
  }
  ```

- **Clase `Producto`**:

  ```csharp
  public class Producto
  {
      public int Id { get; set; }
      public string Nombre { get; set; }
      public int CategoriaId { get; set; }
      public Categoria Categoria { get; set; }
  }
  ```

### Configuración en `ModelBuilder`

- En el método `OnModelCreating`:

  ```csharp
  modelBuilder.Entity<Producto>()
      .HasOne(p => p.Categoria)
      .WithMany(c => c.Productos)
      .HasForeignKey(p => p.CategoriaId);
  ```

---

## Controladores en MVC

### Implementación de Acciones

- **Acciones**: Métodos públicos que devuelven un `IActionResult`.

- **Ejemplo de Controlador**:

  ```csharp
  public class ProductosController : Controller
  {
      public IActionResult Index()
      {
          // Lógica para obtener productos
          return View();
      }

      public IActionResult Detalles(int id)
      {
          // Lógica para obtener detalles del producto
          return View();
      }
  }
  ```

- **Tipos de `IActionResult` Comunes**:
  - `View()`: Retorna una vista.
  - `RedirectToAction()`: Redirige a otra acción.
  - `Json()`: Retorna datos en formato JSON.

---

## Recepción de Parámetros desde las Vistas

- **Parámetros en Acciones**:
  - Los parámetros pueden ser recibidos a través de la URL, formularios o query strings.

- **Ejemplo**:

  ```csharp
  [HttpPost]
  public IActionResult Crear(Producto producto)
  {
      if (ModelState.IsValid)
      {
          // Guardar el producto
          return RedirectToAction("Index");
      }
      return View(producto);
  }
  ```

- **Desde la Vista**:

  ```html
  <form asp-action="Crear" method="post">
      <input asp-for="Nombre" />
      <input asp-for="Precio" />
      <button type="submit">Guardar</button>
  </form>
  ```

---

## Uso de ViewBag y ViewData

### ¿Qué son?

- **ViewBag** y **ViewData** son mecanismos para pasar datos desde el controlador a la vista.

### ViewBag

- Es una propiedad dinámica.

- **Ejemplo en el Controlador**:

  ```csharp
  public IActionResult Index()
  {
      ViewBag.Mensaje = "Bienvenido a la tienda";
      return View();
  }
  ```

- **Uso en la Vista**:

  ```html
  <h1>@ViewBag.Mensaje</h1>
  ```

### ViewData

- Es un diccionario de clave-valor.

- **Ejemplo en el Controlador**:

  ```csharp
  public IActionResult Index()
  {
      ViewData["Mensaje"] = "Bienvenido a la tienda";
      return View();
  }
  ```

- **Uso en la Vista**:

  ```html
  <h1>@ViewData["Mensaje"]</h1>
  ```

---

## Código C# en las Vistas

### Uso de `@if`

- **Ejemplo**:

  ```html
  @if (Model.Productos.Count > 0)
  {
      <p>Hay productos disponibles.</p>
  }
  else
  {
      <p>No hay productos disponibles.</p>
  }
  ```

### Uso de `@foreach`

- **Ejemplo**:

  ```html
  <ul>
      @foreach (var producto in Model.Productos)
      {
          <li>@producto.Nombre - @producto.Precio</li>
      }
  </ul>
  ```

### Bloque de Código `@{ }`

- **Ejemplo**:

  ```html
  @{
      var fechaActual = DateTime.Now;
  }
  <p>Fecha actual: @fechaActual</p>
  ```

---

## Responsabilidades en el Patrón MVC

### Modelos

- Representan la lógica de negocio y los datos de la aplicación.
- Gestionan las reglas de negocio y las interacciones con la base de datos.

### Controladores

- Gestionan las solicitudes del usuario.
- Procesan los datos a través de los modelos.
- Determinan qué vista se debe mostrar.

### Vistas

- Presentan los datos al usuario.
- Generan la interfaz de usuario.
- Deben contener la menor lógica posible.

---

## HTTP Básico

### Verbos HTTP

- **GET**: Solicita datos del servidor.
- **POST**: Envía datos al servidor.
- **PUT**: Actualiza datos en el servidor.
- **DELETE**: Elimina datos del servidor.

---

## Parámetros en URL y en Cuerpo de la Solicitud

- **Parámetros en URL**:
  - Se envían en la URL de la solicitud.
  - Ejemplo: `https://api.com/productos/1`.

- **Parámetros en URL como Query String**:
  - Se envían como pares clave-valor separados por `?`(al principio) y `&` entre ellos.
  - Ejemplo: `https://api.com/productos?id=1&nombre=julian`.

- **Parámetros en el Cuerpo de la Solicitud**:
  - Se envían en el cuerpo de la solicitud.
  - Usados en solicitudes POST y PUT.
  - Ejemplo: 
    - `POST https://api.com/productos` con datos en el cuerpo.
    - `{ "nombre": "Laptop", "precio": 1000 }`.

---

## Ejemplo de Parámetros en URL y Cuerpo de la Solicitud

- **GET con Parámetros en URL**:

```
  GET https://api.com/productos/1
```

---

- **GET con Parámetros en Query String**:

```
  GET https://api.com/productos?id=1&nombre=julian
```

---

- **POST con Parámetros en el Cuerpo**:

```
  POST https://api.com/productos
  {
    "nombre": "Laptop",
    "precio": 1000
  }
```

---

- **PUT con Parámetros en el Cuerpo**:

```
  PUT https://api.com/productos/1
  {
    "nombre": "Laptop",
    "precio": 1200
  }
```

---

## Resumen y Consejos para el Parcial

- **Entender la Separación de Responsabilidades** en MVC.
- **Practicar la Implementación de Relaciones** en los modelos y `ModelBuilder`.
- **Familiarizarse con los Comandos de Migraciones** y su propósito.
- **Saber Cómo Pasar Datos Entre Controlador y Vista** usando `ViewBag` y `ViewData`.
- **Practicar Código C# en las Vistas** para controlar la presentación dinámica.
- **Conocer los Verbos HTTP** y cómo se usan en solicitudes REST.

---

## Preguntas y Respuestas

- **¿Cuál es la diferencia entre `ViewBag` y `ViewData`?**
  - `ViewBag` es dinámico y `ViewData` es un diccionario, pero ambos sirven para pasar datos del controlador a la vista.

- **¿Cómo se define una acción en un controlador?**
  - Es un método público que devuelve `IActionResult`.

- **¿Para qué se utilizan las migraciones?**
  - Para mantener sincronizado el modelo de datos en C# con la estructura de la base de datos.

---

## Fin del Repaso

- **Repasar estos temas** y **practicar con ejemplos** ayudará a prepararse para el parcial.
- **Consultar documentación de este repositorio** si se requiere profundizar en algún tema.
# Enlaces a otros slides

- [LINQ Avanzado](../linq_avanzado/slides.md)
- [LINQ Avanzado 2](../linq_avanzado_2/slides.md)
- [Listas y Arrays](../listas_arrays/slides.md)
- [Modelos y Migraciones](../modelos_y_migraciones_/slides.md)
- [Fechas](../fechas/slides.md)
- [HTTP Básico](../http_basico/slides.md)

