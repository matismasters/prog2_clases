<!-- MigrationBuilder en Entity Framework -->

# MigrationBuilder en Entity Framework

---

## ¿Qué es el `MigrationBuilder`?

- **`MigrationBuilder`** es una clase en **Entity Framework Core** que se utiliza en las migraciones para construir y modificar la base de datos.
- Permite crear y modificar tablas, columnas, índices, relaciones, y otros elementos de la base de datos.

---

## Ubicación del `MigrationBuilder`

- `MigrationBuilder` se encuentra en los archivos de migración generados por **Entity Framework** en la carpeta `Migrations`.
- Cada migración contiene métodos `Up()` y `Down()`, que usan `MigrationBuilder` para aplicar o revertir cambios.

```csharp
public partial class InitialMigration : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        // Aquí van los comandos para aplicar la migración
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        // Aquí van los comandos para revertir la migración
    }
}
```

---

## Crear tablas: `CreateTable`

- La función **`CreateTable`** crea una nueva tabla en la base de datos.
- Parámetros:
  - `name` (string): Nombre de la tabla.
  - `columns` (Action<TableBuilder>): Configuración de las columnas.
  - `constraints` (Action<TableBuilder>): Configuración de llaves y restricciones.

```csharp
migrationBuilder.CreateTable(
    name: "Productos",
    columns: table => new {
        Id = table.Column<int>(nullable: false).Annotation("SqlServer:Identity", "1, 1"),
        Nombre = table.Column<string>(nullable: false),
        Precio = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
    },
    constraints: table => {
        table.PrimaryKey("PK_Productos", x => x.Id);
    }
);
```

---

## Eliminar tablas: `DropTable`

- La función **`DropTable`** elimina una tabla de la base de datos.
- Parámetro:
  - `name` (string): Nombre de la tabla a eliminar.

```csharp
migrationBuilder.DropTable(name: "Productos");
```

- Esto elimina completamente la tabla y todos sus datos.

---

## Crear columnas: `AddColumn`

- **`AddColumn`** agrega una columna a una tabla existente.
- Parámetros:
  - `type` (string): Tipo de datos de la columna.
  - `name` (string): Nombre de la columna.
  - `table` (string): Nombre de la tabla a la que se agrega la columna.
  - `nullable` (bool): Indica si la columna permite valores nulos.

```csharp
migrationBuilder.AddColumn<string>(
    name: "Descripcion",
    table: "Productos",
    nullable: true
);
```

---

## Eliminar columnas: `DropColumn`

- **`DropColumn`** elimina una columna de una tabla existente.
- Parámetros:
  - `name` (string): Nombre de la columna a eliminar.
  - `table` (string): Nombre de la tabla que contiene la columna.

```csharp
migrationBuilder.DropColumn(
    name: "Descripcion",
    table: "Productos"
);
```

- Este comando elimina la columna y sus datos.

---

## Modificar columnas: `AlterColumn`

- **`AlterColumn`** modifica una columna existente en una tabla.
- Parámetros:
  - `name` (string): Nombre de la columna a modificar.
  - `table` (string): Nombre de la tabla.
  - `nullable` (bool): Indica si la columna permite valores nulos.

```csharp
migrationBuilder.AlterColumn<decimal>(
    name: "Precio",
    table: "Productos",
    type: "decimal(18, 2)",
    nullable: false
);
```

- Este comando cambia las propiedades de la columna `Precio` en la tabla `Productos`.

---

## Renombrar columnas: `RenameColumn`

- **`RenameColumn`** renombra una columna en una tabla existente.
- Parámetros:
  - `name` (string): Nombre actual de la columna.
  - `table` (string): Nombre de la tabla.
  - `newName` (string): Nuevo nombre de la columna.

```csharp
migrationBuilder.RenameColumn(
    name: "Nombre",
    table: "Productos",
    newName: "NombreProducto"
);
```

- Este comando cambia el nombre de la columna `Nombre` a `NombreProducto`.

---

## Crear índices: `CreateIndex`

- **`CreateIndex`** crea un índice en una o varias columnas de una tabla.
- Parámetros:
  - `name` (string): Nombre del índice.
  - `table` (string): Nombre de la tabla.
  - `columns` (string[]): Lista de nombres de columnas en el índice.
  - `unique` (bool): Si el índice es único (opcional).

```csharp
migrationBuilder.CreateIndex(
    name: "IX_Productos_Nombre",
    table: "Productos",
    column: "Nombre"
);
```

---

## Eliminar índices: `DropIndex`

- **`DropIndex`** elimina un índice de una tabla.
- Parámetros:
  - `name` (string): Nombre del índice.
  - `table` (string): Nombre de la tabla que contiene el índice.

```csharp
migrationBuilder.DropIndex(
    name: "IX_Productos_Nombre",
    table: "Productos"
);
```

- Este comando elimina el índice `IX_Productos_Nombre`.

---

## Renombrar tablas: `RenameTable`

- **`RenameTable`** renombra una tabla en la base de datos.
- Parámetros:
  - `name` (string): Nombre actual de la tabla.
  - `newName` (string): Nuevo nombre de la tabla.

```csharp
migrationBuilder.RenameTable(
    name: "Productos",
    newName: "InventarioProductos"
);
```

- Este comando cambia el nombre de la tabla `Productos` a `InventarioProductos`.

---

## Agregar llaves foráneas: `AddForeignKey`

- **`AddForeignKey`** agrega una llave foránea entre dos tablas.
- Parámetros:
  - `name` (string): Nombre de la llave foránea.
  - `table` (string): Tabla que contiene la clave foránea.
  - `column` (string): Columna de la clave foránea.
  - `principalTable` (string): Tabla de referencia.
  - `principalColumn` (string): Columna de referencia.

```csharp
migrationBuilder.AddForeignKey(
    name: "FK_Productos_Categorias",
    table: "Productos",
    column: "CategoriaId",
    principalTable: "Categorias",
    principalColumn: "Id"
);
```

- Esto establece una relación entre `Productos` y `Categorias`.

---

## Eliminar llaves foráneas: `DropForeignKey`

- **`DropForeignKey`** elimina una relación de llave foránea entre dos tablas.
- Parámetros:
  - `name` (string): Nombre de la llave foránea.
  - `table` (string): Tabla que contiene la llave foránea.

```csharp
migrationBuilder.DropForeignKey(
    name: "FK_Productos_Categorias",
    table: "Productos"
);
```

---

## Cambiar el nombre de un índice: `RenameIndex`

- **`RenameIndex`** renombra un índice en una tabla.
- Parámetros:
  - `name` (string): Nombre actual del índice.
  - `newName` (string): Nuevo nombre del índice.

```csharp
migrationBuilder.RenameIndex(
    name: "IX_Productos_Nombre",
    newName: "IX_Productos_NombreProducto"
);
```

---

## Crear llaves primarias: `AddPrimaryKey`

- **`AddPrimaryKey`** agrega una llave primaria a una columna.
- Parámetros:
  - `name` (string): Nombre de la llave primaria.
  - `table` (string): Tabla de la llave primaria.
  - `column` (string): Columna de la llave primaria.

```csharp
migrationBuilder.AddPrimaryKey(
    name: "PK_Productos",
    table: "Productos",
    column: "Id"
);
```

---

## Eliminar llaves primarias: `DropPrimaryKey`

- **`DropPrimaryKey`** elimina una llave primaria de una tabla.
- Parámetros:
  - `name` (string): Nombre de la llave primaria.
  - `table` (string): Tabla que contiene la llave primaria.

```csharp
migrationBuilder.DropPrimaryKey(
    name: "PK_Productos",
    table: "Productos"
);
```

---

## Resumen de `MigrationBuilder`

- **CreateTable** / **DropTable**: Crear y eliminar tablas.
- **AddColumn** / **DropColumn** / **AlterColumn**: Manejo de columnas.
- **CreateIndex** / **DropIndex** / **RenameIndex**: Manejo de índices.
- **AddForeignKey** / **DropForeignKey**: Relación entre tablas.
- **AddPrimaryKey** / **DropPrimaryKey**: Llaves primarias.
- `MigrationBuilder` proporciona una API completa para manipular bases de datos en migraciones.

---

## Ejemplo final: Migración completa

```csharp
public partial class EjemploCompleto : Migration {
    protected override void Up(MigrationBuilder migrationBuilder) {
        migrationBuilder.CreateTable(
            name: "Productos",
            columns: table => new {
                Id = table.Column<int>(nullable: false).Annotation("SqlServer:Identity", "1, 1"),
                Nombre = table.Column<string>(nullable: false),
                Precio = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
            },
            constraints: table => {
                table.PrimaryKey("PK_Productos", x => x.Id);
            });

        migrationBuilder.CreateIndex(
            name: "IX_Productos_Nombre",
            table: "Productos",
            column: "Nombre"
        );
    }

    protected override void Down(MigrationBuilder migrationBuilder) {
        migrationBuilder.DropTable(name: "Productos");
    }
}
```

---

## Próximos pasos

1. Practicar creando, modificando y eliminando tablas con `MigrationBuilder`.
2. Explorar cómo manejar relaciones más complejas en modelos de datos.
3. Configurar migraciones automáticas en entornos de prueba.
