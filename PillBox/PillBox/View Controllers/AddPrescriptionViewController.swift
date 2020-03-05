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
    
    var prescriptionController: PrescriptionController?
    var delegate: PrescriptionAddedDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
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
    
      // Toggle action will show in the alert or in the prescription detail view... not sure yet
    
    @IBAction func toggleAm(_ sender: UISwitch) {
    }
    
    @IBAction func togglePm(_ sender: UISwitch) {
    }
    
    @IBAction func addPrescriptionTapped(_ sender: Any) {
        guard let name = prescriptionNameTextField.text,
            let dosage = dosageTextField.text,
            let frequency = frequencyTextField.text,
            let notes = notesTextView.text else { return }
        
        prescriptionController?.addPrescriptionTapped(with: name, dosage: dosage, frequency: frequency, notes: notes)
        
        delegate?.prescriptionWasAdded()
        
        navigationController?.popViewController(animated: true)
    }
}
