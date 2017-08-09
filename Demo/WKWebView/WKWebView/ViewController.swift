//
//  ViewController.swift
//  WKWebView
//
//  Created by Mark Ran on 2017/8/9.
//  Copyright © 2017年 hehe. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webContentView: UIView!
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView = WKWebView.init(frame: webContentView.bounds)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webContentView.addSubview(webView)
        
        let url = URL.init(string: "http://www.baidu.com")!
        let request = URLRequest.init(url: url)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: WKUIDelegate {
    //(1)WKWebView创建初始化加载的一些配置
//    func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        
//    }
    
    //(2)iOS9.0中新加入的,处理WKWebView关闭的时间
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    //    (3)处理网页js中的提示框,若不使用该方法,则提示框无效
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    //    (4)处理网页js中的确认框,若不使用该方法,则确认框无效
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    //    (5)处理网页js中的文本输入
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
    }
}

extension ViewController: WKNavigationDelegate {
    //(1)决定网页能否被允许跳转
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        
//    }
    
    //    (2)处理网页开始加载
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    //    (3)处理网页加载失败
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    //    (4)处理网页内容开始返回
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    //    (5)处理网页加载完成
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
                                    print(html ?? "error")
        })
    }
        
    //    (6)处理网页返回内容时发生的失败
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
        
    //    (7)处理网页进程终止
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
    }
    
}
