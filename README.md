# OnTap 🍻
[![CI Status](http://img.shields.io/travis/Skye Freeman/OnTap.svg?style=flat)](https://travis-ci.org/Skye Freeman/OnTap)
[![Version](https://img.shields.io/cocoapods/v/OnTap.svg?style=flat)](http://cocoapods.org/pods/OnTap)
[![License](https://img.shields.io/cocoapods/l/OnTap.svg?style=flat)](http://cocoapods.org/pods/OnTap)
[![Platform](https://img.shields.io/cocoapods/p/OnTap.svg?style=flat)](http://cocoapods.org/pods/OnTap)

## What is OnTap?

OnTap simplifies working with touch input in iOS apps. Instead of:

```swift
let button = UIButton()
button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)

/* .. somewhere else in your view or view controller */

func buttonTouchUpInside() {
    print("tapped!")
}
```

We can instead do this: 

```swift
let button = UIButton().on(.touchUpInside) { print("tapped!") }
```

Simple, obvious, and to the point. You can even string together multiple input actions in place:

```swift
let button = UIButton()
    .on(.touchDown) { print("touch down!!!") }
    .on(.touchDownRepeat) { print("touch down repeat!!!") }
    .on(.touchUpInside) { print("touch up inside!!!") }
    .on(.touchUpOutside) { print("touch up outside!!!") }

```

## More on Usage:

OnTap provides a full input abstraction over all subclasses of `UIControl`, streamlines working with `UIBarbuttonItem`'s, and also makes adding `UIGestureRecognizer`'s a breeze. Essentially *everything* is now a button.

# UIControl

```swift
let button = UIButton()
    .on(.touchUpInside) { print("touch up inside") }
    .on(.touchDown) { print("touch down") }

let slider = UISlider().on(.valueChanged) { [unowned self] in
    print("slider new value: \(self.slider.value)")
}
```

# UIBarButtonItem
```swift
let rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Right", comment: ""), style: .plain).onTap {
    print("right barButtonItem tapped!")
}
```

# UIGestureRecognizer

```swift
let someView = UIView()
    .on(.tap, touches: 1) { print("tapped") }
    .on(.leftSwipe, touches: 1) { print("left swipe 1 finger") }
    .on(.leftSwipe, touches: 2) { print("left swipe 2 fingers") }
    .on(.rightSwipe, touches: 1) { print("right swipe") }
    .on(.upSwipe, touches: 1) { print("up swipe") }
    .on(.downSwipe, touches: 1) { print("down swipe") }
```

## Installation

OnTap is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

````ruby
pod "OnTap"
````

## Requirements

- Swift 3.0
- iOS 8.0

## Sample Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Skye Freeman, skyefreeman@icloud.com

## License

OnTap is available under the MIT license. See the LICENSE file for more info.
