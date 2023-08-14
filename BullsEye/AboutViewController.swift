//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Christian Mounts on 8/13/23.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html"){
            let request = URLRequest(url:url)
            webView.load(request)
        }
    }
    @IBOutlet var webView: WKWebView!
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
