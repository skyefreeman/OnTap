//
//  UIView+TouchHandling.swift
//  Bloglovin
//
//  Created by Skye Freeman on 12/1/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import Foundation

fileprivate class TouchHandler: NSObject {
    var view: UIView
    var onTapRecognized: ViewClosure? {
        didSet {
            guard onTapRecognized != nil else { return }
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized(sender:)))
            tapRecognizer.numberOfTapsRequired = 1
            tapRecognizer.numberOfTouchesRequired = 1
            view.addGestureRecognizer(tapRecognizer)
        }
    }
    
    func tapRecognized(sender: Any) {
        onTapRecognized?(self.view)
    }
    
    init(view: UIView) {
        self.view = view
        super.init()
    }
}

extension UIView {
    private struct AssociatedKeys {
        static var viewHandler = "blv_ViewHandlerKey"
    }
    
    private var touchHandler: TouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.viewHandler) as? TouchHandler {
                return handler
            } else {
                self.touchHandler = TouchHandler(view: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.viewHandler, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func onTapRecognized(completion: @escaping ViewClosure) {
        isUserInteractionEnabled = true
        touchHandler.onTapRecognized = completion
    }
}
