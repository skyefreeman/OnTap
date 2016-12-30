//
//  UIControlTouchHandler.swift
//  Pods
//
//  Created by Skye on 12/29/16.
//
//

import UIKit

internal class UIControlTouchHandler: NSObject {
    
    private var control: UIControl
    
    var onTouchDown: ot_standardClosure? {
        didSet {
            if onTouchDown != nil {
                control.addTarget(self, action: #selector(touchDown), for: .touchDown)
            }
        }
    }
    var onTouchDownRepeat: ot_standardClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(touchDownRepeat), for: .touchDownRepeat)
            }
        }
    }
    var onTouchDragInside: ot_standardClosure? {
        didSet {
            if onTouchDragInside != nil {
                control.addTarget(self, action: #selector(touchDragInside), for: .touchDragInside)
            }
        }
    }
    var onTouchDragOutside: ot_standardClosure? {
        didSet {
            if onTouchDragOutside != nil {
                control.addTarget(self, action: #selector(touchDragOutside), for: .touchDragOutside)
            }
        }
    }
    var onTouchDragEnter: ot_standardClosure? {
        didSet {
            if onTouchDragEnter != nil {
                control.addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
            }
        }
    }
    var onTouchDragExit: ot_standardClosure? {
        didSet {
            if onTouchDragExit != nil {
                control.addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
            }
        }
    }
    var onTouchUpInside: ot_standardClosure? {
        didSet {
            if onTouchUpInside != nil {
                control.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
            }
        }
    }
    var onTouchUpOutside: ot_standardClosure? {
        didSet {
            if onTouchUpOutside != nil {
                control.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
            }
        }
    }
    var onTouchCancel: ot_standardClosure? {
        didSet {
            if onTouchCancel != nil {
                control.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
            }
        }
    }
    var onValueChanged: ot_standardClosure? {
        didSet {
            if onValueChanged != nil {
                control.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
            }
        }
    }
    var onEditingDidBegin: ot_standardClosure? {
        didSet {
            if onTouchDownRepeat != nil {
                control.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
            }
        }
    }
    var onEditingChanged: ot_standardClosure? {
        didSet {
            if onEditingChanged != nil {
                control.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            }
        }
    }
    var onEditingDidEnd: ot_standardClosure? {
        didSet {
            if onEditingDidEnd != nil {
                control.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
            }
        }
    }
    var onEditingDidEndOnExit: ot_standardClosure? {
        didSet {
            if onEditingDidEndOnExit != nil {
                control.addTarget(self, action: #selector(editingDidEndOnExit), for: .editingDidEndOnExit)
            }
        }
    }
    var onAllTouchEvents: ot_standardClosure? {
        didSet {
            if onAllTouchEvents != nil {
                control.addTarget(self, action: #selector(allTouchEvents), for: .allTouchEvents)
            }
        }
    }
    var onAllEditingEvents: ot_standardClosure? {
        didSet {
            if onAllEditingEvents != nil {
                control.addTarget(self, action: #selector(allEditingEvents), for: .allEditingEvents)
            }
        }
    }
    var onApplicationReserved: ot_standardClosure? {
        didSet {
            if onApplicationReserved != nil {
                control.addTarget(self, action: #selector(applicationReserved), for: .applicationReserved)
            }
        }
    }
    var onSystemReserved: ot_standardClosure? {
        didSet {
            if onSystemReserved != nil {
                control.addTarget(self, action: #selector(systemReserved), for: .systemReserved)
            }
        }
    }
    var onAllEvents: ot_standardClosure? {
        didSet {
            if onAllEvents != nil {
                control.addTarget(self, action: #selector(allEvents), for: .allEvents)
            }
        }
    }
    
    init(control: UIControl) {
        self.control = control
        super.init()
    }
    
    deinit {
        control.removeTarget(self, action: nil, for: UIControlEvents.allEvents)
    }
    
    // MARK: Private

    @objc private func touchDown(sender: AnyObject) { onTouchDown?() }
    @objc private func touchDownRepeat(sender: AnyObject) { onTouchDownRepeat?() }
    @objc private func touchDragInside(sender: AnyObject) { onTouchDragInside?() }
    @objc private func touchDragOutside(sender: AnyObject) { onTouchDragOutside?() }
    @objc private func touchDragEnter(sender: AnyObject) { onTouchDragEnter?() }
    @objc private func touchDragExit(sender: AnyObject) { onTouchDragExit?() }
    @objc private func touchUpInside(sender: AnyObject) { onTouchUpInside?() }
    @objc private func touchUpOutside(sender: AnyObject) { onTouchUpOutside?() }
    @objc private func touchCancel(sender: AnyObject) { onTouchCancel?() }
    @objc private func valueChanged(sender: AnyObject) { onValueChanged?() }
    @objc private func editingDidBegin(sender: AnyObject) { onEditingDidBegin?() }
    @objc private func editingChanged(sender: AnyObject) { onEditingChanged?() }
    @objc private func editingDidEnd(sender: AnyObject) { onEditingDidEnd?() }
    @objc private func editingDidEndOnExit(sender: AnyObject) { onEditingDidEndOnExit?() }
    @objc private func allTouchEvents(sender: AnyObject) { onAllTouchEvents?() }
    @objc private func allEditingEvents(sender: AnyObject) { onAllEditingEvents?() }
    @objc private func applicationReserved(sender: AnyObject) { onApplicationReserved?() }
    @objc private func systemReserved(sender: AnyObject) { onSystemReserved?() }
    @objc private func allEvents(sender: AnyObject) { onAllEvents?() }
}
