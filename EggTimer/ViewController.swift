//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 5*60,
        "Medium": 7*60,
        "Hard": 12*60
    ]
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var textField: UILabel!
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressView.progress = 0.0
        
        let hardness = sender.currentTitle!
        
//        Safe unwrapping:
    
//        guard
//            let soft = eggTimes["Soft"],
//            let medium = eggTimes["Medium"],
//            let hard = eggTimes["Hard"]
//        else {
//            print("Error!")
//            return
//        }
        
        totalTime = eggTimes[hardness]!
        
        // timeInterval -> how often to update in seconds
        // selector -> calls the updateCounter function every second
        // repeats -> if false, timer does 1 one second interval
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    // needs @objc because it comes from Objective C
    // antiquated
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
        } else {
            // counter finished
            textField.text = "Done!"
            timer.invalidate()
            progressView.progress = 1.0
        }
    }
 

}
