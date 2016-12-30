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
    var onTap: ot_barButtonItemClosure?
    
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
    
    @objc private func barButtonItemTouched(sender: Any) {
        onTap?(barButtonItem)
    }
}
