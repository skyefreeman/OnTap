//
//  UIControl+TouchHandler.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/8/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

fileprivate class TouchHandler: NSObject {
    var control: UIControl
    
    var onTouchDown: StandardClosure? {
        didSet {
            if onTouchDown != nil {
                control.addTarget(self, action: #selector(self.touchDown), for: .touchDown)
            }
        }
    }
    var onTouchDownRepeat: StandardClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(self.touchDownRepeat), for: .touchDownRepeat)
            }
        }
    }
    var onTouchDragInside: StandardClosure? {
        didSet {
            if onTouchDragInside != nil {
                control.addTarget(self, action: #selector(self.touchDragInside), for: .touchDragInside)
            }
        }
    }
    var onTouchDragOutside: StandardClosure? {
        didSet {
            if onTouchDragOutside != nil {
                control.addTarget(self, action: #selector(self.touchDragOutside), for: .touchDragOutside)
            }
        }
    }
    var onTouchDragEnter: StandardClosure? {
        didSet {
            if onTouchDragEnter != nil {
                control.addTarget(self, action: #selector(self.touchDragEnter), for: .touchDragEnter)
            }
        }
    }
    var onTouchDragExit: StandardClosure? {
        didSet {
            if onTouchDragExit != nil {
                control.addTarget(self, action: #selector(self.touchDragExit), for: .touchDragExit)
            }
        }
    }
    var onTouchUpInside: StandardClosure? {
        didSet {
            if onTouchUpInside != nil {
                control.addTarget(self, action: #selector(self.touchUpInside), for: .touchUpInside)
            }
        }
    }
    var onTouchUpOutside: StandardClosure? {
        didSet {
            if onTouchUpOutside != nil {
                control.addTarget(self, action: #selector(self.touchUpOutside), for: .touchUpOutside)
            }
        }
    }
    var onTouchCancel: StandardClosure? {
        didSet {
            if onTouchCancel != nil {
                control.addTarget(self, action: #selector(self.touchCancel), for: .touchCancel)
            }
        }
    }
    var onValueChanged: StandardClosure? {
        didSet {
            if onValueChanged != nil {
                control.addTarget(self, action: #selector(self.valueChanged), for: .valueChanged)
            }
        }
    }
    var onEditingDidBegin: StandardClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(self.editingDidBegin), for: .editingDidBegin)
            }
        }
    }
    var onEditingChanged: StandardClosure? {
        didSet {
            if onEditingChanged != nil {
                control.addTarget(self, action: #selector(self.editingChanged), for: .editingChanged)
            }
        }
    }
    var onEditingDidEnd: StandardClosure? {
        didSet {
            if onEditingDidEnd != nil {
                control.addTarget(self, action: #selector(self.editingDidEnd), for: .editingDidEnd)
            }
        }
    }
    var onEditingDidEndOnExit: StandardClosure? {
        didSet {
            if onEditingDidEndOnExit != nil {
                control.addTarget(self, action: #selector(self.editingDidEndOnExit), for: .editingDidEndOnExit)
            }
        }
    }
    var onAllTouchEvents: StandardClosure? {
        didSet {
            if onAllTouchEvents != nil {
                control.addTarget(self, action: #selector(self.allTouchEvents), for: .allTouchEvents)
            }
        }
    }
    var onAllEditingEvents: StandardClosure? {
        didSet {
            if onAllEditingEvents != nil {
                control.addTarget(self, action: #selector(self.allEditingEvents), for: .allEditingEvents)
            }
        }
    }
    var onApplicationReserved: StandardClosure? {
        didSet {
            if onApplicationReserved != nil {
                control.addTarget(self, action: #selector(self.applicationReserved), for: .applicationReserved)
            }
        }
    }
    var onSystemReserved: StandardClosure? {
        didSet {
            if onSystemReserved != nil {
                control.addTarget(self, action: #selector(self.systemReserved), for: .systemReserved)
            }
        }
    }
    var onAllEvents: StandardClosure? {
        didSet {
            if onAllEvents != nil {
                control.addTarget(self, action: #selector(self.allEvents), for: .allEvents)
            }
        }
    }
    
    init(control: UIControl) {
        self.control = control
        super.init()
    }
    
    deinit {
        control.removeTarget(self, action: nil, for: UIControlEvents.allEvents)
    }
    
    func touchDown(sender: AnyObject) { onTouchDown?() }
    func touchDownRepeat(sender: AnyObject) { onTouchDownRepeat?() }
    func touchDragInside(sender: AnyObject) { onTouchDragInside?() }
    func touchDragOutside(sender: AnyObject) { onTouchDragOutside?() }
    func touchDragEnter(sender: AnyObject) { onTouchDragEnter?() }
    func touchDragExit(sender: AnyObject) { onTouchDragExit?() }
    func touchUpInside(sender: AnyObject) { onTouchUpInside?() }
    func touchUpOutside(sender: AnyObject) { onTouchUpOutside?() }
    func touchCancel(sender: AnyObject) { onTouchCancel?() }
    func valueChanged(sender: AnyObject) { onValueChanged?() }
    func editingDidBegin(sender: AnyObject) { onEditingDidBegin?() }
    func editingChanged(sender: AnyObject) { onEditingChanged?() }
    func editingDidEnd(sender: AnyObject) { onEditingDidEnd?() }
    func editingDidEndOnExit(sender: AnyObject) { onEditingDidEndOnExit?() }
    func allTouchEvents(sender: AnyObject) { onAllTouchEvents?() }
    func allEditingEvents(sender: AnyObject) { onAllEditingEvents?() }
    func applicationReserved(sender: AnyObject) { onApplicationReserved?() }
    func systemReserved(sender: AnyObject) { onSystemReserved?() }
    func allEvents(sender: AnyObject) { onAllEvents?() }
}

extension UIControl {
    private struct AssociatedKeys {
        static var ControlHandler = "blv_ControlHandlerKey"
    }
    
    private var touchHandler: TouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.ControlHandler) as? TouchHandler {
                return handler
            } else {
                self.touchHandler = TouchHandler(control: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ControlHandler, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func onTouchDown(completion: @escaping StandardClosure) { touchHandler.onTouchDown = completion }
    func onTouchDownRepeat(completion: @escaping StandardClosure) { touchHandler.onTouchDownRepeat = completion }
    func onTouchDragInside(completion: @escaping StandardClosure) { touchHandler.onTouchDragInside = completion }
    func onTouchDragOutside(completion: @escaping StandardClosure) { touchHandler.onTouchDragOutside = completion }
    func onTouchDragEnter(completion: @escaping StandardClosure) { touchHandler.onTouchDragEnter = completion }
    func onTouchDragExit(completion: @escaping StandardClosure) { touchHandler.onTouchDragExit = completion }
    func onTouchUpInside(completion: @escaping StandardClosure) { touchHandler.onTouchUpInside = completion }
    func onTouchUpOutside(completion: @escaping StandardClosure) { touchHandler.onTouchUpOutside = completion }
    func onTouchCancel(completion: @escaping StandardClosure) { touchHandler.onTouchCancel = completion }
    func onValueChanged(completion: @escaping StandardClosure) { touchHandler.onValueChanged = completion }
    func onEditingDidBegin(completion: @escaping StandardClosure) { touchHandler.onEditingDidBegin = completion }
    func onEditingChanged(completion: @escaping StandardClosure) { touchHandler.onEditingChanged = completion }
    func onEditingDidEnd(completion: @escaping StandardClosure) { touchHandler.onEditingDidEnd = completion }
    func onEditingDidEndOnExit(completion: @escaping StandardClosure) { touchHandler.onEditingDidEndOnExit = completion }
    func onAllTouchEvents(completion: @escaping StandardClosure) { touchHandler.onAllTouchEvents = completion }
    func onAllEditingEvents(completion: @escaping StandardClosure) { touchHandler.onAllEditingEvents = completion }
    func onApplicationReserved(completion: @escaping StandardClosure) { touchHandler.onApplicationReserved = completion }
    func onSystemReserved(completion: @escaping StandardClosure) { touchHandler.onSystemReserved = completion }
    func onAllEvents(completion: @escaping StandardClosure) { touchHandler.onAllEvents = completion }
}
