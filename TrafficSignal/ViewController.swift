//
//  ViewController.swift
//  TrafficSignal
//
//  Created by Shivam on 30/03/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trafficLightImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    var performanceTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    var performanceTimerInt = 5
    var tempScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreInt = 0
        performanceTimerInt = 5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startGame(_ sender: Any) {
        
        if scoreInt == 0 {
            label.font = label.font.withSize(80)
            timerInt = 3
            performanceTimerInt = 5
            
            trafficLightImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: UIControlState.normal)
            
            label.text = String(scoreInt)
            
            
            
            
            
        } else {
            performanceTimerInt = 5
            startStopButton.isEnabled = false
            performanceTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(displayPerformance), userInfo: nil, repeats: true)
            scoreTimer.invalidate()
            tempScore = scoreInt
            scoreInt = 0
            startStopButton.setTitle("", for: UIControlState.normal)
            label.font = label.font.withSize(80)
            
        }
        
        
        
        
    }
    
    
    @objc func updateTimer() {
        
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightImage.image = UIImage(named: "trafficLight3")
        } else if timerInt == 1 {
            trafficLightImage.image = UIImage(named: "trafficLight2")
        } else if timerInt == 0 {
            trafficLightImage.image = UIImage(named: "trafficLight1")
            startTimer.invalidate()
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: UIControlState.normal)
            
        }
        
    }

    @objc func updateScoreTimer() {
        scoreInt += 1
        label.text = String(scoreInt)
        
    }
    
    @objc func displayPerformance() {
        
        performanceTimerInt -= 1
        
        
        if performanceTimerInt == 0 {
            label.font = label.font.withSize(20)
            if tempScore < 31 {
                label.text = "Your Grade is A"
            } else if tempScore > 30 && tempScore < 61 {
                label.text = "Your Grade is B"
            } else if tempScore > 60 && tempScore < 91 {
                label.text = "Your Grade is C"
            } else {
                label.text = "You Failed! Try Again !!"
            }
            startStopButton.isEnabled = true
            startStopButton.setTitle("Restart", for: UIControlState.normal)
            performanceTimer.invalidate()
        }
        
        
        
        
        
    }
    
    
    
}

