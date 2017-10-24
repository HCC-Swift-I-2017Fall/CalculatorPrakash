//
//  ViewController.swift
//  Calculator
//
//  Created by Prakash Sachania on 10/23/17.
//  Copyright © 2017 Prakash Sachania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var operand1 : Double = 0
    var operation : String = ""
    var decimalNumber : Bool = false
    var operationInProgress : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.text = ""
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func numberTouched(_ sender: UIButton) {
        if (sender.currentTitle == ".") {
            if (decimalNumber) {
                return
            }
            decimalNumber = true
        }
        
        displayLabel.text = displayLabel.text! + sender.currentTitle!
    }
    
    @IBAction func operationTouched(_ sender: UIButton) {
        if (operationInProgress) {
            return
        }
        
        if (displayLabel.text == "") {
            operand1 = 0
        } else {
            operand1 = Double(displayLabel.text!)!
        }
        
        operation = sender.currentTitle!
        
        displayLabel.text = ""
        operationInProgress = true
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if (!operationInProgress) {
            return
        }
        
        var newValue : Double = 0
        
        switch operation {
        case "+":
            newValue = operand1 + Double(displayLabel.text!)!
            break
            
        case "-":
            newValue = operand1 - Double(displayLabel.text!)!
            break

        case "x":
            newValue = operand1 * Double(displayLabel.text!)!
            break

        case "/":
            newValue = operand1 / Double(displayLabel.text!)!
            break

        case "+/-":
            break
            
        default:
            break
        }
        
        displayLabel.text = String(newValue)
        
        resetValue()
        
    }
    
    @IBAction func clearTouched(_ sender: UIButton) {
        resetValue()
        displayLabel.text = ""
    }
    
    func resetValue() {
        operand1 = 0
        operation = ""
        decimalNumber = false
        operationInProgress = false
    }
}

