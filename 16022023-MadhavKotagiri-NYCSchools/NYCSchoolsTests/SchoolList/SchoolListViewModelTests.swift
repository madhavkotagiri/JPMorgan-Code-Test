//
//  SchoolListViewModelTests.swift
//  NYCSchoolsTests
//
//  Created by Madhav Kotagiri on 16/02/23.
//

import XCTest
@testable import NYCSchools
import Combine

final class SchoolListViewModelTests: XCTestCase {
    var apiManagerMock = APIManagerMock()
    var viewModel:SchoolListViewModel?
    var disposable = Set<AnyCancellable>()
 
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    override func setUp() {
        super.setUp()
        viewModel = SchoolListViewModel(manager: apiManagerMock)
        
        viewModel?.getSchoolList()
        
    }
    func test_getSchoolListWithData() throws {
        apiManagerMock.isError = false
        
        let schoolExpectation = expectation(description: "school")
        viewModel?.getSchoolList()
        viewModel?.$schoolList.sink(receiveValue: { res in
          
                schoolExpectation.fulfill()
            
        }).store(in: &disposable)
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNotNil(self.viewModel?.schoolList)
          
          }
    }
    func test_getSchoolListWithError() throws {
        apiManagerMock.isError = true
        viewModel?.schoolList = nil
        let schoolExpectation = expectation(description: "school")
        viewModel?.getSchoolList()
        viewModel?.$schoolList.sink(receiveValue: { res in
           
                schoolExpectation.fulfill()
            
        }).store(in: &disposable)
        
        waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(self.viewModel?.schoolList)
          }
    }

    

}
