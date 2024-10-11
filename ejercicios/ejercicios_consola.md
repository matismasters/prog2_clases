# Ejercicios de programación en JavaScript Repartido 1

## Variables

### Ejercicio 1

Declara una variable llamada "nombre" y asígnale tu nombre como valor.
```js
// Solucion:
function guardarNombre() {
  let nombre = "Felix";
}

guardarNombre();
```

### Ejercicio 2

Declara una variable llamada "edad" y asígnale tu edad como valor.
```js
// Solucion:
let edad = 25;
// Solucion con funcion:
function guardarEdad() {
  let edad = 25;
}
```

### Ejercicio 3

Declara una variable llamada "intereses" y asígnale un array con tus intereses.
```js
// Solucion:
let hobbies = ["leer", "escuchar música", "ver series"];
// Solucion con funcion:
function guardarIntereses() {
  let hobbies = ["leer", "escuchar música", "ver series"];
}
```

### Ejercicio 4

Declara una variable llamada "esEstudiante" y asígnale un valor booleano que indique si eres estudiante o no.
```js
// Solucion:
let esEstudiante = true;
// Solucion con funcion:
function guardarEsEstudiante() {
  let esEstudiante = true;
}
```

### Ejercicio 5

Declara una variable llamada "comidaFavorita" y asígnale tu comida favorita como valor.
```js
// Solucion:
let comidaFavorita = "pizza";
// Solucion con funcion:
function guardarComidaFavorita() {
  let comidaFavorita = "pizza";
}
```

### Ejercicio 6

Declara una variable llamada "ciudad" y utiliza prompt() para que el usuario ingrese el nombre de su ciudad.
Luego utiliza alert() para mostrar un mensaje que diga "Vives en [ciudad]".
```js
// Solucion:
let ciudad = prompt("Ingresa el nombre de tu ciudad");
alert(`Vives en ${ciudad}`);

// Solucion con funcion:

function mostrarCiudad(ciudad) {
  alert(`Vives en ${ciudad}`);
}

let ciudad = prompt("Ingresa el nombre de tu ciudad");
mostrarCiudad(ciudad);
```

### Ejercicio 7

Declara una variable llamada "nombre" y utiliza prompt() para que el usuario ingrese su nombre.
Declara una variable llamada "apellido" y utiliza prompt() para que el usuario ingrese su apellido.
Utiliza alert() para mostrar un mensaje que diga "Hola [nombre] [apellido]".
```js
// Solucion:
let nombre = prompt("Ingresa tu nombre");
let apellido = prompt("Ingresa tu apellido");

alert(`Hola ${nombre} ${apellido}`);

// Solucion con funcion:
function saludar(nombre, apellido) {
  alert(`Hola ${nombre} ${apellido}`);
}

let nombre = prompt("Ingresa tu nombre");
let apellido = prompt("Ingresa tu apellido");

saludar(nombre, apellido);
```

### Ejercicio 8

Declara una variable llamada "anoDeNacimiento" y utiliza prompt() para que el usuario ingrese su año de nacimiento.
Calcula su edad y utiliza alert() para mostrar un mensaje que diga "Tu edad es [edad]."
```js
// Solucion:
let anoDeNacimiento = parseInt(prompt("Ingresa tu año de nacimiento"));
let edad = 2024 - anoDeNacimiento;

alert(`Tu edad es ${edad}`);

// Solucion con funcion:
function calcularEdad(anoDeNacimiento) {
  let edad = 2024 - anoDeNacimiento;
  alert(`Tu edad es ${edad}`);
}

let anoDeNacimiento = parseInt(prompt("Ingresa tu año de nacimiento"));
calcularEdad(anoDeNacimiento);
```


### Ejercicio 9

Declara una variable llamada "cantidadDePersonas" y utiliza prompt() para que el usuario ingrese la cantidad de personas con las que va a comer.
Si asumimos que una persona come una pizza, calcula cuántas pizzas necesitan para comer y muestra un mensaje con la cantidad de pizzas que deben pedir.
```js
// Solucion:
let cantidadDePersonas = prompt("Ingresa la cantidad de personas con las que vas a comer");
alert(`Deben pedir ${cantidadDePersonas} pizzas`);

// Solucion con funcion:
function mostrarCuantasPizasPedirPorPersona(cantidadDePersonas) {
  alert(`Deben pedir ${cantidadDePersonas} pizzas`);
}

let cantidadDePersonas = prompt("Ingresa la cantidad de personas con las que vas a comer");
mostrarCuantasPizasPedirPorPersona(cantidadDePersonas);
```

### Ejercicio 10

Declara una variable llamada "pesoDeLasManzanasEnKg" y utiliza prompt() para que el usuario ingrese el peso en kilogramos de las manzanas que quiere comprar.
Declara una variable llamada "precioPorKg" y asígnale un valor de 450.
Calcula el precio total y muestra un mensaje con el total a pagar.

```js
// Solucion:
let pesoDeLasManzanasEnKg = parseFloat(prompt("Ingresa el peso en kilogramos de las manzanas que quieres comprar"));
let precioPorKg = 450;
let total = pesoDeLasManzanasEnKg * precioPorKg;

// Solucion con funcion:
function calcularPrecioManzanas(pesoDeLasManzanasEnKg) {
  let precioPorKg = 450;
  return pesoDeLasManzanasEnKg * precioPorKg;
}

let pesoDeLasManzanasEnKg = praseFloat(prompt("Ingresa el peso en kilogramos de las manzanas que quieres comprar"));
let total = calcularPrecioManzanas(pesoDeLasManzanas);
alert(`El precio total es $${pesoDeLasManzasEnKg}`)
```

### Ejercicio 11

La formula para calcular la velocidad en kilometros por hora es: velocidad = distancia / tiempo.
Ayudemos al usuario a calcular la velocidad promedio de su reciente viaje en omnibus.
Declara una variable llamada distancia y utiliza prompt() para que el usuario ingrese la distancia en kilometros desde su punto de partida hasta su destino.
Declara una variable llamada tiempo y utiliza prompt() para que el usuario ingrese el tiempo en horas que le tomó llegar a su destino.
Calcula la velocidad promedio y muestra un mensaje con la velocidad obtenida.
```js
// Solucion:
let distancia = parseInt(prompt("Ingresa la distancia en kilometros desde tu punto de partida hasta tu destino"));
let tiempo = parseInt(prompt("Ingresa el tiempo en horas que te tomó llegar a tu destino"));
let velocidad = distancia / tiempo;

alert(`La velocidad promedio de tu reciente viaje en omnibus fue de ${velocidad} km/h`);
// Solucion con funcion:
function calcularVelocidad(dist, t) {
  return dist / t;
}

let distancia = parseInt(prompt("Ingrese la distancia en kilometros desde tu punto de partida hasta tu destino"));
let tiempo = parseInt(prompt("Ingresa el tiempo en horas que te tomó llegar a tu destino"));

let velocidad = calcularVelocidad(distancia, tiempo);
alert(`La velocidad promedio de tu reciente viaje en omnibus fue de ${velocidad} km/h`);
```

### Ejercicio 12

La formula para calcular el perimetro de un rectangulo es: perimetro = 2 * (lado1 + lado2).
Una cancha de futbol 11 mide 110 metros de largo y 75 metros de ancho.
Si el entrenador manda al equipo a correr 10 kilometros alrededor de la cancha, cuantas vueltas deberan dar alrededor de la cancha?
Utiliza un alert() para mostrar un mensaje con la cantidad de vueltas que deben dar.
```js
// Solucion con modificaciones para uso de funciones
function calcularPerimetro(largo, ancho) {
  return 2 * (largo + ancho);
}

function calcularCantidadDeVueltas() {
  let largo = 110;
  let ancho = 75;
  let perimetro = calcularPerimetro(largo, ancho);
  let vueltas = 10000 / perimetro;

  alert(`Deben dar ${vueltas} vueltas alrededor de la cancha`);

}

calcularCantidadDeVueltas();
```

### Ejercicio 13

Declara una variable llamada "numeroDeClientes" y utiliza prompt() para que el usuario ingrese la cantidad de clientes que visitaron tu negocio en el día de hoy.
Declara una variable llamada "ganancias" y utiliza prompt() para que el usuario ingrese el monto total de las ganancias del día.
Calcula el promedio de ganancias por cliente y muestra un mensaje con el promedio obtenido.
```js
// Solucion:
let numeroDeClientes = parseInt(prompt("Ingresa la cantidad de clientes que visitaron tu negocio en el día de hoy"));
let ganancias = parseFloat(prompt("Ingresa el monto total de las ganancias del día"));
let promedio = ganancias / numeroDeClientes;

alert(`El promedio de ganancias por cliente es de ${promedio}`);

// Solucion con funcion:
function calcularPromedioGanancias(numeroDeClientes, ganancias) {
  return ganancias / numeroDeClientes;
}

let numeroDeClientes = parseInt(prompt("Ingresa la cantidad de clientes que visitaron tu negocio en el día de hoy"));
let ganancias = parseFloat(prompt("Ingresa el monto total de las ganancias del día"));

let promedio = calcularPromedioGanancias(numeroDeClientes, ganancias);
alert(`El promedio de ganancias por cliente es de ${promedio}`);
```

### Ejercicio 14

Declara una variable llamada "numeroDePersonasInvitadasAComer" y utiliza prompt() para que el usuario ingrese la cantidad de personas que invitará a comer.
Asume que cada persona comera 2 chivitos. Cada chivito lleva 1 pan tortuga, 1 churrasco, 2 tiras de panceta, 1 huevo frito, 50 gramos de muzzarella y 50 gramos de jamon.
Calcula cuantos ingredientes necesitarás para preparar la comida y muestra un mensaje con la cantidad de ingredientes necesarios.
```js
// Solucion:
let numeroDePersonasInvitadasAComer = parseInt(prompt("Ingresa la cantidad de personas que invitarás a comer"));
let chivitosPorPersona = 2;
let panTortugaPorChivito = 1;
let churrascoPorChivito = 1;
let tirasDePancetaPorChivito = 2;
let huevosFritosPorChivito = 1;
let muzzarellaPorChivito = 50;
let jamonPorChivito = 50;

let totalPanTortuga = numeroDePersonasInvitadasAComer * chivitosPorPersona * panTortugaPorChivito;
let totalChurrasco = numeroDePersonasInvitadasAComer * chivitosPorPersona * churrascoPorChivito;
let totalTirasDePanceta = numeroDePersonasInvitadasAComer * chivitosPorPersona * tirasDePancetaPorChivito;
let totalHuevosFritos = numeroDePersonasInvitadasAComer * chivitosPorPersona * huevosFritosPorChivito;
let totalMuzzarella = numeroDePersonasInvitadasAComer * chivitosPorPersona * muzzarellaPorChivito;
let totalJamon = numeroDePersonasInvitadasAComer * chivitosPorPersona * jamonPorChivito;

alert(`Para preparar la comida necesitarás:
- ${totalPanTortuga} panes tortuga
- ${totalChurrasco} churrascos
- ${totalTirasDePanceta} tiras de panceta
- ${totalHuevosFritos} huevos fritos
- ${totalMuzzarella} gramos de muzzarella
- ${totalJamon} gramos de jamón`);

// Solucion con funciones:
function calcularIngredientes(cantidadDeChivitos) {
  let panTortugaPorChivito = 1;
  let churrascoPorChivito = 1;
  let tirasDePancetaPorChivito = 2;
  let huevosFritosPorChivito = 1;
  let muzzarellaPorChivito = 50;
  let jamonPorChivito = 50;

  let totalPanTortuga = cantidadDeChivitos * panTortugaPorChivito;
  let totalChurrasco = cantidadDeChivitos * churrascoPorChivito;
  let totalTirasDePanceta = cantidadDeChivitos * tirasDePancetaPorChivito;
  let totalHuevosFritos = cantidadDeChivitos * huevosFritosPorChivito;
  let totalMuzzarella = cantidadDeChivitos * muzzarellaPorChivito;
  let totalJamon = cantidadDeChivitos * jamonPorChivito;

  return {
    panTortuga: totalPanTortuga,
    churrasco: totalChurrasco,
    tirasDePanceta: totalTirasDePanceta,
    huevosFritos: totalHuevosFritos,
    muzzarella: totalMuzzarella,
    jamon: totalJamon
  };
}

function calcularCantidadDeChivitosTotales(cantidadDePersonasInvitadasAComer, cantidadDeChivitosPorPersona) {
  return cantidadDePersonasInvitadasAComer * cantidadDeChivitosPorPersona;
}

let cantidadDePersonasInvitadasAComer = parseInt(prompt("Ingresa la cantidad de personas que invitarás a comer"));
let cantidadDeChivitosPorPersona = parseInt(prompt("Ingresa la cantidad de chivitos que comerá cada persona"));

cantidadDeChivitosPorPersona += 1;
let chivitosTotales = calcularCantidadDeChivitosTotales(cantidadDePersonasInvitadasAComer, cantidadDeChivitosPorPersona);

let ingredientes = calcularIngredientes(chivitosTotales);
alert(`Para preparar la comida necesitarás:
- ${ingredientes.panTortuga} panes tortuga
- ${ingredientes.churrasco} churrascos
- ${ingredientes.tirasDePanceta} tiras de panceta
- ${ingredientes.huevosFritos} huevos fritos
- ${ingredientes.muzzarella} gramos de muzzarella
- ${ingredientes.jamon} gramos de jamón`);


```

### Ejercicio 15

Declara una variable llamada "manzanasCompradas" y utiliza prompt() para que el usuario ingrese la cantidad de manzanas que compró.
Declara una variable llamada "manzanasComidasPorLosHijos" y utiliza prompt() para que el usuario ingrese la cantidad de manzanas que se comieron los hijos.
Declara una variable llamada "manzanasComidasPorLosPadres" y utiliza prompt() para que el usuario ingrese la cantidad de manzanas que se comieron los padres.
Calcula cuantas manzanas quedan y muestra un mensaje con la cantidad de manzanas restantes.
```js
// Solucion:
let manzanasCompradas = parseInt(prompt("Ingresa la cantidad de manzanas que compraste"));
let manzanasComidasPorLosHijos = parseInt(prompt("Ingresa la cantidad de manzanas que se comieron los hijos"));
let manzanasComidasPorLosPadres = parseInt(prompt("Ingresa la cantidad de manzanas que se comieron los padres"));

let manzanasRestantes = manzanasCompradas - manzanasComidasPorLosHijos - manzanasComidasPorLosPadres;

alert(`Quedan ${manzanasRestantes} manzanas`);
```

### Ejercicio 16

La formula para calcular el area de un rectangulo es: area = largo * ancho.
El usuario es un agente inmobiliario y recien llega de medir una casa.
La casa tiene 3 cuartos, un baño, una cocina y un living-comedor.
Pedir al usuario que ingrese largo y ancho de cada espacio.
Mostrar un mensaje con el area total de la casa.
Mostrar un mensaje con el área total de todos los cuartos.
Si el precio por metro cuadrado es de U$S 2600, mostrar un mensaje con el precio total de la casa.
```js
// Solucion:
let largoCuarto1 = parseInt(prompt("Ingresa el largo del cuarto 1"));
let anchoCuarto1 = parseInt(prompt("Ingresa el ancho del cuarto 1"));
let largoCuarto2 = parseInt(prompt("Ingresa el largo del cuarto 2"));
let anchoCuarto2 = parseInt(prompt("Ingresa el ancho del cuarto 2"));
let largoCuarto3 = parseInt(prompt("Ingresa el largo del cuarto 3"));
let anchoCuarto3 = parseInt(prompt("Ingresa el ancho del cuarto 3"));
let largoBano = parseInt(prompt("Ingresa el largo del baño"));
let anchoBano = parseInt(prompt("Ingresa el ancho del baño"));
let largoCocina = parseInt(prompt("Ingresa el largo de la cocina"));
let anchoCocina = parseInt(prompt("Ingresa el ancho de la cocina"));
let largoLivingComedor = parseInt(prompt("Ingresa el largo del living-comedor"));
let anchoLivingComedor = parseInt(prompt("Ingresa el ancho del living-comedor"));

let areaCuarto1 = largoCuarto1 * anchoCuarto1;
let areaCuarto2 = largoCuarto2 * anchoCuarto2;
let areaCuarto3 = largoCuarto3 * anchoCuarto3;
let areaBano = largoBano * anchoBano;
let areaCocina = largoCocina * anchoCocina;
let areaLivingComedor = largoLivingComedor * anchoLivingComedor;

let areaTotal = areaCuarto1 + areaCuarto2 + areaCuarto3 + areaBano + areaCocina + areaLivingComedor;

let precioPorMetroCuadrado = 2600;
let precioTotal = areaTotal * precioPorMetroCuadrado;

alert(`El area total de la casa es de ${areaTotal} metros cuadrados.
El area total de los cuartos es de ${areaCuarto1 + areaCuarto2 + areaCuarto3} metros cuadrados.
El precio total de la casa es de U$S ${precioTotal}`);

// Solucion con funciones:
function pedirLargoAnchoYCalcularArea(habitacion) {
  let largo = parseInt(prompt(`Ingresa el largo de ${habitacion}`));
  let ancho = parseInt(prompt(`Ingresa el ancho de ${habitacion}`));
  return (largo + 1)  * (ancho + 1);
}

let areaCuarto1 = pedirLargoAnchoYCalcularArea("el cuarto 1");
let areaCuarto2 = pedirLargoAnchoYCalcularArea("el cuarto 2");
let areaCuarto3 = pedirLargoAnchoYCalcularArea("el cuarto 3");;
let areaBano = pedirLargoAnchoYCalcularArea("el baño");
let areaCocina = pedirLargoAnchoYCalcularArea("la cocina");;
let areaLivingComedor = pedirLargoAnchoYCalcularArea("el living-comedor");


let areaTotal = areaCuarto1 + areaCuarto2 + areaCuarto3 + areaBano + areaCocina + areaLivingComedor;

let precioPorMetroCuadrado = 2600;
let precioTotal = areaTotal * precioPorMetroCuadrado;

alert(`El area total de la casa es de ${areaTotal} metros cuadrados.
El area total de los cuartos es de ${areaCuarto1 + areaCuarto2 + areaCuarto3} metros cuadrados.
El precio total de la casa es de U$S ${precioTotal}`);
```

### Ejercicio 17

La formula para calcular la velocidad de un vehiculo a partir de las revoluciones del motor es:
velocidad = ((revolucionesEnRPM * diametroDeLaRuedaEnMetros * 3.1416) / (ratioDeMarcha * diferencialFinal)) * (60 / 1000).
Ejemplo de uso de la formula con los siguientes valores:
- revolucionesEnRPM = 3000
- diametroDeLaRuedaEnMetros = 0.6
- ratioDeMarcha = 0.8
- diferencialFinal = 4.1
-
- velocidad = ((3000 * 0.6 * 3.1416) / (0.8 * 4.1)) * (60 / 1000)
- velocidad = ((5654.86 / 3.28) * 0.06)
- velocidad = 1724.04 * 0.06
- velocidad = 103.44 km/h

#### Parte 1:
Asumiendo que utilizamos los valores del ejemplo, a excepcion de las revoluciones del motor, pedir al usuario que ingrese las revoluciones del motor.
Mostrar un mensaje con la velocidad obtenida.

#### Parte 2:
Asumiendo que utilizamos los valores del ejemplo, a excepcion del diametro de la rueda y las revoluciones del motor.
Pedir al usuario que ingrese el diametro de la rueda en metros y las revoluciones del motor.
Mostrar un mensaje con la velocidad obtenida.
```js
// Solucion Parte 1:
let revolucionesEnRPM = parseInt(prompt("Ingresa las revoluciones del motor"));
let diametroDeLaRuedaEnMetros = 0.6;
let ratioDeMarcha = 0.8;
let diferencialFinal = 4.1;

let velocidad = ((revolucionesEnRPM * diametroDeLaRuedaEnMetros * 3.1416) / (ratioDeMarcha * diferencialFinal)) * (60 / 1000);

alert(`La velocidad del vehiculo es de ${velocidad} km/h`);

// Solucion Parte 2:
diametroDeLaRuedaEnMetros = parseFloat(prompt("Ingresa el diametro de la rueda en metros"));
revolucionesEnRPM = parseInt(prompt("Ingresa las revoluciones del motor"));

velocidad = ((revolucionesEnRPM * diametroDeLaRuedaEnMetros * 3.1416) / (ratioDeMarcha * diferencialFinal)) * (60 / 1000);
```

## Condicionales y operadores lógicos

### Ejercicio 18

Declara una variable llamada "edad" y utiliza prompt() para que el usuario ingrese su edad.
Si la edad es menor a 18, muestra un mensaje con "Eres menor de edad".
Si la edad es mayor o igual a 18, muestra un mensaje con "Eres mayor de edad".
```js
// Solucion:
let edad = parseInt(prompt("Ingresa tu edad"));

if (edad < 18) {
  alert("Eres menor de edad");
} else {
  alert("Eres mayor de edad");
}

// Solucion con funcion:
function mostrarMensajeDeEdad(edad) {
  if (edad < 18) {
    alert("Eres menor de edad");
  } else {
    alert("Eres mayor de edad");
  }
}
```

### Ejercicio 19

Declara una variable llamada "numero" y utiliza prompt() para que el usuario ingrese un número.
Si el número es positivo, muestra un mensaje con "El número es positivo".
Si el número es negativo, muestra un mensaje con "El número es negativo".

```js
// Solucion:
let numero = parseInt(prompt("Ingresa un número"));

if (numero > 0) {
  alert("El número es positivo");
} else {
  alert("El número es negativo");
}
```

### Ejercicio 20

Pide al usuario que ingrese su edad.
Calcula el año de nacimiento y muestra un mensaje con el año de nacimiento.
Si la edad es menor a 0, muestra un mensaje de error.
Si la edad es mayor a 100, muestra un mensaje de error.
```js
// Solucion:
let edad = parseInt(prompt("Ingresa tu edad"));
let anoDeNacimiento = 2024 - edad;

if (edad < 0) {
  alert("Error: La edad no puede ser menor a 0");
} else if (edad > 100) {
  alert("Error: La edad no puede ser mayor a 100");
} else {
  alert(`Tu año de nacimiento es ${anoDeNacimiento}`);
}

// Solucion con funcion:
function calcularAnoDeNacimiento(edad) {
  return 2024 - edad;
}

function mostrarAnoNacimientoValidado(edad) {
  let anoDeNacimiento = calcularAnoDeNacimiento(edad);

  if (edad < 0) {
    alert("Error: La edad no puede ser menor a 0");
  } else if (edad > 100) {
    alert("Error: La edad no puede ser mayor a 100");
  } else {
    alert(`Tu año de nacimiento es ${anoDeNacimiento}`);
  }
}
```

### Ejercicio 21

Pide al usuario que ingrese si tiene bicicleta.
Si el usuario tiene bicicleta, muestra un mensaje con "Tienes bicicleta, que nivel".
Si el usuario no tiene bicicleta, muestra un mensaje con "No tienes bicicleta, que nivel".
```js
// Solucion:
let tieneBicicleta = prompt("Tienes bicicleta? (si/no)");

if (tieneBicicleta === "si") {
  alert("Tienes bicicleta, que nivel");
} else {
  alert("No tienes bicicleta, que nivel");
}

// Solucion con funcion:
function transformarRespuestaABoolean(respuesta) {
  return respuesta.toLowerCase() === "si";
}

function mostrarMensajeDeBicicleta(tieneBicicleta) {
  let respondioQueSi = transformarRespuestaABoolean(tieneBicicleta);

  if (respondioQueSi) {
    alert("Tienes bicicleta, que nivel");
  } else {
    alert("No tienes bicicleta, que nivel");
  }

  return respondioQueSi;
}

let respuesta = prompt("Tienes bicicleta? (si/no)");
let respondioSi = mostrarMensajeDeBicicleta(respuesta);
```

### Ejercicio 22

Pide al usuario que ingrese cuantos pares de zapatos tiene.
Si el usuario tiene menos de 2 pares de zapatos, muestra el mensaje "Calidad por sobre cantidad!".
Si el usuario tiene entre 2 y 5 pares de zapatos, muestra el mensaje "Lo justo para cada ocación!".
Si el usuario tiene mas de 5 pares de zapatos, muestra el mensaje "Una elección dificil todos los dias!".
```js
// Solucion:
let paresDeZapatos = parseInt(prompt("Cuantos pares de zapatos tienes?"));

if (paresDeZapatos < 2) {
  alert("Calidad por sobre cantidad!");
} else if (paresDeZapatos >= 2 && paresDeZapatos <= 5) {
  alert("Lo justo para cada ocación!");
} else {
  alert("Una elección dificil todos los dias!");
}
```

### Ejercicio 23

El usuario esta apunto de cambiar su contraseña.
Pide al usuario que ingrese su nueva contraseña.
Pide al usuario que ingrese su nueva contraseña nuevamente.
Si las contraseñas son iguales, muestra un mensaje con "Contraseña cambiada con exito".
Si las contraseñas son diferentes, muestra un mensaje con "Las contraseñas no coinciden".
```js
// Solucion:
let contrasena1 = prompt("Ingresa tu nueva contraseña");
let contrasena2 = prompt("Ingresa tu nueva contraseña nuevamente");

if (contrasena1 === contrasena2) {
  alert("Contraseña cambiada con exito");
} else {
  alert("Las contraseñas no coinciden");
}
```

### Ejercicio 24

Pide al usuairo que ingrese 3 numeros.
Si el primer número es menor que el segundo, y el segundo menor que el tercero, muestra un mensaje con "Los números están en orden creciente. Que ordenado!".
Si el primer número es mayor que el segundo, y el segundo mayor que el tercero, muestra un mensaje con "Los números están en orden decreciente. Que ordenado!".
Si no se cumple ninguna de las condiciones anteriores, muestra un mensaje con "Los números no están ordenados. Que caotico".
```js
// Solucion:
let numero1 = parseInt(prompt("Ingresa el primer número"));
let numero2 = parseInt(prompt("Ingresa el segundo número"));
let numero3 = parseInt(prompt("Ingresa el tercer número"));

if (numero1 < numero2 && numero2 < numero3) {
  alert("Los números están en orden creciente. Que ordenado!");
} else if (numero1 > numero2 && numero2 > numero3) {
  alert("Los números están en orden decreciente. Que ordenado!");
} else {
  alert("Los números no están ordenados. Que caotico");
}
```

### Ejercicio 25

Pide al usuario que ingrese cuantas zanahorias ha comido en lo que va del año.
Si el número es mayor a 0, muestra un mensaje con "Que saludable! Llevas la cuenta?".
Si el usuario ingresa un texto vacio, o letras, muestra un mensaje con "No te preocupes, sería raro que lleves la cuenta".
```js
// Solucion:
let zanahoriasComidas = prompt("Cuantas zanahorias has comido en lo que va del año?");
if (zanahoriasComidas > 0) {
  alert("Que saludable! Llevas la cuenta?");
} else {
  alert("No te preocupes, sería raro que lleves la cuenta");
}
```

### Ejercicio 27

Pide al usuario que ingrese un numero.
Pide al usuario que ingrese una letra cualquiera.
Pide al usuario que ingrese una vocal.
Pide al usuario que ingrese una consonante.
Pide al usuario que ingrese el numero que ingreso al principio.
Si el usuario ingreso el mismo número al principio y al final, muestra un mensaje con "Bien hecho!".
Si el usuario no ingreso el mismo número al principio y al final, muestra un mensaje con "Error!".
```js
// Solucion:
let numero = parseInt(prompt("Ingresa un número"));
let letra = prompt("Ingresa una letra");
let vocal = prompt("Ingresa una vocal");
let consonante = prompt("Ingresa una consonante");
let numeroFinal = parseInt(prompt("Ingresa el número que ingresaste al principio"));

if (numero === numeroFinal) {
  alert("Bien hecho!");
} else {
  alert("Error!");
}
```

### Ejercicio 28

Pide al usuario que ingrese un número.
Pide al usuario que ingrese un segundo número.
Pide al usuario que ingrese un tercer número.
Si el primer numero es igual al tercero, y el segundo es diferente al primero, muestra un mensaje con "Los números 1, y 3, son iguales y el segundo es diferente al primero".
Si el primer número es igual al segundo, y el segundo es diferente al tercero, muestra un mensaje con "Los números 1, y 2, son iguales y el segundo es diferente al tercero".
Si todos los números son iguales, muestra un mensaje con "Todos los números son iguales".
```js
// Solucion:
let numero1 = parseInt(prompt("Ingresa el primer número"));
let numero2 = parseInt(prompt("Ingresa el segundo número"));
let numero3 = parseInt(prompt("Ingresa el tercer número"));

if (numero1 === numero3 && numero2 !== numero1) {
  alert("Los números 1, y 3, son iguales y el segundo es diferente al primero");
} else if (numero1 === numero2 && numero2 !== numero3) {
  alert("Los números 1, y 2, son iguales y el segundo es diferente al tercero");
} else if (numero1 === numero2 && numero2 === numero3) {
  alert("Todos los números son iguales");
}
```



### Ejercicio 29

Pide al usuario que ingrese un multiplo de 37.
Si el usuario ingresa un número que no es multiplo de 37, muestra un mensaje con "Error! Ese número no es multiplo de 37".
Si el usuario ingresa un número que es multiplo de 37, muestra un mensaje con "Bien hecho!".
```js
// Solucion:
let numero = parseInt(prompt("Ingresa un multiplo de 37"));

if (numero % 37 === 0) {
  alert("Bien hecho!");
} else {
  alert("Error! Ese número no es multiplo de 37");
}
```

### Ejercicio 30

Pide al usuario que ingrese el nombre de una constelación.
Si el usuario ingresa "orión", o "cinturon de orion", o "3 marias", o "tres marias" muestra un mensaje con "Esa constelación es muy conocida".
Si el usuario ingresa "cruz del sur", o "Cruz Del Sur", muestra un mensaje con "Asi que te encuentras en el hemisferio sur!".
Si el usuario ingresa "osa mayor", o "Osa Mayor", o "osa menor", o "Osa Menor", muestra un mensaje con "Asi que te encuentras en el hemisferio norte!".
Si el usuario ingresa cualquier otra cosa, muestra un mensaje con "Muy bien... creo".
```js
// Solucion:
let constelacion = prompt("Ingresa el nombre de una constelación");

if (constelacion === "orión" || constelacion === "cinturon de orion" || constelacion === "3 marias" || constelacion === "tres marias") {
  alert("Esa constelación es muy conocida");
} else if (constelacion === "cruz del sur" || constelacion === "Cruz Del Sur") {
  alert("Asi que te encuentras en el hemisferio sur!");
} else if (constelacion === "osa mayor" || constelacion === "Osa Mayor" || constelacion === "osa menor" || constelacion === "Osa Menor") {
  alert("Asi que te encuentras en el hemisferio norte!");
} else {
  alert("Muy bien... creo");
}
```

### Ejercicio 31


Pide al usuario que ingrese el número del mes de su nacimiento.
Pide al usuario que ingrese el número del dia de su nacimiento.
Muestra un mensaje al usuario con su signo zodiacal.
Ten en cuenta la siguiente tabla:

| Signo Zodiacal | Fecha de inicio | Fecha de fin   |
|----------------|-----------------|----------------|
| Aries          | Marzo 21        | Abril 19       |
| Tauro          | Abril 20        | Mayo 20        |
| Géminis        | Mayo 21         | Junio 20       |
| Cáncer         | Junio 21        | Julio 22       |
| Leo            | Julio 23        | Agosto 22      |
| Virgo          | Agosto 23       | Septiembre 22  |
| Libra          | Septiembre 23   | Octubre 22     |
| Escorpio       | Octubre 23      | Noviembre 21   |
| Sagitario      | Noviembre 22    | Diciembre 21   |
| Capricornio    | Diciembre 22    | Enero 19       |
| Acuario        | Enero 20        | Febrero 18     |
| Piscis         | Febrero 19      | Marzo 20       |

```js
// Solucion:
let mes = parseInt(prompt("Ingresa el número del mes de tu nacimiento"));
let dia = parseInt(prompt("Ingresa el número del día de tu nacimiento"));

if ((mes === 3 && dia >= 21) || (mes === 4 && dia <= 19)) {
  alert("Tu signo zodiacal es Aries");
} else if ((mes === 4 && dia >= 20) || (mes === 5 && dia <= 20)) {
  alert("Tu signo zodiacal es Tauro");
} else if ((mes === 5 && dia >= 21) || (mes === 6 && dia <= 20)) {
  alert("Tu signo zodiacal es Géminis");
} else if ((mes === 6 && dia >= 21) || (mes === 7 && dia <= 22)) {
  alert("Tu signo zodiacal es Cáncer");
} else if ((mes === 7 && dia >= 23) || (mes === 8 && dia <= 22)) {
  alert("Tu signo zodiacal es Leo");
} else if ((mes === 8 && dia >= 23) || (mes === 9 && dia <= 22)) {
  alert("Tu signo zodiacal es Virgo");
} else if ((mes === 9 && dia >= 23) || (mes === 10 && dia <= 22)) {
  alert("Tu signo zodiacal es Libra");
} else if ((mes === 10 && dia >= 23) || (mes === 11 && dia <= 21)) {
  alert("Tu signo zodiacal es Escorpio");
} else if ((mes === 11 && dia >= 22) || (mes === 12 && dia <= 21)) {
  alert("Tu signo zodiacal es Sagitario");
} else if ((mes === 12 && dia >= 22) || (mes === 1 && dia <= 19)) {
  alert("Tu signo zodiacal es Capricornio");
} else if ((mes === 1 && dia >= 20) || (mes === 2 && dia <= 18)) {
  alert("Tu signo zodiacal es Acuario");
} else if ((mes === 2 && dia >= 19) || (mes === 3 && dia <= 20)) {
  alert("Tu signo zodiacal es Piscis");
}
```

### Ejercicio 33

Alguien estuvo jugando al ta-te-ti y el juego quedo de la siguiente manera:

  X  |  -  |  O
  -  |  -  |  -
  X  |  -  |  -

Si las filas estuvieran numeradas de arriba hacia abajo, de 1 a 3, y las columnas de izquierda a derecha, de 1 a 3.
Pide al usuario que ingrese el número de la fila y el número de la columna donde quiere poner la siguiente "O".
Si el usuario ingresa la fila 2 y la columna 1, muestra un mensaje "Genio de la estrategia mundial! bloqueaste la victoria de X!".
Si el usuario ingresa valores que corresponden a una casilla ocupada, muestra un mensaje "Esa casilla ya está ocupada!".
Si el usuario ingresa valores que no corresponden a una casilla, muestra un mensaje "Esa casilla no existe!".
Si el usuario ingresa otra casilla que no bloquee la victoria de X, muestra un mensaje "Mmm... X gana en el siguiente turno!".
Nota: Dentro de un alert(). Puedes utilizar \n para hacer saltos de linea si utilizas un string con comillas dobles.
```js
// Solucion:
alert("Dado el siguiente tablero de ta-te-ti:\n  X  |  -  |  O\n  -  |  -  |  -\n  X  |  -  |  -\n Te toca jugar con 'O'!");
let fila = parseInt(prompt("Ingresa el número de la fila donde quieres poner la siguiente 'O'\n  X  |  -  |  O\n  -  |  -  |  -\n  X  |  -  |  -\n"));
let columna = parseInt(prompt("Ingresa el número de la columna donde quieres poner la siguiente 'O'\n  X  |  -  |  O\n  -  |  -  |  -\n  X  |  -  |  -\n"));

if (fila === 2 && columna === 1) {
  alert("Genio de la estrategia mundial! bloqueaste la victoria de X!");
} else if (fila === 1 && columna === 1) {
  alert("Esa casilla ya está ocupada!");
} else if (fila === 1 && columna === 3) {
  alert("Esa casilla ya está ocupada!");
} else if (fila === 3 && columna === 1) {
  alert("Esa casilla ya está ocupada!");
} else if (fila < 1 || fila > 3 || columna < 1 || columna > 3) {
  alert("Esa casilla no existe!");
} else {
  alert("Mmm... X gana en el siguiente turno!");
}
```

### Ejercicio 34

Pide al usuario que ingrese una marca de auto.
Pide al usuario que ingrese otra marca de auto.
Pide al usuario que ingrese una tercera marca de auto.
Si el usuario ingresa "ferrari", "lamborghini", o "porsche" en cualquiera de sus respuestas, muestra un mensaje con "Asi que te gustan los autos deportivos!".
Si el usuario ingresa "toyota", "honda", o "nissan" en cualquiera de sus respuestas, muestra un mensaje con "Asi que te gustan los autos japoneses!".
Si el usuario ingresa "ford", "chevrolet", o "dodge" en cualquiera de sus respuestas, muestra un mensaje con "Asi que te gustan los autos americanos!".
```js
// Solucion:
let marca1 = prompt("Ingresa una marca de auto");
let marca2 = prompt("Ingresa otra marca de auto");
let marca3 = prompt("Ingresa una tercera marca de auto");

if (
  (marca1 === "ferrari" || marca2 === "ferrari" || marca3 === "ferrari") ||
  (marca1 === "lamborghini" || marca2 === "lamborghini" || marca3 === "lamborghini") ||
  (marca1 === "porsche" || marca2 === "porsche" || marca3 === "porsche")
) {
  alert("Asi que te gustan los autos deportivos!");
} else if (
  (marca1 === "toyota" || marca2 === "toyota" || marca3 === "toyota") ||
  (marca1 === "honda" || marca2 === "honda" || marca3 === "honda") ||
  (marca1 === "nissan" || marca2 === "nissan" || marca3 === "nissan")
) {
  alert("Asi que te gustan los autos japoneses!");
} else if (
  (marca1 === "ford" || marca2 === "ford" || marca3 === "ford") ||
  (marca1 === "chevrolet" || marca2 === "chevrolet" || marca3 === "chevrolet") ||
  (marca1 === "dodge" || marca2 === "dodge" || marca3 === "dodge")
) {
  alert("Asi que te gustan los autos americanos!");
}
```

## Bucles o Ciclos

### Ejercicio 35

Muestra los números del 1 al 10 utilizando un bucle for y alert().
```js
// Solucion
for (let i = 1; i <= 10; i++) {
  alert(i);
}
```

### Ejercicio 36

Suma los números del 1 al 10 utilizando un bucle for y muestra el resultado con alert().
```js
// Solucion
let suma = 0;

for (let i = 1; i <= 10; i++) {
  suma += i;
}

alert(suma);
```

### Ejercicio 37

Muestra los números pares del 1 al 10 utilizando un bucle for y alert().
```js
// Solucion
for (let i = 2; i <= 10; i += 2) {
  alert(i);
}
```

### Ejercicio 38

Pide al usuario un número.
Muestra los números impares del 1 al numero ingresado utilizando un bucle for y alert().
```js
// Solucion
let numero = parseInt(prompt("Ingresa un número"));

for (let i = 1; i <= numero; i += 2) {
  alert(i);
}
```

### Ejercicio 39

Crea un Array vacio con el nombre "nombres".
Pide al usuario que ingrese un nombre
Guarda el nombre en el array
Pide al usuario que ingrese otro nombre
Guarda el nombre en el array
Pide al usuario que ingrese un tercer nombre
Guarda el nombre en el array
Muestra los nombres ingresados utilizando un bucle for y alert().
```js
// Solucion
let nombres = [];

nombres.push(prompt("Ingresa un nombre"));
nombres.push(prompt("Ingresa otro nombre"));
nombres.push(prompt("Ingresa un tercer nombre"));

for (let i = 0; i < nombres.length; i++) {
  alert(nombres[i]);
}
```

### Ejercicio 40

Crea un Array vacio con el nombre "numeros".
Pide al usuario que ingrese un numero
Guarda el numero en el array
Pide al usuario que ingrese otro numero
Guarda el numero en el array
Pide al usuario que ingrese un tercer numero
Guarda el numero en el array
Muestra los numeros ingresados utilizando un bucle for y alert().
```js
// Solucion
let numeros = [];

numeros.push(parseInt(prompt("Ingresa un número")));
numeros.push(parseInt(prompt("Ingresa otro número")));
numeros.push(parseInt(prompt("Ingresa un tercer número")));

for (let i = 0; i < numeros.length; i++) {
  alert(numeros[i]);
}
```

### Ejercicio 41

Crea un Array vacio con el nombre "sumandos".
Pide al usuario que ingrese 3 numeros
Guarda cada numero en el array
Muestra el total de la suma de todos los numeros ingresados
```js
// Solucion

let sumandos = [];

sumandos.push(parseInt(prompt("Ingresa un número")));
sumandos.push(parseInt(prompt("Ingresa otro número")));
sumandos.push(parseInt(prompt("Ingresa un tercer número")));

let suma = 0;
for(let i = 0; i < sumandos.length; i++) {
  suma += sumandos[i];
}

alert(suma);
```

### Ejercicio 42

Pide al usuario un numero y guardalo en una variable con nombre "cantidadDeNombres".
Crea un Array vacio con el nombre "nombres".
Pide al usuario que ingrese tantos nombres como la cantidad de nombres que ingreso al principio.
Guarda cada uno de los nombres ingresados en el array
Muestra los nombres ingresados utilizando un bucle for y alert().
```js
// Solucion
let cantidadDeNombres = parseInt(prompt("Ingresa la cantidad de nombres que deseas ingresar"));
let nombres = [];

for (let i = 0; i < cantidadDeNombres; i++) {
  nombres.push(prompt("Ingresa un nombre"));
}

for (let i = 0; i < nombres.length; i++) {
  alert(nombres[i]);
}
```

### Ejercicio 43

Crea un bucle while
Dentro del bucle, pide al usuario que ingrese un número.
Dentro del bucle, muestra un alert que diga "El número ingresado es: " seguido del número ingresado.
Dentro del bucle, muestra un alert que diga "Si escribes 'salir' saldrás del bucle".
Como condicion de salida del bucle, evalua si el usuario ingreso la palabra "salir".
```js
// Solucion

let numero = "";

while (numero !== "salir") {
  numero = prompt("Ingresa un número");
  alert(`El número ingresado es: ${numero}`);
  alert("Si escribes 'salir' saldrás del bucle");
}
```

### Ejercicio 44

Utilizando un bucle while, pide al usuario que ingrese tantos nombres como quiera.
Guarda cada nombre en un array.
Termina el bucle cuando el usuario ingrese la palabra "salir".
Muestra los nombres ingresados utilizando un bucle for y alert().
Nota: Asegurate de no guardar "salir" en el array.
```js
// Solucion
let nombres = [];
let nombre = "";

while (nombre !== "salir") {
  nombre = prompt("Ingresa un nombre");
  if (nombre !== "salir") {
    nombres.push(nombre);
  }
}

for (let i = 0; i < nombres.length; i++) {
  alert(nombres[i]);
}
```

### Ejercicio 45

Utilizando un bucle while, pide al usuario que ingrese tantos números como quiera.
Guarda cada número en un array.
Termina el bucle cuando el usuario ingrese la palabra "salir".
Muestra el promedio de los números ingresados.
```js
// Solucion
let numeros = [];
let numero = "";

while (numero !== "salir") {
  numero = prompt("Ingresa un número");
  if (numero !== "salir") {
    numeros.push(parseInt(numero));
  }
}

let suma = 0;
for (let i = 0; i < numeros.length; i++) {
  suma += numeros[i];
}

let promedio = suma / numeros.length;
```

### Ejercicio 46

Utilizando un bucle while, pide al usuario que ingrese tantos alumnos como quiera.
Para cada alumno pregunta, nombre y apellido.
Guarda cada alumno en un array.
Termina el bucle cuando el usuario ingrese la palabra "salir".
Muestra los nombre y apellido de cada alumno utilizando un bucle for y alert().
```js
// Solucion
let alumnos = [];
let alumno = "";

while (alumno !== "salir") {
  let nombre = prompt("Ingresa el nombre del alumno");
  let apellido = prompt("Ingresa el apellido del alumno");
  alumno = `${nombre} ${apellido}`;
  if (alumno !== "salir") {
    alumnos.push(alumno);
  }
}

for (let i = 0; i < alumnos.length; i++) {
  alert(alumnos[i]);
}
```

### Ejercicio 47

Pide al usuario que ingrese tantos nombres como quiera.
Guarda cada nombre en un array.
Termina el bucle cuando el usuario ingrese la palabra "salir".
Pide al usuario que ingrese el nombre de un alumno.
Muestra un mensaje con "El alumno esta en la lista" si el nombre ingresado esta en el array.
Muestra un mensaje con "El alumno no esta en la lista" si el nombre ingresado no esta en el array.
```js
// Solucion
let nombres = [];
let nombre = "";

while (nombre !== "salir") {
  nombre = prompt("Ingresa un nombre");
  if (nombre !== "salir") {
    nombres.push(nombre);
  }
}

let alumno = prompt("Ingresa el nombre de un alumno a buscar");
let estaEnLaLista = false;

for (let i = 0; i < nombres.length; i++) {
  if (nombres[i] === alumno) {
    estaEnLaLista = true;
  }
}

if (estaEnLaLista) {
  alert("El alumno esta en la lista");
} else {
  alert("El alumno no esta en la lista");
}
```

### Ejercicio 48

Pide al usuario que ingrese tantos planetas y distancias como quiera.
Del planeta tienes que pedir el nombre, y la distancia es un numero entero.
Guarda cada planeta y distancia en un array.
Termina el bucle cuando el usuario ingrese la palabra "salir".
Muestra una cadena de texto donde aparezca el nombre de cada planeta ingresado, seguido de tantos puntos como distancia ingresada.
Ejemplo: "Terra............Zolara.......Nexus.........."
```js
// Solucion
let planetas = [];

let planeta = "";
while (planeta !== "salir") {
  planeta = prompt("Ingresa el nombre de un planeta");
  if (planeta !== "salir") {
    let distancia = parseInt(prompt(`Ingresa la distancia de ${planeta}`));
    planetas.push([planeta, distancia]);
  }
}

let cadena = "";
for (let i = 0; i < planetas.length; i++) {
  cadena += planetas[i][0];
  for (let j = 0; j < planetas[i][1]; j++) {
    cadena += ".";
  }
}
```

# Ejercicios de programación en JavaScript Repartido 2

## Funciones

### Ejercicio 49

Crea una función llamada `saludar` que muestre un mensaje con "Hola Mundo!".
```js
```

### Ejercicio 50

Crea una función llamada `saludar` que reciba un nombre como argumento y muestre un mensaje con "Hola " seguido del nombre.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un nombre y luego llamar a la función con el nombre ingresado.
```js
```

### Ejercicio 51

Crea una función llamada `saludar` que reciba un nombre y un apellido como argumentos y muestre un mensaje con "Hola " seguido del nombre y apellido.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un nombre y un apellido y luego llamar a la función con el nombre y apellido ingresados.
```js
```

### Ejercicio 52

Crea una función llamada `calcularEdad` que reciba un año de nacimiento y muestre un mensaje con la edad que cumpliría en el año actual.
```js
```

### Ejercicio 53

Crea una función llamada `calcularEdad` que reciba un año de nacimiento y un año actual como argumentos y muestre un mensaje con la edad que cumpliría en el año actual.
Para probar la función, puedes usar prompt() para pedir los parametros y luego llamar a la función con los parametros ingresados.
```js
```

### Ejercicio 54

Crea una función llamada `cambiarTextoAMinusculas` que reciba un texto como argumento y muestre un mensaje con el texto en minusculas.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un texto y luego llamar a la función con el texto ingresado.
```js
```

### Ejercicio 55

Crea una función llamada `cambiarTextoAMayusculas` que reciba un texto como argumento y muestre un mensaje con el texto en mayusculas.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un texto y luego llamar a la función con el texto ingresado.
```js
```

### Ejercicio 56

Crea una función llamada `sumar` que reciba dos numeros como argumentos y muestre un mensaje con la suma de los dos numeros.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese dos numeros y luego llamar a la función con los numeros ingresados.
```js
```

### Ejercicio 57

Crea una función llamada `sumar` que reciba dos numeros como argumentos y devuelva usando `return` la suma de los dos numeros.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese dos numeros y luego llamar a la función con los numeros ingresados y mostrar el resultado con alert().
```js
```

### Ejercicio 58

Crea una función llamada `identificarOperador` que recibe una cadena de texto con un signo de operador matematico (+, -, *, /) y muestra un mensaje con el nombre del operador.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un signo de operador y luego llamar a la función con el signo ingresado.
```js
```

### Ejercicio 59

Crea una función llamada `agregarIVA` que recibe un precio como argumento y devuelve el precio con el IVA agregado.
El IVA es del 23%.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un precio y luego llamar a la función con el precio ingresado y mostrar el resultado con alert().
```js
```

### Ejercicio 60

Crea una función llamada `calcularAreaTriangulo` que recibe la base y la altura de un triangulo como argumentos y devuelve el area del triangulo.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese la base y la altura y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 61

Crea una función llamada `calcularAreaRectangulo` que recibe el largo y el ancho de un rectangulo como argumentos y devuelve el area del rectangulo.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese el largo y el ancho y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 62

Crea una función llamada `calcularAreaCirculo` que recibe el radio de un circulo como argumento y devuelve el area del circulo.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese el radio y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 63

Crea una función llamada `calcularAreaCuadrado` que recibe el lado de un cuadrado como argumento y devuelve el area del cuadrado.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese el lado y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 64

Crea una función llamada `validarSiEsNumero` que recibe un argumento y devuelve `true` si el argumento es un número y `false` si no lo es.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un valor y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 65

Crea una función llamada `validarCantidadDeCaracteres` que recibe un texto, y un numero de caracteres esperado. Devuelve `true` si el texto tiene la cantidad de caracteres esperada y `false` si no.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un texto y un numero de caracteres esperado y luego llamar a la función y mostrar el resultado con alert().
```js
```

### Ejercicio 66

Crea una función llamada `devolverComoArray` que recibe tres argumentos y devuelve un array con los tres argumentos.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese tres valores y luego llamar a la función y mostrar el resultado con un `for`` y un alert().
```js
```

### Ejercicio 67

Crea una función llamada `devolverNumeroAleatorio` que recibe un numero como argumento y devuelve un numero aleatorio entre 0 y el numero ingresado.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un numero y luego llamar a la función y mostrar el resultado con alert().
Utiliza `Math.random() * numeroMaximo` para obtener un numero aleatorio entre 0 y numeroMaximo.
```js
```

### Ejercicio 68

Crea una función llamada `devolverArrayDeNumerosAleatorios` que recibe como argumento un numero y devuelve un array con la cantidad de numeros aleatorios entre 0 y 255 que se indique en el argumento.
Para probar la función, puedes usar prompt() para pedir al usuario que ingrese un numero y luego llamar a la función y mostrar el resultado con un `for` y un alert().
```js
```
