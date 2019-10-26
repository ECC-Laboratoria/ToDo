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

4. Investiga a qué se refiere que Swift sea un lenguaje orientado a protocolos.

#### Swift:

** Los ejercicions háganlos en un Swift Playground o en http://online.swiftplayground.run/ si no tienes Mac y guarda el archivo con extensión **.swift\*\*

\*\*\* Entra a https://www.hackingwithswift.com/sixty y haz los ejercicios siguientes:

1. Classes
2. Classes
3. Protocols and extensions
4. Optionals
