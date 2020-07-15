//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Loh Wei Kiat on 8/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var value: String?
    var numberOfPeople: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = value
        let part1 = "Split between " + numberOfPeople! + " people, "
        let part2 = "with " + tip! + " tip"
        settingsLabel.text = part1 + part2
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true) {
        }
    }
    
}
