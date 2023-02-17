//
//  NetworkRechabulityTests.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
@testable import NYCSchools

class NetworkRechabulityTests: XCTestCase {

    func testisNetworkAvailable(){
        let netwok = NetworkReachability()
        XCTAssertEqual(netwok.checkConnection(), true)
    }

}
