//
//  ViewController.swift
//  BullsEye
//
//  Created by Slow_Time on 2017/7/28.
//  Copyright © 2017年 Slow_Time. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "你好，刘琦", message: "你是笨蛋", preferredStyle: .alert)
        let action = UIAlertAction(title: "我喜欢田原", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

