//
//  UIViewTouchHandler.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

internal class UIViewTouchHandler: NSObject {
    
    var onTapRecognized: ot_standardClosure? {
        didSet {
            guard onTapRecognized != nil else { return }
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized(sender:)))
            view.addGestureRecognizer(tapRecognizer)
        }
    }
    
    var onLeftSwipeRecognized: ot_standardClosure? {
        didSet {
            guard onLeftSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeRecognized(sender:)))
            swipeRecognizer.direction = .left
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onRightSwipeRecognized: ot_standardClosure? {
        didSet {
            guard onRightSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeRecognized(sender:)))
            swipeRecognizer.direction = .right
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onDownSwipeRecognized: ot_standardClosure? {
        didSet {
            guard onDownSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeRecognized(sender:)))
            swipeRecognizer.direction = .down
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onUpSwipeRecognized: ot_standardClosure? {
        didSet {
            guard onUpSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(upSwipeRecognized(sender:)))
            swipeRecognizer.direction = .up
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    // MARK: Initialization
    
    fileprivate var view: UIView
    
    init(view: UIView) {
        self.view = view
        super.init()
    }
    
    deinit {
        guard let gestureRecognizers = view.gestureRecognizers else {
            return
        }
        
        for recognizer in gestureRecognizers {
            view.removeGestureRecognizer(recognizer)
        }
    }
}

// MARK: Private

internal extension UIViewTouchHandler {
    @objc fileprivate func tapRecognized(sender: Any) { onTapRecognized?() }
    @objc fileprivate func leftSwipeRecognized(sender: Any) { onLeftSwipeRecognized?() }
    @objc fileprivate func rightSwipeRecognized(sender: Any) { onRightSwipeRecognized?() }
    @objc fileprivate func upSwipeRecognized(sender: Any) { onUpSwipeRecognized?() }
    @objc fileprivate func downSwipeRecognized(sender: Any) { onDownSwipeRecognized?() }
}
