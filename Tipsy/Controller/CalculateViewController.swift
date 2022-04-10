//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twoPctButton: UIButton!
    @IBOutlet weak var splitChanged: UILabel!
    
    var calculate = Calculate()
    
    var tip: Double = 0.10
    var people: Int = 2
    var billInNumbers: Double = 0.0
    var finalResult = "0.0"
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        people = Int(sender.value)
        let split = String(format: "%.0f", sender.value)
        splitChanged.text = split
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTotal.endEditing(true) //This is to ensure that when the tip button is tapped, the UI keyboard goes away
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twoPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let dropPercentageFromButtonTitle = String(buttonTitle.dropLast())
        let buttonTitleNumber = Double(dropPercentageFromButtonTitle)!
        tip = buttonTitleNumber / 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTotal.text!
        if bill != "" {
            let result = calculate.calculateResult(bill: bill, tip: tip, people: people)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.split = finalResult
            destinationVC.message = "Split between \(people) people, with \(Int(tip * 100))% tip."
        }
    }
}


