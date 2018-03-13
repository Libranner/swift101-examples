//: Playground - noun: a place where people can play

import UIKit

//Variables y Constantes
var str = "Hello, everyone"

let constant = 4
if (constant > 3) {
    print("es mayor de 3")
}
else {
    print("es menor de 3")
}



//Estructuras y Clases (Optionales, Initializers, De-Inititalizers)
struct Person {
    var name: String
    var lastName: String
}

let person =  Person(name: "Bar", lastName: "Foo")
print(person)

enum TypeOfAnimal {
    case reptile, mammal
}

class Animal {
    var name: String?
    var legs = 4
    var type: TypeOfAnimal?
    var numberOfMeals: Int = 0

    init(name: String, legs: Int){
        self.name = name
        self.legs =  legs
    }

    convenience init (name: String, legs: Int, type: TypeOfAnimal?){
        self.init(name: name, legs: legs)
        self.type = type
    }
    
    convenience init(name: String){
        self.init(name: name, legs: 0, type: .reptile)
    }
    
    //Defer
    func feed(){
        defer{
            self.numberOfMeals += 1
            print("Cantidad de comidas para \(self.name!): \(self.numberOfMeals)")
        }
        
        print("\(self.name!) ha sido alimentado")
    }
    
    deinit{
        print("\(self.name!) has been deallocated")
    }
    
}

//Arreglos
//var animales = Array<Animal>()

var animals = [Animal]()

var rocky = Animal(name: "Bobby", legs: 4)

rocky.feed()

let luck = Animal(name: "Luck", legs: 2, type: .mammal)
let snake = Animal(name: "Ryan", legs: 2, type: .reptile)

animals.append(rocky)
animals.append(luck)
animals.append(snake)

var moreAnimals = [Animal]()
moreAnimals += animals


//Enumeraciones

enum CustomError: Error {
    case ConnectionError(message: String, code: Int)
}

//Manejo de errores
func makeConnection(value: Int) throws{
    if(value == 1){
        throw CustomError.ConnectionError(message: "Ha ocurrido un error", code: 101)
    }
}


do {
    try makeConnection(value: 1)
}
catch {
    print(error)
    print("Hey an error has occurred")
}


//Looping

// - Guard
for animal in animals {
    guard let unwrappedAnimalType = animal.type else{
        continue
    }
    
    if(unwrappedAnimalType == .mammal){
        animal.feed()
    }
}


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

for i in 0..<3 {
    print(i)
}


//Playground cool stuffs

var image = UIImage(named: "kitura.png")
//print(M_PI)

for _ in 1...5 {
    for value in stride(from:0.0, to: Double.pi * 2, by: 0.1) {
        let y = cos(value)
        print(y)
    }
}


//Intermediate Swift: Protocols
protocol Drawable {
    func numberOfPoints() -> Int;
}

class Figure {
    
}

protocol Transformable {
    func transform() -> Figure;
}

class Square : Drawable, Transformable{
    func numberOfPoints() -> Int {
        return 4;
    }
    
    func transform() -> Figure {
        return Figure()
    }
}


//Cool feautures Swift
extension Double{
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let distance = 1.ft


//Generics
struct Stack<Element> {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
print(stackOfStrings)
stackOfStrings.topItem


//Override operators with Swift
func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }

    var result = left
    for _ in 1..<right {
        result += left
    }

    return result
}

var t = "Hola " * 6
print(t)





