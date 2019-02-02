//
//  UIAlerts.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation
import UIKit

internal extension AlertAction.Behavior {

    internal var alertStyle: UIAlertAction.Style {
        switch self {
        case .cancel: return .cancel
        case .destructive: return .destructive
        default: return .default
        }
    }

}

public extension AlertAction {

    /// Returns an action with intent to cancel, circumvent, or otherwise disregard the functional
    /// result of confirmation. The action has the default title "Cancel".
    public static var cancel: AlertAction {
        return .cancel(title: NSLocalizedString("Cancel", comment: ""))
    }

}

fileprivate var changeObserversKey = UInt8(101)

public extension Alert {

    /// Projects the context representation into a view-layer alert controller.
    ///
    /// - Parameter style: the style of alert controller to create.
    /// - Returns: an alert controller corresponding with the properties of the receiver.
    public func asController(style: UIAlertController.Style, textFieldDelegate: UITextFieldDelegate? = nil) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            controller.addAction(UIAlertAction(title: action.title, style: action.behavior.alertStyle) { _ in
                action.action?()
            })
        }
        textFields.forEach { textField in
            controller.addTextField {
                $0.placeholder = textField.placeholder
                $0.text = textField.initialValue
                $0.keyboardType = textField.keyboardType
                $0.autocorrectionType = textField.autocorrection
                $0.delegate = textFieldDelegate
            }
        }
        return controller
    }

    /// Projects the context representation into a view-layer alert controller.
    ///
    /// - Parameter style: the style of alert controller to create.
    /// - Returns: an alert controller corresponding with the properties of the receiver.
    public func asController(style: UIAlertController.Style, onTextFieldChanged: @escaping (UITextField, Int) -> ()) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            controller.addAction(UIAlertAction(title: action.title, style: action.behavior.alertStyle) { _ in
                action.action?()
            })
        }
        var changeObservers = [TextFieldChangeObserver]()
        textFields.enumerated().forEach {
            let (order, textField) = $0
            controller.addTextField {
                $0.placeholder = textField.placeholder
                $0.text = textField.initialValue
                $0.keyboardType = textField.keyboardType
                $0.autocorrectionType = textField.autocorrection
                let changeObserver = TextFieldChangeObserver(order: order, implementation: onTextFieldChanged)
                $0.addTarget(changeObserver, action: #selector(TextFieldChangeObserver.textFieldChanged(sender:)), for: .editingChanged)
                changeObservers.append(changeObserver)
            }
        }
        objc_setAssociatedObject(controller, &changeObserversKey, changeObservers, .OBJC_ASSOCIATION_RETAIN)
        return controller
    }

}

fileprivate class TextFieldChangeObserver {

    private let order: Int
    private let implementation: (UITextField, Int) -> ()

    init(order: Int, implementation: @escaping (UITextField, Int) -> ()) {
        self.order = order
        self.implementation = implementation
    }

    @objc func textFieldChanged(sender: UITextField) {
        implementation(sender, order)
    }


}
