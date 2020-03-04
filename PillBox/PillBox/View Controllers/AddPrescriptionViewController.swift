//
//  AddPrescriptionViewController.swift
//  PillBox
//
//  Created by Harmony Radley on 3/2/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit
protocol PrescriptionAddedDelegate {
    func prescriptionWasAdded(_ prescription: Prescription)
}

class AddPrescriptionViewController: UIViewController {

    @IBOutlet weak var prescriptionNameTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var frequencyTextField: UITextField!
    @IBOutlet weak var toggleAmSwitch: UISwitch!
    @IBOutlet weak var togglePmSwitch: UISwitch!
    @IBOutlet weak var notesTextView: UITextView!
    
    var prescriptionController: PrescriptionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
      // Toggle action will show in the alert or in the prescription detail view... not sure yet
    
    @IBAction func toggleAm(_ sender: UISwitch) {
    }
    
    @IBAction func togglePm(_ sender: UISwitch) {
    }
    

    @IBAction func addPrescriptionTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

    // MARK: - Navigation

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPrescriptionSegue" {
            guard let viewPrescriptionVC = segue.destination as? PrescriptionListViewController else { return }
               viewPrescriptionVC.prescriptionController = prescriptionController
        }
       
    }


}
