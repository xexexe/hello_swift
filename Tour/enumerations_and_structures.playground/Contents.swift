//: Playground - noun: a place where people can play

import UIKit

print("Enumeration and Structure!")

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func compare(rank: Rank) -> Bool {
        if rank.rawValue > self.rawValue {
            return true
        } else {
            return false
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
let compare = ace.compare(rank: Rank.five)

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

if let convertedRank = Rank(rawValue: 20) {
    let twentyDescription = convertedRank.simpleDescription()
} else {
    print("convertedRank is nil.")
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades:
            return "black"
        case .clubs:
            return "black"
        case .diamonds:
            return "red"
        case .hearts:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

let diamonds = Suit.diamonds
let diamondsDescription = diamonds.simpleDescription()
let diamondsColor = diamonds.color()

enum ServerResponse {
    case result(String, String)
    case unknown(String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let unknown = ServerResponse.unknown("UnKnown what happen")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .unknown(message):
    print("unknown...\(message)")
case let .failure(message):
    print("Failure... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
