//
//  BinarayNode.swift
//  Test
//
//  Created by vitus on 2022/05/12.
//

import Foundation
/// https://devmjun.github.io/archive/BinarySearchTree
/// [트리(tree)와 이진트리(binary tree)](https://ratsgo.github.io/data%20structure&algorithm/2017/10/21/tree/)
/// 테스트 파일
/// TestBinaryNode.swift
class BinaryNode<Element: Comparable> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    init(value: Element) {
        self.value = value
    }
}
///  Based on  : https://www.objc.io/books/optimizing-collections/
extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
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

// depth first traversal
// level order traversal
extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void ) {
        leftChild?.traverseInOrder(visit: visit )
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    // 시리얼라이즈 때문에 코드 변경됨
    // func traversePreOrder(visit: (Element) -> Void) {
    //     visit(value)
    //     leftChild?.traversePreOrder(visit: visit)
    //     rightChild?.traversePreOrder(visit: visit)
    // }
    func traversePreOrder(visit: (Element?) -> Void ) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traversePreOrder(visit: visit )
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.traversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
    func traversePostOrder(visit: (Element) -> Void ) {
        leftChild?.traversePostOrder(visit: visit )
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

// 시리얼라이즈
// BinaryNode to Array
func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.traversePreOrder { array.append($0) }
    return array
}
// Array to BinanryNode
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard let value = array.removeLast()  else {
        return nil
    }
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array )
    node.rightChild = deserialize(&array )
    return node
}
func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
    var reserved = Array(array.reversed())
    return deserialize(&reserved)
}
