//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Craig Swanson on 2/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testActivePlayerToggles() {
        var game = Game()
        
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 1))
        XCTAssertEqual(game.activePlayer, .o)
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(game.activePlayer, .x)
        try! game.makeMark(at: (1, 2))
        XCTAssertFalse(game.activePlayer == .x)
    }
    
    func testMakeMarkThrowsError() {
        var game = Game()
        
        try! game.makeMark(at: (1, 1))
        XCTAssertThrowsError(try game.makeMark(at: (1, 1)))
    }
    
    func testGameIsOverFalse() {
        var game = Game()
        
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testGameIsOverWinCondition() {
        /*
         - o x
         - o x
         - - x
         */
        var game = Game()
        
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        XCTAssertFalse(game.gameIsOver)
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testGameIsOverCatCondition() {
        /*
         x o x
         x o x
         o x o
         */
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0 ,2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (1, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertFalse(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
    }
    
    func testWinningPlayerPartialBoard() {
        /*
         - o x
         - o x
         - - x
         */
        var game = Game()
        
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.winningPlayer == .x)
    }
    
    func testWinningPlayerFullBoard() {
        /*
         x o x
         o o x
         o x x
         */
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0 ,2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 2))
        XCTAssertTrue(game.gameIsOver)
        XCTAssertTrue(game.winningPlayer == .x)
        XCTAssertFalse(game.winningPlayer == .o)
    }
    
    func testRestart() {
        /*
         x o x
         o o x
         o x x
         */
        var game = Game()
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0 ,2))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (2, 2))
        
        game.restart()
        XCTAssertNil(game.winningPlayer)
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNoThrow(try game.makeMark(at: (0, 0)))
    }
}
