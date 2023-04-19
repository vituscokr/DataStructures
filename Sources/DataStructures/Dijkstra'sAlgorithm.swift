//
//  Dijkstra'sAlgorithm.swift
//  Test
//
//  Created by vitus on 2022/06/01.
//

import Foundation
/// https://www.kodeco.com/773-swift-algorithm-club-graphs-with-adjacency-list
/// Using Adjacency List & Min-Priority Queue
/// logarithmic Time 0(log V)
///     Removing Root
/// Inserting an Element
/// Linear Time 0(e)
///     Getting dequeued Edge
///         Traversing to Start
///  Overrall Performance O(E log V)
///
//DataStructures.
enum Dijkstra<Graphable: Graph>  where Graphable.Element : Hashable {
    typealias Edge = Graphable.Edge
    typealias Vertex = Edge.Vertex
    
    
    static func getEdges(alongPathsFrom source : Vertex, graph: Graphable )-> [Vertex: Edge] {
        var edges:[Vertex: Edge] = [:]
        func getWeight(to destination :Vertex) -> Double {
            return getShortestPath(to: destination, edgesAlongPath: edges)
                .map { $0.weight }
                .reduce(0, +)
        }
        
        
        var priorityQueue = PriorityQueue { getWeight(to: $0) < getWeight(to: $1) }
        priorityQueue.enqueue(source)
        while let vertex = priorityQueue.dequeue() {
            graph.getEdges(from: vertex)
                .filter {
                    $0.destination == source
                    ? false
                    :  edges[$0.destination] == nil
                    || getWeight(to: vertex) + $0.weight < getWeight(to: $0.destination)
                }
                .forEach {newEdgeFromVertex in
                    edges[newEdgeFromVertex.destination] = newEdgeFromVertex
                    priorityQueue.enqueue(newEdgeFromVertex.destination)
                }
        }
        return edges
    }
    
    static func getShortestPath(to destination : Vertex , edgesAlongPath: [Vertex : Edge]) ->[Edge] {
        var shortestPath : [Edge] = []
        var destination = destination
        while let edge = edgesAlongPath[destination] {
            shortestPath = [edge] + shortestPath
            destination = edge.source
        }
        return shortestPath
    }
    
    static func getShortestPath(from source : Vertex, to destination : Vertex , graph: Graphable) -> [Edge] {
        return getShortestPath(to: destination, edgesAlongPath: getEdges(alongPathsFrom: source, graph: graph))
    }
    
    static func getShortestPaths(from source: Vertex , graph: Graphable) -> [Vertex : [Edge]] {
        let edges = getEdges(alongPathsFrom: source , graph: graph )
        let paths = graph.vertices.map {
            getShortestPath(to: $0, edgesAlongPath: edges)
        }
        return Dictionary(uniqueKeysWithValues: zip(graph.vertices, paths))
    }
}

