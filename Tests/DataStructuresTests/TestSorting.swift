//
//  TestSorting.swift
//  TestTests
//
//  Created by vitus on 2022/05/12.
//

import XCTest
@testable import DataStructures

class TestSorting: XCTestCase {

    var testArray : [Int] = []
    let sortedArray = [3, 4, 9, 10]
    
    override func setUp() {
     
        testArray = [9 ,4, 10, 3]
    }

    func testBubbleSort() throws {
        bubbleSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func testSelectionSort() throws {
        selectionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }
    
    func testInsertionSort() throws {
        insertsionSort(&testArray)
        XCTAssertEqual(testArray, sortedArray)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
