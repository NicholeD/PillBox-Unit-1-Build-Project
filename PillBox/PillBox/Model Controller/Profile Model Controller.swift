//
//  Profile Model Controller.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation

class ProfileController {
    
    var profile: Profile?
    
    //TODO: build out add profile view and finish persistence code below
    
    
//    func addPrescriptionTapped(with name: String, dosage: String, frequency: String, am: Bool = false, pm: Bool = false, notes: String) {
//
//        let newPrescription = Prescription(name: name, dosage: dosage, frequency: frequency, am: am, pm: pm, notes: notes)
//
//        prescriptions.append(newPrescription)
//
//        saveToPersistentStore()
//    }
//
//    init() {
//
//           loadFromPersistentStore()
//       }
//
//
//    var prescriptionListURL: URL? {
//
//        let fileManager = FileManager.default
//        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
//
//        let prescriptionsURL = documentsDir.appendingPathComponent("PrescriptionList.plist")
//
//        return prescriptionsURL
//    }
//
//    func saveToPersistentStore() {
//
//        guard let fileURL = prescriptionListURL else { return }
//
//        let encoder = PropertyListEncoder()
//
//        do {
//
//            let prescriptionsData = try encoder.encode(prescriptions)
//            try prescriptionsData.write(to: fileURL)
//
//        } catch {
//            print("Error encoding prescriptions array: \(error)")
//
//        }
//     }
//
//        func loadFromPersistentStore() {
//
//            do {
//                guard let fileURL = prescriptionListURL else { return }
//                let prescriptionsData = try Data(contentsOf: fileURL)
//                let decoder = PropertyListDecoder()
//                let decodedPrescriptions = try decoder.decode([Prescription].self, from: prescriptionsData)
//                self.prescriptions = decodedPrescriptions
//            } catch {
//                print("Error decoding prescriptions: \(error)")
//        }
//    }
//
}
