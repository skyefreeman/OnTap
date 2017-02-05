//
//  UIBarButtonItem+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    @discardableResult func onTap(completion: @escaping ot_standardClosure) -> Self {
        touchHandler?.onTap = completion
        return self
    }
}

// MARK: Convenience Initializers

public extension UIBarButtonItem {
    
    convenience init(barButtonSystemItem: UIBarButtonSystemItem, onTap: @escaping ot_standardClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItemStyle, onTap: @escaping ot_standardClosure) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, onTap: @escaping ot_standardClosure) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
}

// MARK: Private

public extension UIBarButtonItem {
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_barButtonTouchHandlerKey"
    }
    
    fileprivate var touchHandler: UIBarButtonItemTouchHandler? {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.touchHandlerKey) as? UIBarButtonItemTouchHandler? {
                return handler
            } else {
                self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: nil)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
