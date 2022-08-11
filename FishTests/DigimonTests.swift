//
//  DigimonTests.swift
//  FishTests
//
//  Created by Arnold Sylvestre on 8/10/22.
//

import XCTest
@testable import Fish


class DigimonTests: XCTestCase {

    var viewModel: FishViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = FishViewModel(networkManager: NetworkManager())
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        try super.tearDownWithError()
    }
    func testRequestModelDataSuccess() {
        // Arrange
        let expectation = XCTestExpectation(description: "Successfully retrieving Models")
        
        // Act
        self.viewModel?.bind {
            expectation.fulfill()
        }
        self.viewModel?.fetchDigimon()
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(self.viewModel?.count, 209)
        XCTAssertEqual(self.viewModel?.title(for: 0), "Koromon")
        XCTAssertEqual(self.viewModel?.Level(for: 1), "In Training")
        //XCTAssertEqual(self.viewModel?.image(for: 0, completion: <#T##(UIImage?) -> Void#>)
        //let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
