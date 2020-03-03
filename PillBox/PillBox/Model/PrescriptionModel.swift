//
//  PerscriptionModel.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class Prescription {
    
    var name: String
    var dosage: String
    var frequency: String
    var am: Bool
    var pm: Bool
    
    init(name: String) {
        self.name = name
    }
}
