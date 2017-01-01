//
//  UIView+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 12/1/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

// MARK: OnTap

public extension UIView {
    
    func onTapRecognized(completion: @escaping ot_viewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onTapRecognized = completion
    }
    
    func onLeftSwipeRecognized(completion: @escaping ot_viewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onLeftSwipeRecognized = completion
    }
    
    func onRightSwipeRecognized(completion: @escaping ot_viewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onRightSwipeRecognized = completion
    }
    
    func onUpSwipeRecognized(completion: @escaping ot_viewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onUpSwipeRecognized = completion
    }
    
    func onDownSwipeRecognized(completion: @escaping ot_viewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onDownSwipeRecognized = completion
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
