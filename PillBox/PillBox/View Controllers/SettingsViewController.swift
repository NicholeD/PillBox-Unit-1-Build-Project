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
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        prescriptionController.loadFromPersistentStore()
        setTheme()
    }
    
    var prescriptionController = PrescriptionController()

    @IBAction func darkMode(_ sender: Any) {
        
        themeHelper?.themeSelected.toggle()

        themeHelper?.setThemePreferenceToDark()
        setTheme()
       
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        prescriptionController.saveToPersistentStore()
        setTheme()
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
