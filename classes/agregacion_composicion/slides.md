<!-- Relaciones de Agregación y Composición en C# -->
# Relaciones de Agregación y Composición

---

## ¿Qué es la Agregación?
- La agregación implica que una clase tiene una referencia a una o más instancias de otra clase.
- Representa una relación "tiene un", pero las instancias pueden existir independientemente.

---

## Ejemplo de Agregación
- En nuestro caso, un **LanzadorDeDados** tiene varios **Dados**, pero los **Dados** pueden existir por sí mismos.

```csharp
class Dado {
    public int Caras { get; set; }

    public Dado(int caras) {
        Caras = caras;
    }

    public int Lanzar() {
        Random rnd = new Random();
        return rnd.Next(1, Caras + 1);
    }
}

class LanzadorDeDados {
    public List<Dado> Dados { get; set; }  // Agregación de Dados

    public LanzadorDeDados(List<Dado> dados) {
        Dados = dados;
    }

    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }
}
```

---

## ¿Qué es la Composición?
- La composición implica una relación más fuerte. Si la clase que contiene otras instancias desaparece, las instancias contenidas también lo hacen.
- Representa una relación "es parte de".

---

## Ejemplo de Composición con Métodos de Agregar, Buscar y Eliminar Dados
- En este caso, el **LanzadorDeDados** tiene control completo sobre la creación, búsqueda y eliminación de **Dados**.

```csharp
class Dado {
    public int Caras { get; set; }

    public Dado(int caras) {
        Caras = caras;
    }

    public int Lanzar() {
        Random rnd = new Random();
        return rnd.Next(1, Caras + 1);
    }
}

class LanzadorDeDados {
    private List<Dado> Dados;  // Composición: LanzadorDeDados controla la vida de los dados

    public LanzadorDeDados() {
        Dados = new List<Dado>();
    }

    // Método para agregar un dado
    public void AgregarDado(int caras) {
        Dados.Add(new Dado(caras));
    }

    // Método para buscar un dado por su número de caras
    public Dado BuscarDado(int caras) {
        return Dados.Find(d => d.Caras == caras);
    }

    // Método para eliminar un dado
    public void EliminarDado(int caras) {
        Dado dadoAEliminar = BuscarDado(caras);
        if (dadoAEliminar != null) {
            Dados.Remove(dadoAEliminar);
        }
    }

    // Método para lanzar todos los dados
    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }
}
```

---

## Agregación vs Composición

| **Agregación**                          | **Composición**                          |
|-----------------------------------------|------------------------------------------|
| Las clases pueden existir por separado. | Las clases dependen totalmente de la otra. |
| Es una relación "tiene un".             | Es una relación "es parte de".           |
| Ejemplo: Un coche tiene un motor.       | Ejemplo: Un cuerpo tiene un corazón.     |

---

## Ejercicio: Agregación de Dados
1. Crear una clase **Dado** que tenga un método **Lanzar()**.
2. Crear una clase **LanzadorDeDados** que reciba una lista de **Dados**.
3. Lanzar todos los dados y devolver los resultados.

---

```csharp
// Ejemplo básico de agregación
class Dado {
    public int Caras { get; set; }
    public Dado(int caras) {
        Caras = caras;
    }
    public int Lanzar() {
        Random rnd = new Random();
        return rnd.Next(1, Caras + 1);
    }
}

class LanzadorDeDados {
    public List<Dado> Dados { get; set; }
    
    public LanzadorDeDados(List<Dado> dados) {
        Dados = dados;
    }

    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }
}
```

---

## Ejercicio: Composición de Dados
1. Modificar la clase **LanzadorDeDados** para que pueda agregar, buscar y eliminar los **Dados**.
2. Implementar el método para lanzar todos los dados y devolver los resultados.

---

```csharp
// Ejemplo básico de composición con métodos de agregar, buscar y eliminar dados
class Dado {
    public int Caras { get; set; }
    public Dado(int caras) {
        Caras = caras;
    }
    public int Lanzar() {
        Random rnd = new Random();
        return rnd.Next(1, Caras + 1);
    }
}

class LanzadorDeDados {
    private List<Dado> Dados;  // Composición: Los dados pertenecen completamente al lanzador

    public LanzadorDeDados() {
        Dados = new List<Dado>();
    }

    // Método para agregar un dado
    public void AgregarDado(int caras) {
        Dados.Add(new Dado(caras));
    }

    // Método para buscar un dado por su número de caras
    public Dado BuscarDado(int caras) {
        return Dados.Find(d => d.Caras == caras);
    }

    // Método para eliminar un dado
    public void EliminarDado(int caras) {
        Dado dadoAEliminar = BuscarDado(caras);
        if (dadoAEliminar != null) {
            Dados.Remove(dadoAEliminar);
        }
    }

    // Método para lanzar todos los dados
    public List<int> LanzarTodosLosDados() {
        List<int> resultados = new List<int>();
        foreach (var dado in Dados) {
            resultados.Add(dado.Lanzar());
        }
        return resultados;
    }
}
```

---

## Conclusión
- **Agregación**: Las clases pueden existir independientemente.
- **Composición**: Las clases son dependientes de la clase que las contiene.
- Usa la agregación cuando las instancias pueden existir sin la otra clase.
- Usa la composición cuando las instancias deben estar contenidas por la clase.
