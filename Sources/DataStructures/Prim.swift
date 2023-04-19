//
//  Prim.swift
//  Test
//
//  Created by vitus on 2022/06/10.
//
// https://www.weeklyps.com/entry/프림-알고리즘-Prims-algorithm

enum Prim<Graphable: Graph> where Graphable.Element: Hashable {
    typealias Edge = Graphable.Edge
    typealias Vertex = Edge.Vertex
    typealias MinimumSpanningTree  = AdjacencyList<Graphable.Element>
    static func getMinimumSpanningTree(for graph: Graphable) ->
    (cost: Double,
     minimumSpanningTree: MinimumSpanningTree) {
        var cost = 0.0
        var minimumSpanningTree = MinimumSpanningTree(vertices: graph.vertices)
        guard let start = graph.vertices.first else {
            return (cost, minimumSpanningTree)
        }
        var visited: Set<Vertex> = []
        var priorityQueue = PriorityQueue<Edge> { $0.weight < $1.weight}
        func enqueueAvailableEdges(for vertex: Vertex) {
            for edge in graph.getEdges(from: vertex)
            where !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
        visited.insert(start)
        enqueueAvailableEdges(for: start)
        while let lightestEdge = priorityQueue.dequeue() {
            let destination = lightestEdge.destination
            guard !visited.contains(destination) else {
                continue
            }
            visited.insert(destination)
            cost += lightestEdge.weight
            minimumSpanningTree.add(lightestEdge)
            enqueueAvailableEdges(for: destination)
        }
        return (cost, minimumSpanningTree)
    }
}
