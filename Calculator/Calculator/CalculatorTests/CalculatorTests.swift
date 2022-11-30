//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Кирилл Кузнецов on 23.03.2022.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    // SUT - system under test
    let sut = Calculate()
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    // Тест ввода первого числа
    func testAddFirstNumber() {
        // Дано (Given)
        sut.firstNumber = ""
        sut.operand = ""
        // Действие (When)
        sut.addNumber(number: "1")
        sut.addNumber(number: "3")
        sut.addNumber(number: "6")
        // Результат (Then)
        XCTAssert(sut.firstNumber == "136", "До выбора операнда данные должны записываться в первую переменную")
    }
    
    // Тест ввода второго числа
    func testAddSecondNumber() {
        sut.operand = "/"
        sut.addNumber(number: "5")
        sut.addNumber(number: "7")
        sut.addNumber(number: "9")
        XCTAssert(sut.secondNumber == "579")
    }
    
    // Тест обнуления калькулятора после ввода первого числа
    func testClearAfterFirstNumber() {
        sut.firstNumber = "13"
        sut.clearData()
        XCTAssert(sut.firstNumber.isEmpty)
    }
    
    // Тест обнуления калькулятора после ввода первого числа и операнда
    func testClearAfterEnterOperand() {
        sut.firstNumber = "13"
        sut.operand = "*"
        sut.clearData()
        XCTAssert(sut.firstNumber == "")
        XCTAssert(sut.operand == "")
    }
    
    // Тест обнуления калькулятора после ввода первого, второго числа и операнда
    func testClearAfterSecondNumber() {
        sut.firstNumber = "13"
        sut.operand = "*"
        sut.secondNumber = "5"
        sut.clearData()
        XCTAssert(sut.firstNumber == "")
        XCTAssert(sut.operand == "")
        XCTAssert(sut.secondNumber == "")
    }
    
    // Тест отображения целого числа
    func testShowResultForIntergerNumber() {
        let taskCase = sut.showResult(number: 3.0)
        XCTAssertEqual(taskCase, "3")
    }
    
    // Тест отображения десятичного числа
    func testShowResultForDoubleNumber() {
        let taskCase = sut.showResult(number: 3.4)
        XCTAssertEqual(taskCase,"3.4")
    }
    
    // Тест суммирования
    func testAddition() {
        let taskCase = sut.addition(a: "2", b: "4")
        XCTAssertEqual(taskCase, 6)
    }
    
    // Тест вычитания
    func testSubtraction() {
        let taskCase = sut.subtraction(a: "9", b: "6")
        XCTAssertEqual(taskCase, 3)
    }
    
    // Тест умножения
    func testMultiplication() {
        let taskCase = sut.multiplication(a: "3", b: "9")
        XCTAssertEqual(taskCase, 27)
    }
    
    // Тест деления
    func testDivision() {
        let taskCase = sut.division(a: "48", b: "8")
        XCTAssertEqual(taskCase, 6)
    }

}
