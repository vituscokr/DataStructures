//
//  TestHeap.swift
//  TestTests
//
//  Created by vitus on 2022/05/29.
//

import XCTest

class TestHeap: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]
    
    func testInsert() {
        var heap = Heap(unsortedInts, arSorted: >)
        heap.insert(5)
        
        XCTAssertEqual(Array(heap), [1,1,3,4,5,6,7,8,12])
        
    }
    
    
    func testInit() {
        let heap = Heap(unsortedInts, arSorted: <)
        XCTAssertEqual(unsortedInts.sorted(by: >), Array(heap))
    }
    
    func testPeek() {
        let heap = Heap(unsortedInts, arSorted: > )
        
        XCTAssertEqual(heap.peek() , 12)
        
    }
    
    func testRemoveRoot() {
        
        var heap = Heap(unsortedInts, arSorted: > )
        
        XCTAssertEqual(heap.removeRoot() , 12)
    }
    
    func testRemove() {
        var heap = Heap(unsortedInts, arSorted: > )
        let index = heap.getFirstIndex(of: 3)!
        XCTAssertEqual(heap.remove(at: index),  3)
        XCTAssertEqual(Array(heap), [1,1,4,6,7,8,12])
    }

    func testIsHeap() {
        let maxHeapArray = [
                5,
            4,      2,
          4,  3,   1
        ]
        
        XCTAssertTrue(maxHeapArray.isHeap(sortedBy: >))
        let minHeapArray = [
            1,
        2,      10,
      3,  3,   11,  11
        ]
        
        XCTAssertTrue(minHeapArray.isHeap(sortedBy: <))
        
        let invalidHeapArray = [
            0,
        1,      -1
        ]
        XCTAssertFalse(invalidHeapArray.isHeap(sortedBy: >))
        //private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]
    }
}
