//
//  GameplaykitPDATests.swift
//  GameplaykitPDATests
//
//  Created by Roberto Osorio Goenaga on 8/13/15.
//  Copyright © 2015 Roberto Osorio Goenaga. All rights reserved.
//

import XCTest

class GameplaykitPDA_iosTests: XCTestCase {
    
    var pushdownAutomaton: PushdownAutomaton?
    
    override func setUp() {
        super.setUp()
        self.pushdownAutomaton = PushdownAutomaton(states: [OneState(), TwoState()], firstElement: StackElement())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStack() {
        let currentElement = self.pushdownAutomaton!.currentElement
        self.pushdownAutomaton?.pushToStack(currentElement!)
        self.pushdownAutomaton?.enterState(TwoState)
        XCTAssertTrue(currentElement?.currentState != self.pushdownAutomaton?.currentElement?.currentState)
        self.pushdownAutomaton?.popAndPush()
        XCTAssertTrue(currentElement?.currentState == self.pushdownAutomaton?.currentElement?.currentState)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
