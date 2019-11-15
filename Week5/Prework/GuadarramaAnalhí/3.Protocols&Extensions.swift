import Foundation

//PROTOCOLS

//Adopting or conforming to a protocol 
//Get(read) --- Set (written)

protocol Identifiable {
    var id: String { get set }
}

// // // We can create a struct that conforms to a protocol
struct User: Identifiable {
    var id: String
}

 func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


//PROTOCOL INHERITANCE

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}


//We can now create a single Employee protocol that brings them together in one protocol.

protocol Employee: Payable, NeedsTraining, HasVacation { }




//EXTENSIONS- Add methos to existing types


//Example- add an extension to the Init type
extension Int {
    func squared() -> Int {
        return self * self
    }
}

//number now has a squared() method
let number = 8
print(number.squared())


//<You can add computed properties to a data type

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

print(number.isEven)

//NOTE: Extensions let you provide the code inside your methods, but only affect one data type


//PROTOCOL EXTENSIONS
//You extend a whole protocol so that all conforming types get the changes.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])


// Adding a summarize() method to the extension of the Collection protocol

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}


//Now Array and Set will have that method.
print(pythons.summarize())
print(beatles.summarize())


//PROTOCOL-ORIENTED PROGRAMMING
//That is a technique 

//First we have a protocol called Identifiable
protocol IdentifiableTwo {
    var idTwo: String { get set }
    func identify()
}

//protocol extensions allow us to provide a default identify() method
extension IdentifiableTwo {
    func identify() {
        print("My ID is \(idTwo).")
    }
}

//Now when we create a type that conforms to Identifiable it gets identify() automatically

struct UserTwo: IdentifiableTwo {
    var idTwo: String
}

let twostraws = UserTwo(idTwo: "twostraws")
print(twostraws.identify())