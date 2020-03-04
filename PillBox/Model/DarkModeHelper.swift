//
//  DarkModeHelper.swift
//  PillBox
//
//  Created by Harmony Radley on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class ThemeHelper {
    
        
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToDark()
    
        }
    
    private let themePreferenceKey = "themePreference"

}
