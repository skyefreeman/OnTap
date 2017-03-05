//
//  UIView+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult func on(_ event: OTViewEvent, touches: Int, completion: @escaping OTStandardClosure) -> Self {
        let wrapper = WrappedEvent(event: event, touches: touches)
        touchHandler.recognizers[wrapper] = completion
        isUserInteractionEnabled = true
        return self
    }
    
    // MARK: Private

    private struct AssociatedKeys {
        static var touchHandlerKey = "OTViewTouchHandlerKey"
    }
    
    private var touchHandler: UIViewTouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.touchHandlerKey) as? UIViewTouchHandler {
                return handler
            }
            else {
                self.touchHandler = UIViewTouchHandler(view: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
