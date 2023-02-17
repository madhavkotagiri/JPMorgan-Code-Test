//
//  SchoolListModel.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Foundation

struct SchoolListModel : Codable {
     var dbn : String? = ""
     var school_name : String? = ""
     var boro : String? = ""
     var overview_paragraph : String? = ""
     var school_10th_seats : String? = ""
     var academicopportunities1 : String? = ""
     var academicopportunities2 : String? = ""
     var ell_programs : String? = ""
     var neighborhood : String? = ""
     var building_code : String? = ""
     var location : String? = ""
     var phone_number : String? = ""
     var fax_number : String? = ""
     var school_email : String? = ""
     var website : String? = ""
     var subway : String? = ""
     var bus : String? = ""
     var grades2018 : String? = ""
     var finalgrades : String? = ""
     var total_students : String? = ""
     var extracurricular_activities : String? = ""
     var school_sports : String? = ""
     var attendance_rate : String? = ""
     var pct_stu_enough_variety : String? = ""
     var pct_stu_safe : String? = ""
     var school_accessibility_description : String? = ""
     var directions1 : String? = ""
     var requirement1_1 : String? = ""
     var requirement2_1 : String? = ""
     var requirement3_1 : String? = ""
     var requirement4_1 : String? = ""
     var requirement5_1 : String? = ""
     var offer_rate1 : String? = ""
     var program1 : String? = ""
     var code1 : String? = ""
     var interest1 : String? = ""
     var method1 : String? = ""
     var seats9ge1 : String? = ""
     var grade9gefilledflag1 : String? = ""
     var grade9geapplicants1 : String? = ""
     var seats9swd1 : String? = ""
     var grade9swdfilledflag1 : String? = ""
     var grade9swdapplicants1 : String? = ""
     var seats101 : String? = ""
     var admissionspriority11 : String? = ""
     var admissionspriority21 : String? = ""
     var admissionspriority31 : String? = ""
     var grade9geapplicantsperseat1 : String? = ""
     var grade9swdapplicantsperseat1 : String? = ""
     var primary_address_line_1 : String? = ""
     var city : String? = ""
     var zip : String? = ""
     var state_code : String? = ""
     var latitude : String? = ""
     var longitude : String? = ""
     var community_board : String? = ""
     var council_district : String? = ""
     var census_tract : String? = ""
     var bin : String? = ""
     var bbl : String? = ""
     var nta : String? = ""
     var borough : String? = ""

    enum CodingKeys: String, CodingKey {

        case dbn = "dbn"
        case school_name = "school_name"
        case boro = "boro"
        case overview_paragraph = "overview_paragraph"
        case school_10th_seats = "school_10th_seats"
        case academicopportunities1 = "academicopportunities1"
        case academicopportunities2 = "academicopportunities2"
        case ell_programs = "ell_programs"
        case neighborhood = "neighborhood"
        case building_code = "building_code"
        case location = "location"
        case phone_number = "phone_number"
        case fax_number = "fax_number"
        case school_email = "school_email"
        case website = "website"
        case subway = "subway"
        case bus = "bus"
        case grades2018 = "grades2018"
        case finalgrades = "finalgrades"
        case total_students = "total_students"
        case extracurricular_activities = "extracurricular_activities"
        case school_sports = "school_sports"
        case attendance_rate = "attendance_rate"
        case pct_stu_enough_variety = "pct_stu_enough_variety"
        case pct_stu_safe = "pct_stu_safe"
        case school_accessibility_description = "school_accessibility_description"
        case directions1 = "directions1"
        case requirement1_1 = "requirement1_1"
        case requirement2_1 = "requirement2_1"
        case requirement3_1 = "requirement3_1"
        case requirement4_1 = "requirement4_1"
        case requirement5_1 = "requirement5_1"
        case offer_rate1 = "offer_rate1"
        case program1 = "program1"
        case code1 = "code1"
        case interest1 = "interest1"
        case method1 = "method1"
        case seats9ge1 = "seats9ge1"
        case grade9gefilledflag1 = "grade9gefilledflag1"
        case grade9geapplicants1 = "grade9geapplicants1"
        case seats9swd1 = "seats9swd1"
        case grade9swdfilledflag1 = "grade9swdfilledflag1"
        case grade9swdapplicants1 = "grade9swdapplicants1"
        case seats101 = "seats101"
        case admissionspriority11 = "admissionspriority11"
        case admissionspriority21 = "admissionspriority21"
        case admissionspriority31 = "admissionspriority31"
        case grade9geapplicantsperseat1 = "grade9geapplicantsperseat1"
        case grade9swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
        case primary_address_line_1 = "primary_address_line_1"
        case city = "city"
        case zip = "zip"
        case state_code = "state_code"
        case latitude = "latitude"
        case longitude = "longitude"
        case community_board = "community_board"
        case council_district = "council_district"
        case census_tract = "census_tract"
        case bin = "bin"
        case bbl = "bbl"
        case nta = "nta"
        case borough = "borough"
    }

    init(from decoder: Decoder) throws {
         var values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        school_name = try values.decodeIfPresent(String.self, forKey: .school_name)
        boro = try values.decodeIfPresent(String.self, forKey: .boro)
        overview_paragraph = try values.decodeIfPresent(String.self, forKey: .overview_paragraph)
        school_10th_seats = try values.decodeIfPresent(String.self, forKey: .school_10th_seats)
        academicopportunities1 = try values.decodeIfPresent(String.self, forKey: .academicopportunities1)
        academicopportunities2 = try values.decodeIfPresent(String.self, forKey: .academicopportunities2)
        ell_programs = try values.decodeIfPresent(String.self, forKey: .ell_programs)
        neighborhood = try values.decodeIfPresent(String.self, forKey: .neighborhood)
        building_code = try values.decodeIfPresent(String.self, forKey: .building_code)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        phone_number = try values.decodeIfPresent(String.self, forKey: .phone_number)
        fax_number = try values.decodeIfPresent(String.self, forKey: .fax_number)
        school_email = try values.decodeIfPresent(String.self, forKey: .school_email)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        subway = try values.decodeIfPresent(String.self, forKey: .subway)
        bus = try values.decodeIfPresent(String.self, forKey: .bus)
        grades2018 = try values.decodeIfPresent(String.self, forKey: .grades2018)
        finalgrades = try values.decodeIfPresent(String.self, forKey: .finalgrades)
        total_students = try values.decodeIfPresent(String.self, forKey: .total_students)
        extracurricular_activities = try values.decodeIfPresent(String.self, forKey: .extracurricular_activities)
        school_sports = try values.decodeIfPresent(String.self, forKey: .school_sports)
        attendance_rate = try values.decodeIfPresent(String.self, forKey: .attendance_rate)
        pct_stu_enough_variety = try values.decodeIfPresent(String.self, forKey: .pct_stu_enough_variety)
        pct_stu_safe = try values.decodeIfPresent(String.self, forKey: .pct_stu_safe)
        school_accessibility_description = try values.decodeIfPresent(String.self, forKey: .school_accessibility_description)
        directions1 = try values.decodeIfPresent(String.self, forKey: .directions1)
        requirement1_1 = try values.decodeIfPresent(String.self, forKey: .requirement1_1)
        requirement2_1 = try values.decodeIfPresent(String.self, forKey: .requirement2_1)
        requirement3_1 = try values.decodeIfPresent(String.self, forKey: .requirement3_1)
        requirement4_1 = try values.decodeIfPresent(String.self, forKey: .requirement4_1)
        requirement5_1 = try values.decodeIfPresent(String.self, forKey: .requirement5_1)
        offer_rate1 = try values.decodeIfPresent(String.self, forKey: .offer_rate1)
        program1 = try values.decodeIfPresent(String.self, forKey: .program1)
        code1 = try values.decodeIfPresent(String.self, forKey: .code1)
        interest1 = try values.decodeIfPresent(String.self, forKey: .interest1)
        method1 = try values.decodeIfPresent(String.self, forKey: .method1)
        seats9ge1 = try values.decodeIfPresent(String.self, forKey: .seats9ge1)
        grade9gefilledflag1 = try values.decodeIfPresent(String.self, forKey: .grade9gefilledflag1)
        grade9geapplicants1 = try values.decodeIfPresent(String.self, forKey: .grade9geapplicants1)
        seats9swd1 = try values.decodeIfPresent(String.self, forKey: .seats9swd1)
        grade9swdfilledflag1 = try values.decodeIfPresent(String.self, forKey: .grade9swdfilledflag1)
        grade9swdapplicants1 = try values.decodeIfPresent(String.self, forKey: .grade9swdapplicants1)
        seats101 = try values.decodeIfPresent(String.self, forKey: .seats101)
        admissionspriority11 = try values.decodeIfPresent(String.self, forKey: .admissionspriority11)
        admissionspriority21 = try values.decodeIfPresent(String.self, forKey: .admissionspriority21)
        admissionspriority31 = try values.decodeIfPresent(String.self, forKey: .admissionspriority31)
        grade9geapplicantsperseat1 = try values.decodeIfPresent(String.self, forKey: .grade9geapplicantsperseat1)
        grade9swdapplicantsperseat1 = try values.decodeIfPresent(String.self, forKey: .grade9swdapplicantsperseat1)
        primary_address_line_1 = try values.decodeIfPresent(String.self, forKey: .primary_address_line_1)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
        state_code = try values.decodeIfPresent(String.self, forKey: .state_code)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        community_board = try values.decodeIfPresent(String.self, forKey: .community_board)
        council_district = try values.decodeIfPresent(String.self, forKey: .council_district)
        census_tract = try values.decodeIfPresent(String.self, forKey: .census_tract)
        bin = try values.decodeIfPresent(String.self, forKey: .bin)
        bbl = try values.decodeIfPresent(String.self, forKey: .bbl)
        nta = try values.decodeIfPresent(String.self, forKey: .nta)
        borough = try values.decodeIfPresent(String.self, forKey: .borough)
    }
    
    init(school_name:String? = ""){
        self.school_name = school_name
    }

}
