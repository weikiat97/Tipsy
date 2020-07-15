//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.10
    var numberOfPeople = 2
    var sum = 0.0
    
    var tipsyBrain = TipsyBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tip = 0.00
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            tip = 0.10
        } else if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            tip = 0.20
        }
    }
  
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            sum = Double(bill)!
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.value = tipsyBrain.getSplitSum(bill: sum, tip: tip, numberOfPeople: numberOfPeople)
            destinationVC.numberOfPeople = String(numberOfPeople)
            let tipPercent = Int(tip * 100)
            destinationVC.tip = String(tipPercent) + "%"
        }
        
    }
    
    
}

