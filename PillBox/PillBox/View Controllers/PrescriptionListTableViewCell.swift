//
//  PrescriptionListTableViewCell.swift
//  PillBox
//
//  Created by Nichole Davidson on 3/3/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

protocol PrescriptionListTableViewCellDelegate {
    func toggleHasBeenTaken(for cell: PrescriptionListTableViewCell)
}

class PrescriptionListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var prescriptionNameLabel: UILabel!
    @IBOutlet weak var prescriptionTakenDate: UILabel!
    @IBOutlet weak var prescriptionTakenBox: UIButton!
    @IBAction func prescriptionTakenBoxTapped(_ sender: Any) {
        delegate?.toggleHasBeenTaken(for: self)
    }
    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription?
    var delegate: PrescriptionListTableViewCellDelegate?
    
    func viewDidLoad() {
        updateViews()
    }
    
    func prescriptionWasAdded(_ prescription: Prescription) {
        updateViews()
}
    
    func updateViews() {
        guard let prescription = prescription else { return }
        
        prescriptionNameLabel.text = prescription.name
        prescriptionTakenDate.text = "\(String(describing: DateFormatter.date(dateFormatter)))"
        
        if prescription.taken {
            prescriptionTakenBox.imageView?.image = UIImage(named: "checked")
        } else {
            prescriptionTakenBox.imageView?.image = UIImage(named: "unchecked")
        }
    }
   
       let dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEE, MMM d, yyy"
         return formatter
     }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
