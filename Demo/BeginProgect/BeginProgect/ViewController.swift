//
//  ViewController.swift
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/8.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let json = JSON(12345)
        if json[0].string != nil {
            //Do something you want
        } else {
            print(json[0])       // "Array[0] failure, It is not an array"
            print(json[0].error as Any) // "Array[0] failure, It is not an array"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

