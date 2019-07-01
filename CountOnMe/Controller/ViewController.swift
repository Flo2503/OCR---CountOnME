//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    // MARK: - Properties
    var simpleCalc = SimpleCalc()
    var alertManager = AlertManager()
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionHaveResultOrZero: Bool {
        return textView.text.firstIndex(of: "=") != nil || textView.text == "0"
    }
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: View Actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let numberText = sender.title(for: .normal) {
            if expressionHaveResultOrZero {
                textView.text = ""
            }
            textView.text.append(numberText)
        }
    }
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if simpleCalc.expressionIsCorrect(elements) {
            textView.text.append(" + ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if simpleCalc.expressionIsCorrect(elements) {
            textView.text.append(" - ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if simpleCalc.expressionIsCorrect(elements) {
            textView.text.append(" / ")
        } else {
            alertManager.alertCanAddOperator(controller: self)
        }
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if simpleCalc.expressionIsCorrect(elements) {
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
        if simpleCalc.expressionHaveEnoughElement(elements) {
            if let result = simpleCalc.didTappedEqualButton(elements) {
                textView.text.append(" = \(result)")
            }
        } else {
            alertManager.alertExpressionCorrect(controller: self)
        }
    }
}
