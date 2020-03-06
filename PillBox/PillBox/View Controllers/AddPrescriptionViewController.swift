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
    var prescription: Prescription?
    var delegate: PrescriptionAddedDelegate?
    var addPrescriptionViewController: AddPrescriptionViewController?
    var settingsVC: SettingsViewController!
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

    }
    
    private func updateView() {
        if prescription != nil {
            self.title = prescriptionNameTextField.text
            addPrescriptionViewController?.title = "\(prescriptionNameTextField.text ?? "Add a new prescription")"
        }

       let dosageString = String(dosageTextField.text ?? "")
       self.dosageTextField.text = dosageString
       let frequencyString = String(frequencyTextField.text ?? "")
       self.frequencyTextField.text = frequencyString
       let notesString = String(notesTextView.text ?? "")
       self.notesTextView.text = notesString
        
    }
    
    func setTheme() {
        guard let themeHelper = settingsVC.themeHelper?.themePreference else { return }
     
     var backgroundColor: UIColor!
      
     switch themeHelper {
     case "Dark":
       backgroundColor = .black
       settingsVC.label.textColor = .white
     default:
       break
    }
     
     view.backgroundColor = backgroundColor
     
     }
    
    @IBAction func toggleAm(_ sender: UISwitch) {
    }
    
    @IBAction func togglePm(_ sender: UISwitch) {
    }
    
    @IBAction func addPrescriptionTapped(_ sender: Any) {
        guard let name = prescriptionNameTextField?.text,
        let dosage = dosageTextField.text,
        let frequency = frequencyTextField.text,
        let notes = notesTextView.text,
        name != "" && dosage != "" && frequency != "" && notes != "" else { return }
        
        if let prescriptionController = prescriptionController {
             prescriptionController.addPrescriptionTapped(with: name, dosage: dosage, frequency: frequency, notes: notes)

        } else {
             prescriptionController?.addPrescriptionTapped(with: name, dosage: dosage, frequency: frequency, notes: notes)
            }
        delegate?.prescriptionWasAdded()
        
        navigationController?.popViewController(animated: true)
    }
  }

