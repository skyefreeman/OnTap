//
//  UIBarButtonItemTouchHandlerSpec.swift
//  OnTap
//
//  Created by Skye Freeman on 2/11/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import Quick
import Nimble
import OnTap

class UIBarButtonItemTouchHandlerSpec: QuickSpec {
    override func spec() {
        
        it("calls the closure when tapping on the bar button item") {
            var called = false
            let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, onTap: {
                called = true
            })
            UIApplication.shared.sendAction(barButton.action!, to: barButton.target, from: self, for: nil)
            
            expect(called).to(beTrue())
        }
    }
}
