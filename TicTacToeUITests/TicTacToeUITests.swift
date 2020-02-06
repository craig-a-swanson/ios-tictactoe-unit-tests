//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Craig Swanson on 2/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    func testExample() {
        let app = XCUIApplication()
        app.launch()
        
        assertMovePlayed(app: app, buttonIdentifier: "topLeft", buttonPlayerMark: "X", turnLabel: "O")
        assertMovePlayed(app: app, buttonIdentifier: "topCenter", buttonPlayerMark: "O", turnLabel: "X")
        assertMovePlayed(app: app, buttonIdentifier: "middleLeft", buttonPlayerMark: "X", turnLabel: "O")
        assertMovePlayed(app: app, buttonIdentifier: "middleCenter", buttonPlayerMark: "O", turnLabel: "X")
        assertMovePlayed(app: app, buttonIdentifier: "bottomLeft", buttonPlayerMark: "X", turnLabel: "O")
    }
    
    // testing array:
    // 1. test with no elements
    // 2. test with one element
    // 3. test with two elements
    // 4. test with more than two elements
    
    // SINGLE RESPONSIBILITY PRINCIPLE (it should just know one thing)
    // anything that changes inside the function should be a parameter
    func assertMovePlayed(app: XCUIApplication, buttonIdentifier: String, buttonPlayerMark: String, turnLabel: String) {
        
        let topLeftButton = app.buttons[buttonIdentifier]
        topLeftButton.tap()
        XCTAssert(topLeftButton.label == buttonPlayerMark)
        
        let turnLabel = app.staticTexts["statusLabel"]
        XCTAssertEqual(turnLabel.label, "Player \(turnLabel)'s turn")
    }
}
