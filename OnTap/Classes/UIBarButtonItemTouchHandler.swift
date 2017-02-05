//
//  UIBarButtonItemTouchHandler.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

internal class UIBarButtonItemTouchHandler: NSObject {
    
    var onTap: ot_standardClosure?
    
    fileprivate var barButtonItem: UIBarButtonItem

    init(barButtonItem: UIBarButtonItem, onTap: ot_standardClosure?) {
        self.barButtonItem = barButtonItem
        self.onTap = onTap
        super.init()
        
        self.barButtonItem.target = self
        self.barButtonItem.action = #selector(barButtonItemTouched(sender:))
    }
}

// MARK: Private

internal extension UIBarButtonItemTouchHandler {
    @objc fileprivate func barButtonItemTouched(sender: Any) { onTap?() }
}
