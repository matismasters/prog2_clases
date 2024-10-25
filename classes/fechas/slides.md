<!-- Manejo de fechas en C#: DateOnly y DateTime -->
# Manejo de Fechas en C#: `DateOnly` y `DateTime`

---

## ¿Qué es `DateTime` en C#?

- **`DateTime`** es una estructura que representa una fecha y hora en C#.
- Se utiliza ampliamente para registrar y manipular fechas y horas, como en eventos, logs y más.

```csharp
DateTime fechaActual = DateTime.Now;
Console.WriteLine(fechaActual); // Muestra la fecha y hora actual
```

- El **`DateTime`** incluye:
  - Año, mes, día
  - Hora, minuto, segundo

---

## ¿Qué es `DateOnly` en C#?

- **`DateOnly`** es una nueva estructura introducida en .NET 6 que solo maneja la **fecha** sin información de la hora.
- Es útil cuando solo se requiere trabajar con fechas, sin importar la hora.

```csharp
DateOnly fechaActual = DateOnly.FromDateTime(DateTime.Now);
Console.WriteLine(fechaActual); // Muestra solo la fecha actual
```

- No incluye la hora, solo:
  - Año, mes, día

---

## Creación de `DateTime` y `DateOnly`

- **`DateTime`** se puede crear utilizando el constructor que recibe año, mes, día y opcionalmente la hora.

```csharp
DateTime fechaEspecifica = new DateTime(2023, 12, 25, 10, 30, 0);
Console.WriteLine(fechaEspecifica); // 25/12/2023 10:30:00
```

- **`DateOnly`** se crea usando solo la fecha:

```csharp
DateOnly fecha = new DateOnly(2023, 12, 25);
Console.WriteLine(fecha); // 25/12/2023
```

- También puedes obtener una fecha actual con `DateOnly`:

```csharp
DateOnly fechaActual = DateOnly.FromDateTime(DateTime.Now);
```

---

## Comparaciones entre fechas

- Puedes comparar dos fechas con **`DateTime`** o **`DateOnly`** utilizando los operadores de comparación estándar (`<`, `>`, `<=`, `>=`, `==`, `!=`).

```csharp
DateTime fecha1 = new DateTime(2023, 12, 25);
DateTime fecha2 = new DateTime(2024, 1, 1);

if (fecha1 < fecha2) {
    Console.WriteLine("La fecha1 es anterior a fecha2");
}
```

- Con **`DateOnly`** también puedes realizar comparaciones:

```csharp
DateOnly fecha1 = new DateOnly(2023, 12, 25);
DateOnly fecha2 = new DateOnly(2024, 1, 1);

if (fecha1 < fecha2) {
    Console.WriteLine("La fecha1 es anterior a fecha2");
}
```

---

## Comparaciones con rango de fechas (Between)

- Para realizar búsquedas o verificar si una fecha está dentro de un rango, puedes hacerlo de manera explícita con los operadores de comparación.

```csharp
DateTime fecha = new DateTime(2023, 12, 28);
DateTime inicio = new DateTime(2023, 12, 25);
DateTime fin = new DateTime(2023, 12, 31);

if (fecha >= inicio && fecha <= fin) {
    Console.WriteLine("La fecha está dentro del rango.");
}
```

- Lo mismo aplica para **`DateOnly`**:

```csharp
DateOnly fecha = new DateOnly(2023, 12, 28);
DateOnly inicio = new DateOnly(2023, 12, 25);
DateOnly fin = new DateOnly(2023, 12, 31);

if (fecha >= inicio && fecha <= fin) {
    Console.WriteLine("La fecha está dentro del rango.");
}
```

---

## Agregar o restar días, meses, años

- Puedes manipular fechas añadiendo o restando días, meses o años.

```csharp
DateTime fecha = new DateTime(2023, 12, 25);
DateTime nuevaFecha = fecha.AddDays(5);
Console.WriteLine(nuevaFecha); // 30/12/2023

DateOnly fechaSolo = new DateOnly(2023, 12, 25);
DateOnly nuevaFechaSolo = fechaSolo.AddMonths(1);
Console.WriteLine(nuevaFechaSolo); // 25/01/2024
```

- Funciones útiles:
  - **`AddDays()`**
  - **`AddMonths()`**
  - **`AddYears()`**

---

## Restar fechas para obtener diferencias

- Para calcular la diferencia entre dos fechas, puedes restarlas y obtener un objeto **`TimeSpan`**.

```csharp
DateTime fecha1 = new DateTime(2023, 12, 25);
DateTime fecha2 = new DateTime(2023, 12, 31);

TimeSpan diferencia = fecha2 - fecha1;
Console.WriteLine(diferencia.Days); // 6 días
```

- También funciona con **`DateOnly`**:

```csharp
DateOnly fecha1 = new DateOnly(2023, 12, 25);
DateOnly fecha2 = new DateOnly(2023, 12, 31);

int dias = fecha2.DayNumber - fecha1.DayNumber;
Console.WriteLine(dias); // 6 días
```

---

## Conversión entre `DateOnly` y `DateTime`

- Puedes convertir un **`DateTime`** a **`DateOnly`** usando `DateOnly.FromDateTime()`.

```csharp
DateTime fechaHora = DateTime.Now;
DateOnly soloFecha = DateOnly.FromDateTime(fechaHora);
Console.WriteLine(soloFecha); // Solo la fecha sin la hora
```

- Para convertir de **`DateOnly`** a **`DateTime`**, puedes combinarlo con la hora actual:

```csharp
DateOnly soloFecha = new DateOnly(2023, 12, 25);
DateTime fechaHora = soloFecha.ToDateTime(new TimeOnly(10, 30)); // Agregando la hora 10:30
Console.WriteLine(fechaHora); // 25/12/2023 10:30
```

---

## Formateo de fechas

- Puedes formatear una fecha usando el método **`ToString()`** con formatos personalizados.

```csharp
DateTime fecha = new DateTime(2023, 12, 25);
Console.WriteLine(fecha.ToString("yyyy-MM-dd")); // 2023-12-25
Console.WriteLine(fecha.ToString("dd/MM/yyyy")); // 25/12/2023
```

- Con **`DateOnly`**:

```csharp
DateOnly fecha = new DateOnly(2023, 12, 25);
Console.WriteLine(fecha.ToString("dd MMM yyyy")); // 25 Dec 2023
```

- Formatos comunes:
  - **`yyyy-MM-dd`**
  - **`dd/MM/yyyy`**
  - **`MMM dd, yyyy`**

---

## Comparación de `DateTime` con `DateOnly`

- **`DateTime`** maneja tanto la fecha como la hora, lo que lo hace útil para eventos que requieren información temporal precisa.
- **`DateOnly`** es una estructura simplificada cuando solo se necesita la fecha sin preocuparse por la hora.

---

## Casos de uso comunes

- **`DateTime`**: Ideal para registrar eventos que requieren tanto fecha como hora, como registros de logs o citas específicas.
- **`DateOnly`**: Útil para manejar fechas de cumpleaños, vencimientos de productos o fechas sin relevancia temporal.

---

## Resumen

- **`DateTime`** y **`DateOnly`** son estructuras poderosas para manejar fechas en C#.
- **`DateTime`** incluye información de hora, mientras que **`DateOnly`** solo maneja la fecha.
- Puedes realizar comparaciones, agregar o restar días, meses y años, y formatear fechas de forma flexible.

---

## Próximos pasos

- Explorar el uso de **`TimeOnly`** para trabajar solo con tiempos.
- Combinar **`DateOnly`** y **`TimeOnly`** para manejar fechas y horas de manera más precisa.
- Manejar zonas horarias y fechas internacionales usando **`DateTimeOffset`**.
