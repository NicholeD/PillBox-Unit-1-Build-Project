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
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
      super.viewDidLoad()
      setTheme()

    }
    // pass into each viewcontroller
    func setTheme() {
      guard let themeHelper = themeHelper.themePreference else { return }
      if themeHelper == "Dark" {
        view.backgroundColor = .darkGray
      } else {
        view.backgroundColor = .none
      }
  }
    func prescriptionWasAdded() {
        tableView.reloadData()
    }
    
    func toggleHasBeenTaken(for cell: PrescriptionListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }

        let takenPrescription = prescriptionController.prescriptions[indexPath.row]
        takenPrescription.taken.toggle()
        tableView.reloadData()
        prescriptionController.prescriptions.append(takenPrescription)
}
  
    
    // MARK: - Table view data source
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return prescriptionController.prescriptions.count
       }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell", for: indexPath) as? PrescriptionListTableViewCell else { fatalError("The cell's identifier is wrong or could not be cast correctly")}

               let prescriptionsOnList = prescriptionController.prescriptions[indexPath.row]
               cell.prescription = prescriptionsOnList
       
               return cell
           }
    
    // MARK: - Navigation
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "AddPrescriptionSegue" {
              guard let viewPrescriptionVC = segue.destination as? AddPrescriptionViewController else { return }
             viewPrescriptionVC.prescriptionController = prescriptionController
             viewPrescriptionVC.delegate = self
          } else {
            switch segue.identifier {
                   case "SelectTheme":
                       guard let destinationVC = segue.destination as? SettingsViewController else { return }
                       destinationVC.themeHelper = themeHelper
            default:
                return
                }
        }
      }
  }
    
    

