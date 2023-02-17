//
//  CustomErrorTests.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
@testable import NYCSchools
class CustomErrorTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUrlErrorDescription() throws {
        let errorMock = CustomError.invalidUrl
        XCTAssertEqual(errorMock.localizedDescription, "invalid url ")
    }
    
    func testNetworkErrorDescription() throws {
        let errorMock = CustomError.networkError
        XCTAssertEqual(errorMock.localizedDescription, "Something went wromg Please try again!")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
