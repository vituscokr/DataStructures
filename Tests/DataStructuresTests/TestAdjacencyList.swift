//
//  TestAdjacencyList.swift
//  TestTests
//
//  Created by vitus on 2022/05/30.
//

import XCTest
@testable import DataStructures
class TestAdjacencyList: XCTestCase {
    
    func testDescription() {
        var graph = AdjacencyList<String>()
        
        let singapore = graph.addVertex("Singapore")
        let tokyo = graph.addVertex("Tokyo")
        let hongKong = graph.addVertex("Hong kong")
        let detroit = graph.addVertex("Detroit")
        let sanFrancisco = graph.addVertex("San Francisco")
        let washingtone = graph.addVertex("Washington, D. C.")
        let austinTexas = graph.addVertex("Austin")
        let seattle = graph.addVertex("Seattle")
        
        
        for edge in [
            GraphEdge(source: singapore, destination: hongKong, weight: 300),
            GraphEdge(source: singapore, destination: tokyo, weight: 500),
            GraphEdge(source: hongKong, destination: tokyo, weight: 250),
            GraphEdge(source: tokyo, destination: detroit, weight: 450),
            GraphEdge(source: tokyo, destination: washingtone, weight: 300),
            GraphEdge(source: hongKong, destination: sanFrancisco, weight: 600),
            GraphEdge(source: detroit, destination: austinTexas, weight: 50),
            GraphEdge(source: austinTexas, destination: washingtone, weight: 292),
            GraphEdge(source: sanFrancisco, destination: washingtone, weight: 237),
            GraphEdge(source: washingtone, destination: seattle, weight: 277),
            GraphEdge(source: sanFrancisco, destination: seattle, weight: 218),
            GraphEdge(source: austinTexas, destination: sanFrancisco, weight: 297),
        ] {
            graph.add(edge) 
        }
            
            
        print(graph)
        
        XCTAssertEqual("\(graph)",
        """
0: Singapore -> Tokyo (500.0)
                Hong kong (300.0)

1: Tokyo -> Singapore (500.0)
            Hong kong (250.0)
            Detroit (450.0)
            Washington, D. C. (300.0)

2: Hong kong -> Singapore (300.0)
                Tokyo (250.0)
                San Francisco (600.0)

3: Detroit -> Tokyo (450.0)
              Austin (50.0)

4: San Francisco -> Hong kong (600.0)
                    Washington, D. C. (237.0)
                    Austin (297.0)
                    Seattle (218.0)

5: Washington, D. C. -> Tokyo (300.0)
                        San Francisco (237.0)
                        Austin (292.0)
                        Seattle (277.0)

6: Austin -> Detroit (50.0)
             San Francisco (297.0)
             Washington, D. C. (292.0)

7: Seattle -> San Francisco (218.0)
              Washington, D. C. (277.0)
"""
        
        
        )
            
            
            
            
            
            
            

    }

    
    func testPaths() {
        var graph =  AdjacencyList<String>()
        
        let a = graph.addVertex("A")
        let b = graph.addVertex("B")
        let c = graph.addVertex("C")
        let d = graph.addVertex("D")
        let e = graph.addVertex("E")
        
        
        let ab = GraphEdge(source: a, destination: b, weight: 0)
        let ac = GraphEdge(source: a, destination: c, weight: 0)
        let ad = GraphEdge(source: a, destination: d, weight: 0)
        let ae = GraphEdge(source: a, destination: e, weight: 0)
        let bc = GraphEdge(source: b, destination: c, weight: 0)
        let bd = GraphEdge(source: b, destination: d, weight: 0)
        let ce = GraphEdge(source: c, destination: e, weight: 0)
        let de = GraphEdge(source: d, destination: e, weight: 0)
        
        for edge in [ ab, ac,ad,  ae, bc, bd, ce, de] {
            graph.add(edge)
        }
        
        let cb = GraphEdge(source: c, destination: b, weight: 0)
        let db = GraphEdge(source: d, destination: b, weight: 0)
        
        
       // print(graph.getPaths(from: a, to: e))
        
        
        
        XCTAssertEqual(graph.getPaths(from: a, to : e),
                       
                       [
                        [ab, bc, ce],//
                        [ab, bd, de],//
                        [ac, cb, bd, de],//
                        [ac, ce],//
                        [ad, db, bc, ce],
                        [ad, de],//
                        [ae]//
                        ]
                       )
        
    }
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

}
