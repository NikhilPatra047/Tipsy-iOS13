//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nikhil Kumar Patra on 03/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var split: String?
    var message: String?

    @IBOutlet weak var spiltPerPersonDisplay: UILabel!
    @IBOutlet weak var splitMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiltPerPersonDisplay.text = split
        splitMessage.text = message
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
