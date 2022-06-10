//
//  Graph.swift
//  Test
//
//  Created by vitus on 2022/05/30.
//

import Foundation
protocol Graph {
    associatedtype Element
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    var vertices : [Vertex] {  get }
    @discardableResult mutating func addVertex(_:Element) -> Vertex
    func getEdges(from : Vertex) -> [Edge]
    
}

struct GraphVertex<Element> {
    
    let index: Int
    let element : Element
}

extension GraphVertex: Equatable where Element: Equatable { }
extension GraphVertex: Hashable where Element: Hashable { }

struct GraphEdge<Element> {
    
    typealias Vertex = GraphVertex<Element>
    
    let source : Vertex
    let destination : Vertex
    let weight : Double
}
extension GraphEdge : Hashable where Element: Hashable {}
extension GraphEdge : Equatable where Element: Equatable {}


extension Graph where Element : Hashable {
    func getPaths(from source: Vertex, to destination : Vertex) -> Set<[Edge]> {
        
        var completedPaths : Set<[Edge]> = []
        
        var activePaths = Set( getEdges(from: source).map {
            [$0]
        })
        
        while !activePaths.isEmpty {

            for path in activePaths {
                defer {
                    activePaths.remove(path)
                }
                let pathEnd = path.last!.destination
                
                if pathEnd == destination {
                    completedPaths.insert(path)
                    continue
                }
                getEdges(from: pathEnd)
                    .filter{
                        !path.map { $0.source }.contains($0.destination)
                    }
                    .forEach { activePaths.insert(path + [$0]) }
                
                
            }
        }
        return completedPaths
        
        
    }
}
