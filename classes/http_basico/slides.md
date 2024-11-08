<!-- Conceptos Básicos del Protocolo HTTP -->
# Conceptos Básicos del Protocolo HTTP

---

## ¿Qué es HTTP?

- **HTTP** (Hypertext Transfer Protocol) es un protocolo de comunicación utilizado para intercambiar datos en la web.
- **Cliente-Servidor**: HTTP sigue el modelo cliente-servidor, donde el cliente realiza una solicitud y el servidor envía una respuesta.
- **Stateless**: HTTP es sin estado, es decir, cada solicitud es independiente y no guarda contexto entre solicitudes.

---

## Componentes de una Solicitud HTTP

1. **Método**: Define la acción que el cliente quiere realizar (GET, POST, etc.).
2. **URL**: Identifica el recurso en el servidor.
3. **Cabeceras**: Información adicional sobre la solicitud (tipo de contenido, autorización, etc.).
4. **Cuerpo (Body)**: Datos adicionales enviados en algunos métodos, como POST.

### Ejemplo de Solicitud GET

~~~
GET /index.html HTTP/1.1
Host: www.ejemplo.com
User-Agent: Mozilla/5.0
Accept: text/html
~~~

---

## Componentes de una Respuesta HTTP

1. **Código de Estado**: Indica el resultado de la solicitud (ej. 200 OK, 404 Not Found).
2. **Cabeceras**: Información adicional sobre la respuesta (tipo de contenido, longitud, etc.).
3. **Cuerpo (Body)**: Contenido de la respuesta (HTML, JSON, etc.).

### Ejemplo de Respuesta HTTP

~~~
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1256

<html>
  <body>... contenido ...</body>
</html>
~~~

---

## Métodos HTTP Comunes

Los métodos HTTP especifican la acción deseada sobre el recurso.

1. **GET**: Solicita un recurso del servidor.
2. **POST**: Envía datos para crear un nuevo recurso.
3. **PUT**: Actualiza o reemplaza un recurso existente.
4. **DELETE**: Elimina un recurso en el servidor.

---

## Método GET

- **Descripción**: Recupera datos de un recurso específico en el servidor.
- **Idempotente**: Repetir una solicitud GET no cambia el estado del servidor.
- **Uso común**: Navegación web, recuperación de datos.
- **Sin cuerpo**: Las solicitudes GET no envían datos en el cuerpo.

### Ejemplo de Solicitud GET

~~~
GET /productos HTTP/1.1
Host: www.ejemplo.com
~~~

---

## Método POST

- **Descripción**: Envía datos al servidor para crear un nuevo recurso.
- **No idempotente**: Repetir una solicitud POST puede crear múltiples recursos.
- **Uso común**: Formularios web, creación de recursos en APIs.
- **Con cuerpo**: Los datos se envían en el cuerpo de la solicitud.

### Ejemplo de Solicitud POST

~~~
POST /productos HTTP/1.1
Host: www.ejemplo.com
Content-Type: application/json

{
  "nombre": "Producto A",
  "precio": 100
}
~~~

---

## Método PUT

- **Descripción**: Actualiza o reemplaza un recurso existente en el servidor.
- **Idempotente**: Repetir una solicitud PUT no cambia el resultado final.
- **Uso común**: Actualización de recursos en APIs.
- **Con cuerpo**: Los datos del recurso se envían en el cuerpo de la solicitud.

### Ejemplo de Solicitud PUT

~~~
PUT /productos/1 HTTP/1.1
Host: www.ejemplo.com
Content-Type: application/json

{
  "nombre": "Producto A Actualizado",
  "precio": 120
}
~~~

---

## Método DELETE

- **Descripción**: Elimina un recurso del servidor.
- **Idempotente**: Repetir una solicitud DELETE da el mismo resultado (el recurso ya no existe).
- **Uso común**: Eliminación de datos en APIs.
- **Sin cuerpo**: Usualmente no se envían datos en el cuerpo.

### Ejemplo de Solicitud DELETE

~~~
DELETE /productos/1 HTTP/1.1
Host: www.ejemplo.com
~~~

---

## Códigos de Estado HTTP

Los códigos de estado indican el resultado de una solicitud.

- **1xx (Informativos)**: La solicitud está en progreso.
- **2xx (Éxito)**: La solicitud fue recibida y procesada exitosamente.
  - 200 OK: La solicitud fue exitosa.
  - 201 Created: Recurso creado exitosamente.
- **3xx (Redirección)**: El recurso se ha movido o requiere redirección.
  - 301 Moved Permanently: El recurso se ha movido.
  - 302 Found: Redirección temporal.
- **4xx (Error del Cliente)**: Hubo un problema con la solicitud del cliente.
  - 400 Bad Request: La solicitud está mal formada.
  - 404 Not Found: El recurso no se encontró.
- **5xx (Error del Servidor)**: Hubo un problema en el servidor.
  - 500 Internal Server Error: Error inesperado en el servidor.

---

## Ejemplo Completo de Solicitud y Respuesta

### Solicitud POST

~~~
POST /login HTTP/1.1
Host: www.ejemplo.com
Content-Type: application/x-www-form-urlencoded

username=usuario&password=12345
~~~

### Respuesta

~~~
HTTP/1.1 200 OK
Set-Cookie: sessionId=abc123; Path=/; HttpOnly

{
  "mensaje": "Login exitoso",
  "usuario": "usuario"
}
~~~

---

## Otras Características de HTTP

1. **Cookies**: Almacenan datos del usuario en el navegador para autenticación o personalización.
2. **HTTPS**: Variante segura de HTTP que cifra los datos en tránsito.
3. **Cache-Control**: Cabecera para controlar la caché de los recursos en el navegador.
4. **CORS (Cross-Origin Resource Sharing)**: Permite o restringe solicitudes de dominios distintos.

---

## Resumen

1. **HTTP es un protocolo sin estado** para la comunicación cliente-servidor.
2. **Métodos HTTP**: GET (obtener), POST (crear), PUT (actualizar), DELETE (eliminar).
3. **Códigos de Estado**: Indican el resultado de la solicitud (200 OK, 404 Not Found, etc.).
4. **Cookies y HTTPS**: Ayudan con autenticación y seguridad.
5. **Control de Caché y CORS**: Mejoran el rendimiento y controlan el acceso.

---

## Próximos Pasos

1. Practicar realizando solicitudes HTTP con herramientas como Postman o Curl.
2. Explorar APIs públicas para ver cómo funcionan los métodos HTTP.
3. Implementar un servidor web simple en ASP.NET Core MVC y manejar solicitudes HTTP.
