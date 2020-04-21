[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Swift Package Manager](https://github.com/DuetHealth/Alerts/workflows/Swift%20Package%20Manager/badge.svg)](https://github.com/DuetHealth/Alerts/actions?query=workflow%3A%22Swift+Package+Manager%22) 
[![Actions Status](https://github.com/DuetHealth/Alerts/workflows/carthage/badge.svg)](https://github.com/DuetHealth/Alerts/actions?query=workflow%3ACarthage) 
[![Actions Status](https://github.com/DuetHealth/Alerts/workflows/cocoapods/badge.svg)](https://github.com/DuetHealth/Alerts/actions?query=workflow%3ACocoapods)

# Alerts

Alerts is a μ-framework abstraction of modal contexts ("alerts"). The core library exposes the necessary data constructs for creating abstract alerts; the codebase also includes platform-specific functions for automatically producing resultant controls.


## Usage	

### Installation	

Cocoapods: `pod 'Alerts', git: 'https://github.com/DuetHealth/Alerts.git'`. See [Alerts.podspec](Alerts.podspec) for more information.	

Carthage: `github "DuetHealth/Alerts" ~> 2.0 && carthage update`	

Swift Package Manager: `.package(url: "https://github.com/DuetHealth/Alerts.git", from: "2.0.0")`

### Examples

[Alert](Alerts/Sources/Common/Alert.swift) is a struct designed to represent an alert not requiring any knowledge
about how to display or present that alert. This allows the alert to be generated in ViewModels which conceivably could be 
reused on multiple platforms.

```swift
// SomeViewModel.swift
// Alerts take a series of actions:
import Alerts
let someAction = AlertAction.default(title: "Some Action") {
  print("Some action was selected")
}

// Creating an Alert is similar to creating a UIAlertController:
let alert = Alert(title: "Hello", message: "This is a sample alert", textFields: [], actions: someAction, .cancel(title: "OK"))`

// SomeViewController.swift
// Alerts can be transformed into UIAlertControllers very simply:
import AlertsUI
alert.asController(style: .alert)
```


## Notes

* As of now, the podspec is only configured for iOS.
