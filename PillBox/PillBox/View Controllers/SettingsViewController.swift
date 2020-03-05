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
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?


// pass theme through each segue 

func setTheme() {
  guard let themeHelper = themeHelper?.themePreference else { return }
  
    var backgroundColor: UIColor!
    
    switch themeHelper {
    case "Dark":
        backgroundColor = .black
        label.textColor = .white
    default:
        break
  }
   
    view.backgroundColor = backgroundColor
   
    }
}
