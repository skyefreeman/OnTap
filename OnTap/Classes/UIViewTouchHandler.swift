//
//  UIViewTouchHandler.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit

public enum OTViewEvent: Int {
    case tap, leftSwipe, rightSwipe, upSwipe, downSwipe
    
    func direction() -> UISwipeGestureRecognizerDirection? {
        switch self {
        case .tap: return nil
        case .leftSwipe: return .left
        case .rightSwipe: return .right
        case .upSwipe: return .up
        case .downSwipe: return .down
        }
    }
    
    static func event(for direction: UISwipeGestureRecognizerDirection) -> OTViewEvent {
        if direction == .left { return .leftSwipe }
        else if direction == .right { return .rightSwipe }
        else if direction == .up { return .upSwipe }
        else { return .downSwipe }
    }
}

extension UISwipeGestureRecognizerDirection: Hashable {
    public var hashValue: Int {
        return Int(rawValue)
    }
}

internal struct WrappedEvent: Hashable {
    let event: OTViewEvent
    let touches: Int
    
    var hashValue: Int {
        return event.hashValue + touches.hashValue
    }
    
    static func ==(lhs: WrappedEvent, rhs: WrappedEvent) -> Bool {
        return lhs.event == rhs.event && lhs.touches == rhs.touches
    }
}

internal class UIViewTouchHandler: NSObject {
    
    fileprivate var view: UIView
    
    var recognizers = [WrappedEvent: OTStandardClosure]() {
        didSet {
            clearRecognizers()
            setRecognizers()
        }
    }
    
    init(view: UIView) {
        self.view = view
        super.init()
    }
    
    deinit {
        clearRecognizers()
    }
}

// MARK: Private

fileprivate extension UIViewTouchHandler {
    
    @objc fileprivate func gestureRecognized(gesture: UIGestureRecognizer) {
        
        switch gesture {
        
        case let tapGesture as UITapGestureRecognizer:
            let wrapper = WrappedEvent(event: .tap, touches: tapGesture.numberOfTouches)
            recognizers[wrapper]?()
        
        case let swipeGesture as UISwipeGestureRecognizer:
            let wrapper = WrappedEvent(
                event: OTViewEvent.event(for: swipeGesture.direction),
                touches: swipeGesture.numberOfTouches)
            recognizers[wrapper]?()
        
        default:
            assertionFailure("An unsupported gesture recognizer was used")
        }
    }
    
    fileprivate func tapRecognizer(touches: Int) -> UITapGestureRecognizer {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureRecognized(gesture:)))
        tapRecognizer.numberOfTouchesRequired = touches
        return tapRecognizer
    }
    
    fileprivate func swipeRecognizer(touches: Int, direction: UISwipeGestureRecognizerDirection) -> UISwipeGestureRecognizer {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gestureRecognized(gesture:)))
        swipeRecognizer.numberOfTouchesRequired = touches
        swipeRecognizer.direction = direction
        return swipeRecognizer
    }
    
    fileprivate func setRecognizers() {
        recognizers.keys.forEach { (wrapper) in
            var recognizer: UIGestureRecognizer?
            if wrapper.event == .tap {
                recognizer = tapRecognizer(touches: wrapper.touches)
            } else {
                if let direction = wrapper.event.direction() {
                    recognizer = swipeRecognizer(touches: wrapper.touches, direction: direction)
                } else {
                    assertionFailure("EventType.swipe requires a swipe direction")
                }
            }
            
            if let recognizer = recognizer {
                view.addGestureRecognizer(recognizer)
            }
        }
    }
    
    fileprivate func clearRecognizers() {
        guard let gestureRecognizers = view.gestureRecognizers else { return }
        
        for recognizer in gestureRecognizers {
            view.removeGestureRecognizer(recognizer)
        }
    }
}
