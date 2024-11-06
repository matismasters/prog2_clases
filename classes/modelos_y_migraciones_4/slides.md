<!-- Relaciones entre Modelos en MVC con Entity Framework -->
# Relaciones entre Modelos en MVC con Entity Framework

---

## Introducción a las Relaciones entre Modelos

- En **Entity Framework**, podemos modelar relaciones entre entidades para representar asociaciones.
- Ejemplos:
  - Una **Nave Espacial** tiene muchos **Tripulantes**.
  - Un **Planeta** tiene varias **Estaciones Espaciales**.
  - Un **Tripulante** puede participar en muchas **Misiones**.

---

## Tipos de Relaciones en Entity Framework

1. **Uno a Uno (1:1)**: Una entidad está asociada con exactamente otra entidad.
2. **Uno a Muchos (1:N)**: Una entidad está asociada con varias otras entidades.
3. **Muchos a Muchos (M:N)**: Varias entidades están asociadas con varias otras entidades.

---

## Relación Uno a Uno (1:1): Nave y Comandante

En nuestro ejemplo de ciencia ficción:
- **Una Nave Espacial tiene un Comandante**, y cada Comandante comanda una Nave Espacial.

### Clave Foránea en una Relación 1:1

1. Creamos los modelos `Nave` y `Comandante`.
2. Usamos una clave foránea en `Nave` para apuntar al `Comandante`.

---

### Modelo de Ejemplo: Nave y Comandante

~~~csharp
public class Nave
{
    public int NaveId { get; set; }
    public string Nombre { get; set; }
    public Comandante Comandante { get; set; }
    public int ComandanteId { get; set; } // Clave foránea
}

public class Comandante
{
    public int ComandanteId { get; set; }
    public string Nombre { get; set; }
    public Nave Nave { get; set; } // Relación inversa
}
~~~

- En `Nave`, la propiedad `ComandanteId` es la **clave foránea** que apunta a `Comandante`.
- `Comandante` tiene una referencia inversa a `Nave`.

---

## Relación Uno a Muchos (1:N): Nave y Tripulantes

- Una **Nave Espacial** tiene varios **Tripulantes**.
- Cada **Tripulante** solo puede pertenecer a una **Nave Espacial**.

### Clave Foránea en una Relación 1:N

1. Definimos una colección de `Tripulantes` en el modelo `Nave`.
2. En este ejemplo usamos **List** en lugar de **ICollection**.

---

### Modelo de Ejemplo: Nave y Tripulantes

~~~csharp
public class Nave
{
    public int NaveId { get; set; }
    public string Nombre { get; set; }
    public List<Tripulante> Tripulantes { get; set; }
}

public class Tripulante
{
    public int TripulanteId { get; set; }
    public string Nombre { get; set; }
    public int NaveId { get; set; } // Clave foránea
    public Nave Nave { get; set; }   // Relación inversa
}
~~~

- `Tripulante` contiene la **clave foránea** `NaveId` que apunta a `Nave`.
- `Nave` contiene una lista de `Tripulantes`, representando la relación de uno a muchos.

---

## Relación Muchos a Muchos (M:N): Tripulantes y Misiones

- Un **Tripulante** puede participar en varias **Misiones**.
- Una **Misión** puede incluir varios **Tripulantes**.

### Tabla de Unión para Relación M:N

Para una relación muchos a muchos:
1. Creamos una entidad intermedia `TripulanteMision` para representar la relación.
2. `TripulanteMision` tendrá claves foráneas para ambos modelos.

---

### Modelo de Ejemplo: Tripulantes y Misiones

~~~csharp
public class Tripulante
{
    public int TripulanteId { get; set; }
    public string Nombre { get; set; }
    public List<TripulanteMision> TripulanteMisiones { get; set; }
}

public class Mision
{
    public int MisionId { get; set; }
    public string Nombre { get; set; }
    public List<TripulanteMision> TripulanteMisiones { get; set; }
}

public class TripulanteMision
{
    public int TripulanteId { get; set; } // Clave foránea
    public Tripulante Tripulante { get; set; }

    public int MisionId { get; set; }      // Clave foránea
    public Mision Mision { get; set; }
}
~~~

- `TripulanteMision` actúa como tabla de unión y tiene **claves foráneas** para `Tripulante` y `Mision`.
- Ambas entidades (`Tripulante` y `Mision`) pueden acceder a la colección de `TripulanteMision`.

---

## Configuración de Claves Foráneas en Entity Framework

- Entity Framework detecta automáticamente las **claves foráneas** si siguen la convención `{NombreDeEntidad}Id`.
- Puedes usar el método `HasForeignKey` en `OnModelCreating` para configurarlas manualmente.

### Ejemplo de Configuración Manual

~~~csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Nave>()
        .HasOne(n => n.Comandante)
        .WithOne(c => c.Nave)
        .HasForeignKey<Nave>(n => n.ComandanteId);

    modelBuilder.Entity<Tripulante>()
        .HasOne(t => t.Nave)
        .WithMany(n => n.Tripulantes)
        .HasForeignKey(t => t.NaveId);

    modelBuilder.Entity<TripulanteMision>()
        .HasKey(tm => new { tm.TripulanteId, tm.MisionId });
}
~~~

- **`HasForeignKey`** especifica la clave foránea manualmente si no sigue las convenciones predeterminadas.
- **`HasKey`** en `TripulanteMision` define una clave compuesta.

---

## Comandos para Crear y Ejecutar Migraciones

1. Abre la **Consola del Administrador de Paquetes** en Visual Studio:
   - Ve a **Herramientas > Administrador de Paquetes NuGet > Consola del Administrador de Paquetes**.

2. Crea la primera migración con:

   ~~~bash
   Add-Migration InitialCreate
   ~~~

3. Aplica la migración para actualizar la base de datos con el siguiente comando:

   ~~~bash
   Update-Database
   ~~~

4. Para revertir una migración si es necesario, usa:

   ~~~bash
   Remove-Migration
   ~~~

---

## Cómo Crear y Consultar Relaciones en Código

### Crear una Nave con Tripulantes

~~~csharp
Nave nave = new Nave { Nombre = "Explorador" };
nave.Tripulantes = new List<Tripulante>
{
    new Tripulante { Nombre = "Alice" },
    new Tripulante { Nombre = "Bob" }
};
_context.Naves.Add(nave);
_context.SaveChanges();
~~~

- En este ejemplo, creamos una `Nave` y agregamos una lista de `Tripulantes` relacionados.

### Consultar la Nave y sus Tripulantes

~~~csharp
Nave naveConTripulantes = _context.Naves
    .Include(n => n.Tripulantes)
    .FirstOrDefault(n => n.Nombre == "Explorador");
~~~

- **`Include`** carga la colección de `Tripulantes` junto con la `Nave` especificada.

---

## Consultas de Muchos a Muchos: Misiones de un Tripulante

~~~csharp
Tripulante misionesDeTripulante = _context.Tripulantes
    .Include(t => t.TripulanteMisiones)
        .ThenInclude(tm => tm.Mision)
    .FirstOrDefault(t => t.Nombre == "Alice");
~~~

- **`ThenInclude`** permite profundizar en las relaciones para acceder a las **Misiones** de un `Tripulante`.

---

## Resumen de Relaciones en Entity Framework

| Tipo de Relación   | Ejemplo              | Clave Foránea | Navegación          |
|--------------------|----------------------|---------------|---------------------|
| Uno a Uno (1:1)    | Nave - Comandante    | Sí           | Propiedad única     |
| Uno a Muchos (1:N) | Nave - Tripulantes   | Sí           | Colección           |
| Muchos a Muchos (M:N) | Tripulantes - Misiones | Sí (Tabla de unión) | Colección |

---

## Próximos Pasos

1. Practicar con cada tipo de relación.
2. Explorar el uso de `Include` y `ThenInclude` para cargar datos relacionados.
3. Crear métodos en controladores para interactuar con relaciones de datos.
