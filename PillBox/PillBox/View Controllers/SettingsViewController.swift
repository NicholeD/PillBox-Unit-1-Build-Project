//
//  SettingsViewController.swift
//  PillBox
//
//  Created by Harmony Radley on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
       @IBOutlet weak var outletSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //TODO: Userdefaults??



    @IBAction func darkMode(_ sender: UISwitch) {
        if outletSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            label.textColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.white
            label.textColor = UIColor.black
        }

    
    var themeHelper: ThemeHelper?

}
// pass theme through each segue 
}
