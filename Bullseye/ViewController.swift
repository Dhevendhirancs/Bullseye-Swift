//
//  ViewController.swift
//  Bullseye
//
//  Created by Apple on 06/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var exactModeSwitch: UISwitch!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move slider to \(randomNumber)"
    }
    
    @IBAction func checkValue(_ sender: Any) {
        if exactModeSwitch.isOn == false {
            if Int(numSlider.value) >= randomNumber - 3 && Int(numSlider.value) <= randomNumber + 3 {
                ansLabel.text = "Yeh! you are correct. Bullseye"
                ansLabel.backgroundColor = UIColor.green
            } else {
                ansLabel.text = "Whoops! You missed it. Try again"
                ansLabel.backgroundColor = UIColor.red
            }
        } else {
            if randomNumber == Int(numSlider.value) {
                ansLabel.text = "You were right on point! Bullseye!"
                ansLabel.backgroundColor = UIColor.green
            } else {
                ansLabel.text = "Whoops! You missed it. Try again!"
                ansLabel.backgroundColor = UIColor.red
            }
        }
        ansLabel.isHidden = false
        playAgainBtn.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move slider to \(randomNumber)"
        numSlider.setValue(50, animated: true)
        ansLabel.isHidden = true
        playAgainBtn.isHidden = true
    }
    
    
}

