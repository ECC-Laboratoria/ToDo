//clases

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

//herencia

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
//Anulacion
class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle: Dog {
    override func makeNoise(){
        print("Yip!")
    }

}
let poppy = Poodle()
poppy.makeNoise()

//final class

final class Dog {
    var name: String
    var breed: String

    init(name: String, breed:String){
        self.name = name
        self.breed = breed
    }
}

//copiar objetos
class Singer{
    var name = "Taylos Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name ="Justin Bieber"

print(singer.name)
struct Singer{
    var name = "Taylor Swift"
}

//deinitializers

class Person{
    var name ="John Doe"
    init(){
        print("\(name)is alive!")
    }
    func printGreeting() {
        print("Hello, I´m \(name)")
        
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting() 
}

deinit {
    print("\(name)is no more!")
    
}

//mutabilidad
let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

class Singer {
    let name = "Taylor swift"
}

//Protocolos 

protocol Identifiable {
    var id: String { get set}
}

struct User: Identifiable{
    var id: String
}

func displayID(thing: Identifiable){
    print ("My ID is \(thing.id)")
}

//herencia de protocolo
protocol Payable{
    func calculateWages() -> init() 
}
protocol NeddsTraining {
    func study()
}
protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation {}

extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8 
number.squared()

extension Int {
    var isEven: Bool{
        return self %2 == 0
    }
}

//extensiones de protocolos

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set (["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize(){
        print ("there are \(count)of us:")
        for name is self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()


//programacion orientada al protocolo
protocol Identifiable{
    var id: String { get set }
    func identify()
}

extension Identifiable{
    func identify(){
        print("My ID is \(id).")
    }
}

struct User: Identifiable{
    var id: String
}
let twostraws = User(id: "twostraws")
twostraws.identify()


//opcionales 

var age : Int? = nil
age = 38

var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count)letters")
}else{
    print("Missing name.")
}

//unwrapped
func greet(_ name: String?){
    guard let unwrapped = name else {
        print ("you didn´t provide a name !")
        return
    }
    print ("Hello, \(unwrapped)!")
}

// forcer unwrapped

let str = "5"
let num = Int(str)
let num = Int(str)!

//implicitly unwrapped optional

let age: Int! = nil

//nil coalescing

func username(for id: Int) -> String? {
    if id == 1{
        return "Taylos Swift"
    } else {
        return nil
    }
}
let user = username(for:15) ?? "Anonymous"

//optional chaining

let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

//optional try

enum PasswordError: Error{
    case obvious
}
func checkPassword(_ password: String) throws -> Bool{
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}
do {
    try checkPassword("password")
    print("That password is good!")
}catch {
    prin("You can´t use that password.")
}

if let result = try? checkPassword("password"){
    print("Result was \(result)")
} esle {
    print("D'oh.")
}
try! checkPassword("sekrit")
print("OK!")

//failable initializers

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

//typecasting

class Animal { }
class Fish: Animal { }
class Dog : Animal {
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
    






