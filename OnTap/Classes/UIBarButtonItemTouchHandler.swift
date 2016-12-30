//
//  UIBarButtonItemTouchHandler.swift
//  Pods
//
//  Created by Skye on 12/29/16.
//
//

import UIKit

internal class UIBarButtonItemTouchHandler: NSObject {
    
    private var barButtonItem: UIBarButtonItem
    var onTouch: ot_standardClosure?
    
    init(barButtonItem: UIBarButtonItem, onTouch: ot_standardClosure?) {
        self.barButtonItem = barButtonItem
        self.onTouch = onTouch
        super.init()
        
        self.barButtonItem.target = self
        self.barButtonItem.action = #selector(barButtonItemTouched(sender:))
    }
    
    deinit {
        barButtonItem.target = nil
        barButtonItem.action = nil
    }
    
    @objc private func barButtonItemTouched(sender: Any) {
        onTouch?()
    }
}
