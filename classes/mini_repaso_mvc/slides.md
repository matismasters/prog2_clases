<!-- Diapositiva 1 -->
# Patrón MVC en C# y Entity Framework

### ¿Qué repasaremos hoy?
- **Controladoras**
- **Acciones**
- **Vistas**
- Interacción entre estos componentes
- Cómo planificar y crear un sitio web con MVC

---

<!-- Diapositiva 2 -->
# ¿Qué es el patrón MVC?

### Componentes principales:
1. **Modelos**: Representan los datos y la lógica de negocio.
2. **Vistas**: Generan lo que el usuario ve en el navegador.
3. **Controladoras**: Actúan como puente entre el usuario y la lógica de la aplicación.

---

<!-- Diapositiva 3 -->
# ¿Cómo funciona MVC?

1. El usuario realiza una **solicitud** (por ejemplo, una URL o formulario).
2. La **controladora** recibe la solicitud, ejecuta una **acción** y decide qué hacer.
3. La acción puede interactuar con un **modelo** para obtener o procesar datos.
4. Finalmente, la acción pasa los datos a una **vista**, que genera una respuesta para el usuario.

---

<!-- Diapositiva 4 -->
# Ejemplo: Listar productos

### Flujo típico
1. El usuario navega a `/Productos/Index`.
2. La acción `Index` de la controladora consulta el modelo para obtener datos.
3. La acción envía los datos a la vista, que muestra una tabla.

---

<!-- Diapositiva 5 -->
# Código de ejemplo: Controladora
### `ProductosController`
~~~csharp
public class ProductosController : Controller
{
    private readonly AppDbContext _context;

    public ProductosController(AppDbContext context)
    {
        _context = context;
    }

    public IActionResult Index()
    {
        var productos = _context.Productos.ToList();
        return View(productos); // Envía los datos a la vista
    }
}
~~~

---

<!-- Diapositiva 6 -->
# Código de ejemplo: Vista
### `Index.cshtml`
~~~html
<table>
    @foreach (var producto in Model)
    {
        <tr>
            <td>@producto.Nombre</td>
            <td>@producto.Precio</td>
        </tr>
    }
</table>
~~~

---

<!-- Diapositiva 7 -->
# Ejemplo: Editar un producto

### Flujo típico
1. El usuario hace clic en "Editar".
2. La acción `Edit` de la controladora muestra un formulario.
3. El usuario guarda cambios, y la acción guarda los datos usando el modelo.

---

<!-- Diapositiva 8 -->
# Analogía: Un restaurante

- La **controladora** es como el camarero:
  - Escucha al cliente, lleva el pedido a la cocina, y regresa con el plato.
- La **vista** es el menú y el plato servido:
  - Es lo que el cliente ve y consume.
- El **modelo** es la receta y los ingredientes:
  - Contiene los datos y realiza el trabajo necesario para preparar el plato.

---

<!-- Diapositiva 9 -->
# Conceptos clave a reforzar

1. **Rutas**: Cómo las URLs se mapean a controladoras y acciones.
2. **Vinculación de datos**: Cómo los datos fluyen entre vistas y controladoras.
3. **Parámetros en acciones**: Cómo manejar datos enviados por el usuario.

---

<!-- Diapositiva 10 -->
# Discusión en clase

1. ¿Qué desafíos encontraron al conectar las vistas con los datos?
2. ¿Qué conceptos necesitan más práctica?
3. ¿Qué mejoras podemos implementar en nuestro CRUD?

---

<!-- Diapositiva 11 -->
# Próximos pasos

- Practicar con ejemplos más complejos.
- Introducir validaciones en formularios.
- Explorar vistas parciales y AJAX para mejorar la experiencia del usuario.
