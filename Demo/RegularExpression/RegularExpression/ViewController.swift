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
        //test1()
        test2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func check(pattern: String, str: String) {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, str.characters.count)
            let res = regex.matches(in: str, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: range)
            for checkingRes in res {
                print((str as NSString).substring(with: checkingRes.range))
            }
        } catch {
            print(error)
        }
    }
    
    private func old() {
        // Do any additional setup after loading the view, typically from a nib.
        
        //        let pattern = "^13$"
        //        let str = "lsdjlfafjllf1357892131231546143698wdaf"
        //        check(pattern: pattern, str: str)
        //        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        //        let mailStr = "lsls@oodd.com"
        //        check(pattern: mailPattern, str: mailStr)
        
        
        
        //        if let path = Bundle.main.path(forResource: "hehe", ofType: "html") {
        ////            let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        //////            let pattern = "^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$"
        //////            let pattern = "^1[0-9]{10}$"
        //////            let pattern = "^[a-z0-9_-]{3,16}$"
        //            let input = try?String.init(contentsOfFile: path, encoding: .utf8)
        ////            let input = "admin@hangge.com"
        ////
        ////            let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        ////
        ////            let matches = regex?.matches(in: input,
        ////                                                 options: [],
        ////                                                 range: NSMakeRange(0, input.characters.count))
        //
        //            check(str: input!)
        //        }
    }
    
    private func test1() {
        
        //let hehe = URLRegex(text: "sjdflasjdflweojfoemflfsajhttp://2233de.jpg")
        //print(hehe)
        
        /*
         NSString *phoneNo = @"13143503442";
         NSRange range = [phoneNo rangeOfString:@"^1[3]\\d{9}$" options:NSRegularExpressionSearch];
         if (range.location != NSNotFound) {
         NSLog(@"%@", [phoneNo substringWithRange:range]);
         }
         */
        let phoneNo: NSString = "13143503442"
        let range = phoneNo.range(of: "^1[3]\\d{9}$", options: NSString.CompareOptions.regularExpression)
        print(range.location)
    }
    
    private func test2() {
        /*
        NSString *url = @"1229436624@qq.com";
        NSError *error;
        // 创建NSRegularExpression对象并指定正则表达式
        NSRegularExpression *regex = [NSRegularExpression
            regularExpressionWithPattern:@"[^@]*\\."
            options:0
            error:&error];
        if (!error) { // 如果没有错误
            // 获取特特定字符串的范围
            NSTextCheckingResult *match = [regex firstMatchInString:url
                options:0
                range:NSMakeRange(0, [url length])];
            if (match) {
                // 截获特定的字符串
                NSString *result = [url substringWithRange:match.range];
                NSLog(@"%@",result);
            }
        } else { // 如果有错误，则把错误打印出来
            NSLog(@"error - %@", error);
        } 
         */
        
//        let url: NSString = "12swijflsjfi@eee.2943@sss.6624@qq.com"
//        do {
//            let regex = try NSRegularExpression(pattern: "[^@]*\\.", options: NSRegularExpression.Options(rawValue: 0))
//            let match = regex.matches(in: url as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, url.length))
//            print(match)
//            for m in match {
//                print(url.substring(with: m.range))
//            }
//        } catch  {
//            print(error)
//        }
        
        if let path = Bundle.main.path(forResource: "hehe", ofType: "html") {
            do {
                let input = try?String.init(contentsOfFile: path, encoding: .utf8)
                //let input = "122943@sss.6624@qq.com"
                //let input = "http://www.baidu.com"
                if let result = input as NSString? {
                    //let pattern = "[^@]*\\."
                    let pattern = "\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?"
                    
                    let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
                    let match = regex.matches(in: result as String, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, result.length))
                    for m in match {
                        print(result.substring(with: m.range))
                    }
                }
            } catch  {
                print(error)
            }
        }
    }

    private func check(str: String) {
        // 使用正则表达式一定要加try语句
        do {
            // - 1、创建规则
//            let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
//            let pattern = "\\bhttp?://.*?(jpg|png)"
            let pattern = "^1[0-9]{10}$"
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
    
    func URLRegex(text: String)
    {
        
        do{
            
            var dataArray = [String]()
            
            let pattern = "http?://.*?(jpg|png)"
            
            let dataDetector = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            
            let res = dataDetector.matches(in: text, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, text.characters.count))
            
            for checkingRes in res
            {
                let str = (text as NSString).substring(with: checkingRes.range)
                
                print(str)
                
                dataArray.append(str)
                
            }
            
            print(dataArray)
            
        }catch
        {
            print(error)
        }
    }

}

