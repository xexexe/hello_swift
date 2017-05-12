//
//  ViewController.swift
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/8.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        //swift -> oc
        let funOC = OCClassForBridge()
        funOC.desc2()
        funOC.desc22()
        let funOCClass2 = sum2(10,1)
        print("swift->OC C output:\(funOCClass2)")
        
        //swift -> c (no .h)
        desc1()
        let funcCClasses = sum1(10,2)
        print("swift->C no .h output:\(funcCClasses)")//12
        
        //swift -> C (have .h)
        desc3()
        let funcCClass33 = sum3(10, 3)
        print("swift->C have .h output: \(funcCClass33)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

