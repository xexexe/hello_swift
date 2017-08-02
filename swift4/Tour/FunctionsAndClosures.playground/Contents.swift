//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func greetForLunch(person: String, lunch: String) -> String {
    return "Hello \(person), lunch is \(lunch)."
}
greetForLunch(person: "Bob", lunch: "vegetable")

func greetOtherWay(_ persion: String, on day: String) -> String {
    return "Hello \(persion), today is \(day)."
}
greetOtherWay("John", on: "Wednesday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})

let mapperNumbers = numbers.map({number in 3 * number })
print(mapperNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
