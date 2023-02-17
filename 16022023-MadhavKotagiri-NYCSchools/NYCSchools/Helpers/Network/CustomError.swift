//
//  CustomError.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Foundation

enum CustomError: Error {
case networkError, decodingError, invalidUrl, noInternet, responceError
    var localizedDescription: String {
        switch self {
        case .networkError:
          return NSLocalizedString("Something went wromg Please try again!", comment: "Error")
        case .decodingError:
            return NSLocalizedString("invalid orgument in json decoding ", comment: "Error")
        case .invalidUrl:
            return NSLocalizedString("invalid url ", comment: "Error")
        case .noInternet:
            return NSLocalizedString("No internet connection found", comment: "Error")
        case .responceError:
            return NSLocalizedString("invalid responce", comment: "Error")
        }
      }
}
