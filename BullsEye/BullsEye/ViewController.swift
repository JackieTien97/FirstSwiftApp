//
//  ViewController.swift
//  BullsEye
//
//  Created by Slow_Time on 2017/7/28.
//  Copyright © 2017年 Slow_Time. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelOfTargetValue: UILabel!
    @IBOutlet weak var labelOfRound: UILabel!
    @IBOutlet weak var labelOfScore: UILabel!
    
    let initialValueOfSlider = 50
    var currentValue: Int!
    var targetValue: Int!
    var round = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
        // 更改slider滑动条的外观
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let point = 100 - abs(targetValue - currentValue)
        let message = "笨蛋，你的得分是：\(point)\n你的结果是：\(Int(currentValue))\n目标数值是：\(Int(targetValue))\n差值是：\(difference)"
        score += point
        var title: String
        if difference == 0 {
            title = "完美！你可以去买彩票了！"
        }
        else if difference < 5 {
            title = "这运气可以中二等奖了"
        }
        else if difference < 10 {
            title = "貌似还不错"
        }
        else {
            title = "就你这水平，还来玩？"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "我喜欢田原", style: .default, handler: {
            action in
                self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func silderMoved(slider: UISlider) {
//        print("滑动条的当前数值是：\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        labelOfRound.text = String(round)
        labelOfScore.text = String(score)
        targetValue = Int(arc4random_uniform(100)) + 1
        updateLabelOfTargetValue(targetValue: targetValue)
        currentValue = initialValueOfSlider
        slider.value = Float(initialValueOfSlider)
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
    }
        
    private func startNewRound() {
        round += 1
        labelOfRound.text = String(round)
        labelOfScore.text = String(score)
        targetValue = Int(arc4random_uniform(100)) + 1
        updateLabelOfTargetValue(targetValue: targetValue)
        currentValue = initialValueOfSlider
        slider.value = Float(initialValueOfSlider)
    }
    
    private func updateLabelOfTargetValue(targetValue: Int) {
        labelOfTargetValue.text = String(targetValue)
    }
}

