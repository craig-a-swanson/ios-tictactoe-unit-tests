//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical3() {
        var board = GameBoard()
        /*
        - o x
        - o x
        - - x
        */
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         x x x
         o - o
         o - -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         - x x
         o o o
         x - -
         */
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal3() {
        var board = GameBoard()
        /*
         - x x
         - x -
         o o o
         */
         try! board.place(mark: .x, on: (1, 0))
         try! board.place(mark: .o, on: (0, 2))
         try! board.place(mark: .x, on: (2, 0))
         try! board.place(mark: .o, on: (1, 2))
         try! board.place(mark: .x, on: (1, 1))
         try! board.place(mark: .o, on: (2, 2))
         XCTAssertTrue(game(board: board, isWonBy: .o))
         XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
         try! board.place(mark: .x, on: (0, 0))
         try! board.place(mark: .o, on: (0, 2))
         try! board.place(mark: .x, on: (1, 1))
         try! board.place(mark: .o, on: (1, 2))
         try! board.place(mark: .x, on: (2, 2))
         XCTAssertTrue(game(board: board, isWonBy: .x))
         XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x x o
         - o -
         o x -
         */
         try! board.place(mark: .x, on: (0, 0))
         try! board.place(mark: .o, on: (0, 2))
         try! board.place(mark: .x, on: (1, 0))
         try! board.place(mark: .o, on: (1, 1))
         try! board.place(mark: .x, on: (1, 2))
         try! board.place(mark: .o, on: (2, 0))
         XCTAssertTrue(game(board: board, isWonBy: .o))
         XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        // check to see if there is a winner
            // if there is a winner, then return false (the game is complete)
        // check to see if the game board is full
            // if the board is full, then return false (the game is complete)
        // if neither is true, then return true (the game is incomplete)
        
        // Or, just test the isFull property to make sure it works.
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (2, 0))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(board.isFull)
        
    }

    func testCatsGame() {
        // check to see if there is a winner
            // if there is a winner, then return false (it is not a cat)
        // check to see if the game board is full
            // if it is not full, then return false (it is  not a complete game, so no cat)
        // if there is not a winner and the game board is full, then return true (it is a cat)
        
    }
}
