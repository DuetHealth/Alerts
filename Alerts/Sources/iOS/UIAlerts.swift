//
//  UIAlerts.swift
//  Alerts
//
//  Created by Ryan Wachowski on 12/7/17.
//  Copyright © 2017 Duet Health. All rights reserved.
//

import Foundation
import UIKit

internal extension ActionAppearance {

    internal var alertStyle: UIAlertActionStyle {
        switch self {
        case .cancel: return .cancel
        case .destructive: return .destructive
        default: return .default
        }
    }

}

extension Alert {

    /// Projects the context representation into a view-layer alert controller.
    ///
    /// - Parameter style: the style of alert controller to create.
    /// - Returns: an alert controller corresponding with the properties of the receiver.
    public func asController(style: UIAlertControllerStyle) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { action in
            controller.addAction(UIAlertAction(title: action.title, style: action.appearance.alertStyle) { _ in
                action.action?()
            })
        }
        return controller
    }

}
