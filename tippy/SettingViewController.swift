//
//  SettingViewController.swift
//  tippy
//
//  Created by Gao, Felix on 2/28/17.
//  Copyright © 2017 Gao, Felix. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var defaultPercentageSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PercentageChanged(_ sender: Any) {
        let percentages = [0.18, 0.20, 0.25]
        let defaults = UserDefaults.standard
        defaults.set(defaultPercentageSegment.selectedSegmentIndex,  forKey: "percentage_selected_index")
        defaults.set(percentages[defaultPercentageSegment.selectedSegmentIndex],
                     forKey: "percentage_selected_value")
        defaults.synchronize()
        print("Stored \(defaultPercentageSegment.selectedSegmentIndex) as the default selected index")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultSelector = defaults.integer(forKey: "percentage_selected_index")
        print("default selector is \(defaultSelector)")
        defaultPercentageSegment.selectedSegmentIndex = defaultSelector
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
