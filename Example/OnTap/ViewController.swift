//
//  ViewController.swift
//  OnTap
//
//  Created by Skye Freeman on 12/27/2016.
//  Copyright (c) 2016 Skye Freeman. All rights reserved.
//

import UIKit
import OnTap

class ViewController: UIViewController {
    
    // TODO: make these return the correctly

    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        .onTouchDown { button in
            print("\(button): Touch down!")
        }
        .onTouchUpInside { button in
            print("\(button): Touch up inside!")
        }
        .onTouchUpOutside { button in
            print("\(button): Touch up outside!")
    }
    
    let barButtonItem = UIBarButtonItem(title: NSLocalizedString("Tap Me!", comment: ""), style: .plain, onTap: {
        barButtonItem in
        print("barButtonItem tapped!")
    })
    
    let slider = UISlider()
        .onValueChanged { slider in
            if let slider = slider as? UISlider {
                print("new value: \(slider.value)")
            }
    }
    
    let switchView = UISwitch()
        .onValueChanged { switchView in
            if let switchView = switchView as? UISwitch {
                print("new value: \(switchView.isOn)")
            }
    }
    
    let plainView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        .onTapRecognized { view in
            print("view tapped!")
        }
        .onLeftSwipeRecognized { view in
            print("view swiped left!")
        }
        .onRightSwipeRecognized { view in
            print("view swiped right!")
        }
        .onUpSwipeRecognized { view in
            print("view swiped up!")
        }
        .onDownSwipeRecognized { view in
            print("view swiped down!")
    }
    
    lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.button, self.slider, self.switchView, self.plainView])
        return stackView
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stackView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plainView.backgroundColor = UIColor.red
        button.backgroundColor = UIColor.blue

        view.addSubview(stackView)
    }
}
