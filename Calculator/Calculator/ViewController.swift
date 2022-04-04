//
//  ViewController.swift
//  Calculator
//
//  Created by 홍성범 on 2022/04/04.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Multiply
    case Divide
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else { return }
        if displayNumber.count < 9 {
            displayNumber += numberValue
            numberOutputLabel.text = displayNumber
        }
    }
    @IBAction func tapClearButton(_ sender: UIButton) {
        displayNumber = ""
        firstOperand = ""
        secondOperand = ""
        result = ""
        currentOperation = .unknown
        numberOutputLabel.text = "0"
    }
    @IBAction func tapDotButton(_ sender: UIButton) {
        if displayNumber.count < 8 && !displayNumber.contains(".") {
            displayNumber += displayNumber.isEmpty ? "0." : "."
            numberOutputLabel.text = displayNumber
        }
    }
    @IBAction func tapDivideButton(_ sender: UIButton) {
        operation(.Divide)
    }
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        operation(.Multiply)
    }
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        operation(.Subtract)
    }
    @IBAction func tapAddButton(_ sender: UIButton) {
        operation(.Add)
    }
    @IBAction func tapEqualButton(_ sender: UIButton) {
        operation(currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if currentOperation != .unknown {
            if !displayNumber.isEmpty {
                secondOperand = displayNumber
                displayNumber = ""
                
                guard let firstOperand = Double(firstOperand) else { return }
                guard let secondOperand = Double(secondOperand) else { return }
                
                switch currentOperation {
                case .Add:
                    result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    result = "\(firstOperand * secondOperand)"
                case .Divide:
                    result = "\(firstOperand / secondOperand)"
                case .unknown:
                    break
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
        } else {
            firstOperand = displayNumber
            currentOperation = operation
            displayNumber = ""
        }
    }
}

