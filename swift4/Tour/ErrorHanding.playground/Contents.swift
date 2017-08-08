//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "BiSheng")
    print(printerResponse)
} catch {
    print(error)
}


