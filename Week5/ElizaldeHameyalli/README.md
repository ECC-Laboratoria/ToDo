# Prework week 5

**Fecha de entrega:** 27 Oct. 2019 a las 23:59 hrs mediante un **pull request**

### Preguntas de Prework

#### Teoría:

#### 1. Ciclo de Vida.

Los ciclos de vida de una aplicación son importantes durante el desarrollo y pueden ser puntos vitales para una experiencia de usuario agradable, las aplicaciones con Swift cuentan con diferentes estados.

Los estados de una app son:

**No se está ejecutando**  
Está instalada en el dispositivo pero no se ha abierto o ejecutado.

**Inactiva**  
La aplicación se está ejecutando en primer plano , pero no está recibiendo eventos (puede estar ejecutando código). La aplicación generalmente se encuentra en este estado en un intervalo muy rápido durante la transición al siguiente.

**Activo**  
La aplicación se ejecuta en primer plano y comienza a recibir eventos. Es el estado en el que el usuario está utilizando la aplicación.

**Fondo**  
La aplicación está en segundo plano y ejecuta código. Está en este estado por un corto tiempo mientras se prepara para el próximo estado. Es posible que se le solicite un tiempo de ejecución adicional y que también se cargue directamente en este estado en lugar de estar inactivo.

**Suspendido**  
La aplicación está en segundo plano pero no ejecuta código. El sistema mueve la aplicación a este estado pero no notifica al usuario cuando lo hace. Mientras está suspendida, la aplicación permanece en la memoria pero no ejecuta ningún código.
Si se produce una condición de poca memoria, el sistema puede mover la aplicación al estado 'No se está ejecutando', liberando así la memoria.

- **viewDidLoad**: Es la primera función que se ejecuta y generalmente se llama una sola vez.

- **viewWillAppear**: Es el encargado de preparar las vistas.

- **viewDidAppear**: Es el encargado de mostrar la vista.

- **viewWillDisappear**: Este método se llama cuando la vista elimina de la jerarquía de vistas y llama al viewController de la siguiente vista.

- **viewDidDisappear**: Cuando este método se ejecuta la vista desaparece de la pantalla.

Más información en el medium de [Andrew Castro](https://www.linkedin.com/in/andrew-castro-17596b144/):
[Entendendo o ciclo de vida - App e ViewController](https://medium.com/mobicareofficial/entendendo-o-ciclo-de-vida-app-e-view-6e56a82579b9)

![https://medium.com/mobicareofficial/entendendo-o-ciclo-de-vida-app-e-view-6e56a82579b9](https://raw.githubusercontent.com/AcheZeta/ToDo/master/images/1_QLj3VD7UoyT0SYrVWzmKjg.jpeg)

![https://medium.com/good-morning-swift](https://miro.medium.com/max/1016/1*jb1Y17gwQCRi2XCKy7_QHQ.png)

#### 2. Arquitectura MVC.

![MVC](https://raw.githubusercontent.com/AcheZeta/ECC-Laboratoria/master/Week3/Prework/1200px-MVC-Process.svg.png)

El MVC o **Modelo-Vista-Controlador** es un patrón de arquitectura de software que, utilizando 3 componentes (Vistas, Models y Controladores) separa la lógica de la aplicación de la lógica de la vista en una aplicación. Es una arquitectura importante puesto que se utiliza tanto en componentes gráficos básicos hasta sistemas empresariales; la mayoría de los frameworks modernos utilizan MVC (o alguna adaptación del MVC) para la arquitectura, entre ellos podemos mencionar a Ruby on Rails, Django, AngularJS y muchos otros más. En este pequeño artículo intentamos introducirte a los conceptos del MVC.

Fuente: [Código Fácilito](https://codigofacilito.com/articulos/mvc-model-view-controller-explicado)

#### 3. Diferencias entre una clase y una estructura en Swift.

Las clases _(class)_ y estructuras _(struct)_ son similares.

Las **clases** hacen referencia un objeto, por lo que cuando se pasa una clase alrededor del programa se comparte y modifica el objeto al que se hizo referencia.  
Cuando pasa una **estructura** [o enumeración], lo que se pasa es una copia de la estructura. Entonces las modificaciones a las estructuras no se comparten.

**¿Cuáles son los factores comunes entre struct y class?**

- Definir propiedades para almacenar valores.
- Definir métodos para proporcionar funcionalidad.
- Definir subíndices para proporcionar acceso a sus valores - utilizando la sintaxis de subíndice
- Definir inicializadores para configurar su estado inicial
- Extender para ampliar su funcionalidad más allá de una - implementación predeterminada
- Cumple con los protocolos para proporcionar una - funcionalidad estándar de cierto tipo.

**Las clases tienen capacidades adicionales que las estructuras no tienen:**

- La herencia permite que una clase herede las - características de otra. Struct o enum no pueden hacer - herencia. Pero pueden confirmar los protocolos.
- La conversión de tipos le permite verificar e - interpretar el tipo de una instancia de clase en tiempo - de ejecución.
- Los desinicializadores permiten que una instancia de - una clase libere los recursos que ha asignado.
- El recuento de referencias permite más de una - referencia a una instancia de clase.

Fuente: [Difference between a struct and a class in Swift.](https://medium.com/@abhimuralidharan/difference-between-a-struct-and-a-class-in-swift-53e08df73714)

## **Structs** 🧱

Similares a las clases, usan la palabra reservada **Struct**

Las estructuras hacen una copia del elemento para poder modificar.

```
struct PastelStruct{
    var nombre : String
    var peso : Float
    var sabor : String
}
```

## **Classes**: 📑

Se crean usando la palabra reservada Class acompañado del nombre y requiere un método inicializador.

Las clases hacen referencia al elemento.

```
class Pastel{
var nombre : String
var peso : Float
var sabor : String
init (nombre:String, peso:Float, sabor:String){
self.nombre = nombre
self.peso = peso
self.sabor = sabor }
}
```

Para crear un objeto de esa clase:

```
var pastelChoco = Pastel(nombre:"Choco", peso:1.0, sabor:"Chocolate")
```

Y accedemos al objeto mediante
`print(pastelChoco.sabor)`

Se puede modificar

```
pastelChoco.peso = 2.5)
```

4. #### Swift, un lenguaje orientado a protocolos.

**Protocolos**

¿Qué es un protocolo? Son plantillas de especificación que definimos para crear unas reglas determinadas que queremos que se cumplan en una implementación

Fuente: [Programación orientada a protocolos, la evolución en Swift 2](https://applecoding.com/analisis/programacion-orientada-protocolos-evolucion-swift-2)

Protocolos: Le da funcionalidad a una estructura.

#### Swift:

** Los ejercicions háganlos en un Swift Playground o en http://online.swiftplayground.run/ si no tienes Mac y guarda el archivo con extensión **.swift\*\*

\*\*\* Entra a https://www.hackingwithswift.com/sixty y haz los ejercicios siguientes:

1. Classes
2. Classes
3. Protocols and extensions
4. Optionals
