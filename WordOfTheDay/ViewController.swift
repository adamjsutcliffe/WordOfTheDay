//
//  ViewController.swift
//  WordOfTheDay
//
//  Created by Adam Sutcliffe on 14/11/2019.
//  Copyright © 2019 Peak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var WordOfTheDayBgView: UIView!
    @IBOutlet weak var WordOfTheDayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WordOfTheDayBgView.layer.cornerRadius = 10
        
//        WordOfTheDayButton.layer.borderWidth = 1
//        WordOfTheDayButton.layer.borderColor = UIColor.purple.cgColor
        WordOfTheDayButton.layer.cornerRadius = 5
        
//        WordOfTheDayLabel.text = "What is todays word of the day?\n\nCan you use it in the correct context?"
    }

    @IBAction func cancelToMainViewController(_ segue: UIStoryboardSegue) {
    }
}

