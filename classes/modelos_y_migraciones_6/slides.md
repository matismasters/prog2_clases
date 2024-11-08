<!-- Helpers de Razor Pages en ASP.NET Core MVC -->

# Helpers de Razor Pages en ASP.NET Core MVC

---

## ¿Qué son los HTML Helpers en Razor?

- **HTML Helpers** son métodos que ayudan a generar HTML en las vistas de **Razor**.
- Simplifican el código HTML y proporcionan una forma fuerte y tipada de crear formularios y otros elementos.
- Ejemplos comunes incluyen `@Html.LabelFor`, `@Html.DropDownListFor`, `@Html.TextBoxFor`, y más.

---

## `@Html.LabelFor`

- Genera un `<label>` asociado a una propiedad de un modelo.
- Útil para formularios fuertemente tipados y genera automáticamente el texto del label basado en la propiedad.

### Ejemplo

```csharp
@model Producto

<div class="form-group">
    @Html.LabelFor(model => model.Nombre, "Nombre del Producto")
    @Html.TextBoxFor(model => model.Nombre, new { @class = "form-control" })
</div>
```

- `LabelFor` genera `<label for="Nombre">Nombre del Producto</label>`.
- La propiedad `Nombre` es tomada del modelo `Producto`.

---

## `@Html.TextBoxFor`

- Genera un `<input type="text">` para una propiedad específica del modelo.
- Es fuertemente tipado y simplifica el enlace de datos entre el formulario y el modelo.

### Ejemplo

```csharp
@model Producto

<div class="form-group">
    @Html.LabelFor(model => model.Precio, "Precio del Producto")
    @Html.TextBoxFor(model => model.Precio, new { @class = "form-control", placeholder = "Ingrese el precio" })
</div>
```

- `TextBoxFor` genera `<input type="text" id="Precio" name="Precio" class="form-control" placeholder="Ingrese el precio">`.
- La propiedad `Precio` en el modelo `Producto` se enlaza automáticamente.

---

## `@Html.PasswordFor`

- Genera un `<input type="password">`, ideal para campos de contraseña.
- Enmascara el texto ingresado para mayor seguridad.

### Ejemplo

```csharp
@model Usuario

<div class="form-group">
    @Html.LabelFor(model => model.Contraseña, "Contraseña")
    @Html.PasswordFor(model => model.Contraseña, new { @class = "form-control" })
</div>
```

- `PasswordFor` genera `<input type="password" id="Contraseña" name="Contraseña" class="form-control">`.
- Utilizado para propiedades de contraseña en el modelo `Usuario`.

---

## `@Html.TextAreaFor`

- Genera un `<textarea>`, útil para campos de texto largos como descripciones.
- Permite añadir atributos personalizados.

### Ejemplo

```csharp
@model Producto

<div class="form-group">
    @Html.LabelFor(model => model.Descripcion, "Descripción del Producto")
    @Html.TextAreaFor(model => model.Descripcion, new { @class = "form-control", rows = "5" })
</div>
```

- `TextAreaFor` genera `<textarea id="Descripcion" name="Descripcion" class="form-control" rows="5"></textarea>`.
- Ideal para campos de entrada de texto extensos.

---

## `@Html.DropDownListFor`

- Genera un `<select>` con opciones predefinidas.
- Permite seleccionar entre valores relacionados, como categorías o tipos.

### Ejemplo

```csharp
@model Producto
@{
    var categorias = new SelectList(ViewBag.Categorias, "Id", "Nombre");
}

<div class="form-group">
    @Html.LabelFor(model => model.CategoriaId, "Categoría")
    @Html.DropDownListFor(model => model.CategoriaId, categorias, "Seleccione una categoría", new { @class = "form-control" })
</div>
```

- `DropDownListFor` genera un `<select>` con opciones.
- `SelectList` de `ViewBag.Categorias` carga las opciones desde el controlador.

---

## `@Html.HiddenFor`

- Genera un `<input type="hidden">`, útil para almacenar datos que no son visibles para el usuario.
- Utilizado para valores que necesitan ser enviados al servidor sin mostrarse.

### Ejemplo

```csharp
@model Producto

@Html.HiddenFor(model => model.Id)
```

- `HiddenFor` genera `<input type="hidden" id="Id" name="Id" value="...">`.
- Ideal para pasar el ID de un producto de manera oculta en el formulario.

---

## `@Html.ValidationMessageFor`

- Muestra mensajes de error de validación para una propiedad específica del modelo.
- Integrado con los `DataAnnotations` en el modelo.

### Ejemplo

```csharp
@model Producto

<div class="form-group">
    @Html.LabelFor(model => model.Nombre)
    @Html.TextBoxFor(model => model.Nombre, new { @class = "form-control" })
    @Html.ValidationMessageFor(model => model.Nombre, "", new { @class = "text-danger" })
</div>
```

- `ValidationMessageFor` genera mensajes de error junto al campo, como `<span class="text-danger">Campo requerido</span>`.

---

## `@Html.CheckBoxFor`

- Genera un `<input type="checkbox">`, útil para opciones booleanas.
- Permite enlazar opciones sí/no en el modelo.

### Ejemplo

```csharp
@model Producto

<div class="form-check">
    @Html.CheckBoxFor(model => model.EnStock, new { @class = "form-check-input" })
    @Html.LabelFor(model => model.EnStock, "En Stock", new { @class = "form-check-label" })
</div>
```

- `CheckBoxFor` genera `<input type="checkbox" id="EnStock" name="EnStock">`.
- Ideal para valores booleanos como `EnStock` en el modelo `Producto`.

---

## `@Html.RadioButtonFor`

- Genera un `<input type="radio">`, útil para seleccionar una opción entre varias.
- Se usa en conjunto con varias opciones.

### Ejemplo

```csharp
@model Producto

<div class="form-check">
    @Html.RadioButtonFor(model => model.Disponibilidad, "Disponible", new { @class = "form-check-input" })
    @Html.Label("Disponible", "Disponible", new { @class = "form-check-label" })

    @Html.RadioButtonFor(model => model.Disponibilidad, "No Disponible", new { @class = "form-check-input" })
    @Html.Label("No Disponible", "No Disponible", new { @class = "form-check-label" })
</div>
```

- `RadioButtonFor` genera opciones `<input type="radio">` con el mismo nombre para valores mutuamente excluyentes.
- En este ejemplo, `Disponibilidad` tiene opciones “Disponible” y “No Disponible”.

---

## Resumen de Helpers de Razor

| Helper                   | Descripción                                     |
| ------------------------ | ----------------------------------------------- |
| **LabelFor**             | Genera un `<label>` para un campo.              |
| **TextBoxFor**           | Genera un campo `<input type="text">`.          |
| **PasswordFor**          | Genera un campo `<input type="password">`.      |
| **TextAreaFor**          | Genera un campo `<textarea>`.                   |
| **DropDownListFor**      | Genera un `<select>` con opciones.              |
| **HiddenFor**            | Genera un campo oculto `<input type="hidden">`. |
| **ValidationMessageFor** | Muestra mensajes de validación.                 |
| **CheckBoxFor**          | Genera un `<input type="checkbox">`.            |
| **RadioButtonFor**       | Genera un `<input type="radio">`.               |

---

## Próximos Pasos

1. Experimentar con cada helper en formularios de Razor.
2. Usar `ValidationMessageFor` junto con `DataAnnotations` en los modelos.
3. Crear formularios completos para el modelo y gestionar validaciones.
