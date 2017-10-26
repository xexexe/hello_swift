//https://dzone.com/articles/swift-generic-protocols-what-are-they-good-for
import UIKit

public protocol Automobile {
    associatedtype FuelType
    associatedtype ExhaustType
    func drive(fuel: FuelType) -> ExhaustType
}
public protocol Fuel {
    associatedtype ExhaustType
    func consume() -> ExhaustType
}
public protocol Exhaust {
    init()
    func emit()
}


public struct UnleadedGasoline<E: Exhaust>: Fuel {
    public func consume() -> E {
        print("...consuming unleaded gas...")
        return E()
    }
}
public struct CleanExhaust: Exhaust {
    public init() {}
    public func emit() {
        print("...this is some clean exhaust...")
    }
}
public class Car<F: Fuel,E: Exhaust>: Automobile where F.ExhaustType == E {
    public func drive(fuel: F) -> E {
        return fuel.consume()
    }
}

var fusion = Car<UnleadedGasoline<CleanExhaust>, CleanExhaust>()
fusion
    .drive(fuel: UnleadedGasoline<CleanExhaust>())
    .emit()

public class Car2<F: Fuel>: Automobile {
    public func drive(fuel: F) -> F.ExhaustType {
        return fuel.consume()
    }
}
var fusion2 = Car2<UnleadedGasoline<CleanExhaust>>()
fusion2
    .drive(fuel: UnleadedGasoline<CleanExhaust>())
    .emit()
