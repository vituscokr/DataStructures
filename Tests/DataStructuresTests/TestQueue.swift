//
//  TestQueue.swift
//  TestTests
//
//  Created by vitus on 2022/05/12.
//

import XCTest
@testable import DataStructures

class TestQueue: XCTestCase {
    
    var queueArray = QueueArray<String>()
    var queueStack = QueueStack<String>() 
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        queueArray.enqueue("아이언맨")
        queueArray.enqueue("스파이더맨")
        queueArray.enqueue("닥터 스트렌인저")
        
        queueStack.enqueue("배트맨")
        queueStack.enqueue("수퍼맨")
        queueStack.enqueue("플래쉬맨")
    }
    
    func testEnqueueArray() {
        XCTAssertEqual(queueArray.peek, "아이언맨")
    }
    
    func testDequeueArray( ) {
        queueArray.dequeue()
        queueArray.dequeue()
        
        XCTAssertEqual(queueArray.peek, "닥터 스트렌인저")
        queueArray.dequeue()
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func testIsEmpty() {
        XCTAssertFalse(queueArray.isEmpty)
        
    }
    
    func testDequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        XCTAssertEqual(queueStack.peek, "플래쉬맨")
        queueStack.dequeue()
        XCTAssertTrue(queueStack.isEmpty)
    }
    
    func testEnqueueStack() {
        XCTAssertEqual(queueStack.peek, "배트맨")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

