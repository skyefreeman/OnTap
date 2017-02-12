//
//  UIViewTouchHandlerUITests.swift
//  OnTap
//
//  Created by Skye Freeman on 2/12/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import XCTest

class UIViewTouchHandlerUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInteractingWithViewTriggersCallbacks() {
        app.staticTexts["Tap me!"].tap()
        
        let afterTapString = "tapped"
        XCTAssert(app.staticTexts[afterTapString].exists)
        app.staticTexts[afterTapString].swipeLeft()
        
        let afterSwipeLeftString = "left"
        XCTAssert(app.staticTexts[afterSwipeLeftString].exists)
        app.staticTexts[afterSwipeLeftString].swipeRight()
        
        let afterSwipeRightString = "right"
        XCTAssert(app.staticTexts[afterSwipeRightString].exists)
        app.staticTexts[afterSwipeRightString].swipeUp()
        
        let afterSwipeUpString = "up"
        XCTAssert(app.staticTexts[afterSwipeUpString].exists)
        app.staticTexts[afterSwipeUpString].swipeDown()
        
        let afterSwipeDownString = "down"
        XCTAssert(app.staticTexts[afterSwipeDownString].exists)
    }
    
}
