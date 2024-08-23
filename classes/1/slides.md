# Programación 2
## ASP.NET Core with Razor Pages

### Clase 1: Arquitectura Cliente-Servidor

---

## Agenda de la Clase

1. Introducción a la Arquitectura Cliente-Servidor
2. Instalación de Herramientas
3. Conceptos Fundamentales
4. Ejercicios Prácticos

---

## Herramientas a Instalar

- **Visual Studio 2022 Community Edition**
- **.NET 8 SDK**
- **SQL Server Express**
- **Git**

---

## ¿Qué es la Arquitectura Cliente-Servidor?

- **Cliente**: Computadora o dispositivo que solicita un servicio o recurso.
- **Servidor**: Computadora que proporciona servicios o recursos a los clientes.
- **Protocolo**: Conjunto de reglas que define cómo se comunican los clientes y servidores.

---

## Ejemplo de Arquitectura Cliente-Servidor

- **Cliente**: Navegador web.
- **Servidor**: Servidor web que aloja una aplicación web.
- **Protocolo**: HTTP/HTTPS.

---

## Características del Cliente

- Generalmente interactúa con el usuario final.
- Envia solicitudes al servidor.
- Puede ser una aplicación web, móvil, o de escritorio.

---

## Características del Servidor

- Procesa solicitudes de múltiples clientes.
- Proporciona recursos, como bases de datos, archivos, y servicios.
- Escalabilidad y fiabilidad son clave.

---

## Protocolo de Comunicación

- Define cómo se intercambian los mensajes entre cliente y servidor.
- Ejemplos: HTTP, FTP, SMTP.
- Incluye reglas para la solicitud y respuesta.

---

## Arquitectura de Tres Capas

- **Capa de Presentación**: Interfaz de usuario (Cliente).
- **Capa de Lógica de Negocio**: Procesamiento de reglas (Servidor).
- **Capa de Datos**: Almacenamiento de datos (Servidor).

---

## Ventajas de la Arquitectura Cliente-Servidor

1. **Centralización**: Control centralizado de datos y servicios.
2. **Escalabilidad**: Fácil de escalar añadiendo más servidores.
3. **Mantenimiento**: Simplificado, ya que los cambios se hacen en el servidor.

---

## Desventajas de la Arquitectura Cliente-Servidor

1. **Dependencia del Servidor**: Si el servidor falla, los clientes no pueden acceder a los servicios.
2. **Costo**: Requiere infraestructura más compleja y costosa.
3. **Latencia**: Retrasos en la comunicación debido a la red.

---

## Diferencias entre Cliente y Servidor

- **Cliente**: Inicia la comunicación, solicita servicios.
- **Servidor**: Responde a las solicitudes del cliente.

---

## Ejercicio 1: Identificando Cliente y Servidor

### Instrucción:
- Enumera 3 aplicaciones que uses a diario.
- Identifica cuál es el cliente y cuál es el servidor en cada caso.

---

## Comunicación Sin Estado

- **HTTP**: Protocolo sin estado.
- Cada solicitud de cliente es independiente.
- No se mantiene información entre solicitudes.

---

## Ejercicio 2: Análisis de HTTP

### Instrucción:
- Investiga qué significa que HTTP es "sin estado".
- Discute con tus compañeros cómo esto afecta la comunicación entre cliente y servidor.

---

## Ejemplo de una Comunicación Cliente-Servidor

- **Cliente**: El navegador solicita una página web.
- **Servidor**: El servidor web procesa la solicitud y envía la página al cliente.

---

## Ejercicio 3: Flujo de Comunicación

### Instrucción:
- Dibuja el flujo de comunicación entre un cliente (navegador) y un servidor web.
- Incluye las etapas de solicitud y respuesta.

---

## Roles en una Red

- **Cliente**: Envía solicitudes.
- **Servidor**: Procesa y responde a las solicitudes.
- **Red**: Medio que conecta clientes y servidores.

---

## Ejercicio 4: Diferentes Roles

### Instrucción:
- Piensa en un escenario en tu vida diaria donde interactúas con un servidor.
- Describe cómo se configuran los roles de cliente, servidor y red en ese contexto.

---

## Escalabilidad en Servidores

- **Horizontal**: Añadir más servidores para distribuir la carga.
- **Vertical**: Mejorar la capacidad de un servidor existente.

---

## Ejercicio 5: Escalabilidad

### Instrucción:
- Investiga un ejemplo real de escalabilidad horizontal.
- Discute cómo esto puede mejorar la disponibilidad de servicios.

---

## Ejemplo: Aplicaciones Web

- **Frontend (Cliente)**: Interfaz de usuario.
- **Backend (Servidor)**: Procesa lógica y almacena datos.
- **Base de Datos**: Administra datos y respuestas.

---

## Ejercicio 6: División de Capas

### Instrucción:
- Elige una aplicación web que uses.
- Identifica y describe sus capas frontend, backend y base de datos.

---

## Seguridad en Arquitectura Cliente-Servidor

- **Autenticación**: Verificación de identidad del cliente.
- **Autorización**: Permisos que tiene un cliente.
- **Encriptación**: Protección de datos durante la transmisión.

---

## Ejercicio 7: Medidas de Seguridad

### Instrucción:
- Investiga qué medidas de seguridad se deben implementar en una comunicación cliente-servidor.
- Escribe un breve informe.

---

## Balanceo de Carga

- Distribución de tráfico entre varios servidores para optimizar recursos.
- Mejora la eficiencia y disponibilidad.

---

## Ejercicio 8: Balanceo de Carga

### Instrucción:
- Investiga cómo se implementa el balanceo de carga en servidores web.
- Explica cómo esto beneficia a una gran empresa.

---

## Conclusión de la Clase

- Comprensión de la arquitectura cliente-servidor.
- Preparados para aplicar estos conceptos en desarrollo web con ASP.NET Core.

---

## Tarea

### Instrucción:
- Crear un diagrama de arquitectura cliente-servidor para una aplicación web simple.
- Incluir las capas de presentación, lógica de negocio y datos.