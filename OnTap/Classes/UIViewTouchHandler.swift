//
//  UIViewTouchHandler.swift
//  Pods
//
//  Created by Skye on 12/29/16.
//
//

import UIKit

internal class UIViewTouchHandler: NSObject {
    
    var onTapRecognized: ot_viewClosure? {
        didSet {
            guard onTapRecognized != nil else { return }
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognized(sender:)))
            view.addGestureRecognizer(tapRecognizer)
        }
    }
    
    var onLeftSwipeRecognized: ot_viewClosure? {
        didSet {
            guard onLeftSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeRecognized(sender:)))
            swipeRecognizer.direction = .left
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onRightSwipeRecognized: ot_viewClosure? {
        didSet {
            guard onRightSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeRecognized(sender:)))
            swipeRecognizer.direction = .right
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onDownSwipeRecognized: ot_viewClosure? {
        didSet {
            guard onDownSwipeRecognized != nil else { return }
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeRecognized(sender:)))
            swipeRecognizer.direction = .down
            view.addGestureRecognizer(swipeRecognizer)
        }
    }
    
    var onUpSwipeRecognized: ot_viewClosure? {
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
    
    @objc fileprivate func tapRecognized(sender: Any) {
        onTapRecognized?(view)
    }
    
    @objc fileprivate func leftSwipeRecognized(sender: Any) {
        onLeftSwipeRecognized?(view)
    }
    
    @objc fileprivate func rightSwipeRecognized(sender: Any) {
        onRightSwipeRecognized?(view)
    }
    
    @objc fileprivate func upSwipeRecognized(sender: Any) {
        onUpSwipeRecognized?(view)
    }
    
    @objc fileprivate func downSwipeRecognized(sender: Any) {
        onDownSwipeRecognized?(view)
    }
}
