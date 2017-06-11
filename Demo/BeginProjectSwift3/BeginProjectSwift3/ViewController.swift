//
//  ViewController.swift
//  BeginProjectSwift3
//
//  Created by Mark Ran on 2017/6/9.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // demo for uuid
        self.demoUUID()
        
        // demo for http
//        self.demoHttpGet()
//        self.demoHttpDown()
        
        // demo for file manage
//        self.demoFileManage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

extension ViewController {
    func demoUUID() {
        let uuid = NSUUID.init().uuidString
        print("uuid is: \(uuid)")
    }
}

extension ViewController {
    func demoHttpGet(){
        //https://swiftcafe.io/2015/12/20/nsurlsession/
        if let url = NSURL(string: "http://hb.ranjun.net.cn/netshare/test.php") {
            URLSession.shared.dataTask(with: url as URL){ data, response, error in
                //...
                print(data as Any)
                print(response as Any)
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any] {
                    print("----")
                    print(json)
                } else {
                    print("error")
                }
            }.resume()
        }
    }
    
//    func demoHttpDown(){
//        let imageURL = NSURL(string: "http://10.10.0.129/php-demo/hehe.png")!
//        URLSession.shared.downloadTask(with: imageURL as URL) { location, response, error in
//
//            guard let url = location else { return }
//            guard let imageData = NSData.init(contentsOf: url) else { return }
//            let UIImage = UIImage.init(data: imageData)
//            DispatchQueue.main.async() {
//                //...
//                self.imageView.image = image
//            }
//
//            }.resume()
//    }
}

extension ViewController {
    func demoFileManage() {
        //获取沙盒主目录路径
        let homeDir=NSHomeDirectory()
        print("Home dir: \(homeDir)")
        //获取Documents目录路径
        var paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        var documentsDirectory = paths[0]
        print("Document dir: \(documentsDirectory)")
        //或者相对Home路径
        documentsDirectory = NSHomeDirectory() + "/Documents" //NSHomeDirectory().stringByAppendingPathComponent("Documents") 
        print("or doucment dir: \(documentsDirectory)")
        // 获取Library目录路径
        paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        var libraryDirectory = paths[0]
        print("Library dir: \(libraryDirectory)")
        //或者相对Home路径
        libraryDirectory = NSHomeDirectory()+"/Library"
        print("or Library dir: \(libraryDirectory)")
        // 获取Caches目录路径
        paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let cacheDirectory = paths[0]
        print("Cache dir: \(cacheDirectory)")
        // 获取tmp目录路径
        var tmpDirectory = NSTemporaryDirectory()
        print("Temp dir: \(tmpDirectory)")
        //或者相对Home目录
        tmpDirectory = NSHomeDirectory()+"/tmp"
        print("or Temp dir: \(tmpDirectory)")
    }
}

