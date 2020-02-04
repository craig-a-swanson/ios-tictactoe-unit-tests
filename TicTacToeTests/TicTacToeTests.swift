//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Craig Swanson on 2/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyBoard() {
        let newBoard = GameBoard()

        for x in 0..<3 {
            for y in 0..<3 {
                let coordinate = Coordinate(x: x, y: y)
                let markAtCoordinate = newBoard[coordinate]
                XCTAssertNil(markAtCoordinate)
            }
        }
    }
    
    func testWinConditionThreeInRowInTopRow() {
        
        // 1. create a board that we think has three marks of the same type in the top row
        // 1.1 create a board
        var board = GameBoard()
        
        // 1.2 place the first mark at the top left corner
        try! board.place(mark: .x, on: (0, 0))
        // 1.3 place a mark somewhere not in the top row
        try! board.place(mark: .o, on: (2, 2))
        // 1.4 place a mark in the top center
        try! board.place(mark: .x, on: (1, 0))
        // 1.5 // place a mark somewhere not in the top row
        try! board.place(mark: .o, on: (2, 1))
        // 1.6 place a mark in the top right corner
        try! board.place(mark: .x, on: (2, 0))
        
        // 2. give that board to the game column
        XCTAssert(game(board: board, isWonBy: .x))
        
        // 3. Check for 'true' when giving the board to the game function
        
    }
    
    func testDrawCondition() {
        
    }

}
