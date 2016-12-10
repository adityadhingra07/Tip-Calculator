//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Aditya Dhingra on 12/4/16.
//  Copyright © 2016 Aditya Dhingra. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    let tipList = [0.15, 0.20, 0.25]
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultTip")
        tipSegment.selectedSegmentIndex = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        changeDefault(self)
    }
    
    func changeDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegment.selectedSegmentIndex, forKey: "defaultTip")
        print("SETTINGS: ", tipSegment.selectedSegmentIndex)
        defaults.synchronize()
    }

}
