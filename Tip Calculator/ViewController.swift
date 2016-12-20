//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Aditya Dhingra on 12/4/16.
//  Copyright © 2016 Aditya Dhingra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var totalamount: UILabel!
    @IBOutlet weak var tipamount: UILabel!
    @IBOutlet weak var billamount: UITextField!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultTip")
        segControl.selectedSegmentIndex = index
        print("INDEX: ", index)
        calculateTip(self)
        billamount.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segValueChanges(_ sender: Any) {
        calculateTip(self)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.15, 0.20, 0.25]
        let bill = Double(billamount.text!) ?? 0
        let tip = bill * tipPercentages[segControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipamount.text = String(format: "+ $%.2f", tip)
        totalamount.text = String(format: "= $%.2f", total)
        
    }
    

}

