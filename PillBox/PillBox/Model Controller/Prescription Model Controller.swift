//
//  Prescription Model Controller.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class PrescriptionController {
    
    var prescriptions: [Prescription] = []
    
    fun addPrescriptionTapped(with name: String, dosage: String, frequency: String, am: Bool = false, pm: Bool = false, notes: String) {
        
        let newPrescription = Prescription(name: name, dosage: dosage, frequency: frequency, am: am, pm: pm, notes: notes)
        prescriptions.append(newPrescription)
    }
    
    
}



