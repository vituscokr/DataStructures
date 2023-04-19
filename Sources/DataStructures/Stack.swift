//
//  Stack.swift
//  
//
//  Created by vitus on 2022/06/11.
//

import Foundation

public struct Stack<Element: Equatable>: Equatable {
    // Storage
    private var storage: [Element] = []
    public init() {
    }
    public init(_ elements: [Element]) {
        storage = elements
    }
    public var isEmpty: Bool {
        return peek() == nil
    }
    public func peek() -> Element? {
        return storage.last
    }
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    @discardableResult
    public mutating func pop () -> Element? {
        return  storage.popLast()
    }
}
// debug
extension Stack: CustomStringConvertible {
    public var description: String {
        return storage.map {
            "\($0)"
        }.joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
