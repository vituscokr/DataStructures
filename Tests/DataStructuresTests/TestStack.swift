//
//  TestStack.swift
//  
//
//  Created by vitus on 2022/06/11.
//

import XCTest
@testable import DataStructures

class TestStack: XCTestCase {
    
    var stack = Stack<Int>()
    
    override  func setUp() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
    }
    
    func testPush() {
        
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func testPop() {
        XCTAssertEqual(stack.pop(), 4)
    }
    
    func testPeek() {
        XCTAssertEqual(stack.peek(), 4)
    }
    
    func testIsEmpty() {
        //XCTAssertTrue(stack.isEmpty)
        XCTAssertFalse(stack.isEmpty)
    }
    
    func testInitWithArray() {
        let array = [1, 2, 3, 4]
        XCTAssertEqual(stack, Stack(array))
    }
    
    func testArrayLiteral() {
        let stack: Stack = ["blueberry", "plain", "potato"]
        
        XCTAssertEqual(stack, ["blueberry", "plain", "potato"])
    }
    


    func testAll() {
        
        let heros = ["배트맨", "수퍼맨", "원더우먼", "플래쉬", "아쿠아맨"]
        
        let heroStack = Stack(heros)
        
        //print(heroStack.description)
        
        let hero = heroStack.peek()
        
        XCTAssertEqual(hero, "아쿠아맨")

        var stack = Stack<Int>()
        stack.push(1)
        //print(stack.description)
        XCTAssertEqual(stack.description, "1")
        
        stack.push(2)
        //print(stack.description)
        XCTAssertEqual(stack.description, "1 2")
        
        stack.pop()
        
        XCTAssertEqual(stack.description, "1")
        
        //let peek = stack.peek()
        //print(peek)
        XCTAssertFalse(stack.isEmpty)
    }



}
