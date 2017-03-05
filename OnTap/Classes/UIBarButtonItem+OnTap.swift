//
//  UIBarButtonItem+OnTap.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    @discardableResult func onTap(completion: @escaping OTStandardClosure) -> Self {
        touchHandler?.onTap = completion
        return self
    }
    
    convenience init(barButtonSystemItem: UIBarButtonSystemItem, onTap: @escaping OTStandardClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItemStyle, onTap: @escaping OTStandardClosure) {
        self.init(image: image, style: style, target: nil, action: nil)
        touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, onTap: @escaping OTStandardClosure) {
        self.init(title: title, style: style, target: nil, action: nil)
        touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTap: onTap)
    }
    
    // MARK: Private
    
    private struct AssociatedKeys {
        static var touchHandlerKey = "OTBarButtonTouchHandlerKey"
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
