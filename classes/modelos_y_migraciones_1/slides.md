<!-- Introducción a Modelos con Entity Framework en C# -->

# Introducción a Modelos con Entity Framework en C#

---

## ¿Qué es Entity Framework?

- **Entity Framework (EF)** es un ORM (Object-Relational Mapper) en .NET.
- Permite mapear clases en C# a tablas en una base de datos.
- Simplifica el acceso a datos, permitiendo realizar operaciones CRUD sin escribir SQL.

---

## Preparar el proyecto para usar Entity Framework

1. **Instalar Entity Framework Core**:

   - Usa NuGet Package Manager en Visual Studio para instalar:

   ```bash
   Install-Package Microsoft.EntityFrameworkCore.SqlServer
   Install-Package Microsoft.EntityFrameworkCore.Tools
   ```

2. **Configurar DbContext**: Configura la conexión a la base de datos en `Startup.cs` o `Program.cs`.

---

## Crear el Modelo

- Un modelo en Entity Framework es una **clase C#** que representa una tabla en la base de datos.
- Cada propiedad de la clase se convierte en una columna en la tabla.

```csharp
public class Producto {
    public int Id { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
    public int Cantidad { get; set; }
}
```

---

## Configurar DbContext

- El **DbContext** es la clase que permite conectarse y realizar operaciones sobre la base de datos.

```csharp
using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext {
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Producto> Productos { get; set; }
}
```

---

## Registrar DbContext en `Startup.cs`

- En **ASP.NET Core**, se debe configurar el `DbContext` en `Startup.cs` o `Program.cs`.

```csharp
public void ConfigureServices(IServiceCollection services) {
    services.AddDbContext<AppDbContext>(options =>
        options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
}
```

- Define la cadena de conexión en `appsettings.json`.

---

## Configurar la cadena de conexión en `appsettings.json`

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=MiBaseDeDatos;Trusted_Connection=True;"
  }
}
```

---

## Crear la primera migración

- Abre la **Package Manager Console** en Visual Studio.
- Usa el siguiente comando para crear la primera migración:

```bash
Add-Migration Inicial
```

- Esto genera un archivo de migración que representa la estructura inicial del modelo.

---

## Crear la base de datos

- Aplica la migración para crear la base de datos:

```bash
Update-Database
```

- Este comando aplica todas las migraciones pendientes, creando o actualizando las tablas en la base de datos.

---

## Archivos de migración generados

- Las migraciones crean archivos en la carpeta **Migrations**.
- Cada migración incluye:
  - Un método `Up()` que define los cambios a aplicar.
  - Un método `Down()` para revertir esos cambios.

```csharp
public partial class Inicial : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.CreateTable(
            name: "Productos",
            columns: table => new {
                Id = table.Column<int>(nullable: false)
                      .Annotation("SqlServer:Identity", "1, 1"),
                Nombre = table.Column<string>(nullable: true),
                Precio = table.Column<decimal>(nullable: false),
                Cantidad = table.Column<int>(nullable: false)
            },
            constraints: table => {
                table.PrimaryKey("PK_Productos", x => x.Id);
            });
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.DropTable(name: "Productos");
    }
}
```

---

## Agregar restricciones y anotaciones de datos

- Puedes agregar restricciones como **[Required]** y **[MaxLength]** en el modelo para controlar la estructura de la base de datos.

```csharp
using System.ComponentModel.DataAnnotations;

public class Producto {
    public int Id { get; set; }

    [Required]
    [MaxLength(100)]
    public string Nombre { get; set; }

    [Range(0, 10000)]
    public decimal Precio { get; set; }

    public int Cantidad { get; set; }
}
```

---

## Crear una nueva migración después de modificar el modelo

- Después de modificar el modelo, se necesita una nueva migración para aplicar los cambios.

```bash
Add-Migration AgregarRestricciones
```

- Este comando generará un nuevo archivo de migración que reflejará los cambios en la base de datos.

---

## Aplicar la nueva migración

- Usa el siguiente comando para aplicar los cambios a la base de datos:

```bash
Update-Database
```

- Esto actualizará la base de datos de acuerdo con la migración `AgregarRestricciones`.

---

## Ejemplo de archivo de migración para `AgregarRestricciones`

```csharp
public partial class AgregarRestricciones : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.AlterColumn<string>(
            name: "Nombre",
            table: "Productos",
            maxLength: 100,
            nullable: false);

        migrationBuilder.AlterColumn<decimal>(
            name: "Precio",
            table: "Productos",
            type: "decimal(18, 2)",
            nullable: false);
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.AlterColumn<string>(
            name: "Nombre",
            table: "Productos",
            nullable: true);

        migrationBuilder.AlterColumn<decimal>(
            name: "Precio",
            table: "Productos",
            nullable: false);
    }
}
```

---

## Agregar una nueva columna a la tabla

1. Agrega una nueva propiedad al modelo.

```csharp
public class Producto {
    public int Id { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
    public int Cantidad { get; set; }

    public DateTime FechaAgregado { get; set; } // Nueva columna
}
```

2. Crea una nueva migración:

```bash
Add-Migration AgregarFechaAgregado
```

---

## Migración para la nueva columna

- La migración generada incluirá el código para agregar la columna `FechaAgregado`.

```csharp
public partial class AgregarFechaAgregado : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.AddColumn<DateTime>(
            name: "FechaAgregado",
            table: "Productos",
            nullable: false,
            defaultValue: DateTime.Now);
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.DropColumn(name: "FechaAgregado", table: "Productos");
    }
}
```

---

## Eliminar una columna de la tabla

1. Elimina la propiedad del modelo `Producto`.

```csharp
public class Producto {
    public int Id { get; set; }
    public string Nombre { get; set; }
    public decimal Precio { get; set; }
    public int Cantidad { get; set; }
}
```

2. Crea una migración para eliminar la columna.

```bash
Add-Migration EliminarFechaAgregado
```

---

## Migración para eliminar la columna

```csharp
public partial class EliminarFechaAgregado : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.DropColumn(name: "FechaAgregado", table: "Productos");
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.AddColumn<DateTime>(
            name: "FechaAgregado",
            table: "Productos",
            nullable: false,
            defaultValue: DateTime.Now);
    }
}
```

---

## Renombrar una columna

- Renombrar columnas requiere una migración específica.

1. Modifica el nombre de la propiedad en el modelo.

```csharp
public class Producto {
    public int Id { get; set; }
    public string NombreProducto { get; set; } // Nuevo nombre
    public decimal Precio { get; set; }
    public int Cantidad { get; set; }
}
```

2. Genera una nueva migración.

```bash
Add-Migration RenombrarColumnaNombre
```

---

## Migración para renombrar columna

```csharp
public partial class RenombrarColumnaNombre : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.RenameColumn(
            name: "Nombre",
            table: "Productos",
            newName: "NombreProducto");
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.RenameColumn(
            name: "NombreProducto",
            table: "Productos",
            newName: "Nombre");
    }
}
```

---

## Resumen de las operaciones comunes

- **Crear tabla**: Se realiza con la primera migración.
- **Agregar columna**: Agrega una propiedad al modelo y crea una migración.
- **Eliminar columna**: Elimina la propiedad del modelo y crea una migración.
- **Modificar restricciones**: Actualiza anotaciones de datos y crea una migración.

---

## Próximos pasos

1. Explora más anotaciones de datos (`StringLength`, `Column`).
2. Aprende a manejar relaciones entre tablas (uno a muchos, muchos a muchos).
3. Configura `Entity Framework` para trabajar con datos de prueba (seeding).
