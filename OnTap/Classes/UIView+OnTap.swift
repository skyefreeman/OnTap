//
//  UIView+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult func onTapRecognized(completion: @escaping ot_standardClosure) -> Self {
        isUserInteractionEnabled = true
        touchHandler.onTapRecognized = completion
        return self
    }
    
    @discardableResult func onLeftSwipeRecognized(completion: @escaping ot_standardClosure) -> Self {
        isUserInteractionEnabled = true
        touchHandler.onLeftSwipeRecognized = completion
        return self
    }
    
    @discardableResult func onRightSwipeRecognized(completion: @escaping ot_standardClosure) -> Self {
        isUserInteractionEnabled = true
        touchHandler.onRightSwipeRecognized = completion
        return self
    }
    
    @discardableResult func onUpSwipeRecognized(completion: @escaping ot_standardClosure) -> Self {
        isUserInteractionEnabled = true
        touchHandler.onUpSwipeRecognized = completion
        return self
    }
    
    @discardableResult func onDownSwipeRecognized(completion: @escaping ot_standardClosure) -> Self {
        isUserInteractionEnabled = true
        touchHandler.onDownSwipeRecognized = completion
        return self
    }
}

// MARK: Private

public extension UIView {
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_viewTouchHandlerKey"
    }
    
    fileprivate var touchHandler: UIViewTouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.touchHandlerKey) as? UIViewTouchHandler {
                return handler
            } else {
                self.touchHandler = UIViewTouchHandler(view: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
