 //
//  Calculate.swift
//  Calculator
//
//  Created by Кирилл Кузнецов on 23.03.2022.
//

import UIKit

class Calculate: UIViewController {

    // Переменная для первого числа
    var firstNumber: String = ""
    // Переменная для второго числа
    var secondNumber: String = ""
    // Переменная для хранения арифметического оператора
    var operand: String = ""
    
    // Строка отображения вычислений
    @IBOutlet weak var outputLabel: UILabel!
    
    // Функция обработки нажатия на цифры
    @IBAction func tappedNumber(_ sender: UIButton) {
        addNumber(number: (sender.titleLabel?.text)!)
    }
    
    // Функция записи числа
    func addNumber(number: String) {
        if operand.isEmpty {
            firstNumber += number
            outputLabel?.text = firstNumber
        } else {
            secondNumber += number
            outputLabel?.text = secondNumber
        }
    }
    
    // Функция обработки выбранного операнда
    @IBAction func tappedOperand(_ sender: UIButton) {
        operand = (sender.titleLabel?.text)!
        outputLabel.text = operand
    }
    
    // Функция обнуления калькулятора
    @IBAction func clearCalculator(_ sender: Any) {
        clearData()
        outputLabel.text = "0"
    }
    
    // Функция отображения результата
    @IBAction func calucate(_ sender: UIButton) {
        evaluate()
    }
    
    // Калькулятор
    func evaluate() {
        var result: Double = 0.0
        
        switch operand {
        case "+":
            result = addition(a: firstNumber, b: secondNumber)
        case "-":
            result = subtraction(a: firstNumber, b: secondNumber)
        case "*":
            result = multiplication(a: firstNumber, b: secondNumber)
        case "/":
            result = division(a: firstNumber, b: secondNumber)
        default:
            break
        }
        outputLabel.text = showResult(number: result)
    }
    
    // Функция сброса калькулятора
    func clearData() {
        firstNumber = ""
        secondNumber = ""
        operand = ""
    }
    
    // Функция суммирования
    func addition(a: String, b: String) -> Double {
        return Double(a)! + Double(b)!
    }
    
    // Функция вычитания
    func subtraction(a: String, b: String) -> Double {
        return Double(a)! - Double(b)!
    }
    
    // Функция умножения
    func multiplication(a: String, b: String) -> Double {
        return Double(a)! * Double(b)!
    }
    
    // Функция деления
    func division(a: String, b: String) -> Double {
        return Double(a)! / Double(b)!
    }
    
    // Функция отображения результата с проверкой остатка
    func showResult(number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1.0) == 0.0 {
            return String(Int(number))
        } else {
            return String(number)
        }
    }
}

