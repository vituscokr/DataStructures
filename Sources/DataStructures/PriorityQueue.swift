//
//  PriorityQueue.swift
//  Test
//
//  Created by vitus on 2022/05/30.
//

import Foundation
struct PriorityQueue<Element: Equatable> :Queue  {
    private var heap : Heap<Element>
    
    init(_ elements: [Element] = [], areSorted : @escaping(Element, Element) -> Bool ) {
        heap = Heap(elements, arSorted: areSorted)
    }
    var isEmpty: Bool {
        return heap.isEmpty
    }
     
    var peek: Element? {
        return heap.peek()
    }
    
    
    mutating func enqueue(_ element: Element) {
        heap.insert(element )
    }
    
    mutating func dequeue() -> Element? {
        return heap.removeRoot()
    }
    

    

}
