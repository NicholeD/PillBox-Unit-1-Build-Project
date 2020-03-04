//
//  PrescriptionListTableView.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit


class PrescriptionListTableViewController: UITableViewController, PrescriptionListTableViewCellDelegate {

    @IBOutlet weak var profileName: UILabel!

    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription?
    var profile: Profile?
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
      super.viewDidLoad()
      setTheme()
      updateViews()
//      tableView.reloadData()
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
    
    func updateViews() {
               guard let profile = profile else { return }
               profileName.text = profile.name
    }
    
    func toggleHasBeenTaken(for cell: PrescriptionListTableViewCell) {
//        guard let indexPath = tableView.indexPath(for: cell) else { return }
        if let prescription = prescription {
//            var takenPrescription = prescription.taken
        prescription.taken.toggle()
        tableView.reloadData()
            prescriptionController?.prescriptions.append(prescription)
    }
}
    // MARK: - Table view data source
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               guard let prescriptionController = prescriptionController else { return 0}
               return prescriptionController.prescriptions.count
       }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell", for: indexPath) as? PrescriptionListTableViewCell,
                   let prescriptionController = prescriptionController else { return UITableViewCell()}

               let prescriptionsOnList = prescriptionController.prescriptions[indexPath.row]
               cell.prescription = prescriptionsOnList
       
               return cell
           }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "AddPrescriptionSegue" {
              guard let viewPrescriptionVC = segue.destination as? AddPrescriptionViewController else { return }
             viewPrescriptionVC.prescriptionController = prescriptionController

          }
      }
  }
    
    

