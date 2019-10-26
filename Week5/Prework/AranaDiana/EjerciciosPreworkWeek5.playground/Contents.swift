import UIKit

// STRUCTS

struct Sport {
    var name: String
}

// Para usarlas, se crean instancias de las estructuras
var tennis = Sport(name: "Tennis")
print(tennis.name)

// Se puede cambiar el valor de la propiedad
tennis.name = "Lawn tennis"
print(tennis.name)


// Computed properties: Cambian de valor

struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
let swimming = Sport(name: "Swimming", isOlympicSport: true)
print(swimming.olympicStatus)


// Observadores de propiedad

struct Progress {
    var task: String
    var amount: Int
}

// Crear una intancia y cambiar los valores
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
print(progress.amount)
// La propiedad didSet observa por cambios en la propiedad indicada
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// Con willSet se puede tomar acciones antes de cambiar la propiedad

struct Progress {
    var task: String
    var amount: Int {
        willSet {
            print("\(task) is change to \(amount)% complete")
        }
    }
}
var progress = Progress3(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Métodos: Funciones que pueden usar las propiedades de la estructura

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
let myLondon = london.collectTaxes()
print(myLondon)

// Mutación de métodos
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
print(person.name)

// Propiedades y métodos de strings
let string = "Do or do not, there is no try."

// Número de caracteres
print(string.count)

// Identifica si un substring esta contenido en:
print(string.hasPrefix("Do"))

// Convierte a mayusculas
print(string.uppercased())

// Crea un arreglo con las letras ordenadas
print(string.sorted())

// Propiedades y métodos de los arreglos
var toys = ["Woody"]

// Número de items:
print(toys.count)

// Agrega un elemento al final
toys.append("Buzz")
print(toys)

// Encuentra el indice de un elemento
toys.firstIndex(of: "Buzz")
print(toys.firstIndex(of: "Buzz"))

// ordena el arreglo
print(toys.sorted())

// remueve un elemento
toys.remove(at: 0)
print(toys)

// Inicializadores: Indican si se quiere crear una estructura con un valor por defecto

// Sin inicializador
struct User {
    var username: String
}
var user = User(username: "twostraws")
print(user)

// con inicializador
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()

// Es obligatorio que todos los valores tengan un valor antes de que finalice el inicializador
user.username = "twostraws"
print(user.username)


// Referencia a la instancia

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}


//Propiedades perezosas
 
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy  var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")


//Propiedades y métodos estáticos
 
struct Student {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")


// si se declaran propiedades o métodos como static tendrán el
// mismo valor para cada isntancia
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
print(Student.classSize)


//Control de acceso

struct Person{
    var id: String
    
    init(id: String) {
        self.id = id
    }
}

let ed= PersonId(id: "12345")

struct Person {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
}

struct PersonPrivateTrue {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}




// CLASSES
/* Las clases son similares a las estructuras en que te  permiten crear tipos de datos con propiedades y métodos, pero tienen cinco diferencias importantes:

 1. Inicializador: Las clases no tienen un inicializador miembro, es decir que si se tiene propiedades en la clase
 siempre se debe crear su propio inicializador
 */

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
// Crear instancias de esa clase se ve igual que si fuera una estructura
let poppy = Dog(name: "Poppy", breed: "Poodle")


/* 2. Herencia de clases: La segunda diferencia es que puede crear una clase basada en una clase existente: hereda todas las propiedades y métodos de la clase original y puede agregar la suya en la parte superior. Esto se llama herencia de clase o subclases , la clase de la que se hereda se llama clase "padre" o "super", y la nueva clase se llama clase "hijo".
 */

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/*Podríamos crear una nueva clase basada en esa llamada Poodle. Heredará las mismas propiedades e inicializador que Dog por defecto:
 */

class Poodle: Dog {
    
}

//Sin embargo, también podemos dar Poodlesu propio inicializador.
//Por razones de seguridad, Swift siempre te hace llamar la función super.init()

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}


/* Métodos de anulación
Las clases secundarias pueden reemplazar los métodos principales con sus propias implementaciones, un proceso conocido como anulación
 */

class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

//La clase hija hereda su comportamiento
class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()

/* Swift quiere que usemos override func en lugar de solo func al anular un método: evita que anule un método por accidente y obtendrá un error si intenta anular algo que no existe en la clase principal.
 */

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}


/* Clases finales
 A veces se quiere impedir que otros desarrolladores creen su propia clase basada en la tuya. Swift nos da una palabra clave (final) solo para este propósito: cuando declaras que una clase es final, ninguna otra clase puede heredarla. Esto significa que no pueden anular sus métodos para cambiar su comportamiento; necesitan usar su clase de la manera en que fue escrita.
 */

final class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/* 3. Copiar objetos, la tercer diferencia es como se copian las clases y estructuras:
 En las estructuras la original y la copias son cosas diferentes, es decir cambiar uno no cambiará el otro.
 En las clases el original como el punto de copia a la misma cosa, al cambiar uno cambiara la otra.
 */

class Singer {
    var name = "Taylor Swift"
}

// La insancia conserva el valor de la clase
var singer = Singer()
print(singer.name)

// Se crea una segunda variable a partir de la primera y se cmabia su nombre
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)


/* 4. Desinicializadores: la cuarta diferencia es que las clases a diferencia de las estructuras tienen desinicializadores, código que se ejecuta cuando se destruye una instancia de una clase.
 */

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


/* 5. Mutabilidad: Manejo de constantes: Las propiedades de las clases pueden cambiar
 aunque la clase sea constante.
 */

class SingerMutate {
    var name = "Taylor Swift"
}

let taylor = SingerMutate()
taylor.name = "Ed Sheeran"
print(taylor.name)

// Variables constantes
class Singer {
    let name = "Taylor Swift"
}




// PROTOCOLS AND EXTENSIONS

/* Protocolos: Los protocolos son una forma de describir qué propiedades y métodos debe tener algo. Luego le dice a Swift qué tipos usan ese protocolo, un proceso conocido como la adopción o la conformidad con un protocolo.
*/

protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


/* Herencia de protocolo: Un protocolo puede heredar de otro en un proceso conocido como herencia de protocolo . A diferencia de las clases, puede heredar de múltiples protocolos al mismo tiempo antes de agregar sus propias personalizaciones en la parte superior.
*/

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

//Ahora podemos crear un único Employee protocolo que los reúna en un solo protocolo.
protocol Employee: Payable, NeedsTraining, HasVacation { }


// Extensiones: Permiten agregar métodos a los tipos existentes, para que hagan cosas para las que no estaban diseñadas originalmente.

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}


// Extensiones de protocolo: Permiten proporcionar el código dentro de sus métodos, pero solo afectan a un tipo de datos: no puede agregar el método a muchos tipos al mismo tiempo.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()


// Orientacion orientada al protocolo

protocol Identifiable {
    var id: String { get set }
    func identify()
}

extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()




// OPTIONALS

// Manejo de datos faltantes

//Para hacer que un tipo sea opcional, agregue un signo de interrogación.
var age: Int? = nil
age = 38


// Desenvolviendo opcionales

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


// Devolviendo con guard

//Una alternativa a if let es guard let, que también desenvuelve las opciones.

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}


// Desenvoltura forzada

let str = "5"
let num = Int(str)

let num = Int(str)!

// Puede forzar el desenvolvimiento escribiendo ! después Int(str), de esta manera:
let num = Int(str)!


// Opciones implícitas sin envolver

let age: Int! = nil


// Nil coalescente

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


// Encadenamiento opcional

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()


// Opcional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// try? Cambia las funciones de lanzamiento en funciones que devuelven un opcional.
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// try! Se puede usar cuando se sabe con certeza que la función no fallará.
try! checkPassword("sekrit")
print("OK!")


// Inicializadores fallidos

let str = "5"
let num = Int(str)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}


// Tipografía

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
