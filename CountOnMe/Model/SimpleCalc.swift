//
//  Calculation.swift
//  CountOnMe
//
//  Created by Flo on 24/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class SimpleCalc {
    
   
  
    func didTappedEqualButton(_ elements: [String]) -> String? {
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!
            
            let result: Float
            var isInteger: Bool {
                return floorf(result) == result
            }
            var isDevidedByZero: Bool {
                return operationsToReduce[1] == "/" && operationsToReduce[2] == "0"
            }
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
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            if isInteger {
                operationsToReduce.insert("\(Int(result))", at: 0)
            } else {
                operationsToReduce.insert("\(result)", at: 0)
            }
        }
        
        return operationsToReduce.first
    }
    
    
    
}
