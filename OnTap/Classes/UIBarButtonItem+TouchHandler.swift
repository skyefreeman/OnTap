//
//  UIBarButtonItem+TouchHandler.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/27/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

class BarButtonTouchHandler: NSObject {
    
    var barButtonItem: UIBarButtonItem
    var onTouch: StandardClosure?
    
    init(barButtonItem: UIBarButtonItem, onTouch: StandardClosure?) {
        self.barButtonItem = barButtonItem
        self.onTouch = onTouch
        super.init()
        
        self.barButtonItem.target = self
        self.barButtonItem.action = #selector(barButtonItemTouched(sender:))
    }
    
    deinit {
        self.barButtonItem.target = nil
        self.barButtonItem.action = nil
    }
    
    @objc private func barButtonItemTouched(sender: Any) {
        onTouch?()
    }
}

extension UIBarButtonItem {
    private struct AssociatedKeys {
        static var TouchClosureKey = "blv_touchClosureKey"
    }
    
    var touchHandler: BarButtonTouchHandler? {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.TouchClosureKey) as? BarButtonTouchHandler? {
                return handler
            } else {
                self.touchHandler = BarButtonTouchHandler(barButtonItem: self, onTouch: nil)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.TouchClosureKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    convenience init(barButtonSystemItem: UIBarButtonSystemItem, titleTextAttributes: [String: Any]? = nil, onTouch: @escaping StandardClosure) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.touchHandler = BarButtonTouchHandler(barButtonItem: self, onTouch: onTouch)
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, titleTextAttributes: [String: Any]? = nil, onTouch: @escaping StandardClosure) {
        self.init(title: title, style: style, target: nil, action: nil)
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.touchHandler = BarButtonTouchHandler(barButtonItem: self, onTouch: onTouch)
    }
    
    convenience init(image: UIImage?, style: UIBarButtonItemStyle, titleTextAttributes: [String: Any]? = nil, onTouch: @escaping StandardClosure) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.touchHandler = BarButtonTouchHandler(barButtonItem: self, onTouch: onTouch)
    }
}
