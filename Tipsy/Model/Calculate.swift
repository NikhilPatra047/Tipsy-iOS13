//
//  Calculate.swift
//  Tipsy
//
//  Created by Nikhil Kumar Patra on 03/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct Calculate {
    
    func calculateResult(bill: String, tip: Double, people: Int)  -> Double {
        let billInNumbers = Double(bill)!
        let result = billInNumbers * (1 + tip) / Double(people)
        return result
    }
}
