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

extension UILabel {
    static func standardLabel(text: String, textColor: UIColor, backgroundColor: UIColor = UIColor.clear) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.backgroundColor = backgroundColor
        return label
    }
}

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle(NSLocalizedString("UIButton", comment: ""), for: .normal)
        return button
            .on(.touchDown) { [unowned self] in
                self.buttonLabel.text = "touch down"
            }
            .on(.touchDownRepeat) { [unowned self] in
                self.buttonLabel.text = "touch down repeat"
            }
            .on(.touchUpInside) { [unowned self] in
                self.buttonLabel.text = "touch up inside"
            }
            .on(.touchUpOutside) { [unowned self] in
                self.buttonLabel.text = "touch up outside"
        }
    }()

    lazy var slider: UISlider = {
        return UISlider().on(.valueChanged) { [unowned self] in
            self.sliderLabel.text = "\(self.slider.value)"
        }
    }()

    lazy var switchView: UISwitch = { [unowned self] in
        return UISwitch().on(.valueChanged) { [unowned self] in
            self.switchLabel.text = self.switchView.isOn ? "On" : "Off"
        }
    }()
    
    lazy var gestureLabel: UILabel = {
        return UILabel.standardLabel(
            text: NSLocalizedString("Tap or swipe!", comment: ""),
            textColor: UIColor.white,
            backgroundColor: UIColor.red)
            .on(.tap, touches: 1) { [unowned self] in self.gestureLabel.text = "tapped" }
            .on(.leftSwipe, touches: 1) { [unowned self] in self.gestureLabel.text = "left swipe" }
            .on(.rightSwipe, touches: 1) { [unowned self] in self.gestureLabel.text = "right swipe" }
            .on(.upSwipe, touches: 1) { [unowned self] in self.gestureLabel.text = "upward swipe" }
            .on(.downSwipe, touches: 1) { [unowned self] in self.gestureLabel.text = "downward swipe" }
    }()
    
    lazy var sliderLabel: UILabel = { [unowned self] in
        return UILabel.standardLabel(text: "\(self.slider.value)", textColor: UIColor.black)
    }()
    
    lazy var switchLabel: UILabel = { [unowned self] in
        return UILabel.standardLabel(text: "Off", textColor: UIColor.black)
    }()
    
    lazy var buttonLabel: UILabel = {
        return UILabel.standardLabel(text: "", textColor: UIColor.white)
    }()
    
    lazy var leftBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: NSLocalizedString("Left", comment: ""), style: .plain) { [unowned self] in
            self.navigationItem.title = "left tapped"
        }
    }()

    lazy var rightBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(title: NSLocalizedString("Right", comment: ""), style: .plain) { [unowned self] in
            self.navigationItem.title = "right tapped"
        }
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let sharedSize = CGSize(width: view.width/2, height: view.height/2)
        button.frame = CGRect(x: 0, y: 0, width: sharedSize.width, height: sharedSize.height)
        buttonLabel.frame = CGRect(x: 0, y: 0, width: sharedSize.width, height: sharedSize.height/2)
        slider.frame = CGRect(x: view.width/2, y: 0, width: sharedSize.width, height: sharedSize.height)
        sliderLabel.frame = CGRect(x: view.width/2, y: 0, width: sharedSize.width, height: sharedSize.height/2)
        switchView.center = CGPoint(x: sharedSize.width/2, y: button.bottom + sharedSize.height/2)
        switchLabel.frame = CGRect(x: 0, y: sharedSize.height, width: sharedSize.width, height: sharedSize.height/2)
        gestureLabel.frame = CGRect(x: view.width/2, y: slider.bottom, width: sharedSize.width, height: sharedSize.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubviews(
            button,
            buttonLabel,
            slider,
            sliderLabel,
            switchView,
            switchLabel,
            gestureLabel)
        
        edgesForExtendedLayout = []
    }
}
