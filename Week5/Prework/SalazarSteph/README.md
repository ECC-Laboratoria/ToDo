# Prework week 5


### Teoría: 

1. **Investiga el ciclo de vida de una app y haz el diagrama correspondiente donde se vean todos los estados.**

Cuando un usuario enciende su teléfono, NO se ejecutan aplicaciones más que las pertenecientes al sistema operativo. 

Solo hasta el momento en el que el usuario toca el icóno de nuestra aplicación, **Springboard** (parte del sistema operativo que opera la pantalla de inicio de iOS)  inicia la aplicación, aquí la aplicación y las bibliotecas compartidas que necesita ejecutar se cargarán en la memoria, mientras que Springboard "lanza" el *Launch Screen*. Finalmente, la aplicación comienza a ejecutarse y el *ApplicationDelegate* ó *SceneDelegate* (según la versión de iOS) , recibe las notificaciones y gestiona el ciclo de vida de la aplicación.

Las diferentes etapas del ciclo de vida de un app son:


| etapa / estado | Descripción |
| ---------------- | -------------- |
|  _Not running_ | La aplicación no ha sido abierta o ejecutada |
|  _Inactive_ | La aplicación se encuentra en primer plano, pero puede no estar procesando eventos o que exista una transición entre estados |
|  _Active_ | La aplicación se encuentra en primer plano, proceso de eventos, interacción del uuario |
|  _Background_ | La aplicación se encuentra en segundo plano y sigue ejecutando código en caso de que haya, si no hay código o si la ejecución ha terminado la aplicación se suspende de inmediato |
|  _Suspended_ | La aplicación se encuentra en segundo plano sin ejecutar código |


![diagrama](https://miro.medium.com/max/300/1*vO_BXTTksmGbuHc_VEknnQ.png)

2. **Investigar la arquitectura MVC.**

Estilo de arquitectura de software que separa los datos de una aplicación, la interfaz de usuario, y la lógica de control en tres componentes distintos.

- **Modelo**:  Contiene la representación de los datos que maneja el sistema, la lógica de negocio, y los mecanismos de persistencia.
- **Vista**: Información que se envía al cliente y los mecanismos  de interacción con éste.
- **Controlador**: Intermediario entre el Modelo y la Vista, gestionando el flujo de información entre ambos y las transformaciones para adaptar los datos a las necesidades de cada uno.

![MVC](https://miro.medium.com/max/1304/1*la8KCs0AKSzVGShoLQo2oQ.png)

3. **Investiga las diferencias entre una clase y una estructura en Swift.**

Las estructuras y clases en Swift tienen muchas cosas en común. Ambos pueden:

Definir propiedades para almacenar valores.
Definir métodos para proporcionar funcionalidad.
Definir subíndices para proporcionar acceso a sus valores utilizando la sintaxis de subíndice
Definir inicializadores para configurar su estado inicial
Extender para ampliar su funcionalidad más allá de una implementación predeterminada
Cumple con los protocolos para proporcionar una funcionalidad estándar de cierto tipo
Para obtener más información, consulte Propiedades , Métodos , Subíndices , Inicialización , Extensiones y Protocolos .

Las clases tienen capacidades adicionales que las estructuras no tienen:

La herencia permite que una clase herede las características de otra.
La conversión de tipos le permite verificar e interpretar el tipo de una instancia de clase en tiempo de ejecución.
Los desinicializadores permiten que una instancia de una clase libere los recursos que ha asignado.
El recuento de referencias permite más de una referencia a una instancia de clase.

4. **Investiga a qué se refiere que Swift sea un lenguaje orientado a protocolos.**

Se refiere a un modelo de abstracción más eficiente que soporte tipos de datos por valor, que no obligue a modelos de instanciación de datos ni de inicialización previa.

Consiste en buscar otra forma de acceder a la abstracción de métodos y propiedades, pero a través de tipos de datos por valor (que son copiados por el sistema en cada nueva asignación) y que no funcionan por referencia. El manejo de este tipo de datos es más eficiente en memoria en cuanto a que evitamos ciclos de retención, referencias perdidas, etc. Dato que sirve y está en ámbito, está, dato que no, se borra.


Un protocolo define un modelo de métodos, propiedades y otros requisitos que se adaptan a una tarea o pieza de funcionalidad en particular. El protocolo puede ser adoptado por una clase, estructura o enumeración para proporcionar una implementación real de esos requisitos. Se dice que cualquier tipo que satisfaga los requisitos de un protocolo se ajusta a ese protocolo.

Además de especificar los requisitos que los tipos conformes deben implementar, puede extender un protocolo para implementar algunos de estos requisitos o para implementar funcionalidades adicionales que los tipos conformes pueden aprovechar.

### Swift: 

** Los ejercicions háganlos en un Swift Playground o en http://online.swiftplayground.run/ si no tienes Mac y guarda el archivo con extensión **.swift**

*** Entra a https://www.hackingwithswift.com/sixty y haz los ejercicios siguientes:

1. Classes 
2. Classes
3. Protocols and extensions 
4. Optionals
