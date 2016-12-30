//
//  UIControl+OnTap.swift
//  Bloglovin
//
//  Created by Skye Freeman on 9/8/16.
//  Copyright © 2016 Bloglovin. All rights reserved.
//

import UIKit

public extension UIControl {
    
    func onTouchDown(completion: @escaping ot_standardClosure) { touchHandler.onTouchDown = completion }
    func onTouchDownRepeat(completion: @escaping ot_standardClosure) { touchHandler.onTouchDownRepeat = completion }
    func onTouchDragInside(completion: @escaping ot_standardClosure) { touchHandler.onTouchDragInside = completion }
    func onTouchDragOutside(completion: @escaping ot_standardClosure) { touchHandler.onTouchDragOutside = completion }
    func onTouchDragEnter(completion: @escaping ot_standardClosure) { touchHandler.onTouchDragEnter = completion }
    func onTouchDragExit(completion: @escaping ot_standardClosure) { touchHandler.onTouchDragExit = completion }
    func onTouchUpInside(completion: @escaping ot_standardClosure) { touchHandler.onTouchUpInside = completion }
    func onTouchUpOutside(completion: @escaping ot_standardClosure) { touchHandler.onTouchUpOutside = completion }
    func onTouchCancel(completion: @escaping ot_standardClosure) { touchHandler.onTouchCancel = completion }
    func onValueChanged(completion: @escaping ot_standardClosure) { touchHandler.onValueChanged = completion }
    func onEditingDidBegin(completion: @escaping ot_standardClosure) { touchHandler.onEditingDidBegin = completion }
    func onEditingChanged(completion: @escaping ot_standardClosure) { touchHandler.onEditingChanged = completion }
    func onEditingDidEnd(completion: @escaping ot_standardClosure) { touchHandler.onEditingDidEnd = completion }
    func onEditingDidEndOnExit(completion: @escaping ot_standardClosure) { touchHandler.onEditingDidEndOnExit = completion }
    func onAllTouchEvents(completion: @escaping ot_standardClosure) { touchHandler.onAllTouchEvents = completion }
    func onAllEditingEvents(completion: @escaping ot_standardClosure) { touchHandler.onAllEditingEvents = completion }
    func onApplicationReserved(completion: @escaping ot_standardClosure) { touchHandler.onApplicationReserved = completion }
    func onSystemReserved(completion: @escaping ot_standardClosure) { touchHandler.onSystemReserved = completion }
    func onAllEvents(completion: @escaping ot_standardClosure) { touchHandler.onAllEvents = completion }
    
    // MARK: Private

    private struct AssociatedKeys {
        static var touchHandlerKey = "ot_controlTouchHandlerKey"
    }
    
    private var touchHandler: UIControlTouchHandler {
        get {
            if let handler = objc_getAssociatedObject(self,  &AssociatedKeys.touchHandlerKey) as? UIControlTouchHandler {
                return handler
            } else {
                self.touchHandler = UIControlTouchHandler(control: self)
                return self.touchHandler
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.touchHandlerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
