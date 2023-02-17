//
//  APIManagerMock.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
import Combine
@testable import NYCSchools

final class APIManagerMock: NetworkService {

    var isError:Bool = false
    func requestData<T:Decodable>(request:DataRequest , type:T.Type) -> Future<T?,Error> {
        print("--Error key:\(isError)")
        return Future<T?,Error> { promice in
        
            if self.isError   {
                return promice(.failure(CustomError.invalidUrl))
            }else{
                let school = SchoolListModel(school_name: "test1")
                let school1 = SchoolListModel(school_name: "test2")
                return promice(.success([school,school1] as? T))
                
            }
           
        }
    }

}
