# NoStoryboard

[![CI Status](http://img.shields.io/travis/pauljohanneskraft/NoStoryboard.svg?style=flat)](https://travis-ci.org/pauljohanneskraft/NoStoryboard)
[![Version](https://img.shields.io/cocoapods/v/NoStoryboard.svg?style=flat)](http://cocoapods.org/pods/NoStoryboard)
[![License](https://img.shields.io/cocoapods/l/NoStoryboard.svg?style=flat)](http://cocoapods.org/pods/NoStoryboard)
[![Platform](https://img.shields.io/cocoapods/p/NoStoryboard.svg?style=flat)](http://cocoapods.org/pods/NoStoryboard)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=pauljohanneskraft/nostoryboard)](http://clayallsopp.github.io/readme-score?url=pauljohanneskraft/nostoryboard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Setup

To create your iOS project without Storyboard, first remove ```Main.storyboard``` (assuming you start from the single-view-template). You additionaly have to remove the `Main storyboard file base name` key from the Info.plist file.

### AppDelegate

Because you removed the Storyboard, no view will be initialized when you open the app, so let's do that, when the app finished launching. To achieve that, create a UIViewController (or any subclass) and call ```show(rootViewController:)```, this will create a window, assign your view controller as rootViewController and finally make the window key and visible. In a more complex app, you might want to create a UITabBarController (including all child-viewcontrollers) or UINavigationController here.

```swift
@ApplicationMain
class AppDelegate: NoStoryboardAppDelegate {
      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let vc = UIViewController() // <-- replace by your own view controller
        show(rootViewController: vc)
        return true
    }
}
```

### Segues

`NoStoryboard` currently only supports the `show` and `replace` segues. Just call `performSegue(identifier:to:type:sender:)` in the source-viewcontroller to perform the segue, you can define the destination (you will have to create the destination-viewcontroller up front), an identifier (which may be randomly chosen, but remember: in `prepare(for:sender:)` you might want to identify the segue by this identifier), type (either `.show` or `.replace`) and a custom sender.

```swift
class MyViewController: NoStoryboardViewController {
    func buttonPressed(sender: Any) {
        let destination = DestinationController() // <-- you might want to adapt this to your one class and configure it appropriately
        performSegue(identifier: "buttonPressed", to: destination, type: .show, sender: sender)
    }
}
```

### UIViews

If you want a view to completely fill its superView, simply call `superView.addSubviewWithConstraints(fillingCompletely: view)` or if it already is its subView call `view.addConstraints(fillingSuperViewCompletely: superView)`.

### Layout Constraints

With NoStoryboard you can simply use (Notice the missing t, it spells `constrain` not `constraint`), instead of using the more complicated version used in UIKit, e.g. `viewA.topAnchor.constraint(equalTo: viewB.topAnchor).isActive = true`.
The `constant` argument always defaults to zero, if not otherwise specified.

```swift 
viewA.topAnchor.constrain(equalTo: viewB.topAnchor, constant: -1)
viewA.bottomAnchor.constrain(lessThanOrEqualTo: viewB.bottomAnchor, constant: 1)
viewA.leftAnchor.constrain(lessThanOrEqualTo: viewB.leftAnchor, constant: 2)
viewA.rightAnchor.constrain(greaterThanOrEqualTo: viewB.rightAnchor)
```
Notice, that not all possible constraints have been implemented yet, but as this refers to syntactical sugar, can still be used programmatically using the UIKit-version.

### ViewController

UIViewController are supposed to either call `init(nibName:bundle:)` or `init?(coder:)` by default. By introducing NoStoryboardViewController, you can also create a viewController using an already initialized view, or even just using a clean `init()`.

```swift
let view = UIView()
let viewController = ViewController(view: view)
```

### InsetLabel

In some cases, a label is required to have insets, InsetLabel includes the functionality to add an invisible border without using views wrapped into each other.

## Requirements

Deployment target needs to be `8.0` or higher. All features are available for iOS 10 or higher.

## Installation

NoStoryboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NoStoryboard'
```

## Author

Paul Kraft

## License

NoStoryboard is available under the MIT license. See the LICENSE file for more info.
