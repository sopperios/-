//
//  WebViewController.swift
//  HomeWork
//
//  Created by Mint Yang on 2019/6/10.
//  Copyright © 2019 Mint Yang. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var url:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(NSURLRequest(url:NSURL.init(string:self.url)! as URL) as URLRequest)
        // Do any additional setup after loading the view.
    }
    
    func setUrl(url:String){
        self.url = url
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
