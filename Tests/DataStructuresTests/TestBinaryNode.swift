//
//  TestBinaryNode.swift
//  TestTests
//
//  Created by vitus on 2022/05/12.
//


import XCTest
@testable import DataStructures




class TestBinaryNode: XCTestCase {
    
    var tree : BinaryNode<Int> = {
        let zero = BinaryNode(value: 0) //
        let one = BinaryNode(value: 1) //
        let two = BinaryNode(value : 2)
        let five = BinaryNode(value : 5) //
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8) //
        let nine = BinaryNode(value: 9) //
        
        seven.leftChild = one
        one.leftChild =  zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        //seven
        //one           nine
        //zero, five    eight
        return seven 
    } ()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testVisualizeBinaryNode() throws {
        print(tree.description)
       //  ┌──nil
       // ┌──9
       // │ └──8
       // 7
       // │ ┌──5
       // └──1
       //  └──0
    }
    
    func testTraverseInOrder() throws {
        
        var testArray : [Int] = []
        tree.traverseInOrder { testArray.append($0)}
        
        XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
    }

    func testTraversePreOrder() throws {
        
        var testArray : [Int?] = []
        tree.traversePreOrder { testArray.append($0)}
        
        XCTAssertEqual(testArray, [7,1,0,5,9,8])
    }
    
    func testTraversePostOrder() throws {
        
        var testArray : [Int] = []
        tree.traversePostOrder { testArray.append($0)}
        
        XCTAssertEqual(testArray, [0,5,1,8,9,7])
    }
    
    func testSerialize() throws {
        let expectedArray = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil,nil ,nil]
        
        let serializedTree = serialize(tree)
        
        XCTAssertEqual(serializedTree, expectedArray)
        
        let deserializeArray = deserialize(serializedTree)
        XCTAssertEqual(deserializeArray?.description, tree.description)
        
        
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
