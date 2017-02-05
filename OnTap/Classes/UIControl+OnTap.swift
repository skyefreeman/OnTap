//
//  UIControl+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIControl {
    
    @discardableResult func onTouchDown(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDown = completion
        return self
    }
    
    @discardableResult func onTouchDownRepeat(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDownRepeat = completion
        return self
    }
    
    @discardableResult func onTouchDragInside(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDragInside = completion
        return self
    }
    
    @discardableResult func onTouchDragOutside(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDragOutside = completion
        return self
    }
    
    @discardableResult func onTouchDragEnter(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDragEnter = completion
        return self
    }
    
    @discardableResult func onTouchDragExit(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchDragExit = completion
        return self
    }
    
    @discardableResult func onTouchUpInside(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchUpInside = completion
        return self
    }
    
    @discardableResult func onTouchUpOutside(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchUpOutside = completion
        return self
    }
    
    @discardableResult func onTouchCancel(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onTouchCancel = completion
        return self
    }
    
    @discardableResult func onValueChanged(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onValueChanged = completion
        return self
    }
    
    @discardableResult func onEditingDidBegin(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onEditingDidBegin = completion
        return self
    }
    
    @discardableResult func onEditingChanged(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onEditingChanged = completion
        return self
    }
    
    @discardableResult func onEditingDidEnd(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onEditingDidEnd = completion
        return self
    }
    
    @discardableResult func onEditingDidEndOnExit(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onEditingDidEndOnExit = completion
        return self
    }
    
    @discardableResult func onAllTouchEvents(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onAllTouchEvents = completion
        return self
    }
    
    @discardableResult func onAllEditingEvents(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onAllEditingEvents = completion
        return self
    }
    
    @discardableResult func onApplicationReserved(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onApplicationReserved = completion
        return self
    }
    
    @discardableResult func onSystemReserved(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onSystemReserved = completion
        return self
    }
    
    @discardableResult func onAllEvents(completion: @escaping ot_standardClosure) -> Self {
        touchHandler.onAllEvents = completion
        return self
    }
}

// MARK: Private

public extension UIControl {
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_controlTouchHandlerKey"
    }
    
    fileprivate var touchHandler: UIControlTouchHandler {
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
