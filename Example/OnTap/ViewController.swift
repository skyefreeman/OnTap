//
//  ViewController.swift
//  OnTap
//
//  Created by Skye Freeman on 12/27/2016.
//  Copyright (c) 2016 Skye Freeman. All rights reserved.
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
        button.onTouchDown { (button) in
            print("UIButton Touch down!")
        }
        button.onTouchUpInside { (button) in
            print("UIButton Touch up inside!")
        }
        button.onTouchUpOutside { (button) in
            print("UIButton Touch up outside!")
        }
        return button
    }()

    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.onValueChanged { (slider) in
            if let slider = slider as? UISlider {
                print("slider new value: \(slider.value)")
            }
        }
        return slider
    }()
    lazy var switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.onValueChanged { (switchView) in
            if let switchView = switchView as? UISwitch {
                print("slider new value: \(switchView.isOn)")
            }
        }
        return switchView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.text = NSLocalizedString("UIView", comment: "")
        label.textAlignment = .center
        label.onTapRecognized { (view) in
            print("view view tapped!")
        }
        label.onLeftSwipeRecognized { (view) in
            print("view swiped left!")
        }
        label.onRightSwipeRecognized { (view) in
            print("view swiped right!")
        }
        label.onUpSwipeRecognized { (view) in
            print("view swiped up!")
        }
        label.onDownSwipeRecognized { (view) in
            print("view swiped down!")
        }
        return label
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("UINavigationItem", comment: ""), style: .plain) {
            barButtonItem in
            print("barButtonItem tapped!")
        }
        view.addSubviews(button, slider, switchView, label)
        edgesForExtendedLayout = []
    }
}
