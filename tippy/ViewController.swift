//
//  ViewController.swift
//  tippy
//
//  Created by Gao, Felix on 2/28/17.
//  Copyright © 2017 Gao, Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
          view.endEditing(true)
    }
    
    func updateTips(){
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(BillField.text!) ?? 0
        let tip = bill * tipPercentages[tipSelector.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        updateTips()
    }
    @IBAction func tipChanged(_ sender: Any) {
        updateTips()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultSelector = defaults.integer(forKey: "percentage_selected_index")
        print("default selector is \(defaultSelector)")
        tipSelector.selectedSegmentIndex = defaultSelector
        
        if(!BillField.text!.isEmpty){
            updateTips()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // print("view did disappear")
    }
}

