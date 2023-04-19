//
//  StackChallengeTestCase.swift
//  DataStructuresTests
//
//  Created by vitus on 2022/04/01.
//

import XCTest
@testable import DataStructures

func checkParentheses(_ string: String) -> Bool {
    
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        }else if character == ")" {
            if stack.isEmpty {
                return false
            }else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}


class StackChallengeTestCase: XCTestCase {

    func testChackParens() {
        XCTAssertTrue( checkParentheses("()"))
    }
    
    func testChackParens1() {
        XCTAssertTrue( checkParentheses("hello(world)()"))
    }
    
    func testChackParens2() {
        XCTAssertFalse( checkParentheses("(hello world"))
    }
    
    func testChackParens3() {
        XCTAssertFalse( checkParentheses("((())(meow)))()))"))
    }
    
}
