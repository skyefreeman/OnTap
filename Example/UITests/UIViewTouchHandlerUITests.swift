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
        app.staticTexts["Tap or swipe!"].tap()
        
        let afterTapString = "tapped"
        XCTAssert(app.staticTexts[afterTapString].exists)
        app.staticTexts[afterTapString].swipeLeft()
        
        let afterSwipeLeftString = "left swipe"
        XCTAssert(app.staticTexts[afterSwipeLeftString].exists)
        app.staticTexts[afterSwipeLeftString].swipeRight()
        
        let afterSwipeRightString = "right swipe"
        XCTAssert(app.staticTexts[afterSwipeRightString].exists)
        app.staticTexts[afterSwipeRightString].swipeUp()
        
        let afterSwipeUpString = "upward swipe"
        XCTAssert(app.staticTexts[afterSwipeUpString].exists)
        app.staticTexts[afterSwipeUpString].swipeDown()
        
        let afterSwipeDownString = "downward swipe"
        XCTAssert(app.staticTexts[afterSwipeDownString].exists)
    }
    
}
