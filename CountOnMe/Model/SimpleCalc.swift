//
//  Calculation.swift
//  CountOnMe
//
//  Created by Flo on 24/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {
    // Method called when tapped equal button
    func didTappedEqualButton(_ elements: [String]) -> String? {
        // MARK: - Property
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            // MARK: - Property
            let operand = operationsToReduce[1]
            if let left = Float(operationsToReduce[0]), let right = Float(operationsToReduce[2]) {
                var result: Float
                // Check that the decimal is necessary
                var isInteger: Bool {
                    return floorf(result) == result
                }
                // Check that the number is not divided by zero
                var isDevidedByZero: Bool {
                    return operationsToReduce[1] == "/" && operationsToReduce[2] == "0"
                }
                // Read the operator to choose the right calculation
                switch operand {
                case "+": result = Float(left + right)
                case "-": result = Float(left - right)
                case "x": result = Float(left * right)
                case "/": result = Float(left / right)
                default: return nil
                }
                if isDevidedByZero {
                    return nil
                }
                // Reduce each operations
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                if isInteger {
                    operationsToReduce.insert("\(Int(result))", at: 0)
                } else {
                    operationsToReduce.insert("\(result)", at: 0)
                }
            }
        }
        return operationsToReduce.first
    }
}
