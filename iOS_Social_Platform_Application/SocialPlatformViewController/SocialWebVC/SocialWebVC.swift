//
//  SocialWebVC.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import UIKit
import WebKit

class SocialWebVC: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView?
    
    public var loadUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: loadUrl) else {
                    return
                }
        let requestObj = NSURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5.0 )
        self.webView?.uiDelegate = self
        webView?.load(requestObj as URLRequest)
    }

}
