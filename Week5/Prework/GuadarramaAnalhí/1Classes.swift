import Foundation


//CLASSES

//a)Creating Classes

//1.You always have to create yur own initializer 

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//Creating instances of class looks just the same as if it were a struct 

let poppy = Dog(name: "Poppy", breed: "Poodle")
print(poppy.name)



//Class Inheritance
//2. You can create a new class base on an existing class

//Using the Dog class. we are going to create a new class

class Poodle: Dog {
     init(name: String) {
        super.init(name: name, breed: "Poodle")
    }

}

let archie = Poodle(name:"Archie")

print(archie.breed)


//Overriding Methods

class Canine {
    func makeNoise() {
        print("Woof!")
    }
}


class Beagle: Canine {
    override func makeNoise() {
        print("Yip!")
    }
}

let coco = Beagle()
coco.makeNoise()


//Final Classes 

//Final keyword let you to write a Class that no other class can inherit from it.

final class Dogo {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}


//3.When you copy a class, both the original and the copy point to the same thing 

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)


//Deinitializers 

//4.Classes have deinitializers- Code that gets run when an instance is destroyed

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


//MUTABILITY
//5.You can change any variable property on a class

class Writer {
    var name = "Haruki Murakamit"
}

let haruki = Writer()
haruki.name = "Banana Yoshimoto"
print(haruki.name)



