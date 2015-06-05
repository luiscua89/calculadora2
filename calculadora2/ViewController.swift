//
//  ViewController.swift
//  calculadora2
//
//  Created by Luis Cua Catzin on 6/2/15.
//  Copyright (c) 2015 Luis Cua Catzin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display 	: UILabel!
    
    var userenter = false
    
    @IBAction func enterNumber (sender: UIButton){
        
        let digit = sender.currentTitle!
        if userenter {
            display.text = display.text! + digit
        }
            
        else {
            display.text = digit
            userenter = true
        }
    }

    
    var operand = Array<Double>()

    @IBAction func enter() {
        
        userenter = false
        operand.append(displayvalue)
        
        println("operand = \(operand)")
        
    }
    
    var displayvalue : Double {
        get{
            return NSNumberFormatter ().numberFromString(display.text!)!.doubleValue
        }
        
        set{
            display.text = "\(newValue)"
            userenter = false
        }
    }
    
    @IBAction func clear (){
        displayvalue = 0
        display.text = "\(displayvalue)"
        
    }
    
    @IBAction func operate (sender: UIButton){
      let operation = sender.currentTitle!
        
        if userenter {
            enter()
        }
        
        switch operation {
        case "+": performOperation{$0 + $1}
            
        case "-": performOperation{$1 - $0}
            
        case "x": performOperation{$0 * $1}
            
        case "÷": performOperation{$1 / $0}
            
        case "√": performOperation2{sqrt($0)}
            
        default: break
        }
    }
    
    func performOperation (operation: (Double, Double) -> Double) {
        if operand.count >= 2 {
            displayvalue = operation (operand.removeLast(), operand.removeLast())
            
            enter ()
        }
    }
    
    func performOperation2 (operation: Double -> Double) {
        if operand.count >= 1 {
            displayvalue = operation (operand.removeLast())
            
            enter ()
        }
    }
    
    
    func add (op1: Double, op2:Double) -> Double {
        return op1 + op2
    }
    
    func subtract (op1: Double, op2:Double) -> Double {
        return op1 - op2
    }
    
    func multiply (op1: Double, op2:Double) -> Double {
        return op1 * op2
    }
    
    func divide (op1: Double, op2:Double) -> Double {
        return op1 / op2
    }
    
}

