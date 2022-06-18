//
//  ViewController.swift
//  Calculator
//
//  Created by Yevgenii Kryzhanivskyi on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var operation:String?
    var result:Double = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    

    @IBAction func Numbers(_ sender: UIButton) {
        
        secondNumber = 0
        
        // If pressed "."
        if sender.currentTitle == "." {
            if resultLabel.text!.contains(".") {
                return
            }
            if resultLabel.text == "0" {
                resultLabel.text = resultLabel.text! + sender.currentTitle!
                return
            }
            if resultLabel.text == formatNumber(result) || resultLabel.text == operation {
                resultLabel.text = "0" + sender.currentTitle!
                return
            }
        }
            
        // If pressed numbers
        if resultLabel.text == "0" || resultLabel.text == operation || resultLabel.text == formatNumber(result) {
            resultLabel.text = sender.currentTitle!
        } else {
            resultLabel.text = resultLabel.text! + sender.currentTitle!
        }

    }
    
    @IBAction func Operations(_ sender: UIButton) {

        // Operations
        if sender.currentTitle == "+" || sender.currentTitle == "-" || sender.currentTitle == "*" || sender.currentTitle == "/" {
            firstNumber = Double(resultLabel.text!)!
            operation = sender.currentTitle!
            resultLabel.text = operation
            
        }
        
        
        // Равно
        if sender.currentTitle == "=" && operation != nil {
            if secondNumber == 0 {
                secondNumber = Double(resultLabel.text!)!
            }
            switch operation {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "*":
                result = firstNumber * secondNumber
            case "/":
                result = firstNumber / secondNumber
            case "%":
                result = Double(resultLabel.text!)!/100
                print("%")
            default:
                print("Error")
            }
            firstNumber = result
            resultLabel.text = formatNumber(result)
        }
        
        if sender.currentTitle == "%" {
            result = Double(resultLabel.text!)!/100
            resultLabel.text = formatNumber(result)
        }
        
    }
    
    @IBAction func otherButtonPressed(_ sender: UIButton) {
        
        // Clear calculations
        if sender.currentTitle == "C" {
            resetCalculator()
        }
        
        // Change symbol
        if sender.currentTitle == "+/-" {
            var tempNum = Double(resultLabel.text!)
            tempNum = -tempNum!
            resultLabel.text = formatNumber(tempNum!)
        }
        
    }
    
    // Functions
    
    func resetCalculator() -> Void {
        resultLabel.text = "0"
        firstNumber = 0
        secondNumber = 0
    }
    
    
    func formatNumber(_ number: Double) -> String {
        return String(format: "%g", number)
    }
    
    
    
}

