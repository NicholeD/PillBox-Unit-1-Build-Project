//
//  PrescriptionViewController.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController {

    let themeHelper = ThemeHelper()
    
        
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    // pass into each viewcontroller
    func setTheme() {
        guard let themeHelper = themeHelper.themePreference  else { return }
        if themeHelper == "Dark" {
            view.backgroundColor = .darkGray
        } else {
            view.backgroundColor = .none
        }
        
        
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
