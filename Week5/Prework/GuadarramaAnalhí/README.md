# Prework week 5

**Fecha de entrega:** 27 Oct. 2019 a las 23:59 hrs mediante un **pull request**

### Introducción 

Para esta sesión de Prework, es necesario que contestes las siguientes preguntas en el archivo **README.md** dentro de la carpeta **Week$i/Prework.** Para hacer esto, necesitarás usar un editor de Markdown o tu editor de texto favorito. 

**$i** equivale al número de semana en la cual nos encontramos. 

#### **Notas importantes** 

Las preguntas deberán ser respondidas de manera individual, es decir, cada estudiante deberá tener contestado la serie de preguntas dentro del  archivo **README.md**. Sin embargo, es completamente válido que trabajen en equipo para contestarlas. 

Al inicio de cada sesión, haremos preguntas sobre el Prework. Les recomendamos ampliamente que realicen el Prework para que no se atrasen. 

---

### Preguntas de Prework 

#### Teoría: 

1. Investiga el ciclo de vida de una app y haz el diagrama correspondiente donde se vean todos los estados. 
 i. Ciclo de vida de una app y haz un esquema de todos los estados por los que pasa un app.  
     Se refiere a los estados por los que pasa una app desde que se ejecuta.  
      
      **Not Running**: La app no ha sido ejecutada o se ejecutó pero fue detenida por el sistema.  

      **Inactive**: La aplicación se ejecuta en primer plano pero actualmente no recibe eventos. (Sin embargo, puede estar ejecutando otro código). Una aplicación generalmente permanece en este estado solo brevemente mientras pasa a un estado diferente.  

      **Active**: La app se ejecuta en primer plano y recive eventos. Es el modo normal de las apps en primer plano.  

      **Background**: La app esta en segundo plano y ejecuta código. La mayoría de las apps entran en este estado brevemente antes de ser suspendidas. Sin embargo una app que solicita tiempo de ejecución adicional puede estar en este estado durante un periodo mayor de tiempo. Además una app que se inicia directamente en segundo plano entra en este estado en lugar de estado inactivo.  

      **Suspended**: La app esta en segundo plano pero no ejecuta código. El sistema mueve las apps a este estado automaticamente. Mientras está suspendida, una aplicación permanece en la memoria pero no ejecuta ningún código.  

      Mientraa las app va de un estado a otro. Ciertos métodos son llamados por iOS.  

      **application:willFinishLaunchingWithOptions:** Este método es la primera oportunidad de su aplicación para ejecutar código en el momento del lanzamiento.  

      **application:didFinishLaunchingWithOptions:** Este método tee permite realizar cualquier inicialización final antes de que la appp se muestre al usuario.  

      **applicationDidBecomeActive:** Este método permite que la app se ejecute en primer plano.   

      **applicationWillResignActive:** Este método permite saber que la app esta en transición de ser app de primer plano a segundo plano. Permite poner la App en estado inactivo.  

      **applicationDidEnterBackground:** Te permite saber que tu app ahora esta ejecutandose en segundo plano y que puede ser suspendida en cualquier momento.  

      **applicationWillEnterForeground:** Te permite saber que tu app se esta moviendo del segundo plano al primer plano. Pero aun no esta activa.  

      **applicationWillTerminate:** Te permite saber que tu app se esta finalizando. Este metodo no es llamado si tu app esta suspendida. 

       ![LifeCycle](https://github.com/analhi7/ECC-Laboratoria/blob/master/Week3/Prework/images/LIFECYCLE%20APP.jpeg) 

2. Investigar la arquitectura MVC.
 Es un estilo de arquitectura de software llamado Modelo Vista Controlador, que separa los datos de la app, la interfaz de usuario y la lógica de control.  
- Modelos: Es la capa donde se trabaja con los datos. Acceso a la base de datos, guardar datos, consultas, actualizar datos, etc. 

- Vistas: Contiene el código de la app que permite la visualización de la interfaz. 

- Controladores: Contiene el código necesario para responder a las acciones que el usuario solucuta en la applicación como visualizar un elemento, realizar una compra, hacer una búsqueda. Es el enlace entre las vistas y los modelos. 

    1. El usuario realiza una solicitud  
    2. El controlador comunica tanto a modelos como a vistas
    3. Las vistas puden solicitar más informaciín a los modelos para producir una salida. O el controlador puede ser el que solicite los datos para enviarlos a las vistas.
    4. Las vistas envian al usuario una salida. 


3. Investiga las diferencias entre una clase y una estructura en Swift.  
 - Las clases no tiene un inicializador. Siempre es necesario crear un inicializador al escribir propiedades. Las estructuras si tienen inicializador.  

 - Se puede crear una clase basada en otra que ya existe. Esta hereda todas las propiedades y métodos de la original más las propias de la clase. Una estructura no hereda. 

 - Cuando copias una clase la original y la copia apuntan a la misma cosa. Por lo que al cambiar una cambia la otra. En las estructuras no sucede así. Al copiar una estructura y hacer un cambio, la original no cambia. Las clases son datos por referencia y las estructuras datos por valor.

 - Las clases tiene deinitializators, que es código que se ejecuta cuando una instancia de una clase es destruida.

 - En las clases es posible cambiar las propiedades sin importar si son declaradas como constantes o como variables. En los structs es necessario agregar la palabra mutating para poder hacer un cambio de este tipo. 

  
4. Investiga a qué se refiere que Swift sea un lenguaje orientado a protocolos.

Se refiere a su modelo de abstracción, en el que se usan tipos de datos por valor, que no necesitan inicializarse y no obligan a usar modelos de instanciación de datos. Por ello existen los structs que aunque no soportan herencia, es a través de los protocolos que se puede acceder a la abstracción. En los protocolos se definen las cabeceras de las funciones o propiedades calculadas pero no incluyen implementación o el cuerpo del código.De esta forma, podemos crear cualquier estructura que conforme el protocolo determinado y proporcionar un código diferente para cada método o propiedad almacenada dentro. 
  

#### Swift: 

** Los ejercicions háganlos en un Swift Playground o en http://online.swiftplayground.run/ si no tienes Mac y guarda el archivo con extensión **.swift**

*** Entra a https://www.hackingwithswift.com/sixty y haz los ejercicios siguientes:

1. Classes 
2. Classes
3. Protocols and extensions 
4. Optionals