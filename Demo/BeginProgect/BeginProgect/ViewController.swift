//
//  ViewController.swift
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/8.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit
import Alamofire
import SQLite

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        self.demoForRegex()
        self.demoForBase64()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func demoForBase64() {
        let str = "iOS Developer Tips encoded in Base64"
        print("Original: \(str)")
        
        // UTF 8 str from original
        // NSData! type returned (optional)
        //Data(self.utf8).base64EncodedString()
        let utf8str = Data(str.utf8)
        
        // Base64 encode UTF 8 string
        // fromRaw(0) is equivalent to objc 'base64EncodedStringWithOptions:0'
        // Notice the unwrapping given the NSData! optional
        // NSString! returned (optional)
        let base64Encoded = utf8str.base64EncodedString()
        print("Encoded:  \(base64Encoded)")

        // Base64 Decode (go back the other way)
        // Notice the unwrapping given the NSString! optional
        // NSData returned
        let data = Data(base64Encoded: base64Encoded)

        // Convert back to a string
        let base64Decoded = String(data: data!, encoding: .utf8)
        print("Decoded:  \(base64Decoded)")
    }
    
    // Demo for regex
    func demoForRegex() {
        let email = "mail@hehe.com"
        let emailString = "([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailString)
        let bEmail:Bool = emailPredicate.evaluate(with: email)
        print(bEmail)
    }
    
    // Demo for SQLite
    func demoFuncForSQLite() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            let db = try Connection("\(path)/db.sqlite3")
            
            let users = Table("users")
            let id = Expression<Int64>("id")
            let name = Expression<String?>("name")
            let email = Expression<String>("email")
            
            try db.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
            })
            
            let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
            let rowid = try db.run(insert)
            // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
            
            for user in try db.prepare(users) {
                print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
                // id: 1, name: Optional("Alice"), email: alice@mac.com
            }
            // SELECT * FROM "users"
            
            let alice = users.filter(id == rowid)
            
            try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
            // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
            // WHERE ("id" = 1)
            
            try db.run(alice.delete())
            // DELETE FROM "users" WHERE ("id" = 1)
            
            try db.scalar(users.count)
            // SELECT count(*) FROM "users"
            
        } catch  {
            print(error)
        }
    }
    
    // Demo for Alamofire
    func demoFuncForAlamofire() {
         Alamofire.request("https://www.baidu.com").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }       
    }
    
    // Demo for use C and C++
    func demoFuncForUseingCAndObjC() {
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

}

