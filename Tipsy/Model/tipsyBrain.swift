//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Loh Wei Kiat on 8/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
        
    mutating func getSplitSum(bill: Double, tip: Double, numberOfPeople: Int) -> String {
        let total = bill * (1 + tip)
        let result = total / Double(numberOfPeople)
        return String(format: "%.2f", result)
    }
    
}
