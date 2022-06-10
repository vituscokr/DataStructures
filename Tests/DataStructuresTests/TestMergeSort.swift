//
//  TestMergeSort.swift
//  TestTests
//
//  Created by vitus on 2022/05/12.
//

import XCTest

class TestMergeSort: XCTestCase {

    var testArray = [7,2,6,3,3, 9, 15, 4, 11]
    var sortedArray = [2,3,3,4,6,7,9,11,15]
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

      XCTAssertEqual(mergeSort(testArray), sortedArray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
