# Añadir validaciones de datos en los formularios

---

## ¿Por qué son importantes las validaciones?

- Las validaciones aseguran que los datos ingresados por los usuarios cumplan con los requisitos esperados.
- Nos permiten proteger la integridad de los datos y mejorar la experiencia del usuario.
- En ASP.NET Core MVC, podemos implementar validaciones tanto en el servidor como en el cliente.

---

## Tipos de validaciones

- **Validación del lado del servidor**:
  - Verifica los datos después de que se envían al servidor.
  - Es la validación más segura, pero puede ser menos rápida desde el punto de vista del usuario.
  
- **Validación del lado del cliente**:
  - Se realiza en el navegador antes de enviar los datos al servidor.
  - Proporciona una experiencia de usuario más rápida.

---

## Implementando validaciones en el Modelo

- En **ASP.NET Core MVC**, las validaciones se agregan utilizando **anotaciones de datos** (`Data Annotations`).
- Estas anotaciones permiten definir reglas de validación directamente en las propiedades del modelo.

```csharp
using System.ComponentModel.DataAnnotations;

public class Usuario {
    [Required(ErrorMessage = "El nombre es obligatorio.")]
    public string Nombre { get; set; }

    [Range(1, 100, ErrorMessage = "La edad debe estar entre 1 y 100.")]
    public int Edad { get; set; }
}
```

---

## Explicación de las anotaciones

- **[Required]**: Hace que un campo sea obligatorio.
- **[Range]**: Establece un rango válido para el valor de un campo.
- **ErrorMessage**: Personaliza el mensaje de error que se muestra al usuario.

```csharp
[Required(ErrorMessage = "El nombre es obligatorio.")]
public string Nombre { get; set; }

[Range(1, 100, ErrorMessage = "La edad debe estar entre 1 y 100.")]
public int Edad { get; set; }
```

---

## Controlador con validaciones

- En el controlador, usamos el método `ModelState.IsValid` para verificar si los datos enviados cumplen con las reglas de validación.

```csharp
public class HomeController : Controller {
    public IActionResult Index() {
        return View(new MensajeUsuario());
    }

    [HttpPost]
    public IActionResult CapturarDatos(MensajeUsuario unMensajeUsuario) {
        if (ModelState.IsValid) {
            ViewBag.Nombre = unMensajeUsuario.Nombre;
            ViewBag.Edad = unMensajeUsuario.Edad;
            return View("Resultado", unMensajeUsuario);
        }

        // Si los datos no son válidos, mostramos el formulario nuevamente con los mensajes de error.
        return View("Index", unMensajeUsuario);
    }
}
```

---

## Mostrar mensajes de error en la Vista

- En la vista, usamos el helper `Html.ValidationMessageFor` para mostrar mensajes de error específicos por campo.
- También podemos usar `Html.ValidationSummary` para mostrar un resumen de todos los errores.

```html
<!-- Views/Home/Index.cshtml -->
@model MensajeUsuario

<form method="post" asp-action="CapturarDatos">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" asp-for="Nombre" />
    <span asp-validation-for="Nombre" class="text-danger"></span>

    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad" asp-for="Edad" />
    <span asp-validation-for="Edad" class="text-danger"></span>

    <button type="submit">Enviar</button>
</form>

<div asp-validation-summary="ModelOnly" class="text-danger"></div>
```

---

## Activar validaciones del lado del cliente

- ASP.NET Core MVC también incluye validaciones del lado del cliente usando **jQuery Validation**.
- Para activar la validación en el cliente, debemos incluir las siguientes bibliotecas de JavaScript en la vista.

```html
<!-- Views/Shared/_Layout.cshtml -->
<script src="~/lib/jquery/dist/jquery.min.js"></script>
<script src="~/lib/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="~/lib/jquery-validation-unobtrusive/jquery.validate.unobtrusive.min.js"></script>
```

---

## Resumen del flujo de validación

1. **Modelo**: Define las reglas de validación con anotaciones.
2. **Controlador**: Verifica la validez de los datos con `ModelState.IsValid`.
3. **Vista**: Muestra los mensajes de error usando helpers como `ValidationMessageFor`.
4. **Validación del lado del cliente**: Se activa automáticamente al incluir las bibliotecas necesarias.

---

## Ejemplo completo

### 1. Modelo con validaciones:

```csharp
using System.ComponentModel.DataAnnotations;

public class Usuario {
    [Required(ErrorMessage = "El nombre es obligatorio.")]
    public string Nombre { get; set; }

    [Range(1, 100, ErrorMessage = "La edad debe estar entre 1 y 100.")]
    public int Edad { get; set; }
}
```

### 2. Controlador que verifica las validaciones:

```csharp
public class HomeController : Controller {
    public IActionResult Index() {
        return View(new MensajeUsuario());
    }

    [HttpPost]
    public IActionResult CapturarDatos(MensajeUsuario unMensajeUsuario) {
        if (ModelState.IsValid) {
            ViewBag.Nombre = unMensajeUsuario.Nombre;
            ViewBag.Edad = unMensajeUsuario.Edad;
            return View("Resultado", unMensajeUsuario);
        }
        return View("Index", unMensajeUsuario);
    }
}
```

### 3. Vista con validaciones y mensajes de error:

```html
@model MensajeUsuario

<form method="post" asp-action="CapturarDatos">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" asp-for="Nombre" />
    <span asp-validation-for="Nombre" class="text-danger"></span>

    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad" asp-for="Edad" />
    <span asp-validation-for="Edad" class="text-danger"></span>

    <button type="submit">Enviar</button>
</form>

<div asp-validation-summary="ModelOnly" class="text-danger"></div>
```

---

## Probar la validación

1. **Ejecuta el proyecto** en Visual Studio.
2. **Completa el formulario** en la página principal.
3. **Envíalo sin ingresar todos los datos** para ver los mensajes de error.
4. Si los datos son correctos, se redirigirá a la vista de resultados.

---

## Conclusión

- Las validaciones en **ASP.NET Core MVC** son fáciles de implementar usando **Data Annotations**.
- Podemos manejar la validación tanto en el **servidor** como en el **cliente** para mejorar la experiencia del usuario.
- `ModelState.IsValid` permite que el controlador verifique la validez de los datos antes de procesarlos.

---

## Próximos pasos

- Explorar **validaciones personalizadas** usando anotaciones propias.
- Implementar **validaciones asíncronas**.
- Conectar los formularios con una base de datos usando **Entity Framework**.
