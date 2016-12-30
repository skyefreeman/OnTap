//
//  UIBarButtonItem+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/27/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

// MARK: Convenience

public extension UIBarButtonItem {
    
    convenience init(barButtonSystemItem: UIBarButtonSystemItem, onTap: @escaping ot_barButtonItemClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        self.onTap { button in onTap(button) }
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItemStyle, onTap: @escaping ot_barButtonItemClosure) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.onTap { button in onTap(button) }
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, onTap: @escaping ot_barButtonItemClosure) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.onTap { button in onTap(button) }
    }
}

// MARK: OnTap

public extension UIBarButtonItem {
    
    func onTap(completion: @escaping ot_barButtonItemClosure) -> UIBarButtonItem {
        touchHandler?.onTap = completion
        return self
    }
    
    // MARK: Private

    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_barButtonTouchHandlerKey"
    }
    
    private var touchHandler: UIBarButtonItemTouchHandler? {
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
