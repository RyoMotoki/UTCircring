//
//  webViewController.swift
//  quizOriginalApp
//
//  Created by Ryo Motoki on 2017/06/18.
//  Copyright © 2017年 Desital Curcus Inc. All rights reserved.
//

import UIKit

class webViewController: UIViewController, UIWebViewDelegate {
    
    //@IBOutlet weak var goForward: UIBarButtonItem!
    //@IBOutlet weak var goBack: UIBarButtonItem!
    @IBOutlet weak var titleBar: UINavigationBar!
    @IBOutlet var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    var webUrl: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleBar.topItem?.title = "WebPage"
        
        webView.delegate = self
        webView.scalesPageToFit = true
        
        let url: URL = URL(string: "\(webUrl)")!
        let request: URLRequest = URLRequest(url: url)
        
        webView.loadRequest(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("indicator off")
    }
    
    
    @IBAction func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
        
    }
 
    @IBAction func goFoward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
