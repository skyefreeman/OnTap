//
//  UIControl+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIControl {
    
    @discardableResult func on(_ event: UIControlEvents, completion: @escaping ot_standardClosure) -> Self {
        if event == .touchDown { touchHandler.onTouchDown = completion }
        else if event == .touchDownRepeat { touchHandler.onTouchDownRepeat = completion }
        else if event == .touchDragInside { touchHandler.onTouchDragInside = completion }
        else if event == .touchDragOutside { touchHandler.onTouchDragOutside = completion }
        else if event == .touchDragEnter { touchHandler.onTouchDragEnter = completion }
        else if event == .touchDragExit { touchHandler.onTouchDragExit = completion }
        else if event == .touchUpInside { touchHandler.onTouchUpInside = completion }
        else if event == .touchUpOutside { touchHandler.onTouchUpOutside = completion }
        else if event == .touchCancel { touchHandler.onTouchCancel = completion }
        else if event == .valueChanged { touchHandler.onValueChanged = completion }
        else if event == .editingDidBegin { touchHandler.onEditingDidBegin = completion }
        else if event == .editingChanged { touchHandler.onEditingChanged = completion }
        else if event == .editingDidEnd { touchHandler.onEditingDidEnd = completion }
        else if event == .editingDidEndOnExit { touchHandler.onEditingDidEndOnExit = completion }
        else if event == .allTouchEvents { touchHandler.onAllTouchEvents = completion }
        else if event == .allEditingEvents { touchHandler.onAllEditingEvents = completion }
        else if event == .applicationReserved { touchHandler.onApplicationReserved = completion }
        else if event == .systemReserved { touchHandler.onSystemReserved = completion }
        else if event == .allEvents { touchHandler.onAllEvents = completion }
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
