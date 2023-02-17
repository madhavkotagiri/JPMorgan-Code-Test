//
//  APIManager.swift
//  NYCSchools
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import Combine
import Foundation

protocol NetworkService {
    func requestData<T: Decodable>(request: DataRequest, type: T.Type) -> Future<T?, Error>
}

class APIManager: NetworkService {
    var cancelable = Set<AnyCancellable>()
    func requestData<T: Decodable>(request: DataRequest, type: T.Type) -> Future<T?, Error> {
        return Future<T?, Error> { promice in
            if NetworkReachability().checkConnection() == false {
                return promice(.failure(CustomError.noInternet))
            }
            guard var urlComponent = URLComponents(string: request.getUrl() ?? "") else {
                return promice(.failure(CustomError.invalidUrl))
            }
            if request.method == .get {
                var queryItems: [URLQueryItem] = []
                request.queryItems.forEach {
                    let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
                    urlComponent.queryItems?.append(urlQueryItem)
                    queryItems.append(urlQueryItem)
                }
                urlComponent.queryItems = queryItems
            }
            guard let url = urlComponent.url else {
                return promice(.failure(CustomError.invalidUrl))
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.allHTTPHeaderFields = request.headers
            if request.isJsonDataType {
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            } else {
                urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            }
            if request.postParameters != nil {
               urlRequest.httpBody = request.getBody()
            }
            URLSession.shared.dataTaskPublisher(for: urlRequest )
                .tryMap { data, response -> Data in
                    guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                        throw CustomError.responceError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
               if case let .failure(error) = completion {
                   switch error {
                   case let decodeErr as DecodingError:
                       promice(.failure(decodeErr))
                   default:
                       promice(.failure(error))
                   }
                }
                }, receiveValue: {
                    promice(.success($0))
                }) .store(in: &self.cancelable)
        }
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
