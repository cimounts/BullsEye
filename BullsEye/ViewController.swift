//
//  ViewController.swift
//  BullsEye
//
//  Created by Christian Mounts on 8/13/23.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage (named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(
            named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage (named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
            withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
            withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    func startNewRound(){
        round += 1
        targetValue=Int.random(in: 1...100)
        currentValue=50
        slider.value = Float (currentValue)
        updateLabels() 
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    @IBAction func showAlert(){
        let difference = abs(targetValue-currentValue)
        var points = 100-difference
        score += points
        
        
        let title:String
        if difference == 0{
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "Almost Hit It"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good"
        }else {
            title = "Not Even Close. . . "
        }
        let message = "You Scored \(points) points"
        
        let alert = UIAlertController(
            title:title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {_ in
                self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated:  true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
        let transition = CATransition()
        transition.type=CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
}

