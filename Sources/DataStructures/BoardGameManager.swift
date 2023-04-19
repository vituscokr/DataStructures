//
//  BoardGameManager.swift
//  Test
//
//  Created by vitus on 2022/05/12.
//

import Foundation

protocol BoardGameManager {
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueStack: BoardGameManager {
    typealias Player = T
    @discardableResult
    mutating func nextPlayer() -> Player? {
        guard let player = dequeue() else {
            return nil
        }
        enqueue(player)
        return player
    }
}
