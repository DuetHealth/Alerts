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

    internal var alertStyle: UIAlertActionStyle {
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

public extension Alert {

    /// Projects the context representation into a view-layer alert controller.
    ///
    /// - Parameter style: the style of alert controller to create.
    /// - Returns: an alert controller corresponding with the properties of the receiver.
    public func asController(style: UIAlertControllerStyle) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            controller.addAction(UIAlertAction(title: action.title, style: action.behavior.alertStyle) { _ in
                action.action?()
            })
        }
        return controller
    }

}
