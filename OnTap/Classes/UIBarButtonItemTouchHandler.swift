//
//  UIBarButtonItemTouchHandler.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

internal class UIBarButtonItemTouchHandler: NSObject {
    
    var onTap: OTStandardClosure?
    
    init(barButtonItem: UIBarButtonItem, onTap: OTStandardClosure?) {
        self.barButtonItem = barButtonItem
        self.onTap = onTap
        super.init()
        
        self.barButtonItem.target = self
        self.barButtonItem.action = #selector(barButtonItemTouched(sender:))
    }
    
    // MARK: Private

    private var barButtonItem: UIBarButtonItem
    
    @objc private func barButtonItemTouched(sender: Any) {
        onTap?()
    }
}
