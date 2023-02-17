//
//  DataRequestsTests.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
@testable import NYCSchools

class DataRequestsTests: XCTestCase {

    override func setUp()  {
     
    }
    
    func testInvaliedUrl(){
        let req =  DataRequest(route: .menuList)
        
        XCTAssertNotNil(req.getUrl())
        XCTAssertEqual(req.route.endPoint, "s3k6-pzi2.json")
    
    }
    
    func testBodyCreation(){
        let req =  DataRequest(route: .menuList)
        XCTAssertNil(req.getBody())
    }
    func testjsonBodyCreation(){
        var req =  DataRequest(route: .menuList)
        req.postParameters = ["id":2]
        req.isJsonDataType = true
        XCTAssertNotNil(req.getBody())
    }
    
    func testgetUrl(){
        let req =  DataRequest(route: .menuList)
       
        XCTAssertNotNil(req.getUrl())
    }
    
    func testDictionaryWithQuerryItems(){
        
        let queeryItemsMock = ["item":"test"]
        let data = queeryItemsMock.printValues()
        XCTAssertNotNil(data)
    }
    func testDictionaryWithpercentEncoding(){
        
        let queeryItemsMock = ["item":"test"]
        let data = queeryItemsMock.percentEncoded()
        XCTAssertNotNil(data)
    }
    func testBodywithParams(){
        let req =  DataRequest(route: .menuList,postParameters:["id":"test"] )
        XCTAssertNotNil(req.getBody())
    }
    

}
