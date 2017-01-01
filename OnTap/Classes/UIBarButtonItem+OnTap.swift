//
//  UIBarButtonItem+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/27/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

// MARK: OnTap

public extension UIBarButtonItem {
    
    func onTap(completion: @escaping ot_barButtonItemClosure) {
        touchHandler?.onTap = completion
    }
}

// MARK: OnTap Convenience Initializers

public extension UIBarButtonItem {
    
    convenience init(barButtonSystemItem: UIBarButtonSystemItem, onTap: @escaping ot_barButtonItemClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItemStyle, onTap: @escaping ot_barButtonItemClosure) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, onTap: @escaping ot_barButtonItemClosure) {
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
