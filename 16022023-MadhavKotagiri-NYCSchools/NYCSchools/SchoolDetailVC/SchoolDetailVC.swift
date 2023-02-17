//
//  SchoolDetailVC.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import UIKit

class SchoolDetailVC: UIViewController {
    var detailSchoolObject:SchoolListModel?
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var availableStudents: UILabel!
    
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var opertunityLlb: UILabel!
    
    @IBOutlet weak var numberLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = detailSchoolObject?.school_name ?? ""
        descLbl.text = detailSchoolObject?.overview_paragraph ?? ""
        locationLbl.text = detailSchoolObject?.location ?? ""
        opertunityLlb.text = (detailSchoolObject?.academicopportunities1 ?? "") +  (detailSchoolObject?.academicopportunities2 ?? "")
        availableStudents.text = detailSchoolObject?.total_students ?? ""
        websiteLbl.text = detailSchoolObject?.website ?? ""
        // Do any additional setup after loading the view.
        numberLbl.text = detailSchoolObject?.phone_number ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
