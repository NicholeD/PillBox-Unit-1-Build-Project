//
//  AddPrescriptionViewController.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit
protocol PrescriptionAddedDelegate {
    func prescriptionWasAdded()
}

class AddPrescriptionViewController: UIViewController {
    
    @IBOutlet weak var prescriptionNameTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var toggleAmSwitch: UISwitch!
    @IBOutlet weak var togglePmSwitch: UISwitch!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var savePrescription: UIButton!
    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription?
    var delegate: PrescriptionAddedDelegate?
    var addPrescriptionViewController: AddPrescriptionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    private func updateView() {
        if let prescription = prescription {
            prescriptionNameTextField.text = prescription.name
            dosageTextField.text = prescription.dosage
            frequencyTextField.text = prescription.frequency
            notesTextView.text = prescription.notes
            toggleAmSwitch.isOn = prescription.am ?? false
            togglePmSwitch.isOn = prescription.pm ?? false
        }
    }
    
    @IBAction func toggleAm(_ sender: UISwitch) {
    }
    
    @IBAction func togglePm(_ sender: UISwitch) {
    }
    
    @IBAction func addPrescriptionTapped(_ sender: Any) {
        guard let name = prescriptionNameTextField?.text,
            name != "" else { return }
        
        if let prescriptionController = prescriptionController {
            
            if let prescription = prescription {
                prescription.name = prescriptionNameTextField.text ?? ""
                prescription.dosage = dosageTextField.text ?? ""
                prescription.frequency = frequencyTextField.text ?? ""
                prescription.notes = notesTextView.text
                prescription.am = toggleAmSwitch.isOn
                prescription.pm = togglePmSwitch.isOn
                prescriptionController.saveToPersistentStore()
            } else{
                prescriptionController.addPrescriptionTapped(with: name, dosage: dosageTextField.text ?? "", frequency: frequencyTextField.text ?? "", notes: notesTextView.text)
            }
        }
        
        delegate?.prescriptionWasAdded()
        
        navigationController?.popViewController(animated: true)
    }
}

