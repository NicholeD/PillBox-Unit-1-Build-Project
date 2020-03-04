//
//  PrescriptionListTableViewCell.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class PrescriptionListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var prescriptionNameLabel: UILabel!
    @IBOutlet weak var prescriptionTakenDate: UILabel!
    
    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func prescriptionTakenBox(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
