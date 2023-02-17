//
//  APIRouter.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Foundation

enum APIRouter: String {
    case menuList
    var endPoint: String {
        switch self {
        case .menuList:
            return "s3k6-pzi2.json"
       
        }
    }
}
