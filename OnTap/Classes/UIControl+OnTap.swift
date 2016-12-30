//
//  UIControl+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/8/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

public extension UIControl {
    
    func onTouchDown(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDown = completion
        return self
    }
    
    func onTouchDownRepeat(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDownRepeat = completion
        return self
    }
    
    func onTouchDragInside(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDragInside = completion
        return self
    }
    
    func onTouchDragOutside(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDragOutside = completion
        return self
    }
    
    func onTouchDragEnter(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDragEnter = completion
        return self
    }
    
    func onTouchDragExit(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchDragExit = completion
        return self
    }
    
    func onTouchUpInside(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchUpInside = completion
        return self
    }
    
    func onTouchUpOutside(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchUpOutside = completion
        return self
    }
    
    func onTouchCancel(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onTouchCancel = completion
        return self
    }
    
    func onValueChanged(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onValueChanged = completion
        return self
    }
    
    func onEditingDidBegin(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onEditingDidBegin = completion
        return self
    }
    
    func onEditingChanged(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onEditingChanged = completion
        return self
    }
    
    func onEditingDidEnd(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onEditingDidEnd = completion
        return self
    }
    
    func onEditingDidEndOnExit(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onEditingDidEndOnExit = completion
        return self
    }
    
    func onAllTouchEvents(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onAllTouchEvents = completion
        return self
    }
    
    func onAllEditingEvents(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onAllEditingEvents = completion
        return self
    }
    
    func onApplicationReserved(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onApplicationReserved = completion
        return self
    }
    
    func onSystemReserved(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onSystemReserved = completion
        return self
    }
    
    func onAllEvents(completion: @escaping ot_controlClosure) -> UIControl {
        touchHandler.onAllEvents = completion
        return self
    }
    
    // MARK: Private
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_controlTouchHandlerKey"
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
