

# Respuestas 

#### Ciclo de vida de una app y haz un esquema de todos los estados por los que pasa un app.

Por supuesto, una aplicación escrita en el sistema iOS pasa por un conjunto de estados a medida que se ejecuta. Estos estados se conocen como estados del ciclo de vida de la aplicación. A medida que una aplicación se mueve a través de los estados de su ciclo de vida, el estado de la aplicación se define por su nivel de actividad, como No ejecutándose, Activa o Suspendida.

![image0.jpg](https://www.dummies.com/wp-content/uploads/432628.image0.jpg)



Aquí hay más información sobre los estados:

- Cuando una aplicación está en el estado *No ejecutándose* , la aplicación no se ha iniciado o el sistema la cerró.

- Cuando se inicia una aplicación, pasa por un estado corto, llamado estado *Inactivo* . En realidad se está ejecutando, pero está realizando otras funciones y no está listo para aceptar entradas o eventos del usuario.

- Una aplicación en estado *activo* se ejecuta en primer plano y recibe eventos. Este es el modo normal para aplicaciones en primer plano: aplicaciones que no tienen que ejecutarse en segundo plano sin una interfaz de usuario.

- Cuando una aplicación está en estado de *fondo* , su interfaz de usuario no es visible, pero se *está* ejecutando. La mayoría de las aplicaciones pasan por este estado en camino a ser suspendidas.

  Una aplicación puede necesitar (y solicitar) tiempo de ejecución adicional y puede permanecer en este estado por un tiempo. Además, ciertas aplicaciones se ejecutan en segundo plano. Dicha aplicación ingresa directamente al estado de Fondo y no pasa al estado Inactivo.

- El sistema iOS puede mover una aplicación a un estado *Suspendido* . Aquí la aplicación está en segundo plano pero *no* ejecuta código. Sin embargo, se queda en la memoria. Si ocurre una condición de poca memoria, el sistema puede purgar aplicaciones en estado suspendido sin previo aviso. Tenga en cuenta que, según los estándares de Apple, *solo* el sistema iOS puede matar una aplicación.

  A medida que su aplicación pasa por los estados de su ciclo de vida, iOS llama a ciertos métodos estándar de la aplicación, conocidos como métodos de *ciclo de vida* . A medida que pasa por estos estados, puede agregar un comportamiento específico de la aplicación en cada transición dentro del ciclo de vida de la aplicación.

  Las implicaciones de confiabilidad de este ciclo de vida son que cada vez que la aplicación pasa de estar activa en primer plano a estar en segundo plano, a ser suspendida y luego terminada, tiene que

- Renunciar a todos los recursos que contiene (como conexiones de red y punteros de archivos).

- Guarde cualquier estado que desee conservar cuando se restaure al servicio activo o se inicie nuevamente (este proceso también se conoce como *verificación de puntos* ).

Pero renunciar a los recursos y guardar el estado a medida que la aplicación sale es solo la mitad de la historia. A medida que la aplicación pasa por su secuencia de inicio y ejecuta sus funciones (en términos concretos, carga y sale de cada controlador de vista), debe registrar lo que necesita renunciar y el estado que necesita conservar para que se liberen los recursos y El estado se guarda si la aplicación sale.



#### Arquitectura Modelo Vista Controlador

El MVC o Modelo-Vista-Controlador es un patrón de arquitectura de software que, utilizando 3 componentes (Vistas, Models y Controladores) separa la lógica de la aplicación de la lógica de la vista en una aplicación. 

![img](https://codigofacilito.com/photo_generales_store/29.jpg)

- El **Modelo** que contiene una representación de los datos que maneja el sistema, su lógica de negocio, y sus mecanismos de persistencia.
- La **Vista**, o interfaz de usuario, que compone la información que se envía al cliente y los mecanismos interacción con éste.
- El **Controlador**, que actúa como intermediario entre el Modelo y la Vista, gestionando el flujo de información entre ellos y las transformaciones para adaptar los datos a las necesidades de cada uno.

###### El modelo es el responsable de:

- Acceder a la capa de almacenamiento de datos. Lo ideal es que el modelo sea independiente del sistema de almacenamiento.
- Define las reglas de negocio (la funcionalidad del sistema). Un ejemplo de regla puede ser: "Si la mercancía pedida no está en el almacén, consultar el tiempo de entrega estándar del proveedor".
- Lleva un registro de las vistas y controladores del sistema.
- Si estamos ante un modelo activo, notificará a las vistas los cambios que en los datos pueda producir un agente externo (por ejemplo, un fichero por lotes  que actualiza los datos, un temporizador que desencadena una inserción, etc.).

 

###### El controlador es responsable de:

- Recibe los eventos de entrada (un clic, un cambio en un campo de texto, etc.).
- Contiene reglas de gestión de eventos, del tipo "SI Evento Z, entonces Acción W". Estas acciones pueden suponer peticiones al modelo o a las vistas. Una de estas peticiones a las vistas puede ser una llamada al método "Actualizar()". Una petición al modelo puede ser "Obtener_tiempo_de_entrega ( nueva_orden_de_venta )". 

 

###### Las vistas son responsables de:

- Recibir datos del modelo y los muestra al usuario.
- Tienen un registro de su controlador asociado (normalmente porque además lo instancia).
- Pueden dar el servicio de "Actualización()", para que sea invocado por el controlador o por el modelo (cuando es un modelo activo que informa de los cambios en los datos producidos por otros agentes).



#### Diferencia entre una clase y una estructura

Aunque los dos sirven para lo mismo, internamente sí tienen algunas diferencias importantes.



###### Value type VS Reference type

Las *structs* son *value types* (tipos por valor), mientras que las clases son *reference types* (tipos por referencia). 

Los tipos por valor (value types) se copian cuando se asigna a una nueva variable o se pasa como parámetro en una función, mientras que los tipos por referencia (reference types) se comparten.

###### Stack VS Heap

Las Structs se crean en el Stack, mientras que las Classes lo hacen en el Heap. Tanto Stack como Heap son estructuras de datos utilizadas para la reserva de espacios de memoria en el software.

En el caso del Stack (o pila de llamadas) cabe destacar que su ejecución es inmediata, controlada por la CPU. Es muy eficiente y rápido. Funciona bajo el concepto de **LIFO** (*last in first out),* de ahí su rapidez y eficiencia.

El Heap (o almacenamiento libre) es una enorme pieza de memoria que el sistema puede soliciar reservar un trocito para su uso (mediante `alloc`). Añadir o borrar memoria del heap es un proceso más costoso y pesado.

###### Inicializador por defecto

Las Structs crean un método init por defecto  con tantos parámetros como propiedades tenga. En el caso de las Classes tenemos que definir nosotros mismos el inicializador. Siempre.

 Las clases tienen inits de conveniencia, marcados con la palabra `convenience` delante, mientras que las *structs* no.

###### Inmutabilidad

En las structs TODO es inmutable por defecto. Para poder modificar un *struct*, hay que poner la palabra `mutating` delante de la firma de la función. En el caso de las clases, aunque declares un objeto como constante (con `let`), puedes modificar sus propiedades si estas están declaradas como `var`.

###### Herencia, Type Casting y métodos **deinit**

Las Classes tienen herencia, es decir, puede tener cero o una superclase. Por ello, también se puede utilizar type casting con las clases. Como las *classes* se crean en el Heap, y es memoria que hay que crear y liberar, todas ellas tienen un método deinit que se ejecuta justo antes de liberarse de memoria.

Las structs no tienen Herencia, ni type casting ni métodos deinit.



#### swift lenguaje de protocolos

¿Qué es un protocolo? Son plantillas de especificación que definimos para crear unas reglas determinadas que queremos que se cumplan en una implementación que podemos usar en varias clases, *structs* o incluso enumeraciones. Definen requisitos a implementar **utilizando solamente las cabeceras de las propiedades o métodos que queremos se incluyan obligatoriamente para, como suele denominarse, conformar con un protocolo**.

Los protocolos además nos permiten agrupar diferentes tipos de datos a través de características afines o comunes a todos ellos, **proporcionando una misma funcionalidad determinada a todo aquel tipo de dato u objeto que cumpla con el protocolo con el que se conforma**.

Apple ha convertido Swift en un lenguaje con un modelo de abstracción más amplio, compatible con la orientación a objetos y muy eficiente en él, pero su base es la orientación a protocolos: **Swift es el primer lenguaje que usa este modelo de abstracción**.

¿En qué consiste? Consiste en buscar otra forma de acceder a la abstracción de métodos y propiedades, pero **a través de tipos de datos por valor (que son copiados por el sistema en cada nueva asignación) y que no funcionan por referencia**. El manejo de este tipo de datos es más eficiente en memoria en cuanto a que evitamos ciclos de retención, referencias perdidas, etc. Dato que sirve y está en ámbito, está, dato que no, se borra.

Para conseguir esto se sustituyen clases por *structs*, que en Swift son idénticos en todos los aspectos salvo en tres: las clases son datos por referencia (la variable o constante guarda la dirección de memoria donde está el objeto y cualquier nueva asignación solo copia dicha dirección y aumenta las referencias a este objeto) y los *structs* son tipos de datos por valor (con entidad única y que residen como tales en la propia variable o constante). **Además una clase soporta herencia, pero un struct no** y como hemos dicho, la clase obliga a inicializar sus propiedades cuando se crea su implementación pero un *struct* no.

¿Cómo accedemos entonces a la abstracción a partir de *structs* si no soporta herencia? A través de protocolos, donde solo definimos las cabeceras de las funciones o propiedades calculadas que nuestro *struct* debe tener para conformar el protocolo, pero no incluye la implementación o el cuerpo del código. De esta forma, podemos crear cualquier estructura que conforme el protocolo determinado y proporcionar un código diferente para cada método o propiedad almacenada dentro de cada *struct* que creemos, **como si hiciéramos un override de un método del padre en el hijo pero teniendo en cuenta que aquí todos funcionan a un mismo nivel**.

Además, estos protocolos **también podemos usarlos como extensiones de tipos del propio sistema y conseguir una funcionalidad específica**. 



