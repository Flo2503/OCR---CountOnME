//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    
    // si je donne 2+ a camculation il doit me retourner une erreur (surtout pas une larte)
    //si j d 4/0 il return erreur
    
    var simpleCalc: SimpleCalc!
    
    override func setUp() {
        super.setUp()
        simpleCalc = SimpleCalc()
    }
    
    func testGivenNumbersAre2And1_WhenAdd_ThenResultIs3() {
        
        let inputs = ["2", "+", "1"]
        let expected = "3"
        let result = simpleCalc.didTappedEqualButton(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    func testGivenNumbersAre5And10_WhenMinus_ThenResultIsMinus5() {
        
        let inputs = ["5", "-", "10"]
        let expected = "-5"
        let result = simpleCalc.didTappedEqualButton(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    func testGiven2Plus1Minus3_WhenCalculate_ThenResultIs0() {
        
        let inputs = ["2", "+", "1", "-", "3"]
        let expected = "0"
        let result = simpleCalc.didTappedEqualButton(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    func testGivenNumbersAre2Point1And1_WhenAdd_ThenResultIs3Point1() {
        
        let inputs = ["2.1", "+", "1"]
        let expected = "3.1"
        let result = simpleCalc.didTappedEqualButton(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    
    func testGivenNumbers1Plus2Times3_WhenCalculate_ThenResultIs7() {
        
        let inputs = ["1", "+", "2", "x", "3"]
        let expected = "7"
        let result = simpleCalc.didTappedEqualButton(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    
    
}
