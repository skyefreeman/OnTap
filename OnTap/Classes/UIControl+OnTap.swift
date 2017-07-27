//
//  UIControl+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIControl {
    
    @discardableResult func on(_ event: UIControlEvents, completion: @escaping OTStandardClosure) -> Self {
        switch event {
        case UIControlEvents.touchDown: touchHandler.onTouchDown = completion
        case UIControlEvents.touchDownRepeat: touchHandler.onTouchDownRepeat = completion
        case UIControlEvents.touchDragInside: touchHandler.onTouchDragInside = completion
        case UIControlEvents.touchDragOutside: touchHandler.onTouchDragOutside = completion
        case UIControlEvents.touchDragEnter: touchHandler.onTouchDragEnter = completion
        case UIControlEvents.touchDragExit: touchHandler.onTouchDragExit = completion
        case UIControlEvents.touchUpInside: touchHandler.onTouchUpInside = completion
        case UIControlEvents.touchUpOutside: touchHandler.onTouchUpOutside = completion
        case UIControlEvents.touchCancel: touchHandler.onTouchCancel = completion
        case UIControlEvents.valueChanged: touchHandler.onValueChanged = completion
        case UIControlEvents.editingDidBegin: touchHandler.onEditingDidBegin = completion
        case UIControlEvents.editingChanged: touchHandler.onEditingChanged = completion
        case UIControlEvents.editingDidEnd: touchHandler.onEditingDidEnd = completion
        case UIControlEvents.editingDidEndOnExit: touchHandler.onEditingDidEndOnExit = completion
        case UIControlEvents.allTouchEvents: touchHandler.onAllTouchEvents = completion
        case UIControlEvents.allEditingEvents: touchHandler.onAllEditingEvents = completion
        case UIControlEvents.applicationReserved: touchHandler.onApplicationReserved = completion
        case UIControlEvents.systemReserved: touchHandler.onSystemReserved = completion
        case UIControlEvents.allEvents: touchHandler.onAllEvents = completion
        default: assertionFailure("Missing a UIControlEvents option.")
        }
        return self
    }
    
    // MARK: Private
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "OTControlTouchHandlerKey"
    }
    
    private var touchHandler: UIControlTouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.touchHandlerKey) as? UIControlTouchHandler {
                return handler
            } else {
                self.touchHandler = UIControlTouchHandler(control: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
