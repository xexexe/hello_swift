//
//  DMWebViewController.swift
//  BeginProgect
//
//  Created by Mark Ran on 2017/5/19.
//  Copyright © 2017年 markran. All rights reserved.
//

import UIKit
import WebKit

class DMWebViewController: UIViewController ,WKNavigationDelegate, WKUIDelegate{
    /**
     参考：http://www.jianshu.com/p/d29384454a9a 。
     */
    var webview = WKWebView()
    var btnBack = UIBarButtonItem()
    var btnForward = UIBarButtonItem()
    var progBar = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height));
        
        webview.navigationDelegate = self
        
        let url = URL(string: "https://www.baidu.com")
        
        let request = NSURLRequest(url: url!)
        
        webview.load(request as URLRequest)
        
        self.view.addSubview(webview)
        
        //前进 后退 按钮
        setNavBar()
        
        //修改网页配置
        webview.uiDelegate = self
        
        //进度条
        //以下代码添加到viewDidLoad()
        progBar = UIProgressView(frame: CGRect(x: 0, y:100 , width: self.view.bounds.width, height: 30))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.red
        self.webview.addSubview(progBar)
        self.webview.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webview.removeObserver(self, forKeyPath: "estimatedProgress")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.title = self.webview.title
    }
    
    func setNavBar() {
        btnBack = UIBarButtonItem(title: "后退", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DMWebViewController.toBack))
        btnForward = UIBarButtonItem(title: "前进", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DMWebViewController.toForward))
        self.navigationItem.leftBarButtonItem = btnBack
        self.navigationItem.rightBarButtonItem = btnForward
    }
    
    func toBack() {
        if self.webview.canGoBack {
            self.webview.goBack()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func toForward() {
        if self.webview.canGoForward {
            self.webview.goForward()
        }
    }
    
    //修改网页配置
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        //如果目标主视图不为空,则允许导航
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            self.webview.load(navigationAction.request)
        }
        return nil
    }
    
    //处理js
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
            completionHandler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //进度条通知
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1
            progBar.setProgress(Float(webview.estimatedProgress), animated: true)
            if self.webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                    self.progBar.alpha = 0
                }, completion: { (finished:Bool) -> Void in
                    self.progBar.progress = 0
                })
            }

        }
    }

}
