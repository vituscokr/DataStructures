//
//  Queue.swift
//  Test
//
//  Created by vitus on 2022/05/12.
//

import Foundation


protocol Queue :Sequence, IteratorProtocol{
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue()->Element?
    var isEmpty : Bool { get }
    var peek : Element? { get }
}

extension Queue {
    mutating func next() -> Element? {
        return dequeue()
    }
}

struct QueueArray<T>: Queue {
    typealias Element = T
    private var array :[T] = []
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
}

struct QueueStack<T>: Queue {
    typealias Element = T

    
    private var dequeueStack : [T] = []
    private var enqueueStack : [T] = []
    
    var isEmpty: Bool {
        return dequeueStack.isEmpty && enqueueStack.isEmpty
    }
    var peek : T? {
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
