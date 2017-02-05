//
//  ViewController.swift
//  OnTap
//
//  Created by Skye Freeman on 1/27/17.
//  Copyright © 2017 Skye Freeman. All rights reserved.
//

import UIKit
import OnTap

extension UIView {
    var x: CGFloat { return frame.origin.x }
    var y: CGFloat { return frame.origin.y }
    
    var width: CGFloat { return frame.size.width }
    var height: CGFloat { return frame.size.height }

    var bottom: CGFloat { return frame.origin.y + frame.size.height }
    var right: CGFloat { return frame.origin.x + frame.size.width }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in addSubview(subview) }
    }
}

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle(NSLocalizedString("UIButton", comment: ""), for: .normal)
        return button
            .onTouchDown { print("UIButton touch down!") }
            .onTouchUpInside { print("UIButton touch up inside") }
            .onTouchUpOutside { print("UIButton touch up outside") }
    }()

    lazy var slider: UISlider = {
        return UISlider()
            .onValueChanged { [unowned self] in print("slider new value: \(self.slider.value)") }
    }()

    lazy var switchView: UISwitch = {
        return UISwitch()
            .onValueChanged { [unowned self] in print("slider new value: \(self.switchView.isOn)") }
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.text = NSLocalizedString("UIView", comment: "")
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
            .onTapRecognized { print("view tapped!") }
            .onLeftSwipeRecognized { print("view swiped left!") }
            .onRightSwipeRecognized { print("view swiped right!") }
            .onUpSwipeRecognized { print("view swiped up!") }
            .onDownSwipeRecognized { print("view swiped down!") }
    }()
    
    lazy var leftBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: NSLocalizedString("Left", comment: ""), style: .plain) {
            print("left barButtonItem tapped!")
        }
    }()

    lazy var rightBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: NSLocalizedString("Right", comment: ""), style: .plain) {
            print("right barButtonItem tapped!")
        }
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let sharedSize = CGSize(width: view.width/2, height: view.height/2)
        button.frame = CGRect(x: 0, y: 0, width: sharedSize.width, height: sharedSize.height)
        slider.frame = CGRect(x: view.width/2, y: 0, width: sharedSize.width, height: sharedSize.height)
        switchView.center = CGPoint(x: sharedSize.width/2, y: button.bottom + sharedSize.height/2)
        label.frame = CGRect(x: view.width/2, y: slider.bottom, width: sharedSize.width, height: sharedSize.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubviews(button, slider, switchView, label)
        edgesForExtendedLayout = []
    }
}
