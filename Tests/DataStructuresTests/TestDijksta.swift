//
//  TestDijksta.swift
//  TestTests
//
//  Created by vitus on 2022/06/01.
//

import XCTest
@testable import Test
private typealias Graph = AdjacencyList<String>
private typealias Vertex = Graph.Vertex

private extension String {
    init?(shortestPath: [Graph.Edge]) {
        guard  !shortestPath.isEmpty else {
            return nil
        }
        self = shortestPath.reduce(into: shortestPath[0].source.element) { string, edge in
            string += edge.destination.element
            
            
        }
    }
}


class TestDijksta: XCTestCase {

    
    private let (graph , a,b,c,d,e,f, g,h ) : (Graph, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex) = {
        var graph = AdjacencyList<String>()
        let a = graph.addVertex("A")
        let b = graph.addVertex("B")
        let c = graph.addVertex("C")
        let d = graph.addVertex("D")
        let e = graph.addVertex("E")
        let f = graph.addVertex("F")
        let g = graph.addVertex("G")
        let h = graph.addVertex("H")
        
        for edge in [
        GraphEdge(source: a, destination: b, weight: 8),
        GraphEdge(source: a, destination: f, weight: 9),
        GraphEdge(source: a, destination: g, weight: 1),
        
        GraphEdge(source: b, destination: f, weight: 3),
        GraphEdge(source: b, destination: e, weight: 1),
        
        GraphEdge(source: c, destination: b, weight: 3),
        GraphEdge(source: c, destination: e, weight: 1),
        GraphEdge(source: c, destination: g, weight: 3),
        
        GraphEdge(source: d, destination: e, weight: 2),
        GraphEdge(source: f, destination: h, weight: 2),
        GraphEdge(source: g, destination: h, weight: 5)
        
        
        
        ] {
            graph.add(edge)
        }
        return (graph , a,b,c,d,e,f, g,h )
    }
    
    func testShortestPath() {
        let shortestPath = Dijkstra.getShortestPath(from: a, to: d, graph: graph)
        
        XCTAssertEqual(String(shortestPath: shortestPath), "AGCED")
        
    }
    
    func testPrim() {
        let (cost, minmumSpanningTree) = Prim.getMinimumSpanningTree(for: graph)
        XCTAssertEqual(cost, 15)
        XCTAssertEqual(minmumSpanningTree,
        
        )
    }
    func testShortestPaths() {
        let shortestPaths = [
            a: nil,
            b: "AGCEB",
            c : "AGC",
            d : "AGCED",
            e: "AGCE",
            f : "AGHF",
            g: "AG",
            h: "AGH"
            
        ]
        XCTAssertEqual(shortestPaths,
                       Dijkstra.getShortestPaths(from: a, graph: graph ).mapValues( String.init(shortestPath: ))
                       )
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    

}


