//
//  SchoolListCell.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import UIKit

class SchoolListCell: UITableViewCell {

    @IBOutlet weak var schoolNameLbl: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    static func nib() -> UINib {
        return UINib(nibName: "SchoolListCell", bundle: nil)
    }
    
    func configCell(model:SchoolListModel?){
        self.schoolNameLbl.text = model?.school_name ?? ""
        self.phoneNumber.text = model?.phone_number ?? ""
        self.emailLbl.text = model?.school_email ?? ""
        self.locationLbl.text = model?.location ?? ""
    }
}
