//
//  PrescriptionListTableView.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit


class PrescriptionListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: PrescriptionListTableViewController!
    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription?
    
//    let themeHelper = ThemeHelper()
//
//    override func viewDidLoad() {
//      super.viewDidLoad()
//      setTheme()
//    }
//    // pass into each viewcontroller
//    func setTheme() {
//      guard let themeHelper = themeHelper.themePreference else { return }
//      if themeHelper == "Dark" {
//        view.backgroundColor = .darkGray
//      } else {
//        view.backgroundColor = .none
//      }
           
   
    
    // MARK: - Table view data source
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               guard let prescriptionController = prescriptionController else { return 0}
               return prescriptionController.prescriptions.count
       }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell", for: indexPath) as? PrescriptionListTableViewCell,
                   let prescriptionController = prescriptionController else { return UITableViewCell()}

               let prescriptionsOnList = prescriptionController.prescriptions[indexPath.row]
               cell.prescription = prescriptionsOnList
       
               return cell
           }
  

    
    
}
