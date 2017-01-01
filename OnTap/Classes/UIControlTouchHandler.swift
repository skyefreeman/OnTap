//
//  UIControlTouchHandler.swift
//  Pods
//
//  Created by Skye on 12/29/16.
//
//

import UIKit

internal class UIControlTouchHandler: NSObject {
    
    var onTouchDown: ot_controlClosure? {
        didSet {
            if onTouchDown != nil {
                control.addTarget(self, action: #selector(touchDown), for: .touchDown)
            }
        }
    }
    
    var onTouchDownRepeat: ot_controlClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(touchDownRepeat), for: .touchDownRepeat)
            }
        }
    }
    
    var onTouchDragInside: ot_controlClosure? {
        didSet {
            if onTouchDragInside != nil {
                control.addTarget(self, action: #selector(touchDragInside), for: .touchDragInside)
            }
        }
    }
    
    var onTouchDragOutside: ot_controlClosure? {
        didSet {
            if onTouchDragOutside != nil {
                control.addTarget(self, action: #selector(touchDragOutside), for: .touchDragOutside)
            }
        }
    }
    
    var onTouchDragEnter: ot_controlClosure? {
        didSet {
            if onTouchDragEnter != nil {
                control.addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
            }
        }
    }
    
    var onTouchDragExit: ot_controlClosure? {
        didSet {
            if onTouchDragExit != nil {
                control.addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
            }
        }
    }
    
    var onTouchUpInside: ot_controlClosure? {
        didSet {
            if onTouchUpInside != nil {
                control.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
            }
        }
    }
    
    var onTouchUpOutside: ot_controlClosure? {
        didSet {
            if onTouchUpOutside != nil {
                control.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
            }
        }
    }
    
    var onTouchCancel: ot_controlClosure? {
        didSet {
            if onTouchCancel != nil {
                control.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
            }
        }
    }
    
    var onValueChanged: ot_controlClosure? {
        didSet {
            if onValueChanged != nil {
                control.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
            }
        }
    }
    
    var onEditingDidBegin: ot_controlClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
            }
        }
    }
    
    var onEditingChanged: ot_controlClosure? {
        didSet {
            if onEditingChanged != nil {
                control.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            }
        }
    }
    
    var onEditingDidEnd: ot_controlClosure? {
        didSet {
            if onEditingDidEnd != nil {
                control.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
            }
        }
    }
    
    var onEditingDidEndOnExit: ot_controlClosure? {
        didSet {
            if onEditingDidEndOnExit != nil {
                control.addTarget(self, action: #selector(editingDidEndOnExit), for: .editingDidEndOnExit)
            }
        }
    }
    
    var onAllTouchEvents: ot_controlClosure? {
        didSet {
            if onAllTouchEvents != nil {
                control.addTarget(self, action: #selector(allTouchEvents), for: .allTouchEvents)
            }
        }
    }
    
    var onAllEditingEvents: ot_controlClosure? {
        didSet {
            if onAllEditingEvents != nil {
                control.addTarget(self, action: #selector(allEditingEvents), for: .allEditingEvents)
            }
        }
    }
    
    var onApplicationReserved: ot_controlClosure? {
        didSet {
            if onApplicationReserved != nil {
                control.addTarget(self, action: #selector(applicationReserved), for: .applicationReserved)
            }
        }
    }
    
    var onSystemReserved: ot_controlClosure? {
        didSet {
            if onSystemReserved != nil {
                control.addTarget(self, action: #selector(systemReserved), for: .systemReserved)
            }
        }
    }
    
    var onAllEvents: ot_controlClosure? {
        didSet {
            if onAllEvents != nil {
                control.addTarget(self, action: #selector(allEvents), for: .allEvents)
            }
        }
    }
    
    // MARK: Initialization

    fileprivate var control: UIControl
    
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
    
    @objc fileprivate func touchDown(sender: AnyObject) { onTouchDown?(control) }
    @objc fileprivate func touchDownRepeat(sender: AnyObject) { onTouchDownRepeat?(control) }
    @objc fileprivate func touchDragInside(sender: AnyObject) { onTouchDragInside?(control) }
    @objc fileprivate func touchDragOutside(sender: AnyObject) { onTouchDragOutside?(control) }
    @objc fileprivate func touchDragEnter(sender: AnyObject) { onTouchDragEnter?(control) }
    @objc fileprivate func touchDragExit(sender: AnyObject) { onTouchDragExit?(control) }
    @objc fileprivate func touchUpInside(sender: AnyObject) { onTouchUpInside?(control) }
    @objc fileprivate func touchUpOutside(sender: AnyObject) { onTouchUpOutside?(control) }
    @objc fileprivate func touchCancel(sender: AnyObject) { onTouchCancel?(control) }
    @objc fileprivate func valueChanged(sender: AnyObject) { onValueChanged?(control) }
    @objc fileprivate func editingDidBegin(sender: AnyObject) { onEditingDidBegin?(control) }
    @objc fileprivate func editingChanged(sender: AnyObject) { onEditingChanged?(control) }
    @objc fileprivate func editingDidEnd(sender: AnyObject) { onEditingDidEnd?(control) }
    @objc fileprivate func editingDidEndOnExit(sender: AnyObject) { onEditingDidEndOnExit?(control) }
    @objc fileprivate func allTouchEvents(sender: AnyObject) { onAllTouchEvents?(control) }
    @objc fileprivate func allEditingEvents(sender: AnyObject) { onAllEditingEvents?(control) }
    @objc fileprivate func applicationReserved(sender: AnyObject) { onApplicationReserved?(control) }
    @objc fileprivate func systemReserved(sender: AnyObject) { onSystemReserved?(control) }
    @objc fileprivate func allEvents(sender: AnyObject) { onAllEvents?(control) }
}
