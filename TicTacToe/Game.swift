//
//  Game.swift
//  TicTacToe
//
//  Created by Craig Swanson on 2/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // MARK: - Properties
    // activePlayer is either x or y or nil (if the game is over)
    internal var activePlayer: GameBoard.Mark?
    
    // gameIsOver returns true if a win or cat state if found, false if game is still active
    internal var gameIsOver: Bool
    
    // winningPlayer returns the winning player if there was one, or nil otherwise
    internal var winningPlayer: GameBoard.Mark?
    
    // board is modified by Game as the game progresses but is externally read-only
    private(set) var board: GameBoard
    
    
    // MARK: - Methods
    // restart the game to a fresh state with an empty board and player x starting
    mutating internal func restart() {
        
    }
    
    // add a mark for the currently active player at the given coordinate; update game state
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
}
