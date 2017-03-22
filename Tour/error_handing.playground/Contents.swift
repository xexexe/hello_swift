//: Playground - noun: a place where people can play

import UIKit

print("Error Handling!")

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    } else if printerName == "Oh Fire" {
        throw PrinterError.onFire
    } else if printerName == "Out Paper" {
        throw PrinterError.outOfPaper
    }
    return "Job send"
}

do {
    let printerRespone = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerRespone)
} catch {
    print(error)
}

// Change the printer name to "Never Has Toner",so that the send(job:toPrinter:)function throws an error
do {
    let printerRespone = try send(job: 222, toPrinter: "Never Has Toner")
    print(printerRespone)
} catch {
    print(error)
}

do {
//    let printerResponse = try send(job: 14440, toPrinter: "Gutenberg")
//    let printerResponse = try send(job: 1010, toPrinter: "Oh Fire")
//    let printerResponse = try send(job: 2233, toPrinter:"Never Has Toner")
    let printerResponse = try send(job: 2233, toPrinter: "Out Paper")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the reset of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 2233, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)