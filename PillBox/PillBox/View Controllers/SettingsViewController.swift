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
    

    @IBAction func darkMode(_ sender: UISwitch) {
        if outletSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            label.textColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.white
            label.textColor = UIColor.black
        }
<<<<<<< HEAD
=======
    
        
    }
    
    
    func setTheme() {
        guard let themeHelper = themeHelper?.themePreference else { return }
         if themeHelper == "Dark" {
           view.backgroundColor = .darkGray
         } else {
           view.backgroundColor = .none
         }
     }
    
    
    var themeHelper: ThemeHelper?
>>>>>>> 618579173142315b958c66cfb6eaf788a1f15c3f
}
// pass theme through each segue 
}
