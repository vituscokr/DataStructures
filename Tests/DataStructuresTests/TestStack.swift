//
//  TestStack.swift
//  
//
//  Created by vitus on 2022/06/11.
//

import XCTest
import DataStructures

class TestStack: XCTestCase {


    func testPush() {
        
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
