//
//  TestBinarySearch.swift
//  TestTests
//
//  Created by vitus on 2022/05/19.
//

import XCTest
@testable import DataStructures

class TestBinarySearch: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    func testBinarySearch() throws {
        let array = [1, 5, 18, 32, 33, 33,47, 49, 502 ]
        
        XCTAssertEqual(array.binarySearch(for: 5), 1)
        
        
    }
    
    func testFindIndex() throws {
        let array = [1,2,3,3,3,4,5,5]
        XCTAssertEqual(findIndices(of: 3, in: array), 2..<4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

