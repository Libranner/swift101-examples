//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, everyone"

var constant = 4

if (constant > 3) {
    print("es mayor de 3")
}
else {
    print("es menor de 3")
}

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
    
    func feed(){
        defer{
            self.numberOfMeals += 1
            print("Cantidad de comidas para \(self.name): \(self.numberOfMeals)")
        }
        
        print("\(self.name!) ha sido alimentado")
    }
    
    deinit{
        print("\(self.name) has been deallocated")
    }
    
}

var animals = [Animal]()

var rocky = Animal(name: "Bobby", legs: 4)
let luck = Animal(name: "Luck", legs: 2, type: .mammal)
let snake = Animal(name: "Ryan", legs: 2, type: .reptile)
animals.append(rocky)
animals.append(luck)
animals.append(snake)


for animal in animals {
    guard let unwrappedAnimalType = animal.type else{
        continue
    }
    
    if(unwrappedAnimalType == .mammal){
        animal.feed()
    }
}

var image = UIImage(named: "kitura.png")

//print(M_PI)

for conteo in 1...5 {
    for value in 0.0.stride(to: M_PI * 2, by: 0.1) {
        var y = cos(value)
    }
}






