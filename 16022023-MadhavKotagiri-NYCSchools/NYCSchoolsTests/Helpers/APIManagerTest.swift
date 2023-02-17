//
//  APIManagerTest.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
@testable import NYCSchools
import Combine
class APIManagerTest: XCTestCase {

    var apiManager:NetworkService?
    var disposable = Set<AnyCancellable>()
    override  func setUp() {
        apiManager = APIManager()
    }
    
    func testIsBadRequest(){
        var request = DataRequest(baseUrl:"", route: .menuList)
        request.queryItems = ["api_key":Constants.baseurl,
                              "language":"en-US"
        ]
        let moviesExpectation = expectation(description: "schools")
        var isErrror = false
        apiManager?.requestData(request: request, type: SchoolListModel.self).sink { completion in
            
            switch completion {
            case .failure:
                isErrror = true
                moviesExpectation.fulfill()
                break
            case .finished:
                moviesExpectation.fulfill()
                break
                
            }
           
         } receiveValue: { result in
             isErrror = false
         }.store(in: &self.disposable)
        
        waitForExpectations(timeout: 3) { (error) in
           XCTAssertTrue(isErrror)
          }
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
