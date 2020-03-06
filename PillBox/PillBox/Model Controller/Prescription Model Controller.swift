//
//  Prescription Model Controller.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class PrescriptionController {
    
    init() {
        
        loadFromPersistentStore()
    }
    
    var prescriptions: [Prescription] = []
    
    func addPrescriptionTapped(with name: String, dosage: String, frequency: String, am: Bool = false, pm: Bool = false, notes: String) {
        
        let newPrescription = Prescription(name: name, dosage: dosage, frequency: frequency, am: am, pm: pm, notes: notes)
        
        prescriptions.append(newPrescription)
        
        saveToPersistentStore()
    }
    
    func updateHasBeenTaken() {
        
        var taken = false
        switch taken {
        case true:
            taken.toggle()
        default:
            taken.toggle()
        }
        saveToPersistentStore()
    }
    
    func toggleHasBeenTaken(for cell: PrescriptionListTableViewCell) {
        saveToPersistentStore()
    }
    
    // MARK: Persistence
    
    var prescriptionListURL: URL? {
        
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let prescriptionsURL = documentsDir?.appendingPathComponent("PrescriptionList.plist")
        
        return prescriptionsURL
    }
    
    func saveToPersistentStore() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let prescriptionsPlist = try encoder.encode(prescriptions)
            
            guard let fileURL = prescriptionListURL else { return }
            
            
            try prescriptionsPlist.write(to: fileURL)
            
        } catch {
            print("Error encoding prescriptions array: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let fileURL = prescriptionListURL else { return }
        let decoder = PropertyListDecoder()
        
        do {
            
            let prescriptionsData = try Data(contentsOf: fileURL)
            
            let decodedPrescriptions = try decoder.decode([Prescription].self, from: prescriptionsData)
            self.prescriptions = decodedPrescriptions
            
        } catch {
            print("Error decoding prescriptions: \(error)")
        }
    }
}



