//
//  PerscriptionModel.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class Prescription: Codable {
    
    var name: String
    var dosage: String
    var frequency: String
    var am: Bool
    var pm: Bool
    var notes: String?
    var taken: Bool
    
    init(name: String, dosage: String, frequency: String, am: Bool = false, pm: Bool = false, notes: String?, taken: Bool = false) {
        self.name = name
        self.dosage = dosage
        self.frequency = frequency
        self.am = am
        self.pm = pm
        self.notes = notes
        self.taken = taken
    }
}
