//
//  UIControlTouchHandlerSpec.swift
//  OnTap
//
//  Created by Skye Freeman on 2/11/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import Quick
import Nimble
import OnTap

class UIControlTouchHandlerSpec: QuickSpec {
        
    override func spec() {
        var called: Bool!
        var control: UIControl!
        
        beforeEach {
            called = false
            control = UIControl()
        }
        
        afterEach {
            control = nil
        }
        
        it("calls the closure when .touchDown occurs") {
            control.on(.touchDown) { called = true }
            control.sendActions(for: .touchDown)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchDownRepeat occurs") {
            control.on(.touchDownRepeat) { called = true }
            control.sendActions(for: .touchDownRepeat)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchDragInside occurs") {
            control.on(.touchDragInside) { called = true }
            control.sendActions(for: .touchDragInside)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchDragOutside occurs") {
            control.on(.touchDragOutside) { called = true }
            control.sendActions(for: .touchDragOutside)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchDragEnter occurs") {
            control.on(.touchDragEnter) { called = true }
            control.sendActions(for: .touchDragEnter)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchDragExit occurs") {
            control.on(.touchDragExit) { called = true }
            control.sendActions(for: .touchDragExit)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchUpInside occurs") {
            control.on(.touchUpInside) { called = true }
            control.sendActions(for: .touchUpInside)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchUpOutside occurs") {
            control.on(.touchUpOutside) { called = true }
            control.sendActions(for: .touchUpOutside)
            expect(called).to(beTrue())
        }
        it("calls the closure when .touchCancel occurs") {
            control.on(.touchCancel) { called = true }
            control.sendActions(for: .touchCancel)
            expect(called).to(beTrue())
        }
        it("calls the closure when .valueChanged occurs") {
            control.on(.valueChanged) { called = true }
            control.sendActions(for: .valueChanged)
            expect(called).to(beTrue())
        }
        it("calls the closure when .editingDidBegin occurs") {
            control.on(.editingDidBegin) { called = true }
            control.sendActions(for: .editingDidBegin)
            expect(called).to(beTrue())
        }
        it("calls the closure when .editingChanged occurs") {
            control.on(.editingChanged) { called = true }
            control.sendActions(for: .editingChanged)
            expect(called).to(beTrue())
        }
        it("calls the closure when .editingDidEnd occurs") {
            control.on(.editingDidEnd) { called = true }
            control.sendActions(for: .editingDidEnd)
            expect(called).to(beTrue())
        }
        it("calls the closure when .editingDidEndOnExit occurs") {
            control.on(.editingDidEndOnExit) { called = true }
            control.sendActions(for: .editingDidEndOnExit)
            expect(called).to(beTrue())
        }
        it("calls the closure when .allTouchEvents occurs") {
            control.on(.allTouchEvents) { called = true }
            control.sendActions(for: .allTouchEvents)
            expect(called).to(beTrue())
        }
        it("calls the closure when .allEditingEvents occurs") {
            control.on(.allEditingEvents) { called = true }
            control.sendActions(for: .allEditingEvents)
            expect(called).to(beTrue())
        }
        it("calls the closure when .applicationReserved occurs") {
            control.on(.applicationReserved) { called = true }
            control.sendActions(for: .applicationReserved)
            expect(called).to(beTrue())
        }
        it("calls the closure when .systemReserved occurs") {
            control.on(.systemReserved) { called = true }
            control.sendActions(for: .systemReserved)
            expect(called).to(beTrue())
        }
        it("calls the closure when .allEvents occurs") {
            control.on(.allEvents) { called = true }
            control.sendActions(for: .allEvents)
            expect(called).to(beTrue())
        }
    }
}
