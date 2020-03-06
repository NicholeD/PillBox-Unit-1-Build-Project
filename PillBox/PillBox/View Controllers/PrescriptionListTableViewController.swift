//
//  PrescriptionListTableView.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit


class PrescriptionListTableViewController: UITableViewController, PrescriptionListTableViewCellDelegate, PrescriptionAddedDelegate {
    
    @IBOutlet var prescriptionTableView: UITableView!
    
    var prescriptionController: PrescriptionController = PrescriptionController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func prescriptionWasAdded() {
        tableView.reloadData()
    }
    
    func toggleHasBeenTaken(for cell: PrescriptionListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let takenPrescription = prescriptionController.prescriptions[indexPath.row]
        takenPrescription.taken.toggle()
        prescriptionController.updateHasBeenTaken()
        tableView.reloadData()
    }
    
    // MARK: - TableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prescriptionController.prescriptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell", for: indexPath) as? PrescriptionListTableViewCell else { fatalError("The cell's identifier is wrong or could not be cast correctly")}
        
        let prescriptionsOnList = prescriptionController.prescriptions[indexPath.row]
        cell.prescription = prescriptionsOnList
        cell.delegate? = self
        cell.prescriptionController = prescriptionController
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPrescriptionSegue" {
            guard let viewPrescriptionVC = segue.destination as? AddPrescriptionViewController else { return }
            viewPrescriptionVC.prescriptionController = prescriptionController
            viewPrescriptionVC.delegate = self
        } else {
            if segue.identifier == "PrescriptionDetailSegue" {
                guard let viewPrescriptionDetailVC = segue.destination as? AddPrescriptionViewController else { return }
                if let indexPath = tableView.indexPathForSelectedRow {
                    let prescription = prescriptionController.prescriptions[indexPath.row]
                    viewPrescriptionDetailVC.prescription = prescription
                    viewPrescriptionDetailVC.prescriptionController = prescriptionController
                    viewPrescriptionDetailVC.delegate = self
                }
            } 
        }
    }
}


