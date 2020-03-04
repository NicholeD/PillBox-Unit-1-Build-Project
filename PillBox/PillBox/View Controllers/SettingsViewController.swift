//
//  SettingsViewController.swift
//  PillBox
//
//  Created by Harmony Radley on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func darkMode(_ sender: UISwitch) {
        if (sender.isOn == true) {
            themeHelper?.setThemePreferenceToDark()
            dismiss(animated: true, completion: nil)
        } else if sender.isOn == false {
            themeHelper?.setThemePreferenceToDark()
        }
    
        
    }
    
    var themeHelper: ThemeHelper?
}
// pass theme through each segue 
