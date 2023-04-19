//
//  Queue.swift
//  Test
//
//  Created by vitus on 2022/05/12.
//

import Foundation

public protocol Queue: Sequence, IteratorProtocol {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

extension Queue {
    public mutating func next() -> Element? {
        return dequeue()
    }
}

public struct QueueArray<T>: Queue {
    public typealias Element = T
    private var array: [T] = []
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    @discardableResult
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var peek: T? {
        return array.first
    }
}

struct QueueStack<T>: Queue {
    typealias Element = T
    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek: T? {
        return !dequeueStack.isEmpty ? dequeueStack.last : enqueueStack.first
    }
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
