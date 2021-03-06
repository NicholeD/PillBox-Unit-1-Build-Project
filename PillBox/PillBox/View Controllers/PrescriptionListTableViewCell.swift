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
        prescription.taken.toggle()
        updateViews()
        prescriptionController?.saveToPersistentStore()
    }
    
    var prescriptionController: PrescriptionController?
    var prescription: Prescription! {
        didSet {
            prescriptionWasAdded(prescription)
            updateViews()
        }
    }
    var delegate: PrescriptionListTableViewCellDelegate?
    
    func prescriptionWasAdded(_ prescription: Prescription?) {
        updateViews()
}
    
    func updateViews() {
        guard let prescription = prescription else { return }
        
        prescriptionNameLabel.text = prescription.name
        prescriptionTakenDate.text = "\(dateFormatter.string(from: date))"
        
        let image = prescription.taken ? UIImage(named: "checked") : UIImage(named: "unchecked")
        
        prescriptionTakenBox.setImage(image, for: .normal)
    
    }
    
    let date = Date()
       let dateFormatter: DateFormatter = {
        let date = Date()
         let formatter = DateFormatter()
        formatter.dateStyle = .full
        let formattedDate = formatter.string(from: date)
         return formatter
     }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
