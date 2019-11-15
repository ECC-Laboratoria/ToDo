import Foundation

//Estructuras
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)

//We made both name and tennis variable, 
//so we can change them just like regular variables:
tennis.name = "Lawn Tennis"
print(tennis.name)

//Computed properties
//var name: String //se llama stored properties
//la siguiente propiedad olympicStatus se llama computed property

struct Sport1 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String{
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        }else{
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport1 (name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//Property observers
//Let you run code before or after any property changes

struct Progress {
    var task: String
    var amount: Int
}
var progress = Progress(task: "Loading data", amount: 0)
print(progress.amount = 30)
print(progress.amount = 80)
print(progress.amount = 100)

//didSet property observer, para que se imprima un mensaje cada cierto tiempo

struct Progress1 {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress1 = Progress1(task: "Loading data", amount: 0)
print(progress1.amount = 30)
print(progress1.amount = 80)
print(progress1.amount = 100)

//Methods
struct City {
    var population: Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())

//Mutating methods

// struct Person {
//     var name: String
//     mutating func makeAnonymous() {
//         name = "Anonymous"
//     }
// }
// var person = Person(name: "Ed")
// print(person.makeAnonymous())

//==================================
//Properties and methods of strings

let string = "Do or do not, there is no try."

print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of arrays

var toys = ["Woody"]

print(toys.count)
print(toys.append("Buzz"))
print(toys.firstIndex(of: "Buzz"))
print(toys.sorted())
print(toys.remove(at: 0))


//Initializers

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
print(user.username = "twostraws")


//Referring to the current instance
//self helps you distinguish between the property and the parameter

struct Person1 {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
var person = Person1(name: "Luca")
print(person.name)

//Lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
print(ed.familyTree)

//Static properties and methods

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(ed1.name)
print(taylor.name)
print(Student.classSize)

//Access control

struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed2 = Person(id: "12345")
print(ed2.identify())

//===================================
//CLASSES
//===================================
//Creating classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
print(poppy.name)
print(poppy.breed)

//Class inheritance

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle1")
    }
}

let poppy1 = Poodle(name: "Poodledog" )
print(poppy1.name)
print(poppy1.breed)

//Overriding methods

class Dog1 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle1: Dog1 {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy2 = Poodle1()
print(poppy2.makeNoise())

//Final classes
//no other class can inherit from it.

final class Dog3 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let dog = Dog3(name: "Snoopy", breed: "Beagle")
print(dog.name)
print(dog.breed)

//Copying objects
//When you copy a struct, both the original and the copy are different things
// – changing one won’t change the other. When you copy a class, 
//both the original and the copy point to the same thing

class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

struct SingerStruct {
    var name = "Taylor Swift"
}
var singerStruct = Singer()
print(singerStruct.name)

var singerCopyStruct = singerStruct
singerCopy.name = "Justin Bieber"
print(singerStruct.name)

//Deinitializers
//lasses can have deinitializers – 
//code that gets run when an instance of a class is destroyed.

class Persona {
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
    let person = Persona()
    person.printGreeting()
}

//Mutability

class SingerMutability {
    var name = "Taylor Swift"
}

let taylorMutability = SingerMutability()
taylorMutability.name = "Ed Sheeran"
print(taylorMutability.name)

class SingerMutability1 {
    let name = "Taylor Swift"
}

let taylorMutability1 = SingerMutability1()
//taylorMutability1.name = "Ed Sheeran"
print(taylorMutability1.name)

//===============================
//       PROTOCOLS
//===============================
//Protocols are a way of describing 
//what properties and methods something must have.

protocol Identifiable {
    var id: String { get set }
}

struct UserProtocol: Identifiable {
    var id: String

}

let userProtocol = UserProtocol(id: "12345" )
print(userProtocol.id)

//Protocol inheritance

//Un protocolo puede tener varios protocolos
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

//Extensions
//Extensions allow you to add methods to existing types,
// to make them do things they weren’t originally designed to do.

extension Int {
    func squared() -> Int {
        return self * self
    }
}

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 8
print(number.squared())
print(number.isEven)

//Protocols extensions
//are like regular extensions, except rather than extending a specific 
//type like Int you extend a whole protocol

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

print(pythons.summarize())
print(beatles.summarize())

//Protocol oriented programming

protocol Identifiable1 {
    var id: String { get set }
    func identify()
}

extension Identifiable1 {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User1: Identifiable1 {
    var id: String
}

let twostraws = User1(id: "twostraws")
print(twostraws.identify())


//===================================
//      Optionals
//==================================

//Handling missing data

var age: Int? = nil
print(age)
age = 38
print(age)

//Unwrapping optionals

var name: String? = nil
name = "Justin"
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//Unwrapping with guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

let greetSomeone = (greet("Lilo"))
let greetSomeone2 = (greet(nil))

//Force unwrapping

let str = "5"
//converting it to an Int
// ! use to make a regular Int rather than an Int?
let num = Int(str)
let num2 = Int(str)!

print(num)
print(num2)

//Implicity unwrapped optionals
//created by adding an exclamation mark after your type name
//they behave as if they were already unwrapped
let age1: Int! = nil


//Nil coalescing ??

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let userOptional = username(for: 15) ?? "Anonymous"
print(userOptional)
let userOptional1 = username(for: 1) ?? "Anonymous"
print(userOptional1)

//Optional chaining ?

var names = ["John", "Paul", "George", "Ringo"]

names = []
let beatle = names.first?.uppercased()
print(beatle)

//Optional try


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


if let result = try? checkPassword("sekrit") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

//Failable initializers
//an initializer that might work or might not
//sintaxis init?()


struct Person6 {
    let id: String!

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let persona1 = Person6(id: "NueveLetr")
let persona2 = Person6(id: "NueveLetras")
print(persona1 == nil)
print(persona2 == nil)

//https://medium.com/@YuriD4/failable-initializers-in-swift-3e7f53b96a1e
//https://docs.swift.org/swift-book/LanguageGuide/Initialization.html

//Typecasting


class Animal { }
class Fish: Animal { }

class Dog4: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog4(), Fish(), Dog4()]

for pet in pets {
    if let dog = pet as? Dog4 {
        dog.makeNoise()
    }
}










