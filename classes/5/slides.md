# Programación 2  
## Clase 5: Introducción a ASP.NET Core con Razor Pages  
### Creación de un Proyecto Web y Conceptos Básicos de Programación Orientada a Objetos  

---

## Objetivos de la Clase

- Crear un nuevo proyecto web utilizando ASP.NET Core con Razor Pages.
- Entender los conceptos básicos de la programación orientada a objetos (POO) en C#.
- Utilizar variables, estructuras de control, contadores y listas en Razor Pages.
- Implementar ejemplos prácticos en un proyecto de Razor Pages.

---

## Parte 1: Creación de un Proyecto ASP.NET Core Web App (Razor Pages)

### Creación del Proyecto

1. Abrir **Visual Studio 2022**.
2. Seleccionar **Crear un nuevo proyecto**.
3. Elegir **Aplicación web ASP.NET Core**.
4. Configurar el nombre como `RazorPagesIntro` y seleccionar la ubicación del proyecto.
5. En la pantalla de configuración:
   - Seleccionar **.NET Core** y la versión más reciente de **ASP.NET Core**.
   - Elegir el tipo de proyecto como **Aplicación Web (Model-View-Controller)**.
   - Desmarcar **Configurar para HTTPS** (opcional para desarrollo local).
6. Hacer clic en **Crear**.

---

---

## Notación `@page`

### ¿Qué es `@page`?

- `@page` es una directiva de Razor que convierte un archivo `.cshtml` en una acción de controlador MVC.
- Hace que la página sea capaz de responder directamente a las solicitudes HTTP.
- Define el punto de entrada para la ejecución de la página Razor.

```csharp
@page
@model RazorPagesIntro.Pages.IndexModel

<h2>Bienvenido a mi página Razor</h2>
```

### Explicación

- Cuando un archivo Razor contiene `@page`, el archivo puede manejar solicitudes HTTP directamente sin necesidad de un controlador adicional.
- La URL de la página se basa en la ubicación del archivo `.cshtml` dentro del proyecto.

---

## Notación `@model`

### ¿Qué es `@model`?

- `@model` se utiliza para definir el tipo de modelo que se utilizará en la página Razor.
- Proporciona acceso a los datos del modelo en la vista.

```csharp
@page
@model RazorPagesIntro.Pages.IndexModel

<p>@Model.MensajeDeBienvenida</p>
```

### Explicación

- `@model` especifica la clase que proporciona los datos y la lógica de negocio para la página Razor.
- Permite el uso de `Model` para acceder a las propiedades y métodos definidos en la clase del modelo (`IndexModel` en este caso).

---

## Notación `@functions`

### ¿Qué es `@functions`?

- `@functions` permite definir métodos y propiedades C# directamente dentro del archivo `.cshtml`.
- Útil para encapsular lógica simple que se utiliza únicamente en la vista.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploFuncionesModel

@functions {
    public string ObtenerMensaje()
    {
        return "Hola desde una función!";
    }
}

<p>@ObtenerMensaje()</p>
```

### Explicación

- Las funciones definidas dentro de `@functions` son accesibles directamente en la página Razor.
- Se utilizan para encapsular lógica que no requiere estar en el archivo del modelo.

---

## Notación `@using`

### ¿Qué es `@using`?

- `@using` se utiliza para incluir espacios de nombres en el archivo `.cshtml`.
- Similar a la declaración `using` en archivos C#, permite el acceso a clases y métodos de otros espacios de nombres.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploUsingModel
@using System.Text

<p>@Model.GenerarTextoFormateado()</p>
```

### Explicación

- Permite utilizar clases de otros espacios de nombres sin necesidad de especificar el espacio de nombres completo.
- Mejora la legibilidad y reduce la necesidad de repetición de código.

---

## Notación `@inject`

### ¿Qué es `@inject`?

- `@inject` permite inyectar servicios directamente en la página Razor.
- Facilita el acceso a servicios registrados en el contenedor de dependencias de ASP.NET Core.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploInjectModel
@inject ILogger<IndexModel> Logger

<p>@DateTime.Now.ToString("F")</p>
```

### Explicación

- `@inject` proporciona una forma simple de acceder a servicios, como `ILogger` o servicios personalizados, en la página Razor.
- La inyección de dependencias es una característica clave de ASP.NET Core para administrar servicios de manera eficiente.

---

## Notación `@*...*@`

### ¿Qué es `@*...*@`?

- `@*...*@` se utiliza para escribir comentarios en Razor.
- Los comentarios de Razor no se procesan en el HTML final y no se envían al cliente.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploComentariosModel

@* Este es un comentario en Razor *@
<p>Este texto será visible en la página, pero el comentario no lo será.</p>
```

### Explicación

- A diferencia de los comentarios HTML (`<!-- ... -->`), los comentarios de Razor son útiles para dejar notas o descripciones sin incluir contenido adicional en el HTML resultante.
- Utilizados principalmente para documentar código dentro del archivo `.cshtml`.

---

## Notación `@*...*@`

### ¿Qué es `@helper`?

- `@helper` permite definir métodos reutilizables dentro de la vista Razor.
- Facilita la creación de bloques de código reutilizables sin necesidad de una clase separada.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploHelperModel

@helper MostrarMensaje(string mensaje)
{
    <div class="mensaje">@mensaje</div>
}

@MostrarMensaje("Este es un mensaje usando un helper Razor")
```

### Explicación

- `@helper` se utiliza para crear métodos de ayuda personalizados que se pueden utilizar en la vista Razor.
- Los métodos definidos con `@helper` son reutilizables y pueden ayudar a evitar la duplicación de código.

---

## Resumen de Notaciones Razor

- **`@page`**: Convierte el archivo `.cshtml` en una acción de controlador.
- **`@model`**: Define el modelo utilizado en la página.
- **`@functions`**: Permite definir métodos y propiedades dentro de la vista.
- **`@using`**: Incluye espacios de nombres en el archivo Razor.
- **`@inject`**: Inyecta servicios directamente en la página Razor.
- **`@*...*@`**: Comentarios que no se renderizan en el HTML.
- **`@helper`**: Crea métodos reutilizables en Razor.

---

## Introducción a Razor Pages: Sintaxis y Uso de Variables

### Definición de Variables en Razor Pages

En Razor Pages, puedes definir variables dentro del archivo `.cshtml` o en el archivo del modelo de la página (`.cshtml.cs`).

```csharp
@page
@model RazorPagesIntro.Pages.IndexModel
@{
    var mensaje = "Bienvenido a Razor Pages!";
    int contador = 0;
}
<h2>@mensaje</h2>
<p>Contador inicial: @contador</p>
```

---

### Ejercicio: Definir y Mostrar Variables

1. Crea una nueva página Razor llamada `EjemploVariables`.
2. Define variables de diferentes tipos (`string`, `int`, `bool`, `double`).
3. Muestra el valor de cada variable en la página.

### Instrucción

- Agrega código Razor para declarar variables y utilizarlas en la vista para mostrar sus valores.

---

## Estructuras de Control en Razor Pages

### Uso de Condicionales (`if`, `else if`, `else`)

Puedes usar estructuras de control como condicionales directamente en el archivo `.cshtml`.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploCondicionalesModel
@{
    int edad = 18;
    string mensaje;
    if (edad >= 18)
    {
        mensaje = "Eres mayor de edad.";
    }
    else
    {
        mensaje = "Eres menor de edad.";
    }
}
<p>@mensaje</p>
```

---

### Ejercicio: Condicionales en Razor Pages

- Crea una página Razor que determine si un número ingresado por el usuario es positivo, negativo o cero.

### Instrucción

- Utiliza `if`, `else if` y `else` para mostrar el resultado.

---

## Contadores y Ciclos en Razor Pages

### Uso de un Contador con un Bucle `for`

```csharp
@page
@model RazorPagesIntro.Pages.EjemploCiclosModel
@{
    int contador = 0;
    for (int i = 1; i <= 5; i++)
    {
        contador += i;
    }
}
<p>El valor del contador después del bucle es: @contador</p>
```

### Uso de un Bucle `while`

```csharp
@page
@model RazorPagesIntro.Pages.EjemploCiclosModel
@{
    int contador = 0;
    int i = 1;
    while (i <= 5)
    {
        contador += i;
        i++;
    }
}
<p>El valor del contador después del bucle while es: @contador</p>
```

---

### Ejercicio: Uso de Contadores y Bucles

1. Crea una página Razor que imprima los primeros 10 números pares utilizando un bucle `for`.
2. Crea una página Razor que imprima los primeros 10 números impares utilizando un bucle `while`.

### Instrucción

- Implementa los bucles dentro del archivo `.cshtml` y muestra los resultados en la vista.

---

## Uso de Listas en Razor Pages

### Declaración y Uso de Listas

Puedes utilizar listas para almacenar y manipular datos en Razor Pages.

```csharp
@page
@model RazorPagesIntro.Pages.EjemploListasModel
@{
    List<string> frutas = new List<string> { "Manzana", "Banana", "Cereza" };
}
<h3>Lista de Frutas:</h3>
<ul>
    @foreach (var fruta in frutas)
    {
        <li>@fruta</li>
    }
</ul>
```

### Agregar y Remover Elementos de una Lista

```csharp
@page
@model RazorPagesIntro.Pages.EjemploListasModel
@{
    List<int> numeros = new List<int> { 1, 2, 3 };
    numeros.Add(4);
    numeros.Remove(2);
}
<p>Números después de modificar la lista:</p>
<ul>
    @foreach (var numero in numeros)
    {
        <li>@numero</li>
    }
</ul>
```

---

### Ejercicio: Manipulación de Listas en Razor Pages

1. Crea una lista de nombres de estudiantes.
2. Muestra la lista inicial y luego agrega un nuevo nombre y elimina uno existente.

### Instrucción

- Utiliza métodos de la clase `List` como `Add` y `Remove` para modificar la lista y mostrar los cambios en la vista.

---

## Ejercicio Práctico
### Clase 4: Creación de Páginas y Navegación en Razor Pages

---

## Objetivos de la Clase

- Aprender a crear una nueva página en Razor Pages.
- Agregar un enlace de navegación para la nueva página.
- Comprender cómo funcionan las vistas y los modelos de Razor Pages.

---

## Paso 1: Crear una Nueva Página Razor

### Abrir el Proyecto en Visual Studio 2022

- Abre tu proyecto de Razor Pages en Visual Studio.

### Agregar una Nueva Página Razor

1. Haz clic derecho en la carpeta `Pages` en el **Explorador de Soluciones**.
2. Selecciona **Agregar** > **Nuevo Elemento...**.
3. En el cuadro de diálogo **Agregar Nuevo Elemento**, selecciona **Página Razor**.
4. Elige la plantilla **Página Razor** o **Página Razor con Entity Framework (CRUD)**.
5. Escribe un nombre para tu nueva página, por ejemplo, `About`.
6. Haz clic en **Agregar**.

---

## Editar la Nueva Página Razor

### Contenido de `About.cshtml`

```csharp
@page
@model RazorPagesIntro.Pages.AboutModel

<h2>About Us</h2>
<p>Welcome to the About page of our application.</p>
```

### Modificar el Modelo de Página (Opcional)

- Si necesitas agregar lógica o manejo de datos, abre `About.cshtml.cs` y modifica el método `OnGet` o agrega métodos adicionales según sea necesario.

---

## Paso 2: Agregar un Enlace a la Nueva Página en la Navegación

### Abrir el Archivo de Diseño Compartido

- Los enlaces de navegación suelen estar ubicados en el archivo `_Layout.cshtml`, que se encuentra en la carpeta `Pages/Shared`.
- Abre `Pages/Shared/_Layout.cshtml`.

### Agregar un Enlace a la Nueva Página

```html
<nav class="navbar navbar-expand-sm navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" asp-area="" asp-page="/Index">MyApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" asp-area="" asp-page="/Index">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" asp-area="" asp-page="/About">About</a> <!-- Enlace a la nueva página -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" asp-area="" asp-page="/Privacy">Privacy</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
```

### Guardar los Cambios

- Guarda el archivo `_Layout.cshtml` después de agregar el nuevo enlace.

---

## Paso 3: Probar los Cambios

### Ejecutar la Aplicación

- Presiona **F5** o haz clic en el botón **Ejecutar** en Visual Studio para iniciar tu aplicación.

### Navegar a la Nueva Página

- Una vez que la aplicación esté en ejecución, utiliza el menú de navegación para hacer clic en el enlace **About**.
- Verifica que la nueva página se muestre correctamente.

---

## Resumen de la Clase

- Creación y manipulación de variables en Razor Pages.
- Uso de estructuras de control (`if`, `else if`, `else`) para control de flujo.
- Implementación de contadores y bucles (`for`, `while`) en Razor Pages.
- Manejo de listas para almacenar y manipular datos dinámicos.
- Aprendimos a crear una nueva página en Razor Pages.
- Agregamos un enlace de navegación para la nueva página.
- Discutimos cómo funcionan las vistas y los modelos en Razor Pages.


---

## Próxima Clase

### Continuación con Programación Orientada a Objetos y Razor Pages

- **Herencia y Polimorfismo**: Cómo aplicar estos conceptos en ASP.NET Core.
- **Manejo Avanzado de Datos**: Filtrado y manipulación de listas y colecciones.
- **Trabajando con Modelos y Vistas**: Interacción de datos entre Razor Pages y el modelo.

### ¡Gracias por su atención!
