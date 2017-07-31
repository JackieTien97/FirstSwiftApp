//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Slow_Time on 2017/7/29.
//  Copyright © 2017年 Slow_Time. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlFile = Bundle.init().path(forResource: "BullsEye", ofType: "html") {
            let htmlFileURL = URL.init(fileURLWithPath: htmlFile)
            let htmlData = try! Data(contentsOf: htmlFileURL)
            let baseURL = NSURL.fileURL(withPath: Bundle.init().bundlePath)
            webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
        }
//        let url = URL.init(fileURLWithPath: "http://www.baidu.com")
//        let request = URLRequest(url: url)
//        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
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
