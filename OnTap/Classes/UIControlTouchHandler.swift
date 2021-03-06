//
//  UIControlTouchHandler.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

extension UIControlEvents: Hashable {
    public var hashValue: Int {
        return Int(rawValue)
    }
}

internal class UIControlTouchHandler: NSObject {
    
    var onTouchDown: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDown), for: .touchDown)
        }
    }
    
    var onTouchDownRepeat: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDownRepeat), for: .touchDownRepeat)
        }
    }
    
    var onTouchDragInside: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDragInside), for: .touchDragInside)
        }
    }
    
    var onTouchDragOutside: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDragOutside), for: .touchDragOutside)
        }
    }
    
    var onTouchDragEnter: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
        }
    }
    
    var onTouchDragExit: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
        }
    }
    
    var onTouchUpInside: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        }
    }
    
    var onTouchUpOutside: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        }
    }
    
    var onTouchCancel: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
        }
    }
    
    var onValueChanged: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        }
    }

    var onEditingDidBegin: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        }
    }
    
    var onEditingChanged: OTStandardClosure? {
        didSet {
            if onEditingChanged != nil {
                control.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            }
        }
    }
    
    var onEditingDidEnd: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        }
    }
    
    var onEditingDidEndOnExit: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(editingDidEndOnExit), for: .editingDidEndOnExit)
        }
    }
    
    var onAllTouchEvents: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(allTouchEvents), for: .allTouchEvents)
        }
    }
    
    var onAllEditingEvents: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(allEditingEvents), for: .allEditingEvents)
        }
    }
    
    var onApplicationReserved: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(applicationReserved), for: .applicationReserved)
        }
    }
    
    var onSystemReserved: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(systemReserved), for: .systemReserved)
        }
    }
    
    var onAllEvents: OTStandardClosure? {
        didSet {
            control.addTarget(self, action: #selector(allEvents), for: .allEvents)
        }
    }
    
    // MARK: Initialization

    private var control: UIControl
    
    init(control: UIControl) {
        self.control = control
        super.init()
    }
    
    deinit {
        control.removeTarget(self, action: nil, for: UIControlEvents.allEvents)
    }
}

// MARK: Private

internal extension UIControlTouchHandler {
    @objc fileprivate func touchDown(sender: AnyObject) { onTouchDown?() }
    @objc fileprivate func touchDownRepeat(sender: AnyObject) { onTouchDownRepeat?() }
    @objc fileprivate func touchDragInside(sender: AnyObject) { onTouchDragInside?() }
    @objc fileprivate func touchDragOutside(sender: AnyObject) { onTouchDragOutside?() }
    @objc fileprivate func touchDragEnter(sender: AnyObject) { onTouchDragEnter?() }
    @objc fileprivate func touchDragExit(sender: AnyObject) { onTouchDragExit?() }
    @objc fileprivate func touchUpInside(sender: AnyObject) { onTouchUpInside?() }
    @objc fileprivate func touchUpOutside(sender: AnyObject) { onTouchUpOutside?() }
    @objc fileprivate func touchCancel(sender: AnyObject) { onTouchCancel?() }
    @objc fileprivate func valueChanged(sender: AnyObject) { onValueChanged?() }
    @objc fileprivate func editingDidBegin(sender: AnyObject) { onEditingDidBegin?() }
    @objc fileprivate func editingChanged(sender: AnyObject) { onEditingChanged?() }
    @objc fileprivate func editingDidEnd(sender: AnyObject) { onEditingDidEnd?() }
    @objc fileprivate func editingDidEndOnExit(sender: AnyObject) { onEditingDidEndOnExit?() }
    @objc fileprivate func allTouchEvents(sender: AnyObject) { onAllTouchEvents?() }
    @objc fileprivate func allEditingEvents(sender: AnyObject) { onAllEditingEvents?() }
    @objc fileprivate func applicationReserved(sender: AnyObject) { onApplicationReserved?() }
    @objc fileprivate func systemReserved(sender: AnyObject) { onSystemReserved?() }
    @objc fileprivate func allEvents(sender: AnyObject) { onAllEvents?() }
}
