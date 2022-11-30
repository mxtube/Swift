//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Кирилл Кузнецов on 23.03.2022.
//

import XCTest

@testable import Calculator
class CalculatorUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }
    
    // Тест ввода кнопок
    func testCheckNumberButtons() {
        let labelOutput = app.staticTexts.firstMatch
        let buttonAC = app.buttons["AC"]
        let button1 = app.buttons["1"]
        let button2 = app.buttons["2"]
        let button3 = app.buttons["3"]
        let button4 = app.buttons["4"]
        let button5 = app.buttons["5"]
        let button6 = app.buttons["6"]
        let button7 = app.buttons["7"]
        let button8 = app.buttons["8"]
        let button9 = app.buttons["9"]
        let button0 = app.buttons["0"]
        
        
        XCTAssertEqual(labelOutput.label, "0")
        
        button1.tap()
        XCTAssertEqual(labelOutput.label, "1")
        buttonAC.tap()
        
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        buttonAC.tap()
        
        button3.tap()
        XCTAssertEqual(labelOutput.label, "3")
        buttonAC.tap()
        
        button4.tap()
        XCTAssertEqual(labelOutput.label, "4")
        buttonAC.tap()
        
        button5.tap()
        XCTAssertEqual(labelOutput.label, "5")
        buttonAC.tap()
        
        button6.tap()
        XCTAssertEqual(labelOutput.label, "6")
        buttonAC.tap()
        
        button7.tap()
        XCTAssertEqual(labelOutput.label, "7")
        buttonAC.tap()
        
        button8.tap()
        XCTAssertEqual(labelOutput.label, "8")
        buttonAC.tap()
        
        button9.tap()
        XCTAssertEqual(labelOutput.label, "9")
        buttonAC.tap()
        
        button0.tap()
        XCTAssertEqual(labelOutput.label, "0")
        buttonAC.tap()
    }
    
    // Тест ввода операнда
    func testCheckOperandButtons() {
        
        let labelOutput = app.staticTexts.firstMatch
        let buttonAC = app.buttons["AC"]
        let buttonDivision = app.buttons["/"]
        let buttonMultiplication = app.buttons["*"]
        let buttonAddition = app.buttons["+"]
        let buttonSubtraction = app.buttons["-"]
        
        XCTAssertEqual(labelOutput.label, "0")
        
        buttonDivision.tap()
        XCTAssertEqual(labelOutput.label, "/")
        buttonAC.tap()
        
        buttonMultiplication.tap()
        XCTAssertEqual(labelOutput.label, "*")
        buttonAC.tap()
        
        buttonAddition.tap()
        XCTAssertEqual(labelOutput.label, "+")
        buttonAC.tap()
        
        buttonSubtraction.tap()
        XCTAssertEqual(labelOutput.label, "-")
        buttonAC.tap()
    }
    
    // Тест суммирования
    func testCheckButtonsAddition() {
        
        let labelOutput = app.staticTexts.firstMatch
        let button2 = app.buttons["2"]
        let buttonPlus = app.buttons["+"]
        let button3 = app.buttons["3"]
        let buttonEquals = app.buttons["="]
        
        
        XCTAssertEqual(labelOutput.label, "0")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "22")
        buttonPlus.tap()
        XCTAssertEqual(labelOutput.label, "+")
        button3.tap()
        XCTAssertEqual(labelOutput.label, "3")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "25")
    }
    
    // Тест вычитания
    func testCheckButtonsSubtraction() {
        
        let labelOutput = app.staticTexts.firstMatch
        let button2 = app.buttons["2"]
        let buttonSubtraction = app.buttons["-"]
        let button3 = app.buttons["3"]
        let buttonEquals = app.buttons["="]
        
        
        XCTAssertEqual(labelOutput.label, "0")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "22")
        buttonSubtraction.tap()
        XCTAssertEqual(labelOutput.label, "-")
        button3.tap()
        XCTAssertEqual(labelOutput.label, "3")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "19")
    }
    
    // Тест умножения
    func testCheckButtonsMultiplication() {
        
        let labelOutput = app.staticTexts.firstMatch
        let button2 = app.buttons["2"]
        let buttonMultiplication = app.buttons["*"]
        let button3 = app.buttons["3"]
        let buttonEquals = app.buttons["="]
        
        
        XCTAssertEqual(labelOutput.label, "0")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "22")
        buttonMultiplication.tap()
        XCTAssertEqual(labelOutput.label, "*")
        button3.tap()
        XCTAssertEqual(labelOutput.label, "3")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "66")
    }
    
    // Тест деления
    func testCheckButtonsDivision() {
        
        let labelOutput = app.staticTexts.firstMatch
        let button2 = app.buttons["2"]
        let button3 = app.buttons["3"]
        let button7 = app.buttons["7"]
        let buttonDivision = app.buttons["/"]
        let buttonEquals = app.buttons["="]
        
        
        XCTAssertEqual(labelOutput.label, "0")
        button2.tap()
        XCTAssertEqual(labelOutput.label, "2")
        button7.tap()
        XCTAssertEqual(labelOutput.label, "27")
        buttonDivision.tap()
        XCTAssertEqual(labelOutput.label, "/")
        button3.tap()
        XCTAssertEqual(labelOutput.label, "3")
        buttonEquals.tap()
        XCTAssertEqual(labelOutput.label, "9")
    }
    
}
