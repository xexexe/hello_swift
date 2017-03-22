//: Playground - noun: a place where people can play

import UIKit

print("Portocols and Extensions!")

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
 
//Write an enumeration that conforms to this protocol.
enum SimpleEnumeration: ExampleProtocol {
    var simpleDescription: String {
        get {
            return "A simple enumeration"
        }
        
        set {
            simpleDescription = newValue
        }
    }
    
    mutating func adjust() {
        self.simpleDescription = " adjusted"
    }
}
var c = SimpleStructure()
c.adjust()
let cDescription = c.simpleDescription


extension Int: ExampleProtocol {
    var absoluteValue: Int {
        get {
            return self > 0 ? self : self * -1;
        }
    }
    var simpleDescription: String {
        return "The Number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)
print(7.absoluteValue)
print((-20).absoluteValue)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty) //uncomment to see the error