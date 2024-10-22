<!-- Introducción a proyectos MVC en C# -->
# Introducción a Proyectos MVC en C#

---

## ¿Qué es MVC?

- **MVC** es un patrón de diseño que divide una aplicación en tres componentes principales:
  - **Model (Modelo)**: Gestiona la lógica de datos y las reglas del negocio.
  - **View (Vista)**: Muestra la interfaz de usuario y los datos.
  - **Controller (Controlador)**: Gestiona las interacciones del usuario, llama al Modelo y selecciona las Vistas a mostrar.

---

## Beneficios del patrón MVC

- **Separación de responsabilidades**: Cada componente tiene su propio rol bien definido.
- **Facilita el mantenimiento**: El código es más fácil de mantener, depurar y probar.
- **Escalabilidad**: MVC permite que cada parte de la aplicación crezca de forma independiente.

---

## Arquitectura MVC

```text
+---------------------+     +--------------------+     +---------------------+
|                     |     |                    |     |                     |
|       Vista         |     |      Controlador    |     |      Modelo         |
|                     |     |                    |     |                     |
+---------------------+     +--------------------+     +---------------------+
        ^                             |                         |
        |                             v                         |
+---------------------+     +--------------------+     +---------------------+
|    Interacción      |---->|  Procesa la lógica |---->|  Acceso a datos     |
|    del usuario      |     |    del usuario     |     |    y reglas de      |
|                     |<----|    Selecciona      |<----|    negocio          |
+---------------------+     |     la vista       |     +---------------------+
                             +--------------------+
```

---

## Primer Proyecto MVC en C#

- Usaremos **ASP.NET Core MVC** para crear un proyecto básico.
- Este incluirá:
  - Un **Modelo** que almacena datos.
  - Un **Controlador** que gestiona el flujo de datos.
  - Una **Vista** que presenta esos datos.

---

## Creación de un nuevo proyecto MVC

1. Abre **Visual Studio**.
2. Selecciona **Crear un nuevo proyecto**.
3. Busca **ASP.NET Core Web Application** y selecciona **MVC** como plantilla.
4. Configura el proyecto y haz clic en **Crear**.

---

## Estructura del Proyecto MVC

- **Controllers**: Donde se colocan los controladores que manejan las solicitudes de los usuarios.
- **Models**: Donde definimos las clases que representan nuestros datos.
- **Views**: Donde colocamos los archivos de presentación (HTML, Razor Pages).

```text
Proyecto MVC
│
├── Controllers
│   ├── HomeController.cs
│
├── Models
│   ├── MensajeUsuario.cs
│
├── Views
│   ├── Home
│   │   ├── Index.cshtml
│
└── appsettings.json
```

---

## El Modelo en MVC

- Los **Modelos** representan los datos de la aplicación.
- Puede ser una clase simple o interactuar con una base de datos.

```csharp
// Models/Usuario.cs
public class MensajeUsuario {
    public string Nombre { get; set; }
    public int Edad { get; set; }
}
```

---

## El Controlador en MVC

- Los **Controladores** gestionan la interacción entre los modelos y las vistas.
- Cada controlador contiene acciones que corresponden a las URL que los usuarios visitan.

```csharp
// Controllers/HomeController.cs
public class HomeController : Controller {
    public IActionResult Index() {
        return View();
    }
    
    [HttpPost]
    public IActionResult CapturarDatos(string nombre, int edad) {
        ViewBag.Nombre = nombre;
        ViewBag.Edad = edad;
        return View("Resultado");
    }
}
```

---

## La Vista en MVC

- Las **Vistas** son archivos **Razor** (`.cshtml`) que muestran la información al usuario.
- Estas plantillas permiten mezclar HTML con C#.

```html
<!-- Views/Home/Index.cshtml -->
<form method="post" asp-action="CapturarDatos">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" />
    
    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad" />

    <button type="submit">Enviar</button>
</form>
```

---

## Captura de Datos de Formularios

- El método `CapturarDatos` en el controlador recibe los datos del formulario cuando el usuario lo envía.
- Luego, esos datos se pueden usar para mostrar información en la vista de "Resultado".

```csharp
// Controllers/HomeController.cs
[HttpPost]
public IActionResult CapturarDatos(string nombre, int edad) {
    ViewBag.Nombre = nombre;
    ViewBag.Edad = edad;
    return View("Resultado");
}
```

---

## Mostrar los datos capturados

- Usamos **ViewBag** para pasar los datos capturados desde el controlador hacia la vista.
- Luego, los mostramos en la vista `Resultado.cshtml`.

```html
<!-- Views/Home/Resultado.cshtml -->
<h2>Datos Capturados</h2>
<p>Nombre: @ViewBag.Nombre</p>
<p>Edad: @ViewBag.Edad</p>
```

---

## Ejemplo Completo

1. **Formulario** en `Index.cshtml`:
```html
<form method="post" asp-action="CapturarDatos">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" />
    
    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad" />
    <button type="submit">Enviar</button>
</form>
```

2. **Controlador** que recibe y procesa el formulario:
```csharp
[HttpPost]
public IActionResult CapturarDatos(string nombre, int edad) {
    ViewBag.Nombre = nombre;
    ViewBag.Edad = edad;
    return View("Resultado");
}
```

3. **Vista** que muestra los resultados en `Resultado.cshtml`:
```html
<h2>Datos Capturados</h2>
<p>Nombre: @ViewBag.Nombre</p>
<p>Edad: @ViewBag.Edad</p>
```

---

## Probando el Proyecto

1. Ejecuta el proyecto desde **Visual Studio**.
2. Completa el formulario en la página principal (`Index.cshtml`).
3. Envía los datos y observa cómo se muestran en la página de resultado.

---

## Conclusión

- Los proyectos **MVC** en C# facilitan la separación de responsabilidades:
  - **Modelo**: Datos y lógica.
  - **Vista**: Interfaz de usuario.
  - **Controlador**: Gestión del flujo de la aplicación.
- La captura de datos mediante formularios es sencilla y se gestiona directamente desde los controladores.

---

## Próximos pasos

- Añadir validaciones de datos en los formularios.
- Interactuar con bases de datos usando **Entity Framework**.
- Explorar las diferentes formas de enviar y recibir datos en **ASP.NET Core MVC**.
