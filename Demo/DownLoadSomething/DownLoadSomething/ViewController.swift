//
//  ViewController.swift
//  DownLoadSomething
//
//  Created by Mark Ran on 2017/9/21.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sessionSimpleDownload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sessionLoadData(){
        //使用全局的 URLSession.shared 和 dataTask 方法创建。
        
        //创建URL对象
        let urlString = "http://weibo.wondershare.cn"
        let url = URL(string:urlString)
        //创建请求对象
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request,
                                        completionHandler: {(data, response, error) -> Void in
                                            if error != nil{
                                                print(error.debugDescription)
                                            }else{
                                                let str = String(data: data!, encoding: String.Encoding.utf8)
                                                print(str ?? "")
                                            }
        }) as URLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
    }
    
    func sessionSimpleDownload(){
        //下载地址
        let url = URL(string: "https://pic2.zhimg.com/50/57f7b225124f20fc1e31bdccd9ac96cd_hd.png")
        //请求
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        //下载任务
        let downloadTask = session.downloadTask(with: request,
                                                completionHandler: { (location:URL?, response:URLResponse?, error:Error?)
                                                    -> Void in
                                                    //输出下载文件原来的存放目录
                                                    print("location:\(String(describing: location))")
                                                    //location位置转换
                                                    let locationPath = location!.path
                                                    //拷贝到用户目录
                                                    let documnets:String = NSHomeDirectory() + "/Documents/1.png"
                                                    //创建文件管理器
                                                    let fileManager = FileManager.default
                                                    try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
                                                    print("new location:\(documnets)")
        })
        
        //使用resume方法启动任务
        downloadTask.resume()
    }
    
    func sessionUpload(){
        //使用Upload Task来上传文件
        
        //上传地址
        let url = URL(string: "http://hangge.com/upload.php")
        //请求
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringCacheData)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        
        //上传数据流
        let documents =  NSHomeDirectory() + "/Documents/1.png"
        let imgData = try! Data(contentsOf: URL(fileURLWithPath: documents))
        
        
        let uploadTask = session.uploadTask(with: request, from: imgData) {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
            //上传完毕后
            if error != nil{
                print(error)
            }else{
                let str = String(data: data!, encoding: String.Encoding.utf8)
                print("上传完毕：\(str)")
            }
        }
        
        //使用resume方法启动任务
        uploadTask.resume()
    }
}

//import UIKit
//
//class ViewController: UIViewController, URLSessionDownloadDelegate {
//    
//    private lazy var session:URLSession = {
//        //只执行一次
//        let config = URLSessionConfiguration.default
//        let currentSession = URLSession(configuration: config, delegate: self,
//                                        delegateQueue: nil)
//        return currentSession
//        
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        sessionSeniorDownload()
//    }
//    
//    //下载文件
//    func sessionSeniorDownload(){
//        //下载地址
//        let url = URL(string: "http://hangge.com/blog/images/logo.png")
//        //请求
//        let request = URLRequest(url: url!)
//        
//        //下载任务
//        let downloadTask = session.downloadTask(with: request)
//        
//        //使用resume方法启动任务
//        downloadTask.resume()
//    }
//    
//    
//    //下载代理方法，下载结束
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
//                    didFinishDownloadingTo location: URL) {
//        //下载结束
//        print("下载结束")
//        
//        //输出下载文件原来的存放目录
//        print("location:\(location)")
//        //location位置转换
//        let locationPath = location.path
//        //拷贝到用户目录
//        let documnets:String = NSHomeDirectory() + "/Documents/2.png"
//        //创建文件管理器
//        let fileManager = FileManager.default
//        try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
//        print("new location:\(documnets)")
//    }
//    
//    //下载代理方法，监听下载进度
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
//                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
//                    totalBytesExpectedToWrite: Int64) {
//        //获取进度
//        let written:CGFloat = (CGFloat)(totalBytesWritten)
//        let total:CGFloat = (CGFloat)(totalBytesExpectedToWrite)
//        let pro:CGFloat = written/total
//        print("下载进度：\(pro)")
//    }
//    
//    //下载代理方法，下载偏移
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
//                    didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
//        //下载偏移，主要用于暂停续传
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}



// 使用Upload Task来上传文件

//<?php
///** php 接收流文件
// * @param  String  $file 接收后保存的文件名
// * @return boolean
// */
//function receiveStreamFile($receiveFile){
//    $streamData = isset($GLOBALS['HTTP_RAW_POST_DATA'])? $GLOBALS['HTTP_RAW_POST_DATA'] : '';
//    
//    if(empty($streamData)){
//        $streamData = file_get_contents('php://input');
//    }
//    
//    if($streamData!=''){
//        $ret = file_put_contents($receiveFile, $streamData, true);
//    }else{
//        $ret = false;
//    }
//    
//    return $ret;
//}
//
////定义服务器存储路径和文件名
//$receiveFile =  $_SERVER["DOCUMENT_ROOT"]."/uploadFiles/hangge.png";
//$ret = receiveStreamFile($receiveFile);
//echo json_encode(array('success'=>(bool)$ret));
//?>
