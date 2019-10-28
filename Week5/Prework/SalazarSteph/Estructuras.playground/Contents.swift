import UIKit

// Estructura con propiedades

struct Sport {

    // Propiedad almacenada:
    var name: String

    // Propierdad calculada
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

// Instancias de estructura
var tennis = Sport(name: "Tennis", isOlympicSport: false)
print(tennis.name)

// Modificación de propiedades, ya que ambas son variables
tennis.name = "Lawn tennis"
print(tennis.name)


let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
let swimming = Sport(name: "Swimming", isOlympicSport: true)
print(swimming.olympicStatus)


// Observadores de propiedad: permiten ejecutar código antes o después de cualquier cambio de propiedad
struct Progress {
    var task: String
    var amount: Int
}

// Creación de intancia y cambio de valores
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100
print(progress.amount)

// La propiedad didSet observa por cambios en la propiedad indicada
struct Progress2 {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress2 = Progress2(task: "Loading data", amount: 0)
progress2.amount = 30
progress2.amount = 80
progress2.amount = 100
print(progress2.amount)

// La propiedad willSet toma acciones antes de cambiar la propiedad, rara vez se usa
struct Progress3 {
    var task: String
    var amount: Int {
        willSet {
            print("\(task) is change to \(amount)% complete")
        }
    }
}

var progress3 = Progress3(task: "Loading data", amount: 0)
progress3.amount = 30
progress3.amount = 80
progress3.amount = 100
print(progress3.amount)


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


// Métodos de mutación:
struct Person {
    var name: String

    // Para cambiar una propiedad dentro de un método, debe marcarse como mutating.
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

// Devuelve verdadero si la cadena comienza con letras específicas
print(string.hasPrefix("Do"))

// Convierte a mayúsculas
print(string.uppercased())

// Crea un arreglo con las letras ordenadas (incluyendo los espacios)
print(string.sorted())


// Propiedades y métodos de arreglos
var toys = ["Woody"]

// Cantidad de elementos
print(toys.count)

// Agrega nuevo elemento, al final
toys.append("Buzz")
print(toys)

// Encuentra el indice de un elemento
toys.firstIndex(of: "Woody")
print(toys.firstIndex(of: "Woody"))
print(toys.firstIndex(of: "Buzz"))

// Ordena el arreglo
print(toys.sorted())

// Remueve un elemento
toys.remove(at: 0)
print(toys)


// Los inicializadores son métodos especiales que proporcionan diferentes formas de crear una estructura
// Todas las estructuras vienen con una por defecto!!!
// Esto pide que se proporcione un valor para cada propiedad cuando se crea la estructura.


struct User {
    var username: String
}
var user = User(username: "twostraws")
print(user)

// Con inicializador propio
struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user2 = User2()

user2.username = "twostraws2"
print(user2.username)
print(user2)


// Referencia a la instancia actual: self
struct Person2 {
    var name: String
    
    // 'self.name' se refiere a la propiedad, mientras que 'name' se refiere al parámetro.
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Propiedades perezosas: Creación de propiedades solo cuando son necesarias
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person3 {
    var name: String

    // Si agregamos la palabra clave 'lazy', Swift solo la creará cuando se acceda por primera vez:
    lazy  var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person3(name: "Ed")
print(ed.familyTree)


// Propiedades y métodos estáticos
struct Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let edy = Student(name: "Edy")
let taylor = Student(name: "Taylor")

// si se declaran propiedades o métodos como static tendrán el mismo valor para cada isntancia
struct Student2 {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student2.classSize += 1
    }
}
print(Student2.classSize)

let edy2 = Student2(name: "Edy")
let taylor2 = Student2(name: "Taylor")
print(Student2.classSize)


//Control de acceso: permite restringir qué código puede usarse en propiedades y métodos.
struct Person4{
    var id: String

    init(id: String) {
        self.id = id
    }
}

let person4 = Person4(id: "12345")
print(person4.id)

struct Person5 {
    private var id: String

    init(id: String) {
        self.id = id
    }
}

let person5 = Person5(id: "67890")
print(person5)

struct Person6 {
    private var id: String

    init(id: String) {
        self.id = id
    }
    // Ahora solo los métodos internos pueden leer la propiedad 'id':
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
