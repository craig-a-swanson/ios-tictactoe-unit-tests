//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // check if top three boxes are filled
    let firstBox = Coordinate(x: 0, y: 0)
    let secondBox = Coordinate(x: 1, y: 0)
    let thirdBox = Coordinate(x: 2, y: 0)
    
    let firstBoxValueOptional = board[firstBox]
    let secondBoxValueOptional = board[secondBox]
    let thirdBoxValueOptional = board[thirdBox]
    
    guard let firstValue = firstBoxValueOptional,
        let secondBoxValue = secondBoxValueOptional,
        let thirdBoxValue = thirdBoxValueOptional else { return false }
    
    guard firstValue == secondBoxValue, secondBoxValue == thirdBoxValue else {
         return false
    }
    // if the boxes are filled, check if the top three boxes have the same mark
    
    return true
}
