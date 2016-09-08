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
}

let p = Person(name: "John")

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
let luck = Animal(name: "Luck", legs: 2, type: .mammal)
let snake = Animal(name: "Ryan", legs: 2, type: .reptile)

animals.append(rocky)
animals.append(luck)
animals.append(snake)


//Enumeraciones

enum CustomError: ErrorType {
    case ConnectionError(message: String, code: Int)
}

//Manejo de errores
func makeConnection(value: Int) throws{
    if(value == 1){
        throw CustomError.ConnectionError(message: "Ha ocurrido un error", code: 101)
    }
}


do {
    try makeConnection(1)
}
catch {
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



//Playground cool stuffs

var image = UIImage(named: "kitura.png")
//print(M_PI)

for conteo in 1...5 {
    for value in 0.0.stride(to: M_PI * 2, by: 0.1) {
        var y = cos(value)
    }
}



//Intermediate
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

extension Double{
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let distance = 10.ft






