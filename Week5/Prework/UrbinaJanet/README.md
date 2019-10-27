## Preguntas de Prework

#### Teoría:

1. Investiga el ciclo de vida de una app y haz el diagrama correspondiente donde se vean todos los estados.

   Cuando se inicia una aplicación, carga su archivo de interfaz de usuario principal, le pide al delegado de la aplicación que inicialice las estructuras de datos de la aplicación y restaura cualquier estado anterior de la interfaz.	



<img src="https://docs-assets.developer.apple.com/published/52c7b459e7/76e68c08-6b09-4bac-8a00-44df7a097a43.png" alt="When an app launches, it loads its main UI file, asks the app delegate to initialize the app's data structures, and restores any previous interface state. " style="zoom: 50%;" />

`Lanzamiento de la aplicación y secuencia de inicialización` https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app/about_the_app_launch_sequence



Un usuario pulsa sobre una app y se inicia el primer proceso del conjunto donde se pasa de estado ***not running*** a ***inactive*** en el Launch Time. Ante determinados estados de la app, el desarrollador puede capturar los eventos que aparecen a la derecha y lanzar parte de su código particular. Una vez que termina el Launch Time la app pasa a estado activo y es entonces cuando el programador inicia su trabajo en el punto First Initialization.

En estado ***Active*** el programador trabaja sobre el proceso running, el cual es un bucle infinito de ejecución.

En el momento en que el usuario pulsa el botón Home del iPhone la aplicación pasa a estado ***Suspended*** pero antes de eso la aplicación podrá guardar estados de la ejecución para retomar a la vuelta justo donde los dejó.

*Los metodos `main()` y `UIApplicationMain()` no son sobreescribibles por el programador.

<img src="https://docs-assets.developer.apple.com/published/74077a8107/ec07a686-2315-4700-9415-6485cc3bcfff.png" alt="A figure showing the state changes for a watchOS app." style="zoom:50%;" />

`app life cycle` https://developer.apple.com/documentation/watchkit/working_with_the_watchos_app_life_cycle



**Responder a eventos de ciclo de vida basados en aplicaciones**

El `UIKit` entrega todos los eventos del ciclo de vida al objeto.

El delegado de la aplicación administra todas las ventanas de su aplicación, incluidas las que se muestran en pantallas separadas. Como resultado, las transiciones de estado de la aplicación afectan la interfaz de usuario completa de la aplicación.

<img src="https://docs-assets.developer.apple.com/published/c63cd35863/4d403429-fa30-4706-863f-5e3617ee21d0.png" alt="Una ilustración que muestra las transiciones de estado para una aplicación sin escenas.  La aplicación se inicia en el estado activo o en segundo plano.  Una aplicación pasa por el estado inactivo." style="zoom:50%;" />

`UIKit eventos ciclo de vida` https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle

Después del inicio, el sistema coloca la aplicación en el estado inactivo o en segundo plano, dependiendo de si la UI está a punto de aparecer en la pantalla. Cuando se inicia en primer plano, el sistema pasa la aplicación al estado activo automáticamente. Después de eso, el estado fluctúa entre activo y en segundo plano hasta que la aplicación finaliza. 

---------------------------------------------------------------------------------------------------------------------------

El ciclo de vida del controlador  `*UIViewController*` 

<img src="https://miro.medium.com/max/749/1*3NZEBU2U0vxrwV2M52pUUA.png" alt="img" style="zoom:70%;" />

`UIViewController` https://blog.nearsoftjobs.com/desarrollar-aplicaciones-para-ios-por-donde-comienzo-b704c84a8434

`ViewDidLoad`, `viewWillAppear`, `viewDidAppear`, `viewWillDisappear`.



2. Investigar la arquitectura MVC.

El `*Modelo Vista Controlador (MVC)*` es un patrón de diseño donde los objetos están divididos según su propósito.

​	**Modelo**: Maneja los datos de la app y la lógica del negocio. La persistencia de datos, los objetos modelo, los parsers deberían ser clases de tipo Modelo.

​	**Vista:** Provee la representación visual de la data (interfaz). Las clases a menudo son reutilizables porque no contienen una lógica específica.

​	**Controlador:** Actúa como el puente entre el modelo y la vista, moviendo la data entre ellos. 



<img src="https://koenig-media.raywenderlich.com/uploads/2019/01/01-MVC-Diagram-480x241.png" alt="MVC Diagram" style="zoom: 67%;" />

`Modelo Vista Controlador` https://www.raywenderlich.com/1000705-model-view-controller-mvc-in-ios-a-modern-approach



La siguiente representación es la estructura típica de UIKit app

<img src="https://docs-assets.developer.apple.com/published/4e7c26b6ad/ff7aa08f-4857-44ce-88d5-7dacbef84509.png" alt="An app contains a main app controller and one or more view controllers. It also includes model objects representing the app's data, and it contains window and view objects for the app's interface." style="zoom: 50%;" />

 

`Estructura UIKit app.` https://developer.apple.com/documentation/uikit/about_app_development_with_uikit



*Otros recursos:*

- **Role of View Controllers.** https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/index.html 

- **UIViewController.** https://developer.apple.com/documentation/uikit/uiviewcontroller 

- **UIView: Ciclo de Vida.** https://jcurtiblog.wordpress.com/2016/12/30/uiview-ciclo-de-vida/

- **MVC.** https://www.efectoapple.com/patron-diseno-model-view-controller-mvc/

- **Model-View-Controller.** https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html

  

3. Investiga las diferencias entre una clase y una estructura en Swift.

Similitudes:

- Pueden tener propiedades de cualquier tipo para almacenar información o para calcular
- Ambos soportan métodos de instancia y métodos de tipo.
- Definir subscripts para permitir el acceso a sus valores.
- Definir inicializadores para establecer su estado inicial.
- Pueden ser extendidas sus funcionalidades.
- Pueden ajustarse a protocolos.

Diferencias:

| Clases                                         | Estructuras                             |
| ---------------------------------------------- | --------------------------------------- |
| **No** generan automáticamente inicializadores | Generan automáticamente inicializadores |
| De tipo referencia                             | De tipo valor                           |
| Soportan herencia simple                       | **No** manejan herencia                 |
| Se crean en el **Heap**                        | Se crean en el **Stack**                |
| Con **Var** se modifican sus propiedades       | Todo es inmutable por defecto           |



*Otros recursos:*

- **Struct y Class.** https://blog.nearsoftjobs.com/comparativas-entre-struct-y-class-en-swift-8f9378aba8f6  
- **Struct y Class justcode.** https://justcodeit.io/5-diferencias-entre-un-struct-y-una-class-en-swift/
- **Struct y Class Swift desde cero.** https://code.tutsplus.com/es/tutorials/swift-from-scratch-an-introduction-to-classes-and-structures--cms-23197
- **Struct y Class kodigo swift.** https://kodigoswift.com/swift-estructuras-y-clases/
- **Struct y Class applecoding.** https://applecoding.com/cursos/swift-leccion-3-clases-metodos-structs-herencia



1. Investiga a qué se refiere que Swift sea un lenguaje orientado a protocolos.

La funcionalidad de los protocolos de Swift está diseñada para salvar algunos inconvenientes del uso de clases de la Programación Orientada a Objetos.

Un protocolo define un modelo de métodos, propiedades.

El protocolo puede ser adoptado por una clase, estructura o enumeración

A través de los protocolos se definen las cabeceras de la funciones o propiedades calculadas que el struct debe tener, pero no incluye la implementación o el cuerpo del código, de esta forma se puede crear cualquier estructura que conforme el protocolo determinado y proporcionar un código diferente para cada método o propiedad almacenada.

Los protocolos pueden usarse como extensiones de tipos del propio sistema y conseguir una funcionalidad específica.

*Otros recursos:*

- **Protocolos solidgear.** https://solidgeargroup.com/introduccion-programacion-orientada-protocolos-swift/?lang=es
- **Protocolos medium.** https://medium.com/ios-en-espa%C3%B1ol/programaci%C3%B3n-orientada-a-protocolos-122f0bfa3cbf
- **Protocolos  cursodeios.** https://cursodeios.github.io/ios/swift/2017/01/01/Introduction-to-protocol-oriented-programming-in-swift.html
- **Protocolos globallogic.** https://www.globallogic.com/latam/2016/09/13/la-programacion-orientada-a-protocolos-en-swift/ 
- **Protocolos applecoding.** https://applecoding.com/analisis/programacion-orientada-protocolos-evolucion-swift-2
