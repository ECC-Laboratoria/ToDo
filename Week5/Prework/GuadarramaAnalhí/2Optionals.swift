import Foundation

//OPTIONALS

//Handling Missing Data
var age: Int? = nil
print(age)

age = 38
print(age)


//Unwraping Optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//Unwrapping with Guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet(name)

//Force Unwrapping

let str = "8"
let num = Int(str)!

print(num)


//Implicitly unwrapped optionals
//You don´t need if let or guard let to use it. 
//But if you try t use it and the have no value your code crashes
let ages: Int! = nil

// print(ages)




//Nil Coalesing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


//Optional Try

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


if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")



//FAilable Initializers

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


//Typecasting


class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog(), Dog()]


//as? returns an ptional: it will be nil if the typecast failed, or converted type otherwise.
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}