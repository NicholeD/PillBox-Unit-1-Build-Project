//
//  DarkModeHelper.swift
//  PillBox
//
//  Created by Harmony Radley on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//
import UIKit

class ThemeHelper {
    
    var themeSelected: Bool
        

    init(themeSelected: Bool = false) {
        self.themeSelected = themeSelected
        guard themePreference == nil else { return }
        setThemePreferenceToDark()

        }
    
    func setThemePreferenceToDark() {
           UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
       }
       
       var themePreference: String? {
           return UserDefaults.standard.string(forKey: themePreferenceKey)
       }
    
    private let themePreferenceKey = "themePreference"

}
