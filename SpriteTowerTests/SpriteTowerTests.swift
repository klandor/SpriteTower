//
//  SpriteTowerTests.swift
//  SpriteTowerTests
//
//  Created by 刁培倫 on 2014/9/16.
//  Copyright (c) 2014年 klandor. All rights reserved.
//

import UIKit
import XCTest

class SpriteTowerTests: XCTestCase {
    var engine: TowerEngine! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        engine = TowerEngine()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        engine = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            self.engine.randomJewels()
        }
    }
    
}
