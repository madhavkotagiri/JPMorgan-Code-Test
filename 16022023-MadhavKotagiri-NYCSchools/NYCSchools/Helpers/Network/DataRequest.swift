//
//  DataRequest.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Foundation

struct DataRequest {
    var baseUrl: String = Constants.baseurl
    var route: APIRouter
    var method: HTTPMethod = .get
    var headers: [String: String]? = [:]
    var queryItems: [String: String] = [:]
    var postParameters: [String: Any]?
    var isJsonDataType = false
    func getBody() -> Data? {
        if isJsonDataType {
            do {
                return try JSONSerialization.data(withJSONObject: postParameters ?? [:], options: JSONSerialization.WritingOptions())
            } catch {
                return nil
            }
        } else {
            return postParameters?.percentEncoded()
        }
    }
    func getUrl() -> String? {
        return baseUrl + route.endPoint
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
    func printValues() -> String? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}
