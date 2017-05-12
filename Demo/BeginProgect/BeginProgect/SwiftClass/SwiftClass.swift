//
//  SwiftClass.swift
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/11.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class SwiftClass: NSObject {
    func sayHello(name: String) -> String {
        let greeting = "Hello"+name+"!"
        return greeting
    }
}
