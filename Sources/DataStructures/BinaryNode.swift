//
//  BinarayNode.swift
//  Test
//
//  Created by vitus on 2022/05/12.
//

import Foundation
//https://www.objc.io/books/optimizing-collections/

//https://devmjun.github.io/archive/BinarySearchTree

class BinaryNode<Element:Comparable> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild : BinaryNode?
    
    init(value: Element) {
        self.value = value 
    }
}
extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void ) {
        leftChild?.traverseInOrder(visit: visit )
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    func traversePreOrder(visit: (Element?) -> Void ) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traversePreOrder(visit: visit )
        }else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.traversePreOrder(visit: visit)
        }else {
            visit(nil)
        }
        
    }
    func traversePostOrder(visit: (Element) -> Void ) {
        
        leftChild?.traversePostOrder(visit: visit )
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}


extension BinaryNode : CustomStringConvertible {
    public var description: String {
        return diagram(for:self)
    }
    
    private func diagram(for node: BinaryNode? ,
                         _ top : String = "" ,
                         _ root: String = "" ,
                         _ bottom: String = "" ) -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
                    + root + "\(node.value)\n"
                    + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
       
    }
}

