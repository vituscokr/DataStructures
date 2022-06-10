//
//  AdjacencyList.swift
//  Test
//
//  Created by vitus on 2022/05/30.
//

import Foundation

struct AdjacencyList<Element :Hashable> :Graph  {

    
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    private var adjacencies : [ Vertex: [Edge]] = [:]
    
    init() {
        
    }
    
    init(vertices : [Vertex] ) {
        for vertex in vertices {
            adjacencies[vertex]  = []
        }
    }
    var vertices: [Vertex] {
        return Array(adjacencies.keys)
    }
    
   @discardableResult mutating func addVertex(_ element: Element) -> Vertex {
        let vertex = Vertex(index: adjacencies.count, element: element)
        adjacencies[vertex] = []
        return vertex
    }
    mutating func add(_ edge : Edge ) {
        adjacencies[edge.source]?.append(edge)
        let reservedEdge = Edge(source: edge.destination, destination: edge.source, weight: edge.weight)
        adjacencies[edge.destination]?.append(reservedEdge)
    }
    
    func getEdges(from source : Vertex) -> [Edge] {
        return adjacencies[source] ?? []
    }
}

extension AdjacencyList : CustomStringConvertible {
    var description: String {
        return
        adjacencies.mapValues { edges in
            edges
                .sorted { $0.destination.index < $1.destination.index}
                .map {"\($0.destination.element) (\($0.weight))"}
            
        }
        .sorted { $0.key.index < $1.key.index }
        .map {
            let source = "\($0.key.index): \($0.key.element)"
            
            guard !$0.value.isEmpty else {
                return source
            }
            let sourceWithArrow = "\(source) -> "
            return """
\(sourceWithArrow)\($0.value.joined(separator: "\n" + String(repeating: " " , count: sourceWithArrow.count)
))
"""
        }
        .joined(separator: "\n\n")
    }
}
