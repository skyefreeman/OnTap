//
//  UIView+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 12/1/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

public extension UIView {
    
    func onTapRecognized(completion: @escaping ot_viewClosure) -> UIView {
        isUserInteractionEnabled = true
        touchHandler.onTapRecognized = completion
        return self
    }
    
    func onLeftSwipeRecognized(completion: @escaping ot_viewClosure) -> UIView {
        isUserInteractionEnabled = true
        touchHandler.onLeftSwipeRecognized = completion
        return self
    }
    
    func onRightSwipeRecognized(completion: @escaping ot_viewClosure) -> UIView {
        isUserInteractionEnabled = true
        touchHandler.onRightSwipeRecognized = completion
        return self
    }
    
    func onUpSwipeRecognized(completion: @escaping ot_viewClosure) -> UIView {
        isUserInteractionEnabled = true
        touchHandler.onUpSwipeRecognized = completion
        return self
    }
    
    func onDownSwipeRecognized(completion: @escaping ot_viewClosure) -> UIView {
        isUserInteractionEnabled = true
        touchHandler.onDownSwipeRecognized = completion
        return self
    }
    
    // MARK: Private

    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_viewTouchHandlerKey"
    }
    
    private var touchHandler: UIViewTouchHandler {
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
