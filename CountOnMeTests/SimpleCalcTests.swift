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
    
    //si je donne 2+1 a camcilaution il doit me retourner 3
    // si je donne 2+ a camculation il doit me retourner une erreur (surtout pas une larte)
    //si j d 2+-1 a calc il return erreur
    //di je d 2+1-3 a clac return 0
    //si j d 2.1+1-3.1 a clas il retunr 0
    // si j d 3.1 + 1 il return 4.1
    //si j d 1+2x3 il return 7
    //si j d 4/0 il return erreur
    //
    
    
    func testGivenNumbersAre2And1_WhenAdd_ThenResultIs3() {
     
        let simpleCalc = SimpleCalc()
        
        var inputs = ["2", "+", "1"]
        var expected = "3"
        var result = simpleCalc.test(inputs)
        
        XCTAssertEqual(expected, result)
        
    }
    
    
        
}
