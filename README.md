FScript
=======

FScript o FoxScript es un pequeño lenguaje de scripting desarrollado 100% en Visual Foxpro 9.0 con el único objetivo de _Personalizar_ los formularios en tiempo de ejecución.

## Problemática
En alguna ocasión nos habrá tocado modificar uno o varios formularios para aquellos clientes con requerimientos específicos, la acción común es hacer la modificación y compilar el proyecto pero luego aparece otro cliente con otro requerimiento sobre el mismo formulario y repetimos el proceso, luego aparece otro cliente y ya el código comienza a oler mal, entonces pensamos en crear códigos para los clientes y meterlo dentro de un `DO CASE` para personalizar según el cliente; tarde nos damos cuenta que terminamos con un pedazo de código _inmantenible_ que hasta nos resulta perezoso continuar.

La otra acción más drástica que he visto es crear una _"copia"_ del formulario y modificar la llamada según el cliente:

```xBase
DO CASE
CASE CODIGO_CLIENTE = 01 // COMERCIAL FULANITO
    DO FORM FACTURAS_FULANITO
CASE CODIGO_CLIENTE = 02 // COMERCIAL MENGANITO
    DO FORM FACTURAS_MENGANITO
ENDCASE
```

Algunos creerán que esto no es cierto pero creanme que lo es :)

Lo cierto es que para cada una de estas personalizaciones no hace falta modificar el formulario en tiempo de diseño sino más bien dejar una [puerta trasera](https://es.wikipedia.org/wiki/Puerta_trasera) para realizar las personalizaciones necesarias.

**FScript** fue creado exactamente para cubrir ese problema. Se trata de un pequeño [DSL](https://es.wikipedia.org/wiki/Lenguaje_espec%C3%ADfico_de_dominio) muy similar a [JavaScript](https://es.wikipedia.org/wiki/JavaScript) que nos permite obtener la referencia del control actual _(screen, formulario, command, pageframe, etc)_ y a través de esa referencia aplicar las distintas personalizaciones.

## Palabras Reservadas
```Javascript
break
continue
do
else
for
fn
if
in
of
return
var
_window
while
```

## Sintaxis
La sintaxis de FScript está inspirada en JavaScript con lo cual si ya conoces este lenguaje entonces no te costará nada aprenderlo. 

Veamos algunos ejemplos:


```Javascript
// Este es un comentario de una línea

/*
* Este sin embargo es
* otro comentario
* que permite múltiples
* líneas
*/

// Literales

// 1. String

"Este es un string sencillo y de comillas dobles";

'Este es otro string sencillo y de comillas simples';

`Este es otro string pero usando back ticks que permite interpolación`;

/*
* Secuencias de escape:
* Solo están permitidas para los strings de comillas dobles y simples.
*/

"Esta es una línea\r\nEsta es otra línea\r\n";
// Los escapes permitidos son:
// \t para TAB
// \r para retorno de carro o CR
// \n para line feed o LF
// \\ para escapar el back slash
// \" para escapar la comilla doble dentro de una cadena delimitada con comillas dobles.
// \' para escapar la comilla simple dentro de una cadena delimitada con comillas simples.

// 2. Números: todos los números son representados internamente por NUMBER.

1985; // entero
3.14159265; // decimal
16_795_371; // otro entero con mejora en la legibilidad

// 3. Boolean
true; 
false;

// 4. Operadores lógicos

true && false; // && se usa para las conjunciones
true || false; // || se usa para las disyunciones

// 5. Operadores aritméticos

5 + 5;
5 - 5;
5 * 5;
5 / 5;

// 6. Operadores relacionales

5 == 5;
5 != 5;
5 < 5;
5 <= 5;
5 > 5;
5 >= 5;

```

## Tipos de datos compuestos
```Javascript
// 1. Array
var dias = ["Lunes", "Miercoles", "Viernes"];
info(dias);

// 2. Diccionarios
var datos = {
    nombre: "Juan",
    apellido: "Peres",
    edad: 37
};
info(datos);
```

## Definición de variables
```Javascript
// Las variables se declaran con `var`
var nombre = "Pedro";
// También es posible definir variables sin asignarles algún valor inicial.
var apellido; // en este caso apellido es null
```

## Asignación de variables
```Javascript
// Una variable primero tiene que ser definida.
var nombre = "Pedro";
// luego puede ser reasignada
nombre = "Juan";
```

## Cuadros de diálogo
```Javascript
info("Este es un mensaje informativo", "Titulo opcional");
error("Este es un mensaje de error", "Titulo opcional");
warning("Este es un mensaje de advertencia", "Titulo opcional");
confirm("Este mensaje aparece como pregunta y muestra los botones 'Sí' y 'No'", "Titulo opcional");
display("Este es un mensaje tipo Wait Window");
```

## Interpolación de Cadenas
```Javascript
// La interpolación de cadenas se realiza con el string delimitado con back ticks
var nombre = "Juan";
var apellido = "Rodríguez";
// Interpolación
info(`Hola, mi nombre es ${nombre} y mi apellido es ${apellido}`);
```

## Control de Flujo
```Javascript
// 1. if / else
var nombre = "Juan";
if (nombre != null) {
    info(`Hola ${nombre}`);
} else {
    error("El nombre no puede estar vacío!");
}
```
## Iteradores
```Javascript
// 1. recorrer las propiedades (claves) de un objeto (diccionario) usando (for x in y)
var datos = {
    nombre: "Juan",
    apellido: "Peres",
    edad: 37
};

for (propiedad in datos) {
    var valor = datos[propiedad];
    display(`${propiedad}:${valor}`);
}
// 2. recorrer los índices de un array usando (for x in y)
var array = ["Julio", "Mario", "Vicente"];
for (indice in array) {
    display(indice);
}

// 3. recorrer los índices de una cadena usando (for x in y)
var cadena = "CONTENIDO DE LA CADENA";
for (indice in cadena) {
    display(indice);
}

// 4. recorrer los valores de un array usando (for x of y)
var array = ["Julio", "Mario", "Vicente"];
for (valor of array) {
    display(valor);
}

// 5. recorrer los valores de una cadena usando (for x of y)
var cadena = "CONTENIDO DE LA CADENA";
for (valor of cadena) {
    display(valor);
}

// 6. while
var i = 0;
while (i < 10) {
    info(i);
}
```
## Funciones
```Javascript
// 1. Las funciones son ciudadanos de primera clase
//    quiere decir que son tratadas como cualquier variable.
var sumar = fn(x, y) { return x + y; };
info(`5 + 4 es igual a ${sumar(5, 4)}`);

// 2. Las funciones permiten closures o funciones dentro de funciones (ámbito léxico)
var crearFuncion = fn() {
    var name = "Pedro";
    return fn() {
        display(name);
    };
};

var miFuncion = crearFuncion();
miFuncion(); // Pedro

// 3. Las funciones también son de alto orden (High Order)
//    quiere decir que se pueden pasar como parámetros y retornar.
var cuadrado = fn(x) { return x * x; };
var cubo = fn(fnDoble, x) { return fnDoble(x) * x; };
display(cubo(cuadrado, 3)); // 27
```

## Funciones integradas
Una vez familiarizados con la sintaxis del lenguaje ahora podemos centrarnos en el verdadero corazón de FScript que son las funciones de acceso a controles. Vamos a verlas paso a paso...

```Javascript
// 1. getControlByName(controlName): esta función devuelve la referencia de un control usando su nombre.
var txtCodigoCliente = _window.getControlByName('txtCodigoCliente');

// 2. getControlByPath(path): esta función devuelve la referencia de un control usando su ruta absoluta.
var txtCodigoPostal = _window.getControlByPath('pageFrame1.Page5.Container1.txtCodigoPostal');
// NOTA: en la ruta se debe comenzar a escribir pasado el control padre
// es decir, no hace falta escribir THISFORM si el control padre es el formulario.

// 3. getControlByClass(className): esta función devuelve las referencias de uno o varios controles
// tomando como base el nombre de su clase (propiedad 'class').
var listaDeBotones = _window.getControlByPath('CommandButton'); // devuelve Array
for (button of listaDeBotones) {
    button.callMethod('click'); // invoca el click de cada boton
}

// 5. delControlByName(controlName): elimina un control usando su nombre como referencia.
if (_window.delControlByName('txtCodigo')) {
    info('La caja de texto fue eliminada exitosamente!');
}

// 6. delControlByPath(path): elimina un control usando su ruta absoluta como referencia.
if (_window.delControlByPath('container1.pageframe1.label15')) {
    info('El label ya no molestará más :)');
}

// 7. delControlByClass(className): elimina todos los controles que cumplan con la clase dada.
if (_window.delControlByClass('CommandButton')) {
    info('Este formulario no tiene más botones!');
}

// 8. getProperty(propertyName): obtiene el valor de una propiedad o null si no existe.
var name = _window.getProperty('name');
if (name != null && name == 'frmClientes') {
    info('Estamos en el formulario equivocado!');
}

// 9. setProperty(propertyName): asigna un valor a una propiedad, error si no existe.
_window.setProperty('caption', 'Este es el nuevo caption del formulario o Screen!');

// 10. setProperties({diccionario}): ajusta propiedades de forma masiva usando un objeto diccionario.
_window.setProperties({
   caption: 'Nuevo caption!',
   height: 500,
   width: 800,
   movable: false,
   borderstyle: 2,
   titlebar: true,
   backcolor: rgb(255, 0, 0), // super rojo :)
   closable: false
});

// 11. newProperty(property, value): crea una propiedad en el objeto actual.
if (_window.newProperty('nombre', 'Pablo')) {
    info('La propiedad fue creada sin problemas!');
} else {
    error('No se pudo crear la propiedad \r\n es posible que ya exista!');
}

// 12. newProperties({diccionario}): crea una serie de propiedades basandose en un objeto diccionario.
_window.newProperties({
   nombre: 'Pablo',
   apellido: 'Peres',
   edad: 37
});
info(`El nombre es: ${_window.getProperty('nombre')}`);

// 13. callMethod(methodName, [args]): invoca un método del control actual y pasa una serie de parámetros.
_window.callMethod('facturar', 'CLIENTE', 'CODIGO', 'ARTICULO', 'PRECIO');
_window.callMethod('click'); // invoca el evento click del formulario.
```

## Funciones Nativas
FScript tiene pocas funciones integradas para el tratamiento de datos pero si en algún momento necesitas una función que no se encuentra disponible entonces puedes usar la función `native()` para invocar aquella que necesites.

```Javascript
    var formatoXML = "<nombre>PEDRO PERES</nombre><edad>37</edad>";
    // FScript no tiene función integrada para extraer datos de una cadena usando
    // un delimitador de inicio y fin pero no pasa nada porque podemos usar la 
    // función nativa de Fox llamada 'STREXTRACT' y bingooooooo.....!!!
    var nombre = native('strextract', formatoXML, '<nombre>', '</nombre>');
    info(`El nombre extraído del XML es: ${nombre}`);
```