//
//  UIBarButtonItem+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/27/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    func onTap(completion: @escaping ot_standardClosure) {
        touchHandler?.onTouch = completion
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
                self.touchHandler = UIBarButtonItemTouchHandler(barButtonItem: self, onTouch: nil)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
