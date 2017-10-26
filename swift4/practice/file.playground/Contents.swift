import Foundation
import UIKit

var test = "hehe"

let path = "/Resources"

if FileManager.default.fileExists(atPath: path) {
    print("yes, is exist.")
} else {
    print("isn't exist.")
}

let image = UIImage.init(named: "222.png")

let ary = [image]
let pathCache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
print(pathCache)
let fullPath = (pathCache as NSString).appendingPathComponent("name")
//(ary as NSArray).write(toFile: fullPath, atomically: true)
