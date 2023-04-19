//
//  TestBoardGameManager.swift
//  TestTests
//
//  Created by vitus on 2022/05/12.
//

import XCTest
@testable import DataStructures


class TestBoardGameManager: XCTestCase {

    var queueStack = QueueStack<String>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        queueStack.enqueue("수퍼맨")
        queueStack.enqueue("배트맨")
        queueStack.enqueue("플래쉬맨")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNextPlayer() {
        
        let nextPlayer = queueStack.nextPlayer()
        
        XCTAssertEqual(nextPlayer, "수퍼맨")
        
        queueStack.nextPlayer()
        queueStack.nextPlayer()
        
        XCTAssertEqual(nextPlayer, "수퍼맨")
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
