//
//  ViewController.swift
//  RegularExpression
//
//  Created by Mark Ran on 2017/8/9.
//  Copyright © 2017年 hehe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "hehe", ofType: "html") {
//            let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
////            let pattern = "^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$"
////            let pattern = "^1[0-9]{10}$"
////            let pattern = "^[a-z0-9_-]{3,16}$"
            let input = try?String.init(contentsOfFile: path, encoding: .utf8)
//            let input = "admin@hangge.com"
//            
//            let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
//            
//            let matches = regex?.matches(in: input,
//                                                 options: [],
//                                                 range: NSMakeRange(0, input.characters.count))

            check(str: input!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    private func check(str: String) {
        // 使用正则表达式一定要加try语句
        do {
            // - 1、创建规则
//            let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            let pattern = "\\bhttp?://.*?(jpg|png)"
            // - 2、创建正则表达式对象
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            // - 3、开始匹配
            let res = regex.matches(in: str, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, str.characters.count))
            // 输出结果
            for checkingRes in res {
                print((str as NSString).substring(with: checkingRes.range))
            }
        }
        catch {
            print(error)
        }
    }
}

