<!-- Crear un Proyecto MVC en Visual Studio 2022 y Configurar Entity Framework -->
# Crear un Proyecto MVC en Visual Studio 2022 y Configurar Entity Framework

---

## Paso 1: Instalar SQL Server Express y SQL Server Management Studio

### Descargar SQL Server Express

1. Ve al sitio oficial de **Microsoft SQL Server Express**.
2. Selecciona la versión de **SQL Server Express** y descárgala.
3. Durante la instalación:
   - Selecciona **Instalación Básica** para una configuración rápida.
   - Completa la instalación y toma nota del **nombre de la instancia** (por ejemplo, `SQLEXPRESS`).

### Descargar SQL Server Management Studio (SSMS)

1. Ve al sitio oficial de **Microsoft SQL Server Management Studio (SSMS)**.
2. Descarga e instala SSMS.
3. Abre **SSMS** y conéctate a tu instancia de SQL Server Express (`localhost\SQLEXPRESS` si usaste la configuración predeterminada).

---

## Paso 2: Crear un Proyecto de MVC en Visual Studio 2022

1. Abre **Visual Studio 2022**.
2. Ve a **Archivo > Nuevo > Proyecto**.
3. Selecciona la plantilla de **ASP.NET Core Web App (Model-View-Controller)**.
4. Haz clic en **Siguiente**.

---

## Configuración del Proyecto MVC

1. Nombra el proyecto y elige la ubicación de guardado.
2. Selecciona **.NET 8.0** como Framework.
3. Asegúrate de que **Enable Docker** y **Enable OpenAPI Support** estén desmarcados.
4. Desmarca **Configure for HTTPS** para habilitar HTTPS.
5. Haz clic en **Crear** para generar el proyecto.

---

## **Instalar Entity Framework Core**:

1. Abre **Package Manager Console** en Visual Studio:
   - Ve a **Herramientas > Administrador de paquetes NuGet > Consola del Administrador de paquetes**.

2. Ejecuta los siguientes comandos para instalar Entity Framework Core:

   ```bash
   Install-Package Microsoft.EntityFrameworkCore.SqlServer
   Install-Package Microsoft.EntityFrameworkCore.Tools
   ```

---

## Paso 3: Crear el `DbContext` y el Modelo de Datos

### Crear la Carpeta `Data`

1. Haz clic derecho en el proyecto y selecciona **Agregar > Nueva Carpeta**.
2. Nombra la carpeta como **Data**.

### Crear la Clase `AppDbContext`

1. Haz clic derecho en la carpeta **Data**.
2. Selecciona **Agregar > Clase…** y nómbrala `AppDbContext`.
3. Define `AppDbContext` usando el código siguiente:

   ```csharp
   using Microsoft.EntityFrameworkCore;
   using TuProyecto.Models;  // Asegúrate de cambiar "TuProyecto" por el nombre de tu proyecto

   namespace TuProyecto.Data
   {
       public class AppDbContext : DbContext
       {
           public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

           // Define el DbSet para tu modelo
           public DbSet<Producto> Productos { get; set; }
       }
   }
   ```

---

## Paso 4: Crear el Modelo `Producto`

1. Crea una carpeta llamada **Models** en el proyecto (si no existe).
2. Haz clic derecho en la carpeta **Models**.
3. Selecciona **Agregar > Clase…** y nombra la clase como `Producto`.
4. Define el modelo `Producto`:

   ```csharp
   namespace TuProyecto.Models  // Cambia "TuProyecto" por el nombre de tu proyecto
   {
       public class Producto
       {
           public int Id { get; set; }
           public string Nombre { get; set; }
           public decimal Precio { get; set; }
       }
   }
   ```

---

## Paso 5: Configurar el `DbContext` en `Program.cs`

1. Abre `Program.cs`.
2. Agrega el `DbContext` para que use SQL Server con el connection string de `appsettings.json`.

   ```csharp
   using Microsoft.EntityFrameworkCore;
   using TuProyecto.Data;  // Cambia "TuProyecto" por el nombre de tu proyecto

   var builder = WebApplication.CreateBuilder(args);

   // Configura el DbContext con SQL Server
   builder.Services.AddDbContext<AppDbContext>(options =>
       options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

   builder.Services.AddControllersWithViews();

   var app = builder.Build();

   if (!app.Environment.IsDevelopment())
   {
       app.UseExceptionHandler("/Home/Error");
       app.UseHsts();
   }

   app.UseHttpsRedirection();
   app.UseStaticFiles();
   app.UseRouting();
   app.UseAuthorization();

   app.MapControllerRoute(
       name: "default",
       pattern: "{controller=Home}/{action=Index}/{id?}");

   app.Run();
   ```

---

## Paso 6: Configurar el Connection String en `appsettings.json`

1. Abre `appsettings.json`.
2. Agrega el connection string de tu base de datos en la sección `ConnectionStrings`:

   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=localhost\\SQLEXPRESS;Database=MiBaseDeDatos;Trusted_Connection=True;TrustServerCertificate=True;"
     },
     "Logging": {
       "LogLevel": {
         "Default": "Information",
         "Microsoft.AspNetCore": "Warning"
       }
     },
     "AllowedHosts": "*"
   }
   ```

   - Cambia `Server=localhost\\SQLEXPRESS` al nombre de tu servidor e instancia si es necesario.
   - Cambia `MiBaseDeDatos` al nombre de la base de datos que deseas usar o crear.

---

## Paso 7: Crear la Primera Migración

1. Abre **Package Manager Console** en Visual Studio:
   - Ve a **Herramientas > Administrador de paquetes NuGet > Consola del Administrador de paquetes**.
2. Ejecuta el comando para crear una migración inicial:

   ```bash
   Add-Migration InitialCreate
   ```

3. Luego, ejecuta el comando para aplicar la migración a la base de datos:

   ```bash
   Update-Database
   ```

---

## Verificar la Migración en SQL Server Management Studio (SSMS)

1. Abre **SQL Server Management Studio (SSMS)**.
2. Conéctate a tu instancia de SQL Server (por ejemplo, `localhost\SQLEXPRESS`).
3. Expande **Databases** y selecciona la base de datos especificada en `appsettings.json`.
4. Verifica que la tabla `Productos` esté creada en la base de datos.

---

## Resumen

- **Instalar SQL Server Express** y **SQL Server Management Studio**.
- Crear un **proyecto MVC** en Visual Studio 2022.
- Configurar `DbContext` y crear el modelo `Producto`.
- Añadir el connection string en `appsettings.json`.
- Crear la migración inicial y verificar la base de datos en SSMS.

---

## Próximos pasos

1. Crear controladores y vistas para `Producto`.
2. Explorar consultas con Entity Framework.
3. Implementar validaciones en el modelo.
