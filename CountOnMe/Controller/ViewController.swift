//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var simpleCalc = SimpleCalc()
    var alertManager = AlertManager()
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    

    
    
    // Error check computed variables
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveResultOrZero: Bool {
        return textView.text.firstIndex(of: "=") != nil || textView.text == "0"
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResultOrZero {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if expressionIsCorrect {
            textView.text.append(" + ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if expressionIsCorrect {
            textView.text.append(" - ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if expressionIsCorrect {
            textView.text.append(" / ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if expressionIsCorrect {
            textView.text.append(" x ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        textView.text.removeAll()
        textView.text.append("0")
    }
    
    
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            return alertManager.alertExpressionCorrect(controller: self)
        }
        
        guard expressionHaveEnoughElement else {
            return alertManager.alertExpressionEnoughElement(controller: self)
        }
        
        
        
        if let result = simpleCalc.didTappedEqualButton(elements) {
            textView.text.append(" = \(result)")
        } else {
            alertManager.alertExpressionCorrect(controller: self)
        }
        
    }
    

}



