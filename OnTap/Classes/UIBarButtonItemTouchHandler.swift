//
//  UIBarButtonItemTouchHandler.swift
//  Pods
//
//  Created by Skye on 12/29/16.
//
//

import UIKit

internal class UIBarButtonItemTouchHandler: NSObject {
    
    var onTap: ot_barButtonItemClosure?
    
    // MARK: Initialization
    
    fileprivate var barButtonItem: UIBarButtonItem
    
    init(barButtonItem: UIBarButtonItem, onTap: ot_barButtonItemClosure?) {
        self.barButtonItem = barButtonItem
        self.onTap = onTap
        super.init()
        
        self.barButtonItem.target = self
        self.barButtonItem.action = #selector(barButtonItemTouched(sender:))
    }
    
    deinit {
        barButtonItem.target = nil
        barButtonItem.action = nil
    }
}

// MARK: Private

internal extension UIBarButtonItemTouchHandler {
    
    @objc fileprivate func barButtonItemTouched(sender: Any) {
        onTap?(barButtonItem)
    }
}
